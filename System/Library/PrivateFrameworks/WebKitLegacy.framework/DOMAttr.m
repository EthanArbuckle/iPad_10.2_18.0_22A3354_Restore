@implementation DOMAttr

- (NSString)name
{
  StringImpl *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  BOOL v9;
  int v10;
  BOOL v11;
  uint64_t v12;
  int v13;
  BOOL v14;
  _DWORD *v15;
  _WORD *v16;
  _WORD *v17;
  uint64_t v18;
  _BYTE *v19;
  size_t v20;
  _BYTE *v21;
  unint64_t v22;
  unsigned __int128 *v23;
  unsigned __int128 v24;
  _WORD *v25;
  unint64_t v26;
  __int128 v27;
  char *v28;
  int8x16_t v29;
  __int128 v30;
  __int128 v31;
  char *v32;
  char *v33;
  char *v34;
  size_t v35;
  unint64_t v36;
  BOOL v37;
  unint64_t v38;
  unint64_t v39;
  BOOL v40;
  uint64_t v41;
  unint64_t v42;
  _BYTE *v43;
  char *v44;
  char v45;
  _WORD *v46;
  unsigned __int8 *v47;
  __int16 v48;
  uint64_t v49;
  _WORD *v50;
  unint64_t v51;
  uint64_t v52;
  int v53;
  _WORD *v54;
  unint64_t v55;
  __int128 v56;
  int8x16_t v57;
  __int128 v58;
  __int128 v59;
  char *v60;
  char *v61;
  char *v62;
  unint64_t v63;
  _WORD *v64;
  unsigned __int8 *v65;
  __int16 v66;
  uint64_t v67;
  size_t v68;
  _BYTE *v69;
  unint64_t v70;
  unsigned __int128 v71;
  size_t v72;
  unint64_t v73;
  unint64_t v74;
  BOOL v75;
  unint64_t v76;
  _BYTE *v77;
  char *v78;
  char v79;
  int v80;
  const __CFString *v81;
  uint64_t v83;
  unint64_t v84;
  int8x16_t *v85;
  int8x16_t *v86;
  unint64_t v87;
  int8x16_t v88;
  int8x16_t v89;
  int8x16_t v90;
  int8x16_t v91;
  int16x8_t *v92;
  int8x8_t *v93;
  unint64_t v94;
  int16x8_t v95;
  uint8x8_t *v96;
  uint16x8_t *v97;
  unint64_t v98;
  uint8x16_t v99;
  uint16x8_t v100;
  uint16x8_t v101;
  uint8x8_t *v102;
  uint16x8_t *v103;
  unint64_t v104;
  uint8x8_t v105;
  int8x16_t *v106;
  int8x16_t *v107;
  unint64_t v108;
  int8x16_t v109;
  int8x16_t v110;
  int8x16_t v111;
  int8x16_t v112;
  int16x8_t *v113;
  int8x8_t *v114;
  unint64_t v115;
  int16x8_t v116;
  uint8x8_t *v117;
  uint16x8_t *v118;
  unint64_t v119;
  uint8x16_t v120;
  uint16x8_t v121;
  uint16x8_t v122;
  uint8x8_t *v123;
  uint16x8_t *v124;
  unint64_t v125;
  uint8x8_t v126;
  _BYTE v127[80];
  _DWORD *v128;
  int8x16x2_t v129;
  int8x16x2_t v130;
  int8x16x2_t v131;
  int8x16x2_t v132;
  int8x16x2_t v133;
  int8x16x2_t v134;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v127);
  v4 = *((_QWORD *)self->super.super._internal + 11);
  v5 = *(_QWORD *)(v4 + 16);
  if (v5)
  {
    *(_DWORD *)v5 += 2;
    v6 = *(_QWORD *)(v4 + 24);
    if (v6)
    {
      v7 = *(_DWORD *)(v6 + 4);
      *(_DWORD *)v6 += 2;
      if (v7 < 0)
        goto LABEL_156;
      v8 = *(_DWORD *)(v5 + 4);
      v9 = __OFADD__(v7, 1);
      v10 = v7 + 1;
      v11 = v9;
      if (v8 < 0)
        goto LABEL_156;
    }
    else
    {
      v8 = *(_DWORD *)(v5 + 4);
      v10 = 1;
      v11 = 0;
      if (v8 < 0)
        goto LABEL_156;
    }
    if (v11)
      goto LABEL_156;
    v12 = (v8 + v10);
    if (__OFADD__(v8, v10))
      goto LABEL_156;
    v13 = *(_DWORD *)(v5 + 16);
    if (v6)
      v14 = (*(_DWORD *)(v5 + 16) & 4) == 0;
    else
      v14 = 1;
    if (!v14)
      LOBYTE(v13) = *(_BYTE *)(v6 + 16);
    if ((v13 & 4) == 0)
    {
      if (v12 <= 0x7FFFFFEF)
      {
        WTF::tryFastCompactMalloc((WTF *)(2 * v12 + 20));
        v15 = v128;
        if (v128)
        {
          v16 = v128 + 5;
          *v128 = 2;
          v15[1] = v12;
          *((_QWORD *)v15 + 1) = v15 + 5;
          v15[4] = 0;
          v17 = *(_WORD **)(v5 + 8);
          v18 = *(unsigned int *)(v5 + 4);
          if ((*(_BYTE *)(v5 + 16) & 4) == 0)
          {
            if ((_DWORD)v18)
            {
              if ((_DWORD)v18 == 1)
                *v16 = *v17;
              else
                memcpy(v15 + 5, v17, 2 * v18);
            }
            goto LABEL_65;
          }
          v25 = &v16[v18];
          if (v18 < 0x40)
          {
            v26 = (unint64_t)(v15 + 5);
            if (v16 == v25)
            {
LABEL_65:
              v49 = *(unsigned int *)(v5 + 4);
              v50 = &v16[v49];
              *v50 = 58;
              v51 = (unint64_t)(v50 + 1);
              if (v6)
              {
                v17 = *(_WORD **)(v6 + 8);
                v52 = *(unsigned int *)(v6 + 4);
                if ((*(_BYTE *)(v6 + 16) & 4) == 0)
                {
                  if ((_DWORD)v52)
                  {
                    if ((_DWORD)v52 == 1)
                    {
                      *(_WORD *)v51 = *v17;
                      v53 = *(_DWORD *)v6 - 2;
                      if (*(_DWORD *)v6 == 2)
                        goto LABEL_111;
                      goto LABEL_106;
                    }
                    v68 = 2 * v52;
                    goto LABEL_110;
                  }
                  goto LABEL_105;
                }
                v54 = (_WORD *)(v51 + 2 * v52);
                if (v52 >= 0x40)
                {
                  v55 = v51 + 2 * (v52 & 0xFFFFFFC0);
                  v56 = 0uLL;
                  do
                  {
                    v130.val[0] = *(int8x16_t *)v17;
                    v57 = *((int8x16_t *)v17 + 1);
                    v132.val[0] = (int8x16_t)*((_OWORD *)v17 + 2);
                    v58 = *((_OWORD *)v17 + 3);
                    v17 += 32;
                    v59 = v58;
                    v132.val[1] = 0uLL;
                    v134.val[0] = v57;
                    v130.val[1] = 0uLL;
                    v60 = (char *)v51;
                    vst2q_s8(v60, v130);
                    v60 += 32;
                    v134.val[1] = 0uLL;
                    vst2q_s8(v60, v134);
                    v61 = (char *)(v51 + 64);
                    vst2q_s8(v61, v132);
                    v62 = (char *)(v51 + 96);
                    vst2q_s8(v62, *(int8x16x2_t *)(&v56 - 1));
                    v51 += 128;
                  }
                  while (v51 != v55);
                  v51 = v55;
                }
                if ((_WORD *)v51 != v54)
                {
                  v63 = (unint64_t)v15 + 2 * v49 + 2 * v52 - v51 + 20;
                  if (v63 < 0xE
                    || v51 < (unint64_t)v17 + (v63 >> 1) + 1
                    && (unint64_t)v17 < (v63 & 0xFFFFFFFFFFFFFFFELL) + v51 + 2)
                  {
                    v64 = (_WORD *)v51;
                    v65 = (unsigned __int8 *)v17;
                    goto LABEL_80;
                  }
                  v83 = (v63 >> 1) + 1;
                  if (v63 >= 0x3E)
                  {
                    v84 = v83 & 0xFFFFFFFFFFFFFFE0;
                    v117 = (uint8x8_t *)(v17 + 8);
                    v118 = (uint16x8_t *)(v51 + 32);
                    v119 = v83 & 0xFFFFFFFFFFFFFFE0;
                    do
                    {
                      v120 = *(uint8x16_t *)v117[-2].i8;
                      v121 = vmovl_u8(*v117);
                      v122 = vmovl_high_u8(*(uint8x16_t *)v117->i8);
                      v118[-2] = vmovl_u8(*(uint8x8_t *)v120.i8);
                      v118[-1] = vmovl_high_u8(v120);
                      *v118 = v121;
                      v118[1] = v122;
                      v118 += 4;
                      v117 += 4;
                      v119 -= 32;
                    }
                    while (v119);
                    if (v83 == v84)
                      goto LABEL_104;
                    if ((v83 & 0x18) == 0)
                    {
                      v65 = (unsigned __int8 *)v17 + v84;
                      v64 = (_WORD *)(v51 + 2 * v84);
                      do
                      {
LABEL_80:
                        v66 = *v65++;
                        *v64++ = v66;
                      }
                      while (v64 != v54);
                      goto LABEL_104;
                    }
                  }
                  else
                  {
                    v84 = 0;
                  }
                  v64 = (_WORD *)(v51 + 2 * (v83 & 0xFFFFFFFFFFFFFFF8));
                  v65 = (unsigned __int8 *)v17 + (v83 & 0xFFFFFFFFFFFFFFF8);
                  v123 = (uint8x8_t *)((char *)v17 + v84);
                  v124 = (uint16x8_t *)(v51 + 2 * v84);
                  v125 = v84 - (v83 & 0xFFFFFFFFFFFFFFF8);
                  do
                  {
                    v126 = *v123++;
                    *v124++ = vmovl_u8(v126);
                    v125 += 8;
                  }
                  while (v125);
                  if (v83 != (v83 & 0xFFFFFFFFFFFFFFF8))
                    goto LABEL_80;
                }
              }
LABEL_104:
              if (!v6)
                goto LABEL_107;
              goto LABEL_105;
            }
          }
          else
          {
            v26 = (unint64_t)&v16[v18 & 0xFFFFFFC0];
            v27 = 0uLL;
            v28 = (char *)(v15 + 5);
            do
            {
              v129.val[0] = *(int8x16_t *)v17;
              v29 = *((int8x16_t *)v17 + 1);
              v131.val[0] = (int8x16_t)*((_OWORD *)v17 + 2);
              v30 = *((_OWORD *)v17 + 3);
              v17 += 32;
              v31 = v30;
              v131.val[1] = 0uLL;
              v133.val[0] = v29;
              v129.val[1] = 0uLL;
              v32 = v28;
              vst2q_s8(v32, v129);
              v32 += 32;
              v133.val[1] = 0uLL;
              vst2q_s8(v32, v133);
              v33 = v28 + 64;
              vst2q_s8(v33, v131);
              v34 = v28 + 96;
              vst2q_s8(v34, *(int8x16x2_t *)(&v27 - 1));
              v28 += 128;
            }
            while (v28 != (char *)v26);
            if ((_WORD *)v26 == v25)
              goto LABEL_65;
          }
          v39 = (unint64_t)v15 + 2 * v18 - v26 + 18;
          if (v39 < 0xE
            || (v26 < (unint64_t)v17 + (v39 >> 1) + 1
              ? (v40 = (unint64_t)v17 >= (v39 & 0xFFFFFFFFFFFFFFFELL) + v26 + 2)
              : (v40 = 1),
                !v40))
          {
            v46 = (_WORD *)v26;
            v47 = (unsigned __int8 *)v17;
            goto LABEL_62;
          }
          v41 = (v39 >> 1) + 1;
          if (v39 >= 0x3E)
          {
            v42 = v41 & 0xFFFFFFFFFFFFFFE0;
            v96 = (uint8x8_t *)(v17 + 8);
            v97 = (uint16x8_t *)(v26 + 32);
            v98 = v41 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              v99 = *(uint8x16_t *)v96[-2].i8;
              v100 = vmovl_u8(*v96);
              v101 = vmovl_high_u8(*(uint8x16_t *)v96->i8);
              v97[-2] = vmovl_u8(*(uint8x8_t *)v99.i8);
              v97[-1] = vmovl_high_u8(v99);
              *v97 = v100;
              v97[1] = v101;
              v97 += 4;
              v96 += 4;
              v98 -= 32;
            }
            while (v98);
            if (v41 == v42)
              goto LABEL_65;
            if ((v41 & 0x18) == 0)
            {
              v47 = (unsigned __int8 *)v17 + v42;
              v46 = (_WORD *)(v26 + 2 * v42);
              do
              {
LABEL_62:
                v48 = *v47++;
                *v46++ = v48;
              }
              while (v46 != v25);
              goto LABEL_65;
            }
          }
          else
          {
            v42 = 0;
          }
          v46 = (_WORD *)(v26 + 2 * (v41 & 0xFFFFFFFFFFFFFFF8));
          v47 = (unsigned __int8 *)v17 + (v41 & 0xFFFFFFFFFFFFFFF8);
          v102 = (uint8x8_t *)((char *)v17 + v42);
          v103 = (uint16x8_t *)(v26 + 2 * v42);
          v104 = v42 - (v41 & 0xFFFFFFFFFFFFFFF8);
          do
          {
            v105 = *v102++;
            *v103++ = vmovl_u8(v105);
            v104 += 8;
          }
          while (v104);
          if (v41 == (v41 & 0xFFFFFFFFFFFFFFF8))
            goto LABEL_65;
          goto LABEL_62;
        }
      }
LABEL_156:
      __break(0xC471u);
      JUMPOUT(0x1D7FD95B4);
    }
    if ((v12 & 0x80000000) != 0)
      goto LABEL_156;
    WTF::tryFastCompactMalloc((WTF *)(v12 + 20));
    v15 = v128;
    if (!v128)
      goto LABEL_156;
    v19 = v128 + 5;
    *v128 = 2;
    v15[1] = v12;
    *((_QWORD *)v15 + 1) = v15 + 5;
    v15[4] = 4;
    v17 = *(_WORD **)(v5 + 8);
    v20 = *(unsigned int *)(v5 + 4);
    if ((*(_BYTE *)(v5 + 16) & 4) != 0)
    {
      if ((_DWORD)v20)
      {
        if ((_DWORD)v20 == 1)
          *v19 = *(_BYTE *)v17;
        else
          memcpy(v15 + 5, v17, v20);
      }
      goto LABEL_83;
    }
    v21 = &v19[v20];
    if (v20 < 0x10)
    {
      v22 = (unint64_t)(v15 + 5);
      if (v19 == v21)
      {
LABEL_83:
        v67 = *(unsigned int *)(v5 + 4);
        v19[v67] = 58;
        v51 = (unint64_t)&v19[v67 + 1];
        if (!v6)
          goto LABEL_104;
        v17 = *(_WORD **)(v6 + 8);
        v68 = *(unsigned int *)(v6 + 4);
        if ((*(_BYTE *)(v6 + 16) & 4) != 0)
        {
          if ((_DWORD)v68)
          {
            if ((_DWORD)v68 == 1)
            {
              *(_BYTE *)v51 = *(_BYTE *)v17;
              v53 = *(_DWORD *)v6 - 2;
              if (*(_DWORD *)v6 == 2)
              {
LABEL_111:
                WTF::StringImpl::destroy((WTF::StringImpl *)v6, (StringImpl *)v17);
                v80 = *(_DWORD *)v5 - 2;
                if (*(_DWORD *)v5 == 2)
                  goto LABEL_112;
                goto LABEL_108;
              }
              goto LABEL_106;
            }
LABEL_110:
            memcpy((void *)v51, v17, v68);
            v53 = *(_DWORD *)v6 - 2;
            if (*(_DWORD *)v6 == 2)
              goto LABEL_111;
            goto LABEL_106;
          }
LABEL_105:
          v53 = *(_DWORD *)v6 - 2;
          if (*(_DWORD *)v6 == 2)
            goto LABEL_111;
LABEL_106:
          *(_DWORD *)v6 = v53;
LABEL_107:
          v80 = *(_DWORD *)v5 - 2;
          if (*(_DWORD *)v5 == 2)
          {
LABEL_112:
            WTF::StringImpl::destroy((WTF::StringImpl *)v5, (StringImpl *)v17);
            goto LABEL_113;
          }
LABEL_108:
          *(_DWORD *)v5 = v80;
          goto LABEL_113;
        }
        v69 = (_BYTE *)(v51 + v68);
        if (v68 >= 0x10)
        {
          v70 = v51 + (v68 & 0xFFFFFFF0);
          do
          {
            v71 = (unsigned __int128)vld2q_s8((const char *)v17);
            v17 += 16;
            *(_OWORD *)v51 = v71;
            v51 += 16;
          }
          while (v51 != v70);
          v51 = v70;
        }
        if ((_BYTE *)v51 == v69)
          goto LABEL_104;
        v72 = (size_t)v15 + v67 + v68;
        v73 = v72 - v51 + 21;
        if (v73 < 8
          || ((v74 = (unint64_t)v15 + v68 + v67 + 21, v51 < (unint64_t)&v17[v72 - v51 + 21])
            ? (v75 = (unint64_t)v17 >= v74)
            : (v75 = 1),
              !v75))
        {
          v77 = (_BYTE *)v51;
          v78 = (char *)v17;
          goto LABEL_103;
        }
        if (v73 >= 0x20)
        {
          v76 = v73 & 0xFFFFFFFFFFFFFFE0;
          v106 = (int8x16_t *)(v17 + 16);
          v107 = (int8x16_t *)(v51 + 16);
          v108 = v73 & 0xFFFFFFFFFFFFFFE0;
          do
          {
            v110 = v106[-2];
            v109 = v106[-1];
            v112 = *v106;
            v111 = v106[1];
            v106 += 4;
            v107[-1] = vuzp1q_s8(v110, v109);
            *v107 = vuzp1q_s8(v112, v111);
            v107 += 2;
            v108 -= 32;
          }
          while (v108);
          if (v73 == v76)
            goto LABEL_104;
          if ((v73 & 0x18) == 0)
          {
            v78 = (char *)&v17[v76];
            v77 = (_BYTE *)(v51 + v76);
            goto LABEL_103;
          }
        }
        else
        {
          v76 = 0;
        }
        v77 = (_BYTE *)(v51 + (v73 & 0xFFFFFFFFFFFFFFF8));
        v78 = (char *)&v17[v73 & 0xFFFFFFFFFFFFFFF8];
        v113 = (int16x8_t *)&v17[v76];
        v114 = (int8x8_t *)(v51 + v76);
        v115 = v76 - (v73 & 0xFFFFFFFFFFFFFFF8);
        do
        {
          v116 = *v113++;
          *v114++ = vmovn_s16(v116);
          v115 += 8;
        }
        while (v115);
        if (v73 == (v73 & 0xFFFFFFFFFFFFFFF8))
          goto LABEL_104;
        do
        {
LABEL_103:
          v79 = *v78;
          v78 += 2;
          *v77++ = v79;
        }
        while (v77 != v69);
        goto LABEL_104;
      }
    }
    else
    {
      v22 = (unint64_t)&v19[v20 & 0xFFFFFFF0];
      v23 = (unsigned __int128 *)(v15 + 5);
      do
      {
        v24 = (unsigned __int128)vld2q_s8((const char *)v17);
        v17 += 16;
        *v23++ = v24;
      }
      while (v23 != (unsigned __int128 *)v22);
      if ((_BYTE *)v22 == v21)
        goto LABEL_83;
    }
    v35 = (size_t)v15 + v20;
    v36 = (unint64_t)v15 + v20 - v22 + 20;
    if (v36 < 8
      || (v22 < (unint64_t)&v17[v35 - v22 + 20] ? (v37 = (unint64_t)v17 >= v35 + 20) : (v37 = 1), !v37))
    {
      v43 = (_BYTE *)v22;
      v44 = (char *)v17;
      goto LABEL_59;
    }
    if (v36 >= 0x20)
    {
      v38 = v36 & 0xFFFFFFFFFFFFFFE0;
      v85 = (int8x16_t *)(v17 + 16);
      v86 = (int8x16_t *)(v22 + 16);
      v87 = v36 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        v89 = v85[-2];
        v88 = v85[-1];
        v91 = *v85;
        v90 = v85[1];
        v85 += 4;
        v86[-1] = vuzp1q_s8(v89, v88);
        *v86 = vuzp1q_s8(v91, v90);
        v86 += 2;
        v87 -= 32;
      }
      while (v87);
      if (v36 == v38)
        goto LABEL_83;
      if ((v36 & 0x18) == 0)
      {
        v44 = (char *)&v17[v38];
        v43 = (_BYTE *)(v22 + v38);
        do
        {
LABEL_59:
          v45 = *v44;
          v44 += 2;
          *v43++ = v45;
        }
        while (v43 != v21);
        goto LABEL_83;
      }
    }
    else
    {
      v38 = 0;
    }
    v43 = (_BYTE *)(v22 + (v36 & 0xFFFFFFFFFFFFFFF8));
    v44 = (char *)&v17[v36 & 0xFFFFFFFFFFFFFFF8];
    v92 = (int16x8_t *)&v17[v38];
    v93 = (int8x8_t *)(v22 + v38);
    v94 = v38 - (v36 & 0xFFFFFFFFFFFFFFF8);
    do
    {
      v95 = *v92++;
      *v93++ = vmovn_s16(v95);
      v94 += 8;
    }
    while (v94);
    if (v36 == (v36 & 0xFFFFFFFFFFFFFFF8))
      goto LABEL_83;
    goto LABEL_59;
  }
  v15 = *(_DWORD **)(v4 + 24);
  if (!v15)
  {
    v81 = &stru_1E9D6EC48;
    goto LABEL_116;
  }
  *v15 += 2;
