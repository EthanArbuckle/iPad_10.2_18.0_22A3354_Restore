@implementation _UIMutableFastIndexSet

- (void)removeIndex:(int8x16_t)a3
{
  unsigned __int16 v3;
  uint64_t i64;
  unint64_t v5;
  __int32 v6;
  uint16x8_t *v7;
  unint64_t v8;
  uint16x8_t v9;
  uint16x8_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint16x8_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint16x8_t v38;
  int8x16_t v39;
  uint64_t v40;
  unint64_t v41;
  __int16 v42;
  unint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  char *v46;
  uint64_t v47;
  __int16 *v48;
  __int128 *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  unint64_t v55;
  _BOOL8 v56;
  uint64_t v57;
  char v58;
  char *v59;
  char *v60;
  int64_t v61;
  char *v62;
  unint64_t v63;
  char *v64;
  char *v65;
  char *v66;
  int64_t v67;
  uint16x8_t v68;
  uint16x8_t v69;
  int8x16_t v70;
  uint64_t v71;
  unint64_t v72;
  __int16 v73;
  unint64_t v74;
  unint64_t v75;
  uint16x8_t v76;
  uint16x8_t v77;
  uint16x8_t v78;
  uint16x8_t v79;
  uint16x8_t v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  __int16 v84;
  unint64_t v85;
  char *v86;
  char *v87;
  int64_t v88;
  int8x16_t v89;
  uint16x8_t v90;
  _OWORD v91[2];
  int8x16_t v92;
  uint16x8_t v93;
  _OWORD v94[2];
  int8x16_t v95;
  uint16x8_t v96;
  uint16x8_t v97;
  uint16x8_t v98;
  _OWORD v99[2];
  uint16x8_t v100;
  uint16x8_t v101;
  uint16x8_t v102;
  uint16x8_t v103;
  int8x16_t v104;
  uint16x8_t v105;
  int8x16_t v106;
  uint16x8_t v107;
  _OWORD v108[2];
  __n128 *v109;
  _QWORD *v110;
  _QWORD *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  __n128 v115;
  uint64_t v116;
  uint16x8_t *v117;
  char *i8;
  char *v119;
  unint64_t v120;
  unint64_t v121;
  _QWORD v122[2];

  if (!a1)
    return;
  v3 = a2;
  if (a2 == 0x7FFFFFFFFFFFFFFFLL)
    return;
  i64 = (uint64_t)a1[1].i64;
  v5 = a2 + 1;
  v6 = a1[4].i32[0];
  if (v6)
    v7 = 0;
  else
    v7 = a1 + 1;
  if (!v6)
  {
    if (a2 <= 0xFF)
    {
      v19 = a2 >> 6;
      v20 = 255;
      if (v5 < 0xFF)
        v20 = a2 + 1;
      if (v19 <= v20 >> 6)
      {
        v21 = (v20 >> 6) - v19 + 1;
        v22 = &v7->i64[v19];
        v23 = v19 << 6;
        v24 = (v19 << 6) + 64;
        v25 = v24 + a2;
        v26 = -64 * v19;
        do
        {
          v27 = a2 - v23;
          if (a2 >= v23)
            v28 = v23;
          else
            v28 = a2;
          if (a2 < v23)
            v27 = 0;
          v29 = v25 - v28;
          if (v24 >= v5)
            v30 = a2 + 1;
          else
            v30 = v24;
          v31 = 0xFFFFFFFFFFFFFFFFLL >> (v29 - v30) << v27;
          if (v27 < v30 + v26)
            v32 = ~v31;
          else
            v32 = -1;
          *v22++ &= v32;
          v25 += 64;
          v23 += 64;
          v24 += 64;
          v26 -= 64;
          --v21;
        }
        while (v21);
      }
    }
    return;
  }
  if (v6 != 1)
  {
    if (v6 != 2)
      return;
    v33 = a1[1].i64[0];
    v34 = a1[1].u64[1];
    if (v33 == v34 || *(_QWORD *)(v34 - 8) <= a2)
      return;
    if (v34 - v33 < 9)
    {
      v35 = 0;
    }
    else
    {
      v35 = 0;
      v36 = (uint64_t)(v34 - v33) >> 3;
      do
      {
        if (*(_QWORD *)(v33 + 8 * (v35 + (v36 >> 1))) < a2)
          v35 += v36 >> 1;
        v36 -= v36 >> 1;
      }
      while (v36 > 1);
    }
    v52 = (char *)(v33 + 8 * v35 + 8 * (*(_QWORD *)(v33 + 8 * v35) < a2));
    if (v34 >= (unint64_t)(v52 + 16))
      v53 = v52 + 16;
    else
      v53 = (char *)a1[1].i64[1];
    if ((unint64_t)(v53 - v52) < 9)
    {
      v54 = 0;
    }
    else
    {
      v54 = 0;
      v55 = (v53 - v52) >> 3;
      do
      {
        if (*(_QWORD *)&v52[8 * v54 + 8 * (v55 >> 1)] <= v5)
          v54 += v55 >> 1;
        v55 -= v55 >> 1;
      }
      while (v55 > 1);
    }
    v56 = v53 != v52 && *(_QWORD *)&v52[8 * v54] <= v5;
    v57 = v56 + v54;
    v58 = (_BYTE)v52 - v33;
    if ((v57 & 1) != 0)
    {
      if ((v58 & 8) != 0)
        v63 = a2;
      else
        v63 = a2 + 1;
      *(_QWORD *)v52 = v63;
      if (v57 == 1)
        return;
      v64 = v52 + 8;
      v65 = &v52[8 * v57];
      v66 = (char *)a1[1].i64[1];
      v67 = v66 - v65;
      if (v66 != v65)
        memmove(v64, v65, v66 - v65);
      v62 = &v64[v67];
    }
    else if ((v58 & 8) != 0)
    {
      v117 = a1 + 1;
      i8 = v52;
      v119 = &v52[8 * v57];
      v120 = a2;
      v121 = a2 + 1;
      v122[0] = 2;
      switch(v57)
      {
        case 2:
          *(_QWORD *)v52 = a2;
          *((_QWORD *)v52 + 1) = v5;
          return;
        case 1:
          *(_QWORD *)v52 = a2;
          std::vector<unsigned long>::insert((uint64_t)a1[1].i64, v52 + 8, (char *)&v121);
          return;
        case 0:
          std::vector<unsigned long>::__insert_with_size[abi:nn180100]<unsigned long *,unsigned long *>((uint64_t)a1[1].i64, v52, (char *)&v120, v122);
          return;
      }
      *(_QWORD *)v52 = a2;
      *((_QWORD *)v52 + 1) = v5;
      v86 = &v52[8 * v57];
      v87 = (char *)a1[1].i64[1];
      v88 = v87 - v86;
      if (v87 != v86)
        memmove(v52 + 16, v86, v87 - v86);
      v62 = &v52[v88 + 16];
    }
    else
    {
      if (!v57)
        return;
      v59 = &v52[8 * v57];
      v60 = (char *)a1[1].i64[1];
      v61 = v60 - v59;
      if (v60 != v59)
        memmove(v52, v59, v60 - v59);
      v62 = &v52[v61];
    }
    *(_QWORD *)(i64 + 8) = v62;
    return;
  }
  v8 = a1[3].u64[0];
  if (!v8)
  {
    LOWORD(v5) = 0;
    v18 = 0;
    v3 = 0;
    v12 = 0;
    v17 = 0;
    v117 = a1 + 1;
    i8 = a1[1].i8;
    v119 = 0;
    v120 = (unint64_t)&a1[1];
    v121 = 0;
    goto LABEL_51;
  }
  a3 = *(int8x16_t *)i64;
  v9 = a1[2];
  v108[0] = *(_OWORD *)i64;
  v108[1] = v9;
  if (*((unsigned __int16 *)v108 + (((_BYTE)v8 - 1) & 0xF)) <= (unsigned __int16)a2)
  {
    LOWORD(v5) = 0;
    v18 = 0;
    v3 = 0;
    v117 = a1 + 1;
    i8 = a1[1].i8;
    v119 = (char *)v8;
    v120 = (unint64_t)&a1[1];
    v121 = v8;
    v12 = v8;
    v17 = v8;
    goto LABEL_51;
  }
  v10 = (uint16x8_t)vdupq_n_s16(a2);
  v11 = __clz(__rbit64(*(_QWORD *)&vshrn_n_s16((int16x8_t)vuzp1q_s8((int8x16_t)vcgeq_u16((uint16x8_t)a3, v10), (int8x16_t)vcgeq_u16(v9, v10)), 4uLL))) >> 2;
  if (v11 >= v8)
    v12 = v8;
  else
    v12 = v11;
  v13 = v12 - (unsigned __int16)a2 + (unsigned __int16)v5;
  if (v8 >= v13 + 1)
    v14 = v13 + 1;
  else
    v14 = v8;
  v15 = (uint16x8_t)vdupq_n_s16(v5);
  a3 = vuzp1q_s8((int8x16_t)vcgtq_u16((uint16x8_t)a3, v15), (int8x16_t)vcgtq_u16(v9, v15));
  *(int8x8_t *)a3.i8 = vshrn_n_s16((int16x8_t)a3, 4uLL);
  v16 = __clz(__rbit64((-1 << (4 * v12)) & a3.i64[0])) >> 2;
  if (v16 >= v14)
    v17 = v14;
  else
    v17 = v16;
  if ((((_DWORD)v17 - (_DWORD)v12) & 1) != 0)
  {
    if ((v12 & 1) != 0)
      v3 = a2;
    else
      v3 = a2 + 1;
    v117 = a1 + 1;
    i8 = a1[1].i8;
    v119 = (char *)v12;
    v120 = (unint64_t)&a1[1];
    v121 = v17;
    LODWORD(v122[0]) = v3;
    v18 = 1;
    LOWORD(v5) = 0;
  }
  else
  {
    v117 = a1 + 1;
    i8 = a1[1].i8;
    v119 = (char *)v12;
    v120 = (unint64_t)&a1[1];
    v121 = v17;
    if ((v12 & 1) == 0)
    {
      LOWORD(v5) = 0;
      v18 = 0;
      v3 = 0;
LABEL_51:
      LODWORD(v122[0]) = 0;
      goto LABEL_52;
    }
    LOWORD(v122[0]) = a2;
    WORD1(v122[0]) = a2 + 1;
    v18 = 2;
  }
LABEL_52:
  v122[1] = v18;
  if (v18 + v12 + v8 - v17 > 0x10)
  {
    v115 = 0uLL;
    v116 = 0;
    _ZNSt3__16vectorImNS_9allocatorImEEE16__init_with_sizeB8nn180100I22_UISmallVectorIteratorIDv16_tES7_EEvT_T0_m((char *)&v115, (_OWORD *)i64, 0, i64, v8, v8);
    v44 = (_QWORD *)(v115.n128_u64[0] + 8 * v12);
    v109 = &v115;
    v110 = v44;
    v45 = (_QWORD *)(v115.n128_u64[0] + 8 * v17);
    v46 = (char *)&v112;
    v111 = v45;
    v112 = v3;
    v113 = (unsigned __int16)v5;
    v114 = v18;
    v47 = v45 - v44;
    if (v18 == 2)
    {
      if (v47 == 2)
      {
        *v44 = v3;
        v44[1] = (unsigned __int16)v5;
        goto LABEL_139;
      }
      if (v47 != 1)
      {
        if (!v47)
        {
          std::vector<unsigned long>::__insert_with_size[abi:nn180100]<unsigned long *,unsigned long *>((uint64_t)&v115, (char *)(v115.n128_u64[0] + 8 * v12), (char *)&v112, &v114);
          goto LABEL_139;
        }
        *v44 = v3;
        v44[1] = (unsigned __int16)v5;
        if (v44 + 2 != v45)
        {
          v85 = v115.n128_u64[1] - (_QWORD)v45;
          if ((_QWORD *)v115.n128_u64[1] != v45)
            memmove(v44 + 2, v45, v115.n128_u64[1] - (_QWORD)v45);
          v75 = (unint64_t)v44 + v85 + 16;
          goto LABEL_122;
        }
        goto LABEL_139;
      }
      v46 = (char *)&v113;
      *v44++ = v3;
    }
    else
    {
      if (v18 != 1)
      {
        if (v17 == v12)
          goto LABEL_139;
        goto LABEL_119;
      }
      if (v47)
      {
        if (v47 == 1)
        {
          *v44 = v3;
          goto LABEL_139;
        }
        *v44++ = v3;
        if (v44 != v45)
        {
LABEL_119:
          v74 = v115.n128_u64[1] - (_QWORD)v45;
          if ((_QWORD *)v115.n128_u64[1] != v45)
            memmove(v44, v45, v115.n128_u64[1] - (_QWORD)v45);
          v75 = (unint64_t)v44 + v74;
LABEL_122:
          v115.n128_u64[1] = v75;
        }
LABEL_139:
        std::__variant_detail::__assignment<std::__variant_detail::__traits<_UIBitSet<256ul>,_UISmallVector<unsigned short,16ul>,std::vector<unsigned long>>>::__assign_alt[abi:nn180100]<2ul,std::vector<unsigned long>,std::vector<unsigned long>>(i64, i64, &v115);
        if (v115.n128_u64[0])
        {
          v115.n128_u64[1] = v115.n128_u64[0];
          operator delete((void *)v115.n128_u64[0]);
        }
        return;
      }
    }
    std::vector<unsigned long>::insert((uint64_t)&v115, (char *)v44, v46);
    goto LABEL_139;
  }
  v37 = v17 - v12;
  if (v18 == 2)
  {
    if (v37 == 2)
    {
      v76 = a1[2];
      v106 = *(int8x16_t *)i64;
      v107 = v76;
      v106.i16[v12 & 0xF] = v3;
      v104 = v106;
      v105 = v107;
      v104.i16[((_BYTE)v12 + 1) & 0xF] = v5;
      v77 = v105;
      *(int8x16_t *)i64 = v104;
      a1[2] = v77;
      return;
    }
    if (v37 != 1)
    {
      if (!v37)
      {
        _UISmallVector<unsigned short,16ul>::insert<unsigned short *>((__int128 *)a1[1].i8, (__n128)a3, i64, v12, (__int16 *)v122, (__int16 *)v122 + 2);
        return;
      }
      v78 = a1[2];
      v102 = a1[1];
      v103 = v78;
      v102.i16[v12 & 0xF] = v3;
      v100 = v102;
      v101 = v103;
      v100.i16[((_BYTE)v12 + 1) & 0xF] = v5;
      v80 = v100;
      v79 = v101;
      a1[1] = v100;
      a1[2] = v79;
      v81 = a1[3].u64[0];
      if (v17 < v81)
      {
        v82 = v12 + 2;
        v83 = v17;
        do
        {
          v99[0] = v80;
          v99[1] = v79;
          v84 = *((_WORD *)v99 + (v83 & 0xF));
          v97 = v80;
          v98 = v79;
          v97.i16[v82 & 0xF] = v84;
          v80 = v97;
          v79 = v98;
          ++v83;
          ++v82;
        }
        while (v81 != v83);
        *(uint16x8_t *)i64 = v97;
        a1[2] = v79;
      }
      v43 = v12 + 2 - v17 + v81;
      goto LABEL_135;
    }
    *(_WORD *)(i64 + 2 * v12) = v3;
    v51 = v12 + 1;
    v48 = (__int16 *)v122 + 1;
    v49 = (__int128 *)a1[1].i8;
    v50 = i64;
    goto LABEL_129;
  }
  if (v18 == 1)
  {
    if (v37 == 1)
    {
      *(_WORD *)(i64 + 2 * v12) = v3;
      return;
    }
    if (v37)
    {
      v68 = a1[2];
      v95 = *(int8x16_t *)i64;
      v96 = v68;
      v95.i16[v12 & 0xF] = v3;
      v70 = v95;
      v69 = v96;
      *(int8x16_t *)i64 = v95;
      a1[2] = v69;
      if (v17 < v8)
      {
        v71 = v12 + 1;
        v72 = v17;
        do
        {
          v94[0] = v70;
          v94[1] = v69;
          v73 = *((_WORD *)v94 + (v72 & 0xF));
          v92 = v70;
          v93 = v69;
          v92.i16[v71 & 0xF] = v73;
          v70 = v92;
          v69 = v93;
          ++v72;
          ++v71;
        }
        while (v8 != v72);
        *(int8x16_t *)i64 = v92;
        a1[2] = v69;
      }
      v43 = v12 + 1 - v17 + v8;
      goto LABEL_135;
    }
    v48 = (__int16 *)v122;
    v49 = (__int128 *)a1[1].i8;
    v50 = i64;
    v51 = v12;
LABEL_129:
    _UISmallVector<unsigned short,16ul>::insert(v49, v50, v51, v48);
    return;
  }
  if (v17 != v12)
  {
    if (v17 < v8)
    {
      v39 = *(int8x16_t *)i64;
      v38 = a1[2];
      v40 = v12;
      v41 = v17;
      do
      {
        v91[0] = v39;
        v91[1] = v38;
        v42 = *((_WORD *)v91 + (v41 & 0xF));
        v89 = v39;
        v90 = v38;
        v89.i16[v40 & 0xF] = v42;
        v39 = v89;
        v38 = v90;
        ++v41;
        ++v40;
      }
      while (v8 != v41);
      *(int8x16_t *)i64 = v89;
      a1[2] = v38;
    }
    v43 = v12 + v8 - v17;
LABEL_135:
    a1[3].i64[0] = v43;
  }
}

