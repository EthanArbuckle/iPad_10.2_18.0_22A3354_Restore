void *sub_1DF262660(uint64_t a1, int a2, int a3)
{
  return malloc_type_malloc(a3 * a2, 0xD7BDDC2CuLL);
}

int BZ2_bzCompress(bz_stream *strm, int action)
{
  bz_stream **state;
  int result;
  int v5;

  if (!strm)
    return -2;
  state = (bz_stream **)strm->state;
  if (!state || *state != strm)
    return -2;
  v5 = *((_DWORD *)state + 2);
  result = -1;
  while (v5 == 2)
  {
    if (action == 1)
    {
      v5 = 3;
    }
    else
    {
      if (action != 2)
      {
        result = -2;
        if (!action)
        {
          if (sub_1DF2681B4((uint64_t)strm))
            return 1;
          else
            return -2;
        }
        return result;
      }
      v5 = 4;
    }
    *((_DWORD *)state + 4) = strm->avail_in;
    *((_DWORD *)state + 2) = v5;
  }
  if (v5 == 1)
    return result;
  if (v5 != 3)
  {
    if (v5 != 4)
      return 0;
    if (action == 2 && *((_DWORD *)state + 4) == strm->avail_in && sub_1DF2681B4((uint64_t)strm))
    {
      if (*((_DWORD *)state + 4)
        || *((_DWORD *)state + 23) <= 0xFFu && *((int *)state + 24) > 0
        || *((_DWORD *)state + 30) < *((_DWORD *)state + 29))
      {
        return 3;
      }
      *((_DWORD *)state + 2) = 1;
      return 4;
    }
    return -1;
  }
  if (action != 1 || *((_DWORD *)state + 4) != strm->avail_in)
    return -1;
  sub_1DF2681B4((uint64_t)strm);
  if (*((_DWORD *)state + 4) || *((_DWORD *)state + 23) <= 0xFFu && *((int *)state + 24) > 0)
    return 2;
  result = 2;
  if (*((_DWORD *)state + 30) >= *((_DWORD *)state + 29))
  {
    *((_DWORD *)state + 2) = 2;
    return 1;
  }
  return result;
}

int BZ2_bzBuffToBuffCompress(char *dest, unsigned int *destLen, char *source, unsigned int sourceLen, int blockSize100k, int verbosity, int workFactor)
{
  int v7;
  int v12;
  int v13;
  bz_stream v15;

  v7 = -2;
  if (workFactor <= 0xFA
    && verbosity <= 4
    && dest
    && destLen
    && source
    && (blockSize100k - 10) >= 0xFFFFFFF7)
  {
    memset(&v15, 0, 64);
    v12 = workFactor ? workFactor : 30;
    v15.bzfree = 0;
    v15.opaque = 0;
    v7 = BZ2_bzCompressInit(&v15, blockSize100k, verbosity, v12);
    if (!v7)
    {
      v15.next_in = source;
      v15.next_out = dest;
      v15.avail_in = sourceLen;
      v15.avail_out = *destLen;
      v13 = BZ2_bzCompress(&v15, 2);
      if (v13 == 3)
      {
        v7 = -8;
      }
      else
      {
        v7 = v13;
        if (v13 == 4)
        {
          v7 = 0;
          *destLen -= v15.avail_out;
        }
      }
      BZ2_bzCompressEnd(&v15);
    }
  }
  return v7;
}

int BZ2_bzDecompress(bz_stream *strm)
{
  int8x16_t v1;
  double v2;
  int8x16_t v3;
  int8x16_t v4;
  _DWORD *state;
  int result;
  int *v7;
  char *v8;
  int v9;
  int *v10;
  FILE **v11;
  uint64_t *v12;
  int8x16_t *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  unint64_t v20;
  unsigned int v21;
  int v22;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  unint64_t v27;
  int v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  unint64_t v36;
  uint64_t v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  unsigned __int16 v43;
  unint64_t v44;
  uint64_t v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  unsigned __int16 v51;
  unint64_t v52;
  uint64_t v53;
  int v54;
  int v55;
  int v56;
  int v57;
  uint64_t v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  uint64_t v68;
  unsigned int v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  int v73;
  uint64_t v74;
  int v75;
  int v76;
  int v77;
  unint64_t v78;
  unint64_t v79;
  uint64_t v80;
  int v81;
  int v82;
  int v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  int v87;
  int v88;
  int v89;
  unint64_t v90;
  unint64_t v91;
  uint64_t v92;
  int v93;
  int v94;
  unsigned int v95;
  int v96;
  uint64_t v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  unint64_t v106;
  unsigned int v107;
  int v108;
  int v109;
  uint64_t v110;
  int v111;
  uint64_t v112;
  unint64_t v113;
  int v114;
  int v115;
  unsigned __int16 v116;
  unint64_t v117;
  int v118;
  int v119;
  int v120;
  unint64_t v121;
  int v122;
  int v123;
  unsigned __int16 v124;
  unint64_t v125;
  int v126;
  int v127;
  int v128;
  int v129;
  char v130;
  int v131;
  int v132;
  uint64_t v133;
  unint64_t v134;
  uint64_t v135;
  int v136;
  int v137;
  int v138;
  unsigned int v139;
  _BYTE *v140;
  int v141;
  uint64_t v142;
  int v143;
  uint64_t v144;
  unint64_t v145;
  unint64_t v146;
  unint64_t v147;
  unint64_t v148;
  unint64_t v149;
  int v150;
  int v151;
  int *v152;
  int v153;
  int v154;
  unsigned int v155;
  int v156;
  int v157;
  int v158;
  int v159;

  if (!strm)
    return -2;
  state = strm->state;
  if (!state || *(bz_stream **)state != strm)
    return -2;
  v7 = state + 16020;
  v8 = (char *)(state + 274);
  v9 = state[2];
  v10 = dword_1F0473790;
  v11 = (FILE **)MEMORY[0x1E0C80C10];
  while (1)
  {
    if (v9 == 1)
      return -1;
    if (v9 == 2)
      break;
    if (v9 >= 10)
    {
LABEL_238:
      result = sub_1DF263764((uint64_t **)state);
      if (result == 4)
      {
        if ((int)state[13] >= 3)
          fprintf(*v11, "\n    combined CRCs: stored = 0x%08x, computed = 0x%08x", state[795], state[797]);
        if (state[797] == state[795])
          return 4;
        else
          return -4;
      }
      v9 = 2;
      if (state[2] != 2)
        return result;
    }
  }
  v12 = *(uint64_t **)state;
  v13 = *(int8x16_t **)(*(_QWORD *)state + 24);
  if (*((_BYTE *)state + 44))
  {
    v14 = *((_DWORD *)v12 + 8);
    if (*((_BYTE *)state + 20))
    {
      if (v14)
      {
        v15 = state[4];
        while (1)
        {
          while (v15)
          {
            *(_BYTE *)v12[3] = *((_BYTE *)state + 12);
            v15 = state[4] - 1;
            state[4] = v15;
            v12 = *(uint64_t **)state;
            v12[3] = *(_QWORD *)(*(_QWORD *)state + 24) + 1;
            v60 = *((_DWORD *)v12 + 9);
            v61 = *((_DWORD *)v12 + 8) - 1;
            *((_DWORD *)v12 + 8) = v61;
            *((_DWORD *)v12 + 9) = v60 + 1;
            if (v60 == -1)
              ++*((_DWORD *)v12 + 10);
            v62 = 1;
            if (!v61)
              goto LABEL_224;
          }
          v16 = state[273];
          v17 = *v7;
          v18 = *v7 + 1;
          if (v16 == v18)
            goto LABEL_191;
          if (v16 > v18)
            break;
          state[4] = 1;
          v20 = state[15];
          v19 = state[16];
          *((_BYTE *)state + 12) = v19;
          v21 = 100000 * state[10];
          if (v20 >= v21)
            break;
          v22 = 0;
          v23 = 256;
          do
          {
            if (*(_DWORD *)&v8[4 * ((v23 + v22) >> 1)] > (int)v20)
              v23 = (v23 + v22) >> 1;
            else
              v22 = (v23 + v22) >> 1;
          }
          while (v23 - v22 != 1);
          v24 = *((_QWORD *)state + 395);
          v25 = *(unsigned __int16 *)(v24 + 2 * v20);
          v26 = *((_QWORD *)state + 396);
          v27 = v25 & 0xFFF0FFFF | (((*(unsigned __int8 *)(v26 + (v20 >> 1)) >> (4 * (v20 & 1))) & 0xF) << 16);
          state[15] = v27;
          v28 = state[6];
          if (!v28)
          {
            v29 = (int)state[7];
            v28 = v10[v29];
            if ((_DWORD)v29 == 511)
              v30 = 0;
            else
              v30 = v29 + 1;
            state[7] = v30;
          }
          v31 = v28 - 1;
          state[6] = v28 - 1;
          state[273] = v16 + 1;
          if (v16 != v17)
          {
            v32 = v22 ^ (v31 == 1);
            if (v32 == v19)
            {
              state[4] = 2;
              if (v27 >= v21)
                break;
              v33 = 0;
              v34 = 256;
              do
              {
                if (*(_DWORD *)&v8[4 * ((v34 + v33) >> 1)] > (int)v27)
                  v34 = (v34 + v33) >> 1;
                else
                  v33 = (v34 + v33) >> 1;
              }
              while (v34 - v33 != 1);
              v35 = *(unsigned __int16 *)(v24 + 2 * v27);
              v36 = v35 & 0xFFF0FFFF | (((*(unsigned __int8 *)(v26 + (v27 >> 1)) >> (4 * (v25 & 1))) & 0xF) << 16);
              state[15] = v36;
              if (v28 == 1)
              {
                v37 = (int)state[7];
                v31 = v10[v37];
                if ((_DWORD)v37 == 511)
                  v38 = 0;
                else
                  v38 = v37 + 1;
                state[7] = v38;
              }
              v39 = v31 - 1;
              state[6] = v31 - 1;
              state[273] = v16 + 2;
              if (v16 + 1 != v17)
              {
                v40 = v33 ^ (v39 == 1);
                if (v40 == v19)
                {
                  state[4] = 3;
                  if (v36 >= v21)
                    break;
                  v41 = 0;
                  v42 = 256;
                  do
                  {
                    if (*(_DWORD *)&v8[4 * ((v42 + v41) >> 1)] > (int)v36)
                      v42 = (v42 + v41) >> 1;
                    else
                      v41 = (v42 + v41) >> 1;
                  }
                  while (v42 - v41 != 1);
                  v43 = *(_WORD *)(v24 + 2 * v36);
                  v44 = v43 | (((*(unsigned __int8 *)(v26 + (v36 >> 1)) >> (4 * (v35 & 1))) & 0xFu) << 16);
                  state[15] = v44;
                  if (!v39)
                  {
                    v45 = (int)state[7];
                    v39 = v10[v45];
                    if ((_DWORD)v45 == 511)
                      v46 = 0;
                    else
                      v46 = v45 + 1;
                    state[7] = v46;
                  }
                  v47 = v39 - 1;
                  state[6] = v39 - 1;
                  state[273] = v16 + 3;
                  if (v16 + 2 != v17)
                  {
                    v48 = v41 ^ (v47 == 1);
                    if (v48 == v19)
                    {
                      if (v44 >= v21)
                        break;
                      v49 = 0;
                      v50 = 256;
                      do
                      {
                        if (*(_DWORD *)&v8[4 * ((v50 + v49) >> 1)] > (int)v44)
                          v50 = (v50 + v49) >> 1;
                        else
                          v49 = (v50 + v49) >> 1;
                      }
                      while (v50 - v49 != 1);
                      v51 = *(_WORD *)(v24 + 2 * v44);
                      v52 = v51 | (((*(unsigned __int8 *)(v26 + (v44 >> 1)) >> (4 * (v43 & 1))) & 0xFu) << 16);
                      state[15] = v52;
                      if (!v47)
                      {
                        v53 = (int)state[7];
                        v47 = v10[v53];
                        if ((_DWORD)v53 == 511)
                          v54 = 0;
                        else
                          v54 = v53 + 1;
                        state[7] = v54;
                      }
                      v55 = v47 - 1;
                      state[6] = v47 - 1;
                      state[273] = v16 + 4;
                      state[4] = (v49 ^ (v47 == 2)) + 4;
                      if (v52 >= v21)
                        break;
                      v56 = 0;
                      v57 = 256;
                      do
                      {
                        if (*(_DWORD *)&v8[4 * ((v57 + v56) >> 1)] > (int)v52)
                          v57 = (v57 + v56) >> 1;
                        else
                          v56 = (v57 + v56) >> 1;
                      }
                      while (v57 - v56 != 1);
                      state[16] = v56;
                      state[15] = *(unsigned __int16 *)(v24 + 2 * v52) | (((*(unsigned __int8 *)(v26 + (v52 >> 1)) >> (4 * (v51 & 1))) & 0xF) << 16);
                      if (v47 == 1)
                      {
                        v58 = (int)state[7];
                        v55 = v10[v58];
                        if ((_DWORD)v58 == 511)
                          v59 = 0;
                        else
                          v59 = v58 + 1;
                        state[7] = v59;
                      }
                      state[6] = v55 - 1;
                      state[16] = v56 ^ (v55 == 2);
                      state[273] = v16 + 5;
                    }
                    else
                    {
                      state[16] = v48;
                    }
                  }
                }
                else
                {
                  state[16] = v40;
                }
              }
            }
            else
            {
              state[16] = v32;
            }
          }
          v15 = 1;
          if (!*((_DWORD *)v12 + 8))
            goto LABEL_191;
        }
LABEL_192:
        v62 = 0;
        goto LABEL_224;
      }
    }
    else if (v14)
    {
      v101 = state[4];
      do
      {
        while (v101)
        {
          *(_BYTE *)v12[3] = *((_BYTE *)state + 12);
          v101 = state[4] - 1;
          state[4] = v101;
          v12 = *(uint64_t **)state;
          v12[3] = *(_QWORD *)(*(_QWORD *)state + 24) + 1;
          v128 = *((_DWORD *)v12 + 9);
          v129 = *((_DWORD *)v12 + 8) - 1;
          *((_DWORD *)v12 + 8) = v129;
          *((_DWORD *)v12 + 9) = v128 + 1;
          if (v128 == -1)
            ++*((_DWORD *)v12 + 10);
          v62 = 1;
          if (!v129)
            goto LABEL_224;
        }
        v102 = state[273];
        v103 = *v7;
        v104 = *v7 + 1;
        if (v102 == v104)
          break;
        if (v102 > v104)
          goto LABEL_192;
        state[4] = 1;
        v106 = state[15];
        v105 = state[16];
        *((_BYTE *)state + 12) = v105;
        v107 = 100000 * state[10];
        if (v106 >= v107)
          goto LABEL_192;
        v108 = 0;
        v109 = 256;
        do
        {
          if (*(_DWORD *)&v8[4 * ((v109 + v108) >> 1)] > (int)v106)
            v109 = (v109 + v108) >> 1;
          else
            v108 = (v109 + v108) >> 1;
        }
        while (v109 - v108 != 1);
        v110 = *((_QWORD *)state + 395);
        v111 = *(unsigned __int16 *)(v110 + 2 * v106);
        v112 = *((_QWORD *)state + 396);
        v113 = v111 & 0xFFF0FFFF | (((*(unsigned __int8 *)(v112 + (v106 >> 1)) >> (4 * (v106 & 1))) & 0xF) << 16);
        state[15] = v113;
        state[273] = v102 + 1;
        if (v102 != v103)
        {
          if (v108 == v105)
          {
            state[4] = 2;
            if (v113 >= v107)
              goto LABEL_192;
            v114 = 0;
            v115 = 256;
            do
            {
              if (*(_DWORD *)&v8[4 * ((v115 + v114) >> 1)] > (int)v113)
                v115 = (v115 + v114) >> 1;
              else
                v114 = (v115 + v114) >> 1;
            }
            while (v115 - v114 != 1);
            v116 = *(_WORD *)(v110 + 2 * v113);
            v117 = v116 | (((*(unsigned __int8 *)(v112 + (v113 >> 1)) >> (4 * (v111 & 1))) & 0xFu) << 16);
            state[15] = v117;
            state[273] = v102 + 2;
            if (v102 + 1 != v103)
            {
              if (v114 == v105)
              {
                state[4] = 3;
                if (v117 >= v107)
                  goto LABEL_192;
                v118 = 0;
                v119 = 256;
                do
                {
                  if (*(_DWORD *)&v8[4 * ((v119 + v118) >> 1)] > (int)v117)
                    v119 = (v119 + v118) >> 1;
                  else
                    v118 = (v119 + v118) >> 1;
                }
                while (v119 - v118 != 1);
                v120 = *(unsigned __int16 *)(v110 + 2 * v117);
                v121 = v120 & 0xFFF0FFFF | (((*(unsigned __int8 *)(v112 + (v117 >> 1)) >> (4 * (v116 & 1))) & 0xF) << 16);
                state[15] = v121;
                state[273] = v102 + 3;
                if (v102 + 2 != v103)
                {
                  if (v118 == v105)
                  {
                    if (v121 >= v107)
                      goto LABEL_192;
                    v122 = 0;
                    v123 = 256;
                    do
                    {
                      if (*(_DWORD *)&v8[4 * ((v123 + v122) >> 1)] > (int)v121)
                        v123 = (v123 + v122) >> 1;
                      else
                        v122 = (v123 + v122) >> 1;
                    }
                    while (v123 - v122 != 1);
                    v124 = *(_WORD *)(v110 + 2 * v121);
                    v125 = v124 | (((*(unsigned __int8 *)(v112 + (v121 >> 1)) >> (4 * (v120 & 1))) & 0xFu) << 16);
                    state[15] = v125;
                    state[273] = v102 + 4;
                    state[4] = v122 + 4;
                    if (v125 >= v107)
                      goto LABEL_192;
                    v126 = 0;
                    v127 = 256;
                    do
                    {
                      if (*(_DWORD *)&v8[4 * ((v127 + v126) >> 1)] > (int)v125)
                        v127 = (v127 + v126) >> 1;
                      else
                        v126 = (v127 + v126) >> 1;
                    }
                    while (v127 - v126 != 1);
                    state[16] = v126;
                    state[15] = *(unsigned __int16 *)(v110 + 2 * v125) | (((*(unsigned __int8 *)(v112 + (v125 >> 1)) >> (4 * (v124 & 1))) & 0xF) << 16);
                    state[273] = v102 + 5;
                  }
                  else
                  {
                    state[16] = v118;
                  }
                }
              }
              else
              {
                state[16] = v114;
              }
            }
          }
          else
          {
            state[16] = v108;
          }
        }
        v101 = 1;
      }
      while (*((_DWORD *)v12 + 8));
    }
LABEL_191:
    v62 = 1;
    goto LABEL_224;
  }
  if (*((_BYTE *)state + 20))
  {
    if (*((_DWORD *)v12 + 8))
    {
      v63 = state[4];
      while (1)
      {
        while (v63)
        {
          *(_BYTE *)v12[3] = *((_BYTE *)state + 12);
          v63 = state[4] - 1;
          state[4] = v63;
          v12 = *(uint64_t **)state;
          v12[3] = *(_QWORD *)(*(_QWORD *)state + 24) + 1;
          v99 = *((_DWORD *)v12 + 9);
          v100 = *((_DWORD *)v12 + 8) - 1;
          *((_DWORD *)v12 + 8) = v100;
          *((_DWORD *)v12 + 9) = v99 + 1;
          if (v99 == -1)
            ++*((_DWORD *)v12 + 10);
          v62 = 1;
          if (!v100)
            goto LABEL_224;
        }
        v64 = state[273];
        v65 = *v7;
        v66 = *v7 + 1;
        if (v64 == v66)
          goto LABEL_191;
        if (v64 > v66)
          goto LABEL_192;
        state[4] = 1;
        v68 = state[15];
        v67 = state[16];
        *((_BYTE *)state + 12) = v67;
        v69 = 100000 * state[10];
        if (v68 >= v69)
          goto LABEL_192;
        v70 = *((_QWORD *)state + 394);
        v71 = *(unsigned int *)(v70 + 4 * v68);
        v72 = v71 >> 8;
        state[15] = *(_DWORD *)(v70 + 4 * v68) >> 8;
        v73 = state[6];
        if (!v73)
        {
          v74 = (int)state[7];
          v73 = v10[v74];
          if ((_DWORD)v74 == 511)
            v75 = 0;
          else
            v75 = v74 + 1;
          state[7] = v75;
        }
        v76 = v73 - 1;
        state[6] = v73 - 1;
        state[273] = v64 + 1;
        if (v64 != v65)
        {
          v77 = v71 ^ (v76 == 1);
          if (v77 == v67)
          {
            state[4] = 2;
            if (v72 >= v69)
              goto LABEL_192;
            v78 = *(unsigned int *)(v70 + 4 * v72);
            v79 = v78 >> 8;
            state[15] = *(_DWORD *)(v70 + 4 * v72) >> 8;
            if (v73 == 1)
            {
              v80 = (int)state[7];
              v76 = v10[v80];
              if ((_DWORD)v80 == 511)
                v81 = 0;
              else
                v81 = v80 + 1;
              state[7] = v81;
            }
            v82 = v76 - 1;
            state[6] = v82;
            state[273] = v64 + 2;
            if (v64 + 1 != v65)
            {
              v83 = v78 ^ (v82 == 1);
              if (v83 == v67)
              {
                state[4] = 3;
                if (v79 >= v69)
                  goto LABEL_192;
                v84 = *(unsigned int *)(v70 + 4 * v79);
                v85 = v84 >> 8;
                state[15] = *(_DWORD *)(v70 + 4 * v79) >> 8;
                if (!v82)
                {
                  v86 = (int)state[7];
                  v82 = v10[v86];
                  if ((_DWORD)v86 == 511)
                    v87 = 0;
                  else
                    v87 = v86 + 1;
                  state[7] = v87;
                }
                v88 = v82 - 1;
                state[6] = v82 - 1;
                state[273] = v64 + 3;
                if (v64 + 2 != v65)
                {
                  v89 = v84 ^ (v88 == 1);
                  if (v89 == v67)
                  {
                    if (v85 >= v69)
                      goto LABEL_192;
                    v90 = *(unsigned int *)(v70 + 4 * v85);
                    v91 = v90 >> 8;
                    state[15] = v90 >> 8;
                    if (v82 == 1)
                    {
                      v92 = (int)state[7];
                      v88 = v10[v92];
                      if ((_DWORD)v92 == 511)
                        v93 = 0;
                      else
                        v93 = v92 + 1;
                      state[7] = v93;
                    }
                    v94 = v88 - 1;
                    state[6] = v88 - 1;
                    state[273] = v64 + 4;
                    state[4] = (v90 ^ (v88 == 2)) + 4;
                    if (v91 >= v69)
                      goto LABEL_192;
                    v95 = *(_DWORD *)(v70 + 4 * v91);
                    v96 = v95;
                    state[15] = v95 >> 8;
                    state[16] = v95;
                    if (v88 == 1)
                    {
                      v97 = (int)state[7];
                      v94 = v10[v97];
                      if ((_DWORD)v97 == 511)
                        v98 = 0;
                      else
                        v98 = v97 + 1;
                      state[7] = v98;
                    }
                    state[6] = v94 - 1;
                    state[16] = v96 ^ (v94 == 2);
                    state[273] = v64 + 5;
                  }
                  else
                  {
                    state[16] = v89;
                  }
                }
              }
              else
              {
                state[16] = v83;
              }
            }
          }
          else
          {
            state[16] = v77;
          }
        }
        v63 = 1;
        if (!*((_DWORD *)v12 + 8))
          goto LABEL_191;
      }
    }
    goto LABEL_191;
  }
  v130 = *((_BYTE *)state + 12);
  v131 = state[4];
  v132 = state[273];
  v133 = *((_QWORD *)state + 394);
  LODWORD(v134) = state[15];
  v135 = state[16];
  v136 = *((_DWORD *)v12 + 8);
  v137 = *v7;
  v138 = *v7 + 1;
  v139 = 100000 * state[10];
  v140 = *(_BYTE **)(*(_QWORD *)state + 24);
  v141 = v136;
LABEL_194:
  if (v131 < 1)
  {
    while (1)
    {
      v143 = v132;
      v144 = v135;
      if (v132 > v138)
        goto LABEL_223;
      if (v132 == v138)
      {
        v131 = 0;
        v132 = v137 + 1;
        goto LABEL_219;
      }
      if (v134 >= v139)
        goto LABEL_223;
      v145 = *(unsigned int *)(v133 + 4 * v134);
      v134 = v145 >> 8;
      ++v132;
      v135 = v145;
      if (v145 == (_DWORD)v144)
      {
        if (v143 != v137)
        {
          if (v134 >= v139)
            goto LABEL_223;
          v146 = *(unsigned int *)(v133 + 4 * v134);
          v134 = v146 >> 8;
          v131 = 2;
          v130 = v144;
          v132 = v137 + 1;
          v135 = v144;
          if (v143 + 2 != v138)
          {
            v135 = v146;
            v130 = v144;
            v132 = v143 + 2;
            if (v146 == (_DWORD)v144)
            {
              if (v134 >= v139)
              {
LABEL_223:
                v62 = 0;
                v12 = *(uint64_t **)state;
                goto LABEL_224;
              }
              v147 = *(unsigned int *)(v133 + 4 * v134);
              v148 = v147 >> 8;
              v131 = 3;
              v130 = v144;
              v132 = v137 + 1;
              v135 = v144;
              v134 = v147 >> 8;
              if (v143 + 3 != v138)
              {
                v135 = v147;
                v130 = v144;
                v132 = v143 + 3;
                v134 = v147 >> 8;
                if (v147 == (_DWORD)v144)
                {
                  if (v148 < v139)
                  {
                    v149 = *(unsigned int *)(v133 + 4 * v148);
                    if (*(_DWORD *)(v133 + 4 * v148) >> 8 < v139)
                    {
                      v131 = *(_DWORD *)(v133 + 4 * v148) + 4;
                      v135 = *(_DWORD *)(v133 + 4 * (v149 >> 8));
                      LODWORD(v134) = *(_DWORD *)(v133 + 4 * (v149 >> 8)) >> 8;
                      v132 = v143 + 5;
                      v130 = v144;
                      goto LABEL_194;
                    }
                  }
                  goto LABEL_223;
                }
              }
            }
          }
          goto LABEL_194;
        }
        v130 = v144;
        v135 = v144;
      }
      else
      {
        v130 = v144;
      }
LABEL_201:
      if (!v141)
      {
        v131 = 1;
        goto LABEL_219;
      }
      *v140++ = v130;
      --v141;
    }
  }
  if (v141)
  {
    v142 = 0;
    do
    {
      if (v131 - 1 == (_DWORD)v142)
      {
        v141 -= v142;
        v140 += v142;
        goto LABEL_201;
      }
      v140[v142++] = v130;
    }
    while (v141 != (_DWORD)v142);
    v141 = 0;
    v140 += v142;
    v131 -= v142;
  }
LABEL_219:
  v12 = *(uint64_t **)state;
  v150 = *(_DWORD *)(*(_QWORD *)state + 36);
  v151 = v136 - v141;
  *(_DWORD *)(*(_QWORD *)state + 36) = v150 + v151;
  if (__CFADD__(v150, v151))
    ++*((_DWORD *)v12 + 10);
  *((_BYTE *)state + 12) = v130;
  state[4] = v131;
  state[273] = v132;
  *((_QWORD *)state + 394) = v133;
  state[15] = v134;
  state[16] = v135;
  v12[3] = (uint64_t)v140;
  v62 = 1;
  *((_DWORD *)v12 + 8) = v141;
LABEL_224:
  v152 = v10;
  v153 = v12[3] - (_DWORD)v13;
  if (v153 >= 16)
  {
    sub_1DF266328(state[796], v13, v153 & 0xFFFFFFF0, v1, v2, v3, v4);
    state[796] = v154;
    v13 = (int8x16_t *)((char *)v13 + (v153 & 0xFFFFFFF0));
    v153 &= 0xFu;
  }
  if (v153)
  {
    v155 = state[796];
    do
    {
      v156 = v13->u8[0];
      v13 = (int8x16_t *)((char *)v13 + 1);
      v155 = dword_1DF26D0F0[v156 ^ HIBYTE(v155)] ^ (v155 << 8);
      state[796] = v155;
      --v153;
    }
    while (v153);
  }
  if (!v62)
    return -4;
  if (state[273] != *v7 + 1 || state[4])
    return 0;
  v157 = ~state[796];
  state[796] = v157;
  v158 = state[13];
  if (v158 > 2)
  {
    fprintf(*v11, " {0x%08x, 0x%08x}", state[794], v157);
    v158 = state[13];
  }
  v10 = v152;
  if (v158 >= 2)
    fputc(93, *v11);
  v159 = state[796];
  if (v159 == state[794])
  {
    state[797] = v159 ^ __ROR4__(state[797], 31);
    state[2] = 14;
    goto LABEL_238;
  }
  return -4;
}

int BZ2_bzDecompressInit(bz_stream *strm, int verbosity, int small)
{
  int result;
  char v5;
  uint64_t (*bzalloc)(void *, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;

  result = -2;
  if (verbosity <= 4)
  {
    if (strm)
    {
      v5 = small;
      if (small <= 1)
      {
        bzalloc = (uint64_t (*)(void *, uint64_t, uint64_t))strm->bzalloc;
        if (!bzalloc)
        {
          bzalloc = (uint64_t (*)(void *, uint64_t, uint64_t))sub_1DF262660;
          strm->bzalloc = (void *(__cdecl *)(void *, int, int))sub_1DF262660;
        }
        if (!strm->bzfree)
          strm->bzfree = (void (__cdecl *)(void *, void *))sub_1DF2681A4;
        v8 = bzalloc(strm->opaque, 64144, 1);
        if (v8)
        {
          v9 = v8;
          result = 0;
          *(_DWORD *)(v9 + 8) = 10;
          *(_QWORD *)v9 = strm;
          strm->state = (void *)v9;
          *(_QWORD *)(v9 + 32) = 0;
          *(_DWORD *)(v9 + 3188) = 0;
          *(_QWORD *)&strm->total_in_lo32 = 0;
          *(_QWORD *)&strm->total_out_lo32 = 0;
          *(_BYTE *)(v9 + 44) = v5;
          *(_QWORD *)(v9 + 3152) = 0;
          *(_QWORD *)(v9 + 3168) = 0;
          *(_QWORD *)(v9 + 3160) = 0;
          *(_DWORD *)(v9 + 48) = 0;
          *(_DWORD *)(v9 + 52) = verbosity;
        }
        else
        {
          return -3;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1DF263764(uint64_t **a1)
{
  unsigned int *v2;
  uint64_t *v3;
  int v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  unsigned int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int i;
  uint64_t n;
  int v25;
  unsigned int v26;
  uint64_t result;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  unsigned int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  uint64_t *v57;
  int v58;
  uint64_t v59;
  int v60;
  int v61;
  int v62;
  uint64_t v63;
  unsigned int v64;
  int v65;
  uint64_t v66;
  unsigned int v67;
  int v68;
  uint64_t v69;
  unsigned int v70;
  int v71;
  uint64_t v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  unsigned __int8 *v78;
  unsigned __int8 *v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  unsigned int v83;
  uint64_t *v84;
  int v85;
  uint64_t v86;
  int v87;
  unsigned int v88;
  unsigned int v89;
  uint64_t *v90;
  int v91;
  uint64_t v92;
  unsigned int v93;
  uint64_t *v94;
  int v95;
  uint64_t v96;
  unsigned int v97;
  uint64_t *v98;
  int v99;
  uint64_t v100;
  unsigned int v101;
  uint64_t *v102;
  int v103;
  uint64_t v104;
  unsigned int v105;
  uint64_t *v106;
  int v107;
  uint64_t v108;
  int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  int v114;
  int v115;
  int v116;
  unsigned int v117;
  uint64_t *v118;
  int v119;
  uint64_t v120;
  unsigned int v121;
  uint64_t *v122;
  int v123;
  uint64_t v124;
  unsigned int v125;
  uint64_t *v126;
  int v127;
  uint64_t v128;
  unsigned int v129;
  uint64_t *v130;
  int v131;
  uint64_t v132;
  unsigned int v133;
  uint64_t *v134;
  int v135;
  uint64_t v136;
  unsigned int v137;
  uint64_t *v138;
  int v139;
  uint64_t v140;
  unsigned int v141;
  uint64_t *v142;
  int v143;
  uint64_t v144;
  unsigned int v145;
  uint64_t *v146;
  int v147;
  uint64_t v148;
  int v149;
  uint64_t *v150;
  int v151;
  uint64_t v152;
  unsigned int v153;
  uint64_t *v154;
  int v155;
  uint64_t v156;
  unsigned int v157;
  uint64_t *v158;
  int v159;
  uint64_t v160;
  unsigned int v161;
  uint64_t *v162;
  int v163;
  uint64_t v164;
  unsigned int v165;
  uint64_t *v166;
  int v167;
  uint64_t v168;
  unsigned int v169;
  uint64_t *v170;
  int v171;
  uint64_t v172;
  unsigned int v173;
  uint64_t *v174;
  int v175;
  uint64_t v176;
  unsigned int v177;
  uint64_t *v178;
  int v179;
  uint64_t v180;
  unsigned int v181;
  uint64_t *v182;
  int v183;
  uint64_t v184;
  int v185;
  int v186;
  unsigned int v187;
  uint64_t *v188;
  int v189;
  uint64_t v190;
  int v191;
  unsigned int v192;
  uint64_t *v193;
  int v194;
  uint64_t v195;
  unsigned int v196;
  int v197;
  unsigned int v198;
  int v199;
  int k;
  uint64_t v201;
  unsigned int v202;
  int v203;
  int v204;
  unsigned int v205;
  int v206;
  int v207;
  int v208;
  unsigned int v209;
  unsigned int v210;
  unsigned int v211;
  uint64_t v212;
  int v213;
  uint64_t v214;
  int *v215;
  int64_t v216;
  int64_t v217;
  uint64_t v218;
  uint64_t v219;
  BOOL v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t *v232;
  unsigned int v233;
  uint64_t *v234;
  int v235;
  int v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  int *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t **v244;
  int v245;
  uint64_t *v246;
  int v247;
  uint64_t v248;
  unsigned int v249;
  int v250;
  uint64_t m;
  int v252;
  int v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  int v257;
  uint64_t v258;
  int v259;
  uint64_t v260;
  int v261;
  int v262;
  int v263;
  uint64_t *v264;
  int v265;
  int v266;
  uint64_t ii;
  uint64_t v268;
  uint64_t *v269;
  uint64_t v270;
  unsigned int v271;
  uint64_t *v272;
  uint64_t v273;
  int v274;
  int v275;
  int v276;
  unsigned int v277;
  uint64_t *v278;
  unint64_t v279;
  int v280;
  uint64_t *v281;
  unint64_t v282;
  int v283;
  int v284;
  int v285;
  int v286;
  int v287;
  uint64_t v288;
  int v289;
  int v290;
  unsigned int v291;
  int v292;
  uint64_t v293;
  uint64_t *v294;
  uint64_t v295;
  unint64_t v296;
  unsigned int v297;
  int v298;
  int v299;
  int v300;
  int v301;
  unsigned int v302;
  uint64_t **v303;
  int v304;
  uint64_t *v305;
  int v306;
  uint64_t v307;
  unsigned int v308;
  unsigned int v309;
  uint64_t *v310;
  int v311;
  uint64_t v312;
  unsigned int v313;
  int v314;
  uint64_t v315;
  int v316;
  uint64_t v317;
  BOOL v318;
  int v319;
  unsigned int v320;
  uint64_t *v321;
  int v322;
  uint64_t v323;
  unsigned int v324;
  int v325;
  uint64_t v326;
  int v327;
  unsigned int v328;
  uint64_t *v329;
  int v330;
  uint64_t v331;
  int v332;
  unsigned int v333;
  uint64_t *v334;
  int v335;
  uint64_t v336;
  int v337;
  int v338;
  unsigned int v339;
  uint64_t *v340;
  int v341;
  uint64_t v342;
  int v343;
  int v344;
  int v345;
  int v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  char v350;
  int j;
  int v352;
  unsigned int v353;
  uint64_t *v354;
  int v355;
  uint64_t v356;
  int v357;
  uint64_t v358;
  unsigned __int8 *v359;
  uint64_t v360;
  uint64_t v361;
  int v362;
  int v363;
  uint64_t v364;
  unsigned __int8 *v365;
  int v366;
  int v367;
  uint64_t v368;
  int v369;
  int v370;
  uint64_t v371;
  int v372;
  int8x16_t v373;
  uint64_t **v374;
  int v375;
  uint64_t *v376;
  int v377;
  uint64_t v378;
  unsigned int v379;
  int v380;
  unsigned int v381;
  uint64_t *v382;
  int v383;
  uint64_t v384;
  unsigned int v385;
  uint64_t *v386;
  int v387;
  uint64_t v388;
  int v389;
  int v390;
  int v391;
  unsigned int v392;
  int v393;
  int v394;
  int v395;
  int v396;
  int v397;
  int v398;
  int v399;
  int v400;
  unsigned int v401;
  unsigned int v402;
  unsigned int v403;
  int v404;
  int v405;
  int v406;
  unsigned int v407;
  int v408;
  int v409;
  int v410;
  int v411;
  int v412;
  int v413;
  uint64_t *v414;
  uint64_t *v415;
  uint64_t *v416;
  int v417;
  int v418;
  int v419;
  int v420;
  int v421;
  int v422;
  int v423;
  int v424;
  unsigned int v425;
  uint64_t *v426;
  uint64_t *v427;
  uint64_t *v428;
  uint64_t *v429;
  int v430;
  int v431;
  int v432;
  int v433;
  uint64_t *v434;
  uint64_t *v435;
  uint64_t *v436;
  uint64_t *v437;
  unsigned __int8 *v438;
  uint64_t v439;
  int v440;
  int v441;
  int v442;
  _BYTE v443[14];

  v2 = (unsigned int *)a1 + 16009;
  v3 = *a1;
  v4 = *((_DWORD *)a1 + 2) - 10;
  if (*((_DWORD *)a1 + 2) == 10)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v441 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v439 = 0;
    v21 = 0;
    v22 = 0;
    v440 = 0;
    i = 0;
    n = 0;
    *((_OWORD *)a1 + 4008) = 0u;
    *(_OWORD *)((char *)a1 + 64100) = 0u;
    *(_OWORD *)((char *)a1 + 64116) = 0u;
    *(_OWORD *)((char *)a1 + 64068) = 0u;
    *(_OWORD *)((char *)a1 + 64084) = 0u;
    *(_OWORD *)v2 = 0u;
    *(_OWORD *)((char *)a1 + 64052) = 0u;
  }
  else
  {
    n = *v2;
    i = *((_DWORD *)a1 + 16010);
    v22 = *((unsigned int *)a1 + 16012);
    v21 = *((unsigned int *)a1 + 16013);
    HIDWORD(v439) = *((_DWORD *)a1 + 16014);
    v440 = *((_DWORD *)a1 + 16011);
    v20 = *((unsigned int *)a1 + 16016);
    LODWORD(v439) = *((_DWORD *)a1 + 16015);
    v19 = *((_DWORD *)a1 + 16017);
    v18 = *((_DWORD *)a1 + 16018);
    v17 = *((unsigned int *)a1 + 16019);
    v441 = *((_DWORD *)a1 + 16020);
    v16 = *((_DWORD *)a1 + 16021);
    v15 = *((_DWORD *)a1 + 16022);
    v14 = *((unsigned int *)a1 + 16023);
    v13 = *((unsigned int *)a1 + 16024);
    v12 = *((_DWORD *)a1 + 16025);
    v11 = *((_DWORD *)a1 + 16026);
    v10 = *((unsigned int *)a1 + 16027);
    v9 = *((unsigned int *)a1 + 16028);
    v8 = *((unsigned int *)a1 + 16029);
    v7 = a1[8015];
    v6 = a1[8016];
    v5 = a1[8017];
  }
  v442 = v16;
  v438 = (unsigned __int8 *)a1 + 7884;
  switch(v4)
  {
    case 0:
      *((_DWORD *)a1 + 2) = 10;
      v25 = *((_DWORD *)a1 + 9);
      if (v25 < 8)
      {
        v62 = *((_DWORD *)v3 + 2) - 1;
        do
        {
          if (v62 == -1)
            goto LABEL_8;
          v63 = *v3 + 1;
          v26 = *(unsigned __int8 *)*v3 | (*((_DWORD *)a1 + 8) << 8);
          v25 += 8;
          *((_DWORD *)a1 + 8) = v26;
          *((_DWORD *)a1 + 9) = v25;
          *v3 = v63;
          LODWORD(v63) = *((_DWORD *)v3 + 3);
          *((_DWORD *)v3 + 2) = v62;
          *((_DWORD *)v3 + 3) = v63 + 1;
          if ((_DWORD)v63 == -1)
            ++*((_DWORD *)v3 + 4);
          --v62;
        }
        while (v25 - 8 < 0);
      }
      else
      {
        v26 = *((_DWORD *)a1 + 8);
      }
      v28 = v25 - 8;
      *((_DWORD *)a1 + 9) = v28;
      if ((v26 >> v28) != 66)
        goto LABEL_77;
LABEL_53:
      *((_DWORD *)a1 + 2) = 11;
      if (v28 < 8)
      {
        v65 = *((_DWORD *)v3 + 2) - 1;
        do
        {
          if (v65 == -1)
            goto LABEL_8;
          v66 = *v3 + 1;
          v64 = *(unsigned __int8 *)*v3 | (*((_DWORD *)a1 + 8) << 8);
          v28 += 8;
          *((_DWORD *)a1 + 8) = v64;
          *((_DWORD *)a1 + 9) = v28;
          *v3 = v66;
          LODWORD(v66) = *((_DWORD *)v3 + 3);
          *((_DWORD *)v3 + 2) = v65;
          *((_DWORD *)v3 + 3) = v66 + 1;
          if ((_DWORD)v66 == -1)
            ++*((_DWORD *)v3 + 4);
          --v65;
        }
        while (v28 - 8 < 0);
      }
      else
      {
        v64 = *((_DWORD *)a1 + 8);
      }
      v29 = v28 - 8;
      *((_DWORD *)a1 + 9) = v29;
      if ((v64 >> v29) != 90)
        goto LABEL_77;
LABEL_61:
      *((_DWORD *)a1 + 2) = 12;
      if (v29 < 8)
      {
        v68 = *((_DWORD *)v3 + 2) - 1;
        do
        {
          if (v68 == -1)
            goto LABEL_8;
          v69 = *v3 + 1;
          v67 = *(unsigned __int8 *)*v3 | (*((_DWORD *)a1 + 8) << 8);
          v29 += 8;
          *((_DWORD *)a1 + 8) = v67;
          *((_DWORD *)a1 + 9) = v29;
          *v3 = v69;
          LODWORD(v69) = *((_DWORD *)v3 + 3);
          *((_DWORD *)v3 + 2) = v68;
          *((_DWORD *)v3 + 3) = v69 + 1;
          if ((_DWORD)v69 == -1)
            ++*((_DWORD *)v3 + 4);
          --v68;
        }
        while (v29 - 8 < 0);
      }
      else
      {
        v67 = *((_DWORD *)a1 + 8);
      }
      v30 = v29 - 8;
      *((_DWORD *)a1 + 9) = v30;
      if ((v67 >> v30) != 104)
        goto LABEL_77;
LABEL_69:
      *((_DWORD *)a1 + 2) = 13;
      if (v30 < 8)
      {
        v71 = *((_DWORD *)v3 + 2) - 1;
        do
        {
          if (v71 == -1)
            goto LABEL_8;
          v72 = *v3 + 1;
          v70 = *(unsigned __int8 *)*v3 | (*((_DWORD *)a1 + 8) << 8);
          v30 += 8;
          *((_DWORD *)a1 + 8) = v70;
          *((_DWORD *)a1 + 9) = v30;
          *v3 = v72;
          LODWORD(v72) = *((_DWORD *)v3 + 3);
          *((_DWORD *)v3 + 2) = v71;
          *((_DWORD *)v3 + 3) = v72 + 1;
          if ((_DWORD)v72 == -1)
            ++*((_DWORD *)v3 + 4);
          --v71;
        }
        while (v30 - 8 < 0);
      }
      else
      {
        v70 = *((_DWORD *)a1 + 8);
      }
      v73 = v30 - 8;
      v74 = (v70 >> (v30 - 8));
      *((_DWORD *)a1 + 9) = v73;
      *((_DWORD *)a1 + 10) = v74;
      if ((v74 - 58) < 0xFFFFFFF7)
      {
LABEL_77:
        result = 4294967291;
        goto LABEL_461;
      }
      v411 = n;
      v414 = v7;
      v390 = v13;
      v393 = v15;
      v426 = v6;
      v434 = v5;
      v417 = v9;
      v421 = v20;
      v399 = v19;
      v430 = v11;
      v423 = v14;
      v75 = v21;
      v76 = v22;
      v77 = v74 - 48;
      *((_DWORD *)a1 + 10) = v74 - 48;
      v78 = (unsigned __int8 *)v3[7];
      v79 = (unsigned __int8 *)v3[9];
      if (*((_BYTE *)a1 + 44))
      {
        a1[395] = (uint64_t *)((uint64_t (*)(unsigned __int8 *, _QWORD, uint64_t))v78)(v79, (200000 * v77), 1);
        v80 = ((uint64_t (*)(uint64_t, _QWORD, uint64_t))v3[7])(v3[9], ((100000 * *((_DWORD *)a1 + 10)) >> 1), 1);
        a1[396] = (uint64_t *)v80;
        result = 4294967293;
        LODWORD(v22) = v76;
        LODWORD(v21) = v75;
        if (!a1[395])
        {
          LODWORD(v14) = v423;
          v7 = v414;
          LODWORD(v9) = v417;
          LODWORD(v13) = v390;
          v15 = v393;
          v11 = v430;
          v19 = v399;
          LODWORD(v20) = v421;
          v5 = v434;
          v6 = v426;
          LODWORD(n) = v411;
          goto LABEL_461;
        }
        LODWORD(v14) = v423;
        v7 = v414;
        LODWORD(v9) = v417;
        LODWORD(v13) = v390;
        v15 = v393;
        v11 = v430;
        v19 = v399;
        LODWORD(v20) = v421;
        v5 = v434;
        v6 = v426;
        LODWORD(n) = v411;
        if (!v80)
        {
LABEL_461:
          *v2 = n;
          *((_DWORD *)a1 + 16010) = i;
          *((_DWORD *)a1 + 16011) = v440;
          *((_DWORD *)a1 + 16012) = v22;
          *((_DWORD *)a1 + 16013) = v21;
          *((_DWORD *)a1 + 16014) = HIDWORD(v439);
          *((_DWORD *)a1 + 16015) = v439;
          *((_DWORD *)a1 + 16016) = v20;
          *((_DWORD *)a1 + 16017) = v19;
          *((_DWORD *)a1 + 16018) = v18;
          *((_DWORD *)a1 + 16019) = v17;
          *((_DWORD *)a1 + 16020) = v441;
          *((_DWORD *)a1 + 16021) = v442;
          *((_DWORD *)a1 + 16022) = v15;
          *((_DWORD *)a1 + 16023) = v14;
          *((_DWORD *)a1 + 16024) = v13;
          *((_DWORD *)a1 + 16025) = v12;
          *((_DWORD *)a1 + 16026) = v11;
          *((_DWORD *)a1 + 16027) = v10;
          *((_DWORD *)a1 + 16028) = v9;
          *((_DWORD *)a1 + 16029) = v8;
          a1[8015] = v7;
          a1[8016] = v6;
          a1[8017] = v5;
          return result;
        }
      }
      else
      {
        v81 = ((uint64_t (*)(unsigned __int8 *, _QWORD, uint64_t))v78)(v79, (400000 * v77), 1);
        a1[394] = (uint64_t *)v81;
        LODWORD(v22) = v76;
        LODWORD(v21) = v75;
        LODWORD(v14) = v423;
        v7 = v414;
        LODWORD(v9) = v417;
        LODWORD(v13) = v390;
        v15 = v393;
        v11 = v430;
        v19 = v399;
        LODWORD(v20) = v421;
        v5 = v434;
        v6 = v426;
        LODWORD(n) = v411;
        if (!v81)
        {
          result = 4294967293;
          goto LABEL_461;
        }
      }
LABEL_83:
      *((_DWORD *)a1 + 2) = 14;
      v82 = *((_DWORD *)a1 + 9);
      if (v82 < 8)
      {
        v84 = *a1;
        v85 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v85 == -1)
            goto LABEL_8;
          v86 = *v84 + 1;
          v83 = *(unsigned __int8 *)*v84 | (*((_DWORD *)a1 + 8) << 8);
          v82 += 8;
          *((_DWORD *)a1 + 8) = v83;
          *((_DWORD *)a1 + 9) = v82;
          *v84 = v86;
          LODWORD(v86) = *((_DWORD *)v84 + 3);
          *((_DWORD *)v84 + 2) = v85;
          *((_DWORD *)v84 + 3) = v86 + 1;
          if ((_DWORD)v86 == -1)
            ++*((_DWORD *)v84 + 4);
          --v85;
        }
        while (v82 - 8 < 0);
      }
      else
      {
        v83 = *((_DWORD *)a1 + 8);
      }
      v31 = v82 - 8;
      *((_DWORD *)a1 + 9) = v31;
      v87 = (v83 >> v31);
      if (v87 == 23)
      {
LABEL_94:
        *((_DWORD *)a1 + 2) = 42;
        if (v31 < 8)
        {
          v150 = *a1;
          v151 = *((_DWORD *)*a1 + 2) - 1;
          do
          {
            if (v151 == -1)
              goto LABEL_8;
            v152 = *v150 + 1;
            v89 = *(unsigned __int8 *)*v150 | (*((_DWORD *)a1 + 8) << 8);
            v31 += 8;
            *((_DWORD *)a1 + 8) = v89;
            *((_DWORD *)a1 + 9) = v31;
            *v150 = v152;
            LODWORD(v152) = *((_DWORD *)v150 + 3);
            *((_DWORD *)v150 + 2) = v151;
            *((_DWORD *)v150 + 3) = v152 + 1;
            if ((_DWORD)v152 == -1)
              ++*((_DWORD *)v150 + 4);
            --v151;
          }
          while (v31 - 8 < 0);
        }
        else
        {
          v89 = *((_DWORD *)a1 + 8);
        }
        v49 = v31 - 8;
        *((_DWORD *)a1 + 9) = v49;
        if ((v89 >> v49) == 114)
        {
LABEL_209:
          *((_DWORD *)a1 + 2) = 43;
          if (v49 < 8)
          {
            v154 = *a1;
            v155 = *((_DWORD *)*a1 + 2) - 1;
            do
            {
              if (v155 == -1)
                goto LABEL_8;
              v156 = *v154 + 1;
              v153 = *(unsigned __int8 *)*v154 | (*((_DWORD *)a1 + 8) << 8);
              v49 += 8;
              *((_DWORD *)a1 + 8) = v153;
              *((_DWORD *)a1 + 9) = v49;
              *v154 = v156;
              LODWORD(v156) = *((_DWORD *)v154 + 3);
              *((_DWORD *)v154 + 2) = v155;
              *((_DWORD *)v154 + 3) = v156 + 1;
              if ((_DWORD)v156 == -1)
                ++*((_DWORD *)v154 + 4);
              --v155;
            }
            while (v49 - 8 < 0);
          }
          else
          {
            v153 = *((_DWORD *)a1 + 8);
          }
          v50 = v49 - 8;
          *((_DWORD *)a1 + 9) = v50;
          if ((v153 >> v50) == 69)
          {
LABEL_217:
            *((_DWORD *)a1 + 2) = 44;
            if (v50 < 8)
            {
              v158 = *a1;
              v159 = *((_DWORD *)*a1 + 2) - 1;
              do
              {
                if (v159 == -1)
                  goto LABEL_8;
                v160 = *v158 + 1;
                v157 = *(unsigned __int8 *)*v158 | (*((_DWORD *)a1 + 8) << 8);
                v50 += 8;
                *((_DWORD *)a1 + 8) = v157;
                *((_DWORD *)a1 + 9) = v50;
                *v158 = v160;
                LODWORD(v160) = *((_DWORD *)v158 + 3);
                *((_DWORD *)v158 + 2) = v159;
                *((_DWORD *)v158 + 3) = v160 + 1;
                if ((_DWORD)v160 == -1)
                  ++*((_DWORD *)v158 + 4);
                --v159;
              }
              while (v50 - 8 < 0);
            }
            else
            {
              v157 = *((_DWORD *)a1 + 8);
            }
            v51 = v50 - 8;
            *((_DWORD *)a1 + 9) = v51;
            if ((v157 >> v51) == 56)
            {
LABEL_225:
              *((_DWORD *)a1 + 2) = 45;
              if (v51 < 8)
              {
                v162 = *a1;
                v163 = *((_DWORD *)*a1 + 2) - 1;
                do
                {
                  if (v163 == -1)
                    goto LABEL_8;
                  v164 = *v162 + 1;
                  v161 = *(unsigned __int8 *)*v162 | (*((_DWORD *)a1 + 8) << 8);
                  v51 += 8;
                  *((_DWORD *)a1 + 8) = v161;
                  *((_DWORD *)a1 + 9) = v51;
                  *v162 = v164;
                  LODWORD(v164) = *((_DWORD *)v162 + 3);
                  *((_DWORD *)v162 + 2) = v163;
                  *((_DWORD *)v162 + 3) = v164 + 1;
                  if ((_DWORD)v164 == -1)
                    ++*((_DWORD *)v162 + 4);
                  --v163;
                }
                while (v51 - 8 < 0);
              }
              else
              {
                v161 = *((_DWORD *)a1 + 8);
              }
              v52 = v51 - 8;
              *((_DWORD *)a1 + 9) = v52;
              if ((v161 >> v52) == 80)
              {
LABEL_233:
                *((_DWORD *)a1 + 2) = 46;
                if (v52 < 8)
                {
                  v166 = *a1;
                  v167 = *((_DWORD *)*a1 + 2) - 1;
                  do
                  {
                    if (v167 == -1)
                      goto LABEL_8;
                    v168 = *v166 + 1;
                    v165 = *(unsigned __int8 *)*v166 | (*((_DWORD *)a1 + 8) << 8);
                    v52 += 8;
                    *((_DWORD *)a1 + 8) = v165;
                    *((_DWORD *)a1 + 9) = v52;
                    *v166 = v168;
                    LODWORD(v168) = *((_DWORD *)v166 + 3);
                    *((_DWORD *)v166 + 2) = v167;
                    *((_DWORD *)v166 + 3) = v168 + 1;
                    if ((_DWORD)v168 == -1)
                      ++*((_DWORD *)v166 + 4);
                    --v167;
                  }
                  while (v52 - 8 < 0);
                }
                else
                {
                  v165 = *((_DWORD *)a1 + 8);
                }
                v53 = v52 - 8;
                *((_DWORD *)a1 + 9) = v53;
                if ((v165 >> v53) == 144)
                {
                  *((_DWORD *)a1 + 795) = 0;
LABEL_242:
                  *((_DWORD *)a1 + 2) = 47;
                  if (v53 < 8)
                  {
                    v170 = *a1;
                    v171 = *((_DWORD *)*a1 + 2) - 1;
                    do
                    {
                      if (v171 == -1)
                        goto LABEL_8;
                      v172 = *v170 + 1;
                      v169 = *(unsigned __int8 *)*v170 | (*((_DWORD *)a1 + 8) << 8);
                      v53 += 8;
                      *((_DWORD *)a1 + 8) = v169;
                      *((_DWORD *)a1 + 9) = v53;
                      *v170 = v172;
                      LODWORD(v172) = *((_DWORD *)v170 + 3);
                      *((_DWORD *)v170 + 2) = v171;
                      *((_DWORD *)v170 + 3) = v172 + 1;
                      if ((_DWORD)v172 == -1)
                        ++*((_DWORD *)v170 + 4);
                      --v171;
                    }
                    while (v53 - 8 < 0);
                  }
                  else
                  {
                    v169 = *((_DWORD *)a1 + 8);
                  }
                  v54 = v53 - 8;
                  *((_DWORD *)a1 + 9) = v54;
                  *((_DWORD *)a1 + 795) = (v169 >> v54) | (*((_DWORD *)a1 + 795) << 8);
LABEL_250:
                  *((_DWORD *)a1 + 2) = 48;
                  if (v54 < 8)
                  {
                    v174 = *a1;
                    v175 = *((_DWORD *)*a1 + 2) - 1;
                    do
                    {
                      if (v175 == -1)
                        goto LABEL_8;
                      v176 = *v174 + 1;
                      v173 = *(unsigned __int8 *)*v174 | (*((_DWORD *)a1 + 8) << 8);
                      v54 += 8;
                      *((_DWORD *)a1 + 8) = v173;
                      *((_DWORD *)a1 + 9) = v54;
                      *v174 = v176;
                      LODWORD(v176) = *((_DWORD *)v174 + 3);
                      *((_DWORD *)v174 + 2) = v175;
                      *((_DWORD *)v174 + 3) = v176 + 1;
                      if ((_DWORD)v176 == -1)
                        ++*((_DWORD *)v174 + 4);
                      --v175;
                    }
                    while (v54 - 8 < 0);
                  }
                  else
                  {
                    v173 = *((_DWORD *)a1 + 8);
                  }
                  v55 = v54 - 8;
                  *((_DWORD *)a1 + 9) = v55;
                  *((_DWORD *)a1 + 795) = (v173 >> v55) | (*((_DWORD *)a1 + 795) << 8);
LABEL_258:
                  *((_DWORD *)a1 + 2) = 49;
                  if (v55 < 8)
                  {
                    v178 = *a1;
                    v179 = *((_DWORD *)*a1 + 2) - 1;
                    do
                    {
                      if (v179 == -1)
                        goto LABEL_8;
                      v180 = *v178 + 1;
                      v177 = *(unsigned __int8 *)*v178 | (*((_DWORD *)a1 + 8) << 8);
                      v55 += 8;
                      *((_DWORD *)a1 + 8) = v177;
                      *((_DWORD *)a1 + 9) = v55;
                      *v178 = v180;
                      LODWORD(v180) = *((_DWORD *)v178 + 3);
                      *((_DWORD *)v178 + 2) = v179;
                      *((_DWORD *)v178 + 3) = v180 + 1;
                      if ((_DWORD)v180 == -1)
                        ++*((_DWORD *)v178 + 4);
                      --v179;
                    }
                    while (v55 - 8 < 0);
                  }
                  else
                  {
                    v177 = *((_DWORD *)a1 + 8);
                  }
                  v56 = v55 - 8;
                  *((_DWORD *)a1 + 9) = v56;
                  *((_DWORD *)a1 + 795) = (v177 >> v56) | (*((_DWORD *)a1 + 795) << 8);
LABEL_266:
                  *((_DWORD *)a1 + 2) = 50;
                  if (v56 < 8)
                  {
                    v182 = *a1;
                    v183 = *((_DWORD *)*a1 + 2) - 1;
                    do
                    {
                      if (v183 == -1)
                        goto LABEL_8;
                      v184 = *v182 + 1;
                      v181 = *(unsigned __int8 *)*v182 | (*((_DWORD *)a1 + 8) << 8);
                      v56 += 8;
                      *((_DWORD *)a1 + 8) = v181;
                      *((_DWORD *)a1 + 9) = v56;
                      *v182 = v184;
                      LODWORD(v184) = *((_DWORD *)v182 + 3);
                      *((_DWORD *)v182 + 2) = v183;
                      *((_DWORD *)v182 + 3) = v184 + 1;
                      if ((_DWORD)v184 == -1)
                        ++*((_DWORD *)v182 + 4);
                      --v183;
                    }
                    while (v56 - 8 < 0);
                  }
                  else
                  {
                    v181 = *((_DWORD *)a1 + 8);
                  }
                  v185 = v56 - 8;
                  *((_DWORD *)a1 + 9) = v185;
                  *((_DWORD *)a1 + 795) = (v181 >> v185) | (*((_DWORD *)a1 + 795) << 8);
                  *((_DWORD *)a1 + 2) = 1;
                  result = 4;
                  goto LABEL_461;
                }
              }
            }
          }
        }
        goto LABEL_460;
      }
      if (v87 != 49)
        goto LABEL_460;
LABEL_92:
      *((_DWORD *)a1 + 2) = 15;
      if (v31 < 8)
      {
        v90 = *a1;
        v91 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v91 == -1)
            goto LABEL_8;
          v92 = *v90 + 1;
          v88 = *(unsigned __int8 *)*v90 | (*((_DWORD *)a1 + 8) << 8);
          v31 += 8;
          *((_DWORD *)a1 + 8) = v88;
          *((_DWORD *)a1 + 9) = v31;
          *v90 = v92;
          LODWORD(v92) = *((_DWORD *)v90 + 3);
          *((_DWORD *)v90 + 2) = v91;
          *((_DWORD *)v90 + 3) = v92 + 1;
          if ((_DWORD)v92 == -1)
            ++*((_DWORD *)v90 + 4);
          --v91;
        }
        while (v31 - 8 < 0);
      }
      else
      {
        v88 = *((_DWORD *)a1 + 8);
      }
      v32 = v31 - 8;
      *((_DWORD *)a1 + 9) = v32;
      if ((v88 >> v32) != 65)
        goto LABEL_460;
LABEL_102:
      *((_DWORD *)a1 + 2) = 16;
      if (v32 < 8)
      {
        v94 = *a1;
        v95 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v95 == -1)
            goto LABEL_8;
          v96 = *v94 + 1;
          v93 = *(unsigned __int8 *)*v94 | (*((_DWORD *)a1 + 8) << 8);
          v32 += 8;
          *((_DWORD *)a1 + 8) = v93;
          *((_DWORD *)a1 + 9) = v32;
          *v94 = v96;
          LODWORD(v96) = *((_DWORD *)v94 + 3);
          *((_DWORD *)v94 + 2) = v95;
          *((_DWORD *)v94 + 3) = v96 + 1;
          if ((_DWORD)v96 == -1)
            ++*((_DWORD *)v94 + 4);
          --v95;
        }
        while (v32 - 8 < 0);
      }
      else
      {
        v93 = *((_DWORD *)a1 + 8);
      }
      v33 = v32 - 8;
      *((_DWORD *)a1 + 9) = v33;
      if ((v93 >> v33) != 89)
        goto LABEL_460;
LABEL_110:
      *((_DWORD *)a1 + 2) = 17;
      if (v33 < 8)
      {
        v98 = *a1;
        v99 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v99 == -1)
            goto LABEL_8;
          v100 = *v98 + 1;
          v97 = *(unsigned __int8 *)*v98 | (*((_DWORD *)a1 + 8) << 8);
          v33 += 8;
          *((_DWORD *)a1 + 8) = v97;
          *((_DWORD *)a1 + 9) = v33;
          *v98 = v100;
          LODWORD(v100) = *((_DWORD *)v98 + 3);
          *((_DWORD *)v98 + 2) = v99;
          *((_DWORD *)v98 + 3) = v100 + 1;
          if ((_DWORD)v100 == -1)
            ++*((_DWORD *)v98 + 4);
          --v99;
        }
        while (v33 - 8 < 0);
      }
      else
      {
        v97 = *((_DWORD *)a1 + 8);
      }
      v34 = v33 - 8;
      *((_DWORD *)a1 + 9) = v34;
      if ((v97 >> v34) != 38)
        goto LABEL_460;
LABEL_118:
      *((_DWORD *)a1 + 2) = 18;
      if (v34 < 8)
      {
        v102 = *a1;
        v103 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v103 == -1)
            goto LABEL_8;
          v104 = *v102 + 1;
          v101 = *(unsigned __int8 *)*v102 | (*((_DWORD *)a1 + 8) << 8);
          v34 += 8;
          *((_DWORD *)a1 + 8) = v101;
          *((_DWORD *)a1 + 9) = v34;
          *v102 = v104;
          LODWORD(v104) = *((_DWORD *)v102 + 3);
          *((_DWORD *)v102 + 2) = v103;
          *((_DWORD *)v102 + 3) = v104 + 1;
          if ((_DWORD)v104 == -1)
            ++*((_DWORD *)v102 + 4);
          --v103;
        }
        while (v34 - 8 < 0);
      }
      else
      {
        v101 = *((_DWORD *)a1 + 8);
      }
      v35 = v34 - 8;
      *((_DWORD *)a1 + 9) = v35;
      if ((v101 >> v35) != 83)
        goto LABEL_460;
LABEL_126:
      *((_DWORD *)a1 + 2) = 19;
      if (v35 < 8)
      {
        v106 = *a1;
        v107 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v107 == -1)
            goto LABEL_8;
          v108 = *v106 + 1;
          v105 = *(unsigned __int8 *)*v106 | (*((_DWORD *)a1 + 8) << 8);
          v35 += 8;
          *((_DWORD *)a1 + 8) = v105;
          *((_DWORD *)a1 + 9) = v35;
          *v106 = v108;
          LODWORD(v108) = *((_DWORD *)v106 + 3);
          *((_DWORD *)v106 + 2) = v107;
          *((_DWORD *)v106 + 3) = v108 + 1;
          if ((_DWORD)v108 == -1)
            ++*((_DWORD *)v106 + 4);
          --v107;
        }
        while (v35 - 8 < 0);
      }
      else
      {
        v105 = *((_DWORD *)a1 + 8);
      }
      v109 = v35 - 8;
      *((_DWORD *)a1 + 9) = v109;
      if ((v105 >> v109) != 89)
        goto LABEL_460;
      v110 = *((_DWORD *)a1 + 13);
      v111 = *((_DWORD *)a1 + 12) + 1;
      *((_DWORD *)a1 + 12) = v111;
      if (v110 >= 2)
      {
        v405 = v21;
        v408 = i;
        v427 = v6;
        v435 = v5;
        v418 = v9;
        v402 = v18;
        v397 = v22;
        v112 = v15;
        v431 = v11;
        v113 = v19;
        v424 = v14;
        v114 = v20;
        v115 = v13;
        v412 = n;
        fprintf((FILE *)*MEMORY[0x1E0C80C10], "\n    [%d: huff+mtf ", v111);
        LODWORD(v13) = v115;
        LODWORD(v20) = v114;
        LODWORD(v14) = v424;
        v19 = v113;
        v11 = v431;
        v15 = v112;
        v18 = v402;
        LODWORD(v22) = v397;
        LODWORD(v9) = v418;
        v10 = v10;
        LODWORD(n) = v412;
        v5 = v435;
        LODWORD(v21) = v405;
        i = v408;
        v6 = v427;
      }
      *((_DWORD *)a1 + 794) = 0;
LABEL_137:
      *((_DWORD *)a1 + 2) = 20;
      v116 = *((_DWORD *)a1 + 9);
      if (v116 < 8)
      {
        v118 = *a1;
        v119 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v119 == -1)
            goto LABEL_8;
          v120 = *v118 + 1;
          v117 = *(unsigned __int8 *)*v118 | (*((_DWORD *)a1 + 8) << 8);
          v116 += 8;
          *((_DWORD *)a1 + 8) = v117;
          *((_DWORD *)a1 + 9) = v116;
          *v118 = v120;
          LODWORD(v120) = *((_DWORD *)v118 + 3);
          *((_DWORD *)v118 + 2) = v119;
          *((_DWORD *)v118 + 3) = v120 + 1;
          if ((_DWORD)v120 == -1)
            ++*((_DWORD *)v118 + 4);
          --v119;
        }
        while (v116 - 8 < 0);
      }
      else
      {
        v117 = *((_DWORD *)a1 + 8);
      }
      v36 = v116 - 8;
      *((_DWORD *)a1 + 9) = v36;
      *((_DWORD *)a1 + 794) = (v117 >> v36) | (*((_DWORD *)a1 + 794) << 8);
LABEL_145:
      *((_DWORD *)a1 + 2) = 21;
      if (v36 < 8)
      {
        v122 = *a1;
        v123 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v123 == -1)
            goto LABEL_8;
          v124 = *v122 + 1;
          v121 = *(unsigned __int8 *)*v122 | (*((_DWORD *)a1 + 8) << 8);
          v36 += 8;
          *((_DWORD *)a1 + 8) = v121;
          *((_DWORD *)a1 + 9) = v36;
          *v122 = v124;
          LODWORD(v124) = *((_DWORD *)v122 + 3);
          *((_DWORD *)v122 + 2) = v123;
          *((_DWORD *)v122 + 3) = v124 + 1;
          if ((_DWORD)v124 == -1)
            ++*((_DWORD *)v122 + 4);
          --v123;
        }
        while (v36 - 8 < 0);
      }
      else
      {
        v121 = *((_DWORD *)a1 + 8);
      }
      v37 = v36 - 8;
      *((_DWORD *)a1 + 9) = v37;
      *((_DWORD *)a1 + 794) = (v121 >> v37) | (*((_DWORD *)a1 + 794) << 8);
LABEL_153:
      *((_DWORD *)a1 + 2) = 22;
      if (v37 < 8)
      {
        v126 = *a1;
        v127 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v127 == -1)
            goto LABEL_8;
          v128 = *v126 + 1;
          v125 = *(unsigned __int8 *)*v126 | (*((_DWORD *)a1 + 8) << 8);
          v37 += 8;
          *((_DWORD *)a1 + 8) = v125;
          *((_DWORD *)a1 + 9) = v37;
          *v126 = v128;
          LODWORD(v128) = *((_DWORD *)v126 + 3);
          *((_DWORD *)v126 + 2) = v127;
          *((_DWORD *)v126 + 3) = v128 + 1;
          if ((_DWORD)v128 == -1)
            ++*((_DWORD *)v126 + 4);
          --v127;
        }
        while (v37 - 8 < 0);
      }
      else
      {
        v125 = *((_DWORD *)a1 + 8);
      }
      v38 = v37 - 8;
      *((_DWORD *)a1 + 9) = v38;
      *((_DWORD *)a1 + 794) = (v125 >> v38) | (*((_DWORD *)a1 + 794) << 8);
LABEL_161:
      *((_DWORD *)a1 + 2) = 23;
      if (v38 < 8)
      {
        v130 = *a1;
        v131 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v131 == -1)
            goto LABEL_8;
          v132 = *v130 + 1;
          v129 = *(unsigned __int8 *)*v130 | (*((_DWORD *)a1 + 8) << 8);
          v38 += 8;
          *((_DWORD *)a1 + 8) = v129;
          *((_DWORD *)a1 + 9) = v38;
          *v130 = v132;
          LODWORD(v132) = *((_DWORD *)v130 + 3);
          *((_DWORD *)v130 + 2) = v131;
          *((_DWORD *)v130 + 3) = v132 + 1;
          if ((_DWORD)v132 == -1)
            ++*((_DWORD *)v130 + 4);
          --v131;
        }
        while (v38 - 8 < 0);
      }
      else
      {
        v129 = *((_DWORD *)a1 + 8);
      }
      v39 = v38 - 8;
      *((_DWORD *)a1 + 9) = v39;
      *((_DWORD *)a1 + 794) = (v129 >> v39) | (*((_DWORD *)a1 + 794) << 8);
LABEL_169:
      *((_DWORD *)a1 + 2) = 24;
      if (v39 < 1)
      {
        v134 = *a1;
        v135 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v135 == -1)
            goto LABEL_8;
          v136 = *v134 + 1;
          v133 = *(unsigned __int8 *)*v134 | (*((_DWORD *)a1 + 8) << 8);
          v39 += 8;
          *((_DWORD *)a1 + 8) = v133;
          *((_DWORD *)a1 + 9) = v39;
          *v134 = v136;
          LODWORD(v136) = *((_DWORD *)v134 + 3);
          *((_DWORD *)v134 + 2) = v135;
          *((_DWORD *)v134 + 3) = v136 + 1;
          if ((_DWORD)v136 == -1)
            ++*((_DWORD *)v134 + 4);
          --v135;
        }
        while (v39 - 8 <= -8);
      }
      else
      {
        v133 = *((_DWORD *)a1 + 8);
      }
      v40 = v39 - 1;
      *((_DWORD *)a1 + 9) = v40;
      *((_BYTE *)a1 + 20) = (v133 >> v40) & 1;
      *((_DWORD *)a1 + 14) = 0;
LABEL_177:
      *((_DWORD *)a1 + 2) = 25;
      if (v40 < 8)
      {
        v138 = *a1;
        v139 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v139 == -1)
            goto LABEL_8;
          v140 = *v138 + 1;
          v137 = *(unsigned __int8 *)*v138 | (*((_DWORD *)a1 + 8) << 8);
          v40 += 8;
          *((_DWORD *)a1 + 8) = v137;
          *((_DWORD *)a1 + 9) = v40;
          *v138 = v140;
          LODWORD(v140) = *((_DWORD *)v138 + 3);
          *((_DWORD *)v138 + 2) = v139;
          *((_DWORD *)v138 + 3) = v140 + 1;
          if ((_DWORD)v140 == -1)
            ++*((_DWORD *)v138 + 4);
          --v139;
        }
        while (v40 - 8 < 0);
      }
      else
      {
        v137 = *((_DWORD *)a1 + 8);
      }
      v41 = v40 - 8;
      *((_DWORD *)a1 + 9) = v41;
      *((_DWORD *)a1 + 14) = (v137 >> v41) | (*((_DWORD *)a1 + 14) << 8);
LABEL_185:
      *((_DWORD *)a1 + 2) = 26;
      if (v41 < 8)
      {
        v142 = *a1;
        v143 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v143 == -1)
            goto LABEL_8;
          v144 = *v142 + 1;
          v141 = *(unsigned __int8 *)*v142 | (*((_DWORD *)a1 + 8) << 8);
          v41 += 8;
          *((_DWORD *)a1 + 8) = v141;
          *((_DWORD *)a1 + 9) = v41;
          *v142 = v144;
          LODWORD(v144) = *((_DWORD *)v142 + 3);
          *((_DWORD *)v142 + 2) = v143;
          *((_DWORD *)v142 + 3) = v144 + 1;
          if ((_DWORD)v144 == -1)
            ++*((_DWORD *)v142 + 4);
          --v143;
        }
        while (v41 - 8 < 0);
      }
      else
      {
        v141 = *((_DWORD *)a1 + 8);
      }
      v42 = v41 - 8;
      *((_DWORD *)a1 + 9) = v42;
      *((_DWORD *)a1 + 14) = (v141 >> v42) | (*((_DWORD *)a1 + 14) << 8);
LABEL_193:
      *((_DWORD *)a1 + 2) = 27;
      if (v42 < 8)
      {
        v146 = *a1;
        v147 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v147 == -1)
            goto LABEL_8;
          v148 = *v146 + 1;
          v145 = *(unsigned __int8 *)*v146 | (*((_DWORD *)a1 + 8) << 8);
          v42 += 8;
          *((_DWORD *)a1 + 8) = v145;
          *((_DWORD *)a1 + 9) = v42;
          *v146 = v148;
          LODWORD(v148) = *((_DWORD *)v146 + 3);
          *((_DWORD *)v146 + 2) = v147;
          *((_DWORD *)v146 + 3) = v148 + 1;
          if ((_DWORD)v148 == -1)
            ++*((_DWORD *)v146 + 4);
          --v147;
        }
        while (v42 - 8 < 0);
      }
      else
      {
        v145 = *((_DWORD *)a1 + 8);
      }
      *((_DWORD *)a1 + 9) = v42 - 8;
      v149 = (v145 >> (v42 - 8)) | (*((_DWORD *)a1 + 14) << 8);
      *((_DWORD *)a1 + 14) = v149;
      if (v149 < 0 || v149 > ((100000 * *((_DWORD *)a1 + 10)) | 0xA))
        goto LABEL_460;
      LODWORD(n) = 0;
      while ((int)n < 16)
      {
LABEL_277:
        *((_DWORD *)a1 + 2) = 28;
        v186 = *((_DWORD *)a1 + 9);
        if (v186 < 1)
        {
          v188 = *a1;
          v189 = *((_DWORD *)*a1 + 2) - 1;
          while (v189 != -1)
          {
            v190 = *v188 + 1;
            v187 = *(unsigned __int8 *)*v188 | (*((_DWORD *)a1 + 8) << 8);
            v186 += 8;
            *((_DWORD *)a1 + 8) = v187;
            *((_DWORD *)a1 + 9) = v186;
            *v188 = v190;
            LODWORD(v190) = *((_DWORD *)v188 + 3);
            *((_DWORD *)v188 + 2) = v189;
            *((_DWORD *)v188 + 3) = v190 + 1;
            if ((_DWORD)v190 == -1)
              ++*((_DWORD *)v188 + 4);
            --v189;
            if (v186 - 8 > -8)
              goto LABEL_284;
          }
          goto LABEL_8;
        }
        v187 = *((_DWORD *)a1 + 8);
LABEL_284:
        v191 = v186 - 1;
        *((_DWORD *)a1 + 9) = v191;
        *((_BYTE *)a1 + (int)n + 3452) = (v187 >> v191) & 1;
        LODWORD(n) = n + 1;
      }
      LODWORD(n) = 0;
      *(_OWORD *)((char *)a1 + 3420) = 0u;
      *(_OWORD *)((char *)a1 + 3436) = 0u;
      *(_OWORD *)((char *)a1 + 3388) = 0u;
      *(_OWORD *)((char *)a1 + 3404) = 0u;
      *(_OWORD *)((char *)a1 + 3356) = 0u;
      *(_OWORD *)((char *)a1 + 3372) = 0u;
      *(_OWORD *)((char *)a1 + 3324) = 0u;
      *(_OWORD *)((char *)a1 + 3340) = 0u;
      *(_OWORD *)((char *)a1 + 3292) = 0u;
      *(_OWORD *)((char *)a1 + 3308) = 0u;
      *(_OWORD *)((char *)a1 + 3260) = 0u;
      *(_OWORD *)((char *)a1 + 3276) = 0u;
      *(_OWORD *)((char *)a1 + 3228) = 0u;
      *(_OWORD *)((char *)a1 + 3244) = 0u;
      *(_OWORD *)((char *)a1 + 3196) = 0u;
      *(_OWORD *)((char *)a1 + 3212) = 0u;
      while ((int)n <= 15)
      {
        if (*((_BYTE *)a1 + (int)n + 3452))
        {
          for (i = 0; ; ++i)
          {
            if (i > 15)
              goto LABEL_484;
LABEL_482:
            *((_DWORD *)a1 + 2) = 29;
            v332 = *((_DWORD *)a1 + 9);
            if (v332 < 1)
              break;
            v333 = *((_DWORD *)a1 + 8);
LABEL_490:
            v337 = v332 - 1;
            *((_DWORD *)a1 + 9) = v337;
            if (((v333 >> v337) & 1) != 0)
              *((_BYTE *)&a1[2 * (int)n + 399] + i + 4) = 1;
          }
          v334 = *a1;
          v335 = *((_DWORD *)*a1 + 2) - 1;
          while (v335 != -1)
          {
            v336 = *v334 + 1;
            v333 = *(unsigned __int8 *)*v334 | (*((_DWORD *)a1 + 8) << 8);
            v332 += 8;
            *((_DWORD *)a1 + 8) = v333;
            *((_DWORD *)a1 + 9) = v332;
            *v334 = v336;
            LODWORD(v336) = *((_DWORD *)v334 + 3);
            *((_DWORD *)v334 + 2) = v335;
            *((_DWORD *)v334 + 3) = v336 + 1;
            if ((_DWORD)v336 == -1)
              ++*((_DWORD *)v334 + 4);
            --v335;
            if (v332 - 8 > -8)
              goto LABEL_490;
          }
          goto LABEL_8;
        }
LABEL_484:
        LODWORD(n) = n + 1;
      }
      v325 = 0;
      v326 = 0;
      *((_DWORD *)a1 + 798) = 0;
      do
      {
        if (*((_BYTE *)a1 + v326 + 3196))
        {
          *((_BYTE *)a1 + v325 + 3468) = v326;
          v325 = *((_DWORD *)a1 + 798) + 1;
          *((_DWORD *)a1 + 798) = v325;
        }
        ++v326;
      }
      while (v326 != 256);
      if (!v325)
        goto LABEL_460;
      v22 = (v325 + 2);
LABEL_472:
      *((_DWORD *)a1 + 2) = 30;
      v327 = *((_DWORD *)a1 + 9);
      if (v327 < 3)
      {
        v329 = *a1;
        v330 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v330 == -1)
            goto LABEL_8;
          v331 = *v329 + 1;
          v328 = *(unsigned __int8 *)*v329 | (*((_DWORD *)a1 + 8) << 8);
          v327 += 8;
          *((_DWORD *)a1 + 8) = v328;
          *((_DWORD *)a1 + 9) = v327;
          *v329 = v331;
          LODWORD(v331) = *((_DWORD *)v329 + 3);
          *((_DWORD *)v329 + 2) = v330;
          *((_DWORD *)v329 + 3) = v331 + 1;
          if ((_DWORD)v331 == -1)
            ++*((_DWORD *)v329 + 4);
          --v330;
        }
        while (v327 - 8 <= -6);
      }
      else
      {
        v328 = *((_DWORD *)a1 + 8);
      }
      v43 = v327 - 3;
      LODWORD(v21) = (v328 >> v43) & 7;
      *((_DWORD *)a1 + 9) = v43;
      if (((1 << ((v328 >> v43) & 7)) & 0x83) != 0)
        goto LABEL_460;
LABEL_25:
      *((_DWORD *)a1 + 2) = 31;
      if (v43 < 15)
      {
        v57 = *a1;
        v58 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v58 == -1)
            goto LABEL_8;
          v59 = *v57 + 1;
          v44 = *(unsigned __int8 *)*v57 | (*((_DWORD *)a1 + 8) << 8);
          v43 += 8;
          *((_DWORD *)a1 + 8) = v44;
          *((_DWORD *)a1 + 9) = v43;
          *v57 = v59;
          LODWORD(v59) = *((_DWORD *)v57 + 3);
          *((_DWORD *)v57 + 2) = v58;
          *((_DWORD *)v57 + 3) = v59 + 1;
          if ((_DWORD)v59 == -1)
            ++*((_DWORD *)v57 + 4);
          --v58;
        }
        while (v43 - 8 <= 6);
      }
      else
      {
        v44 = *((_DWORD *)a1 + 8);
      }
      v60 = 0;
      v61 = v43 - 15;
      *((_DWORD *)a1 + 9) = v61;
      HIDWORD(v439) = (v44 >> v61) & 0x7FFF;
      if (!HIDWORD(v439))
      {
        result = 4294967292;
        HIDWORD(v439) = 0;
        goto LABEL_461;
      }
LABEL_493:
      if (v60 < SHIDWORD(v439))
      {
        i = 0;
        LODWORD(n) = v60;
LABEL_495:
        v338 = *((_DWORD *)a1 + 9);
        result = 4294967292;
        while (1)
        {
          *((_DWORD *)a1 + 2) = 32;
          if (v338 < 1)
            break;
          v339 = *((_DWORD *)a1 + 8);
LABEL_503:
          *((_DWORD *)a1 + 9) = --v338;
          if (((v339 >> v338) & 1) == 0)
          {
            if ((int)n <= 18001)
              *((_BYTE *)a1 + (int)n + 25886) = i;
            v60 = n + 1;
            goto LABEL_493;
          }
          if (++i >= (int)v21)
            goto LABEL_461;
        }
        v340 = *a1;
        v341 = *((_DWORD *)*a1 + 2) - 1;
        while (v341 != -1)
        {
          v342 = *v340 + 1;
          v339 = *(unsigned __int8 *)*v340 | (*((_DWORD *)a1 + 8) << 8);
          v338 += 8;
          *((_DWORD *)a1 + 8) = v339;
          *((_DWORD *)a1 + 9) = v338;
          *v340 = v342;
          LODWORD(v342) = *((_DWORD *)v340 + 3);
          *((_DWORD *)v340 + 2) = v341;
          *((_DWORD *)v340 + 3) = v342 + 1;
          if ((_DWORD)v342 == -1)
            ++*((_DWORD *)v340 + 4);
          --v341;
          if (v338 - 8 > -8)
            goto LABEL_503;
        }
        result = 0;
        goto LABEL_461;
      }
      if (SHIDWORD(v439) >= 18002)
        v343 = 18002;
      else
        v343 = HIDWORD(v439);
      if ((int)v21 >= 1)
      {
        v344 = 0;
        do
        {
          v443[v344] = v344;
          ++v344;
        }
        while ((int)v21 > v344);
      }
      if (SHIDWORD(v439) < 1)
      {
        LODWORD(n) = 0;
      }
      else
      {
        v345 = v20;
        v346 = v19;
        v347 = 0;
        if (v343 <= 1)
          v348 = 1;
        else
          v348 = v343;
        LODWORD(n) = v348;
        do
        {
          v349 = *((unsigned __int8 *)a1 + v347 + 25886);
          v350 = v443[v349];
          if (*((_BYTE *)a1 + v347 + 25886))
          {
            do
            {
              v443[v349] = v443[(v349 - 1)];
              --v349;
            }
            while ((_BYTE)v349);
          }
          v443[0] = v350;
          *((_BYTE *)a1 + v347++ + 7884) = v350;
        }
        while (v347 != v348);
        v19 = v346;
        LODWORD(v20) = v345;
      }
      HIDWORD(v439) = v343;
      for (j = 0; ; j = v440 + 1)
      {
        v440 = j;
        if (j >= (int)v21)
          break;
LABEL_528:
        *((_DWORD *)a1 + 2) = 33;
        v352 = *((_DWORD *)a1 + 9);
        if (v352 < 5)
        {
          v354 = *a1;
          v355 = *((_DWORD *)*a1 + 2) - 1;
          do
          {
            if (v355 == -1)
              goto LABEL_8;
            v356 = *v354 + 1;
            v353 = *(unsigned __int8 *)*v354 | (*((_DWORD *)a1 + 8) << 8);
            v352 += 8;
            *((_DWORD *)a1 + 8) = v353;
            *((_DWORD *)a1 + 9) = v352;
            *v354 = v356;
            LODWORD(v356) = *((_DWORD *)v354 + 3);
            *((_DWORD *)v354 + 2) = v355;
            *((_DWORD *)v354 + 3) = v356 + 1;
            if ((_DWORD)v356 == -1)
              ++*((_DWORD *)v354 + 4);
            --v355;
          }
          while (v352 - 8 <= -4);
        }
        else
        {
          v353 = *((_DWORD *)a1 + 8);
        }
        LODWORD(n) = 0;
        v357 = v352 - 5;
        LODWORD(v14) = (v353 >> v357) & 0x1F;
        *((_DWORD *)a1 + 9) = v357;
LABEL_564:
        if ((int)n < (int)v22)
        {
          while (1)
          {
            if ((v14 - 21) < 0xFFFFFFEC)
              goto LABEL_460;
LABEL_567:
            *((_DWORD *)a1 + 2) = 34;
            v380 = *((_DWORD *)a1 + 9);
            if (v380 < 1)
              break;
            v381 = *((_DWORD *)a1 + 8);
LABEL_574:
            v45 = v380 - 1;
            *((_DWORD *)a1 + 9) = v45;
            if (((v381 >> v45) & 1) == 0)
            {
              *((_BYTE *)a1 + 258 * v440 + (int)n + 43888) = v14;
              LODWORD(n) = n + 1;
              goto LABEL_564;
            }
LABEL_575:
            *((_DWORD *)a1 + 2) = 35;
            if (v45 < 1)
            {
              v386 = *a1;
              v387 = *((_DWORD *)*a1 + 2) - 1;
              while (v387 != -1)
              {
                v388 = *v386 + 1;
                v385 = *(unsigned __int8 *)*v386 | (*((_DWORD *)a1 + 8) << 8);
                v45 += 8;
                *((_DWORD *)a1 + 8) = v385;
                *((_DWORD *)a1 + 9) = v45;
                *v386 = v388;
                LODWORD(v388) = *((_DWORD *)v386 + 3);
                *((_DWORD *)v386 + 2) = v387;
                *((_DWORD *)v386 + 3) = v388 + 1;
                if ((_DWORD)v388 == -1)
                  ++*((_DWORD *)v386 + 4);
                --v387;
                if (v45 - 8 > -8)
                  goto LABEL_582;
              }
              goto LABEL_8;
            }
            v385 = *((_DWORD *)a1 + 8);
LABEL_582:
            v389 = v45 - 1;
            *((_DWORD *)a1 + 9) = v389;
            if (((v385 >> v389) & 1) != 0)
              LODWORD(v14) = v14 - 1;
            else
              LODWORD(v14) = v14 + 1;
          }
          v382 = *a1;
          v383 = *((_DWORD *)*a1 + 2) - 1;
          while (v383 != -1)
          {
            v384 = *v382 + 1;
            v381 = *(unsigned __int8 *)*v382 | (*((_DWORD *)a1 + 8) << 8);
            v380 += 8;
            *((_DWORD *)a1 + 8) = v381;
            *((_DWORD *)a1 + 9) = v380;
            *v382 = v384;
            LODWORD(v384) = *((_DWORD *)v382 + 3);
            *((_DWORD *)v382 + 2) = v383;
            *((_DWORD *)v382 + 3) = v384 + 1;
            if ((_DWORD)v384 == -1)
              ++*((_DWORD *)v382 + 4);
            --v383;
            if (v380 - 8 > -8)
              goto LABEL_574;
          }
          goto LABEL_8;
        }
      }
      v429 = v6;
      v433 = v11;
      v392 = v13;
      v396 = v15;
      v407 = v21;
      v410 = i;
      v404 = v8;
      v420 = v9;
      v437 = v5;
      v425 = v14;
      if ((int)v21 < 1)
      {
        v368 = v22;
        v440 = 0;
      }
      else
      {
        v416 = v7;
        v401 = v10;
        v358 = 0;
        v359 = (unsigned __int8 *)(a1 + 5486);
        v360 = v21;
        v361 = v22;
        do
        {
          if ((int)v22 < 1)
          {
            v362 = 0;
            v363 = 32;
          }
          else
          {
            v362 = 0;
            v363 = 32;
            v364 = v361;
            v365 = v359;
            do
            {
              v367 = *v365++;
              v366 = v367;
              if (v362 <= v367)
                v362 = v366;
              if (v363 >= v366)
                v363 = v366;
              --v364;
            }
            while (v364);
          }
          v368 = v22;
          sub_1DF26CE3C((uint64_t **)((char *)&a1[129 * v358 + 5679] + 4), (uint64_t **)((char *)&a1[129 * v358 + 6453] + 4), (uint64_t)&a1[129 * v358 + 7227] + 4, (unsigned __int8 *)a1 + 258 * v358 + 43888, v363, v362, v22);
          v22 = v368;
          *((_DWORD *)a1 + v358++ + 16003) = v363;
          v359 += 258;
        }
        while (v358 != v360);
        v440 = v407;
        v10 = v401;
        v7 = v416;
      }
      v369 = *((_DWORD *)a1 + 798);
      v370 = *((_DWORD *)a1 + 10);
      bzero((char *)a1 + 68, 0x400uLL);
      v371 = 0;
      v17 = (100000 * v370);
      v372 = 4095;
      do
      {
        v373 = vrev64q_s8(vorrq_s8(vdupq_n_s8(16 * (int)v371 - 16), (int8x16_t)xmmword_1DF26D4F0));
        *(int8x16_t *)((char *)a1 + v372 + 3709) = vextq_s8(v373, v373, 8uLL);
        *((_DWORD *)a1 + v371-- + 1970) = v372 - 15;
        v372 -= 16;
      }
      while (v371 != -16);
      LODWORD(v439) = v369 + 1;
      v22 = v368;
      LODWORD(v8) = v404;
      v15 = v396;
      v11 = v433;
      v5 = v437;
      v6 = v429;
      if (SHIDWORD(v439) < 1)
      {
        v441 = 0;
        v19 = 0;
        LODWORD(v20) = 0;
        result = 4294967292;
        LODWORD(n) = 256;
        LODWORD(v21) = v407;
        i = v410;
        LODWORD(v9) = v420;
        LODWORD(v13) = v392;
        LODWORD(v14) = v425;
        goto LABEL_461;
      }
      v441 = 0;
      v20 = 0;
      v9 = *v438;
      v374 = &a1[129 * v9];
      v6 = (uint64_t *)((char *)v374 + 51628);
      v5 = (uint64_t *)((char *)v374 + 57820);
      v7 = (uint64_t *)((char *)v374 + 45436);
      v8 = *((unsigned int *)a1 + v9 + 16003);
      n = 256;
      v19 = 49;
      v12 = *((_DWORD *)a1 + v9 + 16003);
      v21 = v407;
      i = v410;
      v13 = v392;
      v14 = v425;
LABEL_554:
      *((_DWORD *)a1 + 2) = 36;
      v375 = *((_DWORD *)a1 + 9);
      if (v375 < v12)
      {
        v376 = *a1;
        v377 = *((_DWORD *)*a1 + 2) - 1;
        while (v377 != -1)
        {
          v378 = *v376 + 1;
          v379 = *(unsigned __int8 *)*v376 | (*((_DWORD *)a1 + 8) << 8);
          v375 += 8;
          *((_DWORD *)a1 + 8) = v379;
          *((_DWORD *)a1 + 9) = v375;
          *v376 = v378;
          LODWORD(v378) = *((_DWORD *)v376 + 3);
          *((_DWORD *)v376 + 2) = v377;
          *((_DWORD *)v376 + 3) = v378 + 1;
          if ((_DWORD)v378 == -1)
            ++*((_DWORD *)v376 + 4);
          --v377;
          if (v375 >= v12)
            goto LABEL_562;
        }
LABEL_8:
        result = 0;
        goto LABEL_461;
      }
      v379 = *((_DWORD *)a1 + 8);
LABEL_562:
      v46 = v375 - v12;
      v11 = (v379 >> v46) & ~(-1 << v12);
      *((_DWORD *)a1 + 9) = v46;
      while (1)
      {
        if (v12 > 20)
          goto LABEL_460;
        if (v11 <= *((_DWORD *)v7 + v12))
          break;
        ++v12;
LABEL_286:
        *((_DWORD *)a1 + 2) = 37;
        if (v46 < 1)
        {
          v193 = *a1;
          v194 = *((_DWORD *)*a1 + 2) - 1;
          do
          {
            if (v194 == -1)
              goto LABEL_8;
            v195 = *v193 + 1;
            v192 = *(unsigned __int8 *)*v193 | (*((_DWORD *)a1 + 8) << 8);
            v46 += 8;
            *((_DWORD *)a1 + 8) = v192;
            *((_DWORD *)a1 + 9) = v46;
            *v193 = v195;
            LODWORD(v195) = *((_DWORD *)v193 + 3);
            *((_DWORD *)v193 + 2) = v194;
            *((_DWORD *)v193 + 3) = v195 + 1;
            if ((_DWORD)v195 == -1)
              ++*((_DWORD *)v193 + 4);
            --v194;
          }
          while (v46 - 8 <= -8);
        }
        else
        {
          v192 = *((_DWORD *)a1 + 8);
        }
        v10 = (v192 >> --v46) & 1;
        *((_DWORD *)a1 + 9) = v46;
        v11 = (v192 >> v46) & 1 | (2 * v11);
      }
      v196 = v11 - *((_DWORD *)v6 + v12);
      if (v196 > 0x101)
      {
LABEL_460:
        result = 4294967292;
        goto LABEL_461;
      }
      v18 = *((_DWORD *)v5 + v196);
      v197 = v442;
      while (v18 != (_DWORD)v439)
      {
        v198 = v18 - 1;
        if (v18 > 1)
        {
          v442 = v197;
          if (v441 >= (int)v17)
            goto LABEL_460;
          if (v18 > 0x10)
          {
            v214 = v198 >> 4;
            v215 = (int *)a1 + v214 + 1955;
            LODWORD(v216) = *v215;
            v202 = *((unsigned __int8 *)a1 + (v198 & 0xF) + (uint64_t)*v215 + 3724);
            if ((v198 & 0xF) != 0)
            {
              v217 = (int)v216 + (unint64_t)(v198 & 0xF);
              do
              {
                *((_BYTE *)a1 + v217 + 3724) = *((_BYTE *)a1 + v217 + 3723);
                v216 = *v215;
                --v217;
              }
              while (v217 > v216);
            }
            *v215 = v216 + 1;
            v218 = (uint64_t)a1 + 7820;
            do
            {
              v219 = *(int *)(v218 + 4 * v214) - 1;
              *(_DWORD *)(v218 + 4 * v214) = v219;
              v220 = v214-- <= 1;
              *((_BYTE *)a1 + v219 + 3724) = *((_BYTE *)a1 + *((int *)a1 + v214 + 1955) + 3739);
            }
            while (!v220);
            v221 = *((int *)a1 + 1955) - 1;
            *((_DWORD *)a1 + 1955) = v221;
            *((_BYTE *)a1 + v221 + 3724) = v202;
            if (!*((_DWORD *)a1 + 1955))
            {
              v394 = v15;
              v222 = v22;
              v223 = v7;
              v224 = v21;
              v225 = v9;
              v226 = v17;
              v227 = v10;
              v228 = n;
              v229 = v8;
              v230 = v14;
              v231 = v13;
              v232 = v6;
              v233 = v18;
              v234 = v5;
              v235 = v19;
              v236 = 4095;
              v237 = 15;
              do
              {
                v238 = 0;
                v239 = v237;
                v240 = (int *)a1 + v237 + 1955;
                v241 = (uint64_t)a1 + 3724;
                do
                {
                  *(_BYTE *)(v241 + v236) = *(_BYTE *)(v241 + *v240 + 15);
                  ++v238;
                  --v241;
                }
                while ((_DWORD)v238 != 16);
                *v240 = v236 - 15;
                v237 = v239 - 1;
                v236 -= 16;
              }
              while (v239);
              v19 = v235;
              v5 = v234;
              v18 = v233;
              v6 = v232;
              v13 = v231;
              v14 = v230;
              v8 = v229;
              n = v228;
              v10 = v227;
              v17 = v226;
              v9 = v225;
              v21 = v224;
              v7 = v223;
              v22 = v222;
              v15 = v394;
            }
          }
          else
          {
            v201 = *((int *)a1 + 1955);
            v202 = *((unsigned __int8 *)a1 + v201 + v198 + 3724);
            if (v198 < 4)
              goto LABEL_308;
            v203 = v19;
            v204 = v201 - 1;
            v205 = v18;
            do
            {
              v206 = v204 + v205 - 1;
              *((_BYTE *)a1 + (int)(v204 + v205) + 3724) = *((_BYTE *)a1 + v206 + 3724);
              v207 = v204 + v205 - 2;
              *((_BYTE *)a1 + v206 + 3724) = *((_BYTE *)a1 + v207 + 3724);
              v208 = v204 + v205 - 3;
              *((_BYTE *)a1 + v207 + 3724) = *((_BYTE *)a1 + v208 + 3724);
              v209 = v205 - 4;
              *((_BYTE *)a1 + v208 + 3724) = *((_BYTE *)a1 + (int)(v205 - 4 + v204) + 3724);
              v210 = v205 - 5;
              v205 -= 4;
            }
            while (v210 > 3);
            v198 = v209 - 1;
            v19 = v203;
            if (v209 != 1)
            {
LABEL_308:
              v211 = v198 + v201;
              v212 = v198 - 1;
              do
              {
                *((_BYTE *)a1 + v211 + 3724) = *((_BYTE *)a1 + v211 + 3723);
                v213 = v212--;
                --v211;
              }
              while (v213);
            }
            *((_BYTE *)a1 + v201 + 3724) = v202;
          }
          v242 = *((unsigned __int8 *)a1 + v202 + 3468);
          ++*((_DWORD *)a1 + v242 + 17);
          if (*((_BYTE *)a1 + 44))
            *((_WORD *)a1[395] + v441) = v242;
          else
            *((_DWORD *)a1[394] + v441) = v242;
          ++v441;
          v243 = v20;
          if (!v19)
          {
            v243 = (int)v20 + 1;
            if ((int)v243 >= SHIDWORD(v439))
            {
              v19 = 0;
              result = 4294967292;
              LODWORD(v20) = v20 + 1;
              goto LABEL_461;
            }
            v8 = *((unsigned int *)a1 + *((unsigned __int8 *)a1 + v243 + 7884) + 16003);
            v244 = &a1[129 * *((unsigned __int8 *)a1 + v243 + 7884)];
            v7 = (uint64_t *)((char *)v244 + 45436);
            v5 = (uint64_t *)((char *)v244 + 57820);
            v6 = (uint64_t *)((char *)v244 + 51628);
            v19 = 50;
            v9 = *((unsigned __int8 *)a1 + v243 + 7884);
          }
          --v19;
          v12 = v8;
          v20 = v243;
LABEL_330:
          *((_DWORD *)a1 + 2) = 40;
          v245 = *((_DWORD *)a1 + 9);
          if (v245 >= v12)
          {
            v249 = *((_DWORD *)a1 + 8);
          }
          else
          {
            v246 = *a1;
            v247 = *((_DWORD *)*a1 + 2) - 1;
            do
            {
              if (v247 == -1)
                goto LABEL_8;
              v248 = *v246 + 1;
              v249 = *(unsigned __int8 *)*v246 | (*((_DWORD *)a1 + 8) << 8);
              v245 += 8;
              *((_DWORD *)a1 + 8) = v249;
              *((_DWORD *)a1 + 9) = v245;
              *v246 = v248;
              LODWORD(v248) = *((_DWORD *)v246 + 3);
              *((_DWORD *)v246 + 2) = v247;
              *((_DWORD *)v246 + 3) = v248 + 1;
              if ((_DWORD)v248 == -1)
                ++*((_DWORD *)v246 + 4);
              --v247;
            }
            while (v245 < v12);
          }
          v48 = v245 - v12;
          v11 = (v249 >> v48) & ~(-1 << v12);
          *((_DWORD *)a1 + 9) = v48;
          while (1)
          {
            if (v12 > 20)
              goto LABEL_460;
            if (v11 <= *((_DWORD *)v7 + v12))
              break;
            ++v12;
LABEL_447:
            *((_DWORD *)a1 + 2) = 41;
            if (v48 < 1)
            {
              v321 = *a1;
              v322 = *((_DWORD *)*a1 + 2) - 1;
              do
              {
                if (v322 == -1)
                  goto LABEL_8;
                v323 = *v321 + 1;
                v320 = *(unsigned __int8 *)*v321 | (*((_DWORD *)a1 + 8) << 8);
                v48 += 8;
                *((_DWORD *)a1 + 8) = v320;
                *((_DWORD *)a1 + 9) = v48;
                *v321 = v323;
                LODWORD(v323) = *((_DWORD *)v321 + 3);
                *((_DWORD *)v321 + 2) = v322;
                *((_DWORD *)v321 + 3) = v323 + 1;
                if ((_DWORD)v323 == -1)
                  ++*((_DWORD *)v321 + 4);
                --v322;
              }
              while (v48 - 8 <= -8);
            }
            else
            {
              v320 = *((_DWORD *)a1 + 8);
            }
            v10 = (v320 >> --v48) & 1;
            *((_DWORD *)a1 + 9) = v48;
            v11 = (v320 >> v48) & 1 | (2 * v11);
          }
          v324 = v11 - *((_DWORD *)v6 + v12);
          v197 = v442;
          if (v324 > 0x101)
            goto LABEL_460;
          v18 = *((_DWORD *)v5 + v324);
        }
        else
        {
          v199 = -1;
          for (k = 1; ; k = v15)
          {
            if (k >= 0x200000)
            {
              v442 = v199;
              result = 4294967292;
              v15 = k;
              goto LABEL_461;
            }
            v15 = 2 * k;
            if (v18)
              k *= 2;
            v442 = k + v199;
            if (!v19)
            {
              v20 = (int)v20 + 1;
              if ((int)v20 >= SHIDWORD(v439))
              {
                v19 = 0;
                goto LABEL_460;
              }
              v9 = *((unsigned __int8 *)a1 + v20 + 7884);
              v8 = *((unsigned int *)a1 + v9 + 16003);
              v303 = &a1[129 * v9];
              v7 = (uint64_t *)((char *)v303 + 45436);
              v5 = (uint64_t *)((char *)v303 + 57820);
              v6 = (uint64_t *)((char *)v303 + 51628);
              v19 = 50;
            }
            --v19;
            v12 = v8;
LABEL_401:
            *((_DWORD *)a1 + 2) = 38;
            v304 = *((_DWORD *)a1 + 9);
            if (v304 >= v12)
            {
              v308 = *((_DWORD *)a1 + 8);
            }
            else
            {
              v305 = *a1;
              v306 = *((_DWORD *)*a1 + 2) - 1;
              do
              {
                if (v306 == -1)
                  goto LABEL_8;
                v307 = *v305 + 1;
                v308 = *(unsigned __int8 *)*v305 | (*((_DWORD *)a1 + 8) << 8);
                v304 += 8;
                *((_DWORD *)a1 + 8) = v308;
                *((_DWORD *)a1 + 9) = v304;
                *v305 = v307;
                LODWORD(v307) = *((_DWORD *)v305 + 3);
                *((_DWORD *)v305 + 2) = v306;
                *((_DWORD *)v305 + 3) = v307 + 1;
                if ((_DWORD)v307 == -1)
                  ++*((_DWORD *)v305 + 4);
                --v306;
              }
              while (v304 < v12);
            }
            v47 = v304 - v12;
            v11 = (v308 >> v47) & ~(-1 << v12);
            *((_DWORD *)a1 + 9) = v47;
            while (1)
            {
              if (v12 > 20)
                goto LABEL_460;
              if (v11 <= *((_DWORD *)v7 + v12))
                break;
              ++v12;
LABEL_412:
              *((_DWORD *)a1 + 2) = 39;
              if (v47 < 1)
              {
                v310 = *a1;
                v311 = *((_DWORD *)*a1 + 2) - 1;
                do
                {
                  if (v311 == -1)
                    goto LABEL_8;
                  v312 = *v310 + 1;
                  v309 = *(unsigned __int8 *)*v310 | (*((_DWORD *)a1 + 8) << 8);
                  v47 += 8;
                  *((_DWORD *)a1 + 8) = v309;
                  *((_DWORD *)a1 + 9) = v47;
                  *v310 = v312;
                  LODWORD(v312) = *((_DWORD *)v310 + 3);
                  *((_DWORD *)v310 + 2) = v311;
                  *((_DWORD *)v310 + 3) = v312 + 1;
                  if ((_DWORD)v312 == -1)
                    ++*((_DWORD *)v310 + 4);
                  --v311;
                }
                while (v47 - 8 <= -8);
              }
              else
              {
                v309 = *((_DWORD *)a1 + 8);
              }
              v10 = (v309 >> --v47) & 1;
              *((_DWORD *)a1 + 9) = v47;
              v11 = (v309 >> v47) & 1 | (2 * v11);
            }
            v313 = v11 - *((_DWORD *)v6 + v12);
            v199 = v442;
            if (v313 > 0x101)
              goto LABEL_460;
            v18 = *((_DWORD *)v5 + v313);
            if (v18 >= 2)
              break;
          }
          v314 = v442 + 1;
          v315 = *((unsigned __int8 *)a1 + *((unsigned __int8 *)a1 + *((int *)a1 + 1955) + 3724) + 3468);
          *((_DWORD *)a1 + v315 + 17) += v442 + 1;
          if (*((_BYTE *)a1 + 44))
          {
            if ((v442 & 0x80000000) == 0)
            {
              if (v441 <= (int)v17)
                v316 = v17;
              else
                v316 = v441;
              v317 = v441;
              v441 = v316;
              while (v316 != v317)
              {
                *((_WORD *)a1[395] + v317++) = v315;
                v318 = __OFSUB__(v314--, 1);
                if ((v314 < 0) ^ v318 | (v314 == 0))
                  goto LABEL_444;
              }
LABEL_446:
              result = 4294967292;
              v442 = v314;
              goto LABEL_461;
            }
LABEL_445:
            v197 = v442 + 1;
          }
          else
          {
            if (v442 < 0)
              goto LABEL_445;
            if (v441 <= (int)v17)
              v319 = v17;
            else
              v319 = v441;
            v317 = v441;
            v441 = v319;
            do
            {
              if (v319 == v317)
                goto LABEL_446;
              *((_DWORD *)a1[394] + v317++) = v315;
              v318 = __OFSUB__(v314--, 1);
            }
            while (!((v314 < 0) ^ v318 | (v314 == 0)));
LABEL_444:
            v197 = v314;
            v441 = v317;
          }
        }
      }
      v250 = *((_DWORD *)a1 + 14);
      result = 4294967292;
      v442 = v197;
      if (v250 < 0 || v250 >= v441)
      {
        LODWORD(v439) = v18;
        goto LABEL_461;
      }
      v409 = i;
      for (m = 0; m != 256; ++m)
      {
        v252 = *((_DWORD *)a1 + m + 17);
        if (v252 < 0 || v252 > v441)
        {
          result = 4294967292;
          LODWORD(v439) = v18;
          LODWORD(n) = m;
          i = v409;
          goto LABEL_461;
        }
      }
      v253 = v21;
      v254 = 0;
      v255 = (uint64_t)(a1 + 137);
      *((_DWORD *)a1 + 274) = 0;
      do
      {
        *(_OWORD *)((char *)&a1[v254 + 137] + 4) = *(_OWORD *)((char *)&a1[v254 + 8] + 4);
        v254 += 2;
      }
      while (v254 != 128);
      v256 = 0;
      v257 = 0;
      v258 = (uint64_t)a1 + 1100;
      i = v409;
      do
      {
        v257 += *(_DWORD *)(v258 + v256);
        *(_DWORD *)(v258 + v256) = v257;
        v256 += 4;
      }
      while (v256 != 1024);
      for (n = 0; n != 257; ++n)
      {
        v259 = *((_DWORD *)a1 + n + 274);
        if (v259 < 0 || v259 > v441)
          goto LABEL_381;
      }
      v260 = 0;
      v261 = 0;
      do
      {
        v262 = *((_DWORD *)a1 + v260 + 275);
        if (v261 > v262)
        {
          LODWORD(n) = v260 + 1;
LABEL_381:
          result = 4294967292;
          LODWORD(v439) = v18;
          LODWORD(v21) = v253;
          goto LABEL_461;
        }
        ++v260;
        v261 = v262;
      }
      while (v260 != 256);
      v403 = v18;
      v398 = v22;
      v400 = v19;
      v415 = v7;
      v406 = v253;
      *((_DWORD *)a1 + 4) = 0;
      *((_BYTE *)a1 + 12) = 0;
      *((_DWORD *)a1 + 796) = -1;
      *((_DWORD *)a1 + 2) = 2;
      v391 = v13;
      v395 = v15;
      v432 = v11;
      v436 = v5;
      if (*((int *)a1 + 13) >= 2)
      {
        v419 = v9;
        v263 = v20;
        v264 = v6;
        fwrite("rt+rld", 6uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
        LODWORD(v9) = v419;
        LODWORD(v13) = v391;
        v6 = v264;
        v5 = v436;
        LODWORD(v20) = v263;
        v255 = (uint64_t)(a1 + 137);
      }
      v265 = v9;
      v266 = v14;
      if (*((_BYTE *)a1 + 44))
      {
        v422 = v20;
        v428 = v6;
        for (ii = 0; ii != 1028; ii += 4)
          *(_DWORD *)((char *)a1 + ii + 2124) = *(_DWORD *)((char *)a1 + ii + 1096);
        v268 = 0;
        do
        {
          v269 = a1[395];
          v270 = (uint64_t)a1 + 4 * *((unsigned __int8 *)v269 + 2 * v268);
          v271 = *(_DWORD *)(v270 + 2124);
          *((_WORD *)v269 + v268) = v271;
          v272 = a1[396];
          v273 = v268 >> 1;
          v274 = *((_BYTE *)v272 + v273) & 0xF | (16 * HIWORD(v271));
          v275 = *((_BYTE *)v272 + v273) & 0xF0 | HIWORD(v271);
          if ((v268 & 1) != 0)
            LOBYTE(v275) = v274;
          *((_BYTE *)v272 + v273) = v275;
          ++*(_DWORD *)(v270 + 2124);
          ++v268;
        }
        while (v441 != v268);
        v276 = *((_DWORD *)a1 + 14);
        i = *((unsigned __int16 *)a1[395] + v276) | (((*((unsigned __int8 *)a1[396] + (v276 >> 1)) >> (4 * (v276 & 1))) & 0xF) << 16);
        do
        {
          v277 = v276;
          v276 = i;
          v278 = a1[395];
          v279 = i;
          v280 = *((unsigned __int16 *)v278 + i);
          v281 = a1[396];
          v282 = v279 >> 1;
          v283 = *((unsigned __int8 *)v281 + v282) >> (4 * (v276 & 1));
          *((_WORD *)v278 + v276) = v277;
          i = v280 & 0xFFF0FFFF | ((v283 & 0xF) << 16);
          v284 = *((_BYTE *)v281 + v282) & 0xF | (16 * HIWORD(v277));
          v285 = *((_BYTE *)v281 + v282) & 0xF0 | HIWORD(v277);
          if ((v276 & 1) != 0)
            LOBYTE(v285) = v284;
          *((_BYTE *)v281 + v282) = v285;
        }
        while (v276 != *((_DWORD *)a1 + 14));
        *((_DWORD *)a1 + 15) = v276;
        *((_DWORD *)a1 + 273) = 0;
        if (*((_BYTE *)a1 + 20))
        {
          a1[3] = 0;
          v413 = v276;
          if (v276 < (100000 * *((_DWORD *)a1 + 10)))
          {
            v286 = sub_1DF268640(v276, v255);
            *((_DWORD *)a1 + 16) = v286;
            *((_DWORD *)a1 + 15) = *((unsigned __int16 *)a1[395] + *((unsigned int *)a1 + 15)) | (((*((unsigned __int8 *)a1[396] + ((unint64_t)*((unsigned int *)a1 + 15) >> 1)) >> (4 * (*((_DWORD *)a1 + 15) & 1))) & 0xF) << 16);
            ++*((_DWORD *)a1 + 273);
            v287 = *((_DWORD *)a1 + 6);
            if (!v287)
            {
              v288 = *((int *)a1 + 7);
              v287 = dword_1F0473790[v288];
              if ((_DWORD)v288 == 511)
                v289 = 0;
              else
                v289 = v288 + 1;
              *((_DWORD *)a1 + 7) = v289;
            }
            result = 0;
            v290 = v287 - 1;
            *((_DWORD *)a1 + 6) = v290;
            *((_DWORD *)a1 + 16) = v286 ^ (v290 == 1);
            v291 = v403;
            LODWORD(v439) = v403;
            v15 = v395;
            LODWORD(v22) = v398;
            LODWORD(v13) = v391;
            LODWORD(v21) = v406;
            LODWORD(v9) = v265;
            LODWORD(n) = v413;
            v7 = v415;
            goto LABEL_389;
          }
        }
        else if (v276 < (100000 * *((_DWORD *)a1 + 10)))
        {
          v299 = v276;
          v300 = sub_1DF268640(v276, v255);
          LODWORD(n) = v299;
          v301 = v300;
          result = 0;
          *((_DWORD *)a1 + 16) = v301;
          *((_DWORD *)a1 + 15) = *((unsigned __int16 *)a1[395] + *((unsigned int *)a1 + 15)) | (((*((unsigned __int8 *)a1[396]
                                                                                                  + ((unint64_t)*((unsigned int *)a1 + 15) >> 1)) >> (4 * (*((_DWORD *)a1 + 15) & 1))) & 0xF) << 16);
          ++*((_DWORD *)a1 + 273);
          v291 = v403;
          LODWORD(v439) = v403;
          v15 = v395;
          LODWORD(v22) = v398;
          LODWORD(v13) = v391;
          LODWORD(v21) = v406;
          LODWORD(v14) = v266;
          LODWORD(v9) = v265;
          v7 = v415;
LABEL_389:
          v5 = v436;
          v18 = v291;
          v6 = v428;
          v11 = v432;
          v19 = v400;
          LODWORD(v20) = v422;
          goto LABEL_461;
        }
        return 1;
      }
      v292 = 0;
      v293 = 0;
      v294 = a1[394];
      do
      {
        v295 = (uint64_t)a1 + 4 * *((unsigned __int8 *)v294 + 4 * v293);
        *((_DWORD *)v294 + (int)(*(_DWORD *)(v295 + 1096))++) |= v292;
        ++v293;
        v292 += 256;
      }
      while (v441 != v293);
      v296 = (unint64_t)*((unsigned int *)v294 + *((int *)a1 + 14)) >> 8;
      *((_DWORD *)a1 + 15) = v296;
      *((_DWORD *)a1 + 273) = 0;
      if (*((_BYTE *)a1 + 20))
      {
        a1[3] = 0;
        result = 1;
        if (v296 >= 100000 * *((_DWORD *)a1 + 10))
          return result;
        v297 = *((_DWORD *)v294 + v296);
        *((_DWORD *)a1 + 273) = 1;
        v298 = dword_1F0473790[0] - 1;
        *((_DWORD *)a1 + 6) = dword_1F0473790[0] - 1;
        *((_DWORD *)a1 + 7) = 1;
        *((_DWORD *)a1 + 15) = v297 >> 8;
        *((_DWORD *)a1 + 16) = v297 ^ (v298 == 1);
        goto LABEL_393;
      }
      result = 1;
      if (v296 < 100000 * *((_DWORD *)a1 + 10))
      {
        v302 = *((_DWORD *)v294 + v296);
        *((_DWORD *)a1 + 15) = v302 >> 8;
        *((_DWORD *)a1 + 16) = v302;
        *((_DWORD *)a1 + 273) = 1;
LABEL_393:
        LODWORD(v439) = v403;
        LODWORD(n) = v441;
        result = 0;
        v15 = v395;
        LODWORD(v22) = v398;
        i = v409;
        v7 = v415;
        LODWORD(v21) = v406;
        v18 = v403;
        v11 = v432;
        v19 = v400;
        goto LABEL_461;
      }
      return result;
    case 1:
      v28 = *((_DWORD *)a1 + 9);
      goto LABEL_53;
    case 2:
      v29 = *((_DWORD *)a1 + 9);
      goto LABEL_61;
    case 3:
      v30 = *((_DWORD *)a1 + 9);
      goto LABEL_69;
    case 4:
      goto LABEL_83;
    case 5:
      v31 = *((_DWORD *)a1 + 9);
      goto LABEL_92;
    case 6:
      v32 = *((_DWORD *)a1 + 9);
      goto LABEL_102;
    case 7:
      v33 = *((_DWORD *)a1 + 9);
      goto LABEL_110;
    case 8:
      v34 = *((_DWORD *)a1 + 9);
      goto LABEL_118;
    case 9:
      v35 = *((_DWORD *)a1 + 9);
      goto LABEL_126;
    case 10:
      goto LABEL_137;
    case 11:
      v36 = *((_DWORD *)a1 + 9);
      goto LABEL_145;
    case 12:
      v37 = *((_DWORD *)a1 + 9);
      goto LABEL_153;
    case 13:
      v38 = *((_DWORD *)a1 + 9);
      goto LABEL_161;
    case 14:
      v39 = *((_DWORD *)a1 + 9);
      goto LABEL_169;
    case 15:
      v40 = *((_DWORD *)a1 + 9);
      goto LABEL_177;
    case 16:
      v41 = *((_DWORD *)a1 + 9);
      goto LABEL_185;
    case 17:
      v42 = *((_DWORD *)a1 + 9);
      goto LABEL_193;
    case 18:
      goto LABEL_277;
    case 19:
      goto LABEL_482;
    case 20:
      goto LABEL_472;
    case 21:
      v43 = *((_DWORD *)a1 + 9);
      goto LABEL_25;
    case 22:
      goto LABEL_495;
    case 23:
      goto LABEL_528;
    case 24:
      goto LABEL_567;
    case 25:
      v45 = *((_DWORD *)a1 + 9);
      goto LABEL_575;
    case 26:
      goto LABEL_554;
    case 27:
      v46 = *((_DWORD *)a1 + 9);
      goto LABEL_286;
    case 28:
      goto LABEL_401;
    case 29:
      v47 = *((_DWORD *)a1 + 9);
      goto LABEL_412;
    case 30:
      goto LABEL_330;
    case 31:
      v48 = *((_DWORD *)a1 + 9);
      goto LABEL_447;
    case 32:
      v31 = *((_DWORD *)a1 + 9);
      goto LABEL_94;
    case 33:
      v49 = *((_DWORD *)a1 + 9);
      goto LABEL_209;
    case 34:
      v50 = *((_DWORD *)a1 + 9);
      goto LABEL_217;
    case 35:
      v51 = *((_DWORD *)a1 + 9);
      goto LABEL_225;
    case 36:
      v52 = *((_DWORD *)a1 + 9);
      goto LABEL_233;
    case 37:
      v53 = *((_DWORD *)a1 + 9);
      goto LABEL_242;
    case 38:
      v54 = *((_DWORD *)a1 + 9);
      goto LABEL_250;
    case 39:
      v55 = *((_DWORD *)a1 + 9);
      goto LABEL_258;
    case 40:
      v56 = *((_DWORD *)a1 + 9);
      goto LABEL_266;
    default:
      sub_1DF268138(4001);
  }
}

float sub_1DF266328(__int32 a1, int8x16_t *a2, int a3, int8x16_t a4, double a5, int8x16_t a6, int8x16_t a7)
{
  int8x16_t *v7;
  int8x16_t v8;
  int8x16_t v9;
  int8x16_t v10;
  uint64x2_t v11;
  BOOL v12;
  int v13;
  int8x16_t v14;
  int8x16_t v15;
  int8x16_t v16;
  int8x16_t v17;
  int8x16_t v18;
  int8x16_t v19;
  int8x16_t v20;
  int v21;
  int8x16_t *v22;
  int8x16_t v23;
  int8x16_t v24;
  int8x16_t v25;
  int8x16_t v26;
  int8x16_t v27;
  int8x16_t v28;
  int8x16_t v29;
  int8x16_t v30;
  uint64x2_t v31;
  uint64x2_t v32;
  int i;
  int8x16_t v34;
  int8x16_t v35;
  int8x16_t v36;
  uint64x2_t v37;
  int8x16_t v38;
  int8x16_t v39;
  float result;

  v8 = *a2;
  v7 = a2 + 1;
  v9 = veorq_s8(a4, a4);
  v10 = vrev64q_s8(v8);
  v9.i32[3] = a1;
  v11 = (uint64x2_t)veorq_s8(v9, vextq_s8(v10, v10, 8uLL));
  v12 = __OFSUB__(a3, 16);
  v13 = a3 - 16;
  if (!((v13 < 0) ^ v12 | (v13 == 0)))
  {
    if (v13 >= 48)
    {
      v14 = *v7;
      v15 = v7[1];
      v16 = v7[2];
      v7 += 3;
      v17 = vrev64q_s8(v14);
      v18 = vrev64q_s8(v15);
      v19 = vrev64q_s8(v16);
      v20 = vextq_s8(v17, v17, 8uLL);
      a6 = vextq_s8(v18, v18, 8uLL);
      a7 = vextq_s8(v19, v19, 8uLL);
      v12 = __OFSUB__(v13, 112);
      v21 = v13 - 112;
      if (v21 < 0 == v12)
      {
        do
        {
          v23 = *v7;
          v24 = v7[1];
          v22 = v7 + 2;
          v25 = vrev64q_s8(v23);
          v26 = vrev64q_s8(v24);
          v11 = (uint64x2_t)veorq_s8((int8x16_t)vmull_high_p64(v11, qword_1DF26D560), veorq_s8(vextq_s8(v25, v25, 8uLL), (int8x16_t)vmull_p64(v11.u64[0], 0xE6228B11uLL)));
          v20 = veorq_s8((int8x16_t)vmull_high_p64((uint64x2_t)v20, qword_1DF26D560), veorq_s8(vextq_s8(v26, v26, 8uLL), (int8x16_t)vmull_p64(v20.u64[0], 0xE6228B11uLL)));
          v27 = *v22;
          v28 = v22[1];
          v7 = v22 + 2;
          v29 = vrev64q_s8(v27);
          v30 = vrev64q_s8(v28);
          a6 = veorq_s8((int8x16_t)vmull_high_p64((uint64x2_t)a6, qword_1DF26D560), veorq_s8(vextq_s8(v29, v29, 8uLL), (int8x16_t)vmull_p64(a6.u64[0], 0xE6228B11uLL)));
          a7 = veorq_s8((int8x16_t)vmull_high_p64((uint64x2_t)a7, qword_1DF26D560), veorq_s8(vextq_s8(v30, v30, 8uLL), (int8x16_t)vmull_p64(a7.u64[0], 0xE6228B11uLL)));
          v12 = __OFSUB__(v21, 64);
          v21 -= 64;
        }
        while (!((v21 < 0) ^ v12 | (v21 == 0)));
      }
      v31 = (uint64x2_t)veorq_s8((int8x16_t)vmull_high_p64(v11, qword_1DF26D570), veorq_s8((int8x16_t)vmull_p64(v11.u64[0], 0xE8A45605uLL), v20));
      v32 = (uint64x2_t)veorq_s8((int8x16_t)vmull_high_p64(v31, qword_1DF26D570), veorq_s8((int8x16_t)vmull_p64(v31.u64[0], 0xE8A45605uLL), a6));
      v11 = (uint64x2_t)veorq_s8((int8x16_t)vmull_high_p64(v32, qword_1DF26D570), veorq_s8((int8x16_t)vmull_p64(v32.u64[0], 0xE8A45605uLL), a7));
      v13 = v21 + 64;
    }
    v12 = __OFSUB__(v13, 16);
    for (i = v13 - 16; i < 0 == v12; i -= 16)
    {
      v34 = *v7++;
      v35 = vrev64q_s8(v34);
      v11 = (uint64x2_t)veorq_s8((int8x16_t)vmull_high_p64(v11, qword_1DF26D570), veorq_s8((int8x16_t)vmull_p64(v11.u64[0], 0xE8A45605uLL), vextq_s8(v35, v35, 8uLL)));
      v12 = __OFSUB__(i, 16);
    }
  }
  v36 = veorq_s8(a6, a6);
  v37 = (uint64x2_t)veorq_s8(a7, a7);
  *(uint64_t *)((char *)v36.i64 + 4) = v11.i64[0];
  v38 = veorq_s8(v36, (int8x16_t)vmull_high_p64(v11, qword_1DF26D580));
  v37.i32[0] = v38.i32[2];
  v39 = veorq_s8(v38, (int8x16_t)vmull_p64(v37.u64[0], 0x490D678DuLL));
  v37.i32[0] = v39.i32[1];
  v37.i32[2] = vmull_p64(*(unint64_t *)&v37, 0x104D101DFuLL).i32[1];
  LODWORD(result) = veorq_s8(v39, (int8x16_t)vmull_high_p64(v37, qword_1DF26D590)).u32[0];
  return result;
}

int BZ2_bzCompressInit(bz_stream *strm, int blockSize100k, int verbosity, int workFactor)
{
  int result;
  int v8;
  uint64_t (*bzalloc)(void *, uint64_t, uint64_t);
  bz_stream **v10;
  bz_stream **v11;
  uint64_t v12;
  bz_stream *v13;
  bz_stream *v14;

  result = -2;
  if (strm && (blockSize100k - 10) >= 0xFFFFFFF7 && workFactor <= 0xFA)
  {
    if (workFactor)
      v8 = workFactor;
    else
      v8 = 30;
    bzalloc = (uint64_t (*)(void *, uint64_t, uint64_t))strm->bzalloc;
    if (!bzalloc)
    {
      bzalloc = (uint64_t (*)(void *, uint64_t, uint64_t))sub_1DF262660;
      strm->bzalloc = (void *(__cdecl *)(void *, int, int))sub_1DF262660;
    }
    if (!strm->bzfree)
      strm->bzfree = (void (__cdecl *)(void *, void *))sub_1DF2681A4;
    v10 = (bz_stream **)bzalloc(strm->opaque, 55768, 1);
    if (v10)
    {
      v11 = v10;
      *v10 = strm;
      v10[4] = 0;
      v10[5] = 0;
      v10[3] = 0;
      v10[3] = (bz_stream *)((uint64_t (*)(void *, _QWORD, uint64_t))strm->bzalloc)(strm->opaque, (400000 * blockSize100k), 1);
      v11[4] = (bz_stream *)((uint64_t (*)(void *, _QWORD, uint64_t))strm->bzalloc)(strm->opaque, (400000 * blockSize100k + 136), 1);
      v12 = ((uint64_t (*)(void *, uint64_t, uint64_t))strm->bzalloc)(strm->opaque, 262148, 1);
      v11[5] = (bz_stream *)v12;
      v13 = v11[3];
      if (v13)
      {
        v14 = v11[4];
        if (v14 && v12)
        {
          result = 0;
          *((_DWORD *)v11 + 166) = blockSize100k;
          v11[1] = (bz_stream *)0x200000002;
          *((_DWORD *)v11 + 28) = 100000 * blockSize100k - 19;
          *((_DWORD *)v11 + 164) = verbosity;
          *((_DWORD *)v11 + 22) = v8;
          v11[9] = v13;
          v11[10] = 0;
          v11[7] = v13;
          v11[8] = v14;
          strm->state = v11;
          *(_QWORD *)&strm->total_in_lo32 = 0;
          *(_QWORD *)&strm->total_out_lo32 = 0;
          *(bz_stream **)((char *)v11 + 92) = (bz_stream *)256;
          *((_DWORD *)v11 + 27) = 0;
          *(bz_stream **)((char *)v11 + 116) = 0;
          v11[81] = (bz_stream *)0xFFFFFFFFLL;
          *((_OWORD *)v11 + 8) = 0u;
          *((_OWORD *)v11 + 9) = 0u;
          *((_OWORD *)v11 + 10) = 0u;
          *((_OWORD *)v11 + 11) = 0u;
          *((_OWORD *)v11 + 12) = 0u;
          *((_OWORD *)v11 + 13) = 0u;
          *((_OWORD *)v11 + 14) = 0u;
          *((_OWORD *)v11 + 15) = 0u;
          *((_OWORD *)v11 + 16) = 0u;
          *((_OWORD *)v11 + 17) = 0u;
          *((_OWORD *)v11 + 18) = 0u;
          *((_OWORD *)v11 + 19) = 0u;
          *((_OWORD *)v11 + 20) = 0u;
          *((_OWORD *)v11 + 21) = 0u;
          *((_OWORD *)v11 + 22) = 0u;
          *((_OWORD *)v11 + 23) = 0u;
          *((_DWORD *)v11 + 165) = 1;
          return result;
        }
        ((void (*)(void *))strm->bzfree)(strm->opaque);
      }
      if (v11[4])
        ((void (*)(void *))strm->bzfree)(strm->opaque);
      if (v11[5])
        ((void (*)(void *))strm->bzfree)(strm->opaque);
      ((void (*)(void *, bz_stream **))strm->bzfree)(strm->opaque, v11);
    }
    return -3;
  }
  return result;
}

int BZ2_bzDecompressEnd(bz_stream *strm)
{
  bz_stream **state;
  int result;

  if (!strm)
    return -2;
  state = (bz_stream **)strm->state;
  if (!state || *state != strm)
    return -2;
  if (state[394])
    ((void (*)(void *))strm->bzfree)(strm->opaque);
  if (state[395])
    ((void (*)(void *))strm->bzfree)(strm->opaque);
  if (state[396])
    ((void (*)(void *))strm->bzfree)(strm->opaque);
  ((void (*)(void *, void *))strm->bzfree)(strm->opaque, strm->state);
  result = 0;
  strm->state = 0;
  return result;
}

void sub_1DF2666EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int *v3;
  uint64_t v4;
  int v5;
  int v6;
  unint64_t v7;
  unsigned __int8 *v8;
  int v9;
  FILE **v10;
  unsigned __int8 *v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  unsigned int v20;
  uint64_t i;
  uint64_t j;
  uint64_t v23;
  _DWORD *v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  int v35;
  unsigned int v36;
  uint64_t v37;
  int v38;
  unsigned int v39;
  uint64_t v40;
  int v41;
  unsigned int v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t k;
  unint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  int32x4_t v51;
  int32x4_t v52;
  int v53;
  int v54;
  int v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  int v59;
  unsigned int v60;
  int v61;
  int v62;
  uint64_t v63;
  BOOL v64;
  unsigned int v65;
  unint64_t v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  unsigned int v73;
  FILE **v74;
  unsigned int v75;
  uint64_t m;
  int v77;
  int v78;
  uint64_t v79;
  int v80;
  int v81;
  BOOL v82;
  unsigned int v83;
  unsigned int v84;
  unsigned int v85;
  unsigned int v86;
  unsigned int v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  int v91;
  int v92;
  int *v93;
  uint64_t v94;
  int v95;
  unsigned int v96;
  int v97;
  uint64_t v98;
  int v99;
  unsigned int v100;
  int v101;
  uint64_t v102;
  int v103;
  uint64_t v104;
  uint64_t v105;
  int v106;
  int v107;
  uint64_t v108;
  int v109;
  int v110;
  int v111;
  uint64_t v112;
  int v113;
  int v114;
  int v115;
  uint64_t v116;
  int v117;
  int v118;
  int v119;
  uint64_t v120;
  int v121;
  int *v122;
  int *v123;
  unsigned int v124;
  int v125;
  int v126;
  int v127;
  int *v128;
  int *v129;
  unsigned int v130;
  int v131;
  int v132;
  int v133;
  int v134;
  int v135;
  BOOL v136;
  int v137;
  int v138;
  int v139;
  int v140;
  BOOL v141;
  int v142;
  int v143;
  int v144;
  int v145;
  BOOL v146;
  int v147;
  int v148;
  int v149;
  int v150;
  uint64_t v151;
  uint64_t v152;
  int *v153;
  int64_t v154;
  int v155;
  int v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  int v160;
  int v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t n;
  uint64_t v165;
  unint64_t v166;
  uint64_t v167;
  int v168;
  int v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  unint64_t v175;
  uint64_t v176;
  uint64_t v177;
  int v178;
  uint64_t v179;
  int v180;
  uint64_t v181;
  int v182;
  int v183;
  unsigned int v184;
  uint64_t v185;
  int v186;
  unsigned int v187;
  int v188;
  int v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  int v193;
  int v194;
  int v195;
  int v196;
  uint64_t v197;
  int v198;
  int v199;
  uint64_t v200;
  uint64_t v201;
  unsigned __int8 *v202;
  _DWORD v203[513];
  _BYTE v204[1288];
  _DWORD v205[100];
  _DWORD v206[100];
  _DWORD v207[100];
  uint64_t v208;

  v0 = MEMORY[0x1E0C80A78]();
  v1 = v0;
  v208 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(int **)(v0 + 40);
  v4 = *(int *)(v0 + 108);
  v5 = *(_DWORD *)(v0 + 656);
  if ((int)v4 < 10000)
  {
LABEL_2:
    sub_1DF2675DC(*(_QWORD *)(v1 + 24), *(unsigned __int8 **)(v1 + 32), v3, v4, v5);
    goto LABEL_218;
  }
  v6 = *(_DWORD *)(v0 + 88);
  v7 = (v4 + 34) + (unint64_t)(v4 & 1);
  v202 = *(unsigned __int8 **)(v0 + 64);
  v8 = &v202[v7];
  if (v6 <= 1)
    v6 = 1;
  if (v6 >= 0x64)
    LOBYTE(v6) = 100;
  v9 = v4 * ((v6 - 1) / 3u);
  v203[0] = v9;
  v10 = (FILE **)MEMORY[0x1E0C80C10];
  if (v5 >= 4)
    fwrite("        main sort initialise ...\n", 0x21uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
  bzero(v3, 0x40004uLL);
  v11 = v202;
  v12 = *v202;
  v13 = (v4 - 1);
  v182 = v4 - 1;
  do
  {
    v14 = v13;
    *(_WORD *)&v8[2 * v13] = 0;
    v15 = v202[v13];
    ++v3[v12 | (v15 << 8)];
    v16 = v13 - 2;
    v17 = v13 - 1;
    *(_WORD *)&v8[2 * v17] = 0;
    v18 = v202[v17];
    ++v3[v15 | (v18 << 8)];
    *(_WORD *)&v8[2 * v16] = 0;
    v19 = v202[v16];
    ++v3[v18 | (v19 << 8)];
    *(_WORD *)&v8[2 * --v16] = 0;
    v12 = v202[v16];
    v20 = v19 | (v12 << 8);
    ++v3[v20];
    v13 = v14 - 4;
  }
  while (v14 > 6);
  if ((v14 & 0xFFFFFFFC) != 0)
  {
    for (i = (v14 - 4); i != -1; --i)
    {
      *(_WORD *)&v202[2 * i + v7] = 0;
      v20 = (v202[i] << 8) | (v20 >> 8);
      ++v3[v20];
    }
  }
  for (j = 0; j != 34; ++j)
  {
    v202[v4 + j] = v202[j];
    *(_WORD *)&v202[2 * v4 + 2 * j + v7] = 0;
  }
  if (v5 >= 4)
  {
    fwrite("        bucket sorting ...\n", 0x1BuLL, 1uLL, *v10);
    v11 = v202;
  }
  v23 = 0;
  v24 = v3 + 1;
  v25 = *v3;
  do
  {
    v25 += v24[v23];
    v24[v23++] = v25;
  }
  while (v23 != 0x10000);
  v26 = *v11 << 8;
  v27 = -1;
  v28 = 3;
  v29 = -4;
  v30 = -3;
  v31 = -2;
  v32 = (v4 - 1);
  do
  {
    HIDWORD(v33) = v11[v32];
    LODWORD(v33) = v26 << 16;
    v34 = (unsigned __int16)(v33 >> 24);
    v35 = v3[v34] - 1;
    v3[v34] = v35;
    *(_DWORD *)(v2 + 4 * v35) = v4 + v27;
    v36 = (v33 >> 24) << 16;
    HIDWORD(v33) = v11[(v4 + v31)];
    LODWORD(v33) = v36;
    v37 = (unsigned __int16)(v33 >> 24);
    v38 = v3[v37] - 1;
    v3[v37] = v38;
    *(_DWORD *)(v2 + 4 * v38) = v4 + v31;
    v39 = (v33 >> 24) << 16;
    HIDWORD(v33) = v11[(v4 + v30)];
    LODWORD(v33) = v39;
    v40 = (unsigned __int16)(v33 >> 24);
    v41 = v3[v40] - 1;
    v3[v40] = v41;
    *(_DWORD *)(v2 + 4 * v41) = v4 + v30;
    v42 = (v33 >> 24) << 16;
    HIDWORD(v33) = v11[(v4 + v29)];
    LODWORD(v33) = v42;
    v26 = v33 >> 24;
    v43 = (unsigned __int16)(v33 >> 24);
    v44 = v3[v43] - 1;
    v3[v43] = v44;
    *(_DWORD *)(v2 + 4 * v44) = v4 + v29;
    v27 -= 4;
    v28 -= 4;
    v29 -= 4;
    v30 -= 4;
    v31 -= 4;
    v82 = v32 > 6;
    v32 -= 4;
  }
  while (v82);
  if ((int)v4 + v28 >= 4)
  {
    v45 = (v4 + v27);
    for (k = v45; k != -1; --k)
    {
      HIDWORD(v47) = v11[k];
      LODWORD(v47) = v26 << 16;
      v26 = v47 >> 24;
      v48 = (unsigned __int16)(v47 >> 24);
      v49 = v3[v48] - 1;
      v3[v48] = v49;
      *(_DWORD *)(v2 + 4 * v49) = v45;
      LODWORD(v45) = v45 - 1;
    }
  }
  v50 = 0;
  memset(v204, 0, 256);
  v51 = (int32x4_t)xmmword_1DF26D090;
  v52.i64[0] = 0x400000004;
  v52.i64[1] = 0x400000004;
  do
  {
    *(int32x4_t *)&v204[v50 + 264] = v51;
    v51 = vaddq_s32(v51, v52);
    v50 += 16;
  }
  while (v50 != 1024);
  v53 = 364;
  do
  {
    v54 = v53 / 3;
    if (v53 <= 767)
    {
      v55 = 0;
      v56 = v54;
      if (v54 <= 255)
        v57 = 255;
      else
        v57 = v53 / 3;
      v58 = (v57 + 1);
      do
      {
        v59 = *(_DWORD *)&v204[4 * v56 + 264];
        v60 = v3[256 * v59 + 256] - v3[256 * v59];
        v61 = v55;
        while (1)
        {
          v62 = *(_DWORD *)&v204[4 * v61 + 264];
          if (v3[256 * v62 + 256] - v3[256 * v62] <= v60)
            break;
          v63 = v61;
          *(_DWORD *)&v204[4 * v54 + 264 + 4 * v61] = v62;
          v64 = __OFSUB__(v61, v54);
          v61 -= v54;
          if (v61 < 0 != v64)
            goto LABEL_39;
        }
        v63 = v54 + v61;
LABEL_39:
        *(_DWORD *)&v204[4 * v63 + 264] = v59;
        ++v56;
        ++v55;
      }
      while (v56 != v58);
    }
    v65 = v53 - 3;
    v53 /= 3;
  }
  while (v65 > 2);
  v66 = 0;
  v178 = 0;
  v67 = v9;
  v181 = v1;
  v180 = v5;
  v183 = v9;
  v201 = (uint64_t)v8;
  while (2)
  {
    v68 = 0;
    v69 = *(unsigned int *)&v204[4 * v66 + 264];
    v190 = (int)v69;
    v70 = (int)((_DWORD)v69 << 8);
    v175 = v66;
    v179 = v70;
    do
    {
      if (v68 != v69)
      {
        v71 = v68 + v70;
        v72 = v3[v68 + v70];
        if ((v72 & 0x200000) == 0)
        {
          v185 = v68 + v70;
          v73 = v3[v71 + 1] & 0xFFDFFFFF;
          v187 = v72 & 0xFFDFFFFF;
          v184 = v73 - 1;
          if ((int)(v73 - 1) > (int)(v72 & 0xFFDFFFFF))
          {
            v176 = v69;
            v177 = v68;
            v74 = (FILE **)MEMORY[0x1E0C80C10];
            if (v5 >= 4)
            {
              fprintf((FILE *)*MEMORY[0x1E0C80C10], "        qsort [0x%x, 0x%x]   done %d   this %d\n", v69, v68, v178, v73 - v187);
              v11 = v202;
            }
            v207[0] = v187;
            v206[0] = v184;
            v75 = 1;
            v205[0] = 2;
            while (2)
            {
              for (m = v75 - 1; ; v205[m] = v80 + 1)
              {
                if (v75 >= 0x62)
                  sub_1DF268138(1001);
                v77 = v207[m];
                v78 = v206[m];
                v79 = v78;
                v80 = v205[m];
                v81 = v78 - v77;
                v82 = v78 - v77 >= 20 && v80 < 15;
                if (!v82)
                  break;
                v83 = v11[*(_DWORD *)(v2 + 4 * v77) + v80];
                v84 = v11[*(_DWORD *)(v2 + 4 * v78) + v80];
                v85 = v11[*(_DWORD *)(v2 + 4 * ((v78 + v77) >> 1)) + v80];
                if (v83 <= v84)
                  v86 = v11[*(_DWORD *)(v2 + 4 * v78) + v80];
                else
                  v86 = v11[*(_DWORD *)(v2 + 4 * v77) + v80];
                if (v83 >= v84)
                  v83 = v11[*(_DWORD *)(v2 + 4 * v78) + v80];
                if (v83 <= v85)
                  v83 = v11[*(_DWORD *)(v2 + 4 * ((v78 + v77) >> 1)) + v80];
                if (v86 <= v85)
                  v87 = v86;
                else
                  v87 = v83;
                LODWORD(v88) = v206[m];
                LODWORD(v89) = v207[m];
                v90 = v88;
                v91 = v89;
LABEL_68:
                if (v91 <= v90)
                {
                  v89 = (int)v89;
                  do
                  {
                    if (v91 <= v90)
                      v92 = v90;
                    else
                      v92 = v91;
                    v93 = (int *)(v2 + 4 * v91);
                    v94 = v92 - (uint64_t)v91 + 1;
                    while (1)
                    {
                      v95 = *v93;
                      v96 = v11[*v93 + v80];
                      if (v96 == v87)
                        break;
                      if (v96 > v87)
                        goto LABEL_81;
                      ++v91;
                      ++v93;
                      if (!--v94)
                      {
                        v91 = v92 + 1;
                        goto LABEL_81;
                      }
                    }
                    *v93 = *(_DWORD *)(v2 + 4 * v89);
                    *(_DWORD *)(v2 + 4 * v89++) = v95;
                    v97 = v91 + 1;
                    v82 = v90 <= v91++;
                  }
                  while (!v82);
                  v91 = v97;
                }
LABEL_81:
                if (v91 <= v90)
                {
                  v88 = (int)v88;
                  while (2)
                  {
                    v98 = v90;
                    while (1)
                    {
                      v99 = *(_DWORD *)(v2 + 4 * v98);
                      v100 = v11[v99 + v80];
                      if (v100 == v87)
                        break;
                      if (v100 < v87)
                      {
                        v101 = *(_DWORD *)(v2 + 4 * v91);
                        *(_DWORD *)(v2 + 4 * v91) = v99;
                        *(_DWORD *)(v2 + 4 * v98) = v101;
                        ++v91;
                        v90 = v98 - 1;
                        goto LABEL_68;
                      }
                      v82 = v98-- <= v91;
                      if (v82)
                      {
                        if (v90 >= (uint64_t)v91)
                          v90 = v91;
                        --v90;
                        goto LABEL_95;
                      }
                    }
                    *(_DWORD *)(v2 + 4 * v98) = *(_DWORD *)(v2 + 4 * v88);
                    *(_DWORD *)(v2 + 4 * v88--) = v99;
                    v90 = v98 - 1;
                    if (v91 < (int)v98)
                      continue;
                    break;
                  }
                }
LABEL_95:
                if ((int)v88 >= (int)v89)
                {
                  v121 = v91 - v89;
                  if ((int)v89 - v77 < v91 - (int)v89)
                    v121 = v89 - v77;
                  if (v121 >= 1)
                  {
                    v122 = (int *)(v2 + 4 * v77);
                    v123 = (int *)(v2 + 4 * (v91 - v121));
                    v124 = v121 + 1;
                    do
                    {
                      v125 = *v122;
                      *v122++ = *v123;
                      *v123++ = v125;
                      --v124;
                    }
                    while (v124 > 1);
                  }
                  v126 = v78 - v88;
                  v127 = v88 - v90;
                  if (v78 - (int)v88 >= (int)v88 - v90)
                    v126 = v88 - v90;
                  if (v126 >= 1)
                  {
                    v128 = (int *)(v2 + 4 * v91);
                    v129 = (int *)(v2 + 4 + 4 * (v78 - v126));
                    v130 = v126 + 1;
                    do
                    {
                      v131 = *v128;
                      *v128++ = *v129;
                      *v129++ = v131;
                      --v130;
                    }
                    while (v130 > 1);
                  }
                  v132 = v77 - v89 + v91;
                  v133 = v78 - v127;
                  v134 = v132 - 1 - v77;
                  v135 = v78 - (v133 + 1);
                  v136 = v134 < v135;
                  if (v134 >= v135)
                  {
                    v137 = v133 + 1;
                  }
                  else
                  {
                    v135 = v132 - 1 - v77;
                    v137 = v77;
                  }
                  if (v136)
                    v138 = v133 + 1;
                  else
                    v138 = v77;
                  if (v136)
                    v139 = v132 - 1;
                  else
                    v139 = v78;
                  if (!v136)
                    v78 = v132 - 1;
                  v140 = v133 - v132;
                  v141 = v135 < v133 - v132;
                  if (v135 < v133 - v132)
                  {
                    v142 = v137;
                  }
                  else
                  {
                    v140 = v135;
                    v142 = v132;
                  }
                  if (v141)
                  {
                    v143 = v139;
                  }
                  else
                  {
                    v132 = v137;
                    v143 = v133;
                  }
                  if (v141)
                  {
                    v144 = v80;
                  }
                  else
                  {
                    v133 = v139;
                    v144 = v80 + 1;
                  }
                  if (v141)
                    v145 = v80 + 1;
                  else
                    v145 = v80;
                  v146 = v78 - v138 < v140;
                  if (v78 - v138 < v140)
                    v147 = v132;
                  else
                    v147 = v138;
                  if (v146)
                    v148 = v133;
                  else
                    v148 = v78;
                  v207[m] = v147;
                  v206[m] = v148;
                  if (v146)
                    v132 = v138;
                  if (v146)
                    v149 = v145;
                  else
                    v149 = v80;
                  v205[m] = v149;
                  v207[v75] = v132;
                  if (v146)
                  {
                    v150 = v80;
                  }
                  else
                  {
                    v78 = v133;
                    v150 = v145;
                  }
                  v206[v75] = v78;
                  v205[v75] = v150;
                  v151 = 4 * (int)v75 + 4;
                  *(_DWORD *)((char *)v207 + v151) = v142;
                  *(_DWORD *)((char *)v206 + v151) = v143;
                  *(_DWORD *)((char *)v205 + v151) = v144;
                  LODWORD(m) = v75 + 2;
                  goto LABEL_176;
                }
              }
              if (v81 >= 1)
              {
                v102 = 0;
                do
                  v103 = dword_1DF26D0A0[v102++];
                while (v103 <= v81);
                v104 = v102 - 1;
                if ((_DWORD)v104)
                {
                  v105 = v4;
                  v188 = v77 + 2;
                  v189 = v77 + 1;
                  v186 = v207[m];
                  v197 = v79;
                  do
                  {
                    v191 = v104;
                    v192 = v104 - 1;
                    v106 = dword_1DF26D0A0[(v104 - 1)];
                    v107 = v106 + v77;
                    v196 = v188;
                    v198 = v189;
                    v199 = v77;
                    v108 = v106 + v77;
                    while (v108 <= v79)
                    {
                      v200 = v108;
                      v193 = *(_DWORD *)(v2 + 4 * v108);
                      v109 = v199;
                      while (1)
                      {
                        v110 = v106 + v109;
                        v111 = *(_DWORD *)(v2 + 4 * v109);
                        if (!sub_1DF267E8C(v111 + v80, v193 + v80, (uint64_t)v11, v201, v105, v203))
                          break;
                        v112 = v109;
                        *(_DWORD *)(v2 + 4 * v110) = v111;
                        v109 -= v106;
                        v11 = v202;
                        if ((int)v112 < v107)
                          goto LABEL_109;
                      }
                      v112 = v110;
                      v11 = v202;
LABEL_109:
                      *(_DWORD *)(v2 + 4 * v112) = v193;
                      v79 = v197;
                      if (v200 >= v197)
                        break;
                      v194 = *(_DWORD *)(v2 + 4 * v200 + 4);
                      v113 = v198;
                      while (1)
                      {
                        v114 = v106 + v113;
                        v115 = *(_DWORD *)(v2 + 4 * v113);
                        if (!sub_1DF267E8C(v115 + v80, v194 + v80, (uint64_t)v11, v201, v105, v203))
                          break;
                        v116 = v113;
                        *(_DWORD *)(v2 + 4 * v114) = v115;
                        v113 -= v106;
                        v11 = v202;
                        if ((int)v116 < v107)
                          goto LABEL_115;
                      }
                      v116 = v114;
                      v11 = v202;
LABEL_115:
                      *(_DWORD *)(v2 + 4 * v116) = v194;
                      v79 = v197;
                      if (v200 + 2 > v197)
                        break;
                      v195 = *(_DWORD *)(v2 + 4 * (v200 + 2));
                      v117 = v196;
                      while (1)
                      {
                        v118 = v106 + v117;
                        v119 = *(_DWORD *)(v2 + 4 * v117);
                        if (!sub_1DF267E8C(v119 + v80, v195 + v80, (uint64_t)v11, v201, v105, v203))
                          break;
                        v120 = v117;
                        *(_DWORD *)(v2 + 4 * v118) = v119;
                        v117 -= v106;
                        v11 = v202;
                        if ((int)v120 < v107)
                          goto LABEL_121;
                      }
                      v120 = v118;
                      v11 = v202;
LABEL_121:
                      *(_DWORD *)(v2 + 4 * v120) = v195;
                      v108 = v200 + 3;
                      v67 = v203[0];
                      v198 += 3;
                      v199 += 3;
                      v196 += 3;
                      v79 = v197;
                      if ((v203[0] & 0x80000000) != 0)
                      {
                        v1 = v181;
                        LODWORD(v4) = v105;
                        v5 = v180;
                        v74 = (FILE **)MEMORY[0x1E0C80C10];
                        goto LABEL_214;
                      }
                    }
                    v77 = v186;
                    v104 = v192;
                  }
                  while (v191 > 1);
                  v67 = v203[0];
                  v1 = v181;
                  v4 = v105;
                  v5 = v180;
                  v74 = (FILE **)MEMORY[0x1E0C80C10];
                  LODWORD(m) = v75 - 1;
                }
              }
              if (v67 < 0)
                goto LABEL_214;
LABEL_176:
              v75 = m;
              if ((int)m > 0)
                continue;
              break;
            }
            if ((v67 & 0x80000000) == 0)
            {
              v70 = v179;
              v178 = v178 - v187 + v184 + 1;
              v71 = v185;
              v72 = v3[v185];
              v9 = v183;
              v8 = (unsigned __int8 *)v201;
              v69 = v176;
              v68 = v177;
              goto LABEL_180;
            }
LABEL_214:
            v9 = v183;
            goto LABEL_215;
          }
          v71 = v68 + v70;
        }
LABEL_180:
        v3[v71] = v72 | 0x200000;
      }
      ++v68;
    }
    while (v68 != 256);
    if (v204[v190])
      sub_1DF268138(1006);
    v152 = 0;
    v153 = &v3[v190 + 1];
    do
    {
      v203[v152 + 257] = *(v153 - 1) & 0xFFDFFFFF;
      v203[++v152] = (*v153 & 0xFFDFFFFF) - 1;
      v153 += 256;
    }
    while (v152 != 256);
    v154 = v3[v179] & 0xFFFFFFFFFFDFFFFFLL;
    v155 = v203[v190 + 257];
    v11 = v202;
    if ((int)v154 < v155)
    {
      do
      {
        v156 = (v4 & ((*(_DWORD *)(v2 + 4 * v154) - 1) >> 31)) + *(_DWORD *)(v2 + 4 * v154) - 1;
        v157 = v202[v156];
        if (!v204[v157])
        {
          v158 = (int)v203[v157 + 257];
          v203[v157 + 257] = v158 + 1;
          *(_DWORD *)(v2 + 4 * v158) = v156;
          v155 = v203[v190 + 257];
        }
        ++v154;
      }
      while (v154 < v155);
    }
    LODWORD(v159) = (v3[(int)v179 + 256] & 0xFFDFFFFF) - 1;
    v160 = v203[v190 + 1];
    if ((int)v159 > v160)
    {
      v159 = (int)v159;
      do
      {
        v161 = (v4 & ((*(_DWORD *)(v2 + 4 * v159) - 1) >> 31)) + *(_DWORD *)(v2 + 4 * v159) - 1;
        v162 = v202[v161];
        if (!v204[v162])
        {
          v163 = (int)v203[v162 + 1];
          v203[v162 + 1] = v163 - 1;
          *(_DWORD *)(v2 + 4 * v163) = v161;
          v160 = v203[v190 + 1];
        }
        --v159;
      }
      while (v159 > v160);
    }
    if (v155 - 1 != v160 && (v155 || v160 != v182))
      sub_1DF268138(1007);
    for (n = 0; n != 0x10000; n += 256)
      v3[v190 + n] |= 0x200000u;
    v204[v190] = 1;
    if (v175 <= 0xFE)
    {
      v165 = v3[v179];
      v166 = v165 & 0xFFFFFFFFFFDFFFFFLL;
      v167 = (v3[(int)v179 + 256] & 0xFFDFFFFF) - (v165 & 0xFFDFFFFF);
      v168 = -1;
      do
        ++v168;
      while ((int)v167 >> v168 > 65534);
      v169 = v167 - 1;
      if ((int)v167 >= 1)
      {
        v170 = v2 - 4 + 4 * v166;
        do
        {
          v171 = v167 - 1;
          v172 = *(int *)(v170 + 4 * v167);
          *(_WORD *)&v8[2 * v172] = v171 >> v168;
          if ((int)v172 <= 33)
            *(_WORD *)&v8[2 * (int)v172 + 2 * (int)v4] = v171 >> v168;
          v167 = v171;
        }
        while ((unint64_t)(v171 + 1) > 1);
      }
      if (v169 >> v168 >= 0x10000)
        sub_1DF268138(1002);
    }
    v66 = v175 + 1;
    if (v175 != 255)
      continue;
    break;
  }
  v74 = (FILE **)MEMORY[0x1E0C80C10];
  if (v5 > 3)
  {
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "        %d pointers, %d sorted, %d scanned\n", v4, v178, v4 - v178);
    goto LABEL_216;
  }
LABEL_215:
  if (v5 < 3)
    goto LABEL_217;
LABEL_216:
  fprintf(*v74, "      %d work, %d block, ratio %5.2f\n", v9 - v67, v4, (float)((float)(v9 - v67) / (float)(int)v4));
LABEL_217:
  if (v67 < 0)
  {
    if (v5 >= 2)
      fwrite("    too repetitive; using fallback sorting algorithm\n", 0x35uLL, 1uLL, *v74);
    goto LABEL_2;
  }
LABEL_218:
  *(_DWORD *)(v1 + 48) = -1;
  v173 = *(unsigned int *)(v1 + 108);
  if ((int)v173 < 1)
LABEL_222:
    sub_1DF268138(1003);
  v174 = 0;
  while (*(_DWORD *)(v2 + 4 * v174))
  {
    if (v173 == ++v174)
      goto LABEL_222;
  }
  *(_DWORD *)(v1 + 48) = v174;
}

void sub_1DF2675DC(uint64_t a1, unsigned __int8 *a2, void *a3, int a4, int a5)
{
  int v5;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  int v13;
  int v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  int k;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  BOOL v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  uint64_t v41;
  unint64_t v42;
  int v43;
  uint64_t v44;
  int v45;
  int v46;
  BOOL v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  unsigned int v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  int *v58;
  uint64_t v59;
  uint64_t v60;
  unsigned int v61;
  int *v62;
  int v63;
  int *v64;
  int v65;
  int v66;
  int v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  int v72;
  int v73;
  _DWORD *v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  int v82;
  int v83;
  int *v84;
  int *v85;
  unsigned int v86;
  int v87;
  int v88;
  int v89;
  int *v90;
  int *v91;
  unsigned int v92;
  int v93;
  int v94;
  int v95;
  int *v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  uint64_t v102;
  uint64_t v103;
  int v104;
  int v105;
  int v106;
  uint64_t v107;
  int v108;
  int v109;
  int v110;
  _DWORD __dst[256];
  _DWORD __src[257];
  _DWORD v113[100];
  _DWORD v114[100];
  uint64_t v115;

  v5 = a5;
  v115 = *MEMORY[0x1E0C80C00];
  if (a5 >= 4)
    fwrite("        bucket sorting ...\n", 0x1BuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
  v10 = a4;
  bzero(__src, 0x404uLL);
  v109 = a4;
  if (a4 < 1)
  {
    v14 = 0;
  }
  else
  {
    v11 = a4;
    v12 = a2;
    do
    {
      v13 = *v12++;
      ++__src[v13];
      --v11;
    }
    while (v11);
    v14 = __src[0];
  }
  memcpy(__dst, __src, sizeof(__dst));
  for (i = 1; i != 257; ++i)
  {
    v14 += __src[i];
    __src[i] = v14;
  }
  if (a4 >= 1)
  {
    v16 = 0;
    do
    {
      v17 = a2[v16];
      v18 = (int)__src[v17] - 1;
      __src[v17] = v18;
      *(_DWORD *)(a1 + 4 * v18) = v16++;
    }
    while (a4 != v16);
  }
  if (a4 >= -63)
    bzero(a3, 4 * (a4 / 32 + 1) + 4);
  for (j = 0; j != 256; ++j)
    *((_DWORD *)a3 + ((int)__src[j] >> 5)) |= 1 << __src[j];
  for (k = 0; k != 64; k += 2)
  {
    *((_DWORD *)a3 + ((a4 + k) >> 5)) |= 1 << (a4 + k);
    *((_DWORD *)a3 + ((a4 + k + 1) >> 5)) &= ~(1 << (a4 + k + 1));
  }
  v21 = 1;
  v107 = a4;
  v106 = v5;
  do
  {
    while (1)
    {
      if (v5 >= 4)
        fprintf((FILE *)*MEMORY[0x1E0C80C10], "        depth %6d has ", v21);
      if (a4 >= 1)
      {
        v22 = 0;
        v23 = 0;
        do
        {
          if (((*((_DWORD *)a3 + (v22 >> 5)) >> v22) & 1) != 0)
            v23 = v22;
          *(_DWORD *)&a2[4 * (int)((v10 & ((*(_DWORD *)(a1 + 4 * v22) - v21) >> 31)) + *(_DWORD *)(a1 + 4 * v22) - v21)] = v23;
          ++v22;
        }
        while (v10 != v22);
      }
      v108 = v21;
      v24 = 0;
      v25 = 0;
      while (1)
      {
        v26 = v24 - 32;
        v27 = v24 - 1;
        do
        {
          v28 = v26;
          v29 = v27;
          v30 = (1 << v24) & *((_DWORD *)a3 + (v24 >> 5));
          v31 = (v24++ & 0x1F) == 0;
          if (v31)
            break;
          ++v26;
          ++v27;
        }
        while (v30);
        if (v30)
        {
          do
          {
            v32 = v29;
            v28 += 32;
            v29 += 32;
          }
          while (*((_DWORD *)a3 + (v28 >> 5)) == -1);
          do
            ++v32;
          while (((*((_DWORD *)a3 + (v32 >> 5)) >> v32) & 1) != 0);
        }
        else
        {
          v32 = v24 - 1;
        }
        if (v32 > a4)
          break;
        v33 = v32 - 1;
        v34 = v32 - 32;
        v35 = v32 - 1;
        v36 = v32;
        do
        {
          v37 = v34;
          v38 = v35;
          v39 = (1 << v36) & *((_DWORD *)a3 + (v36 >> 5));
          v31 = (v36++ & 0x1F) == 0;
          if (v31)
            break;
          ++v34;
          ++v35;
        }
        while (!v39);
        if (v39)
        {
          v24 = v36 - 1;
        }
        else
        {
          do
          {
            v24 = v38;
            v37 += 32;
            v38 += 32;
          }
          while (!*((_DWORD *)a3 + (v37 >> 5)));
          do
            ++v24;
          while (((*((_DWORD *)a3 + (v24 >> 5)) >> v24) & 1) == 0);
        }
        if (v24 > a4)
          break;
        if (v24 > v32)
        {
          LOWORD(v40) = 0;
          v110 = v25 - v32 + v24 - 1 + 2;
          v114[0] = v32 - 1;
          v113[0] = v24 - 1;
          v41 = 1;
          do
          {
            v42 = v41;
            while (1)
            {
              if (v42 >= 0x63)
                sub_1DF268138(1004);
              v43 = v114[(v42 - 1)];
              v44 = v43;
              v45 = v113[(v42 - 1)];
              if (v45 - v43 > 9)
                break;
              if (v45 != v43)
              {
                v46 = v45 - 4;
                v47 = v45 - v43 < 4 || v46 < v43;
                if (!v47)
                {
                  v48 = v46;
                  v49 = v45;
                  v50 = a1 + 4 * v45;
                  do
                  {
                    v51 = *(int *)(a1 + 4 * v48);
                    v52 = v48;
                    if (v48 <= v45 - 4)
                    {
                      v53 = 0;
                      v54 = *(_DWORD *)&a2[4 * v51];
                      do
                      {
                        v55 = *(unsigned int *)(v50 + 4 * v53);
                        if (v54 <= *(_DWORD *)&a2[4 * v55])
                          break;
                        *(_DWORD *)(a1 + 4 * (v46 + (int)v53)) = v55;
                        v53 += 4;
                      }
                      while (v49 + v53 <= v45);
                      v52 = v46 + v53;
                    }
                    *(_DWORD *)(a1 + 4 * v52) = v51;
                    --v49;
                    --v46;
                    v50 -= 4;
                    v47 = v48-- <= v43;
                  }
                  while (!v47);
                }
                if (v45 > v43)
                {
                  v56 = 0;
                  v57 = v45;
                  v58 = (int *)(a1 + 4 * v45);
                  do
                  {
                    v59 = v57--;
                    v60 = *(int *)(a1 + 4 * v57);
                    if (v59 <= v45)
                    {
                      v61 = *(_DWORD *)&a2[4 * v60];
                      v62 = v58;
                      v63 = v56;
                      v64 = v58;
                      while (1)
                      {
                        v66 = *v64++;
                        v65 = v66;
                        if (v61 <= *(_DWORD *)&a2[4 * v66])
                          break;
                        *(v62 - 1) = v65;
                        --v63;
                        v62 = v64;
                        if (v63 == -1)
                        {
                          LODWORD(v59) = v45 + 1;
                          goto LABEL_72;
                        }
                      }
                      LODWORD(v59) = v45 - v63;
                    }
LABEL_72:
                    *(_DWORD *)(a1 + 4 * ((int)v59 - 1)) = v60;
                    ++v56;
                    --v58;
                  }
                  while (v57 > v44);
                }
              }
              v47 = (int)v42-- <= 1;
              if (v47)
                goto LABEL_124;
            }
            v40 = (7621 * (_WORD)v40 + 1) & 0x7FFF;
            v67 = v114[(v42 - 1)];
            if ((_WORD)v40 != 3 * ((21846 * v40) >> 16))
            {
              if ((unsigned __int16)(v40 - 3 * ((21846 * v40) >> 16)) == 1)
                v67 = (v45 + v43) >> 1;
              else
                v67 = v113[(v42 - 1)];
            }
            v41 = (v42 - 1);
            v68 = *(_DWORD *)&a2[4 * *(unsigned int *)(a1 + 4 * v67)];
            LODWORD(v69) = v113[v41];
            LODWORD(v70) = v114[v41];
            v71 = v69;
            v72 = v70;
LABEL_81:
            if (v72 <= v71)
            {
              v70 = (int)v70;
              do
              {
                if (v72 <= v71)
                  v73 = v71;
                else
                  v73 = v72;
                v74 = (_DWORD *)(a1 + 4 * v72);
                v75 = v73 - (uint64_t)v72 + 1;
                while (1)
                {
                  v76 = *v74;
                  v77 = *(_DWORD *)&a2[4 * v76];
                  if (v77 == v68)
                    break;
                  if (v77 > v68)
                    goto LABEL_94;
                  ++v72;
                  ++v74;
                  if (!--v75)
                  {
                    v72 = v73 + 1;
                    goto LABEL_94;
                  }
                }
                *v74 = *(_DWORD *)(a1 + 4 * v70);
                *(_DWORD *)(a1 + 4 * v70++) = v76;
                v78 = v72 + 1;
                v47 = v71 <= v72++;
              }
              while (!v47);
              v72 = v78;
            }
LABEL_94:
            if (v72 <= v71)
            {
              v69 = (int)v69;
              while (2)
              {
                v79 = v71;
                while (1)
                {
                  v80 = *(unsigned int *)(a1 + 4 * v79);
                  v81 = *(_DWORD *)&a2[4 * v80];
                  if (v81 == v68)
                    break;
                  if (v81 < v68)
                  {
                    v82 = *(_DWORD *)(a1 + 4 * v72);
                    *(_DWORD *)(a1 + 4 * v72) = v80;
                    *(_DWORD *)(a1 + 4 * v79) = v82;
                    ++v72;
                    v71 = v79 - 1;
                    goto LABEL_81;
                  }
                  v47 = v79-- <= v72;
                  if (v47)
                  {
                    if (v71 >= (uint64_t)v72)
                      v71 = v72;
                    --v71;
                    goto LABEL_108;
                  }
                }
                *(_DWORD *)(a1 + 4 * v79) = *(_DWORD *)(a1 + 4 * v69);
                *(_DWORD *)(a1 + 4 * v69--) = v80;
                v71 = v79 - 1;
                if (v72 < (int)v79)
                  continue;
                break;
              }
            }
LABEL_108:
            if ((int)v69 >= (int)v70)
            {
              v83 = v72 - v70;
              if ((int)v70 - v43 < v72 - (int)v70)
                v83 = v70 - v43;
              if (v83 >= 1)
              {
                v84 = (int *)(a1 + 4 * v43);
                v85 = (int *)(a1 + 4 * (v72 - v83));
                v86 = v83 + 1;
                do
                {
                  v87 = *v84;
                  *v84++ = *v85;
                  *v85++ = v87;
                  --v86;
                }
                while (v86 > 1);
              }
              v88 = v45 - v69;
              v89 = v69 - v71;
              if (v45 - (int)v69 >= (int)v69 - v71)
                v88 = v69 - v71;
              if (v88 >= 1)
              {
                v90 = (int *)(a1 + 4 * v72);
                v91 = (int *)(a1 + 4 + 4 * (v45 - v88));
                v92 = v88 + 1;
                do
                {
                  v93 = *v90;
                  *v90++ = *v91;
                  *v91++ = v93;
                  --v92;
                }
                while (v92 > 1);
              }
              v94 = v43 + ~(_DWORD)v70 + v72;
              v95 = v45 - v89 + 1;
              if (v94 - v43 <= v45 - v95)
              {
                v114[v41] = v95;
                v95 = v43;
                v45 = v94;
              }
              else
              {
                v113[v41] = v94;
              }
              v114[v42] = v95;
              v113[v42] = v45;
              v41 = v42 + 1;
            }
          }
          while ((int)v41 > 0);
LABEL_124:
          v96 = (int *)(a1 + 4 * v33);
          v97 = -1;
          a4 = v109;
          v25 = v110;
          do
          {
            v98 = *v96++;
            v99 = *(_DWORD *)&a2[4 * v98];
            if (v97 != v99)
            {
              *((_DWORD *)a3 + (v33 >> 5)) |= 1 << v33;
              v97 = v99;
            }
            ++v33;
          }
          while (v24 != v33);
        }
      }
      v21 = 2 * v108;
      v5 = v106;
      if (v106 >= 4)
        break;
      v10 = v107;
      if (v21 > a4 || !v25)
        goto LABEL_137;
    }
    v100 = v25;
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "%6d unresolved strings\n", v25);
    v101 = v100;
    v10 = v107;
  }
  while (v21 <= a4 && v101);
  fwrite("        reconstructing block ...\n", 0x21uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
LABEL_137:
  if (a4 >= 1)
  {
    v102 = 0;
    LODWORD(v103) = 0;
    do
    {
      v103 = (int)v103;
      v104 = v103 - 1;
      do
      {
        v105 = __dst[v103++];
        ++v104;
      }
      while (!v105);
      __dst[v103 - 1] = v105 - 1;
      LODWORD(v103) = v103 - 1;
      a2[*(unsigned int *)(a1 + 4 * v102++)] = v103;
    }
    while (v102 != v10);
    if (v104 >= 256)
      sub_1DF268138(1005);
  }
}

BOOL sub_1DF267E8C(unsigned int a1, unsigned int a2, uint64_t a3, uint64_t a4, unsigned int a5, _DWORD *a6)
{
  unsigned int v6;
  unsigned int v7;
  BOOL v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  uint64_t v56;
  uint64_t v57;
  unsigned int v58;
  unsigned int v59;
  unsigned int v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  unsigned int v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  uint64_t v68;
  uint64_t v69;
  unsigned int v70;
  unsigned int v71;
  unsigned int v72;
  unsigned int v73;
  uint64_t v74;
  uint64_t v75;
  unsigned int v76;
  unsigned int v77;
  unsigned int v78;
  unsigned int v79;
  _BOOL8 result;
  unsigned int v81;
  unsigned int v82;
  unsigned int v83;
  unsigned int v84;

  v6 = *(unsigned __int8 *)(a3 + a1);
  v7 = *(unsigned __int8 *)(a3 + a2);
  v8 = v6 > v7;
  if (v6 == v7)
  {
    v9 = *(unsigned __int8 *)(a3 + a1 + 1);
    v10 = *(unsigned __int8 *)(a3 + a2 + 1);
    v8 = v9 > v10;
    if (v9 == v10)
    {
      v11 = *(unsigned __int8 *)(a3 + a1 + 2);
      v12 = *(unsigned __int8 *)(a3 + a2 + 2);
      v8 = v11 > v12;
      if (v11 == v12)
      {
        v13 = *(unsigned __int8 *)(a3 + a1 + 3);
        v14 = *(unsigned __int8 *)(a3 + a2 + 3);
        v8 = v13 > v14;
        if (v13 == v14)
        {
          v15 = *(unsigned __int8 *)(a3 + a1 + 4);
          v16 = *(unsigned __int8 *)(a3 + a2 + 4);
          v8 = v15 > v16;
          if (v15 == v16)
          {
            v17 = *(unsigned __int8 *)(a3 + a1 + 5);
            v18 = *(unsigned __int8 *)(a3 + a2 + 5);
            v8 = v17 > v18;
            if (v17 == v18)
            {
              v19 = *(unsigned __int8 *)(a3 + a1 + 6);
              v20 = *(unsigned __int8 *)(a3 + a2 + 6);
              v8 = v19 > v20;
              if (v19 == v20)
              {
                v21 = *(unsigned __int8 *)(a3 + a1 + 7);
                v22 = *(unsigned __int8 *)(a3 + a2 + 7);
                v8 = v21 > v22;
                if (v21 == v22)
                {
                  v23 = *(unsigned __int8 *)(a3 + a1 + 8);
                  v24 = *(unsigned __int8 *)(a3 + a2 + 8);
                  v8 = v23 > v24;
                  if (v23 == v24)
                  {
                    v25 = *(unsigned __int8 *)(a3 + a1 + 9);
                    v26 = *(unsigned __int8 *)(a3 + a2 + 9);
                    v8 = v25 > v26;
                    if (v25 == v26)
                    {
                      v27 = *(unsigned __int8 *)(a3 + a1 + 10);
                      v28 = *(unsigned __int8 *)(a3 + a2 + 10);
                      v8 = v27 > v28;
                      if (v27 == v28)
                      {
                        v29 = *(unsigned __int8 *)(a3 + a1 + 11);
                        v30 = *(unsigned __int8 *)(a3 + a2 + 11);
                        v8 = v29 > v30;
                        if (v29 == v30)
                        {
                          v31 = a1 + 12;
                          v32 = a2 + 12;
                          v33 = a5 + 16;
                          while (1)
                          {
                            v34 = *(unsigned __int8 *)(a3 + v31);
                            v35 = *(unsigned __int8 *)(a3 + v32);
                            v8 = v34 > v35;
                            if (v34 != v35)
                              break;
                            v36 = *(unsigned __int16 *)(a4 + 2 * v31);
                            v37 = *(unsigned __int16 *)(a4 + 2 * v32);
                            v8 = v36 > v37;
                            if (v36 != v37)
                              break;
                            v38 = v31 + 1;
                            v39 = v32 + 1;
                            v40 = *(unsigned __int8 *)(a3 + v38);
                            v41 = *(unsigned __int8 *)(a3 + v39);
                            v8 = v40 > v41;
                            if (v40 != v41)
                              break;
                            v42 = *(unsigned __int16 *)(a4 + 2 * v38);
                            v43 = *(unsigned __int16 *)(a4 + 2 * v39);
                            v8 = v42 > v43;
                            if (v42 != v43)
                              break;
                            v44 = v31 + 2;
                            v45 = v32 + 2;
                            v46 = *(unsigned __int8 *)(a3 + v44);
                            v47 = *(unsigned __int8 *)(a3 + v45);
                            v8 = v46 > v47;
                            if (v46 != v47)
                              break;
                            v48 = *(unsigned __int16 *)(a4 + 2 * v44);
                            v49 = *(unsigned __int16 *)(a4 + 2 * v45);
                            v8 = v48 > v49;
                            if (v48 != v49)
                              break;
                            v50 = v31 + 3;
                            v51 = v32 + 3;
                            v52 = *(unsigned __int8 *)(a3 + v50);
                            v53 = *(unsigned __int8 *)(a3 + v51);
                            v8 = v52 > v53;
                            if (v52 != v53)
                              break;
                            v54 = *(unsigned __int16 *)(a4 + 2 * v50);
                            v55 = *(unsigned __int16 *)(a4 + 2 * v51);
                            v8 = v54 > v55;
                            if (v54 != v55)
                              break;
                            v56 = v31 + 4;
                            v57 = v32 + 4;
                            v58 = *(unsigned __int8 *)(a3 + v56);
                            v59 = *(unsigned __int8 *)(a3 + v57);
                            v8 = v58 > v59;
                            if (v58 != v59)
                              break;
                            v60 = *(unsigned __int16 *)(a4 + 2 * v56);
                            v61 = *(unsigned __int16 *)(a4 + 2 * v57);
                            v8 = v60 > v61;
                            if (v60 != v61)
                              break;
                            v62 = v31 + 5;
                            v63 = v32 + 5;
                            v64 = *(unsigned __int8 *)(a3 + v62);
                            v65 = *(unsigned __int8 *)(a3 + v63);
                            v8 = v64 > v65;
                            if (v64 != v65)
                              break;
                            v66 = *(unsigned __int16 *)(a4 + 2 * v62);
                            v67 = *(unsigned __int16 *)(a4 + 2 * v63);
                            v8 = v66 > v67;
                            if (v66 != v67)
                              break;
                            v68 = v31 + 6;
                            v69 = v32 + 6;
                            v70 = *(unsigned __int8 *)(a3 + v68);
                            v71 = *(unsigned __int8 *)(a3 + v69);
                            v8 = v70 > v71;
                            if (v70 != v71)
                              break;
                            v72 = *(unsigned __int16 *)(a4 + 2 * v68);
                            v73 = *(unsigned __int16 *)(a4 + 2 * v69);
                            v8 = v72 > v73;
                            if (v72 != v73)
                              break;
                            v74 = v31 + 7;
                            v75 = v32 + 7;
                            v76 = *(unsigned __int8 *)(a3 + v74);
                            v77 = *(unsigned __int8 *)(a3 + v75);
                            v8 = v76 > v77;
                            if (v76 != v77)
                              break;
                            v78 = *(unsigned __int16 *)(a4 + 2 * v74);
                            v79 = *(unsigned __int16 *)(a4 + 2 * v75);
                            v8 = v78 > v79;
                            if (v78 != v79)
                              break;
                            result = 0;
                            v81 = v31 + 8;
                            v82 = v32 + 8;
                            if (v81 >= a5)
                              v83 = a5;
                            else
                              v83 = 0;
                            v31 = v81 - v83;
                            if (v82 >= a5)
                              v84 = a5;
                            else
                              v84 = 0;
                            v32 = v82 - v84;
                            --*a6;
                            v33 -= 8;
                            if (v33 <= 7)
                              return result;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v8;
}

void sub_1DF268138(int a1)
{
  FILE **v2;

  v2 = (FILE **)MEMORY[0x1E0C80C10];
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "\n\nbzip2/libbzip2: internal error number %d.\nThis is a bug in bzip2/libbzip2, %s.\nPlease report it to: bzip2-devel@sourceware.org.  If this happened\nwhen you were using some program which uses libbzip2 as a\ncomponent, you should also report this bug to the author(s)\nof that program.  Please make an effort to report this bug;\n"
    "timely and accurate bug reports eventually lead to higher\n"
    "quality software.  Thanks.\n"
    "\n",
    a1,
    "1.0.8, 13-Jul-2019");
  if (a1 == 1007)
    fwrite("\n*** A special note about internal error number 1007 ***\n\nExperience suggests that a common cause of i.e. 1007\nis unreliable memory or other hardware.  The 1007 assertion\njust happens to cross-check the results of huge numbers of\nmemory reads/writes, and so acts (unintendedly) as a stress\ntest of your memory system.\n\nI suggest the following: try compressing the file again,\npossibly monitoring progress in detail with the -vv flag.\n\n* If the error cannot be reproduced, and/or happens at different\n  points in compression, you may have a flaky memory system.\n  Try a memory-test program.  I have used Memtest86\n  (www.memtest86.com).  At the time of writing it is free (GPLd).\n  Memtest86 tests memory much more thorougly than your BIOSs\n  power-on test, and may find failures that the BIOS doesn't.\n\n"
      "* If the error can be repeatably reproduced, this is a bug in\n"
      "  bzip2, and I would very much like to hear about it.  Please\n"
      "  let me know, and, ideally, save a copy of the file causing the\n"
      "  problem -- without which I will be unable to investigate it.\n"
      "\n",
      0x420uLL,
      1uLL,
      *v2);
  exit(3);
}

const char *BZ2_bzlibVersion(void)
{
  return "1.0.8, 13-Jul-2019";
}

void sub_1DF2681A4(int a1, void *a2)
{
  if (a2)
    free(a2);
}

BOOL sub_1DF2681B4(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v8;
  _BYTE *v9;
  uint64_t v10;
  int v11;
  int v12;
  BOOL v13;
  int v14;
  int v15;
  int v16;
  unsigned __int8 *v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  unsigned __int8 **v21;
  int v22;
  int v23;
  int v24;
  unsigned __int8 **v25;
  int v26;
  uint64_t v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  _BOOL4 v33;

  v1 = 0;
  v2 = 0;
  v3 = *(_QWORD *)(a1 + 48);
  while (1)
  {
    v4 = *(_DWORD *)(v3 + 12);
    do
    {
      if (v4 == 2)
        goto LABEL_27;
    }
    while (v4 != 1);
    v6 = *(_DWORD *)(v3 + 116);
    v5 = *(_DWORD *)(v3 + 120);
    if (*(_DWORD *)(*(_QWORD *)v3 + 32) && v5 < v6)
    {
      v9 = *(_BYTE **)(*(_QWORD *)v3 + 24);
      do
      {
        *v9 = *(_BYTE *)(*(_QWORD *)(v3 + 80) + v5);
        v5 = *(_DWORD *)(v3 + 120) + 1;
        *(_DWORD *)(v3 + 120) = v5;
        v10 = *(_QWORD *)v3;
        v11 = *(_DWORD *)(*(_QWORD *)v3 + 36);
        v12 = *(_DWORD *)(*(_QWORD *)v3 + 32) - 1;
        v9 = (_BYTE *)(*(_QWORD *)(*(_QWORD *)v3 + 24) + 1);
        *(_QWORD *)(v10 + 24) = v9;
        *(_DWORD *)(v10 + 32) = v12;
        *(_DWORD *)(v10 + 36) = v11 + 1;
        if (v11 == -1)
          ++*(_DWORD *)(v10 + 40);
        v6 = *(_DWORD *)(v3 + 116);
        if (v12)
          v13 = v5 < v6;
        else
          v13 = 0;
      }
      while (v13);
      v8 = 1;
    }
    else
    {
      v8 = 0;
    }
    v2 |= v8;
    if (v5 < v6)
      break;
    v14 = *(_DWORD *)(v3 + 8);
    if (v14 == 4 && !*(_DWORD *)(v3 + 16) && (*(_DWORD *)(v3 + 92) > 0xFFu || *(int *)(v3 + 96) < 1))
      break;
    *(_DWORD *)(v3 + 108) = 0;
    *(_DWORD *)(v3 + 116) = 0;
    *(_DWORD *)(v3 + 120) = 0;
    *(_DWORD *)(v3 + 648) = -1;
    *(_OWORD *)(v3 + 128) = 0u;
    *(_OWORD *)(v3 + 144) = 0u;
    *(_OWORD *)(v3 + 160) = 0u;
    *(_OWORD *)(v3 + 176) = 0u;
    *(_OWORD *)(v3 + 192) = 0u;
    *(_OWORD *)(v3 + 208) = 0u;
    *(_OWORD *)(v3 + 224) = 0u;
    *(_OWORD *)(v3 + 240) = 0u;
    *(_OWORD *)(v3 + 256) = 0u;
    *(_OWORD *)(v3 + 272) = 0u;
    *(_OWORD *)(v3 + 288) = 0u;
    *(_OWORD *)(v3 + 304) = 0u;
    *(_OWORD *)(v3 + 320) = 0u;
    *(_OWORD *)(v3 + 336) = 0u;
    *(_OWORD *)(v3 + 352) = 0u;
    *(_OWORD *)(v3 + 368) = 0u;
    ++*(_DWORD *)(v3 + 660);
    *(_DWORD *)(v3 + 12) = 2;
    if (v14 == 3)
    {
      if (!*(_DWORD *)(v3 + 16) && (*(_DWORD *)(v3 + 92) > 0xFFu || *(int *)(v3 + 96) <= 0))
        return (v1 | v2) != 0;
LABEL_27:
      v14 = *(_DWORD *)(v3 + 8);
    }
    v15 = *(_DWORD *)(v3 + 108);
    v16 = *(_DWORD *)(v3 + 112);
    if (v14 == 2)
    {
      if (v15 < v16 && *(_DWORD *)(*(_QWORD *)v3 + 8))
      {
        v17 = **(unsigned __int8 ***)v3;
        v18 = *(_DWORD *)(v3 + 92);
        while (1)
        {
          v19 = *v17;
          v20 = *(_DWORD *)(v3 + 96);
          if (v18 == v19)
          {
            if (v20 == 255)
              goto LABEL_37;
            *(_DWORD *)(v3 + 96) = v20 + 1;
          }
          else
          {
            if (v20 != 1)
            {
LABEL_37:
              if (v18 <= 0xFF)
                sub_1DF269468(v3);
              *(_DWORD *)(v3 + 92) = v19;
              *(_DWORD *)(v3 + 96) = 1;
              goto LABEL_40;
            }
            *(_DWORD *)(v3 + 648) = dword_1DF26D0F0[v18 ^ HIBYTE(*(_DWORD *)(v3 + 648))] ^ (*(_DWORD *)(v3 + 648) << 8);
            *(_BYTE *)(v3 + v18 + 128) = 1;
            *(_BYTE *)(*(_QWORD *)(v3 + 64) + v15) = v18;
            ++*(_DWORD *)(v3 + 108);
            *(_DWORD *)(v3 + 92) = v19;
          }
LABEL_40:
          v21 = *(unsigned __int8 ***)v3;
          v17 = (unsigned __int8 *)(**(_QWORD **)v3 + 1);
          *v21 = v17;
          v22 = *((_DWORD *)v21 + 3);
          v23 = *((_DWORD *)v21 + 2) - 1;
          *((_DWORD *)v21 + 2) = v23;
          *((_DWORD *)v21 + 3) = v22 + 1;
          if (v22 == -1)
            ++*((_DWORD *)v21 + 4);
          v15 = *(_DWORD *)(v3 + 108);
          v16 = *(_DWORD *)(v3 + 112);
          v24 = 1;
          if (v15 < v16)
          {
            v18 = v19;
            if (v23)
              continue;
          }
          goto LABEL_63;
        }
      }
    }
    else if (v15 < v16)
    {
      v25 = *(unsigned __int8 ***)v3;
      v24 = *(_DWORD *)(*(_QWORD *)v3 + 8);
      if (!v24)
        goto LABEL_63;
      v24 = *(_DWORD *)(v3 + 16);
      if (!v24)
        goto LABEL_63;
      while (2)
      {
        v26 = **v25;
        v27 = *(unsigned int *)(v3 + 92);
        v28 = *(_DWORD *)(v3 + 96);
        if ((_DWORD)v27 == v26)
        {
          if (v28 != 255)
          {
            *(_DWORD *)(v3 + 96) = v28 + 1;
            goto LABEL_56;
          }
LABEL_53:
          if (v27 <= 0xFF)
            sub_1DF269468(v3);
          *(_DWORD *)(v3 + 92) = v26;
          *(_DWORD *)(v3 + 96) = 1;
        }
        else
        {
          if (v28 != 1)
            goto LABEL_53;
          *(_DWORD *)(v3 + 648) = dword_1DF26D0F0[*(_DWORD *)(v3 + 92) ^ HIBYTE(*(_DWORD *)(v3 + 648))] ^ (*(_DWORD *)(v3 + 648) << 8);
          *(_BYTE *)(v3 + v27 + 128) = 1;
          *(_BYTE *)(*(_QWORD *)(v3 + 64) + v15) = v27;
          ++*(_DWORD *)(v3 + 108);
          *(_DWORD *)(v3 + 92) = v26;
        }
LABEL_56:
        v25 = *(unsigned __int8 ***)v3;
        *v25 = (unsigned __int8 *)(**(_QWORD **)v3 + 1);
        v29 = *((_DWORD *)v25 + 3);
        v30 = *((_DWORD *)v25 + 2) - 1;
        *((_DWORD *)v25 + 2) = v30;
        *((_DWORD *)v25 + 3) = v29 + 1;
        if (v29 == -1)
          ++*((_DWORD *)v25 + 4);
        v31 = *(_DWORD *)(v3 + 16) - 1;
        *(_DWORD *)(v3 + 16) = v31;
        v15 = *(_DWORD *)(v3 + 108);
        v16 = *(_DWORD *)(v3 + 112);
        v24 = 1;
        if (v15 >= v16 || !v30 || !v31)
          goto LABEL_63;
        continue;
      }
    }
    v24 = 0;
LABEL_63:
    v1 |= v24;
    v32 = *(_DWORD *)(v3 + 8);
    if (v32 == 2 || *(_DWORD *)(v3 + 16))
    {
      if (v15 >= v16)
      {
        v33 = 0;
        goto LABEL_72;
      }
      if (!*(_DWORD *)(*(_QWORD *)v3 + 8))
        return (v1 | v2) != 0;
    }
    else
    {
      if (*(_DWORD *)(v3 + 92) <= 0xFFu)
      {
        sub_1DF269468(v3);
        v32 = *(_DWORD *)(v3 + 8);
      }
      *(_QWORD *)(v3 + 92) = 256;
      v33 = v32 == 4;
LABEL_72:
      sub_1DF2695B4(v3, v33);
      *(_DWORD *)(v3 + 12) = 1;
    }
  }
  return (v1 | v2) != 0;
}

int BZ2_bzCompressEnd(bz_stream *strm)
{
  bz_stream **state;
  int result;

  if (!strm)
    return -2;
  state = (bz_stream **)strm->state;
  if (!state || *state != strm)
    return -2;
  if (state[3])
    ((void (*)(void *))strm->bzfree)(strm->opaque);
  if (state[4])
    ((void (*)(void *))strm->bzfree)(strm->opaque);
  if (state[5])
    ((void (*)(void *))strm->bzfree)(strm->opaque);
  ((void (*)(void *, void *))strm->bzfree)(strm->opaque, strm->state);
  result = 0;
  strm->state = 0;
  return result;
}

uint64_t sub_1DF268640(int a1, uint64_t a2)
{
  uint64_t result;
  int v4;
  int v5;
  int v6;

  LODWORD(result) = 0;
  v4 = 256;
  do
  {
    v5 = (v4 + (int)result) >> 1;
    v6 = *(_DWORD *)(a2 + 4 * v5);
    if (v6 <= a1)
      result = v5;
    else
      result = result;
    if (v6 > a1)
      v4 = v5;
  }
  while (v4 - (_DWORD)result != 1);
  return result;
}

BZFILE *__cdecl BZ2_bzWriteOpen(int *bzerror, FILE *f, int blockSize100k, int verbosity, int workFactor)
{
  char *v10;
  int v11;
  char *v12;
  _BYTE *v13;
  bz_stream *v14;
  int v15;
  int v16;

  if (bzerror)
    *bzerror = 0;
  if (verbosity > 4
    || !f
    || (blockSize100k - 10) < 0xFFFFFFF7
    || workFactor >= 0xFB)
  {
    if (bzerror)
    {
      v10 = 0;
      v11 = -2;
      goto LABEL_12;
    }
    return 0;
  }
  if (!ferror(f))
  {
    v12 = (char *)malloc_type_malloc(0x13F0uLL, 0x10B004010B7758FuLL);
    if (v12)
    {
      v10 = v12;
      v13 = v12 + 5012;
      if (bzerror)
        *bzerror = 0;
      *((_DWORD *)v12 + 1274) = 0;
      v12[5100] = 0;
      *((_DWORD *)v12 + 1252) = 0;
      *(_QWORD *)v12 = f;
      *v13 = 1;
      v14 = (bz_stream *)(v12 + 5016);
      if (workFactor)
        v15 = workFactor;
      else
        v15 = 30;
      *((_QWORD *)v10 + 634) = 0;
      *((_QWORD *)v10 + 636) = 0;
      *((_QWORD *)v10 + 635) = 0;
      v16 = BZ2_bzCompressInit(v14, blockSize100k, verbosity, v15);
      if (!v16)
      {
        *((_DWORD *)v10 + 1256) = 0;
        v13[88] = 1;
        return v10;
      }
      if (bzerror)
        *bzerror = v16;
      free(v10);
    }
    else if (bzerror)
    {
      v10 = 0;
      v11 = -3;
      goto LABEL_12;
    }
    return 0;
  }
  if (!bzerror)
    return 0;
  v10 = 0;
  v11 = -6;
LABEL_12:
  *bzerror = v11;
  return v10;
}

void BZ2_bzWrite(int *bzerror, BZFILE *b, void *buf, int len)
{
  int v8;
  int v9;
  uint64_t v10;

  if (bzerror)
    *bzerror = 0;
  if (b && (*((_DWORD *)b + 1274) = 0, buf) && (len & 0x80000000) == 0)
  {
    if (!*((_BYTE *)b + 5012))
    {
      if (bzerror)
        *bzerror = -1;
      v8 = -1;
      goto LABEL_18;
    }
    if (ferror(*(FILE **)b))
    {
LABEL_8:
      if (bzerror)
        *bzerror = -6;
      v8 = -6;
      goto LABEL_18;
    }
    if (len)
    {
      *((_DWORD *)b + 1256) = len;
      *((_QWORD *)b + 627) = buf;
      while (1)
      {
        *((_DWORD *)b + 1262) = 5000;
        *((_QWORD *)b + 630) = (char *)b + 8;
        v9 = BZ2_bzCompress((bz_stream *)((char *)b + 5016), 0);
        if (v9 != 1)
          break;
        v10 = *((unsigned int *)b + 1262);
        if (v10 >> 3 <= 0x270
          && (5000 - (_DWORD)v10 != fwrite((char *)b + 8, 1uLL, 5000 - v10, *(FILE **)b)
           || ferror(*(FILE **)b)))
        {
          goto LABEL_8;
        }
        if (!*((_DWORD *)b + 1256))
          goto LABEL_27;
      }
      if (bzerror)
        *bzerror = v9;
      *((_DWORD *)b + 1274) = v9;
    }
    else
    {
LABEL_27:
      if (bzerror)
        *bzerror = 0;
      *((_DWORD *)b + 1274) = 0;
    }
  }
  else
  {
    if (bzerror)
      *bzerror = -2;
    if (b)
    {
      v8 = -2;
LABEL_18:
      *((_DWORD *)b + 1274) = v8;
    }
  }
}

void BZ2_bzWriteClose(int *bzerror, BZFILE *b, int abandon, unsigned int *nbytes_in, unsigned int *nbytes_out)
{
  BZ2_bzWriteClose64(bzerror, b, abandon, nbytes_in, 0, nbytes_out, 0);
}

void BZ2_bzWriteClose64(int *bzerror, BZFILE *b, int abandon, unsigned int *nbytes_in_lo32, unsigned int *nbytes_in_hi32, unsigned int *nbytes_out_lo32, unsigned int *nbytes_out_hi32)
{
  FILE *v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;

  if (b)
  {
    if (!*((_BYTE *)b + 5012))
    {
      if (bzerror)
        *bzerror = -1;
      v15 = -1;
      goto LABEL_12;
    }
    v14 = *(FILE **)b;
    if (ferror(*(FILE **)b))
    {
LABEL_4:
      if (bzerror)
        *bzerror = -6;
      v15 = -6;
LABEL_12:
      *((_DWORD *)b + 1274) = v15;
      return;
    }
    if (nbytes_in_lo32)
      *nbytes_in_lo32 = 0;
    if (nbytes_in_hi32)
      *nbytes_in_hi32 = 0;
    if (nbytes_out_lo32)
      *nbytes_out_lo32 = 0;
    if (nbytes_out_hi32)
      *nbytes_out_hi32 = 0;
    if (abandon)
      goto LABEL_25;
    if (*((_DWORD *)b + 1274))
    {
LABEL_24:
      if (!ferror(v14))
      {
        fflush(v14);
        if (ferror(*(FILE **)b))
          goto LABEL_4;
      }
LABEL_25:
      if (nbytes_in_lo32)
        *nbytes_in_lo32 = *((_DWORD *)b + 1257);
      if (nbytes_in_hi32)
        *nbytes_in_hi32 = *((_DWORD *)b + 1258);
      if (nbytes_out_lo32)
        *nbytes_out_lo32 = *((_DWORD *)b + 1263);
      if (nbytes_out_hi32)
        *nbytes_out_hi32 = *((_DWORD *)b + 1264);
      if (bzerror)
        *bzerror = 0;
      *((_DWORD *)b + 1274) = 0;
      BZ2_bzCompressEnd((bz_stream *)((char *)b + 5016));
      free(b);
      return;
    }
    while (1)
    {
      *((_DWORD *)b + 1262) = 5000;
      *((_QWORD *)b + 630) = (char *)b + 8;
      v16 = BZ2_bzCompress((bz_stream *)((char *)b + 5016), 2);
      v17 = v16;
      if ((v16 - 5) <= 0xFFFFFFFD)
        break;
      v18 = *((unsigned int *)b + 1262);
      if (v18 >> 3 <= 0x270
        && (5000 - (_DWORD)v18 != fwrite((char *)b + 8, 1uLL, 5000 - v18, *(FILE **)b)
         || ferror(*(FILE **)b)))
      {
        goto LABEL_4;
      }
      if (v17 == 4)
      {
        v14 = *(FILE **)b;
        goto LABEL_24;
      }
    }
    if (bzerror)
      *bzerror = v16;
    *((_DWORD *)b + 1274) = v16;
  }
  else if (bzerror)
  {
    *bzerror = 0;
  }
}

BZFILE *__cdecl BZ2_bzReadOpen(int *bzerror, FILE *f, int verbosity, int small, void *unused, int nUnused)
{
  char *v7;
  char *v12;
  int v13;
  char *v14;
  _BYTE *v15;
  bz_stream *v16;
  int v17;
  unsigned int v18;
  char v19;
  int v20;

  v7 = (char *)unused;
  if (bzerror)
    *bzerror = 0;
  if (f
    && verbosity <= 4
    && small <= 1
    && (unused || !nUnused)
    && (!unused || nUnused < 0x1389))
  {
    if (ferror(f))
    {
      if (bzerror)
      {
        v12 = 0;
        v13 = -6;
        goto LABEL_12;
      }
    }
    else
    {
      v14 = (char *)malloc_type_malloc(0x13F0uLL, 0x10B004010B7758FuLL);
      if (v14)
      {
        v12 = v14;
        v15 = v14 + 5012;
        if (bzerror)
          *bzerror = 0;
        *((_DWORD *)v14 + 1274) = 0;
        v14[5100] = 0;
        *(_QWORD *)v14 = f;
        *((_DWORD *)v14 + 1252) = 0;
        *v15 = 0;
        v16 = (bz_stream *)(v14 + 5016);
        *((_QWORD *)v12 + 634) = 0;
        *((_QWORD *)v12 + 636) = 0;
        *((_QWORD *)v12 + 635) = 0;
        if (nUnused >= 1)
        {
          v17 = 0;
          v18 = nUnused + 1;
          do
          {
            v19 = *v7++;
            v12[v17 + 8] = v19;
            v17 = *((_DWORD *)v12 + 1252) + 1;
            *((_DWORD *)v12 + 1252) = v17;
            --v18;
          }
          while (v18 > 1);
        }
        v20 = BZ2_bzDecompressInit(v16, verbosity, small);
        if (!v20)
        {
          *((_DWORD *)v12 + 1256) = *((_DWORD *)v12 + 1252);
          *((_QWORD *)v12 + 627) = v12 + 8;
          v15[88] = 1;
          return v12;
        }
        if (bzerror)
          *bzerror = v20;
        free(v12);
      }
      else if (bzerror)
      {
        v12 = 0;
        v13 = -3;
        goto LABEL_12;
      }
    }
    return 0;
  }
  if (!bzerror)
    return 0;
  v12 = 0;
  v13 = -2;
LABEL_12:
  *bzerror = v13;
  return v12;
}

void BZ2_bzReadClose(int *bzerror, BZFILE *b)
{
  _BYTE *v3;

  v3 = (char *)b + 5012;
  if (bzerror)
  {
    *bzerror = 0;
    if (!b)
      return;
    *((_DWORD *)b + 1274) = 0;
    if (*v3)
    {
      *bzerror = -1;
LABEL_7:
      *((_DWORD *)b + 1274) = -1;
      return;
    }
  }
  else
  {
    if (!b)
      return;
    *((_DWORD *)b + 1274) = 0;
    if (*v3)
      goto LABEL_7;
  }
  if (*((_BYTE *)b + 5100))
    BZ2_bzDecompressEnd((bz_stream *)((char *)b + 5016));
  free(b);
}

int BZ2_bzRead(int *bzerror, BZFILE *b, void *buf, int len)
{
  int v4;
  int v7;
  char *v9;
  FILE *v10;
  int v11;
  int v12;

  v4 = len;
  if (bzerror)
    *bzerror = 0;
  if (!b || (*((_DWORD *)b + 1274) = 0, !buf) || len < 0)
  {
    if (bzerror)
      *bzerror = -2;
    v4 = 0;
    if (b)
    {
      v7 = -2;
      goto LABEL_14;
    }
    return v4;
  }
  if (*((_BYTE *)b + 5012))
  {
    if (bzerror)
      *bzerror = -1;
    v4 = 0;
    v7 = -1;
    goto LABEL_14;
  }
  if (!len)
  {
    if (bzerror)
      *bzerror = 0;
    v4 = 0;
LABEL_35:
    *((_DWORD *)b + 1274) = 0;
    return v4;
  }
  *((_DWORD *)b + 1262) = len;
  *((_QWORD *)b + 630) = buf;
  v9 = (char *)b + 8;
  while (1)
  {
    v10 = *(FILE **)b;
    if (ferror(*(FILE **)b))
    {
LABEL_36:
      if (bzerror)
        *bzerror = -6;
      v4 = 0;
      v7 = -6;
      goto LABEL_14;
    }
    if (!*((_DWORD *)b + 1256) && !sub_1DF268EE4(v10))
    {
      v11 = fread((char *)b + 8, 1uLL, 0x1388uLL, *(FILE **)b);
      if (ferror(*(FILE **)b))
        goto LABEL_36;
      *((_DWORD *)b + 1252) = v11;
      *((_DWORD *)b + 1256) = v11;
      *((_QWORD *)b + 627) = v9;
    }
    v12 = BZ2_bzDecompress((bz_stream *)((char *)b + 5016));
    if ((v12 & 0xFFFFFFFB) != 0)
    {
      if (bzerror)
        *bzerror = v12;
      v4 = 0;
      *((_DWORD *)b + 1274) = v12;
      return v4;
    }
    if (v12)
    {
      if (v12 == 4)
      {
        if (bzerror)
          *bzerror = 4;
        *((_DWORD *)b + 1274) = 4;
        v4 -= *((_DWORD *)b + 1262);
        return v4;
      }
      goto LABEL_29;
    }
    if (sub_1DF268EE4(*(FILE **)b) && !*((_DWORD *)b + 1256))
      break;
LABEL_29:
    if (!*((_DWORD *)b + 1262))
      goto LABEL_30;
  }
  if (!*((_DWORD *)b + 1262))
  {
LABEL_30:
    if (bzerror)
      *bzerror = 0;
    goto LABEL_35;
  }
  if (bzerror)
    *bzerror = -7;
  v4 = 0;
  v7 = -7;
LABEL_14:
  *((_DWORD *)b + 1274) = v7;
  return v4;
}

uint64_t sub_1DF268EE4(FILE *a1)
{
  int v2;

  v2 = fgetc(a1);
  if (v2 == -1)
    return 1;
  ungetc(v2, a1);
  return 0;
}

void BZ2_bzReadGetUnused(int *bzerror, BZFILE *b, void **unused, int *nUnused)
{
  int v4;

  if (b)
  {
    if (*((_DWORD *)b + 1274) == 4)
    {
      if (unused && nUnused)
      {
        if (bzerror)
          *bzerror = 0;
        *((_DWORD *)b + 1274) = 0;
        *nUnused = *((_DWORD *)b + 1256);
        *unused = (void *)*((_QWORD *)b + 627);
        return;
      }
      if (bzerror)
        *bzerror = -2;
      v4 = -2;
    }
    else
    {
      if (bzerror)
        *bzerror = -1;
      v4 = -1;
    }
    *((_DWORD *)b + 1274) = v4;
    return;
  }
  if (bzerror)
    *bzerror = -2;
}

int BZ2_bzBuffToBuffDecompress(char *dest, unsigned int *destLen, char *source, unsigned int sourceLen, int small, int verbosity)
{
  int v6;
  int v12;
  unsigned int avail_out;
  bz_stream v14;

  v6 = -2;
  if (dest)
  {
    if (destLen)
    {
      if (source)
      {
        if (small <= 1 && verbosity <= 4)
        {
          memset(&v14, 0, sizeof(v14));
          v6 = BZ2_bzDecompressInit(&v14, verbosity, small);
          if (!v6)
          {
            v14.next_in = source;
            v14.next_out = dest;
            v14.avail_in = sourceLen;
            v14.avail_out = *destLen;
            v12 = BZ2_bzDecompress(&v14);
            if (v12)
            {
              v6 = v12;
              if (v12 == 4)
              {
                *destLen -= v14.avail_out;
                BZ2_bzDecompressEnd(&v14);
                return 0;
              }
              else
              {
                BZ2_bzDecompressEnd(&v14);
              }
            }
            else
            {
              avail_out = v14.avail_out;
              BZ2_bzDecompressEnd(&v14);
              if (avail_out)
                return -7;
              else
                return -8;
            }
          }
        }
      }
    }
  }
  return v6;
}

BZFILE *__cdecl BZ2_bzopen(const char *path, const char *mode)
{
  return sub_1DF2690A8();
}

BZFILE *sub_1DF2690A8()
{
  uint64_t v0;
  int v1;
  _BYTE *v2;
  int v3;
  int v4;
  int v5;
  const char *v6;
  char v7;
  int v8;
  int v9;
  unsigned __int8 *v10;
  int v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  FILE *v18;
  FILE *v19;
  FILE **v20;
  unsigned int v21;
  int v22;
  BZFILE *result;
  int bzerror;
  char __mode[8];
  __int16 v26;
  _BYTE unused[5000];
  uint64_t v28;

  v0 = MEMORY[0x1E0C80A78]();
  v28 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  *(_QWORD *)__mode = 0;
  if (!v2)
    return 0;
  v4 = v3;
  v5 = v1;
  v6 = (const char *)v0;
  v7 = *v2;
  if (*v2)
  {
    v8 = 0;
    v9 = 0;
    v10 = v2 + 1;
    v11 = 9;
    do
    {
      v12 = v7 - 48;
      if (v12 >= 0xA)
        v12 = v11;
      if (v7 == 119)
      {
        v12 = v11;
        v13 = 1;
      }
      else
      {
        v13 = v9;
      }
      if (v7 == 115)
        v14 = v11;
      else
        v14 = v12;
      if (v7 == 115)
        v15 = v9;
      else
        v15 = v13;
      if (v7 == 115)
        v16 = 1;
      else
        v16 = v8;
      if (v7 == 114)
      {
        v9 = 0;
      }
      else
      {
        v11 = v14;
        v9 = v15;
      }
      if (v7 != 114)
        v8 = v16;
      v17 = *v10++;
      v7 = v17;
    }
    while (v17);
  }
  else
  {
    v9 = 0;
    v8 = 0;
    v11 = 9;
  }
  bzerror = 0;
  __strlcat_chk();
  __strlcat_chk();
  if (v4)
  {
    v18 = fdopen(v5, __mode);
  }
  else
  {
    if (!v6 || !*v6)
    {
      v20 = (FILE **)MEMORY[0x1E0C80C20];
      if (!v9)
        v20 = (FILE **)MEMORY[0x1E0C80C18];
      v19 = *v20;
      if (!*v20)
        return 0;
      goto LABEL_36;
    }
    v18 = fopen(v6, __mode);
  }
  v19 = v18;
  if (!v18)
    return 0;
LABEL_36:
  if (v9)
  {
    if (v11 <= 1)
      v21 = 1;
    else
      v21 = v11;
    if (v21 >= 9)
      v22 = 9;
    else
      v22 = v21;
    result = BZ2_bzWriteOpen(&bzerror, v19, v22, 0, 30);
    if (result)
      return result;
  }
  else
  {
    result = BZ2_bzReadOpen(&bzerror, v19, 0, v8, unused, 0);
    if (result)
      return result;
  }
  if (v19 != (FILE *)*MEMORY[0x1E0C80C18] && v19 != (FILE *)*MEMORY[0x1E0C80C20])
  {
    fclose(v19);
    return 0;
  }
  return result;
}

BZFILE *__cdecl BZ2_bzdopen(int fd, const char *mode)
{
  return sub_1DF2690A8();
}

int BZ2_bzread(BZFILE *b, void *buf, int len)
{
  int result;
  int bzerror;

  if (*((_DWORD *)b + 1274) == 4)
    return 0;
  bzerror = 0;
  result = BZ2_bzRead(&bzerror, b, buf, len);
  if ((bzerror & 0xFFFFFFFB) != 0)
    return -1;
  return result;
}

int BZ2_bzwrite(BZFILE *b, void *buf, int len)
{
  int bzerror;

  bzerror = 0;
  BZ2_bzWrite(&bzerror, b, buf, len);
  if (bzerror)
    return -1;
  else
    return len;
}

int BZ2_bzflush(BZFILE *b)
{
  return 0;
}

void BZ2_bzclose(BZFILE *b)
{
  FILE *v2;
  int bzerror;

  if (b)
  {
    bzerror = 0;
    v2 = *(FILE **)b;
    if (*((_BYTE *)b + 5012))
    {
      BZ2_bzWriteClose64(&bzerror, b, 0, 0, 0, 0, 0);
      if (bzerror)
        BZ2_bzWriteClose64(0, b, 1, 0, 0, 0, 0);
    }
    else
    {
      BZ2_bzReadClose(&bzerror, b);
    }
    if (v2 != (FILE *)*MEMORY[0x1E0C80C18] && v2 != (FILE *)*MEMORY[0x1E0C80C20])
      fclose(v2);
  }
}

const char *__cdecl BZ2_bzerror(BZFILE *b, int *errnum)
{
  int v2;

  v2 = *((_DWORD *)b + 1274) & (*((int *)b + 1274) >> 31);
  *errnum = v2;
  return (&off_1EA9825B0)[-v2];
}

int *sub_1DF269468(uint64_t a1)
{
  uint64_t v1;
  int v2;
  unsigned int v3;
  int v4;
  int *result;
  int v6;
  int v7;
  int *v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(unsigned int *)(a1 + 92);
  v2 = *(_DWORD *)(a1 + 96);
  if (v2 >= 1)
  {
    v3 = *(_DWORD *)(a1 + 648);
    v4 = *(_DWORD *)(a1 + 96);
    do
    {
      v3 = dword_1DF26D0F0[v1 ^ HIBYTE(v3)] ^ (v3 << 8);
      *(_DWORD *)(a1 + 648) = v3;
      --v4;
    }
    while (v4);
  }
  *(_BYTE *)(a1 + v1 + 128) = 1;
  switch(v2)
  {
    case 3:
      v10 = *(_QWORD *)(a1 + 64);
      v9 = (int *)(a1 + 64);
      *(_BYTE *)(v10 + v9[11]) = v1;
      v11 = v9[11] + 1;
      v9[11] = v11;
      *(_BYTE *)(*(_QWORD *)v9 + v11) = v1;
      v6 = v9[11] + 1;
      v9[11] = v6;
      v8 = v9;
      result = v9 + 11;
      break;
    case 2:
      v12 = *(_QWORD *)(a1 + 64);
      v8 = (int *)(a1 + 64);
      v13 = *(int *)(a1 + 108);
      result = (int *)(a1 + 108);
      *(_BYTE *)(v12 + v13) = v1;
      v6 = *result + 1;
      *result = v6;
      break;
    case 1:
      v7 = *(_DWORD *)(a1 + 108);
      result = (int *)(a1 + 108);
      v6 = v7;
      v8 = result - 11;
      break;
    default:
      *(_BYTE *)(v2 + a1 + 124) = 1;
      v14 = *(int *)(a1 + 108);
      result = (int *)(a1 + 108);
      v8 = result - 11;
      *(_BYTE *)(*(_QWORD *)(result - 11) + v14) = v1;
      v15 = *result + 1;
      *result = v15;
      *(_BYTE *)(*(_QWORD *)(result - 11) + v15) = v1;
      v16 = *result + 1;
      *result = v16;
      *(_BYTE *)(*(_QWORD *)(result - 11) + v16) = v1;
      v17 = *result + 1;
      *result = v17;
      *(_BYTE *)(*(_QWORD *)(result - 11) + v17) = v1;
      v6 = *result + 1;
      *result = v6;
      LOBYTE(v1) = *((_BYTE *)result - 12) - 4;
      break;
  }
  *(_BYTE *)(*(_QWORD *)v8 + v6) = v1;
  ++*result;
  return result;
}

void sub_1DF2695B4(uint64_t a1, int a2)
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  int v23;
  uint64_t v24;
  int v25;
  int v26;
  unsigned __int8 v27;
  int v28;
  int v29;
  unsigned int v30;
  __int16 *v31;
  __int16 v32;
  BOOL v33;
  int v34;
  int v35;
  _BYTE *v36;
  int v37;
  uint64_t v38;
  unsigned int v39;
  __int16 *v40;
  __int16 v41;
  int v42;
  uint64_t v43;
  int v44;
  int v45;
  int v46;
  unsigned __int8 v47;
  _BYTE v48[255];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = *(_DWORD *)(a1 + 108);
  if (v4 >= 1)
  {
    v5 = *(_DWORD *)(a1 + 648);
    v6 = ~v5;
    *(_DWORD *)(a1 + 648) = ~v5;
    v7 = v5 ^ ~__ROR4__(*(_DWORD *)(a1 + 652), 31);
    *(_DWORD *)(a1 + 652) = v7;
    v8 = *(_DWORD *)(a1 + 660);
    if (v8 >= 2)
      *(_DWORD *)(a1 + 116) = 0;
    if (*(int *)(a1 + 656) >= 2)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "    block %d: crc = 0x%08x, combined CRC = 0x%08x, size = %d\n", v8, v6, v7, v4);
    sub_1DF2666EC();
    v4 = *(_DWORD *)(a1 + 108);
  }
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a1 + 32) + v4;
  if (*(_DWORD *)(a1 + 660) == 1)
  {
    *(_QWORD *)(a1 + 640) = 0;
    sub_1DF269AEC(a1, 66);
    sub_1DF269AEC(a1, 90);
    sub_1DF269AEC(a1, 104);
    sub_1DF269AEC(a1, (*(_BYTE *)(a1 + 664) + 48));
    v4 = *(_DWORD *)(a1 + 108);
  }
  if (v4 >= 1)
  {
    sub_1DF269AEC(a1, 49);
    sub_1DF269AEC(a1, 65);
    sub_1DF269AEC(a1, 89);
    sub_1DF269AEC(a1, 38);
    sub_1DF269AEC(a1, 83);
    sub_1DF269AEC(a1, 89);
    sub_1DF269B5C(a1, *(_DWORD *)(a1 + 648));
    v9 = *(_DWORD *)(a1 + 644);
    if (v9 <= 7)
    {
      v10 = *(_DWORD *)(a1 + 640);
    }
    else
    {
      v10 = *(_DWORD *)(a1 + 640);
      v11 = *(_DWORD *)(a1 + 116);
      do
      {
        *(_BYTE *)(*(_QWORD *)(a1 + 80) + v11) = HIBYTE(v10);
        v11 = *(_DWORD *)(a1 + 116) + 1;
        *(_DWORD *)(a1 + 116) = v11;
        v10 = *(_DWORD *)(a1 + 640) << 8;
        *(_DWORD *)(a1 + 640) = v10;
        v12 = *(_DWORD *)(a1 + 644);
        v9 = v12 - 8;
        *(_DWORD *)(a1 + 644) = v12 - 8;
      }
      while (v12 > 15);
    }
    v13 = v9 + 1;
    *(_DWORD *)(a1 + 640) = v10;
    *(_DWORD *)(a1 + 644) = v9 + 1;
    v14 = *(_DWORD *)(a1 + 48);
    if (v9 >= 7)
    {
      v15 = *(_DWORD *)(a1 + 116);
      do
      {
        *(_BYTE *)(*(_QWORD *)(a1 + 80) + v15) = HIBYTE(v10);
        v15 = *(_DWORD *)(a1 + 116) + 1;
        *(_DWORD *)(a1 + 116) = v15;
        v10 = *(_DWORD *)(a1 + 640) << 8;
        *(_DWORD *)(a1 + 640) = v10;
        v16 = *(_DWORD *)(a1 + 644);
        v13 = v16 - 8;
        *(_DWORD *)(a1 + 644) = v16 - 8;
      }
      while (v16 > 15);
    }
    v17 = 0;
    v18 = 0;
    *(_DWORD *)(a1 + 640) = (v14 << (8 - v13)) | v10;
    *(_DWORD *)(a1 + 644) = v13 + 24;
    v19 = *(_QWORD *)(a1 + 56);
    v20 = *(_QWORD *)(a1 + 64);
    v21 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)(a1 + 124) = 0;
    do
    {
      if (*(_BYTE *)(a1 + v18 + 128))
      {
        *(_BYTE *)(a1 + v18 + 384) = v17++;
        *(_DWORD *)(a1 + 124) = v17;
      }
      ++v18;
    }
    while (v18 != 256);
    if (v17 >= -1)
    {
      bzero((void *)(a1 + 672), 4 * (v17 + 1) + 4);
      if (v17 >= 1)
      {
        for (i = 0; i != v17; ++i)
          v48[i - 1] = i;
      }
    }
    v23 = *(_DWORD *)(a1 + 108);
    if (v23 < 1)
    {
      v25 = 0;
    }
    else
    {
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = v47;
      v28 = v47;
      do
      {
        v29 = v28;
        v28 = *(unsigned __int8 *)(a1
                                 + *(unsigned __int8 *)(v20
                                                      + (v23 & ((*(_DWORD *)(v19 + 4 * v24) - 1) >> 31))
                                                      + *(_DWORD *)(v19 + 4 * v24)
                                                      - 1)
                                 + 384);
        if (v29 == v28)
        {
          ++v26;
        }
        else
        {
          v30 = v26 - 1;
          if (v26 >= 1)
          {
            v31 = (__int16 *)(v21 + 2 * v25++);
            if ((v30 & 1) == 0)
            {
LABEL_32:
              v32 = 0;
              ++*(_DWORD *)(a1 + 672);
              goto LABEL_34;
            }
            while (1)
            {
              ++*(_DWORD *)(a1 + 676);
              v32 = 1;
LABEL_34:
              *v31 = v32;
              v33 = __OFSUB__(v30, 2);
              v34 = v30 - 2;
              if (v34 < 0 != v33)
                break;
              v30 = v34 >> 1;
              ++v25;
              ++v31;
              if ((v30 & 1) == 0)
                goto LABEL_32;
            }
            v26 = 0;
          }
          v35 = v48[0];
          v48[0] = v27;
          v36 = v48;
          if (v28 != v35)
          {
            v36 = v48;
            do
            {
              v37 = *++v36;
              *v36 = v35;
              LOBYTE(v35) = v37;
            }
            while (v28 != v37);
          }
          v38 = (int)((_DWORD)v36 - &v47) + 1;
          *(_WORD *)(v21 + 2 * v25++) = v38;
          ++*(_DWORD *)(a1 + 4 * v38 + 672);
          v23 = *(_DWORD *)(a1 + 108);
          v27 = v28;
        }
        ++v24;
      }
      while (v24 < v23);
      v39 = v26 - 1;
      if (v26 >= 1)
      {
        v40 = (__int16 *)(v21 + 2 * v25++);
        if ((v39 & 1) != 0)
          goto LABEL_46;
LABEL_45:
        v41 = 0;
        ++*(_DWORD *)(a1 + 672);
        while (1)
        {
          *v40 = v41;
          v33 = __OFSUB__(v39, 2);
          v42 = v39 - 2;
          if (v42 < 0 != v33)
            break;
          v39 = v42 >> 1;
          ++v25;
          ++v40;
          if ((v39 & 1) == 0)
            goto LABEL_45;
LABEL_46:
          ++*(_DWORD *)(a1 + 676);
          v41 = 1;
        }
      }
    }
    v43 = v17 + 1;
    *(_WORD *)(v21 + 2 * v25) = v43;
    ++*(_DWORD *)(a1 + 4 * v43 + 672);
    *(_DWORD *)(a1 + 668) = v25 + 1;
    sub_1DF269CF0(a1);
  }
  if (a2)
  {
    sub_1DF269AEC(a1, 23);
    sub_1DF269AEC(a1, 114);
    sub_1DF269AEC(a1, 69);
    sub_1DF269AEC(a1, 56);
    sub_1DF269AEC(a1, 80);
    sub_1DF269AEC(a1, 144);
    sub_1DF269B5C(a1, *(_DWORD *)(a1 + 652));
    if (*(int *)(a1 + 656) > 1)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "    final combined CRC = 0x%08x\n   ", *(_DWORD *)(a1 + 652));
    if (*(int *)(a1 + 644) >= 1)
    {
      v44 = *(_DWORD *)(a1 + 640);
      v45 = *(_DWORD *)(a1 + 116);
      do
      {
        *(_BYTE *)(*(_QWORD *)(a1 + 80) + v45) = HIBYTE(v44);
        v45 = *(_DWORD *)(a1 + 116) + 1;
        *(_DWORD *)(a1 + 116) = v45;
        v44 = *(_DWORD *)(a1 + 640) << 8;
        *(_DWORD *)(a1 + 640) = v44;
        v46 = *(_DWORD *)(a1 + 644);
        v33 = __OFSUB__(v46, 8);
        v46 -= 8;
        *(_DWORD *)(a1 + 644) = v46;
      }
      while (!((v46 < 0) ^ v33 | (v46 == 0)));
    }
  }
}

uint64_t sub_1DF269AEC(uint64_t result, int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;

  v2 = *(_DWORD *)(result + 644);
  if (v2 <= 7)
  {
    v3 = *(_DWORD *)(result + 640);
    v5 = v2 + 8;
  }
  else
  {
    v3 = *(_DWORD *)(result + 640);
    v4 = *(_DWORD *)(result + 116);
    do
    {
      *(_BYTE *)(*(_QWORD *)(result + 80) + v4) = HIBYTE(v3);
      v4 = *(_DWORD *)(result + 116) + 1;
      *(_DWORD *)(result + 116) = v4;
      v3 = *(_DWORD *)(result + 640) << 8;
      *(_DWORD *)(result + 640) = v3;
      v5 = *(_DWORD *)(result + 644);
      *(_DWORD *)(result + 644) = v5 - 8;
    }
    while (v5 > 15);
  }
  *(_DWORD *)(result + 640) = (a2 << -(char)v5) | v3;
  *(_DWORD *)(result + 644) = v5;
  return result;
}

uint64_t sub_1DF269B5C(uint64_t result, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;

  v2 = *(_DWORD *)(result + 644);
  if (v2 <= 7)
  {
    v3 = *(_DWORD *)(result + 640);
    v5 = v2 + 8;
  }
  else
  {
    v3 = *(_DWORD *)(result + 640);
    v4 = *(_DWORD *)(result + 116);
    do
    {
      *(_BYTE *)(*(_QWORD *)(result + 80) + v4) = HIBYTE(v3);
      v4 = *(_DWORD *)(result + 116) + 1;
      *(_DWORD *)(result + 116) = v4;
      v3 = *(_DWORD *)(result + 640) << 8;
      *(_DWORD *)(result + 640) = v3;
      v5 = *(_DWORD *)(result + 644);
      *(_DWORD *)(result + 644) = v5 - 8;
    }
    while (v5 > 15);
  }
  v6 = (HIBYTE(a2) << -(char)v5) | v3;
  *(_DWORD *)(result + 640) = v6;
  *(_DWORD *)(result + 644) = v5;
  if (v5 >= 8)
  {
    v7 = *(_DWORD *)(result + 116);
    do
    {
      *(_BYTE *)(*(_QWORD *)(result + 80) + v7) = HIBYTE(v6);
      v7 = *(_DWORD *)(result + 116) + 1;
      *(_DWORD *)(result + 116) = v7;
      v6 = *(_DWORD *)(result + 640) << 8;
      *(_DWORD *)(result + 640) = v6;
      v8 = *(_DWORD *)(result + 644);
      v5 = v8 - 8;
      *(_DWORD *)(result + 644) = v8 - 8;
    }
    while (v8 > 15);
  }
  v9 = v5 + 8;
  v10 = (BYTE2(a2) << (24 - v5)) | v6;
  *(_DWORD *)(result + 640) = v10;
  *(_DWORD *)(result + 644) = v5 + 8;
  if ((v5 & 0x80000000) == 0)
  {
    v11 = *(_DWORD *)(result + 116);
    do
    {
      *(_BYTE *)(*(_QWORD *)(result + 80) + v11) = HIBYTE(v10);
      v11 = *(_DWORD *)(result + 116) + 1;
      *(_DWORD *)(result + 116) = v11;
      v10 = *(_DWORD *)(result + 640) << 8;
      *(_DWORD *)(result + 640) = v10;
      v12 = *(_DWORD *)(result + 644);
      v9 = v12 - 8;
      *(_DWORD *)(result + 644) = v12 - 8;
    }
    while (v12 > 15);
  }
  v13 = v9 + 8;
  v14 = (BYTE1(a2) << (24 - v9)) | v10;
  *(_DWORD *)(result + 640) = v14;
  *(_DWORD *)(result + 644) = v9 + 8;
  if ((v9 & 0x80000000) == 0)
  {
    v15 = *(_DWORD *)(result + 116);
    do
    {
      *(_BYTE *)(*(_QWORD *)(result + 80) + v15) = HIBYTE(v14);
      v15 = *(_DWORD *)(result + 116) + 1;
      *(_DWORD *)(result + 116) = v15;
      v14 = *(_DWORD *)(result + 640) << 8;
      *(_DWORD *)(result + 640) = v14;
      v16 = *(_DWORD *)(result + 644);
      v13 = v16 - 8;
      *(_DWORD *)(result + 644) = v16 - 8;
    }
    while (v16 > 15);
  }
  *(_DWORD *)(result + 640) = (a2 << (24 - v13)) | v14;
  *(_DWORD *)(result + 644) = v13 + 8;
  return result;
}

uint64_t sub_1DF269CF0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  size_t v6;
  int v7;
  int v8;
  _BOOL4 v9;
  int v10;
  int v11;
  unsigned int v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64x2_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v26;
  int64x2_t v27;
  int32x2_t v28;
  char v30;
  char v32;
  size_t v33;
  _BOOL4 v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  int v38;
  int *v39;
  size_t v40;
  unsigned __int8 *v41;
  int v42;
  uint64_t v43;
  int v44;
  int v45;
  uint64_t v46;
  int v47;
  BOOL v48;
  uint64_t v49;
  unsigned __int16 *v50;
  _DWORD *v51;
  _DWORD *v52;
  int v53;
  int v54;
  _DWORD *v55;
  _DWORD *v56;
  int v57;
  int v58;
  _DWORD *v59;
  _DWORD *v60;
  int v61;
  int v62;
  _DWORD *v63;
  int v64;
  int v65;
  _DWORD *v66;
  _DWORD *v67;
  int v68;
  int v69;
  _DWORD *v70;
  int v71;
  int v72;
  _DWORD *v73;
  int v74;
  int v75;
  _DWORD *v76;
  _DWORD *v77;
  int v78;
  int v79;
  _DWORD *v80;
  int v81;
  int v82;
  _DWORD *v83;
  int v84;
  int v85;
  _DWORD *v86;
  int v87;
  int v88;
  _DWORD *v89;
  _DWORD *v90;
  int v91;
  int v92;
  _DWORD *v93;
  int v94;
  int v95;
  _DWORD *v96;
  int v97;
  int v98;
  _DWORD *v99;
  int v100;
  int v101;
  _DWORD *v102;
  int v103;
  int v104;
  _DWORD *v105;
  _DWORD *v106;
  int v107;
  int v108;
  _DWORD *v109;
  int v110;
  int v111;
  _DWORD *v112;
  int v113;
  int v114;
  _DWORD *v115;
  int v116;
  int v117;
  _DWORD *v118;
  int v119;
  int v120;
  _DWORD *v121;
  int v122;
  int v123;
  _DWORD *v124;
  _DWORD *v125;
  int v126;
  int v127;
  _DWORD *v128;
  int v129;
  int v130;
  _DWORD *v131;
  int v132;
  int v133;
  _DWORD *v134;
  int v135;
  int v136;
  _DWORD *v137;
  int v138;
  int v139;
  _DWORD *v140;
  int v141;
  int v142;
  _DWORD *v143;
  int v144;
  int v145;
  _DWORD *v146;
  _DWORD *v147;
  int v148;
  int v149;
  _DWORD *v150;
  int v151;
  int v152;
  _DWORD *v153;
  int v154;
  int v155;
  _DWORD *v156;
  int v157;
  int v158;
  _DWORD *v159;
  int v160;
  int v161;
  _DWORD *v162;
  int v163;
  int v164;
  _DWORD *v165;
  int v166;
  int v167;
  _DWORD *v168;
  int v169;
  int v170;
  _DWORD *v171;
  _DWORD *v172;
  _DWORD *v173;
  int v174;
  int v175;
  _DWORD *v176;
  int v177;
  uint64_t v178;
  int v179;
  uint64_t v180;
  unsigned __int8 *v181;
  _WORD *v182;
  uint64_t v183;
  uint64_t v184;
  int v185;
  int v186;
  int v187;
  int v188;
  unsigned __int16 *v189;
  uint64_t v190;
  uint64_t v191;
  unsigned __int16 *v192;
  int v193;
  unsigned int v194;
  uint64_t v195;
  FILE **v196;
  int *v197;
  uint64_t v198;
  int v199;
  uint64_t v200;
  uint64_t v201;
  unsigned __int8 *v202;
  uint64_t i;
  uint64_t v204;
  int v205;
  int v206;
  uint64_t v207;
  int v208;
  uint64_t v209;
  unsigned __int8 *v210;
  int v211;
  int v212;
  size_t v213;
  unsigned __int8 *v214;
  int v215;
  int v216;
  uint64_t v217;
  FILE **v218;
  int8x16_t v219;
  uint64_t v220;
  int v221;
  int v222;
  int v223;
  int v224;
  int v225;
  int v226;
  int v227;
  uint64_t j;
  uint64_t k;
  int v230;
  int v231;
  int v232;
  int v233;
  int v234;
  int v235;
  int v236;
  int v237;
  int v238;
  int v239;
  uint64_t m;
  unsigned __int8 *v241;
  unsigned __int8 v242;
  unsigned int v243;
  int v244;
  int v245;
  int v246;
  uint64_t v247;
  int v248;
  int v249;
  unsigned int v250;
  int v251;
  int v252;
  uint64_t result;
  uint64_t v254;
  unsigned __int8 *v255;
  int v256;
  int v257;
  char v258;
  int v259;
  char v260;
  int v261;
  int v262;
  uint64_t v263;
  int v264;
  uint64_t v265;
  uint64_t v266;
  int v267;
  unsigned __int8 *v268;
  BOOL v269;
  unsigned int v270;
  uint64_t v271;
  uint64_t v272;
  int v273;
  uint64_t v274;
  int v275;
  int v276;
  int v277;
  int v278;
  int v279;
  int v280;
  int v281;
  uint64_t v282;
  uint64_t v283;
  int v284;
  int v285;
  int v286;
  int v287;
  int v288;
  int v289;
  uint64_t v290;
  int v291;
  int v292;
  int v293;
  int v294;
  int v295;
  int v296;
  uint64_t v297;
  uint64_t v298;
  int v299;
  int v300;
  int v301;
  int v302;
  int v303;
  int v304;
  uint64_t v305;
  int v306;
  int v307;
  int v308;
  int v309;
  int v310;
  int v311;
  uint64_t v312;
  uint64_t v313;
  int v314;
  int v315;
  int v316;
  int v317;
  int v318;
  int v319;
  uint64_t v320;
  int v321;
  int v322;
  int v323;
  int v324;
  int v325;
  int v326;
  uint64_t v327;
  uint64_t v328;
  int v329;
  int v330;
  int v331;
  int v332;
  int v333;
  int v334;
  uint64_t v335;
  int v336;
  int v337;
  int v338;
  int v339;
  int v340;
  int v341;
  uint64_t v342;
  uint64_t v343;
  int v344;
  int v345;
  int v346;
  int v347;
  int v348;
  int v349;
  uint64_t v350;
  int v351;
  int v352;
  int v353;
  int v354;
  int v355;
  int v356;
  uint64_t v357;
  uint64_t v358;
  int v359;
  int v360;
  int v361;
  int v362;
  int v363;
  int v364;
  uint64_t v365;
  int v366;
  int v367;
  int v368;
  int v369;
  int v370;
  int v371;
  uint64_t v372;
  uint64_t v373;
  int v374;
  int v375;
  int v376;
  int v377;
  int v378;
  int v379;
  uint64_t v380;
  int v381;
  int v382;
  int v383;
  int v384;
  int v385;
  int v386;
  uint64_t v387;
  uint64_t v388;
  int v389;
  int v390;
  int v391;
  int v392;
  int v393;
  int v394;
  uint64_t v395;
  int v396;
  int v397;
  int v398;
  int v399;
  int v400;
  int v401;
  uint64_t v402;
  uint64_t v403;
  int v404;
  int v405;
  int v406;
  int v407;
  int v408;
  int v409;
  uint64_t v410;
  int v411;
  int v412;
  int v413;
  int v414;
  int v415;
  int v416;
  uint64_t v417;
  uint64_t v418;
  int v419;
  int v420;
  int v421;
  int v422;
  int v423;
  int v424;
  uint64_t v425;
  int v426;
  int v427;
  int v428;
  int v429;
  int v430;
  int v431;
  uint64_t v432;
  uint64_t v433;
  int v434;
  int v435;
  int v436;
  int v437;
  int v438;
  int v439;
  uint64_t v440;
  int v441;
  int v442;
  int v443;
  int v444;
  int v445;
  int v446;
  uint64_t v447;
  uint64_t v448;
  int v449;
  int v450;
  int v451;
  int v452;
  int v453;
  int v454;
  uint64_t v455;
  int v456;
  int v457;
  int v458;
  int v459;
  int v460;
  int v461;
  uint64_t v462;
  uint64_t v463;
  int v464;
  int v465;
  int v466;
  int v467;
  int v468;
  int v469;
  uint64_t v470;
  int v471;
  int v472;
  int v473;
  int v474;
  int v475;
  int v476;
  uint64_t v477;
  uint64_t v478;
  int v479;
  int v480;
  int v481;
  int v482;
  int v483;
  int v484;
  uint64_t v485;
  int v486;
  int v487;
  int v488;
  int v489;
  int v490;
  int v491;
  uint64_t v492;
  uint64_t v493;
  int v494;
  int v495;
  int v496;
  int v497;
  int v498;
  int v499;
  uint64_t v500;
  int v501;
  int v502;
  int v503;
  int v504;
  int v505;
  int v506;
  uint64_t v507;
  uint64_t v508;
  int v509;
  int v510;
  int v511;
  int v512;
  int v513;
  int v514;
  uint64_t v515;
  int v516;
  int v517;
  int v518;
  int v519;
  int v520;
  int v521;
  uint64_t v522;
  uint64_t v523;
  int v524;
  int v525;
  int v526;
  int v527;
  int v528;
  int v529;
  uint64_t v530;
  int v531;
  int v532;
  int v533;
  int v534;
  int v535;
  int v536;
  uint64_t v537;
  uint64_t v538;
  int v539;
  int v540;
  int v541;
  int v542;
  int v543;
  int v544;
  uint64_t v545;
  int v546;
  int v547;
  int v548;
  int v549;
  int v550;
  int v551;
  uint64_t v552;
  uint64_t v553;
  int v554;
  int v555;
  int v556;
  int v557;
  int v558;
  int v559;
  uint64_t v560;
  int v561;
  int v562;
  int v563;
  int v564;
  int v565;
  int v566;
  uint64_t v567;
  uint64_t v568;
  int v569;
  int v570;
  int v571;
  int v572;
  int v573;
  int v574;
  uint64_t v575;
  int v576;
  int v577;
  int v578;
  int v579;
  int v580;
  int v581;
  uint64_t v582;
  uint64_t v583;
  int v584;
  int v585;
  int v586;
  int v587;
  int v588;
  int v589;
  uint64_t v590;
  int v591;
  int v592;
  int v593;
  int v594;
  int v595;
  int v596;
  uint64_t v597;
  uint64_t v598;
  int v599;
  int v600;
  int v601;
  int v602;
  int v603;
  int v604;
  uint64_t v605;
  int v606;
  int v607;
  int v608;
  int v609;
  int v610;
  int v611;
  uint64_t v612;
  uint64_t v613;
  int v614;
  int v615;
  int v616;
  int v617;
  int v618;
  int v619;
  uint64_t v620;
  int v621;
  int v622;
  int v623;
  int v624;
  int v625;
  int v626;
  uint64_t v627;
  uint64_t v628;
  int v629;
  int v630;
  int v631;
  int v632;
  int v633;
  int v634;
  uint64_t v635;
  int v636;
  int v637;
  int v638;
  int v639;
  int v640;
  int v641;
  uint64_t v642;
  int v643;
  int v644;
  int v645;
  int v646;
  int v647;
  uint64_t v648;
  int v649;
  int v650;
  int v651;
  int v652;
  int v653;
  int *v654;
  _BOOL4 v655;
  size_t v656;
  unsigned __int8 *v657;
  int v658;
  int v659;
  uint64_t v660;
  uint64_t v661;
  _BOOL4 v662;
  uint64x2_t v663;
  int v664;
  uint64_t v665;
  uint64_t v666;
  unsigned int v667;
  _BYTE v668[16];
  _DWORD v669[6];
  _DWORD v670[3];
  uint64_t v671;

  v671 = *MEMORY[0x1E0C80C00];
  v654 = (int *)(a1 + 51648);
  v657 = (unsigned __int8 *)(a1 + 37708);
  v2 = *(_QWORD *)(a1 + 72);
  if (*(int *)(a1 + 656) >= 3)
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "      %d in block, %d after MTF & 1-2 coding, %d+2 syms in use\n", *(_DWORD *)(a1 + 108), *(_DWORD *)(a1 + 668), *(_DWORD *)(a1 + 124));
  v3 = 0;
  v4 = *(int *)(a1 + 124);
  v5 = v4 + 2;
  if ((int)v4 + 2 <= 1)
    v6 = 1;
  else
    v6 = v5;
  v660 = *(int *)(a1 + 124);
  do
  {
    if ((int)v4 >= -1)
    {
      memset((void *)(a1 + 37708 + v3), 15, v6);
      v4 = v660;
    }
    v3 += 258;
  }
  while (v3 != 1548);
  v658 = v5;
  v661 = v2;
  v7 = *(_DWORD *)(a1 + 668);
  if (v7 <= 0)
    sub_1DF268138(3001);
  v8 = 0;
  v9 = v7 > 0x95F;
  if (v7 <= 0x95F)
    v10 = 5;
  else
    v10 = 6;
  if (v7 >= 0x4B0)
  {
    v11 = v10;
  }
  else
  {
    v9 = 0;
    v11 = 4;
  }
  if (v7 >= 0x258)
  {
    v12 = v11;
  }
  else
  {
    v9 = 0;
    v12 = 3;
  }
  v13 = v7 >= 200 && v9;
  v662 = v13;
  if (v7 >= 200)
    v14 = v12;
  else
    v14 = 2;
  v15 = ((_DWORD)v6 + 1) & 0xFFFFFFFE;
  v656 = v6;
  v16 = (uint64x2_t)vdupq_n_s64(v6 - 1);
  v17 = a1 + 258 * v14;
  v18 = v17 + 37450;
  v19 = v17 + 37451;
  v20 = v14;
  v663 = v16;
  do
  {
    v21 = v8 - 1;
    v22 = 0;
    v23 = v7 / (int)v20 >= 1 && v21 <= (int)v4;
    if (v23)
    {
      v24 = v21;
      do
      {
        v21 = v24 + 1;
        v22 += *(_DWORD *)(a1 + 676 + 4 * v24);
      }
      while (v22 < v7 / (int)v20 && v24++ < v4);
    }
    if (v21 > v8 && v20 != v14 && v20 != 1 && (((_DWORD)v14 - (_DWORD)v20) & 0x80000001) == 1)
      v22 -= *(_DWORD *)(a1 + 4 * v21-- + 672);
    if (*(int *)(a1 + 656) >= 3)
    {
      v665 = v20;
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "      initial group %d, [%d .. %d], has %d syms (%4.1f%%)\n", v20, v8, v21, v22, (float)v22 * 100.0 / (float)*(int *)(a1 + 668));
      v20 = v665;
      v16 = v663;
      v4 = v660;
    }
    if ((int)v4 >= -1)
    {
      v26 = 0;
      v27 = (int64x2_t)xmmword_1DF26D0E0;
      do
      {
        v28 = vmovn_s64((int64x2_t)vcgeq_u64(v16, (uint64x2_t)v27));
        if ((v28.i8[0] & 1) != 0)
        {
          if (v26 > v21 || v26 < v8)
            v30 = 15;
          else
            v30 = 0;
          *(_BYTE *)(v18 + v26) = v30;
        }
        if ((v28.i8[4] & 1) != 0)
        {
          if (v26 + 1 > v21 || v26 + 1 < v8)
            v32 = 15;
          else
            v32 = 0;
          *(_BYTE *)(v19 + v26) = v32;
        }
        v26 += 2;
        v27 = vaddq_s64(v27, vdupq_n_s64(2uLL));
      }
      while (v15 != v26);
    }
    v8 = v21 + 1;
    v7 -= v22;
    v18 -= 258;
    v19 -= 258;
    v23 = v20-- <= 1;
  }
  while (!v23);
  v659 = 0;
  v33 = 4 * v656;
  v34 = v662;
  if ((int)v4 <= -2)
    v34 = 0;
  v655 = v34;
  v35 = a1 + 51640;
  do
  {
    bzero(v669, 4 * v14);
    v36 = v14;
    v37 = (char *)(a1 + 45448);
    v38 = v660;
    do
    {
      if (v38 >= -1)
      {
        bzero(v37, v33);
        v38 = v660;
      }
      v37 += 1032;
      --v36;
    }
    while (v36);
    if (v655)
    {
      v39 = v654;
      v40 = v656;
      v41 = v657;
      do
      {
        *(v39 - 2) = *v41 | (v41[258] << 16);
        *(v39 - 1) = v41[516] | (v41[774] << 16);
        *v39 = v41[1032] | (v41[1290] << 16);
        v39 += 4;
        ++v41;
        --v40;
      }
      while (v40);
    }
    v42 = *(_DWORD *)(a1 + 668);
    if (v42 < 1)
    {
      v667 = 0;
      v45 = 0;
    }
    else
    {
      v43 = 0;
      v44 = 0;
      v45 = 0;
      do
      {
        v664 = v45;
        v666 = v43;
        v46 = v44 + 49;
        bzero(v670, 2 * v14);
        if ((int)v46 >= v42)
          v47 = v42 - 1;
        else
          v47 = v44 + 49;
        v48 = v662;
        if (v47 - v44 != 49)
          v48 = 0;
        if (v48)
        {
          v49 = v661;
          v50 = (unsigned __int16 *)(v661 + 2 * v44);
          v51 = (_DWORD *)(v35 + 16 * *v50);
          v52 = (_DWORD *)(v35 + 16 * v50[1]);
          v53 = *v52 + *v51;
          v54 = v52[1] + v51[1];
          LODWORD(v51) = v52[2] + v51[2];
          v55 = (_DWORD *)(v35 + 16 * v50[2]);
          v56 = (_DWORD *)(v35 + 16 * v50[3]);
          v57 = v53 + *v55 + *v56;
          v58 = v54 + v55[1] + v56[1];
          LODWORD(v51) = (_DWORD)v51 + v55[2] + v56[2];
          v59 = (_DWORD *)(v35 + 16 * v50[4]);
          v60 = (_DWORD *)(v35 + 16 * v50[5]);
          v61 = *v59 + *v60;
          v62 = v59[1] + v60[1];
          LODWORD(v59) = v59[2] + v60[2];
          v63 = (_DWORD *)(v35 + 16 * v50[6]);
          v64 = v57 + v61 + *v63;
          v65 = v58 + v62 + v63[1];
          LODWORD(v51) = (_DWORD)v51 + (_DWORD)v59 + v63[2];
          v66 = (_DWORD *)(v35 + 16 * v50[7]);
          v67 = (_DWORD *)(v35 + 16 * v50[8]);
          v68 = *v66 + *v67;
          v69 = v66[1] + v67[1];
          LODWORD(v66) = v66[2] + v67[2];
          v70 = (_DWORD *)(v35 + 16 * v50[9]);
          v71 = v68 + *v70;
          v72 = v69 + v70[1];
          LODWORD(v66) = (_DWORD)v66 + v70[2];
          v73 = (_DWORD *)(v35 + 16 * v50[10]);
          v74 = v64 + v71 + *v73;
          v75 = v65 + v72 + v73[1];
          LODWORD(v51) = (_DWORD)v51 + (_DWORD)v66 + v73[2];
          v76 = (_DWORD *)(v35 + 16 * v50[11]);
          v77 = (_DWORD *)(v35 + 16 * v50[12]);
          v78 = *v76 + *v77;
          v79 = v76[1] + v77[1];
          LODWORD(v76) = v76[2] + v77[2];
          v80 = (_DWORD *)(v35 + 16 * v50[13]);
          v81 = v78 + *v80;
          v82 = v79 + v80[1];
          LODWORD(v76) = (_DWORD)v76 + v80[2];
          v83 = (_DWORD *)(v35 + 16 * v50[14]);
          v84 = v81 + *v83;
          v85 = v82 + v83[1];
          LODWORD(v76) = (_DWORD)v76 + v83[2];
          v86 = (_DWORD *)(v35 + 16 * v50[15]);
          v87 = v74 + v84 + *v86;
          v88 = v75 + v85 + v86[1];
          LODWORD(v76) = (_DWORD)v51 + (_DWORD)v76 + v86[2];
          v89 = (_DWORD *)(v35 + 16 * v50[16]);
          v90 = (_DWORD *)(v35 + 16 * v50[17]);
          v91 = *v89 + *v90;
          v92 = v89[1] + v90[1];
          LODWORD(v89) = v89[2] + v90[2];
          v93 = (_DWORD *)(v35 + 16 * v50[18]);
          v94 = v91 + *v93;
          v95 = v92 + v93[1];
          LODWORD(v89) = (_DWORD)v89 + v93[2];
          v96 = (_DWORD *)(v35 + 16 * v50[19]);
          v97 = v94 + *v96;
          v98 = v95 + v96[1];
          LODWORD(v89) = (_DWORD)v89 + v96[2];
          v99 = (_DWORD *)(v35 + 16 * v50[20]);
          v100 = v97 + *v99;
          v101 = v98 + v99[1];
          LODWORD(v99) = (_DWORD)v89 + v99[2];
          v102 = (_DWORD *)(v35 + 16 * v50[21]);
          LODWORD(v89) = v87 + v100 + *v102;
          v103 = v88 + v101 + v102[1];
          v104 = (_DWORD)v76 + (_DWORD)v99 + v102[2];
          v105 = (_DWORD *)(v35 + 16 * v50[22]);
          v106 = (_DWORD *)(v35 + 16 * v50[23]);
          v107 = *v105 + *v106;
          v108 = v105[1] + v106[1];
          LODWORD(v105) = v105[2] + v106[2];
          v109 = (_DWORD *)(v35 + 16 * v50[24]);
          v110 = v107 + *v109;
          v111 = v108 + v109[1];
          LODWORD(v105) = (_DWORD)v105 + v109[2];
          v112 = (_DWORD *)(v35 + 16 * v50[25]);
          v113 = v110 + *v112;
          v114 = v111 + v112[1];
          LODWORD(v105) = (_DWORD)v105 + v112[2];
          v115 = (_DWORD *)(v35 + 16 * v50[26]);
          v116 = v113 + *v115;
          v117 = v114 + v115[1];
          LODWORD(v105) = (_DWORD)v105 + v115[2];
          v118 = (_DWORD *)(v35 + 16 * v50[27]);
          v119 = v116 + *v118;
          v120 = v117 + v118[1];
          LODWORD(v105) = (_DWORD)v105 + v118[2];
          v121 = (_DWORD *)(v35 + 16 * v50[28]);
          LODWORD(v89) = (_DWORD)v89 + v119 + *v121;
          v122 = v103 + v120 + v121[1];
          v123 = v104 + (_DWORD)v105 + v121[2];
          v124 = (_DWORD *)(v35 + 16 * v50[29]);
          v125 = (_DWORD *)(v35 + 16 * v50[30]);
          v126 = *v124 + *v125;
          v127 = v124[1] + v125[1];
          LODWORD(v124) = v124[2] + v125[2];
          v128 = (_DWORD *)(v35 + 16 * v50[31]);
          v129 = v126 + *v128;
          v130 = v127 + v128[1];
          LODWORD(v124) = (_DWORD)v124 + v128[2];
          v131 = (_DWORD *)(v35 + 16 * v50[32]);
          v132 = v129 + *v131;
          v133 = v130 + v131[1];
          LODWORD(v124) = (_DWORD)v124 + v131[2];
          v134 = (_DWORD *)(v35 + 16 * v50[33]);
          v135 = v132 + *v134;
          v136 = v133 + v134[1];
          LODWORD(v124) = (_DWORD)v124 + v134[2];
          v137 = (_DWORD *)(v35 + 16 * v50[34]);
          v138 = v135 + *v137;
          v139 = v136 + v137[1];
          LODWORD(v124) = (_DWORD)v124 + v137[2];
          v140 = (_DWORD *)(v35 + 16 * v50[35]);
          v141 = v138 + *v140;
          v142 = v139 + v140[1];
          LODWORD(v124) = (_DWORD)v124 + v140[2];
          v143 = (_DWORD *)(v35 + 16 * v50[36]);
          LODWORD(v89) = (_DWORD)v89 + v141 + *v143;
          v144 = v122 + v142 + v143[1];
          v145 = v123 + (_DWORD)v124 + v143[2];
          v146 = (_DWORD *)(v35 + 16 * v50[37]);
          v147 = (_DWORD *)(v35 + 16 * v50[38]);
          v148 = *v146 + *v147;
          v149 = v146[1] + v147[1];
          LODWORD(v146) = v146[2] + v147[2];
          v150 = (_DWORD *)(v35 + 16 * v50[39]);
          v151 = v148 + *v150;
          v152 = v149 + v150[1];
          LODWORD(v146) = (_DWORD)v146 + v150[2];
          v153 = (_DWORD *)(v35 + 16 * v50[40]);
          v154 = v151 + *v153;
          v155 = v152 + v153[1];
          LODWORD(v146) = (_DWORD)v146 + v153[2];
          v156 = (_DWORD *)(v35 + 16 * v50[41]);
          v157 = v154 + *v156;
          v158 = v155 + v156[1];
          LODWORD(v146) = (_DWORD)v146 + v156[2];
          v159 = (_DWORD *)(v35 + 16 * v50[42]);
          v160 = v157 + *v159;
          v161 = v158 + v159[1];
          LODWORD(v146) = (_DWORD)v146 + v159[2];
          v162 = (_DWORD *)(v35 + 16 * v50[43]);
          v163 = v160 + *v162;
          v164 = v161 + v162[1];
          LODWORD(v146) = (_DWORD)v146 + v162[2];
          v165 = (_DWORD *)(v35 + 16 * v50[44]);
          v166 = v163 + *v165;
          v167 = v164 + v165[1];
          LODWORD(v146) = (_DWORD)v146 + v165[2];
          v168 = (_DWORD *)(v35 + 16 * v50[45]);
          LODWORD(v89) = (_DWORD)v89 + v166 + *v168;
          v169 = v144 + v167 + v168[1];
          v170 = v145 + (_DWORD)v146 + v168[2];
          v171 = (_DWORD *)(v35 + 16 * v50[46]);
          v172 = (_DWORD *)(v35 + 16 * v50[47]);
          v173 = (_DWORD *)(v35 + 16 * v50[48]);
          v174 = *v171 + *v172 + *v173;
          v175 = v171[1] + v172[1] + v173[1];
          LODWORD(v173) = v171[2] + v172[2] + v173[2];
          v176 = (_DWORD *)(v35 + 16 * *(unsigned __int16 *)(v661 + 2 * v46));
          v177 = v169 + v175 + v176[1];
          LODWORD(v173) = v170 + (_DWORD)v173 + v176[2];
          v670[0] = (_DWORD)v89 + v174 + *v176;
          v670[1] = v177;
          v670[2] = (_DWORD)v173;
          v178 = v666;
          v179 = v664;
        }
        else
        {
          v49 = v661;
          v178 = v666;
          v179 = v664;
          if (v47 >= v44)
          {
            v180 = v44;
            do
            {
              v181 = (unsigned __int8 *)(a1 + 37708 + *(unsigned __int16 *)(v661 + 2 * v180));
              v182 = v670;
              v183 = v14;
              do
              {
                *v182++ += *v181;
                v181 += 258;
                --v183;
              }
              while (v183);
              ++v180;
            }
            while (v47 + 1 != (_DWORD)v180);
          }
        }
        v184 = 0;
        v185 = -1;
        v186 = 999999999;
        do
        {
          v187 = *((unsigned __int16 *)v670 + v184);
          if (v186 > v187)
            v185 = v184;
          if (v186 >= v187)
            v186 = *((unsigned __int16 *)v670 + v184);
          ++v184;
        }
        while (v14 != v184);
        v188 = v185;
        ++v669[v185];
        *(_BYTE *)(a1 + v178 + 1704) = v185;
        if (v48)
        {
          v189 = (unsigned __int16 *)(v49 + 2 * v44);
          v190 = a1 + 1032 * v188 + 45448;
          ++*(_DWORD *)(v190 + 4 * *v189);
          ++*(_DWORD *)(v190 + 4 * v189[1]);
          ++*(_DWORD *)(v190 + 4 * v189[2]);
          ++*(_DWORD *)(v190 + 4 * v189[3]);
          ++*(_DWORD *)(v190 + 4 * v189[4]);
          ++*(_DWORD *)(v190 + 4 * v189[5]);
          ++*(_DWORD *)(v190 + 4 * v189[6]);
          ++*(_DWORD *)(v190 + 4 * v189[7]);
          ++*(_DWORD *)(v190 + 4 * v189[8]);
          ++*(_DWORD *)(v190 + 4 * v189[9]);
          ++*(_DWORD *)(v190 + 4 * v189[10]);
          ++*(_DWORD *)(v190 + 4 * v189[11]);
          ++*(_DWORD *)(v190 + 4 * v189[12]);
          ++*(_DWORD *)(v190 + 4 * v189[13]);
          ++*(_DWORD *)(v190 + 4 * v189[14]);
          ++*(_DWORD *)(v190 + 4 * v189[15]);
          ++*(_DWORD *)(v190 + 4 * v189[16]);
          ++*(_DWORD *)(v190 + 4 * v189[17]);
          ++*(_DWORD *)(v190 + 4 * v189[18]);
          ++*(_DWORD *)(v190 + 4 * v189[19]);
          ++*(_DWORD *)(v190 + 4 * v189[20]);
          ++*(_DWORD *)(v190 + 4 * v189[21]);
          ++*(_DWORD *)(v190 + 4 * v189[22]);
          ++*(_DWORD *)(v190 + 4 * v189[23]);
          ++*(_DWORD *)(v190 + 4 * v189[24]);
          ++*(_DWORD *)(v190 + 4 * v189[25]);
          ++*(_DWORD *)(v190 + 4 * v189[26]);
          ++*(_DWORD *)(v190 + 4 * v189[27]);
          ++*(_DWORD *)(v190 + 4 * v189[28]);
          ++*(_DWORD *)(v190 + 4 * v189[29]);
          ++*(_DWORD *)(v190 + 4 * v189[30]);
          ++*(_DWORD *)(v190 + 4 * v189[31]);
          ++*(_DWORD *)(v190 + 4 * v189[32]);
          ++*(_DWORD *)(v190 + 4 * v189[33]);
          ++*(_DWORD *)(v190 + 4 * v189[34]);
          ++*(_DWORD *)(v190 + 4 * v189[35]);
          ++*(_DWORD *)(v190 + 4 * v189[36]);
          ++*(_DWORD *)(v190 + 4 * v189[37]);
          ++*(_DWORD *)(v190 + 4 * v189[38]);
          ++*(_DWORD *)(v190 + 4 * v189[39]);
          ++*(_DWORD *)(v190 + 4 * v189[40]);
          ++*(_DWORD *)(v190 + 4 * v189[41]);
          ++*(_DWORD *)(v190 + 4 * v189[42]);
          ++*(_DWORD *)(v190 + 4 * v189[43]);
          ++*(_DWORD *)(v190 + 4 * v189[44]);
          ++*(_DWORD *)(v190 + 4 * v189[45]);
          ++*(_DWORD *)(v190 + 4 * v189[46]);
          ++*(_DWORD *)(v190 + 4 * v189[47]);
          ++*(_DWORD *)(v190 + 4 * v189[48]);
          v191 = *(unsigned __int16 *)(v49 + 2 * (v44 + 49));
          ++*(_DWORD *)(v190 + 4 * v191);
        }
        else if (v47 >= v44)
        {
          v192 = (unsigned __int16 *)(v49 + 2 * v44);
          v193 = v47 - v44 + 1;
          do
          {
            v194 = *v192++;
            v195 = a1 + 1032 * v188 + 4 * v194;
            ++*(_DWORD *)(v195 + 45448);
            --v193;
          }
          while (v193);
        }
        v45 = v186 + v179;
        v43 = v178 + 1;
        v44 = v47 + 1;
        v42 = *(_DWORD *)(a1 + 668);
      }
      while (v47 + 1 < v42);
      v667 = v43;
    }
    if (*(int *)(a1 + 656) >= 3)
    {
      v196 = (FILE **)MEMORY[0x1E0C80C10];
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "      pass %d: size is %d, grp uses are ", v659 + 1, v45 / 8);
      v197 = v669;
      v198 = v14;
      do
      {
        v199 = *v197++;
        fprintf(*v196, "%d ", v199);
        --v198;
      }
      while (v198);
      fputc(10, *v196);
    }
    v200 = v14;
    v202 = v657;
    v201 = a1 + 45448;
    do
    {
      sub_1DF26C9E8();
      v202 += 258;
      v201 += 1032;
      --v200;
    }
    while (v200);
    ++v659;
    v33 = 4 * v656;
  }
  while (v659 != 4);
  if (v667 >= 0x4653)
    sub_1DF268138(3003);
  for (i = 0; i != v14; ++i)
    v668[i] = i;
  if (v667)
  {
    v204 = 0;
    v205 = v668[0];
    do
    {
      v206 = *(unsigned __int8 *)(a1 + v204 + 1704);
      if (v206 == v205)
      {
        LOBYTE(v207) = 0;
      }
      else
      {
        v207 = 0;
        do
        {
          v208 = v668[v207 + 1];
          v668[++v207] = v205;
          LOBYTE(v205) = v208;
        }
        while (v206 != v208);
        v205 = v206;
      }
      *(_BYTE *)(a1 + v204++ + 19706) = v207;
    }
    while (v204 != v667);
  }
  v209 = 0;
  v210 = (unsigned __int8 *)(a1 + 37708);
  do
  {
    if ((int)v660 < -1)
    {
      v211 = 0;
      v212 = 32;
    }
    else
    {
      v211 = 0;
      v212 = 32;
      v213 = v656;
      v214 = v210;
      do
      {
        v216 = *v214++;
        v215 = v216;
        if (v211 <= v216)
          v211 = v215;
        if (v212 >= v215)
          v212 = v215;
        --v213;
      }
      while (v213);
      if (v211 >= 0x12)
        sub_1DF268138(3004);
      if (v212 <= 0)
        sub_1DF268138(3005);
    }
    sub_1DF26CDE0((_DWORD *)(a1 + 1032 * v209 + 39256), (unsigned __int8 *)(a1 + 258 * v209 + 37708), v212, v211, v658);
    ++v209;
    v210 += 258;
  }
  while (v209 != v14);
  v217 = 0;
  v218 = (FILE **)MEMORY[0x1E0C80C10];
  do
  {
    v668[v217] = 0;
    v219 = vtstq_s8(*(int8x16_t *)(a1 + 128 + 16 * v217), *(int8x16_t *)(a1 + 128 + 16 * v217));
    if ((v219.i8[0] & 1) != 0
      || (v219.i8[1] & 1) != 0
      || (v219.i8[2] & 1) != 0
      || (v219.i8[3] & 1) != 0
      || (v219.i8[4] & 1) != 0
      || (v219.i8[5] & 1) != 0
      || (v219.i8[6] & 1) != 0
      || (v219.i8[7] & 1) != 0
      || (v219.i8[8] & 1) != 0
      || (v219.i8[9] & 1) != 0
      || (v219.i8[10] & 1) != 0
      || (v219.i8[11] & 1) != 0
      || (v219.i8[12] & 1) != 0
      || (v219.i8[13] & 1) != 0
      || (v219.i8[14] & 1) != 0
      || (v219.i8[15] & 1) != 0)
    {
      v668[v217] = 1;
    }
    ++v217;
  }
  while (v217 != 16);
  v220 = 0;
  v221 = *(_DWORD *)(a1 + 116);
  v222 = v221;
  do
  {
    v223 = *(_DWORD *)(a1 + 644);
    v224 = *(_DWORD *)(a1 + 640);
    if (v668[v220])
    {
      if (v223 >= 8)
      {
        do
        {
          *(_BYTE *)(*(_QWORD *)(a1 + 80) + v222) = HIBYTE(v224);
          v222 = *(_DWORD *)(a1 + 116) + 1;
          *(_DWORD *)(a1 + 116) = v222;
          v224 = *(_DWORD *)(a1 + 640) << 8;
          *(_DWORD *)(a1 + 640) = v224;
          v225 = *(_DWORD *)(a1 + 644);
          v223 = v225 - 8;
          *(_DWORD *)(a1 + 644) = v225 - 8;
        }
        while (v225 > 15);
      }
      v224 |= 0x80000000 >> v223;
    }
    else if (v223 >= 8)
    {
      do
      {
        *(_BYTE *)(*(_QWORD *)(a1 + 80) + v222) = HIBYTE(v224);
        v222 = *(_DWORD *)(a1 + 116) + 1;
        *(_DWORD *)(a1 + 116) = v222;
        v224 = *(_DWORD *)(a1 + 640) << 8;
        *(_DWORD *)(a1 + 640) = v224;
        v226 = *(_DWORD *)(a1 + 644);
        v223 = v226 - 8;
        *(_DWORD *)(a1 + 644) = v226 - 8;
      }
      while (v226 > 15);
    }
    v227 = v223 + 1;
    *(_DWORD *)(a1 + 640) = v224;
    *(_DWORD *)(a1 + 644) = v227;
    ++v220;
  }
  while (v220 != 16);
  for (j = 0; j != 16; ++j)
  {
    if (v668[j])
    {
      for (k = 0; k != 16; ++k)
      {
        if (*(_BYTE *)(a1 + k + 16 * j + 128))
        {
          if (v227 >= 8)
          {
            do
            {
              *(_BYTE *)(*(_QWORD *)(a1 + 80) + v222) = HIBYTE(v224);
              v222 = *(_DWORD *)(a1 + 116) + 1;
              *(_DWORD *)(a1 + 116) = v222;
              v224 = *(_DWORD *)(a1 + 640) << 8;
              *(_DWORD *)(a1 + 640) = v224;
              v230 = *(_DWORD *)(a1 + 644);
              v227 = v230 - 8;
              *(_DWORD *)(a1 + 644) = v230 - 8;
            }
            while (v230 > 15);
          }
          v224 |= 0x80000000 >> v227;
        }
        else if (v227 >= 8)
        {
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v222) = HIBYTE(v224);
            v222 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v222;
            v224 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v224;
            v231 = *(_DWORD *)(a1 + 644);
            v227 = v231 - 8;
            *(_DWORD *)(a1 + 644) = v231 - 8;
          }
          while (v231 > 15);
        }
        ++v227;
        *(_DWORD *)(a1 + 640) = v224;
        *(_DWORD *)(a1 + 644) = v227;
      }
    }
  }
  if (*(int *)(a1 + 656) >= 3)
  {
    fprintf(*v218, "      bytes: mapping %d, ", v222 - v221);
    v222 = *(_DWORD *)(a1 + 116);
    v227 = *(_DWORD *)(a1 + 644);
  }
  v232 = *(_DWORD *)(a1 + 640);
  v233 = v222;
  if (v227 >= 8)
  {
    do
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 80) + v233) = HIBYTE(v232);
      v233 = *(_DWORD *)(a1 + 116) + 1;
      *(_DWORD *)(a1 + 116) = v233;
      v232 = *(_DWORD *)(a1 + 640) << 8;
      *(_DWORD *)(a1 + 640) = v232;
      v234 = *(_DWORD *)(a1 + 644);
      v227 = v234 - 8;
      *(_DWORD *)(a1 + 644) = v234 - 8;
    }
    while (v234 > 15);
  }
  v235 = v227 + 3;
  v236 = ((_DWORD)v14 << (29 - v227)) | v232;
  *(_DWORD *)(a1 + 640) = v236;
  *(_DWORD *)(a1 + 644) = v227 + 3;
  if (v227 >= 5)
  {
    do
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 80) + v233) = HIBYTE(v236);
      v233 = *(_DWORD *)(a1 + 116) + 1;
      *(_DWORD *)(a1 + 116) = v233;
      v236 = *(_DWORD *)(a1 + 640) << 8;
      *(_DWORD *)(a1 + 640) = v236;
      v237 = *(_DWORD *)(a1 + 644);
      v235 = v237 - 8;
      *(_DWORD *)(a1 + 644) = v237 - 8;
    }
    while (v237 > 15);
  }
  v238 = v235 + 15;
  v239 = (v667 << (17 - v235)) | v236;
  *(_DWORD *)(a1 + 640) = v239;
  *(_DWORD *)(a1 + 644) = v235 + 15;
  if (v667)
  {
    for (m = 0; m != v667; ++m)
    {
      v241 = (unsigned __int8 *)(a1 + m + 19706);
      v242 = *v241;
      if (*v241)
      {
        v243 = 0;
        do
        {
          if (v238 >= 8)
          {
            do
            {
              *(_BYTE *)(*(_QWORD *)(a1 + 80) + v233) = HIBYTE(v239);
              v233 = *(_DWORD *)(a1 + 116) + 1;
              *(_DWORD *)(a1 + 116) = v233;
              v239 = *(_DWORD *)(a1 + 640) << 8;
              *(_DWORD *)(a1 + 640) = v239;
              v244 = *(_DWORD *)(a1 + 644);
              v238 = v244 - 8;
              *(_DWORD *)(a1 + 644) = v244 - 8;
            }
            while (v244 > 15);
            v242 = *v241;
          }
          v245 = v238 + 1;
          v239 |= 0x80000000 >> v238;
          *(_DWORD *)(a1 + 640) = v239;
          *(_DWORD *)(a1 + 644) = v238 + 1;
          ++v243;
          ++v238;
        }
        while (v243 < v242);
      }
      else
      {
        v245 = v238;
      }
      if (v245 >= 8)
      {
        do
        {
          *(_BYTE *)(*(_QWORD *)(a1 + 80) + v233) = HIBYTE(v239);
          v233 = *(_DWORD *)(a1 + 116) + 1;
          *(_DWORD *)(a1 + 116) = v233;
          v239 = *(_DWORD *)(a1 + 640) << 8;
          *(_DWORD *)(a1 + 640) = v239;
          v246 = *(_DWORD *)(a1 + 644);
          v245 = v246 - 8;
          *(_DWORD *)(a1 + 644) = v246 - 8;
        }
        while (v246 > 15);
      }
      v238 = v245 + 1;
      *(_DWORD *)(a1 + 640) = v239;
      *(_DWORD *)(a1 + 644) = v245 + 1;
    }
  }
  if (*(int *)(a1 + 656) >= 3)
  {
    fprintf(*v218, "selectors %d, ", v233 - v222);
    v233 = *(_DWORD *)(a1 + 116);
    v238 = *(_DWORD *)(a1 + 644);
  }
  v247 = 0;
  v248 = v233;
  do
  {
    v249 = *(unsigned __int8 *)(a1 + 258 * v247 + 37708);
    v250 = *(_DWORD *)(a1 + 640);
    if (v238 >= 8)
    {
      do
      {
        *(_BYTE *)(*(_QWORD *)(a1 + 80) + v248) = HIBYTE(v250);
        v248 = *(_DWORD *)(a1 + 116) + 1;
        *(_DWORD *)(a1 + 116) = v248;
        v250 = *(_DWORD *)(a1 + 640) << 8;
        *(_DWORD *)(a1 + 640) = v250;
        v251 = *(_DWORD *)(a1 + 644);
        v238 = v251 - 8;
        *(_DWORD *)(a1 + 644) = v251 - 8;
      }
      while (v251 > 15);
    }
    v252 = v238 + 5;
    result = (v249 << (27 - v238)) | v250;
    *(_DWORD *)(a1 + 640) = result;
    *(_DWORD *)(a1 + 644) = v238 + 5;
    if ((int)v660 >= -1)
    {
      v254 = 0;
      do
      {
        v255 = (unsigned __int8 *)(a1 + 258 * v247 + v254 + 37708);
        while (1)
        {
          v256 = *v255;
          if (v249 >= v256)
            break;
          if (v252 >= 8)
          {
            do
            {
              *(_BYTE *)(*(_QWORD *)(a1 + 80) + v248) = BYTE3(result);
              v248 = *(_DWORD *)(a1 + 116) + 1;
              *(_DWORD *)(a1 + 116) = v248;
              LODWORD(result) = *(_DWORD *)(a1 + 640) << 8;
              *(_DWORD *)(a1 + 640) = result;
              v257 = *(_DWORD *)(a1 + 644);
              v252 = v257 - 8;
              *(_DWORD *)(a1 + 644) = v257 - 8;
            }
            while (v257 > 15);
          }
          v258 = 30 - v252;
          v252 += 2;
          result = (2 << v258) | result;
          *(_DWORD *)(a1 + 640) = result;
          *(_DWORD *)(a1 + 644) = v252;
          ++v249;
        }
        while (v249 > v256)
        {
          if (v252 >= 8)
          {
            do
            {
              *(_BYTE *)(*(_QWORD *)(a1 + 80) + v248) = BYTE3(result);
              v248 = *(_DWORD *)(a1 + 116) + 1;
              *(_DWORD *)(a1 + 116) = v248;
              LODWORD(result) = *(_DWORD *)(a1 + 640) << 8;
              *(_DWORD *)(a1 + 640) = result;
              v259 = *(_DWORD *)(a1 + 644);
              v252 = v259 - 8;
              *(_DWORD *)(a1 + 644) = v259 - 8;
            }
            while (v259 > 15);
          }
          v260 = 30 - v252;
          v252 += 2;
          result = (3 << v260) | result;
          *(_DWORD *)(a1 + 640) = result;
          *(_DWORD *)(a1 + 644) = v252;
          --v249;
          v256 = *v255;
        }
        if (v252 >= 8)
        {
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v248) = BYTE3(result);
            v248 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v248;
            result = (*(_DWORD *)(a1 + 640) << 8);
            *(_DWORD *)(a1 + 640) = result;
            v261 = *(_DWORD *)(a1 + 644);
            v252 = v261 - 8;
            *(_DWORD *)(a1 + 644) = v261 - 8;
          }
          while (v261 > 15);
        }
        ++v252;
        *(_DWORD *)(a1 + 640) = result;
        *(_DWORD *)(a1 + 644) = v252;
        ++v254;
      }
      while (v254 != v656);
    }
    ++v247;
    v238 = v252;
  }
  while (v247 != v14);
  if (*(int *)(a1 + 656) >= 3)
  {
    result = fprintf(*v218, "code lengths %d, ", v248 - v233);
    v248 = *(_DWORD *)(a1 + 116);
  }
  v262 = *(_DWORD *)(a1 + 668);
  if (v262 < 1)
  {
    LODWORD(v263) = 0;
  }
  else
  {
    v263 = 0;
    v264 = 0;
    do
    {
      v265 = v264;
      v266 = v264 + 49;
      if ((int)v266 >= v262)
        v267 = v262 - 1;
      else
        v267 = v264 + 49;
      if (v14 <= *(unsigned __int8 *)(a1 + v263 + 1704))
        sub_1DF268138(3006);
      v268 = (unsigned __int8 *)(a1 + v263 + 1704);
      v269 = v662;
      if (v267 - (_DWORD)v265 != 49)
        v269 = 0;
      if (v269)
      {
        v270 = *v268;
        v271 = a1 + 258 * *v268 + 37708;
        v272 = *(unsigned __int16 *)(v661 + 2 * v265);
        v273 = *(unsigned __int8 *)(v271 + v272);
        v274 = a1 + 1032 * v270 + 39256;
        v275 = *(_DWORD *)(v274 + 4 * v272);
        v276 = *(_DWORD *)(a1 + 644);
        v277 = *(_DWORD *)(a1 + 640);
        if (v276 >= 8)
        {
          v278 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v278) = HIBYTE(v277);
            v278 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v278;
            v277 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v277;
            v279 = *(_DWORD *)(a1 + 644);
            v276 = v279 - 8;
            *(_DWORD *)(a1 + 644) = v279 - 8;
          }
          while (v279 > 15);
        }
        v280 = v276 + v273;
        v281 = (v275 << -(char)(v276 + v273)) | v277;
        *(_DWORD *)(a1 + 640) = v281;
        *(_DWORD *)(a1 + 644) = v280;
        v282 = v661 + 2 * v265;
        v283 = *(unsigned __int16 *)(v282 + 2);
        v284 = *(unsigned __int8 *)(v271 + v283);
        v285 = *(_DWORD *)(v274 + 4 * v283);
        if (v280 >= 8)
        {
          v286 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v286) = HIBYTE(v281);
            v286 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v286;
            v281 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v281;
            v287 = *(_DWORD *)(a1 + 644);
            v280 = v287 - 8;
            *(_DWORD *)(a1 + 644) = v287 - 8;
          }
          while (v287 > 15);
        }
        v288 = v280 + v284;
        v289 = (v285 << -(char)v288) | v281;
        *(_DWORD *)(a1 + 640) = v289;
        *(_DWORD *)(a1 + 644) = v288;
        v290 = *(unsigned __int16 *)(v282 + 4);
        v291 = *(unsigned __int8 *)(v271 + v290);
        v292 = *(_DWORD *)(v274 + 4 * v290);
        if (v288 >= 8)
        {
          v293 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v293) = HIBYTE(v289);
            v293 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v293;
            v289 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v289;
            v294 = *(_DWORD *)(a1 + 644);
            v288 = v294 - 8;
            *(_DWORD *)(a1 + 644) = v294 - 8;
          }
          while (v294 > 15);
        }
        v295 = v288 + v291;
        v296 = (v292 << -(char)(v288 + v291)) | v289;
        *(_DWORD *)(a1 + 640) = v296;
        *(_DWORD *)(a1 + 644) = v288 + v291;
        v297 = v661 + 2 * v265;
        v298 = *(unsigned __int16 *)(v297 + 6);
        v299 = *(unsigned __int8 *)(v271 + v298);
        v300 = *(_DWORD *)(v274 + 4 * v298);
        if (v295 >= 8)
        {
          v301 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v301) = HIBYTE(v296);
            v301 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v301;
            v296 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v296;
            v302 = *(_DWORD *)(a1 + 644);
            v295 = v302 - 8;
            *(_DWORD *)(a1 + 644) = v302 - 8;
          }
          while (v302 > 15);
        }
        v303 = v295 + v299;
        v304 = (v300 << -(char)v303) | v296;
        *(_DWORD *)(a1 + 640) = v304;
        *(_DWORD *)(a1 + 644) = v303;
        v305 = *(unsigned __int16 *)(v297 + 8);
        v306 = *(unsigned __int8 *)(v271 + v305);
        v307 = *(_DWORD *)(v274 + 4 * v305);
        if (v303 >= 8)
        {
          v308 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v308) = HIBYTE(v304);
            v308 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v308;
            v304 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v304;
            v309 = *(_DWORD *)(a1 + 644);
            v303 = v309 - 8;
            *(_DWORD *)(a1 + 644) = v309 - 8;
          }
          while (v309 > 15);
        }
        v310 = v303 + v306;
        v311 = (v307 << -(char)(v303 + v306)) | v304;
        *(_DWORD *)(a1 + 640) = v311;
        *(_DWORD *)(a1 + 644) = v303 + v306;
        v312 = v661 + 2 * v265;
        v313 = *(unsigned __int16 *)(v312 + 10);
        v314 = *(unsigned __int8 *)(v271 + v313);
        v315 = *(_DWORD *)(v274 + 4 * v313);
        if (v310 >= 8)
        {
          v316 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v316) = HIBYTE(v311);
            v316 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v316;
            v311 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v311;
            v317 = *(_DWORD *)(a1 + 644);
            v310 = v317 - 8;
            *(_DWORD *)(a1 + 644) = v317 - 8;
          }
          while (v317 > 15);
        }
        v318 = v310 + v314;
        v319 = (v315 << -(char)v318) | v311;
        *(_DWORD *)(a1 + 640) = v319;
        *(_DWORD *)(a1 + 644) = v318;
        v320 = *(unsigned __int16 *)(v312 + 12);
        v321 = *(unsigned __int8 *)(v271 + v320);
        v322 = *(_DWORD *)(v274 + 4 * v320);
        if (v318 >= 8)
        {
          v323 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v323) = HIBYTE(v319);
            v323 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v323;
            v319 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v319;
            v324 = *(_DWORD *)(a1 + 644);
            v318 = v324 - 8;
            *(_DWORD *)(a1 + 644) = v324 - 8;
          }
          while (v324 > 15);
        }
        v325 = v318 + v321;
        v326 = (v322 << -(char)(v318 + v321)) | v319;
        *(_DWORD *)(a1 + 640) = v326;
        *(_DWORD *)(a1 + 644) = v318 + v321;
        v327 = v661 + 2 * v265;
        v328 = *(unsigned __int16 *)(v327 + 14);
        v329 = *(unsigned __int8 *)(v271 + v328);
        v330 = *(_DWORD *)(v274 + 4 * v328);
        if (v325 >= 8)
        {
          v331 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v331) = HIBYTE(v326);
            v331 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v331;
            v326 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v326;
            v332 = *(_DWORD *)(a1 + 644);
            v325 = v332 - 8;
            *(_DWORD *)(a1 + 644) = v332 - 8;
          }
          while (v332 > 15);
        }
        v333 = v325 + v329;
        v334 = (v330 << -(char)v333) | v326;
        *(_DWORD *)(a1 + 640) = v334;
        *(_DWORD *)(a1 + 644) = v333;
        v335 = *(unsigned __int16 *)(v327 + 16);
        v336 = *(unsigned __int8 *)(v271 + v335);
        v337 = *(_DWORD *)(v274 + 4 * v335);
        if (v333 >= 8)
        {
          v338 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v338) = HIBYTE(v334);
            v338 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v338;
            v334 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v334;
            v339 = *(_DWORD *)(a1 + 644);
            v333 = v339 - 8;
            *(_DWORD *)(a1 + 644) = v339 - 8;
          }
          while (v339 > 15);
        }
        v340 = v333 + v336;
        v341 = (v337 << -(char)(v333 + v336)) | v334;
        *(_DWORD *)(a1 + 640) = v341;
        *(_DWORD *)(a1 + 644) = v333 + v336;
        v342 = v661 + 2 * v265;
        v343 = *(unsigned __int16 *)(v342 + 18);
        v344 = *(unsigned __int8 *)(v271 + v343);
        v345 = *(_DWORD *)(v274 + 4 * v343);
        if (v340 >= 8)
        {
          v346 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v346) = HIBYTE(v341);
            v346 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v346;
            v341 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v341;
            v347 = *(_DWORD *)(a1 + 644);
            v340 = v347 - 8;
            *(_DWORD *)(a1 + 644) = v347 - 8;
          }
          while (v347 > 15);
        }
        v348 = v340 + v344;
        v349 = (v345 << -(char)v348) | v341;
        *(_DWORD *)(a1 + 640) = v349;
        *(_DWORD *)(a1 + 644) = v348;
        v350 = *(unsigned __int16 *)(v342 + 20);
        v351 = *(unsigned __int8 *)(v271 + v350);
        v352 = *(_DWORD *)(v274 + 4 * v350);
        if (v348 >= 8)
        {
          v353 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v353) = HIBYTE(v349);
            v353 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v353;
            v349 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v349;
            v354 = *(_DWORD *)(a1 + 644);
            v348 = v354 - 8;
            *(_DWORD *)(a1 + 644) = v354 - 8;
          }
          while (v354 > 15);
        }
        v355 = v348 + v351;
        v356 = (v352 << -(char)(v348 + v351)) | v349;
        *(_DWORD *)(a1 + 640) = v356;
        *(_DWORD *)(a1 + 644) = v348 + v351;
        v357 = v661 + 2 * v265;
        v358 = *(unsigned __int16 *)(v357 + 22);
        v359 = *(unsigned __int8 *)(v271 + v358);
        v360 = *(_DWORD *)(v274 + 4 * v358);
        if (v355 >= 8)
        {
          v361 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v361) = HIBYTE(v356);
            v361 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v361;
            v356 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v356;
            v362 = *(_DWORD *)(a1 + 644);
            v355 = v362 - 8;
            *(_DWORD *)(a1 + 644) = v362 - 8;
          }
          while (v362 > 15);
        }
        v363 = v355 + v359;
        v364 = (v360 << -(char)v363) | v356;
        *(_DWORD *)(a1 + 640) = v364;
        *(_DWORD *)(a1 + 644) = v363;
        v365 = *(unsigned __int16 *)(v357 + 24);
        v366 = *(unsigned __int8 *)(v271 + v365);
        v367 = *(_DWORD *)(v274 + 4 * v365);
        if (v363 >= 8)
        {
          v368 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v368) = HIBYTE(v364);
            v368 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v368;
            v364 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v364;
            v369 = *(_DWORD *)(a1 + 644);
            v363 = v369 - 8;
            *(_DWORD *)(a1 + 644) = v369 - 8;
          }
          while (v369 > 15);
        }
        v370 = v363 + v366;
        v371 = (v367 << -(char)(v363 + v366)) | v364;
        *(_DWORD *)(a1 + 640) = v371;
        *(_DWORD *)(a1 + 644) = v363 + v366;
        v372 = v661 + 2 * v265;
        v373 = *(unsigned __int16 *)(v372 + 26);
        v374 = *(unsigned __int8 *)(v271 + v373);
        v375 = *(_DWORD *)(v274 + 4 * v373);
        if (v370 >= 8)
        {
          v376 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v376) = HIBYTE(v371);
            v376 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v376;
            v371 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v371;
            v377 = *(_DWORD *)(a1 + 644);
            v370 = v377 - 8;
            *(_DWORD *)(a1 + 644) = v377 - 8;
          }
          while (v377 > 15);
        }
        v378 = v370 + v374;
        v379 = (v375 << -(char)v378) | v371;
        *(_DWORD *)(a1 + 640) = v379;
        *(_DWORD *)(a1 + 644) = v378;
        v380 = *(unsigned __int16 *)(v372 + 28);
        v381 = *(unsigned __int8 *)(v271 + v380);
        v382 = *(_DWORD *)(v274 + 4 * v380);
        if (v378 >= 8)
        {
          v383 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v383) = HIBYTE(v379);
            v383 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v383;
            v379 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v379;
            v384 = *(_DWORD *)(a1 + 644);
            v378 = v384 - 8;
            *(_DWORD *)(a1 + 644) = v384 - 8;
          }
          while (v384 > 15);
        }
        v385 = v378 + v381;
        v386 = (v382 << -(char)(v378 + v381)) | v379;
        *(_DWORD *)(a1 + 640) = v386;
        *(_DWORD *)(a1 + 644) = v378 + v381;
        v387 = v661 + 2 * v265;
        v388 = *(unsigned __int16 *)(v387 + 30);
        v389 = *(unsigned __int8 *)(v271 + v388);
        v390 = *(_DWORD *)(v274 + 4 * v388);
        if (v385 >= 8)
        {
          v391 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v391) = HIBYTE(v386);
            v391 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v391;
            v386 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v386;
            v392 = *(_DWORD *)(a1 + 644);
            v385 = v392 - 8;
            *(_DWORD *)(a1 + 644) = v392 - 8;
          }
          while (v392 > 15);
        }
        v393 = v385 + v389;
        v394 = (v390 << -(char)v393) | v386;
        *(_DWORD *)(a1 + 640) = v394;
        *(_DWORD *)(a1 + 644) = v393;
        v395 = *(unsigned __int16 *)(v387 + 32);
        v396 = *(unsigned __int8 *)(v271 + v395);
        v397 = *(_DWORD *)(v274 + 4 * v395);
        if (v393 >= 8)
        {
          v398 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v398) = HIBYTE(v394);
            v398 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v398;
            v394 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v394;
            v399 = *(_DWORD *)(a1 + 644);
            v393 = v399 - 8;
            *(_DWORD *)(a1 + 644) = v399 - 8;
          }
          while (v399 > 15);
        }
        v400 = v393 + v396;
        v401 = (v397 << -(char)(v393 + v396)) | v394;
        *(_DWORD *)(a1 + 640) = v401;
        *(_DWORD *)(a1 + 644) = v393 + v396;
        v402 = v661 + 2 * v265;
        v403 = *(unsigned __int16 *)(v402 + 34);
        v404 = *(unsigned __int8 *)(v271 + v403);
        v405 = *(_DWORD *)(v274 + 4 * v403);
        if (v400 >= 8)
        {
          v406 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v406) = HIBYTE(v401);
            v406 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v406;
            v401 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v401;
            v407 = *(_DWORD *)(a1 + 644);
            v400 = v407 - 8;
            *(_DWORD *)(a1 + 644) = v407 - 8;
          }
          while (v407 > 15);
        }
        v408 = v400 + v404;
        v409 = (v405 << -(char)v408) | v401;
        *(_DWORD *)(a1 + 640) = v409;
        *(_DWORD *)(a1 + 644) = v408;
        v410 = *(unsigned __int16 *)(v402 + 36);
        v411 = *(unsigned __int8 *)(v271 + v410);
        v412 = *(_DWORD *)(v274 + 4 * v410);
        if (v408 >= 8)
        {
          v413 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v413) = HIBYTE(v409);
            v413 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v413;
            v409 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v409;
            v414 = *(_DWORD *)(a1 + 644);
            v408 = v414 - 8;
            *(_DWORD *)(a1 + 644) = v414 - 8;
          }
          while (v414 > 15);
        }
        v415 = v408 + v411;
        v416 = (v412 << -(char)(v408 + v411)) | v409;
        *(_DWORD *)(a1 + 640) = v416;
        *(_DWORD *)(a1 + 644) = v408 + v411;
        v417 = v661 + 2 * v265;
        v418 = *(unsigned __int16 *)(v417 + 38);
        v419 = *(unsigned __int8 *)(v271 + v418);
        v420 = *(_DWORD *)(v274 + 4 * v418);
        if (v415 >= 8)
        {
          v421 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v421) = HIBYTE(v416);
            v421 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v421;
            v416 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v416;
            v422 = *(_DWORD *)(a1 + 644);
            v415 = v422 - 8;
            *(_DWORD *)(a1 + 644) = v422 - 8;
          }
          while (v422 > 15);
        }
        v423 = v415 + v419;
        v424 = (v420 << -(char)v423) | v416;
        *(_DWORD *)(a1 + 640) = v424;
        *(_DWORD *)(a1 + 644) = v423;
        v425 = *(unsigned __int16 *)(v417 + 40);
        v426 = *(unsigned __int8 *)(v271 + v425);
        v427 = *(_DWORD *)(v274 + 4 * v425);
        if (v423 >= 8)
        {
          v428 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v428) = HIBYTE(v424);
            v428 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v428;
            v424 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v424;
            v429 = *(_DWORD *)(a1 + 644);
            v423 = v429 - 8;
            *(_DWORD *)(a1 + 644) = v429 - 8;
          }
          while (v429 > 15);
        }
        v430 = v423 + v426;
        v431 = (v427 << -(char)(v423 + v426)) | v424;
        *(_DWORD *)(a1 + 640) = v431;
        *(_DWORD *)(a1 + 644) = v423 + v426;
        v432 = v661 + 2 * v265;
        v433 = *(unsigned __int16 *)(v432 + 42);
        v434 = *(unsigned __int8 *)(v271 + v433);
        v435 = *(_DWORD *)(v274 + 4 * v433);
        if (v430 >= 8)
        {
          v436 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v436) = HIBYTE(v431);
            v436 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v436;
            v431 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v431;
            v437 = *(_DWORD *)(a1 + 644);
            v430 = v437 - 8;
            *(_DWORD *)(a1 + 644) = v437 - 8;
          }
          while (v437 > 15);
        }
        v438 = v430 + v434;
        v439 = (v435 << -(char)v438) | v431;
        *(_DWORD *)(a1 + 640) = v439;
        *(_DWORD *)(a1 + 644) = v438;
        v440 = *(unsigned __int16 *)(v432 + 44);
        v441 = *(unsigned __int8 *)(v271 + v440);
        v442 = *(_DWORD *)(v274 + 4 * v440);
        if (v438 >= 8)
        {
          v443 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v443) = HIBYTE(v439);
            v443 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v443;
            v439 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v439;
            v444 = *(_DWORD *)(a1 + 644);
            v438 = v444 - 8;
            *(_DWORD *)(a1 + 644) = v444 - 8;
          }
          while (v444 > 15);
        }
        v445 = v438 + v441;
        v446 = (v442 << -(char)(v438 + v441)) | v439;
        *(_DWORD *)(a1 + 640) = v446;
        *(_DWORD *)(a1 + 644) = v438 + v441;
        v447 = v661 + 2 * v265;
        v448 = *(unsigned __int16 *)(v447 + 46);
        v449 = *(unsigned __int8 *)(v271 + v448);
        v450 = *(_DWORD *)(v274 + 4 * v448);
        if (v445 >= 8)
        {
          v451 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v451) = HIBYTE(v446);
            v451 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v451;
            v446 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v446;
            v452 = *(_DWORD *)(a1 + 644);
            v445 = v452 - 8;
            *(_DWORD *)(a1 + 644) = v452 - 8;
          }
          while (v452 > 15);
        }
        v453 = v445 + v449;
        v454 = (v450 << -(char)v453) | v446;
        *(_DWORD *)(a1 + 640) = v454;
        *(_DWORD *)(a1 + 644) = v453;
        v455 = *(unsigned __int16 *)(v447 + 48);
        v456 = *(unsigned __int8 *)(v271 + v455);
        v457 = *(_DWORD *)(v274 + 4 * v455);
        if (v453 >= 8)
        {
          v458 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v458) = HIBYTE(v454);
            v458 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v458;
            v454 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v454;
            v459 = *(_DWORD *)(a1 + 644);
            v453 = v459 - 8;
            *(_DWORD *)(a1 + 644) = v459 - 8;
          }
          while (v459 > 15);
        }
        v460 = v453 + v456;
        v461 = (v457 << -(char)(v453 + v456)) | v454;
        *(_DWORD *)(a1 + 640) = v461;
        *(_DWORD *)(a1 + 644) = v453 + v456;
        v462 = v661 + 2 * v265;
        v463 = *(unsigned __int16 *)(v462 + 50);
        v464 = *(unsigned __int8 *)(v271 + v463);
        v465 = *(_DWORD *)(v274 + 4 * v463);
        if (v460 >= 8)
        {
          v466 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v466) = HIBYTE(v461);
            v466 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v466;
            v461 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v461;
            v467 = *(_DWORD *)(a1 + 644);
            v460 = v467 - 8;
            *(_DWORD *)(a1 + 644) = v467 - 8;
          }
          while (v467 > 15);
        }
        v468 = v460 + v464;
        v469 = (v465 << -(char)v468) | v461;
        *(_DWORD *)(a1 + 640) = v469;
        *(_DWORD *)(a1 + 644) = v468;
        v470 = *(unsigned __int16 *)(v462 + 52);
        v471 = *(unsigned __int8 *)(v271 + v470);
        v472 = *(_DWORD *)(v274 + 4 * v470);
        if (v468 >= 8)
        {
          v473 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v473) = HIBYTE(v469);
            v473 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v473;
            v469 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v469;
            v474 = *(_DWORD *)(a1 + 644);
            v468 = v474 - 8;
            *(_DWORD *)(a1 + 644) = v474 - 8;
          }
          while (v474 > 15);
        }
        v475 = v468 + v471;
        v476 = (v472 << -(char)(v468 + v471)) | v469;
        *(_DWORD *)(a1 + 640) = v476;
        *(_DWORD *)(a1 + 644) = v468 + v471;
        v477 = v661 + 2 * v265;
        v478 = *(unsigned __int16 *)(v477 + 54);
        v479 = *(unsigned __int8 *)(v271 + v478);
        v480 = *(_DWORD *)(v274 + 4 * v478);
        if (v475 >= 8)
        {
          v481 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v481) = HIBYTE(v476);
            v481 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v481;
            v476 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v476;
            v482 = *(_DWORD *)(a1 + 644);
            v475 = v482 - 8;
            *(_DWORD *)(a1 + 644) = v482 - 8;
          }
          while (v482 > 15);
        }
        v483 = v475 + v479;
        v484 = (v480 << -(char)v483) | v476;
        *(_DWORD *)(a1 + 640) = v484;
        *(_DWORD *)(a1 + 644) = v483;
        v485 = *(unsigned __int16 *)(v477 + 56);
        v486 = *(unsigned __int8 *)(v271 + v485);
        v487 = *(_DWORD *)(v274 + 4 * v485);
        if (v483 >= 8)
        {
          v488 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v488) = HIBYTE(v484);
            v488 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v488;
            v484 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v484;
            v489 = *(_DWORD *)(a1 + 644);
            v483 = v489 - 8;
            *(_DWORD *)(a1 + 644) = v489 - 8;
          }
          while (v489 > 15);
        }
        v490 = v483 + v486;
        v491 = (v487 << -(char)(v483 + v486)) | v484;
        *(_DWORD *)(a1 + 640) = v491;
        *(_DWORD *)(a1 + 644) = v483 + v486;
        v492 = v661 + 2 * v265;
        v493 = *(unsigned __int16 *)(v492 + 58);
        v494 = *(unsigned __int8 *)(v271 + v493);
        v495 = *(_DWORD *)(v274 + 4 * v493);
        if (v490 >= 8)
        {
          v496 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v496) = HIBYTE(v491);
            v496 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v496;
            v491 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v491;
            v497 = *(_DWORD *)(a1 + 644);
            v490 = v497 - 8;
            *(_DWORD *)(a1 + 644) = v497 - 8;
          }
          while (v497 > 15);
        }
        v498 = v490 + v494;
        v499 = (v495 << -(char)v498) | v491;
        *(_DWORD *)(a1 + 640) = v499;
        *(_DWORD *)(a1 + 644) = v498;
        v500 = *(unsigned __int16 *)(v492 + 60);
        v501 = *(unsigned __int8 *)(v271 + v500);
        v502 = *(_DWORD *)(v274 + 4 * v500);
        if (v498 >= 8)
        {
          v503 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v503) = HIBYTE(v499);
            v503 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v503;
            v499 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v499;
            v504 = *(_DWORD *)(a1 + 644);
            v498 = v504 - 8;
            *(_DWORD *)(a1 + 644) = v504 - 8;
          }
          while (v504 > 15);
        }
        v505 = v498 + v501;
        v506 = (v502 << -(char)(v498 + v501)) | v499;
        *(_DWORD *)(a1 + 640) = v506;
        *(_DWORD *)(a1 + 644) = v498 + v501;
        v507 = v661 + 2 * v265;
        v508 = *(unsigned __int16 *)(v507 + 62);
        v509 = *(unsigned __int8 *)(v271 + v508);
        v510 = *(_DWORD *)(v274 + 4 * v508);
        if (v505 >= 8)
        {
          v511 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v511) = HIBYTE(v506);
            v511 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v511;
            v506 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v506;
            v512 = *(_DWORD *)(a1 + 644);
            v505 = v512 - 8;
            *(_DWORD *)(a1 + 644) = v512 - 8;
          }
          while (v512 > 15);
        }
        v513 = v505 + v509;
        v514 = (v510 << -(char)v513) | v506;
        *(_DWORD *)(a1 + 640) = v514;
        *(_DWORD *)(a1 + 644) = v513;
        v515 = *(unsigned __int16 *)(v507 + 64);
        v516 = *(unsigned __int8 *)(v271 + v515);
        v517 = *(_DWORD *)(v274 + 4 * v515);
        if (v513 >= 8)
        {
          v518 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v518) = HIBYTE(v514);
            v518 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v518;
            v514 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v514;
            v519 = *(_DWORD *)(a1 + 644);
            v513 = v519 - 8;
            *(_DWORD *)(a1 + 644) = v519 - 8;
          }
          while (v519 > 15);
        }
        v520 = v513 + v516;
        v521 = (v517 << -(char)(v513 + v516)) | v514;
        *(_DWORD *)(a1 + 640) = v521;
        *(_DWORD *)(a1 + 644) = v513 + v516;
        v522 = v661 + 2 * v265;
        v523 = *(unsigned __int16 *)(v522 + 66);
        v524 = *(unsigned __int8 *)(v271 + v523);
        v525 = *(_DWORD *)(v274 + 4 * v523);
        if (v520 >= 8)
        {
          v526 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v526) = HIBYTE(v521);
            v526 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v526;
            v521 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v521;
            v527 = *(_DWORD *)(a1 + 644);
            v520 = v527 - 8;
            *(_DWORD *)(a1 + 644) = v527 - 8;
          }
          while (v527 > 15);
        }
        v528 = v520 + v524;
        v529 = (v525 << -(char)v528) | v521;
        *(_DWORD *)(a1 + 640) = v529;
        *(_DWORD *)(a1 + 644) = v528;
        v530 = *(unsigned __int16 *)(v522 + 68);
        v531 = *(unsigned __int8 *)(v271 + v530);
        v532 = *(_DWORD *)(v274 + 4 * v530);
        if (v528 >= 8)
        {
          v533 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v533) = HIBYTE(v529);
            v533 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v533;
            v529 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v529;
            v534 = *(_DWORD *)(a1 + 644);
            v528 = v534 - 8;
            *(_DWORD *)(a1 + 644) = v534 - 8;
          }
          while (v534 > 15);
        }
        v535 = v528 + v531;
        v536 = (v532 << -(char)(v528 + v531)) | v529;
        *(_DWORD *)(a1 + 640) = v536;
        *(_DWORD *)(a1 + 644) = v528 + v531;
        v537 = v661 + 2 * v265;
        v538 = *(unsigned __int16 *)(v537 + 70);
        v539 = *(unsigned __int8 *)(v271 + v538);
        v540 = *(_DWORD *)(v274 + 4 * v538);
        if (v535 >= 8)
        {
          v541 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v541) = HIBYTE(v536);
            v541 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v541;
            v536 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v536;
            v542 = *(_DWORD *)(a1 + 644);
            v535 = v542 - 8;
            *(_DWORD *)(a1 + 644) = v542 - 8;
          }
          while (v542 > 15);
        }
        v543 = v535 + v539;
        v544 = (v540 << -(char)v543) | v536;
        *(_DWORD *)(a1 + 640) = v544;
        *(_DWORD *)(a1 + 644) = v543;
        v545 = *(unsigned __int16 *)(v537 + 72);
        v546 = *(unsigned __int8 *)(v271 + v545);
        v547 = *(_DWORD *)(v274 + 4 * v545);
        if (v543 >= 8)
        {
          v548 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v548) = HIBYTE(v544);
            v548 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v548;
            v544 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v544;
            v549 = *(_DWORD *)(a1 + 644);
            v543 = v549 - 8;
            *(_DWORD *)(a1 + 644) = v549 - 8;
          }
          while (v549 > 15);
        }
        v550 = v543 + v546;
        v551 = (v547 << -(char)(v543 + v546)) | v544;
        *(_DWORD *)(a1 + 640) = v551;
        *(_DWORD *)(a1 + 644) = v543 + v546;
        v552 = v661 + 2 * v265;
        v553 = *(unsigned __int16 *)(v552 + 74);
        v554 = *(unsigned __int8 *)(v271 + v553);
        v555 = *(_DWORD *)(v274 + 4 * v553);
        if (v550 >= 8)
        {
          v556 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v556) = HIBYTE(v551);
            v556 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v556;
            v551 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v551;
            v557 = *(_DWORD *)(a1 + 644);
            v550 = v557 - 8;
            *(_DWORD *)(a1 + 644) = v557 - 8;
          }
          while (v557 > 15);
        }
        v558 = v550 + v554;
        v559 = (v555 << -(char)v558) | v551;
        *(_DWORD *)(a1 + 640) = v559;
        *(_DWORD *)(a1 + 644) = v558;
        v560 = *(unsigned __int16 *)(v552 + 76);
        v561 = *(unsigned __int8 *)(v271 + v560);
        v562 = *(_DWORD *)(v274 + 4 * v560);
        if (v558 >= 8)
        {
          v563 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v563) = HIBYTE(v559);
            v563 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v563;
            v559 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v559;
            v564 = *(_DWORD *)(a1 + 644);
            v558 = v564 - 8;
            *(_DWORD *)(a1 + 644) = v564 - 8;
          }
          while (v564 > 15);
        }
        v565 = v558 + v561;
        v566 = (v562 << -(char)(v558 + v561)) | v559;
        *(_DWORD *)(a1 + 640) = v566;
        *(_DWORD *)(a1 + 644) = v558 + v561;
        v567 = v661 + 2 * v265;
        v568 = *(unsigned __int16 *)(v567 + 78);
        v569 = *(unsigned __int8 *)(v271 + v568);
        v570 = *(_DWORD *)(v274 + 4 * v568);
        if (v565 >= 8)
        {
          v571 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v571) = HIBYTE(v566);
            v571 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v571;
            v566 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v566;
            v572 = *(_DWORD *)(a1 + 644);
            v565 = v572 - 8;
            *(_DWORD *)(a1 + 644) = v572 - 8;
          }
          while (v572 > 15);
        }
        v573 = v565 + v569;
        v574 = (v570 << -(char)v573) | v566;
        *(_DWORD *)(a1 + 640) = v574;
        *(_DWORD *)(a1 + 644) = v573;
        v575 = *(unsigned __int16 *)(v567 + 80);
        v576 = *(unsigned __int8 *)(v271 + v575);
        v577 = *(_DWORD *)(v274 + 4 * v575);
        if (v573 >= 8)
        {
          v578 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v578) = HIBYTE(v574);
            v578 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v578;
            v574 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v574;
            v579 = *(_DWORD *)(a1 + 644);
            v573 = v579 - 8;
            *(_DWORD *)(a1 + 644) = v579 - 8;
          }
          while (v579 > 15);
        }
        v580 = v573 + v576;
        v581 = (v577 << -(char)(v573 + v576)) | v574;
        *(_DWORD *)(a1 + 640) = v581;
        *(_DWORD *)(a1 + 644) = v573 + v576;
        v582 = v661 + 2 * v265;
        v583 = *(unsigned __int16 *)(v582 + 82);
        v584 = *(unsigned __int8 *)(v271 + v583);
        v585 = *(_DWORD *)(v274 + 4 * v583);
        if (v580 >= 8)
        {
          v586 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v586) = HIBYTE(v581);
            v586 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v586;
            v581 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v581;
            v587 = *(_DWORD *)(a1 + 644);
            v580 = v587 - 8;
            *(_DWORD *)(a1 + 644) = v587 - 8;
          }
          while (v587 > 15);
        }
        v588 = v580 + v584;
        v589 = (v585 << -(char)v588) | v581;
        *(_DWORD *)(a1 + 640) = v589;
        *(_DWORD *)(a1 + 644) = v588;
        v590 = *(unsigned __int16 *)(v582 + 84);
        v591 = *(unsigned __int8 *)(v271 + v590);
        v592 = *(_DWORD *)(v274 + 4 * v590);
        if (v588 >= 8)
        {
          v593 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v593) = HIBYTE(v589);
            v593 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v593;
            v589 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v589;
            v594 = *(_DWORD *)(a1 + 644);
            v588 = v594 - 8;
            *(_DWORD *)(a1 + 644) = v594 - 8;
          }
          while (v594 > 15);
        }
        v595 = v588 + v591;
        v596 = (v592 << -(char)(v588 + v591)) | v589;
        *(_DWORD *)(a1 + 640) = v596;
        *(_DWORD *)(a1 + 644) = v588 + v591;
        v597 = v661 + 2 * v265;
        v598 = *(unsigned __int16 *)(v597 + 86);
        v599 = *(unsigned __int8 *)(v271 + v598);
        v600 = *(_DWORD *)(v274 + 4 * v598);
        if (v595 >= 8)
        {
          v601 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v601) = HIBYTE(v596);
            v601 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v601;
            v596 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v596;
            v602 = *(_DWORD *)(a1 + 644);
            v595 = v602 - 8;
            *(_DWORD *)(a1 + 644) = v602 - 8;
          }
          while (v602 > 15);
        }
        v603 = v595 + v599;
        v604 = (v600 << -(char)v603) | v596;
        *(_DWORD *)(a1 + 640) = v604;
        *(_DWORD *)(a1 + 644) = v603;
        v605 = *(unsigned __int16 *)(v597 + 88);
        v606 = *(unsigned __int8 *)(v271 + v605);
        v607 = *(_DWORD *)(v274 + 4 * v605);
        if (v603 >= 8)
        {
          v608 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v608) = HIBYTE(v604);
            v608 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v608;
            v604 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v604;
            v609 = *(_DWORD *)(a1 + 644);
            v603 = v609 - 8;
            *(_DWORD *)(a1 + 644) = v609 - 8;
          }
          while (v609 > 15);
        }
        v610 = v603 + v606;
        v611 = (v607 << -(char)(v603 + v606)) | v604;
        *(_DWORD *)(a1 + 640) = v611;
        *(_DWORD *)(a1 + 644) = v603 + v606;
        v612 = v661 + 2 * v265;
        v613 = *(unsigned __int16 *)(v612 + 90);
        v614 = *(unsigned __int8 *)(v271 + v613);
        v615 = *(_DWORD *)(v274 + 4 * v613);
        if (v610 >= 8)
        {
          v616 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v616) = HIBYTE(v611);
            v616 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v616;
            v611 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v611;
            v617 = *(_DWORD *)(a1 + 644);
            v610 = v617 - 8;
            *(_DWORD *)(a1 + 644) = v617 - 8;
          }
          while (v617 > 15);
        }
        v618 = v610 + v614;
        v619 = (v615 << -(char)v618) | v611;
        *(_DWORD *)(a1 + 640) = v619;
        *(_DWORD *)(a1 + 644) = v618;
        v620 = *(unsigned __int16 *)(v612 + 92);
        v621 = *(unsigned __int8 *)(v271 + v620);
        v622 = *(_DWORD *)(v274 + 4 * v620);
        if (v618 >= 8)
        {
          v623 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v623) = HIBYTE(v619);
            v623 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v623;
            v619 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v619;
            v624 = *(_DWORD *)(a1 + 644);
            v618 = v624 - 8;
            *(_DWORD *)(a1 + 644) = v624 - 8;
          }
          while (v624 > 15);
        }
        v625 = v618 + v621;
        v626 = (v622 << -(char)(v618 + v621)) | v619;
        *(_DWORD *)(a1 + 640) = v626;
        *(_DWORD *)(a1 + 644) = v618 + v621;
        v627 = v661 + 2 * v265;
        v628 = *(unsigned __int16 *)(v627 + 94);
        v629 = *(unsigned __int8 *)(v271 + v628);
        v630 = *(_DWORD *)(v274 + 4 * v628);
        if (v625 >= 8)
        {
          v631 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v631) = HIBYTE(v626);
            v631 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v631;
            v626 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v626;
            v632 = *(_DWORD *)(a1 + 644);
            v625 = v632 - 8;
            *(_DWORD *)(a1 + 644) = v632 - 8;
          }
          while (v632 > 15);
        }
        v633 = v625 + v629;
        v634 = (v630 << -(char)v633) | v626;
        *(_DWORD *)(a1 + 640) = v634;
        *(_DWORD *)(a1 + 644) = v633;
        v635 = *(unsigned __int16 *)(v627 + 96);
        v636 = *(unsigned __int8 *)(v271 + v635);
        v637 = *(_DWORD *)(v274 + 4 * v635);
        if (v633 >= 8)
        {
          v638 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v638) = HIBYTE(v634);
            v638 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v638;
            v634 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v634;
            v639 = *(_DWORD *)(a1 + 644);
            v633 = v639 - 8;
            *(_DWORD *)(a1 + 644) = v639 - 8;
          }
          while (v639 > 15);
        }
        v640 = v633 + v636;
        v641 = (v637 << -(char)v640) | v634;
        *(_DWORD *)(a1 + 640) = v641;
        *(_DWORD *)(a1 + 644) = v640;
        v642 = *(unsigned __int16 *)(v661 + 2 * v266);
        v643 = *(unsigned __int8 *)(v271 + v642);
        v644 = *(_DWORD *)(v274 + 4 * v642);
        if (v640 >= 8)
        {
          v645 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 80) + v645) = HIBYTE(v641);
            v645 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v645;
            v641 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v641;
            v646 = *(_DWORD *)(a1 + 644);
            v640 = v646 - 8;
            *(_DWORD *)(a1 + 644) = v646 - 8;
          }
          while (v646 > 15);
        }
        *(_DWORD *)(a1 + 640) = (v644 << -(char)(v640 + v643)) | v641;
        *(_DWORD *)(a1 + 644) = v640 + v643;
      }
      else if (v267 >= (int)v265)
      {
        v647 = *(_DWORD *)(a1 + 644);
        do
        {
          v648 = *(unsigned __int16 *)(v661 + 2 * v265);
          v649 = *(unsigned __int8 *)(a1 + 258 * *v268 + v648 + 37708);
          v650 = *(_DWORD *)(a1 + 1032 * *v268 + 4 * v648 + 39256);
          v651 = *(_DWORD *)(a1 + 640);
          if (v647 >= 8)
          {
            v652 = *(_DWORD *)(a1 + 116);
            do
            {
              *(_BYTE *)(*(_QWORD *)(a1 + 80) + v652) = HIBYTE(v651);
              v652 = *(_DWORD *)(a1 + 116) + 1;
              *(_DWORD *)(a1 + 116) = v652;
              v651 = *(_DWORD *)(a1 + 640) << 8;
              *(_DWORD *)(a1 + 640) = v651;
              v653 = *(_DWORD *)(a1 + 644);
              v647 = v653 - 8;
              *(_DWORD *)(a1 + 644) = v653 - 8;
            }
            while (v653 > 15);
          }
          v647 += v649;
          *(_DWORD *)(a1 + 640) = (v650 << -(char)v647) | v651;
          *(_DWORD *)(a1 + 644) = v647;
          ++v265;
        }
        while (v267 + 1 != (_DWORD)v265);
      }
      v264 = v267 + 1;
      ++v263;
      v262 = *(_DWORD *)(a1 + 668);
    }
    while (v267 + 1 < v262);
    v218 = (FILE **)MEMORY[0x1E0C80C10];
  }
  if ((_DWORD)v263 != v667)
    sub_1DF268138(3007);
  if (*(int *)(a1 + 656) >= 3)
    return fprintf(*v218, "codes %d\n", *(_DWORD *)(a1 + 116) - v248);
  return result;
}

uint64_t sub_1DF26C9E8()
{
  uint64_t result;
  unsigned int *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  int v32;
  int v33;
  int v34;
  unsigned int v35;
  int v36;
  int v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  int v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  size_t v53;
  _DWORD v54[516];
  _DWORD v55[516];
  int v56;
  int v57;
  int v58;
  uint64_t v59;

  result = MEMORY[0x1E0C80A78]();
  v4 = v3;
  v5 = v2;
  v6 = result;
  v59 = *MEMORY[0x1E0C80C00];
  v7 = v2;
  if (v2 >= 1)
  {
    v8 = &v56;
    v9 = v2;
    do
    {
      v11 = *v1++;
      v10 = v11;
      if (v11 <= 1)
        v10 = 1;
      *v8++ = v10 << 8;
      --v9;
    }
    while (v9);
  }
  v57 = 0;
  v55[0] = 0;
  v54[0] = -2;
  if (v2 >= 1)
  {
    v53 = 4 * v2;
    v52 = v2;
    v12 = (v2 + 1);
    while (1)
    {
      result = (uint64_t)memset(&v54[1], 255, v53);
      v13 = 0;
      v14 = 1;
      do
      {
        ++v13;
        *(&v57 + v13) = v14;
        v15 = v55[v14];
        v16 = v13;
        v17 = v13 >> 1;
        v18 = *(&v57 + v17);
        if (v15 >= v55[v18])
        {
          v19 = v13;
        }
        else
        {
          do
          {
            v19 = v17;
            *(&v57 + v16) = v18;
            v17 >>= 1;
            v18 = *(&v57 + v17);
            v16 = v19;
          }
          while (v15 < v55[v18]);
        }
        *(&v57 + v19) = v14++;
      }
      while (v13 != v7);
      if (v5 >= 0x104)
        sub_1DF268138(2001);
      LODWORD(v20) = v5;
      if (v5 >= 2)
        break;
LABEL_50:
      if ((int)v20 >= 516)
        sub_1DF268138(2002);
      v47 = 0;
      v48 = 1;
      do
      {
        v49 = -1;
        v50 = v48;
        do
        {
          v50 = v54[v50];
          ++v49;
        }
        while ((v50 & 0x80000000) == 0);
        *(_BYTE *)(v48 + v6 - 1) = v49;
        if (v49 > v4)
          v47 = 1;
        ++v48;
      }
      while (v48 != v12);
      if (v47)
      {
        v51 = 1;
        do
        {
          v55[v51] = (((((int)v55[v51] >> 8) + ((int)v55[v51] >> 8 < 0)) << 7) & 0xFFFFFF00) + 256;
          ++v51;
        }
        while (v12 != v51);
        v57 = 0;
        v55[0] = 0;
        v54[0] = -2;
        if (v5 >= 1)
          continue;
      }
      return result;
    }
    v20 = v52;
    v21 = v7;
    while (1)
    {
      v22 = v58;
      v23 = *(&v57 + v21);
      v58 = v23;
      v24 = v21 - 1;
      v25 = v21 - 2;
      if ((unint64_t)v21 <= 2)
      {
        v58 = v23;
        v32 = *(&v57 + v24);
        v58 = v32;
      }
      else
      {
        v26 = v55[v23];
        v27 = 1;
        v28 = 2;
        while (1)
        {
          v29 = v28;
          if (v24 <= v28)
          {
            v30 = v28;
          }
          else
          {
            v30 = v28 | 1;
            if (v55[*(&v57 + (v28 | 1))] >= v55[*(&v57 + v28)])
              v30 = v28;
            v29 = v30;
          }
          v31 = *(&v57 + v29);
          result = v55[v31];
          if (v26 < (int)result)
            break;
          *(&v57 + v27) = v31;
          v28 = 2 * v30;
          v27 = v30;
          if (v21 <= 2 * v30)
            goto LABEL_30;
        }
        v30 = v27;
LABEL_30:
        *(&v57 + v30) = v23;
        v23 = v58;
        v32 = *(&v57 + v24);
        v58 = v32;
        if (v21 >= 4)
        {
          v43 = v55[v32];
          v33 = 1;
          v44 = 2;
          while (1)
          {
            v45 = (int)v44;
            if (v25 <= (int)v44)
            {
              result = v44;
            }
            else
            {
              LODWORD(result) = v44 | 1;
              result = v55[*(&v57 + ((int)v44 | 1))] >= v55[*(&v57 + (int)v44)]
                     ? v44
                     : result;
              v45 = (int)result;
            }
            v46 = *(&v57 + v45);
            if (v43 < v55[v46])
              goto LABEL_32;
            *(&v57 + v33) = v46;
            v44 = (2 * result);
            v33 = result;
            if (v25 < (int)v44)
            {
              v33 = result;
              goto LABEL_32;
            }
          }
        }
      }
      v33 = 1;
LABEL_32:
      *(&v57 + v33) = v32;
      v54[v23] = ++v20;
      v54[v22] = v20;
      v36 = v55[v22];
      v34 = v55[v23];
      v35 = (v34 & 0xFFFFFF00) + (v36 & 0xFFFFFF00);
      v36 = v36;
      if (v36 <= v34)
        v36 = v34;
      v37 = (v36 + 1) | v35;
      v55[v20] = v37;
      v54[v20] = -1;
      *(&v57 + v24) = v20;
      v38 = (v21 - 1);
      v39 = v24 >> 1;
      v40 = *(&v57 + v39);
      if (v37 >= v55[v40])
      {
        v41 = (v21 - 1);
      }
      else
      {
        do
        {
          v41 = v39;
          *(&v57 + v38) = v40;
          v39 >>= 1;
          v40 = *(&v57 + v39);
          v38 = v41;
        }
        while (v37 < v55[v40]);
      }
      *(&v57 + v41) = v20;
      if ((unint64_t)v21-- <= 2)
        goto LABEL_50;
    }
  }
  return result;
}

_DWORD *sub_1DF26CDE0(_DWORD *result, unsigned __int8 *a2, int a3, int a4, int a5)
{
  int v5;
  uint64_t v6;
  unsigned __int8 *v7;
  _DWORD *v8;
  int v9;

  if (a3 <= a4)
  {
    v5 = 0;
    do
    {
      if (a5 >= 1)
      {
        v6 = a5;
        v7 = a2;
        v8 = result;
        do
        {
          v9 = *v7++;
          if (a3 == v9)
            *v8 = v5++;
          ++v8;
          --v6;
        }
        while (v6);
      }
      v5 *= 2;
    }
    while (a3++ != a4);
  }
  return result;
}

_OWORD *sub_1DF26CE3C(_OWORD *result, _OWORD *a2, uint64_t a3, unsigned __int8 *a4, int a5, int a6, int a7)
{
  int v7;
  int v8;
  uint64_t i;
  uint64_t v11;
  unsigned int v12;
  int v13;
  uint64_t j;
  int *v15;
  char *v16;
  int v17;
  _DWORD *v18;
  int v19;
  _DWORD *v20;
  int v21;
  uint64_t v22;
  _DWORD *v23;
  int v24;

  if (a5 <= a6)
  {
    v7 = 0;
    v8 = a5;
    do
    {
      if (a7 >= 1)
      {
        for (i = 0; i != a7; ++i)
        {
          if (v8 == a4[i])
            *(_DWORD *)(a3 + 4 * v7++) = i;
        }
      }
    }
    while (v8++ != a6);
  }
  *(_OWORD *)((char *)a2 + 76) = 0u;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (a7 > 0)
  {
    v11 = a7;
    do
    {
      v12 = *a4++;
      ++*((_DWORD *)a2 + v12 + 1);
      --v11;
    }
    while (v11);
  }
  v13 = 0;
  for (j = 4; j != 92; j += 4)
  {
    v13 += *(_DWORD *)((char *)a2 + j);
    *(_DWORD *)((char *)a2 + j) = v13;
  }
  *(_OWORD *)((char *)result + 76) = 0u;
  result[3] = 0u;
  result[4] = 0u;
  result[1] = 0u;
  result[2] = 0u;
  *result = 0u;
  v15 = (int *)result + a5;
  v16 = (char *)a2 + 4 * a5;
  if (a5 <= a6)
  {
    v17 = 0;
    v18 = v16 + 4;
    v19 = a6 - a5 + 1;
    v20 = (_DWORD *)result + a5;
    do
    {
      v21 = *v18 - *(v18 - 1) + v17;
      *v20++ = v21 - 1;
      v17 = 2 * v21;
      ++v18;
      --v19;
    }
    while (v19);
  }
  if (a5 < a6)
  {
    v22 = a6 - (uint64_t)a5;
    v23 = v16 + 4;
    do
    {
      v24 = *v15++;
      *v23 = 2 * v24 - *v23 + 2;
      ++v23;
      --v22;
    }
    while (v22);
  }
  return result;
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1E0C80C40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1E0C83318](*(_QWORD *)&a1, a2);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1E0C83348](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

int fgetc(FILE *a1)
{
  return MEMORY[0x1E0C83388](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C83488](*(_QWORD *)&a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