LABEL_113:
  v81 = (const __CFString *)WTF::StringImpl::operator NSString *();
  if (*v15 == 2)
    WTF::StringImpl::destroy((WTF::StringImpl *)v15, v3);
  else
    *v15 -= 2;
LABEL_116:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v127, v3);
  return &v81->isa;
}

- (BOOL)specified
{
  void *v2;
  _BYTE v4[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v2);
  return 1;
}

- (NSString)value
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::Attr::value(self->super.super._internal);
  if (v6)
  {
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v3);
    else
      *(_DWORD *)v6 -= 2;
  }
  else
  {
    v4 = &stru_1E9D6EC48;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return &v4->isa;
}

- (void)setValue:(NSString *)value
{
  const __CFString *v4;
  StringImpl *v5;
  WTF::StringImpl *v6;
  void *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  char v10;
  _BYTE v11[80];
  WTF::StringImpl *v12;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)value, v4);
  v8 = v12;
  WebCore::Attr::setValue();
  if (v10 && v9)
  {
    if (*(_DWORD *)v9 == 2)
    {
      WTF::StringImpl::destroy(v9, v5);
      v6 = v8;
      if (!v8)
        goto LABEL_8;
      goto LABEL_6;
    }
    *(_DWORD *)v9 -= 2;
  }
  v6 = v8;
  if (!v8)
  {
LABEL_8:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v5);
    return;
  }