- (void)addIndexesInRange:(uint64_t)a3
{
  unint64_t v4;
  _OWORD *v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  char v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  unint64_t v28;
  __n128 *v29;
  __int128 v30;
  int64_t v31;
  uint64_t v32;
  __n128 *p_src;
  unsigned __int16 v34;
  void *v35;
  unint64_t v36;
  uint64_t v37;
  _OWORD *v38;
  unint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  unint64_t v43;
  char *v44;
  uint64_t v45;
  uint16x8_t v46;
  unsigned int v47;
  uint64_t v48;
  __int16 v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint16x8_t v53;
  unint64_t v54;
  uint16x8_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  _BOOL8 v60;
  uint64_t v61;
  unint64_t v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  unint64_t v66;
  __int16 v67;
  unint64_t v68;
  _QWORD *v69;
  _BYTE *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  __int16 *v74;
  char *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  unint64_t v80;
  __int16 v81;
  char *v82;
  int64_t v83;
  char *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  unint64_t v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t v92;
  __int128 v93;
  __int128 v94;
  unint64_t v95;
  uint64_t v96;
  __int16 v97;
  unint64_t v98;
  char *v99;
  char *v100;
  int64_t v101;
  __int128 v102;
  __n128 v103;
  __int128 v104;
  __int128 v105;
  _OWORD v106[2];
  __int128 v107;
  __int128 v108;
  _OWORD v109[2];
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _OWORD v114[2];
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _OWORD v123[2];
  __int128 v124;
  __n128 v125;
  __n128 __p;
  _BYTE *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  __n128 v131;
  uint64_t v132;
  uint64_t v133;
  __int128 v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  __n128 __src;
  unint64_t v139;
  _OWORD *v140;
  __int128 v141;
  uint64_t v142;
  uint64_t v143;

  v143 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v4 = a2;
  if (a2 == 0x7FFFFFFFFFFFFFFFLL || !a3)
    return;
  v7 = (_OWORD *)(a1 + 16);
  v8 = a2 + a3;
  v9 = *(_DWORD *)(a1 + 64);
  if (v9)
    v10 = 0;
  else
    v10 = a1 + 16;
  if (!v9)
  {
    if ((v8 | a2) < 0x100)
    {
      if (a2 < v8)
      {
        v11 = a2 >> 6;
        if (a2 >> 6 <= v8 >> 6)
        {
          v12 = (v8 >> 6) - v11 + 1;
          v13 = (_QWORD *)(v10 + 8 * v11);
          v14 = v11 << 6;
          v15 = (v11 << 6) + 64;
          v16 = v15 + a2;
          v17 = -64 * v11;
          do
          {
            v18 = a2 - v14;
            if (a2 >= v14)
              v19 = v14;
            else
              v19 = a2;
            if (a2 < v14)
              v18 = 0;
            v20 = v16 - v19;
            if (v15 >= v8)
              v21 = a2 + a3;
            else
              v21 = v15;
            v22 = 0xFFFFFFFFFFFFFFFFLL >> (v20 - v21) << v18;
            if (v18 >= v21 + v17)
              v23 = 0;
            else
              v23 = v22;
            *v13++ |= v23;
            v16 += 64;
            v14 += 64;
            v15 += 64;
            v17 -= 64;
            --v12;
          }
          while (v12);
        }
      }
      return;
    }
    v24 = 0;
    v25 = 256;
    v26 = (unint64_t *)v10;
    while (1)
    {
      v27 = *v26++;
      v28 = __clz(__rbit64(v27));
      if (v28 < 0x40)
        break;
      v24 -= 64;
      if (v24 == -256)
        goto LABEL_30;
    }
    v25 = v28 - v24;
LABEL_30:
    if ((v8 | a2) >> 16)
    {
      v135 = v10;
      v136 = v25;
      v137 = 0;
      v133 = v10;
      v134 = xmmword_18667B130;
      std::vector<unsigned long>::vector<_UIBitSetIterator<unsigned long,256ul>,0>(&__src, &v135, (uint64_t)&v133);
      a4 = std::__variant_detail::__assignment<std::__variant_detail::__traits<_UIBitSet<256ul>,_UISmallVector<unsigned short,16ul>,std::vector<unsigned long>>>::__assign_alt[abi:nn180100]<2ul,std::vector<unsigned long>,std::vector<unsigned long>>((uint64_t)v7, (uint64_t)v7, &__src);
      v35 = (void *)__src.n128_u64[0];
      if (!__src.n128_u64[0])
      {
LABEL_49:
        v9 = *(_DWORD *)(a1 + 64);
        goto LABEL_50;
      }
      __src.n128_u64[1] = __src.n128_u64[0];
    }
    else
    {
      v135 = v10;
      v136 = v25;
      v137 = 0;
      v29 = (__n128 *)std::uninitialized_copy[abi:nn180100]<_UIBitSetIterator<unsigned long,256ul>,unsigned long *>(&v135, 256, __src.n128_u64);
      v31 = (char *)v29 - (char *)&__src;
      if ((unint64_t)((char *)v29 - (char *)&__src) <= 0x87)
      {
        if (&__src == v29)
        {
          v32 = 0;
        }
        else
        {
          v32 = 0;
          p_src = &__src;
          do
          {
            v34 = p_src->n128_u16[0];
            p_src = (__n128 *)((char *)p_src + 8);
            v124 = v30;
            v125 = a4;
            *((_WORD *)&v124 + (v32 & 0xF)) = v34;
            v30 = v124;
            a4 = v125;
            ++v32;
          }
          while (p_src != v29);
        }
        v37 = *(unsigned int *)(a1 + 64);
        if ((_DWORD)v37 != -1)
        {
          if ((_DWORD)v37 == 1)
          {
            *(_OWORD *)(a1 + 16) = v30;
            *(__n128 *)(a1 + 32) = a4;
            *(_QWORD *)(a1 + 48) = v32;
            goto LABEL_49;
          }
          v102 = v30;
          v103 = a4;
          ((void (*)(__n128 *, _OWORD *))off_1E16C5078[v37])(&__p, v7);
          v30 = v102;
          a4 = v103;
        }
        *(_OWORD *)(a1 + 16) = v30;
        *(__n128 *)(a1 + 32) = a4;
        *(_QWORD *)(a1 + 48) = v32;
        *(_DWORD *)(a1 + 64) = 1;
        goto LABEL_49;
      }
      __p = 0uLL;
      v127 = 0;
      if (v29 != &__src)
      {
        std::vector<unsigned long>::__vallocate[abi:nn180100](&__p, v31 >> 3);
        v36 = __p.n128_u64[1];
        memmove((void *)__p.n128_u64[1], &__src, v31);
        __p.n128_u64[1] = v36 + 8 * (v31 >> 3);
      }
      a4 = std::__variant_detail::__assignment<std::__variant_detail::__traits<_UIBitSet<256ul>,_UISmallVector<unsigned short,16ul>,std::vector<unsigned long>>>::__assign_alt[abi:nn180100]<2ul,std::vector<unsigned long>,std::vector<unsigned long>>((uint64_t)v7, (uint64_t)v7, &__p);
      v35 = (void *)__p.n128_u64[0];
      if (!__p.n128_u64[0])
        goto LABEL_49;
      __p.n128_u64[1] = __p.n128_u64[0];
    }
    operator delete(v35);
    goto LABEL_49;
  }
LABEL_50:
  if (v9 == 1)
    v38 = v7;
  else
    v38 = 0;
  if (v9 != 1)
    goto LABEL_58;
  v39 = *(_QWORD *)(a1 + 48);
  if ((v8 | v4) >> 16)
  {
    __src = 0uLL;
    v139 = 0;
    _ZNSt3__16vectorImNS_9allocatorImEEE16__init_with_sizeB8nn180100I22_UISmallVectorIteratorIDv16_tES7_EEvT_T0_m((char *)&__src, v7, 0, (uint64_t)v7, v39, v39);
    std::__variant_detail::__assignment<std::__variant_detail::__traits<_UIBitSet<256ul>,_UISmallVector<unsigned short,16ul>,std::vector<unsigned long>>>::__assign_alt[abi:nn180100]<2ul,std::vector<unsigned long>,std::vector<unsigned long>>((uint64_t)v7, (uint64_t)v7, &__src);
    if (__src.n128_u64[0])
    {
      __src.n128_u64[1] = __src.n128_u64[0];
      operator delete((void *)__src.n128_u64[0]);
    }
    v9 = *(_DWORD *)(a1 + 64);
LABEL_58:
    if (v9 == 2)
      v40 = (uint64_t)v7;
    else
      v40 = 0;
    if (v9 != 2)
      return;
    v42 = *(char **)(a1 + 16);
    v41 = *(char **)(a1 + 24);
    if (v42 == v41)
    {
      v41 = *(char **)(a1 + 16);
    }
    else
    {
      v44 = v41 - 8;
      v43 = *((_QWORD *)v41 - 1);
      if (v4 <= v43)
      {
        if (v4 == v43)
        {
LABEL_65:
          *(_QWORD *)v44 = v8;
          return;
        }
        if ((unint64_t)(v41 - v42) < 9)
        {
          v51 = 0;
        }
        else
        {
          v51 = 0;
          v52 = (v41 - v42) >> 3;
          do
          {
            if (*(_QWORD *)&v42[8 * v51 + 8 * (v52 >> 1)] < v4)
              v51 += v52 >> 1;
            v52 -= v52 >> 1;
          }
          while (v52 > 1);
        }
        v44 = &v42[8 * v51 + 8 * (*(_QWORD *)&v42[8 * v51] < v4)];
        if (v41 >= &v44[8 * a3 + 8])
          v57 = (uint64_t)&v44[8 * a3 + 8];
        else
          v57 = (uint64_t)v41;
        if ((unint64_t)(v57 - (_QWORD)v44) < 9)
        {
          v58 = 0;
        }
        else
        {
          v58 = 0;
          v59 = (v57 - (uint64_t)v44) >> 3;
          do
          {
            if (*(_QWORD *)&v44[8 * v58 + 8 * (v59 >> 1)] <= v8)
              v58 += v59 >> 1;
            v59 -= v59 >> 1;
          }
          while (v59 > 1);
        }
        v60 = (char *)v57 != v44 && *(_QWORD *)&v44[8 * v58] <= v8;
        v61 = v58 + v60;
        if ((v61 & 1) != 0)
        {
          if ((((_BYTE)v44 - (_BYTE)v42) & 8) == 0)
            v8 = v4;
          __src.n128_u64[0] = v40;
          __src.n128_u64[1] = (unint64_t)v44;
          v139 = (unint64_t)&v44[8 * v61];
          v140 = (_OWORD *)v8;
          v141 = xmmword_1866794A0;
          if (v61 == 1)
            goto LABEL_65;
          if (!v61)
          {
            std::vector<unsigned long>::insert(v40, v44, (char *)&v140);
            return;
          }
          *(_QWORD *)v44 = v8;
          v44 += 8;
          v75 = &v44[8 * v61 - 8];
        }
        else
        {
          __src.n128_u64[0] = v40;
          __src.n128_u64[1] = (unint64_t)v44;
          v139 = (unint64_t)&v44[8 * v61];
          if ((((_BYTE)v44 - (_BYTE)v42) & 8) == 0)
          {
            v140 = (_OWORD *)v4;
            *(_QWORD *)&v141 = v4 + a3;
            *((_QWORD *)&v141 + 1) = 2;
            switch(v61)
            {
              case 2:
                *(_QWORD *)v44 = v4;
                *((_QWORD *)v44 + 1) = v8;
                return;
              case 1:
                *(_QWORD *)v44 = v4;
                std::vector<unsigned long>::insert(v40, v44 + 8, (char *)&v141);
                return;
              case 0:
                v7 = (_OWORD *)v40;
                v41 = v44;
                goto LABEL_71;
            }
            *(_QWORD *)v44 = v4;
            *((_QWORD *)v44 + 1) = v8;
            v99 = &v44[8 * v61];
            v100 = *(char **)(v40 + 8);
            v101 = v100 - v99;
            if (v100 != v99)
              memmove(v44 + 16, v99, v100 - v99);
            v84 = &v44[v101 + 16];
LABEL_165:
            *(_QWORD *)(v40 + 8) = v84;
            return;
          }
          v140 = 0;
          v141 = 0uLL;
          if (!v61)
            return;
          v75 = &v44[8 * v61];
        }
        v82 = *(char **)(v40 + 8);
        v83 = v82 - v75;
        if (v82 != v75)
          memmove(v44, v75, v82 - v75);
        v84 = &v44[v83];
        goto LABEL_165;
      }
    }
    __src.n128_u64[0] = (unint64_t)v7;
    __src.n128_u64[1] = (unint64_t)v41;
    v139 = (unint64_t)v41;
    v140 = (_OWORD *)v4;
    *(_QWORD *)&v141 = v4 + a3;
    *((_QWORD *)&v141 + 1) = 2;
LABEL_71:
    std::vector<unsigned long>::__insert_with_size[abi:nn180100]<unsigned long *,unsigned long *>((uint64_t)v7, v41, (char *)&v140, (_BYTE *)&v141 + 8);
    return;
  }
  if (!v39)
  {
    v45 = 0;
    v50 = 0;
    __src.n128_u64[0] = (unint64_t)v7;
    __src.n128_u64[1] = (unint64_t)v7;
    v139 = 0;
    v140 = v7;
    *(_QWORD *)&v141 = 0;
    WORD4(v141) = v4;
    v48 = 2;
    v49 = v4 + a3;
    goto LABEL_73;
  }
  v45 = v39 - 1;
  a4 = *(__n128 *)v7;
  v46 = *((uint16x8_t *)v7 + 1);
  v123[0] = *v7;
  v123[1] = v46;
  v47 = *((unsigned __int16 *)v123 + ((v39 - 1) & 0xF));
  if (v47 < (unsigned __int16)v4)
  {
    __src.n128_u64[0] = (unint64_t)v7;
    __src.n128_u64[1] = (unint64_t)v7;
    v139 = v39;
    v140 = v7;
    *(_QWORD *)&v141 = v39;
    v48 = 2;
    WORD4(v141) = v4;
    v49 = v4 + a3;
    v45 = v39;
    v50 = v39;
LABEL_73:
    WORD5(v141) = v8;
    goto LABEL_122;
  }
  if (v47 == (unsigned __int16)v4)
  {
    v49 = 0;
    __src.n128_u64[0] = (unint64_t)v7;
    __src.n128_u64[1] = (unint64_t)v7;
    v139 = v39 - 1;
    v140 = v7;
    *(_QWORD *)&v141 = v39;
    WORD4(v141) = v4 + a3;
    v48 = 1;
    LOWORD(v4) = v4 + a3;
    v50 = v39;
LABEL_121:
    WORD5(v141) = 0;
    goto LABEL_122;
  }
  v53 = (uint16x8_t)vdupq_n_s16(v4);
  v54 = __clz(__rbit64(*(_QWORD *)&vshrn_n_s16((int16x8_t)vuzp1q_s8((int8x16_t)vcgeq_u16((uint16x8_t)a4, v53), (int8x16_t)vcgeq_u16(v46, v53)), 4uLL))) >> 2;
  if (v54 >= v39)
    v45 = v39;
  else
    v45 = v54;
  if (v39 >= a3 + v45 + 1)
    v50 = a3 + v45 + 1;
  else
    v50 = v39;
  v55 = (uint16x8_t)vdupq_n_s16(v8);
  a4 = (__n128)vuzp1q_s8((int8x16_t)vcgtq_u16((uint16x8_t)a4, v55), (int8x16_t)vcgtq_u16(v46, v55));
  a4.n128_u64[0] = (unint64_t)vshrn_n_s16((int16x8_t)a4, 4uLL);
  v56 = __clz(__rbit64((-1 << (4 * v45)) & a4.n128_u64[0])) >> 2;
  if (v56 < v50)
    v50 = v56;
  if ((((_DWORD)v50 - (_DWORD)v45) & 1) != 0)
  {
    v49 = 0;
    if ((v45 & 1) != 0)
      LOWORD(v4) = v8;
    __src.n128_u64[0] = (unint64_t)v7;
    __src.n128_u64[1] = (unint64_t)v7;
    v139 = v45;
    v140 = v7;
    *(_QWORD *)&v141 = v50;
    WORD4(v141) = v4;
    v48 = 1;
    goto LABEL_121;
  }
  __src.n128_u64[0] = (unint64_t)v7;
  __src.n128_u64[1] = (unint64_t)v7;
  v139 = v45;
  v140 = v7;
  *(_QWORD *)&v141 = v50;
  if ((v45 & 1) != 0)
  {
    v49 = 0;
    v48 = 0;
    LOWORD(v4) = 0;
    DWORD2(v141) = 0;
  }
  else
  {
    WORD4(v141) = v4;
    WORD5(v141) = v4 + a3;
    v48 = 2;
    v49 = v4 + a3;
  }
LABEL_122:
  v142 = v48;
  if (v48 + v45 + v39 - v50 > 0x10)
  {
    v131 = 0uLL;
    v132 = 0;
    _ZNSt3__16vectorImNS_9allocatorImEEE16__init_with_sizeB8nn180100I22_UISmallVectorIteratorIDv16_tES7_EEvT_T0_m((char *)&v131, v7, 0, (uint64_t)v7, v39, v39);
    v69 = (_QWORD *)(v131.n128_u64[0] + 8 * v139);
    __p.n128_u64[0] = (unint64_t)&v131;
    __p.n128_u64[1] = (unint64_t)v69;
    v70 = (_BYTE *)(v131.n128_u64[0] + 8 * v141);
    v71 = (char *)&v128;
    v127 = v70;
    v128 = WORD4(v141);
    v72 = WORD5(v141);
    v129 = WORD5(v141);
    v130 = v142;
    v73 = (v70 - (_BYTE *)v69) >> 3;
    if (v142 == 2)
    {
      if (v73 == 2)
      {
        *v69 = WORD4(v141);
        v69[1] = v72;
        goto LABEL_182;
      }
      if (v73 != 1)
      {
        if (!v73)
        {
          std::vector<unsigned long>::__insert_with_size[abi:nn180100]<unsigned long *,unsigned long *>((uint64_t)&v131, (char *)(v131.n128_u64[0] + 8 * v139), (char *)&v128, &v130);
          goto LABEL_182;
        }
        *v69 = WORD4(v141);
        v69[1] = v72;
        v69 += 2;
        goto LABEL_178;
      }
      v71 = (char *)&v129;
      *v69++ = WORD4(v141);
    }
    else
    {
      if (v142 != 1)
      {
        if (v142 || (_QWORD)v141 == v139)
        {
LABEL_182:
          std::__variant_detail::__assignment<std::__variant_detail::__traits<_UIBitSet<256ul>,_UISmallVector<unsigned short,16ul>,std::vector<unsigned long>>>::__assign_alt[abi:nn180100]<2ul,std::vector<unsigned long>,std::vector<unsigned long>>((uint64_t)v7, (uint64_t)v7, &v131);
          if (v131.n128_u64[0])
          {
            v131.n128_u64[1] = v131.n128_u64[0];
            operator delete((void *)v131.n128_u64[0]);
          }
          return;
        }
LABEL_179:
        v98 = v131.n128_u64[1] - (_QWORD)v70;
        if ((_BYTE *)v131.n128_u64[1] != v70)
          memmove(v69, v70, v131.n128_u64[1] - (_QWORD)v70);
        v131.n128_u64[1] = (unint64_t)v69 + v98;
        goto LABEL_182;
      }
      if (v73)
      {
        if (v73 == 1)
        {
          *v69 = WORD4(v141);
          goto LABEL_182;
        }
        *v69++ = WORD4(v141);
LABEL_178:
        if (v69 == (_QWORD *)v70)
          goto LABEL_182;
        goto LABEL_179;
      }
    }
    std::vector<unsigned long>::insert((uint64_t)&v131, (char *)v69, v71);
    goto LABEL_182;
  }
  v62 = v50 - v45;
  if (v48 != 2)
  {
    if (v48 != 1)
    {
      if (v50 == v45)
        return;
      if (v50 < v39)
      {
        v64 = *v7;
        v63 = v7[1];
        v65 = v45;
        v66 = v50;
        do
        {
          v106[0] = v64;
          v106[1] = v63;
          v67 = *((_WORD *)v106 + (v66 & 0xF));
          v104 = v64;
          v105 = v63;
          *((_WORD *)&v104 + (v65 & 0xF)) = v67;
          v64 = v104;
          v63 = v105;
          ++v66;
          ++v65;
        }
        while (v39 != v66);
        *v38 = v104;
        v38[1] = v63;
      }
      v68 = v45 + v39 - v50;
LABEL_158:
      *(_QWORD *)(a1 + 48) = v68;
      return;
    }
    if (v62 == 1)
    {
      *((_WORD *)v7 + v45) = v4;
      return;
    }
    if (v62)
    {
      v76 = v7[1];
      v110 = *v7;
      v111 = v76;
      *((_WORD *)&v110 + (v45 & 0xF)) = v4;
      v78 = v110;
      v77 = v111;
      *v7 = v110;
      v7[1] = v77;
      if (v50 < v39)
      {
        v79 = v45 + 1;
        v80 = v50;
        do
        {
          v109[0] = v78;
          v109[1] = v77;
          v81 = *((_WORD *)v109 + (v80 & 0xF));
          v107 = v78;
          v108 = v77;
          *((_WORD *)&v107 + (v79 & 0xF)) = v81;
          v78 = v107;
          v77 = v108;
          ++v80;
          ++v79;
        }
        while (v39 != v80);
        *v7 = v107;
        v7[1] = v77;
      }
      v68 = v45 + 1 - v50 + v39;
      goto LABEL_158;
    }
    v74 = (__int16 *)&v141 + 4;
LABEL_168:
    _UISmallVector<unsigned short,16ul>::insert(v7, (uint64_t)v7, v45, v74);
    return;
  }
  if (v62 == 2)
  {
    v85 = v7[1];
    v121 = *v7;
    v122 = v85;
    *((_WORD *)&v121 + (v45 & 0xF)) = v4;
    v119 = v121;
    v120 = v122;
    *((_WORD *)&v119 + (((_BYTE)v45 + 1) & 0xF)) = v49;
    v86 = v120;
    *v7 = v119;
    v7[1] = v86;
    return;
  }
  if (v62 == 1)
  {
    *((_WORD *)v7 + v45++) = v4;
    v74 = (__int16 *)&v141 + 5;
    goto LABEL_168;
  }
  if (v62)
  {
    v87 = v7[1];
    v117 = *v7;
    v118 = v87;
    *((_WORD *)&v117 + (v45 & 0xF)) = v4;
    v115 = v117;
    v116 = v118;
    *((_WORD *)&v115 + (((_BYTE)v45 + 1) & 0xF)) = v49;
    v88 = v116;
    *v7 = v115;
    v7[1] = v88;
    v89 = __src.n128_u64[0];
    v90 = v139 + 2;
    v91 = v141;
    v92 = *(_QWORD *)(__src.n128_u64[0] + 32);
    if ((unint64_t)v141 < v92)
    {
      v94 = *(_OWORD *)__src.n128_u64[0];
      v93 = *(_OWORD *)(__src.n128_u64[0] + 16);
      v95 = v139 + 2;
      v96 = v141;
      do
      {
        v114[0] = v94;
        v114[1] = v93;
        v97 = *((_WORD *)v114 + (v96 & 0xF));
        v112 = v94;
        v113 = v93;
        *((_WORD *)&v112 + (v95 & 0xF)) = v97;
        v94 = v112;
        v93 = v113;
        ++v96;
        ++v95;
      }
      while (v92 != v96);
      *(_OWORD *)v89 = v112;
      *(_OWORD *)(v89 + 16) = v93;
    }
    *(_QWORD *)(v89 + 32) = v90 - v91 + v92;
  }
  else
  {
    _UISmallVector<unsigned short,16ul>::insert<unsigned short *>(v7, a4, (uint64_t)v7, v45, (__int16 *)&v141 + 4, (__int16 *)&v141 + 6);
  }
}

