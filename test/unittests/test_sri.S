.include "macros.inc"

start

test_name SRI_1
mvi r1, 1
sri r3, r1, 0
check_r3 1

test_name SRI_2
mvi r1, 0
sri r3, r1, 1
check_r3 0

test_name SRI_3
load r1 0x40000000
sri r3, r1, 30
check_r3 1

test_name SRI_4
load r1 0x40000000
sri r3, r1, 31
check_r3 0

test_name SRI_5
mvi r3, 2
sri r3, r3, 2
check_r3 0

test_name SRI_6
mvi r1, -0x0010
sri r3, r1, 2
check_r3 -0x0004

test_name SRI_7
mvi r1, -0x0010
sri r3, r1, 4
check_r3 -0x0001

end
