# THIS IS A GENERATED FILE! DO NOT EDIT!
# Begin generated code

.namespace [ 'Math'; 'Primality' ]

.sub 'is_small_prime'
        .param pmc __ARG_1
.annotate 'file', 'parrot-math-primality/primality.winxed'
.annotate 'line', 9
    root_new $P1, ['parrot';'ResizablePMCArray']
    assign $P1, 55
    $P1[0] = 2
    $P1[1] = 3
    $P1[2] = 5
    $P1[3] = 7
    $P1[4] = 11
    $P1[5] = 13
    $P1[6] = 17
    $P1[7] = 19
    $P1[8] = 23
    $P1[9] = 29
    $P1[10] = 31
    $P1[11] = 37
    $P1[12] = 41
    $P1[13] = 43
    $P1[14] = 47
    $P1[15] = 53
    $P1[16] = 59
    $P1[17] = 61
    $P1[18] = 67
    $P1[19] = 71
    $P1[20] = 73
    $P1[21] = 79
    $P1[22] = 83
    $P1[23] = 89
    $P1[24] = 97
    $P1[25] = 101
    $P1[26] = 103
    $P1[27] = 107
    $P1[28] = 109
    $P1[29] = 113
    $P1[30] = 127
    $P1[31] = 131
    $P1[32] = 137
    $P1[33] = 139
    $P1[34] = 149
    $P1[35] = 151
    $P1[36] = 157
    $P1[37] = 163
    $P1[38] = 167
    $P1[39] = 173
    $P1[40] = 179
    $P1[41] = 181
    $P1[42] = 191
    $P1[43] = 193
    $P1[44] = 197
    $P1[45] = 199
    $P1[46] = 211
    $P1[47] = 223
    $P1[48] = 227
    $P1[49] = 229
    $P1[50] = 233
    $P1[51] = 237
    $P1[52] = 241
    $P1[53] = 251
    $P1[54] = 257
.annotate 'line', 17
    null $I1
  __label_3: # for condition
    elements $I2, $P1
    ge $I1, $I2, __label_2
.annotate 'line', 19
    $P2 = $P1[$I1]
    ne $P2, __ARG_1, __label_4
.annotate 'line', 20
    .return(1)
    goto __label_5
  __label_4: # else
.annotate 'line', 21
    $P3 = $P1[$I1]
    le $P3, __ARG_1, __label_6
.annotate 'line', 22
    .return(0)
  __label_6: # endif
  __label_5: # endif
  __label_1: # for iteration
.annotate 'line', 17
    inc $I1
    goto __label_3
  __label_2: # for end
.annotate 'line', 25
    .return(0)
.annotate 'line', 26

.end # is_small_prime

# End generated code