+ (id)indexSet
{
  return objc_alloc_init((Class)a1);
}

- (void)addIndex:(__n128)a3
{
  unint64_t v3;
  _OWORD *v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  char v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t v26;
  __n128 *v27;
  __int128 v28;
  int64_t v29;
  uint64_t v30;
  __n128 *p_src;
  unsigned __int16 v32;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  _OWORD *v36;
  unint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  unint64_t v41;
  char *v42;
  uint64_t v43;
  uint16x8_t v44;
  unsigned int v45;
  uint64_t v46;
  __int16 v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint16x8_t v51;
  unint64_t v52;
  uint16x8_t v53;
  unint64_t v54;
  char *v55;
  uint64_t v56;
  unint64_t v57;
  _BOOL8 v58;
  uint64_t v59;
  unint64_t v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  unint64_t v64;
  __int16 v65;
  unint64_t v66;
  _QWORD *v67;
  _BYTE *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  __int16 *v72;
  char *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  unint64_t v78;
  __int16 v79;
  char *v80;
  int64_t v81;
  char *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  unint64_t v90;
  __int128 v91;
  __int128 v92;
  unint64_t v93;
  uint64_t v94;
  __int16 v95;
  unint64_t v96;
  char *v97;
  char *v98;
  int64_t v99;
  __int128 v100;
  __n128 v101;
  __int128 v102;
  __int128 v103;
  _OWORD v104[2];
  __int128 v105;
  __int128 v106;
  _OWORD v107[2];
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _OWORD v112[2];
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _OWORD v121[2];
  __int128 v122;
  __n128 v123;
  __n128 __p;
  _BYTE *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  __n128 v129;
  uint64_t v130;
  uint64_t v131;
  __int128 v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  __n128 __src;
  unint64_t v137;
  _OWORD *v138;
  __int128 v139;
  uint64_t v140;
  uint64_t v141;

  v141 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v3 = a2;
  if (a2 == 0x7FFFFFFFFFFFFFFFLL)
    return;
  v5 = (_OWORD *)(a1 + 16);
  v6 = a2 + 1;
  v7 = *(_DWORD *)(a1 + 64);
  if (v7)
    v8 = 0;
  else
    v8 = a1 + 16;
  if (!v7)
  {
    if ((v6 | a2) < 0x100)
    {
      v9 = a2 >> 6;
      if (a2 >> 6 <= v6 >> 6)
      {
        v10 = (v6 >> 6) - v9 + 1;
        v11 = (_QWORD *)(v8 + 8 * v9);
        v12 = v9 << 6;
        v13 = (v9 << 6) + 64;
        v14 = v13 + a2;
        v15 = -64 * v9;
        do
        {
          v16 = a2 - v12;
          if (a2 >= v12)
            v17 = v12;
          else
            v17 = a2;
          if (a2 < v12)
            v16 = 0;
          v18 = v14 - v17;
          if (v13 >= v6)
            v19 = a2 + 1;
          else
            v19 = v13;
          v20 = 0xFFFFFFFFFFFFFFFFLL >> (v18 - v19) << v16;
          if (v16 >= v19 + v15)
            v21 = 0;
          else
            v21 = v20;
          *v11++ |= v21;
          v14 += 64;
          v12 += 64;
          v13 += 64;
          v15 -= 64;
          --v10;
        }
        while (v10);
      }
      return;
    }
    v22 = 0;
    v23 = 256;
    v24 = (unint64_t *)v8;
    while (1)
    {
      v25 = *v24++;
      v26 = __clz(__rbit64(v25));
      if (v26 < 0x40)
        break;
      v22 -= 64;
      if (v22 == -256)
        goto LABEL_28;
    }
    v23 = v26 - v22;
LABEL_28:
    if ((v6 | a2) >> 16)
    {
      v133 = v8;
      v134 = v23;
      v135 = 0;
      v131 = v8;
      v132 = xmmword_18667B130;
      std::vector<unsigned long>::vector<_UIBitSetIterator<unsigned long,256ul>,0>(&__src, &v133, (uint64_t)&v131);
      a3 = std::__variant_detail::__assignment<std::__variant_detail::__traits<_UIBitSet<256ul>,_UISmallVector<unsigned short,16ul>,std::vector<unsigned long>>>::__assign_alt[abi:nn180100]<2ul,std::vector<unsigned long>,std::vector<unsigned long>>((uint64_t)v5, (uint64_t)v5, &__src);
      v33 = (void *)__src.n128_u64[0];
      if (!__src.n128_u64[0])
      {
LABEL_47:
        v7 = *(_DWORD *)(a1 + 64);
        goto LABEL_48;
      }
      __src.n128_u64[1] = __src.n128_u64[0];
    }
    else
    {
      v133 = v8;
      v134 = v23;
      v135 = 0;
      v27 = (__n128 *)std::uninitialized_copy[abi:nn180100]<_UIBitSetIterator<unsigned long,256ul>,unsigned long *>(&v133, 256, __src.n128_u64);
      v29 = (char *)v27 - (char *)&__src;
      if ((unint64_t)((char *)v27 - (char *)&__src) <= 0x87)
      {
        if (&__src == v27)
        {
          v30 = 0;
        }
        else
        {
          v30 = 0;
          p_src = &__src;
          do
          {
            v32 = p_src->n128_u16[0];
            p_src = (__n128 *)((char *)p_src + 8);
            v122 = v28;
            v123 = a3;
            *((_WORD *)&v122 + (v30 & 0xF)) = v32;
            v28 = v122;
            a3 = v123;
            ++v30;
          }
          while (p_src != v27);
        }
        v35 = *(unsigned int *)(a1 + 64);
        if ((_DWORD)v35 != -1)
        {
          if ((_DWORD)v35 == 1)
          {
            *(_OWORD *)(a1 + 16) = v28;
            *(__n128 *)(a1 + 32) = a3;
            *(_QWORD *)(a1 + 48) = v30;
            goto LABEL_47;
          }
          v100 = v28;
          v101 = a3;
          ((void (*)(__n128 *, _OWORD *))off_1E16C5078[v35])(&__p, v5);
          v28 = v100;
          a3 = v101;
        }
        *(_OWORD *)(a1 + 16) = v28;
        *(__n128 *)(a1 + 32) = a3;
        *(_QWORD *)(a1 + 48) = v30;
        *(_DWORD *)(a1 + 64) = 1;
        goto LABEL_47;
      }
      __p = 0uLL;
      v125 = 0;
      if (v27 != &__src)
      {
        std::vector<unsigned long>::__vallocate[abi:nn180100](&__p, v29 >> 3);
        v34 = __p.n128_u64[1];
        memmove((void *)__p.n128_u64[1], &__src, v29);
        __p.n128_u64[1] = v34 + 8 * (v29 >> 3);
      }
      a3 = std::__variant_detail::__assignment<std::__variant_detail::__traits<_UIBitSet<256ul>,_UISmallVector<unsigned short,16ul>,std::vector<unsigned long>>>::__assign_alt[abi:nn180100]<2ul,std::vector<unsigned long>,std::vector<unsigned long>>((uint64_t)v5, (uint64_t)v5, &__p);
      v33 = (void *)__p.n128_u64[0];
      if (!__p.n128_u64[0])
        goto LABEL_47;
      __p.n128_u64[1] = __p.n128_u64[0];
    }
    operator delete(v33);
    goto LABEL_47;
  }
LABEL_48:
  if (v7 == 1)
    v36 = v5;
  else
    v36 = 0;
  if (v7 != 1)
    goto LABEL_56;
  v37 = *(_QWORD *)(a1 + 48);
  if ((v6 | v3) >> 16)
  {
    __src = 0uLL;
    v137 = 0;
    _ZNSt3__16vectorImNS_9allocatorImEEE16__init_with_sizeB8nn180100I22_UISmallVectorIteratorIDv16_tES7_EEvT_T0_m((char *)&__src, v5, 0, (uint64_t)v5, v37, v37);
    std::__variant_detail::__assignment<std::__variant_detail::__traits<_UIBitSet<256ul>,_UISmallVector<unsigned short,16ul>,std::vector<unsigned long>>>::__assign_alt[abi:nn180100]<2ul,std::vector<unsigned long>,std::vector<unsigned long>>((uint64_t)v5, (uint64_t)v5, &__src);
    if (__src.n128_u64[0])
    {
      __src.n128_u64[1] = __src.n128_u64[0];
      operator delete((void *)__src.n128_u64[0]);
    }
    v7 = *(_DWORD *)(a1 + 64);
LABEL_56:
    if (v7 == 2)
      v38 = (uint64_t)v5;
    else
      v38 = 0;
    if (v7 != 2)
      return;
    v40 = *(char **)(a1 + 16);
    v39 = *(char **)(a1 + 24);
    if (v40 == v39)
    {
      v39 = *(char **)(a1 + 16);
    }
    else
    {
      v42 = v39 - 8;
      v41 = *((_QWORD *)v39 - 1);
      if (v41 >= v3)
      {
        if (v41 == v3)
        {
LABEL_63:
          *(_QWORD *)v42 = v6;
          return;
        }
        if ((unint64_t)(v39 - v40) < 9)
        {
          v49 = 0;
        }
        else
        {
          v49 = 0;
          v50 = (v39 - v40) >> 3;
          do
          {
            if (*(_QWORD *)&v40[8 * v49 + 8 * (v50 >> 1)] < v3)
              v49 += v50 >> 1;
            v50 -= v50 >> 1;
          }
          while (v50 > 1);
        }
        v42 = &v40[8 * v49 + 8 * (*(_QWORD *)&v40[8 * v49] < v3)];
        if (v39 >= v42 + 16)
          v55 = v42 + 16;
        else
          v55 = v39;
        if ((unint64_t)(v55 - v42) < 9)
        {
          v56 = 0;
        }
        else
        {
          v56 = 0;
          v57 = (v55 - v42) >> 3;
          do
          {
            if (*(_QWORD *)&v42[8 * v56 + 8 * (v57 >> 1)] <= v6)
              v56 += v57 >> 1;
            v57 -= v57 >> 1;
          }
          while (v57 > 1);
        }
        v58 = v55 != v42 && *(_QWORD *)&v42[8 * v56] <= v6;
        v59 = v56 + v58;
        if ((v59 & 1) != 0)
        {
          if ((((_BYTE)v42 - (_BYTE)v40) & 8) == 0)
            v6 = v3;
          __src.n128_u64[0] = v38;
          __src.n128_u64[1] = (unint64_t)v42;
          v137 = (unint64_t)&v42[8 * v59];
          v138 = (_OWORD *)v6;
          v139 = xmmword_1866794A0;
          if (v59 == 1)
            goto LABEL_63;
          if (!v59)
          {
            std::vector<unsigned long>::insert(v38, v42, (char *)&v138);
            return;
          }
          *(_QWORD *)v42 = v6;
          v42 += 8;
          v73 = &v42[8 * v59 - 8];
        }
        else
        {
          __src.n128_u64[0] = v38;
          __src.n128_u64[1] = (unint64_t)v42;
          v137 = (unint64_t)&v42[8 * v59];
          if ((((_BYTE)v42 - (_BYTE)v40) & 8) == 0)
          {
            v138 = (_OWORD *)v3;
            *(_QWORD *)&v139 = v3 + 1;
            *((_QWORD *)&v139 + 1) = 2;
            switch(v59)
            {
              case 2:
                *(_QWORD *)v42 = v3;
                *((_QWORD *)v42 + 1) = v6;
                return;
              case 1:
                *(_QWORD *)v42 = v3;
                std::vector<unsigned long>::insert(v38, v42 + 8, (char *)&v139);
                return;
              case 0:
                v5 = (_OWORD *)v38;
                v39 = v42;
                goto LABEL_69;
            }
            *(_QWORD *)v42 = v3;
            *((_QWORD *)v42 + 1) = v6;
            v97 = &v42[8 * v59];
            v98 = *(char **)(v38 + 8);
            v99 = v98 - v97;
            if (v98 != v97)
              memmove(v42 + 16, v97, v98 - v97);
            v82 = &v42[v99 + 16];
LABEL_162:
            *(_QWORD *)(v38 + 8) = v82;
            return;
          }
          v138 = 0;
          v139 = 0uLL;
          if (!v59)
            return;
          v73 = &v42[8 * v59];
        }
        v80 = *(char **)(v38 + 8);
        v81 = v80 - v73;
        if (v80 != v73)
          memmove(v42, v73, v80 - v73);
        v82 = &v42[v81];
        goto LABEL_162;
      }
    }
    __src.n128_u64[0] = (unint64_t)v5;
    __src.n128_u64[1] = (unint64_t)v39;
    v137 = (unint64_t)v39;
    v138 = (_OWORD *)v3;
    *(_QWORD *)&v139 = v3 + 1;
    *((_QWORD *)&v139 + 1) = 2;
LABEL_69:
    std::vector<unsigned long>::__insert_with_size[abi:nn180100]<unsigned long *,unsigned long *>((uint64_t)v5, v39, (char *)&v138, (_BYTE *)&v139 + 8);
    return;
  }
  if (!v37)
  {
    v43 = 0;
    v48 = 0;
    __src.n128_u64[0] = (unint64_t)v5;
    __src.n128_u64[1] = (unint64_t)v5;
    v137 = 0;
    v138 = v5;
    *(_QWORD *)&v139 = 0;
    WORD4(v139) = v3;
    v46 = 2;
    v47 = v3 + 1;
    goto LABEL_71;
  }
  v43 = v37 - 1;
  a3 = *(__n128 *)v5;
  v44 = *((uint16x8_t *)v5 + 1);
  v121[0] = *v5;
  v121[1] = v44;
  v45 = *((unsigned __int16 *)v121 + ((v37 - 1) & 0xF));
  if (v45 < (unsigned __int16)v3)
  {
    __src.n128_u64[0] = (unint64_t)v5;
    __src.n128_u64[1] = (unint64_t)v5;
    v137 = v37;
    v138 = v5;
    *(_QWORD *)&v139 = v37;
    v46 = 2;
    WORD4(v139) = v3;
    v47 = v3 + 1;
    v43 = v37;
    v48 = v37;
LABEL_71:
    WORD5(v139) = v6;
    goto LABEL_119;
  }
  if (v45 == (unsigned __int16)v3)
  {
    v47 = 0;
    __src.n128_u64[0] = (unint64_t)v5;
    __src.n128_u64[1] = (unint64_t)v5;
    v137 = v37 - 1;
    v138 = v5;
    *(_QWORD *)&v139 = v37;
    WORD4(v139) = v3 + 1;
    v46 = 1;
    LOWORD(v3) = v3 + 1;
    v48 = v37;
LABEL_118:
    WORD5(v139) = 0;
    goto LABEL_119;
  }
  v51 = (uint16x8_t)vdupq_n_s16(v3);
  v52 = __clz(__rbit64(*(_QWORD *)&vshrn_n_s16((int16x8_t)vuzp1q_s8((int8x16_t)vcgeq_u16((uint16x8_t)a3, v51), (int8x16_t)vcgeq_u16(v44, v51)), 4uLL))) >> 2;
  if (v52 >= v37)
    v43 = v37;
  else
    v43 = v52;
  v48 = v43 + 2;
  if (v37 < v43 + 2)
    v48 = v37;
  v53 = (uint16x8_t)vdupq_n_s16(v6);
  a3 = (__n128)vuzp1q_s8((int8x16_t)vcgtq_u16((uint16x8_t)a3, v53), (int8x16_t)vcgtq_u16(v44, v53));
  a3.n128_u64[0] = (unint64_t)vshrn_n_s16((int16x8_t)a3, 4uLL);
  v54 = __clz(__rbit64((-1 << (4 * v43)) & a3.n128_u64[0])) >> 2;
  if (v54 < v48)
    v48 = v54;
  if ((((_DWORD)v48 - (_DWORD)v43) & 1) != 0)
  {
    v47 = 0;
    if ((v43 & 1) != 0)
      LOWORD(v3) = v6;
    __src.n128_u64[0] = (unint64_t)v5;
    __src.n128_u64[1] = (unint64_t)v5;
    v137 = v43;
    v138 = v5;
    *(_QWORD *)&v139 = v48;
    WORD4(v139) = v3;
    v46 = 1;
    goto LABEL_118;
  }
  __src.n128_u64[0] = (unint64_t)v5;
  __src.n128_u64[1] = (unint64_t)v5;
  v137 = v43;
  v138 = v5;
  *(_QWORD *)&v139 = v48;
  if ((v43 & 1) != 0)
  {
    v47 = 0;
    v46 = 0;
    LOWORD(v3) = 0;
    DWORD2(v139) = 0;
  }
  else
  {
    WORD4(v139) = v3;
    WORD5(v139) = v3 + 1;
    v46 = 2;
    v47 = v3 + 1;
  }
LABEL_119:
  v140 = v46;
  if (v46 + v43 + v37 - v48 > 0x10)
  {
    v129 = 0uLL;
    v130 = 0;
    _ZNSt3__16vectorImNS_9allocatorImEEE16__init_with_sizeB8nn180100I22_UISmallVectorIteratorIDv16_tES7_EEvT_T0_m((char *)&v129, v5, 0, (uint64_t)v5, v37, v37);
    v67 = (_QWORD *)(v129.n128_u64[0] + 8 * v137);
    __p.n128_u64[0] = (unint64_t)&v129;
    __p.n128_u64[1] = (unint64_t)v67;
    v68 = (_BYTE *)(v129.n128_u64[0] + 8 * v139);
    v69 = (char *)&v126;
    v125 = v68;
    v126 = WORD4(v139);
    v70 = WORD5(v139);
    v127 = WORD5(v139);
    v128 = v140;
    v71 = (v68 - (_BYTE *)v67) >> 3;
    if (v140 == 2)
    {
      if (v71 == 2)
      {
        *v67 = WORD4(v139);
        v67[1] = v70;
        goto LABEL_179;
      }
      if (v71 != 1)
      {
        if (!v71)
        {
          std::vector<unsigned long>::__insert_with_size[abi:nn180100]<unsigned long *,unsigned long *>((uint64_t)&v129, (char *)(v129.n128_u64[0] + 8 * v137), (char *)&v126, &v128);
          goto LABEL_179;
        }
        *v67 = WORD4(v139);
        v67[1] = v70;
        v67 += 2;
        goto LABEL_175;
      }
      v69 = (char *)&v127;
      *v67++ = WORD4(v139);
    }
    else
    {
      if (v140 != 1)
      {
        if (v140 || (_QWORD)v139 == v137)
        {
LABEL_179:
          std::__variant_detail::__assignment<std::__variant_detail::__traits<_UIBitSet<256ul>,_UISmallVector<unsigned short,16ul>,std::vector<unsigned long>>>::__assign_alt[abi:nn180100]<2ul,std::vector<unsigned long>,std::vector<unsigned long>>((uint64_t)v5, (uint64_t)v5, &v129);
          if (v129.n128_u64[0])
          {
            v129.n128_u64[1] = v129.n128_u64[0];
            operator delete((void *)v129.n128_u64[0]);
          }
          return;
        }
LABEL_176:
        v96 = v129.n128_u64[1] - (_QWORD)v68;
        if ((_BYTE *)v129.n128_u64[1] != v68)
          memmove(v67, v68, v129.n128_u64[1] - (_QWORD)v68);
        v129.n128_u64[1] = (unint64_t)v67 + v96;
        goto LABEL_179;
      }
      if (v71)
      {
        if (v71 == 1)
        {
          *v67 = WORD4(v139);
          goto LABEL_179;
        }
        *v67++ = WORD4(v139);
LABEL_175:
        if (v67 == (_QWORD *)v68)
          goto LABEL_179;
        goto LABEL_176;
      }
    }
    std::vector<unsigned long>::insert((uint64_t)&v129, (char *)v67, v69);
    goto LABEL_179;
  }
  v60 = v48 - v43;
  if (v46 != 2)
  {
    if (v46 != 1)
    {
      if (v48 == v43)
        return;
      if (v48 < v37)
      {
        v62 = *v5;
        v61 = v5[1];
        v63 = v43;
        v64 = v48;
        do
        {
          v104[0] = v62;
          v104[1] = v61;
          v65 = *((_WORD *)v104 + (v64 & 0xF));
          v102 = v62;
          v103 = v61;
          *((_WORD *)&v102 + (v63 & 0xF)) = v65;
          v62 = v102;
          v61 = v103;
          ++v64;
          ++v63;
        }
        while (v37 != v64);
        *v36 = v102;
        v36[1] = v61;
      }
      v66 = v43 + v37 - v48;
LABEL_155:
      *(_QWORD *)(a1 + 48) = v66;
      return;
    }
    if (v60 == 1)
    {
      *((_WORD *)v5 + v43) = v3;
      return;
    }
    if (v60)
    {
      v74 = v5[1];
      v108 = *v5;
      v109 = v74;
      *((_WORD *)&v108 + (v43 & 0xF)) = v3;
      v76 = v108;
      v75 = v109;
      *v5 = v108;
      v5[1] = v75;
      if (v48 < v37)
      {
        v77 = v43 + 1;
        v78 = v48;
        do
        {
          v107[0] = v76;
          v107[1] = v75;
          v79 = *((_WORD *)v107 + (v78 & 0xF));
          v105 = v76;
          v106 = v75;
          *((_WORD *)&v105 + (v77 & 0xF)) = v79;
          v76 = v105;
          v75 = v106;
          ++v78;
          ++v77;
        }
        while (v37 != v78);
        *v5 = v105;
        v5[1] = v75;
      }
      v66 = v43 + 1 - v48 + v37;
      goto LABEL_155;
    }
    v72 = (__int16 *)&v139 + 4;
LABEL_165:
    _UISmallVector<unsigned short,16ul>::insert(v5, (uint64_t)v5, v43, v72);
    return;
  }
  if (v60 == 2)
  {
    v83 = v5[1];
    v119 = *v5;
    v120 = v83;
    *((_WORD *)&v119 + (v43 & 0xF)) = v3;
    v117 = v119;
    v118 = v120;
    *((_WORD *)&v117 + (((_BYTE)v43 + 1) & 0xF)) = v47;
    v84 = v118;
    *v5 = v117;
    v5[1] = v84;
    return;
  }
  if (v60 == 1)
  {
    *((_WORD *)v5 + v43++) = v3;
    v72 = (__int16 *)&v139 + 5;
    goto LABEL_165;
  }
  if (v60)
  {
    v85 = v5[1];
    v115 = *v5;
    v116 = v85;
    *((_WORD *)&v115 + (v43 & 0xF)) = v3;
    v113 = v115;
    v114 = v116;
    *((_WORD *)&v113 + (((_BYTE)v43 + 1) & 0xF)) = v47;
    v86 = v114;
    *v5 = v113;
    v5[1] = v86;
    v87 = __src.n128_u64[0];
    v88 = v137 + 2;
    v89 = v139;
    v90 = *(_QWORD *)(__src.n128_u64[0] + 32);
    if ((unint64_t)v139 < v90)
    {
      v92 = *(_OWORD *)__src.n128_u64[0];
      v91 = *(_OWORD *)(__src.n128_u64[0] + 16);
      v93 = v137 + 2;
      v94 = v139;
      do
      {
        v112[0] = v92;
        v112[1] = v91;
        v95 = *((_WORD *)v112 + (v94 & 0xF));
        v110 = v92;
        v111 = v91;
        *((_WORD *)&v110 + (v93 & 0xF)) = v95;
        v92 = v110;
        v91 = v111;
        ++v94;
        ++v93;
      }
      while (v90 != v94);
      *(_OWORD *)v87 = v110;
      *(_OWORD *)(v87 + 16) = v91;
    }
    *(_QWORD *)(v87 + 32) = v88 - v89 + v90;
  }
  else
  {
    _UISmallVector<unsigned short,16ul>::insert<unsigned short *>(v5, a3, (uint64_t)v5, v43, (__int16 *)&v139 + 4, (__int16 *)&v139 + 6);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_UIFastIndexSet initWithIndexSet:]([_UIMutableFastIndexSet alloc], (uint64_t)self);
}

@end
