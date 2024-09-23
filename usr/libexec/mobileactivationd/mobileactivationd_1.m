uint64_t sub_1001B21D8@<X0>(int a1@<W0>, char *a2@<X1>, _BYTE *a3@<X2>, int a4@<W4>, int a5@<W7>, _BYTE *a6@<X8>)
{
  int v6;
  int v7;
  int v8;
  int v9;
  BOOL v10;
  unint64_t v11;
  char v12;
  _BYTE *v13;
  char v14;
  char v15;
  char *v16;
  char v17;
  _BYTE *v18;
  char v19;
  _BYTE *v20;
  unsigned int v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  int v28;
  unsigned int v29;
  uint64_t v30;
  int v31;
  unsigned int v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  unsigned int v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  char v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  char v55;
  char v56;
  char v57;
  uint64_t v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  char v64;
  char v65;
  char v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  char v77;
  char v78;
  unsigned int v79;
  uint64_t v80;
  char v81;
  char v82;
  char v83;
  char v84;
  uint64_t v85;
  char v86;
  uint64_t v87;
  char v88;
  char v89;
  uint64_t v90;
  int v91;
  unint64_t v92;

  v9 = a1 + LODWORD(STACK[0x2A0]) + LODWORD(STACK[0x29C]);
  LODWORD(STACK[0x2B8]) = a4 ^ a5 ^ 0xFFFFFFA7;
  LODWORD(STACK[0x2D0]) = v7 ^ 0xFFFFFFB0;
  v10 = v8 == 1935652811;
  v11 = STACK[0x328];
  v12 = (*(_BYTE *)STACK[0x328] ^ 0x99) + 127;
  *(_BYTE *)STACK[0x328] = (((((2 * v12) & 0xBF) + (v12 ^ 0xDF) + 118) | 0x13)
                          - ((9 - (((2 * v12) & 0xBF) + (v12 ^ 0xDF))) & 0x13)
                          - 85) ^ 0x99;
  if (v8 == 1935652811)
    v13 = a6;
  else
    v13 = a6 + 1;
  if (v8 == 1935652811)
    v14 = 0;
  else
    v14 = 11;
  v15 = *v13 ^ v14;
  if (v8 == 1935652811)
    v16 = a2;
  else
    v16 = a2 + 1;
  v17 = *v16;
  if (v8 == 1935652811)
    v18 = a3;
  else
    v18 = a3 + 1;
  v19 = v15 ^ v17 ^ *v18;
  if (v10)
    v20 = (_BYTE *)v11;
  else
    v20 = (_BYTE *)(v11 + 1);
  *v20 = v19 ^ ((v19 ^ *v20) - 20);
  v21 = STACK[0x310];
  v22 = 2u % LODWORD(STACK[0x310]);
  v23 = (11 * v22) ^ a6[v22] ^ a2[v22] ^ a3[v22];
  *(_BYTE *)(v11 + v22) = v23 ^ ((((v23 ^ *(_BYTE *)(v11 + v22)) + 111) ^ 0x7B)
                               + ((2 * ((v23 ^ *(_BYTE *)(v11 + v22)) + 111)) & 0xF7)
                               - 123);
  v24 = 3 % v21;
  v25 = (11 * v24) ^ a6[v24] ^ a2[v24] ^ a3[v24];
  v26 = (v25 ^ *(unsigned __int8 *)(v11 + v24)) + LODWORD(STACK[0x288]);
  *(_BYTE *)(v11 + v24) = v25 ^ ((v26 ^ 0x13) + ((2 * v26) & 0x26) - 19);
  v27 = 4 % v21;
  LOBYTE(v25) = (11 * v27) ^ a6[v27] ^ a2[v27] ^ a3[v27];
  LOBYTE(v26) = (v25 ^ *(_BYTE *)(v11 + v27)) - 3;
  *(_BYTE *)(v11 + v27) = v25 ^ (((2 * v26) & 0xDC)
                               + (v26 ^ 0x6E)
                               + ((24 - (((2 * v26) & 0xDC) + (v26 ^ 0x6E))) | 0xA1)
                               + ((((2 * v26) & 0xDC) + (v26 ^ 0x6E) + 103) | 0xA1)
                               - 14);
  v28 = STACK[0x474];
  v29 = LODWORD(STACK[0x474]) ^ 0x735FB7CA;
  v30 = 5 % v29;
  v31 = (-111 * v30) ^ byte_100215A40[v30] ^ byte_10023DC70[v30 + 1] ^ byte_10023BCC0[v30 + 1];
  v32 = (v31 ^ *(unsigned __int8 *)(v11 + v30)) + 17;
  *(_BYTE *)(v11 + v30) = v31 ^ ((((v32 ^ 0xFE) + 4 * (v32 >> 1) + 62) ^ 0x43)
                               + ((2 * ((v32 ^ 0xFE) + 4 * (v32 >> 1)) + 124) & 0x87)
                               - 127);
  v33 = 6 % v29;
  v34 = (*((unsigned __int8 *)&unk_100215920 + v33) ^ *(unsigned __int8 *)(v11 + v33) ^ (25 * v33) ^ byte_10023AD70[v33 + 3] ^ byte_10023E8A0[v33 + 2])
      + (LODWORD(STACK[0x28C]) ^ 0xFFFFFFBF);
  *(_BYTE *)(v11 + v33) = byte_100215A40[v33] ^ (-111 * v33) ^ byte_10023DC70[v33 + 1] ^ byte_10023BCC0[v33 + 1] ^ ((v34 ^ 0x4F) + ((2 * v34) & 0x9F) - 79);
  v35 = 7 % v29;
  LOBYTE(v34) = (-111 * v35) ^ byte_100215A40[v35] ^ byte_10023DC70[v35 + 1] ^ byte_10023BCC0[v35 + 1];
  LOBYTE(v21) = (v34 ^ *(_BYTE *)(v11 + v35)) + 47;
  *(_BYTE *)(v11 + v35) = v34 ^ (((((2 * v21) & 0x6C) + (v21 ^ 0xB6) + 124) | 0x5A)
                               - ((3 - (((2 * v21) & 0x6C) + (v21 ^ 0xB6))) & 0x5A)
                               - 50);
  v36 = 8 % v29;
  v37 = LODWORD(STACK[0x298])
      + (a6[v36] ^ *(unsigned __int8 *)(v11 + v36) ^ (11 * v36) ^ a2[v36] ^ a3[v36])
      + 97;
  *(_BYTE *)(v11 + v36) = byte_100215A40[v36] ^ (-111 * v36) ^ byte_10023DC70[v36 + 1] ^ byte_10023BCC0[v36 + 1] ^ ((v37 ^ 0x7F) + 2 * v37 - 127);
  v38 = 9 % v29;
  LOBYTE(v37) = (-111 * v38) ^ byte_100215A40[v38] ^ byte_10023DC70[v38 + 1] ^ byte_10023BCC0[v38 + 1];
  LOBYTE(v21) = (v37 ^ *(_BYTE *)(v11 + v38)) - 118;
  *(_BYTE *)(v11 + v38) = v37 ^ (((((2 * v21) & 0xEF) + (v21 ^ 0x77) - 53) ^ 0xC9)
                               + ((2 * (((2 * v21) & 0xEF) + (v21 ^ 0x77)) - 106) & 0x92)
                               - 11);
  v39 = 0xA % v29;
  v40 = (-111 * v39) ^ byte_100215A40[v39] ^ byte_10023DC70[v39 + 1] ^ byte_10023BCC0[v39 + 1];
  v41 = ((LODWORD(STACK[0x2E8]) + 1) ^ 0xFFFFFFC0)
      - 2 * ((LODWORD(STACK[0x2E8]) + 1) & 0x3F)
      + (v40 ^ *(unsigned __int8 *)(v11 + v39))
      + 64;
  LOBYTE(v41) = (v41 ^ 0x7B) + ((2 * v41) & 0xF7) - 2;
  *(_BYTE *)(v11 + v39) = v40 ^ ((v41 ^ 0xCF) + ((2 * v41) & 0x9F) - 72);
  v42 = 0xB % (v28 ^ 0x735FB7CAu);
  LOBYTE(v41) = (-111 * v42) ^ byte_100215A40[v42] ^ byte_10023DC70[v42 + 1] ^ byte_10023BCC0[v42 + 1];
  *(_BYTE *)(v11 + v42) = v41 ^ ((((((v41 ^ *(_BYTE *)(v11 + v42)) - 44) ^ 0x7F)
                                 + 2 * ((v41 ^ *(_BYTE *)(v11 + v42)) - 44)
                                 - 19) ^ 0xA1)
                               + ((2
                                 * ((((v41 ^ *(_BYTE *)(v11 + v42)) - 44) ^ 0x7F)
                                  + 2 * ((v41 ^ *(_BYTE *)(v11 + v42)) - 44)
                                  - 19)) & 0x42)
                               - 13);
  v43 = 0xC % (v28 ^ 0x735FB7CAu);
  v44 = (-111 * v43) ^ byte_100215A40[v43] ^ byte_10023DC70[v43 + 1] ^ byte_10023BCC0[v43 + 1];
  v45 = ((LODWORD(STACK[0x2A8]) - 17) ^ 0x5B)
      + ((2 * (LODWORD(STACK[0x2A8]) - 17)) & 0xFFFFFFBA ^ 0x4D)
      + (v44 ^ *(unsigned __int8 *)(v11 + v43))
      - 33;
  *(_BYTE *)(v11 + v43) = v44 ^ (((2 * v45) & 0xDF)
                               + (v45 ^ 0xEF)
                               + ((44 - (((2 * v45) & 0xDF) + (v45 ^ 0xEF))) | 0x89)
                               + ((((2 * v45) & 0xDF) + (v45 ^ 0xEF) + 83) | 0x89)
                               - 23);
  v46 = 0xD % (v28 ^ 0x735FB7CAu);
  LODWORD(v43) = (a6[v46] ^ *(unsigned __int8 *)(v11 + v46) ^ (11 * v46) ^ a2[v46] ^ a3[v46])
               + (LODWORD(STACK[0x294]) ^ 5);
  *(_BYTE *)(v11 + v46) = byte_100215A40[v46] ^ (-111 * v46) ^ byte_10023DC70[v46 + 1] ^ byte_10023BCC0[v46 + 1] ^ ((v43 ^ 0xFB) + ((2 * v43) & 0xF7) + 5);
  v47 = STACK[0x474];
  LODWORD(v46) = LODWORD(STACK[0x474]) ^ 0x735FB7CA;
  v48 = 0xE % v46;
  LOBYTE(v43) = (byte_100215A40[v48] ^ *(_BYTE *)(v11 + v48) ^ (-111 * v48) ^ byte_10023DC70[v48 + 1] ^ byte_10023BCC0[v48 + 1])
              + 42;
  *(_BYTE *)(v11 + v48) = byte_100215A00[v48] ^ (-9 * v48) ^ byte_100218720[v48 + 4] ^ byte_1002408C0[v48] ^ ((((v43 ^ 0x7F) + 2 * v43 - 32) ^ 0x83) + 2 * (((v43 ^ 0x7F) + 2 * v43) & 3) + 30);
  v49 = 0xF % v46;
  v50 = (-9 * v49) ^ byte_100215A00[v49] ^ byte_100218720[v49 + 4] ^ byte_1002408C0[v49];
  v51 = (v50 ^ *(_BYTE *)(v11 + v49)) - 75;
  *(_BYTE *)(v11 + v49) = v50 ^ (((2 * (((2 * v51) & 0x5E) + (v51 ^ 0xAF))) & 0xD4)
                               + ((((2 * v51) & 0x5E) + (v51 ^ 0xAF) + 96) ^ 0x6A)
                               + 71);
  v52 = 0x10 % v46;
  v53 = v9 + (a6[v52 & 0xF] ^ *(_BYTE *)(v11 + v52) ^ a2[v52 & 0xF] ^ a3[v52 & 0xF] ^ (11 * (v52 & 0xF))) - 21;
  *(_BYTE *)(v11 + v52) = byte_100215A00[v52 & 0xF] ^ (-9 * (v52 & 0xF)) ^ byte_100218720[(v52 & 0xF) + 4] ^ byte_1002408C0[v52 & 0xF] ^ ((((v53 ^ 0x7F) + 2 * v53 - 34) ^ 0x8C) + ((2 * ((v53 ^ 0x7F) + 2 * v53) + 28) & 0x18) + 23);
  LODWORD(v52) = v47 ^ 0x735FB7CA;
  v54 = 0x11 % (v47 ^ 0x735FB7CAu);
  v55 = byte_100218720[(v54 & 0xF) + 4] ^ byte_100215A00[v54 & 0xF];
  v56 = byte_1002408C0[v54 & 0xF];
  v57 = -9 * (v54 & 0xF);
  LOBYTE(v29) = (v55 ^ *(_BYTE *)(v11 + v54) ^ v56 ^ v57) + 35;
  *(_BYTE *)(v11 + v54) = v55 ^ v57 ^ v56 ^ ((v29 ^ 0x1E) + ((2 * v29) & 0x3C) - 30);
  v58 = 0x12 % v52;
  v59 = (a6[v58 & 0xF] ^ *(unsigned __int8 *)(v11 + v58) ^ a2[v58 & 0xF] ^ a3[v58 & 0xF] ^ (11 * (v58 & 0xF)))
      + (LODWORD(STACK[0x2C8]) ^ 0xD);
  *(_BYTE *)(v11 + v58) = byte_100215A00[v58 & 0xF] ^ (-9 * (v58 & 0xF)) ^ byte_100218720[(v58 & 0xF) + 4] ^ byte_1002408C0[v58 & 0xF] ^ ((((v59 ^ 0x7E) + 4 * (v59 >> 1) - 40) ^ 8) + (~(2 * ((v59 ^ 0x7E) + 4 * (v59 >> 1))) & 0x10) - 94);
  v60 = 0x13 % v52;
  LODWORD(v58) = LODWORD(STACK[0x2D8])
               + (a6[v60 & 0xF] ^ *(unsigned __int8 *)(v11 + v60) ^ a2[v60 & 0xF] ^ a3[v60 & 0xF] ^ (11 * (v60 & 0xF)))
               - 121;
  *(_BYTE *)(v11 + v60) = byte_100215A00[v60 & 0xF] ^ (-9 * (v60 & 0xF)) ^ byte_100218720[(v60 & 0xF) + 4] ^ byte_1002408C0[v60 & 0xF] ^ (((((2 * v58) & 0xDF) + (v58 ^ 0xEF) + 127) ^ 0x8C) + ((2 * (((2 * v58) & 0xDF) + (v58 ^ 0xEF)) + 30) & 0x18) + 6);
  LODWORD(v58) = STACK[0x474];
  LODWORD(v60) = LODWORD(STACK[0x474]) ^ 0x735FB7CA;
  v61 = 0x14 % v60;
  v62 = byte_100218720[(v61 & 0xF) + 4] ^ byte_100215A00[v61 & 0xF] ^ (-9 * (v61 & 0xF)) ^ byte_1002408C0[v61 & 0xF];
  *(_BYTE *)(v11 + v61) = v62 ^ ((((v62 ^ *(_BYTE *)(v11 + v61)) - 64) ^ 0x7F)
                               + 2 * ((v62 ^ *(_BYTE *)(v11 + v61)) - 64)
                               - 127);
  v63 = 0x15 % v60;
  v64 = byte_1002408C0[v63 & 0xF];
  v65 = -9 * (v63 & 0xF);
  v66 = byte_100218720[(v63 & 0xF) + 4] ^ byte_100215A00[v63 & 0xF];
  LOBYTE(v49) = (v66 ^ *(_BYTE *)(v11 + v63) ^ v64 ^ v65) - 26;
  *(_BYTE *)(v11 + v63) = v66 ^ v65 ^ v64 ^ (((((2 * v49) & 0xE3) + (v49 ^ 0x71) + 75) ^ 0x43)
                                           + ((2 * (((2 * v49) & 0xE3) + (v49 ^ 0x71)) - 106) & 0x87)
                                           + 1);
  v67 = 0x16 % v60;
  v68 = byte_100218720[(v67 & 0xF) + 4] ^ byte_100215A00[v67 & 0xF] ^ (-9 * (v67 & 0xF)) ^ byte_1002408C0[v67 & 0xF];
  *(_BYTE *)(v11 + v67) = v68 ^ ((((v68 ^ *(_BYTE *)(v11 + v67)) - 95) ^ 0xBF)
                               + 2 * (((v68 ^ *(_BYTE *)(v11 + v67)) - 95) & 0x3F)
                               + 65);
  v69 = 0x17 % v60;
  v70 = (*((unsigned __int8 *)&unk_100215920 + (v69 & 0xF)) ^ *(unsigned __int8 *)(v11 + v69) ^ byte_10023AD70[(v69 & 0xF) + 3] ^ (25 * (v69 & 0xF)) ^ byte_10023E8A0[(v69 & 0xF) + 2])
      + LODWORD(STACK[0x2B8]);
  *(_BYTE *)(v11 + v69) = byte_100215A00[v69 & 0xF] ^ (-9 * (v69 & 0xF)) ^ byte_100218720[(v69 & 0xF) + 4] ^ byte_1002408C0[v69 & 0xF] ^ (((2 * v70) & 0xE7) + (v70 ^ 0x73) + ((65 - (((2 * v70) & 0xE7) + (v70 ^ 0x73))) | 0x1D) + ((((2 * v70) & 0xE7) + (v70 ^ 0x73) - 66) | 0x1D) + 113);
  v71 = 0x18 % (v58 ^ 0x735FB7CA);
  LOBYTE(v43) = (byte_100215A00[v71 & 0xF] ^ *(_BYTE *)(v11 + v71) ^ byte_100218720[(v71 & 0xF) + 4] ^ byte_1002408C0[v71 & 0xF] ^ (-9 * (v71 & 0xF)))
              - 118;
  *(_BYTE *)(v11 + v71) = byte_100215A20[v71 & 0xF] ^ (-37 * (v71 & 0xF)) ^ byte_1002159C0[v71 & 0xF] ^ byte_1002159F0[v71 & 0xF] ^ ((v43 ^ 0xF7) + ((2 * v43) & 0xEF) + 9);
  v72 = 0x19 % (v58 ^ 0x735FB7CA);
  v73 = byte_1002159F0[v72 & 0xF];
  LOBYTE(v71) = -37 * (v72 & 0xF);
  LOBYTE(v49) = byte_1002159C0[v72 & 0xF] ^ byte_100215A20[v72 & 0xF];
  LOBYTE(v28) = (v49 ^ *(_BYTE *)(v11 + v72) ^ v73 ^ v71) - 125;
  *(_BYTE *)(v11 + v72) = v49 ^ v71 ^ v73 ^ ((v28 ^ 0xFD) + ((2 * v28) & 0xFB) + 3);
  v74 = 0x1A % (v58 ^ 0x735FB7CA);
  v75 = byte_1002159F0[v74 & 0xF];
  LOBYTE(v71) = -37 * (v74 & 0xF);
  LOBYTE(v49) = byte_1002159C0[v74 & 0xF] ^ byte_100215A20[v74 & 0xF];
  LOBYTE(v28) = (v49 ^ *(_BYTE *)(v11 + v74) ^ v75 ^ v71) + 118;
  *(_BYTE *)(v11 + v74) = v49 ^ v71 ^ v75 ^ ((v28 ^ 0x5E) + ((2 * v28) & 0xBC) - 94);
  v76 = 0x1B % (v58 ^ 0x735FB7CA);
  v77 = byte_1002159F0[v76 & 0xF];
  LOBYTE(v71) = -37 * (v76 & 0xF);
  v78 = byte_1002159C0[v76 & 0xF] ^ byte_100215A20[v76 & 0xF];
  LOBYTE(v28) = (v78 ^ *(_BYTE *)(v11 + v76) ^ v77 ^ v71) + 55;
  *(_BYTE *)(v11 + v76) = v78 ^ v71 ^ v77 ^ (((((2 * v28) & 0xF3) + (v28 ^ 0x79)) ^ 0xF8)
                                           + ((2 * (((2 * v28) & 0xF3) + (v28 ^ 0x79))) & 0xF0)
                                           - 113);
  LODWORD(v71) = STACK[0x474];
  v79 = LODWORD(STACK[0x474]) ^ 0x735FB7CA;
  v80 = 0x1C % v79;
  v81 = byte_1002159F0[v80 & 0xF];
  LOBYTE(v29) = -37 * (v80 & 0xF);
  v82 = byte_1002159C0[v80 & 0xF] ^ byte_100215A20[v80 & 0xF];
  v83 = (v82 ^ *(_BYTE *)(v11 + v80) ^ v81 ^ v29) + 115;
  v84 = (v83 ^ 0xFD) + ((2 * v83) & 0xFB) + 87;
  *(_BYTE *)(v11 + v80) = v82 ^ v29 ^ v81 ^ ((v84 ^ 3) + 2 * (v84 & 3) - 87);
  v85 = 0x1D % v79;
  v86 = LODWORD(STACK[0x308])
      + (a6[v85 & 0xF] ^ *(_BYTE *)(v11 + v85) ^ a2[v85 & 0xF] ^ a3[v85 & 0xF] ^ (11 * (v85 & 0xF)))
      - 86;
  *(_BYTE *)(v11 + v85) = byte_100215A20[v85 & 0xF] ^ (-37 * (v85 & 0xF)) ^ byte_1002159C0[v85 & 0xF] ^ byte_1002159F0[v85 & 0xF] ^ ((v86 ^ 0x3F) + 2 * (v86 & 0x3F) - 63);
  v87 = 0x1E % v79;
  v88 = byte_1002159C0[v87 & 0xF];
  v89 = (v88 ^ byte_100215A20[v87 & 0xF] ^ (-37 * (v87 & 0xF)) ^ byte_1002159F0[v87 & 0xF] ^ *(_BYTE *)(v11 + v87)) + 81;
  *(_BYTE *)(v11 + v87) = v88 ^ byte_100215A20[v87 & 0xF] ^ (-37 * (v87 & 0xF)) ^ byte_1002159F0[v87 & 0xF] ^ ((v89 ^ 0xE1) + ((2 * v89) & 0xC3) + 31);
  v90 = 0x1F % v79;
  v91 = (a6[v90 & 0xF] ^ *(unsigned __int8 *)(v11 + v90) ^ a2[v90 & 0xF] ^ a3[v90 & 0xF] ^ (11 * (v90 & 0xF)))
      + LODWORD(STACK[0x2D0]);
  *(_BYTE *)(v11 + v90) = byte_100215A20[v90 & 0xF] ^ (-37 * (v90 & 0xF)) ^ byte_1002159C0[v90 & 0xF] ^ byte_1002159F0[v90 & 0xF] ^ ((v91 ^ 0x66) + ((2 * v91) & 0xCC) - 102);
  v92 = STACK[0x318];
  *(_BYTE *)(STACK[0x328] + 0 % (v71 ^ 0x735FB7CA)) ^= *(_BYTE *)STACK[0x340] ^ 0xE6;
  return ((uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*(&off_100260750 + v6))(1897387887, v92, 476726722, 1897387887, 3696230153, 476726722, 598737143, -598737143);
}

uint64_t sub_1001B31AC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X5>, unsigned int a4@<W8>)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = ((int)a2 - 476726722) % a4;
  *(_BYTE *)(v5 + v13) ^= *(_BYTE *)(a2 + a1 - 476726722) ^ *(_BYTE *)(v6 + (v13 & 0xF)) ^ *(_BYTE *)(v7 + (v13 & 0xF)) ^ (-37 * (v13 & 0xF)) ^ (89 * (v13 & 0xF)) ^ *(_BYTE *)(v8 + (v13 & 0xF)) ^ *(_BYTE *)(v10 + (v13 & 0xF)) ^ *(_BYTE *)((v13 & 0xF) + v11 + 3) ^ *(_BYTE *)(v12 + (v13 & 0xF)) ^ 0xE6;
  return (*(uint64_t (**)(void))(v9 + 8 * ((14 * (a2 + 1 != a3 + 64)) | v4)))();
}

uint64_t sub_1001B3260@<X0>(unsigned int a1@<W8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)(v5 + ((int)v1 - 1377818204) % a1) ^= *(_BYTE *)(v1 + v3 - 1377818204) ^ 0x18;
  return (*(uint64_t (**)(void))(v6 + 8 * (v2 ^ (4 * (v1 + 1 == v4 + 319)))))();
}

uint64_t sub_1001B32BC@<X0>(int a1@<W0>, int a2@<W3>, unsigned int a3@<W8>)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  unint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  uint64_t (*v18)(void);

  v9 = (a2 - 1897387894) % a3;
  v10 = (a2 - 1897387924) % a3;
  v11 = *(unsigned __int8 *)(v8 + (v10 & 0xF));
  v12 = *(unsigned __int8 *)(v6 + (v10 & 0xF)) ^ *(unsigned __int8 *)(v4 + v10) ^ *(unsigned __int8 *)((v10 & 0xF) + v7 + 3);
  HIDWORD(v13) = *(unsigned __int8 *)(v6 + (v9 & 0xF)) ^ *(unsigned __int8 *)(v4 + v9) ^ *(unsigned __int8 *)((v9 & 0xF) + v7 + 3) ^ *(unsigned __int8 *)(v8 + (v9 & 0xF)) ^ (89 * (v9 & 0xF));
  LODWORD(v13) = HIDWORD(v13) << 24;
  LODWORD(v9) = v13 >> 31;
  HIDWORD(v13) = v12 ^ v10 ^ v11;
  LODWORD(v13) = (v12 ^ (89 * (((a2 - 1897387924) % a3) & 0xF)) ^ v11) << 24;
  v14 = (a2 - 1897388064) % a3;
  v15 = *(unsigned __int8 *)(v8 + (v14 & 0xF));
  v16 = *(unsigned __int8 *)(v6 + (v14 & 0xF)) ^ *(unsigned __int8 *)(v4 + v14) ^ *(unsigned __int8 *)((v14 & 0xF) + v7 + 3);
  v17 = (v13 >> 26) - ((2 * (v13 >> 26)) & 0x84);
  HIDWORD(v13) = v16 ^ v14 ^ v15;
  LODWORD(v13) = (v16 ^ (89 * (((a2 - 1897388064) % a3) & 0xF)) ^ v15) << 24;
  v18 = *(uint64_t (**)(void))(v5 + 8 * ((1215 * (a2 + 1 == a1 + 256)) ^ v3));
  *(_BYTE *)(v4 + (a2 - 1897387887) % a3) ^= (v9 - (((_BYTE)v9 << (((v3 - 125) & 0xAF) + 90)) & 0xC6) - 29) ^ (v17 + 66) ^ ((v13 >> 27) - ((2 * (v13 >> 27)) & 0xDF) - 17) ^ 0x4E;
  return v18();
}

uint64_t sub_1001B343C(double a1, double a2, double a3, double a4, double a5, double a6, double a7, __n128 a8)
{
  int v8;
  int v9;
  unint64_t v10;
  int v11;
  _QWORD *v12;
  int v13;
  __n128 v14;
  __n128 v15;
  __n128 v16;
  int v17;

  v9 = 8 * (v8 ^ 0x1A2);
  v10 = STACK[0x3F0];
  LODWORD(STACK[0x2E8]) = STACK[0x474];
  v11 = (v9 - 34) | 0x200;
  STACK[0x3F0] = v10 - 448;
  v12 = (_QWORD *)STACK[0x330];
  v12[74] = 0x9C29E977165AD0EBLL;
  v12[75] = 0xC1AE29E94926A161;
  v12[76] = 0x3E51D616B6D95E9ELL;
  *(_QWORD *)((char *)v12 + 620) = 0x5A382E206A757CBELL;
  STACK[0x398] = (unint64_t)*(&off_100260750 + v9);
  v13 = STACK[0x2E0];
  LODWORD(STACK[0x340]) = LODWORD(STACK[0x2E0]) - 1592160998;
  STACK[0x310] = STACK[0x338] + STACK[0x320];
  LODWORD(STACK[0x2A0]) = v13 + 1126403181;
  LODWORD(STACK[0x2A8]) = v13 - 1079687069;
  LODWORD(STACK[0x308]) = v13 - 1079687651 + v11;
  LODWORD(v12) = STACK[0x34C];
  LODWORD(STACK[0x318]) = 67 * (LODWORD(STACK[0x34C]) ^ 0x6A0);
  v14.n128_u64[0] = 0x3E3E3E3E3E3E3E3ELL;
  v14.n128_u64[1] = 0x3E3E3E3E3E3E3E3ELL;
  v15.n128_u64[0] = 0x1F1F1F1F1F1F1F1FLL;
  v15.n128_u64[1] = 0x1F1F1F1F1F1F1F1FLL;
  LODWORD(STACK[0x29C]) = (_DWORD)v12 - 521074685;
  LODWORD(STACK[0x298]) = (_DWORD)v12 + 1269915979;
  LODWORD(STACK[0x294]) = (_DWORD)v12 + 1004475373;
  v16.n128_u64[0] = 0x5B5B5B5B5B5B5B5BLL;
  v16.n128_u64[1] = 0x5B5B5B5B5B5B5B5BLL;
  a8.n128_u16[0] = 23387;
  a8.n128_u8[2] = 91;
  a8.n128_u8[3] = 91;
  a8.n128_u8[4] = 91;
  a8.n128_u8[5] = 91;
  a8.n128_u8[6] = 91;
  a8.n128_u8[7] = 91;
  LODWORD(STACK[0x338]) = -512473929;
  STACK[0x3B8] = STACK[0x300];
  v17 = STACK[0x2E8];
  LODWORD(STACK[0x454]) = STACK[0x2E8];
  STACK[0x3D8] = STACK[0x328];
  return ((uint64_t (*)(__n128, __n128, __n128, __n128, __n128, __n128, __n128, __n128))((char *)*(&off_100260750 + ((22 * ((v17 ^ 0xCB04835) - 2146435135 + ((2 * (v17 ^ 0x735FB7CA)) & 0xFFDFFFFF) < 0xFFFFFFC0)) ^ v11))
                                                                                                 - 4))((__n128)xmmword_1002158E0, v14, v15, (__n128)xmmword_1002158C0, (__n128)xmmword_100204890, (__n128)xmmword_1002048A0, v16, a8);
}

uint64_t sub_1001B36F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;

  v9 = a7 + 854;
  v10 = v8 - 1814019223;
  if ((v10 + 1) > 0x40)
    v11 = v10 + 1;
  else
    v11 = 64;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*(&off_100260750
                                                                               + ((43
                                                                                 * (-(int)a1
                                                                                  - v7
                                                                                  + (((v9 - 1050) | 0x21) ^ 0x6C1FBDF5u)
                                                                                  + v11 > 0xE)) ^ v9)))(a1, a2, 2131970610, 3152738156, 17);
}

uint64_t sub_1001B37B4(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  unsigned int v13;
  int v14;

  v10 = 32 * (a7 ^ 0x54D);
  v11 = a1 + v7 - 1814019223;
  if ((v11 + 1) > 0x40)
    v12 = v11 + 1;
  else
    v12 = 64;
  v13 = v8 + ((v10 + 334835166) & 0xEC0AD55D ^ 0x6C1FB9CA) + v12;
  v14 = __CFADD__(v11, v13);
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8
                                             * (((2 * ((v13 < 0x10) & ~v14)) | (((v13 < 0x10) & ~v14) << 7)) ^ v10))
                            - 4))();
}

uint64_t sub_1001B384C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  BOOL v15;
  unint64_t v16;
  unint64_t v17;
  char v18;

  v13 = (char *)&STACK[0x4D0] + STACK[0x2B0] + v7 - 0x7BB775407D70C692;
  v14 = (unint64_t)&v13[-v10];
  v15 = (unint64_t)&v13[-v10] < 0x10;
  v16 = (unint64_t)&v13[-v11 - 5];
  if (v16 < 0x10)
    v15 = 1;
  v17 = (unint64_t)&v13[-v12];
  if ((unint64_t)&v13[-v12] < 0x10)
    v15 = 1;
  v18 = (unint64_t)&v13[-v8] < ((a7 + 960786083) & 0xC6BB8D63 ^ 0x173uLL) || v15;
  if (v14 < (((a7 - 1112) | 0x13u) ^ 0x107uLL))
    v18 = 1;
  if (v16 < 0x10)
    v18 = 1;
  if (v17 < 0x10)
    v18 = 1;
  return (*(uint64_t (**)(void))(v9 + 8 * ((918 * ((v18 & 1) == 0)) ^ a7)))();
}

uint64_t sub_1001B3924(int8x16_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
  unsigned int v6;
  int v7;

  *(int8x16_t *)(STACK[0x300] + (v7 + a5)) = veorq_s8(*(int8x16_t *)STACK[0x328], a1);
  return ((uint64_t (*)(void))((char *)*(&off_100260750
                                      + (int)((487
                                             * (((((v6 ^ 0x1FFFFFEE7) & (v5 + 1)) == 16) ^ ((v6 ^ 0xE7) - 1)) & 1)) ^ v6 ^ 0x1E7))
                            - 12))();
}

void sub_1001B39A0()
{
  JUMPOUT(0x1001B3954);
}

uint64_t sub_1001B39A8()
{
  int v0;
  unsigned int v1;

  return ((uint64_t (*)(void))*(&off_100260750
                             + ((113 * (((v0 + 5) ^ (((v0 + 694650660) & 0xD698762F) - 1028 < v1)) & 1)) ^ (v0 - 1277))))();
}

uint64_t sub_1001B600C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v7;
  unsigned int v8;
  unsigned int v9;

  v9 = (*(_DWORD *)(a7 + 68) ^ 0x9C29E977)
     + v8
     - 1674974857
     - ((((*(_DWORD *)(a7 + 68) ^ 0x9C29E977) + v8) << ((v7 - 5) ^ 0xB1)) & 0x3853D2EE);
  *(_DWORD *)(a7 + 68) = v9;
  return ((uint64_t (*)(void))(*(_QWORD *)(a4 + 8 * ((1960 * ((v9 ^ 0x9C29E977) < v8)) ^ v7)) - 8))();
}

uint64_t sub_1001B606C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v7;

  *(_DWORD *)(a7 + 64) = v7 + *(_DWORD *)(a7 + 64) - 180;
  return ((uint64_t (*)(void))STACK[0x398])();
}

void sub_1001B6084()
{
  STACK[0x408] = (unint64_t)*(&off_100260750 + LODWORD(STACK[0x34C]) - 1678)
               + (LODWORD(STACK[0x34C]) - 1684)
               - 36;
  JUMPOUT(0x1001B6504);
}

uint64_t sub_1001B60B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  int v5;
  int v6;
  unsigned int v7;

  v7 = v4 + 2131969564 - v6 + v5 + 18;
  LODWORD(STACK[0x2B8]) = v7;
  return ((uint64_t (*)(void))(*(_QWORD *)(a4 + 8 * ((399 * (v7 >= ((v5 - 669813782) & 0x27EC8BF5 ^ 0x3ECu))) ^ v5))
                            - 8))();
}

uint64_t sub_1001B6120(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  int v9;
  int v10;
  char v11;
  unsigned int v12;
  _BOOL4 v15;

  v12 = v9 + 2131969564 + a8 + 1045;
  v15 = v12 > 0xF || ((2 * (v8 ^ 0xEF) - v11 + 11) & 0xFu) < (v12 & 0xF) || 1142229139 - v10 < v12;
  return ((uint64_t (*)(void))(*(_QWORD *)(a4 + 8 * ((v15 * (((v8 - 979) | 0x206) + 1481)) ^ v8)) - 8))();
}

uint64_t sub_1001B6198(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  BOOL v22;

  v13 = (v8 + v11) + a7;
  v14 = v13 - a1 - a5;
  v15 = (v12 + 14) & 0xF;
  v16 = v13 - (v9 + v15);
  v17 = v13 - ((_QWORD)&unk_10023C000 + v15) - 5;
  v18 = v13 - (v10 + v15);
  v22 = v16 < 0x10 || v14 < 0x10 || v17 < 0x10 || v18 < 0x10;
  return ((uint64_t (*)(void))*(&off_100260750 + ((1800 * ((v22 ^ (v7 - 16)) & 1)) ^ v7)))();
}

uint64_t sub_1001B6220(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;

  return (*(uint64_t (**)(_QWORD))(a4
                                           + 8
                                           * (((LODWORD(STACK[0x2B8]) >= ((v4 + 1073) ^ 0x658u)) * ((v4 - 207) ^ 0x16A)) ^ (v4 - 266))))(0);
}

uint64_t sub_1001B6260(double a1, double a2, int8x16_t a3, double a4, int8x16_t a5, double a6, int8x16_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  int v14;
  int v15;
  int v16;
  int v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  int8x16x4_t v22;

  v17 = (v14 - 584) | 0x245;
  v18 = STACK[0x2B8] & 0xFFFFFFF0;
  LODWORD(STACK[0x2D0]) = v16 + 9;
  LODWORD(STACK[0x2C8]) = v16 + 10;
  LODWORD(STACK[0x288]) = v16 + 11;
  LODWORD(STACK[0x28C]) = v16 + 12;
  LODWORD(STACK[0x290]) = v16 + 13;
  STACK[0x328] = (v16 + 3) & 0xF;
  STACK[0x2E8] = (v16 + 4) & 0xF;
  STACK[0x2E0] = (v16 + 7) & 0xF;
  STACK[0x2D8] = ((_BYTE)v16 + 8) & 0xF;
  STACK[0x2D0] = STACK[0x2D0] & 0xF;
  STACK[0x2C8] = STACK[0x2C8] & 0xF;
  v22.val[0].i64[0] = ((_BYTE)v16 - 50) & 0xF;
  v22.val[0].i64[1] = ((_BYTE)v16 - 1) & 0xF;
  v22.val[1].i64[0] = v16 & 0xF;
  v22.val[1].i64[1] = ((_BYTE)v16 + 1) & 0xF;
  v22.val[2].i64[0] = ((v17 ^ 7) + v16) & 0xF;
  v22.val[2].i64[1] = STACK[0x328];
  v22.val[3].i64[0] = STACK[0x2E8];
  v22.val[3].i64[1] = ((_BYTE)v16 + 5) & 0xF;
  v22.val[0].i64[0] = vqtbl4q_s8(v22, a5).u64[0];
  v22.val[1].i64[0] = ((_BYTE)v16 + 6) & 0xF;
  v22.val[1].i64[1] = STACK[0x2E0];
  v22.val[2].i64[0] = STACK[0x2D8];
  v22.val[2].i64[1] = STACK[0x2D0];
  v22.val[3].i64[0] = STACK[0x2C8];
  v22.val[3].i64[1] = STACK[0x288] & 0xF;
  v19 = STACK[0x28C] & 0xF;
  v20 = STACK[0x290] & 0xF;
  v22.val[0].i64[1] = vqtbl4q_s8(*(int8x16x4_t *)((char *)&v22 + 16), a5).u64[0];
  *(int8x16_t *)(a14 + (v15 - 1142229140)) = veorq_s8(veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(a12 + (v16 - 2131970610)), *(int8x16_t *)((char *)&unk_100215980+ (((_BYTE)v16 - 50) & 0xF))), veorq_s8(*(int8x16_t *)((char *)&unk_10023C000+ ((v16 - 50) & 0xF)+ 5), *(int8x16_t *)((char *)&unk_10021DE60+ (((_BYTE)v16 - 50) & 0xF)))), a3), vmulq_s8(v22.val[0], a7));
  return ((uint64_t (*)(void))((char *)*(&off_100260750 + ((13 * ((((v17 - 537) | 0xD1) ^ 0x4ED) != v18)) ^ v17)) - 8))();
}

void sub_1001B6444()
{
  STACK[0x398] = (unint64_t)*(&off_100260750 + LODWORD(STACK[0x34C]) - 1679);
  STACK[0x328] = (unint64_t)&unk_10021CD24;
  JUMPOUT(0x1001B3618);
}

void sub_1001B6478()
{
  STACK[0x408] = (unint64_t)*(&off_100260750 + LODWORD(STACK[0x34C]) - 1701)
               + (STACK[0x294] & 0xC420E57E ^ 0xFFFFFFFFFFFFFFE4);
  JUMPOUT(0x1001B6504);
}

uint64_t sub_1001B65A0(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(a4
                                        + 8
                                        * (((a1 + 254 + ((a1 - 253) | 0x10) + 1247) * ((v4 + 1713) < 0x40)) ^ a1))
                            - 4))();
}

uint64_t sub_1001B65EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  uint64_t v5;
  int v6;
  int v7;

  return (*(uint64_t (**)(uint64_t))(a4
                                            + 8 * ((30 * ((((v4 + 1177) | 0x10) ^ 0x6FBFFCCDu) - (v6 + v7) > 6)) ^ v4)))(v5);
}

uint64_t sub_1001B662C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X6>, unsigned int a4@<W8>)
{
  char v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)(a3 + ((14 * (v6 ^ a4) + v7) & (a1 + v8))) = v4;
  return ((uint64_t (*)(void))(*(_QWORD *)(a2 + 8 * ((((a1 + 1 + v8) < 0x40) * v5) ^ (v6 - 1447))) - 4))();
}

void sub_1001B6670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  STACK[0x438] = *(_QWORD *)(a4 + 8 * a8) + ((a8 + 1235676963) & 0xB65911E6) - 306;
  JUMPOUT(0x1001B6A70);
}

void sub_1001B6A7C()
{
  JUMPOUT(0x1001B3FECLL);
}

uint64_t sub_1001B6AA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;

  return (*(uint64_t (**)(void))(a4
                              + 8
                              * ((104
                                * (((v4 + 2098388939) & 0x82ED19A6 ^ 0x81ABCE7E ^ (v4 + 258686807) & 0xF094B9FD)
                                 + 2119446951 < 0x10)) ^ (v4 - 369))))();
}

void sub_1001B6B28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  char v8;
  uint64_t v9;

  *(_BYTE *)(a7 + a1) ^= *(_BYTE *)(v9 + a1) ^ ((v8 ^ a8) + 74);
  JUMPOUT(0x1001B6AECLL);
}

void sub_1001B6B4C(double a1, double a2, double a3, int8x16_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int8x16_t *a11)
{
  uint64_t v11;
  _DWORD *v12;

  *a11 = veorq_s8(*a11, a4);
  v12 = (_DWORD *)STACK[0x330];
  v12[156] = 1513631264;
  v12[149] = -1674974857;
  v12[148] = 375050475;
  v12[150] = 1227268449;
  v12[151] = -1045550615;
  v12[152] = -1227268450;
  v12[153] = 1045550614;
  v12[155] = 1786084542;
  STACK[0x398] = (v11 + 558) + *(_QWORD *)(a8 + 8 * v11) - 571;
  JUMPOUT(0x1001B6BD8);
}

uint64_t sub_1001B6BE0(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return ((uint64_t (*)(void))((char *)*(&off_100260750 + ((((a8 - 1008) ^ 0xEB) * (LODWORD(STACK[0x2B8]) != a1)) ^ a8))
                            - 12))();
}

uint64_t sub_1001B6C50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;

  return (*(uint64_t (**)(void))(a4
                              + 8
                              * ((794
                                * ((STACK[0x2B8] & 8) == ((((v4 + 171436225) & 0xF5C81779) + 718) ^ (523 * (v4 ^ 0x10F))))) ^ v4)))();
}

uint64_t sub_1001B6CB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char v7;
  char v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;

  v18 = v10 - 596;
  v19 = v9 + 1;
  v20 = (v9 + v16);
  *(_BYTE *)(a7 + (v17 + v15)) = *(_BYTE *)(a5 + v20) ^ *(_BYTE *)(v13 + (v20 & 0xF)) ^ byte_10023C000[(v20 & 0xF) + 5] ^ *(_BYTE *)(v14 + (v20 & 0xF)) ^ ((v20 & 0xF) * (((v18 + v7) & v8) - 90)) ^ 0x1F;
  return (*(uint64_t (**)(void))(a4 + 8 * (((v19 + v16 < v12) * v11) ^ v18)))();
}

void sub_1001B6D24()
{
  JUMPOUT(0x1001B6CB4);
}

uint64_t sub_1001B6D30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  unint64_t v5;

  v5 = (*(unsigned int *)(STACK[0x390] + 92) | ((unint64_t)(*(_DWORD *)(STACK[0x390] + 92) < 0x6A757CAEu) << 32))
     + 425909497;
  return ((uint64_t (*)(void))(*(_QWORD *)(a4
                                        + 8
                                        * ((826
                                          * ((((v4 + 610540048 + 67 * (v4 ^ 0x6B3)) ^ (((v5
                                                                                       - (v4 - 2082974985)) | ((v4 - 2082974985) - v5)) >> 63)) & 1) == 0)) ^ (v4 - 295)))
                            - 12))();
}

uint64_t sub_1001B6DC0@<X0>(unint64_t a1@<X8>)
{
  int v1;
  int v2;
  _BOOL4 v3;

  v3 = a1 < 0x83D859A7;
  *(_BYTE *)(STACK[0x428] - 0x57F7A3E501E5FAB3) = *(_BYTE *)STACK[0x380] ^ 0x99;
  if (a1 >= 0x83D859A7)
    v3 = a1 > 0x83D859A8;
  return ((uint64_t (*)(unint64_t, uint64_t, unint64_t))((char *)*(&off_100260750
                                                                                        + ((42 * v3) ^ ((v1 | 0xA1100) - 611200055)))
                                                                              - 12))(0xC6882A920996AE25, ((((v1 | 0xA1100) - 611200055) ^ 0x58Au) * v2) ^ 0xC8, 0xF2096CF42D57B6A7);
}

void sub_1001B6F0C()
{
  JUMPOUT(0x1001B6E80);
}

uint64_t sub_1001B6F1C()
{
  int v0;
  void *v1;
  void *v2;
  BOOL v3;
  int v4;

  STACK[0x3F0] -= 32;
  STACK[0x4B0] = (unint64_t)&STACK[0x538];
  LODWORD(STACK[0x300]) = v0 ^ 0x410;
  STACK[0x4B8] = STACK[0x2F0];
  STACK[0x498] = (unint64_t)&STACK[0x538];
  STACK[0x2A0] = (unint64_t)&STACK[0x538];
  STACK[0x4A8] = (unint64_t)&STACK[0x538];
  STACK[0x4C0] = 0;
  v1 = malloc(0x404uLL);
  STACK[0x4C0] = (unint64_t)v1;
  v2 = malloc(0x408uLL);
  STACK[0x4A0] = (unint64_t)v2;
  if (v1)
    v3 = v2 == 0;
  else
    v3 = 1;
  v4 = !v3;
  return ((uint64_t (*)(void))((char *)*(&off_100260750 + ((v4 * (((v0 ^ 0x410) - 712) ^ 0x206)) ^ v0)) - 8))();
}

#error "1001BE3D0: call analysis failed (funcsize=5886)"

uint64_t sub_1001BE46C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,int a43,int a44,int a45,int a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a64;
  int a66;
  int a69;
  int a70;
  char a72;
  int a73;
  int a74;
  int a75;
  int a76;
  int a77;
  int a78;
  int a79;
  uint64_t v79;
  unsigned int v80;
  int v82;
  int v83;
  int v84;
  BOOL v86;
  int v87;
  int v88;
  int v90;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v105;
  int v106;
  unint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  unint64_t v112;
  unint64_t v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  unint64_t v117;
  unint64_t v118;
  unint64_t v119;
  uint64_t v120;
  unint64_t v121;
  unint64_t v122;
  unint64_t v123;
  uint64_t v125;
  uint64_t v126;

  if ((a63 & 0x100000000) != 0)
    a43 = STACK[0x228];
  if ((a63 & 0x100000000) != 0)
    v82 = STACK[0x320];
  else
    v82 = STACK[0x288];
  v83 = a50;
  if ((a63 & 0x100000000) != 0)
  {
    v84 = a44;
  }
  else
  {
    v83 = a48;
    v84 = HIDWORD(a47);
  }
  if ((a63 & 0x100000000) != 0)
    a45 = a46;
  v86 = LODWORD(STACK[0x328]) == -315061333;
  v87 = STACK[0x224];
  if (LODWORD(STACK[0x328]) != -315061333)
    v87 = STACK[0x220];
  LODWORD(a37) = v87;
  v88 = STACK[0x218];
  if (LODWORD(STACK[0x328]) != -315061333)
    v88 = STACK[0x214];
  LODWORD(STACK[0x228]) = v88;
  if (v86)
    a77 = a76;
  LODWORD(STACK[0x220]) = a77;
  if (v86)
    v90 = v83;
  else
    v90 = a54;
  LODWORD(STACK[0x224]) = v90;
  if (v86)
    a75 = a74;
  LODWORD(a38) = a75;
  v92 = HIDWORD(a40) ^ a78 ^ 0x7E3C5639;
  HIDWORD(a40) = v82;
  if (v86)
    v93 = a43;
  else
    v93 = v82;
  LODWORD(a54) = v93;
  LODWORD(STACK[0x218]) = v84;
  HIDWORD(v126) = a45;
  if (v86)
    v94 = v84;
  else
    v94 = a45;
  LODWORD(STACK[0x288]) = v94;
  if ((a72 & 1) != 0)
    v95 = a30;
  else
    v95 = v92;
  if ((a72 & 1) != 0)
    v96 = v92;
  else
    v96 = HIDWORD(a29);
  if ((a72 & 1) != 0)
    v97 = a40;
  else
    v97 = a36;
  v98 = HIDWORD(a35);
  if ((a72 & 1) == 0)
    v98 = a35;
  v99 = a34;
  if ((a72 & 1) == 0)
    v99 = HIDWORD(a31);
  v100 = HIDWORD(a33);
  if ((a72 & 1) == 0)
    v100 = a33;
  LODWORD(STACK[0x350]) = v100;
  v101 = HIDWORD(a30);
  if ((a72 & 1) != 0)
    v101 = HIDWORD(a32);
  HIDWORD(a35) = v97;
  LODWORD(a36) = v95;
  if ((STACK[0x2E8] & 2) == 0)
    a70 = v95;
  LODWORD(a50) = a70;
  LODWORD(a40) = v96;
  if ((STACK[0x2E8] & 2) != 0)
    a73 = v96;
  LODWORD(a61) = a73;
  if ((STACK[0x2E8] & 2) == 0)
    a69 = v97;
  LODWORD(a48) = a69;
  if ((STACK[0x2E8] & 2) != 0)
    v105 = v98;
  else
    v105 = v99;
  HIDWORD(a47) = v105;
  if ((STACK[0x2E8] & 2) != 0)
    v98 = v99;
  LODWORD(v126) = v98;
  v106 = a32;
  if ((STACK[0x2E8] & 2) == 0)
    v106 = a31;
  HIDWORD(v125) = v106;
  if ((STACK[0x2E8] & 2) == 0)
    a79 = v101;
  LODWORD(v125) = a79;
  v108 = v80 - 318500354 + ((unint64_t)(v80 < (((_DWORD)a1 - 53) ^ 0x12FBEC06u)) << 32);
  v109 = *(_QWORD *)(STACK[0x498] + 8 * v108);
  v110 = 0x5F3D51B5D321F3ADLL * v109 - ((0x3E7AA36BA643E75ALL * v109) & 0x7F2CCEF1F7D4266ELL) - 0x406998870415ECC9;
  *(_QWORD *)(STACK[0x4A8] + 8 * v108) = v109 ^ 0xAEAEAEAEAEAEAEAELL;
  v111 = ((2 * ((v79 ^ 0xAC28D8CDA4789D88 ^ v110) + v108)) & 0xD7FFF3BF7DB5E7FELL)
       + (((v79 ^ 0xAC28D8CDA4789D88 ^ v110) + v108) ^ 0x6BFFF9DFBEDAF3FFLL);
  v112 = v111
       + (((v111 - 0x6BFFF9DFBEDAF3FFLL) >> 32) ^ 0x81EAA302159391D4)
       - (((v111 - 0x6BFFF9DFBEDAF3FFLL) >> 31) & 0x1D4D8DC56);
  v113 = v112
       + (((v112 + 0x1215631E2B917A2DLL) >> 16) ^ 0x5B189CEF5A66B6BFLL)
       + (((v112 + 0x1215631E2B917A2DLL) >> 15) & 0x139DEB4CD6D7ELL);
  v114 = v113
       + (((v113 - 0x490339D12ED53C92) >> 8) ^ 0x288141300F008084)
       - (((v113 - 0x490339D12ED53C92) >> 7) & 0xFD7D9FE1FEFEF6)
       + 2;
  v115 = v114 - ((2 * v114 - 0x750278EF9872A0B0) & 0xF9E2A80AEB166326) - 0x3D8FE87256AE1EC5;
  v116 = ((2 * ((v110 ^ 0xC367337D8E6122A4 ^ v115) + v108)) & 0xFF4A5FEF95F9B67ELL)
       + (((v110 ^ 0xC367337D8E6122A4 ^ v115) + v108) ^ 0xFFA52FF7CAFCDB3FLL);
  v117 = v116
       + (((v116 + 0x5AD008350324C1) >> 32) ^ 0x2A110412890103B2)
       - (((v116 + 0x5AD008350324C1) >> 31) & 0xEDFDF89A);
  v118 = v117
       + (((v117 - 0x29B6340A53FDDEF1) >> 16) ^ 0x7E9DFF3BA6BDBFFFLL)
       + (((v117 - 0x29B6340A53FDDEF1) >> 15) & 0x1FE774D7B7FFELL);
  v119 = v118
       + (((v118 + 0x57ABCCBA05446110) >> 8) ^ 0x11012A1162280000)
       - (((v118 + 0x57ABCCBA05446110) >> 7) & 0x1FDABDD3BAFFFFELL)
       + 2;
  v120 = v119 - ((2 * v119 + 0x1B5BC26429719B9CLL) & 0x1EE642CF0D2CE346) - 0x72DEFD6664B0C08FLL;
  v121 = ((2 * ((v110 ^ 0x30E5461F7D7C6294 ^ v120) + v108)) & 0xAECFD17FFFEEFBEELL)
       + (((v110 ^ 0x30E5461F7D7C6294 ^ v120) + v108) ^ 0xD767E8BFFFF77DF7);
  v122 = v121
       + (((v121 + 0x2898174000088209) >> 32) ^ 0x6056008DC888218)
       - (((v121 + 0x2898174000088209) >> 31) & 0x46EEFBCE);
  v123 = v122
       + (((v122 + 0x2292B737237FFFF1) >> 16) ^ 0xFFB9ABBDFD5B473FLL)
       + (((v122 + 0x2292B737237FFFF1) >> 15) & 0x1577BFAB68E7ELL);
  HIDWORD(a52) = a66 ^ 0xD87DBFDF;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)*(&off_100260750 + (int)((1939 * (v80 - 318500353 > 1)) ^ a1)) - 8))(a1, 318500354, 0x17CEE5F7EDBFAF0, 3688890070, 364670442, v123+ (((v123 + 0x22D90B792624B8B2) >> 8) ^ 0x104188D040920287)- (((v123 + 0x22D90B792624B8B2) >> 7) & 0x17CEE5F7EDBFAF0)+ 2, 1975353146, 2243753618, a9, a10, a11, a12, a13, a14, a15, a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           v125,
           v126,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63,
           a64);
}

void sub_1001BECE4()
{
  JUMPOUT(0x1001BE6DCLL);
}

uint64_t sub_1001BECF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,int a42,int a43,uint64_t a44,int a45,int a46,int a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a69;
  int v69;
  int v70;
  int v71;
  int v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  uint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  unint64_t v108;
  unint64_t v109;
  uint64_t v110;
  unint64_t v111;
  int v112;
  int v113;
  int v114;
  unint64_t v115;
  uint64_t v116;
  int v117;
  char v118;
  char v119;
  BOOL v120;
  int v121;
  int v122;
  int v123;
  int v124;
  int v126;
  unsigned int v127;
  int v128;
  unsigned int v129;
  unsigned int v130;
  int v131;
  unsigned int v132;
  unsigned int v133;

  v73 = (((unint64_t)(a6 - 0x799035B1F46D5CC5) >> 29) & 0x25F9FFBFELL)
      + a6
      + ((v72 - 80) ^ ((unint64_t)(a6 - 0x799035B1F46D5CC5) >> 30) ^ 0x1CBF3F792FCFFC4BLL);
  v74 = (((v73 + 0x69B08AD4DBC2A53CLL) >> 12) ^ 0x9F3FDFC7FB9B3D47)
      + v73
      + (((v73 + 0x69B08AD4DBC2A53CLL) >> 11) & 0x1FBF8FF7367A8ELL);
  v75 = v74
      + (((v74 - 0x358F54F31FD8980BLL) >> 7) ^ 0x9028040100800A2)
      - (((v74 - 0x358F54F31FD8980BLL) >> 6) & 0x1FAFF7FDFEFFEBALL)
      + 1;
  v76 = v75 - ((2 * v75 - 0x7D23AA665FC1315CLL) & 0xB994C7432146485CLL) - 0x61C771919F3D7480;
  v77 = ((2 * ((v76 ^ 0xDCCA63A190A3242ELL) + 0x288AB139EA2E5744)) & 0xE7FF5757FC7C7DDALL)
      + (((v76 ^ 0xDCCA63A190A3242ELL) + 0x288AB139EA2E5744) ^ 0xF3FFABABFE3E3EEDLL);
  v78 = v77
      + (((v77 + 0xC00545401C1C113) >> 24) ^ 0x90840C1102002293)
      - (((v77 + 0xC00545401C1C113) >> 23) & 0x1DDFBFFBAD8);
  v79 = v78
      + (((v78 + 0x7B7C4842FFC19E80) >> 13) ^ 0x3758017820281821)
      - (((v78 + 0x7B7C4842FFC19E80) >> 12) & 0xFFD0FBFAFCFBCLL);
  v80 = v79
      + (((v79 + 0x442446CADF99865FLL) >> 5) ^ 0x10287908AC2000)
      - (((v79 + 0x442446CADF99865FLL) >> 4) & 0xFDFAF0DEEA7BFFELL)
      + 3;
  v81 = v80 - ((2 * v80 + 0x8283CA3ADDACCB8) & 0x25D9AD49E1AA794ELL) - 0x28FF0B09383D5CFDLL;
  v82 = (v81 ^ 0xBAFDD8F5F3752987)
      + ((v81 >> 31) ^ 0x101244053DFB11CBLL)
      + ((v81 >> 30) & 0x36FFEBFBELL ^ 0xFFFFFFFD9409DC69)
      - 0x101244044800A01FLL;
  v83 = (((((2 * v82) & 0xF37BEABB76FFFBFCLL) + (v82 ^ 0xF9BDF55DBB7FFDFELL) + 0x6420AA244800202) >> 11) ^ 0xEEBCEFF7F50F915DLL)
      + ((2 * v82) & 0xF37BEABB76FFFBFCLL)
      + (v82 ^ 0xF9BDF55DBB7FFDFELL)
      + (((((2 * v82) & 0xF37BEABB76FFFBFCLL) + (v82 ^ 0xF9BDF55DBB7FFDFELL) + 0x6420AA244800202) >> 10) & 0x39DFEFEA1F22BALL);
  v84 = (((v83 + 0x17851AAA4F7070A5) >> 4) ^ 0x7FFB3BA2F7E86FFFLL)
      + v83
      + (((v83 + 0x17851AAA4F7070A5) >> 3) & 0x1FF67745EFD0DFFELL);
  v85 = v84 - 0x6805E993C067D362 + (~(2 * v84 + 0x13BE0EAF10014CLL) | 0xFF1F91362FDFA811);
  v86 = ((2 * ((v85 ^ 0x703764E8102BF7) + 0x1E4A8A832E7300A6)) & 0xFFFFFDBFF67FBEAELL)
      + (((v85 ^ 0x703764E8102BF7) + 0x1E4A8A832E7300A6) ^ 0xFFFFFEDFFB3FDF57);
  v87 = v86
      + (((v86 + 0x12004C020A9) >> 30) ^ 0x44008C0CEA028C11)
      - (((v86 + 0x12004C020A9) >> 29) & 0x62BFAE7DCLL);
  v88 = v87
      + (((v87 - 0x44008AECE5426B68) >> 15) ^ 0x3938FAFF87F3BF9ELL)
      + (((v87 - 0x44008AECE5426B68) >> 14) & 0x1F5FF0FE77F3CLL);
  v89 = v88
      + (((v88 - 0x7D3985EC6D362B06) >> 8) ^ 0xFFB5E77BEFB75DF7)
      + (((v88 - 0x7D3985EC6D362B06) >> 7) & 0x16BCEF7DF6EBBEELL)
      + 1;
  v90 = v89 - ((2 * v89 + 0x621252F4624EE04) & 0xD460B24072623150) - 0x12BF144823BC7056;
  v91 = ((2 * ((v90 ^ 0x6A305920393118A8) + 0x2C1E97BC5C429E81)) & 0xF2FDEFBF2E4FF3FCLL)
      + (((v90 ^ 0x6A305920393118A8) + 0x2C1E97BC5C429E81) ^ 0x797EF7DF9727F9FELL);
  v92 = (((v91 - 0x797EF7DF9727F9FELL) >> 27) ^ 0xFFDB7CF077FEBF48)
      + v91
      + (((v91 - 0x797EF7DF9727F9FELL) >> 26) & 0x20EFFD7E90);
  v93 = (((v92 - 0x795A74D00F26B946) >> 15) ^ 0x777F37F75DABEDEBLL)
      + v92
      + (((v92 - 0x795A74D00F26B946) >> 14) & 0x26FEEBB57DBD6);
  v94 = (((v93 + 0xF265338932D58CFLL) >> 8) ^ 0xF2D43FFAFD7FD63BLL)
      + v93
      + (((v93 + 0xF265338932D58CFLL) >> 7) & 0x1A87FF5FAFFAC76);
  v95 = v94 - ((2 * v94 + 0x38A4267B2B5B0528) & 0x220468122728BA24) + 0x2D544746A941DFA6;
  v96 = (v95 ^ 0x8D13B1AEBFEB8D82)
      + ((v95 >> 30) ^ 0x7D5FF5FDC9B9F95DLL)
      + ((v95 >> 29) & 0x7FBEE7FCELL ^ 0x4688C0D44)
      - 0x7D5FF5FFFDF73FE7;
  v97 = (((((2 * v96) & 0xD65EF7AFFEFF96C0) + (v96 ^ 0xEB2F7BD7FF7FCB60) + 0x14D08428008034A0) >> 8) ^ 0x7FFEEFBFF985EE7DLL)
      + ((2 * v96) & 0xD65EF7AFFEFF96C0)
      + (v96 ^ 0xEB2F7BD7FF7FCB60)
      + (((((2 * v96) & 0xD65EF7AFFEFF96C0) + (v96 ^ 0xEB2F7BD7FF7FCB60) + 0x14D08428008034A0) >> 7) & 0x1FDDF7FF30BDCFALL);
  v98 = v97
      + (((v97 - 0x6B2E6B97F905B9DDLL) >> 8) ^ 0x1C300212041A60A9)
      - (((v97 - 0x6B2E6B97F905B9DDLL) >> 7) & 0x19FFBDBF7CB3EACLL)
      + 1;
  v99 = v98 - ((2 * v98 + 0x14324AC05BFCAF2) & 0xF29198417489EBALL) - 0x7FC9E0E7F17BCB2ALL;
  v100 = ((2 * ((v99 ^ 0x7948CC20BA44F5DLL) + 0x75D572E7727DD82)) & 0x13B779FDE753FFFALL)
       + (((v99 ^ 0x7948CC20BA44F5DLL) + 0x75D572E7727DD82) ^ 0x89DBBCFEF3A9FFFDLL);
  v101 = v100
       + (((v100 + 0x762443010C560003) >> 30) ^ 0xE000180688040078)
       - (((v100 + 0x762443010C560003) >> 29) & 0x2EFF7FF0ELL);
  v102 = v101
       + (((v101 - 0x69DBD5057BAE0075) >> 9) ^ 0x9717040201908061)
       - (((v101 - 0x69DBD5057BAE0075) >> 8) & 0xD1F7FBFCDEFF3CLL);
  v103 = v102
       + (((v102 - 0xF2D9077D3E80D6) >> 7) ^ 0xCCFFF2FBB7FFEDF7)
       + (((v102 - 0xF2D9077D3E80D6) >> 6) & 0x1FFE5F76FFFDBEELL)
       + 2;
  v104 = v103 - ((2 * v103 + 0x641A67F995832262) & 0x42DA25FBA8265986) - 0x2C85B905612B420CLL;
  v105 = ((2 * ((v104 ^ 0xA16D12FDD4132CC3) + 0x20226CA5EA003BB7)) & 0xEEFDD7F8F63E7AFELL)
       + (((v104 ^ 0xA16D12FDD4132CC3) + 0x20226CA5EA003BB7) ^ 0x777EEBFC7B1F3D7FLL);
  v106 = v105
       + (((v105 - 0x777EEBFC7B1F3D7FLL) >> 27) ^ 0x8081010900246000)
       - (((v105 - 0x777EEBFC7B1F3D7FLL) >> 26) & 0x2DFFB73FFELL);
  v107 = v106
       + (((v106 + 0x80012FA84BC6281) >> 13) ^ 0x57FEFD7E76BED76FLL)
       + (((v106 + 0x80012FA84BC6281) >> 12) & 0xDFAFCED7DAEDELL);
  v108 = v107
       + (((v107 - 0x4FFEEA83F20274EELL) >> 4) ^ 0x7FBFB707D6EF9FF5)
       + (((v107 - 0x4FFEEA83F20274EELL) >> 3) & 0x1F7F6E0FADDF3FEALL)
       + 1;
  v109 = v108 - ((2 * v108 + 0x2082BCE86E1BD638) & 0x3F8E45F7AB40589ALL) + 0x500881700CAE1769;
  v110 = (v109 ^ 0x6DA080B3AA4AD302)
       + ((v109 >> 26) ^ 0x7FB7DFA7BB475705)
       + ((v109 >> 25) & 0x79A6CEF7DELL ^ 0x30804051D4)
       - 0x7FB7DFBCD3677BEFLL;
  v111 = ((2 * v110) & 0x5FFF9FAABF5D5FBELL)
       + (v110 ^ 0x2FFFCFD55FAEAFDFLL)
       + (((((2 * v110) & 0x5FFF9FAABF5D5FBELL) + (v110 ^ 0x2FFFCFD55FAEAFDFuLL) - 0x2FFFCFD55FAEAFDFLL) >> 15) ^ 0x12084A94E0005009)
       - (((((2 * v110) & 0x5FFF9FAABF5D5FBELL) + (v110 ^ 0x2FFFCFD55FAEAFDFuLL) - 0x2FFFCFD55FAEAFDFLL) >> 14) & 0x36AD63FFF5FECLL);
  v112 = ((v111 - 0x42081A6A3FAEFFE8) >> 6) - (((v111 - 0x42081A6A3FAEFFE8) >> 5) & 0xF6C76080);
  LODWORD(v111) = ((2 * (v111 - 1068433384)) & 0xFF6B9FFE)
                + ((v111 - 1068433384) ^ 0xFFB5CFFF)
                + ((v112 - 77352896) ^ 0xE6790CC2)
                + ((2 * (v112 - 77352896)) & 0xC5CA86FA ^ 0x3B3DFF7F);
  v113 = v99 ^ v85 ^ v69 ^ (v111 - 2 * ((v111 + 53441408) & 0xAF6C51E ^ v111 & 0x1A) + 1847998596);
  LODWORD(v85) = (((2 * (v113 & 7 ^ 0xA6586F41)) | 0xEEF5A00A) - (v113 & 7 ^ 0xA6586F41) + 142946299) ^ 0x7369BF62;
  v114 = (v85 | 0x14993C17) - (v85 | 0xEB66C3E8) - 345586712;
  LODWORD(v85) = (((v113 ^ 0x4617345) + 1) ^ 3) + 2 * ((v113 ^ 0x4617345) + 1) + 5;
  v115 = ((v85 & 7) - ((2 * (_DWORD)v85) & 0xA) - 1814470115) ^ 0x93D9621D;
  v116 = 255;
  if (v114 == 919747635)
    v116 = 0;
  STACK[0x320] = v115;
  v117 = (v116 << v115) - ((2 * (v116 << v115)) & 0x3FA64FB8) - 1613551652;
  v118 = (v117 ^ 0x67)
       + ((2 * v117) & 0x76 ^ 0x30)
       + 69
       + ((((2 * v117) ^ 0xB8) - ((2 * ((2 * v117) ^ 0xB8)) & 0x88) + 68) ^ 0xBB);
  v119 = (v118 ^ 0xF2) + 14 + ((2 * v118) & 0xE4);
  if (v114 == 919747635)
    v119 = 0;
  v120 = LODWORD(STACK[0x328]) == -315061333;
  v121 = STACK[0x2D0];
  if (LODWORD(STACK[0x328]) == -315061333)
    v121 = STACK[0x21C];
  LODWORD(STACK[0x214]) = v121;
  v122 = STACK[0x218];
  if (v120)
    v122 = a46;
  LODWORD(STACK[0x218]) = v122;
  v123 = STACK[0x210];
  if (!v120)
    v123 = STACK[0x20C];
  LODWORD(STACK[0x210]) = v123;
  v124 = STACK[0x208];
  if (!v120)
    v124 = STACK[0x204];
  LODWORD(STACK[0x20C]) = v124;
  if ((a69 & 1) != 0)
    a43 = a47;
  v126 = v90 ^ v76 ^ v70 ^ v104;
  v127 = v95 ^ v81 ^ v71 ^ v109;
  v128 = ((v126 & 0x7F ^ 0x13) - ((2 * (v126 & 0x7F ^ 0x13)) & 0x14) + 898999946) ^ 0x351DB68B;
  v129 = (((2 * v128) | 0x85DE4244) - v128 + 1024515806) ^ 0xC2673120;
  v130 = (((2 * (v117 ^ 0x6F)) & 0xFFFFFF3F) - (v117 ^ 0x6F) - 68209568) ^ 0xFBEF34D3;
  v131 = ((v119 & (v126 ^ 0xD6)) + (~(2 * (v119 & (v126 ^ 0xD6))) | 0x59) - 44) ^ 0x5F;
  v132 = ((v131 | 0xC5EE9834) - (v131 | 0x3A1167CB) + 974219211) ^ 0x4FEEBAB0;
  v133 = (((2 * ((v127 ^ BYTE1(v127) ^ BYTE2(v127)) ^ 0x36600703)) | 0x69F031BA)
        - ((v127 ^ BYTE1(v127) ^ BYTE2(v127)) ^ 0x36600703)
        + 1258809123) ^ HIBYTE(v127) ^ 0x82981F19;
  LODWORD(STACK[0x2D0]) = (2 * v126) & 0xDDFB7F74 ^ 0xD0095220;
  LODWORD(STACK[0x2D8]) = 33686018 * v129;
  LODWORD(STACK[0x2E0]) = (((2 * v132) & 0x1256D6F6) - v132 + 1993643140) ^ ((~(33686018 * v130) | 0x6DB07AA9)
                                                                           + 16843009 * v130
                                                                           - 920141140);
  LODWORD(STACK[0x200]) = (16843009 * v133 - ((33686018 * v133) & 0xCAA66C64) - 447531470) ^ 0x4D40146D;
  LODWORD(STACK[0x21C]) = a43;
  return sub_100190E08(944);
}

uint64_t sub_1001C000C()
{
  int v0;
  int v1;
  unsigned int v2;
  unsigned int v3;
  int v4;

  v1 = STACK[0x280];
  v2 = (LODWORD(STACK[0x280]) + 378119576) & 0xE9765BA6;
  v3 = (LODWORD(STACK[0x280]) + 1935652711) ^ v0;
  LODWORD(STACK[0x310]) = v3;
  if (v3 <= 1)
    v4 = 1;
  else
    v4 = v3;
  return ((uint64_t (*)(void))*(&off_100260750 + ((206 * (v4 - 17 >= v2 - 427)) ^ v1)))();
}

uint64_t sub_1001C0088()
{
  unsigned int v0;
  int v1;

  return ((uint64_t (*)(void))((char *)*(&off_100260750
                                      + ((8 * (v0 < ((v1 - 220) ^ 0x415u))) | (16 * (v0 < ((v1 - 220) ^ 0x415u))) | v1))
                            - (((v1 - 689) | 0x480u) ^ 0x6B8)))();
}

uint64_t sub_1001C00D4(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;

  *(_OWORD *)STACK[0x328] = xmmword_1002158A0;
  return ((uint64_t (*)(__n128))*(&off_100260750
                                          + ((235
                                            * ((((v4 & 0xFFFFFFF0) == 16) ^ (29 * (a4 ^ 0xA3))) & 1)) ^ (a4 - 573))))((__n128)xmmword_1002158A0);
}

void sub_1001C012C()
{
  JUMPOUT(0x1001C0108);
}

uint64_t sub_1001C0134()
{
  int v0;
  int v1;
  int v2;

  return ((uint64_t (*)(void))*(&off_100260750 + ((385 * (((v1 == v2) ^ (v0 + 26)) & 1)) ^ v0)))();
}

uint64_t sub_1001C016C()
{
  int v0;
  unsigned int v1;

  return ((uint64_t (*)(void))((char *)*(&off_100260750
                                      + (int)(((((v0 + 474) | 4) - 1008) * ((v1 >> 3) & 1)) ^ (v0 + 348)))
                            - 12))();
}

uint64_t sub_1001C01AC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  int v3;
  int v4;
  unsigned int v5;
  int8x16x4_t v7;

  v7.val[0].i64[0] = v5 & 8;
  v7.val[0].i64[1] = (11 * (v3 ^ 0x40C)) ^ 0x62 | v5 & 8;
  v7.val[1].i64[0] = v7.val[0].i64[0] | 2;
  v7.val[1].i64[1] = v7.val[0].i64[0] | 3;
  v7.val[2].i64[0] = v7.val[0].i64[0] | 4;
  v7.val[2].i64[1] = v7.val[0].i64[0] | 5;
  v7.val[3].i64[0] = v7.val[0].i64[0] | 6;
  v7.val[3].i64[1] = v7.val[0].i64[0] | 7;
  *(int8x8_t *)(STACK[0x328] + v5) = veor_s8(veor_s8(veor_s8(veor_s8(*(int8x8_t *)(a3 + v7.val[0].i64[0]), *(int8x8_t *)(a1 + v7.val[0].i64[0])), *(int8x8_t *)(a2 + v7.val[0].i64[0])), (int8x8_t)0x1818181818181818), vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v7, (int8x16_t)xmmword_1002048A0), (int8x8_t)0xB0B0B0B0B0B0B0BLL));
  return ((uint64_t (*)(__n128))((char *)*(&off_100260750 + ((42 * ((v4 & 0xFFFFFFF8) - 8 == v5)) ^ v3)) - 12))((__n128)xmmword_1002048A0);
}

void sub_1001C028C()
{
  JUMPOUT(0x1001C01F0);
}

uint64_t sub_1001C0294()
{
  int v0;
  int v1;
  int v2;

  return ((uint64_t (*)(void))*(&off_100260750
                             + (int)((((v1 + 1537353624) & 0xA45DD9A6 ^ ((v1 - 32) | 0x100) ^ 0x2A5) * (v0 == v2)) ^ v1)))();
}

uint64_t sub_1001C02E0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, int a3@<W3>, uint64_t a4@<X8>)
{
  int v4;
  int v5;
  int v6;

  *(_BYTE *)(STACK[0x328] + (v4 - 954000439)) = *(_BYTE *)(a4 + ((v4 - 954000439) & 0xFLL)) ^ *(_BYTE *)(a1 + (((_BYTE)v4 - 55) & 0xF)) ^ *(_BYTE *)(a2 + (((_BYTE)v4 - 55) & 0xF)) ^ (((v4 - 55) & 0xF) * (a3 ^ 0xA9)) ^ 0x18;
  return ((uint64_t (*)(void))*(&off_100260750 + ((901 * (v4 == v6 + v5 - 1)) ^ a3)))();
}

void sub_1001C0354()
{
  JUMPOUT(0x1001C0304);
}

uint64_t sub_1001C035C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  int v4;
  int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(a3 + 8 * ((1555 * (v3 + 8 == v5)) ^ v4))
                            - (((v4 ^ 0x7B3u) - 565) ^ (v4 + 892))))();
}

uint64_t sub_1001C0394(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v9;

  LODWORD(STACK[0x330]) = v4;
  STACK[0x4C8] = 0xE7E06F487EE8DF97;
  LODWORD(STACK[0x444]) = dword_100277CE8 - 73583857;
  v6 = *(unsigned int *)aHAwAwAwAwAwAwA;
  v7 = 1856021207
     * ((((v5 - 152) | 0x8A6AD391298A1BEDLL) - (v5 - 152) + ((v5 - 152) & 0x75952C6ED675E410)) ^ 0x677E440A67E3CD13);
  *(_DWORD *)(v5 - 140) = v3 + 1877625344 + v7;
  *(_DWORD *)(v5 - 120) = v7 + v3 + 1123495865;
  *(_DWORD *)(v5 - 116) = v7;
  *(_QWORD *)(v5 - 136) = v6 - v7;
  *(_QWORD *)(v5 - 128) = v7 ^ 0x295F683D;
  *(_DWORD *)(v5 - 148) = (v3 + 1877625358) ^ v7;
  *(_DWORD *)(v5 - 144) = v7 ^ (v3 + 1877625344) ^ 0x53;
  v9 = sub_1001DFC88(v5 - 152);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(a3 + 8 * *(int *)(v5 - 152)) - 8))(v9);
}

uint64_t sub_1001C0498()
{
  int v0;
  uint32_t v1;

  v0 = LODWORD(STACK[0x34C]) - 1222;
  STACK[0x350] = (unint64_t)malloc_type_malloc(STACK[0x328], 0xC5732911uLL);
  v1 = arc4random();
  *(_DWORD *)&aHAwAwAwAwAwAwA[4] = v1 + 1465998909 - ((v1 << (v0 ^ 0xEB)) & 0xAEC2BC7A);
  *(_DWORD *)&aHAwAwAwAwAwAwA[8] = ((1812433253
                                   * (*(_DWORD *)&aHAwAwAwAwAwAwA[4] ^ 0xB3EBDFF8 ^ ((*(_DWORD *)&aHAwAwAwAwAwAwA[4] >> 30) | 0xE48A81C4))) ^ 0xFBFBFF3D)
                                 + ((-670100790
                                   * (*(_DWORD *)&aHAwAwAwAwAwAwA[4] ^ 0xB3EBDFF8 ^ ((*(_DWORD *)&aHAwAwAwAwAwAwA[4] >> 30) | 0xE48A81C4))) & ((v0 - 833546813) & 0x31AEEAD6 ^ 0xF7F7FCFE))
                                 + 1533370113
                                 - ((2
                                   * (((1812433253
                                      * (*(_DWORD *)&aHAwAwAwAwAwAwA[4] ^ 0xB3EBDFF8 ^ ((*(_DWORD *)&aHAwAwAwAwAwAwA[4] >> 30) | 0xE48A81C4))) ^ 0xFBFBFF3D)
                                    + ((-670100790
                                      * (*(_DWORD *)&aHAwAwAwAwAwAwA[4] ^ 0xB3EBDFF8 ^ ((*(_DWORD *)&aHAwAwAwAwAwAwA[4] >> 30) | 0xE48A81C4))) & ((v0 - 833546813) & 0x31AEEAD6 ^ 0xF7F7FCFE)))
                                   + 134742408) & 0xAEC2BC7A);
  return ((uint64_t (*)(void))((char *)*(&off_100260750 + v0) - 12))();
}

void sub_1001C05D8()
{
  JUMPOUT(0x1001C0568);
}

uint64_t sub_1001C05F4()
{
  int8x16_t v0;
  int v1;
  const float *v2;
  int8x16_t v3;
  int8x16_t v4;
  int8x16_t v5;
  int8x16_t v6;
  int8x16_t v7;
  int32x4_t v8;
  int8x16_t v9;

  v1 = 409 * (LODWORD(STACK[0x34C]) ^ 0x6B3);
  v2 = (const float *)&aHAwAwAwAwAwAwA[4];
  v3 = (int8x16_t)vld1q_dup_f32(v2);
  v4.i64[0] = 0x8000000080000000;
  v4.i64[1] = 0x8000000080000000;
  v0.i64[0] = *(_QWORD *)&aHAwAwAwAwAwAwA[8];
  v0.i32[2] = *(_DWORD *)&aHAwAwAwAwAwAwA[16];
  v5 = vextq_s8(v3, v0, 0xCuLL);
  v6 = v0;
  v6.i32[3] = *(_DWORD *)&aHAwAwAwAwAwAwA[20];
  v7 = veorq_s8(vandq_s8(v6, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu)), (int8x16_t)vdupq_n_s32(0x5B75524Eu));
  v8 = (int32x4_t)veorq_s8((int8x16_t)vsubq_s32((int32x4_t)vandq_s8(v7, (int8x16_t)vdupq_n_s32(0x645C2AB6u)), (int32x4_t)vorrq_s8(v7, (int8x16_t)vdupq_n_s32(0xE45C2AB7))), (int8x16_t)vdupq_n_s32(0x17B7D93Bu));
  v9.i32[0] = *((_DWORD *)&STACK[0x4C8] + ((aHAwAwAwAwAwAwA[8] & 1) == 0));
  v9.i32[1] = *((_DWORD *)&STACK[0x4C8] + (~*(_DWORD *)&aHAwAwAwAwAwAwA[12] & 1));
  v9.i32[2] = *((_DWORD *)&STACK[0x4C8] + (~*(_DWORD *)&aHAwAwAwAwAwAwA[16] & 1));
  v9.i32[3] = *((_DWORD *)&STACK[0x4C8] + (~*(_DWORD *)&aHAwAwAwAwAwAwA[20] & 1));
  *(int8x16_t *)&aHAwAwAwAwAwAwA[4] = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)&aHAwAwAwAwAwAwA[1592], v9), (int8x16_t)vdupq_n_s32(0x79EEFAD2u)), (int8x16_t)vshrq_n_u32((uint32x4_t)vaddq_s32(vaddq_s32((int32x4_t)veorq_s8(vbicq_s8(v4, v5), (int8x16_t)vdupq_n_s32(0x8E0C4A8B)), v8), (int32x4_t)vmvnq_s8(vandq_s8((int8x16_t)vaddq_s32(v8, v8), (int8x16_t)vdupq_n_s32(0x1C189514u)))), 1uLL));
  return ((uint64_t (*)(void))((char *)*(&off_100260750 + (v1 ^ 0x2D7)) - 8))();
}

uint64_t sub_1001C100C@<X0>(uint64_t a1@<X3>, uint64_t a2@<X4>, int a3@<W5>, uint64_t a4@<X6>, uint64_t a5@<X7>, int a6@<W8>)
{
  int v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  unsigned int v10;

  v8 = -451793628 - ((v6 & 0x80000000 | 0x6888635C) & (a3 + 6));
  v9 = *(_DWORD *)(a2 + 4 * (v7 + a4 + ((a6 - 1225) | 0xB8u)));
  v10 = (((v9 & 0x7FFFFFFE ^ 0x5B75524E) & 0x645C2AB6) - (v9 & 0x7FFFFFFE ^ 0x5B75524E | 0xE45C2AB7)) ^ 0x17B7D93B;
  *(_DWORD *)(a2 + 4 * (v7 + a4) + 740) = *(_DWORD *)(a2 + 4 * (v7 + a4) + 2328) ^ *((_DWORD *)&STACK[0x4C8]
                                                                                   + ((v9 & 1) == 0)) ^ ((v10 + (v8 & 0x80000000 ^ 0x8E0C4A8B) + (~(2 * v10) | 0xE3E76AEB)) >> 1) ^ 0x79EEFAD2;
  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((31 * (v7 + 1 == a5 + 3)) ^ a6)) - 8))();
}

uint64_t sub_1001C10F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  int v6;
  int8x16_t v7;
  unsigned int v8;
  const float *v9;
  int8x16_t v10;
  uint64_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int8x16_t v16;
  int8x16_t v17;
  int32x4_t v18;
  int8x16_t v19;
  int32x4_t v20;
  int8x16_t v21;

  v8 = (v6 - 1302990607) & 0x4DAA0EF7;
  v9 = (const float *)(a5 + 908);
  v10 = (int8x16_t)vld1q_dup_f32(v9);
  v11 = 4 * v8 + 264;
  v12 = vdupq_n_s32(0xE18AC144);
  v13 = vdupq_n_s32(0x10D826D7u);
  v14.i64[0] = 0x8000000080000000;
  v14.i64[1] = 0x8000000080000000;
  v7.i32[0] = *(_DWORD *)(a5 + 912);
  v7.i32[1] = *(_DWORD *)(a5 + v11);
  v7.i32[2] = *(_DWORD *)(a5 + 920);
  v15 = vextq_s8(v10, v7, 0xCuLL);
  v16 = v7;
  v16.i32[3] = *(_DWORD *)(a5 + 924);
  v17 = (int8x16_t)vaddq_s32((int32x4_t)vandq_s8(v15, v14), v12);
  v18 = (int32x4_t)veorq_s8(vandq_s8(v16, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu)), (int8x16_t)vdupq_n_s32(0x1CB35CF4u));
  v19 = veorq_s8((int8x16_t)vaddq_s32(vsubq_s32((int32x4_t)vorrq_s8((int8x16_t)vaddq_s32(v18, v18), (int8x16_t)vdupq_n_s32(0xA761B6C2)), v18), vdupq_n_s32(0x2C4F249Fu)), (int8x16_t)vdupq_n_s32(0xD070D921));
  v20 = (int32x4_t)veorq_s8((int8x16_t)vaddq_s32(vsubq_s32((int32x4_t)vorrq_s8(v19, (int8x16_t)vdupq_n_s32(0xEF27D928)), (int32x4_t)vorrq_s8(v19, (int8x16_t)v13)), v13), (int8x16_t)vdupq_n_s32(0xA735D9A0));
  v21.i32[0] = *(_DWORD *)(v5 + 4 * ((*(_DWORD *)(a5 + 912) & 1) == 0));
  v21.i32[1] = *(_DWORD *)(v5 + 4 * ((*(_DWORD *)(a5 + v11) & 1) == 0));
  v21.i32[2] = *(_DWORD *)(v5 + 4 * (~*(_DWORD *)(a5 + 920) & 1));
  v21.i32[3] = *(_DWORD *)(v5 + 4 * (~v16.i32[3] & 1));
  *(int8x16_t *)(a5 + 908) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)a5, v21), (int8x16_t)vdupq_n_s32(0x313B0FEDu)), (int8x16_t)vshrq_n_u32((uint32x4_t)vaddq_s32(vsubq_s32((int32x4_t)vorrq_s8((int8x16_t)v20, veorq_s8(v17, (int8x16_t)v12)), (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v20, v20), (int8x16_t)vdupq_n_s32(0x3F4F41E8u))), vdupq_n_s32(0x9FA7A0F4)), 1uLL));
  return ((uint64_t (*)(void))((char *)*(&off_100260750 + (v8 ^ 0x19)) - 12))();
}

void sub_1001C12B0()
{
  JUMPOUT(0x1001C11BCLL);
}

uint64_t sub_1001C12BC@<X0>(int a1@<W8>)
{
  uint64_t v1;
  unsigned int v2;

  v2 = (((((a1 + 135) ^ 0x1FC) + 1498) ^ 0x1B04AD06 ^ ((((8 * ((a1 + 135) ^ 0x1FC) + 2147481934) & *(_DWORD *)&aHAwAwAwAwAwAwA[4] ^ 0xD6173B0) & 0x6B2C2B4E)
                                                     - ((8 * ((a1 + 135) ^ 0x1FC) + 2147481934) & *(_DWORD *)&aHAwAwAwAwAwAwA[4] ^ 0xD6173B0 | 0xEB2C2B4F)))
      - 1) ^ 0x55D7528A;
  *(_DWORD *)&aHAwAwAwAwAwAwA[2496] = *(_DWORD *)&aHAwAwAwAwAwAwA[1588] ^ *((_DWORD *)&STACK[0x4C8]
                                                                          + ((aHAwAwAwAwAwAwA[4] & 1) == 0)) ^ (((((*(_DWORD *)&aHAwAwAwAwAwAwA[2496] & 0x80000000) - 388570880) ^ 0xE8D6E100) + v2 - ((2 * v2) & 0x80946D90) - 1068878136) >> 1) ^ 0x1ECDC4F3;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((1857 * (LODWORD(STACK[0x444]) > 0x26F)) ^ (a1 + 135))) - 4))();
}

uint64_t sub_1001C13BC@<X0>(int a1@<W8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  LODWORD(STACK[0x444]) = 0;
  v2 = LODWORD(STACK[0x444])++;
  dword_100277CE8 = v2 + 73583858;
  v3 = (*(_DWORD *)aHAwAwAwAwAwAwA - 1274634254);
  v4 = 1606104089
     * ((~((v1 - 152) ^ 0x9AF036D0EEA70D4BLL | 0xD7C1FE4EC6377693)
       + (((v1 - 152) ^ 0x9AF036D0EEA70D4BLL) & 0xD7C1FE4EC6377693)) ^ 0x7070CC55A278C619);
  *(_DWORD *)(v1 - 132) = ((a1 + 1651105280) | 0xB) + v4;
  *(_DWORD *)(v1 - 128) = (a1 + 1651105280) ^ v4;
  *(_DWORD *)(v1 - 124) = -1231242094 - v4 + a1;
  *(_QWORD *)(v1 - 120) = 3714451503u - v4;
  *(_QWORD *)(v1 - 152) = v3 + v4;
  *(_DWORD *)(v1 - 140) = v4;
  *(_DWORD *)(v1 - 136) = ((a1 + 1651105280) | 0x43) ^ v4;
  v5 = sub_10013D5F4(v1 - 152);
  return ((uint64_t (*)(uint64_t))((char *)*(&off_100260750 + *(int *)(v1 - 144)) - 12))(v5);
}

uint64_t sub_1001C14DC(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  unsigned int v3;
  int v4;

  if (v2 >= v3)
    v4 = (((LODWORD(STACK[0x34C]) - 1707) | 0x47A) ^ 0x47E) + *(_DWORD *)aHAwAwAwAwAwAwA;
  else
    v4 = 694118461;
  *(_DWORD *)aHAwAwAwAwAwAwA = v4;
  return sub_1001C1650(a1, a2, &off_100260750, STACK[0x2F0], &unk_100215980, byte_10023C000, &unk_10021DE60, 3924581327);
}

uint64_t sub_1001C1650@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, int a6@<W7>, int a7@<W8>)
{
  int v7;
  char v8;
  int v9;
  int v10;
  unsigned int v11;

  v11 = (v7 ^ (((a7 - 943) ^ 0x1D3u) + a6)) >> (((a7 + 81) | 4) + v8 - 19);
  LOBYTE(v11) = (v11 - ((2 * v11) & 0x5A) + 45) ^ 0x37;
  *(_BYTE *)(a2 + (v10 - 85688685)) = v11;
  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * ((252
                                          * (v10
                                           - ((*(unsigned __int8 *)(a3 + ((v10 - 85688685) & 0xFLL)) ^ (91 * ((v10 - 109) & 0xF)) ^ *(unsigned __int8 *)(((v10 - 85688685) & 0xFLL) + a4 + 5) ^ *(unsigned __int8 *)(a5 + ((v10 - 85688685) & 0xFLL))) != v11) != v9)) ^ a7))
                            - 4))();
}

uint64_t sub_1001C16FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  int v4;

  STACK[0x3F0] = STACK[0x310];
  STACK[0x3E8] = v3;
  STACK[0x418] = STACK[0x350];
  return ((uint64_t (*)(void))(*(_QWORD *)(a3 + 8 * (((((v4 - 84) ^ (STACK[0x518] == 0)) & 1) == 0) | v4))
                            - ((v4 - 84) | 0x630u)
                            + 1700))();
}

uint64_t ZyNF2D9(uint64_t a1)
{
  unint64_t v1;
  unsigned int v3;
  char *v4;
  uint64_t v5;
  int v6;

  v1 = 941074649
     * ((((unint64_t)&v3 | 0x6B6B37162FCDE1F4) - ((unint64_t)&v3 & 0x6B6B37162FCDE1F4)) ^ 0x6AEDD0F42F052E90);
  v6 = -804802556 - v1;
  v4 = (char *)&loc_1001DFEFC + v1 - 4;
  v5 = a1;
  sub_1001DFDD8((uint64_t)&v3);
  return v3;
}

uint64_t NAAB(uint64_t a1, int a2)
{
  _QWORD v3[4];
  int v4;
  unsigned int v5;
  _QWORD *v6;
  unsigned int v7;
  uint64_t vars0;

  v3[0] = &loc_10018E0E4;
  v3[1] = a1;
  v4 = a2;
  v5 = (230600693
      * ((-568580562 - ((&vars0 - 32) | 0xDE1C262E) + ((&vars0 - 32) | 0x21E3D9D1)) ^ 0xF3DF5FFA)) ^ 0x54F58F50;
  v6 = v3;
  sub_10018DFF4((uint64_t)&v5);
  return v7;
}

uint64_t qSCskg(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD v8[4];
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  _QWORD *v14;
  unsigned int v15;
  uint64_t vars0;

  v8[0] = &loc_10018E174;
  v8[1] = a1;
  v9 = a3;
  v8[2] = a2;
  v8[3] = a4;
  v10 = a5;
  v11 = a6;
  v12 = a7;
  v13 = (230600693
       * ((((&vars0 - 32) | 0x4099155E) - ((&vars0 - 32) & 0x4099155E)) ^ 0x92A59375)) ^ 0x54F58F50;
  v14 = v8;
  sub_10018DFF4((uint64_t)&v13);
  return v15;
}

void sub_1001C19AC(uint64_t a1)
{
  int v1;
  uint64_t v2;
  char *v3;

  v1 = *(_DWORD *)(a1 + 64) + 1448877107 * (a1 ^ 0x713B1D2A);
  v2 = *(_QWORD *)(a1 + 16);
  v3 = (char *)malloc_type_malloc(0x5400uLL, 0xBDD0132FuLL);
  *(_QWORD *)(v2 - 0x3E93D6427590D1A8) = v3 + 0x5C13350084191667;
  __asm { BR              X8 }
}

uint64_t sub_1001C1AA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  int v14;
  int v15;
  uint64_t v16;
  _BOOL4 v20;

  v16 = *(unsigned int *)(a14 + 80);
  v20 = (_DWORD)v16 - v15 == 2085568946
     || (*(_DWORD *)(a14 + 32) ^ v15) == 2064621751
     || *(_DWORD *)(a14 + 4) - v15 == 1940630634
     || *(_DWORD *)a14 + v15 == 943899293;
  *(_DWORD *)(*(_QWORD *)(a14 + 56) - 0x58405A597B241F58) = 2047018587;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)*(&off_100260750 + ((224 * v20) ^ v14)) - ((215 * (v14 ^ 0x266)) ^ 0x4ABu) + 1570))(v16, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

uint64_t sub_1001C1B5C@<X0>(uint64_t a1@<X0>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _QWORD *a8)
{
  uint64_t v8;
  _BOOL4 v12;

  v8 = a8[5];
  v12 = a8[9] == 0xC2C3062343A3C93
     || a8[6] == 0x511395B3EF1E789
     || v8 == 0x8ED1C57AC03BA80
     || a8[3] == 0x4E36C53A99817805;
  return ((uint64_t (*)(uint64_t, uint64_t))*(&off_100260750 + (((((a2 ^ v12) & 1) == 0) * (a2 ^ 0x64C)) ^ a2)))(a1, v8);
}

uint64_t sub_1001C1BF4@<X0>(int a1@<W8>)
{
  int v1;
  unsigned int v2;

  v1 = 199 * (a1 ^ 0x62A);
  v2 = (v1 - 840246062) ^ 0xCDEADFEE;
  *((_DWORD *)&STACK[0x8D0] + (((194 * v2) & 0x55763F9A) + ((97 * v2) ^ 0x2ABB1FCD) - 716852513) % 0x55C) = -840245266;
  return ((uint64_t (*)(uint64_t))((char *)*(&off_100260750
                                                    + ((1913
                                                      * (((v2 - 840245266 - ((2 * v2 + 2) & 0x9BD5BFDC) + 1) ^ 0xCDEADFE0) > 0x18F)) ^ v1))
                                          - 4))(97);
}

uint64_t sub_1001C237C(uint64_t a1, int a2)
{
  int v2;
  uint64_t v3;

  LODWORD(STACK[0x1570]) = -840245266;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v3
                                                      + 8
                                                      * ((8 * ((v2 ^ 0xCDEADFEF) > 0x19F)) | (16
                                                                                            * ((v2 ^ 0xCDEADFEF) > 0x19F)) | (a2 + 1056)))
                                          - 12))(1979067812);
}

uint64_t sub_1001C2464(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8)
{
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  int v30;
  uint64_t v31;
  unsigned int v32;
  unsigned int v33;
  int v34;
  uint64_t v35;

  v14 = v9 + v8;
  v15 = a7 + v13;
  v16 = (v15 - 1860105850) % 0x190u - 1669107760 + (~(2 * ((v15 - 1860105850) % 0x190u)) | 0xFFFFFC5F) + 1;
  v17 = (((v15 - 1860105850) * (v15 - 1860105850)) ^ 0x67DEE7FF)
      + v12
      + v11
      + ((((v15 - 1860105850) * (v15 - 1860105850)) << ((a2 - 21) ^ 0x71)) & 0xCFBDCFFE);
  v18 = ((((v17 + 1886119219) % 0xFFFF) ^ 0x6D76EFE3) - 1836511203 + ((2 * ((v17 + 1886119219) % 0xFFFF)) & 0x1DFC6))
      % 0x190;
  v19 = a7
      + v13
      - 303071396
      + (((v10 + a8 - 2027623525) * (v10 + a8 - 2027623525)) ^ 0x5E33CCB7)
      + ((2 * (v10 + a8 - 2027623525) * (v10 + a8 - 2027623525)) & 0xBC67996E);
  v20 = 4
      * ((97 * (((2 * ((v12 + v11 - 666186447) % 0x190u)) & 0x15E) + (((v12 + v11 - 666186447) % 0x190u) ^ 0xE553D4AF))
        + 456997981)
       % 0x55C);
  v21 = *(_DWORD *)((char *)&STACK[0x8D0] + v20);
  v22 = 4 * ((97 * (((2 * v18) & 0x1EE) + (v18 ^ 0x6F719AF7)) - 973792491) % 0x55C);
  *(_DWORD *)((char *)&STACK[0x8D0] + v20) = *(_DWORD *)((char *)&STACK[0x8D0] + v22);
  v23 = ((((v19 + 1157479796) % 0xFFFF) ^ 0x7BD7DFF7) - 2077745143 + ((2 * ((v19 + 1157479796) % 0xFFFF)) & 0x1BFEE))
      % 0x190;
  *(_DWORD *)((char *)&STACK[0x8D0] + v22) = v21;
  v24 = 4 * ((((194 * (v16 ^ 0x9C836FD0)) & 0x37EE7C) + ((97 * (v16 ^ 0x9C836FD0)) ^ 0xDEFBF73E) + 553966446) % 0x55C);
  v25 = *(_DWORD *)((char *)&STACK[0x8D0] + v24);
  v26 = 4 * ((((194 * v23) & 0x135FE) + ((97 * v23) ^ 0x53DE9AFF) - 1407043667) % 0x55C);
  *(_DWORD *)((char *)&STACK[0x8D0] + v24) = *(_DWORD *)((char *)&STACK[0x8D0] + v26);
  v27 = (((v14 - 582432868) * (v14 - 582432868)) ^ 0x7B7FEDFB)
      + v10
      + a8
      + ((2 * (v14 - 582432868) * (v14 - 582432868)) & 0xF6FFDBF6);
  *(_DWORD *)((char *)&STACK[0x8D0] + v26) = v25;
  LODWORD(v24) = ((((v27 + 195362209) % 0xFFFF) ^ 0x7C7EBFF9)
                - 2088681465
                + ((2 * ((v27 + 195362209) % 0xFFFF)) & 0x17FF2))
               % 0x190;
  v28 = ((v10 + a8 - 2027623525) % 0x190u - 2045952226 - ((2 * ((v10 + a8 - 2027623525) % 0x190u)) & 0x23C)) ^ 0x860D3F1E;
  LODWORD(v26) = 97 * v28;
  v29 = (97 * v28) ^ 0xFBF3B3CD;
  v28 *= 194;
  v30 = *((_DWORD *)&STACK[0x8D0] + ((v28 & 0x1E7679A) + v29 + 67968735) % 0x55C);
  v31 = 4 * ((((194 * (_DWORD)v24) & 0xEFF8) + ((97 * (_DWORD)v24) ^ 0x9FF377FC) + 1611487920) % 0x55C);
  *((_DWORD *)&STACK[0x8D0] + ((v28 & 0x1B9F6FE) + (v26 ^ 0xBBDCFB7F) + 1143199533) % 0x55C) = *(_DWORD *)((char *)&STACK[0x8D0] + v31);
  *(_DWORD *)((char *)&STACK[0x8D0] + v31) = v30;
  LODWORD(v20) = ((v14 - 582432868) % 0x190u - 809361142 - ((2 * ((v14 - 582432868) % 0x190u)) & 0x214)) ^ 0xCFC2210A;
  v32 = (v14
       + (((v17 + 1886119219) * (v17 + 1886119219)) ^ 0x77D7BFEB)
       + ((2 * (v17 + 1886119219) * (v17 + 1886119219)) & 0xEFAF7FD6)
       + 1701906354)
      % 0xFFFF;
  v33 = ((v32 ^ 0x77E557F9) - 2011518969 + ((2 * v32) & 0xAFF2)) % 0x190;
  v34 = (v33 + 1884049702 - ((2 * v33) & 0x24C)) ^ 0x704C5126;
  v35 = 4 * ((((194 * v34) & 0x1F517E) + ((97 * v34) ^ 0x5FFFA8BFu) - 1610536467) % 0x55C);
  LODWORD(v31) = *((_DWORD *)&STACK[0x8D0]
                 + (((194 * (_DWORD)v20) & 0x376DF2) + ((97 * (_DWORD)v20) ^ 0x7BFBB6F9u) - 2080040013) % 0x55C);
  *((_DWORD *)&STACK[0x8D0] + (((194 * (_DWORD)v20) & 0x2FB974) + ((97 * (_DWORD)v20) ^ 0xEF57DCBA) + 279508466) % 0x55C) = *(_DWORD *)((char *)&STACK[0x8D0] + v35);
  *(_DWORD *)((char *)&STACK[0x8D0] + v35) = v31;
  return ((uint64_t (*)(void))((char *)*(&off_100260750 + a2 - 365) - 12))();
}

void sub_1001C2A40()
{
  JUMPOUT(0x1001C24C0);
}

uint64_t sub_1001C2A74@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  int v3;
  unsigned int v4;

  v4 = *((_DWORD *)&STACK[0x8D0]
       + (((194 * (a1 ^ 0xCDEADFEE)) & 0xFFBFDEFE)
        + 2155309
        + ((97 * (a1 ^ 0xCDEADFEE)) ^ (809 * (v3 ^ 0x672) - 2102995)))
       % 0x55C) ^ 0xCDEADFEE;
  *((_DWORD *)&STACK[0x8D0] + (((194 * v4) & 0xA9E6AF6E) + ((97 * v4) ^ 0xD4F357B7) + 722342533) % 0x55C) = a1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((140
                                          * ((((a1 ^ 0xCDEADFEE)
                                             - 840245266
                                             - ((2 * (a1 ^ 0xCDEADFEE) + 2) & 0x9BD5BFDC)
                                             + 1) ^ v1) < 0x190)) ^ v3))
                            - 12))();
}

uint64_t sub_1001C2B78(uint64_t a1, uint64_t a2, unsigned int a3, int a4, uint64_t a5)
{
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t (*v16)(void);

  v11 = 4
      * (v8 * v7
       - 1212914617
       - ((((v8 * v7 - 1212914617) * (unint64_t)a3) >> 32) >> 10) * a4);
  v12 = dword_10021ECB0[(((2722 * (*(_DWORD *)(a5 + v11) ^ v6)) & 0xBAF77F7C)
                       + ((1361 * (*(_DWORD *)(a5 + v11) ^ v6)) ^ 0x5D7BBFBE)
                       - 1568041325)
                      % 0x12E0] ^ 0xB7AE8AB6;
  v13 = v12 * v10 - 790419061 - ((-2114329278 * v12) & 0xA1C65316);
  v14 = 8 * ((v13 ^ 0xD0E3298B) * (v13 ^ 0xD0E3298B) - ((2 * (v13 ^ 0xD0E3298B) * (v13 ^ 0xD0E3298B)) & 0x1693E18A));
  v15 = v13 ^ 0x97853DB8 ^ (((v14 - 632322520) ^ 0xDA4F8628)
                          + 969164811
                          - 2 * (((v14 - 632322520) ^ 0xDA4F8628) & 0x39C44818 ^ ((_BYTE)v14 - 88) & 0x10));
  v16 = (uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * (((2 * (v8 != 2049294244)) | (32 * (v8 != 2049294244))) ^ v5)) - 12);
  *(_DWORD *)(a5 + v11) = v15;
  return v16();
}

uint64_t sub_1001C2CC8@<X0>(int a1@<W1>, uint64_t a2@<X7>, int a3@<W8>)
{
  int v3;
  int v4;
  unsigned int v5;
  int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  int v13;
  uint64_t (*v14)(void);

  v9 = (((v6 - 1535481858) ^ 0xE) - 2044738605 - ((((v3 - 594) | 0x28A) ^ 0xC3F812C) & (2 * ((v6 - 1535481858) ^ 0xE)))) ^ 0x861FC3D3;
  v10 = ((v9 * v4) & 0xF9F67FDE) + ((v9 * a3) ^ 0xFCFB3FEF) + 50992738;
  v11 = *(_DWORD *)(a2 + 4 * (v10 - (((v10 * (unint64_t)v5) >> 32) >> 10) * a1)) ^ 0xB7AE8AB6;
  v12 = v11 * v8 + 1064432081 - ((33154370 * v11) & 0x7EE3E3A2);
  v13 = (8 * ((v12 ^ 0x3F71F1D1) * (v12 ^ 0x3F71F1D1) - ((2 * (v12 ^ 0x3F71F1D1) * (v12 ^ 0x3F71F1D1)) & 0x27C2C12))
       + 166768712) ^ 0x9F0B048;
  v14 = (uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((242 * (v6 == 1535482273)) ^ v3)) - 12);
  *((_DWORD *)&STACK[0x8D0] + (97 * v6 + 1382207866) % 0x55Cu) = v12 ^ 0xA1440AF6 ^ (v13
                                                                                   - ((2 * v13) & 0xC12F4E30)
                                                                                   - 526932193);
  return v14();
}

uint64_t sub_1001C2E38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _QWORD *a64;
  uint64_t v64;
  int v65;
  uint64_t v66;
  int v67;

  v67 = (((v65 - 1658332939) & 0x62D821CA)
       + (((v64 + 268320724) * (v64 + 458225857)) ^ 0xEFF2FEBF)
       + ((2 * (v64 + 268320724) * (v64 + 458225857)) & 0xDFE5FD7E)
       - 1546677728)
      * (v64 + 458225857);
  *(_DWORD *)(*a64 + 4 * (v64 + 2085868788) - 0x5C13350208288733) = ((2 * v67) & 0xE2FDCAFE)
                                                                                    + (v67 ^ 0xF17EE57F)
                                                                                    - ((2
                                                                                      * (((2 * v67) & 0xE2FDCAFE)
                                                                                       + (v67 ^ 0xF17EE57F))
                                                                                      - 437902512) & 0x9BD5BFDC)
                                                                                    + 1088287126;
  return ((uint64_t (*)(void))(*(_QWORD *)(v66 + 8 * ((19 * (v64 == 3836746814)) ^ v65)) - 4))();
}

uint64_t sub_1001C2F38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,int a61,int a62,uint64_t a63)
{
  int a64;
  unsigned int v64;
  uint64_t v65;
  _BYTE *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  BOOL v72;

  v66 = malloc_type_malloc((HIDWORD(a11) + a13 + a12 - ((2 * (HIDWORD(a11) + a13 + a12) + 703259226) & 0x5A200EA0) + 1107654781) ^ 0xAD100750, 0x100004077774924uLL);
  v72 = (a12 + 2006160853) < 0xEB3F423F;
  v66[a62 + HIDWORD(a11) - a64 + 144776599] = *(_BYTE *)(a60 - 0x8ED1C57AC03BA80);
  if ((a12 + 2006160853) >= 0xEB3F423F)
    v72 = (a12 + 2006160853) > 0xEB3F4240;
  return ((uint64_t (*)(_BYTE *, uint64_t, _QWORD, uint64_t, uint64_t, _BYTE *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v65 + 8 * ((1229 * (((-41 * (v64 ^ 0x49)) ^ v72) & 1)) ^ v64)) - 12))(v66, v67, HIDWORD(a11), v68, v69, v66, v70, v71, a9, a10, a11);
}

void sub_1001C3080()
{
  JUMPOUT(0x1001C301CLL);
}

uint64_t sub_1001C308C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62)
{
  int v62;
  uint64_t v63;
  _BOOL4 v64;

  v64 = (a13 + 1779884717) < 0xE666245F;
  *(_BYTE *)(a6 + (a3 - 2064621751)) = *(_BYTE *)(a62 - 0xC2C3062343A3C93);
  if ((a13 + 1779884717) >= 0xE666245F)
    v64 = (a13 + 1779884717) > 0xE6662460;
  return (*(uint64_t (**)(void))(v63 + 8 * ((62 * v64) ^ (v62 + 840))))();
}

void sub_1001C3144()
{
  JUMPOUT(0x1001C30E8);
}

uint64_t sub_1001C3150(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  _BOOL4 v67;
  _BOOL4 v68;

  v65 = 347 * (v63 ^ 0x287u);
  v66 = v63 - 118;
  v67 = (a3 - 2035463796) < 0x1BCEA43;
  *(_BYTE *)(a6 + (v65 ^ 0x8C1B7690712DB853) + 0x73E4896F8ED2451BLL) = *(_BYTE *)(a63
                                                                                  - 0x511395B3EF1E789
                                                                                  + (v65 ^ 0x8C1B7690712DB853)
                                                                                  + 0x73E4896F8ED2451BLL)
                                                                       - ((2
                                                                         * *(_BYTE *)(a63
                                                                                    - 0x511395B3EF1E789
                                                                                    + (v65 ^ 0x8C1B7690712DB853)
                                                                                    + 0x73E4896F8ED2451BLL)) & 0x6A)
                                                                       + 53;
  v68 = (a3 - 2035463796) > 0x1BCEA44;
  if (!v67)
    v67 = v68;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v64 + 8 * ((1227 * !v67) ^ v66)) - 8))(1469728142);
}

void sub_1001C324C()
{
  JUMPOUT(0x1001C31DCLL);
}

uint64_t sub_1001C3254@<X0>(int a1@<W8>)
{
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v3
                                                               + 8
                                                               * ((((v2 ^ (v1 - 16)) > ((a1 + 709) ^ 0x494A2838u) - 1229597988)
                                                                 * (10 * ((a1 + 709) ^ 0x524) - 697)) ^ (a1 + 709)))
                                                   - 12))(53, 53);
}

uint64_t sub_1001C3440(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,int a60,int a61,int a62,int a63)
{
  int a64;
  int a66;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int v76;
  unsigned int v77;
  unsigned int v78;
  int v79;
  unsigned int v80;
  int v81;
  unsigned int v82;
  unsigned int v83;
  unsigned int v84;
  unsigned int v85;
  unsigned int v86;
  unsigned int v87;
  int v88;
  unsigned int v89;
  int v90;
  unsigned int v91;
  unsigned int v92;
  unsigned int v93;
  int v94;
  int v95;
  unsigned int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  unsigned int v102;
  unsigned int v103;
  int v104;
  int v105;
  unsigned int v106;
  unsigned int v107;
  unsigned int v108;
  unsigned int v109;
  unsigned int v110;
  unsigned int v111;
  unsigned int v112;
  unsigned int v113;
  int v114;
  unsigned int v115;
  unsigned int v116;
  int v117;
  unsigned int v118;
  int v119;
  int v120;
  unsigned int v121;
  unsigned int v122;
  int v123;
  unsigned int v124;
  int v125;
  unsigned int v126;
  unsigned int v127;
  unint64_t v128;
  int v129;
  unsigned int v130;
  int v131;
  int v132;
  int v133;
  unsigned int v134;
  unsigned int v135;
  int v136;
  unsigned int v137;
  unsigned int v138;
  int v139;
  unsigned int v140;
  unsigned int v141;
  int v142;
  int v143;
  int v144;
  unsigned int v145;
  int v146;
  unsigned int v147;
  unsigned int v148;
  int v149;
  int v150;
  int v151;
  unsigned int v152;
  unsigned int v153;
  unsigned int v154;
  int v155;
  unsigned int v156;
  unsigned int v157;
  int v158;
  unsigned int v159;
  int v160;
  unsigned int v161;
  int v162;
  unsigned int v163;
  unsigned int v164;
  unsigned int v165;
  int v166;
  int v167;
  unsigned int v168;
  int v169;
  unsigned int v170;
  unsigned int v171;
  int v172;
  int v173;
  unsigned int v174;
  unsigned int v175;
  unsigned int v176;
  unsigned int v177;
  unsigned int v178;
  unsigned int v179;
  int v180;
  int v181;
  int v182;
  int v183;
  unsigned int v184;
  int v185;
  int v186;
  int v187;
  unsigned int v188;
  unsigned int v189;
  unsigned int v190;
  unsigned int v191;
  unsigned int v192;
  unsigned int v193;
  unsigned int v194;
  int v195;
  int v196;
  unsigned int v197;
  int v198;
  unsigned int v199;
  unsigned int v200;
  unsigned int v201;
  int v202;
  int v203;
  unsigned int v204;
  int v205;
  unsigned int v206;
  unsigned int v207;
  int v208;
  int v209;
  int v210;
  int v211;
  int v212;
  unsigned int v213;
  int v214;
  unsigned int v215;
  unsigned int v216;
  unsigned int v217;
  int v218;
  int v219;
  int v220;
  int v221;
  unsigned int v222;
  unsigned int v223;
  unsigned int v224;
  unsigned int v225;
  int v226;
  unsigned int v227;
  int v228;
  int v229;
  int v230;
  int v231;
  int v232;
  unsigned int v233;
  int v234;
  int v235;
  unsigned int v236;
  int v237;
  int v238;
  int v239;
  unsigned int v240;
  int v241;
  unsigned int v242;
  int v243;
  int v244;
  unsigned int v245;
  int v246;
  int v247;
  int v248;
  unsigned int v249;
  unsigned int v250;
  int v251;
  int v252;
  unsigned int v253;
  int v254;
  int v255;
  unsigned int v256;
  int v257;
  int v258;
  int v259;
  unsigned int v260;
  int v261;
  unsigned int v262;
  int v263;
  unsigned int v264;
  int v265;
  int v266;
  int v267;
  int v268;
  int v269;
  int v270;
  int v271;
  unsigned int v272;
  int v273;
  unsigned int v274;
  int v275;
  unsigned int v276;
  unsigned int v277;
  unsigned int v278;
  int v279;
  int v280;
  unsigned int v281;
  int v282;
  unsigned int v283;
  int v284;
  unsigned int v285;
  unsigned int v286;
  unsigned int v287;
  int v288;
  int v289;
  unsigned int v290;
  unsigned int v291;
  unsigned int v292;
  unsigned int v293;
  int v294;
  int v295;
  unsigned int v296;
  int v297;
  int v298;
  unsigned int v299;
  unsigned int v300;
  int v301;
  int v302;
  int v303;
  int v304;
  int v305;
  unsigned int v306;
  int v307;
  int v308;
  unsigned int v309;
  int v310;
  unsigned int v311;
  unsigned int v312;
  int v313;
  int v314;
  unsigned int v315;
  int v316;
  int v317;
  int v318;
  unsigned int v319;
  int v320;
  unsigned int v321;
  int v322;
  unsigned int v323;
  int v324;
  unsigned int v325;
  unsigned int v326;
  unsigned int v327;
  int v328;
  unsigned int v329;
  unsigned int v330;
  unsigned int v331;
  int v332;
  unsigned int v333;
  unsigned int v334;
  unsigned int v335;
  int v336;
  int v337;
  unsigned int v338;
  unsigned int v339;
  int v340;
  int v341;
  int v342;
  int v343;
  unsigned int v344;
  unsigned int v345;
  int v346;
  unsigned int v347;
  int v348;
  unsigned int v349;
  unsigned int v350;
  int v351;
  int v352;
  int v353;
  int v354;
  unsigned int v355;
  int v356;
  unsigned int v357;
  unsigned int v358;
  unsigned int v359;
  unsigned int v360;
  unsigned int v361;
  unsigned int v362;
  int v363;
  unsigned int v364;
  int v365;
  unsigned int v366;
  unsigned int v367;
  int v368;
  unsigned int v369;
  unsigned int v370;
  int v371;
  int v372;
  int v373;
  int v374;
  unsigned int v375;
  int v376;
  unsigned int v377;
  int v378;
  int v379;
  unsigned int v380;
  int v381;
  unsigned int v382;
  unsigned int v383;
  int v384;
  int v385;
  int v386;
  int v387;
  unsigned int v388;
  unsigned int v389;
  int v390;
  int v391;
  int v392;
  int v393;
  int v394;
  unsigned int v395;
  unsigned int v396;
  unsigned int v397;
  int v398;
  unsigned int v399;
  unsigned int v400;
  unsigned int v401;
  int v402;
  int v403;
  int v404;
  unsigned int v405;
  unsigned int v406;
  unsigned int v407;
  unsigned int v408;
  unsigned int v409;
  int v410;
  unsigned int v411;
  int v412;
  unsigned int v413;
  unsigned int v414;
  int v415;
  int v416;
  unsigned int v417;
  int v418;
  int v419;
  unsigned int v420;
  int v421;
  int v422;
  int v423;
  int v424;
  int v425;
  int v426;
  unsigned int v427;
  unsigned int v428;
  int v429;
  unsigned int v430;
  unsigned int v431;
  int v432;
  unsigned int v433;
  unsigned int v434;
  unsigned int v435;
  int v436;
  unsigned int v437;
  int v438;
  int v439;
  int v440;
  unsigned int v441;
  int v442;
  int v443;
  int v444;
  unsigned int v445;
  unsigned int v446;
  int v447;
  int v448;
  unsigned int v449;
  int v450;
  unsigned int v451;
  int v452;
  int v453;
  unsigned int v454;
  int v455;
  unsigned int v456;
  int v457;
  int v458;
  int v459;
  int v460;
  int v461;
  unsigned int v462;
  unsigned int v463;
  unsigned int v464;
  int v465;
  unsigned int v466;
  unsigned int v467;
  int v468;
  unsigned int v469;
  int v470;
  int v471;
  int v472;
  int v473;
  int v474;
  unsigned int v475;
  int v476;
  int v477;
  unsigned int v478;
  int v479;
  unsigned int v480;
  int v481;
  int v482;
  int v483;
  unsigned int v484;
  unsigned int v485;
  int v486;
  int v487;
  unsigned int v488;
  int v489;
  int v490;
  unsigned int v491;
  unsigned int v492;
  int v493;
  int v494;
  int v495;
  unsigned int v496;
  unsigned int v497;
  unsigned int v498;
  int v499;
  unsigned int v500;
  unsigned int v501;
  int v502;
  int v503;
  int v504;
  int v505;
  int v506;
  int v507;
  int v508;
  int v509;
  unsigned int v510;
  unsigned int v511;
  unsigned int v512;
  unsigned int v513;
  int v514;
  int v515;
  int v516;
  int v517;
  int v518;
  unsigned int v519;
  int v520;
  int v521;
  int v522;
  int v523;
  int v524;
  unsigned int v525;
  unsigned int v526;
  unsigned int v527;
  unsigned int v528;
  unsigned int v529;
  int v530;
  unsigned int v531;
  unsigned int v532;
  unsigned int v533;
  int v534;
  int v535;
  unsigned int v536;
  unsigned int v537;
  unsigned int v538;
  int v539;
  int v540;
  int v541;
  int v542;
  unsigned int v543;
  int v544;
  int v545;
  int v546;
  unsigned int v547;
  unsigned int v548;
  int v549;
  unsigned int v550;
  int v551;
  unsigned int v552;
  int v553;
  int v554;
  int v555;
  int v556;
  int v557;
  int v558;
  int v559;
  int v560;
  unsigned int v561;
  unsigned int v562;
  unsigned int v563;
  int v564;
  unsigned int v565;
  int v566;
  int v567;
  unsigned int v568;
  int v569;
  int v570;
  int v571;
  int v572;
  unsigned int v573;
  int v574;
  int v575;
  int v576;
  int v577;
  unsigned int v578;
  unsigned int v579;
  unsigned int v580;
  int v581;
  int v582;
  int v583;
  int v584;
  unsigned int v585;
  unsigned int v586;
  unsigned int v587;
  int v588;
  int v589;
  int v590;
  unsigned int v591;
  int v592;
  int v593;
  unsigned int v594;
  unsigned int v595;
  int v596;
  unsigned int v597;
  int v598;
  int v599;
  unsigned int v600;
  int v601;
  unsigned int v602;
  int v603;
  int v604;
  int v605;
  int v606;
  int v607;
  int v608;
  unsigned int v609;
  int v610;
  int v611;
  unsigned int v612;
  unsigned int v613;
  unsigned int v614;
  int v615;
  int v616;
  int v617;
  unsigned int v618;
  int v619;
  unsigned int v620;
  unsigned int v621;
  int v622;
  int v623;
  int v624;
  int v625;
  int v626;
  int v627;
  int v628;
  unsigned int v629;
  int v630;
  int v631;
  int v632;
  int v633;
  int v634;
  int v635;
  unsigned int v636;
  int v637;
  int v638;
  unsigned int v639;
  int v640;
  int v641;
  int v642;
  unsigned int v643;
  unsigned int v644;
  unsigned int v645;
  unsigned int v646;
  int v647;
  int v648;
  int v649;
  int v650;
  unsigned int v651;
  int v652;
  unsigned int v653;
  unsigned int v654;
  int v655;
  unsigned int v656;
  unsigned int v657;
  int v658;
  unsigned int v659;
  unsigned int v660;
  int v661;
  unsigned int v662;
  int v663;
  unsigned int v664;
  int v665;
  unsigned int v666;
  int v667;
  int v668;
  int v669;
  unsigned int v670;
  unsigned int v671;
  int v672;
  unsigned int v673;
  int v674;
  int v675;
  int v676;
  unsigned int v677;
  int v678;
  unsigned int v679;
  int v680;
  unsigned int v681;
  int v682;
  int v683;
  unsigned int v684;
  int v685;
  int v686;
  unsigned int v687;
  int v688;
  int v689;
  int v690;
  unsigned int v691;
  int v692;
  int v693;
  int v694;
  int v695;
  int v696;
  int v697;
  unsigned int v698;
  int v699;
  int v700;
  int v701;
  unsigned int v702;
  unsigned int v703;
  int v704;
  unsigned int v705;
  unsigned int v706;
  int v707;
  int v708;
  int v709;
  unsigned int v710;
  unsigned int v711;
  int v712;
  int v713;
  int v714;
  int v715;
  unsigned int v716;
  unsigned int v717;
  unsigned int v718;
  unsigned int v719;
  unsigned int v720;
  unsigned int v721;
  int v722;
  unsigned int v723;
  int v724;
  int v725;
  unsigned int v726;
  int v727;
  unsigned int v728;
  int v729;
  int v730;
  unsigned int v731;
  int v732;
  int v733;
  int v734;
  int v735;
  unsigned int v736;
  unsigned int v737;
  unsigned int v738;
  unsigned int v739;
  unsigned int v740;
  unsigned int v741;
  int v742;
  int v743;
  int v744;
  int v745;
  int v746;
  int v747;
  unsigned int v748;
  unsigned int v749;
  unsigned int v750;
  unsigned int v751;
  unsigned int v752;
  int v753;
  unsigned int v754;
  unsigned int v755;
  unsigned int v756;
  int v757;
  int v758;
  int v759;
  unsigned int v760;
  int v761;
  unsigned int v762;
  unsigned int v763;
  int v764;
  unsigned int v765;
  int v766;
  unsigned int v767;
  unsigned int v768;
  int v769;
  unsigned int v770;
  unsigned int v771;
  int v772;
  int v773;
  int v774;
  unsigned int v775;
  int v776;
  unsigned int v777;
  int v778;
  int v779;
  int v780;
  int v781;
  unsigned int v782;
  unsigned int v783;
  int v784;
  unsigned int v785;
  unsigned int v786;
  unsigned int v787;
  unsigned int v788;
  unsigned int v789;
  int v790;
  int v791;
  unsigned int v792;
  int v793;
  int v794;
  int v795;
  unsigned int v796;
  unsigned int v797;
  int v798;
  unsigned int v799;
  int v800;
  unsigned int v801;
  int v802;
  int v803;
  unsigned int v804;
  int v805;
  unsigned int v806;
  int v807;
  int v808;
  int v809;
  int v810;
  unsigned int v811;
  int v812;
  int v813;
  unsigned int v814;
  unsigned int v815;
  int v816;
  unsigned int v817;
  int v818;
  int v819;
  int v820;
  int v821;
  int v822;
  int v823;
  unsigned int v824;
  int v825;
  unsigned int v826;
  int v827;
  unsigned int v828;
  unsigned int v829;
  int v830;
  uint64_t v832;
  uint64_t v833;
  uint64_t v834;
  unint64_t v835;
  unint64_t v836;
  unint64_t v837;
  uint64_t v838;
  unint64_t v839;
  uint64_t v840;
  int v841;
  uint64_t v842;
  unsigned int v843;
  uint64_t v844;
  int v845;
  uint64_t v846;
  unsigned int v847;
  unint64_t v848;
  unint64_t v849;
  uint64_t v850;
  uint64_t v851;
  unint64_t v852;
  unint64_t v853;
  int v854;
  unint64_t v855;
  uint64_t v856;
  int v857;
  uint64_t v858;
  unint64_t v859;
  uint64_t v860;
  uint64_t v861;
  uint64_t v862;
  unint64_t v863;
  int v864;
  uint64_t v865;
  unsigned int v866;
  uint64_t v867;
  int v868;
  unsigned int v869;
  unint64_t v870;
  unsigned int v871;
  unsigned int v872;
  int v873;
  int v874;
  int v875;
  int v876;
  int v877;
  unsigned __int8 v878;
  int v879;
  int v880;
  int v881;

  HIDWORD(v860) = v67;
  HIDWORD(v862) = *(unsigned __int8 *)(a6 + (a20 - 1755578127));
  v71 = (v66 - 44108220) & 0x6FFBD73F;
  v72 = ((((a20 - 1755578127) ^ 1) - 312041437 + (~(2 * ((a20 - 1755578127) ^ 1)) | 0x2532BFB9) + 1) ^ 0xED66A023)
      + ((v71 - 1834668344) & (2 * a20))
      + ((2 * ((v71 - 1834668344) & (2 * a20))) ^ 4)
      - 2;
  v73 = ((2 * v72) & 0xBDFE77D6) + (v72 ^ 0x5EFF3BEB);
  v879 = *(unsigned __int8 *)(a6 + v73 - 1593785322);
  v880 = *(unsigned __int8 *)(a6 + v73 - 1593785321);
  v74 = *(unsigned __int8 *)(a6 + v73 - 1593785320);
  v75 = *(unsigned __int8 *)(a6 + v73 - 1593785319);
  v877 = *(unsigned __int8 *)(a6 + v73 - 1593785318);
  v878 = *(_BYTE *)(a6 + v73 - 1593785317);
  v76 = *(unsigned __int8 *)(a6 + v73 - 1593785316);
  v77 = *(unsigned __int8 *)(a6 + v73 - 1593785315);
  v78 = *(unsigned __int8 *)(a6 + v73 - 1593785314);
  LODWORD(v861) = v68 + (v70 ^ v68) - 2 * (((v70 ^ v68) + 1073741792) & 0x2D10075E ^ v70 & 0xE) - 32;
  LODWORD(v862) = *(unsigned __int8 *)(a6 + v73 - 1593785313);
  v79 = *(unsigned __int8 *)(a6 + v73 - 1593785312);
  v80 = *(unsigned __int8 *)(a6 + v73 - 1593785311);
  v81 = *(unsigned __int8 *)(a6 + v73 - 1593785310);
  v875 = *(unsigned __int8 *)(a6 + v73 - 1593785309);
  v82 = *(unsigned __int8 *)(a6 + v73 - 1593785308);
  v83 = *(unsigned __int8 *)(a6 + v73 - 1593785307);
  v84 = *(unsigned __int8 *)(a6 + v73 - 1593785306);
  v85 = *(unsigned __int8 *)(a6 + v73 - 1593785305);
  v86 = *(unsigned __int8 *)(a6 + v73 - 1593785304);
  v874 = *(unsigned __int8 *)(a6 + v73 - 1593785303);
  v876 = *(unsigned __int8 *)(a6 + v73 - 1593785302);
  v873 = *(unsigned __int8 *)(a6 + v73 - 1593785301);
  v87 = *(unsigned __int8 *)(a6 + v73 - 1593785294);
  HIDWORD(v861) = *(unsigned __int8 *)(a6 + v73 - 1593785323);
  v88 = *(unsigned __int8 *)(a6 + v73 - 1593785293);
  LODWORD(v832) = v73 + 161792835;
  HIDWORD(v833) = *(unsigned __int8 *)(a6 + v73 - 1593785300);
  LODWORD(v858) = (v71 - 739297337) | 0x8002444;
  HIDWORD(v834) = *(unsigned __int8 *)(a6 + v73 - 1593785299);
  v89 = ((((v858 ^ 0x494A24FE)
         + (BYTE4(v833) ^ v69)
         - ((2 * (HIDWORD(v833) ^ v69)) & 0x16A)) << 16)
       - 393216) ^ 0x9B50000;
  v90 = ((((BYTE4(v834) ^ v69) + 2943308 - ((2 * (HIDWORD(v834) ^ v69)) & 0x5C)) << 8) - 7680) ^ 0x2CE92E00;
  LODWORD(v838) = *(unsigned __int8 *)(a6 + v73 - 1593785296);
  v91 = (v89 + 1371031689 - ((2 * v89) & 0x23700000)) ^ 0x51B84889 | (v90 - 1567651594 - ((2 * v90) & 0x451F1000)) ^ 0xA28F88F6;
  v92 = v91 - 2106260844 - ((2 * v91) & 0x4EA0528);
  HIDWORD(v832) = *(unsigned __int8 *)(a6 + v73 - 1593785298);
  v93 = v92 ^ 0x82750294 | ((BYTE4(v832) ^ v69) - 389958789 - ((2 * (HIDWORD(v832) ^ v69)) & 0xF6)) ^ 0xE8C1B37B;
  v872 = v93 - ((2 * v93) & 0xF1BA709E) + 2027763791;
  HIDWORD(v838) = *(unsigned __int8 *)(a6 + v73 - 1593785295);
  v94 = (BYTE4(v838) ^ v69) - ((2 * (HIDWORD(v838) ^ v69)) & 0x15A);
  LODWORD(v833) = *(unsigned __int8 *)(a6 + v73 - 1593785297);
  v95 = (v833 ^ v69) + 1161098812 - ((2 * (v833 ^ v69)) & 0x78);
  v96 = (((v872 << 8) ^ 0xDD384F00) + 1169129742 - ((2 * ((v872 << 8) ^ 0xDD384F00)) & 0x8B5F0200)) ^ 0x45AF810E | v95 ^ 0x4534F63C;
  v97 = v96 - 1084912426 - ((2 * v96) & 0x7EAB19AC);
  v835 = __PAIR64__(v84, v82);
  v98 = (v82 ^ v69) - ((2 * (v82 ^ v69)) & 0x15A);
  v839 = __PAIR64__(v87, v76);
  v837 = __PAIR64__(v77, v74);
  v99 = (v77 ^ v69) - ((2 * (v77 ^ v69)) & 0x2C);
  v100 = (v74 ^ v69) - ((2 * (v74 ^ v69)) & 0x1F0);
  v101 = ((((v76 ^ v69) - ((2 * (v76 ^ v69)) & 0x8E)) << 16) + 289865728) ^ 0x11470000;
  v102 = (v101 + 730830994 - ((2 * v101) & 0x571E0000)) ^ 0x2B8F9892 | ((((v99 << 8) - 670034432) ^ 0xD8101600)
                                                                      - 420801044
                                                                      - ((2 * (((v99 << 8) - 670034432) ^ 0xD8101600)) & 0x4DD62A00)) ^ 0xE6EB15EC;
  v103 = v102 - 333420215 - ((2 * v102) & 0x5840D292);
  LODWORD(v834) = v79;
  v104 = (v79 ^ v69) - ((2 * (v79 ^ v69)) & 0x19E);
  v105 = ((((v83 ^ v69) - ((2 * (v83 ^ v69)) & 0x15E)) << 8) + 2041097984) ^ 0x79A8AF00;
  v106 = ((((v98 << 16) + 229441536) ^ 0xDAD0000)
        - 1642230756
        - ((2 * (((v98 << 16) + 229441536) ^ 0xDAD0000)) & 0x3C3A0000)) ^ 0x9E1D8C1C | (v105
                                                                                      - 1981487533
                                                                                      - ((2 * v105) & 0x13C9CC00)) ^ 0x89E4E653;
  v871 = v106 - 82145385 - ((2 * v106) & 0x76351F2E);
  v107 = v871 ^ 0xFB1A8F97 | ((v84 ^ v69) - 1668944810 - ((2 * (v84 ^ v69)) & 0xAC)) ^ 0x9C85EC56;
  v108 = (((v838 ^ v69) - ((2 * (v838 ^ v69)) & 0x60)) << 16) + 573571072;
  v109 = ((((v94 << 8) - 1090409216) ^ 0xBF01AD00)
        - 495093611
        - ((2 * (((v94 << 8) - 1090409216) ^ 0xBF01AD00)) & 0x44FAF000)) ^ 0xE27D7895 | ((v108 ^ 0x22300000)
                                                                                       - 926575216
                                                                                       - ((2 * v108) & 0x118A0000)) ^ 0xC8C59590;
  v866 = v109 + 1877118556 - ((2 * v109) & 0x5FC51CB8);
  v110 = v866 ^ 0x6FE28E5C | ((v87 ^ v69) - 248597445 - ((2 * (v87 ^ v69)) & 0x76)) ^ 0xF12EB43B;
  LODWORD(a44) = v110 - ((2 * v110) & 0x4504537A) + 578955709;
  v111 = (((v107 - ((2 * v107) & 0xBB98E2)) << 8) - 573804288) ^ 0xDDCC7100;
  v836 = __PAIR64__(v83, v80);
  v863 = __PAIR64__(v86, v85);
  v868 = (v85 ^ v69) - 1599528582 - ((2 * (v85 ^ v69)) & 0xF4);
  v112 = (v111 + 134708267 - ((2 * v111) & 0x100EF800)) ^ 0x8077C2B | v868 ^ 0xA0A9217A;
  v113 = v112 - 45500119 - ((2 * v112) & 0xFA937252);
  v859 = __PAIR64__(v78, v75);
  v114 = (v75 ^ v69) - ((2 * (v75 ^ v69)) & 0x1CC);
  v115 = (v86 ^ v69) - ((2 * (v86 ^ v69)) & 0xFFFFFFF3);
  v116 = (((v97 << 15) ^ 0xC66B0000) - 1891050501 - ((2 * ((v97 << 15) ^ 0xC66B0000)) & 0x1E910000)) ^ 0x8F48DBFB | (v92 >> 9) ^ 0x413A81;
  v117 = (v874 ^ v69) - ((2 * (v874 ^ v69)) & 0x16E);
  v118 = v103 ^ 0xEC206949 | ((v78 ^ v69) - 422485461 - ((2 * (v78 ^ v69)) & 0x56)) ^ 0xE6D1622B;
  v119 = (((v118 - ((2 * v118) & 0x9C26A6)) << 8) + 1309889280) ^ 0x4E135300;
  v120 = (v862 ^ v69) - 296281511 - ((2 * (v862 ^ v69)) & 0xB2);
  v121 = (v119 + 106165355 - ((2 * v119) & 0xCA7E800)) ^ 0x653F46B | v120 ^ 0xEE571A59;
  v122 = v121 + 1693573248 - ((2 * v121) & 0xC9E3C1EE) + 119;
  v123 = (BYTE4(v862) ^ v69) - ((2 * (HIDWORD(v862) ^ v69)) & 0x3A);
  LODWORD(v860) = v88;
  HIDWORD(a45) = (v88 ^ v69) + 872906846 - ((2 * (v88 ^ v69)) & 0xBC);
  v124 = ((((_DWORD)a44 << 8) ^ 0x8229BD00) + 1454523172 - ((2 * (((_DWORD)a44 << 8) ^ 0x8229BD00)) & 0xAD648600)) ^ 0x56B24324 | HIDWORD(a45) ^ 0x3407805E;
  v125 = ((((v80 ^ v69) - ((2 * (v80 ^ v69)) & 0x1F0)) << 8) + 391772160) ^ 0x1759F800;
  v126 = ((((v104 << 16) + 1137639424) ^ 0x43CF0000)
        - 221755271
        - ((2 * (((v104 << 16) + 1137639424) ^ 0x43CF0000)) & 0x65900000)) ^ 0xF2C84879 | (v125
                                                                                         - 2118204172
                                                                                         - ((2 * v125) & 0x37D8800)) ^ 0x81BEC4F4;
  v127 = v126 + 1420560198 - ((2 * v126) & 0x29580E8C);
  LODWORD(v867) = v97;
  HIDWORD(v128) = v95 ^ 0x3C;
  LODWORD(v128) = v97 ^ 0xBF558C80;
  v864 = v128 >> 7;
  HIDWORD(v858) = v81;
  v129 = v127 ^ 0x54AC0746 | ((v81 ^ v69) + 547769213 - ((2 * (v81 ^ v69)) & 0xFA)) ^ 0x20A64B7D;
  v130 = (((v129 - ((2 * v129) & 0xE76712)) << 8) - 206337792) ^ 0xF3B38900;
  v131 = (BYTE4(v861) ^ v69) - ((2 * (HIDWORD(v861) ^ v69)) & 0xF8);
  v132 = v124 + 1859689344 + (~(2 * v124) | 0x224EC845) + 94;
  v133 = ((v132 << 15) ^ 0x4DEE8000) - 1750839527 - ((2 * ((v132 << 15) ^ 0x4DEE8000)) & 0x2F480000);
  v134 = ((((v114 << 8) - 591534592) ^ 0xDCBDE600)
        + 1515988771
        - ((2 * (((v114 << 8) - 591534592) ^ 0xDCBDE600)) & 0x34B84E00)) ^ 0x5A5C2723 | ((((v100 << 16) + 1358430208) ^ 0x50F80000)
                                                                                       - 164811462
                                                                                       - ((2
                                                                                         * (((v100 << 16) + 1358430208) ^ 0x50F80000)) & 0x6C5A0000)) ^ 0xF62D2D3A;
  v135 = v134 - 589348010 - ((2 * v134) & 0xB9BE86AC);
  v136 = (v875 ^ 0x35) - 958722577 - ((2 * (v875 ^ 0x35)) & 0x1DE);
  v869 = (((v97 << 14) ^ 0x63358000) - 555584322 - ((2 * ((v97 << 14) ^ 0x63358000)) & 0xBDC48000)) ^ 0xDEE274BE | (v92 >> 10) ^ 0x209D40;
  HIDWORD(v128) = v120 ^ 0x59;
  LODWORD(v128) = v122 ^ 0x64F1E080;
  v137 = ((((v131 << 8) - 2034336768) ^ 0x86BE7C00)
        - 192043225
        - ((2 * (((v131 << 8) - 2034336768) ^ 0x86BE7C00)) & 0x691B4E00)) ^ 0xF48DA727 | ((((v123 << 16) + 320667648) ^ 0x131D0000)
                                                                                        + 196175249
                                                                                        - ((2
                                                                                          * (((v123 << 16) + 320667648) ^ 0x131D0000)) & 0x17620000)) ^ 0xBB16591;
  v138 = (((v97 << 13) ^ 0xB19AC000) - 1277271007 - ((2 * ((v97 << 13) ^ 0xB19AC000)) & 0x67BCC000)) ^ 0xB3DE6421 | (v92 >> 11) ^ 0x104EA0;
  v139 = (v873 ^ 0x35) + 1563275273 - ((2 * (v873 ^ 0x35)) & 0x12);
  v140 = ((v130 - 978681429 - ((2 * v130) & 0x8B550200)) ^ 0xC5AA81AB | v136 ^ 0xC6DB0DEF)
       + 641300480
       - ((2 * ((v130 - 978681429 - ((2 * v130) & 0x8B550200)) ^ 0xC5AA81AB | v136 ^ 0xC6DB0DEF)) & 0x4C72F020)
       + 16;
  v141 = v135 ^ 0xDCDF4356 | ((v877 ^ 0x35) + 1556948323 - ((2 * (v877 ^ 0x35)) & 0xC6)) ^ 0x5CCD2563;
  v142 = (((v141 - ((2 * v141) & 0xC76358)) << 8) + 1672588288) ^ 0x63B1AC00;
  v143 = ((((v876 ^ 0x35) - ((2 * (v876 ^ 0x35)) & 0x9C)) << 8) + 1477463552) ^ 0x58104E00;
  v144 = v139 ^ 0x5D2DB009 | (v143 + 249970877 - ((2 * v143) & 0x1DCC8000)) ^ 0xEE640BD;
  v145 = ((((v117 << 16) - 1028194304) ^ 0xC2B70000)
        + 627837841
        - ((2 * (((v117 << 16) - 1028194304) ^ 0xC2B70000)) & 0x4AD80000)) ^ 0x256C0B91 | ((((v115 << 24) + 2030043136) ^ 0x79000000)
                                                                                         - 523099187
                                                                                         - ((((v115 << 24) + 2030043136) ^ 0x79000000) >> 29 << 30)) ^ 0xE0D223CD;
  v146 = v145 + 483716275 - ((2 * v145) & 0x39A9D966);
  v147 = v132;
  v148 = (((v122 << 14) ^ 0x783DC000) - 635489731 - ((2 * ((v122 << 14) ^ 0x783DC000)) & 0xB43E0000)) ^ 0xDA1F323D | (v103 >> 10) ^ 0x3B081A;
  v149 = v146 ^ 0x1CD4ECB3 | (v144 + 601699076 - ((2 * v144) & 0x47BA6608)) ^ 0x23DD3304;
  v150 = (((v132 << 13) ^ 0x137BA000) + 396185449 - ((2 * ((v132 << 13) ^ 0x137BA000)) & 0x2F3A8000)) ^ 0x179D4F69 | (v866 >> 11) ^ 0xDFC51;
  v847 = v122;
  v151 = ((v122 >> 3) ^ 0xC980F1E)
       + ((v872 >> 2) ^ 0xE0889AFC)
       + ((v122 >> 2) & 0x3FF399FE ^ 0xE6CFE7C3)
       + ((v128 >> 7) ^ 0x3C7BDFFF)
       + ((2 * (v128 >> 7)) & 0x78F7BFFE)
       + ((2 * (v872 >> 2)) & 0x7D7FA9DE ^ 0x3C6E8806)
       + (v148 ^ 0xFF57BDFD)
       + ((2 * v148) & 0xFEAF7BFA)
       + (v138 ^ 0x9C942081)
       + (v116 ^ 0x1100684E);
  v152 = (2 * v116) & 0xDDFF2F62;
  v153 = (2 * v138) & 0xC6D7BEFC;
  v154 = v149 + 1762465152 + (~(2 * v149) | 0x2DE5D44D) + 90;
  v155 = v151 - v153;
  v156 = v150 ^ 0xE5FEDBF7;
  v157 = (2 * v150) & 0xCBFDB7EE;
  v158 = v155 - v152 + 2 - ((2 * (v155 - v152 + 2) + 799253130) & 0x56344334) + 1122759391;
  v159 = v133 ^ 0x97A44F19 | (v866 >> 9) ^ 0x37F147;
  HIDWORD(v128) = v136 ^ 0xFFFFFFEF;
  LODWORD(v128) = v140 ^ 0x26397800;
  v160 = v128 >> 7;
  v161 = (v142 - 30776529 - ((2 * v142) & 0xFC54C600)) ^ 0xFE2A632F | v878 ^ 0x35;
  v162 = v161 - 1421236366 - ((2 * v161) & 0x56934EE4);
  v163 = (((v113 << 14) ^ 0x6E4A4000) - 274126617 - ((2 * ((v113 << 14) ^ 0x6E4A4000)) & 0xDF520000)) ^ 0xEFA928E7 | (v871 >> 10) ^ 0x3EC6A3;
  v164 = (((v140 << 14) ^ 0x5E040000) - 1352951788 - ((2 * ((v140 << 14) ^ 0x5E040000)) & 0x5EB70000)) ^ 0xAF5B9814 | (v127 >> 10) ^ 0x152B01;
  HIDWORD(v128) = v868 ^ 0x7A;
  LODWORD(v128) = v113 ^ 0xFD49B900;
  v857 = v162;
  v165 = (v162 ^ 0x805386E8 ^ v158)
       + (v162 ^ 0xAB49A772)
       - 1149331840
       - ((2 * ((v162 ^ 0x805386E8 ^ v158) + (v162 ^ 0xAB49A772))) & 0x76FD2D5E)
       + 47;
  v166 = ((v128 >> 7) ^ 0x6FFDFFFB)
       + ((2 * (v128 >> 7)) & 0xDFFBFFF6)
       + (v163 ^ 0x22318001)
       - ((2 * v163) & 0xBB9CFFFC)
       + 1;
  HIDWORD(v128) = v165 ^ 0x696AF;
  LODWORD(v128) = v165 ^ 0xBB780000;
  v167 = (v128 >> 19) - ((2 * (v128 >> 19)) & 0x371C8EB8);
  v168 = v156
       + (v159 ^ 0x75E8ECBD)
       + ((2 * v159) & 0xEBD1D97A)
       + v157
       - 2
       * ((v156 + (v159 ^ 0x75E8ECBD) + ((2 * v159) & 0xEBD1D97A) + v157 + 605566796) & 0x4EA72F16 ^ (v156 + (v159 ^ 0x75E8ECBD) + ((2 * v159) & 0xEBD1D97A) + v157) & 2);
  HIDWORD(v128) = v165 ^ 0x96AF;
  LODWORD(v128) = v165 ^ 0xBB7E0000;
  v169 = (v128 >> 17) - ((2 * (v128 >> 17)) & 0x76957D8) - 2085311508;
  v170 = ((v140 >> 3) ^ 0xBA98D8F2)
       + ((v140 >> 2) & 0x3CBFEFE0 ^ 0x88E4E00)
       + (v160 ^ 0x1F6CBFAF)
       + ((2 * v160) & 0x3ED97F5E)
       + (v164 ^ 0x51ACFDF3)
       + ((2 * v164) & 0xA359FBE6)
       - 796505490
       + ((v168 - 222337440) ^ (a44 >> 2) ^ 0x4607A57B);
  v171 = v170 - 882405790 - ((2 * v170) & 0x96CF1CC4);
  HIDWORD(v128) = v165 ^ 0x296AF;
  LODWORD(v128) = v165 ^ 0xBB7C0000;
  v172 = v128 >> 18;
  HIDWORD(v128) = v154 ^ 0x115D9;
  LODWORD(v128) = v146 ^ 0x1CD40000;
  v173 = v128 >> 18;
  v174 = v165;
  v175 = ((v167 + 462309212) ^ (v165 >> 10) ^ v169 ^ 0x98143315)
       + ((v166 - ((2 * v166 + 1537277958) & 0x6563CAD8) + 545416559) ^ (v113 >> 3) ^ 0xAD18D249);
  v176 = (v137 + 1951841638 - ((2 * v137) & 0x68AD7ACC)) ^ 0x7456BD66 | ((v879 ^ 0x35)
                                                                       - 2122147913
                                                                       - ((2 * (v879 ^ 0x35)) & 0x16E)) ^ 0x818297B7;
  HIDWORD(v844) = v140;
  v177 = ((4 * v140) & 0x3A5AFFCC ^ 0x1840E040)
       + ((2 * v140) ^ 0x515F8FC7)
       + (v175 ^ 0x7F6FDA8F)
       + ((2 * v175) & 0xFEDFB51E);
  v178 = v177 - ((2 * v177 - 960148716) & 0xCD59F396) - 904945835;
  v179 = (((v176 - ((2 * v176) & 0xF8DC8)) << 8) - 2017008640) ^ 0x87C6E400;
  HIDWORD(v128) = v139 ^ 9;
  LODWORD(v128) = v154 ^ 0x690D1580;
  v180 = v128 >> 7;
  HIDWORD(v128) = v165 ^ 0x2F;
  LODWORD(v128) = v165 ^ 0xBB7E9680;
  v181 = v128 >> 7;
  HIDWORD(v128) = HIDWORD(a45) ^ 0x5E;
  LODWORD(v128) = v147 ^ 0x6ED89B80;
  v182 = v128 >> 7;
  HIDWORD(v128) = v171 ^ 0x78E62;
  LODWORD(v128) = v171 ^ 0xCB600000;
  v183 = v128 >> 19;
  v184 = v171;
  HIDWORD(v128) = v171 ^ 0x18E62;
  LODWORD(v128) = v171 ^ 0xCB660000;
  v185 = v128 >> 17;
  v186 = v178 ^ 0xF9CB;
  v187 = v178 ^ 0x66AC0000;
  HIDWORD(v128) = v178 ^ 0xF9CB;
  LODWORD(v128) = v178 ^ 0x66AC0000;
  v188 = (v185 ^ 0x25FDCF77) + (v183 ^ 0xDB762F75) + ((2 * v183) & 0xB6EC5EEA) + ((2 * v185) & 0x4BFB9EEE);
  v189 = ((v154 >> 3) ^ 0xDBDEDDC8)
       + (v173 ^ 0xAFF8CEBF)
       + ((2 * v173) & 0x5FF19D7E)
       + ((2 * (v154 >> 3)) & 0x2DFEFEE6 ^ 0x8424466)
       + 2030547406
       + ((v188 - 426128919 - ((2 * v188 - 48758232) & 0xD01B91AA)) ^ (v171 >> 10) ^ 0xE83F1136);
  v190 = (v180 ^ 0xFFF19BD2) + ((2 * v180) & 0xFFE337A4) + (v189 ^ 0x85000600) - ((2 * v189) & 0xF5FFF3FE) + 1;
  v191 = (((v147 << 14) ^ 0x26F74000) + 1576596949 - ((2 * ((v147 << 14) ^ 0x26F74000)) & 0xBBF18000)) ^ 0x5DF8F5D5 | (v866 >> 10) ^ 0x1BF8A3;
  LODWORD(v846) = v113 ^ 0xFD49B929;
  v192 = (v113 ^ 0x864B21FB ^ (v190 - ((2 * v190 - 165888934) & 0xF60531A4) - 166660353)) + (v113 ^ 0xFD49B929);
  v193 = v192 + 612324503 - ((2 * v192) & 0x48FEA92E);
  v194 = v178;
  v195 = ((v178 >> 10) ^ 0xABE657E1)
       + ((v178 >> 9) & 0x7FF9BE ^ 0x33503C)
       + 1409286945
       + (((v128 >> 17) - ((2 * (v128 >> 17)) & 0xEFCEEF6E) + 2011658167) ^ (v178 >> 19) ^ (((v178 << 13) ^ 0x9F396000)
                                                                                          - ((2
                                                                                            * ((v178 << 13) ^ 0x9F396000)) & 0xA44B8000)
                                                                                          - 769275996) ^ 0xA5C2BCC6);
  v848 = __PAIR64__(v147, v154);
  v196 = (v174 >> 3) ^ 0x69B32C28;
  v197 = v174;
  v198 = (v174 >> 2) & 0x3DB9FDFA ^ 0x2C99A5AA;
  v199 = ((v867 >> 3) ^ 0x86E699A2)
       + (v864 ^ 0x7C7FEEF7)
       + ((2 * v864) & 0xF8FFDDEE)
       + ((v867 >> 2) & 0x1DE7AF8E ^ 0xF23ADCFB)
       + ((2 * v154) ^ 0x9E1B74D)
       + ((4 * v154) & 0xB7F739FC ^ 0xA4341164)
       + (v869 ^ 0x848805CC)
       - ((2 * v869) & 0xF6EFF466)
       + (v195 ^ 0x92CB0045)
       - ((2 * v195) & 0xDA69FF74)
       + 4;
  v200 = v199 - ((2 * v199 - 28669060) & 0xC16989AE) + 1608125077;
  v201 = ((v147 >> 3) ^ 0x8DCF3B1E)
       + (v182 ^ 0xE83EF1BD)
       + ((2 * v182) & 0xD07DE37A)
       + ((v147 >> 2) & 0x3FD7AF34 ^ 0xE469D9CB)
       + (v191 ^ 0xE506FE84)
       - ((2 * v191) & 0x35F202F6)
       + 3;
  HIDWORD(v128) = v193 ^ 0x75497;
  LODWORD(v128) = v193 ^ 0x24780000;
  v202 = (v128 >> 19) - ((2 * (v128 >> 19)) & 0x31DCE3E0) - 1729203728;
  HIDWORD(v128) = v193 ^ 0x15497;
  LODWORD(v128) = v193 ^ 0x247E0000;
  v203 = ((v193 >> 10) ^ 0x30583FF5)
       + ((v193 >> 9) & 0x5DBFBE ^ 0xFFEFC055)
       - 810623007
       + (v202 ^ ((v128 >> 17) - ((2 * (v128 >> 17)) & 0xC40539F8) + 1644338428) ^ 0xFAECED0C);
  v204 = (v203 - ((2 * v203) & 0xBE17B274) - 552871622) ^ (v201 - ((2 * v201 + 1699466928) & 0x84A3A020) - 185092248);
  HIDWORD(v128) = v200 ^ 0x4C4D7;
  LODWORD(v128) = v200 ^ 0x60B00000;
  v205 = (v128 >> 19) - ((2 * (v128 >> 19)) & 0x16FB976A) + 192793525;
  v206 = (v181 ^ 0x5D3BDFF3) + v196 + (v172 ^ 0xEB2E1E3F) + v198 + ((2 * v181) & 0xBA77BFE6) + ((2 * v172) & 0xD65C3C7E);
  v207 = v206 - ((2 * v206 + 1903297954) & 0xFDB12516) + 932287836;
  v208 = v200 ^ 0xC4D7;
  v209 = v200 ^ 0x60B40000;
  HIDWORD(v128) = v200 ^ 0xC4D7;
  LODWORD(v128) = v200 ^ 0x60B40000;
  v210 = (v128 >> 17) - ((2 * (v128 >> 17)) & 0xF89203F4) + 2085159418;
  HIDWORD(v128) = v184 ^ 0x62;
  LODWORD(v128) = v184 ^ 0xCB678E00;
  v211 = v128 >> 7;
  v212 = (__PAIR64__(v186, v187) >> 18) - ((2 * (__PAIR64__(v186, v187) >> 18)) & 0x3C7DCEE0);
  v213 = v184;
  HIDWORD(v128) = v184 ^ 0x38E62;
  LODWORD(v128) = v184 ^ 0xCB640000;
  v214 = v128 >> 18;
  v215 = ((2 * v147) ^ 0xA24E5C44)
       + ((4 * v147) & 0xFFFED7FC ^ 0xBB624774)
       - 2147445758
       + (v207 ^ (v200 >> 10) ^ v205 ^ v210 ^ 0x89F475F5);
  v216 = v215 - 434465709 - ((2 * v215) & 0xCC3528A6);
  v217 = v200;
  HIDWORD(v128) = v200 ^ 0x57;
  LODWORD(v128) = v200 ^ 0x60B4C480;
  v218 = (v128 >> 7) - ((2 * (v128 >> 7)) & 0x6DDD9DC8);
  HIDWORD(a45) = (v179 + 969469199 - ((2 * v179) & 0x7391DA00)) ^ 0x39C8ED0F | ((v880 ^ 0x35)
                                                                              + 880128987
                                                                              - ((2 * (v880 ^ 0x35)) & 0x1B6)) ^ 0x3475B3DB;
  HIDWORD(v128) = v216 ^ 0x9453;
  LODWORD(v128) = v216 ^ 0xE61A0000;
  v219 = v128 >> 17;
  HIDWORD(v128) = v194 ^ 0x4B;
  LODWORD(v128) = v194 ^ 0x66ACF980;
  v220 = (v128 >> 7) - ((2 * (v128 >> 7)) & 0x75AE9D70);
  HIDWORD(v128) = v204 ^ 0x92A;
  LODWORD(v128) = v204 ^ 0x9D5A0000;
  v221 = v128 >> 17;
  v222 = (v214 ^ 0xFDF5FBFF) + ((v213 >> 3) ^ 0x668B4A32) + (v211 ^ 0x72F3CF77);
  v223 = v213;
  v224 = ((2 * v214) & 0xFBEBF7FE) + ((v213 >> 2) & 0x3FCF77FC ^ 0x32C96398) + ((2 * v211) & 0xE5E79EEE) + v222;
  v225 = v224 - 2 * ((v224 + 254703756) & 0x6BF1C5DB ^ v222 & 1);
  HIDWORD(v128) = v204 ^ 0x2092A;
  LODWORD(v128) = v204 ^ 0x9D580000;
  v226 = (v221 ^ 0x55FBBFBF)
       + ((v204 >> 10) ^ 0x8027C184)
       + ((v128 >> 19) ^ 0x7FBEB77A)
       + ((v204 >> 9) & 0x7ED1F2 ^ 0xFFB17EFF)
       + ((2 * v221) & 0xABF77F7E)
       + ((2 * (v128 >> 19)) & 0xFF7D6EF4);
  v227 = ((2 * v197) ^ 0x6EFD88CF)
       + ((4 * v197) & 0xCFFEB4DC ^ 0x3205EF63)
       - 402695568
       + ((v225 + 2065710694) ^ 0x9FDED2E8 ^ (v226 - ((2 * v226 + 1418322820) & 0xE85E2E64) - 1636562700));
  v228 = v227 + 224768155 - ((2 * v227) & 0x1ACB6136);
  HIDWORD(v128) = v193 ^ 0x17;
  LODWORD(v128) = v193 ^ 0x247F5480;
  v229 = (v128 >> 7) - ((2 * (v128 >> 7)) & 0x262AB358);
  HIDWORD(v128) = v193 ^ 0x35497;
  LODWORD(v128) = v193 ^ 0x247C0000;
  v230 = (v128 >> 18) - ((2 * (v128 >> 18)) & 0x375F2BA);
  v231 = (v212 - 1640044688) ^ (v220 + 987188920);
  HIDWORD(v850) = v194;
  HIDWORD(v128) = v204 ^ 0x2092A;
  LODWORD(v128) = v204 ^ 0x9D580000;
  v232 = v128 >> 18;
  v233 = ((HIDWORD(v850) >> 3) ^ 0xE38AC2F6)
       + ((HIDWORD(v850) >> 2) & 0x1EBEBB9E ^ 0x18AA3A12)
       + 278962737
       + (v231 ^ 0xA4E9A9C8);
  v234 = (__PAIR64__(v208, v209) >> 18) - ((2 * (__PAIR64__(v208, v209) >> 18)) & 0xDA7B3290);
  HIDWORD(v128) = v216 ^ 0x29453;
  LODWORD(v128) = v216 ^ 0xE6180000;
  v849 = __PAIR64__(v197, v223);
  v235 = (v223 ^ 0xCB678E62)
       + ((v128 >> 19) ^ 0x677DFFF9)
       + (v219 ^ 0x5FEFF79F)
       + ((2 * (v128 >> 19)) & 0xCEFBFFF2)
       + ((2 * v219) & 0xBFDFEF3E);
  v236 = (v233 ^ 0x15DFFD3F)
       + ((2 * v233) & 0x2BBFFA7E)
       + ((v216 >> 10) ^ 0xF3487B89)
       + ((2 * (v216 >> 10)) & 0x63FA58 ^ 0x630848)
       + ((v235 + 949094504) ^ 0x30001010)
       - ((2 * (v235 + 949094504)) & 0x9FFFDFDE)
       + 1;
  HIDWORD(v128) = v228 ^ 0x5B09B;
  LODWORD(v128) = v228 ^ 0xD600000;
  v237 = v128 >> 19;
  v238 = v228 ^ 0x1B09B;
  v239 = v228 ^ 0xD640000;
  v240 = v228;
  HIDWORD(v128) = v228 ^ 0x1B09B;
  LODWORD(v128) = v228 ^ 0xD640000;
  v241 = (v237 ^ 0x6FFF65FE)
       + ((v128 >> 17) ^ 0xBDA7D5EF)
       + ((2 * (v128 >> 17)) & 0x7B4FABDE)
       + ((2 * v237) & 0xDFFECBFC);
  v242 = (v236 - ((2 * v236 + 224127752) & 0x40F4FB18) + 1730704144) ^ v223;
  HIDWORD(v128) = v242 ^ 0x5F3EE;
  LODWORD(v128) = v242 ^ 0x6B180000;
  v243 = v128 >> 19;
  HIDWORD(v128) = v204 ^ 0xAAAAAAAA;
  LODWORD(v128) = v204 ^ 0x9D5A0900;
  v244 = v128 >> 7;
  HIDWORD(v128) = v240 ^ 0x1B;
  LODWORD(v128) = v240 ^ 0xD65B080;
  v245 = (v229 + 320166316) ^ (v193 >> 3) ^ (v230 - 2118452899) ^ (v240 >> 10) ^ (v241
                                                                                - ((2 * v241 - 1531869146) & 0xE5E7F4CA)
                                                                                + 1162657400);
  v246 = (v128 >> 7) - 82846989 + (~(2 * (v128 >> 7)) | 0x9E04A1B);
  HIDWORD(v128) = v216 ^ 0x53;
  LODWORD(v128) = v216 ^ 0xE61A9400;
  v247 = v128 >> 7;
  HIDWORD(v851) = v217;
  HIDWORD(v128) = v242 ^ 0x1F3EE;
  LODWORD(v128) = v242 ^ 0x6B1C0000;
  v248 = ((v217 >> 3) ^ 0x7169099)
       + ((v217 >> 2) & 0x29FFEFF8 ^ 0xF7D2DECF)
       + ((v218 - 1225863452) ^ (v234 + 1832753480) ^ 0xDBD357AC)
       + ((v242 >> 10) ^ 0x40DA9BB8)
       + (v243 ^ 0xF4DFFFFF)
       + ((v128 >> 17) ^ 0xC2882080)
       + ((2 * v243) & 0xE9BFFFFE)
       - ((2 * (v128 >> 17)) & 0x7AEFBEFE)
       + ((v242 >> 9) & 0x7F4676 ^ 0xFFCAF98F)
       - 52987204;
  LODWORD(v850) = v193;
  v249 = (v193 ^ 0x247F5497) + (v248 ^ 0xF5FE77FF) + ((2 * v248) & 0xEBFCEFFE) + 167872513;
  v250 = v249 - ((2 * v249) & 0x1BE4BFD4);
  v251 = (__PAIR64__(v238, v239) >> 18) - ((2 * (__PAIR64__(v238, v239) >> 18)) & 0x76A3BECC);
  HIDWORD(v128) = v242 ^ 0x1F3EE;
  LODWORD(v128) = v242 ^ 0x6B1C0000;
  v252 = v128 >> 18;
  v253 = v242;
  HIDWORD(v128) = v242 ^ 0xEEEEEEEE;
  LODWORD(v128) = v242 ^ 0x6B1DF380;
  v254 = v128 >> 7;
  HIDWORD(v128) = v216 ^ 0x29453;
  LODWORD(v128) = v216 ^ 0xE6180000;
  v255 = v128 >> 18;
  v256 = (v250 + 233988074) ^ v193;
  HIDWORD(v128) = v256 ^ 0x50B7D;
  LODWORD(v128) = v256 ^ 0x29880000;
  v257 = v128 >> 19;
  HIDWORD(v128) = v245 ^ 0xE96A;
  LODWORD(v128) = v245 ^ 0xE4D00000;
  v258 = v128 >> 17;
  HIDWORD(v128) = v245 ^ 0xE96A;
  LODWORD(v128) = v245 ^ 0xE4D00000;
  v259 = ((v128 >> 19) ^ 0xF4FB7B73)
       + (v258 ^ 0x4FEC920D)
       + ((2 * v258) & 0x9FD9241A)
       + ((2 * (v128 >> 19)) & 0xE9F6F6E6);
  v260 = (v232 ^ 0x7B73DFEF)
       + ((v204 >> 3) ^ 0x7E5C3CDA)
       + (v244 ^ 0x37DFFEFF)
       + ((v204 >> 2) & 0x1BEEFBFE ^ 0x346824A)
       + ((2 * v232) & 0xF6E7BFDE)
       + ((2 * v244) & 0x6FBFFDFE)
       + ((v259 - 2 * ((v259 + 454554240) & 0x1FBBBECF ^ v259 & 4) - 623660725) ^ (v245 >> 10) ^ 0xE07D750E);
  HIDWORD(v128) = v256 ^ 0x10B7D;
  LODWORD(v128) = v256 ^ 0x298C0000;
  v261 = ((v216 >> 3) ^ 0x7394BD55)
       + (v247 ^ 0x691D3FCA)
       + (v255 ^ 0x8403B483)
       + ((v216 >> 2) & 0x1EAFDFBE ^ 0x18868514)
       + ((2 * v247) & 0xD23A7F94)
       - ((2 * v255) & 0xF7F896F8)
       + ((v256 >> 10) ^ 0x37D5DC39)
       + ((v128 >> 17) ^ 0x7FBF7BDD)
       + (v257 ^ 0x7FFEB7FD)
       + ((v256 >> 9) & 0x3F7EF6 ^ 0x144684)
       + ((2 * (v128 >> 17)) & 0xFF7EF7BA)
       + ((2 * v257) & 0xFFFD6FFA)
       + 1;
  LODWORD(v851) = v204 ^ 0x9D5A092A;
  v262 = (v204 ^ 0x554E2D37 ^ (v261 - ((2 * v261 - 674082564) & 0x9028483A) + 872238235)) + (v204 ^ 0x9D5A092A);
  v263 = v262 + 490948736 - ((2 * v262) & 0x3A86918E);
  v264 = v260 - ((2 * v260 - 1117174232) & 0xA2AFFC8C) - 1341349542;
  HIDWORD(v128) = v264 ^ 0x7FE46;
  LODWORD(v128) = v264 ^ 0xD1500000;
  v265 = v128 >> 19;
  HIDWORD(a40) = v245;
  HIDWORD(v128) = v245 ^ 0x6A;
  LODWORD(v128) = v245 ^ 0xE4D0E900;
  v266 = v128 >> 7;
  HIDWORD(v128) = v264 ^ 0x1FE46;
  LODWORD(v128) = v264 ^ 0xD1560000;
  v267 = ((v128 >> 17) ^ 0xE97FF5FF)
       + (v265 ^ 0xEDEF8C3F)
       + ((2 * v265) & 0xDBDF187E)
       + ((2 * (v128 >> 17)) & 0xD2FFEBFE);
  v268 = v263 + 71;
  HIDWORD(v128) = (v263 + 71) ^ 0x148C7;
  LODWORD(v128) = (v263 + 71) ^ 0x1D420000;
  v269 = v128 >> 17;
  v270 = (v263 + 71) ^ 0x348C7;
  v271 = v268 ^ 0x1D400000;
  v272 = v268;
  HIDWORD(v128) = v270;
  LODWORD(v128) = v268 ^ 0x1D400000;
  v273 = v128 >> 19;
  v274 = (v252 ^ 0x24200210) + (v254 ^ 0x7DF1BCF6) + ((2 * v254) & 0xFBE379EC) - ((2 * v252) & 0xB7BFFBDE) + 1;
  HIDWORD(v128) = v245 ^ 0xE96A;
  LODWORD(v128) = v245 ^ 0xE4D00000;
  v275 = v128 >> 18;
  v852 = __PAIR64__(v216, v240);
  v276 = ((v240 >> 3) ^ 0x7E52C0E5)
       + ((v240 >> 2) & 0x3FFCEDEC ^ 0x3586C24)
       - 2147383030
       + ((v267 - ((2 * v267 + 1361116036) & 0xCC4FA4A2) - 1900523501) ^ (v264 >> 10) ^ 0x661387AE);
  v277 = ((v251 + 995221350) ^ v246 ^ 0xC05E0594) + (v276 ^ 0x80042E00) - ((2 * v276) & 0xFFF7A3FE) + 2147209728;
  v278 = v256;
  HIDWORD(v128) = v256 ^ 0xFFFFFFFD;
  LODWORD(v128) = v256 ^ 0x298D0B00;
  v279 = v128 >> 7;
  HIDWORD(v128) = v264 ^ 0x3FE46;
  LODWORD(v128) = v264 ^ 0xD1540000;
  v280 = (v128 >> 18) - ((2 * (v128 >> 18)) & 0xB72F3638);
  v281 = (v275 ^ 0x80142A3) + (v266 ^ 0xBF3B3F77) + ((2 * v266) & 0x7E767EEE) - ((2 * v275) & 0xEFFD7AB8) + 1;
  HIDWORD(v128) = a61 ^ 0x13;
  LODWORD(v128) = a61 ^ 0x4A33E5C0;
  v282 = v128 >> 6;
  v283 = (v273 ^ 0xB8689293) + (v269 ^ 0xEFB7ED4F) + ((2 * v269) & 0xDF6FDA9E) - ((2 * v273) & 0x8F2EDAD8) + 1;
  HIDWORD(v128) = v264 ^ 0x46;
  LODWORD(v128) = v264 ^ 0xD157FE00;
  v284 = (v128 >> 7) - ((2 * (v128 >> 7)) & 0x554A4106);
  v285 = ((v274 + 62145460 + (~(2 * v274 + 1004306930) | 0xB473FA8B)) ^ (v253 >> 3) ^ 0xA8A5BCC7) + (v240 ^ 0xD65B09B);
  v286 = (v285 ^ 0x2B8FFFE6)
       + ((2 * v285) & 0x571FFFCC)
       - 730857446
       + ((v283 - ((2 * v283 - 1346437062) & 0x856F2530) + 446108341) ^ (v272 >> 10) ^ 0xC2B0C24A);
  v287 = v277 - 1287400704 - ((2 * v277) & 0x6687A616) + 11;
  HIDWORD(v128) = v287 ^ 0x1D30B;
  LODWORD(v128) = v287 ^ 0xB3420000;
  v288 = v128 >> 17;
  HIDWORD(v128) = v287 ^ 0x3D30B;
  LODWORD(v128) = v287 ^ 0xB3400000;
  v289 = ((v281 - ((2 * v281 + 1904671690) & 0x8C61AD94) - 17541969) ^ (v245 >> 3) ^ 0xDAAACBE7)
       + ((v287 >> 10) ^ 0x25BDD5E0)
       + ((v128 >> 19) ^ 0xC8200C02)
       + (v288 ^ 0x10A10000)
       + ((v287 >> 9) & 0x5DF5D6 ^ 0xFFA65E3F)
       - ((2 * v288) & 0xDEBDFFFE)
       - ((2 * (v128 >> 19)) & 0x6FBFE7FA)
       + 28176107;
  v290 = (v253 ^ 0x35C38328 ^ (v289 - ((2 * v289) & 0xBDBCE18C) + 1591636166)) + (v253 ^ 0x6B1DF3EE);
  v291 = (v240 ^ 0xD65B09B) + (v286 ^ 0xCCF7CDA9) + ((2 * v286) & 0x99EF9B52) + 856175191;
  v292 = v291 + 2061384111 - ((2 * v291) & 0xF5BC735E);
  v293 = v272;
  LODWORD(a41) = v272;
  HIDWORD(v128) = v272 ^ 0xFFFFFFC7;
  LODWORD(v128) = v272 ^ 0x1D434880;
  v294 = v128 >> 7;
  HIDWORD(v128) = v292 ^ 0x39AF;
  LODWORD(v128) = v292 ^ 0x7ADE0000;
  v295 = (v128 >> 17) - ((2 * (v128 >> 17)) & 0xA25F2DBC);
  v296 = v290 + 2094467584 - ((2 * v290) & 0xF9AE14CC) + 102;
  HIDWORD(v128) = v296 ^ 0x70A66;
  LODWORD(v128) = v296 ^ 0x7CD00000;
  v297 = v128 >> 19;
  HIDWORD(v128) = v292 ^ 0x639AF;
  LODWORD(v128) = v292 ^ 0x7AD80000;
  v298 = ((v278 >> 3) ^ 0xDAEE5A14)
       + ((__PAIR64__(v256 ^ 0x10B7D, v256 ^ 0x298C0000) >> 18) ^ 0xDFFBA3D5)
       + ((2 * (__PAIR64__(v256 ^ 0x10B7D, v256 ^ 0x298C0000) >> 18)) & 0xBFF747AA)
       + ((v278 >> 2) & 0x3FBFF6F6 ^ 0xA2342D6)
       + 1076125872
       + (((v128 >> 19) - ((2 * (v128 >> 19)) & 0x386484D4) - 1674427798) ^ (v292 >> 10) ^ (v295 - 785410338) ^ 0x4D03633A);
  v299 = (v279 ^ 0x7FFBFF7D) + ((2 * v279) & 0xFFF7FEFA) + (v298 ^ 0xAA400E0) - ((2 * v298) & 0xEAB7FE3E) + 1;
  v300 = v299 - ((2 * v299 - 356516028) & 0xB884749A);
  HIDWORD(v128) = v287 ^ 0x3D30B;
  LODWORD(v128) = v287 ^ 0xB3400000;
  v301 = (v128 >> 18) - ((2 * (v128 >> 18)) & 0x67745D0C);
  HIDWORD(v128) = a61 ^ 0x5D3;
  LODWORD(v128) = a61 ^ 0x4A33E000;
  v302 = v128 >> 11;
  HIDWORD(v128) = a61 ^ 0x33E5D3;
  LODWORD(v128) = a61 ^ 0x4A000000;
  v303 = ((v128 >> 25) ^ 0xC211578E)
       + (v302 ^ 0x49B80642)
       + (v282 ^ 0x31B5FBFD)
       + ((2 * v282) & 0x636BF7FA)
       - ((2 * (v128 >> 25)) & 0x7BDD50E2)
       - ((2 * v302) & 0x6C8FF37A);
  HIDWORD(v128) = v296 ^ 0x10A66;
  LODWORD(v128) = v296 ^ 0x7CD60000;
  v304 = v128 >> 17;
  v305 = v303 + 2 - ((2 * (v303 + 2) + 83971170) & 0x7319D222);
  v306 = v287;
  HIDWORD(v128) = v287 ^ 0xB;
  LODWORD(v128) = v287 ^ 0xB343D300;
  v307 = (v128 >> 7) - ((2 * (v128 >> 7)) & 0xE84D6BC0);
  HIDWORD(v128) = v292 ^ 0x2F;
  LODWORD(v128) = v292 ^ 0x7ADE3980;
  v845 = v128 >> 7;
  HIDWORD(v128) = v296 ^ 0x30A66;
  LODWORD(v128) = v296 ^ 0x7CD40000;
  v854 = v128 >> 18;
  v308 = ((v264 >> 3) ^ 0x2D9381BB)
       + ((v264 >> 2) & 0x2F72FCE6 ^ 0x2450FC80)
       - 934903411
       + ((v280 - 610821348) ^ (v284 - 1432018813) ^ 0x7132BB9F);
  v309 = (v308 ^ 0x6E7FFFB)
       + ((2 * v308) & 0xDCFFFF6)
       + ((v296 >> 10) ^ 0x77A9DB20)
       + (v304 ^ 0x7EFFAFE)
       + (v297 ^ 0xB8E40000)
       + ((v296 >> 9) & 0x6DDDC4 ^ 0x2C4984)
       + ((2 * v304) & 0xFDFF5FC)
       - ((2 * v297) & 0x8E37FFFE)
       + 1;
  HIDWORD(v128) = ~a61;
  LODWORD(v128) = a61 ^ 0x4A33E5D0;
  v310 = v128 >> 2;
  LODWORD(a38) = v256;
  v311 = (v278 ^ 0x57FB8A42 ^ (v309 - ((2 * v309 - 2128991160) & 0xFCED027E) + 1057199971)) + (v278 ^ 0x298D0B7D);
  v312 = v311 + 1566171274 - ((2 * v311) & 0xBAB3C114);
  v313 = ((__PAIR64__(v270, v271) >> 18) ^ 0x80944231)
       + (v294 ^ 0xBFFF21BE)
       + ((2 * v294) & 0x7FFE437C)
       - ((2 * (__PAIR64__(v270, v271) >> 18)) & 0xFED77B9C)
       + 1;
  HIDWORD(v128) = a61 ^ 0x33E5D3;
  LODWORD(v128) = a61 ^ 0x4A000000;
  v314 = v128 >> 22;
  v315 = v300 + 1369586159;
  HIDWORD(v128) = (v300 + 1369586159) ^ 0x3A4D;
  LODWORD(v128) = (v300 + 1369586159) ^ 0xDC420000;
  v316 = v128 >> 17;
  HIDWORD(v128) = a61 ^ 0x5D3;
  LODWORD(v128) = a61 ^ 0x4A33E000;
  v317 = v128 >> 13;
  HIDWORD(v128) = v312 ^ 0x1E08A;
  LODWORD(v128) = v312 ^ 0x5D580000;
  LODWORD(v840) = v312 ^ 0x1E08A;
  HIDWORD(v840) = v312 ^ 0x5D580000;
  v318 = (v128 >> 19) - ((2 * (v128 >> 19)) & 0x4CDAD6DA);
  v870 = __PAIR64__(v315, v306);
  v319 = ((v306 >> 3) ^ 0xD137829E)
       + ((v306 >> 2) & 0xEBFF1FE ^ 0xC90F0C2)
       + 950011649
       + ((v301 + 867839622) ^ (v307 - 198789664) ^ 0xC79C9B66);
  v841 = v315 ^ 0x23A4D;
  v843 = v315 ^ 0xDC400000;
  HIDWORD(v128) = v315 ^ 0x23A4D;
  LODWORD(v128) = v315 ^ 0xDC400000;
  v320 = ((v313 - ((2 * v313 + 2128164896) & 0x7C439506) + 2106484371) ^ (v293 >> 3) ^ 0xBD89A39B)
       + ((v315 >> 10) ^ 0x7E99FD75)
       + (v316 ^ 0xF3D4DBFA)
       + ((v128 >> 19) ^ 0xC41A80A8)
       + ((v315 >> 9) & 0x5DDBF6 ^ 0x4C0114)
       + ((2 * v316) & 0xE7A9B7F4)
       - ((2 * (v128 >> 19)) & 0x77CAFEAE)
       - 916343453;
  v321 = (a66 ^ a61 ^ 0x9C842CBB)
       + (((a62 ^ 0x5C6047C5) + (a66 ^ 0xD6B7C968)) ^ 0xEF9BEEFD)
       + ((2 * ((a62 ^ 0x5C6047C5) + (a66 ^ 0xD6B7C968))) & 0xDF37DDFA)
       + 274993411;
  v322 = (a64 ^ ((a61 ^ 0x4A33E5D3)
               + (a62 ^ a61 ^ 0x1653A216)
               - ((2 * ((a61 ^ 0x4A33E5D3) + (a62 ^ a61 ^ 0x1653A216))) & 0x245E1012)
               + 305072137) ^ 0x4171E098 ^ (v305 + 2081263426))
       + 694531638;
  v323 = (((a61 ^ 0x4A33E5D3) + (a62 ^ 0x5C6047C5)) ^ 0x10429801)
       + (v314 ^ 0xE3BFFF6F)
       + (v310 ^ 0x773F1B7F)
       + (v317 ^ 0xD6025A00)
       + ((2 * v314) & 0xC77FFEDE)
       + ((2 * v310) & 0xEE7E36FE)
       - ((2 * ((a61 ^ 0x4A33E5D3) + (a62 ^ 0x5C6047C5))) & 0xDF7ACFFC)
       - ((2 * v317) & 0x53FB4BFE)
       + (v321 ^ 0xEBBDEFF7)
       + ((2 * v321) & 0xD77BDFEE)
       + (v322 ^ 0xF6ADBFC2)
       + ((2 * v322) & 0xED5B7F84)
       + (HIDWORD(a45) ^ 0xFF7FFEF4)
       + ((2 * HIDWORD(a45)) & 0xFEFFFDE8)
       + 2;
  HIDWORD(v128) = v312 ^ 0x1E08A;
  LODWORD(v128) = v312 ^ 0x5D580000;
  v324 = (v128 >> 17) - ((2 * (v128 >> 17)) & 0x26CB795C);
  v853 = __PAIR64__(v253, v264);
  v325 = (v264 ^ 0x2EA801B9) + (v264 ^ 0xD66573AF ^ (v320 - ((2 * v320) & 0xE651BD2) + 120753641)) + 1;
  v326 = v325 - ((2 * v325) & 0x16BF3E68);
  v327 = v292;
  HIDWORD(v128) = v292 ^ 0x239AF;
  LODWORD(v128) = v292 ^ 0x7ADC0000;
  v328 = v128 >> 18;
  v329 = v323 - ((2 * v323 - 1180661564) & 0xBAB25BD2) + 975794763;
  v330 = (v329 << 21) ^ 0xBD200000;
  v331 = (v330 - 2001000704 - ((2 * v330) & 0x11400000) + 3707) & 0xF8000000 ^ 0xD0000000;
  v332 = (v329 >> 11) ^ 0xBAB25;
  v333 = (((v331 - (v331 >> 29 << 30) + 1691288058) & 0xF8000000 ^ 0x70010001) + 67248839) ^ 0x4C0322C8 | v332;
  v334 = v333 - 2 * (v333 & 0x1007A3D4 ^ v332 & 4);
  v335 = ((v312 >> 10) ^ 0x68C2466C)
       + ((v312 >> 9) & 0x55DFD6 ^ 0xFFFB732F)
       - 1758793747
       + ((v318 + 644705133) ^ (v324 + 325434542) ^ 0x3508D7C3);
  HIDWORD(v128) = v296 ^ 0x66666666;
  LODWORD(v128) = v296 ^ 0x7CD70A00;
  v336 = v128 >> 7;
  HIDWORD(v128) = (v329 >> 11) ^ 0x3AB25;
  LODWORD(v128) = (v334 - 1786272816) ^ 0x95800000;
  v337 = (v128 >> 19) + 1770591488 - ((2 * (v128 >> 19)) & 0xD3122ABE);
  v338 = (v335 - ((2 * v335) & 0x1F4C3A6C) - 1884938954) ^ (v319 - ((2 * v319) & 0xE936BDE6) + 1956339443);
  v339 = v326 + 190816052;
  HIDWORD(v128) = (v326 + 190816052) ^ 0x79F34;
  LODWORD(v128) = (v326 + 190816052) ^ 0xB580000;
  v340 = (v128 >> 19) - ((2 * (v128 >> 19)) & 0xCEEF2B36);
  v337 += 95;
  HIDWORD(v128) = v337 ^ 0x5F;
  LODWORD(v128) = v337 ^ 0x69891500;
  v341 = (v128 >> 8) + 83457675 - ((2 * (v128 >> 8)) & 0x9F2ED16);
  HIDWORD(v128) = v329 ^ 0x1592DE9;
  LODWORD(v128) = v329 ^ 0x5C000000;
  v342 = v128 >> 25;
  HIDWORD(v128) = v329 ^ 0x192DE9;
  LODWORD(v128) = v329 ^ 0x5D400000;
  v343 = v128 >> 22;
  HIDWORD(v128) = v339 ^ 0x19F34;
  LODWORD(v128) = v339 ^ 0xB5E0000;
  v344 = (v330 + 1831963319 - ((2 * v330) & 0xDA400000)) ^ 0x6D318AB7 | v332;
  v345 = v344 - ((2 * v344) & 0xC6601F1E);
  LODWORD(a44) = a62 ^ 0x5C6047C5;
  v346 = ((v128 >> 17) - ((2 * (v128 >> 17)) & 0xFE3AA7EC) - 14855178) ^ (v340 + 1735890331);
  HIDWORD(v128) = v338 ^ 0x143C5;
  LODWORD(v128) = v338 ^ 0xFB3C0000;
  v347 = ((v339 >> 10) ^ 0xB37D0898) + ((v339 >> 9) & 0x7FBEFE ^ 0x5AECE) + 1283465345 + (v346 ^ 0x986AC66D);
  v348 = (v128 >> 17) - ((2 * (v128 >> 17)) & 0xF88AC71A);
  v349 = v341 ^ 0x4F9768B | (((v329 << 26) ^ 0xA4000000) + 363942263 - ((2 * ((v329 << 26) ^ 0xA4000000)) & 0x28000000)) ^ 0x15B15177;
  HIDWORD(v128) = v338 ^ 0x543C5;
  LODWORD(v128) = v338 ^ 0xFB380000;
  v350 = v349 - ((2 * v349) & 0x1618F89A);
  v351 = (v128 >> 19) - ((2 * (v128 >> 19)) & 0x5335CD7C);
  HIDWORD(v128) = v329 ^ 1;
  LODWORD(v128) = v329 ^ 0x5D592DE8;
  v352 = v128 >> 2;
  HIDWORD(v128) = v329 ^ 0xDE9;
  LODWORD(v128) = v329 ^ 0x5D592000;
  v353 = v128 >> 13;
  v354 = (v870 ^ 0x4CBC2CF4) + (v347 ^ 0xFE9FD6DF) + ((2 * v347) & 0xFD3FADBE) + 23079202;
  v355 = ((v327 >> 3) ^ 0x875BCF2D)
       + (v845 ^ 0x5FE7A5DD)
       + (v328 ^ 0xA022338C)
       + ((v327 >> 2) & 0x2FFFEFCE ^ 0xF14871B5)
       + ((2 * v845) & 0xBFCF4BBA)
       - ((2 * v328) & 0xBFBB98E6)
       + (v354 ^ 0x6AFFF5FD)
       + ((2 * v354) & 0xD5FFEBFA);
  v356 = v355 + 3 - 2 * ((v355 + 217458819) & 0x528577F7 ^ (v355 + 3) & 5);
  v357 = (v329 ^ 0x5D592DE9)
       + (a61 ^ 0x4A33E5D3)
       - 536754999
       - ((2 * ((v329 ^ 0x5D592DE9) + (a61 ^ 0x4A33E5D3))) & 0xC0038992);
  v358 = ((v345 + 1664094095) ^ 0x683C73C2 ^ (v350 + 185367629))
       + (a62 ^ v357 ^ 0x104BD736 ^ ((a62 ^ 0xA39FB83A)
                                   + (v329 ^ 0x5D592DE9)
                                   + 1
                                   - ((2 * ((a62 ^ 0xA39FB83A) + (v329 ^ 0x5D592DE9) + 1)) & 0x5854A874)
                                   - 1406512070));
  v359 = (a66 ^ 0xD6B7C968) + (v342 ^ 0x6F7DFB6F) + ((2 * v342) & 0xDEFBF6DE) - 1870527343;
  v360 = (v359 ^ 0xBDDFFF7F) + ((2 * v359) & 0x7BBFFEFE) + (v358 ^ 0x60001081) - ((2 * v358) & 0x3FFFDEFC) + 1;
  LODWORD(v856) = v338;
  HIDWORD(v865) = v312;
  HIDWORD(v128) = v312 ^ 0xA;
  LODWORD(v128) = v312 ^ 0x5D59E080;
  HIDWORD(a45) = v128 >> 7;
  v361 = ((v338 >> 10) ^ 0x5FD958AE)
       + ((v338 >> 9) & 0x4F2FFC ^ 0x4D0EA0)
       - 1609013246
       + ((v348 + 2084922253) ^ (v351 - 1449466178) ^ 0xD5DF8533);
  HIDWORD(v867) = v296;
  v362 = ((v296 >> 3) ^ 0x2E1EC15F)
       + (v336 ^ 0xFFF79AFB)
       + (v854 ^ 0xBDEDD5BF)
       + ((v296 >> 2) & 0x3CF7BFD8 ^ 0xE3CA7D67)
       + ((2 * v336) & 0xFFEF35F6)
       + ((2 * v854) & 0x7BDBAB7E)
       + (v361 ^ 0x800E8408)
       - ((2 * v361) & 0xFFE2F7EE)
       + 3;
  v363 = (a61 ^ 0x176AC83A ^ v329)
       + (((v329 ^ 0x5D592DE9) + (a62 ^ 0x5C6047C5)) ^ 0x5C27A0C3)
       - ((2 * ((v329 ^ 0x5D592DE9) + (a62 ^ 0x5C6047C5))) & 0x47B0BE78)
       - 1546100931;
  v364 = (((a62 ^ 0x5C6047C5) + (a61 ^ 0xB5CC1A2C) + 1) ^ 0xDFF77976)
       + ((2 * ((a62 ^ 0x5C6047C5) + (a61 ^ 0xB5CC1A2C) + 1)) & 0xBFEEF2EC)
       + (v343 ^ 0xE0064622)
       + (v353 ^ 0xF9F71FFF)
       + (v352 ^ 0x3BDDDF7F)
       + ((2 * v353) & 0xF3EE3FFE)
       + ((2 * v352) & 0x77BBBEFE)
       - ((2 * v343) & 0x3FF373BA)
       + (v363 ^ 0xDB6F77FF)
       + ((2 * v363) & 0xB6DEEFFE)
       + 784189675
       + (v857 ^ 0x3F9B43D5 ^ (v360 - ((2 * v360 + 61127162) & 0x29A5C94E) - 156941916));
  v365 = v364 - 1096878080 - ((2 * v364) & 0x7D3DF616);
  HIDWORD(v856) = __PAIR64__(v312 ^ 0x1E08A, v312 ^ 0x5D580000) >> 18;
  LODWORD(a39) = v327;
  v366 = (v327 ^ 0x8521C650) + (v327 ^ 0x4BBC9C7D ^ (v362 - ((2 * v362 + 1091556946) & 0x62C54BA4) - 773156613)) + 1;
  v367 = v366 - ((2 * v366) & 0x4423AD0E);
  HIDWORD(v128) = HIDWORD(v870) ^ 0x4D;
  LODWORD(v128) = HIDWORD(v870) ^ 0xDC423A00;
  LODWORD(v844) = (v128 >> 7) - ((2 * (v128 >> 7)) & 0xE3CD0492);
  v368 = v365 + 779;
  v369 = (v365 + 779) ^ 0xBE9EFB0B;
  v370 = ((2 * (v369 + (v329 ^ 0x5D592DE9))) & 0x3FFCBDBE) + ((v369 + (v329 ^ 0x5D592DE9)) ^ 0x9FFE5EDF);
  HIDWORD(v842) = (__PAIR64__(v841, v843) >> 18) - ((2 * (__PAIR64__(v841, v843) >> 18)) & 0x90DFFAC2);
  HIDWORD(v128) = (v365 + 779) ^ 0xB;
  LODWORD(v128) = (v365 + 779) ^ 0xBE9EFB00;
  v371 = (v128 >> 6) + 2125142444 - ((2 * (v128 >> 6)) & 0xFD563962);
  HIDWORD(v128) = (v365 + 779) ^ 0x30B;
  LODWORD(v128) = (v365 + 779) ^ 0xBE9EF800;
  v372 = v128 >> 11;
  HIDWORD(v128) = (v365 + 779) ^ 0x1B0B;
  LODWORD(v128) = (v365 + 779) ^ 0xBE9EE000;
  v373 = v128 >> 13;
  HIDWORD(v128) = (v365 + 779) ^ 0x9EFB0B;
  LODWORD(v128) = (v365 + 779) ^ 0xBE000000;
  v374 = ((v128 >> 25) ^ 0x7BDEEFFF)
       - 2078212036
       + ((2 * (v128 >> 25)) & 0xF7BDDFFE)
       + ((v372 - ((2 * v372) & 0x697D47AA) + 884909013) ^ (v371 + 773) ^ 0x4A15BF64)
       + 4037;
  v375 = (a61 ^ 0xF4AD1ED8 ^ (v365 + 779)) + 1610719521 + v370;
  HIDWORD(v128) = (v365 + 779) ^ 0x1EFB0B;
  LODWORD(v128) = (v365 + 779) ^ 0xBE800000;
  v376 = v128 >> 22;
  v377 = (v356 - 545546126) ^ v870;
  HIDWORD(v128) = v377 ^ 0x6A4F9;
  LODWORD(v128) = v377 ^ 0x61C00000;
  LODWORD(v842) = (v128 >> 19) - ((2 * (v128 >> 19)) & 0x897F7756);
  HIDWORD(v128) = -796 - v365;
  LODWORD(v128) = (v365 + 779) ^ 0xBE9EFB08;
  v378 = v128 >> 2;
  v379 = (a61 ^ 0x4A33E5D3) + (v375 ^ 0x372FBFF6) + ((2 * v375) & 0x6E5F7FEC) - 925876214;
  v380 = (v379 ^ 0xFBFB2FFD)
       + ((2 * v379) & 0xF7F65FFA)
       + 67424259
       + (a62 ^ 0x973F5D61 ^ (v374 - ((2 * v374) & 0x96BE3548) - 882959708));
  v855 = __PAIR64__(v339, v377);
  HIDWORD(v128) = v377 ^ 0xA4F9;
  LODWORD(v128) = v377 ^ 0x61C60000;
  v381 = (v128 >> 17) - ((2 * (v128 >> 17)) & 0x62EBFB94);
  v382 = (v357 ^ 0xE001C4C9)
       + ((v369 + 1 + (v329 ^ 0xA2A6D216) - ((2 * (v369 + 1 + (v329 ^ 0xA2A6D216))) & 0x7DEC15DE) + 1056312047) ^ (v369 + (a61 ^ 0x4A33E5D3) - ((2 * (v369 + (a61 ^ 0x4A33E5D3))) & 0x65B1731C) + 853064078) ^ 0xF3D14C9E)
       + 1;
  v383 = (v376 ^ 0xB0C28A08)
       + (v378 ^ 0x7FFE9FDF)
       + (v373 ^ 0x7F7DFBFE)
       + ((2 * v378) & 0xFFFD3FBE)
       + ((2 * v373) & 0xFEFBF7FC)
       - ((2 * v376) & 0x9E7AEBEE)
       + (v382 ^ 0xDFFFB4FA)
       + ((2 * v382) & 0xBFFF69F4)
       + 1874928929
       + (v847 ^ 0x705FC0FF ^ (((2 * v380) & 0xFFDBBB7E)
                             + (v380 ^ 0x7FEDDDBF)
                             - ((2 * (((2 * v380) & 0xFFDBBB7E) + (v380 ^ 0x7FEDDDBF)) + 12707854) & 0x295C4010)
                             - 1794173937));
  HIDWORD(v846) = v367 + 571594375;
  v384 = (v367 + 571594375) ^ 0x1D687;
  v385 = (v367 + 571594375) ^ 0x22100000;
  v386 = __PAIR64__(v384, v385) >> 19;
  v387 = __PAIR64__(v384, v385) >> 17;
  v388 = v383 + 2017511046 - ((2 * v383) & 0xF0818D0C);
  v389 = (v368 ^ 0x416104F4)
       + (v388 ^ 0x7840C686)
       + 1502413600
       - ((2 * ((v368 ^ 0x416104F4) + (v388 ^ 0x7840C686) + 1)) & 0xB31A063E);
  HIDWORD(v128) = v388 ^ 0xC686;
  LODWORD(v128) = v388 ^ 0x78787878;
  v390 = v128 >> 22;
  HIDWORD(v128) = v388 ^ 0x686;
  LODWORD(v128) = v388 ^ 0x7840C000;
  v391 = (v128 >> 13) - ((2 * (v128 >> 13)) & 0x30BD97D8);
  HIDWORD(v128) = v388 ^ 0x686;
  LODWORD(v128) = v388 ^ 0x7840C000;
  v392 = (v128 >> 11) - ((2 * (v128 >> 11)) & 0xCF1354DE);
  HIDWORD(v128) = (v383 + 2017511046) ^ 2;
  LODWORD(v128) = v388 ^ 0x7840C684;
  v393 = (v128 >> 2) - ((2 * (v128 >> 2)) & 0x7843F07A);
  HIDWORD(v128) = v388 ^ 0x40C686;
  LODWORD(v128) = v388 ^ 0x78000000;
  v394 = (v128 >> 25) - ((2 * (v128 >> 25)) & 0xA8416524);
  v395 = (v390 ^ 0xB05AC184)
       - ((2 * v390) & 0x9F4A7CF6)
       + 1336229500
       + ((v393 - 1138624451) ^ (v391 - 1738617876) ^ 0x247F33D1);
  HIDWORD(v128) = v388 ^ 6;
  LODWORD(v128) = v388 ^ 0x7840C680;
  v396 = (v389 ^ ((v388 ^ 0x7840C686)
                + (v329 ^ 0x5D592DE9)
                - ((2 * ((v388 ^ 0x7840C686) + (v329 ^ 0x5D592DE9))) & 0x7FBDF0BA)
                - 1075906467) ^ 0xE653FB42)
       - v370;
  v397 = v369 - 2147415999 + ((2 * v388) ^ 0x8F7F7BF3) + ((4 * v388) & 0xFFFDEDFC ^ 0xE1010818) + 192;
  v398 = (a61 ^ 0x4A33E5D3)
       + ((v392 + 1737075311) ^ ((v128 >> 6) - ((2 * (v128 >> 6)) & 0xD0E72B24) - 395078254) ^ (v394 - 736054638) ^ 0xA4257290)
       + 1;
  v399 = ((2 * v329) ^ 0x61512429)
       + ((4 * v329) & 0xB7C6FFF4 ^ 0x3544B7A4)
       + (v397 ^ 0x21AC6010)
       - ((2 * v397) & 0xBCA73FDE)
       + (v398 ^ 0x77EDF5EB)
       + ((2 * v398) & 0xEFDBEBD6)
       + 1;
  v400 = (HIDWORD(v844) ^ 0x26AAAE90 ^ (v399 - ((2 * v399 + 13338154) & 0x127AD00) - 1057384043))
       + ((v395 - ((2 * v395) & 0x9A6B33E4) + 1295358450) ^ (v396 - ((2 * v396 + 1073528254) & 0xB8D6784C) + 2087295749) ^ 0x915EA5D4);
  v401 = v400 - 523289688 - ((2 * v400) & 0xC19E7750);
  HIDWORD(v128) = v401 ^ 0x28;
  LODWORD(v128) = v401 ^ 0xE0CF3B80;
  v402 = (v128 >> 6) - ((2 * (v128 >> 6)) & 0xFB748A06);
  HIDWORD(v128) = v401 ^ 0x1BA8;
  LODWORD(v128) = v401 ^ 0xE0CF2000;
  v403 = v128 >> 13;
  HIDWORD(v128) = v401 ^ 0xF3BA8;
  LODWORD(v128) = v401 ^ 0xE0C00000;
  v404 = v128 >> 22;
  v405 = (v386 ^ 0xA04AC200) + (v387 ^ 0xAEFD7BFF) + ((2 * v387) & 0x5DFAF7FE) - ((2 * v386) & 0xBF6A7BFE);
  LODWORD(v865) = v405 + 1 - 2 * ((v405 + 280478209) & 0x1724047F ^ (v405 + 1) & 0x18);
  v406 = (v388 ^ 0x87BF3979) + 1;
  v407 = (((v401 ^ 0xE0CF3BA8) + v406) ^ 0x7D75BB3F) - 2104867647 + ((2 * ((v401 ^ 0xE0CF3BA8) + v406)) & 0xFAEB767E);
  v408 = (v368 ^ 0x416104F4)
       + (((v401 ^ 0xE0CF3BA8) + (v388 ^ 0x7840C686)) ^ 0xBFF5FD9D)
       + ((2 * ((v401 ^ 0xE0CF3BA8) + (v388 ^ 0x7840C686))) & 0x7FEBFB3A)
       + 1074397796;
  v409 = ((2 * (v369 + 1 + (v401 ^ 0x1F30C457))) & 0xF7EAFDE6)
       + ((v369 + 1 + (v401 ^ 0x1F30C457)) ^ 0xFBF57EF3)
       + (v408 ^ 0xFF76EF9F)
       + ((2 * v408) & 0xFEEDDF3E);
  HIDWORD(v128) = v401 ^ 0xCF3BA8;
  LODWORD(v128) = v401 ^ 0xE0000000;
  v410 = v128 >> 25;
  HIDWORD(v128) = v401 ^ 0x3A8;
  LODWORD(v128) = v401 ^ 0xE0CF3800;
  v411 = (v389 ^ 0x598D031F)
       - 2147415999
       + ((v407 + (v368 ^ 0x5E51C0A3 ^ v401)) ^ 0x7FFEED5D)
       + ((2 * (v407 + (v368 ^ 0x5E51C0A3 ^ v401))) & 0xFFFDDABA);
  v412 = (v410 ^ 0x7ADFFFF5)
       + ((2 * v410) & 0xF5BFFFEA)
       - 2061500404
       + ((v402 + 2109359363) ^ ((v128 >> 11) - ((2 * (v128 >> 11)) & 0xBAA08E6A) - 581941451) ^ 0x5F15FDC9);
  v413 = (v329 ^ 0x5D592DE9) + (v412 ^ 0xFEFF7D96) + ((2 * v412) & 0xFDFEFB2C) + 16810602;
  v414 = ((v409 - ((2 * v409 + 153559772) & 0xEA822DEA) - 103503773) ^ 0x50580AC7 ^ (v413
                                                                                   - ((2 * v413) & 0x4A323864)
                                                                                   - 1525081038))
       + 672521749;
  HIDWORD(v128) = v400;
  LODWORD(v128) = v401 ^ 0xE0CF3BA8;
  v415 = v846 + (v414 ^ 0xD9ABBEBB) + ((2 * v414) & 0xB3577D76) + 643055941;
  v416 = ((v128 >> 2) ^ 0xD4D67EDE)
       + (v404 ^ 0x598DBDEE)
       + (v403 ^ 0x4000)
       + ((2 * (v128 >> 2)) & 0xA9ACFDBC)
       + ((2 * v404) & 0xB31B7BDC)
       - ((2 * v403) & 0xFFFF7FFF)
       + ((v411 + 2658) ^ 0xC4107C0)
       - ((2 * (v411 + 2658)) & 0xE77DF07E)
       + (v415 ^ 0x7F7FF77F)
       + ((2 * v415) & 0xFEFFEEFE);
  v417 = (2 * v416 - 1951070230) & 0xDED9E1D4;
  v416 -= 1253608225;
  v418 = v416 - v417;
  v419 = (v416 - v417) ^ 0x6F6CF0EA;
  v420 = v419 + (v401 ^ 0xE0CF3BA8) - 2003948803 - ((2 * (v419 + (v401 ^ 0xE0CF3BA8))) & 0x111C55FA);
  v421 = ((2 * v296) ^ 0xA71E823)
       + ((4 * v296) & 0xE7BFF9DC ^ 0xE31C2998)
       + 203424529
       + ((v377 >> 10) ^ 0xF5D237C8 ^ (v381 - 1317667382) ^ (v842 + 1153416107));
  HIDWORD(v128) = v416 ^ 2;
  LODWORD(v128) = v418 ^ 0x6F6CF0E8;
  v422 = v128 >> 2;
  HIDWORD(v128) = v418 ^ 0x10EA;
  LODWORD(v128) = v418 ^ 0x6F6CE000;
  v423 = v128 >> 13;
  HIDWORD(v128) = v418 ^ 0xAAAAAAAA;
  LODWORD(v128) = v418 ^ 0x6F6CF0C0;
  v424 = v128 >> 6;
  HIDWORD(v128) = v418 ^ 0x2CF0EA;
  LODWORD(v128) = v418 ^ 0x6F400000;
  v425 = v128 >> 22;
  HIDWORD(v128) = v418 ^ 0xEA;
  LODWORD(v128) = v418 ^ 0x6F6CF000;
  v426 = v128 >> 11;
  v881 = ((v844 - 236551607) ^ (HIDWORD(v870) >> 3) ^ (HIDWORD(v842) + 1215298913) ^ 0x5DFEC79E)
       + 4198664
       + (v421 ^ 0xFFBFDFEF)
       + ((2 * v421) & 0xFF7FBFDE);
  v427 = (v388 ^ 0xE8D3C993 ^ v418) + (v420 ^ 0x888E2AFD) + 1;
  HIDWORD(v128) = v418 ^ 0x16CF0EA;
  LODWORD(v128) = v418 ^ 0x6E000000;
  v428 = ((v419 + v406 - ((2 * (v419 + v406)) & 0xDCA9A89E) + 1851053135) ^ v420 ^ 0xE6DAFEB2) + v407;
  v429 = v369
       + (v426 ^ 0x6B41918)
       + ((v128 >> 25) ^ 0xF2B34F6F)
       + (v424 ^ 0x3EEE76CD)
       + ((2 * (v128 >> 25)) & 0xE5669EDE)
       + ((2 * v424) & 0x7DDCED9A)
       - ((2 * v426) & 0xF297CDCE)
       - 945151828;
  v430 = (v429 ^ 0xFDAFBFDF)
       + ((2 * v429) & 0xFB5F7FBE)
       + 38813729
       + (v388 ^ 0x891F5504 ^ (v427 - ((2 * v427) & 0xE2BF2704) - 245394558));
  v431 = (v425 ^ 0x38A02224)
       + (v423 ^ 0x80C02113)
       + (v422 ^ 0xCFF3FFEB)
       + ((2 * v422) & 0x9FE7FFD6)
       - ((2 * v425) & 0x8EBFBBB6)
       - ((2 * v423) & 0xFE7FBDD8)
       + (v428 ^ 0xDFEFC7AF)
       + ((2 * v428) & 0xBFDF8F5E);
  v432 = (v848 ^ 0x690D15D9) + (v430 ^ 0xF23FFFEF) + ((2 * v430) & 0xE47FFFDE) - 2099205870;
  v433 = v431 + (v432 ^ 0x733BDE7B) + ((2 * v432) & 0xE677BCF6) + 2;
  v434 = v433 - ((2 * v433 + 117452132) & 0x397EA1A6);
  v435 = v434 + 1077897093;
  v436 = (v434 + 1077897093) ^ 0x1CBF50D3;
  v437 = ((2 * (v436 + (v401 ^ 0xE0CF3BA8))) & 0x733FFF4E) + ((v436 + (v401 ^ 0xE0CF3BA8)) ^ 0x399FFFA7);
  HIDWORD(v128) = (v434 + 1077897093) ^ 0x13;
  LODWORD(v128) = (v434 + 1077897093) ^ 0x1CBF50C0;
  v438 = v128 >> 6;
  HIDWORD(v128) = (v434 + 1077897093) ^ 0x10D3;
  LODWORD(v128) = (v434 + 1077897093) ^ 0x1CBF4000;
  v439 = v128 >> 13;
  HIDWORD(v128) = (v434 + 1077897093) ^ 0xD3;
  LODWORD(v128) = (v434 + 1077897093) ^ 0x1CBF5000;
  v440 = v128 >> 11;
  v441 = (v418 ^ 0x90930F15) + 1;
  HIDWORD(v128) = (v434 + 1077897093) ^ 0xBF50D3;
  LODWORD(v128) = (v434 + 1077897093) ^ 0x1C000000;
  v442 = (v128 >> 25) + 749917999 + (~(2 * (v128 >> 25)) | 0xA69A51A3);
  HIDWORD(v128) = -1077897114 - v434;
  LODWORD(v128) = (v434 + 1077897093) ^ 0x1CBF50D0;
  v443 = v128 >> 2;
  v444 = (v436 + v441 + 952647845 - ((2 * (v436 + v441)) & 0x7190814A)) ^ 0x38C840A5 ^ (v437 - 966786983);
  v445 = (v440 ^ 0x7FD7F57F) + (v438 ^ 0x795F7EE5) + ((2 * v438) & 0xF2BEFDCA) + ((2 * v440) & 0xFFAFEAFE);
  HIDWORD(v128) = v435 ^ 0x3F50D3;
  LODWORD(v128) = v435 ^ 0x1C800000;
  v446 = (v401 ^ 0xE0CF3BA8) + ((v436 + v419) ^ 0xEED3EF7B) + ((2 * (v436 + v419)) & 0xDDA7DEF6) + v437;
  v447 = ((v128 >> 22) ^ 0xB6BDEF7B)
       + (v443 ^ 0xD7CF77EE)
       + (v439 ^ 0x82002C88)
       + ((2 * (v128 >> 22)) & 0x6D7BDEF6)
       + ((2 * v443) & 0xAF9EEFDC)
       - ((2 * v439) & 0xFBFFA6EE)
       + 1;
  v448 = (v442 ^ 0x626ACD36 ^ (v445 - 2 * ((v445 + 113806236) & 0x4ED81A1B ^ v445 & 3) + 1436591540))
       + (v388 ^ 0x7840C686);
  v449 = ((v444 - 231389574 - ((2 * v444) & 0xE46A8CF4)) ^ 0xF235467A) + (v401 ^ 0x8FA3CB42 ^ v418);
  v450 = (v867 ^ 0xBF558CD6) + ((v446 - 678686498) ^ 0xEFF37FDD) + ((2 * (v446 - 678686498)) & 0xDFE6FFBA) + 269254691;
  v451 = (v450 ^ 0xC0010C01)
       - ((2 * v450) & 0x7FFDE7FC)
       + (v448 ^ 0x3FFEDDEF)
       + ((2 * v448) & 0x7FFDBBDE)
       + ((v447 - ((2 * v447 - 555427812) & 0xDCF807FE) + 1575907341) ^ 0x20B713FA ^ (v449
                                                                                    - ((2 * v449) & 0x9D96200A)
                                                                                    + 1321930757))
       - 1695378935;
  v452 = v451 + 402276173 - ((2 * v451) & 0x2FF47E9A);
  v453 = v452 ^ 0x17FA3F4D;
  v454 = (((v452 ^ 0x17FA3F4D) + v441) ^ 0xBEDFF34F)
       + (((v452 ^ 0x17FA3F4D) + v436) ^ 0xBB0FFCF7)
       + ((2 * ((v452 ^ 0x17FA3F4D) + v436)) & 0x761FF9EE)
       + ((2 * ((v452 ^ 0x17FA3F4D) + v441)) & 0x7DBFE69E);
  HIDWORD(v128) = v452 ^ 1;
  LODWORD(v128) = v452 ^ 0x17FA3F4C;
  v455 = v128 >> 2;
  v456 = (v435 ^ 0xE340AF2C) + 1;
  v457 = (v452 ^ 0x17FA3F4D) + v456 - 1145192530 - ((2 * ((v452 ^ 0x17FA3F4D) + v456)) & 0x777B7F5C);
  HIDWORD(v128) = v452 ^ 0xD;
  LODWORD(v128) = v452 ^ 0x17FA3F40;
  v458 = v128 >> 6;
  HIDWORD(v128) = v452 ^ 0x74D;
  LODWORD(v128) = v452 ^ 0x17FA3800;
  v459 = v128 >> 11;
  HIDWORD(v128) = v452 ^ 0x1F4D;
  LODWORD(v128) = v452 ^ 0x17FA2000;
  v460 = v128 >> 13;
  HIDWORD(v128) = v452 ^ 0x1FA3F4D;
  LODWORD(v128) = v452 ^ 0x16000000;
  v461 = v128 >> 25;
  HIDWORD(v128) = v452 ^ 0x3A3F4D;
  LODWORD(v128) = v452 ^ 0x17C00000;
  v462 = (v459 ^ 0xA0100200)
       + (v461 ^ 0x6B3F0DF7)
       + (v458 ^ 0xB6F5D37F)
       + ((2 * v461) & 0xD67E1BEE)
       + ((2 * v458) & 0x6DEBA6FE)
       - ((2 * v459) & 0xBFDFFBFE)
       + 1035672714
       + (v418 ^ 0xFFADE935 ^ ((v457 ^ 0xBBBDBFAE)
                             + (v418 ^ 0x7896CFA7 ^ v452)
                             - ((2 * ((v457 ^ 0xBBBDBFAE) + (v418 ^ 0x7896CFA7 ^ v452))) & 0x218233BE)
                             - 1866393121));
  v463 = (v401 ^ 0xE0CF3BA8) + (v462 ^ 0x86424504) - ((2 * v462) & 0xF37B75F6) + 2042477308;
  v464 = (v460 ^ 0xFF7D96FF)
       + ((2 * v460) & 0xFEFB2DFE)
       + 8546561
       + (v418 ^ v435 ^ 0xB03D6ECB ^ (v454 - ((2 * v454 + 203431796) & 0x87DD9DE4) + 1241439916));
  v465 = (v455 ^ 0x6DF77FFF)
       + ((v128 >> 22) ^ 0x87BDBD79)
       + ((2 * v455) & 0xDBEEFFFE)
       + ((2 * (v128 >> 22)) & 0xF7B7AF2)
       + (v464 ^ 0x58408A00)
       - ((2 * v464) & 0x4F7EEBFE);
  v466 = (HIDWORD(v848) ^ 0x6ED89BDD) + (v463 ^ 0x7B7BDFE6) + ((2 * v463) & 0xF6F7BFCC) - 115429705;
  v467 = v465 + (v466 ^ 0xBD3FC6CF) + ((2 * v466) & 0x7A7F8D9E);
  v468 = (2 * v467 + 1771365234) & 0x49D4F08C;
  v467 += 431286783;
  v469 = v467 - v468;
  HIDWORD(v128) = v467 ^ 2;
  LODWORD(v128) = v469 ^ 0x24EA7844;
  v470 = v128 >> 2;
  HIDWORD(v128) = v469 ^ 6;
  LODWORD(v128) = v469 ^ 0x24EA7840;
  v471 = v128 >> 6;
  HIDWORD(v128) = v469 ^ 0x46;
  LODWORD(v128) = v469 ^ 0x24EA7800;
  v472 = v128 >> 11;
  HIDWORD(v128) = v469 ^ 0x1846;
  LODWORD(v128) = v469 ^ 0x24EA6000;
  v473 = v469 ^ 0x24EA7846;
  v474 = ((v128 >> 13) ^ 0xF9D7FBB5)
       + (v470 ^ 0x7FF1FFDF)
       + ((2 * v470) & 0xFFE3FFBE)
       + ((2 * (v128 >> 13)) & 0xF3AFF76A);
  v475 = (v472 ^ 0x1800702) + (v471 ^ 0xB672FFFE) + ((2 * v471) & 0x6CE5FFFC) - ((2 * v472) & 0xFCFFF1FA) + 1;
  HIDWORD(v128) = v469 ^ 0x2A7846;
  LODWORD(v128) = v469 ^ 0x24C00000;
  v476 = (v128 >> 22) - ((2 * (v128 >> 22)) & 0x847148FA);
  HIDWORD(v128) = v469 ^ 0xEA7846;
  LODWORD(v128) = v469 ^ 0x24000000;
  v477 = v435 ^ v452;
  v478 = (v477 ^ 0x44B154CA ^ v469 ^ ((v469 ^ 0x24EA7846)
                                    + v456
                                    - ((2 * ((v469 ^ 0x24EA7846) + v456)) & 0xD63C8624)
                                    + 1797145362))
       - 898248179;
  v479 = (v478 ^ 0xBDBDFBFB)
       + ((2 * v478) & 0x7B7BF7F6)
       + 1111622661
       + (v418 ^ ((v128 >> 25) - ((2 * (v128 >> 25)) & 0xA56C2282) - 759819967) ^ 0xF61E5FDE ^ (v475
                                                                                              - 1814972555
                                                                                              + (~(2 * v475 - 1877347842) | 0x68768315)));
  v480 = (HIDWORD(v849) ^ 0x7FC0B93B ^ (v479 - ((2 * v479) & 0x897C5F28) - 994168940))
       + (v477 ^ v457 ^ (v476 - 1036475267) ^ 0x8D08635E ^ (v474 - ((2 * v474 + 208406744) & 0xFF902E26) - 2046944385));
  v481 = v480 - 2125588480 - ((2 * v480) & 0x29C3F08);
  v482 = (v469 ^ 0x24EA7846) + (v452 ^ 0x17FA3F4D) - ((2 * ((v469 ^ 0x24EA7846) + (v452 ^ 0x17FA3F4D))) & 0x71010F08);
  v483 = v481 + 1924;
  v484 = (v481 + 1924) ^ 0x814E1F84;
  v485 = (v452 ^ 0xE805C0B2) + v484 + 1 - ((2 * ((v452 ^ 0xE805C0B2) + v484 + 1)) & 0xA6A0137A);
  HIDWORD(v128) = (v481 + 1924) ^ 0x14E1F84;
  LODWORD(v128) = v481 - 2147481724;
  v486 = v128 >> 25;
  HIDWORD(v128) = (v481 + 1924) ^ 4;
  LODWORD(v128) = (v481 + 1924) ^ 0x814E1F80;
  v487 = v128 >> 6;
  v488 = v484 + (v469 ^ 0x24EA7846) + 1189952680 - ((2 * (v484 + (v469 ^ 0x24EA7846))) & 0x8DDA7950);
  HIDWORD(v128) = v483 ^ 0x1F84;
  LODWORD(v128) = v483 ^ 0x814E0000;
  v489 = v128 >> 13;
  HIDWORD(v128) = v483 ^ 0x784;
  LODWORD(v128) = v483 ^ 0x814E1800;
  v490 = ((v128 >> 11) ^ 0x80224A)
       + (v487 ^ 0xFF6FFFEB)
       + ((2 * v487) & 0xFEDFFFD6)
       - ((2 * (v128 >> 11)) & 0xFEFFBB6A)
       + 1;
  v491 = (v452 ^ 0x17FA3F4D)
       + (((v452 ^ 0x96B420C9 ^ v483) + (v469 ^ 0x24EA7846)) ^ 0xF7FF5DCF)
       + ((2 * ((v452 ^ 0x96B420C9 ^ v483) + (v469 ^ 0x24EA7846))) & 0xEFFEBB9E)
       + 134259249;
  HIDWORD(v128) = v483 ^ 0xE1F84;
  LODWORD(v128) = v483 ^ 0x81400000;
  v492 = ((v486 - ((2 * v486) & 0x505D8C0C) - 1473329658) ^ 0x7A114903 ^ (v490
                                                                        - ((2 * v490 + 2079636) & 0xA47F1E0A)
                                                                        - 766546737))
       + v436;
  v493 = v484 + (v491 ^ 0x50008030) - ((2 * v491) & 0x5FFEFF9E) - 1342210096;
  v494 = (v849 ^ 0x3498719D)
       + (v493 ^ 0xF77EF7FF)
       + ((2 * v493) & 0xEEFDEFFE)
       + (v492 ^ 0x3F8FD61C)
       + ((2 * v492) & 0x7F1FAC38);
  v495 = (v489 ^ 0x8F028A01)
       + ((__PAIR64__(v483, v484) >> 2) ^ 0xFF6D9FCF)
       + ((v128 >> 22) ^ 0xA0609885)
       + ((2 * (__PAIR64__(v483, v484) >> 2)) & 0xFEDB3F9E)
       - ((2 * (v128 >> 22)) & 0xBF3ECEF4)
       - ((2 * v489) & 0xE1FAEBFC)
       + ((v482 - 1199536252) ^ v488 ^ 0xAD3DB291 ^ (v485 + 1397754301))
       - 785433173;
  v496 = ((2 * v495) & 0xF2F3E798)
       + (v495 ^ 0x7979F3CC)
       + ((v494 + 727728131) ^ 0xF7B775FF)
       + ((2 * (v494 + 727728131)) & 0xEF6EEBFE);
  v497 = v496 - ((2 * v496 + 496839786) & 0xAE7B9F3E);
  v498 = v497 + 1712088532;
  HIDWORD(v128) = (v497 + 1712088532) ^ 0x1F;
  LODWORD(v128) = (v497 + 1712088532) ^ 0xD73DCF80;
  v499 = v128 >> 6;
  v500 = (v497 + 1712088532) ^ 0xD73DCF9F;
  v501 = ((v500 + v484) ^ 0xFB4FEEEF) + (v469 ^ 0xC284826 ^ (v497 + 1712088532)) + ((2 * (v500 + v484)) & 0xF69FDDDE);
  HIDWORD(v128) = (v497 + 1712088532) ^ 0xF9F;
  LODWORD(v128) = (v497 + 1712088532) ^ 0xD73DC000;
  v502 = v128 >> 13;
  HIDWORD(v128) = ~(v497 + 1712088556);
  LODWORD(v128) = (v497 + 1712088532) ^ 0xD73DCF9C;
  v503 = v128 >> 2;
  v504 = (v497 + 1712088532) ^ v483;
  v505 = (v504 ^ 0x4DC2F0CE ^ (v500 + (v469 ^ 0x24EA7846) - ((2 * (v500 + (v469 ^ 0x24EA7846))) & 0x376241AA) + 464593109))
       + (v488 ^ 0x46ED3CA8);
  HIDWORD(v128) = v498 ^ 0xFFFFFF9F;
  LODWORD(v128) = v498 ^ 0xD73DC800;
  v506 = (v128 >> 11) - ((2 * (v128 >> 11)) & 0x598EE5C2) - 1396215071;
  HIDWORD(v128) = v506 ^ 0x772E1;
  LODWORD(v128) = v506 ^ 0xACC00000;
  v507 = (v128 >> 19) - ((2 * (v128 >> 19)) & 0xB434AC94);
  HIDWORD(v128) = v498 ^ 0x13DCF9F;
  LODWORD(v128) = v498 ^ 0xD6000000;
  v508 = v128 >> 25;
  v507 += 1511675466;
  HIDWORD(v128) = v507 ^ 0x164A;
  LODWORD(v128) = v507 ^ 0x5A1A4000;
  v509 = v128 >> 13;
  v510 = (v502 ^ 0x12000BA0) + (v503 ^ 0x6FB75ABB) + ((2 * v503) & 0xDF6EB576) - ((2 * v502) & 0xDBFFE8BE);
  HIDWORD(v128) = v498 ^ 0x3DCF9F;
  LODWORD(v128) = v498 ^ 0xD7000000;
  v511 = v453
       + (v508 ^ 0xC2828CF)
       + (v499 ^ 0x37820A40)
       - ((2 * v499) & 0x90FBEB7E)
       - ((2 * v508) & 0xE7AFAE60)
       + (v509 ^ 0x7D7FAFFD)
       + ((2 * v509) & 0xFAFF5FFA)
       + 1054219508;
  v512 = (v469 ^ 0xCEFF0175 ^ (v501 - ((2 * v501 + 157295140) & 0xD42AF266) - 289043899))
       + (v511 ^ 0x4BEAF9DE)
       + ((2 * v511) & 0x97D5F3BC)
       - 1273690590;
  v513 = (HIDWORD(v850) ^ 0x99530634) + (v512 ^ 0xFB707DDF) + ((2 * v512) & 0xF6E0FBBE) - 1977325525;
  v514 = (((v128 >> 22) - ((2 * (v128 >> 22)) & 0x21E2DFFA) - 1863225347) ^ (v505
                                                                           - ((2 * v505) & 0x5B173362)
                                                                           - 1383360079) ^ (v510
                                                                                          + 1
                                                                                          - ((2 * (v510 + 1) + 1016148808) & 0x255DD688)
                                                                                          - 1862826776) ^ 0x2FD41D08)
       + 344657
       + (v513 ^ 0xFFFABDAF)
       + ((2 * v513) & 0xFFF57B5E);
  v515 = (2 * v514) & 0x4FA6DF84;
  v514 -= 1479315518;
  v516 = v514 - v515;
  HIDWORD(v128) = v514 ^ 2;
  LODWORD(v128) = v516 ^ 0xA7D36FC0;
  v517 = (v128 >> 2) - ((2 * (v128 >> 2)) & 0xD31060EC);
  HIDWORD(v128) = v516 ^ 0xFC2;
  LODWORD(v128) = v516 ^ 0xA7D36000;
  v518 = (v128 >> 13) - ((2 * (v128 >> 13)) & 0x77FAB6E0);
  v519 = (v516 ^ 0xA7D36FC2) + v500 - 131958060 - ((2 * ((v516 ^ 0xA7D36FC2) + v500)) & 0xF044F5A8);
  HIDWORD(v128) = v516 ^ 0x136FC2;
  LODWORD(v128) = v516 ^ 0xA7C00000;
  v520 = v128 >> 22;
  HIDWORD(v128) = v516 ^ 0x7C2;
  LODWORD(v128) = v516 ^ 0xA7D36800;
  v521 = v128 >> 11;
  v517 += 1770532982;
  HIDWORD(v128) = v517 ^ 0x3076;
  LODWORD(v128) = v517 ^ 0x69880000;
  v522 = (v128 >> 15) - ((2 * (v128 >> 15)) & 0x4C4C94C6) - 1507440029;
  HIDWORD(v128) = v522 ^ 0x4A63;
  LODWORD(v128) = v522 ^ 0xA6260000;
  v523 = (v128 >> 17) + 14196710 + (~(2 * (v128 >> 17)) | 0xFE4EC035);
  HIDWORD(v128) = v516 ^ 2;
  LODWORD(v128) = v516 ^ 0xA7D36FC0;
  v524 = v128 >> 6;
  HIDWORD(v128) = v516 ^ 0x1D36FC2;
  LODWORD(v128) = v516 ^ 0xA6000000;
  v525 = (v520 ^ 0xFFE3EDF5) + ((2 * v520) & 0xFFC7DBEA) + 1839627 + ((v518 - 1141023888) ^ 0xBB25C495 ^ v523);
  v526 = v525 - ((2 * v525) & 0xACDE55E8);
  v527 = v519 ^ 0xF8227AD4;
  v528 = (((v516 ^ 0xA7D36FC2) + v484) ^ 0x7F757FE0)
       + ((2 * ((v516 ^ 0xA7D36FC2) + v484)) & 0xFEEAFFC0)
       - 2138406880
       + (v519 ^ 0xF8227AD4);
  v529 = (((v483 ^ 0x7EB1E07B)
         + (v516 ^ 0xA7D36FC2)
         + 1
         - ((2 * ((v483 ^ 0x7EB1E07B) + (v516 ^ 0xA7D36FC2) + 1)) & 0xD2569316)
         + 1764444555) ^ v519 ^ 0x9109335F)
       + (v504 ^ 0x5673D01B);
  v530 = v473
       + (v521 ^ 0xF3FDFFCF)
       + ((v128 >> 25) ^ 0x33FFC7BB)
       + ((2 * v521) & 0xE7FBFF9E)
       + ((2 * (v128 >> 25)) & 0x67FF8F76)
       - 670943114;
  v531 = (v524 ^ 0x80202698) - ((2 * v524) & 0xFFBFB2CE) + (v530 ^ 0xFE66DA4B) + ((2 * v530) & 0xFCCDB496);
  v532 = v484 + (v528 ^ 0x7A1E74F6) + ((2 * v528) & 0xF43CE9EC) - 2048816374;
  v533 = v531 + (v532 ^ 0x80383A1) - ((2 * v532) & 0xEFF8F8BC) + 2;
  v534 = ((v529 - ((2 * v529) & 0x59E11036) - 1393522661) ^ 0xFA9FA2EF ^ (v526 + 1450126068))
       + (v850 ^ 0x94037F7C ^ (v533 - ((2 * v533 + 947953396) & 0x60F857D6) + 1287420773));
  v535 = v534 - 1087184960 - ((2 * v534) & 0x7E65BF80);
  v536 = v535 ^ 0xBF32DFC0;
  v537 = (v535 ^ 0xBF32DFC0) + v500 - ((2 * ((v535 ^ 0xBF32DFC0) + v500)) & 0xB167C6AE);
  v538 = (v498 ^ 0x680F105F ^ v535)
       + (((v535 ^ 0xBF32DFC0) + (v516 ^ 0xA7D36FC2)) ^ 0x7FA7EDED)
       + ((2 * ((v535 ^ 0xBF32DFC0) + (v516 ^ 0xA7D36FC2))) & 0xFF4FDBDA)
       - 2141711853;
  HIDWORD(v128) = v534;
  LODWORD(v128) = v535 ^ 0xBF32DFC0;
  v539 = (v128 >> 2) - ((2 * (v128 >> 2)) & 0x777DB3A2) - 1145120303;
  HIDWORD(v128) = v539 ^ 0x3ED9D1;
  LODWORD(v128) = v539 ^ 0xBBBBBBBB;
  v540 = (v128 >> 23) + 540486158 - ((2 * (v128 >> 23)) & 0x406E541C);
  HIDWORD(v128) = v540 ^ 0x20372A0E;
  LODWORD(v128) = v540;
  v541 = v128 >> 30;
  HIDWORD(v128) = v535 ^ 0x7C0;
  LODWORD(v128) = v535 ^ 0xBF32D800;
  v542 = v128 >> 11;
  v543 = v541 - 884942848 - ((2 * v541) & 0x9681B206) + 259;
  HIDWORD(v128) = v543 ^ 0x103;
  LODWORD(v128) = v543 ^ 0xCB40D800;
  v544 = v128 >> 11;
  HIDWORD(v128) = v535 ^ 0x1FC0;
  LODWORD(v128) = v535 ^ 0xBF32C000;
  v545 = v128 >> 13;
  HIDWORD(v128) = v535 ^ 0x132DFC0;
  LODWORD(v128) = v535 ^ 0xBE000000;
  v546 = v128 >> 25;
  v547 = v537 + 1488184151;
  v548 = (v535 ^ 0xBF32DFC0)
       + (v516 ^ 0x582C903D)
       - 1775220252
       + (~(2 * ((v535 ^ 0xBF32DFC0) + (v516 ^ 0x582C903D) + 1)) | 0xD39F6C39)
       + 1;
  HIDWORD(v128) = v534;
  LODWORD(v128) = v535 ^ 0xBF32DFC0;
  v549 = (v542 ^ 0xEAAFBE6E)
       + (v546 ^ 0x6BAFE3F5)
       + ((v128 >> 6) ^ 0xDFFADFFE)
       + ((2 * v546) & 0xD75FC7EA)
       + ((2 * v542) & 0xD55F7CDC)
       + ((2 * (v128 >> 6)) & 0xBFF5BFFC);
  HIDWORD(v128) = v535 ^ 0x32DFC0;
  LODWORD(v128) = v535 ^ 0xBF000000;
  v550 = v483 ^ 0x82096BB4 ^ (v549 - ((2 * v549 + 55245630) & 0x68EE860) - 856886833);
  v551 = (v498 ^ 0x5C6DA35F ^ (v538 - ((2 * v538) & 0x16A0D980) - 1957663552)) - 2114705756;
  v552 = (v551 ^ 0x67EE7BDF) + ((2 * v551) & 0xCFDCF7BE) + v550 - 1743682527;
  v553 = ((v128 >> 22) ^ 0x6FFB79DE)
       + (v545 ^ 0xB3F2CDDF)
       + ((2 * (v128 >> 22)) & 0xDFF6F3BC)
       + ((2 * v545) & 0x67E59BBE)
       + (((v548 ^ v547 ^ 0xCE83AAB4) + v527) ^ 0x20400118)
       - ((2 * ((v548 ^ v547 ^ 0xCE83AAB4) + v527)) & 0xBF7FFDCE)
       + (v544 ^ 0x7FCFFF5F)
       + ((2 * v544) & 0xFF9FFEBE)
       + (HIDWORD(v851) ^ 0x9EB0C217 ^ (v552 - ((2 * v552) & 0xFC080D80) - 33290560))
       + 1006745548;
  v554 = v553 + 238100750;
  v555 = v553 + 238100750 - ((2 * v553) & 0x1C62420C) - 8;
  HIDWORD(v128) = v555 ^ 6;
  LODWORD(v128) = v555 ^ 0xE312100;
  v556 = v128 >> 6;
  HIDWORD(v128) = v555 ^ 0x312106;
  LODWORD(v128) = v555 ^ 0xE000000;
  v557 = (v128 >> 22) - ((2 * (v128 >> 22)) & 0xCEBC65C2);
  HIDWORD(v128) = v555 ^ 0x312106;
  LODWORD(v128) = v555 ^ 0xE000000;
  v558 = v128 >> 25;
  HIDWORD(v128) = v555 ^ 0x106;
  LODWORD(v128) = v555 ^ 0xE312000;
  v559 = (v558 ^ 0xFEFFEB97)
       + (v556 ^ 0x6B77DCBF)
       + ((v128 >> 11) ^ 0x182408)
       + ((2 * v558) & 0xFDFFD72E)
       + ((2 * v556) & 0xD6EFB97E)
       - ((2 * (v128 >> 11)) & 0xFFCFB7EE)
       + 1;
  HIDWORD(v128) = v554 ^ 2;
  LODWORD(v128) = v555 ^ 0xE312104;
  v560 = (v128 >> 2) - ((2 * (v128 >> 2)) & 0x99B4A170);
  v561 = (v555 ^ 0xE312106)
       + (v516 ^ 0xA7D36FC2)
       - ((2 * ((v555 ^ 0xE312106) + (v516 ^ 0xA7D36FC2))) & 0x143CFDF8)
       - 1977712900;
  v562 = ((2 * ((v555 ^ 0xE312106) + (v535 ^ 0xBF32DFC0))) & 0xFFEFB6CC)
       + (((v555 ^ 0xE312106) + (v535 ^ 0xBF32DFC0)) ^ 0x7FF7DB66)
       + (v561 ^ 0x75E18103);
  v563 = (v498 ^ 0xDC2AFDB3 ^ (v559 - ((2 * v559 + 182462274) & 0x162E6458) - 1601747507))
       + (v516 ^ 0x60F45A9C ^ (v562 - ((2 * v562 + 1067318) & 0x8E4E6ABC) + 1194285561));
  HIDWORD(v128) = v555 ^ 0x106;
  LODWORD(v128) = v555 ^ 0xE312000;
  v564 = v851 + (v563 ^ 0x2FCEE7B7) + ((2 * v563) & 0x5F9DCF6E);
  v565 = (v555 ^ v535 ^ 0x3B1D803A ^ v561) + (v548 ^ 0x963049E3);
  v566 = (((v128 >> 13) - ((2 * (v128 >> 13)) & 0xE19683A8) - 255114796) ^ (v560 + 1289375928) ^ (v557 + 1734226657) ^ 0xCA817571 ^ (v565 - ((2 * v565) & 0x239CADF8) + 298735356))
       + ((v564 + 267221282) ^ 0x3BADFDF5)
       + ((2 * (v564 + 267221282)) & 0x775BFBEA)
       - 1001258485;
  v567 = v566 + 775057280 - ((2 * v566) & 0x5C64DF00);
  v568 = (v555 ^ 0xF1CEDEF9)
       + (v567 ^ 0x2E326F80)
       - 1873171914
       - ((2 * ((v555 ^ 0xF1CEDEF9) + (v567 ^ 0x2E326F80) + 1)) & 0x20B3546A);
  HIDWORD(v128) = v567 ^ 0x326F80;
  LODWORD(v128) = v567 ^ 0x2E000000;
  v569 = v128 >> 22;
  HIDWORD(v128) = v567 ^ 0x326F80;
  LODWORD(v128) = v567 ^ 0x2E000000;
  v570 = v128 >> 25;
  HIDWORD(v128) = v566;
  LODWORD(v128) = v567 ^ 0x2E326F80;
  v571 = (v128 >> 6) - ((2 * (v128 >> 6)) & 0xD5054D8C);
  HIDWORD(v128) = v567 ^ 0xF80;
  LODWORD(v128) = v567 ^ 0x2E326000;
  v572 = (v128 >> 13) - ((2 * (v128 >> 13)) & 0x635E02C0);
  v573 = (v535 ^ 0x9100B040 ^ v567)
       + (((v567 ^ 0x2E326F80) + (v555 ^ 0xE312106)) ^ 0xFB1FDD97)
       + ((2 * ((v567 ^ 0x2E326F80) + (v555 ^ 0xE312106))) & 0xF63FBB2E)
       + 81797737;
  HIDWORD(v128) = v566;
  LODWORD(v128) = v567 ^ 0x2E326F80;
  v574 = (v569 ^ 0x401108)
       - 4202754
       - ((2 * v569) & 0xFF7FDDEE)
       + (((v128 >> 2) - ((2 * (v128 >> 2)) & 0x2EA9B230) - 1756047080) ^ (v572 - 1313930912) ^ 0x26FBD878)
       + 4090;
  v575 = (v573 - ((2 * v573) & 0xF5B1224) - 2018670318) ^ v555 ^ v535 ^ (v574 - ((2 * v574) & 0x279B0A10) - 1815247608);
  HIDWORD(v128) = v567 ^ 0x780;
  LODWORD(v128) = v567 ^ 0x2E326800;
  v576 = (v570 ^ 0x18080088)
       - ((2 * v570) & 0xCFEFFEEE)
       - 403177608
       + (((v128 >> 11) - ((2 * (v128 >> 11)) & 0x3F7ED2BC) - 1614845602) ^ (v571 + 1786947270) ^ 0xF53DCF98);
  HIDWORD(v128) = v575 ^ 0x163F2DC;
  LODWORD(v128) = v575 ^ 0xA4000000;
  v577 = (v128 >> 26) - 464857088 - ((2 * (v128 >> 26)) & 0xC895B72E) + 919;
  HIDWORD(v128) = v577 ^ 0x397;
  LODWORD(v128) = v577 ^ 0xE44AD800;
  v578 = (v535 ^ 0x40CD203F)
       + (v568 ^ ((v567 ^ 0x2E326F80)
                + (v535 ^ 0xBF32DFC0)
                - ((2 * ((v567 ^ 0x2E326F80) + (v535 ^ 0xBF32DFC0))) & 0x2AB750A)
                - 2125088123) ^ 0x110C10B0)
       + 1;
  v579 = (v578 ^ 0xAF3BBEFD)
       + ((2 * v578) & 0x5E777DFA)
       + 1355038979
       + (v516 ^ 0x65F3DF75 ^ (v576 - ((2 * v576) & 0x8441616E) - 1038045001));
  v580 = (HIDWORD(v852) ^ 0xE61A9453) + (v579 ^ 0x3DD4FBDA) + ((2 * v579) & 0x7BA9F7B4) + 800867604;
  v581 = (v128 >> 11) - ((2 * (v128 >> 11)) & 0x5E22EBB8) + 789673436;
  HIDWORD(v128) = v581 ^ 0x71175DC;
  LODWORD(v128) = v581 ^ 0x28000000;
  v582 = ((2 * v580) & 0xBFFFDE9E)
       + (v580 ^ 0x5FFFEF4F)
       + ((v128 >> 27) ^ 0x3FFFFEFF)
       + ((2 * (v128 >> 27)) & 0x7FFFFDFE);
  v583 = v582 + 322506754;
  v584 = v582 + 322506754 - ((2 * v582 + 1073750884) & 0x6671FCA0);
  v585 = v584 ^ 0xB338FE50;
  v586 = (v567 ^ 0xD1CD907F) + 1;
  v587 = (v584 ^ 0xB338FE50) + v586 + 607591614 - ((2 * ((v584 ^ 0xB338FE50) + v586)) & 0x486E397C);
  HIDWORD(v128) = v584 ^ 0x10;
  LODWORD(v128) = v584 ^ 0xB338FE40;
  v588 = v128 >> 6;
  HIDWORD(v128) = v584 ^ 0x650;
  LODWORD(v128) = v584 ^ 0xB338F800;
  v589 = v128 >> 11;
  HIDWORD(v128) = v584 ^ 0x1E50;
  LODWORD(v128) = v584 ^ 0xB338E000;
  v590 = v128 >> 13;
  v591 = (v567 ^ 0x9D0A91D0 ^ v584)
       + (((v584 ^ 0xB338FE50) + (v555 ^ 0xE312106)) ^ 0x7EF6B7EE)
       + ((2 * ((v584 ^ 0xB338FE50) + (v555 ^ 0xE312106))) & 0xFDED6FDC)
       - 2130098158;
  HIDWORD(v128) = v584 ^ 0x138FE50;
  LODWORD(v128) = v584 ^ 0xB2000000;
  v592 = v128 >> 25;
  HIDWORD(v128) = v583;
  LODWORD(v128) = v584 ^ 0xB338FE50;
  v593 = ((v128 >> 2) ^ 0xF9FDBFFD) + (v590 ^ 0x77BDBF7F) + ((2 * v590) & 0xEF7B7EFE) + ((2 * (v128 >> 2)) & 0xF3FB7FFA);
  HIDWORD(v128) = v584 ^ 0x38FE50;
  LODWORD(v128) = v584 ^ 0xB3000000;
  v594 = v536
       + (v588 ^ 0x64101100)
       + (v589 ^ 0x7DDF6FFF)
       + (v592 ^ 0x77FFEFF7)
       + ((2 * v589) & 0xFBBEDFFE)
       + ((2 * v592) & 0xEFFFDFEE)
       - ((2 * v588) & 0x37DFDDFE)
       - 1508864246;
  v595 = (v555 ^ 0xF656BAE5 ^ (v591 - ((2 * v591) & 0xF0CF37C6) - 127427613))
       + (v594 ^ 0xDFF5FEFF)
       + ((2 * v594) & 0xBFEBFDFE)
       + 537526529;
  v596 = (v555 ^ 0x42F620A9 ^ v584) + (v587 ^ 0x24371CBE) + 1;
  v597 = (v568 ^ 0x9059AA35) + (v596 ^ 0x17FEEFFC) + ((2 * v596) & 0x2FFDDFF8) - 402583548;
  v598 = (((v128 >> 22) - ((2 * (v128 >> 22)) & 0xF57CD02C) + 2059298838) ^ 0x7D0EF46 ^ (v593
                                                                                       - ((2 * v593 + 478740744) & 0xFADD0EA0)
                                                                                       + 196282324))
       + (v597 ^ 0x4AAFF39B)
       + ((2 * v597) & 0x955FE736)
       - 1253045147;
  v599 = (v852 ^ 0xF29A4F64) + (v595 ^ 0xFCFF7987) + ((2 * v595) & 0xF9FEF30E) + 1435067169;
  v600 = ((2 * v598) & 0x4DFFFBF6) + (v598 ^ 0x26FFFDFB) + (v599 ^ 0xAFF8FFDE) + ((2 * v599) & 0x5FF1FFBC);
  v601 = (2 * v600 + 1376650318) & 0x660ABAF0;
  v600 += 1544314783;
  v602 = v600 - v601;
  HIDWORD(v128) = (v600 - v601) ^ 0x578;
  LODWORD(v128) = (v600 - v601) ^ 0x33055800;
  v603 = v128 >> 11;
  HIDWORD(v128) = (v600 - v601) ^ 0x38;
  LODWORD(v128) = (v600 - v601) ^ 0x33055D40;
  v604 = v128 >> 6;
  HIDWORD(v128) = (v600 - v601) ^ 0x1D78;
  LODWORD(v128) = (v600 - v601) ^ 0x33054000;
  v605 = v128 >> 13;
  HIDWORD(v128) = (v600 - v601) ^ 0x1055D78;
  LODWORD(v128) = (v600 - v601) ^ 0x33333333;
  v606 = (v128 >> 25) - ((2 * (v128 >> 25)) & 0x1497ACA0);
  v607 = v602 ^ 0x33055D78;
  HIDWORD(v128) = v600;
  LODWORD(v128) = (v600 - v601) ^ 0x33055D78;
  v608 = (v605 ^ 0x3D7FBECF) + ((v128 >> 2) ^ 0xBAF4D31F) + ((2 * (v128 >> 2)) & 0x75E9A63E) + ((2 * v605) & 0x7AFF7D9E);
  v609 = (v602 ^ 0x33055D78) + v586;
  v610 = (v584 ^ 0x4CC701AF) + 1;
  v611 = (v602 ^ 0x33055D78) + v610;
  v612 = (v609 ^ 0x7B75DECE) + (v611 ^ 0xFE4BFF7E);
  v613 = v612 + ((2 * v611) & 0xFC97FEFC) + ((2 * v609) & 0xF6EBBD9C);
  v614 = (v603 ^ 0x188A010) + (v604 ^ 0x3FFF37BF) + ((2 * v604) & 0x7FFE6F7E) - ((2 * v603) & 0xFCEEBFDE);
  HIDWORD(v128) = v602 ^ 0x55D78;
  LODWORD(v128) = v602 ^ 0x33333333;
  v615 = v613 - 2 * ((v613 + 104735156) & 0x48F3DDDF ^ v612 & 1) - 818806894;
  v616 = v555 ^ v567 ^ (v606 - 1974741424) ^ v615 ^ (v614
                                                   + 1
                                                   - 2 * ((v614 + 1048062001) & 0x6E6CD8DB ^ (v614 + 1) & 8)
                                                   - 1394278141) ^ 0xCD79DDB;
  v617 = (((v128 >> 22) - ((2 * (v128 >> 22)) & 0x22EFC650) - 1854414040) ^ 0xF3C44931 ^ (v608
                                                                                        - ((2 * v608 + 253156388) & 0xC5675432)
                                                                                        + 1782519851))
       + (v587 ^ 0x933B3E9F ^ v615)
       + 1;
  v618 = (v617 ^ 0xDEFFFDFB)
       + ((2 * v617) & 0xBDFFFBF6)
       + 553648645
       + (HIDWORD(v853) ^ 0x4F23B86 ^ (v616 - 2 * ((v616 + 1922563192) & 0x6FEFC86D ^ v616 & 5) - 494418720));
  v619 = v618 - 2095159208 - ((2 * v618) & 0x63CD0B0);
  v620 = v619 ^ 0x831E6858;
  v621 = (v619 ^ 0x831E6858) + (v584 ^ 0xB338FE50) - ((2 * ((v619 ^ 0x831E6858) + (v584 ^ 0xB338FE50))) & 0xDBD44E1E);
  HIDWORD(v128) = v619 ^ 0x18;
  LODWORD(v128) = v619 ^ 0x831E6840;
  v622 = (v128 >> 6) - ((2 * (v128 >> 6)) & 0x52EE9ABA);
  HIDWORD(v128) = v619 ^ 0x11E6858;
  LODWORD(v128) = v619 ^ 0x83FFFFFF;
  v623 = (v128 >> 25) - ((2 * (v128 >> 25)) & 0xF646E3F2);
  HIDWORD(v128) = v619 ^ 0x58;
  LODWORD(v128) = v619 ^ 0x831E6800;
  v624 = v602 ^ v584;
  v625 = (((v624 ^ 0x803DA328) + v610) ^ 0x5F1ED7F6)
       + ((2 * ((v624 ^ 0x803DA328) + v610)) & 0xBE3DAFEC)
       - 1595856886
       + (v567 ^ ((v128 >> 11) - 1162428184 + (~(2 * (v128 >> 11)) | 0x8A927E31)) ^ (v622 - 1451799203) ^ (v623 + 2065920505) ^ 0x46D093C3);
  HIDWORD(v128) = v619 ^ 0x858;
  LODWORD(v128) = v619 ^ 0x831E6000;
  v626 = v128 >> 13;
  HIDWORD(v128) = v619 ^ 0x1E6858;
  LODWORD(v128) = v619 ^ 0x83000000;
  v627 = v128 >> 22;
  v628 = v619 ^ v602;
  HIDWORD(v128) = v618;
  LODWORD(v128) = v619 ^ 0x831E6858;
  v629 = (v624 ^ 0x7FC25CD7) + (v619 ^ v602 ^ 0xDDF1122F ^ (v621 + 1844061967)) + 1;
  v630 = (v627 ^ 0x6EFB9FB6)
       + (v626 ^ 0x7D7CF73C)
       + ((v128 >> 2) ^ 0x7FF9E4BB)
       + ((2 * v627) & 0xDDF73F6C)
       + ((2 * v626) & 0xFAF9EE78)
       + ((2 * (v128 >> 2)) & 0xFFF3C976)
       + (v629 ^ 0xEEF7FDEB)
       + ((2 * v629) & 0xDDEFFBD6)
       - 1533704600
       + (HIDWORD(a40) ^ 0x100C53FC ^ (((2 * v625) & 0xE97FBFE)
                                     + (v625 ^ 0x74BFDFF)
                                     - ((2 * (((2 * v625) & 0xE97FBFE) + (v625 ^ 0x74BFDFF)) + 920225790) & 0xE9B9752C)
                                     - 1874231659));
  v631 = v630 + 823891553 - ((2 * v630) & 0x62372CC2);
  HIDWORD(v128) = v631 ^ 0x1B9661;
  LODWORD(v128) = v631 ^ 0x31000000;
  v632 = (v128 >> 22) - ((2 * (v128 >> 22)) & 0x87674D4E);
  HIDWORD(v128) = v631 ^ 0xFFFFFFE1;
  LODWORD(v128) = v631 ^ 0x311B9640;
  v633 = v128 >> 6;
  HIDWORD(v128) = v631 ^ 0x661;
  LODWORD(v128) = v631 ^ 0x311B9000;
  v634 = ((v128 >> 11) ^ 0x280C149A)
       + (v633 ^ 0xEE7B7EBB)
       + ((2 * v633) & 0xDCF6FD76)
       - ((2 * (v128 >> 11)) & 0xAFE7D6CA)
       + 1;
  v635 = v631 ^ 0x311B9661;
  v636 = (v602 ^ 0x21ECB19 ^ v631)
       + (((v631 ^ 0x311B9661) + (v619 ^ 0x831E6858)) ^ 0x3BEE9DF7)
       + ((2 * ((v631 ^ 0x311B9661) + (v619 ^ 0x831E6858))) & 0x77DD3BEE)
       - 1005493751;
  HIDWORD(v128) = v631 ^ 0x11B9661;
  LODWORD(v128) = v631 ^ 0x30000000;
  v637 = (v128 >> 25) - ((2 * (v128 >> 25)) & 0xA2F9B972);
  HIDWORD(v128) = v631 ^ 1;
  LODWORD(v128) = v631 ^ 0x311B9660;
  v638 = (v128 >> 2) - ((2 * (v128 >> 2)) & 0xFF9874E4);
  HIDWORD(v128) = v631 ^ 0x1661;
  LODWORD(v128) = v631 ^ 0x311B8000;
  v639 = ((v637 - 780346183) ^ 0xABAAD49F ^ (v634 - ((2 * v634 - 755967660) & 0xF5AC104C) + 1682863312)) + v585;
  v640 = (v628 ^ 0x7B26355 ^ (v636 - ((2 * v636) & 0x6F52ACEA) - 1213639051))
       + ((v638 + 2144090738) ^ ((v128 >> 13) - ((2 * (v128 >> 13)) & 0x20F04B3E) + 276309407) ^ (v632 - 1011636569) ^ 0xAC07B94A);
  v641 = (v619 ^ 0x2B436832 ^ (v639 - ((2 * v639) & 0x50BA00D4) - 1470300054)) + 846739860;
  v642 = (a38 ^ 0xD672F482) + (v641 ^ 0xE6FFAFDB) + ((2 * v641) & 0xCDFF5FB6) + 419450918;
  v643 = ((2 * v640) & 0xFFFF6DAE) + (v640 ^ 0x7FFFB6D7) + (v642 ^ 0xFAEFBEAB) + ((2 * v642) & 0xF5DF7D56);
  v644 = v643 - ((2 * v643 + 169940220) & 0x51B2598A);
  v645 = v644 + 770291523;
  v646 = (v644 + 770291523) ^ 0xA8D92CC5;
  HIDWORD(v128) = (v644 + 770291523) ^ 5;
  LODWORD(v128) = (v644 + 770291523) ^ 0xA8D92CC0;
  v647 = (v128 >> 6) - ((2 * (v128 >> 6)) & 0xCB46CD62);
  HIDWORD(v128) = (v644 + 770291523) ^ 0xD92CC5;
  LODWORD(v128) = (v644 + 770291523) ^ 0xA8000000;
  v648 = v128 >> 25;
  HIDWORD(v128) = (v644 + 770291523) ^ 0x4C5;
  LODWORD(v128) = (v644 + 770291523) ^ 0xA8D92800;
  v649 = (v128 >> 11) - ((2 * (v128 >> 11)) & 0xBA4CAA56);
  HIDWORD(v128) = (v644 + 770291523) ^ 0xCC5;
  LODWORD(v128) = (v644 + 770291523) ^ 0xA8D92000;
  v650 = v128 >> 13;
  HIDWORD(v128) = (v644 - 1) ^ 1;
  LODWORD(v128) = (v644 + 770291523) ^ 0xA8D92CC4;
  v651 = (v648 ^ 0x73FDFFE7)
       + ((2 * v648) & 0xE7FBFFCE)
       - 1946025958
       + ((v649 - 584690389) ^ (v647 + 1705207473) ^ 0x477ACC65);
  v652 = (v650 ^ 0x21521209)
       + ((v128 >> 2) ^ 0xE3EFBDD4)
       + ((2 * (v128 >> 2)) & 0xC7DF7BA8)
       - ((2 * v650) & 0xBD5BDBEC)
       + 1;
  HIDWORD(v128) = v645 ^ 0x192CC5;
  LODWORD(v128) = v645 ^ 0xA8C00000;
  v653 = (v631 ^ 0xCEE4699E) + v646 + 1 - ((2 * ((v631 ^ 0xCEE4699E) + v646 + 1)) & 0x9023B26C) - 938354378;
  v654 = v607 + (v651 ^ 0x67F75F7F) + ((2 * v651) & 0xCFEEBEFE) - 1744265087;
  v655 = (((v128 >> 22) - ((2 * (v128 >> 22)) & 0xD3CA63F8) - 370855428) ^ 0x17A80C7E ^ (v652
                                                                                       - ((2 * v652 - 176398268) & 0xFC9A7B04)
                                                                                       - 116691548))
       + (v619 ^ ((v619 ^ 0x7CE197A7)
                + (v631 ^ 0x311B9661)
                + 1176974272
                + (~(2 * ((v619 ^ 0x7CE197A7) + (v631 ^ 0x311B9661) + 1)) | 0x73B19883)) ^ v645 ^ 0xA5F1AE15 ^ v653);
  v656 = ((2 * v619) ^ 0x7D42278F) + ((4 * v619) & 0xF6FDEE7C ^ 0x479A060) - 2071918399 + v646;
  v657 = (v656 ^ 0xDF3FEEEF) + ((2 * v656) & 0xBE7FDDDE) + 549458194 + (v653 ^ 0x37EE26C9);
  v658 = (v853 ^ 0xD157FE46)
       + (v657 ^ 0xEBABF645)
       + ((2 * v657) & 0xD757EC8A)
       + (v654 ^ 0xFFF7DB7F)
       + ((2 * v654) & 0xFFEFB6FE)
       + 1352779030;
  v659 = ((2 * v655) & 0xDDFDF9F4) + (v655 ^ 0xEEFEFCFA) + (v658 ^ 0xEBFCAFEB) + ((2 * v658) & 0xD7F95FD6);
  v660 = v659 - 69459501 - ((2 * v659 + 1242080822) & 0xADAF9D30) - 32;
  HIDWORD(v128) = v660 ^ 0xE98;
  LODWORD(v128) = v660 ^ 0xD6D7C000;
  v661 = v128 >> 13;
  v662 = v660 ^ 0xD6D7CE98;
  HIDWORD(v128) = v660 ^ 0x17CE98;
  LODWORD(v128) = v660 ^ 0xD6C00000;
  v663 = v128 >> 22;
  v664 = v631 ^ 0x99C2BAA4 ^ v645;
  v665 = v664 + v635 - ((2 * (v664 + v635)) & 0x650D1A7E);
  v666 = v664
       + (((v660 ^ 0xD6D7CE98) + v635) ^ 0xF76F5ADE)
       + ((2 * ((v660 ^ 0xD6D7CE98) + v635)) & 0xEEDEB5BC)
       + 143697186;
  HIDWORD(v128) = v660 ^ 0x698;
  LODWORD(v128) = v660 ^ 0xD6D7C800;
  v667 = v128 >> 11;
  HIDWORD(v128) = v660 ^ 0x18;
  LODWORD(v128) = v660 ^ 0xD6D7CE80;
  v668 = v128 >> 6;
  HIDWORD(v128) = v660 ^ 0xD7CE98;
  LODWORD(v128) = v660 ^ 0xD6000000;
  v669 = v620
       + ((v128 >> 25) ^ 0x8904C0A2)
       + (v667 ^ 0x93008789)
       + (v668 ^ 0x2026641)
       - ((2 * v667) & 0xD9FEF0EC)
       - ((2 * (v128 >> 25)) & 0xEDF67EBA)
       - ((2 * v668) & 0xFBFB337C)
       - 503819884;
  v670 = (v665 + 847678783) ^ 0x7F4A4F9A ^ (v669 - ((2 * v669) & 0x9B99854A) + 1305264805);
  HIDWORD(v128) = v659 - 69459501;
  LODWORD(v128) = v660 ^ 0xD6D7CE98;
  v671 = (v645 ^ 0x7E0EE25D ^ v660) + (v666 ^ 0x3212020D) - ((2 * v666) & 0x9BDBFBE4) - 840040973;
  v672 = (v663 ^ 0xFF3FD734)
       + (v661 ^ 0xFFBFF7FF)
       + ((v128 >> 2) ^ 0x737FBD7F)
       + ((2 * v663) & 0xFE7FAE68)
       + ((2 * v661) & 0xFF7FEFFE)
       + ((2 * (v128 >> 2)) & 0xE6FF7AFE)
       + (v671 ^ 0xF9E6B8FF)
       + ((2 * v671) & 0xF3CD71FE)
       - 1818641841
       + (a41 ^ 0xB45D51A8 ^ (v670 - 662400878 + (~(2 * v670 + 1590488644) | 0xADC3CD21)));
  v673 = v672 + 1609988268 - ((2 * v672) & 0xBFECF158);
  v674 = (v645 ^ 0x5726D33A) + (v673 ^ 0x5FF678AC) + 1;
  HIDWORD(v128) = v673 ^ 0x18AC;
  LODWORD(v128) = v673 ^ 0x5FF66000;
  v675 = v128 >> 13;
  HIDWORD(v128) = v673 ^ 0x2C;
  LODWORD(v128) = v673 ^ 0x5FF67880;
  v676 = v128 >> 6;
  v677 = v674 + 1369400955 - ((2 * v674) & 0xA33ECCF6);
  v678 = (v660 ^ 0x29283167) + 1;
  v679 = (v673 ^ 0x5FF678AC) + v678 - 662939320 - ((2 * ((v673 ^ 0x5FF678AC) + v678)) & 0xB0F8B290);
  HIDWORD(v128) = v673 ^ 0xAC;
  LODWORD(v128) = v673 ^ 0x5FF67800;
  v680 = v128 >> 11;
  v681 = (((v660 ^ 0xD6D7CE98) + v646) ^ 0x8D402482)
       - ((2 * ((v660 ^ 0xD6D7CE98) + v646)) & 0xE57FB6FA)
       + (((v677 ^ 0x519F667B) + (v679 ^ 0xD87C5948)) ^ 0xFFDFDFF7)
       + ((2 * ((v677 ^ 0x519F667B) + (v679 ^ 0xD87C5948))) & 0xFFBFBFEE)
       + 1;
  HIDWORD(v128) = v673 ^ 0x1F678AC;
  LODWORD(v128) = v673 ^ 0x5E000000;
  v682 = v635
       - 1652604933
       + ((v128 >> 25) ^ 0x2008004)
       + (v676 ^ 0xE280C238)
       + (v680 ^ 0x7DFF77DD)
       - ((2 * v676) & 0x3AFE7B8E)
       - ((2 * (v128 >> 25)) & 0xFBFEFFF6);
  HIDWORD(v128) = v672;
  LODWORD(v128) = v673 ^ 0x5FF678AC;
  v683 = v128 >> 2;
  v684 = ((v677 ^ v679 ^ 0x89E33F33) + v646 - ((2 * ((v677 ^ v679 ^ 0x89E33F33) + v646)) & 0x7AEC9948) + 1031163044) ^ 0xADBAEFE7 ^ (v682 + ((2 * v680) & 0xFBFEEFBA) + 1516 - ((2 * (v682 + ((2 * v680) & 0xFBFEEFBA) + 1516)) & 0x21994686) - 1865637053);
  HIDWORD(v128) = v673 ^ 0x3678AC;
  LODWORD(v128) = v673 ^ 0x5FC00000;
  v685 = ((v128 >> 22) ^ 0xAEFB7F7D)
       + (v683 ^ 0x7F9FEDF5)
       + (v675 ^ 0xE4D05A24)
       + ((2 * (v128 >> 22)) & 0x5DF6FEFA)
       + ((2 * v683) & 0xFF3FDBEA)
       - ((2 * v675) & 0x365F4BB6)
       + 1;
  v686 = (v870 ^ 0xF3D002A3 ^ (v684 - ((2 * v684 + 1845629730) & 0x8127A350) - 141239495))
       + ((v685 - ((2 * v685 + 422080722) & 0x39E10D9C) + 159694647) ^ 0x17A85B72 ^ (v681
                                                                                   - ((2 * v681 + 96466700) & 0x16B1BB78)
                                                                                   + 2117654850));
  v687 = v686 + 1975210037 - ((2 * v686) & 0xEB76A06A);
  v688 = v687 ^ 0x75BB5035;
  v689 = (v687 ^ 0x75BB5035)
       + (v673 ^ 0x5FF678AC)
       + 1057904863
       - ((2 * ((v687 ^ 0x75BB5035) + (v673 ^ 0x5FF678AC))) & 0x7E1CB1BE);
  HIDWORD(v128) = v687 ^ 0x35;
  LODWORD(v128) = v687 ^ 0x75BB5000;
  v690 = (v128 >> 11) - ((2 * (v128 >> 11)) & 0xE683BA36);
  v691 = ((2 * ((v687 ^ 0x75BB5035) + v678)) & 0xDDFDF7F4) + (((v687 ^ 0x75BB5035) + v678) ^ 0x6EFEFBFA);
  v692 = (v673 ^ 0x2A4D2899 ^ v687)
       + 1862204410
       - v691
       - ((2 * ((v673 ^ 0x2A4D2899 ^ v687) + 1862204410 - v691)) & 0x57EA03AE);
  HIDWORD(v128) = v687 ^ 0x35;
  LODWORD(v128) = v687 ^ 0x75BB5000;
  v693 = (v128 >> 6) - ((2 * (v128 >> 6)) & 0xF59A0948);
  HIDWORD(v128) = v687 ^ 0x1BB5035;
  LODWORD(v128) = v687 ^ 0x74000000;
  v694 = ((v128 >> 25) ^ 0x41B8411)
       - ((2 * (v128 >> 25)) & 0xF7C8F7DC)
       - 68912145
       + ((v693 + 2060256420) ^ (v690 + 1933696283) ^ 0x98CD9BF);
  HIDWORD(v128) = v687 ^ 0x3B5035;
  LODWORD(v128) = v687 ^ 0x75800000;
  v695 = v128 >> 22;
  v696 = v646 + (v694 ^ 0x2FD6EF98) + ((2 * v694) & 0x5FADDF30) - 802615192;
  HIDWORD(v128) = v687 ^ 1;
  LODWORD(v128) = v687 ^ 0x75BB5034;
  v697 = (v128 >> 2) - ((2 * (v128 >> 2)) & 0x44571DCC);
  HIDWORD(v128) = v687 ^ 0x1035;
  LODWORD(v128) = v687 ^ 0x75BB4000;
  v698 = (v660 ^ 0x8921B634 ^ v673)
       + ((v691 - 1862204410 + (v689 ^ 0x3F0E58DF)) ^ 0x76D7BFFF)
       + ((2 * (v691 - 1862204410 + (v689 ^ 0x3F0E58DF))) & 0xEDAF7FFE)
       - 1993850879;
  v699 = v660 ^ (v692 + 737477079) ^ 0x4B334C78 ^ (v696 - ((2 * v696) & 0x6C23066E) - 1240366281);
  v700 = (v695 ^ 0x81400005)
       - ((2 * v695) & 0xFD7FFFF4)
       + (((v128 >> 13) - ((2 * (v128 >> 13)) & 0x1742AF16) + 195123083) ^ (v697 - 1574203674) ^ 0xA98AD96D)
       + (v698 ^ 0xD6063002)
       - ((2 * v698) & 0x53F39FFA)
       - 1464217607;
  v701 = (v327 ^ 0x7ADE39AF) + ((v699 - 1298429573) ^ 0x1E6BFFE7) + ((2 * (v699 - 1298429573)) & 0x3CD7FFCE) - 510394343;
  v702 = ((2 * v700) & 0xBF77B736) + (v700 ^ 0xDFBBDB9B) + (v701 ^ 0xDBAF58FE) + ((2 * v701) & 0xB75EB1FC);
  v703 = v702 - 76348585;
  v704 = 2 * v702 + 153720526;
  v705 = (~v704 | 0x92439021) + v702 - 76348585;
  v706 = v705 ^ 0xB6DE37EF;
  HIDWORD(v128) = v704 - v703;
  LODWORD(v128) = v705 ^ 0xB6DE37EC;
  v707 = (v128 >> 2) - ((2 * (v128 >> 2)) & 0x413CA026);
  HIDWORD(v128) = v705 ^ 0xDE37EF;
  LODWORD(v128) = v705 ^ 0xB6000000;
  v708 = v128 >> 25;
  HIDWORD(v128) = v705 ^ 0x1E37EF;
  LODWORD(v128) = v705 ^ 0xB6C00000;
  v709 = v128 >> 22;
  v710 = (v687 ^ 0x75BB5035)
       + (((v705 ^ 0xB6DE37EF) + (v673 ^ 0x5FF678AC)) ^ 0x73C7FDF9)
       + ((2 * ((v705 ^ 0xB6DE37EF) + (v673 ^ 0x5FF678AC))) & 0xE78FFBF2)
       - 1942486521;
  v711 = (v705 ^ 0xB6DE37EF) + (v710 ^ 0x83082402) - ((2 * v710) & 0xF9EFB7FA) + 2096618494;
  HIDWORD(v128) = v705 ^ 0xFFFFFFEF;
  LODWORD(v128) = v705 ^ 0xB6DE3000;
  v712 = v128 >> 11;
  HIDWORD(v128) = v705 ^ 0xFFFFFFEF;
  LODWORD(v128) = v705 ^ 0xB6DE37C0;
  v713 = v128 >> 6;
  HIDWORD(v128) = v705 ^ 0x17EF;
  LODWORD(v128) = v705 ^ 0xB6DE2000;
  v714 = v705 ^ v687;
  v715 = (v709 ^ 0x32451004)
       - ((2 * v709) & 0x9B75DFF6)
       - 843386884
       + ((v707 + 547246099) ^ ((v128 >> 13) - ((2 * (v128 >> 13)) & 0x283B8594) + 337494730) ^ 0x348392D9);
  v716 = (v673 ^ 0x16D7B0BC ^ v705) + (v705 ^ v687 ^ 0xC36567DA) + 1;
  v717 = (v673 ^ 0x5FF678AC) + (v716 ^ 0x7DE1F38E) + ((2 * v716) & 0xFBC3E71C);
  v718 = (v715 ^ 0x7FFDE686)
       + ((2 * v715) & 0xFFFBCD0C)
       - 2147346054
       + (v689 ^ 0x89870642 ^ (v711 - ((2 * v711) & 0x6D12BD3A) - 1232511331));
  v719 = v662
       + (v708 ^ 0x2C3A3083)
       + (v713 ^ 0x2382802)
       + (v712 ^ 0xDDBDFDF6)
       - ((2 * v713) & 0xFB8FAFFA)
       - ((2 * v708) & 0xA78B9EF8)
       + ((2 * v712) & 0xBB7BFBEC)
       + ((v717 - 2111959950) ^ 0x88002610)
       - ((2 * (v717 - 2111959950)) & 0xEFFFB3DE)
       + 1808761717;
  v720 = (v718 ^ 0x7F767BFE)
       + ((2 * v718) & 0xFEECF7FC)
       - 2138471422
       + (v296 ^ 0x42F281FE ^ (((2 * v719) & 0x5CEEFEFC)
                             + (v719 ^ 0xAE777F7E)
                             - ((2 * (((2 * v719) & 0x5CEEFEFC) + (v719 ^ 0xAE777F7E)) + 904612110) & 0x7C4B1730)
                             + 421212191));
  v721 = v720 - 489236428 - ((2 * v720) & 0xC5ADB068);
  HIDWORD(v128) = v721 ^ 0x34;
  LODWORD(v128) = v721 ^ 0xE2D6D800;
  v722 = v128 >> 11;
  v723 = v721 ^ 0xE2D6D834;
  HIDWORD(v128) = v721 ^ 0x34;
  LODWORD(v128) = v721 ^ 0xE2D6D800;
  v724 = v128 >> 6;
  v725 = v705 ^ 0x5408EFDB ^ v721;
  v726 = (v687 ^ 0x689277FE ^ v721) + v725 + 1 - ((2 * ((v687 ^ 0x689277FE ^ v721) + v725 + 1)) & 0xAB72C21C);
  HIDWORD(v128) = v721 ^ 0xD6D834;
  LODWORD(v128) = v721 ^ 0xE3FFFFFF;
  v727 = v128 >> 25;
  v728 = ((2 * ((v721 ^ 0xE2D6D834) + (v705 ^ 0x4921C810) + 1)) & 0x7FEEFFFC)
       + (((v721 ^ 0xE2D6D834) + (v705 ^ 0x4921C810) + 1) ^ 0xBFF77FFE)
       + (((v687 ^ 0x75BB5035) + (v721 ^ 0x1D2927CB) + 1) ^ 0x9BF0FE66)
       + ((2 * ((v687 ^ 0x75BB5035) + (v721 ^ 0x1D2927CB) + 1)) & 0x37E1FCCC);
  HIDWORD(v128) = v721 ^ 0x1834;
  LODWORD(v128) = v721 ^ 0xE2D6C000;
  v729 = v128 >> 13;
  v730 = (v728 - ((2 * v728 + 137298744) & 0x3C658376) + 1112163159) ^ v687;
  v731 = (v727 ^ 0x82081028)
       + (v722 ^ 0x96014202)
       + (v724 ^ 0x99FEDF7F)
       + ((2 * v724) & 0x33FDBEFE)
       - ((2 * v727) & 0xFBEFDFAE)
       - ((2 * v722) & 0xD3FD7BFA)
       + 2;
  HIDWORD(v128) = v721 ^ 0x16D834;
  LODWORD(v128) = v721 ^ 0xE2C00000;
  v732 = v128 >> 22;
  HIDWORD(v128) = v730 ^ 0x89918E;
  LODWORD(v128) = v730 ^ 0xEB000000;
  v733 = (v128 >> 24) + 825487872 - ((2 * (v128 >> 24)) & 0x6267E5A4) + 210;
  HIDWORD(v128) = v733 ^ 0xD2;
  LODWORD(v128) = v733 ^ 0x3133F200;
  v734 = (v128 >> 8) - ((2 * (v128 >> 8)) & 0x1EF3D18A);
  HIDWORD(v128) = v720;
  LODWORD(v128) = v721 ^ 0xE2D6D834;
  v735 = (v732 ^ 0xE1005108)
       + (v729 ^ 0x8C00420A)
       + ((v128 >> 2) ^ 0x337FFC5F)
       + ((2 * (v128 >> 2)) & 0x66FFF8BE)
       - ((2 * v732) & 0x3DFF5DEE)
       - ((2 * v729) & 0xE7FF7BEA)
       + 2;
  v736 = (v673 ^ (v731 - ((2 * v731 + 468688042) & 0x79BFAB14) - 1965579297) ^ 0xEC5045E3 ^ (v734 - 1887835963))
       + 1088089828;
  v737 = (HIDWORD(v870) ^ 0x23BDC5B2) + (v736 ^ 0x4F5F7BF3) + ((2 * v736) & 0x9EBEF7E6) - 1331657714;
  v738 = (v714 ^ (v726 + 1438212366) ^ 0x4136E14 ^ (v735 - ((2 * v735 + 1056891162) & 0x259ED180) - 229713587))
       + (v737 ^ 0x7FF78A5F)
       + ((2 * v737) & 0xFFEF14BE)
       - 2146929247;
  v739 = v738 - 527458207 - ((2 * v738) & 0xC11F40C2);
  v740 = v739 ^ 0xE08FA061;
  v741 = (v739 ^ 0xE08FA061) + (v721 ^ 0xE2D6D834);
  HIDWORD(v128) = v739 ^ 0xFFFFFFE1;
  LODWORD(v128) = v739 ^ 0xE08FA040;
  v742 = (v128 >> 6) - ((2 * (v128 >> 6)) & 0xF83B9D54);
  HIDWORD(v128) = v739 ^ 1;
  LODWORD(v128) = v739 ^ 0xE08FA060;
  v743 = (v128 >> 2) - ((2 * (v128 >> 2)) & 0x795D076E);
  HIDWORD(v128) = v739 ^ 0x8FA061;
  LODWORD(v128) = v739 ^ 0xE0000000;
  v744 = v128 >> 25;
  HIDWORD(v128) = v739 ^ 0x61;
  LODWORD(v128) = v739 ^ 0xE08FA000;
  v745 = (v128 >> 11) - ((2 * (v128 >> 11)) & 0xCB0680AE);
  HIDWORD(v128) = v739 ^ 0xFA061;
  LODWORD(v128) = v739 ^ 0xE0800000;
  v746 = (v128 >> 22) - ((2 * (v128 >> 22)) & 0x7B14A98);
  HIDWORD(v128) = v739 ^ 0x61;
  LODWORD(v128) = v739 ^ 0xE08FA000;
  v747 = v739 ^ v705;
  v748 = (v744 ^ 0xEDFFBE77)
       + ((2 * v744) & 0xDBFF7CEE)
       + 302006666
       + ((v745 + 1703100503) ^ (v742 - 65155414) ^ 0x66617102);
  v749 = (v747 ^ 0xAB597EB3 ^ (v741 - ((2 * v741) & 0xFA11D27A) - 49747651)) + v706;
  v750 = v688 + (v748 ^ 0xF3B47BEC) + ((2 * v748) & 0xE768F7D8);
  v751 = v747 ^ 0x11B67E15 ^ (v741 - ((2 * v741) & 0x8FCFD336) + 1206380955);
  v752 = (HIDWORD(v865) ^ 0x5D59E08A)
       + (v749 ^ 0x7FFE7B74)
       + ((2 * v749) & 0xFFFCF6E8)
       + ((v750 + 206275604) ^ 0xFF37FF7B)
       + ((2 * (v750 + 206275604)) & 0xFE6FFEF6)
       + 1462309420;
  v753 = ((v751 + v725) ^ 0x80404580)
       + 2143268731
       + ((v743 - 1129413705) ^ ((v128 >> 13) - ((2 * (v128 >> 13)) & 0x5C81D10A) - 1371477883) ^ (v746 + 64529740) ^ 0x1136CE7E)
       - ((2 * (v751 + v725)) & 0xFF7F74FE)
       + 2821;
  v754 = ((2 * v753) & 0xFF8EEDF8) + (v753 ^ 0x7FC776FC) + (v752 ^ 0x1DDFDBF7) + ((2 * v752) & 0x3BBFB7EE);
  v755 = v754 - ((2 * v754 + 1152473626) & 0x47C26AC6);
  v756 = v755 - 2043026832;
  HIDWORD(v128) = (v755 - 2043026832) ^ 0xFFFFFFE3;
  LODWORD(v128) = (v755 - 2043026832) ^ 0x23E13540;
  v757 = v128 >> 6;
  HIDWORD(v128) = (v755 - 2043026832) ^ 0x563;
  LODWORD(v128) = (v755 - 2043026832) ^ 0x23E13000;
  v758 = v128 >> 11;
  HIDWORD(v128) = (v755 - 2043026832) ^ 0x1E13563;
  LODWORD(v128) = (v755 - 2043026832) ^ 0x22222222;
  v759 = (v128 >> 25) - ((2 * (v128 >> 25)) & 0x981A0D8A) - 871561531;
  v760 = (v758 ^ 0x5FBCFECE) + (v757 ^ 0x6ABBDB6A) + ((2 * v757) & 0xD577B6D4) + ((2 * v758) & 0xBF79FD9C);
  HIDWORD(v128) = (v755 - 2043026832) ^ 0x1563;
  LODWORD(v128) = (v755 - 2043026832) ^ 0x23E12000;
  v761 = (v128 >> 13) - ((2 * (v128 >> 13)) & 0xCBF87810) + 1711029256;
  v762 = (v739 ^ 0xC36E9502 ^ (v755 - 2043026832)) + (v721 ^ 0xC137ED57 ^ (v755 - 2043026832));
  v763 = ((v755 - 2043026832) ^ 0xDC1ECA9C) + 1;
  HIDWORD(v128) = 2043026823 - v755;
  LODWORD(v128) = (v755 - 2043026832) ^ 0x23E13560;
  v764 = (v128 >> 2) - ((2 * (v128 >> 2)) & 0x716EACC4);
  HIDWORD(v128) = v756 ^ 0x213563;
  LODWORD(v128) = v756 ^ 0x23C00000;
  v765 = v763 + (v739 ^ 0xE08FA061);
  v766 = v759 ^ 0x6D5664A8 ^ (v760 - ((2 * v760 + 1796098960) & 0x42B6C4DA) - 689797067);
  v767 = (v739 ^ 0xE08FA061) + ((v766 + v706) ^ 0x171FFF6F) + ((2 * (v766 + v706)) & 0x2E3FFEDE) - 387972975;
  v768 = (v721 ^ 0x2597855 ^ v739) + (v762 ^ 0x80A24508) - ((2 * v762) & 0xFEBB75EE) + 2136849144;
  v769 = (v768 ^ 0x5D7F9F1D)
       + ((2 * v768) & 0xBAFF3E3A)
       + ((v764 - 1195944350) ^ v761 ^ ((v128 >> 22) - ((2 * (v128 >> 22)) & 0xA6E87D6C) + 1400127158) ^ 0x8E3F54DC)
       - 1568644893;
  v770 = (v769 ^ 0xFE7FE7FF)
       + ((2 * v769) & 0xFCFFCFFE)
       + 25171969
       + (HIDWORD(v855) ^ 0x9E319D28 ^ (((2 * v767) & 0x75EFFFFE)
                                      + (v767 ^ 0xBAF7FFFF)
                                      - ((2 * (((2 * v767) & 0x75EFFFFE) + (v767 ^ 0xBAF7FFFF)) + 602893468) & 0x2ADC0438)
                                      - 1486505878));
  v771 = v770 + 1182267705 - ((2 * v770) & 0x8CEFF272);
  v772 = v756 ^ 0x23E13563;
  v773 = v771 ^ 0x4677F939;
  HIDWORD(v128) = v771 ^ 0x37F939;
  LODWORD(v128) = v771 ^ 0x46400000;
  v774 = v128 >> 22;
  v775 = (v739 ^ 0x5907A6A7 ^ v771)
       + (((v771 ^ 0x4677F939) + (v756 ^ 0x23E13563)) ^ 0x5FFE6EFD)
       + ((2 * ((v771 ^ 0x4677F939) + (v756 ^ 0x23E13563))) & 0xBFFCDDFA)
       - 1610510076;
  HIDWORD(v128) = v771 ^ 0x139;
  LODWORD(v128) = v771 ^ 0x4677F800;
  v776 = v128 >> 11;
  v777 = ((2 * v765) & 0x3FFFFD36) + (v765 ^ 0x1FFFFE9B) + (v775 ^ 0x6F7F2FDB) + ((2 * v775) & 0xDEFE5FB6);
  HIDWORD(v128) = v771 ^ 0x77F939;
  LODWORD(v128) = v771 ^ 0x46000000;
  v778 = v128 >> 25;
  HIDWORD(v128) = v771 ^ 0x1939;
  LODWORD(v128) = v771 ^ 0x4677E000;
  v779 = (v128 >> 13) - ((2 * (v128 >> 13)) & 0x3798C9DE);
  HIDWORD(v128) = v771 ^ 0xFFFFFFF9;
  LODWORD(v128) = v771 ^ 0x4677F900;
  v780 = v128 >> 6;
  HIDWORD(v128) = v771 ^ 1;
  LODWORD(v128) = v771 ^ 0x4677F938;
  v781 = (v774 ^ 0x132A202)
       - ((2 * v774) & 0xFD9ABBFA)
       - 20095490
       + ((v779 - 1681103633) ^ ((v128 >> 2) - ((2 * (v128 >> 2)) & 0x23E7DEE2) + 301199217) ^ 0x8A3F8B9E);
  v782 = v723
       + (v778 ^ 0x2C481840)
       + (v776 ^ 0x29E6FFBF)
       + (v780 ^ 0xB7DFBF54)
       + ((2 * v776) & 0x53CDFF7E)
       + ((2 * v780) & 0x6FBF7EA8)
       - ((2 * v778) & 0xA76FCF7E)
       - 235853651;
  v783 = (v756 ^ 0x23E13563) + (v782 ^ 0x6EF97FFF) + ((2 * v782) & 0xDDF2FFFE) - 1861844991;
  v784 = (v856 ^ 0xEDDBEDFB ^ (((2 * v783) & 0xFDBE5B3A)
                             + (v783 ^ 0x7EDF2D9D)
                             - 2
                             * ((((2 * v783) & 0xFDBE5B3A) + (v783 ^ 0x7EDF2D9D) + 32093732) & 0x16E6AE3F ^ (v783 ^ 0x7EDF2D9D) & 1)
                             + 2026923106))
       + ((v781 - ((2 * v781) & 0x9992972) - 2066967367) ^ (v777 - ((2 * v777 + 1627497236) & 0x52C2E986) + 434259533) ^ 0x2DADE07A);
  v785 = v784 - 751504256 - ((2 * v784) & 0xA669E922);
  v786 = v785 + 37;
  v787 = v785 + 17;
  v788 = (v785 + 17) ^ 0xD334F491;
  v789 = v788 + (v771 ^ 0x4677F939) - ((2 * (v788 + (v771 ^ 0x4677F939))) & 0xFF619DD2) + 2142293737;
  HIDWORD(v128) = v787 ^ 0x1491;
  LODWORD(v128) = v787 ^ 0xD334E000;
  v790 = (v128 >> 13) - ((2 * (v128 >> 13)) & 0x5570299E) - 1430776625;
  HIDWORD(v128) = v787 ^ 0x134F491;
  LODWORD(v128) = v787 ^ 0xD2000000;
  v791 = v128 >> 25;
  v792 = ((v763 + v788 - ((2 * (v763 + v788)) & 0x3ECE2826) - 1620634605) ^ v789 ^ 0xE0D7DAFA) + (v756 ^ 0x23E13563);
  HIDWORD(v128) = v786 ^ 1;
  LODWORD(v128) = v787 ^ 0xD334F490;
  v793 = (v128 >> 2) - ((2 * (v128 >> 2)) & 0x43343778);
  HIDWORD(v128) = v787 ^ 0x11111111;
  LODWORD(v128) = v787 ^ 0xD334F480;
  v794 = v128 >> 6;
  HIDWORD(v128) = v787 ^ 0x34F491;
  LODWORD(v128) = v787 ^ 0xD3000000;
  v795 = v128 >> 22;
  HIDWORD(v128) = v787 ^ 0x491;
  LODWORD(v128) = v787 ^ 0xD334F000;
  v796 = (v771 ^ 0x95430DA8 ^ v787) + (v756 ^ 0xF0D5C1F2 ^ v787);
  v797 = (v756 ^ 0x6596CC5A ^ v771) + (v796 ^ 0xFFBFB7CF) + ((2 * v796) & 0xFF7F6F9E) + 4212785;
  v798 = v740
       + (v791 ^ 0x42470C10)
       + (v794 ^ 0x15064588)
       + ((v128 >> 11) ^ 0x7EF5EFFF)
       - ((2 * v794) & 0xD5F374EE)
       - ((2 * v791) & 0x7B71E7DE)
       + ((2 * (v128 >> 11)) & 0xFDEBDFFE)
       + 700235369;
  v799 = (v795 ^ 0x20DC0804) - ((2 * v795) & 0xBE47EFF6) - 551290884 + (v790 ^ (v793 - 1583735876) ^ 0xB220F73);
  v800 = (v855 ^ 0x61C6A4F9)
       + (v792 ^ 0xFFD57DF6)
       + (v798 ^ 0xC3EF69BB)
       + ((2 * v792) & 0xFFAAFBEC)
       + ((2 * v798) & 0x87DED376)
       - 231582322;
  v801 = ((v797 - ((2 * v797) & 0x75E64EBE) - 1158469793) ^ 0xEF383821 ^ (v799 - ((2 * v799) & 0xAB963EFC) + 1439375230))
       + (v800 ^ 0x779FC0FB)
       + ((2 * v800) & 0xEF3F81F6)
       - 2006958331;
  v802 = v801 + 366854144 - ((2 * v801) & 0x2BBB9E6E);
  v803 = v802 + 3895;
  v804 = ((2 * ((v802 + 3895) ^ v787)) & 0xD9FFFBFA ^ 0x89D27348) + ((v802 + 3895) ^ v787 ^ 0x2A16C65B);
  v805 = (v802 + 3895) ^ 0x15DDCF37;
  v806 = ((v805 + (v771 ^ 0x4677F939)) ^ 0xC1A80A08) - ((2 * (v805 + (v771 ^ 0x4677F939))) & 0x7CAFEBEE) + v804 + 1;
  HIDWORD(v128) = (v802 + 3895) ^ 0xF37;
  LODWORD(v128) = (v802 + 3895) ^ 0x15DDC000;
  v807 = v128 >> 13;
  HIDWORD(v128) = (v802 + 3895) ^ 0xFFFFFFF7;
  LODWORD(v128) = (v802 + 3895) ^ 0x15DDCF00;
  v808 = v128 >> 6;
  HIDWORD(v128) = (v802 + 3895) ^ 0x737;
  LODWORD(v128) = (v802 + 3895) ^ 0x15DDC800;
  v809 = v128 >> 11;
  HIDWORD(v128) = (v802 + 3895) ^ 0x1DDCF37;
  LODWORD(v128) = (v802 + 3895) ^ 0x14000000;
  v810 = v128 >> 25;
  v811 = (v771 ^ 0x53AA360E ^ (v802 + 3895))
       + (((v787 ^ 0x2CCB0B6E) + v805 + 1) ^ 0xF7B2FDBD)
       + ((2 * ((v787 ^ 0x2CCB0B6E) + v805 + 1)) & 0xEF65FB7A)
       + 139264579;
  HIDWORD(v128) = -3896 - v802;
  LODWORD(v128) = (v802 + 3895) ^ 0x15DDCF34;
  v812 = v128 >> 2;
  HIDWORD(v128) = v803 ^ 0x1DCF37;
  LODWORD(v128) = v803 ^ 0x15C00000;
  v813 = v773 + (v811 ^ 0x1DE377D3) + ((2 * v811) & 0x3BC6EFA6) - 501446611;
  v814 = v772
       + (v809 ^ 0xC60069A4)
       + (v810 ^ 0xB8CBEBD)
       + (v808 ^ 0x30402400)
       + ((2 * v810) & 0x17197D7A)
       - ((2 * v809) & 0x73FF2CB6)
       - ((2 * v808) & 0x9F7FB7FE)
       - 30231649;
  v815 = (HIDWORD(v846) ^ 0xDDEE2978) + (v814 ^ 0xEDF7C75F) + (v813 ^ 0xCF71DDF7);
  v816 = (v807 ^ 0x4511804A)
       + (v812 ^ 0x5EFF6EFB)
       + ((v128 >> 22) ^ 0x20DA6A14)
       + ((2 * v812) & 0xBDFEDDF6)
       - ((2 * (v128 >> 22)) & 0xBE4B2BD6)
       - ((2 * v807) & 0x75DCFF6A)
       + 991209127
       + (v789 ^ 0x56EC2DE1 ^ (v806 - ((2 * v806 + 581955572) & 0x52B9C610) + 2058672898));
  v817 = ((2 * v816) & 0xFFFFBE7E)
       + (v816 ^ 0xFFFFDF3F)
       + ((v815 + ((2 * v814) & 0xDBEF8EBE) + ((2 * v813) & 0x9EE3BBEE) - 1222377336) ^ 0xFDDBFFA9)
       + ((2 * (v815 + ((2 * v814) & 0xDBEF8EBE) + ((2 * v813) & 0x9EE3BBEE) - 1222377336)) & 0xFBB7FF52);
  v818 = v817 - 1436363522 - ((2 * v817 + 71844400) & 0x507D67BC) - 8;
  HIDWORD(v128) = v818 ^ 0x1E;
  LODWORD(v128) = v818 ^ 0xA83EB3C0;
  v819 = v128 >> 6;
  HIDWORD(v128) = v818 ^ 0x3DE;
  LODWORD(v128) = v818 ^ 0xA83EB000;
  v820 = v128 >> 11;
  HIDWORD(v128) = v818 ^ 0x3EB3DE;
  LODWORD(v128) = v818 ^ 0xA8000000;
  v821 = v128 >> 25;
  HIDWORD(v128) = v818 ^ 0x3EB3DE;
  LODWORD(v128) = v818 ^ 0xA8000000;
  v822 = v128 >> 22;
  v823 = v818 ^ v787;
  v824 = v773
       + (v821 ^ 0x4402A00)
       + (v820 ^ 0xBEFDDF6B)
       + (v819 ^ 0xBF3FFDE)
       + ((2 * v820) & 0x7DFBBED6)
       + ((2 * v819) & 0x17E7FFBC)
       - ((2 * v821) & 0xF77FABFE);
  HIDWORD(v128) = (v817 - 1436363522) ^ 2;
  LODWORD(v128) = v818 ^ 0xA83EB3DC;
  v825 = v128 >> 2;
  HIDWORD(v128) = v818 ^ 0x13DE;
  LODWORD(v128) = v818 ^ 0xA83EA000;
  v826 = v788
       + (((v823 ^ 0x7B0A474F)
         + (((v818 ^ 0xA83EB3DE) + v805) ^ 0x3B87B9FA)
         + ((2 * ((v818 ^ 0xA83EB3DE) + v805)) & 0x770F73F4)
         - 998750714) ^ 0x42)
       - ((2
         * ((v823 ^ 0x7B0A474F)
          + (((v818 ^ 0xA83EB3DE) + v805) ^ 0x3B87B9FA)
          + ((2 * ((v818 ^ 0xA83EB3DE) + v805)) & 0x770F73F4)
          - 998750714)) & 0xFFFFFF7A);
  v827 = (v825 ^ 0x7E76D39F)
       + ((v128 >> 13) ^ 0x7D95D7EF)
       + (v822 ^ 0x92200114)
       + ((2 * v825) & 0xFCEDA73E)
       + ((2 * (v128 >> 13)) & 0xFB2BAFDE)
       - ((2 * v822) & 0xDBBFFDD6)
       + 1;
  v828 = (v823 ^ 0x7C917632 ^ ((v803 ^ 0xEA2230C8)
                             + (v818 ^ 0xA83EB3DE)
                             + 1
                             - ((2 * ((v803 ^ 0xEA2230C8) + (v818 ^ 0xA83EB3DE) + 1)) & 0xF3662FA)
                             + 127611261))
       - v804;
  v829 = ((v881 + 3850) ^ 0xEA75FDBF)
       + ((2 * (v881 + 3850)) & 0xD4EBFB7E)
       + ((v824 + 818804407) ^ 0x4DF87C5D)
       + ((v826 - 66) ^ 0xB4BFBF73)
       + ((2 * (v826 - 66)) & 0x697F7EE6)
       + ((2 * (v824 + 818804407)) & 0x9BF0F8BA)
       + 180427193
       + ((v828 - ((2 * v828 + 436206586) & 0x2E94A0A4) + 71978575) ^ (v827
                                                                     - ((2 * v827 - 475617606) & 0xB41F5BE6)
                                                                     - 874315440) ^ 0x4D45FDA1);
  v830 = v829 - 2002756791 - ((2 * v829) & 0x1140B692);
  HIDWORD(v128) = v830 ^ 0x349;
  LODWORD(v128) = v830 ^ 0x88A05800;
  return ((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, unint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, unint64_t, uint64_t, uint64_t, unint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, unint64_t))*(&off_100260750 + (int)((((int)((v858 ^ HIDWORD(v860) ^ (335 * (v858 ^ 0x494A2D47) - 671)) & (HIDWORD(v860) - v858) | HIDWORD(v860) & ~(_DWORD)v858) >= 0) * ((5 * (v858 ^ 0x494A2DCE)) ^ 0x2B8)) ^ (v858 - 1229597168))))(v858, (v128 >> 11) ^ 0xA00A02, (v830 ^ 0x88A05B49)+ (_DWORD)a44+ 1549813701+ (~(2 * ((v830 ^ 0x88A05B49) + (_DWORD)a44)) | 0x473F7075)+ 1, (v128 >> 11), 2033122798, ((v818 ^ 0x209EE897 ^ v830) + (v803 ^ 0x9D7D947E ^ v830)) ^ 0xDAE63BBF, 3939631488, 2292210505, a9, a10, a11, a12, a13, a14, a15,
           a16,
           a17,
           a18,
           a19,
           v832,
           v833,
           v834,
           v835,
           v836,
           v837,
           v838,
           v839,
           v840,
           v842,
           v844,
           v846,
           v848,
           v849,
           v850,
           v851,
           v852,
           v853,
           a38,
           a39,
           a40,
           a41,
           v855,
           v856,
           a44,
           a45,
           v858,
           v859,
           v860,
           v861,
           v862,
           v863,
           v865,
           v867,
           v870);
}

uint64_t sub_1001CD358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,unsigned int a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,unsigned int a57,unsigned int a58,unsigned int a59,unsigned int a60)
{
  int v60;
  int v61;
  uint64_t v62;

  return ((uint64_t (*)(_QWORD, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v62 + 8 * ((41 * (v61 != v60 + 1229597351)) ^ v60)) - (v60 ^ 0x28u) + 690))(a60, a59, a3, a58, a5, a19, a57, a47);
}

void sub_1001CD3D4()
{
  JUMPOUT(0x1001C33DCLL);
}

#error "1001D35E8: call analysis failed (funcsize=5128)"

void sub_1001D35EC()
{
  JUMPOUT(0x1001D31E0);
}

uint64_t sub_1001D35F4(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  _BOOL4 v69;
  int v70;
  unsigned int v71;
  unsigned int v72;
  unsigned int v73;
  int v74;
  unsigned int v75;
  unsigned int v76;
  unsigned int v77;
  int v78;
  int v79;
  int v80;
  unsigned int v81;
  int v82;
  unsigned int v83;
  unsigned int v84;
  unsigned int v85;
  int v86;
  unsigned int v87;
  int v88;
  int v89;
  int v90;
  unsigned int v91;
  int v92;
  unsigned int v93;
  unsigned int v94;

  LOBYTE(STACK[0x3A5]) = BYTE1(v65) ^ 0x44;
  LOBYTE(STACK[0x552]) = BYTE2(v67) ^ 0xB;
  LOBYTE(STACK[0x737]) = HIBYTE(v65) ^ 0xF4;
  LOBYTE(STACK[0x389]) = BYTE1(v67) ^ 0xE0;
  LOBYTE(STACK[0x56E]) = BYTE2(v65) ^ 0x20;
  LOBYTE(STACK[0x71B]) = HIBYTE(v67) ^ 0xE3;
  LOBYTE(STACK[0x76F]) = HIBYTE(v66) ^ 0x1B;
  LOBYTE(STACK[0x214]) = v66 ^ 0x62;
  LOBYTE(STACK[0x3C1]) = BYTE1(v64) ^ 0x1D;
  LOBYTE(STACK[0x58A]) = BYTE2(v64) ^ 0x75;
  LOBYTE(STACK[0x3DD]) = BYTE1(v66) ^ 0x6B;
  LOBYTE(STACK[0x753]) = HIBYTE(v64) ^ 0x48;
  LOBYTE(STACK[0x5A6]) = BYTE2(v66) ^ 0x1F;
  v69 = (HIDWORD(a12) - 1230202205) < 0x32FBDC55;
  v70 = *(unsigned __int8 *)((a5 - 1132) + 1491152648 + a15 - 1491152943);
  v71 = (a3 ^ 0x16BAD583) - 838698623 * (((2 * (v70 ^ 0x31)) & 0xFFFFFFE7) + (v70 ^ 0xDE9FFFC6)) - 1484772467;
  v72 = ((2 * v71) & 0x9DFFFD6A) + (v71 ^ 0x4EFFFEB5);
  v73 = (v72 - 1325399733) % 0x101;
  v74 = v64 ^ v68;
  v75 = v74
      + (((v63 ^ 0xCE93D11D) - 1325399733 + v72 + 1) ^ 0x4FFDFD9F)
      + ((2 * ((v63 ^ 0xCE93D11D) - 1325399733 + v72 + 1)) & 0x9FFBFB3E)
      - 1342045599;
  v76 = ((2 * v73) & 0x33E) + (v73 ^ 0xE6BB739F) + (v75 ^ 0xD7E77E3B) + ((2 * v75) & 0xAFCEFC76);
  v77 = v76 - ((2 * v76 - 2101732276) & 0xD2A81886) - 1431233943;
  v78 = v77 ^ v66;
  v79 = (v78 ^ 0x2DB84A75) + 1;
  v80 = v79 + v74 - ((2 * (v79 + v74)) & 0x41856184) - 1597853502;
  v81 = v79 + (v63 ^ 0x316C2EE2) - ((2 * (v79 + (v63 ^ 0x316C2EE2))) & 0xC2600664) - 516947150;
  v82 = (v81 ^ v78 ^ 0x3377B6B8) + 644140058;
  v83 = v82 ^ 0xFFFFF27F;
  v84 = (2 * v82) & 0xFFFFE4FE;
  if ((HIDWORD(a12) - 1230202205) >= 0x32FBDC55)
    v69 = (HIDWORD(a12) - 1230202205) > 0x32FBDC56;
  v85 = v77 ^ 0xFC6DEBDD;
  v86 = v85 + v83 + v84 + 3457;
  v87 = (v86 ^ 0xFFDD33EF)
      + (v80 ^ 0x5F3D4F3D)
      + ((2 * v86) & 0xFFBA67DE)
      - 2
      * (((v86 ^ 0xFFDD33EF) + (v80 ^ 0x5F3D4F3D) + ((2 * v86) & 0xFFBA67DE) + 2280466) & 0x4FDCA9 ^ ((v86 ^ 0xFFDD33EF) + (v80 ^ 0x5F3D4F3D)) & 1)
      + 7514298;
  v88 = v87 ^ v80;
  v89 = v87 ^ v81;
  v87 ^= 0x4FDCA8u;
  v90 = v87 + v85 + 200486236 - ((2 * (v87 + v85)) & 0x17E65AB8);
  v91 = (((v88 ^ 0xA08D6C6A) + v87) ^ 0xFFFF9F7C) + (v89 ^ 0x1E802065) + ((2 * ((v88 ^ 0xA08D6C6A) + v87)) & 0xFFFF3EF8);
  v92 = v90 ^ 0x32D3D44F ^ (v91 - ((2 * v91 + 49418) & 0x7241F226) + 958486936);
  v93 = v92 - ((2 * v92 - 1717201034) & 0x96EF223C) + 407526617;
  v94 = (((v93 ^ 0xCB77911E) + (v90 ^ 0xBF32D5C)) ^ 0x1148A400)
      - ((2 * ((v93 ^ 0xCB77911E) + (v90 ^ 0xBF32D5C))) & 0xDD6EB7FE)
      - 289973248
      + (v93 ^ v88 ^ 0xEAD02173 ^ ((v93 ^ 0xCB77911E)
                                 + (v93 ^ v89 ^ 0xD5F7B17B)
                                 + 1
                                 - ((2 * ((v93 ^ 0xCB77911E) + (v93 ^ v89 ^ 0xD5F7B17B) + 1)) & 0x255B80E)
                                 - 2127897593));
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)*(&off_100260750 + ((675 * !v69) ^ a5)) - 4))(86108246, 762686214, ((2 * v94) & 0xCFF15F3E)+ (v94 ^ 0x67F8AF9F)- ((2 * (((2 * v94) & 0xCFF15F3E) + (v94 ^ 0x67F8AF9F)) + 86108246) & 0x2D75AB06)- 649344594, 1325399733, a5, 855366741, 200486236, 5233832, a9, a10, a11, a12, a13, a14, a15, a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63);
}

void sub_1001D3B58()
{
  JUMPOUT(0x1001D3748);
}

uint64_t sub_1001D3B60@<X0>(int a1@<W2>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  int v7;
  int v8;
  _BOOL4 v9;

  LOBYTE(STACK[0x24C]) = v8 ^ 0x32;
  LOBYTE(STACK[0x415]) = BYTE1(v8) ^ 0xAE;
  LOBYTE(STACK[0x78B]) = HIBYTE(a1) ^ 0x23;
  LOBYTE(STACK[0x5DE]) = BYTE2(v8) ^ 0x87;
  LOBYTE(STACK[0x5C2]) = BYTE2(a1) ^ 0x8F;
  LOBYTE(STACK[0x230]) = a1 ^ 0xB6;
  LOBYTE(STACK[0x3F9]) = BYTE1(a1) ^ 0xE0;
  LOBYTE(STACK[0x268]) = v6 ^ 0xC2;
  LOBYTE(STACK[0x5FA]) = BYTE2(v6) ^ 0x75;
  LOBYTE(STACK[0x616]) = BYTE2(v7) ^ 0x1F;
  LOBYTE(STACK[0x44D]) = BYTE1(v7) ^ 0x6B;
  LOBYTE(STACK[0x7A7]) = HIBYTE(v8) ^ 9;
  LOBYTE(STACK[0x7C3]) = HIBYTE(v6) ^ 0x48;
  LOBYTE(STACK[0x284]) = v7 ^ 0x62;
  LOBYTE(STACK[0x431]) = BYTE1(v6) ^ 0x1D;
  LOBYTE(STACK[0x7DF]) = HIBYTE(v7) ^ 0x1B;
  v9 = (a6 + 1861178222) < 0xE29AFFD8 || (a6 + 1861178222) > 0xE29AFFD9;
  return ((uint64_t (*)(uint64_t, uint64_t))((char *)*(&off_100260750 + ((106 * !v9) ^ a2)) - 12))(2056409035, 2042673813);
}

void sub_1001D40F4()
{
  JUMPOUT(0x1001D3CBCLL);
}

uint64_t sub_1001D40FC(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10)
{
  int v10;
  int v11;
  int v12;
  int v13;
  char v14;
  _BOOL4 v15;

  LOBYTE(STACK[0x469]) = BYTE1(v13) ^ 6;
  LOBYTE(STACK[0x7FB]) = HIBYTE(v13) ^ 0xAA;
  LOBYTE(STACK[0x2BC]) = v10 ^ 0xD7;
  LOBYTE(STACK[0x2D8]) = v11 ^ 0xC2;
  LOBYTE(STACK[0x4A1]) = BYTE1(v11) ^ 0x1D;
  LOBYTE(STACK[0x817]) = HIBYTE(v10) ^ 4;
  LOBYTE(STACK[0x485]) = BYTE1(v10) ^ 0x1B;
  LOBYTE(STACK[0x64E]) = BYTE2(v10) ^ 0x59;
  LOBYTE(STACK[0x66A]) = BYTE2(v11) ^ 0x75;
  LOBYTE(STACK[0x2F4]) = v12 ^ 9;
  LOBYTE(STACK[0x632]) = BYTE2(v13) ^ 0xB7;
  LOBYTE(STACK[0x686]) = BYTE2(v12) ^ 0x4B;
  LOBYTE(STACK[0x833]) = HIBYTE(v11) ^ 0x48;
  v14 = ((v13 & 0x35 ^ 0xCE) + ((2 * (v13 & 0x35)) ^ 0xE3) - 64) ^ 0xBF;
  LOBYTE(STACK[0x2A0]) = (v14 & (v13 & 0xCA ^ 0x7F)) - ((2 * v14) & 0x6A) + 53;
  LOBYTE(STACK[0x84F]) = HIBYTE(v12) ^ 0x53;
  LOBYTE(STACK[0x4BD]) = BYTE1(v12) ^ 0x39;
  v15 = (a10 + 1512204369) < 0x92652AEE;
  if ((a10 + 1512204369) >= 0x92652AEE)
    v15 = (a10 + 1512204369) > 0x92652AEF;
  return ((uint64_t (*)(uint64_t))((char *)*(&off_100260750 + ((91 * !v15) ^ a4)) - 4))(1577045098);
}

void sub_1001D4708()
{
  JUMPOUT(0x1001D4298);
}

uint64_t sub_1001D4720(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a65;
  int v65;
  int v66;
  int v67;
  int v68;
  unsigned int v69;
  int v70;
  unsigned int v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int v76;
  unsigned int v77;
  unsigned int v78;
  int v79;
  int v80;
  unsigned int v81;
  unsigned int v82;
  unsigned int v83;
  unsigned int v84;
  unsigned int v85;
  unsigned int v86;
  unsigned int v87;
  unsigned int v88;
  unsigned int v89;
  int v90;
  unsigned int v91;
  unsigned int v92;
  int v93;
  unsigned int v94;
  int v95;
  unsigned int v96;
  unsigned int v97;
  unsigned int v98;
  unsigned int v99;
  unsigned int v100;
  unsigned int v101;
  unsigned int v102;
  unsigned int v103;
  unsigned int v104;
  unsigned int v105;
  unsigned int v106;
  unsigned int v107;
  int v108;
  int v109;
  int v110;
  unsigned int v111;
  unsigned int v112;
  unsigned int v113;
  int v114;
  unsigned int v115;
  int v116;
  unsigned int v117;
  unsigned int v118;
  unsigned int v119;
  unsigned int v120;
  int v121;
  unsigned int v122;
  unsigned int v123;
  unsigned int v124;
  int v125;
  unsigned int v126;
  unsigned int v127;
  unsigned int v128;
  unsigned int v129;
  unsigned int v130;
  unsigned int v131;
  unsigned int v132;
  unint64_t v133;
  int v134;
  int v135;
  unsigned int v136;
  unsigned int v137;
  int v138;
  int v139;
  unsigned int v140;
  int v141;
  unsigned int v142;
  unsigned int v143;
  int v144;
  unsigned int v145;
  unsigned int v146;
  unsigned int v147;
  unsigned int v148;
  unsigned int v149;
  unsigned int v150;
  unsigned int v151;
  uint64_t v152;
  uint64_t v153;
  int v155;

  LOBYTE(STACK[0x32C]) = v65 ^ 0xD7;
  LOBYTE(STACK[0x310]) = a3 ^ 0x3B;
  LOBYTE(STACK[0x887]) = HIBYTE(v65) ^ 4;
  LOBYTE(STACK[0x4D9]) = BYTE1(a3) ^ 0x51;
  LOBYTE(STACK[0x6DA]) = BYTE2(v66) ^ 0xA;
  LOBYTE(STACK[0x6BE]) = BYTE2(v65) ^ 0x59;
  LOBYTE(STACK[0x86B]) = (a3 >> ((100 * (v68 ^ 0x3B)) ^ 0x38)) ^ 0x2A;
  LOBYTE(STACK[0x364]) = v67 ^ 0x62;
  LOBYTE(STACK[0x4F5]) = BYTE1(v65) ^ 0x1B;
  LOBYTE(STACK[0x348]) = v66 ^ 0xAB;
  LOBYTE(STACK[0x8A3]) = HIBYTE(v66) ^ 0xEF;
  LOBYTE(STACK[0x6F6]) = BYTE2(v67) ^ 0x1F;
  LOBYTE(STACK[0x6A2]) = BYTE2(a3) ^ 0xDD;
  LOBYTE(STACK[0x52D]) = BYTE1(v67) ^ 0x6B;
  LOBYTE(STACK[0x8BF]) = HIBYTE(v67) ^ 0x1B;
  LOBYTE(STACK[0x511]) = BYTE1(v66) ^ 0xA1;
  v155 = 100 * (v68 ^ 0x33B);
  v69 = (v155 + 1981151927) & 0x89EA033A;
  v70 = -362980607
      - 1487347361
      * (((2 * (*(&a65 + v69 - 1800 * ((v69 - 274) / 0x708) - 274) ^ 0x35)) & 0xF6)
       + (*(&a65 + v69 - 1800 * ((v69 - 274) / 0x708) - 274) ^ 0x7FBFAF4E));
  v71 = v70
      - 418090588
      + (((v70 - 1560073347) % 0x101u) ^ 0xCDD7D7DD)
      + ((2 * ((v70 - 1560073347) % 0x101u)) & 0x3BA)
      - 718580832;
  v72 = (v71 ^ 0x6BDFC7FF) + 621096836 + ((2 * v71) & 0xD7BF8FFE) - 1809827839;
  v73 = ((v72 - ((2 * v72) & 0xE97F41B0) + 1958715608) ^ 0x36990F76) - 1738420157;
  v74 = (((v73 ^ 0x3FFAF7DD)
        + 1554772381
        + ((2 * v73) & 0x7FF5EFBA)
        + 1
        - ((2 * ((v73 ^ 0x3FFAF7DD) + 1554772381 + ((2 * v73) & 0x7FF5EFBA) + 1) + 923258538) & 0x33E7C2A0)
        + 1433913509) ^ 0xC8DF7C93)
      - 1226364049;
  v75 = ((v74 - ((2 * v74 + 1784666428) & 0x4677D98C) + 1483463012) ^ 0xE36AABA7) - 35086739;
  v76 = (v75 - ((2 * v75) & 0x7AA0A172) + 1028673721) ^ 0xC7F1901B;
  v77 = v76 - ((2 * v76 - 597685216) & 0xAA531882) + 1129943633;
  v78 = (v77 ^ 0x2AD673BE) + 417920183 - ((2 * ((v77 ^ 0x2AD673BE) + 644941651)) & 0xE4EFDAC8);
  v79 = (v77 ^ 0x2AD673BE) + 621096837;
  v80 = v79 ^ 0x7F7BD7EB;
  v81 = (2 * v79) & 0xFEF7AFD6;
  v82 = v77 ^ 0xA3C9B81B;
  v83 = (v77 ^ 0x2AD673BE) + 95714791 - ((2 * ((v77 ^ 0x2AD673BE) + 1117723493)) & 0x862AC504);
  v84 = ((2 * ((v77 ^ 0xD5298C41) - 1068415135)) & 0xBDFADFFE) + (((v77 ^ 0xD5298C41) - 1068415135) ^ 0x5EFD6FFF);
  v85 = v77 ^ 0x970F23EF;
  v86 = (v77 ^ 0x970F23EF) + (v77 ^ 0xD5298C41);
  v87 = v86 ^ 0xDFCFAFFE;
  v88 = (2 * v86) & 0xBF9F5FFC;
  v89 = v80 - 2138822635 + v81;
  v90 = v77 ^ 0x323DFDE5;
  v91 = (v78 ^ 0xF277ED64)
      + (((v77 ^ 0x1C5416EA) + v89) ^ 0x776EBFBF)
      + ((2 * ((v77 ^ 0x1C5416EA) + v89)) & 0xEEDD7F7E)
      - 2003746751;
  v92 = ((v90 + v87 + v88 + 540037122) ^ 0xFFF7AFEE)
      + ((2 * (v90 + v87 + v88 + 540037122)) & 0xFFEF5FDC)
      + (v91 ^ 0xA2604002);
  v93 = v77 ^ 0x26DAC522;
  v94 = v77 ^ 0xA32C63EE;
  v95 = (v77 ^ 0x2AD673BE)
      + 1817193031
      - ((2 * ((v77 ^ 0x2AD673BE) + 1817193031) + 590407758) & 0x48D4629C)
      - 1241340555;
  v96 = v77 ^ 0xB7CD66C7;
  v97 = (v77 ^ 0x2AD673BE) - 1738420156 - ((2 * ((v77 ^ 0x2AD673BE) - 1738420156)) & 0xF83658CA) + 2082155621;
  v98 = (v77 ^ 0xD5298C41) + 334030835 - ((2 * ((v77 ^ 0xD5298C41) + 334030835)) & 0x2B3A77D4) - 1784857622;
  v99 = (((v77 ^ 0xD5298C41) - 179867185) ^ 0xFFD9FBF3)
      + 2491405
      + ((2 * ((v77 ^ 0xD5298C41) - 179867185)) & 0xFFB3F7E6);
  v100 = (v97 ^ 0xC77E3936 ^ (v92
                            - ((2 * v91) & 0xBB3F7FFA)
                            + 1
                            - ((2 * (v92 - ((2 * v91) & 0xBB3F7FFA) + 1) + 995106846) & 0x76CA2AA6)
                            + 420291938))
       + v99;
  v101 = (v77 ^ 0xF2664D6F) + (v83 ^ 0x9FD7C9C8 ^ (v100 - ((2 * v100) & 0xB9855694) + 1556261706)) + 1;
  v77 ^= 0x9159A24C;
  v102 = v77 + (v101 ^ 0xF3DA3F52) + ((2 * v101) & 0xE7B47EA4) + 203800750;
  v103 = (v94 ^ v98 ^ 0x24E03B1D ^ (v102 - ((2 * v102) & 0x1528C48E) - 1969987001)) - v84;
  v104 = (v93 ^ 0xF6AD763E) + (v95 ^ 0xA394B126 ^ (v103 - ((2 * v103 + 234545150) & 0xFFD00D0) - 419696537)) + 1;
  v105 = ((2 * v104) & 0xCBB57FEE)
       + (v104 ^ 0xE5DABFF7)
       - ((2 * (((2 * v104) & 0xCBB57FEE) + (v104 ^ 0xE5DABFF7)) + 1896703486) & 0x7953411E)
       - 1255124082;
  v106 = (v105 ^ 0xBCA9A08F) + v77 - ((2 * ((v105 ^ 0xBCA9A08F) + v77)) & 0x57189318) + 730614156;
  v107 = ((2 * ((v105 ^ 0xBCA9A08F) + (v83 ^ 0xC3156282))) & 0xEFB6FE7E)
       + (((v105 ^ 0xBCA9A08F) + (v83 ^ 0xC3156282)) ^ 0x77DB7F3F);
  v108 = v105 ^ v94;
  v109 = v105 ^ v98;
  v110 = v105 ^ v93;
  v111 = (v105 ^ 0xBCA9A08F) + v90 - ((2 * ((v105 ^ 0xBCA9A08F) + v90)) & 0xF3A80CCE) - 103545241;
  v112 = ((2 * ((v105 ^ 0xBCA9A08F) + (v95 ^ 0x246A314E))) & 0xF767ECFE)
       + (((v105 ^ 0xBCA9A08F) + (v95 ^ 0x246A314E)) ^ 0xFBB3F67F);
  v113 = ((2 * ((v105 ^ 0xBCA9A08F) + v99)) & 0xFA7AEBCE) + (((v105 ^ 0xBCA9A08F) + v99) ^ 0x7D3D75E7);
  v114 = v105 ^ v82;
  v115 = v85 + (v105 ^ 0x43565F70) - 74149442 - ((2 * (v85 + (v105 ^ 0x43565F70) + 1)) & 0xF729237A);
  v116 = v105 ^ v96;
  v117 = (v105 ^ 0xBCA9A08F) + v89 - 1163676313 - ((2 * ((v105 ^ 0xBCA9A08F) + v89)) & 0x75476ACE);
  v118 = (v105 ^ 0x43565F70) + v84 - ((2 * ((v105 ^ 0x43565F70) + v84) + 1107632132) & 0xD1D278E0) + 166448242;
  v119 = v97 ^ 0xC0B28CEA ^ v105;
  v120 = (v105 ^ v117 ^ v111 ^ v115 ^ 0x44A8232) + v119;
  v121 = v78 ^ 0x4EDE4DEB ^ v105;
  v122 = (((v114 ^ 0x3340E7E) + v121) ^ 0x20404B14)
       - v107
       - ((2 * ((v114 ^ 0x3340E7E) + v121)) & 0xBF7F69D6)
       + v113
       + (v120 ^ 0xFFDE5FF5)
       + ((2 * v120) & 0xFFBCBFEA)
       - 1709154290;
  v123 = (v106 ^ 0xD473B673) + (v116 ^ 0x41D15857 ^ (v122 - ((2 * v122 - 2135032702) & 0x8E58591E) - 2020922672)) + 1;
  v124 = (v108 ^ 0x8740C23F) + (v123 ^ 0x5EFBBFAF) + ((2 * v123) & 0xBDF77F5E) - 1593556911;
  v125 = (v109 ^ v118 ^ 0x6ADE726C ^ (v124 - ((2 * v124) & 0x5607AAF2) + 721671545)) - 762027389;
  v126 = (v110 ^ 0x4A04D6B1) + (v125 ^ 0xEBE78FE6) + ((2 * v125) & 0xD7CF1FCC) + 337145883;
  v127 = ((2 * v126) & 0xBE5FEF6C) + (v126 ^ 0xDF2FF7B6);
  v128 = v112 + v127 - ((2 * (v112 + v127) + 1245193110) & 0x86A4F99C) + 1752075929;
  v129 = ((2 * ((v128 ^ 0x43527CCE) + (v117 ^ 0xBAA3B567))) & 0x3F2FFFFE)
       + (((v128 ^ 0x43527CCE) + (v117 ^ 0xBAA3B567)) ^ 0x9F97FFFF);
  v130 = ((2 * ((v128 ^ 0x43527CCE) + (v115 ^ 0xFB9491BD))) & 0xD15CF7F4)
       + (((v128 ^ 0x43527CCE) + (v115 ^ 0xFB9491BD)) ^ 0xE8AE7BFA);
  v131 = ((2 * (v113 - 2101179879 + (v128 ^ 0x43527CCE))) & 0xBFFADFFC)
       + ((v113 - 2101179879 + (v128 ^ 0x43527CCE)) ^ 0xDFFD6FFE);
  v132 = ((2 * ((v128 ^ 0x43527CCE) + (v118 ^ 0x68E93C70))) & 0xFFDF77B2)
       + (((v128 ^ 0x43527CCE) + (v118 ^ 0x68E93C70)) ^ 0xFFEFBBD9);
  HIDWORD(v133) = v129 + 1;
  LODWORD(v133) = v129 + 1617428481;
  v134 = (v133 >> 2) + 135852032 - ((2 * (v133 >> 2)) & 0x1031F28A) + 2373;
  HIDWORD(v133) = v134 ^ 0x945;
  LODWORD(v133) = v134 ^ 0x818F000;
  v135 = (v133 >> 12) - ((2 * (v133 >> 12)) & 0xD968B64A) + 1823759141;
  v136 = ((2 * ((v128 ^ 0x43527CCE) + (v109 ^ 0x29349B65))) & 0xB3B8EFA0)
       + (((v128 ^ 0x43527CCE) + (v109 ^ 0x29349B65)) ^ 0x59DC77D0);
  v137 = v121 + (v128 ^ 0xBCAD8331) - 499254284 - ((2 * (v121 + (v128 ^ 0xBCAD8331) + 1)) & 0xC47BF7E6);
  v138 = (v128 ^ 0x43527CCE) + v119 + 85648036 - ((2 * ((v128 ^ 0x43527CCE) + v119)) & 0xA35C548);
  HIDWORD(v133) = v135 ^ 0x5B25;
  LODWORD(v133) = v135 ^ 0x6CB40000;
  v139 = ((2 * (v128 ^ v114)) & 0x2FEF6FBC ^ 0xCC6520) + (v128 ^ v114 ^ 0x5791C56E);
  v140 = ((2 * (v128 ^ v106)) & 0xFEFF1E34 ^ 0xD0BC0A04) + (v128 ^ v106 ^ 0x97A1BA58);
  v141 = (v128 ^ 0x12FC7D38 ^ ((v133 >> 18) + 1370358262 - ((2 * (v133 >> 18)) & 0xA35C03EC))) + (v137 ^ 0xE23DFBF3);
  v142 = v139
       + v130
       + ((2 * (v128 ^ v111)) & 0x8EF3757C ^ 0x4007550)
       + (v128 ^ v111 ^ 0x7DFFC017)
       + 1463328152
       + (v141 ^ 0x5FF9F9FE);
  v143 = v142 + ((2 * v141) & 0xBFF3F3FC);
  v144 = v128 ^ v110;
  v145 = (v138 ^ 0x38E41B88 ^ (v143 - 2 * ((v143 + 11368916) & 0x3DFEF92E ^ v142 & 2) - 1095994624)) - v131;
  v146 = (v107
        - 2010873663
        + (v128 ^ 0x43527CCE)
        - 418080783
        - ((2 * (v107 - 2010873663 + (v128 ^ 0x43527CCE))) & 0xCE292FE2)) ^ 0x93955F2E ^ (v145
                                                                                        - ((2 * v145 - 1074077700) & 0xE90391BE)
                                                                                        + 1417623773);
  v147 = ((v146 + (v108 ^ 0xC412BEF1 ^ v128)) ^ 0x7FFEFBF3)
       - (v140
        + v136
        + ((2 * ((v128 ^ 0x43527CCE) + (v116 ^ 0x6FD74D8))) & 0xA7FFBEA0)
        + (((v128 ^ 0x43527CCE) + (v116 ^ 0x6FD74D8)) ^ 0x53FFDF50))
       + ((2 * (v146 + (v108 ^ 0xC412BEF1 ^ v128))) & 0xFFFDF7E6)
       + 418333754;
  v148 = (v132 + 1066023) ^ 0xB0D81854 ^ (v147 - ((2 * v147 + 685460506) & 0x61B030A8) - 985285023);
  v149 = (v144 ^ 0x956AA7F) + ((v148 + 1232548366 - ((2 * v148) & 0x92EE641C)) ^ 0x4977320E) + 1;
  v150 = (v149 ^ 0xF62D75F4) + v127 + ((2 * v149) & 0xEC5AEBE8);
  v151 = v150 - ((2 * v150 + 1430594732) & 0xF7F062F2) + 647676879;
  v152 = ((2 * v151) & 0x275ADAEE ^ 0x64808CC) + (v151 ^ 0x78896919);
  v153 = (_DWORD)v152 + v131 - ((2 * ((_DWORD)v152 + v131) + 413811990) & 0xE034FFAC);
  return ((uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)*(&off_100260750 + (v155 ^ 0x13)) - 12))(v153, (v138 ^ 0x51AE2A4)- 1817350793- (_DWORD)v152+ 2121069335- ((2 * ((v138 ^ 0x51AE2A4) - 1817350793 - (_DWORD)v152)) & 0xFCD9E62E), v140 - (_DWORD)v152 - ((2 * (v140 - (_DWORD)v152) + 677100730) & 0x8D12099A), (v153 + 2087690849), v152, (_DWORD)v152 + v139 - ((2 * ((_DWORD)v152 + v139) - 1464486570) & 0xD5684560), (_DWORD)v152 + v130 - ((2 * ((_DWORD)v152 + v130) + 122170654) & 0x4260FF30) + 617911847, (v144 ^ 0xF6A95580)- 1817350793- (_DWORD)v152- ((2 * ((v144 ^ 0xF6A95580) - 1817350793 - (_DWORD)v152)) & 0xB8F60B00), a9, a10, a11, a12,
           a13,
           a14,
           a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53);
}

void sub_1001D5990()
{
  JUMPOUT(0x1001D48CCLL);
}

uint64_t sub_1001D59BC(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, unsigned int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a65;
  char a70;
  char a71;
  char a72;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  unsigned int v82;
  uint64_t v84;

  LODWORD(a52) = v72;
  HIDWORD(a53) = v81;
  LODWORD(a54) = v80;
  HIDWORD(a56) = v77;
  HIDWORD(v84) = v79;
  LODWORD(a34) = v76;
  LODWORD(a58) = v78;
  HIDWORD(a32) = v75;
  LOBYTE(STACK[0x368]) = LOBYTE(STACK[0x3C8]) ^ LOBYTE(STACK[0x390]) ^ *(_BYTE *)((LODWORD(STACK[0x11F0]) ^ 0x8B7B7E7BB3192611)
                                                                                + ((2
                                                                                  * (LODWORD(STACK[0x11F0]) ^ 0xCDEADFEE)) & 0xFDE7F3FE)
                                                                                + a13
                                                                                + 0x264DBC49E78A8DFCLL) ^ *(_BYTE *)((LODWORD(STACK[0x1E10]) ^ 0x779F2BFFBA310031) + ((2 * (LODWORD(STACK[0x1E10]) ^ 0xCDEADFEE)) & 0xEFB7BFBE) + a13 + 0x3A2A0EC5EEA2A81CLL) ^ 0x35;
  LOBYTE(STACK[0x531]) = *(_BYTE *)((LODWORD(STACK[0x1374]) ^ 0x69FDFFC70217A001)
                                  + a13
                                  + ((2 * (LODWORD(STACK[0x1374]) ^ 0xCDEADFEE)) & 0x19FFAFFDELL)
                                  + 0x47CB3AFD9681080CLL) ^ LOBYTE(STACK[0x559]) ^ LOBYTE(STACK[0x591]) ^ *(_BYTE *)((LODWORD(STACK[0xA24]) ^ 0x7BB25D5F72F92099) + a13 + ((2 * (LODWORD(STACK[0xA24]) ^ 0xCDEADFEE)) & 0x17E27FEEELL) + 0x3616DD65A76A8884) ^ 0x35;
  LOBYTE(STACK[0x6FA]) = LOBYTE(STACK[0x75A]) ^ LOBYTE(STACK[0x722]) ^ *(_BYTE *)((LODWORD(STACK[0x14F8]) ^ 0x6BFFEAFFB2312051)
                                                                                + ((2
                                                                                  * (LODWORD(STACK[0x14F8]) ^ 0xCDEADFEE)) & 0xFFB7FF7E)
                                                                                + a13
                                                                                + 0x45C94FC5E6A2883CLL) ^ *(_BYTE *)((LODWORD(STACK[0xBA8]) ^ 0x47078F7DA2169A3DLL) + ((2 * (LODWORD(STACK[0xBA8]) ^ 0xCDEADFEE)) & 0xDFF88BA6) + a13 + 0x6AC1AB47F6824228) ^ 0x35;
  LOBYTE(STACK[0x8C3]) = a71 ^ *(_BYTE *)((LODWORD(STACK[0xD2C]) ^ 0x7BBEEFFF3214290CLL)
                                        + a13
                                        + ((2 * (LODWORD(STACK[0xD2C]) ^ 0xCDEADFEE)) & 0x1FFFDEDC4)
                                        + 0x360A4AC5667F9119) ^ *(_BYTE *)((LODWORD(STACK[0x167C]) ^ 0xEDFD9F7E5055C890)
                                                                           + a13
                                                                           + ((2
                                                                             * (LODWORD(STACK[0x167C]) ^ 0xCDEADFEE)) & 0x13B7E2EFCLL)
                                                                           - 0x3C3464B937408F83) ^ LOBYTE(STACK[0x21B]) ^ 0x35;
  LOBYTE(STACK[0x384]) = LOBYTE(STACK[0x3AC]) ^ LOBYTE(STACK[0x3E4]) ^ *(_BYTE *)((LODWORD(STACK[0xEB0]) ^ 0xFFFE6E2B1A953319)
                                                                                + a13
                                                                                + ((2
                                                                                  * (LODWORD(STACK[0xEB0]) ^ 0xCDEADFEE)) & 0x1AEFFD9EELL)
                                                                                - 0x4E353366710164FCLL) ^ *(_BYTE *)((LODWORD(STACK[0x1800]) ^ 0x77ABDFFB1558F093) + a13 + ((2 * (LODWORD(STACK[0x1800]) ^ 0xCDEADFEE)) & 0x1B1645EFALL) + 0x3A1D5AC98DCC587ELL) ^ 0x35;
  LOBYTE(STACK[0x54D]) = LOBYTE(STACK[0x575]) ^ LOBYTE(STACK[0x5AD]) ^ *(_BYTE *)((LODWORD(STACK[0x1034]) ^ 0x53F77DB7F231AC37)
                                                                                + ((2
                                                                                  * (LODWORD(STACK[0x1034]) ^ 0xCDEADFEE)) & 0x7FB6E7B2)
                                                                                + a13
                                                                                + 0x5DD1BD0E26A31422) ^ *(_BYTE *)((LODWORD(STACK[0x1984]) ^ 0xFDFF73FF9F5CA103) + ((2 * (LODWORD(STACK[0x1984]) ^ 0xCDEADFEE)) & 0xA56CFDDA) + a13 - 0x4C363939EC37F6F2) ^ 0x35;
  LOBYTE(STACK[0x716]) = LOBYTE(STACK[0x776]) ^ *(_BYTE *)((LODWORD(STACK[0x1B08]) ^ 0xFC5EFE7F3215E881)
                                                         + a13
                                                         + ((2 * (LODWORD(STACK[0x1B08]) ^ 0xCDEADFEE)) & 0x1FFFE6EDELL)
                                                         - 0x4A95C3BA9980AF74) ^ *(_BYTE *)((LODWORD(STACK[0x11B8]) ^ 0xDFBDBDB776BD7033)
                                                                                            + a13
                                                                                            + ((2
                                                                                              * (LODWORD(STACK[0x11B8]) ^ 0xCDEADFEE)) & 0x176AF5FBALL)
                                                                                            - 0x2DF482F254D927E2) ^ LOBYTE(STACK[0x73E]) ^ 0x35;
  a70 = a72 ^ LOBYTE(STACK[0x237]) ^ *(_BYTE *)((LODWORD(STACK[0x133C]) ^ 0xDFBD3DFB30112481)
                                              + a13
                                              + ((2 * (LODWORD(STACK[0x133C]) ^ 0xCDEADFEE)) & 0x1FBF7F6DELL)
                                              - 0x2DF40336977D7374) ^ *(_BYTE *)((LODWORD(STACK[0x1C8C]) ^ 0x7FFD9B7F32552609)
                                                                                 + a13
                                                                                 + ((2
                                                                                   * (LODWORD(STACK[0x1C8C]) ^ 0xCDEADFEE)) & 0x1FF7FF3CELL)
                                                                                 + 0x31CB9F4566BE8E14) ^ 0x35;
  LOBYTE(STACK[0x378]) = 53;
  LOBYTE(STACK[0x378]) = 53;
  LOBYTE(STACK[0x378]) = 53;
  LOBYTE(STACK[0x378]) = 53;
  LOBYTE(STACK[0x378]) = 53;
  LOBYTE(STACK[0x378]) = 53;
  LOBYTE(STACK[0x378]) = 53;
  LOBYTE(STACK[0x378]) = 53;
  LOBYTE(STACK[0x378]) = 53;
  LOBYTE(STACK[0x370]) = 53;
  LODWORD(v84) = v73 + 1725812192;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t))((char *)*(&off_100260750 + v74) - 12))(53, 457, 41765899, 2443359173, 1800, &a65, 2960517107, 1008633853, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           v84,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           __PAIR64__(a7, v82),
           a56,
           __PAIR64__(a2, a4),
           a58,
           a59);
}

uint64_t sub_1001D615C@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
  int v58;
  int v59;
  int v60;
  uint64_t v61;
  unsigned int v62;
  unsigned int v63;
  uint64_t (*v64)(void);

  v62 = *(_DWORD *)(v61
                  + 4
                  * ((((2722 * ((v60 - ((2 * v60 + 738443208) & 0x7766FA26) + 1370840311) ^ 0x3BB37DAB)) & 0xFDBDF1FC)
                    + ((1361 * ((v60 - ((2 * v60 + 738443208) & 0x7766FA26) + 1370840311) ^ 0x3BB37DAB)) ^ 0x7EDEF8FE)
                    - 2126221445)
                   % 0x12E0)) ^ 0xB7AE8AB6;
  v63 = v62 - ((2 * v62 + 374804154) & 0x163BB3C8) - 162963135;
  v64 = (uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((1543 * (v60 + 1 != v58 + 256)) ^ v59)) - 12);
  *(&a58 + (457 * v60 + 1230577732) % 0x708u) = byte_100224FF0[(((4424 * (v63 ^ (v63 >> 7) ^ (v63 >> 3) ^ 0x42F29945)) & 0xF19FD6D8)
                                                              + ((2212 * (v63 ^ (v63 >> 7) ^ (v63 >> 3) ^ 0x42F29945)) ^ 0xF8CFEB6D)
                                                              + 122354471)
                                                             % 0x97F] ^ 0xD1;
  return v64();
}

uint64_t sub_1001D62E8@<X0>(int a1@<W1>, unsigned int a2@<W2>, int a3@<W3>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  int v5;
  int v6;
  int v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  unsigned int v13;
  int v14;
  unsigned int v15;
  int v16;
  unint64_t v17;
  unsigned int v18;
  int v19;
  char v20;
  unsigned int v21;
  int v22;
  unsigned int v23;
  int v24;
  unsigned int v25;
  int v26;
  unsigned int v27;
  unsigned int v28;
  int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  uint64_t (*v37)(void);

  v11 = v5 * v9;
  v12 = v11 - 768014465 - ((((v11 - 768014465) * (unint64_t)a2) >> 32) >> 10) * a3;
  v13 = (((2 * (*(unsigned __int8 *)(a4 + v12) ^ 0x35)) & 0x148)
       + (*(unsigned __int8 *)(a4 + v12) ^ 0x35 ^ ((v6 ^ 0x151) - 1345095192)))
      * v9
      + 528239740;
  v14 = *(unsigned __int8 *)(a4 + v13 - (((v13 * (unint64_t)a2) >> 32) >> 10) * a3);
  v15 = (((2 * ~v14) & 0xFC) + v14) * v7 - 278712;
  v16 = *(unsigned __int8 *)(v10 + v15 - (((v15 * (unint64_t)v8) >> 32) >> 10) * a1);
  HIDWORD(v17) = v16 ^ 0x70;
  LODWORD(v17) = ~v16 << 24;
  v18 = (v17 >> 31) - ((2 * (v17 >> 31)) & 0x2A) - 107;
  v19 = (((v18 & 0xFC) >> 2) ^ 0x50) + ((v18 >> 1) & 0x6A ^ 0x4A) - 117;
  v20 = 2 * ((v19 & (v18 ^ 0x95)) - ((2 * (v19 & (v18 ^ 0x95))) & 0x26));
  v21 = (((v19 + (v18 ^ 0x95)) ^ 0xD7)
                        + ((2 * (v19 + (v18 ^ 0x95))) & 0xAE)
                        + ((v20 - 90) ^ 0x23)
                        + ((2 * (v20 - 90)) & 0xF4 ^ 0xBB)
                        - 91);
  v22 = v18 ^ 0xC8 ^ ((~(v21 >> 3) | 0xE9) + (v21 >> 4) + 44);
  v23 = (((2 * v22) & 0xCC) + (v22 ^ 0x7FFFEB66)) * v7 + 16286956;
  v24 = *(unsigned __int8 *)(v10 + v23 - (((v23 * (unint64_t)v8) >> 32) >> 10) * a1);
  v25 = (2 * ((v24 ^ 0x5A) & 0x7F) + (v24 ^ 0x5FF7B725)) * v9 - 1362501495;
  v26 = *(unsigned __int8 *)(a4 + v25 - (((v25 * (unint64_t)a2) >> 32) >> 10) * a3);
  v27 = (((2 * (v26 ^ 0x7E)) & 0x14E) + (v26 ^ 0x5F65FFC1)) * v7 - 1296840812;
  LOBYTE(v27) = *(_BYTE *)(v10 + v27 - (((v27 * (unint64_t)v8) >> 32) >> 10) * a1) ^ 0xF0;
  LOBYTE(v27) = (-97 * v27 - ((62 * v27) & 0xF7) + 123) ^ 0x97;
  v28 = ((v27 ^ 0xFF7EBFFF) + 2 * v27) * v7 + 1560944465;
  v29 = *(unsigned __int8 *)(v10 + v28 - (((v28 * (unint64_t)v8) >> 32) >> 10) * a1);
  v30 = 23 * (v29 ^ 0xFFFFFFF0) - ((14 * v29) & 0x16) - 117;
  v31 = v30 ^ 0x28 ^ (((2 * ((v30 >> 3) & 9 ^ 0xFFFFFF88)) & 0x10) - ((v30 >> 3) & 9 ^ 0xFFFFFF88) - 95);
  v32 = (((2 * v31) & 0x136) + (v31 ^ 0x754F939B)) * v9 - 1795966067;
  v33 = *(unsigned __int8 *)(a4 + v32 - (((v32 * (unint64_t)a2) >> 32) >> 10) * a3);
  v34 = (((2 * (v33 ^ 0x25)) & 0xFFFFFFDF) + (v33 ^ 0x6EE3FBDA)) * v9 + 185026201;
  *(_BYTE *)(a4
           + v11
           - 767455097
           - ((((v11 - 767455097) * (unint64_t)a2) >> 32) >> 10) * a3) = *(_BYTE *)(a4 + v34 - (((v34 * (unint64_t)a2) >> 32) >> 10) * a3);
  LODWORD(v12) = (((2 * (*(unsigned __int8 *)(a4 + v12) ^ 1)) & 0x12) + (*(unsigned __int8 *)(a4 + v12) ^ 0x4FF6FF3C))
               * v9
               + 1075232047;
  LODWORD(v12) = *(unsigned __int8 *)(a4
                                    + v12
                                    - (((v12 * (unint64_t)a2) >> 32) >> 10) * a3);
  LODWORD(v12) = (((2 * (v12 ^ 0x8D)) & 0xFFFFFFBF) + (v12 ^ 0x76BFF672)) * v7 - 313597660;
  LODWORD(v12) = *(unsigned __int8 *)(v10
                                    + v12
                                    - (((v12 * (unint64_t)v8) >> 32) >> 10) * a1);
  HIDWORD(v17) = v12 ^ 0x70;
  LODWORD(v17) = ~(_DWORD)v12 << 24;
  v35 = ((v17 >> 31) - ((2 * (v17 >> 31)) & 0x92) - 55);
  LODWORD(v12) = (((2 * (((v17 >> 31) - ((2 * (v17 >> 31)) & 0xFFFFFF92) - 55) ^ (v35 >> 4) ^ (v35 >> 6) ^ 0x3C)) & 0x176)
                + ((((v17 >> 31) - ((2 * (v17 >> 31)) & 0x92) - 55) ^ (v35 >> 4) ^ (v35 >> 6)) ^ 0xFFBBFE87))
               * v9
               + 2036774509;
  LODWORD(v12) = *(unsigned __int8 *)(a4
                                    + v12
                                    - (((v12 * (unint64_t)a2) >> 32) >> 10) * a3);
  LODWORD(v12) = (((2 * (v12 ^ 0xA2)) & 0xFFFFFFF7) + (v12 ^ 0x6DDE775D)) * v7 - 1443337376;
  LODWORD(v12) = *(unsigned __int8 *)(v10
                                    + v12
                                    - (((v12 * (unint64_t)v8) >> 32) >> 10) * a1) ^ 0xFFFFFFF0;
  LODWORD(v12) = 23 * v12 - ((46 * v12) & 0xFFFFFFD8) + 108;
  v36 = ((v12 >> 3) & 9 ^ 0xFFFFFFFE) + ((v12 >> 2) & 0x10) + 2;
  LODWORD(v12) = v12 ^ 0x2D ^ ((v36 & 0x70 ^ 0x20) + (v36 ^ 0x5B) - ((v36 ^ 0x5B) & 0x72));
  LODWORD(v12) = (((2 * v12) & 0x16C) + (v12 ^ 0x1EE7F8B6)) * v9 - 739819942;
  LODWORD(v12) = *(unsigned __int8 *)(a4
                                    + v12
                                    - (((v12 * (unint64_t)a2) >> 32) >> 10) * a3) ^ 0x35;
  LODWORD(v12) = (((2 * v12) & 0x12E) + (v12 ^ 0x2DFEF297)) * v9 - 471534415;
  v37 = (uint64_t (*)(void))(*(_QWORD *)(a5 + 8 * ((486 * (v5 == 1016684344)) ^ v6)) - 12);
  *(_BYTE *)(a4
           + v11
           - 767776825
           - ((((v11 - 767776825) * (unint64_t)a2) >> 32) >> 10) * a3) = *(_BYTE *)(a4 + v12 - (((v12 * (unint64_t)a2) >> 32) >> 10) * a3);
  return v37();
}

uint64_t sub_1001D6854(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _QWORD *a64;
  unsigned __int8 a68;
  unsigned __int8 a72;
  int v72;
  uint64_t v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  unsigned int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  unsigned int v87;
  unsigned int v88;
  unsigned int v89;
  unsigned int v90;
  int v91;
  int v92;
  unsigned int v93;
  int v94;
  unsigned int v95;
  int v96;
  int v97;
  int v98;
  unsigned int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  unsigned int v104;
  unsigned int v105;
  unsigned int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  unsigned int v111;
  unsigned int v112;
  int v113;
  unsigned int v114;
  int v115;
  int v116;
  unsigned int v117;
  unsigned int v118;
  int v119;
  int v120;
  int v121;
  int v122;
  int v123;
  unsigned int v124;
  int v125;
  unsigned int v126;
  unsigned int v127;
  unsigned int v128;
  unsigned int v129;
  unsigned int v130;
  int v131;
  int v132;
  int v133;
  int v134;
  int v135;
  int v136;
  uint64_t v137;
  int v138;
  int v139;
  unsigned int v140;
  unsigned int v141;
  int v142;
  int v143;
  int v144;
  uint64_t v146;
  uint64_t v147;
  unint64_t v148;
  uint64_t v149;
  uint64_t v150;

  HIDWORD(a45) = 4 * (v72 ^ 0x1E1);
  HIDWORD(a34) = -4233477;
  v74 = *(unsigned __int8 *)((LODWORD(STACK[0x178C]) ^ 0xEFEBDECD3076A091)
                           + a63
                           + ((2 * (LODWORD(STACK[0x178C]) ^ 0xCDEADFEE)) & 0x1FB38FEFELL)
                           + 0x1014213202638081) ^ LOBYTE(STACK[0x563]) ^ 0xAF;
  v75 = a68 ^ 0xAF ^ *(unsigned __int8 *)((LODWORD(STACK[0x1484]) ^ 0x7DFF7BFFBA173C37)
                                        + ((2 * (LODWORD(STACK[0x1484]) ^ 0xCDEADFEE)) & 0xEFFBC7B2)
                                        + a63
                                        - 0x7DFF7BFF77FDE3D9);
  v76 = LOBYTE(STACK[0x39A]) ^ 0xAF ^ *(unsigned __int8 *)((LODWORD(STACK[0x1608]) ^ 0x3F3F7EE43406AC21)
                                                         + a63
                                                         + ((2 * (LODWORD(STACK[0x1608]) ^ 0xCDEADFEE)) & 0x1F3D8E79ELL)
                                                         - 0x3F3F7EE4F9EC73CFLL);
  v77 = *(unsigned __int8 *)((LODWORD(STACK[0x1300]) ^ 0x7FDFBFDF2239AC90)
                           + a63
                           + ((2 * (LODWORD(STACK[0x1300]) ^ 0xCDEADFEE)) & 0x1DFA6E6FCLL)
                           - 0x7FDFBFDFEFD3737ELL) ^ 0x9A;
  v78 = (((v74 - ((v74 << ((BYTE4(a45) - 120) ^ 0xFD)) & 0x164)) << 16) + 984743936) ^ 0x3AB20000;
  v79 = (((v76 - ((2 * v76) & 0xF2)) << 8) + 2128128) ^ 0x207900;
  v80 = (v79 - 1543986477 - ((2 * v79) & 0x47F14400)) ^ 0xA3F8A2D3 | (v78 - 137560522 - ((2 * v78) & 0x6F980000)) ^ 0xF7CCFE36;
  v81 = (v80 + 1695720919 - ((2 * v80) & 0x4A254BAE)) ^ 0x6512A5D7 | (v75 + 1266102699 - ((2 * v75) & 0x156)) ^ 0x4B7731AB;
  v82 = (((v81 - ((2 * v81) & 0x705470)) << 8) + 942290944) ^ 0x382A3800;
  v83 = (v82 + 763929304 - ((2 * v82) & 0x5B114400)) ^ 0x2D88A2D8 | (v77 + 1607271547 - ((2 * v77) & 0xF6)) ^ 0x5FCD047B;
  *(_DWORD *)(*a64 - 0x5C1335008418C527) = ((LOBYTE(STACK[0x710]) ^ 0x35)
                                            - ((2 * (LOBYTE(STACK[0x710]) ^ 0x35)) & 0xA)
                                            - 1046315515) ^ 0x8F38327B ^ (v83 - ((2 * v83) & 0x6E12720) - 2089774192);
  v84 = LOBYTE(STACK[0x57F]) ^ 0xAF ^ *(unsigned __int8 *)((LODWORD(STACK[0x1D9C]) ^ 0x6F6FD76C32013874)
                                                         + a63
                                                         + ((2 * (LODWORD(STACK[0x1D9C]) ^ 0xCDEADFEE)) & 0x1FFD7CF34)
                                                         - 0x6F6FD76CFFEBE79ALL);
  v85 = *(unsigned __int8 *)((LODWORD(STACK[0x1C18]) ^ 0xD6FB7BFD62052050)
                           + a63
                           + ((2 * (LODWORD(STACK[0x1C18]) ^ 0xCDEADFEE)) & 0x15FDFFF7CLL)
                           + 0x2904840250100042) ^ LOBYTE(STACK[0x3B6]) ^ 0xAF;
  v86 = a72 ^ 0xAF ^ *(unsigned __int8 *)((LODWORD(STACK[0x1A94]) ^ 0xFFE7F70E311D7117)
                                        + a63
                                        + ((2 * (LODWORD(STACK[0x1A94]) ^ 0xCDEADFEE)) & 0x1F9EF5DF2)
                                        + 0x1808F103085107);
  v87 = (((v84 - ((2 * v84) & 0xFFFFFFE3)) << 16) + 2029060096) ^ 0x78F10000;
  v88 = (((v85 - (a7 & (2 * v85))) << 8) - 1454950144) ^ 0xA9473900;
  v89 = (v88 - 1305656242 - ((2 * v88) & 0x645A8800)) ^ 0xB22D444E | (v87 - 71522473 - ((2 * v87) & 0x77780000)) ^ 0xFBBCA757;
  v90 = (v89 + 2029037412 - ((2 * v89) & 0xF1E14EC8)) ^ 0x78F0A764 | (v86 - 505695816 - ((2 * v86) & 0x170)) ^ 0xE1DBB1B8;
  v91 = LOBYTE(STACK[0x72C]) ^ 0xAF ^ *(unsigned __int8 *)((LODWORD(STACK[0x1910]) ^ 0x96AC7BFD34102011)
                                                         + a63
                                                         + ((2 * (LODWORD(STACK[0x1910]) ^ 0xCDEADFEE)) & 0x1F3F5FFFELL)
                                                         + 0x6953840206050001);
  v92 = (((v90 - ((2 * v90) & 0x34E166)) << 8) + 443593472) ^ 0x1A70B300;
  v93 = (v92 + 1832372791 - ((2 * v92) & 0xDA6F9400)) ^ 0x6D37CA37 | (v91 + 1952444259 - ((2 * v91) & 0xC6)) ^ 0x745FEF63;
  *(_DWORD *)(*a64 - 0x5C1335008418C517) = v93 - 840245266 - ((2 * v93) & 0x9BD5BFDC);
  v94 = *(unsigned __int8 *)((LODWORD(STACK[0xCB8]) ^ 0x5E5EFEFF98550451)
                           + ((2 * (LODWORD(STACK[0xCB8]) ^ 0xCDEADFEE)) & 0xAB7FB77E)
                           + a63
                           - 0x5E5EFEFF55BFDBBFLL);
  v95 = ((2 * (v94 ^ 0x92)) & 0xFFFFFFEF) + (v94 ^ 0xF7FDF6D);
  v96 = *(unsigned __int8 *)((LODWORD(STACK[0x9B0]) ^ 0x3EF4BFFC401F3075)
                           + a63
                           + ((2 * (LODWORD(STACK[0x9B0]) ^ 0xCDEADFEE)) & 0x11BEBDF36)
                           - 0x3EF4BFFC8DF5EF9BLL) ^ LOBYTE(STACK[0x748]) ^ 0xAF;
  v97 = LOBYTE(STACK[0x59B]) ^ 0xAF ^ *(unsigned __int8 *)((LODWORD(STACK[0xE3C]) ^ 0x4E7FBFBB1A95D412)
                                                         + a63
                                                         + ((2 * (LODWORD(STACK[0xE3C]) ^ 0xCDEADFEE)) & 0x1AEFE17F8)
                                                         - 0x4E7FBFBBD77F0BFCLL);
  v98 = (((v97 - ((2 * v97) & 0x116)) << 8) + 1365543680) ^ 0x51648B00;
  v99 = ((LOBYTE(STACK[0x3D2]) ^ 0x35) - 1328085113 - ((2 * (LOBYTE(STACK[0x3D2]) ^ 0x35)) & 0xFFFFFF0F)) ^ 0xB0D70787;
  v100 = (v98 + 590282016 - ((2 * v98) & 0x465DFA00)) ^ 0x232EFD20 | v99;
  v101 = (v100 ^ 0xFE7B7F) + v95 + ((2 * v100) & 0xFCF6FE);
  v102 = (((v99 & (v95 - 260038647)) - ((2 * (v99 & (v95 - 260038647))) & 0x14EF22)) << 9) - 1796267520;
  v103 = *(unsigned __int8 *)((LODWORD(STACK[0xB34]) ^ 0x7E35DFE51A15A811)
                            + a63
                            + ((2 * (LODWORD(STACK[0xB34]) ^ 0xCDEADFEE)) & 0x1AFFEEFFELL)
                            - 0x7E35DFE5D7FF77FFLL) ^ 0x9A;
  v104 = ((v102 ^ 0x4EE2401)
        + ((2 * v102) & 0xDFFDF000 ^ 0xF623BFFF)
        + (((v101 << 8) - 2119923200) ^ 0x7B9DD6BD)
        + ((2 * ((v101 << 8) - 2119923200)) & 0xF73BAC00)
        - 194960573) | (v103 + 15399397 - ((2 * v103) & 0x1CA)) ^ 0xEAF9E5;
  v105 = (((v104 - ((2 * v104) & 0x95548A) + 4893253) ^ ((LOBYTE(STACK[0x209]) ^ 0x35)
                                                       - ((2 * (LOBYTE(STACK[0x209]) ^ 0x35)) & 0x64)
                                                       + 16695090)) << 8) ^ 0xB4157700;
  v106 = (v105 - 1080051247 - ((2 * v105) & 0x7F3F7200)) ^ 0xBF9FB9D1 | (v96 - 1207087621 - ((2 * v96) & 0xFFFFFFF7)) ^ 0xB80D4DFB;
  *(_DWORD *)(*a64 - 0x5C1335008418C507) = v106 - 840245266 - ((2 * v106) & 0x9BD5BFDC);
  LODWORD(v146) = (*(unsigned __int8 *)(v73 - 117) ^ 0x3E) - ((2 * (*(unsigned __int8 *)(v73 - 117) ^ 0x3E)) & 0x1EC);
  v107 = *(unsigned __int8 *)((LODWORD(STACK[0x19FC]) ^ 0x73E69F7F2F144095)
                            + a63
                            + ((2 * (LODWORD(STACK[0x19FC]) ^ 0xCDEADFEE)) & 0x1C5FD3EF6)
                            - 0x73E69F7FE2FE9F7BLL);
  HIDWORD(v150) = (*(unsigned __int8 *)(v73 - 120) ^ 0x3E)
                + 1388346255
                - ((2 * (*(unsigned __int8 *)(v73 - 120) ^ 0x3E)) & 0xFFFFFF1F);
  v108 = (LOBYTE(STACK[0x2CB]) ^ 0xAF ^ v107) - ((2 * (LOBYTE(STACK[0x2CB]) ^ 0xAF ^ v107)) & 0x1B8);
  HIDWORD(v146) = 696;
  v109 = (*(unsigned __int8 *)(v73 - 118) ^ 0x3E) - ((2 * (*(unsigned __int8 *)(v73 - 118) ^ 0x3E)) & 0x78);
  v110 = *(unsigned __int8 *)((LODWORD(STACK[0x1878]) ^ 0x45DAD8AF3E5D1809)
                            + a63
                            + ((2 * (LODWORD(STACK[0x1878]) ^ 0xCDEADFEE)) & 0x1E76F8FCELL)
                            - 0x45DAD8AFF3B7C7E7) ^ 0x9A;
  HIDWORD(v147) = v110 - ((2 * v110) & 0x1AA);
  LODWORD(v150) = 147;
  v149 = (LODWORD(STACK[0x194C]) ^ 0x6AFDF823AAEF3619)
       + ((2 * (LODWORD(STACK[0x194C]) ^ 0xCDEADFEE)) & 0xCE0BD3EE)
       + a63;
  HIDWORD(a40) = 1490;
  v148 = (LODWORD(STACK[0x1644]) ^ 0xBFBDFB8F3258E821)
       + a63
       + ((2 * (LODWORD(STACK[0x1644]) ^ 0xCDEADFEE)) & 0x1FF646F9ELL);
  LODWORD(v147) = 136;
  v111 = ((((v109 << 8) - 1287177216) ^ 0xB3473C00)
        - 457241811
        - ((2 * (((v109 << 8) - 1287177216) ^ 0xB3473C00)) & 0x497E1600)) ^ 0xE4BF0B2D | (((((_DWORD)v146 << 16) - 655360) ^ 0xFFF60000)
                                                                                        - 602709904
                                                                                        - ((2
                                                                                          * ((((_DWORD)v146 << 16)
                                                                                            - 655360) ^ 0xFFF60000)) & 0xB8260000)) ^ 0xDC136070;
  v112 = (v111 - 423870275 - ((2 * v111) & 0xCD78817A)) ^ 0xE6BC40BD | ((*(unsigned __int8 *)(v73 - 119) ^ 0x3E)
                                                                      + 1162864727
                                                                      - ((2 * (*(unsigned __int8 *)(v73 - 119) ^ 0x3E)) & 0xAE)) ^ 0x454FE857;
  v113 = (((v112 - ((2 * v112) & 0x8E0AB6)) << 8) + 1191533312) ^ 0x47055B00;
  v114 = v113 - 726915169 - ((2 * v113) & 0xA9584E00);
  v115 = LOBYTE(STACK[0x79B]) ^ 0xAF ^ *(unsigned __int8 *)((LODWORD(STACK[0xE0C]) ^ 0xE89B3D3D289FA069)
                                                          + a63
                                                          + ((2 * (LODWORD(STACK[0xE0C]) ^ 0xCDEADFEE)) & 0x1CAEAFF0ELL)
                                                          + 0x1764C2C21A8A8079);
  v116 = v115 - ((2 * v115) & 0x44444444);
  v117 = ((LOBYTE(STACK[0x80A]) ^ 0x35) - 441110883 - ((2 * (LOBYTE(STACK[0x80A]) ^ 0x35)) & 0x13A)) ^ 0xE5B52E9D | ((((v108 << 8) - 1237459968) ^ 0xB63DDC00) - 1633368089 - ((2 * (((v108 << 8) - 1237459968) ^ 0xB63DDC00)) & 0x3D498E00)) ^ 0x9EA4C7E7;
  v118 = v117 - ((2 * v117) & 0xD090);
  v119 = LOBYTE(STACK[0x5D2]) ^ 0xAF ^ *(unsigned __int8 *)((LODWORD(STACK[0xC88]) ^ 0xFCFBFD7722011843)
                                                          + a63
                                                          + ((2 * (LODWORD(STACK[0xC88]) ^ 0xCDEADFEE)) & 0x1DFD78F5ALL)
                                                          + 0x304028810143853);
  v120 = v119 - ((2 * v119) & 0x128);
  v121 = LOBYTE(STACK[0x641]) ^ 0xAF ^ *(unsigned __int8 *)((LODWORD(STACK[0x16F4]) ^ 0x7F6B6DFE30176072)
                                                          + a63
                                                          + ((2 * (LODWORD(STACK[0x16F4]) ^ 0xCDEADFEE)) & 0x1FBFB7F38)
                                                          - 0x7F6B6DFEFDFDBF9CLL);
  v122 = LOBYTE(STACK[0x478]) ^ 0xAF ^ *(unsigned __int8 *)((LODWORD(STACK[0x1570]) ^ 0x8EEFDDFCF0552005)
                                                          + ((2 * (LODWORD(STACK[0x1570]) ^ 0xCDEADFEE)) & 0x7B7FFFD6)
                                                          + a63
                                                          + 0x71102203C2400015);
  v123 = LOBYTE(STACK[0x409]) ^ 0xAF ^ *(unsigned __int8 *)((LODWORD(STACK[0xB04]) ^ 0x31B5B65F22556040)
                                                          + a63
                                                          + ((2 * (LODWORD(STACK[0xB04]) ^ 0xCDEADFEE)) & 0x1DF7F7F5CLL)
                                                          - 0x31B5B65FEFBFBFAELL);
  v124 = ((((v120 << 8) + 782668800) ^ 0x2EA69400)
        - 348100583
        + (~(2 * (((v120 << 8) + 782668800) ^ 0x2EA69400)) | 0xA97F2FFF)
        + 1) ^ 0xEB406819 | ((((v116 << 16) - 1105068032) ^ 0xBE220000)
                           + 1358512080
                           - ((2 * (((v116 << 16) - 1105068032) ^ 0xBE220000)) & 0x21F20000)) ^ 0x50F93FD0;
  v125 = *(unsigned __int8 *)((LODWORD(STACK[0x980]) ^ 0xDAFE3BF7F2877071)
                            + ((2 * (LODWORD(STACK[0x980]) ^ 0xCDEADFEE)) & 0x7EDB5F3E)
                            + a63
                            + 0x2501C408C0925061) ^ LOBYTE(STACK[0x240]) ^ 0xAF;
  v126 = (((((v118 + 59464) ^ (HIDWORD(v147) + 8917)) << 16) ^ 0xCA9D0000)
        + 359443825
        - ((2 * ((((v118 + 59464) ^ (HIDWORD(v147) + 8917)) << 16) ^ 0xCA9D0000)) & 0x2AD80000)) ^ 0x156CAD71 | (((((v121 + 224668 - ((2 * v121) & 0xB6)) << 8) + 114432) ^ 0x36F5B00) - 65547654 - ((2 * ((((v121 + 224668 - ((2 * v121) & 0xB6)) << 8) + 114432) ^ 0x36F5B00)) & 0x782FA400)) ^ 0xFC17D27A;
  v127 = (v124 - 2122961011 - ((2 * v124) & 0x2EC5F1A)) ^ 0x81762F8D | (v123 + 105282250 - ((2 * v123) & 0x194)) ^ 0x6467ACA;
  v128 = (((v127 - ((2 * v127) & 0xAE804C)) << 8) - 683661824) ^ 0xD7402600;
  v129 = (v126 + 681187659 - ((2 * v126) & 0x51343296)) ^ 0x289A194B | (v122 - 1363689782 - ((2 * v122) & 0x194)) ^ 0xAEB7BECA;
  v130 = LODWORD(STACK[0xAF0]) ^ ((v114 ^ 0xD4AC279F | HIDWORD(v150) ^ 0x52C07B8F)
                                - ((2 * (v114 ^ 0xD4AC279F | HIDWORD(v150) ^ 0x52C07B8F)) & 0x5DAD9F6A)
                                - 1361653835) ^ (v125 - ((2 * v125) & 0x1F8) + 1186689788);
  v131 = *(unsigned __int8 *)(v149 - 0x6AFDF8236705E9F7);
  v132 = LOBYTE(STACK[0x5C9]);
  v133 = *(unsigned __int8 *)(v148 + 0x40420470004DC831);
  v134 = *(unsigned __int8 *)((LODWORD(STACK[0x17C8]) ^ 0x7DFEFFDF36973001)
                            + a63
                            + ((2 * (LODWORD(STACK[0x17C8]) ^ 0xCDEADFEE)) & 0x1F6FBDFDELL)
                            - 0x7DFEFFDFFB7DEFEFLL);
  v135 = LOBYTE(STACK[0x792]);
  v136 = LOBYTE(STACK[0x253]);
  v137 = LOBYTE(STACK[0x400]);
  v138 = *(unsigned __int8 *)((LODWORD(STACK[0x14C0]) ^ 0x46FCFEEF3F55AA90)
                            + a63
                            + ((2 * (LODWORD(STACK[0x14C0]) ^ 0xCDEADFEE)) & 0x1E57EEAFCLL)
                            - 0x46FCFEEFF2BF757ELL);
  *(_DWORD *)(*a64 - 0x5C13350084191667) = v130 ^ (v128 - ((2 * v128) & 0xD878EA00) + 1815901562) ^ 0x81B362E1 ^ (v129 - ((2 * v129) & 0xBC555A4) + 98740946);
  v139 = (v131 ^ v136 ^ 0xAF) - ((2 * (v131 ^ v136 ^ 0xAF)) & 0xC4);
  v140 = ((((v134 ^ v135 ^ 0xAF) - ((2 * (v134 ^ v135 ^ 0xAF)) & 0x30)) << 8) - 1574627328) ^ 0xA2251800;
  v141 = ((((v139 << 16) - 731774976) ^ 0xD4620000)
        + 34265122
        - ((2 * (((v139 << 16) - 731774976) ^ 0xD4620000)) & 0x4140000)) ^ 0x20AD822 | (v140
                                                                                      + 1329041776
                                                                                      - ((2 * v140) & 0x1E6F2200)) ^ 0x4F379170;
  v142 = (v141 + 300819278 - ((2 * v141) & 0x23DC469C)) ^ 0x11EE234E | ((v132 ^ 0xAF ^ v133)
                                                                      + 284242992
                                                                      - ((2 * (v132 ^ 0xAF ^ v133)) & 0x60)) ^ 0x10F13430;
  v143 = (((v142 - ((2 * v142) & 0x76CB3C)) << 8) + 996515328) ^ 0x3B659E00;
  v144 = (v143 + 2000028025 - ((2 * v143) & 0xEE6C0200)) ^ 0x77360179 | ((v137 ^ 0xAF ^ v138)
                                                                       + 349346098
                                                                       - ((2 * (v137 ^ 0xAF ^ v138)) & 0x64)) ^ 0x14D29932;
  *(_DWORD *)(*a64 - 0x5C1335008418C597) = v144 - 840245266 - ((2 * v144) & 0x9BD5BFDC);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)*(&off_100260750 + (HIDWORD(a45) ^ 0xC8)) - 4))(175, v137, 175, a64, 1607707621, 359443825, 1358512080, 105282250, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           0xEE00000249,
           v146,
           v147,
           v148,
           202418848,
           a40,
           v149,
           v150,
           0x24000000409,
           1607707621,
           a45,
           0x13D8C8E760C506E2,
           0x7071305245A737B9,
           0x1C468AF27238D3EALL,
           0x78301B266752FF5ELL,
           0x2C6344EE322B531ELL,
           0x4B61D285394B5A7CLL);
}

void sub_1001D7FC8()
{
  JUMPOUT(0x1001D6960);
}

uint64_t sub_1001D7FD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,int a58,int a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a64;
  _QWORD *a65;
  char a66;
  int v66;
  unsigned int v67;
  unsigned int v68;
  unsigned int v69;
  unsigned int v70;
  unsigned int v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  unsigned int v75;
  uint64_t v76;
  uint64_t v77;
  unsigned int v78;
  uint64_t v79;
  int v80;
  unsigned int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  unsigned int v91;
  unsigned int v92;
  unsigned int v93;
  unsigned int v94;
  unsigned int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  unsigned int v103;
  unsigned int v104;

  v67 = ((a59 - 41) ^ 0x3B2) * v66;
  v68 = (((v66 - 1755748148) >> 2) ^ 0xDFF63B3F) + (((v66 - 1755748148) >> 1) & 0x3FEC767E);
  v69 = v67 + 1491214216;
  v70 = v67 + 1491214313;
  v71 = (v67 + 1491214313) / 0x55C;
  v72 = (v67 + 1491214216) % 0x55C;
  v73 = v67 + 1491214507;
  v74 = (v67 + 1491214507) / 0x55C;
  v67 += 1491237496;
  v75 = (v69 + 194) % 0x55C;
  v76 = *((_DWORD *)&STACK[0x8D0] + v73 - 1372 * v74) ^ 0xCDEADFEE;
  v77 = *((_DWORD *)&STACK[0x8D0] + v70 - 1372 * v71) ^ 0xCDEADFEE;
  v78 = *((_DWORD *)&STACK[0x8D0] + (v67 + 194) % 0x55C);
  v79 = *((_DWORD *)&STACK[0x8D0] + v72) ^ 0xCDEADFEE;
  v80 = *(unsigned __int8 *)((v76 ^ 0xFD5FF5BF9F377DF5) + a64 + ((2 * v76) & 0x13E6EFBEALL) + 0x2A00A4060C8820BLL);
  v81 = *((_DWORD *)&STACK[0x8D0] + (v67 + 97) % 0x55C);
  v82 = *(unsigned __int8 *)((v79 ^ 0xDD4FFF5EF4395FDALL) + a64 + ((2 * v79) & 0x1E872BFB4) + 0x22B000A10BC6A026);
  v83 = *(unsigned __int8 *)((*((unsigned int *)&STACK[0x8D0] + (v67 + 291) % 0x55C) ^ 0x36BEEF6F73042015)
                           + a64
                           + ((2 * (*((_DWORD *)&STACK[0x8D0] + (v67 + 291) % 0x55C) ^ 0xCDEADFEE)) & 0x17DDDFFF6)
                           - 0x36BEEF6FBEEEFFFBLL);
  LODWORD(v79) = *(unsigned __int8 *)((v78 ^ 0x3F775EFA32042755)
                                    + a64
                                    + ((2 * (v78 ^ 0xCDEADFEE)) & 0x1FFDDF176)
                                    - 0x3F775EFAFFEEF8BBLL);
  v84 = *(&a66 + (457 * v66 + 782496669) % 0x708u) ^ 0xAF ^ *(unsigned __int8 *)((v77 ^ 0xFFDF5A2BFDFB2BFFLL)
                                                                                                + a64
                                                                                                + ((2 * v77) & 0x1FBF657FELL)
                                                                                                + 0x20A5D40204D401);
  v85 = *(unsigned __int8 *)((v81 ^ 0x6EBFDF9FA2155031)
                           + ((2 * (v81 ^ 0xCDEADFEE)) & 0xDFFF1FBE)
                           + a64
                           - 0x6EBFDF9F6FFF8FDFLL);
  v86 = *(&a66 + (457 * v66 + 782497126) % 0x708u) ^ 0xAF ^ *(unsigned __int8 *)((*((unsigned int *)&STACK[0x8D0] + v75) ^ 0xDF5C5EED32392115)
                                                                                                + a64
                                                                                                + ((2
                                                                                                  * (*((_DWORD *)&STACK[0x8D0] + v75) ^ 0xCDEADFEE)) & 0x1FFA7FDF6)
                                                                                                + 0x20A3A112002C0105);
  v87 = *(&a66 + (457 * v66 + 782497583) % 0x708u);
  v88 = *(unsigned __int8 *)((*((unsigned int *)&STACK[0x8D0] + v67 % 0x55C) ^ 0xFBD3FF6F35B93D15)
                           + a64
                           + ((2 * (*((_DWORD *)&STACK[0x8D0] + v67 % 0x55C) ^ 0xCDEADFEE)) & 0x1F0A7C5F6)
                           + 0x42C009007AC1D05);
  v89 = (v80 ^ v87 ^ 0xAF) - ((2 * (v80 ^ v87 ^ 0xAF)) & 0x72);
  v90 = *(&a66 + (457 * v66 + 782496212) % 0x708u) ^ 0xAF ^ v82;
  v91 = (((v86 + (~(2 * v86) | 0xFFFE6F)) << 8) - 1161836288) ^ 0xBABFC800;
  v92 = (v91 + 648627832 - ((2 * v91) & 0x1528C00)) ^ 0x26A94678 | ((((v89 << 16) + 188284928) ^ 0xB390000)
                                                                  - 2093037758
                                                                  - ((2 * (((v89 << 16) + 188284928) ^ 0xB390000)) & 0x67C0000)) ^ 0x833EC742;
  v93 = (v92 - 1132174719 - ((2 * v92) & 0x7908C502)) ^ 0xBC846281 | (v84 + 1244682371 - ((2 * v84) & 0xFFFFFF07)) ^ 0x4A305883;
  v94 = (((v93 - ((2 * v93) & 0x15FCBE)) << 8) - 1963041024) ^ 0x8AFE5F00;
  v95 = (v94 - 50726303 - ((2 * v94) & 0xF9F3F400)) ^ 0xFCF9FA61 | (v90 - 1546092185 - ((2 * v90) & 0xCE)) ^ 0xA3D88167;
  v96 = *(&a66 + (457 * v66 + 782607263) % 0x708u);
  v97 = *(&a66 + (457 * v66 + 782605892) % 0x708u);
  v98 = *(&a66 + (457 * v66 + 782606349) % 0x708u);
  LODWORD(v76) = *(&a66 + (457 * v66 + 782606806) % 0x708u);
  *(_DWORD *)(((4 * (v68 + 552464382)) | ((unint64_t)(v68 + 552464382 < 0xE42B3D) << 34))
            + *a65
            - 0x5C13350087A9C35BLL) = *((_DWORD *)&STACK[0x8D0] + (97 * (v68 + 552464382) - 1450443037) % 0x55C) ^ 0xD098B6F8 ^ (v95 - 795298056 - ((2 * v95) & 0xA1316DF0));
  v99 = (v83 ^ v96 ^ 0xAF) + 2748688 - ((2 * (v83 ^ v96 ^ 0xAF)) & 0x1B2);
  v100 = ((((v99 << 8) - 210688) ^ 0x29EDD900) - 1726593683 - ((2 * (((v99 << 8) - 210688) ^ 0x29EDD900)) & 0x322C8A00)) ^ 0x9916456D | ((v79 ^ 0x9A) - 437786230 - ((2 * (v79 ^ 0x9A)) & 0x114)) ^ 0xE5E7E98A;
  v101 = (v85 ^ v98 ^ 0xAF) - ((2 * (v85 ^ v98 ^ 0xAF)) & 0x1D8);
  v102 = ((v76 ^ 0x35) - ((2 * (v76 ^ 0x35)) & 0x160) + 9136) ^ (v100 - ((2 * v100) & 0x8E) + 71);
  v103 = (((v102 << 16) ^ 0x23F70000) + 549956630 - ((2 * ((v102 << 16) ^ 0x23F70000)) & 0x418E0000)) ^ 0x20C7AC16 | ((((v101 << 8) - 1716982784) ^ 0x99A8EC00) + 168610752 - ((2 * (((v101 << 8) - 1716982784) ^ 0x99A8EC00)) & 0x14199600)) ^ 0xA0CCBC0;
  v104 = (v103 + 1941494546 - ((2 * v103) & 0xE771B624)) ^ 0x73B8DB12 | ((v88 ^ v97 ^ 0xAF)
                                                                       + 1480644925
                                                                       - ((2 * (v88 ^ v97 ^ 0xAF)) & 0x7A)) ^ 0x5840D93D;
  *(_DWORD *)(((4 * (v68 + 1117346493)) | ((unint64_t)(v68 + 1117346493 < 0x228F81C8) << 34))
            + *a65
            - 0x5C1335010E571D87) = v104 - 840245266 - ((2 * v104) & 0x9BD5BFDC);
  HIDWORD(a45) = a59 - 41;
  return ((uint64_t (*)(uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)*(&off_100260750 + ((1216 * ((v66 - 1755748144) < 0x20)) ^ a59)) - 8))(1800, 549956630, &a66, 1372, 1480644925, 53, 168610752, 973640231, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50);
}

uint64_t sub_1001D87C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _QWORD *a64;
  unsigned int v64;
  int v65;
  uint64_t v66;
  int v67;
  int v68;
  uint64_t v69;
  unint64_t v70;
  int v71;
  int v72;
  uint64_t v73;
  unsigned int v74;
  unsigned int v75;
  int v76;
  int v77;
  unsigned int v78;
  int v79;
  unsigned int v80;
  uint64_t v81;
  int v82;
  unsigned int v83;
  unsigned int v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  int v88;
  unsigned int v89;
  unsigned int v90;

  HIDWORD(v70) = a8 + 21;
  LODWORD(v70) = ((HIDWORD(a45) + 235) ^ 0xC5F7750B) + a8;
  v71 = (v70 >> 5) - ((2 * (v70 >> 5)) & 0x954C8462) - 895073743;
  HIDWORD(v70) = v71 ^ 0x231;
  LODWORD(v70) = v71 ^ 0xCAA64000;
  v72 = (v70 >> 13) - ((2 * (v70 >> 13)) & 0x44C3D84C) - 1570640858;
  v73 = (((a8 - 973640199) >> 2) + 305686652 - (((a8 - 973640199) >> 1) & 0x2470D0F8)) ^ 0x1238687C;
  HIDWORD(v70) = v72 ^ 0x2C26;
  LODWORD(v70) = v72 ^ 0xA261C000;
  v74 = ((194 * v73) & 0xBD3F4EFE) + ((v73 * v68) ^ 0xDE9FA77F) + 559987073;
  v75 = v74 - (((v74 * (unint64_t)v64) >> 32) >> 10) * a4;
  v76 = ((v70 >> 14) - 1248845602 - ((2 * (v70 >> 14)) & 0x6B2041BC)) ^ 0xB59020DE;
  v77 = *(unsigned __int8 *)(a3 + 457 * a8 + 1723544708 - (457 * a8 + 1723544708) / 0x708u * a1) ^ v67 ^ *(unsigned __int8 *)((*(unsigned int *)(v66 + 4 * (a8 * v68 + 46274232 - ((((a8 * v68 + 46274232) * (unint64_t)v64) >> 32) >> 10) * a4)) ^ 0xFFE9B7F73600229DLL) + a63 + ((2 * (*(_DWORD *)(v66 + 4 * (a8 * v68 + 46274232 - ((((a8 * v68 + 46274232) * (unint64_t)v64) >> 32) >> 10) * a4)) ^ 0xCDEADFEE)) & 0x1F7D5FAE6) + 0x1648080415028DLL);
  v78 = ((194 * v76) & 0xFFFBDAFA) + 133418 + ((v76 * v68) ^ 0xFFFDED7D) + 2393;
  v79 = v77 - ((2 * v77) & 0xE0);
  v80 = *(unsigned __int8 *)(a3 + 457 * a8 + 1723543337 - (457 * a8 + 1723543337) / 0x708u * a1) ^ a6;
  v81 = *(_DWORD *)(v66 + 4 * (v78 - (((v78 * (unint64_t)v64) >> 32) >> 10) * (_DWORD)a4)) ^ 0xCDEADFEE;
  v82 = *(unsigned __int8 *)(a3 + 457 * a8 + 1723544251 - (457 * a8 + 1723544251) / 0x708u * a1) ^ v67 ^ *(unsigned __int8 *)((*(unsigned int *)(v66 + 4 * (a8 * v68 + 46274135 - ((((a8 * v68 + 46274135) * (unint64_t)v64) >> 32) >> 10) * a4)) ^ 0xFFE7FFB730352195) + a63 + ((2 * (*(_DWORD *)(v66 + 4 * (a8 * v68 + 46274135 - ((((a8 * v68 + 46274135) * (unint64_t)v64) >> 32) >> 10) * a4)) ^ 0xCDEADFEE)) & 0x1FBBFFCF6) + 0x18004802200185);
  v83 = (((v82 - ((2 * v82) & 0x50)) << 8) - 4904960) ^ 0xFFB52800;
  v84 = (v83 - 179460259 - ((2 * v83) & 0x6A9B4E00)) ^ 0xF54DA75D | ((((v79 << 16) + 108003328) ^ 0x6700000)
                                                                   - 2053040257
                                                                   - ((2 * (((v79 << 16) + 108003328) ^ 0x6700000)) & 0xB420000)) ^ 0x85A1177F;
  v85 = (2 * v84) & 0x659B691A;
  v86 = v84 - 221399923 - v85;
  v87 = *(unsigned __int8 *)(a3 + 457 * a8 + 1723543794 - (457 * a8 + 1723543794) / 0x708u * a1) ^ v67 ^ *(unsigned __int8 *)((*(unsigned int *)(v66 + 4 * (a8 * v68 + 46274038 - ((((a8 * v68 + 46274038) * (unint64_t)v64) >> 32) >> 10) * a4)) ^ 0xFDECEDA926176CB1) + a63 + ((2 * (*(_DWORD *)(v66 + 4 * (a8 * v68 + 46274038 - ((((a8 * v68 + 46274038) * (unint64_t)v64) >> 32) >> 10) * a4)) ^ 0xCDEADFEE)) & 0x1D7FB66BELL) + 0x213125614024CA1);
  v88 = v86 ^ 0xF2CDB48D | (v87 - 684293365 - ((2 * v87) & 0x16)) ^ 0xD736830B;
  LODWORD(v81) = *(unsigned __int8 *)((v81 ^ 0x7F757D6EFFB367FFLL)
                                    + a63
                                    + ((2 * v81) & 0x1FF66CFFELL)
                                    - 0x7F757D6EFFB367FFLL) ^ v65;
  v89 = (((v88 + 8958960 - ((2 * v88) & 0x1167A0)) << 8) - 0x2000) ^ 0x88B3D000;
  v90 = (v89 + 1553277056 - ((2 * v89) & 0xB92A4000)) ^ 0x5C952080 | (v80 - 919347685 - ((2 * v80) & 0x36)) ^ 0xC933DE1B;
  *(_DWORD *)(*a64
            + 4
            * (((((a8 - 973640199) >> 2) + 305686652 - (((a8 - 973640199) >> 1) & 0x2470D0F8)) ^ 0x3BB37CFBE4CF9EC7)
             + ((2 * v73) & 0x1EDEFED76))
            - 0x4AE128F05FF8F153) = (v81 - ((2 * v81) & 0x100) - 1307673216) ^ *(_DWORD *)(v66 + 4 * v75) ^ 0x9A56AF52 ^ (v90 - ((2 * v90) & 0x50B1A5A4) + 676909778);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v69 + 8 * ((47 * ((a8 - 973640195) < 0x60)) ^ HIDWORD(a45))) - 8))(a1, 3375619611, a3, a4, v86, a6, v85, (a8 + 4), a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50);
}

uint64_t sub_1001D8CF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,int a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _QWORD *a64;
  char a65;
  int v65;
  unsigned int v66;
  unint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  unsigned int v81;
  unsigned int v82;
  int v83;
  unsigned int v84;
  int v85;
  uint64_t v86;
  unint64_t v87;
  int v88;
  unsigned int v89;
  unsigned int v90;
  int v91;
  uint64_t v92;
  unsigned int v93;
  unsigned int v95;

  v95 = (((v65 - 983819217) >> 1) & 0x73FDBFFE) + (((v65 - 983819217) >> 2) ^ 0x79FEDFFF);
  HIDWORD(a45) = (457 * v65 + 1366781210) % 0x708u;
  v66 = (97 * v65 - 941073636) % 0x55Cu;
  v67 = &STACK[0x8D0];
  v68 = *((_DWORD *)&STACK[0x8D0] + (97 * v65 - 941090514) % 0x55Cu) ^ 0xCDEADFEE;
  v69 = *((_DWORD *)&STACK[0x8D0] + (97 * v65 - 941090611) % 0x55Cu) ^ 0xCDEADFEE;
  v70 = *((_DWORD *)&STACK[0x8D0] + (97 * v65 - 941074719 + 590 * (a59 ^ 0x4BCu)) % 0x55C) ^ 0xCDEADFEE;
  LODWORD(v70) = *(unsigned __int8 *)((v70 ^ 0x765E1DFBBDCBFFB7)
                                    + a63
                                    + ((2 * v70) & 0x17B97FF6ELL)
                                    - 0x765E1DFBBDCBFFB7);
  v71 = *((_DWORD *)&STACK[0x8D0] + v66) ^ 0xCDEADFEE;
  v72 = *((unsigned int *)&STACK[0x8D0] + v66) ^ 0x76EFFFFF3317A029;
  v73 = *(unsigned __int8 *)((*((unsigned int *)v67 + (97 * v65 - 941073442) % 0x55Cu) ^ 0xF1EF7CBE930C0F10)
                           + ((2 * (*((_DWORD *)v67 + (97 * v65 - 941073442) % 0x55Cu) ^ 0xCDEADFEE)) & 0xBDCDA1FC)
                           + a63
                           + 0xE108341A1192F02);
  v74 = *(unsigned __int8 *)(v72 + a63 + ((2 * v71) & 0x1FDFAFF8ELL) - 0x76EFFFFFFEFD7FC7);
  v75 = (457 * v65 + 1366779839) % 0x708u;
  v76 = *(unsigned __int8 *)((*((unsigned int *)v67 + (97 * v65 - 941073733) % 0x55Cu) ^ 0x579BFFFFB210E157)
                           + ((2 * (*((_DWORD *)v67 + (97 * v65 - 941073733) % 0x55Cu) ^ 0xCDEADFEE)) & 0xFFF47D72)
                           + a63
                           - 0x579BFFFF7FFA3EB9);
  v77 = *(unsigned __int8 *)((v69 ^ 0x25E7FE1BFF2F7FDDLL) + a63 + ((2 * v69) & 0x1FE5EFFBALL) - 0x25E7FE1BFF2F7FDDLL) ^ *(&a65 + (457 * v65 + 1366700321) % 0x708u) ^ 0xAF;
  v78 = *(unsigned __int8 *)((v68 ^ 0xBC7FA9BAF77FFE27) + a63 + ((2 * v68) & 0x1EEFFFC4ELL) + 0x43805645088001D9) ^ *(&a65 + (457 * v65 + 1366700778) % 0x708u);
  v79 = *(&a65 + (457 * v65 + 1366699864) % 0x708u) ^ *(unsigned __int8 *)((*((unsigned int *)v67
                                                                                             + (97 * v65 - 941090708)
                                                                                             % 0x55Cu) ^ 0xC77EB7DBA2153033)
                                                                                          + ((2
                                                                                            * (*((_DWORD *)v67
                                                                                               + (97 * v65 - 941090708)
                                                                                               % 0x55Cu) ^ 0xCDEADFEE)) & 0xDFFFDFBA)
                                                                                          + a63
                                                                                          + 0x3881482490001023);
  v80 = ((((v78 ^ 0xAF) - ((2 * v78) & 0x20)) << 16) + 907018240) ^ 0x36100000;
  v81 = (((v77 - ((2 * v77) & 0x8C)) << 8) - 2082060800) ^ 0x83E64600;
  v82 = (v81 - 1155264805 - ((2 * v81) & 0x76481C00)) ^ 0xBB240EDB;
  v83 = (v80 + 469358098 - ((2 * v80) & 0x37F20000)) ^ 0x1BF9D612 | v82;
  v84 = v82 | ((v79 ^ 0xAF) - 1277821936 - ((2 * v79) & 0x20)) ^ 0xB3D5FC10;
  v85 = (v83 + 797155328 - ((2 * v83) & 0x5F0750C0) + 2144) ^ 0x2F83A000;
  v86 = *((_DWORD *)&STACK[0x8D0] + (97 * v65 - 941090805) % 0x55Cu) ^ 0xCDEADFEE;
  HIDWORD(v87) = (v84 - ((2 * v84) & 0x5AC) + 2774) ^ 0xAD6;
  LODWORD(v87) = v85;
  v88 = (v87 >> 12) - ((2 * (v87 >> 12)) & 0x12C8F68C) + 157580102;
  HIDWORD(v87) = v88 ^ 0x47B46;
  LODWORD(v87) = v88 ^ 0x9600000;
  v89 = ((((v87 >> 20) - ((2 * (v87 >> 20)) & 0x4EC4EC)) << 8) + 660764160) ^ 0x27627600;
  v90 = (v89 - 744567601 - ((2 * v89) & 0xA73D9800)) ^ 0xD39ECCCF | *(&a65
                                                                                     + (457 * v65 + 1366699407) % 0x708u) ^ 0xAF ^ *(unsigned __int8 *)((v86 ^ 0x7CFFD05FCC5F4DBFLL) + a63 + ((2 * v86) & 0x198BE9B7ELL) - 0x7CFFD05FCC5F4DBFLL);
  v91 = *(&a65 + HIDWORD(a45));
  LODWORD(v86) = *(&a65 + (457 * v65 + 1366780753) % 0x708u);
  LODWORD(v68) = *(&a65 + (457 * v65 + 1366780296) % 0x708u);
  v92 = *(&a65 + v75);
  *(_DWORD *)(((4 * (v95 - 948176075)) | ((unint64_t)(v95 - 948176075 < 0x417ADB34) << 34))
            + *a64
            - 0x5C1335018A048337) = *((_DWORD *)&STACK[0x8D0] + (97 * (v95 - 948176075) + 812864076) % 0x55C) ^ 0x9DB1F96A ^ (v90 - 1649280662 - ((2 * v90) & 0x3B63F2D4));
  LODWORD(v70) = (v86 ^ 0xAF ^ v70) - ((2 * (v86 ^ 0xAF ^ v70)) & 0x54);
  v93 = ((((v91 ^ 0xAF ^ v73) - ((2 * (v91 ^ 0xAF ^ v73)) & 0x194)) << 16) - 775290880) ^ 0xD1CA0000;
  LODWORD(v70) = (((((_DWORD)v70 << 8) + 1284319744) ^ 0x4C8D2A00)
                - 964721240
                - ((2 * ((((_DWORD)v70 << 8) + 1284319744) ^ 0x4C8D2A00)) & 0xCFF0A00)) ^ 0xC67F85A8 | (v93 + 1537997168 - ((2 * v93) & 0x37560000)) ^ 0x5BABF970;
  LODWORD(v70) = (v70 - 971563414 - ((2 * v70) & 0xC2E3CD4)) ^ 0xC6171E6A | ((v68 ^ 0x35)
                                                                           - 1983866162
                                                                           - ((2 * (v68 ^ 0x35)) & 0x19C)) ^ 0x89C09ACE;
  LODWORD(v70) = ((((_DWORD)v70 - ((2 * (_DWORD)v70) & 0x716EB0) + 3716952) ^ ((v74 ^ 0x9A)
                                                                             - ((2 * (v74 ^ 0x9A)) & 0x60)
                                                                             + 14767920)) << 8) ^ 0xD9E06800;
  LODWORD(v70) = (v70 - 1236721392 + (~(2 * v70) | 0x936DBDFF) + 1) ^ 0xB6492110 | ((v76 ^ v92 ^ 0xAF)
                                                                                  + 1497875398
                                                                                  - ((2 * (v76 ^ v92 ^ 0xAF)) & 0x18C)) ^ 0x5947C3C6;
  *(_DWORD *)(((4 * (v95 - 466545364)) | ((unint64_t)(v95 - 466545364 < 0x5E2FE107) << 34))
            + *a64
            - 0x5C133501FCD89A83) = v70 - 840245266 - ((2 * v70) & 0x9BD5BFDC);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)*(&off_100260750 + ((641 * ((v65 - 983819213) < 0xB0)) ^ a59)) - 4))(1372, 1497875398, 1537997168, 2443359173, 2311101134, v74, v92, v75, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50);
}

uint64_t sub_1001D952C(int a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _QWORD *a64;
  int v64;
  uint64_t v65;
  int v66;
  unsigned int v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  int v73;
  unsigned int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  unsigned int v79;
  unsigned int v80;
  unsigned int v81;
  int v82;
  unsigned int v83;
  unsigned int v84;
  unint64_t v85;
  int v86;
  int v87;

  v74 = (((((v66 - 1015121341) & 0x3C81837F ^ 0xB0D56953) + v64) >> 2) ^ 0x7FB3FEFF)
      + (((((v66 - 1015121341) & 0x3C81837F ^ 0xB0D56953) + v64) >> 1) & 0x7F67FDFE);
  v75 = *(unsigned __int8 *)(v65
                           + 457 * v64
                           - 1392248410
                           - ((((457 * v64 - 1392248410) * (unint64_t)a4) >> 32) >> 10)
                           * v68) ^ v71 ^ *(unsigned __int8 *)((*(unsigned int *)(v69
                                                                                + 4
                                                                                * (v64 * v73
                                                                                 + 14613130
                                                                                 - ((((v64 * v73 + 14613130)
                                                                                                  * (unint64_t)v67) >> 32) >> 10)
                                                                                 * a1)) ^ 0xEBBEBBDF295130D2)
                                                             + v70
                                                             + ((2
                                                               * (*(_DWORD *)(v69
                                                                            + 4
                                                                            * (v64 * v73
                                                                             + 14613130
                                                                             - ((((v64 * v73 + 14613130)
                                                                                              * (unint64_t)v67) >> 32) >> 10)
                                                                             * a1)) ^ 0xCDEADFEE)) & 0x1C977DE78)
                                                             + 0x144144201B4410C4);
  v76 = *(unsigned __int8 *)(v65
                           + 457 * v64
                           - 1392247953
                           - ((((457 * v64 - 1392247953) * (unint64_t)a4) >> 32) >> 10)
                           * v68) ^ v71 ^ *(unsigned __int8 *)((*(unsigned int *)(v69
                                                                                + 4
                                                                                * (v64 * v73
                                                                                 + 14613227
                                                                                 - ((((v64 * v73 + 14613227)
                                                                                                  * (unint64_t)v67) >> 32) >> 10)
                                                                                 * a1)) ^ 0xCDEFFAEB772B3310)
                                                             + v70
                                                             + ((2
                                                               * (*(_DWORD *)(v69
                                                                            + 4
                                                                            * (v64 * v73
                                                                             + 14613227
                                                                             - ((((v64 * v73 + 14613227)
                                                                                              * (unint64_t)v67) >> 32) >> 10)
                                                                             * a1)) ^ 0xCDEADFEE)) & 0x17583D9FCLL)
                                                             + 0x32100514453E1302);
  v77 = *(unsigned __int8 *)(v65
                           + 457 * v64
                           - 1392248867
                           - ((((457 * v64 - 1392248867) * (unint64_t)a4) >> 32) >> 10)
                           * v68) ^ v71 ^ *(unsigned __int8 *)((*(unsigned int *)(v69
                                                                                + 4
                                                                                * (v64 * v73
                                                                                 + 14613033
                                                                                 - ((((v64 * v73 + 14613033)
                                                                                                  * (unint64_t)v67) >> 32) >> 10)
                                                                                 * a1)) ^ 0x7FDFEFDF15FEE03BLL)
                                                             + v70
                                                             + ((2
                                                               * (*(_DWORD *)(v69
                                                                            + 4
                                                                            * (v64 * v73
                                                                             + 14613033
                                                                             - ((((v64 * v73 + 14613033)
                                                                                              * (unint64_t)v67) >> 32) >> 10)
                                                                             * a1)) ^ 0xCDEADFEE)) & 0x1B0287FAALL)
                                                             - 0x7FDFEFDFD8143FD5);
  v78 = (((v76 - ((2 * v76) & 0x1D4)) << 16) + 1391067136) ^ 0x52EA0000;
  v79 = (((v75 - ((2 * v75) & 0xFFFFFF87)) << 8) + 1536934656) ^ 0x5B9BC300;
  v80 = (v78 + 159748351 - ((2 * v78) & 0x130A0000)) ^ 0x98590FF | (v79 - 390378020 - ((2 * v79) & 0x51769A00)) ^ 0xE8BB4DDC;
  v81 = (v80 - 2058176291 - ((2 * v80) & 0xAA571BA)) ^ 0x8552B8DD | (v77 + 1183141481 - ((2 * v77) & 0xD2)) ^ 0x46854E69;
  v82 = *(unsigned __int8 *)(v65
                           + 457 * v64
                           - 1392249324
                           - ((((457 * v64 - 1392249324) * (unint64_t)a4) >> 32) >> 10)
                           * v68) ^ v71 ^ *(unsigned __int8 *)((*(unsigned int *)(v69
                                                                                + 4
                                                                                * (v64 * v73
                                                                                 + 14612936
                                                                                 - ((((v64 * v73 + 14612936)
                                                                                                  * (unint64_t)v67) >> 32) >> 10)
                                                                                 * a1)) ^ 0x7ABFFA3F2AD40493)
                                                             + v70
                                                             + ((2
                                                               * (*(_DWORD *)(v69
                                                                            + 4
                                                                            * (v64 * v73
                                                                             + 14612936
                                                                             - ((((v64 * v73 + 14612936)
                                                                                              * (unint64_t)v67) >> 32) >> 10)
                                                                             * a1)) ^ 0xCDEADFEE)) & 0x1CE7DB6FALL)
                                                             - 0x7ABFFA3FE73EDB7DLL);
  v83 = (((((v81 - ((2 * v81) & 0xBC325C)) << 8) - 568775168) ^ 0xDE192E00)
       - 1515059021
       - ((2 * ((((v81 - ((2 * v81) & 0xBC325C)) << 8) - 568775168) ^ 0xDE192E00)) & 0x4B641000)) ^ 0xA5B208B3 | (v82 + 866642929 - ((2 * v82) & 0xFFFFFFE3)) ^ 0x33A7EBF1;
  v84 = (v83 + 2124698422 - ((2 * v83) & 0xFD48A98C) + 400) ^ *(_DWORD *)(v69
                                                                        + 4
                                                                        * (v74 * v73
                                                                         - 1664306375
                                                                         - ((((v74 * v73 - 1664306375)
                                                                                          * (unint64_t)v67) >> 32) >> 10)
                                                                         * a1));
  HIDWORD(v85) = v84 ^ 0x328;
  LODWORD(v85) = v84 ^ 0xB34E8800;
  v86 = (v85 >> 11) - ((2 * (v85 >> 11)) & 0x8C1EA08A) + 1175408709;
  HIDWORD(v85) = v86 ^ 0x60F5045;
  LODWORD(v85) = v86 ^ 0x40000000;
  v87 = (v85 >> 29) - ((2 * (v85 >> 29)) & 0xFBF5D946) + 2113596579;
  HIDWORD(v85) = v87 ^ 0xFAECA3;
  LODWORD(v85) = v87 ^ 0x7D000000;
  *(_DWORD *)(((4 * (v74 - 1143460493)) | ((unint64_t)(v74 - 1143460493 < 0x3B8C2C76) << 34))
            + *a64
            - 0x5C1335017249C83FLL) = (v85 >> 24) - 840245266 - ((2 * (v85 >> 24)) & 0x9BD5BFDC);
  return ((uint64_t (*)(void))(*(_QWORD *)(v72
                                        + 8
                                        * (((2 * ((v64 - 1328190704) < 0xE0)) | (32
                                                                                             * ((v64 - 1328190704) < 0xE0))) ^ v66))
                            - 4))();
}

uint64_t sub_1001D99C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,int a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,int a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a65;
  unsigned int v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  char *v69;
  int v70;
  int v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  int v75;
  unsigned int v76;
  unsigned int v77;
  int v78;
  unsigned int v79;
  uint64_t v80;
  unsigned int v81;
  uint64_t v82;
  unsigned int v83;
  int v84;
  int v85;
  unsigned int v86;
  unsigned int v87;
  int v88;

  v68 = ((a46 + 30) + 1452221458 - ((2 * (a46 + 30)) & 0x24)) ^ 0x568F2412;
  v69 = &a65;
  v70 = *(&a65 + (((914 * v68) & 0x1BF7FE) + ((457 * v68) ^ 0x7FFDFBFFu) - 2147088319) % 0x708);
  v71 = *(_DWORD *)(v67 + 4 * ((1361 * (((2 * ~v70) & 0x1DEu) + v70) + 4459997) % 0x12E0));
  v72 = (2 * ((v71 ^ 0x8DE6BD5D) * (v71 ^ 0x8DE6BD5D) - ((2 * (v71 ^ 0x8DE6BD5D) * (v71 ^ 0x8DE6BD5D)) & 0x6AE2DF64))
       + 1793253220) ^ 0x6AE2DF64;
  v73 = (v72 - ((2 * v72) & 0x47A4833C) - 1546501729) ^ v71;
  v74 = (((v73 >> 15) & 8) + (BYTE2(v73) ^ 0xFFFFFFEC) + 2111900156) ^ 0x75E90DAB;
  v75 = (((2 * v74) & 0x1010141A) - v74 + 1431705074) ^ 0x5D5E11FA;
  v76 = (v73 & 0x21 ^ 0x9EC30001) + (v73 & 0xDE ^ 0x1089085);
  v77 = ((914 * (HIBYTE(v73) ^ 0xFD)) & 0x1E67A) + ((457 * (HIBYTE(v73) ^ 0xFD)) ^ 0x6AEEF33D) - 1793900293;
  LOWORD(v73) = ((2 * (BYTE1(v73) ^ 0x8F)) & 0x92) - (BYTE1(v73) ^ 0x8F) - 6218;
  v78 = (v73 & 0x2D15 ^ 0x2E720801) + (v73 & 0x12EA ^ 0x52A3);
  v79 = ((914 * v75) & 0xDDEF567A) + ((457 * v75) ^ 0xEEF7AB3D) + 285904899;
  v80 = 2443359173 * v79;
  v81 = v79 % 0x708;
  v82 = (((914 * ((v76 - 1) ^ 0x9FCB90E4)) & 0x69FBB6) + ((457 * ((v76 - 1) ^ 0x9FCB90E4)) ^ 0xDD74FDDB) + 579681637)
      % 0x708;
  v83 = (((914 * ((v78 - 1) ^ 0x2E727D27)) & 0xF7FD7F6) + ((457 * ((v78 - 1) ^ 0x2E727D27)) ^ 0x5FBFEBFBu) - 1606267067)
      % 0x708;
  v84 = *(&a65 + v81) ^ 0x35;
  v85 = ((((v69[v77 % 0x708] ^ 0x35) - ((2 * v69[v77 % 0x708]) & 0x94)) << 16)
       + 575275008) ^ 0x224A0000;
  v86 = (((v84 - ((2 * v84) & 0xFFFFFFEF)) << 8) - 170461440) ^ 0xF5D6F700;
  v87 = (v86 - 314174969 - ((2 * v86) & 0x100C2400)) ^ 0xED461207 | (v85 + 538835435 - ((2 * v85) & 0x403A0000)) ^ 0x201DF9EB;
  LODWORD(v69) = (v87 - 942465900 - ((2 * v87) & 0xFA63928)) ^ 0xC7D31C94 | ((v69[v83] ^ 0x35)
                                                                           - 1588985342
                                                                           - ((2 * v69[v83]) & 4)) ^ 0xA14A0202;
  LODWORD(v69) = ((((_DWORD)v69 - ((2 * (_DWORD)v69) & 0x5992D4)) << 8) - 1396086272) ^ 0xACC96A00;
  v88 = *(&a65 + v82) ^ 0x35;
  LODWORD(v69) = ((_DWORD)v69 + 1482264197 - ((2 * (_DWORD)v69) & 0xB0B31C00)) ^ 0x58598E85 | (v88
                                                                                             + 1901576646
                                                                                             - ((2 * v88) & 0x18C)) ^ 0x7157C1C6;
  LODWORD(v69) = a52 ^ 0xE67BC567 ^ ((_DWORD)v69 - 428096153 - ((2 * (_DWORD)v69) & 0xCCF78ACE));
  *((_DWORD *)&STACK[0x8D0] + (97 * a46 + 1431856222) % 0x55Cu) = (_DWORD)v69
                                                                - 840245266
                                                                - ((2 * (_DWORD)v69) & 0x9BD5BFDC);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v66 + 8 * ((1731 * (a46 != 1623525345)) ^ v65)) - 4))(3352501396, 2705981954, 538835435, v82, 1606413307, 6945718, v80, (a46 + 1), a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37);
}

uint64_t sub_1001D9EA8@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,_QWORD *a57)
{
  unsigned int v57;
  uint64_t v58;
  uint64_t v59;
  unsigned int v60;
  int v61;
  uint64_t v62;

  *(_DWORD *)(*a57 + 4 * (v59 + 127 * (v57 ^ 0x25A)) - 0x5C1335027F1EDB5BLL) = *(_DWORD *)(v58
                                                                                         + 4
                                                                                         * ((_DWORD)v59 * a1
                                                                                          - 122780726
                                                                                          - ((((v59 * a1 - 122780726) * (unint64_t)v60) >> 32) >> 10)
                                                                                          * v61));
  return ((uint64_t (*)(void))(*(_QWORD *)(v62 + 8 * (((4 * (v59 == 2126610677)) | (32 * (v59 == 2126610677))) ^ v57))
                            - 4))();
}

uint64_t sub_1001D9F28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,int a46,unsigned int a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,int a56,int a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a67;
  int v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  int v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  int v75;
  unsigned int v76;
  unsigned int v77;
  unsigned int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  unsigned int v85;
  unsigned int v86;
  unsigned int v87;
  int v88;

  v70 = ((a47 + 25) + 808719906 - (((a47 + 25) << (((v67 + 100) & 0xE7) + 58)) & 0x44)) ^ 0x30341622;
  v71 = *(&a67 + (((914 * v70) & 0xF73B8) + ((457 * v70) ^ 0x5FFFB9DCu) - 1610331548) % 0x708);
  v72 = ((v71 ^ 0x35) - ((2 * v71) & 0x84) + 1444787522) ^ *(_DWORD *)(v69
                                                                     + 4
                                                                     * ((1361 * ((v71 ^ 0x7D3FFF3E) + 2 * (v71 ^ 0xC1u))
                                                                       + 521385583)
                                                                      % 0x12E0));
  v73 = (-484640518 - (BYTE1(v72) ^ 0xAE | 0xE31CF8FA) + (BYTE1(v72) ^ 0xAE | 0x1CE30705)) ^ 0xCE33744;
  v74 = ((914 * (HIBYTE(v72) ^ 0x95)) & 0x2ADBE) + ((457 * (HIBYTE(v72) ^ 0x95)) ^ 0x3F5F56DF) - 1063066527;
  v75 = BYTE2(v72) ^ 0x5A;
  v76 = ((914 * ((((2 * v73) | 0x52F70EBA) - v73 - 695961437) ^ 0x397BB757)) & 0x798677C6)
      + ((457 * ((((2 * v73) | 0x52F70EBA) - v73 - 695961437) ^ 0x397BB757)) ^ 0x3CC33BE3)
      - 1019281571;
  v77 = (((2 * (v72 ^ 0x75197)) & 0xAA37A) - (v72 ^ 0x75197) - 453892030) ^ 0xE4F57936;
  v78 = ((914 * v77) & 0x6BFDE7BC) + ((457 * v77) ^ 0x75FEF3DE) - 1979496606;
  v79 = *(&a67 + v74 % 0x708) ^ 0x35;
  v80 = *(&a67 + (((914 * v75) & 0x36D9C) + ((457 * v75) ^ 0xDCBFB6CE) + 591561842) % 0x708) ^ 0x35;
  v81 = *(&a67 + v76 % 0x708);
  v82 = *(&a67 + v78 % 0x708);
  v83 = (((v79 - ((2 * v79) & 0x130)) << 16) + 1217921024) ^ 0x48980000;
  v84 = (((v80 - 2 * (v80 & 7)) << 8) + 735053568) ^ 0x2BD00700;
  v85 = (v84 + 1053780282 - ((2 * v84) & 0x7D9ED200)) ^ 0x3ECF693A | (v83 - 1084725707 - ((2 * v83) & 0x7EB00000)) ^ 0xBF586635;
  v86 = (v85 + 1360643066 - ((2 * v85) & 0xA23387F4)) ^ 0x5119C3FA | ((v81 ^ 0x35)
                                                                    - 1143076202
                                                                    - ((2 * (v81 ^ 0x35)) & 0x12C)) ^ 0xBBDE0A96;
  v87 = (((v86 + 8958960 - ((2 * v86) & 0x11764E)) << 8) + 472832) ^ 0x88BB2700;
  v88 = (v87 + 980256466 - ((2 * v87) & 0x74DB0C00)) ^ 0x3A6D86D2 | ((v82 ^ 0x35)
                                                                   + 172615390
                                                                   - ((2 * (v82 ^ 0x35)) & 0x1BC)) ^ 0xA49E6DE;
  *((_DWORD *)&STACK[0x8D0] + (97 * a47 + 2061230201) % 0x55C) = a57 ^ 0xBB42FC3F ^ (v88
                                                                                   - ((2 * v88) & 0xAF30B892)
                                                                                   - 677880759);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v68 + 8 * ((1376 * (a47 == 332974566)) ^ v67)) - 4))(172615390, 3151891094, 1360643066, 1053780282, 479639, 3810326778, a47, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38);
}

uint64_t sub_1001DA3B8@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,_QWORD *a57)
{
  uint64_t v57;
  int v58;
  uint64_t v59;
  int v60;
  unsigned int v61;
  uint64_t v62;

  *(_DWORD *)(*a57 + 4 * v59 - 0x5C1335023DC1E8DFLL) = *(_DWORD *)(v57
                                                                 + 4
                                                                 * ((_DWORD)v59 * v60
                                                                  + 700181614
                                                                  - ((((v59 * v60 + 700181614)
                                                                                   * (unint64_t)v61) >> 32) >> 10)
                                                                  * v58));
  return ((uint64_t (*)(void))(*(_QWORD *)(v62
                                        + 8
                                        * (int)(((v59 != 1852458449) * ((a1 + 2135284022) & 0x80BA21CF ^ 0x1D1)) ^ a1))
                            - 12))();
}

uint64_t sub_1001DA440(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,unsigned int a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,int a53,int a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a66;
  int v66;
  uint64_t v67;
  uint64_t v68;
  unsigned int v69;
  unsigned int v70;
  unsigned int v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  unsigned int v80;
  unsigned int v81;
  int v82;
  unsigned int v83;

  v69 = ((a47 + 71) - 841877590 - (((v66 - 180) ^ 0x4D) & (2 * (a47 + 71)))) ^ 0xCDD1F7AA;
  v70 = (((914 * v69) & 0xFEEFA) + ((457 * v69) ^ 0x2B87F77D) - 730067773) % 0x708;
  v71 = *(_DWORD *)(v68
                  + 4
                  * ((1361
                    * (((2 * (*(&a66 + v70) ^ 0x40)) & 0x1F8)
                     + (*(&a66 + v70) ^ 0xBAEDEEBE))
                    + 892682160)
                   % 0x12E0));
  v72 = ((HIWORD(v71) & 0x6C ^ 0x99012129) + (HIWORD(v71) & 0x93) - 1) ^ 0x990121E8;
  v73 = (479798241 - (v71 ^ 0x22C8412C | 0x1C9923E1) + (v71 ^ 0x22C8412C | 0xE366DC1E)) ^ 0xC1AE9D0A;
  v74 = (((v71 >> 8) & 0xA2 ^ 0xDCE04881) + ((v71 >> 8) & 0x5D) - 1) ^ 0xDCE048B8;
  v75 = *(&a66
                         + (((914 * (HIBYTE(v71) ^ 0x46)) & 0x3EEFE)
                          + ((457 * (HIBYTE(v71) ^ 0x46)) ^ 0xED9DF77F)
                          + 308560833)
                         % 0x708);
  v76 = *(&a66 + (((914 * v73) & 0xFC7ECF1E) + ((457 * v73) ^ 0xFE3F678F) + 29545393) % 0x708);
  v77 = *(&a66 + (((914 * v74) & 0x72F8B776) + ((457 * v74) ^ 0x397C5BBB) - 964305019) % 0x708);
  v78 = *(&a66 + (((914 * v72) & 0x6ECDCFA6) + ((457 * v72) ^ 0x3766E7D3) - 929344659) % 0x708);
  v79 = ((((v78 ^ 0x35) + 3816188 - ((2 * (v78 ^ 0x35)) & 0x1C4)) << 8) - 6656) ^ 0x3A3AE200;
  v80 = (v79 + 1641384672 - ((2 * v79) & 0x43AB1400)) ^ 0x61D58AE0 | ((((((v75 ^ 0x35) - ((2 * v75) & 0x84)) << 16)
                                                                      - 532545536) ^ 0xE0420000)
                                                                    + 370762824
                                                                    - ((2
                                                                      * ((((v75 ^ 0x35) - ((2 * v75) & 0x84)) << 16)
                                                                       - 532545536)) & 0x2C320000)) ^ 0x16196448;
  v81 = (v80 - 539035008 - ((2 * v80) & 0xBFBDF500)) ^ 0xDFDEFA80 | ((v77 ^ 0x35)
                                                                   - 1975319372
                                                                   - ((2 * (v77 ^ 0x35)) & 0x168)) ^ 0x8A4304B4;
  v82 = (((v81 + 431569 - ((2 * v81) & 0xD2B9A)) << 8) - 1024) ^ 0x695CD00;
  v83 = (v82 + 1859739939 + (~(2 * v82) | 0x224D3DFF) + 1) ^ 0x6ED96123 | ((v76 ^ 0x35)
                                                                         - 1061370192
                                                                         - ((2 * (v76 ^ 0x35)) & 0x160)) ^ 0xC0BCC6B0;
  *((_DWORD *)&STACK[0x8D0] + (97 * a47 - 1683758361) % 0x55C) = a54 ^ 0x2514F8A9 ^ (v83
                                                                                   - ((2 * v83) & 0xF18C4906)
                                                                                   - 121232253);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v67 + 8 * ((29 * (a47 != 1168586936)) ^ v66)) - 8))(1859739939, 3755932288, 2319647924, 370762824, 3705686145, a47, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38);
}

uint64_t sub_1001DA8A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _QWORD *a64;
  int v64;
  int v65;
  unsigned int v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  *(_DWORD *)(*a64 + 4 * v69 - 0x5C1335022A15CB6BLL) = *(_DWORD *)(v68
                                                                 + 4
                                                                 * ((_DWORD)v69 * v65
                                                                  + 113932459
                                                                  - ((((v69 * v65 + 113932459)
                                                                                   * (unint64_t)v66) >> 32) >> 10)
                                                                  * v67));
  return ((uint64_t (*)(void))(*(_QWORD *)(v70 + 8 * (((v69 == 1769946228) * (v64 - 223)) ^ v64)) - 12))();
}

uint64_t sub_1001DA918@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,int a40,int a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,int a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  uint64_t v59;
  uint64_t v60;
  unsigned int v61;
  int v62;
  int v63;
  unint64_t v64;
  int v65;
  unsigned int v66;
  unsigned int v67;
  __int16 v68;
  int v69;
  unsigned int v70;
  unsigned int v71;
  unsigned int v72;
  unsigned int v73;
  int v74;
  unsigned int v75;
  int v76;
  uint64_t v77;
  unsigned int v78;
  int v79;
  int v80;
  unsigned int v81;
  int v82;
  int v83;
  int v84;
  unsigned int v85;
  unsigned int v86;
  int v87;
  unsigned int v88;

  v61 = ((a41 - 82) - 640464282 - ((2 * (a41 + 174)) & 0xCC)) ^ 0xD9D34A66;
  v62 = *(&a59 + (((914 * v61) & 0xD9CE6) + ((457 * v61) ^ 0x78FECE73) - 2029701683) % 0x708);
  v63 = *(_DWORD *)(v60 + 4 * ((1361 * (((2 * (v62 ^ 0x40)) & 0xF4) + (v62 ^ 0x75DAFF3Fu)) + 1861969566) % 0x12E0));
  HIDWORD(v64) = v63 ^ 0x8AB6;
  LODWORD(v64) = v63 ^ 0xB7AE0000;
  v65 = (v64 >> 16) - ((2 * (v64 >> 16)) & 0xF522EC88) - 91130300;
  v66 = ((16 * v65) & 0xED3E7FE0 ^ 0xA9166440) + ((8 * v65) ^ 0x22148DD7);
  v67 = (v66 - ((2 * v66 + 410605730) & 0x45EF2250) + 1865694587) ^ v65;
  v68 = (v67 ^ 0x27) + (v67 & 0xC1 ^ 0xC7C0) - ((v67 ^ 0x27) & 0xFFC1);
  v69 = ((v67 >> 23) & 0x15A ^ 0x52) + (HIBYTE(v67) ^ 0xE2F6994);
  v70 = (((2 * (((BYTE2(v67) ^ 0x49) + (HIWORD(v67) & 0xCD ^ 0x8C6CF084) - ((BYTE2(v67) ^ 0x49) & 0xCD)) ^ 0x8EE830C9)) | 0x127B090C)
       - (((BYTE2(v67) ^ 0x49) + (HIWORD(v67) & 0xCD ^ 0x8C6CF084) - ((BYTE2(v67) ^ 0x49) & 0xCD)) ^ 0x8EE830C9)
       + 1992457082) ^ 0x8BB944AC;
  v71 = (v69 - ((2 * v69 + 1671507750) & 0x5A200EA0) - 1629446429) ^ 0xAD100750;
  v72 = ((v68 & 0x40F5 ^ 0xC66F0030) + (v68 & 0x3F0A ^ 0x1000230B) - 1) ^ 0xD66F64F4;
  v73 = ((914 * v70) & 0x5AD6F3CA) + ((457 * v70) ^ 0x2D6B79E5) - 761872037;
  v74 = (((2 * (BYTE1(v67) ^ 4)) | 0x1B131354) - (BYTE1(v67) ^ 4) + 1651930710) & 0x1FFFFFFF ^ 0x1D898922;
  v75 = (457 * v74) ^ 0xFFF7FFE1;
  v76 = (914 * v74) & 0x7FEFFFC2;
  v77 = (((914 * v72) & 0x799BFFE) + ((457 * v72) ^ 0xFFCCDFFF) + 3496769) % 0x708;
  v78 = (v76 + v75 + 670559) % 0x708;
  v79 = *(&a59 + v73 % 0x708) ^ 0x35;
  v80 = *(&a59 + (((914 * v71) & 0xDF7BD3F6) + ((457 * v71) ^ 0x6FBDE9FB) - 1874717179) % 0x708) ^ 0x35;
  v81 = (((v80 - ((2 * v80) & 0x4A)) << 16) - 601554944) ^ 0xDC250000;
  v82 = (((v79 + (~(2 * v79) | 0xFFFE13)) << 8) + 1669789440) ^ 0x6386F600;
  v83 = (v81 + 2068773557 - ((2 * v81) & 0x769C0000)) ^ 0x7B4EFAB5 | (v82 + 2109369684 - ((2 * v82) & 0x4DA00)) ^ 0x7DBA6D54;
  v84 = *(&a59 + v78) ^ 0x35;
  v85 = (v83 - 1602716718 - ((2 * v83) & 0x40F0F7A4)) ^ 0xA0787BD2 | (v84 - 574143167 - ((2 * v84) & 0x82)) ^ 0xDDC74541;
  v86 = (((v85 - ((2 * v85) & 0x5D29B4)) << 8) - 1365976576) ^ 0xAE94DA00;
  v87 = *(&a59 + v77) ^ 0x35;
  v88 = (v86 - 1181128915 - ((2 * v86) & 0x7332CE00)) ^ 0xB999672D | (v87 + 535373732 - ((2 * v87) & 0x148)) ^ 0x1FE927A4;
  *((_DWORD *)&STACK[0x8D0] + (((a1 + 193) ^ 0x185u) * a41 + 1696379118) % 0x55C) = a48 ^ 0x5CD1F4ED ^ (v88 - ((2 * v88) & 0x6157F892) + 816577609);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v59 + 8 * ((199 * (a41 == 1886466385)) ^ a1)) - 12))(v77, 3720824129, 2692250578, 2068773557, v73 / 0x708uLL, 2420250117, 3533095259, 1512050336, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12,
           a13,
           a14,
           a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32);
}

uint64_t sub_1001DAE98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _QWORD *a64;
  unsigned int v64;
  int v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  *(_DWORD *)(*a64 + 4 * v67 - 0x5C133501882B606BLL) = *(_DWORD *)(v68
                                                                 + 4
                                                                 * (v65
                                                                  + 132
                                                                  + 97 * (_DWORD)v67
                                                                  + 1564316931
                                                                  - ((((v65
                                                                                                  + 132
                                                                                                  + 97 * v67
                                                                                                  + 1564316931)
                                                                                   * (unint64_t)v64) >> 32) >> 10)
                                                                  * v66));
  return ((uint64_t (*)(void))(*(_QWORD *)(v69 + 8 * ((908 * (v67 == 1090823604)) ^ v65)) - 12))();
}

uint64_t sub_1001DAF10@<X0>(uint64_t a1@<X5>, uint64_t a2@<X6>, uint64_t a3@<X7>, int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,int a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,int a56,int a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62)
{
  int v62;
  uint64_t v63;
  uint64_t v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  unsigned int v68;
  int v69;
  unsigned int v70;
  uint64_t v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  unsigned int v79;
  unsigned int v80;
  unsigned int v81;
  unsigned int v82;
  unsigned int v83;
  int v84;
  int v85;
  unsigned int v86;

  v65 = ((a44 + 22) - 1101839811 - (((a44 + 22) << (a4 - 103)) & 0x7A)) ^ 0xBE53423D;
  v66 = (((914 * v65) & 0xEF8FA) + ((457 * v65) ^ 0xF67F7C7D) + 159680451) % 0x708;
  v67 = *(_DWORD *)(v64
                  + 4
                  * ((1361
                    * (((2 * (*(&a62 + v66) ^ 0x66666666)) & 0x16A)
                     + (*(&a62 + v66) ^ 0xBD77EDD1))
                    - 1250474674)
                   % 0x12E0)) ^ 0xB7AE8AB6;
  v68 = v67 - ((2 * v67 + 1468112052) & 0x944CF70A) - 169391649;
  v69 = ((BYTE1(v68) ^ 0x140A0A53) - ((2 * (BYTE1(v68) ^ 0x140A0A53)) & 0x40018) + 603423756) ^ 0x37FD8E48;
  v70 = ((914 * (HIBYTE(v68) ^ 0x40)) & 0x18FB6) + ((457 * (HIBYTE(v68) ^ 0x40)) ^ 0xFEFEC7DB) + 17003365;
  v71 = HIWORD(v68) & 0x77;
  v72 = ((BYTE2(v68) ^ 0x26) + (v71 ^ 0x551) - ((BYTE2(v68) ^ 0x26) & 0x77777777)) ^ 0x510;
  v73 = ((v68 ^ 0x82202D) - ((2 * (v68 ^ 0x82202D)) & 0x10441A8) + 1558148052) ^ 0x5C5D53D6;
  v74 = (457 * v73) ^ 0x67173B62;
  v75 = 914 * v73;
  v76 = *(&a62 + (((914 * v69) & 0xE3ABFFCE) + ((457 * v69) ^ 0xF1D5FFE7) + 237779801) % 0x708);
  v77 = *(&a62 + v70 % 0x708) ^ 0x35;
  v78 = *(&a62 + (((914 * v72) & 0xBED52) + ((457 * v72) ^ 0x2E75F6A9u) - 779336553) % 0x708);
  v79 = ((v75 & 0xCE2E76C4) + v74 - 1729429538) % 0x708;
  v80 = (((v77 - ((2 * v77) & 0x5E)) << 16) - 198246400) ^ 0xF42F0000;
  v81 = ((((v78 ^ 0x35) - ((2 * v78) & 0x180)) << 8) - 1624129536) ^ 0x9F31C000;
  v82 = (v81 - 1888522748 - ((2 * v81) & 0x1EDEDC00)) ^ 0x8F6F6E04 | (v80 - 2116520046 - ((2 * v80) & 0x3B00000)) ^ 0x81D87792;
  v83 = (v82 - 1425713834 - ((2 * v82) & 0x560AAAAC)) ^ 0xAB055556 | ((v76 ^ 0x35)
                                                                    + 1361851957
                                                                    - ((2 * (v76 ^ 0x35)) & 0x6A)) ^ 0x512C3635;
  v84 = *(&a62 + v79);
  v85 = (((v83 + 6548169 - ((2 * v83) & 0xC7D58A)) << 8) - 1024) ^ 0x63EAC500;
  v86 = (v85 - 1090744288 - ((2 * v85) & 0x7DF92000)) ^ 0xBEFC9020 | ((v84 ^ 0x35)
                                                                    + 2026043541
                                                                    - ((2 * (v84 ^ 0x35)) & 0x12A)) ^ 0x78C2F895;
  *((_DWORD *)&STACK[0x8D0] + (a44 * v62 - 1200114602) % 0x55Cu) = a57 ^ (v86 - ((2 * v86) & 0xCD102568) + 1720193716) ^ 0xF723962F;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v63 + 8 * ((1881 * (a44 == 1916327145)) ^ a4)) - 12))(6548169, 2869253462, 1361851957, v71, (a44 + 1), a1, a2, a3, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35);
}

uint64_t sub_1001DB3A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _QWORD *a64;
  unsigned int v64;
  int v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  uint64_t v69;

  *(_DWORD *)(*a64 + 4 * v68 - 0x5C1335014B233957) = *(_DWORD *)(v66
                                                                 + 4
                                                                 * (97 * (_DWORD)v68
                                                                  + 625465104
                                                                  - ((((97 * v68 + 625465104)
                                                                                   * (unint64_t)v64) >> 32) >> 10)
                                                                  * v65));
  return ((uint64_t (*)(void))(*(_QWORD *)(v69 + 8 * ((824 * (v68 == 834834415)) ^ v67))
                            - (v67 + 216)
                            + 1533))();
}

uint64_t sub_1001DB41C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,int a48,unsigned int a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,int a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a66;
  int v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  unsigned int v70;
  int v71;
  unsigned int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  unsigned int v80;
  int v81;
  unsigned int v82;
  unsigned int v83;
  int v84;
  unsigned int v85;

  v70 = (((v67 + 46) ^ 0xC52EC4FC) + (a49 + 14) - ((2 * (a49 + 14)) & 0x196)) ^ 0xC52EC2CB;
  v71 = *(&a66 + (((914 * v70) & 0xC74F6) + ((457 * v70) ^ 0xAFFE3A7B) + 1342556613) % 0x708);
  v72 = ((v71 ^ 0x1B) - ((2 * (v71 ^ 0x1B)) & 0x170) - 695860552) ^ *(_DWORD *)(v69
                                                                              + 4
                                                                              * ((1361
                                                                                * (((2 * (v71 ^ 0x31)) & 0xFFFFFFE3)
                                                                                 + (v71 ^ 0x75D2FAC6))
                                                                                - 1720673467)
                                                                               % 0x12E0));
  v73 = (((2 * (v72 ^ 0x2F)) & 0x152) - (v72 ^ 0x2F) + 1568273238) ^ 0x5FD9F3F6;
  v74 = (v73 - ((2 * v73) & 0x4003D4C) + 726564518) ^ 0x29EE7EB6;
  v75 = (((v72 >> 8) & 0x64 ^ 0x241) + ((v72 >> 8) & 0x9B) - 1) ^ 0x2EE;
  v76 = *(&a66
                         + (((914 * (BYTE2(v72) ^ 0xB1)) & 0x1CDFE)
                          + ((457 * (BYTE2(v72) ^ 0xB1)) ^ 0x5FEEE6FFu)
                          - 1609345983)
                         % 0x708) ^ 0x35;
  v77 = *(&a66
                         + (((914 * (HIBYTE(v72) ^ 0xEF)) & 0x1FD7E)
                          + ((457 * (HIBYTE(v72) ^ 0xEF)) ^ 0xDF52FEBF)
                          + 548355201)
                         % 0x708) ^ 0x35;
  v78 = (((v77 - ((2 * v77) & 0xA6)) << 16) + 1985150976) ^ 0x76530000;
  v79 = (((v76 + 407983 - ((2 * v76) & 0x16E)) << 8) + 591872) ^ 0x642B700;
  v80 = (v78 - 1193866332 - ((2 * v78) & 0x71AE0000)) ^ 0xB8D70BA4 | (v79 - 494411640 - ((2 * v79) & 0x450FC000)) ^ 0xE287E088;
  v81 = *(&a66 + (((914 * v75) & 0xB2E16) + ((457 * v75) ^ 0x2FBD970Bu) - 800807883) % 0x708) ^ 0x35;
  v82 = a49 * v66 + 1229281870;
  v83 = (((((v80 + 1219128196 - ((2 * v80) & 0x1154D708)) ^ 0x48AA6B84 | (v81 - 409494593 - ((2 * v81) & 0xFFFFFF7F)) ^ 0xE7979BBF)
         - ((2
           * ((v80 + 1219128196 - ((2 * v80) & 0x1154D708)) ^ 0x48AA6B84 | (v81 - 409494593 - ((2 * v81) & 0xFFFFFF7F)) ^ 0xE7979BBF)) & 0xF61034)) << 8)
       - 83355136) ^ 0xFB081A00;
  v84 = *(&a66 + (((914 * v74) & 0xEEFBEEF4) + ((457 * v74) ^ 0xF77DF77A) + 142885830) % 0x708) ^ 0x35;
  v85 = (v83 + 1326814778 - ((2 * v83) & 0x9E2B2C00)) ^ 0x4F15963A | (v84 - 1737628850 - ((2 * v84) & 0x9C)) ^ 0x986DE34E;
  *((_DWORD *)&STACK[0x8D0] + v82 % 0x55C) = a56 ^ 0x9F9BDBE8 ^ (v85 - ((2 * v85) & 0x718A4D6C) + 952444598);
  return ((uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v68 + 8 * ((318 * (a49 == 474385393)) ^ v67)) - 12))(1326814778, v82 / 0x55CuLL, 3885472703, 1219128196, 407983, a49, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40);
}

uint64_t sub_1001DB89C@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,_QWORD *a57)
{
  uint64_t v57;
  unsigned int v58;
  int v59;
  uint64_t v60;
  uint64_t v61;

  *(_DWORD *)(*a57 + 4 * v60 - 0x5C133501272E81B3) = *(_DWORD *)(v57
                                                                 + 4
                                                                 * (97 * (_DWORD)v60
                                                                  - 1925800615
                                                                  - ((((97 * v60 - 1925800615)
                                                                                   * (unint64_t)v58) >> 32) >> 10)
                                                                  * v59));
  return ((uint64_t (*)(void))(*(_QWORD *)(v61 + 8 * (((v60 == 684024070) * (a1 - 1488)) ^ a1)) - 8))();
}

uint64_t sub_1001DB910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,unsigned int a49,uint64_t a50,uint64_t a51,int a52,int a53,int a54,int a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,int a62,int a63)
{
  char a68;
  int v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  int v75;
  unsigned int v76;
  unsigned int v77;
  int v78;
  uint64_t v79;
  int v80;
  uint64_t v81;
  int v82;
  int v83;
  int v84;
  int v85;
  unsigned int v86;
  unsigned int v87;
  unsigned int v88;
  unsigned int v89;
  int v90;
  unsigned int v91;
  unsigned int v92;

  v72 = ((a49 - 94) - 24552068 - (((a49 + 162) << (((v68 - 6) & 0xD5) - 20)) & 0xF8)) ^ 0xFE895D7C;
  v73 = (((914 * v72) & 0xAF3F6) + ((457 * v72) ^ 0x6FF579FB) - 1878095291) % 0x708;
  v74 = *(_DWORD *)(v71
                  + 4
                  * ((1361
                    * (2 * ((*(&a68 + v73) ^ 0x17) & 0x7F)
                     + (*(&a68 + v73) ^ 0x74FFDB68u))
                    - 68142032)
                   % 0x12E0));
  v75 = ((v74 ^ 0x2F) - ((2 * (v74 ^ 0x2F)) & 0x74) + 1338) ^ 0x58F;
  v76 = ((v74 >> 8) & 0xC5 ^ 0x4328A41) + ((v74 >> 8) & 0x3A ^ 0x80091011) - 1;
  v77 = (1084068179 - (BYTE2(v74) ^ 0xC9 | 0x409D9153) + (BYTE2(v74) ^ 0xC9 | 0xBF626EAC)) ^ 0xBF2A6EE6;
  v78 = HIBYTE(v74) ^ 0x44;
  v79 = (457 * v78) ^ 0xBBD1F75B;
  v80 = (((2 * v77) & 0x51F48868) - v77 + 386251723) ^ 0x174DBBEB;
  v81 = (457 * v80) ^ 0x6DE6EFEFu;
  v82 = *(&a68
                         + (((914 * v78) & 0x3EEB6)
                                        + v79
                                        + 1144013797
                                        - 1800
                                        * ((2386093
                                          * (unint64_t)(((914 * v78) & 0x3EEB6) + v79 + 1144013797)) >> 32))) ^ 0x35;
  v83 = *(&a68 + (((914 * v75) & 0xCF87FB5A) + ((457 * v75) ^ 0xE7C3FDAD) + 406732179) % 0x708);
  v84 = *(&a68 + (((914 * v80) & 0xDBCDDFDE) + v81 - 1843705007) % 0x708) ^ 0x35;
  v85 = *(&a68
                         + (((914 * (v76 ^ 0x843B9AD5)) & 0xFEFBE)
                          + ((457 * (v76 ^ 0x843B9AD5)) ^ 0xEBEFF7DF)
                          + 336741217)
                         % 0x708);
  v86 = (((v82 - ((2 * v82) & 0xAAAAAAAA)) << 16) - 749404160) ^ 0xD3550000;
  v87 = (((v84 - ((2 * v84) & 0xD8)) << 8) - 1641190400) ^ 0x9E2D6C00;
  v88 = (v87 - 112430904 - ((2 * v87) & 0x7298E000)) ^ 0xF94C70C8 | (v86 + 743852263 - ((2 * v86) & 0x58AC0000)) ^ 0x2C5648E7;
  v89 = (v88 - 1911980161 - ((2 * v88) & 0x1C12FEFE)) ^ 0x8E097F7F | ((v85 ^ 0x35)
                                                                    + 1108988491
                                                                    - ((2 * (v85 ^ 0x35)) & 0x96)) ^ 0x4219D24B;
  v90 = (((v89 - ((2 * v89) & 0xEBA4FE)) << 8) + 1976729344) ^ 0x75D27F00;
  v91 = (v90 - 1076322433 - ((2 * v90) & 0x7FB13E00)) ^ 0xBFD89F7F | ((v83 ^ 0x35) + 1747926527 - 2 * (v83 ^ 0x35)) ^ 0x682F3DFF;
  v92 = (v91 - 473245450 - ((2 * v91) & 0xC795B1EC)) ^ a52;
  *((_DWORD *)&STACK[0x8D0] + (a49 * v69 - 645055134) % 0x55C) = a55 ^ a63 ^ 0xC6E44C21 ^ ((v92 ^ 0xE3CAD8F6)
                                                                                         + 1199033214
                                                                                         - 2
                                                                                         * ((v92 ^ 0xE3CAD8F6) & 0x4777CB7F ^ v92 & 1));
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v70 + 8 * ((1522 * (a49 != 1733492829)) ^ v68)) - 12))(743852263, v79, 2451262289, v81, 3958372319, a49, 1084068179, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40);
}

uint64_t sub_1001DBDBC@<X0>(unsigned int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,_QWORD *a57)
{
  unsigned int v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  *(_DWORD *)(*a57 + 4 * v60 - 0x5C1335017F6F2E3BLL) = *(_DWORD *)(v59
                                                                 + 4
                                                                 * (97 * (_DWORD)v60
                                                                  + 823394167
                                                                  - ((((97 * v60 + 823394167)
                                                                                   * (unint64_t)v57) >> 32) >> 10)
                                                                  * v58));
  return ((uint64_t (*)(void))(*(_QWORD *)(v61 + 8 * (((16 * (v60 != 1054183976)) | ((v60 != 1054183976) << 6)) ^ a1))
                            - 12))();
}

uint64_t sub_1001DBE2C@<X0>(uint64_t a1@<X6>, uint64_t a2@<X7>, unsigned int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,int a44,unsigned int a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,int a50,int a51,int a52,int a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  int v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  unsigned int v67;
  unsigned int v68;
  unsigned int v69;
  unsigned int v70;
  int v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  int v75;
  int v76;
  int v77;
  unsigned int v78;
  int v79;
  int v80;
  int v81;
  unsigned int v82;
  int v83;
  unsigned int v84;
  unsigned int v85;

  v66 = ((a45 - 38) + 1151091266 - ((2 * (a45 + 218)) & 0x84)) ^ 0x449C4242;
  v67 = (((914 * v66) & 0xBFBB4) + ((v66 * (((a3 - 2035992864) & 0x795ACBDE) - 523)) ^ 0xF57DFDDA) + 176555622) % 0x708;
  v68 = *(_DWORD *)(v65
                  + 4
                  * ((1361
                    * ((*(&a63 + v67) ^ 0x97E6FD1D) + 2 * (*(&a63 + v67) ^ 0xE2))
                    + 1827907409)
                   % 0x12E0));
  v69 = ((v68 ^ 0x7EEAE864)
       + (v68 & 0x38 ^ 0x1001018)
       - ((v68 ^ 0x7EEAE864) & 0x5A006838)) ^ 0x8DEAB255;
  v70 = ((HIWORD(v68) & 0xCB ^ 0xB79F320A) + (HIWORD(v68) & 0x34 ^ 0x31) - 1) ^ 0x339F2ECA;
  v71 = v69 - ((2 * v69) & 0x50006720) - 1385237616;
  v72 = ((2 * v70) | 0xE086B2D8) - v70;
  v73 = (((2 * (BYTE1(v68) ^ 0x97500FB)) | 0xC2946B6C) - (BYTE1(v68) ^ 0x97500FB) + 515230282) ^ 0xE83F35B6;
  v74 = (((914 * (v71 ^ 0x56ED19B)) & 0xBB7EBDFE) + ((457 * (v71 ^ 0x56ED19B)) ^ 0xDDBF5EFF) + 574807105) % 0x708;
  v75 = *(&a63
                         + (((914 * (HIBYTE(v68) ^ 0xEA)) & 0x1FFEE)
                          + ((457 * (HIBYTE(v68) ^ 0xEA)) ^ 0xDEA2FFF7)
                          + 559889225)
                         % 0x708);
  v76 = *(&a63
                         + (((914 * ((v72 + 264021652) ^ 0x74434544)) & 0xCFFDBE9E)
                          + ((457 * ((v72 + 264021652) ^ 0x74434544)) ^ 0xE7FEDF4F)
                          + 402873329)
                         % 0x708) ^ 0x35;
  v77 = ((((v75 ^ 0x35) - ((2 * (v75 ^ 0x35)) & 0x4C)) << 16) + 1042677760) ^ 0x3E260000;
  v78 = a45 * v63 + 1975891610;
  v79 = (((v76 - ((2 * v76) & 0x168)) << 8) + 1381872640) ^ 0x525DB400;
  v80 = (v77 + 12511822 - ((2 * v77) & 0x17C0000)) ^ 0xBEEA4E | (v79 + 340940858 - ((2 * v79) & 0x28A4B000)) ^ 0x1452583A;
  v81 = *(&a63 + (((914 * v73) & 0x53373BFA) + ((457 * v73) ^ 0x299B9DFD) - 697918141) % 0x708) ^ 0x35;
  v82 = (v80 - 386125511 - ((2 * v80) & 0xD1F86272)) ^ 0xE8FC3139 | (v81 + 1729089414 - ((2 * v81) & 0x10C)) ^ 0x670FCF86;
  v83 = *(&a63 + v74);
  v84 = (((v82 - ((2 * v82) & 0x3AF5B4)) << 8) - 1652893184) ^ 0x9D7ADA00;
  v85 = (v84 + 623224051 - ((2 * v84) & 0x4A4B4800)) ^ 0x2525A4F3 | ((v83 ^ 0x35)
                                                                   - 556004128
                                                                   - ((2 * (v83 ^ 0x35)) & 0x1C0)) ^ 0xDEDC0CE0;
  *((_DWORD *)&STACK[0x8D0] + v78 % 0x55C) = a50 ^ a53 ^ a52 ^ 0x1823A641 ^ (v85 - ((2 * v85) & 0x7FBBE79A) - 1075973171);
  return ((uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v64 + 8 * ((1071 * (a45 == 2016418853)) ^ a3)) - 12))(623224051, v78 / 0x55CuLL, 3908841785, 1729089414, 3489513118, a45, a1, a2, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14,
           a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36);
}

uint64_t sub_1001DC2F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _QWORD *a64;
  uint64_t v64;
  unsigned int v65;
  unsigned int v66;
  int v67;
  uint64_t v68;
  uint64_t v69;

  *(_DWORD *)(*a64 + 4 * ((((v65 - 963) | 0x32C) ^ 0x3FFFFFFF97C7D760) + v68) - 0x5C13350084191667) = *(_DWORD *)(v64 + 4 * (97 * (_DWORD)v68 - 2102084471 - ((((97 * v68 - 2102084471) * (unint64_t)v66) >> 32) >> 10) * v67));
  return ((uint64_t (*)(void))(*(_QWORD *)(v69 + 8 * ((45 * (v68 != 1748513750)) ^ v65)) - 4))();
}

uint64_t sub_1001DC388@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,unsigned int a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,int a50,int a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  int v59;
  uint64_t v60;
  uint64_t v61;
  unsigned int v62;
  unsigned int v63;
  unsigned int v64;
  int v65;
  int v66;
  unsigned int v67;
  unsigned int v68;
  unsigned int v69;
  int v70;
  int v71;
  uint64_t v72;
  unsigned int v73;
  uint64_t v74;
  unint64_t v75;
  int v76;
  int v77;
  int v78;
  unsigned int v79;
  unsigned int v80;
  int v81;
  unsigned int v82;
  int v83;
  int v84;
  unsigned int v85;
  uint64_t v86;
  uint64_t (*v87)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v62 = ((a1 ^ 0xA1A5E22E) + (a43 - 30) - ((2 * (a43 + 226)) & 0x26)) ^ 0xA1A5E113;
  v63 = (((914 * v62) & 0x73B62) + ((457 * v62) ^ 0xB7839DB1) + 1216374415) % 0x708;
  v64 = *(_DWORD *)(v61
                  + 4
                  * ((1361
                    * (((2 * (*(&a59 + v63) ^ 0x40)) & 0x1F0)
                     + (*(&a59 + v63) ^ 0xCF6FFDBF))
                    + 768497626)
                   % 0x12E0)) ^ 0xB7AE8AB6;
  v65 = (2 * v64 + 670994672) & 0x506FB300;
  v64 -= 63495688;
  v66 = v64;
  v67 = v64 - v65;
  v68 = (v66 ^ 0xB7) - ((2 * (v66 ^ 0xB7)) & 0xAAAAAAAA);
  v69 = ((v67 >> 8) & 0xE3 ^ 0x4C212360) + ((v67 >> 8) & 0x1C ^ 0x9210180D) - 1;
  v70 = ((v69 & 0x487 ^ 0x712A404) + (v69 & 0x378 ^ 0x8001271) - 1) ^ 0xF12B566;
  v71 = BYTE2(v67) ^ 0xAF;
  v72 = (457 * v71) ^ 0x496FDFFFu;
  v73 = ((914 * ((v68 + 4437) ^ 0x1131)) & 0x73EE3FEE) + ((457 * ((v68 + 4437) ^ 0x1131)) ^ 0x39F71FF7) - 972350647;
  v74 = (457 * v70) ^ 0x736FF1EFu;
  v75 = v73 / 0x708uLL;
  v76 = *(&a59 + (((914 * v71) & 0xFFFFBFFF) + v72 - 1231922367) % 0x708);
  v77 = *(&a59
                         + (((914 * (HIBYTE(v67) ^ 0xD1)) & 0xFE8E)
                          + ((457 * (HIBYTE(v67) ^ 0xD1)) ^ 0xC7F67F47)
                          + 940293113)
                         % 0x708) ^ 0x35;
  v78 = (((v77 - ((2 * v77) & 0x40)) << 16) + 1797259264) ^ 0x6B200000;
  v79 = ((((v76 ^ 0x35) + 8809915 - ((2 * (v76 ^ 0x35)) & 0x140)) << 8) - 6912) ^ 0x866DA000;
  v80 = (v79 + 1498213616 - ((2 * v79) & 0x3299D800)) ^ 0x594CECF0 | (v78 + 1520258136 + (~(2 * v78) | 0xCAC5FFFF) + 1) ^ 0x5A9D4C58;
  v81 = *(&a59 + (((914 * v70) & 0x5FE3DE) + v74 - 1936570031) % 0x708) ^ 0x35;
  v82 = (v80 - 1875812358 - ((2 * v80) & 0x2062BFF4)) ^ 0x90315FFA | (v81 - 338455566 - ((2 * v81) & 0x1E4)) ^ 0xEBD393F2;
  v83 = (((v82 - ((2 * v82) & 0xC1F5E8)) << 8) + 1627059200) ^ 0x60FAF400;
  v84 = *(&a59 + v73 % 0x708) ^ 0x35;
  v85 = (v83 - 617755273 - ((2 * v83) & 0xB65B9A00)) ^ 0xDB2DCD77 | (v84 + 41107854 - ((2 * v84) & 0x11C)) ^ 0x273418E;
  v86 = (a43 * v59 - 40533598) % 0x55C;
  v87 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v60 + 8 * ((127 * (a43 != 841700381)) ^ a1)) - 8);
  *((_DWORD *)&STACK[0x8D0] + v86) = a51 ^ 0xCE5C7A17 ^ (v85 - ((2 * v85) & 0xFBB4ADDC) + 2111461102);
  return v87(v86, 2419154938, v74, v75, 940293113, v72, 6284254, a43, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12,
           a13,
           a14,
           a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34);
}

uint64_t sub_1001DC804(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _QWORD *a64;
  unsigned int v64;
  int v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  *(_DWORD *)(*a64 + 4 * v68 - 0x5C13350195072ADBLL) = *(_DWORD *)(v67
                                                                 + 4
                                                                 * (97 * (_DWORD)v68
                                                                  + 627788111
                                                                  - ((((97 * v68 + 627788111)
                                                                                   * (unint64_t)v64) >> 32) >> 10)
                                                                  * v66));
  return ((uint64_t (*)(void))(*(_QWORD *)(v69
                                        + 8 * (v65 | (2 * ((((v65 - 423) | 0x18Cu) ^ 0x19FLL) + v68 != 1144756561))))
                            - 4))();
}

uint64_t sub_1001DC880(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,int a50,int a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,int a63)
{
  char a66;
  int v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  unsigned int v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  int v75;
  uint64_t v76;
  unsigned int v77;
  unsigned int v78;
  unsigned int v79;
  unsigned int v80;
  int v81;
  int v82;
  unsigned int v83;
  unsigned int v84;
  unsigned int v85;
  uint64_t v86;
  int v87;
  int v88;
  unsigned int v89;
  unsigned int v90;
  unsigned int v91;

  v70 = ((a51 + 18) + 1006071527 - (((v66 ^ 0xF9) + 103) & (2 * (a51 + 18)))) ^ 0x3BF76EE7;
  v71 = (((914 * v70) & 0xF7F76) + ((457 * v70) ^ 0xEB77BFBB) + 344736901) % 0x708;
  v72 = *(_DWORD *)(v69
                  + 4
                  * ((1361
                    * (((2 * (*(&a66 + v71) ^ 0xE)) & 0x17C)
                     + (*(&a66 + v71) ^ 0xBF1EB3B1))
                    - 303795608)
                   % 0x12E0));
  v73 = (-1194579236 - (BYTE1(v72) ^ 0x62242027 | 0xB8CC2ADC) + (BYTE1(v72) ^ 0x62242027 | 0x4733D523)) ^ 0x2517F50B;
  v74 = (v72 ^ 0x29 | 0x67DFF1A2) - (v72 ^ 0x29 | 0x98200E5D) - 1742729635;
  v75 = HIBYTE(v72) ^ 0xC8;
  v76 = (914 * v75) & 0xC8EC;
  v77 = (BYTE2(v72) ^ 0xBC | 0xFE516D61) - (BYTE2(v72) ^ 0xBC | 0x1AE929E) + 28218014;
  v78 = ((v77 & 0x8451417D ^ 0x8421003C) + (v77 & 0x7A002E82 ^ 0x58040601) - 1) ^ 0x22746B60;
  v79 = ((v74 & 0x14733A0 ^ 0x80632721) + (v74 & 0x6698C05F) - 1) ^ 0xE7BCD6F9;
  v80 = ((914 * v79) & 0x93FEFCDE) + ((457 * v79) ^ 0xC9FF7E6F) + 906149073;
  v81 = *(&a66 + (v76 + ((457 * v75) ^ 0x7FFE6476) - 2147232054) % 0x708) ^ 0x35;
  v82 = *(&a66 + (((914 * v78) & 0xBFEFEAFA) + ((457 * v78) ^ 0xDFF7F57D) + 537544131) % 0x708) ^ 0x35;
  v83 = (((v81 - ((2 * v81) & 0xF4)) << 16) - 2122711040) ^ 0x817A0000;
  v84 = (((v82 - ((2 * v82) & 0x4C)) << 8) - 1757600256) ^ 0x973D2600;
  v85 = (v84 + 2057382854 - ((2 * v84) & 0x75425600)) ^ 0x7AA12BC6 | (v83 - 2141503146 - ((2 * v83) & 0xB60000)) ^ 0x805B4156;
  v86 = (a51 * v67 + 778232274) % 0x55Cu;
  v87 = *(&a66 + (((914 * v73) & 0x9AFE7DEA) + ((457 * v73) ^ 0xCD7F3EF5) + 847445067) % 0x708);
  v88 = *(&a66 + v80 % 0x708);
  v89 = (v85 + 1698606842 - ((2 * v85) & 0xCA7D5DF4)) ^ 0x653EAEFA | ((v87 ^ 0x35)
                                                                    - 368392541
                                                                    - ((2 * (v87 ^ 0x35)) & 0x146)) ^ 0xEA0AC6A3;
  v90 = (((v89 + 14232773 - ((2 * v89) & 0xB277FE)) << 8) + 997888) ^ 0xD93BFF00;
  v91 = (v90 - 1255311497 - ((2 * v90) & 0x6A5AEE00)) ^ 0xB52D7777 | ((v88 ^ 0x35)
                                                                    + 1272954585
                                                                    - ((2 * (v88 ^ 0x35)) & 0x1B2)) ^ 0x4BDFBED9;
  *((_DWORD *)&STACK[0x8D0] + v86) = a63 ^ 0x1A722258 ^ (v91 - ((2 * v91) & 0x71CB4B40) - 1192909408);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v68 + 8 * ((39 * (a51 != 744703469)) ^ v66)) - 4))(3039655799, v86, 3926574755, 1698606842, 3220171514, v76, 2216755260, (a51 + 1), a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42);
}

uint64_t sub_1001DCD44@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,_QWORD *a57)
{
  uint64_t v57;
  int v58;
  unsigned int v59;
  int v60;
  uint64_t v61;
  uint64_t v62;

  *(_DWORD *)(*a57 + 4 * v61 - 0x5C1335015CD0BA9BLL) = *(_DWORD *)(v57
                                                                 + 4
                                                                 * (97 * (_DWORD)v61
                                                                  + 2023324511
                                                                  - ((((97 * v61 + 2023324511)
                                                                                   * (unint64_t)v59) >> 32) >> 10)
                                                                  * v60));
  return ((uint64_t (*)(void))(*(_QWORD *)(v62 + 8 * (((v61 != 908979520) * v58) ^ a1)) - 4))();
}

uint64_t sub_1001DCDB0@<X0>(uint64_t a1@<X6>, uint64_t a2@<X7>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,int a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,int a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
  int v60;
  uint64_t v61;
  uint64_t v62;
  unsigned int v63;
  unsigned int v64;
  unsigned int v65;
  int v66;
  unsigned int v67;
  int v68;
  unsigned int v69;
  int v70;
  int v71;
  int v72;
  unsigned int v73;
  unsigned int v74;
  int v75;
  int v76;
  unsigned int v77;
  unsigned int v78;
  int v79;

  v63 = ((a46 - 124) - 636681204 - (((a46 + 132) & 0xD ^ a46 & 1) << ((a3 + 50) ^ 0x98))) ^ 0xDA0D040C;
  v64 = (((914 * v63) & 0x33BFFFC) + ((457 * v63) ^ 0x419DFFFE) - 1100610494) % 0x708;
  v65 = *(_DWORD *)(v62
                  + 4
                  * ((1361
                    * (((2 * (*(&a60 + v64) ^ 0x60)) & 0xFFFFFFDF)
                     + (*(&a60 + v64) ^ 0xADCFFD8F))
                    - 242656129)
                   % 0x12E0));
  v66 = ((BYTE2(v65) ^ 0xFB) - ((2 * (BYTE2(v65) ^ 0xFB)) & 0x77777777) + 527185851) ^ 0x7BEC558E;
  v67 = (((2 * v66) | 0xA8B626AE) - v66 + 732228777) ^ 0xB0DB7157;
  v68 = ((v65 ^ 0x7D) + (v65 & 0x5B ^ 0x502) - ((v65 ^ 0x7D) & 0x5B)) ^ 0x58A;
  v69 = ((914 * v68) & 0x1DBCEC) + ((457 * v68) ^ 0xAA6EDE76) + 1435720906;
  v70 = *(&a60
                         + (((914 * (HIBYTE(v65) ^ 0xD3)) & 0x21F9C)
                          + ((457 * (HIBYTE(v65) ^ 0xD3)) ^ 0xFFFF0FCE)
                          + 207730)
                         % 0x708) ^ 0x35;
  v71 = *(&a60 + (((914 * v67) & 0xFFEFFDEE) + ((457 * v67) ^ 0x7FF7FEF7) - 2146812855) % 0x708) ^ 0x35;
  v72 = (((v70 - ((2 * v70) & 0x16)) << 16) + 2047541248) ^ 0x7A0B0000;
  v73 = (((v71 - 2 * (v71 & 7)) << 8) - 321648896) ^ 0xECD40700;
  v74 = (v73 - 1931239961 - ((2 * v73) & 0x19C73A00)) ^ 0x8CE39DE7 | (v72 - 794575086 - ((2 * v72) & 0x21460000)) ^ 0xD0A3BF12;
  v75 = *(&a60
                         + (((914 * (BYTE1(v65) ^ 0xE7)) & 0x3FE54)
                          + ((457 * (BYTE1(v65) ^ 0xE7)) ^ 0xF6CBFF2A)
                          + 154549270)
                         % 0x708);
  v76 = *(&a60 + v69 % 0x708);
  v77 = (v74 - 1578985395 - ((2 * v74) & 0x43C5309A)) ^ 0xA1E2984D | ((v75 ^ 0x35)
                                                                    + 1920741411
                                                                    - ((2 * (v75 ^ 0x35)) & 0x46)) ^ 0x727C3023;
  v78 = (((v77 - ((2 * v77) & 0x7A35C8)) << 8) - 1122311168) ^ 0xBD1AE400;
  v79 = (v78 + 789470900 - ((2 * v78) & 0x5E1CBC00)) ^ 0x2F0E5EB4 | ((v76 ^ 0x35)
                                                                   + 713512248
                                                                   - ((2 * (v76 ^ 0x35)) & 0x70)) ^ 0x2A875538;
  *((_DWORD *)&STACK[0x8D0] + (a46 * v60 + 1249031940) % 0x55Cu) = a52 ^ (v79 - ((2 * v79) & 0x445137D6) - 1574396949) ^ 0x9FD83BD3;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v61 + 8 * ((254 * (a46 == 961239931)) ^ a3)) - 4))(713512248, 1920741411, 53, 3500392210, 2363727335, (a46 + 1), a1, a2, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14,
           a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37);
}

uint64_t sub_1001DD1F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _QWORD *a64;
  int v64;
  unsigned int v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  *(_DWORD *)(*a64 + 4 * (v67 + ((v64 + 2079757410) & 0x84096FD7)) - 0x5C1335020042EE4BLL) = *(_DWORD *)(v68 + 4 * (97 * (_DWORD)v67 - 49632282 - ((((97 * v67 - 49632282) * (unint64_t)v65) >> 32) >> 10) * v66));
  return ((uint64_t (*)(void))(*(_QWORD *)(v69 + 8 * ((1098 * (v67 == 1594520409)) ^ v64)) - 4))();
}

uint64_t sub_1001DD27C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,int a51,unsigned int a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,int a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a66;
  int v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  unsigned int v70;
  unsigned int v71;
  int v72;
  unint64_t v73;
  unsigned int v74;
  int v75;
  unsigned int v76;
  unsigned int v77;
  int v78;
  int v79;
  int v80;
  unsigned int v81;
  int v82;
  unsigned int v83;
  uint64_t v84;
  int v85;
  int v86;
  unsigned int v87;
  int v88;
  unsigned int v89;
  int v90;
  int v91;
  unsigned int v92;
  unsigned int v93;
  unsigned int v94;

  v70 = ((a52 + 123) - 1745541839 - ((2 * (a52 + 123)) & 0x62)) ^ 0x97F52531;
  v71 = (((914 * v70) & 0x14BBBA) + (v66 ^ 0xFFDA580E ^ (457 * v70)) + 2729571) % 0x708;
  v72 = *(_DWORD *)(v69
                  + 4
                  * ((1361
                    * (((2 * (*(&a66 + v71) ^ 0x62)) & 0x1CC)
                     + (*(&a66 + v71) ^ 0xFF1FFF8C))
                    - 1493964177)
                   % 0x12E0));
  HIDWORD(v73) = v72 ^ 0x7AE8AB6;
  LODWORD(v73) = v72 ^ 0xB0000000;
  v74 = (v73 >> 27) - ((2 * (v73 >> 27)) & 0x2C81C10) - 2124149240;
  v75 = ((BYTE1(v74) ^ 0x10591E81) - ((2 * (BYTE1(v74) ^ 0x10591E81)) & 0x8210BA) + 1313311069) ^ 0x7E07972C;
  v76 = (((2 * (BYTE2(v74) ^ 0x47D18C9F)) | 0xE1EE1ABE) - (BYTE2(v74) ^ 0x47D18C9F) - 1895239007) ^ 0x3726815B;
  v77 = ((v73 >> 27) - ((2 * (v73 >> 27)) & 0x10) + 8) ^ 0x818542F6;
  v78 = ((2 * v77) & 0x30281A6) - v77 - 1367571924;
  v79 = (v75 - ((2 * v75) & 0x4072337A) + 981031357) ^ 0x1A6059B5;
  LOBYTE(v77) = (2 * ((v73 >> 27) - ((2 * (v73 >> 27)) & 0x10) + 8)) ^ 0x10;
  v80 = ((_BYTE)v77
       - 2 * (v77 & 0x7E ^ (2 * ((v73 >> 27) - ((2 * (v73 >> 27)) & 0x10) + 8)) & 0xA)
       + 116) & 0x80;
  v81 = v80 ^ 0xBD5D9DEE;
  v82 = (v78 ^ 0x2FF9C12C) + 2 * v80;
  v83 = v81 + 1117938194;
  v84 = (457 * v79) ^ 0xD75F46AF;
  v85 = *(&a66
                         + (((914 * (HIBYTE(v74) ^ 0xE6)) & 0x1F7FC)
                          + ((457 * (HIBYTE(v74) ^ 0xE6)) ^ 0x63FEFBFE)
                          - 1677508798)
                         % 0x708u) ^ 0x35;
  v86 = *(&a66 + (((914 * v76) & 0x737F778E) + ((457 * v76) ^ 0xB9BFBBC7) + 1178763129) % 0x708) ^ 0x35;
  v87 = (((v85 - ((2 * v85) & 0xCCCCCCCC)) << 16) + 1097203712) ^ 0x41660000;
  v88 = (((v86 + 1648088 - ((2 * v86) & 0x19A)) << 8) - 2816) ^ 0x1925CD00;
  v89 = (v88 - 365243164 - ((2 * v88) & 0x5475A800)) ^ 0xEA3AD4E4 | (v87 + 1793660153 - ((2 * v87) & 0x55D20000)) ^ 0x6AE914F9;
  v90 = *(&a66 + (((914 * v79) & 0xAEBE8D5E) + v84 + 681768081) % 0x708) ^ 0x35;
  v91 = *(&a66
                         + (457 * (((2 * (v82 + v83)) & 0xFBFFBFBE) + ((v82 + v83) ^ 0x7DFFDFDF)) + 305748713) % 0x708);
  v92 = (v89 - 493886803 - ((2 * v89) & 0x451FC55A)) ^ 0xE28FE2AD | (v90 + 1461435148 - ((2 * v90) & 0x18)) ^ 0x571BBB0C;
  v93 = (((v92 - ((2 * v92) & 0x801BA0)) << 8) - 1072836608) ^ 0xC00DD000;
  v94 = (v93 + 1587916908 - ((2 * v93) & 0xBD4B6000)) ^ 0x5EA5B06C | ((v91 ^ 0x35)
                                                                    + 662840948
                                                                    - ((2 * (v91 ^ 0x35)) & 0xE8)) ^ 0x27822674;
  *((_DWORD *)&STACK[0x8D0] + (a52 * v67 + 1877949339) % 0x55C) = a59 ^ (v94 - ((2 * v94) & 0x5828B634) + 739531546) ^ 0x27778039;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v68 + 8 * ((722 * (a52 == 1264702340)) ^ v66)) - 4))(662840948, 1461435148, 1677655038, v84, 4227841982, a52, 46668816, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43);
}

uint64_t sub_1001DD774@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,_QWORD *a57)
{
  unsigned int v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  *(_DWORD *)(*a57 + 4 * v60 - 0x5C1335011AAA8817) = *(_DWORD *)(v59
                                                                 + 4
                                                                 * (97 * (_DWORD)v60
                                                                  - 1129055648
                                                                  - ((((97 * v60 - 1129055648)
                                                                                   * (unint64_t)v57) >> 32) >> 10)
                                                                  * v58));
  return ((uint64_t (*)(void))(*(_QWORD *)(v61 + 8 * (((16 * (v60 != 631532191)) | (32 * (v60 != 631532191))) ^ a1))
                            - 12))();
}

uint64_t sub_1001DD7E4@<X0>(uint64_t a1@<X7>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,int a46,unsigned int a47,uint64_t a48,uint64_t a49,uint64_t a50,int a51,int a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  int v61;
  uint64_t v62;
  uint64_t v63;
  unsigned int v64;
  int v65;
  int v66;
  unsigned int v67;
  unsigned int v68;
  unsigned int v69;
  unsigned int v70;
  unsigned int v71;
  unsigned int v72;
  int v73;
  unsigned int v74;
  unsigned int v75;
  int v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  unsigned int v80;
  int v81;
  unsigned int v82;
  int v83;
  unsigned int v84;
  unsigned int v85;
  int v86;
  unsigned int v87;

  v64 = ((a47 - 12) - 760792028 - (((a47 + 244) << (a2 - 24)) & 0x48)) ^ 0xD2A73C24;
  v65 = *(&a61 + (((914 * v64) & 0x15DF3C) + ((457 * v64) ^ 0x795AEF9E) - 2035739486) % 0x708);
  v66 = (v65 ^ 0x35) - ((2 * (v65 ^ 0x35)) & 0x16);
  v67 = (*(_DWORD *)(v63 + 4
                         * ((1361 * (((2 * (v65 ^ 0x85)) & 0xFFFFFF3F) + (v65 ^ 0x77FEEE3A)) + 235303281) % 0x12E0)) ^ 0xB7AE8AB6)
      + ((((v66 - 32976373) ^ 0x1B6EC3A8) + 1) ^ 0x692EFABF)
      + ((2 * (((v66 - 32976373) ^ 0x1B6EC3A8) + 1)) & 0xD25DF57E)
      - 1764686527;
  v68 = v67 - ((2 * v67) & 0x93FB12FC) - 906131074;
  v69 = (((2 * (v68 ^ 0x62)) & 0xFFFFFFCF) - (v68 ^ 0x62) + 694198040) ^ 0x8C3087FD;
  v70 = ((BYTE1(v68) ^ 0x87) - ((2 * (BYTE1(v68) ^ 0x87)) & 0x134) - 876240486) ^ 0xC8C5A39E;
  v71 = ((BYTE2(v68) ^ 0x3B) - 1255536335 - ((2 * (BYTE2(v68) ^ 0x3B)) & 0x62)) ^ 0xB52A09F6;
  v72 = (v69 - ((2 * v69) & 0x4A00297A) + 1033901245) ^ 0x98F00CA5;
  v73 = (((2 * v70) & 0x20038B6) - v70 + 511419300) ^ 0x1D7BA1A6;
  v74 = ((914 * (HIBYTE(v68) ^ 0x89)) & 0x2CDFC) + ((457 * (HIBYTE(v68) ^ 0x89)) ^ 0xFFF766FE);
  v75 = ((914 * v73) & 0x39FFFF58) + ((457 * v73) ^ 0x9CFFFFAC) + 1661090708;
  v76 = *(&a61 + (((914 * v71) & 0xEE73B7FC) + ((457 * v71) ^ 0x7739DBFE) - 2000134334) % 0x708) ^ 0x35;
  v77 = *(&a61 + (v74 + 709698) % 0x708) ^ 0x35;
  v78 = (((914 * v72) & 0xEFD7C7DC) + ((457 * v72) ^ 0xF7EBE3EE) + 135681874) % 0x708;
  v79 = (a47 * v61 + 1720853876) % 0x55C;
  v80 = (((v77 - ((2 * v77) & 0x9A)) << 16) - 1437794304) ^ 0xAA4D0000;
  v81 = (((v76 - ((2 * v76) & 0xA0)) << 8) + 268914688) ^ 0x10075000;
  v82 = (v80 + 1267932940 - ((2 * v80) & 0x17260000)) ^ 0x4B931F0C | (v81 - 2138490775 - ((2 * v81) & 0x1127000)) ^ 0x80893869;
  v83 = *(&a61 + v75 % 0x708) ^ 0x35;
  v84 = (v82 + 709320451 - ((2 * v82) & 0x548EBE06)) ^ 0x2A475F03 | (v83 - 811963103 + (~(2 * v83) | 0xFFFFFFBD) + 1) ^ 0xCF9A6D21;
  v85 = (((v84 - ((2 * v84) & 0x866E36)) << 8) - 1019798784) ^ 0xC3371B00;
  v86 = *(&a61 + v78) ^ 0x35;
  v87 = (v85 - 945935628 - ((2 * v85) & 0x8F3C5400)) ^ 0xC79E2AF4 | (v86 - 310974384 - ((2 * v86) & 0xA0)) ^ 0xED76E850;
  *((_DWORD *)&STACK[0x8D0] + v79) = a52 ^ (v87 - ((2 * v87) & 0xCB0B12B4) - 444233382) ^ 0xD469275D;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v62 + 8 * ((301 * (a47 == 425039627)) ^ a2)) - 12))(v78, 160, v79, 3483004193, 709320451, 1267932940, a47, a1, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13,
           a14,
           a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38);
}

uint64_t sub_1001DDCF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _QWORD *a64;
  int v64;
  uint64_t v65;
  uint64_t v66;
  unsigned int v67;
  int v68;
  uint64_t v69;

  *(_DWORD *)(*a64 + 4 * v66 - 0x5C1335022767081BLL) = *(_DWORD *)(v65
                                                                 + 4
                                                                 * (((15 * (v64 ^ 0x64F)) ^ 0x47DDC63C)
                                                                  + 97 * (_DWORD)v66
                                                                  - ((((((15 * (v64 ^ 0x64F)) ^ 0x47DDC63Cu)
                                                                                    + 97 * (_DWORD)v66)
                                                                                   * (unint64_t)v67) >> 32) >> 10)
                                                                  * v68));
  return (*(uint64_t (**)(void))(v69 + 8 * ((204 * (v66 != 1758690720)) ^ v64)))();
}

uint64_t sub_1001DDD70@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,int a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,int a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
  int v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  unsigned int v62;
  char *v63;
  unsigned int v64;
  int v65;
  int v66;
  unsigned int v67;
  unsigned int v68;
  uint64_t v69;
  int v70;
  unsigned int v71;
  int v72;
  int v73;
  int v74;
  unsigned int v75;
  uint64_t v76;
  unsigned int v77;
  int v78;
  int v79;
  unsigned int v80;
  uint64_t v81;
  unsigned int v82;
  unsigned int v83;
  int v84;
  int v85;
  unsigned int v86;
  unsigned int v87;
  unsigned int v88;
  int v89;
  unsigned int v90;
  int v91;
  int v92;
  unsigned int v93;

  v61 = ((a46 + 78) + 1670447876 - ((2 * ((_BYTE)a46 + 78)) & 8)) ^ 0x63910304;
  v62 = (((914 * v61) & 0x7AE8FEE) + ((457 * v61) ^ 0x37D747F7u) - 936592311) % 0x708;
  v63 = &a58;
  v64 = *(_DWORD *)(v60
                  + 4
                  * ((1361
                    * (((2 * (v63[v62] ^ 0x24)) & 0xDE) + (v63[v62] ^ 0xCD9DDFCB))
                    - 603090796)
                   % 0x12E0));
  v65 = HIBYTE(v64) ^ 0x1D;
  v66 = -249984313 - (BYTE1(v64) ^ 0x3C) + ((2 * (BYTE1(v64) ^ 0x3C)) & 0x66666666);
  v67 = ((HIWORD(v64) & 0x45 ^ 0xBEFD1F01) + (HIWORD(v64) & 0xBA ^ 0x89) - 1) ^ 0xAAC797E5;
  v68 = ((2 * v67) & 0x8515C8E) - v67;
  v69 = (a46 * v58 - 311846350);
  v70 = *(_DWORD *)(v60
                                   + 4
                                   * ((1361
                                     * (((2 * (v63[v62] ^ 0x24)) & 0xDE)
                                      + (v63[v62] ^ 0xCD9DDFCB))
                                     - 603090796)
                                    % 0x12E0)) ^ 0x7D;
  v71 = (457 * v70) ^ 0xBEEDFEE1;
  v72 = ((914 * v65) & 0x14FFC) + ((457 * v65) ^ 0x3F96A7FE);
  v73 = (914 * v70) & 0x3FDC2;
  v74 = (v68 + 1372803512) ^ 0x45E9D9AA;
  v75 = v72 - 1066691774;
  v76 = (457 * v74) ^ 0x73DF737Fu;
  v77 = (v66 + 5) ^ 0xF1198AC7;
  v78 = 457 * v77;
  v79 = 914 * v77;
  v80 = (914 * v74) & 0xE7BEE6FE;
  v81 = v78 ^ 0xF6EA3B3F;
  if (v69 >= 0xFFFFFAA4)
    v82 = a46 * v58 - 122722185;
  else
    v82 = ((v69 % 0x55C) ^ 0x5F7DFDF9) - 1412969744 + ((2 * (v69 % 0x55C)) & 0xBF2);
  v83 = (v73 + v71 + 1091845215) % 0x708;
  v84 = *(&a58 + v75 % 0x708) ^ 0x35;
  v85 = *(&a58 + (v80 + v76 - 1943877695) % 0x708) ^ 0x35;
  v86 = (((v84 - ((2 * v84) & 0x66666666)) << 16) - 1607270400) ^ 0xA0330000;
  v87 = (((v85 - ((2 * v85) & 0xEC)) << 8) - 161909248) ^ 0xF6597600;
  v88 = (v87 - 763339104 - ((2 * v87) & 0x2500BC00)) ^ 0xD2805EA0 | (v86 - 365053012 - ((2 * v86) & 0x547A0000)) ^ 0xEA3DBBAC;
  v89 = *(&a58 + ((v79 & 0x4767E) + v81 + 152567809) % 0x708) ^ 0x35;
  v90 = (v88 + 1946026591 - ((2 * v88) & 0xE7FC04BE)) ^ 0x73FE025F | (v89 - 519183705 - ((2 * v89) & 0x14E)) ^ 0xE10DE2A7;
  v91 = (((v90 - ((2 * v90) & 0xC28A58)) << 8) + 1631923200) ^ 0x61452C00;
  v92 = *(&a58 + v83) ^ 0x35;
  v93 = (v91 - 1668916062 - ((2 * v91) & 0x390CB800)) ^ 0x9C865CA2 | (v92 + 2037799047 - ((2 * v92) & 0xFFFFFF0F)) ^ 0x79765887;
  *((_DWORD *)&STACK[0x8D0] + v82 - 189122793) = a54 ^ (v93 - ((2 * v93) & 0xCFBDF9E4) + 1742666994) ^ 0x44F4CDED;
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v59 + 8 * ((19 * (a46 != 2128559793)) ^ a1)) - 12))(3775783591, 3531628192, ((v69 % 0x55C) ^ 0x5F7DFDF9) - 1412969744 + ((2 * (v69 % 0x55C)) & 0xBF2), v81, v76, 1944023935, 86012, v69, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12,
           a13,
           a14,
           a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37);
}

uint64_t sub_1001DE1FC@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,_QWORD *a57)
{
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  *(_DWORD *)(*a57 + 4 * v58 - 0x5C133501D81F3E5BLL) = *(_DWORD *)(v57
                                                                 + 4
                                                                 * ((97 * (int)v58 - 899229329)
                                                                  % (a1 + 1177)));
  return ((uint64_t (*)(void))(*(_QWORD *)(v59 + 8 * ((1992 * (v58 == 1426167088)) ^ a1)) - 12))();
}

uint64_t sub_1001DE270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,int a54,unsigned int a55,uint64_t a56,int a57,int a58,int a59,int a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a68;
  int v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  unsigned int v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int v76;
  unsigned int v77;
  int v78;
  int v79;
  uint64_t v80;
  unsigned int v81;
  unsigned int v82;
  unsigned int v83;
  uint64_t v84;
  unsigned int v85;
  unsigned int v86;
  unsigned int v87;
  unsigned int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  unsigned int v93;
  int v94;
  int v95;
  unsigned int v96;
  int v97;
  unsigned int v98;

  v72 = *(&a68
                         + (((914 * (a55 - 46)) & 0x3DBEE)
                          + (v68 ^ 0xEA241435)
                          + ((457 * (a55 - 46)) ^ 0x15DFEDF7))
                         % 0x708);
  v73 = 1361 * (((2 * (v72 ^ 0x38)) & 0xD6) + (v72 ^ 0xFF3D7743)) + 175176823;
  v74 = ((2 * (v72 ^ 0x79)) & 0xFFFFFFF7) + (v72 ^ 0xFFD9DB86);
  v75 = (v74 - 1949388887 + ((2 * ((v74 + 392) & 0x623 ^ (v74 | 0x7FFFFFFC))) ^ 0x20A02007)) ^ *(_DWORD *)(v71 + 4 * (v73 % 0x12E0));
  v76 = (BYTE1(v75) ^ 0xD0 | 0x5E36B296) - (BYTE1(v75) ^ 0xD0 | 0xA1C94D69) - 1580642967;
  v77 = ((v76 & 0x1636B229 ^ 0x226E9201) + (v76 ^ 0x9D91643E) - ((v76 ^ 0x9D91643E) & 0xB6FFB629)) ^ 0x75586084;
  v78 = ((BYTE2(v75) ^ 0x46) - ((2 * (BYTE2(v75) ^ 0x46)) & 0x116) + 2443) ^ 0x9CA;
  v79 = HIBYTE(v75) ^ 0xF2;
  v80 = (457 * v79) ^ 0x77FB7FFDu;
  v81 = (1680566891 - (v75 ^ 0x39 | 0x642B6A6B) + (v75 ^ 0x39 | 0x9BD49594)) ^ 0x9FD65185;
  v82 = (((2 * v81) | 0xA21A186A) - v81 + 787674059) ^ 0xD50FC893;
  v83 = (457 * v82) ^ 0xFA8FFFFF;
  v84 = (914 * v79);
  v85 = (914 * v82) & 0xF51FFFFE;
  v86 = ((914 * v77) & 0x7DDB2E7A) + ((457 * v77) ^ 0xBEED973D) + 1091871747;
  v87 = (v84 & 0x2FFFA) + v80 - 2012824765;
  v88 = v85 + v83 + 91372353;
  v89 = *(&a68 + v87 % 0x708) ^ 0x35;
  v90 = *(&a68 + (((914 * v78) & 0xCFFDAEB6) + ((457 * v78) ^ 0x67FED75B) - 1744608283) % 0x708) ^ 0x35;
  v91 = (((v89 - ((2 * v89) & 0x19C)) << 16) + 701366272) ^ 0x29CE0000;
  v92 = (((v90 - ((2 * v90) & 0xC)) << 8) + 937035264) ^ 0x37DA0600;
  v93 = (v92 - 1741034385 - ((2 * v92) & 0x3073D800)) ^ 0x9839EC6F | (v91 + 517309215 - ((2 * v91) & 0x3DAA0000)) ^ 0x1ED5831F;
  v94 = *(&a68 + v88 % 0x708);
  v95 = *(&a68 + v86 % 0x708) ^ 0x35;
  v96 = (v93 - 2069248649 - ((2 * v93) & 0x9538AEE)) ^ 0x84A9C577 | (v95 - 2092275569 - ((2 * v95) & 0xFFFFFF1F)) ^ 0x834A688F;
  v97 = (((v96 - ((2 * v96) & 0xFAD9BA)) << 8) + 2104286464) ^ 0x7D6CDD00;
  v98 = (v97 + 645474418 - ((2 * v97) & 0x4CF25000)) ^ 0x26792872 | ((v94 ^ 0x35)
                                                                   - 2129978128
                                                                   - ((2 * (v94 ^ 0x35)) & 0x1E0)) ^ 0x810B1CF0;
  *((_DWORD *)&STACK[0x8D0] + (a55 * v69 + 761758610) % 0x55C) = a60 ^ a59 ^ a58 ^ 0x5BE98B82 ^ (v98
                                                                                               - ((2 * v98) & 0xC8E75288)
                                                                                               - 462182076);
  return ((uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v70 + 8 * ((353 * (a55 == 1409043501)) ^ v68)) - 4))(517309215, v87 / 0x708uLL, v80, v84, 4203741183, 1680566891, a55, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46);
}

uint64_t sub_1001DE754@<X0>(unsigned int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,_QWORD *a57)
{
  int v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  *(_DWORD *)(*a57 + 4 * v60 - 0x5C1335026BF7B883) = *(_DWORD *)(v59
                                                                 + 4
                                                                 * (97 * (_DWORD)v60
                                                                  - 920427995
                                                                  - ((((97 * v60 - 920427995)
                                                                                   * (unint64_t)a1) >> 32) >> 10)
                                                                  * v58));
  return ((uint64_t (*)(void))(*(_QWORD *)(v61 + 8 * ((19 * (v60 != 2046277818)) ^ v57)) - 4))();
}

uint64_t sub_1001DE7C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,int a56,uint64_t a57,int a58,uint64_t a59,uint64_t a60,int a61,int a62,int a63)
{
  char a66;
  int v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  unsigned int v70;
  int v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int v76;
  unsigned int v77;
  unsigned int v78;
  unsigned int v79;
  unsigned int v80;
  uint64_t v81;
  int v82;
  int v83;
  int v84;
  unsigned int v85;
  uint64_t v86;
  unsigned int v87;
  int v88;
  unsigned int v89;
  int v90;
  int v91;

  v70 = ((a56 + ((v67 + 49) & 0xEB) + 120)
       - 49017277
       - ((2 * (a56 + ((v67 + 248501297) & 0xF1302FEB) - 1672)) & 0x86)) ^ 0xFD140E43;
  v71 = *(&a66 + (((914 * v70) & 0xEB37E) + ((457 * v70) ^ 0xFF5F59BF) + 10791553) % 0x708);
  v72 = (((v71 ^ 0x35) - ((2 * (v71 ^ 0x35)) & 0x7C) - 729250498) ^ 0x3B9E348D)
      + (*(_DWORD *)(v69 + 4 * ((1361 * (((2 * (v71 ^ 6)) & 0x15E) + (v71 ^ 0xED6ED3E9)) - 1240803354) % 0x12E0)) ^ 0xB7AE8AB6);
  v73 = v72 - ((2 * v72) & 0x7046D4E8) + 941845108;
  v74 = (((v73 >> 8) & 0x1D) + ((v73 >> 8) & 0xE2 ^ 0xFB59CC43) - 1) ^ 0xB9C9CEE2;
  v75 = ((BYTE2(v73) ^ 0x6F) - 2051377101 - ((2 * (BYTE2(v73) ^ 0x6F)) & 0x66666666)) ^ 0x85BA786E;
  v76 = (1653546848 - (v74 | 0x628F1F60) + (v74 | 0x9D70E09F)) ^ 0xDFE0E20F;
  v77 = ((914 * (HIBYTE(v73) ^ 0x43)) & 0x27F62) + ((457 * (HIBYTE(v73) ^ 0x43)) ^ 0x3FBB3FB1) - 1069089905;
  v78 = ((v73 ^ 0x20801148) - ((2 * (v73 ^ 0x20801148)) & 0x400020C2) - 149309855) ^ 0xD799A705;
  v79 = (((914 * v78) & 0xB7FDC8FC) + ((457 * v78) ^ 0xDBFEE47E) + 604198594) % 0x708;
  v80 = (((914 * v76) & 0xA3FBCEFE) + ((457 * v76) ^ 0x51FDE77F) - 1375448127) % 0x708;
  v81 = (a56 * v66 - 1819458621) % 0x55Cu;
  v82 = *(&a66 + v77 % 0x708) ^ 0x35;
  v83 = *(&a66 + (((914 * v75) & 0xF6D3DF3A) + ((457 * v75) ^ 0xFB69EF9D) + 77089699) % 0x708) ^ 0x35;
  v84 = (((v82 - ((2 * v82) & 0x2A)) << 16) + 1981087744) ^ 0x76150000;
  v85 = (((v83 - ((2 * v83) & 0xFFFFFFE3)) << 8) - 112398080) ^ 0xF94CF100;
  v86 = *(&a66 + v79);
  v87 = (v85 + 1009756207 - ((2 * v85) & 0x785F5000)) ^ 0x3C2FA82F | (v84 - 984618952 - ((2 * v84) & 0xA9E0000)) ^ 0xC54FE838;
  v88 = *(&a66 + v80) ^ 0x35;
  v89 = (v87 - 2012606486 - ((2 * v87) & 0x10141FD4)) ^ 0x880A0FEA | (v88 + 1536318011 - ((2 * v88) & 0x76)) ^ 0x5B925A3B;
  v90 = (((v89 - ((2 * v89) & 0x60A9B0)) << 8) + 810866688) ^ 0x3054D800;
  v91 = (v90 - 1197982648 - ((2 * v90) & 0x71307800)) ^ 0xB8983C48 | ((v86 ^ 0x35)
                                                                    + 2038238733
                                                                    - ((2 * (v86 ^ 0x35)) & 0x1A)) ^ 0x797D0E0D;
  *((_DWORD *)&STACK[0x8D0] + v81) = a58 ^ a63 ^ a61 ^ 0x9A2EEE72 ^ (v91
                                                                                 - ((2 * v91) & 0x21E1076C)
                                                                                 + 284197814);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v68 + 8 * ((1361 * (a56 == 1568488028)) ^ v67)) - 4))(v81, 2038238733, v86, 2282360810, 3310348344, 1009756207, 3690914942, 2243590195, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47);
}

uint64_t sub_1001DEC9C@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,_QWORD *a57)
{
  unsigned int v57;
  int v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  unsigned int v62;
  int v63;
  unsigned int v64;

  v62 = v58 - (((v58 + 509779112) & 0x3580F33E ^ v58 & 4) << (a1 - 42)) - 740061214;
  *(_DWORD *)(*a57 + 4 * ((v62 ^ 0x3F7FD8FF686FA4D5) + ((2 * (v62 ^ 0x3580F33A)) & 0xBBDEAFDE)) - 0x5A1298FDFBD67623) = *(_DWORD *)(v60 + 4 * (97 * v58 + 56246260 - ((((97 * v58 + 56246260) * (unint64_t)v57) >> 32) >> 10) * v59));
  v63 = ((2 * v62) ^ 0x6B01E674) - ((2 * ((2 * v62) ^ 0x6B01E674)) & 0x48B1765C) + 609794862;
  v64 = (v62 ^ 0xCA7F04F7) + 102810 + (v63 & 0xFFFFEF9A ^ 0xDBA6C56C) + ((2 * v63) & 0xFFFCDC04 ^ 0x48B05404);
  return ((uint64_t (*)(void))(*(_QWORD *)(v61
                                        + 8
                                        * (a1 + 4 * (((2 * v64) & 0xF73FFFF8) + (v64 ^ 0x7B9FFFFC) - 2074083324 < 0x100)))
                            - 8))();
}

uint64_t sub_1001DEE1C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,int a32,int a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a66;
  int v66;
  int v67;
  unsigned int v68;
  unsigned int v69;
  int v70;
  int v71;
  unsigned int v72;

  v68 = byte_100224FF0[(((4424 * ((1805264682 - (((_BYTE)a3 + (_BYTE)v67 + 1) & 0x52)) ^ 0x6B9A2701)) & 0xCEDEB558)
                                       + ((2212 * ((1805264682 - (((_BYTE)a3 + (_BYTE)v67 + 1) & 0x52)) ^ 0x6B9A2701)) ^ 0x676F5AAC)
                                       - 1731345024)
                                      % 0x97F] ^ 0xFFFFFFF0;
  v69 = 23 * v68 - ((46 * (_BYTE)v68) & 0x3C) + 30;
  v70 = v69 ^ 0x5E ^ (((v69 >> 3) & 1 | 0x4A) - ((v69 >> 3) & 8 | 0x35) + 53);
  v71 = *(&a66
                         + (457 * (((2 * v70) & 0x1F6) + (v70 ^ 0xFC7FAEFB)) + 1074978093) % 0x708) ^ 0x35;
  v72 = (v71 - 1418784915 - ((2 * v71) & 0xDA)) ^ 0xAB6F0F6D | (((a33 + 969995687) & 0xFFFFFF00)
                                                              - ((2 * (a33 + 969995687)) & 0x891FE200)
                                                              + 1150284244) ^ 0x448FF1D4;
  *((_DWORD *)&STACK[0x8D0] + (580953523 * v66 - 517916883) % 0x55Cu) = v72 - 840245266 - ((2 * v72) & 0x9BD5BFDC);
  return ((uint64_t (*)(void))((char *)*(&off_100260750 + a3 + v67 + 1090) - 12))();
}

void sub_1001DF03C()
{
  JUMPOUT(0x1001DEEE0);
}

uint64_t sub_1001DF044(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _QWORD *a64;
  int v64;

  *(_DWORD *)(*a64 + 4 * a5 - 0x5C133501330DABFBLL) = *((_DWORD *)&STACK[0x8D0]
                                                      + ((int)a5 * (v64 - 997) + 1834047495) % 0x55Cu);
  return ((uint64_t (*)(void))(*(_QWORD *)(a8 + 8 * ((415 * (a5 == 733818776)) ^ v64)) - 12))();
}

uint64_t sub_1001DF0C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,int a33,int a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a66;
  int v66;
  unsigned int *v67;
  unsigned int v68;
  int v69;
  int v70;
  unint64_t v71;
  unsigned int v72;
  int v73;
  unsigned int v74;

  v68 = ((a34 & 0xFFFFFF00 ^ 0x3D616B00)
       + (a34 & 0xA834CF00 ^ 0x801484D1)
       - ((a34 & 0xFFFFFF00 ^ 0x3D616B00) & 0xA834CF00)) ^ 0x24744F11;
  v69 = *(&a66
                         + (((914 * ((1465642797 - ((((v66 - 24) ^ 0x8F) - 1095) & 0x427AEE00)) ^ 0x575BEF2D)) & 0xFBDB7E)
                          + ((457 * ((1465642797 - ((((v66 - 24) ^ 0x8F) - 1095) & 0x427AEE00)) ^ 0x575BEF2D)) ^ 0x4FFDEDBFu)
                          - 1341778303)
                         % 0x708);
  v70 = byte_100224FF0[(2212 * (((2 * (v69 ^ 8)) & 0xFFFFFF7F) + (v69 ^ 0x78CFFAF7)) + 451765668)
                                      % 0x97F];
  HIDWORD(v71) = v70 ^ 0x70;
  LODWORD(v71) = ~v70 << 24;
  v72 = ((v71 >> 31) - ((2 * (v71 >> 31)) & 0x4A) - 91);
  v73 = ((v71 >> 31) - ((2 * (v71 >> 31)) & 0x4A) - 91) ^ (v72 >> 6) ^ (v72 >> 4) ^ 0xAD;
  v74 = (v73 + 1844306738 - ((2 * v73) & 0x64)) ^ 0x6DEDE332 | (((2 * v68) & 0x31A10F80)
                                                                               - v68
                                                                               - 416319486) ^ 0xE7BA6CC2;
  *v67 = (v74 - ((2 * v74) & 0xCEEDDA32) - 411636455) ^ 0x2A9C3242;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))*(&off_100260750 + v66 - 24))(1844306738, 1465642797, 3471694386);
}

void sub_1001DF2F4()
{
  JUMPOUT(0x1001DF1BCLL);
}

uint64_t sub_1001DF2FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _QWORD *a64;
  int v64;
  uint64_t v65;
  uint64_t v66;

  *(_DWORD *)(*a64 + 4 * v65 - 0x5C13350086E20E27) = *((_DWORD *)&STACK[0x8D0] + (97 * (int)v65 - 1133385636) % 0x55Cu);
  return ((uint64_t (*)(void))(*(_QWORD *)(v66 + 8 * (((v65 == 11684643) * (v64 - 1086)) ^ v64)) - 4))();
}

uint64_t sub_1001DF380@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
  int v58;
  uint64_t v59;
  uint64_t (*v60)(void);

  *(&a58 + (457 * v58 + 710719628) % 0x708u) = *(&a58
                                               + (457
                                                * (((2
                                                   * (*(&a58 + (457 * v58 + 710719628) % 0x708u) ^ 0x35)) & 0x1CA)
                                                 + ((a1 + 1696423598) & 0x9AE2A16F ^ 0xCF7FBCAA ^ *(&a58 + (457 * v58 + 710719628) % 0x708u) ^ 0x35))
                                                - 1795111301)
                                               % 0x708);
  v60 = *(uint64_t (**)(void))(v59 + 8 * ((126 * (v58 == 1614932243)) ^ a1));
  *(&a58 + (457 * v58 + 710840276) % 0x708u) = *(&a58
                                               + (457
                                                * (((2
                                                   * (*(&a58 + (457 * v58 + 710840276) % 0x708u) ^ 0x35)) & 0xBA)
                                                 + (*(&a58 + (457 * v58 + 710840276) % 0x708u) ^ 0xFDBFEF68))
                                                + 73395771)
                                               % 0x708);
  return v60();
}

uint64_t sub_1001DF494()
{
  int v0;
  int v1;
  unsigned int v2;
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  *(_BYTE *)(v4 + (v0 * v1 - 599737790) % (((2 * v5) ^ 0xECu) + 1174)) = *(_BYTE *)(v4
                                                                                  + v0 * v1
                                                                                  - 599500150
                                                                                  - ((((v0 * v1 - 599500150) * (unint64_t)v2) >> 32) >> 10)
                                                                                  * v3);
  return (*(uint64_t (**)(void))(v6 + 8 * ((990 * (v0 == 1420437773)) ^ v5)))();
}

uint64_t sub_1001DF504(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,int a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a65;
  int v65;
  uint64_t v66;
  int v67;
  unsigned int v68;

  v67 = *(&a65 + (1210457682 * (((v65 + 334677385) & 0xEC0D3E75) - 1192) + 871766750) % 0x708) ^ 0x35;
  v68 = (v67 - 17367581 - ((2 * v67) & 0xFFFFFFC7)) ^ 0xFEF6FDE3 | (((1505110712 - a33) & 0xFFFFFF00)
                                                                  - ((2 * (1505110712 - a33)) & 0xD227F000)
                                                                  - 384567142) ^ 0xE913F89A;
  LODWORD(STACK[0x8D0]) = v68 - 840245266 - ((2 * v68) & 0x9BD5BFDC);
  return (*(uint64_t (**)(uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t *))(v66 + 8 * v65))(2443359173, 1800, &a65, 53, 2844689134, 3205573259, 1372, &STACK[0x8D0]);
}

void sub_1001DF63C()
{
  JUMPOUT(0x1001DF5BCLL);
}

uint64_t sub_1001DF644@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,_QWORD *a57)
{
  int v57;
  int v58;
  uint64_t v59;
  int v60;
  int v61;
  unint64_t v62;
  int v63;

  v60 = *((_DWORD *)&STACK[0x8D0] + (97 * v58 - 84510245) % 0x55Cu);
  HIDWORD(v62) = v58 + 89068783;
  LODWORD(v62) = v58 - 45148945;
  v61 = v62 >> 27;
  HIDWORD(v62) = v61;
  LODWORD(v62) = (v61 + a1 - ((v61 << ((-121 * (v57 ^ 0x72)) ^ 0x94)) & 0x67FE9940)) ^ a1;
  v63 = ((2 * (v62 >> 5)) & 0xF9DEDFDE) + ((v62 >> 5) ^ 0xFCEF6FEF);
  *(_DWORD *)(((4 * (v63 + 2080309207)) | ((unint64_t)((v63 + 2080309207) < 0x78EE6FC6) << 34))
            + *a57
            - 0x5C13350267D2D57FLL) = v60;
  return (*(uint64_t (**)(void))(v59 + 8 * ((7 * ((v63 + 51416798) > 0xFF)) ^ v57)))();
}

uint64_t sub_1001DF75C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,int a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a65;
  int v65;
  unsigned int v66;
  int v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  int v71;
  unsigned int v72;

  v71 = v69 - 15;
  v72 = ((LOBYTE(STACK[0x370]) ^ 0x35) - 2035899548 - ((2 * (LOBYTE(STACK[0x370]) ^ 0x35)) & 0xC8)) ^ 0x86A6A364 | ((a34 & 0xFFFFFF00 ^ 0x6FBA3900 | 0xC1A1F19) - (v71 ^ 0xF3E5E160 | a34 & 0xFFFFFF00 ^ 0x6FBA3900) - 203038490) ^ 0xBFDB2319;
  *(_DWORD *)(v68
            + 4
            * (1502118999 * v65
             + 323345161
             - ((((1502118999 * v65 + 323345161) * (unint64_t)v66) >> 32) >> 10)
             * v67)) = v72 - 840245266 - ((2 * v72) & 0x9BD5BFDC);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t))(*(_QWORD *)(v70 + 8 * (v71 ^ 0x13))
                                                                                               - 4))(323345161, 726648049, 2443359173, 1800, &a65, 53, 200);
}

void sub_1001DF880()
{
  JUMPOUT(0x1001DF800);
}

uint64_t sub_1001DF888(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _QWORD *a64;
  uint64_t v64;
  int v65;
  uint64_t v66;
  uint64_t v67;

  *(_DWORD *)(*a64 + 4 * v66 - 0x5C1335025AA54797) = *((_DWORD *)&STACK[0x8D0]
                                                       + ((((v65 - 390) | 0x285) - 548) * v66 + 1832304512)
                                                       % 0x55C);
  return ((uint64_t (*)(void))(*(_QWORD *)(v67 + 8 * ((2013 * (v66 + 1 == v64 + 256)) ^ v65)) - 4))();
}

uint64_t sub_1001DF90C@<X0>(unsigned int a1@<W8>, uint64_t a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,_QWORD *a57)
{
  int v57;
  uint64_t v58;
  int v59;
  int v60;
  unsigned int v61;

  *a3 = 2047018587;
  v60 = byte_100224FF0[(((234 * (215 * (v59 ^ 0x286) + 1567)) ^ 0xFF734FDB) + 13059981) % 0x97F] ^ 0xFC;
  v61 = 97 * (((2 * v60) & 0x1F8) + (v60 ^ 0x7F67F1FC)) - 1180843728;
  *(_DWORD *)(v58 + 4 * (v61 - (((v61 * (unint64_t)a1) >> 32) >> 10) * v57)) = *(_DWORD *)(*a57 - 0x5C13350084191667);
  return ((uint64_t (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)*(&off_100260750
                                                                                                 + ((62 * ((v59 ^ 0x4B00AE57u) + 2021437166 > 0xC37D5AC1)) ^ v59 ^ 0x4D1))
                                                                                       - 4))(0xA3ECCAFE3A71ABD9, 557509, 4294438887, 1348292464, 234);
}

void sub_1001DFB00()
{
  JUMPOUT(0x1001DFA04);
}

uint64_t sub_1001DFB0C@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W2>, unsigned int a4@<W3>, int a5@<W4>, unsigned int a6@<W8>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,unsigned int a60,int a61,int a62,_QWORD *a63)
{
  int v63;
  uint64_t v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  unsigned int v71;
  _BOOL4 v73;

  v70 = (v66 + (a62 + 18) - 2 * ((a62 - 673144558) & a5 ^ (a62 - 673144702) & 8)) ^ v66;
  v71 = ((v70 * v67) & v68) + ((v70 * v69) ^ a3) + a2;
  *(_DWORD *)(((4 * (a62 - 673144702)) | ((unint64_t)(a62 - 673144702 < a4) << 34)) + *a63 + a1) = *(_DWORD *)(v64 + 4 * (v71 - (((v71 * (unint64_t)a6) >> 32) >> 10) * v63));
  v73 = a60 <= 0xB0FD47F9 || a62 + 947952140 <= a60;
  return ((uint64_t (*)(void))((char *)*(&off_100260750 + (v73 | (4 * v73) | (v65 + 341))) - 8))();
}

void sub_1001DFBC4()
{
  JUMPOUT(0x1001DFB2CLL);
}

uint64_t sub_1001DFBD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,int a63)
{
  int v63;

  return ((uint64_t (*)(void))((char *)*(&off_100260750 + (v63 ^ (1129 * ((a63 - 1219898733) < 0x2FC69581))))
                            - 12))();
}

void sub_1001DFC14()
{
  JUMPOUT(0x1001DF9C4);
}

void sub_1001DFC38()
{
  int v0;
  uint64_t v1;
  void *v2;

  free(v2);
  *(_DWORD *)(v1 + 8) = v0;
}

uint64_t sub_1001DFC88(uint64_t result)
{
  uint64_t v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  int v5;
  int v6;
  int v7;
  BOOL v8;
  _BOOL4 v9;
  int v10;

  v1 = 1856021207 * ((((2 * result) | 0x4840409B3328D17ELL) - result + 0x5BDFDFB2666B9741) ^ 0x4934B7D6D7FDBE41);
  v2 = *(_DWORD *)(result + 12) - v1;
  v3 = *(_QWORD *)(result + 24) ^ v1;
  v4 = *(_QWORD *)(result + 16) + v1;
  v5 = *(_DWORD *)(result + 36) ^ v1;
  v6 = *(_DWORD *)(result + 4) ^ v1;
  v7 = *(_DWORD *)(result + 8) ^ v1;
  v8 = v4 == v3;
  v9 = v4 > v3;
  v10 = v8;
  if ((v5 & 1) == 0)
    v9 = v10;
  if (!v9)
    v2 = v6;
  *(_DWORD *)result = v7 ^ v2;
  return result;
}

uint64_t TcswZQtsc8hw(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD v4[10];
  unsigned int v5;
  _QWORD *v6;
  unsigned int v7;
  uint64_t vars0;

  v4[0] = &loc_10018E228;
  v4[1] = a1;
  v4[2] = a2;
  v4[3] = a3;
  v5 = (230600693 * ((&vars0 + 1575738355 - 2 * ((&vars0 - 32) & 0x5DEBDC13)) ^ 0x8FD75A38)) ^ 0x54F58F50;
  v6 = v4;
  sub_10018DFF4((uint64_t)&v5);
  return v7;
}

void sub_1001DFDD8(uint64_t a1)
{
  __asm { BR              X13 }
}

void sub_1001DFE94(uint64_t a1@<X8>)
{
  int v1;
  uint64_t v2;
  int v3;
  int v4;
  _DWORD *v5;
  unsigned int v6;
  _BYTE v7[32];
  uint64_t v8;
  __int128 v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;

  v6 = ((v7 & 0xBE9DF940 | ~(v7 | 0xBE9DF940)) ^ 0x52F8FAFC) * v1;
  memset(v7, 0, sizeof(v7));
  v8 = v2;
  v9 = 0u;
  v11 = v6 ^ 0x1D49DC7F;
  v12 = (v3 + v4) ^ v6;
  v13 = a1;
  sub_1000B1BFC((uint64_t)v7);
  *v5 = v10;
}

void sub_1001DFF94(_QWORD *a1)
{
  BOOL v1;
  int v3;

  if (a1[4])
    v1 = a1[1] == 0;
  else
    v1 = 1;
  v3 = !v1 && a1[2] != 0;
  __asm { BR              X12 }
}

void sub_1001E003C(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  unsigned int v5;
  int v6;
  _QWORD v7[4];
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  int v13;
  uint64_t v14;

  v14 = 0x483CF90335B0B89FLL;
  v7[0] = 0;
  v7[1] = &v6;
  v9 = v2;
  v10 = 0;
  v5 = 562267567
     * (((v7 ^ 0x5A23AF60 | 0xAF18922F)
       - (v7 ^ 0x5A23AF60)
       + ((v7 ^ 0x5A23AF60) & 0x50E76DD0)) ^ 0xE6A1C10C);
  v7[3] = 0;
  v8 = v1;
  v12 = v5 ^ 0xCC933444;
  v13 = (v3 + 765) ^ v5;
  v7[2] = a1;
  sub_1000B1BFC((uint64_t)v7);
  *(_DWORD *)(v4 + 4) = v11;
}

void sub_1001E0108(_DWORD *a1)
{
  unsigned int v1;
  int v2;
  unsigned int v3;
  char *v4;

  v1 = 230600693 * (a1 ^ 0xD23C862B);
  v2 = *a1 ^ v1;
  v3 = ((a1[7] + v1) & 0xFFFFFFF0) - 1926684720;
  v4 = (char *)*(&off_100260750
               + ((120
                 * (malloc_type_malloc(((2 * v3) & 0x9D7F55E0) + (v3 ^ 0xCEBFAAF6) + 826299674, 0x6F4887E1uLL) != 0)) ^ v2))
     - (((v2 - 100) | 0x22u) ^ 0x27ELL);
  __asm { BR              X8 }
}

uint64_t sub_1001E01E8()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8 * ((250 * ((((23 * (v0 ^ 0x26E)) ^ (v1 == 1926684720)) & 1) == 0)) ^ v0))
                            - 12))();
}

uint64_t sub_1001E0264@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  unsigned int v13;
  int v14;
  _BOOL4 v15;

  v12 = v7 < v6;
  *(_BYTE *)(v10 + (v1 + a1)) = *(_BYTE *)(v2 + ((v1 + a1) & 0xFLL)) ^ *(_BYTE *)(*(_QWORD *)(v9 + 16)
                                                                                              + (v1 + a1)) ^ *(_BYTE *)(v3 + ((v1 + a1) & 0xFLL)) ^ (-39 * ((v1 + a1) & 0xF)) ^ *(_BYTE *)(((v1 + a1) & 0xFLL) + v4 + 2);
  v13 = v1 + 1584200507 + ((4 * v5) ^ 0x824);
  v14 = v12 ^ (v13 < v6);
  v15 = v13 < v7;
  if (!v14)
    v12 = v15;
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((v12 * v8) ^ v5)) - 12))();
}

uint64_t sub_1001E02F4@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  _BOOL4 v10;

  *(_BYTE *)(v7 + (v1 + a1)) = *(_BYTE *)(v2 + ((v1 + a1) & 0xFLL)) ^ *(_BYTE *)(v3 + ((v1 + a1) & 0xFLL)) ^ *(_BYTE *)(((v1 + a1) & 0xFLL) + v4 + 2) ^ (-39 * ((v1 + a1) & 0xF)) ^ 0x80;
  v9 = v6 - 1823612095 + (v5 ^ 0x350);
  if ((v1 + 1156333955) < 0x620D90C3 != v9 < 0x620D90C3)
    v10 = v9 < 0x620D90C3;
  else
    v10 = v1 + 1156333955 < v9;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((61 * v10) ^ v5)) - 4))();
}

uint64_t sub_1001E0390@<X0>(unsigned int a1@<W0>, int a2@<W1>, int a3@<W8>)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  int v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;

  v13 = v3 + 1;
  v14 = (v13 + a3);
  v15 = (((v7 + 76) | 0x84) - 653) & v14;
  *(_BYTE *)(v11 + v14) = *(_BYTE *)(v5 + v15) ^ *(_BYTE *)(v4 + v15) ^ *(_BYTE *)(v15 + v6 + 2) ^ (v15 * v10);
  v16 = v13 + v9 < a1;
  if (a1 < v8 != v13 + v9 < v8)
    v16 = a1 < v8;
  return ((uint64_t (*)(void))(*(_QWORD *)(v12 + 8 * ((v16 * a2) ^ v7)) - 4))();
}

uint64_t sub_1001E040C()
{
  int v0;
  void *v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((54 * (((((v0 ^ 0x36) - 334) ^ (v1 == &unk_100217ED5)) & 1) == 0)) ^ v0))
                            - 8))();
}

void sub_1001E0468(int a1@<W8>)
{
  int v1;
  int v2;
  int v3;
  int v5;
  _BOOL4 v7;

  v5 = ((v2 + 11) & 0xF) - (((v2 + 11) << ((((v1 - 28) | 0x30) ^ 0x42) + v1 + 115)) & 4);
  v7 = v3 != a1 && v5 == 0;
  __asm { BR              X8 }
}

uint64_t sub_1001E0508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  int v31;
  int v32;
  uint64_t v33;
  unsigned __int8 *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  unsigned int v43;
  unint64_t v44;
  int v45;
  unsigned int v46;
  int v47;
  int v48;
  int v49;
  unsigned int v50;
  int v51;
  int v52;
  uint64_t v53;
  int v54;
  unsigned int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  unsigned int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  unsigned int v68;
  unsigned int v69;
  unsigned int v70;
  unsigned int v71;
  int v72;
  unsigned int v73;
  unsigned int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  unsigned int v79;
  int v80;
  _BYTE *v81;
  int v82;
  int v83;
  unsigned int v84;
  unsigned int v85;
  int v86;
  int v87;
  unsigned int v88;
  int v89;
  int v90;
  unsigned int v91;
  int v92;
  int v93;
  unsigned int v94;
  unsigned int v95;
  unsigned int v96;
  unsigned int v97;
  int v98;
  unsigned int v99;
  unsigned int v100;
  int v101;
  unsigned int v102;
  int v103;
  unsigned int v104;
  unsigned int v105;
  unsigned int v106;
  _BOOL4 v107;
  unsigned int v108;
  uint64_t v109;
  char *v110;

  *(_QWORD *)(v35 - 200) = v33;
  v36 = (v31 - 17);
  v37 = v34[12];
  v38 = byte_10021B0D0[v34[8] ^ 0x17] + 2 * ((v34[8] ^ 0xFFFFFFD6) + 1) + (((v34[8] ^ 0xFFFFFFD6) + 1) ^ 0x7F);
  v39 = (v38 - ((2 * v38 + 94) & (v36 ^ 5)) + 92) ^ 0x29;
  v40 = (((v39 - ((2 * v39) & 0x6E)) << 24) + 922746880) ^ 0x37000000;
  v41 = byte_10021C310[v34[9] ^ 0xECLL];
  v42 = byte_100229330[v34[11] ^ 0xFALL] + 49;
  v43 = (v40 - ((2 * v40) & 0x77777777) - 1156752054) ^ 0xBB0D5D4A | ((~(2 * v42) | 0xFFFFFE1D)
                                                                    + v42
                                                                    + 389486834) ^ 0x173718F1;
  HIDWORD(v44) = ~v41;
  LODWORD(v44) = (v41 ^ 0xFFFFFF9F) << 24;
  v45 = (((2 * ((v37 ^ 0x31) + 1)) & 0x84)
       + byte_10021B0D0[v37 ^ 0xF0]
       + (((v37 ^ 0x31) + 1) ^ 0xFFFFFFC2)
       - 2 * ((byte_10021B0D0[v37 ^ 0xF0] + (((v37 ^ 0x31) + 1) ^ 0xFFFFFFC2)) & 3)
       - 17) ^ 0x73;
  v46 = (((v45 - ((2 * v45) & 0xFFFFFFBF)) << 24) + 1593835520) ^ 0x5F000000;
  v47 = (v46 - ((2 * v46) & 0x78000000) + 1008995490) ^ 0x3C240CA2 | ((byte_100229330[v34[15] ^ 0xE1]
                                                                                      + 49)
                                                                    - ((2 * (byte_100229330[v34[15] ^ 0xE1] + 49)) & 0x19C)
                                                                    + 704363214) ^ 0x29FBBACE;
  LODWORD(v37) = ((((((v44 >> 27) - ((2 * (v44 >> 27)) & 0x88) - 60) ^ 0x5E)
                  - ((2 * (((v44 >> 27) - ((2 * (v44 >> 27)) & 0x88) - 60) ^ 0x5E)) & 0x1D4)) << 16)
                + 1961492480) ^ 0x74EA0000;
  v48 = (v37 - ((2 * v37) & 0x35340000) - 1701176168) ^ 0x9A9A1C98 | (v43 - ((2 * v43) & 0x43E6236E) + 569577911) ^ 0x21F311B7;
  v49 = v48 - ((2 * v48) & 0x47929CD2) + 600395369;
  v50 = byte_10021B0D0[*v34 ^ 0x70] + (*v34 ^ 0xFFFFFFB1) - 82;
  v51 = (2 * (v50 & 0x3F) + (v50 ^ 0x3F) - ((2 * (2 * (v50 & 0x3F) + (v50 ^ 0x3F)) - 124) & 0x9E) - 111) ^ 0x12;
  v52 = (((v51 - ((2 * v51) & 0x20)) << 24) + 0x10000000) ^ 0x10000000;
  v53 = v34[4];
  v54 = byte_100229330[v34[3] ^ 0xABLL] + 49;
  v55 = (v52 - ((2 * v52) & 0x2E000000) - 1758781145) ^ 0x972B2127 | ((~(2 * v54) | 0xFFFFFE47)
                                                                    + v54
                                                                    - 472349475) ^ 0xE3D884DC;
  v56 = byte_10021C310[v34[5] ^ 0x86];
  LODWORD(v37) = v53 ^ ((v53 ^ 0x2B) - ((2 * (v53 ^ 0x2B) + 2) & 0x14) + 11) ^ ((v53 ^ 0x3B)
                                                                              + (~(2 * (v53 ^ 0x3B) + 2) | 0xFFFFFFF9)
                                                                              - 107);
  v57 = byte_10021B0D0[v53 ^ 0xFA] + (((v37 ^ 0x5D) + 16) ^ 0x42) - ((2 * ((v37 ^ 0x5D) + 16)) & 0x7A) + 1;
  HIDWORD(v44) = ~v56;
  LODWORD(v44) = (v56 ^ 0xFFFFFF9F) << 24;
  LODWORD(v37) = ((((((v44 >> 27) - ((2 * (v44 >> 27)) & 0x72) + 57) ^ 0xA8)
                  - ((2 * (((v44 >> 27) - ((2 * (v44 >> 27)) & 0x72) + 57) ^ 0xA8)) & 0x158)) << 16)
                + 430702592) ^ 0x19AC0000;
  v58 = (v57 - ((2 * v57 - 42) & 0xE6) - 34) ^ 0xE8;
  v59 = (((v58 - ((2 * v58) & 0x1A)) << 24) + 218103808) ^ 0xD000000;
  v60 = (v59 - ((2 * v59) & 0xA000000) + 91689685) ^ 0x57712D5 | (v37 - ((2 * v37) & 0x7EDC0000) + 2137916019) ^ 0x7F6E0273;
  v61 = v60 - ((2 * v60) & 0xEF05AF2C) - 142420074;
  v62 = byte_100224CF0[v34[10] ^ 0x53] ^ 0x4E;
  v63 = (((v62 - ((2 * v62) & 0xE0)) << 8) + 726691840) ^ 0x2B507000;
  v64 = v49 ^ 0x23C94E69 | (v63 - ((2 * v63) & 0x60D4800) + 50767101) ^ 0x306A4FD;
  v65 = byte_100229330[v34[7] ^ 0x62];
  v66 = byte_10021C310[v34[13] ^ 0x77];
  v67 = (v65 - ((2 * (_BYTE)v65 + 34) & 0x30) - 55) ^ 0x62;
  v68 = v61 ^ 0xF782D796 | (v67 - ((2 * v67) & 0xDA) + 577796205) ^ 0x2270786D;
  HIDWORD(v44) = ~v66;
  LODWORD(v44) = (v66 ^ 0xFFFFFF9F) << 24;
  v69 = ((((((v44 >> 27) - ((2 * (v44 >> 27)) & 0xD8) - 20) ^ 0x4B)
         - ((2 * (((v44 >> 27) - ((2 * (v44 >> 27)) & 0xD8) - 20) ^ 0x4B)) & 0xD4)) << 16)
       + 409600000) ^ 0x186A0000;
  v70 = (v69 - ((2 * v69) & 0x1AB20000) + 223961334) ^ 0xD5960F6 | (v47 - ((2 * v47) & 0x93D280F4) - 907460486) ^ 0xC9E9407A;
  v71 = v70 - ((2 * v70) & 0xF741FEF4);
  v72 = byte_100224CF0[v34[6] ^ 0xCDLL] ^ 0x93;
  v73 = (((v72 - ((2 * v72) & 0x1A8)) << 8) - 688925696) ^ 0xD6EFD400;
  v74 = (v68 - ((2 * v68) & 0x148E6E50) - 1975044312) ^ 0x8A473728 | (v73 - ((2 * v73) & 0x17FDAC00) - 872491500) ^ 0xCBFED614;
  v75 = byte_100224CF0[v34[2] ^ 0xD4] ^ 0x47;
  v76 = (((v75 - ((2 * v75) & 0x11C)) << 8) + 1891995136) ^ 0x70C58E00;
  v77 = v34[1];
  LODWORD(v53) = -1468674499
               - ((v77 ^ 0x6DBAFAA2)
                + 2 * (v77 ^ 0x5D))
               - ((1534457496 - 2 * ((v77 ^ 0x6DBAFAA2) + 2 * (v77 ^ 0x5D))) & 0x7575A5E2);
  v78 = (v77 ^ 0x10) - ((2 * (v77 ^ 0x10)) & 0x74) - 2072438726;
  LODWORD(v53) = byte_10021C310[(v78 ^ v53 ^ 0xA18C5BE7 ^ ((v78 ^ 0x7B86E7C5)
                                                                       - ((2 * (v78 ^ 0x7B86E7C5) + 2) & 0x3E9F2258)
                                                                       + 525308205))
                              + 77];
  HIDWORD(v44) = ~(_DWORD)v53;
  LODWORD(v44) = (v53 ^ 0xFFFFFF9F) << 24;
  *(_QWORD *)(v35 - 208) = v34;
  LODWORD(v37) = (v44 >> 27) - ((2 * (v44 >> 27)) & 0x1A) - 115;
  v79 = (v76 - ((2 * v76) & 0x628CC200) + 826696125) ^ 0x314661BD | (v55 - ((2 * v55) & 0x36C949E2) - 1687902991) ^ 0x9B64A4F1;
  LODWORD(v37) = ((((v37 ^ 0x59) - ((2 * (_DWORD)v37) & 0x4C)) << 16) - 853147648) ^ 0xCD260000;
  v80 = (v37 - ((2 * v37) & 0x1AE60000) + 1299415180) ^ 0x4D73808C | (v79 - ((2 * v79) & 0x4FE5DC70) - 1477251528) ^ 0xA7F2EE38;
  LODWORD(v37) = byte_100224CF0[v34[14] ^ 0x4ELL] ^ 0xF6;
  LODWORD(v37) = ((((_DWORD)v37 - ((2 * (_DWORD)v37) & 0x1C8)) << 8) + 1425597440) ^ 0x54F8E400;
  HIDWORD(a24) = (v37 - ((2 * v37) & 0x58098200) - 1408974354) ^ 0xAC04C1EE;
  LODWORD(v37) = ((v71 - 73334918) ^ 0xFBA0FF7A | HIDWORD(a24))
               - ((2 * ((v71 - 73334918) ^ 0xFBA0FF7A | HIDWORD(a24))) & 0x84020B12)
               + 1107363209;
  LODWORD(v53) = ((2 * v37) ^ 0x9F25AE8A) - ((2 * ((2 * v37) ^ 0x9F25AE8A)) & 0x123D5378) + 958310844;
  *(_DWORD *)(v35 - 216) = (2 * v74) & 0xD03C0FA2;
  *(_DWORD *)(v35 - 224) = v74 + 1746798545;
  *(_DWORD *)(v35 - 232) = v80 - 2128846527;
  *(_DWORD *)(v35 - 228) = (2 * v80) & 0x238C282;
  *(_DWORD *)(v35 - 240) = (2
                          * ((((v37 ^ 0x4F92D745) + 227791549) ^ 0xBFAF4FEF)
                           + ((2 * ((v37 ^ 0x4F92D745) + 227791549)) & 0x7F5E9FDE)
                           + (v53 & 0x1B27A57A ^ 0x1906C25B)
                           + ((2 * v53) & 0x364F0830 ^ 0xCDF2FFCF))
                          + 10525022) & 0x958B50C;
  LODWORD(a22) = v32;
  v81 = *(_BYTE **)(v35 - 200);
  v82 = *v81;
  *v81 = v82 ^ 0x55;
  v83 = 2014341611 * ((v82 ^ 0x6FFBFF4E) + ((2 * v82) & 0x9C)) + 501705505;
  v84 = (v83 ^ 0xBD9D4F59) + 1113764007 + ((2 * v83) & 0x7B3A9EB2);
  v85 = v84 % 0x101 + 282271771 + (~(2 * (v84 % 0x101)) | 0xFFFFFFCB);
  v86 = (v85 & 0x28 ^ 9) - (v85 & 0x46) + 277211221;
  v87 = (((2 * (v85 & 0x191 ^ 0x110)) | 0x48497066) - (v85 & 0x191 ^ 0x110) + 1541097421) ^ 0x2D847813;
  v88 = ((v84 & 0x9C9C2391) - ((2 * v84) & 0x10084022) + 1761983513) ^ 0xBA280EA7 ^ (((2 * v87) & 0x4AE518C2)
                                                                                   - v87
                                                                                   + 1519219614) | ((v84 & 0x6363DC6E)
                                                                                                  - ((2 * v84) & 0xC686988C)
                                                                                                  + 2002480214) ^ 0x5DE3D5BF ^ ((v86 & 0x80AAF8 ^ 0x281810B9) + (v86 ^ 0x12A1AB44) - ((v86 ^ 0x12A1AB44) & 0x44AF8));
  v89 = ((v88 - ((2 * v88) & 0x5C380026) - 1373896685) ^ 0x5EFF4A7A) - 828153160;
  v90 = (v89 ^ 0x180FFF76) + 2078559509 + ((2 * v89) & 0x301FFEEC) - 403701622;
  v91 = v90 - ((2 * v90) & 0x9D1743AA) - 829709867;
  v92 = (v91 ^ 0xA2A5FF3) + 1970758880 - ((2 * ((v91 ^ 0xA2A5FF3) - 253539735)) & 0x92834EE);
  v93 = (v91 ^ 0xA2A5FF3) + 909559972 + (~(2 * ((v91 ^ 0xA2A5FF3) - 828153160)) | 0x30D93427);
  v94 = (((v91 ^ 0xA2A5FF3) + 520106715 - ((2 * (v91 ^ 0xA2A5FF3)) & 0x3E0065B6)) ^ 0x1F0032DB) >> 31;
  v95 = ((2 * v94) & 0xF7AFFF2A) + (v94 ^ 0x7BD7FF95);
  v96 = (((2 * (v95 + 107)) & 0x1F4) + ((v95 + 107) ^ 0x1CFFFFFA) - 486539258) % 0xBD;
  v97 = v95 + (v96 ^ 0xFFFFFF21) - ((2 * v96) & 0xBC) + 74;
  v98 = ((2 * v96) & 0xFE) + (v96 ^ 0x53FFCD7F) + ((2 * v97) & 0x1F0);
  v99 = v98
      + (v97 ^ 0xFD7FDDF8)
      - ((2 * (v98 + (v97 ^ 0xFD7FDDF8)) + 1560324370) & 0x92952C54)
      + 2009787059;
  v100 = v91 ^ 0x8F34A361;
  v101 = v99 ^ (((2 * v91) ^ 0x1454BFE6) - 2 * (((2 * v91) ^ 0x1454BFE6) & 0x69E6499C ^ (2 * v91) & 0x18) - 370783867);
  v102 = v92 ^ 0x84941A77;
  v103 = 2 * (((v101 ^ 0x20ACDFAF) & v102) - ((2 * ((v101 ^ 0x20ACDFAF) & v102)) & 0x1D95C880)) - 1651128192;
  v104 = (v92 ^ 0xA438C5D8 ^ v101) + (v103 ^ 0x63706F28) + 18503768 + ((2 * v103) & 0xFDCB4F50 ^ 0x390B0100);
  v105 = v100 ^ (v93 + 1) ^ 0x93AF4209 ^ (v104 - ((2 * v104) & 0x158D2CC4) + 180786786);
  v106 = v105 - ((2 * v105 + 2084372786) & 0xD319264A) + 665523134;
  v107 = (v32 + 1692156007) > 0x4C69B2FD;
  if ((v32 + 1692156007) < 0x4C69B2FC)
    v107 = 1;
  v108 = (((v106 ^ 0x698C9325) + v102) ^ 0xF7FAE7F9)
       + ((2 * v106) ^ 0x7E3B36FB)
       + ((4 * v106) & 0xA5BBDE9C ^ 0x5BCDB36B)
       + ((2 * ((v106 ^ 0x698C9325) + v102)) & 0xEFF5CFF2)
       + 1;
  v109 = v100 ^ 0x63A6CCD6 ^ v106;
  v110 = (char *)*(&off_100260750 + (int)((47 * v107) ^ v36)) - 12;
  HIDWORD(a27) = (v64 - ((2 * v64) & 0xC5757562) - 491078991) ^ 0xF9769E05;
  return ((uint64_t (*)(uint64_t, uint64_t, char *, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v110)(902172332, v36, v110, v108 - ((2 * v108 + 902172332) & 0x59DDBC94) + 131196320, (v36 - 675), v109, 876751309, 47, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31);
}

void sub_1001E1544()
{
  JUMPOUT(0x1001E0F44);
}

uint64_t sub_1001E1550()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (v1 ^ (28 * ((v2 ^ 0x3F6FDFD6) + (v0 & 0x7EDFBFA0) == 1064296406))))
                            - 8))();
}

uint64_t sub_1001E1558(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  int v5;
  uint64_t v6;
  unsigned int v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  int v13;

  *(_DWORD *)(v6 - 228) = *(_DWORD *)(v6 - 232) - *(_DWORD *)(v6 - 228);
  v7 = **(unsigned __int8 **)(v6 - 200) ^ 0xB728133D;
  v8 = v7 & 0x65 ^ 0x25;
  v9 = ((v7 & 0xFFFFFF9A ^ 9) + 63) ^ 0x50 | v8;
  v10 = (v5 ^ 0x698C9325) + 1770820389 - ((2 * (v5 ^ 0x698C9325) + 2) & 0xD319264A) + 1;
  v11 = (v9 - 2 * (v9 & 0x17 ^ v8 & 1) - 106) ^ 0xC3;
  v12 = a4 ^ 0xE06DE71C ^ (v11 - ((2 * v11) & 0xAC) + 1283668310);
  v13 = ((4 * ((v10 >> 1) & 1)) | 0x309E6F21) - (v10 & 3);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))((char *)*(&off_100260750
                                                                              + ((73
                                                                                * ((v13 & 0x1C ^ 0xC340800C)
                                                                                 + (v13 ^ 0x3C2D1910)
                                                                                 - ((v13 ^ 0x3C2D1910) & 0x800621C) != -940338132)) | (a5 + 104)))
                                                                    - 4))(23, 195, 172, v12 - ((2 * v12 + 332235984) & 0x59DDBC94) - 153771854);
}

void sub_1001E16EC()
{
  JUMPOUT(0x1001E15ECLL);
}

uint64_t sub_1001E16FC(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  int v27;
  unsigned int v28;
  unint64_t v29;
  int v30;
  int v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  char *v35;

  v21 = (**(unsigned __int8 **)(v20 - 208) ^ 0x7FFFDDFB)
      + ((**(unsigned __int8 **)(v20 - 208) << ((a5 - 96) & 0xF3 ^ 0x51)) & 0x1F6)
      + 2026900469;
  v22 = v19 ^ 0xA007B287 ^ (1577634329 * v21 - ((-732535794 - 1139698638 * v21) & 0x93164344) - 1279896663);
  v23 = v22 + ((v22 % 0x101) ^ 0xEF17FABF) + ((2 * (v22 % 0x101)) & 0x17E) + 283641153;
  v24 = (a4 ^ 0xD4406501 ^ (v23 - ((2 * v23) & 0xF15D7696) + 2024717131)) + (a6 ^ 0xF4D0EE74);
  v25 = (v24 ^ 0x76FF23F1) + v18 + ((2 * v24) & 0xEDFE47E2);
  v26 = v25 - ((2 * v25 + 418544366) & 0xB1DDBC68) - 446162005;
  v27 = (v26 ^ 0x53EF10B8) + v18 - ((2 * ((v26 ^ 0x53EF10B8) + v18) + 116441810) & 0x214376DA);
  v28 = (v26 ^ 0xAC10EF47)
      + (a6 ^ 0xF4D0EE74)
      - 1849816599
      - ((2 * ((v26 ^ 0xAC10EF47) + (a6 ^ 0xF4D0EE74))) & 0x237C13D2);
  HIDWORD(v29) = v26 ^ 0xC10EF47;
  LODWORD(v29) = v26 ^ 0xA0000000;
  v30 = a4 ^ 0xFE310D ^ v26;
  v31 = ((v29 >> 29) ^ 0xFB372BF7)
      + ((2 * (v29 >> 29)) & 0xF66E57EE)
      + (((v28 ^ 0x91BE09E9) + v30) ^ 0xA0A00880)
      - ((2 * ((v28 ^ 0x91BE09E9) + v30)) & 0xBEBFEEFE)
      + 1;
  v32 = v31 - ((2 * v31 - 934177008) & 0xAC36DDCC) - 1169933714;
  v33 = v32 ^ (v27 - 1810228010);
  v34 = v33 ^ 0xB73167FB ^ v28;
  v35 = (char *)*(&off_100260750 + (int)a5 + 92) - 4;
  return ((uint64_t (*)(char *, _UNKNOWN **, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v35)(v35, &off_100260750, 4191141874, (v33 ^ 0xDEBDF4DE) + v30 - 1393631670 - ((2 * ((v33 ^ 0xDEBDF4DE) + v30)) & 0x59DDBC94), a5, v34, v32, 3562431502, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18);
}

void sub_1001E1A28()
{
  JUMPOUT(0x1001E17C8);
}

uint64_t sub_1001E1A38@<X0>(int a1@<W8>)
{
  char v1;

  return ((uint64_t (*)(void))((char *)*(&off_100260750 + (a1 | (14 * (v1 & 1)))) - 8))();
}

uint64_t sub_1001E1AD4@<X0>(int a1@<W8>)
{
  char v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((14 * ((v1 + 1) & 1)) | a1)) - 8))();
}

uint64_t sub_1001E1B38(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  int v30;
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unint64_t v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  int v46;
  unsigned int v47;
  unsigned int v48;
  int v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  int v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  unsigned int v57;
  unsigned int v58;
  unsigned int v59;
  int v60;
  int v61;
  int v62;
  unsigned int v63;
  unsigned int v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  int v68;
  unsigned int v69;
  int v70;
  unsigned int v71;
  unsigned int v72;
  int v73;
  unsigned int v74;
  int v75;
  unsigned int v76;
  unsigned int v77;
  unsigned int v78;
  int v79;
  unsigned int v80;
  unsigned int v81;
  unsigned int v82;
  unsigned int v83;
  int v84;
  int v85;
  unsigned int v86;
  unsigned int v87;
  unsigned int v88;
  unsigned int v89;
  unsigned int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  unsigned int v97;
  unsigned int v98;
  unsigned int v99;
  int v100;
  unsigned int v101;
  unsigned int v102;
  unsigned int v103;
  int v104;
  int v105;
  int v106;
  unsigned int v107;
  unsigned int v108;
  int v109;
  unsigned int v110;
  unsigned int v111;
  unsigned int v112;
  unsigned int v113;
  int v114;
  unsigned int v115;
  unsigned int v116;
  unsigned int v117;
  unsigned int v118;
  unsigned int v119;
  unsigned int v120;
  unsigned int v121;
  unsigned int v122;
  int v123;
  unsigned int v124;
  int v125;
  int v126;
  unsigned int v127;
  unsigned int v128;
  unsigned int v129;
  unsigned int v130;
  unsigned int v131;
  unsigned int v132;
  unsigned int v133;
  unsigned int v134;
  unsigned int v135;
  unsigned int v136;
  unsigned int v137;
  int v138;
  unsigned int v139;
  unsigned int v140;
  unsigned int v141;
  int v142;
  unsigned int v143;
  int v144;
  unsigned int v145;
  unsigned int v146;
  unsigned int v147;
  int v148;
  unsigned int v149;
  int v150;
  unsigned int v151;
  int v152;
  unsigned int v153;
  unsigned int v154;
  unsigned int v155;
  unsigned int v156;
  int v157;
  unsigned int v158;
  unsigned int v159;
  unsigned int v160;
  unsigned int v161;
  int v162;
  unsigned int v163;
  unsigned int v164;
  int v165;
  unsigned int v166;
  int v167;
  unsigned int v168;
  int v169;
  unsigned int v170;
  unsigned int v171;
  unsigned int v172;
  int v173;
  unsigned int v174;
  unsigned int v175;
  unsigned int v176;
  unsigned int v177;
  unsigned int v178;
  unsigned int v179;
  unsigned int v180;
  unsigned int v181;
  unsigned int v182;
  unsigned int v183;
  int v184;
  unsigned int v185;
  unsigned int v186;
  unsigned int v187;
  void *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v194;
  unsigned int v195;

  v35 = (v32 - 402655048) & 0xFFFC755B;
  *(_DWORD *)(v34 - 232) = v35;
  v36 = (((v32 - 309) | 0x4C) ^ 0xCF1EB045)
      + 1016084021 * (a6 ^ 0xF8329ACC)
      - (((v35 ^ 0x9EDC1C33) * (a6 ^ 0xF8329ACC)) & 0x9E3D6232);
  v37 = (((-933363712 * (a4 ^ 0xACEEDE4A) - ((-1866727424 * (a4 ^ 0xACEEDE4A)) & 0xE4200000) - 233828719) ^ 0xF2100E91) & 0xFFFE0000 | ((1146020911 * (a4 ^ 0xACEEDE4A) - ((144558174 * (a4 ^ 0xACEEDE4A)) & 0x50DD21C8) + 678334692) >> 15)) ^ 0x50DD;
  v38 = v37 - ((2 * v37) & 0xF698E12A) + 2068607125;
  HIDWORD(v39) = v30 ^ 0x125;
  LODWORD(v39) = (-1610171903 * (v30 ^ 0x698C9325) + 1834706944 - ((1074623490 * (v30 ^ 0x698C9325)) & 0xDAB6D208) + 260) ^ 0x6D5B6800;
  v40 = ((-212945416 * v31 - ((1721592816 * v31 + 620180848) & 0x5D720E40) - 2127257124) ^ 0xAEB90724) & 0xFFFFFFF8 | ((-26618177 * v31 - ((-53236354 * v31 - 1264654674) & 0xE51587AE) + 1289369390) >> 29);
  v41 = ((2 * v40) & 0x9BFFCFFA ^ 2) + (v40 ^ 0xCDFFE7FE);
  v42 = (((-1875495680 * (a6 ^ 0xF8329ACC) - ((7105024 * (a6 ^ 0xF8329ACC)) & 0x14AE9800) + 173493346) ^ 0xA574C62) & 0xFFFFFF00 | HIBYTE(v36)) ^ 0xCF;
  v43 = v42 - ((2 * v42) & 0xEEC0EC5E) + 2002810415;
  v44 = 14579667 * (v43 ^ 0x7760762F) - ((29159334 * (v43 ^ 0x7760762F)) & 0xCB65EE62) + 1706227505;
  v45 = 1524019463 * v41 - ((900555278 * v41 + 507082282) & 0x55EA199C) - 1173239837;
  v46 = v38 ^ 0x7B4C7095;
  v47 = 1123232339 * (v38 ^ 0x7B4C7095) - ((-2048502618 * (v38 ^ 0x7B4C7095)) & 0xFD702862) + 2125993009;
  v48 = HIBYTE(v44);
  v49 = (v38 ^ v43 ^ 0x4049773 ^ ((v39 >> 9) - ((2 * (v39 >> 9)) & 0x10512392) + 136876489)) - v41 - 838866947;
  v50 = ((2 * v49) & 0xF7B3DCF6) + (v49 ^ 0xFBD9EE7B);
  v51 = 1087408779 * v50 - ((-2120149738 * v50 - 2074449298) & 0x910413C4) + 179257113;
  v52 = ((-1592453632 * v50 - ((1110060032 * v50 + 886365184) & 0x4194A400) + 2067054634) ^ 0x20CA522A) & 0xFFFFFE00 | (v51 >> 23);
  v53 = ((2 * v52) & 0x6BFC7A3A ^ 0x222) + (v52 ^ 0x35FE3C8C);
  v54 = ((710082560 * v46 - ((1420165120 * v46) & 0x85120000) - 1031169849) ^ 0xC28998C7) & 0xFFFF0000 | HIWORD(v47);
  v55 = ((-562572544 * (v43 ^ 0x7760762F) - ((485467648 * (v43 ^ 0x7760762F)) & 0x1EDBA000) + 258855165) ^ 0xF6DD0FD) & 0xFFFFFF00 | HIBYTE(v44);
  v56 = ((2 * v55) & 0xB76BFF36 ^ 2) + (v55 ^ 0xDBB5FFFE);
  v57 = (1800962944 * v41 - ((1454442240 * v41 + 482022656) & 0x50806E00) + 916308436) ^ 0x9E3F4AF7 ^ (((v45 >> 25) ^ 0x20000015) - ((2 * ((v45 >> 25) ^ 0x20000015)) & 0x46) + 377453987);
  v58 = -940840365 * v57 - ((265802918 * v57) & 0x15C56B36) - 1964853861;
  v59 = (v54 ^ 0x67E31166)
      + ((2 * v54) & 0xCFC6DFBC ^ 0xDD30)
      + v56
      + ((v57 - 905854237 + v53) ^ 0x8440A830)
      - ((2 * (v57 - 905854237 + v53)) & 0xF77EAF9E)
      + 1;
  HIDWORD(v39) = ~(v51 >> 23);
  LODWORD(v39) = (738402791 * v53 - ((1476805582 * v53 + 482229162) & 0x4789F02C) - 232516117) ^ 0x23C4F816;
  v60 = ((2 * (v39 >> 1)) & 0xD90F8BAE) + ((v39 >> 1) ^ 0x6C87C5D7);
  v61 = 696254464 * v57 - ((318767104 * v57) & 0x1D000000) - 1899990395;
  HIDWORD(v39) = v48 ^ 1;
  LODWORD(v39) = (1342801329 * v56 - ((-1609364638 * v56 + 970423722) & 0xBB88C2EE) + 2058362956) ^ 0x5DC46174;
  v62 = ((2 * (v39 >> 2)) & 0x37DBFFFC) + ((v39 >> 2) ^ 0x1BEDFFFE) + v60;
  v63 = 378602653 * v60 - ((757205306 * v60 - 1850040758) & 0x8BF31A9E) + 248962164;
  v64 = (((-423624704 * v59 - ((-847249408 * v59 + 150994944) & 0x85800000) + 1199003653) ^ 0xC2F75805) & 0xFFC00000 | ((-1077198949 * v59 - ((127303478 * v59 + 44411940) & 0x6BFD636) + 1018347821) >> 10)) ^ 0x20D7FA;
  v65 = v64 - ((2 * v64) & 0x9CCD0286) + 1315340611;
  v66 = ((2 * ((v61 ^ 0x8EC07285) & 0xFF800000 | (v58 >> 9))) & 0xA7BEFCB0 ^ 0x8AE0B0)
      + (((v61 ^ 0x8EC07285) & 0xFF800000 | (v58 >> 9)) ^ 0x539A0F02);
  v67 = (v65 ^ (v62 - 1318088276 + (~(2 * v62 + 1863611478) | 0x8C3550FF)) ^ 0x7783D6C3) - v66 + 1407155800;
  v68 = -1660944384 * v60 - ((973078528 * v60 + 1241513984) & 0x42000000) + 1188016200;
  v69 = (((800795648 * (((2 * v67) & 0xF83BFDFA) + (v67 ^ 0xFC1DFEFD))
         - ((1601591296 * (((2 * v67) & 0xF83BFDFA) + (v67 ^ 0xFC1DFEFD)) + 1153107968) & 0x9AF61800)
         - 271019840) ^ 0xCD7B0CC0) & 0xFFFFFC00 | ((1783361227 * (((2 * v67) & 0xF83BFDFA) + (v67 ^ 0xFC1DFEFD))
                                                   - ((345496982 * (((2 * v67) & 0xF83BFDFA) + (v67 ^ 0xFC1DFEFD))
                                                     + 907095746) & 0x23FC9F6A)
                                                   + 1292298006) >> 22)) ^ 0x247;
  v70 = v69 - ((2 * v69) & 0x169B4FB6) + 189638619;
  v71 = (-2089625072 * v66 - ((115717152 * v66 + 176313600) & 0x9F62BA0)) & 0xFFFFFFF0 | ((137833889 * v66
                                                                                         - ((275667778 * v66 + 614999376) & 0x801D2BE2)
                                                                                         - 765286247) >> 28);
  v72 = (((-2044743680 * (v65 ^ 0x4E668143) - ((205479936 * (v65 ^ 0x4E668143)) & 0x2C696000) - 1774928729) ^ 0x9634BCA7) & 0xFFFFF000 | ((-1160224261 * (v65 ^ 0x4E668143) - ((95470582 * (v65 ^ 0x4E668143)) & 0xAD86E1C) - 2056505586) >> 20)) ^ 0x856;
  v73 = v72 - ((2 * v72) & 0x57D929E2) - 1410558735;
  v74 = ((v68 ^ 0x21CFB048) & 0xFF000000 | (v63 >> 8)) ^ 0x45F98D;
  v75 = v74 - ((2 * v74) & 0x362838C4) + 454302818;
  v76 = ((2 * ((v75 ^ 0x1B141C62) + (v73 ^ 0x54136B0E) + 1)) & 0x4BFF21F6)
      + (((v75 ^ 0x1B141C62) + (v73 ^ 0x54136B0E) + 1) ^ 0xA5FF90FB);
  v77 = (v76 - ((2 * v76 + 642319456) & 0x968569D2) - 563661031) ^ v70;
  v78 = (((2 * v77) ^ 0x801E2664) - ((2 * ((2 * v77) ^ 0x801E2664)) & 0x7B20BCC) + 131663334) & 0x6839368 ^ 0x31228;
  v79 = v78 - ((2 * v78) & 0x70090) + 947104859;
  v80 = v75 ^ (((v71 - 1438891952) ^ 0x84FB15DC) - ((2 * ((v71 - 1438891952) ^ 0x84FB15DC)) & 0x5A50A8F4) - 1389865862) ^ v73;
  v81 = 2 * (((v79 ^ 0x3EF1BF13) & (v77 ^ 0xC34EDA86)) - ((2 * ((v79 ^ 0x3EF1BF13) & (v77 ^ 0xC34EDA86))) & 0x5681D74A))
      + 1451349834;
  LODWORD(a24) = v80;
  v82 = (v77 ^ 0xFDBF6595 ^ v79) + (v81 ^ 0xDDE62805) + 1956118705 + ((2 * v81) & 0x16CFFE9C ^ 0x403AE94);
  v83 = (v70 ^ v80 ^ 0xE96284CD) + (v82 ^ 0x7F5EBEFB) + ((2 * v82) & 0xFEBD7DF6) - 2136915706;
  v84 = ((2 * v83) & 0x3DBF3EEC) + (v83 ^ 0x1EDF9F76);
  LODWORD(a21) = v84 - 826046601;
  v85 = v84 - 826046601 - ((2 * v84 + 60208638) & 0x9F058F0);
  v86 = (v73 ^ 0xABEC94F1)
      + (v85 ^ 0x7B07D387)
      + 1839835111
      - ((2 * ((v73 ^ 0xABEC94F1) + (v85 ^ 0x7B07D387) + 1)) & 0xDB534FCC);
  v87 = 880936289 * (v85 ^ 0x84F82C78) - ((688130754 * (v85 ^ 0x84F82C78)) & 0x3688C150) - 1690017624;
  v88 = (v87 & 0xEAE83807 ^ 0x9F57E7F8) + 476427202 + ((2 * (v87 & 0xEAE83807 ^ 0x9F57E7F8)) & 0x10C06002 ^ 0xD7F4F87F);
  v89 = ((v87 & 0x1517C7F8 ^ 0x14174070) - ((2 * (v87 & 0x1517C7F8 ^ 0x14174070)) & 0x202B0EA0) - 126501033) ^ 0xF836AFDC;
  v90 = (v89 | 0xED61858E) - (v89 | 0x129E7A71) + 312375921;
  HIDWORD(v39) = v88 ^ 0x1B3C1;
  LODWORD(v39) = v88 ^ 0x1C640000;
  v91 = (v39 >> 18) - ((2 * (v39 >> 18)) & 0x7F310734) + 1066959770;
  HIDWORD(v39) = v90 ^ 0x195DD;
  LODWORD(v39) = v90 ^ 0xE8300000;
  v92 = ((v39 >> 18) - ((2 * (v39 >> 18)) & 0xDA2DE77E) - 317262913) ^ v91;
  HIDWORD(v39) = v92 ^ 0x911;
  LODWORD(v39) = v92 ^ 0xC46D4000;
  v93 = (v39 >> 14) - ((2 * (v39 >> 14)) & 0xDA41A0BE) + 1830867039;
  HIDWORD(v39) = v93 ^ 0xF08BD3;
  LODWORD(v39) = v93 ^ 0x89000000;
  v94 = (v39 >> 24) - ((2 * (v39 >> 24)) & 0xFFA6B290) - 2926264;
  HIDWORD(v39) = v94 ^ 0x5D;
  LODWORD(v39) = v94 ^ 0xE814A100;
  v95 = v39 >> 8;
  v96 = v95 + 2011399270;
  v97 = v95 + 2011399270 - ((2 * v95) & 0xEFC708CC);
  LODWORD(a23) = v85 ^ v70 ^ v80;
  LODWORD(a28) = v85 ^ v70;
  v98 = -1415786763 * (a28 ^ 0x8FB58BA3) - ((1463393770 * (a28 ^ 0x8FB58BA3)) & 0xB5817192) + 1522579657;
  v99 = -856731648 * (v85 ^ v70 ^ 0x8FB58BA3) - ((-1713463296 * (v85 ^ v70 ^ 0x8FB58BA3)) & 0xBF780000) + 1606156402;
  v100 = (((251002880 * (a23 ^ 0x9265574A) - ((502005760 * (a23 ^ 0x9265574A)) & 0xF2E40000) + 2037545418) ^ 0x797279CA) & 0xFFFE0000 | ((2068940667 * (a23 ^ 0x9265574A) - ((-157085962 * (a23 ^ 0x9265574A)) & 0xA9B9CA34) - 723720934) >> 15)) ^ 0x1A9B9;
  v101 = v100 - ((2 * v100) & 0xAFCE945A) - 672708051;
  v102 = ((2 * (v99 ^ 0x5FBC0072 | (v98 >> 20))) & 0xE5FEF7BC ^ 0x318) + ((v99 ^ 0x5FBC0072 | (v98 >> 20)) ^ 0x72FF7E72);
  HIDWORD(v39) = v96 ^ 2;
  LODWORD(v39) = v97 ^ 0x77E38464;
  v103 = (((((~(50331648 * (v86 ^ 0x6DA9A7E6)) | 0xF7FFFFFF) - 780140544 * (v86 ^ 0x6DA9A7E6) + 70333539) | 1) ^ 0x4313463) & 0xFF800000 | ((-1027952221 * (v86 ^ 0x6DA9A7E6) - ((91579206 * (v86 ^ 0x6DA9A7E6)) & 0x73C4ABF6) + 971134459) >> 9)) ^ 0x1CF12A;
  v104 = v103 - ((2 * v103) & 0x3D195EA8) + 512536404;
  v105 = (v104 ^ 0xA830A352 ^ ((v39 >> 2) - ((2 * (v39 >> 2)) & 0x6D78180C) - 1229190138)) - v102;
  v106 = v101 ^ 0x6D2144FC ^ (v105 - ((2 * v105 + 1711208380) & 0x758C1DA2) + 767920815);
  v107 = 1389985351 * v106 - ((632487054 * v106) & 0x2FD8BBAC) + 401366486;
  v108 = -1849688064 * v106 - ((595591168 * v106) & 0xE0FFFFFF) + 1886317990;
  v109 = v104 ^ 0x1E8CAF54;
  v110 = -79426321 * (v104 ^ 0x1E8CAF54) - ((914889182 * (v104 ^ 0x1E8CAF54)) & 0x2B87CE14) + 365160202;
  v111 = ((2 * (v108 ^ 0x706EEDA6 | (v107 >> 10))) & 0x97FBFDDE ^ 0xBF40E)
       + ((v108 ^ 0x706EEDA6 | (v107 >> 10)) ^ 0x4BF805F8);
  v112 = ((1753325024 * v109 - ((285424576 * v109) & 0x1D4B2480) - 1901751734) ^ 0x8EA5924A) & 0xFFFFFFE0 | (v110 >> 27);
  v113 = ((1224502400 * (v101 ^ 0xD7E74A2D) - ((-1845962496 * (v101 ^ 0xD7E74A2D)) & 0x93502300) - 911732259) ^ 0xC9A811DD) & 0xFFFFFF80 | ((-594413351 * (v101 ^ 0xD7E74A2D) - ((-1188826702 * (v101 ^ 0xD7E74A2D)) & 0xCF11CCA6) + 1737025107) >> 25);
  v114 = ((2 * v113) & 0x7E8DEF74 ^ 0x64) + (v113 ^ 0x3F46F789);
  v115 = ((911135744 * v102 - ((1822271488 * v102 + 932204544) & 0x5F377000) + 191094962) ^ 0x2F9BB8B2) & 0xFFFFFC00 | ((2005767093 * v102 - ((253437802 * v102 + 65922068) & 0x8E80030) + 376107554) >> 22);
  v116 = ((2 * v115) & 0xFFFDDF6E ^ 0x422) + (v115 ^ 0x7FFEEDA6);
  v117 = v114 - v116 + (v112 ^ 0xFBEDD76E) + ((2 * v112) & 0xF7DBAED8) - v111 - 292945305;
  v118 = 50301917 * v117 - ((100603834 * v117 - 291151062) & 0xC5E3B772) + 1514442062;
  v119 = 1946157056 * v117 - ((-402653184 * v117 - 1476395008) & 0xB0000000) - 1371008777;
  v120 = ((v118 >> 5) & 0x7BFFED4 ^ 0x3178ED4) + ((v118 >> 6) ^ 0xF6543804);
  v121 = v120
       + (((v120 + 136315030) | v119 ^ 0x5A4810F7) ^ 0x92A49000)
       - ((2 * ((v120 + 136315030) | v119 ^ 0x5A4810F7)) & 0xDAB6DFFE)
       + 1;
  v122 = (v119 ^ ((v119 ^ 0xA5B7EF08) - ((2 * (v119 ^ 0xA5B7EF08) + 2) & 0x60000000) + 805697192) ^ 0x6489A425 ^ (v121 - ((2 * v121 + 183951658) & 0x1D8884EA) - 2076200182))
       + v120
       + 136315030;
  v123 = ((2 * v122) & 0x77ACFF9A) + (v122 ^ 0x3BD67FCD);
  v124 = (((~(-1980411904 * v116 - 67907584) | 0x4DC38FFF) - 990205952 * v116 + 1461199573) ^ 0xD91E3AD4) & 0xFFFFF800 | ((850960213 * v116 - ((1701920426 * v116 + 1071611514) & 0x5C35B7D2) + 1309317926) >> 21);
  v125 = v124 ^ 0x3FAE6F8E;
  v126 = (2 * v124) & 0x7F5CDDFC ^ 0xE0;
  v127 = (((~(386451328 * v111 + 526172032) | 0xC5330B7F) - 880516160 * v111 + 1830083119) ^ 0x9D667A6E) & 0xFFFFFFC0 | ((-2094132849 * v111 - ((106701598 * v111 + 645755646) & 0xBED1A18E) + 1923582534) >> 26);
  v128 = ((2 * v127) & 0xB7752FEC ^ 0x6C) + (v127 ^ 0x5BBA97C1);
  v129 = (((543529984 * v114 - ((1087059968 * v114 - 1991159808) & 0xD655A800) + 802389429) ^ 0x6B2AD5B5) & 0xFFFFFC00 | ((-1077405337 * v114 - ((2140156622 * v114 - 1713220524) & 0x9890A0B8) - 1724286330) >> 22)) ^ 0x131;
  v130 = v129 - 377758255;
  v131 = v129
       - 377758255
       - 2
       * (v129 & 0x697BDDCF ^ ((-1077405337 * v114 - ((2140156622 * v114 - 1713220524) & 0x9890A0B8) - 1724286330) >> 22) & 0xC)
       - 14;
  v132 = (v125
        + v126
        + v128
        - v123
        - 70783884
        - ((2 * (v125 + v126 + v128 - v123 - 70783884) + 1229658314) & 0xC98CAFE2)
        + 158065750) ^ v131;
  v133 = -1223029457 * (v131 ^ 0xE97BDDC3) - ((775166558 * (v131 ^ 0xE97BDDC3)) & 0x2C48556E) + 371468983;
  v134 = ((v130 << 30) | 0xBFFFFFFF) + (v131 << 29) + 1586303823;
  v135 = ((1629226368 * v128 - ((37227264 * v128 + 296250880) & 0x1FB0F300) - 1196642073) ^ 0xFD879E7) & 0xFFFFFF80 | ((-893241333 * v128 - ((-1786482666 * v128 - 224177956) & 0xF4422212) - 210585225) >> 25);
  v136 = ((2 * v135) & 0x7C6B7DEE ^ 0xEA) + (v135 ^ 0xBE35BE8A);
  v137 = (v134 ^ 0xBE8D134E) & 0xE0000000 | (v133 >> 3);
  v138 = v137 ^ 0x652AB81D;
  v139 = (2 * v137) & 0xCFDC7A96 ^ 0x5880A84;
  v140 = (((v132 << 29) ^ 0xA0000000) + 728030612) & 0xE0000000 | ((1305977431 * (v132 ^ 0x8DBD8A32)
                                                                  - ((-1683012434 * (v132 ^ 0x8DBD8A32)) & 0xA70ACE92)
                                                                  + 1401251657) >> 3);
  v141 = ((2 * v140) & 0xEDDAF2A4 ^ 0x4C05080) + (v140 ^ 0x7C9DD5BB);
  HIDWORD(v39) = v123 + 3;
  LODWORD(v39) = (417622369 * v123 - ((835244738 * v123 - 1653277530) & 0xD74B4CEE) + 979379402) ^ 0xEBA5A670;
  v142 = (v39 >> 4) - ((2 * (v39 >> 4)) & 0x587A18E) + 46387399;
  v143 = ((v138 + v139 - 1743666507 + (v142 ^ 0x2C3D0C7)) ^ 0x6DFF5ED5)
       - v136
       + ((2 * (v138 + v139 - 1743666507 + (v142 ^ 0x2C3D0C7))) & 0xDBFEBDAA)
       - v141
       - 1778282080;
  v144 = v143 - ((2 * v143 + 1648660392) & 0x5CCB98A4) - 544730074;
  v145 = -1879407275
       * (((2 * (v136 + 1103773962 + (v142 ^ 0xFD3C2F38))) & 0xA9FCF4BE)
        + ((v136 + 1103773962 + (v142 ^ 0xFD3C2F38)) ^ 0xD4FE7A5F))
       - v141;
  v146 = (v145 - ((2 * v145 - 299173490) & 0xC6F4C878) + 1519378691) ^ v144;
  v147 = (v146 ^ 0x9A566A04) - 2 * (((v146 ^ 0x9A566A04) + 523163008) & 0x2F4A80FE ^ v146 & 0x10) + 242833006;
  v148 = v147 ^ 0x2F4A80EE;
  v149 = 2133795187 * (v147 ^ 0x2F4A80EE) - ((-27376922 * (v147 ^ 0x2F4A80EE)) & 0xABE2DB24) + 1441885586;
  v150 = v147 ^ v142;
  LODWORD(v194) = v147 ^ v144;
  HIDWORD(v194) = v147;
  v151 = v147 ^ v144 ^ 0x812F4CBC;
  v195 = (v147 ^ 0xD0B57F11) + v141 - ((2 * ((v147 ^ 0xD0B57F11) + v141) + 304418142) & 0xFBE3FF62) - 2029746592;
  LODWORD(a29) = v150;
  v152 = -536870912 * ((3 * (v150 ^ 0x29)) & 3) + 805306368 * (v150 ^ 0x2D895029);
  v153 = -712382909 * (v150 ^ 0x2D895029) - ((722717830 * (v150 ^ 0x2D895029)) & 0x3E2F3BE4) - 1625842190;
  v154 = (((374975488 * v151 - ((749950976 * v151) & 0x4BBB7000) - 1512195546) ^ 0xA5DDBA26) & 0xFFFFFC00 | ((205887083 * v151 - ((411774166 * v151) & 0x9744B484) - 878552510) >> 22)) ^ 0x32E;
  v155 = v154 - ((2 * v154) & 0x463739EC);
  v156 = ((-54753844 * v148 - ((-109507688 * v148) & 0xEC0D7100) - 167331711) ^ 0xF606B881) & 0xFFFFFFFC | (v149 >> 30);
  v157 = v156 ^ 0x41F7AFFC;
  v158 = (2 * v156) & 0x83EF5FFA;
  v159 = ((v152 + 1015287289) ^ 0x3C840DF9) & 0xF0000000 | (v153 >> 4);
  v160 = ((2 * v159) & 0xBFEF2FCE ^ 0x13E2238E) + (v159 ^ 0x5606EE38);
  v161 = v155 - 1558471434;
  v162 = v158 ^ 2;
  v163 = ((-113947008 * (v195 ^ 0xFDF1FFB1) - ((845847808 * (v195 ^ 0xFDF1FFB1)) & 0x344B6200) + 438677818) ^ 0x1A25B13A) & 0xFFFFFF80 | ((-1712166243 * (v195 ^ 0xFDF1FFB1) - ((870634810 * (v195 ^ 0xFDF1FFB1)) & 0x624C8126) + 824590483) >> 25);
  v164 = ((2 * v163) & 0xB3BF97EE ^ 0x20) + (v163 ^ 0xD9DFCBEF);
  v165 = v161 ^ (v157
               + v162
               - v160
               - v164
               - 1684432927
               - 2
               * ((v157 + v162 - v160 - v164 - 136334367) & 0x49A2E8DF ^ (v157 + v162 - v160 - v164 - 1684432927) & 0x19)
               - 1511455546);
  v166 = (((1744830464 * (v165 ^ 0xEAB97430) - ((-805306368 * v165) & 0xC0000000) - 536543939) ^ 0xE004FD3D) & 0xF8000000 | ((391565357 * (v165 ^ 0xEAB97430) - ((783130714 * (v165 ^ 0xEAB97430)) & 0xCFCE9532) - 404272487) >> 5)) ^ 0x73F3A54;
  v167 = v166 - ((2 * v166) & 0x3AE0755A) - 1653589331;
  v168 = (((-1526726656 * v160 - ((1241513984 * v160 + 973078528) & 0xF4000000) - 1747656280) ^ 0x7AD4E1A8) & 0xFF000000 | ((1924794533 * v160 - ((-445378230 * v160 + 1504428090) & 0x9EFA49BA) + 2085815546) >> 8)) ^ 0x4F7D24;
  v169 = v168 - ((2 * v168) & 0xEE614D0) - 2022503832;
  v170 = ((-1690698368 * (v161 ^ 0xA31B9CF6) - ((913570560 * (v161 ^ 0xA31B9CF6)) & 0x76727D00) + 993607334) ^ 0x3B393EA6) & 0xFFFFFF80 | ((-482970629 * (v161 ^ 0xA31B9CF6) - ((107800566 * (v161 ^ 0xA31B9CF6)) & 0x126BF3BE) - 1992951329) >> 25);
  v171 = ((2 * v170) & 0xFFDBB79A ^ 0x88) + (v170 ^ 0xFFEDDB89);
  v172 = (((36826112 * v164 - ((73652224 * v164 + 1868732416) & 0x8457E800) - 102940143) ^ 0x422BF611) & 0xFFFFFC00 | ((1312853115 * v164 - ((-1669261066 * v164 + 1549523110) & 0xEC560138) - 1537676049) >> 22)) ^ 0x3D8;
  v173 = v172 - ((2 * v172) & 0x2410BE00) - 1844945152;
  v174 = v173 ^ 0x92085F00;
  v175 = 1193314462 * (v173 ^ 0x92085F00);
  v176 = 596657231 * (v173 ^ 0x92085F00) - (v175 & 0x9C449476) + 1310870075;
  v177 = v171 + 1188915 + (v169 ^ v173 ^ 0x880B6FC5 ^ v167);
  v178 = ((v175 - ((239145276 * v174) & 0x2E7D84C4) - 1757494685) ^ 0x973EC263) & 0xFFFFFFFE | (v176 >> 31);
  v179 = ((2 * v178) & 0xBFBDF4FE) + (v178 ^ 0x5FDEFA7F);
  v180 = ((-762533440 * (v167 ^ 0x9D703AAD) - ((-1525066880 * (v167 ^ 0x9D703AAD)) & 0x949F8C00) + 1246742037) ^ 0x4A4FC615) & 0xFFFFFFC0 | ((1598698151 * (v167 ^ 0x9D703AAD) - ((-1097570994 * (v167 ^ 0x9D703AAD)) & 0x9508256C) + 1250169526) >> 26);
  v181 = (((v177 << 31) - ((v177 ^ 0x39ABFDBE) << 30) + 1094433429) ^ 0xC13BBA95) & 0xC0000000 | ((-457433129
                                                                                                 * (((2 * v177) & 0x7357FB7C)
                                                                                                  + (v177 ^ 0x39ABFDBE))
                                                                                                 - ((158875566 * (((2 * v177) & 0x7357FB7C) + (v177 ^ 0x39ABFDBE)) + 446154460) & 0x10FE4BF4)
                                                                                                 - 1244984984) >> 2);
  v182 = ((2 * v181) & 0xDFBD9FFC ^ 0x443D92FC) + (v181 ^ 0x4DC10680);
  v183 = v179 - (((2 * v180) & 0xEB2BC7BE ^ 0x24) + (v180 ^ 0xF595E3CD));
  v184 = 2
       * (((v182 - 1876873214) & (v183 - 1783174816)) - ((2 * ((v182 - 1876873214) & (v183 - 1783174816))) & 0x14F7BA0))
       - 2125497440;
  v185 = ((-1809575680 * v171 - ((675815936 * v171 + 254199296) & 0x2A8B0E00) - 589763983) ^ 0x15458771) & 0xFFFFFF00 | ((-1584126959 * v171 - ((1126713378 * v171 + 495920838) & 0x6D8BAA7C) - 980588383) >> 24);
  v186 = v183
       - (((2 * v185) & 0xF3FEDFEE ^ 0x6C)
        + (v185 ^ 0xF9FF6FC1))
       + v182
       + (v184 ^ 0xA7CF118B)
       - 1833662383
       + ((2 * v184) & 0xB2FF2BA8 ^ 0xFD61DCFF);
  v187 = ((-117440512 * v186 - ((1912602624 * v186 + 1543503872) & 0x66666666) + 566496594) ^ 0x33C40D52 | ((202176761 * v186 - ((404353522 * v186 - 1587045412) & 0xEADA602C) + 1176567300) >> 8)) ^ 0x756D30;
  HIDWORD(a30) = v187 - ((2 * v187) & 0xA660D478) - 751801796;
  v188 = malloc(0x408uLL);
  *(_QWORD *)(v34 - 216) = v188;
  return ((uint64_t (*)(void *, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 + 8 * ((38 * (v188 != 0)) ^ v32)) - 8))(v188, 0, v189, v190, v191, v192, 0, 0, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           v194,
           a27,
           a28,
           a29,
           a30);
}

uint64_t sub_1001E4138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,int a32,unsigned int a33,int a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,int a39,int a40)
{
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  uint64_t v47;
  unsigned int v48;
  int v49;
  int v50;
  int v51;
  unsigned int v52;
  int v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  int v57;
  unsigned int v58;
  unsigned int v59;
  unsigned int v60;
  unsigned int v61;
  unsigned int v62;
  unsigned int v63;
  unsigned int v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  unsigned int v68;
  unsigned int v69;
  int v70;
  unsigned int v71;
  unsigned int v72;
  int v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int v76;
  unsigned int v77;
  unsigned int v78;
  unsigned int v79;
  int v80;
  unsigned int v81;
  unsigned int v82;
  int v83;
  unsigned int v84;
  unsigned int v85;
  unsigned int v86;
  unsigned int v87;
  int v88;
  int v89;
  unsigned int v90;
  unsigned int v91;
  unsigned int v92;
  unsigned int v93;
  unsigned int v94;
  unsigned int v95;
  unsigned int v96;
  int v97;
  unsigned int v98;
  int v99;
  unsigned int v100;
  unsigned int v101;
  unsigned int v102;
  unsigned int v103;
  unsigned int v104;
  unsigned int v105;
  unsigned int v106;
  unsigned int v107;
  unsigned int v108;
  unsigned int v109;
  unsigned int v110;
  int v111;
  unsigned int v112;
  unsigned int v113;
  int v114;
  unsigned int v115;
  unsigned int v116;
  unsigned int v117;
  int v118;
  int v119;
  unsigned int v120;
  unsigned int v121;
  unsigned int v122;
  unsigned int v123;
  unsigned int v124;
  int v125;
  int v126;
  unsigned int v127;
  unsigned int v128;
  unsigned int v129;
  unsigned int v130;
  unsigned int v131;
  unsigned int v132;
  unsigned int v133;
  unsigned int v134;
  int v135;
  unsigned int v136;
  unsigned int v137;
  unint64_t v138;
  int v139;
  int v140;
  int v141;
  unsigned int v142;
  unsigned int v143;
  unsigned int v144;
  int v145;
  unsigned int v146;
  unsigned int v147;
  unsigned int v148;
  unsigned int v149;
  unsigned int v150;
  unsigned int v151;
  int v152;
  unsigned int v153;
  unsigned int v154;
  unsigned int v155;
  unsigned int v156;
  unsigned int v157;
  unsigned int v158;
  int v159;
  unsigned int v160;
  int v161;
  unsigned int v162;
  unsigned int v163;
  unsigned int v164;
  int v165;
  int v166;
  unsigned int v167;
  unsigned int v168;
  unsigned int v169;
  unsigned int v170;
  unsigned int v171;
  unsigned int v172;
  unsigned int v173;
  unsigned int v174;
  int v175;
  int v176;
  int v177;
  unsigned int v178;
  int v179;
  unsigned int v180;
  unsigned int v181;
  unsigned int v182;
  unsigned int v183;
  unsigned int v184;
  unsigned int v185;
  unsigned int v186;
  unsigned int v187;
  unsigned int v188;
  int v189;
  unsigned int v190;
  unsigned int v191;
  int v192;
  unsigned int v193;
  unsigned int v194;
  unsigned int v195;
  unsigned int v196;
  unsigned int v197;
  unsigned int v198;
  unsigned int v199;
  unsigned int v200;
  unsigned int v201;
  unsigned int v202;
  unsigned int v203;
  unsigned int v204;
  int v205;
  int v206;
  unsigned int v207;
  int v208;
  unsigned int v209;
  unsigned int v210;
  unsigned int v211;
  unsigned int v212;
  int v213;
  int v214;
  unsigned int v215;
  int v216;
  unsigned int v217;
  unsigned int v218;
  unsigned int v219;
  unsigned int v220;
  int v221;
  int v222;
  unsigned int v223;
  unsigned int v224;
  int v225;
  unsigned int v226;
  unsigned int v227;
  int v228;
  unsigned int v229;
  unsigned int v230;
  uint64_t v231;
  int v232;
  unsigned int v233;
  unsigned int v234;
  int v235;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  unsigned int v244;
  unsigned int v245;

  v48 = ((v44 ^ v45)
       - 214451299
       + v46
       - 2 * (((v44 ^ v45) - 214451299 + v46) & 0x2A64384F ^ (v44 ^ v45) & 2)
       - 1436272563) ^ (((v42 - 235327160) & 0xFFFFFF7F) - ((2 * (v42 - 235327160)) & 0x24CB2656) - 1838836821);
  v49 = v48 ^ 0x2B92D797 ^ HIDWORD(a30);
  v50 = v48 ^ 0x754B7817;
  v51 = 2 * (((v48 ^ 0x754B7817) & (v44 ^ v45)) - ((2 * ((v48 ^ 0x754B7817) & (v44 ^ v45))) & 0x50B4826)) - 2062858202;
  HIDWORD(v243) = v48 ^ 0x2B92D797;
  v52 = (v44 ^ 0x57D83033 ^ v48 ^ 0x2B92D797) + (v51 ^ 0xBEE7B6D3) - 1005387509 + ((2 * v51) & 0x77D9FDE8 ^ 0x2109048);
  v53 = v52 - ((2 * v52) & 0x7F25218C) - 1080913722;
  v54 = (-1337075410 * (v48 ^ 0x754B7817)) & 0xF137444C;
  v55 = -122347593 * (v53 ^ 0xBF9290C6) - ((-244695186 * (v53 ^ 0xBF9290C6)) & 0x9BAE90A2) - 841529263;
  *(_DWORD *)(v47 - 224) = HIBYTE(v48) ^ 0x26DC3A4C;
  HIDWORD(a13) = (v41 ^ v40)
               + (v48 ^ 0x8AB487E8)
               + 1
               - ((2 * ((v41 ^ v40) + (v48 ^ 0x8AB487E8) + 1)) & 0x161F5D78)
               - 1961906500;
  v56 = ((-657676288 * (HIDWORD(a13) ^ 0x8B0FAEBC)
        - ((832131072 * (HIDWORD(a13) ^ 0x8B0FAEBC)) & 0x4D3EE000)
        - 1499499548) ^ 0xA69F73E4) & 0xFFFFF800 | ((-1810163307 * (HIDWORD(a13) ^ 0x8B0FAEBC)
                                                   - ((674640682 * (HIDWORD(a13) ^ 0x8B0FAEBC)) & 0xE8C662F6)
                                                   + 1952657787) >> 21);
  v57 = ((2 * v56) & 0x766E5FFE ^ 0x746) + (v56 ^ 0x3B372C5C);
  HIDWORD(v241) = v49;
  v58 = ((81629920 * v50 - ((163259840 * v50) & 0xE2B42140) - 245755741) ^ 0xF15A10A3) & 0xFFFFFFE0 | ((v54 - 1478945943 * v50 + 124018137) >> 27);
  v59 = ((1752367280 * (v49 ^ 0x8DE9C5BC) - ((283509088 * (v49 ^ 0x8DE9C5BC)) & 0x1346B6C0) - 1985782936) ^ 0x89A35B68) & 0xFFFFFFF0 | ((-1232654325 * (v49 ^ 0x8DE9C5BC) - ((1829658646 * (v49 ^ 0x8DE9C5BC)) & 0x626F9450) - 1321743832) >> 28);
  v60 = ((2 * v59) & 0xE9DDDBDE ^ 0x16) + (v59 ^ 0x74EEEDE4);
  HIDWORD(v239) = v53;
  v61 = (((((v53 << 31) - ((v53 ^ 0xBF9290C6) << 28)) & 0x80000000) - 1207959552 * (v53 ^ 0xBF9290C6) + 1138455247) ^ 0x43DB72CF) & 0xF8000000 | (v55 >> 5);
  v62 = ((2 * v61) & 0xFFECBF6E ^ 0xCCC3404) + (v61 ^ 0xF998E5F5);
  v63 = 1342177280 * v60 - ((-1610612736 * v60 - 1610612736) & 0xC0000000) + 971672754;
  v64 = (v58 ^ 0xF27A7BE7)
      + ((2 * v58) & 0xE4F4F7CE)
      - v60
      + v57
      + ((2 * v57 - 1986945022) ^ 0x30421)
      - ((2 * (2 * v57 - 1986945022)) & 0xFFF9F7BC)
      - v62
      + 2095857638;
  v65 = 750347751 * v62 - ((1500695502 * v62 + 1801117118) & 0x422E0572) + 1455714712;
  v66 = ((1520435200 * v64 - ((-1254096896 * v64 + 994050048) & 0xB3000000) + 1999568499) ^ 0xD98EFE73) & 0xFFE00000 | ((-1219675435 * v64 - ((1855616426 * v64 + 1871038938) & 0x798695AE) + 1954951108) >> 11);
  v67 = ((2 * v66) & 0xFF97BF4A ^ 0x73042) + (v66 ^ 0x7FCC47CC);
  v68 = (v63 & 0xF8C28032 ^ 0x173D7FCD) + (v63 ^ 0x1615734D) + ((v63 >> 28 << 29) ^ 0xC0000002);
  v69 = (v68 - ((2 * v68) & 0xCDC980C2) - 421216159) ^ (207109717 * v60
                                                      - ((414219434 * v60 - 1580844214) & 0x844BE1E4)
                                                      - 1828122985);
  v70 = (v55 >> 5 << 31) - (v62 << 30);
  v71 = 104925595 * v67 - ((209851190 * v67 - 1684302798) & 0xC4271E58) - 1344186043;
  v72 = ((v63 ^ 0xE9EA8CB2) & 0xF0000000 | (v69 >> 4)) ^ 0xA4C1309;
  v73 = v72 - ((2 * v72) & 0x509CF448) + 676231716;
  v74 = ((-1524891648 * v57 - ((1245184000 * v57 + 1245184000) & 0x59980000) + 300569524) ^ 0xACCE53B4) & 0xFFFC0000 | ((-1730565817 * v57 - ((833835662 * v57 + 464958094) & 0xA0A2ECB4) - 567488607) >> 14);
  v75 = ((2 * v74) & 0xFFEB74B6 ^ 0x20082) + (v74 ^ 0x7FF6FB1E);
  v76 = 1915976565 * (v73 ^ 0x284E7A24) - ((610727658 * (v73 ^ 0x284E7A24)) & 0x2FBABB4C) + 400383398;
  v77 = v75 - v67 - ((2 * (v75 - v67) - 5485932) & 0xDFE2A74C) - 272140048;
  v78 = ((2 * (v70 & 0xC0000000 | (v65 >> 2))) & 0xFEFFEBFE ^ 0x908B815C)
      + ((v70 & 0xC0000000 | (v65 >> 2)) ^ 0x373A3551);
  v79 = ((2 * ((v73 ^ 0xC7BF2982 ^ v77) - v78 + 2139092479)) & 0xFDBFBFF6)
      + (((v73 ^ 0xC7BF2982 ^ v77) - v78 + 2139092479) ^ 0x7EDFDFFB);
  v80 = 1811939328 * v67 - ((1476395008 * v67 + 1207959552) & 0x48000000) - 1990799519;
  LOBYTE(v67) = (v76 >> 10) & 0x16;
  v81 = -583008256 * (v73 ^ 0x284E7A24) - ((-1166016512 * (v73 ^ 0x284E7A24)) & 0xEC800000) + 1987171941;
  v82 = (((1145044992 * v79 - ((142606336 * v79 + 713031680) & 0x50800000) - 41462555) ^ 0xA84754E5) & 0xFFC00000 | ((1383441681 * v79 - ((619399714 * v79 + 136098474) & 0x739E9864) - 1109547641) >> 10)) ^ 0xE73D3;
  v83 = v82 - ((2 * v82) & 0x3CE4666C) + 510800694;
  v84 = ((344057825 * v78 - ((688115650 * v78 + 807494594) & 0x2E843B2A) + 793956214) ^ 0x97421D95) >> (v67 ^ 0x16);
  v85 = v84 - ((2 * v84) & 0x2DE0B632);
  v86 = ((2 * ((v80 ^ 0x2556CF61) & 0xFC000000 | (v71 >> 6))) & 0xEF6DDF9E ^ 0x7009C18)
      + (((v80 ^ 0x2556CF61) & 0xFC000000 | (v71 >> 6)) ^ 0x743EA1F3);
  v87 = ((2 * ((v81 ^ 0x7671D665) & 0xFFC00000 | (v76 >> 10))) & 0x3F59FDFA ^ 0x9ECAA)
      + (((v81 ^ 0x7671D665) & 0xFFC00000 | (v76 >> 10)) ^ 0x1FA909AA)
      + v86;
  v88 = v87 - ((2 * v87 + 288891496) & 0x2C4A0076) - 20901521;
  v89 = v83 ^ 0x1E723336;
  v90 = -1539020255 * (v83 ^ 0x1E723336) - ((1216926786 * (v83 ^ 0x1E723336)) & 0x5E6C6488) - 1355402684;
  v91 = ((((v85 + 384850713) ^ 0x16F05B19) >> v67)
       - ((2 * (((v85 + 384850713) ^ 0x16F05B19) >> v67)) & 0x660120D0)
       - 1291808664) ^ (127894528 * v78 - ((255789056 * v78 + 93259776) & 0x55D10000) + 1840252716);
  v92 = 2 * (((v83 ^ 0x1E723336) & (v88 ^ 0x9625003B)) - ((2 * ((v83 ^ 0x1E723336) & (v88 ^ 0x9625003B))) & 0x64906152))
      - 460299950;
  v93 = (v88 ^ 0x8857330D ^ v83) + (v92 ^ 0x9D2FBCFD) - 2042617263 + ((2 * v92) & 0xF37FBB5C ^ 0xC1208204);
  v94 = (v91 ^ 0x6617ECBB) + (v93 ^ 0x5D7EEDF7) + ((2 * v93) & 0xBAFDDBEE) - 1568599542;
  v95 = ((2 * v94) & 0x9FF52F7E) + (v94 ^ 0x4FFA97BF);
  v96 = (((1359478784 * v89 - ((34603008 * v89) & 0xA000000) - 2063115840) ^ 0x850759C0) & 0xFFF80000 | (v90 >> 13)) ^ 0x579B1;
  v97 = v96 + 602140516 - 2 * (v96 & 0x23E3EF6E ^ (v90 >> 13) & 0xA);
  v98 = (((1895932224 * v86 - ((570638976 * v86 + 759675520) & 0x3B408700) + 1413751036) ^ 0x9DA043BC) & 0xFFFFFFC0 | ((-641464699 * v86 - ((-1282929398 * v86 - 441114902) & 0xDD245AE4) - 512967449) >> 26)) ^ 0x1B;
  v99 = v98 - ((2 * v98) & 0x5FE7150A) - 1342993787;
  v100 = (((-1013153792 * v95 - ((121176064 * v95 + 494469120) & 0x13B60000) + 1217910987) ^ 0x89DB58CB) & 0xFFFF8000 | ((1315276601 * v95 - ((-1664414094 * v95 - 173606158) & 0xB3D1FD74) - 725844941) >> 17)) ^ 0x6CF4;
  v101 = v100 - ((2 * v100) & 0xD35BAB5C) + 1773000110;
  v102 = (((v91 ^ 0x99E81344) * v43 - ((999817216 * (v91 ^ 0x99E81344)) & 0x97500000) + 1269468154) ^ 0x4BAA8BFA) & 0xFFFC0000 | ((-1396742285 * (v91 ^ 0x99E81344) - ((427740902 * (v91 ^ 0x99E81344)) & 0x1DB411E0) + 249170160) >> 14);
  v103 = (v99 ^ 0xAFF38A85) + (v102 ^ 0x7FD3CC52) - 2144597818 + ((2 * v102) & 0xFFA7EE74 ^ 0x6650);
  v104 = (((v99 ^ 0x8C1065E1 ^ v97) - 1128244245) ^ 0x54BFB36F)
       + ((2 * ((v99 ^ 0x8C1065E1 ^ v97) - 1128244245)) & 0xA97F66DE)
       - 1421849454
       + (v101 ^ 0x96522A51);
  v105 = (v103 ^ 0x4CF773D7) + ((2 * v103) & 0x99EEE7AE) - 1291285463 + (v97 ^ 0x23E3EF64);
  v106 = v101 ^ (v105 - ((2 * v105) & 0xCF0EA50E) + 1736921735);
  v107 = (((2 * v104) & 0x33CEBFF8)
        + (v104 ^ 0x99E75FFC)
        - ((2 * (((2 * v104) & 0x33CEBFF8) + (v104 ^ 0x99E75FFC)) - 1992222050) & 0xF79734F2)
        - 1066653752) ^ v106;
  v108 = (((2 * v107) ^ 0xEBC23AA0) - ((2 * ((2 * v107) ^ 0xEBC23AA0)) & 0x4E9DCF7C) + 1733224383) & 0x41614930;
  v109 = (v107 ^ 0xD551B9C8) + (v108 ^ 0xBEAFBA4F) + ((2 * v108) ^ 0x82808260) + 1049729;
  v110 = v109 - ((2 * v109) & 0xA5066162) - 763154255;
  v111 = (v101 ^ 0x69ADD5AE) + (v110 ^ 0x2D7CCF4E);
  HIDWORD(v240) = v110;
  v112 = v110 ^ 0xD28330B1;
  LODWORD(v238) = v110 ^ v97;
  v113 = v110 ^ v97 ^ 0xF160DFD5;
  v245 = (v110 ^ 0xD28330B1)
       + (v106 ^ 0xE2A8729)
       - ((2 * ((v110 ^ 0xD28330B1) + (v106 ^ 0xE2A8729))) & 0x5D800AA0)
       + 784336208;
  v114 = v245 ^ 0x2EC00550;
  v115 = -1346651313 * v114 - ((1601664670 * v114) & 0x9F5F8CCC) + 1336919654;
  LODWORD(v240) = v112;
  v116 = ((-1696595968 * v112 - ((901775360 * v112) & 0xD3C00000) - 370922461) ^ 0xE9E42C23) & 0xFFE00000 | ((1120222423 * v112 - ((-2054522450 * v112) & 0xC0144852) - 536206295) >> 11);
  v117 = ((2 * v116) & 0xDF7FFFFC ^ 0x380288) + (v116 ^ 0x6FA3FEBA);
  v118 = ++v111 + 660551338;
  v119 = v111 + 660551338 - ((2 * v111) & 0x4EBE6D54);
  *(_DWORD *)(v47 - 208) = v119;
  v120 = ((((v118 << 30) ^ 0x40000000) + 1618040473) & 0xC0000000 | ((1826555235 * (v119 ^ 0x275F36AA)
                                                                    - ((431884998 * (v119 ^ 0x275F36AA)) & 0x2E64D878u)
                                                                    + 389180476) >> 2)) ^ 0x5CC9B0F;
  v121 = ((-671391744 * v113 - ((804700160 * v113) & 0x2749C000) - 1817906746) ^ 0x93A4F1C6) & 0xFFFFE000 | ((1607909339 * (v238 ^ 0xF160DFD5) - ((1068335030 * (v238 ^ 0xF160DFD5)) & 0x3CF390CA) + 511297637) >> 19);
  v122 = ((2 * v121) & 0xF7FB76F2 ^ 0x692) + (v121 ^ 0x7BFDB8B6);
  v123 = (((-314834944 * v114 - ((444071936 * v114) & 0x3CE00000) - 1636775281) ^ 0x9E70CA8F) & 0xFFFC0000 | (v115 >> 14)) ^ 0x13EBF;
  v124 = v120 - ((2 * v120) & 0x96AEC442) - 883465695;
  v125 = v123 - ((2 * v123) & 0x11F46DF8) + 150615804;
  v126 = v125 ^ v124 ^ (v117 + v122 - ((2 * (v117 + v122) + 679774482) & 0x2DF29056) - 1422160716) ^ 0x55541CF6;
  v127 = 1072965527 * v122 - ((1072189230 * v122 + 1055258946) & 0x38AD913A) + 1539949886;
  v128 = 1215363459 * (v125 ^ 0x8FA36FC) + 1647470460 - ((-1864240378 * (v125 ^ 0x8FA36FC)) & 0xC464CEFA);
  v129 = -794928128 * v122 - ((-1589856256 * v122 - 1746597888) & 0xC50CB000) - 1367810707;
  v130 = ((2053472256 * v126 - ((-188022784 * v126) & 0xF8770000) - 63196846) ^ 0xFC3BB152) & 0xFFFF8000 | ((21558475 * v126 - ((43116950 * v126) & 0xCE768D8C) + 1731937990) >> 17);
  v131 = ((2 * v130) & 0xB1677B4E ^ 0x630A) + (v130 ^ 0x58B38E3A);
  v132 = ((-629145600 * (v124 ^ 0xCB576221) - ((-1258291200 * (v124 ^ 0xCB576221)) & 0x9B000000) - 844655893) ^ 0xCDA792EB) & 0xFF800000 | ((-1710066763 * (v124 ^ 0xCB576221) - ((874833770 * (v124 ^ 0xCB576221)) & 0x42ECEDB2) - 1586071847) >> 9);
  v133 = ((2 * v132) & 0x1A5BAF6E ^ 0x12666) + (v132 ^ 0x8D7D6C8C);
  v134 = (v129 ^ 0xE286596D) & 0xFFFFFC00 | (v127 >> 22);
  v135 = v134 ^ 0x7EBF9D0C;
  v136 = (2 * v134) & 0xFD7F3EFA ^ 0x4E3;
  v137 = 380182225 * v131 - ((760364450 * v131 - 275566254) & 0xE13053E4) - 396246373;
  HIDWORD(v138) = ~(v115 >> 14);
  LODWORD(v138) = (v128 + 1) ^ 0x6232677C;
  v139 = ((2 * (v138 >> 1)) & 0xEFFFFB7E) + ((v138 >> 1) ^ 0x77FFFDBF);
  v140 = v135 + v136 - v139 - v133 - v131 - 89319386;
  v141 = -1457598208 * v131 - ((37593600 * v131 + 53563904) & 0xB188C00) + 1327820763;
  v142 = -1729065245 * v139 - ((836836806 * v139 - 1671161018) & 0xF327B44A) + 1204152264;
  v143 = ((389545984 * v140 - ((779091968 * v140 + 49283072) & 0x2C300000) + 2006201228) ^ 0x961C338C) & 0xFFF80000 | ((-687930649 * v140 - ((771622350 * v140 + 627046494) & 0x2B724FE0u) - 395762657) >> 13);
  v144 = ((2 * v143) & 0xFECEBDFA ^ 0x1992) + (v143 ^ 0x7F67F334);
  v145 = -973078528 * v139 - ((201326592 * v139 + 201326592) & 0x38000000) + 1658733507;
  v146 = ((2 * ((v141 ^ 0x858C46DB) & 0xFFFFFF00 | HIBYTE(v137))) & 0xBFFEE6BA ^ 0xA0)
       + (((v141 ^ 0x858C46DB) & 0xFFFFFF00 | HIBYTE(v137)) ^ 0xDFFF73AD);
  v147 = ((314966016 * v133 - ((629932032 * v133 - 1796472832) & 0x9BB40000) - 1739559286) ^ 0x4DDA6E8A) & 0xFFFE0000 | ((1900120419 * v133 - ((-494726458 * v133 - 1531229578) & 0xF0CBF1A4) - 893149683) >> 15);
  v148 = 522275959 * v146 - ((1044551918 * v146 - 804681846) & 0xED38DE9E) + 1587622676;
  v149 = ((v145 ^ 0x1CDE43C3) & 0xFE000000 | (v142 >> 7)) ^ 0x1F327B4;
  v150 = (v147 ^ 0xDF5F8FBC) + ((2 * v147) & 0xBEBEFEEE ^ 0xE086) - v146 - v144 - 529915072;
  v151 = v149 - ((2 * v149) & 0xF52CC0E6) - 90808205;
  v152 = v151 ^ 0x666478AB ^ (v150 - ((2 * v150 + 1060790086) & 0x39E431B0) + 1016023163);
  v153 = 1476017789 * v152 - ((-1342931718 * v152) & 0xFC950332) - 28671591;
  v154 = -948961280 * v146 - ((-1897922560 * v146 + 2023751680) & 0x94800000) - 2036939979;
  v155 = 2096758784 * v152 - ((-101449728 * v152) & 0xD7640000);
  v156 = ((2 * ((v154 ^ 0x4A46C335) & 0xFFF00000 | (v148 >> 12))) & 0xFEF3FDFE ^ 0x2D18C)
       + (((v154 ^ 0x4A46C335) & 0xFFF00000 | (v148 >> 12)) ^ 0xFF7E9739);
  v157 = (-48234496 * (v151 ^ 0xFA966073) - ((171966464 * (v151 ^ 0xFA966073)) & 0x8000000) + 69115292) ^ 0x41E9D9C | ((-1100636183 * (v151 ^ 0xFA966073) - ((2093694930 * (v151 ^ 0xFA966073)) & 0xEC46F3FA) + 1982036477) >> 11);
  v158 = ((-436207616 * v144 - ((1275068416 * v144 + 1677721600) & 0x66666666) + 1681593348) ^ 0xB23B1404 | ((-2121011469 * v144 - ((52944358 * v144 + 1553285042) & 0x581CDB7C) - 1705439849) >> 7)) ^ 0x1581CDB;
  v159 = v158 - ((2 * v158) & 0x217BE26) + 17555219;
  v160 = (v157 ^ 0xF7AF2A80) + ((2 * v157) & 0xEF43DDDE ^ 0x188DE) + 140382482 + (v159 ^ 0xFEF420EC);
  v161 = (v160 ^ 0x1D7F157F) + v156 + ((2 * v160) & 0x3AFE2AFE);
  v162 = (((v155 + 1806853736) ^ 0x6BB26668) & 0xFFFE0000 | (v153 >> 15)) ^ 0x1FC95;
  v163 = ((2 * (v156 + 8782082 + (v159 ^ 0xFEF420EC))) & 0xFCFF9AFE)
       + ((v156 + 8782082 + (v159 ^ 0xFEF420EC)) ^ 0xFE7FCD7F);
  v164 = v162 - ((2 * v162) & 0xA92F5A88) + 1419226436;
  v165 = (v161 - ((2 * v161 + 1175312132) & 0x41DF9304) - 2080983804) ^ v164;
  v166 = v164 ^ 0x5497AD44;
  v167 = ((2 * ((v164 ^ 0x5497AD44) + 2135976919 * v163 - 1625926313)) & 0x77FD7D60)
       + (((v164 ^ 0x5497AD44) + 2135976919 * v163 - 1625926313) ^ 0xBBFEBEB0);
  v168 = v165 ^ 0xD189EB75 ^ (v167 - ((2 * v167 + 2137205210) & 0x4BE31F66) - 1516034912);
  v169 = v168 - ((2 * v168 + 818194472) & 0xA80F6EE0) + 1818889092;
  LODWORD(a12) = v159;
  HIDWORD(v237) = v169 ^ v159;
  v170 = v169 ^ v159 ^ 0xD50C6863;
  v171 = 1810017955 * v170 - ((130374982 * v170) & 0x53D8792) - 2103524407;
  LODWORD(v239) = (v169 ^ 0xD407B770)
                + (v165 ^ 0xF47864C6)
                - ((2 * ((v169 ^ 0xD407B770) + (v165 ^ 0xF47864C6))) & 0x596FDE0)
                - 2100592912;
  LODWORD(v242) = v166 + (v169 ^ 0x2BF8488F) + 1 - ((2 * (v166 + (v169 ^ 0x2BF8488F) + 1)) & 0x30B987AA) - 1738751019;
  v172 = (((1744830464 * (v169 ^ 0xD407B770) - ((-805306368 * v169) & 0xA0000000) + 1465398309) ^ 0x57583425) & 0xF8000000 | ((773267245 * (v169 ^ 0xD407B770) - ((1546534490 * (v169 ^ 0xD407B770)) & 0xACB27B28) - 698794604) >> 5)) ^ 0x6B2C9EC;
  v173 = (((-731906048 * v170 - ((146800640 * v170) & 0x1E800000) - 1890805744) ^ 0x8F4C9810) & 0xFFE00000 | (v171 >> 11)) ^ 0x1053D8;
  v174 = v173 - 2 * (v173 & 0x3275A0C5 ^ (v171 >> 11) & 4);
  v175 = ((112596424 * (v242 ^ 0x985CC3D5) - ((225192848 * (v242 ^ 0x985CC3D5)) & 0x6E2F49F0) + 924296441) ^ 0x3717A4F9) & 0xFFFFFFF8 | ((550945465 * (v242 ^ 0x985CC3D5) - ((1101890930 * (v242 ^ 0x985CC3D5)) & 0x713CCFA2) - 1197578287) >> 29);
  v176 = ((2 * v175) & 0x75576CEE ^ 0xA) + (v175 ^ 0x3AABB672);
  v177 = ((633339904 * (v239 ^ 0x82CB7EF0) - ((1266679808 * (v239 ^ 0x82CB7EF0)) & 0x90800000) - 932105261) ^ 0xC87133D3) & 0xFFC00000 | ((879101079 * (v239 ^ 0x82CB7EF0) - ((1758202158 * (v239 ^ 0x82CB7EF0)) & 0xFBE6BD64) - 34382158) >> 10);
  v178 = ((2 * v177) & 0x96EEFBFA ^ 0x6EF9AA) + (v177 ^ 0xCB48012A);
  v179 = ((v172 - ((2 * v172) & 0x337D998) - 2120487732) ^ (v174 - 1300913983) ^ 0x33EE4C0D) + 984331890 - v176 + 5;
  v180 = (v179 ^ 0xDF3367BE) + v178 + ((2 * v179) & 0xBE66CF7C);
  v181 = (~(50331648 * v176 + 452984832) | 0xB7FFFFFF) + 25165824 * v176;
  v182 = (((-1107559936 * v178 - ((2079847424 * v178 - 36709376) & 0xD83D6000) + 1795595967) ^ 0x6C1EB0BF) & 0xFFFFFE00 | ((-1931543043 * v178 - ((431881210 * v178 + 201254894) & 0x14D5107E) + 1080687670) >> 23)) ^ 0x14;
  v183 = v182 - ((2 * v182) & 0x4DCB3D2E);
  v184 = ((-1376911360 * ((v174 - 1300913983) ^ 0xB275A0C1)
         - ((1541144576 * ((v174 - 1300913983) ^ 0xB275A0C1)) & 0xC09C0000)
         - 531666505) ^ 0xE04F69B7) & 0xFFFE0000 | ((-298690825 * ((v174 - 1300913983) ^ 0xB275A0C1)
                                                   - ((1550101998 * ((v174 - 1300913983) ^ 0xB275A0C1)) & 0x5E3EE784)
                                                   - 1356893246) >> 15);
  v185 = ((2 * v184) & 0xFD97FD26 ^ 0x2BC24) + (v184 ^ 0x7ECAA0AD);
  v186 = ((-2124889280 * v180 - ((45188736 * v180 - 368951168) & 0xF4FCD480) + 1870629505) ^ 0x7A7E6A41) & 0xFFFFFFC0 | ((973431565 * (v180 - 1380007984) - ((1946863130 * (v180 - 1380007984) - 607277598) & 0xE7FB976E) - 505109848) >> 26);
  v187 = ((2 * v186) & 0xFE6D9D5E ^ 0x58) + (v186 ^ 0x7F36CE93);
  v188 = ((1124467203 * v176 - ((-2046032890 * v176 + 428596534) & 0xB6A25166) + 1746343758) >> 9) ^ 0x6DA894;
  v189 = v185 + v187 - ((2 * (v185 + v187) + 66741628) & 0x1ED800F0) - 1855376586;
  v190 = v183 - 1494901097;
  v191 = (v183 - 1494901097) ^ 0xA6E59E97;
  v192 = (v188 | (v181 + 1907684568) ^ 0x2434F4D7)
       - 2 * ((v188 | (v181 + 1907684568) ^ 0x2434F4D7) & 0x251A819F ^ v188 & 0x17)
       - 1524989560;
  v193 = v192 ^ 0xA51A8188;
  v194 = -1207959552 * (v192 ^ 0xA51A8188) - ((-268435456 * v192) & 0x40000000);
  v195 = v190 ^ v192 ^ 0x8C931F67 ^ v189;
  v196 = ((1963065344 * v187 - ((-368836608 * v187 - 817627136) & 0xCB500000) - 850663611) ^ 0x65A9E745) & 0xFFFE0000 | ((-690701695 * v187 - ((-1381403390 * v187 + 1083533218) & 0xF3966B62) - 1709839998) >> 15);
  v197 = ((2 * v196) & 0xEEEFFFE8 ^ 0x3E728) + (v196 ^ 0x77760C62);
  v198 = ((v194 + 552428860) ^ 0x20ED653C) & 0xF8000000 | ((65312375 * v193
                                                          - ((130624750 * v193) & 0xDE1D2318)
                                                          - 284257908) >> 5);
  v199 = v198 ^ 0xEABD2B22;
  v200 = (2 * v198) & 0xDB8ABF5C ^ 0xA80A918;
  v201 = 188298539 * v197 - 2 * ((188298539 * v197 + 495353348) & 0x1BDD9047 ^ (188298539 * v197) & 3) - 1184625080;
  v202 = ((705111040 * v195 - ((336480256 * v195) & 0x1B8FE000) + 231207757) ^ 0xDC7F34D) & 0xFFFFFC00 | ((986350025 * v195 - ((1972700050 * v195) & 0xFD5C5A8A) - 22139579) >> 22);
  v203 = ((2 * v202) & 0xEBBFFD8E ^ 0x584) + (v202 ^ 0xF5DFFD3D);
  v204 = (((1014923264 * v191 - ((2029846528 * v191) & 0x52080000) + 688137577) ^ 0x29042569) & 0xFFFF8000 | ((-1559987971 * v191 - ((1174991354 * v191) & 0xA0ADE2BC) + 1347875166) >> 17)) ^ 0x282B;
  v205 = v199
       + v200
       + v197
       - v203
       - 77814348
       - ((2 * (v199 + v200 + v197 - v203 - 77814348) + 713814754) & 0x243324B2)
       + 660573130;
  v206 = 1296744448 * v197 - ((446005248 * v197 + 1057095680) & 0x28520000) + 866790773;
  v207 = v204 - ((2 * v204) & 0xFC0AA19C) - 33206066;
  v208 = v207 ^ 0x6C1CC297 ^ v205;
  v209 = ((v206 ^ 0x94292D75) & 0xFFFFC000 | (v201 >> 18)) ^ 0x6F7;
  v210 = ((821788416 * (v207 ^ 0xFE0550CE) - ((1643576832 * (v207 ^ 0xFE0550CE)) & 0x4FC00200) + 668991752) ^ 0x27E00108) & 0xFFFFFF00 | ((875625343 * (v207 ^ 0xFE0550CE) - ((1751250686 * (v207 ^ 0xFE0550CE)) & 0x7336C0B2) + 966484057) >> 24);
  v211 = (((-1723287504 * v203 - ((848392288 * v203 - 1613601440) & 0x9AB074A0) - 1656656632) ^ 0x4D583A58) & 0xFFFFFFF0 | ((-1181447293 * v203 - ((858330886 * v203 + 704456278) & 0x3B4B3752) + 312749780) >> 28)) ^ 9;
  v212 = (((1342177280 * v208 - ((-1610612736 * v208) & 0xC0000000) - 377675876) ^ 0xE97D1F9C) & 0xF0000000 | ((-1193894635 * v208 - ((1907178026 * v208) & 0x5C058E46u) + 771933987) >> 4)) ^ 0x2E02C72;
  v213 = v211 - ((2 * v211) & 0x7805C170) + 1006821560;
  v214 = v213 ^ 0x3C02E0B8;
  v215 = (v210 ^ 0xDF6FFFD4) + ((2 * v210) & 0xBEDFFFDA ^ 0x52) + 546308115 + (v213 ^ 0x3C02E0B8);
  v216 = v209 - ((2 * v209) & 0x7F4D6B88) - 1079593532;
  v217 = v212 - ((2 * v212) & 0xE71753A8) - 208950828;
  v218 = (v215 ^ 0xBEF7DDBD)
       + ((2 * v215) & 0x7DEFBB7A)
       + (((v217 ^ 0xF38BA9D4) + (v216 ^ 0xBFA6B5C4)) ^ 0x90124109)
       - ((2 * ((v217 ^ 0xF38BA9D4) + (v216 ^ 0xBFA6B5C4))) & 0xDFDB7DEC)
       + 1;
  v219 = v218 - ((2 * v218 + 1642840690) & 0xA18544F4) - 2118614093;
  v220 = ((1461042146 * (v216 ^ 0x83A4557C ^ v213)) & 0xCEFBB7FE)
       + ((730521073 * (v216 ^ 0x83A4557C ^ v213)) ^ 0x677DDBFF)
       - 1736301567
       + (v217 ^ 0xF38BA9D4);
  v221 = (v220 - ((2 * v220) & 0x3DA7B956) + 517201067) ^ 0x42DAF7A5 ^ v219;
  v222 = v221 - ((2 * v221 + 51659550) & 0x496D7E0) + 265653631;
  v223 = 2
       * (((v222 ^ 0x24B6BF0) & (v219 ^ 0xD0C2A27A)) - ((2 * ((v222 ^ 0x24B6BF0) & (v219 ^ 0xD0C2A27A))) & 0x74F5B7AC))
       - 185223252;
  v244 = (v222 ^ 0x24B6BF0) + v214 - ((2 * ((v222 ^ 0x24B6BF0) + v214)) & 0x9897CE22) + 1280042769;
  v224 = (v219 ^ 0xD289C98A ^ v222) + (v223 ^ 0x6B7A7B30) + 1617965924 + ((2 * v223) & 0x3F1F9938 ^ 0x290B0918);
  *(_DWORD *)(v47 - 240) = v224 - ((2 * v224) & 0x2DA6F382) - 1764525631;
  v225 = *(_DWORD *)(v47 - 232) + 402887561;
  HIDWORD(v238) = v222 ^ a34;
  v226 = ((v222 ^ a34 ^ 0xB1FBFE03)
        - 420371833
        - ((2 * (v222 ^ a34 ^ 0xB1FBFE03) + 1900277970) & 0x5C9F543C)
        + v225
        - 994) ^ 0xB1FBFE03;
  v227 = (v226 - ((2 * v226 + 1900277970) & 0x5C9F543C) - 420371833) ^ 0xB1FBFE03;
  v228 = *(_DWORD *)(v47 - 228);
  LODWORD(v241) = v228 ^ 0xE1ACC49;
  LODWORD(a16) = v228 ^ 0x811C618F;
  v229 = ((v227 - ((2 * v227 + 1900277970) & 0x5C9F543C) - 420371833) ^ 0xAE4FAA1E) + (v228 ^ 0x811C618F);
  *(_DWORD *)(v47 - 228) = HIBYTE(a33) ^ 0x5827C53F;
  LODWORD(v243) = v169;
  *(_DWORD *)(v47 - 232) = HIBYTE(v169) ^ 0xEB3C2B48;
  v230 = -1095231619
       * ((((((2 * v229) & 0xDEF9FFAC) + (v229 ^ 0xEF7CFFD6)) & 0xFFFFFFFE)
         - ((2 * (((2 * v229) & 0xDEF9FFAC) + (v229 ^ 0xEF7CFFD6)) + 17170516) & 0x15B7F9E0)
         + 459210011) ^ 0x15D264D8);
  LODWORD(v237) = a31 + 19;
  HIDWORD(v242) = v222;
  LODWORD(a15) = v222 ^ v217;
  v231 = *(unsigned int *)(v47 - 240);
  v232 = (v230 - ((v230 << ((v225 - 74) ^ 0x99)) & 0x376231AC) + 464591062) ^ *(_DWORD *)(v47 - 224);
  v233 = -1117768823 - (v232 & 0x15 ^ 0x42A1881D | 0xBD603389) + (v232 & 0x15 ^ 0x42A1881D | 0x429FCC76);
  v234 = (((2 * (v232 & 0xEA ^ 0xF1412784)) & 0xC00044DC) - (v232 & 0xEA ^ 0xF1412784) + 424906113) ^ 0xEC96AA6F;
  v235 = (((2 * v234) & 0x84C) - v234 + 1154796504) ^ 0x4050CB58 | v233 ^ 0x3E446E;
  *(_DWORD *)(*(_QWORD *)(v47 - 216)
            + 4 * ((v230 - (((_BYTE)v230 << ((v225 - 74) ^ 0x99)) & 0xAC) - 42) ^ 0xD6u)) = a40 ^ a29 ^ a32 ^ v97 ^ v245 ^ *(_DWORD *)(v47 - 208) ^ v217 ^ v244 ^ v231 ^ 0xE5A6F535 ^ dword_100228F30[*(_DWORD *)(v47 - 232) ^ *(_DWORD *)(v47 - 228) ^ 0x3EB1427 ^ (v235 - ((2 * v235) & 0x61E1F410) - 1326384632)];
  return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*(&off_100260750 + v225))(v231, v217, 1117768822, 4047579012, 3221243100, 424906113, 3969297007, 2124, a9, v237, v238, a12, a13, v239, a15, a16, v240, v241, v242,
           v243,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31);
}

void sub_1001E6B14()
{
  JUMPOUT(0x1001E6A10);
}

uint64_t sub_1001E6B20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  int v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v30 = malloc(0x408uLL);
  return ((uint64_t (*)(void *, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*(&off_100260750 + ((((((v29 - 64) | 0x104) + 665) ^ 0x3D6) * (v30 == 0)) | v29)))(v30, 0, v31, v32, v33, v34, 0, 0, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29);
}

uint64_t sub_1001E6B84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, int a19, int a20,int a21,int a22,int a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,int a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,int a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,int a41,unsigned __int8 a42)
{
  int v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  unsigned __int8 v46;
  int v47;
  unsigned int v48;
  unsigned int v49;
  int v50;

  v45 = ((a36 ^ *(_DWORD *)(v44 - 240) ^ 0xFF70EBE9)
       - ((2 * (a36 ^ *(_DWORD *)(v44 - 240) ^ 0xFF70EBE9) + 2126621732) & 0x7D67C480)
       + 2115287122) ^ 0xFB14B186;
  LOBYTE(v45) = ((v45 - ((2 * v45 + 36) & 0x80) + 82) ^ 0x40) + (a33 ^ 0x86);
  LOBYTE(v45) = (v45 ^ 0x5F) - 95 + ((2 * v45) & 0xBE);
  HIDWORD(a9) = a22 ^ a23;
  v46 = 0x80 - -95 * (((v45 & 0xFE) - ((2 * v45) & 0xD0) + 104) ^ 0x55);
  v47 = ((unsigned __int16)(a22 ^ a23) >> 8) ^ 0x61 ^ a42 ^ v46;
  v48 = (((((((unsigned __int16)(a22 ^ a23) >> 8) ^ 0x61 ^ a42 ^ v46) & 0x20) + (v47 ^ 0xE2)) | 0xDDAFB800)
       - ((v47 ^ 0xE2) & 0x20)) ^ 0xF1A7BA24;
  v49 = ((((2 * ((v42 + 348) ^ 0x18AB584 ^ v47)) & 0x20001CA) - ((v42 + 348) ^ 0x18AB584 ^ v47) + 1993077018) ^ 0xDE1CC6D0)
      + 1;
  v50 = (v49 ^ 0x77343FFF)
      + ((2 * v49) & 0x6E287FFE)
      + dword_1002240B0[(((2 * v48) & 0x40000072) - v48 - 819257402) ^ 0xE3231D31];
  *(_DWORD *)(a1 + 4 * (v46 ^ 0x80u)) = a31 ^ a19 ^ a20 ^ 0x1AFEE87A ^ (v50
                                                                        - ((2 * v50 + 557565942) & 0x2898E628)
                                                                        + 82466575);
  return ((uint64_t (*)(uint64_t, uint64_t, _DWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 + 8 * v42) - 12))(3475709894, 3810729265, dword_1002240B0, 3726427856, 1999912959, 1848147966, 557565942, 681109032, a9);
}

void sub_1001E6DD4()
{
  JUMPOUT(0x1001E6D24);
}

uint64_t sub_1001E6DE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  int v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v32 = malloc(0x408uLL);
  return ((uint64_t (*)(void *, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 + 8 * ((201 * (v32 != 0)) ^ v29)) - ((((v29 - 1017) | 4u) + 506) ^ (v29 - 511))))(v32, 0, v33, v34, v35, v36, 0, 0, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           v31,
           a29);
}

uint64_t sub_1001E6E44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, int a19, char a20,unsigned int a21,int a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,int a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,int a34,int a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,int a43)
{
  int v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  char v47;
  char v48;
  char v49;
  char v50;
  char v51;
  char v52;
  char v53;
  char v54;
  char v55;
  char v56;
  char v57;
  char v58;
  char v59;

  v46 = (((2 * ((v43 - 8) ^ 0x4A)) | 0xC8) - ((v43 - 8) ^ 0x4A) + 28) ^ 0xA3;
  v47 = (((2 * (a20 & 0x22 ^ 0x20)) | 0x48) - (a20 & 0x22 ^ 0x20) - 36) ^ 0x24;
  v48 = (v47 - ((2 * v47) & 0xA4) + 83) ^ ((v46 | 0xF4) - (v46 | 0xB) + 11) ^ 0xE0 | ((a20 & 0x45 ^ 7)
                                                                                    + (a20 & 0x98 ^ 0x99)
                                                                                    - 1) ^ 0x4F;
  v49 = v48 - ((2 * v48) & 0x7A) - 67;
  v50 = ((2 * v49) ^ 0xAE) - 2 * (((2 * v49) ^ 0xAE) & 0x58 ^ (2 * v49) & 0x10) + 72;
  v51 = (v50 & 0xFE ^ 0xAF)
      + (((v49 ^ 0x57) - 2 * ((v49 ^ 0x57) & 0xFD ^ v49 & 8) - 11) ^ 0xA)
      + ((2 * v50) & 0xCC ^ 0x80);
  v52 = v51 + 25 - ((2 * (v51 + 25)) & 0x7A) - 67;
  v53 = ((2 * v52) ^ 0xAE) - 2 * (((2 * v52) ^ 0xAE) & 0x58 ^ (2 * v52) & 0x10) + 72;
  v54 = (v53 & 0xFE ^ 0xAF)
      + (((v52 ^ 0x57) - 2 * ((v52 ^ 0x57) & 0xFD ^ v52 & 8) - 11) ^ 0xA)
      + ((2 * v53) & 0xCC ^ 0x80)
      + 25;
  v55 = v54 - ((2 * v54) & 0x7A) - 67;
  v56 = ((2 * v55) ^ 0xAE) - 2 * (((2 * v55) ^ 0xAE) & 0x58 ^ (2 * v55) & 0x10) + 72;
  v57 = (v56 & 0xFE ^ 0xAF)
      + (((v55 ^ 0x57) - 2 * ((v55 ^ 0x57) & 0xFD ^ v55 & 8) - 11) ^ 0xA)
      + ((2 * v56) & 0xCC ^ 0x80)
      + 25;
  v58 = ((v57 - ((2 * v57) & 0x7A) - 67) ^ 0xBD) + a16;
  v59 = (((((2 * v58) & 0x4C) + (v58 ^ 0x26)) & 0xFE) - ((2 * (((2 * v58) & 0x4C) + (v58 ^ 0x26)) - 76) & 0x88) + 30) ^ 0xB7;
  *(_DWORD *)(a1 + 4 * ((-13 - 29 * v59 - ((-58 * v59) & 0xE6)) ^ 0xF3u)) = a43 ^ a28 ^ *(_DWORD *)(v45 - 240) ^ (v43 - 1121606899) ^ dword_100216D40[((-13 - 29 * v59 - ((-58 * v59) & 0xE6)) ^ ((a22 ^ a35 ^ a21) >> 16) ^ 4) ^ 0xE6];
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v44 + 8 * ((v43 - 8) ^ 0x18)) - 4))(243);
}

void sub_1001E72AC()
{
  JUMPOUT(0x1001E7264);
}

uint64_t sub_1001E72BC@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v22;
  int v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v23 = a1 - 655;
  v24 = malloc(0x404uLL);
  return (*(uint64_t (**)(void *, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 8 * ((1286 * (v24 != 0)) ^ v23)))(v24, 0, v25, v26, v27, v28, 0, 0, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12,
           a13,
           a14,
           a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22);
}

uint64_t sub_1001E7320(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,int a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,int a39,char a40)
{
  int v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  char v46;
  char v47;
  char v48;
  char v49;

  *(_QWORD *)(v44 - 240) = v42;
  v45 = ((a20 ^ a26 ^ 0x58) - ((2 * (a20 ^ a26 ^ 0x58) + 126) & 0xAE) - 106) ^ 0x10;
  v46 = (v45 - ((2 * v45 + 126) & 0xAE) - 106) ^ 0x10;
  v47 = (v46 - ((2 * v46 + 126) & 0xAE) - 106) & 0xFE ^ 0x64;
  v48 = (((2 * v47) & 0xD4) - v47 - 107) ^ 0xE6;
  v49 = -22 * v48;
  *(_DWORD *)(a1 + 4 * ((-70 - 11 * v48 - (v49 & (v40 - 63))) ^ 0xBAu)) = a33 ^ *(_DWORD *)(v44 - 208) ^ a15 ^ 0xE75DDD9C ^ dword_10021E390[(((2 * ((v41 ^ a40 ^ (-70 - 11 * v48 - (v49 & (v40 - 63)))) ^ 0x480541AF)) & 0x8262) - ((v41 ^ a40 ^ (-70 - 11 * v48 - (v49 & (v40 - 63)))) ^ 0x480541AF) + 1750572750) ^ 0x2052DFF2];
  return ((uint64_t (*)(uint64_t, _DWORD *, uint64_t, uint64_t))(*(_QWORD *)(v43 + 8 * v40) - 12))(542302194, dword_10021E390, 3881688476, 186);
}

void sub_1001E74B0()
{
  JUMPOUT(0x1001E744CLL);
}

uint64_t sub_1001E74C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  int v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v31 = malloc(0x404uLL);
  return (*(uint64_t (**)(void *, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 8 * ((((((v29 + 69) ^ (v31 == 0)) & 1) == 0) * (v29 + 205)) ^ v29)))(v31, 0, v32, v33, v34, v35, 0, 0, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29);
}

uint64_t sub_1001E7520(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned int a12, int a13, int a14, unsigned int a15, int a16, unsigned int a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,int a35,int a36,int a37,int a38,int a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
  int v46;
  uint64_t v47;
  uint64_t v48;
  char v50;
  char v51;
  char v52;
  char v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v50 = ((a34 ^ a46 ^ 0x4D) + 56 + (~(2 * (a34 ^ a46 ^ 0x4D) - 68) | 0x4D)) ^ 0x83;
  v51 = (v50 + 56 + (~(2 * v50 - 68) | 0x4D)) ^ 0x83;
  v52 = ((v51 + 56 + (~(2 * v51 - 68) | 0x4D)) ^ 0x59) + a28;
  v53 = (v52 ^ 0x67) - 103 + ((2 * v52) & 0xCE);
  v54 = *(_DWORD *)(v48 - 232) ^ *(_DWORD *)(v48 - 228) ^ *(_DWORD *)(v48 - 224) ^ (0x80 - -89 * (((v53 & 0xFE) - ((2 * v53) & 0x98) + 76) ^ 0x8B));
  v55 = dword_100228230[v54 ^ 0x95C7D49B];
  v56 = a16 ^ a22 ^ (v46 + 317) ^ 0x3BDu;
  v57 = a27 ^ a39 ^ a36 ^ a35 ^ a15 ^ a17 ^ a12 ^ v56;
  v58 = v57 ^ v54 ^ 0x55F27BB2 ^ v55;
  *(_DWORD *)(a1 + 4 * ((0x80 - -89 * (((v53 & 0xFE) - ((2 * v53) & 0x98) + 76) ^ 0x8B)) ^ 0x80u)) = v58;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(v47 + 8 * (v46 + 317)) - 12))(v58, v55, v57, v56, a1, a15, a17, a12);
}

void sub_1001E76C8()
{
  JUMPOUT(0x1001E7660);
}

uint64_t sub_1001E76D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  int v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v31 = malloc(0x404uLL);
  return ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 + 8 * (((v31 != 0) * ((v29 - 233) ^ (v29 - 169) ^ 0x128)) ^ v29)) - 8))(v31, a5, v32, v33, v34, v35, 0, 0, a9, a10, a11, a5, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29);
}

uint64_t sub_1001E7734(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, char a12, uint64_t a13, uint64_t a14, int a15, int a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25,uint64_t a26,int a27)
{
  char v27;
  int v28;
  uint64_t v29;
  char v30;
  char v31;
  char v32;
  char v33;
  char v34;
  int v35;
  char v36;
  int v37;
  unsigned int v38;
  unsigned int v39;

  *(_QWORD *)(v29 - 208) = a1;
  v30 = ((a12 ^ 0xE9) - 2 * (((a12 ^ 0xE9) - 42) & 0x1F ^ (a12 ^ 0xE9) & 1) - 12) ^ 0xE9;
  v31 = (v30 - 2 * ((v30 - 42) & 0x1F ^ v30 & 1) - 12) ^ 0xE9;
  *(_DWORD *)(v29 - 228) = a27 ^ 0x681E07EF;
  v32 = ((v31 - 2 * ((v31 - 42) & 0x1F ^ v31 & 1) - 12) ^ 0x1E) + (a27 ^ 0xEF);
  v33 = (v32 ^ 0xFB) + 5 + ((2 * v32) & 0xF6);
  v34 = ((v33 & 0xFE) - ((2 * v33) & 0x7C) + 62) ^ 0xB1;
  v35 = 270 * (v28 ^ 0x199);
  *(_DWORD *)(v29 - 224) = v35;
  v36 = v35 ^ 0xC9;
  v37 = (((v36 - 30) * v34 - ((2 * (v36 - 30) * v34) & 0x9A) + 77) ^ v27);
  v38 = (-1195836327 - (v37 ^ 0x29 | 0xB8B8FC59) + (v37 ^ 0x29 | 0x474703A6)) ^ 0x7530AA2;
  v39 = ((v37 ^ 0x46) - ((2 * (v37 ^ 0x46)) & 0xFFFFFF8F) + 973793991) ^ 0x88C478E7;
  *(_DWORD *)(*(_QWORD *)(v29 - 208)
            + 4 * (((v36 - 30) * v34 - ((2 * (v36 - 30) * v34) & 0x9A) + 77) ^ 0x4Du)) = a25 ^ a16 ^ a15 ^ (((2 * v38) | 0x7C5FC0EE) - v38 - 1043325047) ^ 0xF46C6443 ^ dword_100227D30[(v39 - ((2 * v39) & 0x61842486) + 1020418627) ^ 0x8E1CC89D];
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _DWORD *))((char *)*(&off_100260750 + v28) - 8))(2086650094, 3251642249, 70, 973793991, 2294577383, 1636050054, 1020418627, dword_100227D30);
}

void sub_1001E799C()
{
  JUMPOUT(0x1001E78ECLL);
}

uint64_t sub_1001E79A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  uint64_t v29;
  int v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v30 = *(_DWORD *)(v29 - 224);
  v31 = malloc(0x404uLL);
  return ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)*(&off_100260750 + ((23 * (v31 == 0)) ^ v30)) + -(unint64_t)(v30 - 1002) - (v30 ^ 0x1Eu) + 1712))(v31, a12, v32, v33, v34, v35, 0, 0, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29);
}

uint64_t sub_1001E7A0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, char a10, uint64_t a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25,char a26,__int16 a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,int a32,uint64_t a33,uint64_t a34,int a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,int a43)
{
  int v43;
  uint64_t v44;
  char v45;
  char v46;
  char v47;
  char v48;
  unsigned int v49;

  v45 = (((a28 ^ a16 ^ 0x1F) - ((2 * (a28 ^ a16 ^ 0x1F) - 78) & 0xFA) - 42) ^ 0xFD) + a26;
  v46 = ((v45 & 0xFE) + 122 - ((2 * v45) & 0x98) - 45) ^ 0x6E;
  v47 = -37 * v46 - 30;
  v48 = -74 * v46;
  v49 = dword_100215AB0[(v43 + 12) ^ 0x5A6 ^ ((v47 - (v48 & 0xC4)) ^ a10 ^ a36)]
      + (((v47 - (v48 & 0xC4)) ^ a10 ^ a36) ^ 0xD472026D)
      - 217264802;
  *(_DWORD *)(a1 + 4 * ((v47 - (v48 & 0xC4)) ^ 0xE2u)) = a32 ^ a12 ^ a43 ^ 0x8E7A6C13 ^ (v49 - ((2 * v49) & 0xB5682D2A) - 625731947);
  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v44 + 8 * v43) - 4))(3043503402, 3669235349);
}

void sub_1001E7BAC()
{
  JUMPOUT(0x1001E7B48);
}

uint64_t sub_1001E7BBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  int v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v31 = malloc(0x404uLL);
  return ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 + 8 * ((235 * (v31 != 0)) ^ v29)) - (((v29 + 252) | 0x91u) ^ 0x6FDLL)))(v31, a12, v32, v33, v34, v35, 0, a8, a9, a10, a11, a12, a13, a14, a8, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29);
}

uint64_t sub_1001E7C20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, unsigned __int8 a10, int a11, int a12, int a13, int a14, uint64_t a15, int a16, int a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,unsigned __int8 a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,int a35)
{
  int v35;
  char v36;
  uint64_t v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  unsigned int v48;
  unsigned int v49;
  int v50;

  *(_QWORD *)(v37 - 224) = a1;
  v38 = ((a14 ^ 0x8DAE91B0) - 2 * (((a14 ^ 0x8DAE91B0) + 991077342) & 0x2E4FAA1F ^ a14 & 1) + 1768050172) ^ 0x8DAE91B0;
  v39 = ((v38 - 2 * ((v38 + 991077342) & 0x2E4FAA1F ^ a14 & 1) + 1768050172) ^ 0xAE4FAA1E) + *(_DWORD *)(v37 - 228);
  LOBYTE(v39) = (v39 ^ 0x3F) - 63 + ((2 * v39) & 0x7E);
  LOBYTE(v39) = ((v39 & 0xFE) - ((2 * v39) & 0xC0) - 32) ^ 0x93;
  v40 = (((v36 & 0x7C ^ 0x36C447B) - 1) & 0x304447C | v36 & 0x80) ^ 0x30444F0 | (((2 * ((a10 ^ a25) & 3 ^ 0x6A06020A)) & 0x40C0004)
                                                                               - ((a10 ^ a25) & 3 ^ 0x6A06020A)
                                                                               - 333849799) ^ 0x861FD933;
  v41 = v40 - ((2 * v40) & 0x4480095E) - 1572690513;
  v42 = ((18 - a11) & 0x20000000 ^ 0x75DFFE77) + 2 * ((18 - a11) & 0x20000000);
  v43 = v42 - 1615610898;
  v44 = v42 - 1977613943;
  v45 = -1955350308 - v42;
  v46 = (57 * v39 + ((v35 + 66) ^ 0xAA) - ((114 * v39) & 0x32));
  v47 = dword_10021C410[v41 ^ 0xA242A5F8 ^ v46];
  v48 = v47 - ((2 * v47 + 314516916) & 0xF69D5E5C) + 78529032;
  v49 = a12 ^ a17 ^ v48 ^ (((8 * v48) ^ 0xDA757970)
                         + 1530482247
                         - 2 * (((8 * v48) ^ 0xDA757970) & 0x5B394E48 ^ (8 * v48) & 8));
  if ((v44 & ~v49) != 0)
    v50 = v45;
  else
    v50 = v43;
  *(_DWORD *)(*(_QWORD *)(v37 - 224) + 4 * (v46 ^ 0x99u)) = ((a35 & 0xDFFFFFFF ^ 0xFA984FF)
                                                             + (a35 & 0xC85EC106 ^ 0xE0564100)
                                                             - ((a35 & 0xDFFFFFFF ^ 0xFA984FF) & 0xC85EC106)) ^ 0x866482E8 ^ ((v49 ^ 0xFA0B09DD) - 362003045 + v50 - ((2 * ((v49 ^ 0xFA0B09DD) - 362003045 + v50)) & 0x35FE7028) - 1694549996);
  return ((uint64_t (*)(uint64_t))((char *)*(&off_100260750 + v35) - 12))(1530482247);
}

void sub_1001E7F3C()
{
  JUMPOUT(0x1001E7E88);
}

uint64_t sub_1001E7F4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  int v32;
  uint64_t v33;
  int v34;
  unint64_t v35;
  int v36;
  unsigned __int8 *v37;
  int v38;
  unsigned int v39;
  unsigned int v40;
  int v41;
  unsigned int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  unsigned int v48;
  unsigned int v49;
  int v50;
  unsigned int v51;
  unsigned int v52;
  __int16 v53;
  int v54;
  int v55;
  unsigned int v56;
  int v57;
  uint64_t v58;
  int v59;
  unsigned __int8 *v60;
  unsigned int v61;
  unsigned int v62;
  unsigned int v63;
  int v64;
  int v65;
  int v66;
  char v67;
  int v68;
  unsigned int v69;
  int v70;
  int v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int v76;
  int v77;
  int v78;
  unsigned int v79;
  int v80;
  unsigned int v81;
  int v82;
  int v83;
  unsigned int v84;
  int v85;
  int v86;
  unsigned int v87;
  unsigned int v88;
  int v89;
  unsigned int v90;
  unsigned int v91;
  unsigned int v92;
  int v93;
  unsigned int v94;
  unsigned int v95;
  unsigned int v96;
  unsigned int v97;
  unsigned int v98;
  unsigned int v99;
  int v100;
  unsigned int v101;
  int v102;
  unsigned int v103;
  unsigned int v104;
  unsigned int v105;
  unsigned int v106;
  uint64_t v107;
  uint64_t v108;
  unsigned int v109;
  int v110;
  unsigned int v111;
  unsigned int v112;
  int v113;
  int v114;
  unsigned int v115;
  int v116;
  unsigned int v117;
  int v118;
  unsigned int v119;
  unsigned int v120;
  unsigned int v121;
  unsigned int v122;
  int v123;
  unsigned int v124;
  unsigned int v125;
  unsigned int v126;
  unsigned int v127;
  int v128;
  unsigned int v129;
  unsigned int v130;
  unsigned int v131;
  int v132;
  unsigned int v133;
  int v134;
  unsigned int v135;
  unsigned int v136;
  unsigned int v137;
  unsigned int v138;
  unsigned int v139;
  int v140;
  unsigned int v141;
  int v142;
  unsigned int v143;
  unsigned int v144;
  unsigned int v145;
  unsigned int v146;
  int v147;
  unsigned int v148;
  int v149;
  int v150;
  int v151;
  unsigned int v152;
  unsigned int v153;
  unsigned int v154;
  int v155;
  int v156;
  int v157;
  unsigned int v158;
  int v159;
  unsigned int v160;
  int v161;
  int v162;
  unsigned int v163;
  unsigned int v164;
  unsigned int v165;
  int v166;
  unsigned int v167;
  unsigned int v168;
  int v169;
  int v170;
  unsigned int v171;
  int v172;
  int v173;
  int v174;
  unsigned int v175;
  unsigned int v176;
  unsigned int v177;
  unsigned int v178;
  unsigned int v179;
  int v180;
  int v181;
  unsigned int v182;
  int v183;
  int v184;
  unsigned int v185;
  unsigned int v186;
  unsigned int v187;
  int v188;
  unsigned int v189;
  int v190;
  unsigned int v191;
  unsigned int v192;
  unsigned int v193;
  int v194;
  int v195;
  int v196;
  unsigned int v197;
  unsigned int v198;
  int v199;
  int v200;
  int v201;
  int v202;
  int v203;
  unsigned int v204;
  int v205;
  int v206;
  int v207;
  unsigned int v208;
  unsigned int v209;
  unsigned int v210;
  int v211;
  int v212;
  unsigned int v213;
  int v214;
  unsigned int v215;
  int v216;
  unsigned int v217;
  unsigned int v218;
  unsigned int v219;
  int v220;
  unsigned int v221;
  int v222;
  int v223;
  int v224;
  int v225;
  unint64_t v226;
  int v227;
  unsigned int v228;
  unsigned int v229;
  unsigned int v230;
  unsigned int v231;
  unsigned int v232;
  int v233;
  unsigned int v234;
  unsigned int v235;
  unsigned int v236;
  int v237;
  unsigned int v238;
  int v239;
  int v240;
  int v241;
  int v242;
  unsigned int v243;
  unsigned int v244;
  int v245;
  BOOL v246;
  int v247;
  int v248;
  unsigned int v249;
  int v250;
  unsigned int v251;
  int v252;
  unint64_t v253;
  int v254;
  unsigned int v255;
  unsigned int v256;
  unsigned int v257;
  int v258;
  int v259;
  int v260;
  int v261;
  int v262;
  unsigned int v263;
  int v264;
  unint64_t v265;
  unsigned int v266;
  int v267;
  unsigned int v268;
  unsigned int v269;
  unsigned int v270;
  unsigned int v271;
  unsigned int v272;
  unsigned int v273;
  int v274;
  int v275;
  int v276;
  unsigned int v277;
  int v278;
  int v279;
  unsigned int v280;
  unsigned int v281;
  unsigned int v282;
  int v283;
  int v284;
  int v285;
  int v286;
  unsigned int v287;
  unsigned int v288;
  unsigned int v289;
  unsigned int v290;
  unsigned int v291;
  unsigned int v292;
  unsigned int v293;
  unsigned int v294;
  unsigned int v295;
  uint64_t v296;
  unsigned int v297;
  unsigned int v298;
  uint64_t v299;
  int v300;
  int v301;
  int v302;
  int v303;
  unsigned int v304;
  unsigned int v305;
  unsigned int v306;
  int v307;
  unsigned int v308;
  int v309;
  unsigned int v310;
  unsigned int v311;
  int v312;
  _BYTE *v313;
  int v314;
  int v315;
  int v316;
  char v317;
  char v318;
  int v319;
  __int16 v320;
  unsigned int v321;
  unsigned int v322;
  unsigned int v323;
  unsigned int v324;
  unint64_t v325;
  int v326;
  unsigned int v327;
  unsigned int v328;
  unsigned int v329;
  int v330;
  unsigned int v331;
  int v332;
  int v333;
  unsigned int v334;
  uint64_t v335;
  int v336;
  unsigned int v337;
  int v338;
  uint64_t v340;
  uint64_t v341;
  int v342;
  __int128 v343;

  v34 = (v32 - 1295) | 0x298;
  HIDWORD(v35) = HIDWORD(a32) ^ 0x82C78;
  LODWORD(v35) = HIDWORD(a32) ^ 0x84F00000;
  *(_DWORD *)(v33 - 228) = v34;
  HIDWORD(v341) = (v35 >> 20) + 1542605602 + ~((v34 - 1209756794) & (2 * (v35 >> 20)));
  HIDWORD(a13) = -396296192;
  HIDWORD(v340) = HIDWORD(a17) ^ 0xD82562EB;
  LODWORD(v340) = a17 + 1;
  v36 = 4 * *(_DWORD *)(v33 - 228);
  *(_DWORD *)(v33 - 232) = v36;
  LODWORD(a32) = (v36 ^ 0xFFFFF503) & 0x9E395B7B ^ 0x9E395B7F;
  v37 = *(unsigned __int8 **)(v33 - 200);
  v38 = (-18
       - 17 * ((a32 - 479180246 - ((2 * a32) & 0xC6E09454)) ^ 0x2A)
       - ((-34 * ((a32 - 479180246 - ((2 * a32) & 0xC6E09454)) ^ 0x2A)) & 0xFFFFFFDC)) ^ v37[((_DWORD)a32
                                                                                            - 479180246
                                                                                            - ((2 * (_DWORD)a32) & 0xC6E09454)) ^ 0xE3704A2A];
  v39 = (2 * v38) ^ 0xFFFFFF95;
  v40 = (4 * v38) & 0xFFFFFFB4 ^ 0xFFFFFFDF;
  v41 = byte_10021B0D0[((-18
                                        - 17 * ((a32 + 42 - ((2 * a32) & 0x54)) ^ 0x2A)
                                        - ((-34 * ((a32 + 42 - ((2 * a32) & 0x54)) ^ 0x2A)) & 0xDC)) ^ v37[((_DWORD)a32 - 479180246 - ((2 * (_DWORD)a32) & 0xC6E09454)) ^ 0xE3704A2A]) ^ 0x26]
      + (v38 ^ 0x18)
      - 82;
  v42 = (v41 ^ 0xFFFFFFE7) + v39 + v40 + ((2 * v41) & 0xFFFFFFCF);
  v43 = (v42 + 1 - 2 * ((v42 + 117) & 0x76 ^ (v42 + 1) & 2) - 24) ^ 0x36;
  v44 = (((v43 - ((2 * v43) & 0x58)) << 24) + 738197504) ^ 0x2C000000;
  v45 = byte_100224CF0[v37[14] ^ 0xF0];
  v46 = ((((v45 ^ 0xA5) - ((2 * (v45 ^ 0xA5)) & 0x18A)) << 8) + 1308738816) ^ 0x4E01C500;
  v47 = byte_100229330[v37[15] ^ 0xFE];
  v48 = (v44 - 1943426145 - ((2 * v44) & 0x18000000)) ^ 0x8C29AB9F | (v46 + 195342960 - ((2 * v46) & 0x17496400)) ^ 0xBA4B270;
  v49 = v48 - 405896007 - ((2 * v48) & 0xCF9D0972);
  v50 = byte_100224CF0[v37[2] ^ 0x52];
  v51 = byte_10021C310[v37[5] ^ 0x98];
  HIDWORD(a30) = 9;
  v52 = v49 ^ 0xE7CE84B9 | ((v47 + 49) + 1422406617 - ((2 * (v47 + 49)) & 0x1B2)) ^ 0x54C833D9;
  *((_QWORD *)&v343 + 1) = v52 - 984106978 - ((2 * v52) & 0x8AAF703C);
  v53 = (v37[9] ^ 0x45) - ((2 * (v37[9] ^ 0x45)) & 0xC6) + 7011;
  v54 = ((((v50 ^ 0x8F) - ((2 * (v50 ^ 0x8F)) & 0xA6)) << 8) + 302142208) ^ 0x12025300;
  v342 = v54 + 1507997120 - ((2 * v54) & 0x33C46A00);
  v55 = byte_10021C310[((v53 & 0x112 ^ 0xD940CFEF) - ((2 * (v53 & 0x112 ^ 0xD940CFEF)) & 0x28181A6) - 1580216109) ^ 0x86BF5CDD ^ ((((v53 & 0xED ^ 0xFFFFFFFA) + 700074736) & 0x1F8 ^ 0x6E204223) - (((v53 & 0xED ^ 0xFFFFFFFA) + 700074736) & 0x8A0805) - 1868953596)];
  v56 = (((32 * ~v51) ^ 0xFFFFFFFB) - ((2 * ((32 * ~v51) ^ 0xFFFFFFFB) - 10) & 0xA8) - 41) ^ (v51 >> 3) ^ 0xCF;
  v57 = (((v56 - ((2 * v56) & 0xD4)) << 16) + 1533673472) ^ 0x5B6A0000;
  HIDWORD(v35) = ~v55;
  LODWORD(v35) = (v55 ^ 0xFFFFFF9F) << 24;
  v58 = (v37[8] - ((2 * v37[8]) & 0xC0) + 781263968) ^ 0xB21DCAC5;
  LODWORD(v58) = (((v58 ^ 0x5E) + 1) ^ 0x77)
               + ((2 * ((v58 ^ 0x5E) + 1)) & 0xFFFFFFEF)
               + byte_10021B0D0[v58 ^ 0x9C8CEE9FLL];
  v59 = v58 + (~(2 * v58 + 46) | 0xDB);
  v60 = v37;
  v61 = ((((((v35 >> 27) + (~(2 * (v35 >> 27)) | 0xE3) + 15) ^ 0x57)
         - ((2 * (((v35 >> 27) + (~(2 * (v35 >> 27)) | 0xE3) + 15) ^ 0x57)) & 0x24)) << 16)
       + 219283456) ^ 0xD120000;
  v62 = (((((v59 + 74) ^ 0x16) - ((2 * ((v59 + 74) ^ 0x16)) & 0x8C)) << 24) - 973078528) ^ 0xC6000000;
  v63 = (v62 + 1641889331 - ((2 * v62) & 0xC2000000)) ^ 0x61DD3E33 | (v61 - 1063997856 - ((2 * v61) & 0x1280000)) ^ 0xC094AE60;
  v64 = v63 - 1209148241 - ((2 * v63) & 0x6FDBB95E);
  v65 = byte_10021B0D0[v37[4] ^ 0x58] + 2 * ((v37[4] ^ 0x2AFF7A99) + 1) + (((v37[4] ^ 0x2AFF7A99) + 1) ^ 0x7F);
  LODWORD(v58) = (v65 - ((2 * v65 + 94) & 0xB2) - 120) ^ 4;
  LODWORD(v58) = ((((_DWORD)v58 - ((2 * (_DWORD)v58) & 0x38)) << 24) + 469762048) ^ 0x1C000000;
  v66 = (v58 - 1369534089 + (~(2 * v58) | 0xA3FFFFFF) + 1) ^ 0xAE5E9177 | (v57 + 1964826672 - ((2 * v57) & 0x6A380000)) ^ 0x751CE030;
  LODWORD(a26) = 6;
  LOBYTE(v63) = byte_100229330[(v37[3] - ((2 * v37[3]) & 0x1A2) - 308831023) ^ 0xED979C5E];
  v67 = v63 + 49 - ((2 * (v63 + 49)) & 0x8E) + 71;
  v68 = v37[11];
  v69 = ((2 * v68) & 0xFFFFFFCF) + (v68 ^ 0xABFF8FE7);
  v70 = 2 * ((v68 & 0x45) - ((2 * (v68 & 0x45)) & 0x42)) + 1525611842;
  v71 = byte_100224CF0[v37[6] ^ 0xB1] ^ 0x8C;
  v72 = (((v71 - ((2 * v71) & 0xFFFFFF8F)) << 8) - 1260665088) ^ 0xB4DBC700;
  v73 = (v70 ^ 0x95702805) - v69 - 1329429595 + ((2 * v70) & 0x951DAA8C ^ 0x951DAA84);
  v74 = (v69 + 1409314841) ^ (-2037693563 - v69 - ((1476337614 - 2 * v69) & 0xB517673C)) ^ 0xB0D49987 ^ (v73 - ((2 * v73 + 1463578102) & 0xD4BE5432) - 1778556652);
  v75 = ((v74 + 1417934642 - ((2 * v74) & 0xA907EE64)) ^ 0x5483F732) + 69;
  v76 = v75 - ((2 * v75) & 0x85920736) - 1027013733;
  HIDWORD(a18) = 13;
  HIDWORD(v35) = v76 ^ 0x3345;
  LODWORD(v35) = v76 ^ 0xCE608000;
  v77 = (v35 >> 14) - ((2 * (v35 >> 14)) & 0x1D32AF94) + 244930506;
  HIDWORD(v35) = v77 ^ 0x1656C;
  LODWORD(v35) = v77 ^ 0xCDE00000;
  LODWORD(v58) = (v66 + 1764188045 - ((2 * v66) & 0xD24EBF1A)) ^ 0x69275F8D | (v72 + 200661762 - ((2 * v72) & 0x17EBB600)) ^ 0xBF5DB02;
  v78 = v58 + 2031404941 - ((2 * v58) & 0xF2298F1A);
  LODWORD(v58) = v37[13] ^ 0xCB54DE2E;
  v79 = 2 * (v37[13] ^ 0xA61EE9E5);
  LODWORD(v37) = v79 & 0x194;
  v80 = (v79 ^ 2) - ((2 * (v79 ^ 2)) & 0x4C) - 90;
  v81 = (v80 & 0xFFFFFF9A) - ((2 * v80) & 0x30) - 68;
  v82 = ((v81 & 0xDE ^ 0xC3) + (v81 ^ 0x3C) - ((v81 ^ 0x3C) & 0xDA)) ^ 0xDD;
  v83 = byte_100229330[((v35 >> 18) - 783581695 - ((2 * (v35 >> 18)) & 0xA296FC02)) ^ 0xD14B7E88]
      + 49;
  v84 = v64 ^ 0xB7EDDCAF | (v83 - 255652208 - ((2 * v83) & 0x120)) ^ 0xF0C30E90;
  v85 = byte_10021C310[(_DWORD)v58 + (_DWORD)v37 + (v82 ^ 0x80200184) - ((2 * v82) & 0xF6) - 1265950721];
  LODWORD(v58) = v84 + 898281543 - ((2 * v84) & 0x6B15608E);
  HIDWORD(v35) = ~v85;
  LODWORD(v35) = (v85 ^ 0xFFFFFF9F) << 24;
  v86 = (v35 >> 27) - ((2 * (v35 >> 27)) & 0x4E) + 39;
  v87 = ((((v86 ^ 0x98) - ((2 * v86) & 0xC2)) << 16) - 396296192) ^ 0xE8610000;
  v88 = (v87 - 1065940664 - ((2 * v87) & 0xEE0000)) ^ 0xC0770948 | DWORD2(v343) ^ 0xC557B81E;
  v89 = byte_10021C310[v60[1] ^ 0xA0];
  HIDWORD(v35) = ~v89;
  LODWORD(v35) = (v89 ^ 0xFFFFFF9F) << 24;
  v90 = ((((((v35 >> 27) - ((2 * (v35 >> 27)) & 0xA) - 123) ^ 0x97)
         - ((2 * (((v35 >> 27) - ((2 * (v35 >> 27)) & 0xA) - 123) ^ 0x97)) & 0x52)) << 16)
       - 1423376384) ^ 0xAB290000;
  v91 = (v90 - 811650674 - ((2 * v90) & 0x1F3E0000)) ^ 0xCF9F318E;
  v92 = (((*v60 ^ 0x7E30F54D) + 1) ^ 0x7E) + byte_10021B0D0[*v60 ^ 0x8CLL] + 4 * (((*v60 ^ 0x7E30F54Du) + 1) >> 1);
  v93 = v92 - 2 * ((v92 + 48) & 0x5F ^ v92 & 4) + 11;
  LODWORD(v343) = -1640408197;
  *(_QWORD *)((char *)&v343 + 4) = 7;
  v94 = (((2 * (v67 & 0xF7 ^ 0x90104B4F)) | 0xB629A0E4) - (v67 & 0xF7 ^ 0x90104B4F) + 619392910) ^ 0x4B049B7A | v342 ^ 0x59E235C0;
  v95 = ((((v93 ^ 0x60) - ((2 * (v93 ^ 0x60)) & 0xFFFFFFC3)) << 24) + 1627389952) ^ 0x61000000;
  v96 = ((v67 & 8) + v91 + 2090319108 - ((2 * v91) & 0x792F7A08)) ^ 0x7C97BD04 | (v94
                                                                                - 652887276
                                                                                - ((2 * v94) & 0x322B7628)) ^ 0xD915BB14;
  LODWORD(a19) = 10;
  v97 = v88 - ((2 * v88) & 0xAC39780A) + 1444723717;
  v98 = (v96 + 1621320562 - ((2 * v96) & 0xC146C6E4)) ^ 0x60A36372 | (v95 - 695386698 - ((2 * v95) & 0xAC000000)) ^ 0xD68D3DB6;
  LODWORD(v37) = byte_100229330[v60[7] ^ 0xBD] + 49;
  v99 = v78 ^ 0x7914C78D | (v37 - 1782331756 - ((2 * (_DWORD)v37) & 0x128)) ^ 0x95C3C694;
  v100 = byte_100224CF0[v60[10] ^ 0x17] ^ 0xCA;
  v101 = (((v100 - ((2 * v100) & 0x18A)) << 8) - 123222784) ^ 0xF8A7C500;
  LODWORD(v58) = v58 ^ 0x358AB047 | (v101 + 1404428473 - ((2 * v101) & 0x276BC000)) ^ 0x53B5E0B9;
  LODWORD(v37) = a20 ^ HIDWORD(a20) ^ a18 ^ (v98 - ((2 * v98) & 0x2A4A6FBE) + 354760671);
  v102 = HIDWORD(a20) ^ HIDWORD(a32) ^ a20;
  v103 = v102 ^ a27 ^ (v99 - ((2 * v99) & 0xA14DBD4C) - 794370394);
  v104 = v102 ^ HIDWORD(a27) ^ (v58 - ((2 * v58) & 0xA8D8ED42) + 1416394401);
  v105 = v102 ^ a30 ^ v97;
  HIDWORD(v35) = v37 ^ 0xD82E9;
  LODWORD(v35) = v37 ^ 0x10F00000;
  LODWORD(v58) = ((v35 >> 20) - ((2 * (v35 >> 20)) & 0xBCACF026) - 564758509) ^ HIDWORD(v341);
  HIDWORD(v35) = v58 ^ 0x8C;
  LODWORD(v35) = v58 ^ 0x5ECCB000;
  v106 = (v35 >> 12) - ((2 * (v35 >> 12)) & 0x9BAE241A) - 841543155;
  v107 = *(_QWORD *)(v33 - 224);
  v108 = *(_QWORD *)(v33 - 208);
  v109 = *(_DWORD *)(v107 + 4 * (v105 ^ 0xFBu)) ^ *(_DWORD *)(a28 + 4 * (BYTE1(v104) ^ 0xA5u)) ^ *(_DWORD *)(v108 + 4 * (BYTE2(v103) ^ 0xE1u)) ^ *(_DWORD *)(a12 + 4 * (HIBYTE(v106) ^ 0x58));
  v110 = *(_DWORD *)(a12 + 4 * (HIBYTE(v105) ^ 0xD5));
  v111 = (v110 & 0x2000 ^ 0xBF5BEFFF) + 2 * (v110 & 0x2000);
  v112 = *(_DWORD *)(v108 + 4 * (BYTE2(v106) ^ 0x32u)) ^ 0xFAEFD7B7;
  v113 = *(_DWORD *)(v108 + 4 * (BYTE2(v105) ^ 0x9Au));
  v114 = *(_DWORD *)(a12 + 4 * (HIBYTE(v104) ^ 0x21));
  v115 = *(_DWORD *)(v107 + 4 * (((v35 >> 12) - ((2 * (v35 >> 12)) & 0x1A) + 13) ^ 0x7Fu)) ^ *(_DWORD *)(a12 + 4 * (HIBYTE(v103) ^ 0xFC)) ^ *(_DWORD *)(v108 + 4 * (BYTE2(v104) ^ 0x83u)) ^ *(_DWORD *)(a28 + 4 * (BYTE1(v105) ^ 0xA0u));
  LODWORD(v37) = v113 ^ *(_DWORD *)(v107 + 4 * (v103 ^ 0x85u));
  v116 = *(_DWORD *)(a28 + 4 * (BYTE1(v103) ^ 0xCu));
  v117 = HIWORD(v103);
  v118 = *(_DWORD *)(v107 + 4 * (v104 ^ 0x38u));
  v119 = v37 ^ v114;
  v120 = v111 + 1878980329;
  v121 = *(_DWORD *)(a28 + 4 * (BYTE1(v106) ^ 0xE4u)) ^ v119;
  if (((v111 + 1084493825) & v112) + 925332512 - ((2 * ((v111 + 1084493825) & v112)) & 0x6E4EC000) != 925332512)
    v120 = -290007321 - v111;
  v122 = v118 ^ v116 ^ (1608442227
                      - (v110 & 0xFFFFDFFF ^ 0xE1DF0DF0 | 0x5FDEE173)
                      + (v110 & 0xFFFFDFFF ^ 0xE1DF0DF0 | 0xA0211E8C)) ^ (v112
                                                                        - 794486504
                                                                        + v120
                                                                        - ((2 * (v112 - 794486504 + v120)) & 0xE2D80F20)
                                                                        + 1902905232);
  v123 = *(_DWORD *)(v108 + 4 * (BYTE2(v115) ^ 0x16u));
  v124 = v123 & 0x40000000 | ((v123 & 0x40000000u) >> 30 << 31);
  v125 = (v123 & 0xBFFFFFFF ^ 0x302F5F0E | 0x2EDAE1F4) - (v123 & 0xBFFFFFFF ^ 0x302F5F0E | 0xD1251E0B) - 786096629;
  v126 = ((v122 ^ 0xC1942911) >> (v117 & 0x18))
       + 1544136834
       - ((2 * ((v122 ^ 0xC1942911) >> (v117 & 0x18))) & 0xB8135104);
  v127 = ((v126 ^ 0x5C09A882) >> (v117 & 0x18 ^ 0x18))
       - ((2 * ((v126 ^ 0x5C09A882) >> (v117 & 0x18 ^ 0x18))) & 0x66666666);
  v128 = v124 - 2035095071;
  v129 = (v125 & 0x592DE0DD ^ 0x59258001) + (v125 & 0xA6D21F22 ^ 0x24920901) - 1;
  v130 = *(_DWORD *)(a12 + 4 * (HIBYTE(v109) ^ 0x72)) ^ 0xE5F6DC92;
  if (((v124 + 0x40000000) & v130) != 0)
    v128 = 1051388368 - (v124 | 0x37F7FFEF);
  v131 = *(_DWORD *)(a28 + 4 * (BYTE1(v121) ^ 0x18u)) ^ v129 ^ (v130
                                                                - 1186130401
                                                                + v128
                                                                - ((2 * (v130 - 1186130401 + v128)) & 0x82D0F612)
                                                                + 1097366281) ^ *(_DWORD *)(v107
                                                                                          + 4
                                                                                          * (v122 ^ 0x11u));
  v132 = *(_DWORD *)(v107 + 4 * (v109 ^ 0xABu));
  v133 = *(_DWORD *)(a28 + 4 * (BYTE1(v109) ^ 0xA0u)) ^ *(_DWORD *)(v107 + 4 * (v115 ^ 0x2Bu)) ^ *(_DWORD *)(a12 + 4 * (HIBYTE(v121) ^ 0xF9)) ^ *(_DWORD *)(v108 + 4 * (BYTE2(v122) ^ 0x94u));
  v134 = *(_DWORD *)(v108 + 4 * (BYTE2(v109) ^ 0xCDu)) ^ *(_DWORD *)(a28 + 4 * (BYTE1(v115) ^ 0xF9u)) ^ *(_DWORD *)(v107 + 4 * (v121 ^ 0x4Bu)) ^ *(_DWORD *)(a12 + 4 * ((v127 - 77) ^ 0xB3u));
  v135 = *(_DWORD *)(a12 + 4 * (HIBYTE(v115) ^ 0x83)) ^ *(_DWORD *)(v108 + 4 * (BYTE2(v121) ^ 0x1Eu)) ^ v132 ^ *(_DWORD *)(a28 + 4 * (BYTE1(v122) ^ 0x29u));
  v136 = (v134 ^ 0xB0B0836C) + 1;
  v134 ^= 0x860BDA91;
  v137 = v134 + (v136 ^ 0x57FFBF7D) + ((2 * v136) & 0xAFFF7EFA) - 1476378493;
  v138 = ((v137 + 1670917341 + (~(2 * v137) | 0x38CFA647)) ^ 0x9C67D320) + v134;
  v139 = v138 - ((2 * v138) & 0xA6ED3168) - 747202380;
  v140 = *(_DWORD *)(v108 + 4 * (BYTE2(v139) ^ 0x76u));
  v141 = *(_DWORD *)(v108 + 4 * (BYTE2(v135) ^ 0xB8u)) ^ *(_DWORD *)(a12 + 4 * (HIBYTE(v131) ^ 0x3F)) ^ *(_DWORD *)(a28 + 4 * (BYTE1(v133) ^ 0x4Cu)) ^ *(_DWORD *)(v107 + 4 * (v139 ^ 0xB4u));
  v142 = *(_DWORD *)(a12 + 4 * (HIBYTE(v139) ^ 0xD3));
  v143 = *(_DWORD *)(a28 + 4 * (BYTE1(v139) ^ 0x98u)) ^ *(_DWORD *)(v108 + 4 * (BYTE2(v133) ^ 0xADu)) ^ *(_DWORD *)(v107 + 4 * (v131 ^ 0x48u)) ^ *(_DWORD *)(a12 + 4 * (HIBYTE(v135) ^ 0xBD));
  v144 = *(_DWORD *)(a12 + 4 * (HIBYTE(v133) ^ 0xC2)) ^ *(_DWORD *)(a28 + 4 * (BYTE1(v131) ^ 0x3Du)) ^ *(_DWORD *)(v107 + 4 * (v135 ^ 0x92u)) ^ v140;
  v145 = *(_DWORD *)(v107 + 4 * (v133 ^ 0x48u)) ^ *(_DWORD *)(v108 + 4 * (BYTE2(v131) ^ 0x79u)) ^ *(_DWORD *)(a28 + 4 * (BYTE1(v135) ^ 0x8Eu)) ^ v142;
  v146 = *(_DWORD *)(v107 + 4 * (v145 ^ 0x3Eu)) ^ 0xB6C558E3;
  v147 = *(_DWORD *)(a12 + 4 * (HIBYTE(v141) ^ 8)) ^ *(_DWORD *)(v108 + 4 * (BYTE2(v143) ^ 0x6Bu)) ^ *(_DWORD *)(a28 + 4 * (BYTE1(v144) ^ 0x4Cu)) ^ 0x30CE8272;
  v148 = v146 + v147;
  v149 = (v147 & v146) - ((2 * (v147 & v146)) & 0x54BF9FC2);
  v150 = *(_DWORD *)(v107 + 4 * (v141 ^ 0xE6u));
  v151 = *(_DWORD *)(a12 + 4 * (HIBYTE(v143) ^ 0x33)) ^ *(_DWORD *)(v108 + 4 * (BYTE2(v144) ^ 0xCDu)) ^ *(_DWORD *)(a28 + 4 * (BYTE1(v145) ^ 0xEAu));
  v152 = (((v151 & 0xA7993134 ^ 0x44CF1091) - 1) & 0xA0470134 ^ 0xB0008611)
       + (((v151 & 0xA7993134 ^ 0x44CF1091) - 1) ^ 0x45E719EC)
       - ((((v151 & 0xA7993134 ^ 0x44CF1091) - 1) ^ 0x45E719EC) & 0xA0010174);
  v153 = ((2 * (v151 & 0x5866CECB ^ 0x204EC2)) | 0x87AF79FC) - (v151 & 0x5866CECB ^ 0x204EC2) + 1009271554;
  v154 = ((v153 & 0x9433C1A ^ 0x8423C01) + (v153 & 0xF6BCC3E5) - 1) ^ 0xDBF34C7E | v152 ^ 0x91E78E39;
  v155 = v154 + 621843898 - ((2 * v154) & 0x4A212B74);
  v156 = v155 ^ 0x251095BA;
  v157 = (v150 ^ 0x6C2A32A6 ^ v155) + (v155 ^ 0x251095BA) + 1;
  v158 = v148 ^ 0x9FB7149D;
  v159 = (2 * v148) & 0x3F6E293A;
  v160 = v150 ^ ((v150 ^ 0x493AA71C) - ((2 * (v150 ^ 0x493AA71C) + 2) & 0xD33EE960) - 375425871) ^ 0x40A445F8 ^ (v157 - ((2 * v157) & 0x3FFCD356) + 536766891);
  v161 = *(_DWORD *)(a28 + 4 * (BYTE1(v141) ^ 0x8Eu));
  v162 = *(_DWORD *)(v108 + 4 * (BYTE2(v141) ^ 0xD8u));
  v163 = v160 + v156 - ((2 * (v160 + v156)) & 0x911C4F96) + 1217275851;
  v164 = v158
       + v159
       + ((2 * v149 - 725639230) ^ 0xD61F9EEB)
       + ((2 * (2 * v149 - 725639230)) & 0xFABFFDAC ^ 0x57C0C27B)
       + 1;
  v165 = v164 - ((2 * v164 + 55694452) & 0x6FC1ACA) + 1629943711;
  v166 = *(_DWORD *)(a28 + 4 * (BYTE1(v143) ^ 0xDAu));
  v167 = *(_DWORD *)(a12 + 4 * (HIBYTE(v144) ^ 0x77)) ^ v161 ^ *(_DWORD *)(v108 + 4 * (BYTE2(v145) ^ 0x89u)) ^ *(_DWORD *)(v107 + 4 * (v143 ^ 0xE5u));
  v168 = *(_DWORD *)(a12 + 4 * (HIBYTE(v145) ^ 0xBE)) ^ v162 ^ *(_DWORD *)(v107 + 4
                                                                                  * (v144 ^ 0x3Cu)) ^ v166;
  v169 = *(_DWORD *)(v108 + 4 * (BYTE2(v168) ^ 0x94u));
  v170 = *(_DWORD *)(a12 + 4 * (HIBYTE(v168) ^ 0x4C));
  v171 = *(_DWORD *)(v108 + 4 * (BYTE2(v163) ^ 0x55u)) ^ *(_DWORD *)(a28 + 4 * (BYTE1(v167) ^ 0x75u)) ^ *(_DWORD *)(a12 + 4 * (HIBYTE(v165) ^ 0xB5)) ^ *(_DWORD *)(v107 + 4 * (v168 ^ 0x37u));
  v172 = *(_DWORD *)(a12 + 4 * (HIBYTE(v163) ^ 0x4B)) ^ *(_DWORD *)(v108 + 4 * (BYTE2(v167) ^ 0x16u)) ^ 0x1F190B25;
  v173 = *(_DWORD *)(a28 + 4 * (BYTE1(v168) ^ 0x45u)) ^ 0x2FD78957;
  v174 = 2 * ((v173 & v172) - ((2 * (v173 & v172)) & 0x24F32B4)) + 38744756;
  v175 = ((2 * (v173 + v172)) & 0x777FFCA6)
       + ((v173 + v172) ^ 0xBBBFFE53)
       + (v174 ^ 0x52472ABD)
       + ((2 * v174) & 0x5FEFCFEC ^ 0xFB71BA97);
  v176 = (v175 - ((2 * v175 + 678417226) & 0x23978A3A) + 100904642) ^ *(_DWORD *)(v107
                                                                                + 4 * (v165 ^ 0xB5u));
  v177 = *(_DWORD *)(a12 + 4 * (HIBYTE(v167) ^ 0x74)) ^ v169 ^ *(_DWORD *)(a28 + 4 * (BYTE1(v165) ^ 0x34u)) ^ *(_DWORD *)(v107 + 4 * (v163 ^ 0x6Fu));
  v178 = *(_DWORD *)(a28 + 4 * (BYTE1(v163) ^ 0x1Eu)) ^ v170 ^ *(_DWORD *)(v107 + 4
                                                                                  * (v167 ^ 0x98u)) ^ *(_DWORD *)(v108 + 4 * (BYTE2(v165) ^ 0xC5u));
  v179 = *(_DWORD *)(v108 + 4 * (BYTE2(v176) ^ 4u)) ^ *(_DWORD *)(a28 + 4 * (BYTE1(v177) ^ 0xF9u)) ^ *(_DWORD *)(a12 + 4 * (HIBYTE(v171) ^ 0x47)) ^ *(_DWORD *)(v107 + 4 * (((v178 & 0x25) + 4456447 + (v178 & 0xDA ^ 0xB9B8D04B)) ^ 0xB9FCD005));
  v180 = *(_DWORD *)(v108 + 4 * (BYTE2(v171) ^ 0xDAu));
  v181 = *(_DWORD *)(a28 + 4 * (BYTE1(v171) ^ 0x6Fu));
  v182 = *(_DWORD *)(v108 + 4 * (BYTE2(v177) ^ 0x1Cu)) ^ *(_DWORD *)(a28 + 4 * (BYTE1(v178) ^ 0x66u)) ^ *(_DWORD *)(v107 + 4 * (v171 ^ 0x44u)) ^ *(_DWORD *)(a12 + 4 * (HIBYTE(v176) ^ 0x65));
  v183 = *(_DWORD *)(a12 + 4 * (HIBYTE(v177) ^ 0xB6)) ^ *(_DWORD *)(v108 + 4 * (BYTE2(v178) ^ 0x83u)) ^ v181;
  v184 = *(_DWORD *)(a12 + 4 * (HIBYTE(v178) ^ 0x7C)) ^ v180;
  v185 = (-961932044 - (v183 & 0x6A9DFF5C ^ 0x628C4808 | 0xC6AA14F4) + (v183 & 0x6A9DFF5C ^ 0x628C4808 | 0x3955EB0B)) ^ 0xF9D13E41;
  v186 = (((2 * (v183 & 0x956200A3 ^ 0x56432222)) | 0xB6B794D8) - (v183 & 0x956200A3 ^ 0x56432222) + 614741396) ^ (((2 * v185) | 0x7B2CB484) - v185 - 1033263682) ^ *(_DWORD *)(v107 + 4 * (v176 ^ 0x8Fu));
  v187 = v184 ^ *(_DWORD *)(v107 + 4 * (v177 ^ 0xE9u)) ^ *(_DWORD *)(a28 + 4
                                                                                            * (BYTE1(v176) ^ 0x11u));
  v188 = *(_DWORD *)(v108 + 4 * (BYTE2(v187) ^ 0xDu)) ^ *(_DWORD *)(a12 + 4 * (HIBYTE(v186) ^ 0xAA));
  v189 = *(_DWORD *)(a28 + 4 * (BYTE1(v187) ^ 0x3Eu)) ^ *(_DWORD *)(a12 + 4 * (HIBYTE(v182) ^ 0x88)) ^ *(_DWORD *)(v108 + 4 * (BYTE2(v186) ^ 3u)) ^ *(_DWORD *)(v107 + 4 * (v179 ^ 0x99u));
  v190 = *(_DWORD *)(v107 + 4 * (v186 ^ 0xDEu));
  v191 = *(_DWORD *)(a12 + 4 * (HIBYTE(v179) ^ 0x4A)) ^ *(_DWORD *)(v108 + 4 * (BYTE2(v182) ^ 0x92u)) ^ *(_DWORD *)(a28 + 4 * (BYTE1(v186) ^ 0xADu)) ^ *(_DWORD *)(v107 + 4 * (v187 ^ 0x4Eu));
  v192 = v188 ^ *(_DWORD *)(a28 + 4 * (BYTE1(v179) ^ 0x2Du)) ^ *(_DWORD *)(v107 + 4
                                                                                  * (v182 ^ 0xE8u));
  v193 = *(_DWORD *)(a28 + 4 * (BYTE1(v182) ^ 0xA1u)) ^ *(_DWORD *)(a12 + 4 * (HIBYTE(v187) ^ 0x42)) ^ v190 ^ *(_DWORD *)(v108 + 4 * (BYTE2(v179) ^ 0x98u));
  v194 = *(_DWORD *)(a12 + 4 * (HIBYTE(v189) ^ 0xF6));
  v195 = *(_DWORD *)(v108 + 4 * (BYTE2(v192) ^ 0xD2u));
  v196 = (2 * (v194 & 0x100000)) ^ 0x200000 | v194 & 0x100000;
  v197 = (((2 * (v194 & 0xFFEFFFFF ^ 0x788712F3)) | 0xFAE40B80) - (v194 & 0xFFEFFFFF ^ 0x788712F3) - 2104624576) ^ 0xE4528DA0;
  v198 = ((2 * v197) & 0x553EDF16) - v197;
  v199 = *(_DWORD *)(a28 + 4 * (BYTE1(v191) ^ 0xFBu));
  v200 = *(_DWORD *)(a12 + 4 * (HIBYTE(v192) ^ 0xC8));
  v201 = *(_DWORD *)(v107 + 4 * (v193 ^ 0x8Au)) ^ *(_DWORD *)(a28 + 4 * (BYTE1(v192) ^ 0xD8u)) ^ *(_DWORD *)(a12 + 4 * (HIBYTE(v191) ^ 0xF8));
  v202 = v196 + 2087032425;
  v203 = *(_DWORD *)(v108 + 4 * (BYTE2(v193) ^ 0xD4u));
  if (((v196 - 0x100000) & (v195 ^ 0xFAE00000))
     - 75713350
     - ((2 * ((v196 - 0x100000) & (v195 ^ 0xFAE00000))) & 0xF6F96944) != -75713350)
    v202 = 2089129577 - v196;
  v204 = (v195 ^ 0xFAEFD7B7) - 2088081001 + v202 - ((2 * ((v195 ^ 0xFAEFD7B7) - 2088081001 + v202)) & 0xC13F5004);
  v205 = *(_DWORD *)(a28 + 4 * (BYTE1(v193) ^ 0x3Cu));
  v206 = v199 ^ 0x2FD78957;
  v207 = *(_DWORD *)(v107 + 4 * (v191 ^ 0x2Du));
  v208 = v207 ^ v205 ^ (v198 + 1432391796) ^ (v204 + 1621075970);
  v209 = (v203 ^ v200 ^ ((v203 ^ v200 ^ 0xE0E6F4DA) - ((2 * (v203 ^ v200 ^ 0xE0E6F4DA) + 2) & 0xC35B09B6) - 508721956) ^ (v206 + (v199 ^ 0xCF317D8D ^ v203 ^ v200) + 1 - ((2 * (v206 + (v199 ^ 0xCF317D8D ^ v203 ^ v200) + 1)) & 0x44E37CB4) + 577879642) ^ 0xDCC531A4)
       + v206;
  v210 = (v209 - ((2 * v209) & 0xC4ED5E76) + 1651945275) ^ *(_DWORD *)(v107 + 4 * (v189 ^ 0x54u));
  v211 = v192;
  v212 = *(_DWORD *)(v108 + 4 * (BYTE2(v191) ^ 0xC5u)) ^ *(_DWORD *)(a12 + 4 * (HIBYTE(v193) ^ 0xC));
  v213 = v212 ^ *(_DWORD *)(a28 + 4 * (BYTE1(v189) ^ 0x80u)) ^ *(_DWORD *)(v107
                                                                           + 4
                                                                           * (((v211 ^ 0x56444288)
                                                                             + (v192 & 0xE2 ^ 0x8918AD62)
                                                                             - ((v211 ^ 0x56444288) & 0x440442E2)) ^ 0x9B58AD3F));
  v214 = 2 * v210;
  if ((v208 & 4) != 0)
    v216 = 252;
  else
    v216 = 4;
  v215 = (v214 ^ 0xA967EFB0) - ((2 * (v214 ^ 0xA967EFB0)) & 0x29C8C708);
  v217 = (v210 & 0x5DCB65B7 ^ 0x2F3CBA6F)
       + (v214 & 0xB3168B6E ^ 0xA1068B20)
       + ((v215 + 1424253828) & 0x2B00C04E ^ 0x22C05DD)
       + ((2 * (v215 + 1424253828)) & 0x5201000C ^ 0xFFFFFFF7)
       + 1;
  v218 = (v217 - ((2 * v217 + 254309534) & 0x1139ABC4) + 540086321) ^ ((v210 & 0xA2349A48 ^ 0x76800264)
                                                                     + (v210 & 0x22209800 ^ 0x162D903)
                                                                     - ((v210 & 0xA2349A48 ^ 0x76800264) & 0x26A09804));
  v219 = v201 ^ *(_DWORD *)(v108 + 4 * (BYTE2(v189) ^ 0x5Cu));
  v220 = (v201 ^ *(_BYTE *)(v108 + 4 * (BYTE2(v189) ^ 0x5Cu))) ^ 0x22F79828;
  v221 = (((2 * v220) & 0x448F00EA) - v220 - 1732740726) ^ 0xBE277DB1;
  v222 = *(_DWORD *)(v108 + 4 * (BYTE2(v218) ^ 0xDAu)) ^ *(_DWORD *)(a12 + 4 * (HIBYTE(v208) ^ 0x71)) ^ *(_DWORD *)(a28 + 4 * (BYTE1(v213) ^ 0x5Cu)) ^ *(_DWORD *)(v107 + 4 * ((((2 * v221) | 0xD6A725D8) - v221 - 1800639212) ^ 0x6F3B0E00));
  v223 = ((v216 + (v208 ^ 0x71E1CD68)) ^ 0x7C) + ((2 * (v216 + (v208 ^ 0x71E1CD68))) & 0xF8) + 132;
  v224 = *(_DWORD *)(a12 + 4 * (HIBYTE(v218) ^ 0xDB)) ^ *(_DWORD *)(a28 + 4 * (BYTE1(v219) ^ 0xE2u)) ^ *(_DWORD *)(v107 + 4 * ((v223 - 138262311 - ((2 * v223) & 0x1B2)) ^ 0xF7C248DD)) ^ *(_DWORD *)(v108 + 4 * (BYTE2(v213) ^ 0x40u));
  v225 = *(_DWORD *)(a12 + 4 * (HIBYTE(v213) ^ 0x9B)) ^ *(_DWORD *)(v108 + 4 * (BYTE2(v219) ^ 0x11u)) ^ *(_DWORD *)(a28 + 4 * (BYTE1(v208) ^ 0xCDu)) ^ *(_DWORD *)(v107 + 4 * (v218 ^ 0x81u));
  HIDWORD(v226) = v189 ^ 0xBDA91;
  LODWORD(v226) = v189 ^ 0x86000000;
  v227 = (v226 >> 22) - ((2 * (v226 >> 22)) & 0xFF32561A) + 2140744461;
  HIDWORD(v226) = v227 ^ 0x138;
  LODWORD(v226) = v227 ^ 0x50A32400;
  v228 = (v226 >> 10) - ((2 * (v226 >> 10)) & 0xC6EB4E64) - 478828750;
  v229 = *(_DWORD *)(v107 + 4 * (((v226 >> 10) - ((2 * (v226 >> 10)) & 0x64) + 50) ^ 0x74u)) ^ 0xB6C558E3;
  v230 = v205 ^ v195 ^ v207 ^ *(_DWORD *)(a12 + 4 * (HIBYTE(v228) ^ 0x1E));
  v231 = v201 ^ *(_DWORD *)(v108 + 4 * (BYTE2(v228) ^ 0x69u));
  v232 = ((v229 | v200 ^ 0xE5F6DC92) - ((2 * (v229 | v200 ^ 0xE5F6DC92)) & 0x47F0FB88) + 603487684) ^ ((v229 & (v200 ^ 0xE5F6DC92)) - ((2 * (v229 & (v200 ^ 0xE5F6DC92))) & 0xABA17DE0) + 1439743728) ^ ((v206 & (v203 ^ 0xFAEFD7B7)) - ((2 * (v206 & (v203 ^ 0xFAEFD7B7))) & 0xCD69A482) - 424357311) ^ ((v206 | v203 ^ 0xFAEFD7B7) - ((2 * (v206 | v203 ^ 0xFAEFD7B7)) & 0x288BAE46) - 1807362269);
  v233 = v212 ^ *(_DWORD *)(v107 + 4 * (v211 ^ 0x55u)) ^ *(_DWORD *)(a28 + 4 * (BYTE1(v228) ^ 0x33u));
  v234 = ((v233 & 0xFCC100B0 ^ 0x80010091) + (v233 & 0x336FF4F) - 1) ^ (-(v233 & 0x80000) - 1958182113);
  v235 = *(_DWORD *)(v108 + 4 * (BYTE2(v230) ^ 0x46u)) ^ 0xFAEFD7B7;
  v236 = *(_DWORD *)(a12 + 4 * (HIBYTE(v231) ^ 0x2F)) ^ 0xE5F6DC92;
  v237 = (v236 & v235) - ((2 * (v236 & v235)) & 0x6457550A);
  v238 = ((v236 + v235) ^ 0xEF796BFE)
       + ((2 * (v236 + v235)) & 0xDEF2D7FC)
       + ((2 * v237 - 464038646) ^ 0x74D76509)
       + ((2 * (2 * v237 - 464038646)) & 0xDEFF9FF8 ^ 0x375175EF)
       + 1;
  v239 = *(_DWORD *)(a28 + 4 * (BYTE1(v232) ^ 0xA6u)) ^ *(_DWORD *)(v107 + 4 * (v234 ^ 0x6Au)) ^ (v238 - ((2 * v238 + 837630) & 0xA6ACE98) - 2059678901);
  v240 = *(_DWORD *)(a12 + 4 * (HIBYTE(v232) ^ 0x93)) ^ *(_DWORD *)(v108
                                                                    + 4
                                                                    * (((v234 ^ 0x320460C) >> 16) ^ 0x29u));
  v241 = *(_DWORD *)(v107 + 4 * ~(_BYTE)v231) ^ *(_DWORD *)(a12 + 4 * (HIBYTE(v230) ^ 0x5F)) ^ *(_DWORD *)(a28 + 4 * (((unsigned __int16)(v234 ^ 0x460C) >> 8) ^ 0x99u)) ^ *(_DWORD *)(v108 + 4 * (BYTE2(v232) ^ 0x4Du));
  v242 = (v240 & 0x10 ^ 0x7FBFD5FF) + 2 * (v240 & 0x10);
  v243 = (-1527662033 - (v240 & 0xFFFFFFEF ^ 0xC378DA0B | 0xA4F1BA2F) + (v240 & 0xFFFFFFEF ^ 0xC378DA0B | 0x5B0E45D0)) ^ 0xC72F94F6;
  v244 = ((2 * v243) | 0xE82D317E) - v243;
  v245 = *(_DWORD *)(a28 + 4 * (BYTE1(v231) ^ 0xE2u));
  v246 = ((v242 - 2143278591) & (v245 ^ 0x2FD78950))
       - 1990096911
       - ((2 * ((v242 - 2143278591) & (v245 ^ 0x2FD78950))) & 0x12C30FC0) == -1990096911;
  v247 = v242 - 1310913;
  v248 = -9721027 - v242;
  if (v246)
    v248 = v247;
  v249 = (v244 + 199845697) ^ *(_DWORD *)(v107 + 4 * (v230 ^ 0x3Au)) ^ ((v245 ^ 0x2FD78957)
                                                                                         - 2141967678
                                                                                         + v248
                                                                                         - ((2
                                                                                           * ((v245 ^ 0x2FD78957)
                                                                                            - 2141967678
                                                                                            + v248)) & 0xF1E08F28)
                                                                                         + 2029012884);
  v250 = *(_DWORD *)(a28 + 4 * (BYTE1(v230) ^ 0xB8u)) ^ *(_DWORD *)(a12 + 4 * (HIBYTE(v234) ^ 0x90)) ^ *(_DWORD *)(v108 + 4 * (BYTE2(v231) ^ 0x11u)) ^ *(_DWORD *)(v107 + 4 * (v232 ^ 0x39u));
  v251 = (*(_DWORD *)(a12 + 4 * (HIBYTE(v219) ^ 0x2F)) ^ *(_DWORD *)(v108 + 4 * (BYTE2(v208) ^ 0xE1u)) ^ *(_DWORD *)(v107 + 4 * (v213 ^ 0xE5u)) ^ 0x9D3DED93 ^ *(_DWORD *)(a28 + 4 * (BYTE1(v218) ^ 0x9Cu)))
       + 187173966;
  v252 = ((2 * v222) ^ 0xC17B522) - 2 * (((2 * v222) ^ 0xC17B522) & 0x21695A9E ^ (2 * v222) & 4) - 1586931046;
  HIDWORD(v253) = v224 ^ 0x3DA91;
  LODWORD(v253) = v224 ^ 0x86080000;
  v254 = (v253 >> 18) - ((2 * (v253 >> 18)) & 0x20CF1612) + 275221257;
  v255 = (((v252 & 0x4041002 | v252 & 0x8180E180 ^ 0x181) + 138543111) & 0x8584F18A ^ 0x584F008) + (v222 ^ 0x86B2F7F9);
  v256 = ((2 * v255) & 0xFFFA57FA) + (v255 ^ 0x7FFD2BFD);
  v257 = ((2 * v251) & 0xF3AE6B3C) + (v251 ^ 0xF9D7359E) + (v239 ^ 0x78EE7E05);
  v258 = v257 - ((2 * v257 + 206673094) & 0x2180449C) - 1763119951;
  v259 = v249 ^ 0x7A6387C0;
  if ((v249 & 2) != 0)
    v260 = -2;
  else
    v260 = 2;
  v261 = v260 + v259 - ((2 * (v260 + v259)) & 0x5DDEEA86) + 787445059;
  v262 = v258 ^ 0x4130CFCA;
  v263 = (-818646825 * v262) ^ 0xAFF9DFDF;
  v264 = (510189998 * v262) & 0x5FF3BFBE;
  HIDWORD(v265) = v254 ^ 0x61C;
  LODWORD(v265) = v254 ^ 0x99ADC000;
  v266 = ((2 * v261) & 0xDABEBBA6 ^ 0xD2008106) + (v261 ^ 0x165F1D54);
  v267 = (((v265 >> 14) - ((2 * (v265 >> 14)) & 0xA56B0DD0) - 759855384) ^ 0xB30C9407) - 1070568364;
  v268 = ((2 * v267) & 0xDDDC7BAC) + (v267 ^ 0x6EEE3DD6) - v266;
  v269 = ((2 * v241) & 0xB675FBEE ^ 0x80611A60) + (v241 ^ 0x1F4A72CF);
  v270 = (((2 * v225) ^ 0xC17B522) - ((2 * ((2 * v225) ^ 0xC17B522)) & 0xBF9DAF0) - 2047021703) & 0xBA6A0020 ^ 0x12620020;
  v271 = ((((v270 - ((2 * v270) & 0x60D00000) + 1961402712) & 0x59E80020 ^ 0x4C0273 | (v270
                                                                                     - ((2 * v270) & 0x60D00000)
                                                                                     + 1961402712) & 0xA6120000)
         - 1) ^ 0x76E60252)
       + (v225 ^ 0x139A6933);
  v272 = (v256 - v269 - ((2 * (v256 - v269) + 377201652) & 0x1BB23A9E) + 1763110729) ^ 0xE9121C04;
  v273 = ((1743057845 * v272) ^ 0xF1F97DF1) + ((-808851606 * v272) & 0xE3F2FBE2);
  v274 = ((2 * v271) & 0x77EFFCFA) + (v271 ^ 0x3BF7FE7D) + (v250 ^ 0x315096DC);
  v275 = (v274 - ((2 * v274 + 135267080) & 0x6C695364) + 2050796342) ^ 0x9B5AEC9;
  v276 = 292393685 * v275 - 1299677274 - ((584787370 * v275) & 0x6510FF4C);
  v277 = (v268 - ((2 * v268 - 52281350) & 0xC328156A) - 536532302) ^ 0x5DC92232;
  v278 = -1775446584 - 762590379 * v277 - ((622302890 * v277) & 0x2C59AB90);
  v279 = v264 - v273 + v263 + 1107271186;
  v280 = v279 + (v276 ^ 0xB2887FA6) - ((2 * (v279 + (v276 ^ 0xB2887FA6))) & 0x1A0533F4) + 218274298;
  v281 = v273 + 235307535 + (v278 ^ 0x962CD5C8);
  v282 = (v281 ^ 0xAFEC6F6F)
       + (v280 ^ 0xF2FD6605)
       + ((2 * v281) & 0x5FD8DEDE)
       - 2
       * (((v281 ^ 0xAFEC6F6F) + (v280 ^ 0xF2FD6605) + ((2 * v281) & 0x5FD8DEDE) + 1343459474) & 0x775C905F ^ ((v281 ^ 0xAFEC6F6F) + (v280 ^ 0xF2FD6605)) & 1)
       - 948952848;
  v283 = v282 ^ v280;
  v284 = v276 ^ v278 ^ 0x24A4AA6E;
  v285 = v279 + v284 + 550674412 - ((2 * (v279 + v284)) & 0x41A53FD8);
  v286 = ((2 * ((v285 ^ 0x20D29FEC) + v284)) & 0x7F2FD7F4) + (((v285 ^ 0x20D29FEC) + v284) ^ 0x3F97EBFA);
  v287 = (v285 ^ 0xA57369B7 ^ v283) + 1;
  v288 = ((2 * (v287 + (v282 ^ 0x775C905E))) & 0xFF7FDFEE) + ((v287 + (v282 ^ 0x775C905E)) ^ 0x7FBFEFF7);
  v289 = v286 - v288;
  v290 = v288 + v269 + ((2 * v288 + 8396818) ^ 0x9044D011) - ((2 * (2 * v288 + 8396818)) & 0xDF765FDC);
  v291 = ((2 * (v287 + (v239 ^ 0x871181FA))) & 0xFF3FFB34) + ((v287 + (v239 ^ 0x871181FA)) ^ 0xFF9FFD9A);
  v292 = v290 - ((2 * v290 + 2109256204) & 0xA61BB84C) + 300561708;
  v293 = (v250 ^ 0xCEAF6923)
       + (((v283 ^ 0x85A1F65B) + 1076364286 + v289) ^ 0x7DEECB6F)
       + ((2 * ((v283 ^ 0x85A1F65B) + 1076364286 + v289)) & 0xFBDD96DE)
       - 2112801647;
  v294 = ((2 * v293) & 0xBD37BB9E) + (v293 ^ 0x5E9BDDCF);
  v295 = v291 - ((2 * v291 + 1043298766) & 0xD4B2E262) + 158412312;
  v296 = *(_QWORD *)(v33 - 240);
  v297 = v266 - v289 - ((2 * (v266 - v289) + 1553177246) & 0xF757978C) - 1443522283;
  v298 = v294 - ((2 * v294 - 1918167714) & 0xF3118242) - 1067562032;
  v299 = *(_QWORD *)(v33 - 216);
  v300 = *(_DWORD *)(v296 + 4 * (BYTE2(v292) ^ 0xDu)) ^ HIDWORD(a19) ^ *(_DWORD *)(v299 + 4 * (HIBYTE(v295) ^ 0xEA)) ^ *(_DWORD *)(a16 + 4 * (BYTE1(v297) ^ 0xCBu)) ^ *(_DWORD *)(a15 + 4 * (v298 ^ 0x21u));
  HIDWORD(v265) = v300 ^ 0xFB53D;
  LODWORD(v265) = v300 ^ 0x50000000;
  v301 = (v265 >> 25) + 1559690815 + (~(2 * (v265 >> 25)) | 0x46120383);
  v302 = HIDWORD(a19) ^ HIDWORD(a26) ^ *(_DWORD *)(a16 + 4 * (BYTE1(v295) ^ 0x71u)) ^ *(_DWORD *)(v299
                                                                                                  + 4 * (HIBYTE(v297) ^ 0x7B)) ^ *(_DWORD *)(a15 + 4 * (v292 ^ 0x26u)) ^ *(_DWORD *)(v296 + 4 * (BYTE2(v298) ^ 0x88u));
  HIDWORD(v265) = v301 ^ 0xFFFFFFFB;
  LODWORD(v265) = v301 ^ 0x52BAC500;
  v303 = HIDWORD(a17) ^ HIDWORD(a26) ^ HIDWORD(a19);
  v304 = v303 ^ *(_DWORD *)(v296 + 4 * (BYTE2(v297) ^ 0xABu)) ^ *(_DWORD *)(v299 + 4 * (HIBYTE(v292) ^ 0xD3)) ^ *(_DWORD *)(a15 + 4 * (v295 ^ 0x31u)) ^ *(_DWORD *)(a16 + 4 * (BYTE1(v298) ^ 0xC1u));
  v305 = HIDWORD(a17) ^ HIDWORD(a26) ^ ((v265 >> 7) - ((2 * (v265 >> 7)) & 0xE4FCBD20) + 1920884368);
  v306 = v303 ^ *(_DWORD *)(a15 + 4 * (v297 ^ 0xC6u)) ^ *(_DWORD *)(v296 + 4
                                                                                            * (BYTE2(v295) ^ 0x59u)) ^ *(_DWORD *)(a16 + 4 * (BYTE1(v292) ^ 0xDCu)) ^ *(_DWORD *)(v299 + 4 * (HIBYTE(v298) ^ 0xF9));
  v307 = (v302 ^ (v340 + (HIDWORD(v340) ^ v302) - ((2 * (v340 + (HIDWORD(v340) ^ v302))) & 0x160A74A4) - 1962591662) ^ ((v302 ^ 0xAA6525A) - ((2 * (v302 ^ 0xAA6525A) + 2) & 0x75606C0) - 2085944479) ^ 0xFDF79497)
       + a17;
  v308 = v307 - ((2 * v307) & 0x7AA17186) - 1118783293;
  v309 = ((v308 & 0x64C6102B ^ 0x6052395B) + (v308 & 0x1801C484 ^ 0x10481) - 1) ^ 0x4493287B;
  v310 = (-159055418 - (v309 | 0xF68501C6) + (v309 | 0x97AFE39)) ^ ((v308 & 0x83382B50 ^ 0x7EEFD6FF)
                                                                  - ((2 * (v308 & 0x83382B50 ^ 0x7EEFD6FF)) & 0x6104220)
                                                                  - 1635708820);
  LOBYTE(v309) = byte_1002246D0[HIBYTE(v304) ^ 0xDALL];
  v311 = (((8 * v308) ^ 0xD77A17A0) - 1678651491 - ((2 * ((8 * v308) ^ 0xD77A17A0)) & 0x37E39F30)) ^ 0x9BF1CF9D | (((v308 >> 5) & 4 ^ 0x4C) - ((v308 >> 5) & 4) + ((v308 >> 5) ^ 1)) ^ 0x4A;
  v312 = v311 - ((2 * v311) & 0xB0) - 40;
  v313 = *(_BYTE **)(v33 - 200);
  v313[4] = HIBYTE(v304) ^ (((2 * (~(_BYTE)v309 & 0xD4)) | 0xC) - (~(_BYTE)v309 & 0xD4)) ^ 0x3B ^ ((v309 & 0x2B ^ 0xD5)
                                                                                                 - ((2 * (v309 & 0x2B ^ 0xD5)) & 0xCA)
                                                                                                 - 27);
  HIDWORD(v265) = v312 ^ 1;
  LODWORD(v265) = (v312 ^ 0xFFFFFFBF) << 24;
  v314 = byte_100217550[((v265 >> 27) - ((2 * (v265 >> 27)) & 0xC8) + 100) ^ 0xD4];
  HIDWORD(v265) = v314 ^ 8;
  LODWORD(v265) = ~v314 << 24;
  v315 = (v265 >> 28) - ((2 * (v265 >> 28)) & 0xFFFFFF9C);
  HIDWORD(v265) = (v315 - 50) ^ 0x4E;
  LODWORD(v265) = (49 - v315) << 24;
  HIDWORD(v265) = (95
                 - ((2 * ((((v315 - 50) >> 7) & 1 | 0x36) ^ ((v315 - 50) >> 4))) ^ 0x76)) ^ ((v265 >> 31) - ((2 * (v265 >> 31)) & 0xFFFFFFBC) - 34);
  LODWORD(v265) = (HIDWORD(v265) ^ 0xFFFFFFF7) << 24;
  v313[11] = ((v265 >> 25) - ((2 * (v265 >> 25)) & 0x34) + 26) ^ 0xCB;
  v316 = (HIWORD(v306) & 0xDE ^ 0x304A6307) - (HIWORD(v306) & 0x21) + 26220576;
  v317 = byte_10023F3C0[v316 ^ 0x31DA7B29] ^ 0x11;
  if ((v316 ^ 0x31DA7B00u) < 0x80)
    v318 = -4;
  else
    v318 = 4;
  v313[13] = (v318 + v317 - ((2 * (v318 + v317)) & 0xB4) + 90) ^ 0x89;
  v319 = byte_1002246D0[HIBYTE(v306) ^ 0x4ELL];
  v320 = (BYTE1(v306) ^ 0xC07C) + ((v306 >> 8) & 0x52 ^ 0x2F02) - ((BYTE1(v306) ^ 0xC07C) & 0x52);
  v321 = ((v306 >> 7) & 4) + (BYTE1(v306) ^ 0xFFFFFF8E) - 1893839362;
  v322 = (((v321 & 0xE0A0222 ^ 0x10603203) + (v321 & 0x10045DD) - 1) ^ 0xE09588DF) + 1;
  v323 = ((v320 & 0x7B3 ^ 0x96A20003) + (v320 & 0x384C ^ 0x8400841) - 1) ^ 0x9EE227C1;
  v324 = v323 + (v322 ^ 0xF3637D7F) + ((2 * v322) & 0xE6C6FAFE) + 211583617;
  HIDWORD(v325) = v319 ^ 1;
  LODWORD(v325) = (v319 ^ 0x80) << 24;
  v326 = (v325 >> 26) - ((2 * (v325 >> 26)) & 0xFFFFFFD0) + 104;
  v313[a32] = HIBYTE(v306) ^ ((v326 & 0xC0) >> 6) ^ (((4 * v326) ^ 0xA0)
                                                                                  - ((8 * v326) & 0xB0)
                                                                                  - 37) ^ 0x1F;
  LOBYTE(v326) = byte_100227C00[((v324 - ((2 * v324) & 0x4B8F4322) + 633840017) ^ 0xDA385E6D) + v323];
  v327 = (((2 * (BYTE1(v304) ^ 0x2A)) | 0xEB7B880A) - (BYTE1(v304) ^ 0x2A) + 172112891) ^ 0x74BD901C;
  v328 = (-2031792555 - (v327 | 0x86E54E55) + (v327 | 0x791AB1AA)) ^ 0x7E51A86;
  LOBYTE(v326) = v326 ^ ((v326 ^ 0x9C) - ((2 * (v326 ^ 0x9C) + 106) & 0x66) - 88) ^ ((v326 ^ 0x68)
                                                                                   - ((2 * (v326 ^ 0x68) + 2) & 0x50)
                                                                                   + 41) ^ 0xC;
  v313[14] = BYTE1(v306) ^ (v326 - ((2 * v326 + 40) & 0x20) - 124) ^ 0x8F;
  v329 = (BYTE1(v304) ^ 0xB51200F3) + ((v304 >> 8) & 0x4D ^ 0x4AA1100C) - ((BYTE1(v304) ^ 0xB51200F3) & 0x1502004D);
  v313[1] = byte_10023F3C0[((BYTE2(v305) ^ 0x5DB9470C) - ((2 * (BYTE2(v305) ^ 0x5DB9470C)) & 0x2B6086DEu) - 1213047953) ^ 0xEA0B1C4ALL] ^ 0x53;
  v330 = v329 ^ ((v329 ^ 0x154EEFA3) - ((2 * (v329 ^ 0x154EEFA3) + 2) & 0x55A5EAF0) + 718468473);
  v331 = ((v308 >> 23) & 0x12A ^ 0x20) + (HIBYTE(v308) ^ 0xBC7EE7CF);
  v313[6] = BYTE1(v304) ^ byte_100227C00[(v330 ^ 0xBFEC5893 ^ (v328 - ((2 * v328 + 6) & 0xFF1F7B6E) + 2140126650)) + 2] ^ 0xFB;
  v332 = (((v305 >> 8) & 3 ^ 0x1DA5B203) - ((v305 >> 8) & 3) + BYTE1(v305)) ^ 0x1F2CB227;
  v313[2] = BYTE1(v305) ^ 0x49 ^ byte_100227C00[(v332 - ((2 * v332) & 0x10000ACu) - 1048419242) ^ 0xC30B64C3];
  v313[9] = byte_10023F3C0[(((2 * (BYTE2(v310) ^ 0x454478D5)) & 0x8288A006) - (BYTE2(v310) ^ 0x454478D5) - 1400231684) ^ 0xE9CE505ALL] ^ 0xD5;
  v333 = 2 * v331 - ((4 * v331 + 172) & 0x9C) + 420;
  v334 = v331 + (v333 & 0xAE ^ 0xB1018B) + ((2 * v333) & 0x154 ^ 0xFFFFFEEB) + 1;
  v335 = v334 - 1752138146 + (~(2 * v334 - 2053099654) | 0x567F32BF);
  v313[8] = byte_1002246D0[v335 ^ 0x54C066AB] ^ v335 ^ 0x7A;
  LODWORD(v335) = BYTE1(v310) ^ 0x4E;
  v336 = v335
       + (((BYTE1(v310) ^ 0xFFFFFFC9) + 1) ^ 0x7FAFF2C6)
       + ((2 * ((BYTE1(v310) ^ 0xFFFFFFC9) + 1)) & 0xFF5FE58C)
       - 2142237382;
  LODWORD(v335) = ((v336 - ((2 * v336) & 0x40F025BA) + 544740061) ^ 0xDF87ED2D) + v335;
  LOBYTE(v335) = (((v335 + 64) & 0x7D ^ 0x8B) - ((v335 + 64 - ((2 * v335) & 0x80)) & 0x82)) ^ byte_100227C00[((_DWORD)v335 + 393947968 - ((2 * (_DWORD)v335) & 0x2EF65680)) ^ 0x177B2B42];
  LOBYTE(v335) = (26 - ((v335 & 0x11) + (v335 | 0x1B))) ^ 0x5A | (40 - ((v335 & 8) + (v335 | 0xFD))) ^ 0x21;
  v337 = (((v306 >> 3) ^ 0xD)
        + ((v306 >> 3) & 0x1C ^ 0x6EDFFD90)
        - (((v306 >> 3) ^ 0xD) & 0x1C)) ^ 0x6EDFFD92 | (((32 * v306) ^ 0x44DA0360)
                                                                       - 258508686
                                                                       - ((2 * ((32 * v306) ^ 0x44DA0360)) & 0xE12EF0C0)) ^ 0xF0977872;
  v338 = v337 - ((2 * v337) & 0x78) - 68;
  HIDWORD(v325) = v338 ^ 0xD;
  LODWORD(v325) = (v338 ^ 0x60) << 24;
  v313[10] = (v335 - ((2 * v335) & 0xDA) - 19) ^ 0xED;
  LODWORD(v335) = (BYTE2(v304) ^ 0xBF | 0x602DE03A) - (BYTE2(v304) ^ 0xBF | 0x9FD21FC5) - 1613619259;
  v313[5] = byte_10023F3C0[((v335 & 0x402C5BA9 ^ 0x9C01981) + (v335 & 0x2001A456 ^ 0x2132053) - 1) ^ 0x6BFED9F6] ^ 0x20;
  LODWORD(v335) = byte_100217550[((v325 >> 29) + (~(2 * (v325 >> 29)) | 0xF7) - 123) ^ 0xF0];
  HIDWORD(v325) = v335 ^ 8;
  LODWORD(v325) = ~(_DWORD)v335 << 24;
  LODWORD(v335) = (v325 >> 28) - ((2 * (v325 >> 28)) & 0xFFFFFFAE);
  LOBYTE(v338) = ((4 * ((v335 - 41) >> 1)) ^ 0xF6) + ((v335 - 41) & 0x7F ^ 0x85);
  v313[15] = (40 - v335) & 0x80 ^ (((((_DWORD)v335 - 41) & 0x80) != 0) | 0xBE) ^ ((v335 - 41) >> 4) ^ ((v338 & 0xF8 ^ 0xD0) + (v338 ^ 0x28) - ((v338 ^ 0x28) & 0xF8)) ^ 0xE3;
  v313[*((_QWORD *)&v343 + 1)] = HIBYTE(v305) ^ ~byte_1002246D0[HIBYTE(v305) ^ 0x46];
  LODWORD(v335) = ((v304 & 0xD4 ^ 0x9DBB5385) - (v304 | 0xFFFFFFD4) - 2) ^ 0xADB286DD;
  LODWORD(v335) = byte_100217550[(v335 - ((2 * (_DWORD)v335) & 0x40002756) - 489669717) ^ 0xD2D9EEA3];
  HIDWORD(v325) = v335 ^ 8;
  LODWORD(v325) = ~(_DWORD)v335 << 24;
  v313[7] = ((v325 >> 28) - ((2 * (v325 >> 28)) & 0xEA) + 117) ^ (((v325 >> 28)
                                                                                  - ((2 * (v325 >> 28)) & 0xEA)
                                                                                  + 117) >> 7) ^ (((v325 >> 28) - ((2 * (v325 >> 28)) & 0xEA) + 117) >> 4) ^ 0x2F;
  LODWORD(v335) = byte_100217550[(1052464094
                                - (v305 ^ 0xEA | 0x3EBB53DE)
                                + (v305 ^ 0xEA | 0xC144AC21)) ^ 0xC144AC09];
  HIDWORD(v325) = v335 ^ 8;
  LODWORD(v325) = ~(_DWORD)v335 << 24;
  LODWORD(v335) = (v325 >> 28) - ((2 * (v325 >> 28)) & 0xFFFFFF8C) + 70;
  v313[3] = v335 ^ (((v325 >> 28) - ((2 * (v325 >> 28)) & 0x8C) + 70) >> 4) ^ (((v335 & 0x80) != 0) | 0x3E) ^ 0x5D;
  LODWORD(v341) = a22 + 410160491;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, unsigned __int8 *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)*(&off_100260750 + ((1596 * ((a22 + 410160491) > 0x10)) ^ (*(_DWORD *)(v33 - 228) - 119))) - 8))(13, a12, 4294967196, byte_1002246D0, 78, 218, v107, a15, a9, a10, v340, a12, a13, v341, a15, a16, a17, a18, a19,
           a20,
           11,
           1,
           4,
           v343,
           *((_QWORD *)&v343 + 1),
           a26,
           a27,
           a28,
           8,
           a30,
           3,
           a32);
}

void sub_1001EC03C()
{
  JUMPOUT(0x1001E7FECLL);
}

void sub_1001EC080(int a1, void *a2, int a3, int a4, int a5, int a6, void *a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,int a33,int a34,uint64_t a35,int a36,int a37,uint64_t a38,uint64_t a39)
{
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v47;

  v47 = v39;
  free(v40);
  free(a8);
  free(v41);
  free(a2);
  free(a7);
  free(v43);
  free(*(void **)(v42 - 216));
  free(v47);
  JUMPOUT(0x1001EC0F8);
}

uint64_t sub_1001EC1A0@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  _BYTE *v12;
  unsigned int v13;

  v11 = v6 < v4;
  if (v11 == v7 - 1908388312 < v4)
    v11 = v7 - 1908388312 < v6;
  v12 = (_BYTE *)(v9 + (v7 | ((unint64_t)(v7 < v5) << 32)) - 200210036);
  v13 = (((v9 + v7 - 200210036) ^ *(_DWORD *)(*(_QWORD *)(v3 + 2488) + (*(_DWORD *)(v2 + 3008) & a1))) & 0x7FFFFFFF)
      * v1;
  *v12 ^= byte_100226380[(v7 - 200210036) & (v8 ^ 0x2C0) | (16 * (((v13 ^ HIWORD(v13)) * v1) >> 24))] ^ (95 * (v13 ^ BYTE2(v13)));
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * ((28 * !v11) ^ v8)) - 8))();
}

uint64_t sub_1001EC274()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (v0 ^ (23 * (v1 == 174210216)))) - 35 * (v0 ^ 0x17Bu) + 696))();
}

uint64_t sub_1001EC2B8@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char v10;
  unint64_t v11;

  v9 = (char *)(v7 + (v5 + 826299658));
  v10 = *v9;
  LODWORD(v9) = ((v9 ^ *(_DWORD *)(*(_QWORD *)(v3 + 2488) + (*(_DWORD *)(v2 + 3008) & a1))) & 0x7FFFFFFF)
              * v1;
  v11 = (v9 ^ (v9 >> 16)) * v1;
  **(_BYTE **)(v6 + 8) = byte_1002408E0[v11 >> 24] ^ v10 ^ byte_10021B9F0[(v11 >> 24) + 2] ^ byte_10023DB50[(v11 >> 24) + 1] ^ v11 ^ (85 * BYTE3(v11));
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v8 + 8 * (v4 - 539)) - 4))(-1243892352);
}

void sub_1001EC394()
{
  void *v0;

  free(v0);
  JUMPOUT(0x1001EC39CLL);
}

char *sub_1001EC3DC(char *result, char *a2, unint64_t a3)
{
  unint64_t v3;
  char v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;
  BOOL v11;
  char v12;
  unint64_t v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;

  if (((a2 ^ result) & 7) != 0)
  {
    if ((a3 + 7) >= 8)
      return (char *)((uint64_t (*)(void))((char *)&loc_1001EC4B0 + 4 * byte_100215A50[a3 & 7]))();
  }
  else
  {
    v3 = -(int)result & 7;
    switch((int)v3)
    {
      case 1:
        goto LABEL_11;
      case 2:
        goto LABEL_10;
      case 3:
        goto LABEL_9;
      case 4:
        goto LABEL_8;
      case 5:
        goto LABEL_7;
      case 6:
        goto LABEL_6;
      case 7:
        v4 = *result++;
        *a2++ = v4;
LABEL_6:
        v5 = *result++;
        *a2++ = v5;
LABEL_7:
        v6 = *result++;
        *a2++ = v6;
LABEL_8:
        v7 = *result++;
        *a2++ = v7;
LABEL_9:
        v8 = *result++;
        *a2++ = v8;
LABEL_10:
        v9 = *result++;
        *a2++ = v9;
LABEL_11:
        v10 = *result++;
        *a2++ = v10;
        break;
      default:
        break;
    }
    v11 = a3 >= v3;
    v12 = a3 - v3;
    if (!v11)
      v12 = 0;
    v13 = v12 & 7;
    switch(v13)
    {
      case 0uLL:
        return result;
      case 1uLL:
        goto LABEL_24;
      case 2uLL:
        goto LABEL_23;
      case 3uLL:
        goto LABEL_22;
      case 4uLL:
        goto LABEL_21;
      case 5uLL:
        goto LABEL_20;
      case 6uLL:
        goto LABEL_19;
      case 7uLL:
        v14 = *result++;
        *a2++ = v14;
LABEL_19:
        v15 = *result++;
        *a2++ = v15;
LABEL_20:
        v16 = *result++;
        *a2++ = v16;
LABEL_21:
        v17 = *result++;
        *a2++ = v17;
LABEL_22:
        v18 = *result++;
        *a2++ = v18;
LABEL_23:
        v19 = *result++;
        *a2++ = v19;
LABEL_24:
        *a2 = *result;
        break;
      default:
        result = (char *)((uint64_t (*)(void))((char *)&loc_1001EC4FC + 4 * byte_100215A5F[(v13 >> 3) & 7]))();
        break;
    }
  }
  return result;
}

_BYTE *sub_1001EC59C(_BYTE *result, char a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -(int)result & 7;
  if (v3 > a3)
    LODWORD(v3) = a3;
  switch((int)v3)
  {
    case 1:
      goto LABEL_10;
    case 2:
      goto LABEL_9;
    case 3:
      goto LABEL_8;
    case 4:
      goto LABEL_7;
    case 5:
      goto LABEL_6;
    case 6:
      goto LABEL_5;
    case 7:
      *result++ = a2;
LABEL_5:
      *result++ = a2;
LABEL_6:
      *result++ = a2;
LABEL_7:
      *result++ = a2;
LABEL_8:
      *result++ = a2;
LABEL_9:
      *result++ = a2;
LABEL_10:
      *result++ = a2;
      break;
    default:
      break;
  }
  v4 = a3 - v3;
  v6 = v4;
  v5 = v4 & 7;
  switch(v6)
  {
    case 0uLL:
      return result;
    case 1uLL:
      goto LABEL_20;
    case 2uLL:
      goto LABEL_19;
    case 3uLL:
      goto LABEL_18;
    case 4uLL:
      goto LABEL_17;
    case 5uLL:
      goto LABEL_16;
    case 6uLL:
      goto LABEL_15;
    case 7uLL:
      *result++ = a2;
LABEL_15:
      *result++ = a2;
LABEL_16:
      *result++ = a2;
LABEL_17:
      *result++ = a2;
LABEL_18:
      *result++ = a2;
LABEL_19:
      *result++ = a2;
LABEL_20:
      *result = a2;
      break;
    default:
      result = (_BYTE *)((uint64_t (*)(void))((char *)&loc_1001EC62C + 4 * byte_100215A76[(v5 >> 3) & 7]))();
      break;
  }
  return result;
}

uint64_t X509PolicySetFlagsForCommonNames(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  unint64_t v4[2];

  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  v4[1] = 0xAAAAAAAAAAAAAAAALL;
  result = X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v4);
  if (!(_DWORD)result)
  {
    result = compare_octet_string((uint64_t)&iPhoneCAName, (uint64_t)v4);
    if ((_DWORD)result)
    {
      result = compare_octet_string((uint64_t)&CodeSigningCAName, (uint64_t)v4);
      if ((_DWORD)result)
      {
        result = compare_octet_string_partial((uint64_t)&MFi4AccessoryCAName, (uint64_t)v4);
        if ((_DWORD)result)
        {
          result = compare_octet_string_partial((uint64_t)&MFi4AttestationCAName, (uint64_t)v4);
          if ((_DWORD)result)
          {
            result = compare_octet_string_partial((uint64_t)&MFi4ProvisioningCAName, (uint64_t)v4);
            if ((_DWORD)result)
              return result;
            v3 = 0x1000000000;
          }
          else
          {
            v3 = 0x800000000;
          }
        }
        else
        {
          v3 = 0x400000000;
        }
      }
      else
      {
        v3 = 8;
      }
    }
    else
    {
      v3 = 3840;
    }
    *(_QWORD *)(a1 + 240) |= v3;
  }
  return result;
}

double X509PolicySetFlagsForMFI(uint64_t a1)
{
  double result;
  time_t v3;
  tm v4;
  time_t v5;
  unint64_t v6[2];

  v6[0] = 0xAAAAAAAAAAAAAAAALL;
  v6[1] = 0xAAAAAAAAAAAAAAAALL;
  if (!X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v6))
  {
    if (compare_octet_string_partial((uint64_t)&MFICommonNamePrefix, (uint64_t)v6))
      goto LABEL_3;
    v5 = 0;
    if (!X509CertificateGetNotBefore(a1, &v5))
    {
      memset(&v4, 0, sizeof(v4));
      strptime("2006-05-31", "%F", &v4);
      v3 = timegm(&v4);
      result = difftime(v3, v5);
      if (result < 0.0)
      {
        *(_QWORD *)(a1 + 240) |= 0x8000000uLL;
LABEL_3:
        if (!compare_octet_string_partial((uint64_t)&MFi4ProvisioningHostNamePrefix, (uint64_t)v6))
          *(_QWORD *)(a1 + 240) |= 0x1000000000uLL;
      }
    }
  }
  return result;
}

uint64_t X509PolicySetFlagsForRoots(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (!result)
    return result;
  v3 = result;
  if (*(_BYTE *)(result + 16))
  {
    result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootCASPKI);
    if (!(_DWORD)result
      || (result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG2SPKI), !(_DWORD)result)
      || (result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG3SPKI), !(_DWORD)result))
    {
      v5 = *(_QWORD *)(a2 + 240) | 0x58E30653FFF8;
      goto LABEL_11;
    }
  }
  v4 = *(_QWORD *)(v3 + 8);
  if ((v4 & 0x1000000) != 0)
  {
    result = compare_octet_string(a2 + 88, (uint64_t)&UcrtRootSpki);
    if (!(_DWORD)result)
    {
      v5 = *(_QWORD *)(a2 + 240) | 0x1000000;
      goto LABEL_11;
    }
LABEL_13:
    if (*(_BYTE *)(v3 + 17))
      result = X509PolicySetFlagsForTestAnchor((_QWORD *)v3, a2);
    goto LABEL_15;
  }
  if ((v4 & 0x1C00000000) == 0)
    goto LABEL_15;
  result = compare_octet_string(a2 + 88, (uint64_t)&MFi4RootSpki);
  if ((_DWORD)result)
    goto LABEL_13;
  v5 = *(_QWORD *)(a2 + 240) | 0x1C00000000;
LABEL_11:
  *(_QWORD *)(a2 + 240) = v5;
LABEL_15:
  if (*(_BYTE *)(v3 + 16))
  {
    if (*(_BYTE *)(v3 + 17))
    {
      result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootCASPKI);
      if (!(_DWORD)result
        || (result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootG2SPKI), !(_DWORD)result)
        || (result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootG3SPKI), !(_DWORD)result))
      {
        *(_QWORD *)(a2 + 240) |= 0x58E30653FFF8uLL;
      }
    }
    if (*(_BYTE *)(v3 + 16) && *(_BYTE *)(v3 + 17))
    {
      result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootECCSPKI);
      if (!(_DWORD)result)
        *(_QWORD *)(a2 + 240) |= 0x6400000uLL;
    }
  }
  return result;
}

uint64_t X509PolicySetFlagsForTestAnchor(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v5[2];
  unint64_t v6[2];

  v6[0] = 0;
  v6[1] = 0;
  v5[0] = 0;
  v5[1] = 0;
  result = X509CertificateParseSPKI((unint64_t *)(a2 + 88), v6, 0, v5);
  if (!(_DWORD)result)
  {
    result = compare_octet_string(a1[4], (uint64_t)v6);
    if (!(_DWORD)result)
    {
      result = compare_octet_string(a1[3], (uint64_t)v5);
      if (!(_DWORD)result)
        *(_QWORD *)(a2 + 240) |= a1[1];
    }
  }
  return result;
}

uint64_t X509PolicyCheckForBlockedKeys(uint64_t a1)
{
  uint64_t result;

  result = compare_octet_string(a1 + 88, (uint64_t)&BlockedYonkersSPKI);
  if (!(_DWORD)result)
    *(_QWORD *)(a1 + 240) &= 0xFFFFFFFFFFF3FFFFLL;
  return result;
}

int *find_digest(uint64_t a1)
{
  unint64_t v2;
  int *result;

  v2 = 0;
  while (1)
  {
    result = (int *)compare_octet_string_raw((uint64_t)&digests[v2 / 4 + 2], *(const void **)a1, *(_QWORD *)(a1 + 8));
    if (!(_DWORD)result)
      break;
    v2 += 32;
    if (v2 == 160)
      return 0;
  }
  if (v2 <= ~(unint64_t)digests)
    return &digests[v2 / 4];
  __break(0x5513u);
  return result;
}

int *find_digest_by_type(int *result)
{
  unint64_t v1;

  v1 = 0;
  while (digests[v1 / 4] != (_DWORD)result)
  {
    v1 += 32;
    if (v1 == 160)
      return 0;
  }
  if (v1 <= ~(unint64_t)digests)
    return &digests[v1 / 4];
  __break(0x5513u);
  return result;
}

uint64_t find_digestOID_for_signingOID(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  void *v6;

  if (!compare_octet_string_raw(a1, &sha1WithRSA_oid, 9uLL)
    || !compare_octet_string_raw(a1, &sha1WithECDSA_oid, 7uLL))
  {
    v6 = &CTOidSha1;
    v4 = 5;
    goto LABEL_11;
  }
  v4 = 9;
  if (!compare_octet_string_raw(a1, &sha256WithRSA_oid, 9uLL))
  {
    v6 = &CTOidSha256;
    goto LABEL_11;
  }
  if (!compare_octet_string_raw(a1, &sha256WithECDSA_oid, 8uLL))
  {
    v6 = &CTOidSha256;
LABEL_18:
    v4 = 9;
    goto LABEL_11;
  }
  v4 = 9;
  if (!compare_octet_string_raw(a1, &sha384WithRSA_oid, 9uLL))
  {
    v6 = &CTOidSha384;
    goto LABEL_11;
  }
  if (!compare_octet_string_raw(a1, &sha384WithECDSA_oid, 8uLL))
  {
    v6 = &CTOidSha384;
    goto LABEL_18;
  }
  v4 = 9;
  if (compare_octet_string_raw(a1, &sha512WithRSA_oid, 9uLL))
  {
    if (compare_octet_string_raw(a1, &sha512WithECDSA_oid, 8uLL))
      return 0;
    v6 = &CTOidSha512;
    goto LABEL_18;
  }
  v6 = &CTOidSha512;
LABEL_11:
  *a2 = v6;
  a2[1] = v4;
  return 1;
}

unint64_t validateSignatureRSA(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  unint64_t result;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  __int128 v20;
  unint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unint64_t v27;
  __int16 v28;
  uint64_t vars0;

  result = 0;
  v25 = 0;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            result = compare_octet_string((uint64_t)&rsaEncryption, (uint64_t)(a5 + 7));
            if (!(_DWORD)result
              || (result = validateOIDs((uint64_t)&rsaAlgs, (uint64_t)(a5 + 3), (uint64_t)(a5 + 7)), (_DWORD)result))
            {
              v23 = 0xAAAAAAAAAAAAAAAALL;
              v24 = 0xAAAAAAAAAAAAAAAALL;
              v12 = a5[9];
              v11 = a5[10];
              if (__CFADD__(v12, v11))
                goto LABEL_31;
              if (v12 > v12 + v11)
                goto LABEL_32;
              v23 = a5[9];
              v24 = v12 + v11;
              if (!v11 || (result = ccder_blob_check_null((uint64_t)&v23), (_DWORD)result))
              {
                if (!__CFADD__(a1, a2))
                {
                  if (a1 + a2 >= a1)
                  {
                    result = ccder_decode_rsa_pub_n(a1);
                    if (!result)
                      return result;
                    v13 = result;
                    if (result >> 58)
                    {
LABEL_33:
                      __break(0x550Cu);
                      return result;
                    }
                    v14 = result << 6;
                    if (result << 6 < 0x400)
                      return 0;
                    v27 = 0xAAAAAAAAAAAAAAAALL;
                    v28 = -21846;
                    v26 = 6;
                    if (&vars0 != (uint64_t *)82)
                    {
                      v15 = a5[4];
                      LOBYTE(v27) = v15;
                      if ((unint64_t)&v26 <= 0xFFFFFFFFFFFFFFFDLL)
                      {
                        if (v15 <= 9)
                        {
                          v16 = __memcpy_chk((char *)&v27 + 1, a5[3]);
                          if (v14 > 0x1068)
                            return 0;
                          result = __chkstk_darwin(v16);
                          v18 = (unint64_t *)((char *)&v22 - v17);
                          v19 = 0;
                          *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
                          *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
                          do
                          {
                            v21 = &v18[v19 / 8];
                            *(_OWORD *)v21 = v20;
                            *((_OWORD *)v21 + 1) = v20;
                            v19 += 32;
                          }
                          while (v17 != v19);
                          if (v17 >= 1)
                          {
                            *v18 = v13;
                            if (ccrsa_import_pub((char *)&v22 - v17, a2, a1))
                              return 0;
                            if (!ccrsa_verify_pkcs1v15_allowshortsigs(v18, &v26, a4, a3, a5[12], a5[11], &v25))return v25 != 0;
                            result = 0;
                            v25 = 0;
                            return result;
                          }
                        }
                        goto LABEL_32;
                      }
                    }
                    goto LABEL_31;
                  }
LABEL_32:
                  __break(0x5519u);
                  goto LABEL_33;
                }
LABEL_31:
                __break(0x5513u);
                goto LABEL_32;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL validateOIDs(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  BOOL v7;

  v6 = 0;
  v7 = 1;
  do
  {
    if (!compare_octet_string(a1, a2) && !compare_octet_string(a1 + 16, a3))
      break;
    v7 = v6 < 3;
    a1 += 32;
    ++v6;
  }
  while (v6 != 4);
  return v7;
}

_UNKNOWN **oidForPubKeyLength()
{
  uint64_t v0;
  int is_supported;
  _UNKNOWN **v2;
  _UNKNOWN **v3;
  _UNKNOWN **v4;

  v0 = ccec_x963_import_pub_size();
  is_supported = ccec_keysize_is_supported();
  v2 = &CTOidSECP256r1;
  v3 = &CTOidSECP521r1;
  v4 = &CTOidSECP384r1;
  if (v0 != 384)
    v4 = 0;
  if (v0 != 521)
    v3 = v4;
  if (v0 != 256)
    v2 = v3;
  if (is_supported)
    return v2;
  else
    return 0;
}

uint64_t validateSignatureEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;

  result = 0;
  HIBYTE(v22) = 0;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (!compare_octet_string((uint64_t)&ecPublicKey, a5 + 56)
              || (result = validateOIDs((uint64_t)&ecAlgs, a5 + 24, a5 + 56), (_DWORD)result))
            {
              result = ccec_cp_for_oid((int **)(a5 + 72));
              if (result)
              {
                v11 = *(_QWORD *)result;
                if (*(_QWORD *)result >> 61 || !is_mul_ok(8 * v11, 3uLL))
                {
                  __break(0x550Cu);
                }
                else
                {
                  v12 = 24 * v11;
                  v13 = __CFADD__(v12, 16);
                  v14 = v12 + 16;
                  if (!v13 && v14 < 0xFFFFFFFFFFFFFFF0)
                  {
                    result = __chkstk_darwin(result);
                    v17 = (uint64_t *)((char *)&v22 - v15);
                    v18 = 0;
                    do
                    {
                      v19 = &v17[v18 / 8];
                      *v19 = 0xAAAAAAAAAAAAAAAALL;
                      v19[1] = 0xAAAAAAAAAAAAAAAALL;
                      v18 += 16;
                    }
                    while (v15 != v18);
                    if (v16 >= 0x10)
                    {
                      *v17 = result;
                      if (v15 >= 1)
                      {
                        if (!ccec_import_pub())
                        {
                          result = ccec_x963_import_pub_size(a2);
                          v21 = *(_QWORD *)(a5 + 88);
                          v20 = *(_QWORD *)(a5 + 96);
                          if (result == 256 && v20 == 64)
                          {
                            if (v21 < 0xFFFFFFFFFFFFFFE0)
                            {
                              if (!ccec_verify_composite(v17, a4, a3, *(_QWORD *)(a5 + 88), v21 + 32, (char *)&v22 + 7))return HIBYTE(v22) != 0;
                              goto LABEL_24;
                            }
LABEL_31:
                            __break(0x5513u);
                            return result;
                          }
                          if (ccec_verify(v17, a4, a3, v20, v21, (char *)&v22 + 7))
LABEL_24:
                            HIBYTE(v22) = 0;
                        }
                        return HIBYTE(v22) != 0;
                      }
LABEL_30:
                      __break(0x5519u);
                      goto LABEL_31;
                    }
LABEL_29:
                    __break(1u);
                    goto LABEL_30;
                  }
                }
                __break(0x5500u);
                goto LABEL_29;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t ccec_cp_for_oid(int **a1)
{
  int *v1;
  int *v4;
  int v6;
  int v7;

  if (!a1)
    return 0;
  v1 = a1[1];
  if (v1 != (int *)7)
  {
    if (v1 == (int *)10 && *(_QWORD *)*a1 == 0x33DCE48862A0806 && *((_WORD *)*a1 + 4) == 1793)
      return ccec_cp_256();
    return 0;
  }
  v4 = *a1;
  if (**a1 == -2127887098 && *(int *)((char *)*a1 + 3) == 570426497)
    return ccec_cp_384();
  v6 = *v4;
  v7 = *(int *)((char *)v4 + 3);
  if (v6 != -2127887098 || v7 != 587203713)
    return 0;
  return ccec_cp_521();
}

uint64_t compressECPublicKey(_QWORD *a1, int **a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  unint64_t v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;

  v7 = (_QWORD *)ccec_cp_for_oid(a2);
  if (!v7)
    return 655366;
  v8 = v7;
  v9 = *v7;
  if (*v7 >> 61 || !is_mul_ok(8 * v9, 3uLL))
  {
    __break(0x550Cu);
    goto LABEL_19;
  }
  v10 = 24 * v9;
  v11 = __CFADD__(v10, 16);
  v12 = v10 + 16;
  if (v11 || v12 >= 0xFFFFFFFFFFFFFFF0)
LABEL_19:
    __break(0x5500u);
  result = __chkstk_darwin(v7);
  v16 = (uint64_t *)((char *)&v19 - v14);
  v17 = 0;
  do
  {
    v18 = &v16[v17 / 8];
    *v18 = 0xAAAAAAAAAAAAAAAALL;
    v18[1] = 0xAAAAAAAAAAAAAAAALL;
    v17 += 16;
  }
  while (v14 != v17);
  if (v15 < 0x10)
    goto LABEL_21;
  *v16 = v8;
  if (v14 < 1)
  {
LABEL_20:
    __break(0x5519u);
LABEL_21:
    __break(1u);
    return result;
  }
  result = ccec_import_pub(v8, a1[1], *a1, (char *)&v19 - v14);
  if (!(_DWORD)result)
  {
    result = ccec_compressed_x962_export_pub_size(v8);
    if (result == a4)
    {
      if (!a3 || a4)
        return ccec_compressed_x962_export_pub(v16, a3);
      goto LABEL_20;
    }
    return 393220;
  }
  return result;
}

unint64_t decompressECPublicKey(uint64_t a1, int **a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  unint64_t v10;
  unint64_t result;
  uint64_t v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = (uint64_t *)ccec_cp_for_oid(a2);
  if (!v6)
    return 655366;
  v7 = *v6;
  if ((unint64_t)*v6 >> 61 || !is_mul_ok(8 * v7, 3uLL))
LABEL_22:
    __break(0x550Cu);
  v8 = 24 * v7;
  v9 = __CFADD__(v8, 16);
  v10 = v8 + 16;
  if (v9 || v10 >= 0xFFFFFFFFFFFFFFF0)
  {
LABEL_21:
    __break(0x5500u);
    goto LABEL_22;
  }
  result = __chkstk_darwin(v6);
  v14 = (unint64_t *)((char *)&v18 - v12);
  v15 = 0;
  do
  {
    v16 = &v14[v15 / 8];
    *v16 = 0xAAAAAAAAAAAAAAAALL;
    v16[1] = 0xAAAAAAAAAAAAAAAALL;
    v15 += 16;
  }
  while (v12 != v15);
  if (v13 < 0x10)
    goto LABEL_24;
  *v14 = result;
  if (v12 >= 1)
  {
    v17 = ccec_compressed_x962_import_pub();
    if (!(_DWORD)v17)
    {
      result = cczp_bitlen(*v14);
      if (result < 0xFFFFFFFFFFFFFFF9)
      {
        if (!a3 || a4)
        {
          if ((((result + 7) >> 2) | 1) == a4)
            v17 = 0;
          else
            v17 = 393220;
          ccec_export_pub(v14, a3);
          return v17;
        }
        goto LABEL_23;
      }
      goto LABEL_21;
    }
    return v17;
  }
LABEL_23:
  __break(0x5519u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t CMSParseContentInfoSignedDataWithOptions(char *a1, uint64_t a2, unint64_t *a3, char a4)
{
  int v4;
  int v7;
  uint64_t result;
  uint64_t v9;
  _QWORD *v10;
  char *v11;
  int v12;
  char *v13;
  char *v15;
  int v16;
  char *v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  size_t v26;
  __int16 v27;
  char *v28;
  char *v29;
  unint64_t v30[3];
  __int16 v31;
  char *v32;
  unint64_t v33;
  size_t v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  char *v37;
  char *v38;
  unint64_t v39;
  unsigned __int8 v40;
  unint64_t v41;

  v28 = (char *)0xAAAAAAAAAAAAAAAALL;
  v29 = (char *)0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a1, a2))
    goto LABEL_114;
  if (&a1[a2] < a1)
    goto LABEL_112;
  v4 = 65537;
  v28 = a1;
  v29 = &a1[a2];
  v27 = 0;
  v26 = 0xAAAAAAAAAAAAAAAALL;
  v7 = ccder_blob_decode_ber_tl((uint64_t)&v28, 0x2000000000000010, (_BYTE *)&v27 + 1, &v26);
  result = 65537;
  if (v7)
  {
    v24 = (char *)0xAAAAAAAAAAAAAAAALL;
    v25 = (char *)0xAAAAAAAAAAAAAAAALL;
    if (__CFADD__(v28, v26))
      goto LABEL_114;
    if (v28 > &v28[v26] || &v28[v26] > v29)
      goto LABEL_112;
    v24 = v28;
    v25 = &v28[v26];
    if (ccder_blob_decode_tl(&v24, 6, &v26))
    {
      if (v25 < v24 || v26 > v25 - v24)
        goto LABEL_112;
      if (compare_octet_string_raw((uint64_t)&pkcs7_signedData_oid, v24, v26))
        return 65539;
      if (__CFADD__(v24, v26))
        goto LABEL_114;
      if (v24 > &v24[v26] || &v24[v26] > v25)
        goto LABEL_112;
      v24 += v26;
      if (!ccder_blob_decode_ber_tl((uint64_t)&v24, 0xA000000000000000, &v27, &v26))
        return 65540;
      v22 = (char *)0xAAAAAAAAAAAAAAAALL;
      v23 = (char *)0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v24, v26))
        goto LABEL_114;
      if (v24 > &v24[v26] || &v24[v26] > v25)
        goto LABEL_112;
      v22 = v24;
      v23 = &v24[v26];
      v31 = 0;
      memset(v30, 170, sizeof(v30));
      if ((ccder_blob_decode_ber_tl((uint64_t)&v22, 0x2000000000000010, (_BYTE *)&v31 + 1, v30) & 1) == 0)
        return 131073;
      if (__CFADD__(v22, v30[0]))
        goto LABEL_114;
      v9 = 131080;
      if (&v22[v30[0]] != v23)
        return 131082;
      v10 = a3 + 11;
      if (!ccder_blob_decode_uint64(&v22, a3 + 11))
        return 131074;
      result = 131092;
      if (*v10 <= 4uLL && ((1 << *v10) & 0x1A) != 0)
      {
        if (!ccder_blob_eat_ber_inner((unint64_t *)&v22, 0x2000000000000011, 0, 125))
          return 131075;
        v35 = 0;
        v34 = 0;
        if ((ccder_blob_decode_ber_tl((uint64_t)&v22, 0x2000000000000010, &v35, &v34) & 1) == 0)
          return 131076;
        v32 = (char *)0xAAAAAAAAAAAAAAAALL;
        v33 = 0xAAAAAAAAAAAAAAAALL;
        if (__CFADD__(v22, v34))
          goto LABEL_114;
        if (v22 > &v22[v34] || &v22[v34] > v23)
          goto LABEL_112;
        v32 = v22;
        v33 = (unint64_t)&v22[v34];
        if (!ccder_blob_decode_tl(&v32, 6, &v34))
          return 131077;
        if (v33 < (unint64_t)v32 || v34 > v33 - (unint64_t)v32)
          goto LABEL_112;
        if (compare_octet_string_raw((uint64_t)&pkcs7_data_oid, v32, v34))
          return 131078;
        if (__CFADD__(v32, v34))
          goto LABEL_114;
        v11 = &v32[v34];
        if (v32 > &v32[v34] || (unint64_t)v11 > v33)
          goto LABEL_112;
        v32 += v34;
        v12 = v35;
        if (v11 != (char *)v33 || v35)
        {
          v40 = 0;
          v38 = (char *)v33;
          v39 = 0;
          v37 = v11;
          if (ccder_blob_decode_ber_tl((uint64_t)&v37, 0xA000000000000000, &v40, &v39))
          {
            if (!v12)
            {
              if (__CFADD__(v37, v39))
                goto LABEL_114;
              if (&v37[v39] != (char *)v33)
                return v9;
            }
            if (v37 > v38)
              goto LABEL_112;
            v32 = v37;
            v33 = (unint64_t)v38;
            v36 = 0;
            v16 = v40;
            if (v40 && !ccder_blob_decode_ber_tl((uint64_t)&v32, 0x2000000000000004, &v36, &v39))
              return 131079;
            v41 = 0;
            if (!ccder_blob_decode_tl(&v32, 4, &v41))
              return 131090;
            v17 = v32;
            v18 = v33;
            if (v33 < (unint64_t)v32)
              goto LABEL_112;
            v19 = v41;
            if (v41 > v33 - (unint64_t)v32)
              goto LABEL_112;
            a3[9] = (unint64_t)v32;
            a3[10] = v19;
            if (__CFADD__(v17, v19))
            {
LABEL_114:
              __break(0x5513u);
              return 0;
            }
            v20 = &v17[v19];
            if ((unint64_t)v20 > v18 || v17 > v20)
              goto LABEL_112;
            v32 = v20;
            if ((ccder_blob_decode_eoc((unint64_t *)&v32, v36) & 1) == 0)
              return 131089;
          }
          else
          {
            if (!v12)
              return v9;
            v16 = v40;
          }
          if ((ccder_blob_decode_eoc((unint64_t *)&v32, v16 != 0) & 1) == 0)
            return 131088;
          v11 = v32;
        }
        if (v11 > v23 || v22 > v11)
          goto LABEL_112;
        v22 = v11;
        if ((ccder_blob_decode_eoc((unint64_t *)&v22, v12 != 0) & 1) == 0)
          return 131081;
        v37 = (char *)0xAAAAAAAAAAAAAAAALL;
        v38 = (char *)0xAAAAAAAAAAAAAAAALL;
        if (v22 > v23)
          goto LABEL_112;
        v37 = v22;
        v38 = v23;
        if ((ccder_blob_decode_ber_tl((uint64_t)&v37, 0xA000000000000000, &v31, v30) & 1) == 0)
        {
          v13 = v22;
          v15 = v23;
          goto LABEL_86;
        }
        v32 = (char *)0xAAAAAAAAAAAAAAAALL;
        v33 = 0xAAAAAAAAAAAAAAAALL;
        if (!__CFADD__(v37, v30[0]))
        {
          if (v37 > &v37[v30[0]] || &v37[v30[0]] > v38)
            goto LABEL_112;
          v32 = v37;
          v33 = (unint64_t)&v37[v30[0]];
          if (!CMSParseImplicitCertificateSet((unint64_t *)&v32, a3[1], *a3, a3 + 3, a3 + 2))
            return 131085;
          if (!ccder_blob_decode_eoc((unint64_t *)&v32, v31))
            return 131086;
          v13 = v32;
          if (v32 - v37 >= 0 ? v32 >= v37 : v32 < v37)
          {
            if (v37 > v32)
              goto LABEL_112;
            v15 = v38;
            if (v32 > v38)
              goto LABEL_112;
            v22 = v32;
            v23 = v38;
LABEL_86:
            if (v13 <= v15)
            {
              v37 = v13;
              v38 = v15;
              if (ccder_blob_eat_ber_inner((unint64_t *)&v37, 0xA000000000000001, 0, 125))
              {
                if (v37 > v38)
                  goto LABEL_112;
                v22 = v37;
                v23 = v38;
              }
              if (!ccder_blob_eat_ber_inner((unint64_t *)&v22, 0x2000000000000011, &v30[1], 125))
                return 131083;
              if (v30[2] >= v30[1])
              {
                v21 = &v22[-v30[1]];
                if ((unint64_t)&v22[-v30[1]] <= v30[2] - v30[1])
                {
                  a3[5] = v30[1];
                  a3[6] = (unint64_t)v21;
                  if ((ccder_blob_decode_eoc((unint64_t *)&v22, HIBYTE(v31)) & 1) == 0)
                    return 131084;
                  if (!ccder_blob_decode_eoc((unint64_t *)&v22, v27))
                    return 65541;
                  if (v22 <= v25 && v24 <= v22)
                  {
                    v24 = v22;
                    if (ccder_blob_decode_eoc((unint64_t *)&v24, HIBYTE(v27)))
                    {
                      if ((a4 & 1) == 0 && v24 != v29)
                        return 65543;
                      return 0;
                    }
                    return (v4 + 5);
                  }
                }
              }
            }
LABEL_112:
            __break(0x5519u);
            return (v4 + 5);
          }
        }
        goto LABEL_114;
      }
    }
    else
    {
      return 65538;
    }
  }
  return result;
}

uint64_t ccder_blob_decode_ber_tl(uint64_t a1, uint64_t a2, _BYTE *a3, unint64_t *a4)
{
  int v8;
  uint64_t result;
  unint64_t v10;

  v10 = 0xAAAAAAAAAAAAAAAALL;
  v8 = ccder_blob_decode_tag(a1, &v10);
  result = 0;
  if (v8)
  {
    if (v10 == a2)
      return ccder_blob_decode_ber_len(a1, a3, a4);
  }
  return result;
}

uint64_t ccder_blob_decode_eoc(unint64_t *a1, int a2)
{
  uint64_t result;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;
  BOOL v8;
  unint64_t v9;

  if (!a2)
    return 1;
  v9 = 0xAAAAAAAAAAAAAAAALL;
  result = ccder_blob_decode_tl(a1, 0, &v9);
  if (!(_DWORD)result)
    return result;
  v4 = *a1;
  if (__CFADD__(*a1, v9))
  {
    __break(0x5513u);
LABEL_12:
    __break(0x5519u);
    return result;
  }
  v5 = v4 + v9;
  v6 = a1[1];
  if (v4 <= v4 + v9)
  {
    v7 = v5 >= v6;
    v8 = v5 == v6;
  }
  else
  {
    v7 = 1;
    v8 = 0;
  }
  if (!v8 && v7)
    goto LABEL_12;
  *a1 = v5;
  return 1;
}

uint64_t CMSParseContentInfoSignedData(char *a1, uint64_t a2, unint64_t *a3)
{
  return CMSParseContentInfoSignedDataWithOptions(a1, a2, a3, 0);
}

uint64_t CMSParseSignerInfos(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, __int128 *))
{
  uint64_t v3;
  unint64_t v4;
  unsigned int v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int *digest;
  int *v14;
  unsigned int v15;
  uint64_t result;
  unint64_t v17;
  unsigned int v18;
  uint64_t v19;
  _OWORD *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  int v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  int *v33;
  unsigned int v34;
  unint64_t v35;
  _OWORD *v36;
  unint64_t v37;
  BOOL v38;
  unint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  unsigned int v48;
  int v49;
  uint64_t v50;
  _OWORD *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  unsigned __int8 v60;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unsigned __int8 v71;
  unint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  unint64_t v84;
  unint64_t v85;

  v84 = 0xAAAAAAAAAAAAAAAALL;
  v85 = 0xAAAAAAAAAAAAAAAALL;
  v4 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  if (__CFADD__(v4, v3))
    goto LABEL_93;
  if (v4 > v4 + v3)
    goto LABEL_92;
  v84 = *(_QWORD *)(a1 + 40);
  v85 = v4 + v3;
  v72 = 0xAAAAAAAAAAAAAAAALL;
  if (v4 >= v4 + v3)
  {
    v48 = 0;
    result = 0;
    if (v3)
      return (v48 << 8) | 0x30008;
    return result;
  }
  v6 = 0;
  v60 = 0;
  v7 = 256;
  while (1)
  {
    v71 = 0;
    v82 = 0u;
    v83 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    DWORD2(v83) = 327681;
    LOBYTE(v82) = v6 + 1;
    if ((ccder_blob_decode_ber_tl((uint64_t)&v84, 0x2000000000000010, &v71, &v72) & 1) == 0)
    {
      v49 = 196609;
      return v7 | v49;
    }
    v69 = 0xAAAAAAAAAAAAAAAALL;
    v70 = 0xAAAAAAAAAAAAAAAALL;
    if (__CFADD__(v84, v72))
      goto LABEL_93;
    if (v84 > v84 + v72 || v84 + v72 > v85)
      goto LABEL_92;
    v69 = v84;
    v70 = v84 + v72;
    if ((ccder_blob_decode_uint64(&v69, &v73) & 1) == 0)
    {
      v49 = 196610;
      return v7 | v49;
    }
    v9 = v69;
    v8 = v70;
    v67 = 0xAAAAAAAAAAAAAAAALL;
    v68 = 0xAAAAAAAAAAAAAAAALL;
    if (v69 > v70)
      goto LABEL_92;
    v67 = v69;
    v68 = v70;
    v65 = v69;
    v66 = v70;
    if (!ccder_blob_decode_tl(&v69, 0x2000000000000010, &v72))
      break;
    v10 = v69;
LABEL_19:
    if (__CFADD__(v72, v10 - v9))
      goto LABEL_94;
    if (v72 + v10 - v9 > v8 - v9)
      goto LABEL_92;
    *((_QWORD *)&v73 + 1) = v9;
    *(_QWORD *)&v74 = v72 + v10 - v9;
    if (__CFADD__(v10, v72))
      goto LABEL_93;
    if (v10 > v10 + v72 || v10 + v72 > v70)
      goto LABEL_92;
    v69 = v10 + v72;
    if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v69, (unint64_t *)&v74 + 1))
    {
      v49 = 196612;
      return v7 | v49;
    }
    v63 = 0xAAAAAAAAAAAAAAAALL;
    v64 = 0xAAAAAAAAAAAAAAAALL;
    if (v69 > v70)
      goto LABEL_92;
    v63 = v69;
    v64 = v70;
    if (ccder_blob_decode_tl(&v63, 0xA000000000000000, &v72))
    {
      if (v64 < v63 || v72 > v64 - v63)
        goto LABEL_92;
      *((_QWORD *)&v75 + 1) = v63;
      *(_QWORD *)&v76 = v72;
      if (__CFADD__(v63, v72))
        goto LABEL_93;
      if (v63 > v63 + v72 || v63 + v72 > v64)
        goto LABEL_92;
      v69 = v63 + v72;
      v70 = v64;
    }
    else
    {
      *((_QWORD *)&v75 + 1) = 0;
      *(_QWORD *)&v76 = 0;
    }
    if ((ccder_blob_decode_AlgorithmIdentifierNULL(&v69, (unint64_t *)&v76 + 1) & 1) == 0)
    {
      v49 = 196613;
      return v7 | v49;
    }
    if ((ccder_blob_decode_tl(&v69, 4, &v72) & 1) == 0)
    {
      v49 = 196614;
      return v7 | v49;
    }
    if (v70 < v69 || v72 > v70 - v69)
      goto LABEL_92;
    *((_QWORD *)&v78 + 1) = v69;
    *(_QWORD *)&v79 = v72;
    if (__CFADD__(v69, v72))
      goto LABEL_93;
    v12 = v69 + v72;
    if (v69 > v69 + v72 || v12 > v70)
      goto LABEL_92;
    v69 += v72;
    v63 = v12;
    v64 = v70;
    if (ccder_blob_eat_ber_inner(&v63, 0xA000000000000001, 0, 125))
    {
      if (v63 > v64)
        goto LABEL_92;
      v69 = v63;
      v70 = v64;
    }
    if ((ccder_blob_decode_eoc(&v69, v71) & 1) == 0)
    {
      v49 = 196615;
      return v7 | v49;
    }
    digest = find_digest((uint64_t)&v74 + 8);
    if (digest)
    {
      v14 = digest;
      v15 = *(_DWORD *)(a1 + 96);
      if (!v15 || *digest <= v15)
      {
        result = a3(a2, a1, &v73);
        if ((_DWORD)result != 327710)
        {
          if ((_DWORD)result)
            return result;
          v17 = *(_QWORD *)(a1 + 64);
          if (v17 <= v60)
          {
            if (v17)
            {
              v29 = v60 - 1;
              v30 = *(_QWORD *)(a1 + 56);
              v31 = 176 * v29;
              if (__CFADD__(v30, v31))
                goto LABEL_93;
              v32 = v30 + 176 * v29;
              if (v32 >= v30 + 176 * v17 || v32 < v30)
                goto LABEL_92;
              v33 = find_digest(v30 + 176 * v29 + 24);
              if (v33)
              {
                if (*v14 > *v33)
                {
                  v34 = *(_DWORD *)(a1 + 96);
                  if (!v34 || *v14 <= v34)
                  {
                    v35 = *(_QWORD *)(a1 + 56);
                    if (__CFADD__(v35, v31))
                      goto LABEL_93;
                    v36 = (_OWORD *)(v35 + 176 * v29);
                    v37 = v35 + 176 * *(_QWORD *)(a1 + 64);
                    v38 = v37 >= (unint64_t)v36;
                    v39 = v37 - (_QWORD)v36;
                    if (!v38 || v35 > (unint64_t)v36 || v39 < 0xB0)
                      goto LABEL_92;
                    v40 = v73;
                    v41 = v75;
                    v36[1] = v74;
                    v36[2] = v41;
                    *v36 = v40;
                    v42 = v76;
                    v43 = v77;
                    v44 = v79;
                    v36[5] = v78;
                    v36[6] = v44;
                    v36[3] = v42;
                    v36[4] = v43;
                    v45 = v80;
                    v46 = v81;
                    v47 = v83;
                    v36[9] = v82;
                    v36[10] = v47;
                    v36[7] = v45;
                    v36[8] = v46;
                  }
                }
              }
            }
          }
          else
          {
            v18 = *(_DWORD *)(a1 + 96);
            if (!v18 || *v14 <= v18)
            {
              v19 = *(_QWORD *)(a1 + 56);
              if (__CFADD__(v19, 176 * (char)v60))
                goto LABEL_93;
              v20 = (_OWORD *)(v19 + 176 * v60);
              if (176 * v17 - 176 * v60 < 0xB0)
                goto LABEL_92;
              v21 = v73;
              v22 = v75;
              v20[1] = v74;
              v20[2] = v22;
              *v20 = v21;
              v23 = v76;
              v24 = v77;
              v25 = v79;
              v20[5] = v78;
              v20[6] = v25;
              v20[3] = v23;
              v20[4] = v24;
              v26 = v80;
              v27 = v81;
              v28 = v83;
              v20[9] = v82;
              v20[10] = v28;
              v20[7] = v26;
              v20[8] = v27;
              if (v60 == 0xFF)
              {
                __break(0x5507u);
                return result;
              }
              ++v60;
            }
          }
        }
      }
    }
    if (v69 > v85 || v84 > v69)
      goto LABEL_92;
    v84 = v69;
    v48 = v6 + 1;
    if (v6 <= 6)
    {
      v7 += 256;
      ++v6;
      if (v69 < v85)
        continue;
    }
    if (v69 == v85)
    {
      if (v60)
        return 0;
      v50 = *(_QWORD *)(a1 + 64);
      if (!v50)
        return 0;
      if ((unint64_t)(176 * v50) >= 0xB0)
      {
        result = 0;
        v51 = *(_OWORD **)(a1 + 56);
        v52 = v73;
        v53 = v75;
        v51[1] = v74;
        v51[2] = v53;
        *v51 = v52;
        v54 = v76;
        v55 = v77;
        v56 = v79;
        v51[5] = v78;
        v51[6] = v56;
        v51[3] = v54;
        v51[4] = v55;
        v57 = v80;
        v58 = v81;
        v59 = v83;
        v51[9] = v82;
        v51[10] = v59;
        v51[7] = v57;
        v51[8] = v58;
        return result;
      }
LABEL_92:
      __break(0x5519u);
LABEL_93:
      __break(0x5513u);
LABEL_94:
      __break(0x5500u);
    }
    return (v48 << 8) | 0x30008;
  }
  if ((ccder_blob_decode_tl(&v67, 0x8000000000000000, &v72) & 1) != 0)
  {
    v10 = v67;
    v11 = v68;
LABEL_17:
    if (v10 > v11)
      goto LABEL_92;
    v69 = v10;
    v70 = v11;
    goto LABEL_19;
  }
  if (ccder_blob_decode_tl(&v65, 0xA000000000000000, &v72))
  {
    v10 = v65;
    v11 = v66;
    goto LABEL_17;
  }
  v49 = 196611;
  return v7 | v49;
}

uint64_t CMSBuildPath(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t CertificateUsingKeyIdentifier;
  uint64_t v13;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;

  v20 = 0xAAAAAAAAAAAAAAAALL;
  v21 = 0xAAAAAAAAAAAAAAAALL;
  v3 = *(_QWORD *)(a3 + 8);
  v4 = *(_QWORD *)(a3 + 16);
  if (__CFADD__(v3, v4))
LABEL_49:
    __break(0x5513u);
  v5 = v3 + v4;
  if (v3 > v5)
    goto LABEL_48;
  v20 = *(_QWORD *)(a3 + 8);
  v21 = v5;
  v19 = 0xAAAAAAAAAAAAAAAALL;
  if (*(_QWORD *)a3 != 3)
  {
    if (*(_QWORD *)a3 != 1)
      return 524289;
    v8 = 524293;
    if (!ccder_blob_decode_tl(&v20, 0x2000000000000010, &v19))
      return 524290;
    if (!ccder_blob_decode_tl(&v20, 0x2000000000000010, &v19))
      return 524291;
    if (v21 >= v20 && v19 <= v21 - v20)
    {
      v15 = v20;
      v16 = v19;
      if (__CFADD__(v20, v19))
        goto LABEL_49;
      if (v20 <= v20 + v19 && v20 + v19 <= v21)
      {
        v20 += v19;
        if (!ccder_blob_decode_tl(&v20, 2, &v19))
          return 524292;
        if (v21 >= v20 && v19 <= v21 - v20)
        {
          v17 = v20;
          v18 = v19;
          if (__CFADD__(v20, v19))
            goto LABEL_49;
          if (v20 <= v20 + v19 && v20 + v19 <= v21)
          {
            v20 += v19;
            v9 = *(_QWORD **)(a2 + 24);
            if (!v9)
              return v8;
            while (compare_octet_string((uint64_t)&v15, (uint64_t)(v9 + 15))
                 || compare_octet_string((uint64_t)&v17, (uint64_t)(v9 + 17)))
            {
              v9 = (_QWORD *)v9[34];
              if (!v9)
                return v8;
            }
            goto LABEL_36;
          }
        }
      }
    }
    goto LABEL_48;
  }
  if (*(_QWORD *)(a2 + 88) == 1)
    return 524298;
  v15 = v3;
  v16 = v5;
  if (ccder_blob_decode_tl(&v20, 0x8000000000000000, &v19))
  {
    v11 = v20;
    v10 = v21;
    goto LABEL_29;
  }
  v8 = 524294;
  if (!ccder_blob_decode_tl(&v15, 0xA000000000000000, &v19)
    || !ccder_blob_decode_tl(&v15, 4, &v19))
  {
    return v8;
  }
  v11 = v15;
  v10 = v16;
  if (v15 > v16)
  {
LABEL_48:
    __break(0x5519u);
    goto LABEL_49;
  }
  v20 = v15;
  v21 = v16;
LABEL_29:
  if (v10 < v11 || v19 > v10 - v11)
    goto LABEL_48;
  v17 = v11;
  v18 = v19;
  if (__CFADD__(v11, v19))
    goto LABEL_49;
  if (v11 > v11 + v19 || v11 + v19 > v10)
    goto LABEL_48;
  v20 = v11 + v19;
  CertificateUsingKeyIdentifier = X509ChainGetCertificateUsingKeyIdentifier((uint64_t *)(a2 + 24), (uint64_t)&v17);
  if (!CertificateUsingKeyIdentifier)
    return 524295;
  v9 = (_QWORD *)CertificateUsingKeyIdentifier;
LABEL_36:
  if (v20 != v21)
    return 524543;
  v13 = X509ChainBuildPath(v9, (uint64_t *)(a2 + 24), (_QWORD *)(a3 + 152));
  v8 = v13;
  if (*(_DWORD *)(a3 + 168) == 327681)
    *(_DWORD *)(a3 + 168) = v13;
  return v8;
}

uint64_t validateSignerInfo(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  __int128 *v6;
  int *digest;
  unint64_t *v8;
  unint64_t *v9;
  _OWORD *v10;
  unint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  const void **v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  char *v22;
  char *v24;
  uint64_t v31;
  int v32;
  int v34;
  int v35;
  int v36;
  int v37;
  char *v38;
  char *v39;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  int *v44;
  unsigned int v45;
  unsigned int v46;
  unint64_t v47;
  int v48;
  char *v49;
  int v50;
  uint64_t v51;
  int *v52;
  uint64_t v53;
  uint64_t v55;
  uint64_t v56;
  BOOL v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  int v71;
  unsigned int v72;
  uint64_t v73;
  unsigned int v74;
  uint64_t v75;
  uint64_t v76[2];
  char *v77;
  char *v78;
  unint64_t v79;
  char *v80;
  unint64_t v81;
  _BYTE *v82;
  _BYTE *v83;
  unint64_t v84;
  _BYTE v85[20];
  int v86;
  _OWORD v87[4];

  v6 = (__int128 *)(a3 + 24);
  digest = find_digest(a3 + 24);
  if (!digest)
    return 327682;
  v8 = (unint64_t *)(*((uint64_t (**)(void))digest + 3))();
  v9 = v8;
  memset(v87, 0, sizeof(v87));
  v10 = (_OWORD *)a2[13];
  v11 = a2[14];
  if (v10)
    v12 = v11 == 0;
  else
    v12 = 1;
  if (v12)
  {
    v13 = a2[9];
    if (v13)
    {
      v14 = a2[10];
      if (v14)
      {
        v10 = v87;
        v15 = ccdigest(v8, v14, v13, v87);
        v11 = *v9;
        if (*v9 >= 0x41)
          goto LABEL_206;
        goto LABEL_16;
      }
    }
    if (!v10)
      goto LABEL_165;
  }
  if (*v8 != v11)
  {
LABEL_165:
    *(_DWORD *)(a3 + 168) = 327710;
    return 327710;
  }
  if (v11 > 0x40)
    goto LABEL_206;
  v15 = __memcpy_chk(v87, a2[13]);
LABEL_16:
  *(_QWORD *)(a3 + 128) = v10;
  *(_QWORD *)(a3 + 136) = v11;
  v17 = (const void **)(a3 + 128);
  v18 = *(_QWORD *)(a3 + 48);
  if (!v18)
  {
LABEL_185:
    result = CMSBuildPath(v15, (uint64_t)a2, a3);
    switch((int)result)
    {
      case 524293:
      case 524295:
        *(_DWORD *)(a3 + 168) = result;
        return 0;
      case 524294:
        goto LABEL_202;
      case 524296:
        if (*(_DWORD *)(a3 + 168) != 458753)
          goto LABEL_193;
        v67 = 524296;
LABEL_192:
        *(_DWORD *)(a3 + 168) = v67;
LABEL_193:
        v68 = *v9;
        if (*v9 > 0x40)
          goto LABEL_206;
        v76[0] = (uint64_t)v87;
        v76[1] = v68;
        result = X509CertificateCheckSignatureDigest(29, *(_QWORD *)(a3 + 152), v76, v6, (__int128 *)(a3 + 88));
        if (!(_DWORD)result || (_DWORD)result == 655648 || (_DWORD)result == 655632)
        {
          v69 = *(_DWORD *)(a3 + 168);
          if (!v69 || v69 == 458753 || v69 == 327681)
            *(_DWORD *)(a3 + 168) = result;
          result = 0;
        }
        break;
      case 524297:
        v67 = 524297;
        goto LABEL_192;
      default:
        if ((_DWORD)result)
          goto LABEL_202;
        goto LABEL_193;
    }
    goto LABEL_202;
  }
  v73 = a1;
  v80 = (char *)0xAAAAAAAAAAAAAAAALL;
  v81 = 0xAAAAAAAAAAAAAAAALL;
  v19 = *(_QWORD *)(a3 + 40);
  if (__CFADD__(v19, v18))
LABEL_207:
    __break(0x5513u);
  v20 = v19 + v18;
  if (v19 > v20)
  {
LABEL_206:
    __break(0x5519u);
    goto LABEL_207;
  }
  v80 = *(char **)(a3 + 40);
  v81 = v20;
  v79 = 0xAAAAAAAAAAAAAAAALL;
  if (v19 >= v20)
  {
    result = 262156;
    goto LABEL_202;
  }
  v21 = 0;
  v75 = 0x2000000000000010;
  v72 = 262146;
  v74 = 262147;
  v71 = 458754;
  do
  {
    if (!ccder_blob_decode_tl(&v80, v75, &v79))
    {
      result = 262145;
      goto LABEL_202;
    }
    if (__CFADD__(v80, v79))
      goto LABEL_207;
    v22 = &v80[v79];
    v78 = (char *)0xAAAAAAAAAAAAAAAALL;
    v77 = (char *)0xAAAAAAAAAAAAAAAALL;
    if (v80 > &v80[v79] || (unint64_t)v22 > v81)
      goto LABEL_206;
    v77 = v80;
    v78 = &v80[v79];
    if (!ccder_blob_decode_tl(&v77, 6, &v79))
    {
      result = v72;
      goto LABEL_202;
    }
    v24 = v77;
    if (__CFADD__(v77, v79))
      goto LABEL_207;
    if (v77 > &v77[v79] || &v77[v79] > v78)
      goto LABEL_206;
    v77 += v79;
    if (v79 != 9)
      goto LABEL_168;
    if (*(_QWORD *)v24 == 0x9010DF78648862ALL && v24[8] == 3)
    {
      if ((v21 & 1) != 0)
        goto LABEL_170;
      v82 = (_BYTE *)0xAAAAAAAAAAAAAAAALL;
      v35 = ccder_blob_decode_tl(&v77, 0x2000000000000011, &v82);
      result = v74;
      if (v35)
      {
        *(_QWORD *)v85 = 0xAAAAAAAAAAAAAAAALL;
        if (!ccder_blob_decode_tl(&v77, 6, v85))
          goto LABEL_73;
        if (__CFADD__(v77, *(_QWORD *)v85))
          goto LABEL_207;
        if (&v77[*(_QWORD *)v85] == v78)
        {
          if (v77 > &v77[*(_QWORD *)v85])
            goto LABEL_206;
          if (compare_octet_string_raw((uint64_t)&pkcs7_data_oid, v77, *(size_t *)v85))
            result = 262148;
          else
            result = 0;
        }
        else
        {
LABEL_73:
          result = 262148;
        }
      }
      v21 |= 1u;
LABEL_154:
      if ((_DWORD)result)
        goto LABEL_202;
      goto LABEL_155;
    }
    if (*(_QWORD *)v24 == 0x9010DF78648862ALL && v24[8] == 4)
    {
      if ((v21 & 2) != 0)
        goto LABEL_170;
      v82 = (_BYTE *)0xAAAAAAAAAAAAAAAALL;
      v36 = ccder_blob_decode_tl(&v77, 0x2000000000000011, &v82);
      result = v74;
      if (v36)
      {
        *(_QWORD *)v85 = 0xAAAAAAAAAAAAAAAALL;
        if (!ccder_blob_decode_tl(&v77, 4, v85))
          goto LABEL_80;
        if (__CFADD__(v77, *(_QWORD *)v85))
          goto LABEL_207;
        if (&v77[*(_QWORD *)v85] == v78 && (v52 = find_digest((uint64_t)v6)) != 0)
        {
          v53 = *(_QWORD *)v85;
          if (*(_QWORD *)v85 != *(_QWORD *)(a3 + 136)
            || v53 != *(_QWORD *)(*((uint64_t (**)(void))v52 + 3))()
            || memcmp(*v17, v77, *(size_t *)v85))
          {
            *(_DWORD *)(a3 + 168) = v71;
          }
          result = 0;
        }
        else
        {
LABEL_80:
          result = 262148;
        }
      }
      v21 |= 2u;
      goto LABEL_154;
    }
    if (*(_QWORD *)v24 == 0x96463F78648862ALL && v24[8] == 2)
    {
      if ((v21 & 0x10) != 0)
        goto LABEL_170;
      v84 = 0xAAAAAAAAAAAAAAAALL;
      v37 = ccder_blob_decode_tl(&v77, 0x2000000000000011, &v84);
      result = v74;
      if (v37)
      {
        v38 = v77;
        v39 = v78;
        if (v77 >= v78)
        {
LABEL_111:
          if (v38 == v39)
            result = 0;
          else
            result = 262155;
        }
        else
        {
          while (1)
          {
            if (!ccder_blob_decode_tl(&v77, v75, &v84))
            {
              result = 262157;
              goto LABEL_153;
            }
            memset(v85, 170, 16);
            if (__CFADD__(v77, v84))
              goto LABEL_207;
            if (v77 > &v77[v84] || &v77[v84] > v78)
              goto LABEL_206;
            *(_QWORD *)v85 = v77;
            *(_QWORD *)&v85[8] = &v77[v84];
            if ((ccder_blob_decode_tl(v85, 6, &v84) & 1) == 0)
            {
              result = 262151;
              goto LABEL_153;
            }
            v82 = (_BYTE *)0xAAAAAAAAAAAAAAAALL;
            v83 = (_BYTE *)0xAAAAAAAAAAAAAAAALL;
            if (*(_QWORD *)&v85[8] < *(_QWORD *)v85 || v84 > *(_QWORD *)&v85[8] - *(_QWORD *)v85)
              goto LABEL_206;
            v82 = *(_BYTE **)v85;
            v83 = (_BYTE *)v84;
            if (__CFADD__(*(_QWORD *)v85, v84))
              goto LABEL_207;
            if (*(_QWORD *)v85 > *(_QWORD *)v85 + v84 || *(_QWORD *)v85 + v84 > *(_QWORD *)&v85[8])
              goto LABEL_206;
            *(_QWORD *)v85 += v84;
            if (!ccder_blob_decode_tl(v85, 4, &v84))
            {
              result = 262152;
              goto LABEL_153;
            }
            v41 = *(_QWORD *)v85;
            if (__CFADD__(*(_QWORD *)v85, v84))
              goto LABEL_207;
            v42 = *(_QWORD *)v85 + v84;
            if (*(_QWORD *)v85 > *(_QWORD *)v85 + v84)
              goto LABEL_206;
            v43 = *(_QWORD *)&v85[8];
            if (v42 > *(_QWORD *)&v85[8])
              goto LABEL_206;
            *(_QWORD *)v85 += v84;
            if (v42 != *(_QWORD *)&v85[8])
              break;
            v44 = find_digest((uint64_t)&v82);
            if (v44)
            {
              v45 = *v44;
              if (*v44 > *(_DWORD *)(a3 + 104))
              {
                v46 = *(_DWORD *)(v73 + 8);
                if (!v46 || v45 <= v46)
                {
                  *(_DWORD *)(a3 + 104) = v45;
                  v47 = v84;
                  if (v84 > v43 - v41)
                    goto LABEL_206;
                  *(_QWORD *)(a3 + 112) = v41;
                  *(_QWORD *)(a3 + 120) = v47;
                }
              }
            }
            v38 = *(char **)v85;
            v39 = v78;
            if (*(_QWORD *)v85 > (unint64_t)v78 || (unint64_t)v77 > *(_QWORD *)v85)
              goto LABEL_206;
            v77 = *(char **)v85;
            if (*(_QWORD *)v85 >= (unint64_t)v78)
              goto LABEL_111;
          }
          result = 262153;
        }
      }
LABEL_153:
      v21 |= 0x10u;
      goto LABEL_154;
    }
    if (*(_QWORD *)v24 == 0x9010DF78648862ALL && v24[8] == 5)
    {
      if ((v21 & 4) != 0)
        goto LABEL_170;
      v84 = 0xAAAAAAAAAAAAAAAALL;
      v48 = ccder_blob_decode_tl(&v77, 0x2000000000000011, &v84);
      result = v74;
      if (v48)
      {
        v82 = (_BYTE *)0xAAAAAAAAAAAAAAAALL;
        memset(v85, 170, 16);
        if (v77 > v78)
          goto LABEL_206;
        *(_QWORD *)v85 = v77;
        *(_QWORD *)&v85[8] = v78;
        if (ccder_blob_decode_tl(&v77, 23, &v82))
        {
          v49 = v77;
LABEL_135:
          if (__CFADD__(v49, v82))
            goto LABEL_207;
          if (&v82[(_QWORD)v49] == v78)
            result = 0;
          else
            result = 262148;
          goto LABEL_148;
        }
        if ((ccder_blob_decode_tl(v85, 24, &v82) & 1) != 0)
        {
          v49 = *(char **)v85;
          if (*(_QWORD *)v85 > *(_QWORD *)&v85[8])
            goto LABEL_206;
          v77 = *(char **)v85;
          v78 = *(char **)&v85[8];
          goto LABEL_135;
        }
        result = 262148;
      }
LABEL_148:
      v21 |= 4u;
      goto LABEL_154;
    }
    if (*(_QWORD *)v24 == 0x96463F78648862ALL && v24[8] == 1)
    {
      if ((v21 & 8) != 0)
        goto LABEL_170;
      v82 = (_BYTE *)0xAAAAAAAAAAAAAAAALL;
      v50 = ccder_blob_decode_tl(&v77, 0x2000000000000011, &v82);
      result = v74;
      if (v50)
      {
        *(_QWORD *)v85 = 0xAAAAAAAAAAAAAAAALL;
        if (!ccder_blob_decode_tl(&v77, 4, v85))
          goto LABEL_124;
        v51 = *(_QWORD *)v85;
        if (__CFADD__(v77, *(_QWORD *)v85))
          goto LABEL_207;
        if (&v77[*(_QWORD *)v85] == v78)
        {
          if (!*(_DWORD *)(a3 + 104))
          {
            if (v77 > &v77[*(_QWORD *)v85])
              goto LABEL_206;
            *(_QWORD *)(a3 + 112) = v77;
            *(_QWORD *)(a3 + 120) = v51;
          }
          result = 0;
        }
        else
        {
LABEL_124:
          result = 262148;
        }
      }
      v21 |= 8u;
      goto LABEL_154;
    }
    if (*(_QWORD *)v24 != 0x9010DF78648862ALL || v24[8] != 52)
    {
      v31 = *(_QWORD *)v24;
      v32 = v24[8];
      if (v31 != 0x9010DF78648862ALL || v32 != 15)
      {
LABEL_168:
        result = 262150;
LABEL_202:
        if (*v17 == v87)
        {
          *v17 = 0;
          *(_QWORD *)(a3 + 136) = 0;
        }
        return result;
      }
      if ((v21 & 0x40) != 0)
        goto LABEL_170;
      v82 = (_BYTE *)0xAAAAAAAAAAAAAAAALL;
      v34 = ccder_blob_decode_tl(&v77, 0x2000000000000011, &v82);
      result = v74;
      if (v34)
      {
        *(_QWORD *)v85 = 0xAAAAAAAAAAAAAAAALL;
        if ((ccder_blob_decode_tl(&v77, v75, v85) & 1) != 0)
        {
          if (__CFADD__(v77, *(_QWORD *)v85))
            goto LABEL_207;
          if (&v77[*(_QWORD *)v85] == v78)
            result = 0;
          else
            result = 262148;
        }
        else
        {
          result = 262148;
        }
      }
      v21 |= 0x40u;
      goto LABEL_154;
    }
    if ((v21 & 0x20) != 0)
    {
LABEL_170:
      result = 262149;
      goto LABEL_202;
    }
    v21 |= 0x20u;
LABEL_155:
    if ((unint64_t)v22 > v81 || v80 > v22)
      goto LABEL_206;
    v80 = v22;
  }
  while ((unint64_t)v22 < v81);
  if ((~v21 & 3) != 0)
  {
    result = 262156;
    goto LABEL_202;
  }
  v55 = ccder_sizeof_tag(0x2000000000000011);
  v56 = *(_QWORD *)(a3 + 48);
  result = ccder_sizeof_len(v56);
  v57 = __CFADD__(v55, result);
  v58 = v55 + result;
  if (v57)
    goto LABEL_208;
  if (v58 > 0x14)
  {
    result = 327689;
    goto LABEL_202;
  }
  memset(v85, 170, sizeof(v85));
  v82 = (_BYTE *)0xAAAAAAAAAAAAAAAALL;
  v83 = (_BYTE *)0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v85, v58))
    goto LABEL_207;
  if (&v85[v58] > (_BYTE *)&v86 || v85 > &v85[v58])
    goto LABEL_206;
  v82 = v85;
  v83 = &v85[v58];
  result = ccder_blob_encode_tl(&v82, 0x2000000000000011, v56);
  if (!(_DWORD)result)
  {
    result = 327688;
    goto LABEL_202;
  }
  v59 = v9[1];
  v57 = __CFADD__(v59, 8);
  v60 = v59 + 8;
  if (!v57)
  {
    v61 = v9[2];
    v57 = __CFADD__(v60, v61);
    v62 = v60 + v61;
    if (!v57)
    {
      v57 = __CFADD__(v62, 4);
      v63 = v62 + 4;
      if (!v57 && v63 < 0xFFFFFFFFFFFFFFF8)
      {
        __chkstk_darwin(result);
        v65 = (char *)&v70 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0);
        memset(v65, 170, ((v66 - 9) & 0xFFFFFFFFFFFFFFF8) + 8);
        ccdigest_init(v9, v65);
        ccdigest_update(v9, v65, v58, v85);
        ccdigest_update(v9, v65, *(_QWORD *)(a3 + 48), *(_QWORD *)(a3 + 40));
        v15 = ((uint64_t (*)(unint64_t *, char *, _OWORD *))v9[7])(v9, v65, v87);
        goto LABEL_185;
      }
    }
  }
LABEL_208:
  __break(0x5500u);
  return result;
}

uint64_t validateSignerInfoAndChain(uint64_t *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  int v7;

  v5 = validateSignerInfo((uint64_t)a1, a2, a3);
  if (!(_DWORD)v5)
  {
    v7 = X509ChainCheckPath(29, (uint64_t *)(a3 + 152), *a1);
    if (v7)
    {
      if (!*(_DWORD *)(a3 + 168))
        *(_DWORD *)(a3 + 168) = v7;
    }
  }
  return v5;
}

uint64_t CMSVerifySignedDataWithLeaf(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, _QWORD *a7)
{
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  return CMSVerify(a1, a2, a3, a4, a5, a6, a7, &v8, &v9);
}

uint64_t CMSVerify(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, _QWORD *a9)
{
  uint64_t result;
  uint64_t v18;
  _OWORD v19[9];
  __int128 v20;
  __int128 v21;
  unint64_t v22[2];
  __int128 v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD *v27;
  _OWORD v28[3];
  uint64_t v29;
  _QWORD v30[2];
  _BYTE __b[1216];

  v29 = 0;
  v30[0] = 0;
  memset(v28, 0, sizeof(v28));
  v26 = 0;
  v25 = 0;
  v23 = 0u;
  v24 = (char *)&v23 + 8;
  v30[1] = 0;
  memset(__b, 170, sizeof(__b));
  v22[0] = 4;
  v22[1] = (unint64_t)__b;
  v20 = 0u;
  v21 = 0u;
  memset(v19, 0, sizeof(v19));
  v27 = v19;
  *(_QWORD *)&v28[0] = 1;
  DWORD2(v21) = 327681;
  if (a2 < 0)
    goto LABEL_19;
  result = CMSParseContentInfoSignedDataWithOptions(a1, a2, v22, 0);
  if ((_DWORD)result)
    return result;
  if (!a4)
    goto LABEL_7;
  result = 131091;
  if (*(_OWORD *)((char *)v28 + 8) != 0)
    return result;
  if (a4 < 0)
LABEL_19:
    __break(0x5519u);
  *((_QWORD *)&v28[0] + 1) = a3;
  *(_QWORD *)&v28[1] = a4;
LABEL_7:
  v30[0] = a5;
  DWORD2(v21) = 458753;
  result = CMSParseSignerInfos((uint64_t)v22, (uint64_t)v30, (uint64_t (*)(uint64_t, uint64_t, __int128 *))validateSignerInfoAndChain);
  if (!(_DWORD)result)
  {
    result = DWORD2(v21);
    if (!DWORD2(v21))
    {
      if (a6 && a7)
        result = X509CertificateParseKey(*((uint64_t *)&v20 + 1), a6, a7);
      if (!a4)
      {
        if (a8)
        {
          if (a9)
          {
            v18 = *(_QWORD *)&v28[1];
            if (*(_QWORD *)&v28[1])
            {
              if (*((_QWORD *)&v28[0] + 1))
              {
                *a8 = *((_QWORD *)&v28[0] + 1);
                *a9 = v18;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t CMSVerifySignedData(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = 0;
  v9 = 0;
  v8 = 0;
  return CMSVerify(a1, a2, a3, a4, a5, &v6, &v7, &v8, &v9);
}

uint64_t CMSVerifyAndReturnSignedData(char *a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  return CMSVerify(a1, a2, 0, 0, a5, &v6, &v7, a3, a4);
}

uint64_t ccder_blob_decode_ber_len(uint64_t result, _BYTE *a2, unint64_t *a3)
{
  unsigned __int8 *v3;
  unint64_t v4;
  unsigned __int8 *v5;
  unint64_t v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  unint64_t v10;
  uint64_t v11;

  *a2 = 0;
  v3 = *(unsigned __int8 **)result;
  if (!*(_QWORD *)result)
    return 0;
  v4 = *(_QWORD *)(result + 8);
  if ((unint64_t)v3 >= v4)
    return 0;
  if (v3 == (unsigned __int8 *)-1)
    goto LABEL_42;
  v5 = v3 + 1;
  if (v3 >= v3 + 1 || (unint64_t)v5 > v4)
  {
LABEL_41:
    __break(0x5519u);
LABEL_42:
    __break(0x5513u);
    return result;
  }
  *(_QWORD *)result = v5;
  v7 = *v3;
  if ((char)*v3 < 0)
  {
    switch(*v3)
    {
      case 0x80u:
        v7 = v4 - (_QWORD)v5;
        *a2 = 1;
        break;
      case 0x81u:
        if ((uint64_t)(v4 - (_QWORD)v5) < 1)
          return 0;
        if (v3 == (unsigned __int8 *)-2)
          goto LABEL_42;
        v8 = v3 + 2;
        if (v5 > v8 || (unint64_t)v8 > v4)
          goto LABEL_41;
        *(_QWORD *)result = v8;
        v7 = *v5;
        v5 = v8;
        break;
      case 0x82u:
        if ((uint64_t)(v4 - (_QWORD)v5) < 2)
          return 0;
        if ((unint64_t)v5 >= v4)
          goto LABEL_41;
        if (v3 == (unsigned __int8 *)-2)
          goto LABEL_42;
        if (v3 + 2 < v5 || (unint64_t)(v3 + 2) >= v4)
          goto LABEL_41;
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFDLL)
          goto LABEL_42;
        v9 = v3 + 3;
        if (v5 > v3 + 3 || (unint64_t)v9 > v4)
          goto LABEL_41;
        v10 = (unint64_t)v3[1] << 8;
        v11 = v3[2];
        goto LABEL_40;
      case 0x83u:
        if ((uint64_t)(v4 - (_QWORD)v5) < 3)
          return 0;
        if ((unint64_t)v5 >= v4)
          goto LABEL_41;
        if (v3 == (unsigned __int8 *)-2)
          goto LABEL_42;
        if (v3 + 2 < v5 || (unint64_t)(v3 + 2) >= v4)
          goto LABEL_41;
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFDLL)
          goto LABEL_42;
        if (v3 + 3 < v5 || (unint64_t)(v3 + 3) >= v4)
          goto LABEL_41;
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFCLL)
          goto LABEL_42;
        v9 = v3 + 4;
        if (v5 > v3 + 4 || (unint64_t)v9 > v4)
          goto LABEL_41;
        v10 = ((unint64_t)v3[1] << 16) | ((unint64_t)v3[2] << 8);
        v11 = v3[3];
LABEL_40:
        v7 = v10 | v11;
        *(_QWORD *)result = v9;
        v5 = v9;
        break;
      default:
        return 0;
    }
  }
  if (v4 - (unint64_t)v5 < v7)
    return 0;
  *a3 = v7;
  return 1;
}

uint64_t CMSParseImplicitCertificateSet(unint64_t *a1, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5)
{
  unint64_t v5;
  unint64_t v6;
  BOOL v7;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  BOOL v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t **v19;
  unint64_t **v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t *v23;
  unint64_t v25;
  unint64_t **v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;

  v31 = 0xAAAAAAAAAAAAAAAALL;
  v32 = 0xAAAAAAAAAAAAAAAALL;
  *a4 = 0;
  a4[1] = 0;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v5 = *a1;
  v6 = a1[1];
  if (*a1 > v6)
  {
LABEL_43:
    __break(0x5519u);
LABEL_44:
    __break(0x5513u);
  }
  v30 = *a1;
  v31 = v6;
  v7 = v5 >= v6 || a3 == 0;
  if (v7)
  {
    v12 = 0;
LABEL_8:
    if (a5)
      *a5 = v12;
    return 1;
  }
  else
  {
    v12 = 0;
    v13 = 304 * a3;
    v14 = a2 + 304 * a3;
    v25 = ~a2;
    v27 = (unint64_t **)(a4 + 1);
    v23 = (unint64_t *)(a2 + 272);
    v15 = a2;
    while (1)
    {
      v29 = 0;
      if (!ccder_blob_decode_tag(&v30, &v32))
        return 0;
      if (!v32)
        goto LABEL_8;
      if (!ccder_blob_decode_ber_len((uint64_t)&v30, &v29, &v28) || v29 || v32 != 0x2000000000000010)
        return 0;
      if ((unsigned __int128)((uint64_t)v12 * (__int128)304) >> 64 != (uint64_t)(304 * v12) >> 63 || 304 * v12 > v25)
        goto LABEL_44;
      if (v15 > v14)
        goto LABEL_43;
      if (v15 < a2)
        goto LABEL_43;
      v16 = v13 >= 0x130;
      v13 -= 304;
      if (!v16)
        goto LABEL_43;
      *(_OWORD *)(v15 + 272) = 0u;
      *(_OWORD *)(v15 + 288) = 0u;
      *(_OWORD *)(v15 + 240) = 0u;
      *(_OWORD *)(v15 + 256) = 0u;
      *(_OWORD *)(v15 + 208) = 0u;
      *(_OWORD *)(v15 + 224) = 0u;
      *(_OWORD *)(v15 + 176) = 0u;
      *(_OWORD *)(v15 + 192) = 0u;
      *(_OWORD *)(v15 + 144) = 0u;
      *(_OWORD *)(v15 + 160) = 0u;
      *(_OWORD *)(v15 + 112) = 0u;
      *(_OWORD *)(v15 + 128) = 0u;
      *(_OWORD *)(v15 + 80) = 0u;
      *(_OWORD *)(v15 + 96) = 0u;
      *(_OWORD *)(v15 + 48) = 0u;
      *(_OWORD *)(v15 + 64) = 0u;
      *(_OWORD *)(v15 + 16) = 0u;
      *(_OWORD *)(v15 + 32) = 0u;
      *(_OWORD *)v15 = 0u;
      if (v12)
      {
        if (v15 + 304 > v14)
          goto LABEL_43;
        *(_QWORD *)(v15 + 272) = 0;
        v17 = *v27;
        *(_QWORD *)(v15 + 280) = *v27;
        if (v15)
        {
          if (v15 >= v14)
            goto LABEL_43;
        }
        *v17 = v15;
        *v27 = (unint64_t *)(v15 + 272);
      }
      else
      {
        if (v15 + 304 > v14)
          goto LABEL_43;
        v18 = *a4;
        *v23 = *a4;
        v19 = (unint64_t **)(v18 + 280);
        v7 = v18 == 0;
        v20 = v27;
        if (!v7)
          v20 = v19;
        *v20 = v23;
        if (v15)
        {
          if (v15 >= v14)
            goto LABEL_43;
        }
        *a4 = v15;
        *(_QWORD *)(a2 + 280) = a4;
      }
      if (X509CertificateParseImplicit(v15, &v30, 0, 0))
        return 0;
      if (v6 < v5)
        goto LABEL_43;
      v21 = v30;
      v22 = v30 - v5;
      if (v30 - v5 > v6 - v5)
        goto LABEL_43;
      if (v15 + 304 > v14)
        goto LABEL_43;
      *(_QWORD *)v15 = v5;
      *(_QWORD *)(v15 + 8) = v22;
      v6 = v31;
      if (v21 > v31)
        goto LABEL_43;
      *a1 = v21;
      a1[1] = v6;
      ++v12;
      if (v21 < v6)
      {
        v15 += 304;
        v5 = v21;
        if (v12 < a3)
          continue;
      }
      goto LABEL_8;
    }
  }
}

uint64_t ccder_blob_eat_ber_inner(unint64_t *a1, uint64_t a2, unint64_t *a3, int a4)
{
  int v8;
  uint64_t result;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char v15;

  v15 = 0;
  v14 = 0xAAAAAAAAAAAAAAAALL;
  v8 = ccder_blob_decode_tag(a1, &v14);
  result = 0;
  if (v8 && v14 == a2)
  {
    v13 = 0xAAAAAAAAAAAAAAAALL;
    result = ccder_blob_decode_ber_len((uint64_t)a1, &v15, &v13);
    if ((result & 1) == 0)
      return 0;
    if (a3)
    {
      v10 = a1[1];
      if (*a1 > v10)
        goto LABEL_18;
      *a3 = *a1;
      a3[1] = v10;
    }
    if (v15)
    {
      if (a4 >= 1)
      {
        result = ccder_blob_eat_ber_inner(a1, 0, 0, (char)(a4 - 1));
        if (!(_DWORD)result)
          return result;
        return (ccder_blob_decode_eoc(a1, 1) & 1) != 0;
      }
      return 0;
    }
    v11 = *a1;
    if (__CFADD__(*a1, v13))
    {
LABEL_19:
      __break(0x5513u);
      return result;
    }
    v12 = v11 + v13;
    if (v11 <= v11 + v13 && v12 <= a1[1])
    {
      *a1 = v12;
      return 1;
    }
LABEL_18:
    __break(0x5519u);
    goto LABEL_19;
  }
  return result;
}

uint64_t compare_octet_string(uint64_t a1, uint64_t a2)
{
  size_t v2;
  size_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return memcmp(*(const void **)a1, *(const void **)a2, v2);
  if (v2 > v3)
    return 0xFFFFFFFFLL;
  return 1;
}

uint64_t compare_octet_string_raw(uint64_t a1, const void *a2, size_t a3)
{
  size_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  if (v3 == a3)
    return memcmp(*(const void **)a1, a2, a3);
  if (v3 > a3)
    return 0xFFFFFFFFLL;
  return 1;
}

uint64_t compare_octet_string_partial(uint64_t a1, uint64_t a2)
{
  size_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  if (v2 <= *(_QWORD *)(a2 + 8))
    return memcmp(*(const void **)a2, *(const void **)a1, v2);
  else
    return 0xFFFFFFFFLL;
}

uint64_t ccder_blob_decode_AlgorithmIdentifierNULL(unint64_t *a1, unint64_t *a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v16 = 0;
  v15 = 0;
  result = ccder_blob_decode_tl(a1, 0x2000000000000010, &v16);
  if ((_DWORD)result)
  {
    v13 = 0xAAAAAAAAAAAAAAAALL;
    v14 = 0xAAAAAAAAAAAAAAAALL;
    v5 = *a1;
    if (!__CFADD__(*a1, v16))
    {
      if (v5 > v5 + v16 || v5 + v16 > a1[1])
        goto LABEL_28;
      v13 = *a1;
      v14 = v5 + v16;
      result = ccder_blob_decode_tl(&v13, 6, &v15);
      if (!(_DWORD)result)
        return result;
      v7 = v15;
      v8 = v13;
      if (a2)
      {
        if (v14 < v13 || v15 > v14 - v13)
          goto LABEL_28;
        *a2 = v13;
        a2[1] = v7;
      }
      if (!__CFADD__(v8, v7))
      {
        v9 = v8 + v7;
        if (v9 == v14)
        {
          if (v9 <= a1[1] && *a1 <= v9)
          {
            *a1 = v9;
            return 1;
          }
LABEL_28:
          __break(0x5519u);
        }
        v11 = 0xAAAAAAAAAAAAAAAALL;
        v12 = 0xAAAAAAAAAAAAAAAALL;
        if (v8 > v9 || v9 > v14)
          goto LABEL_28;
        v11 = v9;
        v12 = v14;
        result = ccder_blob_decode_tl(&v11, 5, &v15);
        if (!(_DWORD)result)
          return result;
        if (v11 != v14)
          return 0;
        if (!__CFADD__(v11, v15))
        {
          v10 = v11 + v15;
          if (v11 + v15 <= a1[1] && *a1 <= v10)
          {
            *a1 = v10;
            return 1;
          }
          goto LABEL_28;
        }
      }
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t ccder_blob_decode_Time(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2;
  uint64_t result;
  unint64_t v6;
  unint64_t v7;
  int v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v12 = 0xAAAAAAAAAAAAAAAALL;
  v13 = 0;
  v11 = 0xAAAAAAAAAAAAAAAALL;
  v2 = a1[1];
  if (*a1 > v2)
    goto LABEL_17;
  v11 = *a1;
  v12 = v2;
  result = ccder_blob_decode_tl(&v11, 23, &v13);
  if ((result & 1) != 0)
  {
    v6 = v13;
    if (v13 != 13)
      return 0;
LABEL_8:
    v9 = v11;
    if (a2)
    {
      if (v12 < v11 || v6 > v12 - v11)
        goto LABEL_17;
      *a2 = v11;
      a2[1] = v6;
    }
    if (__CFADD__(v9, v6))
    {
      __break(0x5513u);
      return result;
    }
    v10 = v9 + v6;
    if (v10 <= a1[1] && *a1 <= v10)
    {
      *a1 = v10;
      return 1;
    }
LABEL_17:
    __break(0x5519u);
  }
  v7 = a1[1];
  if (*a1 > v7)
    goto LABEL_17;
  v11 = *a1;
  v12 = v7;
  v8 = ccder_blob_decode_tl(&v11, 24, &v13);
  result = 0;
  if (v8)
  {
    v6 = v13;
    if (v13 == 15)
      goto LABEL_8;
  }
  return result;
}

uint64_t ccder_blob_decode_GeneralName(unint64_t *a1, int *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v6;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;

  result = 0;
  v23 = 0;
  if (a2 && a3)
  {
    *a3 = 0;
    a3[1] = 0;
    v21 = 0xAAAAAAAAAAAAAAAALL;
    v22 = 0xAAAAAAAAAAAAAAAALL;
    v6 = a1[1];
    if (*a1 > v6)
      goto LABEL_49;
    v21 = *a1;
    v22 = v6;
    result = ccder_blob_decode_tl(&v21, 0xA000000000000000, &v23);
    if ((_DWORD)result)
    {
      *a2 = 0;
      goto LABEL_6;
    }
    v9 = a1[1];
    if (*a1 > v9)
      goto LABEL_49;
    v21 = *a1;
    v22 = v9;
    result = ccder_blob_decode_tl(&v21, 0x8000000000000001, &v23);
    if ((_DWORD)result)
    {
      v10 = v21;
      if (v22 < v21)
        goto LABEL_49;
      v11 = v23;
      if (v23 > v22 - v21)
        goto LABEL_49;
      *a3 = v21;
      a3[1] = v11;
      v12 = 1;
      goto LABEL_18;
    }
    v13 = a1[1];
    if (*a1 > v13)
      goto LABEL_49;
    v21 = *a1;
    v22 = v13;
    result = ccder_blob_decode_tl(&v21, 0x8000000000000002, &v23);
    if ((_DWORD)result)
    {
      v10 = v21;
      if (v22 < v21)
        goto LABEL_49;
      v11 = v23;
      if (v23 > v22 - v21)
        goto LABEL_49;
      *a3 = v21;
      a3[1] = v11;
      v12 = 2;
      goto LABEL_18;
    }
    v14 = a1[1];
    if (*a1 > v14)
      goto LABEL_49;
    v21 = *a1;
    v22 = v14;
    result = ccder_blob_decode_tl(&v21, 0xA000000000000003, &v23);
    if ((_DWORD)result)
    {
      v15 = 3;
LABEL_27:
      *a2 = v15;
LABEL_6:
      if (!__CFADD__(v21, v23))
      {
        v8 = v21 + v23;
LABEL_20:
        if (v8 <= a1[1] && *a1 <= v8)
        {
          *a1 = v8;
          return 1;
        }
LABEL_49:
        __break(0x5519u);
      }
      goto LABEL_50;
    }
    v16 = a1[1];
    if (*a1 > v16)
      goto LABEL_49;
    v21 = *a1;
    v22 = v16;
    result = ccder_blob_decode_tl(&v21, 0xA000000000000004, &v23);
    if ((_DWORD)result)
    {
      v10 = v21;
      if (v22 < v21)
        goto LABEL_49;
      v11 = v23;
      if (v23 > v22 - v21)
        goto LABEL_49;
      *a3 = v21;
      a3[1] = v11;
      v12 = 4;
      goto LABEL_18;
    }
    v17 = a1[1];
    if (*a1 > v17)
      goto LABEL_49;
    v21 = *a1;
    v22 = v17;
    result = ccder_blob_decode_tl(&v21, 0xA000000000000005, &v23);
    if ((_DWORD)result)
    {
      v15 = 5;
      goto LABEL_27;
    }
    v18 = a1[1];
    if (*a1 > v18)
      goto LABEL_49;
    v21 = *a1;
    v22 = v18;
    result = ccder_blob_decode_tl(&v21, 0x8000000000000006, &v23);
    if ((_DWORD)result)
    {
      v10 = v21;
      if (v22 < v21)
        goto LABEL_49;
      v11 = v23;
      if (v23 > v22 - v21)
        goto LABEL_49;
      *a3 = v21;
      a3[1] = v11;
      v12 = 6;
      goto LABEL_18;
    }
    v19 = a1[1];
    if (*a1 > v19)
      goto LABEL_49;
    v21 = *a1;
    v22 = v19;
    result = ccder_blob_decode_tl(&v21, 0x8000000000000007, &v23);
    if ((_DWORD)result)
    {
      v10 = v21;
      if (v22 < v21)
        goto LABEL_49;
      v11 = v23;
      if (v23 > v22 - v21)
        goto LABEL_49;
      *a3 = v21;
      a3[1] = v11;
      v12 = 7;
LABEL_18:
      *a2 = v12;
      if (!__CFADD__(v10, v11))
      {
        v8 = v10 + v11;
        goto LABEL_20;
      }
LABEL_50:
      __break(0x5513u);
      return result;
    }
    v20 = a1[1];
    if (*a1 > v20)
      goto LABEL_49;
    v21 = *a1;
    v22 = v20;
    result = ccder_blob_decode_tl(&v21, 0x8000000000000008, &v23);
    if ((_DWORD)result)
    {
      v15 = 8;
      goto LABEL_27;
    }
  }
  return result;
}

uint64_t ccder_blob_check_null(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  v2 = 0;
  LODWORD(result) = ccder_blob_decode_tl(a1, 5, &v2);
  if (v2)
    return 0;
  else
    return result;
}

uint64_t CTParseCertificateSet(unint64_t a1, unint64_t a2, _OWORD *a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  unint64_t v11;
  __int128 v12;
  uint64_t result;
  unint64_t v15;
  unint64_t v16;
  _OWORD v17[19];

  v6 = 0;
  if (a1 < a2 && a4)
  {
    v8 = 0;
    v9 = a4 - 1;
    v10 = a3;
    v11 = (unint64_t)&a3[a4];
    while (1)
    {
      *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v17[17] = v12;
      v17[18] = v12;
      v17[15] = v12;
      v17[16] = v12;
      v17[13] = v12;
      v17[14] = v12;
      v17[11] = v12;
      v17[12] = v12;
      v17[9] = v12;
      v17[10] = v12;
      v17[7] = v12;
      v17[8] = v12;
      v17[5] = v12;
      v17[6] = v12;
      v17[3] = v12;
      v17[4] = v12;
      v17[1] = v12;
      v17[2] = v12;
      v17[0] = v12;
      v15 = a1;
      v16 = a2;
      result = X509CertificateParse((unint64_t *)v17, &v15);
      if ((_DWORD)result)
        break;
      a1 = v15;
      a2 = v16;
      if (v15 > v16 || (unint64_t)v10 >= v11 || v10 < a3)
        __break(0x5519u);
      *v10 = v17[0];
      v6 = v8 + 1;
      if (a1 < a2)
      {
        ++v10;
        if (v9 != v8++)
          continue;
      }
      goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    result = 0;
    if (a5)
      *a5 = v6;
  }
  return result;
}

uint64_t CTParseExtensionValue(unint64_t a1, uint64_t a2, const void *a3, size_t a4, _QWORD *a5, _QWORD *a6)
{
  uint64_t result;
  uint64_t v9;
  unint64_t v10[2];
  _OWORD v11[15];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  memset(v11, 0, sizeof(v11));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5519u);
  }
  if (a1 + a2 < a1)
    goto LABEL_11;
  v10[0] = a1;
  v10[1] = a1 + a2;
  result = X509CertificateParseWithExtension((unint64_t *)v11, v10, a3, a4);
  if (!(_DWORD)result)
  {
    result = 720914;
    if (*((_QWORD *)&v12 + 1))
    {
      v9 = v13;
      if ((_QWORD)v13)
      {
        result = 0;
        if (a5)
        {
          if (a6)
          {
            result = 0;
            *a5 = *((_QWORD *)&v12 + 1);
            *a6 = v9;
          }
        }
      }
    }
  }
  return result;
}

uint64_t CTParseKey(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t result;
  unint64_t v7[2];
  _OWORD v8[19];

  memset(v8, 0, sizeof(v8));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_7:
    __break(0x5519u);
  }
  if (a1 + a2 < a1)
    goto LABEL_7;
  v7[0] = a1;
  v7[1] = a1 + a2;
  result = X509CertificateParse((unint64_t *)v8, v7);
  if (!(_DWORD)result)
    return X509CertificateParseKey((uint64_t)v8, a3, a4);
  return result;
}

uint64_t CTEvaluateSavageCertsWithUID(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5, _QWORD *a6, _BYTE *a7, uint64_t a8, BOOL *a9)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a5, a6, a7, a8, 0, 0, a9, (uint64_t)&X509PolicySavage, 2);
}

uint64_t CTEvaluateCertifiedChip(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5, _QWORD *a6, _BYTE *a7, uint64_t a8, const void *a9, size_t a10, BOOL *a11, uint64_t a12, uint64_t a13)
{
  uint64_t result;
  uint64_t *v22;
  uint64_t v23;
  __int128 *v24;
  unint64_t v25;
  int v26;
  unint64_t v27[2];
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33[4];
  _QWORD __b[152];

  result = (uint64_t)memset(__b, 170, sizeof(__b));
  memset(v33, 170, sizeof(v33));
  v31 = 0xAAAAAAAAAAAAAAAALL;
  v32 = 0;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a1, a2))
    goto LABEL_34;
  if (a1 + a2 < a1)
    goto LABEL_35;
  v30 = a1;
  v31 = a1 + a2;
  result = (uint64_t)X509ChainParseCertificateSet(&v30, (unint64_t)__b, 4, &v33[2], &v32);
  if ((_DWORD)result)
    return result;
  result = 327690;
  if (v30 != v31)
    return result;
  if (v32 != 2)
    return 327692;
  X509ChainResetChain(v33, &v33[2]);
  __b[74] = v33[0];
  v22 = v33[0] ? (uint64_t *)(v33[0] + 296) : &v33[1];
  *v22 = (uint64_t)&__b[74];
  if ((_QWORD *)((char *)&__b[38] + 1) != 0 && (unint64_t)__b >= 0xFFFFFFFFFFFFFECFLL)
LABEL_34:
    __break(0x5513u);
  v33[0] = (uint64_t)&__b[38];
  __b[75] = v33;
  __b[36] = 0;
  __b[37] = v33[1];
  *(_QWORD *)v33[1] = __b;
  v33[1] = (uint64_t)&__b[36];
  result = X509ChainCheckPathWithOptions(12, v33, a12, 0);
  if ((_DWORD)result)
    return result;
  v23 = **(_QWORD **)(v33[1] + 8);
  v28 = 0xAAAAAAAAAAAAAAAALL;
  v29 = 0xAAAAAAAAAAAAAAAALL;
  if ((a4 & 0x8000000000000000) != 0)
    goto LABEL_35;
  v28 = a3;
  v29 = a4;
  v24 = (__int128 *)oidForPubKeyLength();
  result = X509CertificateCheckSignatureWithPublicKey(&v28, (uint64_t)&ecPublicKey, v24, (_QWORD *)(v23 + 16), (__int128 *)(v23 + 40), (__int128 *)(v23 + 56));
  if ((_DWORD)result)
    return result;
  if (a9 && a10)
  {
    if ((a10 & 0x8000000000000000) != 0)
      goto LABEL_35;
    if (compare_octet_string_raw(v23 + 248, a9, a10))
      return 590085;
  }
  v25 = v33[0];
  LODWORD(result) = X509CertificateParseKey(v33[0], a5, a6);
  v26 = result;
  if ((_DWORD)result)
    result = result;
  else
    result = 327691;
  if (!v25 || v26)
    return result;
  if (a11)
    *a11 = (*(_QWORD *)(v25 + 240) & a13) != 0;
  if (!a7 || !a8)
    return 0;
  v27[0] = 0;
  v27[1] = 0;
  if (v25 >= v25 + 304)
    goto LABEL_35;
  result = X509CertificateSubjectNameGetCommonName((unint64_t *)(v25 + 104), v27);
  if ((_DWORD)result)
    return result;
  if (a8 < 0)
  {
LABEL_35:
    __break(0x5519u);
    return result;
  }
  result = CTCopyUID((uint64_t)v27, a7, a8);
  if (!(_DWORD)result)
    return 0;
  return result;
}

uint64_t CTEvaluateSavageCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5, _QWORD *a6, BOOL *a7)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a5, a6, 0, 0, 0, 0, a7, (uint64_t)&X509PolicySavage, 2);
}

uint64_t CTEvaluateYonkersCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5, _QWORD *a6, _BYTE *a7, uint64_t a8, BOOL *a9)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a5, a6, a7, a8, 0, 0, a9, (uint64_t)&X509PolicyYonkers, 0x80000);
}

uint64_t CTEvaluateSensorCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, const void *a5, size_t a6, _QWORD *a7, _QWORD *a8, _BYTE *a9, uint64_t a10, BOOL *a11)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a7, a8, a9, a10, a5, a6, a11, (uint64_t)&X509PolicySensor, 0x10000000000);
}

unint64_t CTCopyDeviceIdentifiers(unint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v5;
  uint64_t v6;
  int v7;
  char v8;
  _QWORD v9[2];
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v3 = 327696;
  if (!result || !a2)
    return v3;
  v11 = 0;
  v12 = 0;
  v10 = 0;
  if (__CFADD__(result, a2))
  {
    __break(0x5513u);
  }
  else if (result + a2 >= result)
  {
    v9[0] = result;
    v9[1] = result + a2;
    v5 = CTConvertDashTerminatedHexstringTo64BitInteger((uint64_t)v9, &v12);
    v6 = 327697;
    if (!v5 && !HIDWORD(v12))
    {
      if (CTConvertDashTerminatedHexstringTo64BitInteger((uint64_t)v9, &v11))
      {
        return 327698;
      }
      else
      {
        v7 = CTConvertDashTerminatedHexstringTo64BitInteger((uint64_t)v9, &v10);
        v6 = 327699;
        if (!v7)
        {
          v8 = v10;
          if (v10 <= 0xFF)
          {
            v6 = 0;
            if (a3)
            {
              *(_DWORD *)a3 = v12;
              *(_QWORD *)(a3 + 8) = v11;
              *(_BYTE *)(a3 + 16) = (v8 & 8) != 0;
              *(_BYTE *)(a3 + 17) = (v8 & 4) != 0;
              *(_BYTE *)(a3 + 18) = v8 & 3;
              *(_QWORD *)(a3 + 24) = 0;
              *(_QWORD *)(a3 + 32) = 0;
            }
          }
        }
      }
    }
    return v6;
  }
  __break(0x5519u);
  return result;
}

uint64_t CTConvertDashTerminatedHexstringTo64BitInteger(uint64_t result, _QWORD *a2)
{
  unsigned __int8 *v2;
  unint64_t v3;
  _QWORD *v4;
  unsigned __int8 *v5;
  unint64_t v6;
  unsigned __int8 *v7;
  char v8;
  unsigned __int8 *v9;
  uint64_t v10;
  signed int v11;
  char v12;
  uint64_t v13;
  char v14;
  unsigned int v15;
  unint64_t v16;
  unsigned __int8 *v17;
  BOOL v18;
  unsigned __int8 *v19;
  unsigned __int8 *v21;
  unsigned int v22;
  unint64_t v23;

  v2 = *(unsigned __int8 **)result;
  v3 = *(_QWORD *)(result + 8);
  if (*(_QWORD *)result > v3)
    goto LABEL_50;
  v4 = (_QWORD *)result;
  v5 = *(unsigned __int8 **)result;
  if (*(_QWORD *)result < v3)
  {
    v6 = v3 - (_QWORD)v2;
    v5 = *(unsigned __int8 **)result;
    while (*v5 != 45)
    {
      v7 = v5 + 1;
      if ((unint64_t)(v5 + 1) > v3 || v5 > v7)
        goto LABEL_50;
      *(_QWORD *)result = v7;
      ++v5;
      if (!--v6)
      {
        v5 = (unsigned __int8 *)v3;
        break;
      }
    }
  }
  if ((unint64_t)v5 > v3 || v2 > v5)
    goto LABEL_50;
  result = 327708;
  if (v5 == (unsigned __int8 *)v3)
    return result;
  v8 = (_BYTE)v5 - (_BYTE)v2;
  if (v5 - v2 > 16)
    return result;
  if (v5 == (unsigned __int8 *)-1)
    goto LABEL_51;
  v9 = v5 + 1;
  if ((unint64_t)(v5 + 1) > v3 || v5 > v9)
  {
LABEL_50:
    __break(0x5519u);
LABEL_51:
    __break(0x5513u);
LABEL_52:
    __break(0x5500u);
    return result;
  }
  v10 = 0;
  *v4 = v9;
  if (v2 >= v5 || (v11 = v8 + 1 + (((v8 + 1) & 0x8000u) >> 15), v11 << 23 >> 24 < 1))
  {
LABEL_46:
    result = 0;
    if (a2)
      *a2 = v10;
  }
  else
  {
    v12 = 0;
    v10 = 0;
    v13 = v11 >> 1;
    v14 = 8 * v13 - 8;
    while (1)
    {
      if ((v8 & 1) == 0 || (v12 & 1) != 0)
      {
        v16 = *v2;
        if (v16 > ~(unint64_t)asciiNibbleToByte)
          goto LABEL_51;
        v17 = &asciiNibbleToByte[v16];
        v18 = v17 < byte_100241B9A && v17 >= asciiNibbleToByte;
        if (!v18)
          goto LABEL_50;
        if (v2 == (unsigned __int8 *)-1)
          goto LABEL_51;
        if (v2 + 1 > v5 || v2 > v2 + 1)
          goto LABEL_50;
        v15 = *v17;
        ++v2;
      }
      else
      {
        v15 = 0;
      }
      if (v2 >= v5)
        return 327703;
      v19 = &asciiNibbleToByte[*v2];
      if (v19 >= byte_100241B9A || v19 < asciiNibbleToByte)
        goto LABEL_50;
      v21 = v2 + 1;
      if (v2 + 1 > v5 || v2 > v21)
        goto LABEL_50;
      if (v15 > 0xF)
        return 327703;
      v22 = *v19;
      if (v22 > 0xF)
        return 327703;
      v23 = (unint64_t)(v22 | (16 * v15)) << (v14 & 0xF8);
      v18 = __CFADD__(v10, v23);
      v10 += v23;
      if (v18)
        goto LABEL_52;
      if (v21 < v5)
      {
        v14 -= 8;
        v12 = 1;
        v2 = v21;
        if (v13-- > 1)
          continue;
      }
      goto LABEL_46;
    }
  }
  return result;
}

uint64_t CTEvaluateCertsForPolicy(unint64_t a1, uint64_t a2, char a3, int a4, _QWORD *a5, _QWORD *a6, uint64_t a7, uint64_t a8, _QWORD *a9, _QWORD *a10, __int128 *a11)
{
  uint64_t result;
  uint64_t v20;
  uint64_t *v21;
  _BYTE *v22;
  BOOL v23;
  __int128 v24;
  char v25;
  uint64_t v26;
  _UNKNOWN **v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  __int128 v31;
  _BYTE v32[32];
  uint64_t v33;
  _QWORD v34[2];
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38[4];
  _BYTE v39[272];
  uint64_t v40;
  _QWORD v41[116];

  memset(v38, 170, sizeof(v38));
  bzero(v39, 0x4C0uLL);
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_42:
    __break(0x5519u);
  }
  if (a1 + a2 < a1)
    goto LABEL_42;
  v36 = a1 + a2;
  v37 = 0xAAAAAAAAAAAAAAAALL;
  v35 = a1;
  result = (uint64_t)X509ChainParseCertificateSet(&v35, (unint64_t)v39, 4, &v38[2], &v37);
  if ((_DWORD)result)
    return result;
  if (v35 != v36)
    return 327690;
  if ((a4 & 1) == 0 && !v40)
  {
    X509ChainResetChain(v38, &v38[2]);
    v20 = v38[0];
    v21 = (uint64_t *)(v38[0] + 296);
    if (!v38[0])
      v21 = &v38[1];
    *v21 = (uint64_t)v41;
    v38[0] = (uint64_t)v39;
    v41[0] = v20;
    v41[1] = v38;
LABEL_20:
    v34[0] = a7;
    v34[1] = a8;
    if (a7)
      v23 = a8 == 0;
    else
      v23 = 1;
    *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)v32 = v24;
    *(_OWORD *)&v32[16] = v24;
    v31 = *a11;
    v32[0] = *((_BYTE *)a11 + 16);
    if (v23)
      v25 = a3;
    else
      v25 = 1;
    v32[1] = v25;
    *(_WORD *)&v32[2] = *((_WORD *)a11 + 9);
    if (v23)
    {
      *(_OWORD *)&v32[8] = *(__int128 *)((char *)a11 + 24);
      v27 = (_UNKNOWN **)*((_QWORD *)a11 + 5);
    }
    else
    {
      v26 = *((_QWORD *)a11 + 4);
      *(_QWORD *)&v32[8] = v34;
      *(_QWORD *)&v32[16] = v26;
      v27 = oidForPubKeyLength();
    }
    v28 = *((_QWORD *)a11 + 6);
    *(_QWORD *)&v32[24] = v27;
    v33 = v28;
    result = X509ChainCheckPathWithOptions(12, v38, (uint64_t)&v31, 0);
    if (!(_DWORD)result)
    {
      v29 = (_QWORD *)v38[0];
      if (!a5 || !a6 || !v38[0] || (result = X509CertificateParseKey(v38[0], a5, a6), !(_DWORD)result))
      {
        if (a10 && v29)
        {
          v30 = v29[32];
          *a10 = v29[31];
          a10[1] = v30;
        }
        result = 0;
        if (a9)
        {
          if (v29)
          {
            result = 0;
            *a9 = v29[30];
          }
        }
      }
    }
    return result;
  }
  if (v39[265])
  {
    if (v38[2])
    {
      v22 = (_BYTE *)v38[2];
      while (v22[265])
      {
        v22 = (_BYTE *)*((_QWORD *)v22 + 34);
        if (!v22)
        {
          v22 = (_BYTE *)v38[2];
          break;
        }
      }
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    v22 = v39;
  }
  result = X509ChainBuildPathPartial(v22, &v38[2], v38, a4 ^ 1u);
  if (!(_DWORD)result)
    goto LABEL_20;
  return result;
}

uint64_t CTEvaluateSatori(unint64_t a1, uint64_t a2, char a3, _QWORD *a4, _QWORD *a5)
{
  return CTEvaluateCertsForPolicy(a1, a2, a3, 1, a4, a5, 0, 0, 0, 0, &X509PolicySatori);
}

uint64_t CTEvaluateBAASystem(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0, 0, 0, 0, &X509PolicyBAASystem);
}

unint64_t CTEvaluateBAASystemWithId(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5)
{
  unint64_t result;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v7 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0, 0, &v7, &v8, &X509PolicyBAASystem);
  if (!(_DWORD)result)
    return CTFillBAAIdentity(v7, v8, v9, a5);
  return result;
}

unint64_t CTFillBAAIdentity(int a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t result;

  if ((a1 & 0x800000) != 0 && a4)
  {
    result = CTCopyDeviceIdentifiers(a2, a3, a4);
    if ((_DWORD)result)
      return result;
  }
  else if (!a4)
  {
    return 0;
  }
  result = 0;
  if (a1 < 0 && a3)
  {
    if (a2)
    {
      *(_QWORD *)(a4 + 32) = 0;
      *(_OWORD *)a4 = 0u;
      *(_OWORD *)(a4 + 16) = 0u;
      result = 0;
      *(_QWORD *)(a4 + 24) = a2;
      *(_QWORD *)(a4 + 32) = a3;
      return result;
    }
    return 0;
  }
  return result;
}

unint64_t CTEvaluateBAASystemTestRoot(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  unint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v10 = 0;
  v11 = 0;
  v9 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, &v9, &v10, &X509PolicyBAASystem);
  if (!(_DWORD)result)
    return CTFillBAAIdentity(v9, v10, v11, a7);
  return result;
}

unint64_t CTEvaluateBAAUser(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5)
{
  unint64_t result;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v7 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0, 0, &v7, &v8, &X509PolicyBAAUser);
  if (!(_DWORD)result)
    return CTFillBAAIdentity(v7, v8, v9, a5);
  return result;
}

unint64_t CTEvaluateBAAUserTestRoot(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  unint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v10 = 0;
  v11 = 0;
  v9 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, &v9, &v10, &X509PolicyBAAUser);
  if (!(_DWORD)result)
    return CTFillBAAIdentity(v9, v10, v11, a7);
  return result;
}

unint64_t CTEvaluateBAASepApp(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  unint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v10 = 0;
  v11 = 0;
  v9 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, &v9, &v10, &X509PolicyBAASepApp);
  if (!(_DWORD)result)
    return CTFillBAAIdentity(v9, v10, v11, a7);
  return result;
}

uint64_t CTEvaluateBAA(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, _QWORD *a9, uint64_t a10)
{
  uint64_t result;

  switch(a1)
  {
    case 1:
      result = CTEvaluateBAASystemTestRoot(a2, a3, a4, a5, a6, a7, a10);
      break;
    case 2:
      result = CTEvaluateBAAUserTestRoot(a2, a3, a4, a5, a6, a7, a10);
      break;
    case 3:
      result = CTEvaluateBAAAccessory(a2, a3, a4, a5, a6, a7, a8, a9);
      break;
    case 4:
      result = CTEvaluateBAASepApp(a2, a3, a4, a5, a6, a7, a10);
      break;
    default:
      result = 327712;
      break;
  }
  return result;
}

uint64_t CTEvaluateBAAAccessory(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, _QWORD *a8)
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v12 = 0;
  v13 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 0, 1, a5, a6, a3, a4, 0, &v12, &X509PolicyMFi4Attestation);
  if (!(_DWORD)result && a7)
  {
    if (a8)
    {
      v11 = v13;
      *a7 = v12;
      *a8 = v11;
    }
  }
  return result;
}

uint64_t CTGetBAARootType(unint64_t a1, uint64_t a2)
{
  unint64_t v3[2];
  _OWORD v4[19];

  memset(v4, 0, sizeof(v4));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_14:
    __break(0x5519u);
  }
  if (a1 + a2 < a1)
    goto LABEL_14;
  v3[0] = a1;
  v3[1] = a1 + a2;
  if (X509CertificateParse((unint64_t *)v4, v3))
    return 0;
  if (!compare_octet_string((uint64_t)&v4[5] + 8, (uint64_t)&BASystemRootSPKI))
    return 1;
  if (!compare_octet_string((uint64_t)&v4[5] + 8, (uint64_t)&BAUserRootSPKI))
    return 2;
  if (compare_octet_string((uint64_t)&v4[5] + 8, (uint64_t)&MFi4RootSpki))
    return 4 * (compare_octet_string((uint64_t)&v4[5] + 8, (uint64_t)&BASepAppRootSPKI) == 0);
  return 3;
}

uint64_t CTGetBAASubCAType(unint64_t a1, uint64_t a2)
{
  unint64_t v3[2];
  _OWORD v4[19];

  memset(v4, 0, sizeof(v4));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_14:
    __break(0x5519u);
  }
  if (a1 + a2 < a1)
    goto LABEL_14;
  v3[0] = a1;
  v3[1] = a1 + a2;
  if (X509CertificateParse((unint64_t *)v4, v3))
    return 0;
  if (!compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&BASystemRootSKID))
    return 1;
  if (!compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&BAUserRootSKID))
    return 2;
  if (compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&MFi4RootSKID))
    return 4 * (compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&BASepAppRootSKID) == 0);
  return 3;
}

uint64_t CTEvaluateDAK(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  unint64_t v7;
  uint64_t result;
  __int128 v12;
  unint64_t v13;
  _BYTE *v14;
  int v15;
  unint64_t v16[2];
  uint64_t v17;
  _QWORD v18[2];
  uint64_t v19;
  unint64_t v20;
  _QWORD v21[2];
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _OWORD v27[19];

  v7 = a1 + a2;
  if (a1 + a2 < a1)
    goto LABEL_31;
  result = CTEvaluateBAAUserTestRoot(a1, a2, a3, a4, a5, a6, a7);
  if ((_DWORD)result)
    return result;
  *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v27[17] = v12;
  v27[18] = v12;
  v27[15] = v12;
  v27[16] = v12;
  v27[13] = v12;
  v27[14] = v12;
  v27[11] = v12;
  v27[12] = v12;
  v27[9] = v12;
  v27[10] = v12;
  v27[7] = v12;
  v27[8] = v12;
  v27[5] = v12;
  v27[6] = v12;
  v27[3] = v12;
  v27[4] = v12;
  v27[1] = v12;
  v27[2] = v12;
  v27[0] = v12;
  v18[0] = 0xAAAAAAAAAAAAAAAALL;
  v18[1] = 0xAAAAAAAAAAAAAAAALL;
  v17 = 0;
  if (__CFADD__(a1, a2))
    goto LABEL_32;
  v16[0] = a1;
  v16[1] = v7;
  result = (uint64_t)X509ChainParseCertificateSet(v16, (unint64_t)v27, 1, v18, &v17);
  if (!(_DWORD)result)
  {
    if (!v18[0])
      return 327691;
    v25 = 0;
    v26 = 0;
    result = CTParseExtensionValue(*(_QWORD *)v18[0], *(_QWORD *)(v18[0] + 8), &CTOidAppleFDRIdentity, 9uLL, &v25, &v26);
    if (!(_DWORD)result)
    {
      v23 = 0xAAAAAAAAAAAAAAAALL;
      v24 = 0xAAAAAAAAAAAAAAAALL;
      if (!__CFADD__(v25, v26))
      {
        if (v25 > v25 + v26)
          goto LABEL_31;
        v23 = v25;
        v24 = v25 + v26;
        v22 = v26;
        result = ccder_blob_decode_tl(&v23, 12, &v22);
        if (!(_DWORD)result)
          return 720929;
        if (v24 < v23)
          goto LABEL_31;
        v13 = v22;
        if (v22 > v24 - v23)
          goto LABEL_31;
        v25 = v23;
        v26 = v22;
        if (!__CFADD__(v23, v22))
        {
          v14 = (_BYTE *)v23;
          if (v23 < v23 + v22)
          {
            do
            {
              if ((unint64_t)v14 < v23)
                goto LABEL_31;
              if (*v14 == 45)
                goto LABEL_19;
              ++v14;
              --v13;
            }
            while (v13);
            v14 = (_BYTE *)(v23 + v22);
          }
LABEL_19:
          if (v14 != (_BYTE *)-1)
          {
            if ((unint64_t)(v14 + 1) >= v23 + v22)
              return 327711;
            if (v23 <= (unint64_t)(v14 + 1))
            {
              v21[0] = v14 + 1;
              v21[1] = v23 + v22;
              v19 = 0;
              v20 = 0;
              v15 = CTConvertDashTerminatedHexstringTo64BitInteger((uint64_t)v21, &v20);
              result = 327697;
              if (!v15 && !HIDWORD(v20))
              {
                if (CTConvertDashTerminatedHexstringTo64BitInteger((uint64_t)v21, &v19))
                {
                  return 327698;
                }
                else
                {
                  result = 0;
                  if (a7)
                  {
                    *(_DWORD *)a7 = v20;
                    *(_QWORD *)(a7 + 8) = v19;
                  }
                }
              }
              return result;
            }
LABEL_31:
            __break(0x5519u);
          }
        }
      }
LABEL_32:
      __break(0x5513u);
    }
  }
  return result;
}

uint64_t CTEvaluateAcrt(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 0, a3, a4, 0, 0, 0, 0, &X509PolicyACRT);
}

uint64_t CTEvaluateUcrt(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0, 0, 0, 0, &X509PolicyUcrt);
}

uint64_t CTEvaluateUcrtTestRoot(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6)
{
  return CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, 0, 0, &X509PolicyUcrt);
}

uint64_t CTParseFlagsForAccessoryCerts(uint64_t result)
{
  uint64_t v1;
  unsigned __int8 *v2;
  uint64_t v3;

  v1 = result;
  if (!result || (result = *(_QWORD *)(result + 240)) == 0)
  {
    v3 = v1 + 136;
    v2 = *(unsigned __int8 **)(v1 + 136);
    if (*(_QWORD *)(v3 + 8) != 15 || v2 == 0)
      return 0;
    if ((unint64_t)v2 < 0xFFFFFFFFFFFFFFFELL)
    {
      if (v2[2] != 170)
        return 0;
      if ((unint64_t)v2 <= 0xFFFFFFFFFFFFFFF9)
      {
        if (v2[6] != 170)
          return 0;
        if ((unint64_t)v2 <= 0xFFFFFFFFFFFFFFF7)
        {
          if (v2[8] == 170)
          {
            if ((unint64_t)v2 <= 0xFFFFFFFFFFFFFFF4)
            {
              if (v2[11] == 170)
                return 0x8000000;
              return 0;
            }
            goto LABEL_17;
          }
          return 0;
        }
      }
    }
LABEL_17:
    __break(0x5513u);
  }
  return result;
}

uint64_t CTParseAccessoryCerts(char *a1, uint64_t a2, _QWORD *a3, _QWORD *a4, char **a5, unint64_t *a6, uint64_t *a7)
{
  char *v14;
  uint64_t result;
  _BYTE *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  BOOL v34;
  uint64_t v35;
  unint64_t v36[4];
  unint64_t v37;
  unint64_t v38[2];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  _BYTE v46[1216];
  _BYTE v47[16];

  bzero(v46, 0x4C0uLL);
  v45 = 0;
  v44 = 0u;
  v43 = 0u;
  v42 = 0u;
  v41 = 0u;
  v40 = 0u;
  v39 = 0u;
  v38[0] = 4;
  v38[1] = (unint64_t)v46;
  v14 = &a1[a2];
  v37 = 0;
  result = CMSParseContentInfoSignedDataWithOptions(a1, a2, v38, 1);
  if ((_DWORD)result)
  {
    memset(v36, 170, sizeof(v36));
    if (__CFADD__(a1, a2))
      goto LABEL_65;
    v36[0] = (unint64_t)a1;
    v36[1] = (unint64_t)&a1[a2];
    result = (uint64_t)X509ChainParseCertificateSet(v36, (unint64_t)v46, 4, &v36[2], &v37);
    if ((_DWORD)result)
      return result;
    if (v36[0] != v36[1])
      return 327690;
  }
  else
  {
    v37 = v39;
  }
  if (!v46[265])
  {
    if (v37 < 2)
    {
      v20 = 0;
      v17 = 0;
      v16 = v46;
      goto LABEL_19;
    }
    v18 = v37 - 1;
    if (__OFSUB__(v37, 1))
    {
LABEL_67:
      __break(0x5515u);
      return result;
    }
    v17 = 0;
    v16 = v46;
    v20 = 1;
    v19 = 1;
    goto LABEL_20;
  }
  v16 = v46;
  if (!v37)
  {
    v20 = 0;
    v17 = 0;
    goto LABEL_19;
  }
  if (v37 > 5)
  {
LABEL_66:
    __break(0x5512u);
    goto LABEL_67;
  }
  v17 = 304 * v37 - 304;
  if (__CFADD__(v46, v17))
  {
LABEL_65:
    __break(0x5513u);
    goto LABEL_66;
  }
  v16 = &v46[v17];
  v18 = v37 - 2;
  if (v37 < 2)
  {
    v20 = 0;
LABEL_19:
    v18 = -1;
    v19 = -1;
    goto LABEL_20;
  }
  v19 = 0;
  v20 = 1;
LABEL_20:
  if (a5 && a6)
  {
    v21 = v20 ^ 1;
    if (v18 < 0)
      v21 = 1;
    if ((v21 & 1) != 0)
    {
      v27 = 0;
      v26 = 0;
LABEL_47:
      *a5 = v27;
      *a6 = v26;
      goto LABEL_48;
    }
    v22 = (unint64_t *)&v46[304 * (int)v19];
    if (v22 >= (unint64_t *)v47 || v22 < (unint64_t *)v46)
      goto LABEL_63;
    v23 = 304 * (int)v19;
    if (v23 > 0x4BF)
      goto LABEL_64;
    v24 = v23 | 8;
    if ((v23 | 8) > 0x4C0)
      goto LABEL_64;
    v25 = *v22;
    if (v19 <= v18)
    {
      v26 = 0;
      while (1)
      {
        if (&v46[v24 - 8] >= v47 || &v46[v24 - 8] < v46)
          goto LABEL_63;
        if (v24 > 0x4C0)
          goto LABEL_64;
        v29 = *(_QWORD *)&v46[v24];
        v30 = __CFADD__(v26, v29);
        v26 += v29;
        if (v30)
          break;
        v31 = v19 + 1;
        if (__OFADD__(v19, 1))
          break;
        v24 += 304;
        ++v19;
        if (v31 > v18)
          goto LABEL_41;
      }
      __break(0x5500u);
      goto LABEL_63;
    }
    v26 = 0;
LABEL_41:
    v32 = v25 - (_QWORD)a1;
    v33 = v25 >= (unint64_t)a1;
    v34 = v25 < (unint64_t)a1;
    if (v32 < 0)
      v33 = v34;
    if (v33)
    {
      v27 = &a1[v32];
      if (v14 < v27 || v27 < a1 || v26 > v14 - v27)
        goto LABEL_63;
      goto LABEL_47;
    }
    goto LABEL_65;
  }
LABEL_48:
  if (a7 && v16)
  {
    if (v16 >= v47 || v16 < v46)
      goto LABEL_63;
    *a7 = CTParseFlagsForAccessoryCerts((uint64_t)v16);
  }
  result = 0;
  if (a3 && a4 && v16)
  {
    if (v46 <= v16 && v16 + 304 <= v47)
    {
      if (v17 <= 0x4BF && (v17 | 8) <= 0x4C0)
      {
        result = 0;
        v35 = *((_QWORD *)v16 + 1);
        *a3 = *(_QWORD *)v16;
        *a4 = v35;
        return result;
      }
LABEL_64:
      __break(1u);
    }
LABEL_63:
    __break(0x5519u);
    goto LABEL_64;
  }
  return result;
}

uint64_t CTEvaluateAccessoryCert(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, _QWORD *a8, _QWORD *a9, _QWORD *a10, _QWORD *a11)
{
  uint64_t result;
  uint64_t v20;
  uint64_t **v21;
  unint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  BOOL v25;
  unint64_t v26;
  char v27;
  char v28;
  char v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  __int16 v34;
  char v35;
  char v36;
  int v37;
  unint64_t *v38;
  unint64_t *v39;
  unint64_t *v40;
  uint64_t v41;
  unint64_t v42[2];
  unint64_t v43[4];
  unint64_t v44;
  unint64_t v45;
  unint64_t v46[4];
  unint64_t *v47;
  uint64_t *v48;
  _BYTE v49[272];
  uint64_t v50;
  unint64_t v51[34];
  _QWORD v52[4];
  unint64_t v53[11];
  unint64_t v54[19];
  uint64_t v55;
  _QWORD v56[42];

  bzero(v51, 0x390uLL);
  v47 = 0;
  v48 = 0;
  memset(v46, 170, sizeof(v46));
  if (__CFADD__(a1, a2))
    goto LABEL_56;
  if (a1 + a2 < a1)
    goto LABEL_57;
  v46[0] = a1;
  v46[1] = a1 + a2;
  result = X509CertificateParse(v51, v46);
  if ((_DWORD)result)
    return result;
  v20 = (uint64_t)v47;
  v21 = &v48;
  if (v47)
    v21 = (uint64_t **)(v47 + 35);
  *v21 = v52;
  v47 = v51;
  v52[0] = v20;
  v52[1] = &v47;
  v44 = 0xAAAAAAAAAAAAAAAALL;
  v45 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a5, a6))
    goto LABEL_56;
  if (a5 + a6 < a5)
    goto LABEL_57;
  v44 = a5;
  v45 = a5 + a6;
  if ((unint64_t *)((char *)v53 + 1) != 0 && (unint64_t)v51 >= 0xFFFFFFFFFFFFFECFLL)
    goto LABEL_56;
  result = X509CertificateParse(v53, &v44);
  if ((_DWORD)result)
    return result;
  v56[0] = 0;
  v56[1] = v48;
  *v48 = (uint64_t)v53;
  v48 = v56;
  bzero(v49, 0x390uLL);
  if (!a3 || !a4)
  {
LABEL_22:
    result = X509ChainBuildPath(v51, (uint64_t *)&v47, &v46[2]);
    if ((_DWORD)result)
      return result;
    v26 = 0;
    v27 = 0;
    v28 = 28;
    result = 327700;
    if (a7 <= 0x1FFFFFFF)
    {
      if (a7 <= 0x7FFFFFF)
      {
        if (a7)
        {
          v29 = 0;
          if (a7 != 4)
            return result;
        }
        else
        {
          v27 = 0;
          v26 = 0;
          v29 = 1;
        }
        goto LABEL_44;
      }
      if (a7 == 0x8000000)
      {
        v26 = 0;
        v29 = 0;
        v28 = 29;
        v27 = 1;
        goto LABEL_44;
      }
      if (a7 != 0x10000000)
        return result;
    }
    else
    {
      if (a7 > 0x3FFFFFFFFLL)
      {
        if (a7 == 0x400000000 || a7 == 0x800000000)
        {
          v29 = 0;
        }
        else
        {
          v29 = 0;
          if (a7 != 0x1000000000)
            return result;
        }
        goto LABEL_44;
      }
      if (a7 != 0x20000000)
      {
        if (a7 != 0x40000000)
          return result;
        v27 = 0;
        v29 = 0;
        v26 = 3;
        goto LABEL_44;
      }
      v27 = 1;
    }
    v29 = v27;
    v26 = 2;
    v27 = 0;
LABEL_44:
    if (!v55)
      v55 = a7;
    memset(v43, 170, sizeof(v43));
    v42[0] = 0xAAAAAAAAAAAAAAAALL;
    v42[1] = 0xAAAAAAAAAAAAAAAALL;
    X509CertificateParseSPKI(v54, &v43[2], v42, v43);
    v32 = v26;
    v33 = a7;
    v37 = -1431655766;
    v38 = v43;
    v34 = 0;
    v35 = v29;
    v36 = v27;
    v39 = &v43[2];
    v40 = v42;
    v41 = 0;
    result = X509ChainCheckPath(v28, (uint64_t *)&v46[2], (uint64_t)&v32);
    if (!(_DWORD)result)
    {
      v30 = v46[2];
      if (!a8 || !a9 || !v46[2] || (result = X509CertificateParseKey(v46[2], a8, a9), !(_DWORD)result))
      {
        result = 0;
        if (a10 && a11)
        {
          if (v30)
          {
            result = 0;
            v31 = *(_QWORD *)(v30 + 256);
            *a10 = *(_QWORD *)(v30 + 248);
            *a11 = v31;
          }
        }
      }
    }
    return result;
  }
  if (__CFADD__(a3, a4))
  {
LABEL_56:
    __break(0x5513u);
LABEL_57:
    __break(0x5519u);
  }
  if (a3 + a4 < a3)
    goto LABEL_57;
  v32 = a3;
  v33 = a3 + a4;
  if (a3 + a4 <= a3)
    goto LABEL_22;
  v22 = 0;
  v23 = &v50;
  while (1)
  {
    result = X509CertificateParse((unint64_t *)v23 - 34, &v32);
    if ((_DWORD)result)
      return result;
    v24 = v48;
    *v23 = 0;
    v23[1] = (uint64_t)v24;
    *v24 = (uint64_t)(v23 - 34);
    v48 = v23;
    v25 = v32 >= v33 || v22++ > 1;
    v23 += 38;
    if (v25)
      goto LABEL_22;
  }
}

uint64_t CTEvaluatePragueSignatureCMS(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, _QWORD *a6, _QWORD *a7)
{
  __int128 v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;

  v9 = 0xAAAAAAAA0000AA01;
  v8 = xmmword_100241C50;
  BYTE1(v9) = a5;
  v10 = 0u;
  v11 = 0u;
  return CMSVerifySignedDataWithLeaf(a1, a2, a3, a4, (uint64_t)&v8, a6, a7);
}

uint64_t CTEvaluateKDLSignatureCMS(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, _QWORD *a6, _QWORD *a7)
{
  __int128 v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;

  v9 = 0xAAAAAAAA0000AA01;
  v8 = xmmword_100241C60;
  BYTE1(v9) = a5;
  v10 = 0u;
  v11 = 0u;
  return CMSVerifySignedDataWithLeaf(a1, a2, a3, a4, (uint64_t)&v8, a6, a7);
}

uint64_t CTVerifyAppleMarkerExtension(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  unsigned __int8 *v16;
  uint64_t v17;
  int v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;

  result = 327700;
  v4 = a1[31];
  v5 = a1[32];
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
    return 327707;
  v7 = a1[30];
  if ((v7 & 0x100000000) == 0)
  {
    if ((v7 & 0x200000000) == 0)
      return result;
    if (!__CFADD__(v4, v5))
    {
      v11 = v4 + v5;
      if (v4 + v5 != -1)
      {
        if (v5 > 0x13)
          return 327704;
        v16 = (unsigned __int8 *)(v11 - 1);
        if (v11 - 1 >= v4)
        {
          v10 = 0;
          v17 = 0;
          while ((unint64_t)v16 < v11)
          {
            v18 = *v16;
            if ((v18 - 58) < 0xFFFFFFF6)
              return 327705;
            if (v17 == 20)
              break;
            if ((v17 & 0x1FFFFFFFFFFFFFFFLL) == 0x14)
              goto LABEL_39;
            v19 = (v18 - 48);
            v20 = powersOfTen[v17];
            if (!is_mul_ok(v19, v20))
              goto LABEL_40;
            v21 = v19 * v20;
            v15 = __CFADD__(v10, v21);
            v10 += v21;
            if (v15)
              goto LABEL_38;
            ++v17;
            if ((unint64_t)--v16 < v4)
              goto LABEL_23;
          }
LABEL_37:
          __break(0x5519u);
LABEL_38:
          __break(0x5500u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(0x550Cu);
          goto LABEL_41;
        }
        goto LABEL_13;
      }
    }
LABEL_41:
    __break(0x5513u);
    return result;
  }
  if (__CFADD__(v4, v5))
    goto LABEL_41;
  v8 = v4 + v5;
  if (v4 + v5 == -1)
    goto LABEL_41;
  v9 = (_BYTE *)(v8 - 1);
  if (v8 - 1 >= v4)
  {
    v12 = 0;
    v13 = 0;
    v10 = 0;
    while ((unint64_t)v9 < v8)
    {
      v14 = (unint64_t)(*v9 & 0x7F) << v12;
      v15 = __CFADD__(v10, v14);
      v10 += v14;
      if (v15)
        goto LABEL_38;
      if (v13 <= 7)
      {
        ++v13;
        --v9;
        v12 += 7;
        if ((unint64_t)v9 >= v4)
          continue;
      }
      goto LABEL_23;
    }
    goto LABEL_37;
  }
LABEL_13:
  v10 = 0;
LABEL_23:
  if (v10 == a2)
    return 0;
  else
    return 589829;
}

uint64_t CTVerifyHostname(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  _QWORD v7[2];
  unint64_t v8;

  v3 = 327702;
  if (*(_QWORD *)(a1 + 232) && *(_QWORD *)(a1 + 224))
  {
    v7[1] = a3;
    v8 = 0xAAAAAAAAAAAAAA00;
    v7[0] = a2;
    v4 = X509CertificateParseGeneralNamesContent(a1, (uint64_t (*)(_QWORD, int *, uint64_t))CTCompareGeneralNameToHostname, (uint64_t)v7);
    if ((_BYTE)v8)
      v5 = 0;
    else
      v5 = 327706;
    if (v4)
      return v4;
    else
      return v5;
  }
  return v3;
}

uint64_t CTCompareGeneralNameToHostname(uint64_t result, _QWORD *a2, unint64_t a3)
{
  char *v4;
  size_t v5;
  size_t v6;
  char *v7;
  char *v8;
  BOOL v9;
  int v11;
  size_t v12;
  unint64_t v13;
  _BYTE *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  char *v20;
  size_t v22;
  size_t v23;

  if ((_DWORD)result != 2)
    return 1;
  v4 = *(char **)a3;
  v5 = *(_QWORD *)(a3 + 8);
  v6 = ~*(_QWORD *)a3;
  if (v5 > v6)
    goto LABEL_50;
  v7 = &v4[v5];
  if (&v4[v5] == (char *)-1)
    goto LABEL_50;
  v8 = v7 - 1;
  if (v7)
    v9 = v8 >= v4;
  else
    v9 = 0;
  if (!v9 || a3 + 24 < a3)
    goto LABEL_49;
  v11 = *v8;
  result = compare_octet_string((uint64_t)a2, a3);
  if (!(_DWORD)result)
    goto LABEL_48;
  if (v11 != 46)
    goto LABEL_15;
  v12 = v5 - 1;
  if (v5)
  {
    if (v12 <= v5)
    {
      result = compare_octet_string_raw((uint64_t)a2, v4, v12);
      if ((_DWORD)result)
      {
LABEL_15:
        v13 = a2[1];
        if (v13 < 3)
          return 1;
        v14 = (_BYTE *)*a2;
        if (*(_BYTE *)*a2 != 42)
          return 1;
        if (v14 != (_BYTE *)-1)
        {
          v15 = v14 + 1;
          if (v14[1] == 46)
          {
            v16 = -2;
            if ((unint64_t)v14 < 0xFFFFFFFFFFFFFFFELL)
              v16 = (uint64_t)v14;
            v17 = -v16;
            v18 = 2;
            result = 1;
            while (v17 != v18)
            {
              if (&v14[v18] < v14)
                goto LABEL_49;
              if (v14[v18] == 46)
              {
                if (v13 == v18)
                  return 1;
                v19 = 0;
                if (v5)
                {
                  while (1)
                  {
                    v20 = &v4[v19];
                    if (&v4[v19] >= v7 || v20 < v4)
                      goto LABEL_49;
                    if (*v20 == 46)
                      break;
                    if (v5 == ++v19)
                    {
                      v19 = v5;
                      break;
                    }
                  }
                }
                v22 = v13 - 1;
                v9 = v5 >= v19;
                v23 = v5 - v19;
                if (!v9)
                  goto LABEL_51;
                if (v22 == v23)
                {
                  if (v19 > v6)
                    goto LABEL_50;
                  result = memcmp(v15, &v4[v19], v13 - 1);
                  if (!(_DWORD)result)
                    goto LABEL_48;
                }
                if (v11 != 46)
                  return 1;
                if (!v23)
                  goto LABEL_51;
                if (v22 != v23 - 1)
                  return 1;
                if (v19 <= v6)
                {
                  if (!memcmp(v15, &v4[v19], v22))
                    goto LABEL_48;
                  return 1;
                }
                goto LABEL_50;
              }
              if (v13 == ++v18)
                return result;
            }
            goto LABEL_50;
          }
          return 1;
        }
LABEL_50:
        __break(0x5513u);
        goto LABEL_51;
      }
LABEL_48:
      result = 0;
      *(_BYTE *)(a3 + 16) = 1;
      return result;
    }
LABEL_49:
    __break(0x5519u);
    goto LABEL_50;
  }
LABEL_51:
  __break(0x5515u);
  return result;
}

uint64_t CTEvaluateAppleSSLWithOptionalTemporalCheck(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7)
{
  uint64_t result;
  __int128 v13;
  unint64_t v14[2];
  _QWORD v15[3];
  _OWORD v16[19];
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  unint64_t v20;
  __int128 *v21;
  __int128 *v22;
  __int128 *v23;
  _UNKNOWN **v24;

  v20 = 0xAAAAAAAA00AAAA01;
  v21 = &null_octet;
  v19 = xmmword_100241C70;
  BYTE1(v20) = a6;
  BYTE2(v20) = a7;
  v22 = &null_octet;
  v23 = &null_octet;
  v24 = &CTOctetServerAuthEKU;
  v17 = 0;
  v18 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, a6, 1, &v17, &v18, 0, 0, 0, 0, &v19);
  if (!(_DWORD)result)
  {
    *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v16[17] = v13;
    v16[18] = v13;
    v16[15] = v13;
    v16[16] = v13;
    v16[13] = v13;
    v16[14] = v13;
    v16[11] = v13;
    v16[12] = v13;
    v16[9] = v13;
    v16[10] = v13;
    v16[7] = v13;
    v16[8] = v13;
    v16[6] = v13;
    v16[4] = v13;
    v16[5] = v13;
    v16[2] = v13;
    v16[3] = v13;
    v16[0] = v13;
    v16[1] = v13;
    memset(v15, 170, sizeof(v15));
    if (__CFADD__(a1, a2))
    {
      __break(0x5513u);
    }
    else
    {
      v14[0] = a1;
      v14[1] = a1 + a2;
      result = (uint64_t)X509ChainParseCertificateSet(v14, (unint64_t)v16, 1, &v15[1], v15);
      if (!(_DWORD)result)
      {
        result = CTVerifyAppleMarkerExtension(v16, a5);
        if (!(_DWORD)result)
          return CTVerifyHostname((uint64_t)v16, a3, a4);
      }
    }
  }
  return result;
}

uint64_t CTEvaluateAppleSSL(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  return CTEvaluateAppleSSLWithOptionalTemporalCheck(a1, a2, a3, a4, a5, a6, 1);
}

uint64_t CTCopyUID(uint64_t result, _BYTE *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  _BYTE *v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  unsigned __int8 *v14;
  unsigned int v15;
  unsigned int v16;

  v5 = *(_QWORD *)result;
  v4 = *(_QWORD *)(result + 8);
  if (__CFADD__(*(_QWORD *)result, v4))
    goto LABEL_31;
  v6 = v5 + v4;
  v7 = *(unsigned __int8 **)result;
  if (v5 < v6)
  {
    while ((unint64_t)v7 >= v5)
    {
      v3 = *v7;
      if (v3 != 45 && (unint64_t)++v7 < v6)
        continue;
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_6:
  if (v7 == (unsigned __int8 *)-1)
    goto LABEL_31;
  v8 = v7 + 1;
  v3 = 327693;
  result = 327693;
  if ((unint64_t)(v7 + 1) >= v6)
    return result;
  if (a3 < 0 || v5 > (unint64_t)v8)
  {
LABEL_34:
    __break(0x5519u);
    return result;
  }
  if (__CFADD__(v8, v6 - (_QWORD)v8))
    goto LABEL_31;
  if (v6 - (_QWORD)v8 != 2 * a3)
    return (v3 + 1);
  if (__CFADD__(a2, a3) || v7 == (unsigned __int8 *)-2)
  {
LABEL_31:
    __break(0x5513u);
    return (v3 + 1);
  }
  v9 = v7 + 2;
  v10 = a2;
  while (1)
  {
    result = 0;
    if ((unint64_t)v9 >= v6 || v10 >= &a2[a3])
      return result;
    v11 = v9 - 1;
    if ((unint64_t)(v9 - 1) >= v6 || v11 < v8)
      goto LABEL_34;
    v12 = &asciiNibbleToByte[*v11];
    result = (uint64_t)byte_100241B9A;
    if (v12 >= byte_100241B9A || v12 < asciiNibbleToByte)
      goto LABEL_34;
    if (v11 < v7)
      goto LABEL_34;
    v14 = &asciiNibbleToByte[*v9];
    result = (uint64_t)byte_100241B9A;
    if (v14 >= byte_100241B9A || v14 < asciiNibbleToByte)
      goto LABEL_34;
    v15 = *v12;
    result = 327695;
    if (v15 > 0xF)
      return result;
    v16 = *v14;
    if (v16 > 0xF)
      return result;
    if (v10 < a2)
      goto LABEL_34;
    *v10++ = v16 | (16 * v15);
    v9 += 2;
    if (!v9)
      goto LABEL_31;
  }
}

uint64_t X509CertificateParseImplicit(uint64_t a1, unint64_t *a2, const void *a3, size_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  BOOL v41;
  int v42;
  int v43;
  unint64_t v45;
  unint64_t v53;
  unint64_t v54;
  unsigned __int8 v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  BOOL v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  _OWORD v72[10];

  v70 = 0;
  v71 = 0;
  v68 = 0xAAAAAAAAAAAAAAAALL;
  v69 = 0xAAAAAAAAAAAAAAAALL;
  v4 = *a2;
  v5 = a2[1];
  if (*a2 > v5)
    goto LABEL_186;
  v10 = 720915;
  v68 = *a2;
  v69 = v5;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  result = ccder_blob_decode_tl(&v68, 0x2000000000000010, &v71);
  if (!(_DWORD)result)
    return v10;
  v12 = v71;
  v13 = v68;
  v14 = v71 + v68 - v4;
  if (__CFADD__(v71, v68 - v4))
    goto LABEL_188;
  if (v14 > v5 - v4)
    goto LABEL_186;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v14;
  v66 = 0xAAAAAAAAAAAAAAAALL;
  v67 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v13, v12))
    goto LABEL_187;
  v15 = v13 + v12;
  if (v13 > v15 || v15 > v69)
    goto LABEL_186;
  v66 = v13;
  v67 = v15;
  v64 = v13;
  v65 = v15;
  if (ccder_blob_decode_tl(&v64, 0xA000000000000000, &v70))
  {
    v16 = v70;
    v17 = v64;
    if (__CFADD__(v64, v70))
      goto LABEL_187;
    v18 = 720916;
    if (ccder_blob_decode_uint64(&v64, a1 + 32) && v64 == v17 + v16)
    {
      if (v17 + v16 > v65)
        goto LABEL_186;
      v66 = v17 + v16;
      v67 = v65;
      goto LABEL_14;
    }
    return v18;
  }
LABEL_14:
  if (!ccder_blob_decode_tl(&v66, 2, &v70))
    return 720917;
  v20 = v66;
  v19 = v67;
  if (v67 < v66)
    goto LABEL_186;
  v21 = v70;
  if (v70 > v67 - v66)
    goto LABEL_186;
  *(_QWORD *)(a1 + 136) = v66;
  *(_QWORD *)(a1 + 144) = v21;
  if (__CFADD__(v20, v21))
    goto LABEL_187;
  v22 = v20 + v21;
  if (v20 > v22 || v22 > v19)
    goto LABEL_186;
  v66 = v22;
  if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v66, (unint64_t *)(a1 + 152)))
    return 720918;
  if (!ccder_blob_decode_tl(&v66, 0x2000000000000010, &v70))
    return 720919;
  v24 = v66;
  v23 = v67;
  if (v67 < v66)
    goto LABEL_186;
  v25 = v70;
  if (v70 > v67 - v66)
    goto LABEL_186;
  *(_QWORD *)(a1 + 120) = v66;
  *(_QWORD *)(a1 + 128) = v25;
  if (__CFADD__(v24, v25))
    goto LABEL_187;
  v26 = v24 + v25;
  if (v24 > v26 || v26 > v23)
    goto LABEL_186;
  v66 = v26;
  if (!ccder_blob_decode_tl(&v66, 0x2000000000000010, &v70))
    return 720920;
  v28 = v66;
  v27 = v67;
  if (v67 < v66)
    goto LABEL_186;
  v29 = v70;
  if (v70 > v67 - v66)
    goto LABEL_186;
  *(_QWORD *)(a1 + 72) = v66;
  *(_QWORD *)(a1 + 80) = v29;
  if (__CFADD__(v28, v29))
    goto LABEL_187;
  v30 = v28 + v29;
  if (v28 > v30 || v30 > v27)
    goto LABEL_186;
  v66 = v30;
  if (!ccder_blob_decode_tl(&v66, 0x2000000000000010, &v70))
    return 720921;
  v31 = v66;
  v32 = v67;
  if (v67 < v66)
    goto LABEL_186;
  v33 = v70;
  if (v70 > v67 - v66)
    goto LABEL_186;
  *(_QWORD *)(a1 + 104) = v66;
  *(_QWORD *)(a1 + 112) = v33;
  if (__CFADD__(v31, v33))
    goto LABEL_187;
  v34 = v31 + v33;
  if (v31 > v31 + v33 || v34 > v32)
    goto LABEL_186;
  v66 = v31 + v33;
  result = ccder_blob_decode_tl(&v66, 0x2000000000000010, &v70);
  if (!(_DWORD)result)
    return 720922;
  v35 = v66;
  v36 = v70;
  v37 = v66 - v34 + v70;
  if (!__CFADD__(v66 - v34, v70))
  {
    if (v37 > v32 - v34)
      goto LABEL_186;
    *(_QWORD *)(a1 + 88) = v34;
    *(_QWORD *)(a1 + 96) = v37;
    if (__CFADD__(v35, v36))
      goto LABEL_187;
    v38 = v35 + v36;
    if (v35 > v38 || v38 > v67)
      goto LABEL_186;
    v65 = v67;
    v66 = v38;
    v64 = v38;
    if ((ccder_blob_decode_tl(&v64, 0x8000000000000001, &v70) & 1) != 0)
      return 720923;
    if (v66 > v67)
      goto LABEL_186;
    v64 = v66;
    v65 = v67;
    if ((ccder_blob_decode_tl(&v64, 0x8000000000000002, &v70) & 1) != 0)
      return 720924;
    if (v66 > v67)
      goto LABEL_186;
    v64 = v66;
    v65 = v67;
    if (ccder_blob_decode_tl(&v64, 0xA000000000000003, &v70))
    {
      v62 = 0xAAAAAAAAAAAAAAAALL;
      v63 = 0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v64, v70))
        goto LABEL_187;
      if (v64 > v64 + v70 || v64 + v70 > v65)
        goto LABEL_186;
      v62 = v64;
      v63 = v64 + v70;
      if (!ccder_blob_decode_tl(&v62, 0x2000000000000010, &v70) || !v70)
        return 720925;
      v39 = v62;
      if (__CFADD__(v62, v70))
LABEL_187:
        __break(0x5513u);
      v40 = v62 + v70;
      if (v62 > v62 + v70 || v40 > v63)
        goto LABEL_186;
      v63 = v62 + v70;
      *(_BYTE *)(a1 + 266) = 0;
      memset(&v72[2], 0, 128);
      if (a3)
        v41 = a4 == 0;
      else
        v41 = 1;
      v42 = !v41;
      memset(v72, 0, 32);
      if (v39 < v40)
      {
        v55 = 0;
        v43 = 0;
        do
        {
          v60 = 0xAAAAAAAAAAAAAAAALL;
          v61 = 0xAAAAAAAAAAAAAAAALL;
          v59 = 0;
          v58 = 0;
          if ((ccder_blob_decode_tl(&v62, 0x2000000000000010, &v58) & 1) == 0)
            return 720926;
          v56 = 0xAAAAAAAAAAAAAAAALL;
          v57 = 0xAAAAAAAAAAAAAAAALL;
          if (__CFADD__(v62, v58))
            goto LABEL_187;
          if (v62 > v62 + v58 || v62 + v58 > v63)
            goto LABEL_186;
          v56 = v62;
          v57 = v62 + v58;
          if (!ccder_blob_decode_tl(&v56, 6, &v70))
            return 720927;
          if (v57 < v56 || v70 > v57 - v56)
            goto LABEL_186;
          v60 = v56;
          v61 = v70;
          if (__CFADD__(v56, v70))
            goto LABEL_187;
          if (v56 > v56 + v70 || v56 + v70 > v57)
            goto LABEL_186;
          v56 += v70;
          if (!der_get_BOOLean(&v56, 1, &v59))
            return 720928;
          if (!ccder_blob_decode_tl(&v56, 4, &v70))
            return 720929;
          if (__CFADD__(v56, v70))
            goto LABEL_187;
          if (v57 != v56 + v70)
            return 720929;
          if (v42 && !compare_octet_string_raw((uint64_t)&v60, a3, a4))
          {
            if (v57 < v56)
              goto LABEL_186;
            v45 = v70;
            if (v70 > v57 - v56)
              goto LABEL_186;
            *(_QWORD *)(a1 + 248) = v56;
            *(_QWORD *)(a1 + 256) = v45;
          }
          if (v61 == 3)
          {
            if (*(_WORD *)v60 == 7509 && *(_BYTE *)(v60 + 2) == 15)
            {
              v18 = 720930;
              if ((v43 & 1) != 0 || (X509ExtensionParseKeyUsage((uint64_t)&v56, (_BYTE *)(a1 + 264)) & 1) == 0)
                return v18;
              v43 |= 1u;
              goto LABEL_155;
            }
            if (*(_WORD *)v60 == 7509 && *(_BYTE *)(v60 + 2) == 19)
            {
              v18 = 720931;
              if ((v43 & 2) != 0
                || (X509ExtensionParseBasicConstraints(&v56, (unint64_t *)(a1 + 200), (BOOL *)(a1 + 265)) & 1) == 0)
              {
                return v18;
              }
              v43 |= 2u;
              goto LABEL_155;
            }
            if (*(_WORD *)v60 == 7509 && *(_BYTE *)(v60 + 2) == 35)
            {
              v18 = 720932;
              if ((v43 & 4) != 0
                || (X509ExtensionParseAuthorityKeyIdentifier(&v56, (unint64_t *)(a1 + 168), (unint64_t *)(a1 + 176)) & 1) == 0)
              {
                return v18;
              }
              v43 |= 4u;
              goto LABEL_155;
            }
            if (*(_WORD *)v60 == 7509 && *(_BYTE *)(v60 + 2) == 14)
            {
              v18 = 720933;
              if ((v43 & 8) != 0
                || (X509ExtensionParseSubjectKeyIdentifier(&v56, (unint64_t *)(a1 + 184), (unint64_t *)(a1 + 192)) & 1) == 0)
              {
                return v18;
              }
              v43 |= 8u;
              goto LABEL_155;
            }
            if (*(_WORD *)v60 == 7509 && *(_BYTE *)(v60 + 2) == 37)
            {
              v18 = 720934;
              if ((v43 & 0x10) != 0
                || (X509ExtensionParseExtendedKeyUsage(&v56, (unint64_t *)(a1 + 208), (unint64_t *)(a1 + 216)) & 1) == 0)
              {
                return v18;
              }
              v43 |= 0x10u;
              goto LABEL_155;
            }
            if (*(_WORD *)v60 == 7509 && *(_BYTE *)(v60 + 2) == 17)
            {
              v18 = 720935;
              if ((v43 & 0x20) != 0
                || (X509ExtensionParseSubjectAltName(&v56, (unint64_t *)(a1 + 224), (unint64_t *)(a1 + 232)) & 1) == 0)
              {
                return v18;
              }
              v43 |= 0x20u;
              goto LABEL_155;
            }
          }
          else if (v61 >= 8 && *(_DWORD *)v60 == -2042067414 && *(_DWORD *)(v60 + 3) == 1684273030)
          {
            v18 = 720936;
            if (!X509CertificateVerifyOnlyOneAppleExtension((uint64_t)&v60, (uint64_t)v72, v55))
              return v18;
            result = X509ExtensionParseAppleExtension((uint64_t)&v56, v60, v61, (unint64_t *)(a1 + 240), (unint64_t *)(a1 + 248), v42);
            if (!(_DWORD)result)
              return v18;
            if (v55 == 0xFF)
              goto LABEL_189;
            ++v55;
            goto LABEL_155;
          }
          if (__CFADD__(v56, v70))
            goto LABEL_187;
          if (v56 > v56 + v70 || v56 + v70 > v57)
            goto LABEL_186;
          v56 += v70;
          if (v59)
            *(_BYTE *)(a1 + 266) = 1;
LABEL_155:
          if (v56 != v57)
            return 720926;
          if (__CFADD__(v62, v58))
            goto LABEL_187;
          v39 = v62 + v58;
          if (v62 > v62 + v58)
            goto LABEL_186;
          v40 = v63;
          if (v39 > v63)
            goto LABEL_186;
          v62 += v58;
        }
        while (v39 < v63);
      }
      if (v39 != v40)
        return 720925;
      if (v39 > v67 || v66 > v39)
        goto LABEL_186;
      v66 = v39;
    }
    if (*(_QWORD *)(a1 + 32) < 3uLL)
    {
      v18 = 720915;
      if (v66 != v67)
        return v18;
LABEL_170:
      if (__CFADD__(v68, v71))
        goto LABEL_187;
      if (v68 > v68 + v71 || v68 + v71 > v69)
        goto LABEL_186;
      v68 += v71;
      if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v68, (unint64_t *)(a1 + 40)))
        return 720937;
      *(_QWORD *)&v72[0] = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v72[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
      v62 = 0;
      result = ccder_blob_decode_bitstring(&v68, v72, &v62);
      if (!(_DWORD)result)
        return 720938;
      if (v62 < 0xFFFFFFFFFFFFFFF9)
      {
        if (*((_QWORD *)&v72[0] + 1) >= *(_QWORD *)&v72[0])
        {
          v53 = (v62 + 7) >> 3;
          if (v53 <= *((_QWORD *)&v72[0] + 1) - *(_QWORD *)&v72[0])
          {
            *(_QWORD *)(a1 + 56) = *(_QWORD *)&v72[0];
            *(_QWORD *)(a1 + 64) = v53;
            v54 = v69;
            if (v68 <= v69)
            {
              v18 = 0;
              *a2 = v68;
              a2[1] = v54;
              return v18;
            }
          }
        }
        goto LABEL_186;
      }
      goto LABEL_188;
    }
    if (v67 <= a2[1] && *a2 <= v67)
    {
      *a2 = v67;
      goto LABEL_170;
    }
LABEL_186:
    __break(0x5519u);
    goto LABEL_187;
  }
LABEL_188:
  __break(0x5500u);
LABEL_189:
  __break(0x5507u);
  return result;
}

uint64_t der_get_BOOLean(unint64_t *a1, int a2, BOOL *a3)
{
  unint64_t v3;
  uint64_t result;
  unsigned __int8 *v8;
  int v9;
  unsigned __int8 *v11;
  uint64_t v12;
  unsigned __int8 *v13;
  unint64_t v14;

  v13 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  v14 = 0xAAAAAAAAAAAAAAAALL;
  v3 = a1[1];
  if (*a1 > v3)
    goto LABEL_22;
  v13 = (unsigned __int8 *)*a1;
  v14 = v3;
  v12 = 0;
  result = ccder_blob_decode_tl(&v13, 1, &v12);
  if ((result & 1) != 0)
  {
    if (v12 == 1)
    {
      v8 = v13;
      if ((unint64_t)v13 < v14)
      {
        v9 = *v13;
        if (v9 != 255 && v9 != 0)
          return 0;
        if (a3)
          *a3 = v9 != 0;
        if (v8 == (unsigned __int8 *)-1)
        {
          __break(0x5513u);
          return result;
        }
        v11 = v8 + 1;
        if ((unint64_t)v11 <= a1[1] && *a1 <= (unint64_t)v11)
        {
          *a1 = (unint64_t)v11;
          return 1;
        }
      }
LABEL_22:
      __break(0x5519u);
    }
  }
  else if (a2)
  {
    if (a3)
      *a3 = 0;
    return 1;
  }
  return 0;
}

uint64_t X509ExtensionParseKeyUsage(uint64_t a1, _BYTE *a2)
{
  uint64_t result;
  unint64_t v5;
  _BYTE *v6;
  unint64_t v7;

  v6 = (_BYTE *)0xAAAAAAAAAAAAAAAALL;
  v7 = 0xAAAAAAAAAAAAAAAALL;
  v5 = 0;
  result = ccder_blob_decode_bitstring(a1, &v6, &v5);
  if ((_DWORD)result)
  {
    if (v7 != *(_QWORD *)(a1 + 8) || v6 == (_BYTE *)v7 || v5 > 8)
    {
      return 0;
    }
    else if ((unint64_t)v6 >= v7)
    {
      __break(0x5519u);
    }
    else
    {
      *a2 = *v6 & (-1 << (8 - v5));
      return 1;
    }
  }
  return result;
}

uint64_t X509ExtensionParseBasicConstraints(unint64_t *a1, unint64_t *a2, BOOL *a3)
{
  uint64_t result;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v10 = 0xAAAAAAAAAAAAAAAALL;
  v11 = 0xAAAAAAAAAAAAAAAALL;
  result = ccder_blob_decode_tl(a1, 0x2000000000000010, &v11);
  if ((_DWORD)result)
  {
    result = der_get_BOOLean(a1, 1, a3);
    if ((_DWORD)result)
    {
      result = ccder_blob_decode_uint64(a1, &v10);
      if ((_DWORD)result)
      {
        if (!*a3)
          return 0;
        v7 = v10;
        *a2 = v10;
        v8 = __CFADD__(v7, 1);
        v9 = v7 + 1;
        if (v8)
        {
          __break(0x5500u);
          return result;
        }
        *a2 = v9;
      }
      return 1;
    }
  }
  return result;
}

uint64_t X509ExtensionParseAuthorityKeyIdentifier(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  v13 = 0xAAAAAAAAAAAAAAAALL;
  v14 = 0xAAAAAAAAAAAAAAAALL;
  result = ccder_blob_decode_tl(a1, 0x2000000000000010, &v14);
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (__CFADD__(*a1, v14))
      goto LABEL_15;
    if (v7 + v14 != a1[1])
      return 0;
    v11 = 0xAAAAAAAAAAAAAAAALL;
    v12 = 0xAAAAAAAAAAAAAAAALL;
    if (v7 > v7 + v14)
      goto LABEL_16;
    v11 = v7;
    v12 = v7 + v14;
    result = ccder_blob_decode_tl(&v11, 0x8000000000000000, &v13);
    if ((_DWORD)result)
    {
      if (v12 < v11)
        goto LABEL_16;
      v8 = v13;
      if (v13 > v12 - v11)
        goto LABEL_16;
      *a2 = v11;
      *a3 = v8;
    }
    v9 = *a1;
    if (__CFADD__(*a1, v14))
    {
LABEL_15:
      __break(0x5513u);
    }
    else
    {
      v10 = v9 + v14;
      if (v9 <= v9 + v14 && v10 <= a1[1])
      {
        *a1 = v10;
        return 1;
      }
    }
LABEL_16:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseSubjectKeyIdentifier(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  BOOL v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  BOOL v16;
  unint64_t v17;

  v17 = 0xAAAAAAAAAAAAAAAALL;
  result = ccder_blob_decode_tl(a1, 4, &v17);
  if ((_DWORD)result)
  {
    v7 = a1[1];
    v8 = v17;
    v10 = v7 >= *a1;
    v9 = v7 - *a1;
    if (v10)
    {
      v10 = v17 >= v9;
      v11 = v17 == v9;
    }
    else
    {
      v10 = 1;
      v11 = 0;
    }
    if (!v11 && v10)
      goto LABEL_13;
    *a2 = *a1;
    *a3 = v8;
    v12 = *a1;
    if (__CFADD__(*a1, v8))
    {
      __break(0x5513u);
      return result;
    }
    v13 = v12 + v8;
    v14 = a1[1];
    if (v12 <= v13)
    {
      v15 = v13 >= v14;
      v16 = v13 == v14;
    }
    else
    {
      v15 = 1;
      v16 = 0;
    }
    if (!v16 && v15)
LABEL_13:
      __break(0x5519u);
    *a1 = v13;
  }
  return result;
}

uint64_t X509ExtensionParseExtendedKeyUsage(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  int v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v14 = 0xAAAAAAAAAAAAAAAALL;
  v15 = 0xAAAAAAAAAAAAAAAALL;
  v6 = ccder_blob_decode_tl(a1, 0x2000000000000010, &v15);
  result = 0;
  if (v6 && v15)
  {
    v12 = 0xAAAAAAAAAAAAAAAALL;
    v13 = 0xAAAAAAAAAAAAAAAALL;
    v8 = a1[1];
    if (*a1 > v8)
      goto LABEL_12;
    v12 = *a1;
    v13 = v8;
    result = ccder_blob_decode_tl(&v12, 6, &v14);
    if (!(_DWORD)result)
      return result;
    if (v13 < v12)
      goto LABEL_12;
    v9 = v14;
    if (v14 > v13 - v12)
      goto LABEL_12;
    *a2 = v12;
    *a3 = v9;
    v10 = *a1;
    if (__CFADD__(*a1, v15))
    {
      __break(0x5513u);
      return result;
    }
    v11 = v10 + v15;
    if (v10 > v10 + v15 || v11 > a1[1])
LABEL_12:
      __break(0x5519u);
    *a1 = v11;
  }
  return result;
}

uint64_t X509ExtensionParseSubjectAltName(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  unint64_t v12;
  unint64_t v13;
  unint64_t v15;

  v15 = 0xAAAAAAAAAAAAAAAALL;
  LODWORD(result) = ccder_blob_decode_tl(a1, 0x2000000000000010, &v15);
  v7 = v15;
  if (v15)
    result = result;
  else
    result = 0;
  if ((_DWORD)result == 1)
  {
    v8 = a1[1];
    v9 = v8 >= *a1;
    v10 = v8 - *a1;
    if (!v9 || v15 > v10)
      goto LABEL_16;
    *a2 = *a1;
    *a3 = v7;
    v12 = *a1;
    if (__CFADD__(*a1, v7))
    {
      __break(0x5513u);
      return result;
    }
    v13 = v12 + v7;
    if (v12 > v13 || v13 > a1[1])
LABEL_16:
      __break(0x5519u);
    *a1 = v13;
  }
  return result;
}

uint64_t X509CertificateVerifyOnlyOneAppleExtension(uint64_t result, uint64_t a2, unsigned int a3)
{
  _QWORD *v5;
  unsigned __int8 v6;
  unint64_t v7;
  uint64_t v9;
  _QWORD *v10;

  if (a3 > 9)
    return 0;
  v5 = (_QWORD *)result;
  v6 = 0;
  v7 = ~a2;
  while (v7 >= 16 * (char)v6)
  {
    result = compare_octet_string((uint64_t)v5, a2 + 16 * v6);
    if (!(_DWORD)result)
      return result;
    if (a3 <= v6++)
    {
      v9 = v5[1];
      v10 = (_QWORD *)(a2 + 16 * a3);
      *v10 = *v5;
      v10[1] = v9;
      return 1;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t X509ExtensionParseAppleExtension(uint64_t result, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5, int a6)
{
  uint64_t v24;
  int v44;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  BOOL v56;

  if (a6)
    a5 = 0;
  if (a3 == 11)
  {
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x10901066463F786)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x400000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x10301066463F786)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x200;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x10601066463F786)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x800;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x11801066463F786)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x2000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x12401066463F786)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x100000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x11901066463F786)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x4000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x21901066463F786)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x8000;
      goto LABEL_261;
    }
LABEL_157:
    v44 = 0;
LABEL_158:
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 27)
      return X509ExtensionParseServerAuthMarker(result, a2, a3, a4, a5);
    if (!v44)
      goto LABEL_232;
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 832)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x400000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3586)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v54 = *a4;
      v55 = 37748736;
    }
    else
    {
      if (*(_QWORD *)a2 != 0x66463F78648862ALL || *(_WORD *)(a2 + 8) != 4354)
      {
        if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 327)
          return (uint64_t)X509ExtensionParseMFI4Properties((unint64_t *)result, a4, a5);
        if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3841)
        {
          v52 = *(_QWORD *)result;
          v51 = *(_QWORD *)(result + 8);
          if (a5)
          {
            if (v52 > v51)
              goto LABEL_265;
            *a5 = v52;
            a5[1] = v51 - v52;
          }
          *a4 |= 0x80000000uLL;
LABEL_233:
          if (v52 <= v51)
          {
            *(_QWORD *)result = v51;
            return 1;
          }
LABEL_265:
          __break(0x5519u);
          return result;
        }
        goto LABEL_232;
      }
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v54 = *a4;
      v55 = 0x8004000000;
    }
LABEL_201:
    v24 = v54 | v55;
    goto LABEL_261;
  }
  if (a3 == 10)
  {
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 5122)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x100000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 258)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v54 = *a4;
      v55 = 0x58600003F0D0;
      goto LABEL_201;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1538)
      goto LABEL_203;
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4610)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0xF00;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3073)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x10;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1793)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x20000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3329)
    {
LABEL_203:
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x20;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 2305)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x40;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 513)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x80;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1025)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x10000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 769)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x100;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1537)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x400;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 6145)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x1000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 9217)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x80000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8193)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x2000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8705)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x4000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 315)
      return X509ExtensionParseMFISWAuth((unint64_t *)result, a4, a5);
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3074)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x300000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 304)
      return X509ExtensionParseGenericSSLMarker((unint64_t *)result, a4, a5);
    v44 = 1;
    goto LABEL_158;
  }
  if (a3 != 9)
  {
    if (a3 < 0xA)
      goto LABEL_232;
    goto LABEL_157;
  }
  if (*(_QWORD *)a2 == 0xB6463F78648862ALL && *(_BYTE *)(a2 + 8) == 1)
    return X509ExtensionParseComponentAuth((unint64_t *)result, a4, a5);
  if (*(_QWORD *)a2 != 0x66463F78648862ALL || *(_BYTE *)(a2 + 8) != 49)
  {
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 44)
      return X509ExtensionParseCertifiedChipIntermediate((unint64_t *)result, a4, a5);
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 36)
      return X509ExtensionParseMFIAuthv3Leaf((unint64_t *)result, a4, a5);
    if (*(_QWORD *)a2 != 0x66463F78648862ALL || *(_BYTE *)(a2 + 8) != 22)
    {
      if (*(_QWORD *)a2 == 0xC6463F78648862ALL && *(_BYTE *)(a2 + 8) == 19)
      {
        result = ccder_blob_check_null(result);
        if (!(_DWORD)result)
          return result;
        v24 = *a4 | 0x8000000000;
        goto LABEL_261;
      }
      if (*(_QWORD *)a2 != 0xA6463F78648862ALL || *(_BYTE *)(a2 + 8) != 1)
      {
        if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 29)
        {
          result = ccder_blob_check_null(result);
          if (!(_DWORD)result)
            return result;
          v24 = *a4 | 0x2000000;
        }
        else
        {
          if (*(_QWORD *)a2 != 0xC6463F78648862ALL || *(_BYTE *)(a2 + 8) != 14)
          {
            if (*(_QWORD *)a2 == 0x86463F78648862ALL && *(_BYTE *)(a2 + 8) == 3)
              return X509ExtensionParseDeviceAttestationIdentity((unint64_t *)result, a4, a5);
            goto LABEL_232;
          }
          result = ccder_blob_check_null(result);
          if (!(_DWORD)result)
            return result;
          v24 = *a4 | 0x4000000;
        }
LABEL_261:
        *a4 = v24;
        return 1;
      }
      *a4 |= 0x1000000uLL;
LABEL_232:
      v52 = *(_QWORD *)result;
      v51 = *(_QWORD *)(result + 8);
      goto LABEL_233;
    }
    result = ccder_blob_check_null(result);
    if (!(_DWORD)result)
      return result;
    v54 = *a4;
    v55 = 1048584;
    goto LABEL_201;
  }
  v56 = 0;
  result = der_get_BOOLean((unint64_t *)result, 0, &v56);
  if ((_DWORD)result)
  {
    v53 = 0x10000080002;
    if (!v56)
      v53 = 0x20000040001;
    *a4 |= v53;
  }
  return result;
}

uint64_t X509CertificateParseWithExtension(unint64_t *a1, unint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t result;
  unint64_t v13;
  unint64_t v14;

  v8 = 720939;
  v9 = *a2;
  v10 = a2[1];
  v14 = 0xAAAAAAAAAAAAAAAALL;
  if (!ccder_blob_decode_tl(a2, 0x2000000000000010, &v14))
    return v8;
  v11 = *a2;
  result = X509CertificateParseImplicit((uint64_t)a1, a2, a3, a4);
  v8 = result;
  if ((_DWORD)result)
    return v8;
  if (__CFADD__(v11, v14))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5500u);
    goto LABEL_12;
  }
  v8 = 720939;
  if (*a2 != v11 + v14)
    return v8;
  v13 = v14 + v11 - v9;
  if (__CFADD__(v14, v11 - v9))
    goto LABEL_11;
  if (v10 >= v9 && v13 <= v10 - v9)
  {
    *a1 = v9;
    a1[1] = v13;
    X509PolicyCheckForBlockedKeys((uint64_t)a1);
    return 0;
  }
LABEL_12:
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateParse(unint64_t *a1, unint64_t *a2)
{
  return X509CertificateParseWithExtension(a1, a2, 0, 0);
}

uint64_t X509CertificateParseSPKI(unint64_t *a1, unint64_t *a2, unint64_t *a3, unint64_t *a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;

  v21 = 0xAAAAAAAAAAAAAAAALL;
  v22 = 0xAAAAAAAAAAAAAAAALL;
  v4 = *a1;
  v5 = a1[1];
  if (__CFADD__(*a1, v5))
LABEL_38:
    __break(0x5513u);
  v6 = v4 + v5;
  if (v4 > v6)
    goto LABEL_37;
  v10 = 655361;
  v21 = *a1;
  v22 = v6;
  v20 = 0xAAAAAAAAAAAAAAAALL;
  if (!ccder_blob_decode_tl(&v21, 0x2000000000000010, &v20))
    return v10;
  if (!ccder_blob_decode_tl(&v21, 0x2000000000000010, &v20))
    return 655363;
  v18 = 0xAAAAAAAAAAAAAAAALL;
  v19 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v21, v20))
    goto LABEL_38;
  if (v21 > v21 + v20 || v21 + v20 > v22)
    goto LABEL_37;
  v18 = v21;
  v19 = v21 + v20;
  if (!ccder_blob_decode_tl(&v18, 6, &v20))
    return 655362;
  v11 = v20;
  v12 = v18;
  if (!a2)
    goto LABEL_13;
  if (v19 < v18 || v20 > v19 - v18)
  {
LABEL_37:
    __break(0x5519u);
    goto LABEL_38;
  }
  *a2 = v18;
  a2[1] = v11;
LABEL_13:
  if (__CFADD__(v12, v11))
    goto LABEL_38;
  v13 = v12 + v11;
  if (v12 > v12 + v11)
    goto LABEL_37;
  v14 = v19;
  if (v13 > v19)
    goto LABEL_37;
  v18 = v13;
  if (v13 == v19)
  {
    if (a3)
    {
      *a3 = 0;
      a3[1] = 0;
    }
  }
  else if (a3)
  {
    *a3 = v13;
    a3[1] = v14 - v13;
  }
  if (v14 > v22 || v21 > v14)
    goto LABEL_37;
  v21 = v14;
  v19 = 0xAAAAAAAAAAAAAAAALL;
  v17 = 0;
  v18 = 0xAAAAAAAAAAAAAAAALL;
  result = ccder_blob_decode_bitstring(&v21, &v18, &v17);
  if (!(_DWORD)result)
    return 655364;
  if (!v17)
  {
    *a4 = 0;
    a4[1] = 0;
LABEL_33:
    if (v21 == v22)
      return 0;
    else
      return 655365;
  }
  if (v17 < 0xFFFFFFFFFFFFFFF9)
  {
    if (v19 >= v18)
    {
      v16 = (v17 + 7) >> 3;
      if (v16 <= v19 - v18)
      {
        *a4 = v18;
        a4[1] = v16;
        goto LABEL_33;
      }
    }
    goto LABEL_37;
  }
  __break(0x5500u);
  return result;
}

uint64_t X509CertificateParseKey(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  result = 327691;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 96))
    {
      v8 = 0;
      v9 = 0;
      result = X509CertificateParseSPKI((unint64_t *)(a1 + 88), 0, 0, &v8);
      if (!(_DWORD)result)
      {
        if (a2)
        {
          if (a3)
          {
            v7 = v9;
            *a2 = v8;
            *a3 = v7;
          }
        }
      }
    }
  }
  return result;
}

uint64_t X509CertificateCheckSignatureDigest(char a1, uint64_t a2, uint64_t *a3, __int128 *a4, __int128 *a5)
{
  uint64_t v9;
  uint64_t result;
  unsigned int (*v11)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *);
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;

  v28 = 0uLL;
  v27 = 0uLL;
  v25 = 0;
  v26 = 0;
  v24 = 0;
  v23 = 0u;
  v22 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = X509CertificateParseSPKI((unint64_t *)(a2 + 88), (unint64_t *)&v28, (unint64_t *)&v27, &v25);
  if ((_DWORD)v9)
    return v9;
  v9 = 655632;
  if (compare_octet_string((uint64_t)&v28, (uint64_t)&rsaEncryption))
  {
    if (compare_octet_string((uint64_t)&v28, (uint64_t)&ecPublicKey))
      return 655617;
    v11 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))validateSignatureEC;
  }
  else
  {
    v11 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))validateSignatureRSA;
  }
  memset(v14, 0, sizeof(v14));
  v19 = *a5;
  v15 = *a4;
  v17 = v28;
  v18 = v27;
  if (((a1 & 1) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha1, 5uLL))
    && ((a1 & 4) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha256, 9uLL))
    && ((a1 & 8) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha384, 9uLL))
    && ((a1 & 0x10) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha512, 9uLL)))
  {
    return v9;
  }
  result = v25;
  if (v26 || !v25)
  {
    v12 = *a3;
    v13 = a3[1];
    if (v13 || !v12)
    {
      if (v11(v25, v26, v12, v13, v14))
        return 0;
      else
        return 655648;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateCheckSignature(char a1, uint64_t a2, _QWORD *a3, uint64_t a4, __int128 *a5)
{
  __int128 v8;
  uint64_t result;
  __int128 v10;
  uint64_t v11[2];
  _OWORD v12[4];

  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v12[2] = v8;
  v12[3] = v8;
  v12[0] = v8;
  v12[1] = v8;
  v11[0] = (uint64_t)v12;
  v11[1] = 64;
  v10 = 0uLL;
  result = X509MatchSignatureAlgorithm(a3, a4, (uint64_t)v11, &v10, (uint64_t)v12);
  if (!(_DWORD)result)
    return X509CertificateCheckSignatureDigest(a1, a2, v11, &v10, a5);
  return result;
}

uint64_t X509MatchSignatureAlgorithm(_QWORD *a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v11;

  result = compare_octet_string_raw(a2, &sha1WithRSA_oid, 9uLL);
  if (!(_DWORD)result)
    goto LABEL_8;
  result = compare_octet_string_raw(a2, &sha256WithRSA_oid, 9uLL);
  if (!(_DWORD)result)
  {
LABEL_10:
    *a4 = &CTOidSha256;
    a4[1] = 9;
    if (*(_QWORD *)(a3 + 8) < 0x20uLL)
      goto LABEL_15;
    *(_QWORD *)(a3 + 8) = 32;
    v11 = ccsha256_di();
    goto LABEL_14;
  }
  result = compare_octet_string_raw(a2, &sha384WithRSA_oid, 9uLL);
  if (!(_DWORD)result)
    goto LABEL_12;
  result = compare_octet_string_raw(a2, &sha1WithECDSA_oid, 7uLL);
  if (!(_DWORD)result)
  {
LABEL_8:
    *a4 = &CTOidSha1;
    a4[1] = 5;
    if (*(_QWORD *)(a3 + 8) < 0x14uLL)
      goto LABEL_15;
    *(_QWORD *)(a3 + 8) = 20;
    v11 = ccsha1_di();
LABEL_14:
    ccdigest(v11, a1[1], *a1, a5);
    return 0;
  }
  result = compare_octet_string_raw(a2, &sha256WithECDSA_oid, 8uLL);
  if (!(_DWORD)result)
    goto LABEL_10;
  result = compare_octet_string_raw(a2, &sha384WithECDSA_oid, 8uLL);
  if ((_DWORD)result)
    return 656640;
LABEL_12:
  *a4 = &CTOidSha384;
  a4[1] = 9;
  if (*(_QWORD *)(a3 + 8) >= 0x30uLL)
  {
    *(_QWORD *)(a3 + 8) = 48;
    v11 = ccsha384_di();
    goto LABEL_14;
  }
LABEL_15:
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateCheckSignatureWithPublicKey(uint64_t *a1, uint64_t a2, __int128 *a3, _QWORD *a4, __int128 *a5, __int128 *a6)
{
  __int128 v11;
  uint64_t matched;
  unsigned int (*v13)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *);
  __int128 v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  _OWORD *v30;
  uint64_t v31;
  _OWORD v32[4];

  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v32[2] = v11;
  v32[3] = v11;
  v32[0] = v11;
  v32[1] = v11;
  v30 = v32;
  v31 = 64;
  v29 = 0uLL;
  matched = X509MatchSignatureAlgorithm(a4, (uint64_t)a5, (uint64_t)&v30, &v29, (uint64_t)v32);
  if ((_DWORD)matched)
    return matched;
  matched = 655617;
  if (compare_octet_string(a2, (uint64_t)&rsaEncryption))
  {
    if (compare_octet_string(a2, (uint64_t)&ecPublicKey))
      return matched;
    v13 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))validateSignatureEC;
  }
  else
  {
    v13 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))validateSignatureRSA;
  }
  v28 = 0;
  v27 = 0u;
  v26 = 0u;
  v25 = 0u;
  v24 = 0u;
  v22 = 0u;
  v20 = 0u;
  v18 = 0u;
  v21 = *a5;
  v17 = 0;
  v23 = *a6;
  v19 = v29;
  if (a3)
    v14 = *a3;
  else
    v14 = null_octet;
  v22 = v14;
  result = *a1;
  v16 = a1[1];
  if ((v16 || !result) && (!v30 || v31))
  {
    if (v13(result, v16, (uint64_t)v30, v31, &v17))
      return 0;
    else
      return 655648;
  }
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateParseGeneralNamesContent(uint64_t a1, uint64_t (*a2)(_QWORD, int *, uint64_t), uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int v9[5];
  unint64_t v10;
  unint64_t v11;

  v3 = *(_QWORD *)(a1 + 224);
  v4 = *(_QWORD *)(a1 + 232);
  if (__CFADD__(v3, v4))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5519u);
  }
  v5 = v3 + v4;
  if (v3 > v5)
    goto LABEL_11;
  v10 = *(_QWORD *)(a1 + 224);
  v11 = v5;
  while (1)
  {
    if (v10 >= v11)
      return 0;
    memset(v9, 170, sizeof(v9));
    if ((ccder_blob_decode_GeneralName(&v10, v9, (unint64_t *)&v9[1]) & 1) == 0)
      break;
    if ((a2(v9[0], &v9[1], a3) & 1) == 0)
      return 0;
  }
  return 720912;
}

uint64_t X509CertificateSubjectNameGetCommonName(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v6;
  unint64_t v7;
  unsigned __int16 *v10;
  unint64_t v11;
  int v12;
  int v13;
  unint64_t v15;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;

  v2 = *a1;
  v3 = a1[1];
  v25 = v3;
  v23 = 0xAAAAAAAAAAAAAAAALL;
  v24 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v2, v3))
    goto LABEL_62;
  v4 = v2 + v3;
  if (v2 > v4)
  {
LABEL_61:
    __break(0x5519u);
    goto LABEL_62;
  }
  v6 = 720901;
  v23 = v2;
  v24 = v4;
  *a2 = 0;
  a2[1] = 0;
  if (v2 < v4)
  {
    while (1)
    {
      if (!ccder_blob_decode_tl(&v23, 0x2000000000000011, &v25) || !v25)
        return 720898;
      v21 = 0xAAAAAAAAAAAAAAAALL;
      v22 = 0xAAAAAAAAAAAAAAAALL;
      v2 = v23;
      if (__CFADD__(v23, v25))
        break;
      v7 = v23 + v25;
      if (v23 > v23 + v25 || v7 > v24)
        goto LABEL_61;
      v21 = v23;
      v22 = v23 + v25;
      while (v2 < v7)
      {
        if (!ccder_blob_decode_tl(&v21, 0x2000000000000010, &v25))
          return 720899;
        v19 = 0xAAAAAAAAAAAAAAAALL;
        v20 = 0xAAAAAAAAAAAAAAAALL;
        if (__CFADD__(v21, v25))
          goto LABEL_62;
        if (v21 > v21 + v25 || v21 + v25 > v22)
          goto LABEL_61;
        v19 = v21;
        v20 = v21 + v25;
        if (!ccder_blob_decode_tl(&v19, 6, &v25))
          return 720900;
        v10 = (unsigned __int16 *)v19;
        v2 = v20;
        if (v19 > v20 || v25 > v20 - v19)
          goto LABEL_61;
        if (__CFADD__(v19, v25))
          goto LABEL_62;
        v11 = v19 + v25;
        if (v19 > v19 + v25 || v11 > v20)
          goto LABEL_61;
        v19 += v25;
        if (v25 == 3)
        {
          v12 = *v10;
          v13 = *((unsigned __int8 *)v10 + 2);
          if (v12 == 1109 && v13 == 3)
          {
            v17 = v11;
            v18 = v20;
            if ((ccder_blob_decode_tl(&v17, 12, &v25) & 1) == 0)
            {
              if (v19 > v20)
                goto LABEL_61;
              v17 = v19;
              v18 = v20;
              if ((ccder_blob_decode_tl(&v17, 19, &v25) & 1) == 0)
              {
                if (v19 > v20)
                  goto LABEL_61;
                v17 = v19;
                v18 = v20;
                if (!ccder_blob_decode_tl(&v17, 20, &v25))
                  return v6;
              }
            }
            v15 = v25;
            if (!v25)
              return v6;
            if (__CFADD__(v17, v25))
              goto LABEL_62;
            v2 = v17 + v25;
            if (v20 != v17 + v25)
              return 720902;
            if (v18 < v17 || v25 > v18 - v17)
              goto LABEL_61;
            *a2 = v17;
            a2[1] = v15;
          }
        }
        v7 = v22;
        if (v2 > v22 || v21 > v2)
          goto LABEL_61;
        v21 = v2;
      }
      if (v2 != v7)
        return 720903;
      v4 = v24;
      if (v2 > v24 || v23 > v2)
        goto LABEL_61;
      v23 = v2;
      if (v2 >= v24)
        goto LABEL_49;
    }
LABEL_62:
    __break(0x5513u);
  }
LABEL_49:
  if (v2 != v4)
    return 720904;
  if (a2[1] && *a2)
    return 0;
  *a2 = 0;
  a2[1] = 0;
  return 720905;
}

BOOL X509CertificateValidAtTime(uint64_t a1, time_t a2)
{
  _BOOL8 result;
  time_t v5;
  time_t v6;

  result = 0;
  v5 = 0;
  v6 = 0;
  if (a1 && a2 != -1)
    return !X509CertificateGetNotBefore(a1, &v6)
        && !X509CertificateGetNotAfter(a1, &v5)
        && difftime(a2, v6) >= 0.0
        && difftime(a2, v5) <= 0.0;
  return result;
}

uint64_t X509CertificateGetNotBefore(uint64_t a1, time_t *a2)
{
  uint64_t result;
  const char *v4[2];

  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  result = X509CertificateParseValidity(a1, (unint64_t *)v4, 0);
  if (!(_DWORD)result)
    return X509TimeConvert(v4, a2);
  return result;
}

uint64_t X509CertificateGetNotAfter(uint64_t a1, time_t *a2)
{
  uint64_t result;
  const char *v4[2];

  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  result = X509CertificateParseValidity(a1, 0, (unint64_t *)v4);
  if (!(_DWORD)result)
    return X509TimeConvert(v4, a2);
  return result;
}

BOOL X509CertificateIsValid(uint64_t a1)
{
  time_t v2;

  v2 = time(0);
  return X509CertificateValidAtTime(a1, v2);
}

uint64_t X509CertificateParseValidity(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v7;
  unint64_t v9[2];

  v3 = 720906;
  if (!result)
    return v3;
  v4 = *(_QWORD *)(result + 72);
  v5 = *(_QWORD *)(result + 80);
  if (!v4 || v5 == 0)
    return v3;
  if (__CFADD__(v4, v5))
  {
    __break(0x5513u);
  }
  else
  {
    v7 = v4 + v5;
    if (v4 <= v7)
    {
      v9[0] = *(_QWORD *)(result + 72);
      v9[1] = v7;
      if (!ccder_blob_decode_Time(v9, a2))
        return 720907;
      if (ccder_blob_decode_Time(v9, a3))
        return 0;
      return 720908;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t X509TimeConvert(const char **a1, time_t *a2)
{
  uint64_t v2;
  const char *v4;
  __int128 v6;
  const char *v7;
  uint64_t result;
  const char *v9;
  time_t v10;
  tm v11;

  v2 = 720909;
  if (!a1)
    return v2;
  v4 = a1[1];
  if (((unint64_t)v4 | 2) != 0xF)
    return v2;
  v11.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v11.tm_mon = v6;
  *(_OWORD *)&v11.tm_isdst = v6;
  *(_OWORD *)&v11.tm_sec = v6;
  v7 = *a1;
  if (v4 == (const char *)13)
  {
    result = (uint64_t)strptime(v7, "%y%m%d%H%M%SZ", &v11);
    if (result && v11.tm_year >= 150)
      v11.tm_year -= 100;
  }
  else
  {
    result = (uint64_t)strptime(v7, "%Y%m%d%H%M%SZ", &v11);
  }
  v9 = a1[1];
  if (!__CFADD__(*a1, v9))
  {
    if ((const char *)result != &v9[(_QWORD)*a1])
      return 720910;
    v10 = timegm(&v11);
    if (v10 == -1)
      return 720911;
    v2 = 0;
    if (a2)
      *a2 = v10;
    return v2;
  }
  __break(0x5513u);
  return result;
}

BOOL X509ExtensionParseComponentAuth(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v14 = 0xAAAAAAAAAAAAAAAALL;
  v15 = 0xAAAAAAAAAAAAAAAALL;
  v4 = *a1;
  v3 = a1[1];
  if (*a1 > v3)
    goto LABEL_19;
  v14 = *a1;
  v15 = v3;
  v13 = v3 - v4;
  if ((ccder_blob_decode_tl(&v14, 22, &v13) & 1) != 0)
    goto LABEL_5;
  v8 = a1[1];
  if (*a1 > v8)
    goto LABEL_19;
  v14 = *a1;
  v15 = v8;
  if (ccder_blob_decode_tl(&v14, 12, &v13))
  {
LABEL_5:
    v10 = v14;
    v9 = v15;
    if (v14 > v15)
      goto LABEL_19;
    *a1 = v14;
    a1[1] = v9;
    v11 = v13;
  }
  else
  {
    v10 = *a1;
    v9 = a1[1];
    v11 = v9 - *a1;
    v13 = v11;
  }
  if (__CFADD__(v10, v11))
    goto LABEL_20;
  if (v9 == v10 + v11)
  {
    if (!v11)
      goto LABEL_16;
    if (!a3)
    {
LABEL_15:
      *a2 |= 0x40000000uLL;
LABEL_16:
      if (v10 <= v9)
      {
        *a1 = v9;
        return v9 == v10 + v11;
      }
      goto LABEL_19;
    }
    if (v10 <= v9 && v11 <= v9 - v10)
    {
      *a3 = v10;
      a3[1] = v11;
      goto LABEL_15;
    }
LABEL_19:
    __break(0x5519u);
LABEL_20:
    __break(0x5513u);
  }
  return v9 == v10 + v11;
}

uint64_t X509ExtensionParseCertifiedChipIntermediate(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v12;
  unint64_t v13;
  unint64_t v16;

  v16 = 0xAAAAAAAAAAAAAAAALL;
  result = ccder_blob_decode_tl(a1, 22, &v16);
  if ((_DWORD)result)
  {
    v7 = v16;
    v8 = *a1;
    if (__CFADD__(*a1, v16))
    {
      __break(0x5513u);
      goto LABEL_34;
    }
    v9 = v8 + v16;
    if (a1[1] != v8 + v16)
      return 0;
    v10 = *a2;
    *a2 |= 0x30000000000uLL;
    if (a3)
    {
      if (v8 > v9)
        goto LABEL_34;
      *a3 = v8;
      a3[1] = v7;
    }
    if (v7 == 4)
    {
      if (*(_DWORD *)v8 != 1953653621)
        goto LABEL_30;
      v13 = 0x30001000000;
    }
    else
    {
      if (v7 == 17)
      {
        if (*(_QWORD *)v8 != 0x207372656B6E6F59
          || *(_QWORD *)(v8 + 8) != 0x726F74636146202DLL
          || *(_BYTE *)(v8 + 16) != 121)
        {
LABEL_30:
          if (v8 <= v9)
          {
            *a1 = v9;
            return 1;
          }
LABEL_34:
          __break(0x5519u);
          return result;
        }
        v12 = 786432;
      }
      else
      {
        if (v7 != 16)
          goto LABEL_30;
        if (*(_QWORD *)v8 != 0x2D20656761766153 || *(_QWORD *)(v8 + 8) != 0x79726F7463614620)
          goto LABEL_30;
        v12 = 3;
      }
      v13 = v12 & 0xFFFF0000FFFFFFFFLL | 0x30000000000;
    }
    *a2 = v10 | v13;
    goto LABEL_30;
  }
  return result;
}

uint64_t X509ExtensionParseMFIAuthv3Leaf(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v9 = 0xAAAAAAAAAAAAAAAALL;
  result = ccder_blob_decode_tl(a1, 4, &v9);
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (__CFADD__(*a1, v9))
    {
      __break(0x5513u);
    }
    else
    {
      v8 = a1[1];
      if (v8 != v7 + v9)
        return 0;
      if (v9 == 32)
      {
        if (a3)
        {
          if (v8 < v7 || v8 - v7 <= 0x1F)
            goto LABEL_15;
          *a3 = v7;
          a3[1] = 32;
        }
        *a2 |= 4uLL;
      }
      if (v7 <= v8)
      {
        *a1 = v8;
        return 1;
      }
    }
LABEL_15:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseMFISWAuth(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v10 = 0xAAAAAAAAAAAAAAAALL;
  result = ccder_blob_decode_tl(a1, 4, &v10);
  if ((_DWORD)result)
  {
    v7 = v10;
    v8 = *a1;
    if (__CFADD__(*a1, v10))
    {
      __break(0x5513u);
    }
    else
    {
      v9 = a1[1];
      if (v9 != v8 + v10)
        return 0;
      if (v10)
      {
        if (a3)
        {
          if (v9 < v8 || v10 > v9 - v8)
            goto LABEL_15;
          *a3 = v8;
          a3[1] = v7;
        }
        *a2 |= 0x30000000uLL;
      }
      if (v8 <= v9)
      {
        *a1 = v9;
        return 1;
      }
    }
LABEL_15:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseGenericSSLMarker(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  int v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v13;
  unsigned __int8 *v14;
  BOOL v15;
  unint64_t v16;
  unint64_t v17;

  v17 = 0;
  v6 = ccder_blob_decode_tl(a1, 12, &v17);
  result = 0;
  if (v6)
  {
    v8 = v17;
    if (v17 >= 0x19)
    {
      v9 = *a1;
      v10 = *(_QWORD *)*a1 == 0x2E3034382E322E31 && *(_QWORD *)(*a1 + 8) == 0x312E353336333131;
      v11 = 0x2E37322E362E3030;
      if (!v10 || *(_QWORD *)(*a1 + 16) != 0x2E37322E362E3030)
        return 0;
      if (v9 < 0xFFFFFFFFFFFFFFE8)
      {
        v13 = v9 + 24;
        if (v9 >= v9 + 24)
          goto LABEL_21;
        v11 = a1[1];
        if (v13 > v11)
          goto LABEL_21;
        v14 = (unsigned __int8 *)(v9 + 24);
        do
        {
          if ((unint64_t)v14 >= v11)
            goto LABEL_22;
          if (*v14 - 58 < 0xFFFFFFF6)
            return 0;
          if ((unint64_t)(v14 + 1) > v11)
            break;
          v15 = v14 > v14 + 1;
          ++v14;
        }
        while (!v15);
        while (1)
        {
LABEL_21:
          __break(0x5519u);
LABEL_22:
          if (!a3)
            goto LABEL_26;
          v16 = v8 - 24;
          if (v8 < 0x18)
            goto LABEL_31;
          if (v16 <= v11 - v13)
          {
            *a3 = v13;
            a3[1] = v16;
LABEL_26:
            v13 = *a2 | 0x200000000;
            *a2 = v13;
            if (__CFADD__(v9, v8))
              break;
            v8 += v9;
            if (v9 <= v8 && v8 <= v11)
            {
              *a1 = v8;
              return 1;
            }
          }
        }
      }
      __break(0x5513u);
LABEL_31:
      __break(0x5515u);
    }
  }
  return result;
}

uint64_t X509ExtensionParseServerAuthMarker(uint64_t a1, unint64_t a2, uint64_t a3, _QWORD *a4, unint64_t *a5)
{
  uint64_t result;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  BOOL v13;
  _BOOL4 v14;
  int v15;

  result = ccder_blob_check_null(a1);
  if ((_DWORD)result)
  {
    if (a2 > 0xFFFFFFFFFFFFFFF6)
      goto LABEL_26;
    if (__CFADD__(a2, a3))
      goto LABEL_26;
    v10 = a2 + a3;
    if (a2 + a3 == -1)
      goto LABEL_26;
    v11 = a2 + 9;
    v12 = (char *)(a2 + 9);
    while (1)
    {
      v13 = (unint64_t)v12 < v10 && (unint64_t)v12 >= a2;
      v14 = v13;
      if ((unint64_t)v12 >= v10 - 1)
        break;
      if (!v14)
        goto LABEL_25;
      v15 = *v12++;
      if ((v15 & 0x80000000) == 0)
        return 0;
    }
    if (!v14)
    {
LABEL_25:
      __break(0x5519u);
LABEL_26:
      __break(0x5513u);
      return result;
    }
    if ((*v12 & 0x80000000) == 0)
    {
      if (!a5)
      {
LABEL_22:
        *a4 |= (unint64_t)&_mh_execute_header;
        return 1;
      }
      if (v11 >= a2 && v11 <= v10)
      {
        *a5 = v11;
        a5[1] = a3 - 9;
        goto LABEL_22;
      }
      goto LABEL_25;
    }
    return 0;
  }
  return result;
}

uint64_t X509ExtensionParseDeviceAttestationIdentity(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  v13 = 0xAAAAAAAAAAAAAAAALL;
  v14 = 0xAAAAAAAAAAAAAAAALL;
  result = ccder_blob_decode_tl(a1, 0x2000000000000010, &v14);
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (__CFADD__(*a1, v14))
      goto LABEL_17;
    if (a1[1] != v7 + v14)
      return 0;
    v11 = 0xAAAAAAAAAAAAAAAALL;
    v12 = 0xAAAAAAAAAAAAAAAALL;
    if (v7 > v7 + v14)
      goto LABEL_18;
    v11 = v7;
    v12 = v7 + v14;
    result = ccder_blob_decode_tl(&v11, 0xA000000000000002, &v13);
    if ((_DWORD)result)
    {
      result = ccder_blob_decode_tl(&v11, 4, &v13);
      if ((_DWORD)result)
      {
        if (a3)
        {
          if (v12 < v11)
            goto LABEL_18;
          v8 = v13;
          if (v13 > v12 - v11)
            goto LABEL_18;
          *a3 = v11;
          a3[1] = v8;
        }
        *a2 |= 0x240000800000uLL;
        v9 = *a1;
        if (!__CFADD__(*a1, v14))
        {
          v10 = v9 + v14;
          if (v9 <= v9 + v14 && v10 <= a1[1])
          {
            *a1 = v10;
            return 1;
          }
LABEL_18:
          __break(0x5519u);
          return result;
        }
LABEL_17:
        __break(0x5513u);
        goto LABEL_18;
      }
    }
  }
  return result;
}

unint64_t *X509ExtensionParseMFI4Properties(unint64_t *result, _QWORD *a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = *result;
  v3 = result[1];
  v5 = v3 - *result;
  if (v5 != 32)
    return (unint64_t *)(v5 == 32);
  if (a3)
  {
    if (v4 > v3)
    {
LABEL_12:
      __break(0x5519u);
      goto LABEL_13;
    }
    *a3 = v4;
    a3[1] = 32;
  }
  *a2 |= 0xC00000000uLL;
  if (v4 < 0xFFFFFFFFFFFFFFE0)
  {
    v6 = v4 + 32;
    if (v4 + 32 <= v3 && v4 <= v6)
    {
      *result = v6;
      return (unint64_t *)(v5 == 32);
    }
    goto LABEL_12;
  }
LABEL_13:
  __break(0x5513u);
  return result;
}

unint64_t *X509ChainParseCertificateSet(unint64_t *result, unint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  uint64_t v5;
  BOOL v6;
  unint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  unint64_t *v19;
  unint64_t v21;

  v5 = 0;
  *a4 = 0;
  a4[1] = 0;
  v6 = *result >= result[1] || a3 == 0;
  if (v6)
  {
LABEL_6:
    if (a5)
    {
      result = 0;
      *a5 = v5;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v9 = result;
    v10 = 0;
    v11 = a2 + 304 * a3;
    v12 = ~a2;
    v13 = a4 + 1;
    v14 = (_QWORD *)(a2 + 272);
    v15 = a3 - 1;
    v21 = a2 + 272;
    while ((unsigned __int128)(v10 * (__int128)304) >> 64 == (304 * v10) >> 63 && 304 * v10 <= v12)
    {
      v16 = v14 - 34;
      if (v14 != (_QWORD *)272 && ((unint64_t)v16 >= v11 || (unint64_t)v16 < a2))
      {
LABEL_30:
        __break(0x5519u);
        break;
      }
      result = (unint64_t *)X509CertificateParse(v14 - 34, v9);
      if ((_DWORD)result)
        return result;
      if (v10)
      {
        if ((unint64_t)v16 < a2)
          goto LABEL_30;
        if ((unint64_t)(v14 + 4) > v11)
          goto LABEL_30;
        v17 = (_QWORD *)*v13;
        *v14 = 0;
        v14[1] = v17;
        if (v14 != (_QWORD *)272 && (unint64_t)v16 >= v11)
          goto LABEL_30;
        *v17 = v16;
        *v13 = (unint64_t)v14;
      }
      else
      {
        v18 = *a4;
        *(_QWORD *)(a2 + 272) = *a4;
        if (v18)
          v19 = (unint64_t *)(v18 + 280);
        else
          v19 = v13;
        *v19 = v21;
        *a4 = v16;
        *(_QWORD *)(a2 + 280) = a4;
      }
      v5 = v10 + 1;
      if (*v9 < v9[1])
      {
        v14 += 38;
        v6 = v15 == v10++;
        if (!v6)
          continue;
      }
      goto LABEL_6;
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t X509ChainGetCertificateUsingKeyIdentifier(uint64_t *a1, uint64_t a2)
{
  uint64_t i;

  for (i = *a1; i; i = *(_QWORD *)(i + 272))
  {
    if (*(_QWORD *)(i + 192) && !compare_octet_string(a2, i + 184))
      break;
  }
  return i;
}

_QWORD *X509ChainResetChain(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;

  *result = 0;
  result[1] = result;
  v2 = (_QWORD *)*a2;
  if (*a2)
  {
    do
    {
      v2[36] = 0;
      v2[37] = 0;
      v2 = (_QWORD *)v2[34];
    }
    while (v2);
  }
  return result;
}

uint64_t X509ChainBuildPathPartial(_QWORD *a1, uint64_t *a2, _QWORD *a3, int a4)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t CertificateUsingKeyIdentifier;
  _QWORD *v12;
  _QWORD *v13;
  int v14;
  uint64_t BAARootUsingKeyIdentifier;
  unsigned int v16;

  if (!a1)
    return 327691;
  v7 = a1;
  *a3 = a1;
  a3[1] = a1 + 36;
  a1[36] = 0;
  a1[37] = a3;
  v8 = (uint64_t)(a1 + 15);
  result = compare_octet_string((uint64_t)(a1 + 15), (uint64_t)(a1 + 13));
  if ((_DWORD)result)
  {
    while (1)
    {
      v10 = (uint64_t)(v7 + 21);
      if (!v7[22]
        || (CertificateUsingKeyIdentifier = X509ChainGetCertificateUsingKeyIdentifier(a2, (uint64_t)(v7 + 21))) == 0
        || (v7 = (_QWORD *)CertificateUsingKeyIdentifier,
            compare_octet_string(CertificateUsingKeyIdentifier + 104, v8)))
      {
        v7 = (_QWORD *)*a2;
        if (!*a2)
        {
LABEL_16:
          if (X509ChainGetAppleRootUsingKeyIdentifier(v10, 1))
            return 0;
          BAARootUsingKeyIdentifier = X509ChainGetBAARootUsingKeyIdentifier(v10);
          if (a4)
            v16 = 0;
          else
            v16 = 524296;
          if (BAARootUsingKeyIdentifier)
            return 0;
          else
            return v16;
        }
        while (compare_octet_string(v8, (uint64_t)(v7 + 13)))
        {
          v7 = (_QWORD *)v7[34];
          if (!v7)
            goto LABEL_16;
        }
      }
      v12 = (_QWORD *)*a3;
      if (*a3)
        break;
LABEL_13:
      v13 = (_QWORD *)a3[1];
      v7[36] = 0;
      v7[37] = v13;
      *v13 = v7;
      a3[1] = v7 + 36;
      v8 = (uint64_t)(v7 + 15);
      v14 = compare_octet_string((uint64_t)(v7 + 15), (uint64_t)(v7 + 13));
      result = 0;
      if (!v14)
        return result;
    }
    while (v12 != v7)
    {
      v12 = (_QWORD *)v12[36];
      if (!v12)
        goto LABEL_13;
    }
    return 524297;
  }
  return result;
}

uint64_t X509ChainGetAppleRootUsingKeyIdentifier(uint64_t result, int a2)
{
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *i;
  uint64_t v7;

  v2 = &numAppleRoots;
  if (!a2)
    v2 = &numAppleProdRoots;
  v3 = *v2;
  if (*v2)
  {
    v4 = result;
    for (i = (uint64_t *)&AppleRoots; i < (uint64_t *)&BlockedYonkersSPKI && i >= (uint64_t *)&AppleRoots; ++i)
    {
      v7 = *i;
      result = compare_octet_string(v4, *i + 184);
      if (!(_DWORD)result)
        return v7;
      if (!--v3)
        return 0;
    }
    __break(0x5519u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t X509ChainGetBAARootUsingKeyIdentifier(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int *i;
  uint64_t v5;

  v1 = numBAARoots;
  if (numBAARoots)
  {
    v2 = result;
    for (i = (int *)&BAARoots; i < digests && i >= (int *)&BAARoots; i += 2)
    {
      v5 = *(_QWORD *)i;
      result = compare_octet_string(v2, *(_QWORD *)i + 184);
      if (!(_DWORD)result)
        return v5;
      if (!--v1)
        return 0;
    }
    __break(0x5519u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t X509ChainBuildPath(_QWORD *a1, uint64_t *a2, _QWORD *a3)
{
  return X509ChainBuildPathPartial(a1, a2, a3, 0);
}

uint64_t X509ChainCheckPathWithOptions(char a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  unint64_t v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  unint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t AppleRootUsingKeyIdentifier;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t *v31;
  uint64_t *v32;
  char v33;
  unint64_t v34[2];
  unint64_t v35[4];

  v6 = a2;
  v8 = *a2;
  if (a3)
  {
    v9 = *(_QWORD *)(a3 + 48);
    if (v9)
    {
      if (*(_QWORD *)(v9 + 8))
      {
        if (compare_octet_string(v9, v8 + 208))
          return 327701;
        v8 = *v6;
      }
    }
  }
  if (v8)
  {
    v31 = v6;
    v32 = a4;
    v11 = 0;
    v12 = 0;
    v33 = 0;
    v13 = -1;
    while (1)
    {
      v14 = *(_QWORD *)(v8 + 288);
      v15 = v14 + 304;
      if (v14)
      {
LABEL_10:
        v16 = 0;
        goto LABEL_11;
      }
      if (!compare_octet_string(v8 + 120, v8 + 104))
      {
        v16 = 0;
        v15 = v8 + 304;
        v14 = v8;
        goto LABEL_11;
      }
      if (!a3)
        return v12 | 0x9000Du;
      if (*(_BYTE *)(a3 + 16))
      {
        AppleRootUsingKeyIdentifier = X509ChainGetAppleRootUsingKeyIdentifier(v8 + 168, *(unsigned __int8 *)(a3 + 17));
      }
      else
      {
        if (!*(_QWORD *)(a3 + 24))
          goto LABEL_58;
        AppleRootUsingKeyIdentifier = X509ChainGetBAARootUsingKeyIdentifier(v8 + 168);
      }
      v14 = AppleRootUsingKeyIdentifier;
      v33 |= AppleRootUsingKeyIdentifier != 0;
      v15 = AppleRootUsingKeyIdentifier + 304;
      if (AppleRootUsingKeyIdentifier)
        goto LABEL_10;
LABEL_58:
      if (!*(_BYTE *)(a3 + 19))
        return v12 | 0x9000Du;
      v14 = 0;
      v16 = 1;
LABEL_11:
      if (v11 && *(_QWORD *)(v8 + 32) >= 2uLL)
      {
        if (!*(_BYTE *)(v8 + 265))
        {
          v30 = 589825;
          return v12 | v30;
        }
        if ((*(_BYTE *)(v8 + 264) & 4) == 0)
        {
          v30 = 589826;
          return v12 | v30;
        }
      }
      v17 = *(_QWORD *)(v8 + 200);
      if (v17)
        v18 = v17 >= v11;
      else
        v18 = 1;
      if (!v18)
      {
        v30 = 589827;
        return v12 | v30;
      }
      if (*(_BYTE *)(v8 + 266))
      {
        v30 = 589831;
        return v12 | v30;
      }
      if (compare_octet_string(v8 + 40, v8 + 152))
      {
        v30 = 589828;
        return v12 | v30;
      }
      if ((v16 & 1) == 0 && *(_QWORD *)(v8 + 168) && *(_QWORD *)(v8 + 176))
      {
        if (v14 >= v15)
          goto LABEL_100;
        if (compare_octet_string(v8 + 168, v14 + 184))
          return v12 | 0x9000Au;
      }
      if (a3 && v11 && (*(_QWORD *)(v8 + 240) & *(_QWORD *)(a3 + 8)) == 0)
        X509PolicySetFlagsForCommonNames(v8);
      if (v14 == v8 && !*(_QWORD *)(v8 + 240))
      {
        X509PolicySetFlagsForRoots(a3, v8);
        if (a3)
        {
LABEL_34:
          if (*(_BYTE *)(a3 + 18) && !X509CertificateIsValid(v8))
            return v12 | 0x90009u;
          v19 = *(_QWORD *)(a3 + 8);
          if (!v11 && (*(_QWORD *)(v8 + 240) & v19) == 0)
          {
            X509PolicySetFlagsForMFI(v8);
            v19 = *(_QWORD *)(a3 + 8);
          }
          v13 &= *(_QWORD *)(v8 + 240);
          if (v19 && (v19 & v13) == 0)
          {
            v30 = 589829;
            return v12 | v30;
          }
          goto LABEL_49;
        }
      }
      else if (a3)
      {
        goto LABEL_34;
      }
      v13 &= *(_QWORD *)(v8 + 240);
LABEL_49:
      a1 |= v14 == v8;
      if ((v16 & 1) == 0)
      {
        if (v14 >= v15)
          goto LABEL_100;
        result = X509CertificateCheckSignature(a1, v14, (_QWORD *)(v8 + 16), v8 + 40, (__int128 *)(v8 + 56));
        if ((_DWORD)result)
          return result;
      }
      v21 = v11 + 1;
      if (v11 == -1)
        goto LABEL_99;
      v8 = *(_QWORD *)(v8 + 288);
      v12 += 256;
      ++v11;
      if (!v8)
      {
        v6 = v31;
        a4 = v32;
        LOBYTE(v8) = v33;
        if (a3)
          goto LABEL_61;
        goto LABEL_87;
      }
    }
  }
  v21 = 0;
  v13 = -1;
  if (!a3)
    goto LABEL_87;
LABEL_61:
  if (*(_QWORD *)a3)
  {
    v22 = v21;
    if ((v8 & 1) != 0)
    {
      v22 = v21 + 1;
      if (v21 == -1)
      {
LABEL_99:
        __break(0x5500u);
LABEL_100:
        __break(0x5519u);
      }
    }
    if (*(_QWORD *)a3 != v22)
      return ((_DWORD)v22 << 8) | 0x90006u;
  }
  v23 = *(_QWORD *)(a3 + 24);
  if (!v23 || !*(_QWORD *)(v23 + 8))
  {
    if (!*(_BYTE *)(a3 + 16))
      goto LABEL_87;
    v24 = (_DWORD)v21 << 8;
    v25 = **(_QWORD **)(v6[1] + 8);
LABEL_75:
    v27 = 184;
    if ((v8 & 1) != 0)
      v27 = 168;
    v28 = X509ChainGetAppleRootUsingKeyIdentifier(v25 + v27, *(unsigned __int8 *)(a3 + 17));
    if (!v28)
      return v24 | 0x9000Bu;
    v29 = v28;
    if ((v8 & 1) == 0 && !compare_octet_string(v25 + 88, v28 + 88)
      || !X509CertificateCheckSignature(29, v29, (_QWORD *)(v25 + 16), v25 + 40, (__int128 *)(v25 + 56)))
    {
      goto LABEL_87;
    }
    v26 = 589836;
    return v24 | v26;
  }
  v24 = (_DWORD)v21 << 8;
  v25 = **(_QWORD **)(v6[1] + 8);
  if (*(_BYTE *)(a3 + 16))
    goto LABEL_75;
  memset(v35, 170, sizeof(v35));
  v34[0] = 0xAAAAAAAAAAAAAAAALL;
  v34[1] = 0xAAAAAAAAAAAAAAAALL;
  if (X509CertificateParseSPKI((unint64_t *)(v25 + 88), &v35[2], v34, v35))
  {
LABEL_72:
    v26 = 589832;
    return v24 | v26;
  }
  if (compare_octet_string((uint64_t)&v35[2], *(_QWORD *)(a3 + 32))
    || compare_octet_string((uint64_t)v35, *(_QWORD *)(a3 + 24)))
  {
    if (X509CertificateCheckSignatureWithPublicKey(*(uint64_t **)(a3 + 24), *(_QWORD *)(a3 + 32), *(__int128 **)(a3 + 40), (_QWORD *)(v25 + 16), (__int128 *)(v25 + 40), (__int128 *)(v25 + 56)))goto LABEL_72;
  }
  else if (!compare_octet_string(*(_QWORD *)(a3 + 32), (uint64_t)&ecPublicKey))
  {
    compare_octet_string((uint64_t)v34, *(_QWORD *)(a3 + 40));
  }
LABEL_87:
  result = 0;
  if (a4)
    *a4 = v13;
  return result;
}

uint64_t X509ChainCheckPath(char a1, uint64_t *a2, uint64_t a3)
{
  return X509ChainCheckPathWithOptions(a1, a2, a3, 0);
}

void __scheduleXPCActivity_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = 136315138;
  v4 = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Failed to defer activity: %s", (uint8_t *)&v3, 0xCu);
}

void libInFieldCollectionLibrary_cold_1(_QWORD *a1)
{
  NSAssertionHandler *v2;
  NSString *v3;

  v2 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
  v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *libInFieldCollectionLibrary(void)");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MACollectionInterface.m"), 42, CFSTR("%s"), *a1);

  OUTLINED_FUNCTION_0();
  __break(1u);
}

void __getSUManagerClientClass_block_invoke_cold_1(_QWORD *a1)
{
  NSAssertionHandler *v2;
  NSString *v3;

  v2 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
  v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *SoftwareUpdateServicesLibrary(void)");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("support.m"), 24, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSUManagerClientClass_block_invoke_cold_2()
{
  NSAssertionHandler *v0;
  NSString *v1;

  v0 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
  v1 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getSUManagerClientClass(void)_block_invoke");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("support.m"), 26, CFSTR("Unable to find class %s"), "SUManagerClient");

  __break(1u);
}

void dealwith_activation_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Unexpected activation record verification failure: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __issueClientCertificateWithReferenceKey_block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3(__stack_chk_guard);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to disable cellular OTA assertion: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __issueClientCertificateWithReferenceKey_block_invoke_4_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3(__stack_chk_guard);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to disable cellular bootstrap assertion: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __issueClientCertificateWithReferenceKey_block_invoke_4_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3(__stack_chk_guard);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to enable cellular OTA assertion: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __issueClientCertificateWithReferenceKey_block_invoke_4_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3(__stack_chk_guard);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to enable cellular bootstrap assertion: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void handle_deactivate_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to commit UIK: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void handle_deactivate_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to bump UIK: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __ucrt_oob_activity_handler_block_invoke_3_cold_1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;

  OUTLINED_FUNCTION_4();
  v3 = 1024;
  v4 = v0;
  _os_log_fault_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_FAULT, "Failed to query UCRT healing support (%@). Rescheduling UCRT OOB for %d seconds.", v2, 0x12u);
  OUTLINED_FUNCTION_1();
}

void __ucrt_oob_activity_handler_block_invoke_3_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to delete legacy UIK: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void perform_sydro_data_migration_tasks_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to store SDCRT: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void perform_sydro_data_migration_tasks_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to store DCRT: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void perform_sydro_data_migration_tasks_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to migrate factory MFi certificates: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __register_xpc_activities_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to defer activity: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __register_xpc_activities_block_invoke_511_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to defer activity: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __register_xpc_activities_block_invoke_512_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to defer activity: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __register_xpc_activities_block_invoke_513_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to defer activity: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __register_xpc_activities_block_invoke_514_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to defer activity: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __register_xpc_activities_block_invoke_515_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to defer activity: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __register_xpc_activities_block_invoke_516_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to defer activity: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __register_xpc_activities_block_invoke_517_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to defer activity: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __register_xpc_activities_block_invoke_518_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to defer activity: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __register_xpc_activities_block_invoke_519_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to defer activity: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __getMSDKManagedDeviceClass_block_invoke_cold_1(_QWORD *a1)
{
  NSAssertionHandler *v2;
  NSString *v3;

  v2 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
  v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *MobileStoreDemoKitLibrary(void)");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("activation_support.m"), 27, CFSTR("%s"), *a1);

  __break(1u);
}

void __getMSDKManagedDeviceClass_block_invoke_cold_2()
{
  NSAssertionHandler *v0;
  NSString *v1;

  v0 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
  v1 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getMSDKManagedDeviceClass(void)_block_invoke");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("activation_support.m"), 28, CFSTR("Unable to find class %s"), "MSDKManagedDevice");

  __break(1u);
}

void copySplunkDeviceIdentifiers_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v0, v1, "Failed to allocate splunk queue.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __writeSplunkLog_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v0, v1, "Invalid input.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __writeSplunkLog_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v0, v1, "Failed to copy splunk path.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __writeSplunkLog_block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v0, v1, "Failed to create dictionary.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __writeSplunkLog_block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to query splunk device identifiers: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __writeSplunkLog_block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to serialize dictionary: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __writeSplunkLog_block_invoke_cold_6(void *a1, NSObject *a2)
{
  uint8_t v3[12];
  __int16 v4;
  int v5;

  objc_msgSend(a1, "length");
  OUTLINED_FUNCTION_4();
  v4 = 1024;
  v5 = 0x100000;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Splunk log is too big (%ld > %d).", v3, 0x12u);
}

void __writeSplunkLog_block_invoke_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v0, v1, "Failed to create new array.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __writeSplunkLog_block_invoke_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to serialize array: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __writeSplunkLog_block_invoke_cold_9()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v0, v1, "Failed to write %@: %@");
  OUTLINED_FUNCTION_1();
}

void __writeSplunkLog_block_invoke_cold_10(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  id v7;

  v7 = objc_msgSend(a2, "lastObject");
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_fault_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_FAULT, "Too many splunk log files, removing %@.", a1, 0xCu);

}

void __writeSplunkLog_block_invoke_cold_11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to query FindMy state: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __writeSplunkLog_block_invoke_cold_12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to query primary iCloud account security state: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __writeSplunkLog_block_invoke_cold_13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to query primary iCloud account state: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __writeSplunkLog_block_invoke_cold_14()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v0, v1, "Could not create %@: %@");
  OUTLINED_FUNCTION_1();
}

void __writeSplunkLog_block_invoke_34_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, a1, a3, "Failed to defer activity: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __splunk_activity_handler_block_invoke_2_43_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 40);
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, a2, a3, "Failed to perform splunk logging (will not retry post => %@): %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

void __splunk_daily_stats_activity_handler_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to query daily splunk info: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __getLAContextClass_block_invoke_cold_1(_QWORD *a1)
{
  NSAssertionHandler *v2;
  NSString *v3;

  v2 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
  v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *LocalAuthenticationLibrary(void)");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("identity_support.m"), 21, CFSTR("%s"), *a1);

  __break(1u);
}

void __getLAContextClass_block_invoke_cold_2()
{
  NSAssertionHandler *v0;
  NSString *v1;

  v0 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
  v1 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getLAContextClass(void)_block_invoke");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("identity_support.m"), 22, CFSTR("Unable to find class %s"), "LAContext");

  __break(1u);
}

void getAKAuthenticationPasswordKey_cold_1()
{
  NSAssertionHandler *v0;

  v0 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v0, "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NSString *getAKAuthenticationPasswordKey(void)"), CFSTR("authkit.m"), 24, CFSTR("%s"), dlerror());
  OUTLINED_FUNCTION_0();

  __break(1u);
}

void getAKAuthenticationUsernameKey_cold_1()
{
  NSAssertionHandler *v0;

  v0 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v0, "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NSString *getAKAuthenticationUsernameKey(void)"), CFSTR("authkit.m"), 25, CFSTR("%s"), dlerror());
  OUTLINED_FUNCTION_0();

  __break(1u);
}

void AuthKitLibrary_cold_1(_QWORD *a1)
{
  NSAssertionHandler *v2;
  NSString *v3;

  v2 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
  v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *AuthKitLibrary(void)");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("authkit.m"), 21, CFSTR("%s"), *a1);

  OUTLINED_FUNCTION_0();
  __break(1u);
}

void libavp_send_host_message_cold_1()
{
  uint64_t v0;
  NSAssertionHandler *v1;
  NSString *v2;

  v1 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
  v2 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "CFDataRef gAppleVirtualPlatformSendSubsystemMessageToHost(AppleVirtualPlatformMessageSubsystem, CFDataRef, CFErrorRef *)");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("vm_libavp.m"), 34, CFSTR("%s"), OUTLINED_FUNCTION_1_0());
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  __break(1u);
}

void libavp_copy_strong_identity_data_cold_1()
{
  uint64_t v0;
  NSAssertionHandler *v1;
  NSString *v2;

  v1 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
  v2 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "CFStringRef getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronous(void)");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("vm_libavp.m"), 38, CFSTR("%s"), OUTLINED_FUNCTION_1_0());
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  __break(1u);
}

void libavp_copy_strong_identity_data_cold_2()
{
  uint64_t v0;
  NSAssertionHandler *v1;
  NSString *v2;

  v1 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
  v2 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "CFStringRef getkAppleVirtualPlatformGuestStrongIdentityOptionCachedOnly(void)");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("vm_libavp.m"), 41, CFSTR("%s"), OUTLINED_FUNCTION_1_0());
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  __break(1u);
}

void libavp_copy_strong_identity_data_cold_3()
{
  uint64_t v0;
  NSAssertionHandler *v1;
  NSString *v2;

  v1 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
  v2 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "CFDataRef gAppleVirtualPlatformGuestCopyStrongIdentityData(CFDictionaryRef, CFErrorRef *)");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("vm_libavp.m"), 32, CFSTR("%s"), OUTLINED_FUNCTION_1_0());
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  __break(1u);
}

void libavp_copy_strong_identity_data_cold_4()
{
  uint64_t v0;
  NSAssertionHandler *v1;
  NSString *v2;

  v1 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
  v2 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "CFStringRef getkAppleVirtualPlatformGuestStrongIdentityOptionSynchronousTimeoutNsec(void)");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("vm_libavp.m"), 44, CFSTR("%s"), OUTLINED_FUNCTION_1_0());
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  __break(1u);
}

void libavp_guest_has_host_key_cold_1()
{
  uint64_t v0;
  NSAssertionHandler *v1;
  NSString *v2;

  v1 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
  v2 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "_Bool gAppleVirtualPlatformGuestHasHostKey(void)");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("vm_libavp.m"), 36, CFSTR("%s"), OUTLINED_FUNCTION_1_0());
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  __break(1u);
}

void AppleVirtualPlatformLibrary_cold_1(_QWORD *a1)
{
  NSAssertionHandler *v2;
  NSString *v3;

  v2 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
  v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *AppleVirtualPlatformLibrary(void)");
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("vm_libavp.m"), 26, CFSTR("%s"), *a1);

  OUTLINED_FUNCTION_0();
  __break(1u);
}

void isSupportedDeviceIdentityClient_cold_1(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = objc_msgSend(a1, "localizedDescription");
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, &_os_log_default, v2, "%@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_1_1();
}

void main_cold_1()
{
  NSError *v0;
  id v1;
  const char *v2;
  id v3;

  v0 = createAndLogError((uint64_t)"main", 331, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create serial queue."));
  OUTLINED_FUNCTION_2_0();
  v1 = objc_retainAutorelease(-[NSError description](v0, "description"));
  v3 = OUTLINED_FUNCTION_1_2(v1, v2);
  _os_crash(v3);
  OUTLINED_FUNCTION_2_0();
  __break(1u);
}

void main_cold_2()
{
  NSError *v0;
  id v1;
  const char *v2;
  id v3;

  v0 = createAndLogError((uint64_t)"main", 338, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to create data ark."));
  OUTLINED_FUNCTION_2_0();
  v1 = objc_retainAutorelease(-[NSError description](v0, "description"));
  v3 = OUTLINED_FUNCTION_1_2(v1, v2);
  _os_crash(v3);
  OUTLINED_FUNCTION_2_0();
  __break(1u);
}

void main_cold_3()
{
  NSError *v0;
  id v1;
  const char *v2;
  id v3;

  v0 = createAndLogError((uint64_t)"main", 386, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to initialize XPC server."));
  OUTLINED_FUNCTION_2_0();
  v1 = objc_retainAutorelease(-[NSError description](v0, "description"));
  v3 = OUTLINED_FUNCTION_1_2(v1, v2);
  _os_crash(v3);
  OUTLINED_FUNCTION_2_0();
  __break(1u);
}

void main_cold_4()
{
  NSError *v0;
  id v1;
  const char *v2;
  id v3;

  v0 = createAndLogError((uint64_t)"main", 398, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to initialize lockdown server."));
  OUTLINED_FUNCTION_2_0();
  v1 = objc_retainAutorelease(-[NSError description](v0, "description"));
  v3 = OUTLINED_FUNCTION_1_2(v1, v2);
  _os_crash(v3);
  OUTLINED_FUNCTION_2_0();
  __break(1u);
}

void main_cold_5(id a1)
{
  NSError *v1;
  id v2;
  const char *v3;
  id v4;

  v1 = createAndLogError((uint64_t)"main", 355, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a1, CFSTR("Migration failed."));
  OUTLINED_FUNCTION_2_0();
  v2 = objc_retainAutorelease(-[NSError description](v1, "description"));
  v4 = OUTLINED_FUNCTION_1_2(v2, v3);
  _os_crash(v4);
  OUTLINED_FUNCTION_2_0();
  __break(1u);
}

void main_cold_6(id a1)
{
  NSError *v1;
  id v2;
  const char *v3;
  id v4;

  v1 = createAndLogError((uint64_t)"main", 344, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a1, CFSTR("Failed to perform boot initialization tasks."));
  OUTLINED_FUNCTION_2_0();
  v2 = objc_retainAutorelease(-[NSError description](v1, "description"));
  v4 = OUTLINED_FUNCTION_1_2(v2, v3);
  _os_crash(v4);
  OUTLINED_FUNCTION_2_0();
  __break(1u);
}

void main_cold_7()
{
  uint64_t v0;
  int *v1;
  char *v2;
  NSError *v3;
  id v4;
  const char *v5;
  id v6;

  v0 = *__error();
  v1 = __error();
  v2 = OUTLINED_FUNCTION_2_1(v1);
  v3 = createAndLogError((uint64_t)"main", 306, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to retrieve password database info for user: %d (%s)"), v0, v2);
  OUTLINED_FUNCTION_2_0();
  v4 = objc_retainAutorelease(-[NSError description](v3, "description"));
  v6 = OUTLINED_FUNCTION_1_2(v4, v5);
  _os_crash(v6);
  OUTLINED_FUNCTION_2_0();
  __break(1u);
}

void main_cold_8(id a1)
{
  NSError *v1;
  id v2;
  const char *v3;
  id v4;

  v1 = createAndLogError((uint64_t)"main", 296, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a1, CFSTR("Failed to set backup exclusion on container path."));
  OUTLINED_FUNCTION_2_0();
  v2 = objc_retainAutorelease(-[NSError description](v1, "description"));
  v4 = OUTLINED_FUNCTION_1_2(v2, v3);
  _os_crash(v4);
  OUTLINED_FUNCTION_2_0();
  __break(1u);
}

void main_cold_9(id a1)
{
  NSError *v1;
  id v2;
  const char *v3;
  id v4;

  v1 = createAndLogError((uint64_t)"main", 290, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a1, CFSTR("Failed to get backup exclusion on container path."));
  OUTLINED_FUNCTION_2_0();
  v2 = objc_retainAutorelease(-[NSError description](v1, "description"));
  v4 = OUTLINED_FUNCTION_1_2(v2, v3);
  _os_crash(v4);
  OUTLINED_FUNCTION_2_0();
  __break(1u);
}

void main_cold_10()
{
  id v0;
  const char *v1;
  id v2;

  v0 = objc_retainAutorelease(-[NSError description](createAndLogError((uint64_t)"main", 281, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to copy container path(s).")), "description"));
  v2 = OUTLINED_FUNCTION_1_2(v0, v1);
  _os_crash(v2);
  OUTLINED_FUNCTION_2_0();
  __break(1u);
}

void main_cold_11()
{
  uint64_t v0;
  int *v1;
  char *v2;
  id v3;
  const char *v4;
  id v5;

  v0 = *__error();
  v1 = __error();
  v2 = OUTLINED_FUNCTION_2_1(v1);
  v3 = objc_retainAutorelease(-[NSError description](createAndLogError((uint64_t)"main", 269, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to set temporary directory subpath: %d (%s)"), v0, v2), "description"));
  v5 = OUTLINED_FUNCTION_1_2(v3, v4);
  _os_crash(v5);
  OUTLINED_FUNCTION_2_0();
  __break(1u);
}

void main_cold_12()
{
  uint64_t v0;
  int *v1;
  char *v2;
  id v3;
  const char *v4;
  id v5;

  v0 = *__error();
  v1 = __error();
  v2 = OUTLINED_FUNCTION_2_1(v1);
  v3 = objc_retainAutorelease(-[NSError description](createAndLogError((uint64_t)"main", 263, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Error setting low space io policy: %d (%s)"), v0, v2), "description"));
  v5 = OUTLINED_FUNCTION_1_2(v3, v4);
  _os_crash(v5);
  OUTLINED_FUNCTION_2_0();
  __break(1u);
}

void __main_block_invoke_2_cold_1(id a1)
{
  NSError *v1;
  id v2;
  const char *v3;
  id v4;

  v1 = createAndLogError((uint64_t)"main_block_invoke_2", 377, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a1, CFSTR("Migration failed."));
  OUTLINED_FUNCTION_2_0();
  v2 = objc_retainAutorelease(-[NSError description](v1, "description"));
  v4 = OUTLINED_FUNCTION_1_2(v2, v3);
  _os_crash(v4);
  OUTLINED_FUNCTION_2_0();
  __break(1u);
}

void __perform_boot_initialization_tasks_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Failed to query monotonic clock: %@", (uint8_t *)&v2, 0xCu);
}

id objc_msgSend_DSIDForAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DSIDForAccount:");
}

id objc_msgSend_HTTPBody(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "HTTPBody");
}

id objc_msgSend_HTTPMethod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "HTTPMethod");
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__copyConnectionAvailabilityWithSlotID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyConnectionAvailabilityWithSlotID:error:");
}

id objc_msgSend__copyPhoneNumberWithSlotID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyPhoneNumberWithSlotID:error:");
}

id objc_msgSend__copySIMStatusWithSlotID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copySIMStatusWithSlotID:error:");
}

id objc_msgSend__setPassword_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setPassword:");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend_activationLockInfoFromDeviceWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activationLockInfoFromDeviceWithCompletion:");
}

id objc_msgSend_activationNonce(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activationNonce");
}

id objc_msgSend_activationSessionClientName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activationSessionClientName");
}

id objc_msgSend_addAGestaltKey_toDictionary_required_errors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAGestaltKey:toDictionary:required:errors:");
}

id objc_msgSend_addCharactersInString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addCharactersInString:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_allHTTPHeaderFields(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allHTTPHeaderFields");
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allHeaderFields");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_allowInvalidCert(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowInvalidCert");
}

id objc_msgSend_alphanumericCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alphanumericCharacterSet");
}

id objc_msgSend_altDSIDForAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "altDSIDForAccount:");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_authKitAccountWithAppleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authKitAccountWithAppleID:");
}

id objc_msgSend_authenticateWithContext_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticateWithContext:completion:");
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticationMethod");
}

id objc_msgSend_available(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "available");
}

id objc_msgSend_base64EncodedDataWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedDataWithOptions:");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_callingProcessName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callingProcessName");
}

id objc_msgSend_change_notifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "change_notifications");
}

id objc_msgSend_clearOwnershipWarning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearOwnershipWarning");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_collectPCRT_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectPCRT:");
}

id objc_msgSend_collectSIK_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectSIK:");
}

id objc_msgSend_collectSigningAttestation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectSigningAttestation:");
}

id objc_msgSend_collectionLibraryLoaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectionLibraryLoaded");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:options:");
}

id objc_msgSend_components_fromDate_toDate_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "components:fromDate:toDate:options:");
}

id objc_msgSend_componentsSeparatedByCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
}

id objc_msgSend_connectionAvailability(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionAvailability");
}

id objc_msgSend_connectionAvailabilityTwo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionAvailabilityTwo");
}

id objc_msgSend_connectionProxyDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionProxyDictionary");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_contextWithSlot_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contextWithSlot:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyAnswer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyAnswer:");
}

id objc_msgSend_copyBootArgs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyBootArgs");
}

id objc_msgSend_copyBootSessionUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyBootSessionUUID");
}

id objc_msgSend_copyCarrierBundleValue_key_bundleType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyCarrierBundleValue:key:bundleType:error:");
}

id objc_msgSend_copyDeviceIDInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyDeviceIDInfo:");
}

id objc_msgSend_copyDeviceInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyDeviceInfo:");
}

id objc_msgSend_copyDeviceTreeInt_key_defaultValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyDeviceTreeInt:key:defaultValue:");
}

id objc_msgSend_copyDeviceTreeProperty_key_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyDeviceTreeProperty:key:");
}

id objc_msgSend_copyDeviceTreeString_key_defaultValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyDeviceTreeString:key:defaultValue:");
}

id objc_msgSend_copyIngestData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyIngestData:");
}

id objc_msgSend_copyIngestHeaders_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyIngestHeaders:withError:");
}

id objc_msgSend_copyIngestURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyIngestURL");
}

id objc_msgSend_copyItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyItemAtPath:toPath:error:");
}

id objc_msgSend_copyPathForPersonalizedData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyPathForPersonalizedData:error:");
}

id objc_msgSend_copyPhoneNumberWithSlotID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyPhoneNumberWithSlotID:error:");
}

id objc_msgSend_copyRegulatoryImagesInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyRegulatoryImagesInfo:");
}

id objc_msgSend_copySIMStatusWithSlotID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copySIMStatusWithSlotID:error:");
}

id objc_msgSend_copyUCRTVersionInfoWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyUCRTVersionInfoWithError:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createActivationInfoWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createActivationInfoWithCompletionBlock:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createRecertInfoWithDataArk_alcoholBlob_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createRecertInfoWithDataArk:alcoholBlob:options:error:");
}

id objc_msgSend_createTunnel1ActivationInfo_options_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createTunnel1ActivationInfo:options:withCompletionBlock:");
}

id objc_msgSend_createTunnel1SessionInfoWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createTunnel1SessionInfoWithCompletionBlock:");
}

id objc_msgSend_creationQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "creationQueue");
}

id objc_msgSend_credentialForTrust_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "credentialForTrust:");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentConnection");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentSessionDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentSessionDuration");
}

id objc_msgSend_dark(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dark");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataTaskWithRequest:completionHandler:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataUsingEncoding_allowLossyConversion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:allowLossyConversion:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithData:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateFromServerString_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateFromServerString:withError:");
}

id objc_msgSend_dateFromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateFromString:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "day");
}

id objc_msgSend_deactivateDeviceWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deactivateDeviceWithCompletionBlock:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultSessionConfiguration");
}

id objc_msgSend_deleteExpiredLogFiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteExpiredLogFiles");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_device_class(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "device_class");
}

id objc_msgSend_device_supports_dcrt_oob(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "device_supports_dcrt_oob");
}

id objc_msgSend_device_supports_eda_certificates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "device_supports_eda_certificates");
}

id objc_msgSend_device_supports_mfi_certificates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "device_supports_mfi_certificates");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_dualSIMCapable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dualSIMCapable");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fmipAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fmipAccount");
}

id objc_msgSend_formattedUsernameForAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formattedUsernameForAccount:");
}

id objc_msgSend_generateSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateSession:");
}

id objc_msgSend_getActivationStateWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getActivationStateWithCompletionBlock:");
}

id objc_msgSend_getBoolAnswer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBoolAnswer:");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getBytes_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:range:");
}

id objc_msgSend_getConnectionAvailability_connectionType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getConnectionAvailability:connectionType:error:");
}

id objc_msgSend_getCurrentDataSubscriptionContextSync_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCurrentDataSubscriptionContextSync:");
}

id objc_msgSend_getPhoneNumber_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPhoneNumber:error:");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_getSIMStatus_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSIMStatus:error:");
}

id objc_msgSend_getSharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSharedInstance");
}

id objc_msgSend_handleActivationInfo_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleActivationInfo:withCompletionBlock:");
}

id objc_msgSend_handleActivationInfoWithSession_activationSignature_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleActivationInfoWithSession:activationSignature:completionBlock:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleSessionResponse_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleSessionResponse:withError:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_has_baseband(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "has_baseband");
}

id objc_msgSend_has_internal_diagnostics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "has_internal_diagnostics");
}

id objc_msgSend_hexString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hexString");
}

id objc_msgSend_hostKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostKey");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithBase64EncodedData_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBase64EncodedData:options:");
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBase64EncodedString:options:");
}

id objc_msgSend_initWithBundleType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleType:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithBytes_length_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:encoding:");
}

id objc_msgSend_initWithBytesNoCopy_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytesNoCopy:length:");
}

id objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_initWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfFile:");
}

id objc_msgSend_initWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfFile:options:error:");
}

id objc_msgSend_initWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContext:");
}

id objc_msgSend_initWithContext_Queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContext:Queue:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDataRepresentation_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDataRepresentation:error:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPath:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithQueue_dark_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:dark:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTimeIntervalSince1970:");
}

id objc_msgSend_initWithURL_cachePolicy_timeoutInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:cachePolicy:timeoutInterval:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_intermediateCertificate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intermediateCertificate");
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateAndCancel");
}

id objc_msgSend_isActivationLockEnabledWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isActivationLockEnabledWithCompletion:");
}

id objc_msgSend_isEntitled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEntitled:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isPresent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPresent");
}

id objc_msgSend_is_audio_accessory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "is_audio_accessory");
}

id objc_msgSend_is_dev_board(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "is_dev_board");
}

id objc_msgSend_is_devfused_undemoted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "is_devfused_undemoted");
}

id objc_msgSend_is_fpga(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "is_fpga");
}

id objc_msgSend_is_internal_build(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "is_internal_build");
}

id objc_msgSend_is_ipad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "is_ipad");
}

id objc_msgSend_is_iphone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "is_iphone");
}

id objc_msgSend_is_ipod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "is_ipod");
}

id objc_msgSend_is_prodfused_demoted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "is_prodfused_demoted");
}

id objc_msgSend_lastConnectionAvailabilityError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastConnectionAvailabilityError");
}

id objc_msgSend_lastConnectionAvailabilityTwoError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastConnectionAvailabilityTwoError");
}

id objc_msgSend_lastNetworkError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastNetworkError");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_lastPhoneNumberError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPhoneNumberError");
}

id objc_msgSend_lastPhoneNumberTwoError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPhoneNumberTwoError");
}

id objc_msgSend_lastSimStatusError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastSimStatusError");
}

id objc_msgSend_lastSimStatusTwoError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastSimStatusTwoError");
}

id objc_msgSend_leafCertificate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leafCertificate");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedStringForStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForStatusCode:");
}

id objc_msgSend_lockdownDidReceiveActivationRecord_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockdownDidReceiveActivationRecord:");
}

id objc_msgSend_logHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logHandle");
}

id objc_msgSend_logMessage_toSyslog_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logMessage:toSyslog:");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_maskedAppleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maskedAppleID");
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_moveItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemAtPath:toPath:error:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_networkPathEvaluator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "networkPathEvaluator");
}

id objc_msgSend_networkReachable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "networkReachable");
}

id objc_msgSend_number(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "number");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForCaseInsensitiveKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForCaseInsensitiveKey:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_otaActivationAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "otaActivationAssertion");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_persistentDomainForName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentDomainForName:");
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phoneNumber");
}

id objc_msgSend_phoneNumberTwo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phoneNumberTwo");
}

id objc_msgSend_postNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotification:");
}

id objc_msgSend_previousFailureCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previousFailureCount");
}

id objc_msgSend_primaryAuthKitAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryAuthKitAccount");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_processSUInfo_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processSUInfo:withError:");
}

id objc_msgSend_product_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "product_type");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "protectionSpace");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_rangeOfUnit_startDate_interval_forDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfUnit:startDate:interval:forDate:");
}

id objc_msgSend_recertifyDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recertifyDevice:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeLastObject");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_remove_notifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remove_notifications");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reverseObjectEnumerator");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheme");
}

id objc_msgSend_securityLevelForAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "securityLevelForAccount:");
}

id objc_msgSend_serverTrust(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serverTrust");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "session");
}

id objc_msgSend_sessionHelloMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionHelloMessage");
}

id objc_msgSend_sessionQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionQueue");
}

id objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionWithConfiguration:delegate:delegateQueue:");
}

id objc_msgSend_setActivationNonce_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivationNonce:");
}

id objc_msgSend_setActivationSessionClientName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivationSessionClientName:");
}

id objc_msgSend_setAllHTTPHeaderFields_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllHTTPHeaderFields:");
}

id objc_msgSend_setAllowInvalidCert_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowInvalidCert:");
}

id objc_msgSend_setAltDSID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAltDSID:");
}

id objc_msgSend_setAuthenticationType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthenticationType:");
}

id objc_msgSend_setCachePolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCachePolicy:");
}

id objc_msgSend_setCellularBootstrapAssertion_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCellularBootstrapAssertion:withError:");
}

id objc_msgSend_setConnectionAvailability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectionAvailability:");
}

id objc_msgSend_setConnectionAvailabilityTwo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectionAvailabilityTwo:");
}

id objc_msgSend_setConnectionProxyDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectionProxyDictionary:");
}

id objc_msgSend_setDSID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDSID:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setHTTPBody_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPBody:");
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPMethod:");
}

id objc_msgSend_setIsUsernameEditable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsUsernameEditable:");
}

id objc_msgSend_setLastConnectionAvailabilityError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastConnectionAvailabilityError:");
}

id objc_msgSend_setLastConnectionAvailabilityTwoError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastConnectionAvailabilityTwoError:");
}

id objc_msgSend_setLastNetworkError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastNetworkError:");
}

id objc_msgSend_setLastPhoneNumberError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastPhoneNumberError:");
}

id objc_msgSend_setLastPhoneNumberTwoError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastPhoneNumberTwoError:");
}

id objc_msgSend_setLastSimStatusError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastSimStatusError:");
}

id objc_msgSend_setLastSimStatusTwoError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastSimStatusTwoError:");
}

id objc_msgSend_setLogHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLogHandle:");
}

id objc_msgSend_setMandatorySoftwareUpdateDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMandatorySoftwareUpdateDictionary:");
}

id objc_msgSend_setOTAActivationAssertion_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOTAActivationAssertion:withError:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOtaActivationAssertion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOtaActivationAssertion:");
}

id objc_msgSend_setPhoneNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhoneNumber:");
}

id objc_msgSend_setPhoneNumberTwo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhoneNumberTwo:");
}

id objc_msgSend_setResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResourceValue:forKey:error:");
}

id objc_msgSend_setServiceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceType:");
}

id objc_msgSend_setShouldPromptForPasswordOnly_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldPromptForPasswordOnly:");
}

id objc_msgSend_setShouldSkipSettingsLaunchAlert_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldSkipSettingsLaunchAlert:");
}

id objc_msgSend_setShouldUpdatePersistentServiceTokens_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldUpdatePersistentServiceTokens:");
}

id objc_msgSend_setSimStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSimStatus:");
}

id objc_msgSend_setSimStatusTwo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSimStatusTwo:");
}

id objc_msgSend_setTimeoutInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutInterval:");
}

id objc_msgSend_setTimeoutIntervalForResource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutIntervalForResource:");
}

id objc_msgSend_setURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setURL:");
}

id objc_msgSend_setUserInPurchaseFlow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInPurchaseFlow:");
}

id objc_msgSend_setUsername_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsername:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_setWaitsForConnectivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWaitsForConnectivity:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_set_CTDataConnectionServiceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set_CTDataConnectionServiceType:");
}

id objc_msgSend_set_notifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set_notifications");
}

id objc_msgSend_set_requiresSecureHTTPSProxyConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set_requiresSecureHTTPSProxyConnection:");
}

id objc_msgSend_set_sourceApplicationSecondaryIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set_sourceApplicationSecondaryIdentifier:");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedDataAccessor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedDataAccessor");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_should_hactivate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "should_hactivate");
}

id objc_msgSend_signatureForData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signatureForData:error:");
}

id objc_msgSend_signingKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signingKey");
}

id objc_msgSend_signingKeyPublicKeyWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signingKeyPublicKeyWithError:");
}

id objc_msgSend_simStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "simStatus");
}

id objc_msgSend_simStatusTwo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "simStatusTwo");
}

id objc_msgSend_slotID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "slotID");
}

id objc_msgSend_soc_generation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "soc_generation");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "status");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "store");
}

id objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByPaddingToLength_withString_startingAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByPaddingToLength:withString:startingAtIndex:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subdataWithRange:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_telephonyClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "telephonyClient");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_timeoutInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeoutInterval");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_updateRecertInfo_errors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateRecertInfo:errors:");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uppercaseString");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_usingBootstrapDataService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usingBootstrapDataService:");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuid");
}

id objc_msgSend_validateActivationDataSignature_activationSignature_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateActivationDataSignature:activationSignature:withError:");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForHTTPHeaderField:");
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whitespaceCharacterSet");
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:encoding:error:");
}

id objc_msgSend_xpcQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcQueue");
}

