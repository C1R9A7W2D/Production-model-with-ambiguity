with open("generated_rules.clp", 'w', encoding='utf8') as o, open("Knowledge_base.txt", encoding='utf8') as f:
    o.write(
'''
(defrule clear-message
	(declare (salience 90))
	?clear-msg-flg <- (clearmessage)
	?sendmessage <- (sendmessagehalt ?msg)
	=>
	(retract ?clear-msg-flg)
	(retract ?sendmessage)
)

(deftemplate item
(slot name (default none))
(slot conf (type FLOAT) (default 0.0))
)

(defrule combine
(declare (salience 60))
?i1 <- (item (name ?f1) (conf ?conf1))
?i2 <- (item (name ?f2) (conf ?conf2))
=>
(if (and (eq ?f1 ?f2) (!= ?conf1 ?conf2)) then
(assert  (item (name ?f1) (conf (- (+ ?conf1 ?conf2) (* ?conf1 ?conf2)))))
(retract ?i1)
(retract ?i2)
(assert ( sendmessagehalt (sym-cat ?f1 ": \n=================================\nКоэффициент уверенности пересчитан\n=================================")) )
(halt))
)

''')
    for line in f:
        if line and not line.startswith('\n') and not line.startswith("//") and not line.startswith("факт"):
            rule = line.split(';')
            if len(rule) == 6:
                iid, first_lhs, second_lhs, rhs, desc, conf = rule
            else:
                iid, first_lhs, second_lhs, rhs, desc, conf = rule + [1.0]
            lhs = set([first_lhs, second_lhs])
            o.write(
f'''(defrule {iid}
(declare (salience 50))
''')
            i = 0
            for item in sorted(lhs):
                o.write(
f'(item (name "{item}") (conf ?c{i}))\n'
)
                i += 1
            o.write(
'=>\n'
)
            minn = '(min ' + ' '.join(f'?c{j}' for j in range(i)) + ')'
            o.write(
f'''(assert (item (name "{rhs}") (conf (* {conf} {minn}) ) ) )
''')
            o.write(
f'''(assert (sendmessagehalt "{rhs}: {desc}"))
(halt)
)

''')

# (assert ( item (name f2) (conf (* 0.5 (min ?conf1 ?conf2) ) )))
# (assert ( sendmessagehalt "f2,Wood->Planks" ) )