LABEL_6:
  if (*(_DWORD *)v6 != 2)
  {
    *(_DWORD *)v6 -= 2;
    goto LABEL_8;
  }
  WTF::StringImpl::destroy(v6, v5);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v7);
}

- (DOMElement)ownerElement
{
  uint64_t v3;
  WebCore::Node *v4;
  DOMElement *v5;
  void *v6;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  v3 = *((_QWORD *)self->super.super._internal + 10);
  if (v3)
    v4 = *(WebCore::Node **)(v3 + 8);
  else
    v4 = 0;
  v5 = (DOMElement *)kit(v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
  return v5;
}

- (BOOL)isId
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  v4 = *((_QWORD *)self->super.super._internal + 11);
  v5 = *MEMORY[0x1E0DD5FA8];
  v6 = v4 == *MEMORY[0x1E0DD5FA8]
    || *(_QWORD *)(v4 + 24) == *(_QWORD *)(v5 + 24) && *(_QWORD *)(v4 + 32) == *(_QWORD *)(v5 + 32);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v6;
}

- (DOMCSSStyleDeclaration)style
{
  DOMObjectInternal *v3;
  DOMCSSStyleDeclaration *v4;
  void *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (DOMObjectInternal *)WebCore::Attr::style(self->super.super._internal);
  v4 = (DOMCSSStyleDeclaration *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

@end
