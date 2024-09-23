@implementation _UIFastIndexSet

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 16) = 0;
  return self;
}

- (void).cxx_destruct
{
  uint64_t var1;
  char v4;

  var1 = self[1]._inOutIndexes.__impl_.__data.__tail.var1;
  if ((_DWORD)var1 != -1)
    ((void (*)(char *, variant<_UIBitSet<256>, _UISmallVector<unsigned short, 16>, std::vector<unsigned long>> *))off_1E16C5078[var1])(&v4, &self->_inOutIndexes);
  self[1]._inOutIndexes.__impl_.__data.__tail.var1 = -1;
}

- (int8x16_t)count
{
  int8x16_t *v1;
  __int32 v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int8x16_t v9;
  int8x16_t v10;
  _OWORD v11[2];
  _OWORD v12[2];

  if (result)
  {
    v1 = result;
    v2 = result[4].i32[0];
    if (v2 != 2)
    {
      if (v2 != 1)
      {
        if (!v2)
          return (int8x16_t *)vaddvq_s64((int64x2_t)vpadalq_u32(vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(result[1])))), vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(result[2])))));
        return 0;
      }
      v7 = result[3].i64[0];
      if (v7)
      {
        result = 0;
        v8 = 0;
        v10 = v1[1];
        v9 = v1[2];
        do
        {
          v12[0] = v10;
          v12[1] = v9;
          v11[0] = v10;
          v11[1] = v9;
          result = (int8x16_t *)((char *)result
                               + *((unsigned __int16 *)v11 + (((_BYTE)v8 + 1) & 0xF))
                               - *((unsigned __int16 *)v12 + (v8 & 0xF)));
          v8 += 2;
        }
        while (v8 != v7);
        return result;
      }
      return 0;
    }
    v4 = (uint64_t *)result[1].i64[0];
    v3 = (uint64_t *)result[1].i64[1];
    if (v4 == v3)
      return 0;
    result = 0;
    do
    {
      v5 = *v4;
      v6 = v4[1];
      v4 += 2;
      result = (int8x16_t *)((char *)result + v6 - v5);
    }
    while (v4 != v3);
  }
  return result;
}

- (void)enumerateIndexesUsingBlock:(uint64_t)a1
{
  _OWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _OWORD v25[2];
  _OWORD v26[2];
  char v27;

  if (a1)
  {
    v3 = (_OWORD *)(a1 + 16);
    v4 = *(_DWORD *)(a1 + 64);
    if (v4)
      v5 = 0;
    else
      v5 = a1 + 16;
    if (v4)
    {
      if (v4 == 2)
      {
        v27 = 0;
        v20 = *(uint64_t **)(a1 + 16);
        v21 = *(uint64_t **)(a1 + 24);
        while (v20 != v21)
        {
          v22 = *v20;
          v23 = v20[1];
          if (*v20 != v23)
          {
            do
            {
              ((void (**)(_QWORD, uint64_t, char *))a2)[2](a2, v22, &v27);
              if (v27)
                return;
            }
            while (v23 != ++v22);
          }
          v20 += 2;
        }
      }
      else if (v4 == 1)
      {
        v27 = 0;
        v6 = *(_QWORD *)(a1 + 48);
        if (v6)
        {
          v7 = 0;
          while (1)
          {
            v8 = v3[1];
            v26[0] = *v3;
            v26[1] = v8;
            v9 = *((unsigned __int16 *)v26 + (v7 & 0xF));
            v25[0] = v26[0];
            v25[1] = v8;
            v10 = *((unsigned __int16 *)v25 + (v7 & 0xE | 1));
            if ((_DWORD)v9 != (_DWORD)v10)
              break;
LABEL_13:
            v7 += 2;
            if (v7 == v6)
              return;
          }
          while (1)
          {
            ((void (**)(_QWORD, uint64_t, char *))a2)[2](a2, v9, &v27);
            if (v27)
              break;
            if (v10 == ++v9)
              goto LABEL_13;
          }
        }
      }
    }
    else
    {
      v24 = v5;
      v11 = a2;
      v12 = 0;
      v13 = 0;
      v27 = 0;
      while (2)
      {
        LOBYTE(v14) = 0;
        v15 = *(_QWORD *)(v24 + 8 * v13);
        do
        {
          if (((-1 << v14) & v15) == 0)
            break;
          v16 = __clz(__rbit64((-1 << v14) & v15));
          v17 = (-1 << v16) & ~v15;
          v14 = __clz(__rbit64(v17));
          v18 = v14 - v16;
          if (v14 != v16)
          {
            v19 = v12 + v16;
            do
            {
              (*((void (**)(id, uint64_t, char *))v11 + 2))(v11, v19, &v27);
              if (v27)
                goto LABEL_24;
              ++v19;
            }
            while (--v18);
          }
        }
        while (v17);
        ++v13;
        v12 += 64;
        if (v13 != 4)
          continue;
        break;
      }
LABEL_24:

    }
  }
}

+ (id)indexSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27___UIFastIndexSet_indexSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_1027 != -1)
    dispatch_once(&_MergedGlobals_1027, block);
  return (id)qword_1ECD7D8B0;
}

+ (char)indexSetWithIndexesInRange:(uint64_t)a3
{
  char *v5;

  v5 = (char *)objc_alloc((Class)objc_opt_self());
  return -[_UIFastIndexSet initWithIndexesInRange:](v5, a2, a3);
}

- (char)initWithIndexesInRange:(uint64_t)a3
{
  char *v4;
  char *v6;
  __int128 v7;
  __int128 v8;
  char *v9;
  BOOL v10;
  unint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  char v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unsigned __int16 v28;
  uint64_t v29;
  _QWORD *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __n128 __p;
  _QWORD *v36;
  objc_super v37;
  char v38;

  if (a1 && a2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v37.receiver = a1;
    v37.super_class = (Class)_UIFastIndexSet;
    v6 = (char *)objc_msgSendSuper2(&v37, sel_init);
    v9 = v6;
    if (v6)
      v10 = a3 == 0;
    else
      v10 = 1;
    if (v10)
      goto LABEL_9;
    v12 = a2 + a3;
    if (a2 <= 0xFF && v12 <= 0xFF)
    {
      if (*((_DWORD *)v6 + 16))
        v13 = 0;
      else
        v13 = v6 + 16;
      if (a2 < v12)
      {
        v14 = a2 >> 6;
        if (a2 >> 6 <= v12 >> 6)
        {
          v15 = (v12 >> 6) - v14 + 1;
          v16 = &v13[8 * v14];
          v17 = v14 << 6;
          v18 = (v14 << 6) + 64;
          v19 = v18 + a2;
          v20 = -64 * v14;
          do
          {
            v21 = a2 - v17;
            if (a2 >= v17)
              v22 = v17;
            else
              v22 = a2;
            if (a2 < v17)
              v21 = 0;
            v23 = v19 - v22;
            if (v18 >= v12)
              v24 = v12;
            else
              v24 = v18;
            v25 = 0xFFFFFFFFFFFFFFFFLL >> (v23 - v24) << v21;
            if (v21 >= v24 + v20)
              v26 = 0;
            else
              v26 = v25;
            *(_QWORD *)v16 |= v26;
            v16 += 8;
            v19 += 64;
            v17 += 64;
            v18 += 64;
            v20 -= 64;
            --v15;
          }
          while (v15);
        }
      }
      goto LABEL_9;
    }
    if (a2 >> 16 || (v27 = v12 >> 16) != 0)
    {
      v30 = operator new(0x10uLL);
      __p.n128_u64[1] = (unint64_t)(v30 + 2);
      v36 = v30 + 2;
      *v30 = a2;
      v30[1] = v12;
      __p.n128_u64[0] = (unint64_t)v30;
      std::__variant_detail::__assignment<std::__variant_detail::__traits<_UIBitSet<256ul>,_UISmallVector<unsigned short,16ul>,std::vector<unsigned long>>>::__assign_alt[abi:nn180100]<2ul,std::vector<unsigned long>,std::vector<unsigned long>>((uint64_t)(v9 + 16), (uint64_t)(v9 + 16), &__p);
      if (__p.n128_u64[0])
        operator delete((void *)__p.n128_u64[0]);
      goto LABEL_9;
    }
    __p.n128_u16[0] = a2;
    __p.n128_u16[1] = v12;
    do
    {
      v28 = __p.n128_u16[v27];
      v33 = v8;
      v34 = v7;
      *((_WORD *)&v33 + (v27 & 0xF)) = v28;
      v8 = v33;
      v7 = v34;
      ++v27;
    }
    while (v27 != 2);
    v29 = *((unsigned int *)v6 + 16);
    if ((_DWORD)v29 != -1)
    {
      if ((_DWORD)v29 == 1)
      {
        *((_OWORD *)v6 + 1) = v33;
        *((_OWORD *)v6 + 2) = v7;
        *((_QWORD *)v6 + 6) = 2;
LABEL_9:
        a1 = v9;
        v4 = a1;
        goto LABEL_10;
      }
      v31 = v33;
      v32 = v34;
      ((void (*)(char *, char *))off_1E16C5078[v29])(&v38, v6 + 16);
      v8 = v31;
      v7 = v32;
    }
    *((_OWORD *)v9 + 1) = v8;
    *((_OWORD *)v9 + 2) = v7;
    *((_QWORD *)v9 + 6) = 2;
    *((_DWORD *)v9 + 16) = 1;
    goto LABEL_9;
  }
  v4 = 0;
LABEL_10:

  return v4;
}

- (unsigned)initWithIndex:(unsigned int *)a1
{
  unint64_t v2;
  unsigned int *v3;
  char *v4;
  __n128 v5;
  unsigned int *v6;
  _OWORD *v7;
  unint64_t v8;
  unsigned int v9;
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
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint16x8_t v46;
  unsigned int v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint16x8_t v52;
  unint64_t v53;
  uint16x8_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  _BOOL8 v59;
  uint64_t v60;
  _BYTE *v61;
  unint64_t v62;
  unint64_t v63;
  __int128 v64;
  __int128 v65;
  __int16 v66;
  unint64_t v67;
  _QWORD *v68;
  _BYTE *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  __int16 *v73;
  _BYTE *v74;
  int64_t v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  __int16 v84;
  char *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  uint64_t v101;
  __int16 v102;
  unint64_t v103;
  _BYTE *v105;
  _BYTE *v106;
  int64_t v107;
  __int128 v108;
  __n128 v109;
  __int128 v110;
  __int128 v111;
  _OWORD v112[2];
  __int128 v113;
  __int128 v114;
  _OWORD v115[2];
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _OWORD v120[2];
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _OWORD v129[2];
  __int128 v130;
  __n128 v131;
  objc_super v132;
  __n128 __p;
  _BYTE *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  __n128 v138;
  uint64_t v139;
  uint64_t v140;
  __int128 v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  __n128 __src;
  uint64_t v146;
  _OWORD *v147;
  __int128 v148;
  uint64_t v149;
  uint64_t v150;

  v150 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = a2;
    if (a2 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v132.receiver = a1;
      v132.super_class = (Class)_UIFastIndexSet;
      v4 = (char *)objc_msgSendSuper2(&v132, sel_init);
      v6 = (unsigned int *)v4;
      if (!v4)
      {
LABEL_185:
        a1 = v6;
        v3 = a1;
        goto LABEL_186;
      }
      v7 = v4 + 16;
      v8 = v2 + 1;
      v9 = *((_DWORD *)v4 + 16);
      if (v9)
        v10 = 0;
      else
        v10 = (uint64_t)(v4 + 16);
      if (v9)
      {
LABEL_50:
        if (v9 == 1)
          v38 = v7;
        else
          v38 = 0;
        if (v9 != 1)
          goto LABEL_58;
        v39 = *((_QWORD *)v6 + 6);
        if ((v8 | v2) >> 16)
        {
          __src = 0uLL;
          v146 = 0;
          _ZNSt3__16vectorImNS_9allocatorImEEE16__init_with_sizeB8nn180100I22_UISmallVectorIteratorIDv16_tES7_EEvT_T0_m((char *)&__src, v7, 0, (uint64_t)v7, v39, v39);
          std::__variant_detail::__assignment<std::__variant_detail::__traits<_UIBitSet<256ul>,_UISmallVector<unsigned short,16ul>,std::vector<unsigned long>>>::__assign_alt[abi:nn180100]<2ul,std::vector<unsigned long>,std::vector<unsigned long>>((uint64_t)v7, (uint64_t)v7, &__src);
          if (__src.n128_u64[0])
          {
            __src.n128_u64[1] = __src.n128_u64[0];
            operator delete((void *)__src.n128_u64[0]);
          }
          v9 = v6[16];
LABEL_58:
          if (v9 == 2)
            v40 = (uint64_t)v7;
          else
            v40 = 0;
          if (v9 != 2)
            goto LABEL_185;
          v42 = *((_QWORD *)v6 + 2);
          v41 = (char *)*((_QWORD *)v6 + 3);
          if ((char *)v42 == v41)
          {
            v41 = (char *)*((_QWORD *)v6 + 2);
            goto LABEL_69;
          }
          v44 = (uint64_t)(v41 - 8);
          v43 = *((_QWORD *)v41 - 1);
          if (v43 < v2)
          {
            v42 = *((_QWORD *)v6 + 3);
LABEL_69:
            __src.n128_u64[0] = (unint64_t)v7;
            __src.n128_u64[1] = v42;
            v146 = v42;
            v147 = (_OWORD *)v2;
            *(_QWORD *)&v148 = v2 + 1;
            *((_QWORD *)&v148 + 1) = 2;
LABEL_70:
            std::vector<unsigned long>::__insert_with_size[abi:nn180100]<unsigned long *,unsigned long *>((uint64_t)v7, v41, (char *)&v147, (_BYTE *)&v148 + 8);
            goto LABEL_185;
          }
          if (v43 == v2)
          {
            __src.n128_u64[0] = (unint64_t)v7;
            __src.n128_u64[1] = (unint64_t)(v41 - 8);
            v146 = (uint64_t)v41;
            v147 = (_OWORD *)(v2 + 1);
            v148 = xmmword_1866794A0;
LABEL_73:
            *(_QWORD *)v44 = v8;
            goto LABEL_185;
          }
          if ((unint64_t)&v41[-v42] < 9)
          {
            v50 = 0;
          }
          else
          {
            v50 = 0;
            v51 = (uint64_t)&v41[-v42] >> 3;
            do
            {
              if (*(_QWORD *)(v42 + 8 * (v50 + (v51 >> 1))) < v2)
                v50 += v51 >> 1;
              v51 -= v51 >> 1;
            }
            while (v51 > 1);
          }
          v44 = v42 + 8 * v50 + 8 * (*(_QWORD *)(v42 + 8 * v50) < v2);
          if ((unint64_t)v41 >= v44 + 16)
            v56 = v44 + 16;
          else
            v56 = *((_QWORD *)v6 + 3);
          if ((unint64_t)(v56 - v44) < 9)
          {
            v57 = 0;
          }
          else
          {
            v57 = 0;
            v58 = (v56 - v44) >> 3;
            do
            {
              if (*(_QWORD *)(v44 + 8 * (v57 + (v58 >> 1))) <= v8)
                v57 += v58 >> 1;
              v58 -= v58 >> 1;
            }
            while (v58 > 1);
          }
          v59 = v56 != v44 && *(_QWORD *)(v44 + 8 * v57) <= v8;
          v60 = v57 + v59;
          if ((v60 & 1) != 0)
          {
            if ((((_BYTE)v44 - (_BYTE)v42) & 8) == 0)
              v8 = v2;
            __src.n128_u64[0] = v40;
            __src.n128_u64[1] = v44;
            v146 = v44 + 8 * v60;
            v147 = (_OWORD *)v8;
            v148 = xmmword_1866794A0;
            if (!v60)
            {
              v85 = (char *)&v147;
              goto LABEL_189;
            }
            if (v60 == 1)
              goto LABEL_73;
            *(_QWORD *)v44 = v8;
            v44 += 8;
            v61 = (_BYTE *)(v44 + 8 * v60 - 8);
          }
          else
          {
            __src.n128_u64[0] = v40;
            __src.n128_u64[1] = v44;
            v146 = v44 + 8 * v60;
            if ((((_BYTE)v44 - (_BYTE)v42) & 8) == 0)
            {
              v147 = (_OWORD *)v2;
              *(_QWORD *)&v148 = v2 + 1;
              *((_QWORD *)&v148 + 1) = 2;
              if (v60 == 2)
              {
                *(_QWORD *)v44 = v2;
                *(_QWORD *)(v44 + 8) = v8;
                goto LABEL_185;
              }
              if (v60 != 1)
              {
                if (!v60)
                {
                  v7 = (_OWORD *)v40;
                  v41 = (char *)v44;
                  goto LABEL_70;
                }
                *(_QWORD *)v44 = v2;
                *(_QWORD *)(v44 + 8) = v8;
                v105 = (_BYTE *)(v44 + 8 * v60);
                v106 = *(_BYTE **)(v40 + 8);
                v107 = v106 - v105;
                if (v106 != v105)
                  memmove((void *)(v44 + 16), v105, v106 - v105);
                v76 = v44 + 16 + v107;
LABEL_156:
                *(_QWORD *)(v40 + 8) = v76;
                goto LABEL_185;
              }
              v85 = (char *)&v148;
              *(_QWORD *)v44 = v2;
              v44 += 8;
LABEL_189:
              std::vector<unsigned long>::insert(v40, (char *)v44, v85);
              goto LABEL_185;
            }
            v147 = 0;
            v148 = 0uLL;
            if (!v60)
              goto LABEL_185;
            v61 = (_BYTE *)(v44 + 8 * v60);
          }
          v74 = *(_BYTE **)(v40 + 8);
          v75 = v74 - v61;
          if (v74 != v61)
            memmove((void *)v44, v61, v74 - v61);
          v76 = v44 + v75;
          goto LABEL_156;
        }
        if (!v39)
        {
          v45 = 0;
          v49 = 0;
          __src.n128_u64[0] = (unint64_t)v7;
          __src.n128_u64[1] = (unint64_t)v7;
          v146 = 0;
          v147 = v7;
          *(_QWORD *)&v148 = 0;
          WORD4(v148) = v2;
          v48 = 2;
          goto LABEL_75;
        }
        v45 = v39 - 1;
        v5 = *(__n128 *)v7;
        v46 = *((uint16x8_t *)v7 + 1);
        v129[0] = *v7;
        v129[1] = v46;
        v47 = *((unsigned __int16 *)v129 + ((v39 - 1) & 0xF));
        if (v47 < (unsigned __int16)v2)
        {
          __src.n128_u64[0] = (unint64_t)v7;
          __src.n128_u64[1] = (unint64_t)v7;
          v146 = v39;
          v147 = v7;
          *(_QWORD *)&v148 = v39;
          WORD4(v148) = v2;
          v48 = 2;
          v45 = v39;
          v49 = v39;
LABEL_75:
          WORD5(v148) = v2 + 1;
          goto LABEL_123;
        }
        if (v47 == (unsigned __int16)v2)
        {
          __src.n128_u64[0] = (unint64_t)v7;
          __src.n128_u64[1] = (unint64_t)v7;
          v146 = v39 - 1;
          v147 = v7;
          *(_QWORD *)&v148 = v39;
          WORD4(v148) = v2 + 1;
          v48 = 1;
          LOWORD(v2) = v2 + 1;
          v49 = v39;
        }
        else
        {
          v52 = (uint16x8_t)vdupq_n_s16(v2);
          v53 = __clz(__rbit64(*(_QWORD *)&vshrn_n_s16((int16x8_t)vuzp1q_s8((int8x16_t)vcgeq_u16((uint16x8_t)v5, v52), (int8x16_t)vcgeq_u16(v46, v52)), 4uLL))) >> 2;
          if (v53 >= v39)
            v45 = v39;
          else
            v45 = v53;
          v49 = v45 + 2;
          if (v39 < v45 + 2)
            v49 = v39;
          v54 = (uint16x8_t)vdupq_n_s16(v8);
          v5 = (__n128)vuzp1q_s8((int8x16_t)vcgtq_u16((uint16x8_t)v5, v54), (int8x16_t)vcgtq_u16(v46, v54));
          v5.n128_u64[0] = (unint64_t)vshrn_n_s16((int16x8_t)v5, 4uLL);
          v55 = __clz(__rbit64((-1 << (4 * v45)) & v5.n128_u64[0])) >> 2;
          if (v55 < v49)
            v49 = v55;
          if ((((_DWORD)v49 - (_DWORD)v45) & 1) == 0)
          {
            __src.n128_u64[0] = (unint64_t)v7;
            __src.n128_u64[1] = (unint64_t)v7;
            v146 = v45;
            v147 = v7;
            *(_QWORD *)&v148 = v49;
            if ((v45 & 1) != 0)
            {
              v48 = 0;
              LOWORD(v2) = 0;
              DWORD2(v148) = 0;
            }
            else
            {
              WORD4(v148) = v2;
              WORD5(v148) = v2 + 1;
              v48 = 2;
            }
LABEL_123:
            v149 = v48;
            v62 = v45 - v49;
            if (v45 - v49 + v48 + v39 <= 0x10)
            {
              v63 = v49 - v45;
              if (v48 == 2)
              {
                if (v63 == 2)
                {
                  v86 = v7[1];
                  v127 = *v7;
                  v128 = v86;
                  *((_WORD *)&v127 + (v45 & 0xF)) = v2;
                  v88 = v127;
                  v87 = v128;
                  *v7 = v127;
                  v7[1] = v87;
                  v125 = v88;
                  v126 = v87;
                  *((_WORD *)&v125 + (((_BYTE)v146 + 1) & 0xF)) = WORD5(v148);
                  v89 = v126;
                  *v7 = v125;
                  v7[1] = v89;
                  goto LABEL_185;
                }
                if (v63 != 1)
                {
                  if (v63)
                  {
                    v90 = v7[1];
                    v123 = *v7;
                    v124 = v90;
                    *((_WORD *)&v123 + (v45 & 0xF)) = v2;
                    v92 = v123;
                    v91 = v124;
                    *v7 = v123;
                    v7[1] = v91;
                    v121 = v92;
                    v122 = v91;
                    *((_WORD *)&v121 + (((_BYTE)v146 + 1) & 0xF)) = WORD5(v148);
                    v93 = v122;
                    *v7 = v121;
                    v7[1] = v93;
                    v94 = __src.n128_u64[0];
                    v95 = v146 + 2;
                    v96 = v148;
                    v97 = *(_QWORD *)(__src.n128_u64[0] + 32);
                    if ((unint64_t)v148 < v97)
                    {
                      v99 = *(_OWORD *)__src.n128_u64[0];
                      v98 = *(_OWORD *)(__src.n128_u64[0] + 16);
                      v100 = v146 + 2;
                      v101 = v148;
                      do
                      {
                        v120[0] = v99;
                        v120[1] = v98;
                        v102 = *((_WORD *)v120 + (v101 & 0xF));
                        v118 = v99;
                        v119 = v98;
                        *((_WORD *)&v118 + (v100 & 0xF)) = v102;
                        v99 = v118;
                        v98 = v119;
                        ++v101;
                        ++v100;
                      }
                      while (v97 != v101);
                      *(_OWORD *)v94 = v118;
                      *(_OWORD *)(v94 + 16) = v98;
                    }
                    *(_QWORD *)(v94 + 32) = v95 - v96 + v97;
                  }
                  else
                  {
                    _UISmallVector<unsigned short,16ul>::insert<unsigned short *>(v7, v5, (uint64_t)v7, v45, (__int16 *)&v148 + 4, (__int16 *)&v148 + 6);
                  }
                  goto LABEL_185;
                }
                *((_WORD *)v7 + v45) = v2;
                v45 = v146 + 1;
                v73 = (__int16 *)&v148 + 5;
              }
              else
              {
                if (v48 != 1)
                {
                  if (v49 == v45)
                    goto LABEL_185;
                  if (v49 < v39)
                  {
                    v65 = *v7;
                    v64 = v7[1];
                    do
                    {
                      v112[0] = v65;
                      v112[1] = v64;
                      v66 = *((_WORD *)v112 + (v49 & 0xF));
                      v110 = v65;
                      v111 = v64;
                      *((_WORD *)&v110 + (v45 & 0xF)) = v66;
                      v65 = v110;
                      v64 = v111;
                      ++v49;
                      ++v45;
                    }
                    while (v39 != v49);
                    *v38 = v110;
                    v38[1] = v64;
                  }
                  v67 = v62 + v39;
LABEL_163:
                  *((_QWORD *)v6 + 6) = v67;
                  goto LABEL_185;
                }
                if (v63 == 1)
                {
                  *((_WORD *)v7 + v45) = v2;
                  goto LABEL_185;
                }
                if (v63)
                {
                  v77 = v7[1];
                  v116 = *v7;
                  v117 = v77;
                  *((_WORD *)&v116 + (v45 & 0xF)) = v2;
                  v79 = v116;
                  v78 = v117;
                  *v7 = v116;
                  v7[1] = v78;
                  v80 = v148;
                  v81 = v146 + 1;
                  if ((unint64_t)v148 < v39)
                  {
                    v82 = v146 + 1;
                    v83 = v148;
                    do
                    {
                      v115[0] = v79;
                      v115[1] = v78;
                      v84 = *((_WORD *)v115 + (v83 & 0xF));
                      v113 = v79;
                      v114 = v78;
                      *((_WORD *)&v113 + (v82 & 0xF)) = v84;
                      v79 = v113;
                      v78 = v114;
                      ++v83;
                      ++v82;
                    }
                    while (v39 != v83);
                    *v7 = v113;
                    v7[1] = v78;
                  }
                  v67 = v81 - v80 + v39;
                  goto LABEL_163;
                }
                v73 = (__int16 *)&v148 + 4;
              }
              _UISmallVector<unsigned short,16ul>::insert(v7, (uint64_t)v7, v45, v73);
              goto LABEL_185;
            }
            v138 = 0uLL;
            v139 = 0;
            _ZNSt3__16vectorImNS_9allocatorImEEE16__init_with_sizeB8nn180100I22_UISmallVectorIteratorIDv16_tES7_EEvT_T0_m((char *)&v138, v7, 0, (uint64_t)v7, v39, v39);
            v68 = (_QWORD *)(v138.n128_u64[0] + 8 * v146);
            __p.n128_u64[0] = (unint64_t)&v138;
            __p.n128_u64[1] = (unint64_t)v68;
            v69 = (_BYTE *)(v138.n128_u64[0] + 8 * v148);
            v70 = (char *)&v135;
            v134 = v69;
            v135 = WORD4(v148);
            v71 = WORD5(v148);
            v136 = WORD5(v148);
            v137 = v149;
            v72 = (v69 - (_BYTE *)v68) >> 3;
            if (v149 == 2)
            {
              if (v72 == 2)
              {
                *v68 = WORD4(v148);
                v68[1] = v71;
                goto LABEL_183;
              }
              if (v72 != 1)
              {
                if (!v72)
                {
                  std::vector<unsigned long>::__insert_with_size[abi:nn180100]<unsigned long *,unsigned long *>((uint64_t)&v138, (char *)(v138.n128_u64[0] + 8 * v146), (char *)&v135, &v137);
                  goto LABEL_183;
                }
                *v68 = WORD4(v148);
                v68[1] = v71;
                v68 += 2;
                goto LABEL_179;
              }
              v70 = (char *)&v136;
              *v68++ = WORD4(v148);
            }
            else
            {
              if (v149 != 1)
              {
                if (v149 || (_QWORD)v148 == v146)
                {
LABEL_183:
                  std::__variant_detail::__assignment<std::__variant_detail::__traits<_UIBitSet<256ul>,_UISmallVector<unsigned short,16ul>,std::vector<unsigned long>>>::__assign_alt[abi:nn180100]<2ul,std::vector<unsigned long>,std::vector<unsigned long>>((uint64_t)v7, (uint64_t)v7, &v138);
                  if (v138.n128_u64[0])
                  {
                    v138.n128_u64[1] = v138.n128_u64[0];
                    operator delete((void *)v138.n128_u64[0]);
                  }
                  goto LABEL_185;
                }
LABEL_180:
                v103 = v138.n128_u64[1] - (_QWORD)v69;
                if ((_BYTE *)v138.n128_u64[1] != v69)
                  memmove(v68, v69, v138.n128_u64[1] - (_QWORD)v69);
                v138.n128_u64[1] = (unint64_t)v68 + v103;
                goto LABEL_183;
              }
              if (v72)
              {
                if (v72 == 1)
                {
                  *v68 = WORD4(v148);
                  goto LABEL_183;
                }
                *v68++ = WORD4(v148);
LABEL_179:
                if (v68 == (_QWORD *)v69)
                  goto LABEL_183;
                goto LABEL_180;
              }
            }
            std::vector<unsigned long>::insert((uint64_t)&v138, (char *)v68, v70);
            goto LABEL_183;
          }
          if ((v45 & 1) != 0)
            LOWORD(v2) = v2 + 1;
          __src.n128_u64[0] = (unint64_t)v7;
          __src.n128_u64[1] = (unint64_t)v7;
          v146 = v45;
          v147 = v7;
          *(_QWORD *)&v148 = v49;
          WORD4(v148) = v2;
          v48 = 1;
        }
        WORD5(v148) = 0;
        goto LABEL_123;
      }
      if ((v8 | v2) < 0x100)
      {
        v11 = v2 >> 6;
        if (v2 >> 6 <= v8 >> 6)
        {
          v12 = (v8 >> 6) - v11 + 1;
          v13 = (_QWORD *)(v10 + 8 * v11);
          v14 = v11 << 6;
          v15 = (v11 << 6) + 64;
          v16 = v15 + v2;
          v17 = -64 * v11;
          do
          {
            v18 = v2 - v14;
            if (v2 >= v14)
              v19 = v14;
            else
              v19 = v2;
            if (v2 < v14)
              v18 = 0;
            v20 = v16 - v19;
            if (v15 >= v8)
              v21 = v2 + 1;
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
        goto LABEL_185;
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
      if ((v8 | v2) >> 16)
      {
        v142 = v10;
        v143 = v25;
        v144 = 0;
        v140 = v10;
        v141 = xmmword_18667B130;
        std::vector<unsigned long>::vector<_UIBitSetIterator<unsigned long,256ul>,0>(&__src, &v142, (uint64_t)&v140);
        v5 = std::__variant_detail::__assignment<std::__variant_detail::__traits<_UIBitSet<256ul>,_UISmallVector<unsigned short,16ul>,std::vector<unsigned long>>>::__assign_alt[abi:nn180100]<2ul,std::vector<unsigned long>,std::vector<unsigned long>>((uint64_t)v7, (uint64_t)v7, &__src);
        v35 = (void *)__src.n128_u64[0];
        if (!__src.n128_u64[0])
        {
LABEL_49:
          v9 = v6[16];
          goto LABEL_50;
        }
        __src.n128_u64[1] = __src.n128_u64[0];
      }
      else
      {
        v142 = v10;
        v143 = v25;
        v144 = 0;
        v29 = (__n128 *)std::uninitialized_copy[abi:nn180100]<_UIBitSetIterator<unsigned long,256ul>,unsigned long *>(&v142, 256, __src.n128_u64);
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
              v130 = v30;
              v131 = v5;
              *((_WORD *)&v130 + (v32 & 0xF)) = v34;
              v30 = v130;
              v5 = v131;
              ++v32;
            }
            while (p_src != v29);
          }
          v37 = v6[16];
          if ((_DWORD)v37 != -1)
          {
            if ((_DWORD)v37 == 1)
            {
              *((_OWORD *)v6 + 1) = v30;
              *((__n128 *)v6 + 2) = v5;
              *((_QWORD *)v6 + 6) = v32;
              goto LABEL_49;
            }
            v108 = v30;
            v109 = v5;
            ((void (*)(__n128 *, _OWORD *))off_1E16C5078[v37])(&__p, v7);
            v30 = v108;
            v5 = v109;
          }
          *((_OWORD *)v6 + 1) = v30;
          *((__n128 *)v6 + 2) = v5;
          *((_QWORD *)v6 + 6) = v32;
          v6[16] = 1;
          goto LABEL_49;
        }
        __p = 0uLL;
        v134 = 0;
        if (v29 != &__src)
        {
          std::vector<unsigned long>::__vallocate[abi:nn180100](&__p, v31 >> 3);
          v36 = __p.n128_u64[1];
          memmove((void *)__p.n128_u64[1], &__src, v31);
          __p.n128_u64[1] = v36 + 8 * (v31 >> 3);
        }
        v5 = std::__variant_detail::__assignment<std::__variant_detail::__traits<_UIBitSet<256ul>,_UISmallVector<unsigned short,16ul>,std::vector<unsigned long>>>::__assign_alt[abi:nn180100]<2ul,std::vector<unsigned long>,std::vector<unsigned long>>((uint64_t)v7, (uint64_t)v7, &__p);
        v35 = (void *)__p.n128_u64[0];
        if (!__p.n128_u64[0])
          goto LABEL_49;
        __p.n128_u64[1] = __p.n128_u64[0];
      }
      operator delete(v35);
      goto LABEL_49;
    }
  }
  v3 = 0;
LABEL_186:

  return v3;
}

- (unsigned)initWithIndexSet:(void *)a1
{
  unsigned int *v3;
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;
  char *v9;

  if (!a1)
    return 0;
  v8.receiver = a1;
  v8.super_class = (Class)_UIFastIndexSet;
  v3 = (unsigned int *)objc_msgSendSuper2(&v8, sel_init);
  v4 = v3;
  if (a2 && v3)
  {
    v5 = v3[16];
    v6 = *(unsigned int *)(a2 + 64);
    if ((_DWORD)v5 == -1)
    {
      if ((_DWORD)v6 == -1)
        return v4;
    }
    else if ((_DWORD)v6 == -1)
    {
      ((void (*)(char **, unsigned int *))off_1E16C5078[v5])(&v9, v3 + 4);
      v4[16] = -1;
      return v4;
    }
    v9 = (char *)(v3 + 4);
    ((void (*)(char **))off_1E16C5090[v6])(&v9);
  }
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[_UIFastIndexSet initWithIndexSet:]([_UIMutableFastIndexSet alloc], (uint64_t)self);
}

- (unint64_t)containsIndex:(uint16x8_t *)a1
{
  uint64_t v2;
  __int32 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint16x8_t v9;
  unint64_t v10;
  unint64_t *v11;
  _BOOL4 v12;

  v2 = 0;
  if (a1 && a2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = a1[4].i32[0];
    if (v3 != 2)
    {
      if (v3 == 1)
      {
        v8 = a1[3].u64[0];
        v9 = (uint16x8_t)vdupq_n_s16(a2);
        v10 = __clz(__rbit64(*(_QWORD *)&vshrn_n_s16((int16x8_t)vuzp1q_s8((int8x16_t)vcgtq_u16(a1[1], v9), (int8x16_t)vcgtq_u16(a1[2], v9)), 4uLL))) >> 2;
        if (v10 < v8)
          LOBYTE(v8) = v10;
      }
      else
      {
        if (v3 || a2 > 0xFF)
          return 0;
        v8 = *(unint64_t *)((char *)a1[1].i64 + ((a2 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> a2;
      }
      return v8 & 1;
    }
    v4 = a1[1].i64[0];
    v5 = a1[1].i64[1];
    if ((unint64_t)(v5 - v4) < 9)
    {
      v6 = 0;
    }
    else
    {
      v6 = 0;
      v7 = (v5 - v4) >> 3;
      do
      {
        if (*(_QWORD *)(v4 + 8 * (v6 + (v7 >> 1))) <= a2)
          v6 += v7 >> 1;
        v7 -= v7 >> 1;
      }
      while (v7 > 1);
    }
    v11 = (unint64_t *)(v4 + 8 * v6);
    v12 = v5 != v4 && *v11 <= a2;
    return ((unint64_t)((_DWORD)v11 + 8 * v12 - v4) >> 3) & 1;
  }
  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  variant<_UIBitSet<256>, _UISmallVector<unsigned short, 16>, std::vector<unsigned long>> *p_inOutIndexes;
  __union<std::__variant_detail::_Trait::_Available, 1UL, _UISmallVector<unsigned short, 16>, std::vector<unsigned long>> tail;
  variant<_UIBitSet<256>, _UISmallVector<unsigned short, 16>, std::vector<unsigned long>> *v7;
  Class isa;
  char v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t *v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  char v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 128);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v41.receiver = self;
  v41.super_class = (Class)_UIFastIndexSet;
  -[_UIFastIndexSet description](&v41, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  p_inOutIndexes = &self->_inOutIndexes;
  tail = self[1]._inOutIndexes.__impl_.__data.__tail;
  if (tail.var1)
    v7 = 0;
  else
    v7 = &self->_inOutIndexes;
  switch(tail.var1)
  {
    case 0:
      objc_msgSend(v3, "appendString:", CFSTR("{"));
      v15 = 0;
      v16 = (unint64_t *)v7;
      while (1)
      {
        v17 = *v16++;
        v18 = __clz(__rbit64(v17));
        if (v18 < 0x40)
          break;
        v15 -= 64;
        if (v15 == -256)
          goto LABEL_30;
      }
      if ((v18 | 0xFFFFFFFFFFFFFF00) == v15)
        goto LABEL_30;
      v25 = 0;
      v26 = v18 - v15;
      while (1)
      {
        v27 = v26 >> 6;
        if (v26 >> 6 == 4)
        {
LABEL_37:
          v32 = 256;
        }
        else
        {
          v28 = v26 & 0x3F;
          v29 = v27 << 6;
          v30 = -64 * v27;
          while (1)
          {
            v31 = __clz(__rbit64((-1 << v28) & ~v7->__impl_.__data.__head.__value._chunks[v27]));
            if (v31 < 0x40)
              break;
            v28 = 0;
            ++v27;
            v30 -= 64;
            v29 += 64;
            if (v27 == 4)
              goto LABEL_37;
          }
          v32 = v31 - v30;
          v34 = (v31 - v30) >> 6;
          if (v34 != 4)
          {
            v35 = -(uint64_t)((v31 + v29) & 0xFFFFFFFFFFFFFFC0);
            while (1)
            {
              v36 = __clz(__rbit64(v7->__impl_.__data.__head.__value._chunks[v34] & (-1 << v31)));
              if (v36 < 0x40)
                break;
              LOBYTE(v31) = 0;
              ++v34;
              v35 -= 64;
              if (v34 == 4)
                goto LABEL_38;
            }
            v33 = v36 - v35;
            if ((v25 & 1) == 0)
              goto LABEL_40;
LABEL_39:
            objc_msgSend(v3, "appendString:", CFSTR(","));
            goto LABEL_40;
          }
        }
LABEL_38:
        v33 = 256;
        if ((v25 & 1) != 0)
          goto LABEL_39;
LABEL_40:
        if (v26 + 1 == v32)
          objc_msgSend(v3, "appendFormat:", CFSTR("%lu"), v26);
        else
          objc_msgSend(v3, "appendFormat:", CFSTR("%lu-%lu"), v26, v32 - 1);
        v25 = 1;
        v26 = v33;
        if (v33 == 256)
          goto LABEL_30;
      }
    case 2:
      objc_msgSend(v3, "appendString:", CFSTR("{"));
      v19 = (uint64_t *)self->_inOutIndexes.__impl_.__data.__head.__value._chunks[0];
      v20 = self->_inOutIndexes.__impl_.__data.__head.__value._chunks[1];
      if (v19 != (uint64_t *)v20)
      {
        v21 = 0;
        do
        {
          v22 = *v19;
          v23 = v19[1];
          if ((v21 & 1) != 0)
            objc_msgSend(v3, "appendString:", CFSTR(","));
          if (v22 + 1 == v23)
            objc_msgSend(v3, "appendFormat:", CFSTR("%lu"), v22);
          else
            objc_msgSend(v3, "appendFormat:", CFSTR("%lu-%lu"), v22, v23 - 1);
          v19 += 2;
          v21 = 1;
        }
        while (v19 != (uint64_t *)v20);
      }
      goto LABEL_30;
    case 1:
      objc_msgSend(v3, "appendString:", CFSTR("{"));
      isa = self[1].super.isa;
      if (isa)
      {
        v9 = 0;
        v10 = 0;
        do
        {
          v11 = *((_OWORD *)&p_inOutIndexes->__impl_.__data.__tail + 1);
          v39 = *(_OWORD *)&p_inOutIndexes->__impl_.__data.__dummy;
          v40 = v11;
          v12 = *((unsigned __int16 *)&v39 + (v10 & 0xF));
          v13 = v10 + 1;
          v37 = v39;
          v38 = v11;
          v14 = *((unsigned __int16 *)&v37 + ((v10 + 1) & 0xF));
          if ((v9 & 1) != 0)
            objc_msgSend(v3, "appendString:", CFSTR(","));
          if ((_DWORD)v12 + 1 == (_DWORD)v14)
            objc_msgSend(v3, "appendFormat:", CFSTR("%lu"), v12);
          else
            objc_msgSend(v3, "appendFormat:", CFSTR("%lu-%lu"), v12, v14 - 1, v37, v38, v39, v40);
          v10 = v13 + 1;
          v9 = 1;
        }
        while ((Class)(v13 + 1) != isa);
      }
LABEL_30:
      objc_msgSend(v3, "appendString:", CFSTR("}"));
      break;
  }
  return v3;
}

- (unint64_t)hash
{
  __union<std::__variant_detail::_Trait::_Available, 1UL, _UISmallVector<unsigned short, 16>, std::vector<unsigned long>> tail;
  variant<_UIBitSet<256>, _UISmallVector<unsigned short, 16>, std::vector<unsigned long>> *p_inOutIndexes;
  int8x16_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  Class isa;
  __int128 v13;
  uint64_t v14;
  _OWORD v15[2];

  tail = self[1]._inOutIndexes.__impl_.__data.__tail;
  if (tail.var1 == 2)
  {
    v9 = (_QWORD *)self->_inOutIndexes.__impl_.__data.__head.__value._chunks[0];
    v10 = self->_inOutIndexes.__impl_.__data.__head.__value._chunks[1];
    if (v9 != (_QWORD *)v10)
      return *(_QWORD *)(v10 - 8) + *v9;
    return 0;
  }
  p_inOutIndexes = &self->_inOutIndexes;
  if (tail.var1 == 1)
  {
    isa = self[1].super.isa;
    if (isa)
    {
      v13 = *((_OWORD *)&self->_inOutIndexes.__impl_.__data.__tail + 1);
      v15[0] = *(_OWORD *)&p_inOutIndexes->__impl_.__data.__dummy;
      v15[1] = v13;
      return *((unsigned __int16 *)v15 + (((_BYTE)isa - 1) & 0xF)) + (unint64_t)LOWORD(v15[0]);
    }
    return 0;
  }
  if (tail.var1)
    return 0;
  v5 = vorrq_s8(*(int8x16_t *)&self->_inOutIndexes.__impl_.__data.__dummy, *((int8x16_t *)&self->_inOutIndexes.__impl_.__data.__tail + 1));
  if (!*(_QWORD *)&vorr_s8(*(int8x8_t *)v5.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL)))
    return 0;
  v6 = _UIBitSet<256ul>::front((unint64_t *)&self->_inOutIndexes);
  v7 = self->_inOutIndexes.__impl_.__data.__head.__value._chunks[3];
  if (v7)
  {
    v8 = 256;
  }
  else
  {
    v7 = self->_inOutIndexes.__impl_.__data.__head.__value._chunks[2];
    if (v7)
    {
      v8 = 192;
    }
    else
    {
      v7 = self->_inOutIndexes.__impl_.__data.__head.__value._chunks[1];
      if (v7)
      {
        v8 = 128;
      }
      else
      {
        v7 = p_inOutIndexes->__impl_.__data.__head.__value._chunks[0];
        if (!p_inOutIndexes->__impl_.__data.__head.__value._chunks[0])
        {
          v14 = 256;
          return v14 + v6;
        }
        v8 = 64;
      }
    }
  }
  v14 = v8 - __clz(v7);
  return v14 + v6;
}

- (BOOL)isEqual:(id)a3
{
  char v5;
  int64x2_t *p_inOutIndexes;
  __union<std::__variant_detail::_Trait::_Available, 1UL, _UISmallVector<unsigned short, 16>, std::vector<unsigned long>> tail;
  variant<_UIBitSet<256>, _UISmallVector<unsigned short, 16>, std::vector<unsigned long>> *v8;
  int v9;
  Class v10;
  Class v11;
  Class v12;
  unint64_t v13;
  BOOL v14;
  int v15;
  char *v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  unint64_t *v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  BOOL v32;
  char *v33;
  uint64_t v34;
  unint64_t *v35;
  unint64_t v36;
  unint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  Class v41;
  unint64_t v42;
  unint64_t *v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  unint64_t v48;
  unint64_t *v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  Class isa;
  Class v55;
  objc_class *v56;
  __int128 v57;
  int64x2_t v58;
  BOOL v59;
  const void *v60;
  size_t v61;
  const void *v62;
  char v63;
  Class v64;
  __int128 v65;
  int64x2_t v66;
  unint64_t v67;
  char v68;
  uint64_t v69;
  unint64_t v70;
  char v71;
  unint64_t v72;
  char v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  char v78;
  unint64_t v79;
  char v80;
  uint64_t v81;
  unint64_t v82;
  char v84;
  __int128 v85;
  __int128 v86;
  unint64_t v87;
  char v88;
  uint64_t v89;
  unint64_t v90;
  _OWORD v93[2];
  _OWORD v94[2];
  _OWORD v95[2];
  _OWORD v96[2];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_137;
  v5 = 0;
  if (self && a3)
  {
    p_inOutIndexes = (int64x2_t *)&self->_inOutIndexes;
    tail = self[1]._inOutIndexes.__impl_.__data.__tail;
    if (tail.var1)
      v8 = 0;
    else
      v8 = &self->_inOutIndexes;
    switch(tail.var1)
    {
      case 0:
        v15 = *((_DWORD *)a3 + 16);
        if (!v15)
        {
          v5 = vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(*p_inOutIndexes, *((int64x2_t *)a3 + 1)), (int32x4_t)vceqq_s64(*((int64x2_t *)&self->_inOutIndexes.__impl_.__data.__tail+ 1), *((int64x2_t *)a3 + 2)))))) ^ 1;
          return v5 & 1;
        }
        if (v15 == 1)
          v16 = (char *)a3 + 16;
        else
          v16 = 0;
        if (v15 == 1)
        {
          v17 = 0;
          v18 = (unint64_t *)v8;
          while (1)
          {
            v19 = *v18++;
            v20 = __clz(__rbit64(v19));
            if (v20 < 0x40)
              break;
            v17 -= 64;
            if (v17 == -256)
            {
              v21 = 0;
              v22 = *((_QWORD *)v16 + 4);
LABEL_140:
              v52 = 256;
              goto LABEL_141;
            }
          }
          v52 = v20 - v17;
          v22 = *((_QWORD *)v16 + 4);
          if ((v20 | 0xFFFFFFFFFFFFFF00) == v17 || v22 == 0)
          {
            v21 = 0;
LABEL_141:
            v14 = v52 == 256 && v21 == v22;
            goto LABEL_150;
          }
          v84 = 0;
          v21 = 0;
          v86 = *(_OWORD *)v16;
          v85 = *((_OWORD *)v16 + 1);
          while (1)
          {
            v93[0] = v86;
            v93[1] = v85;
            if (v52 != *((unsigned __int16 *)v93 + (v21 & 0xF)))
              break;
            v87 = v52 >> 6;
            if (v52 >> 6 == 4)
            {
LABEL_139:
              ++v21;
              goto LABEL_140;
            }
            v88 = v52 & 0x3F;
            v89 = -64 * v87;
            while (1)
            {
              v90 = __clz(__rbit64((v8->__impl_.__data.__head.__value._chunks[v87] ^ (char)(v84 - 1)) & (-1 << v88)));
              if (v90 < 0x40)
                break;
              v88 = 0;
              ++v87;
              v89 -= 64;
              if (v87 == 4)
                goto LABEL_139;
            }
            v52 = v90 - v89;
            v84 ^= 1u;
            ++v21;
            if ((v90 | 0xFFFFFFFFFFFFFF00) == v89 || v21 == v22)
              goto LABEL_141;
          }
        }
        else
        {
          v32 = v15 == 2;
          if (v15 == 2)
            v33 = (char *)a3 + 16;
          else
            v33 = 0;
          if (v32)
          {
            v34 = 0;
            v35 = (unint64_t *)v8;
            while (1)
            {
              v36 = *v35++;
              v37 = __clz(__rbit64(v36));
              if (v37 < 0x40)
                break;
              v34 -= 64;
              if (v34 == -256)
              {
                v38 = *(_QWORD **)v33;
                v39 = (_QWORD *)*((_QWORD *)v33 + 1);
LABEL_145:
                v76 = 256;
                goto LABEL_146;
              }
            }
            v76 = v37 - v34;
            v38 = *(_QWORD **)v33;
            v39 = (_QWORD *)*((_QWORD *)v33 + 1);
            if ((v37 | 0xFFFFFFFFFFFFFF00) == v34 || v38 == v39)
            {
LABEL_146:
              v59 = v76 == 256;
              goto LABEL_147;
            }
            v78 = 0;
            while (v76 == *v38)
            {
              v79 = v76 >> 6;
              if (v76 >> 6 == 4)
              {
LABEL_144:
                ++v38;
                goto LABEL_145;
              }
              v80 = v76 & 0x3F;
              v81 = -64 * v79;
              while (1)
              {
                v82 = __clz(__rbit64((v8->__impl_.__data.__head.__value._chunks[v79] ^ (char)(v78 - 1)) & (-1 << v80)));
                if (v82 < 0x40)
                  break;
                v80 = 0;
                ++v79;
                v81 -= 64;
                if (v79 == 4)
                  goto LABEL_144;
              }
              v76 = v82 - v81;
              v78 ^= 1u;
              ++v38;
              if ((v82 | 0xFFFFFFFFFFFFFF00) == v81 || v38 == v39)
                goto LABEL_146;
            }
          }
        }
        goto LABEL_137;
      case 2:
        v23 = *((_DWORD *)a3 + 16);
        if (v23)
          v24 = 0;
        else
          v24 = (unint64_t *)((char *)a3 + 16);
        if (v23)
        {
          if (v23 != 2)
          {
            if (v23 == 1)
            {
              v25 = (uint64_t *)self->_inOutIndexes.__impl_.__data.__head.__value._chunks[0];
              v26 = self->_inOutIndexes.__impl_.__data.__head.__value._chunks[1];
              v27 = *((_QWORD *)a3 + 6);
              if (v27 == (uint64_t)(v26 - (_QWORD)v25) >> 3)
              {
                if (v25 == (uint64_t *)v26)
                {
                  v28 = 0;
LABEL_154:
                  v14 = v28 == v27;
                  goto LABEL_150;
                }
                v28 = 0;
                v30 = *((_OWORD *)a3 + 1);
                v29 = *((_OWORD *)a3 + 2);
                while (v27 != v28)
                {
                  v31 = *v25;
                  v96[0] = v30;
                  v96[1] = v29;
                  if (v31 != *((unsigned __int16 *)v96 + (v28 & 0xF)))
                    break;
                  ++v25;
                  ++v28;
                  if (v25 == (uint64_t *)v26)
                    goto LABEL_154;
                }
              }
            }
            goto LABEL_137;
          }
          v60 = (const void *)self->_inOutIndexes.__impl_.__data.__head.__value._chunks[0];
          v61 = self->_inOutIndexes.__impl_.__data.__head.__value._chunks[1] - (_QWORD)v60;
          v62 = (const void *)*((_QWORD *)a3 + 2);
          if (v61 != *((_QWORD *)a3 + 3) - (_QWORD)v62)
            goto LABEL_137;
          v14 = memcmp(v60, v62, v61) == 0;
LABEL_150:
          v5 = v14;
          return v5 & 1;
        }
        v46 = 0;
        v47 = (_QWORD *)self->_inOutIndexes.__impl_.__data.__head.__value._chunks[0];
        v48 = self->_inOutIndexes.__impl_.__data.__head.__value._chunks[1];
        v42 = 256;
        v49 = v24;
        while (1)
        {
          v50 = *v49++;
          v51 = __clz(__rbit64(v50));
          if (v51 < 0x40)
            break;
          v46 -= 64;
          if (v46 == -256)
            goto LABEL_91;
        }
        v42 = v51 - v46;
LABEL_91:
        if (v47 != (_QWORD *)v48)
        {
          v71 = 0;
          while (v42 != 256)
          {
            if (*v47 != v42)
              goto LABEL_137;
            v72 = v42 >> 6;
            if (v42 >> 6 == 4)
            {
LABEL_99:
              v42 = 256;
            }
            else
            {
              v73 = v42 & 0x3F;
              v74 = -64 * v72;
              while (1)
              {
                v75 = __clz(__rbit64((v24[v72] ^ (char)(v71 - 1)) & (-1 << v73)));
                if (v75 < 0x40)
                  break;
                v73 = 0;
                ++v72;
                v74 -= 64;
                if (v72 == 4)
                  goto LABEL_99;
              }
              v42 = v75 - v74;
            }
            ++v47;
            v71 ^= 1u;
            if (v47 == (_QWORD *)v48)
              goto LABEL_136;
          }
        }
        if (v47 != (_QWORD *)v48)
          goto LABEL_137;
        break;
      case 1:
        v9 = *((_DWORD *)a3 + 16);
        if (v9)
        {
          if (v9 == 2)
          {
            isa = self[1].super.isa;
            v38 = (_QWORD *)*((_QWORD *)a3 + 2);
            v39 = (_QWORD *)*((_QWORD *)a3 + 3);
            if (isa == (Class)(v39 - v38))
            {
              v55 = 0;
              if (!isa || v38 == v39)
              {
LABEL_74:
                v59 = v55 == isa;
LABEL_147:
                v14 = v59 && v38 == v39;
                goto LABEL_150;
              }
              v56 = 0;
              v58 = *p_inOutIndexes;
              v57 = *((_OWORD *)&self->_inOutIndexes.__impl_.__data.__tail + 1);
              while (1)
              {
                v95[0] = v58;
                v95[1] = v57;
                if (*v38 != *((unsigned __int16 *)v95 + (v56 & 0xF)))
                  break;
                v55 = (objc_class *)((char *)v56 + 1);
                ++v38;
                if ((Class)((char *)isa - 1) != v56)
                {
                  v56 = (objc_class *)((char *)v56 + 1);
                  if (v38 != v39)
                    continue;
                }
                goto LABEL_74;
              }
            }
          }
          else if (v9 == 1)
          {
            v10 = (Class)*((_QWORD *)a3 + 6);
            v11 = self[1].super.isa;
            if (v10 >= v11)
              v12 = self[1].super.isa;
            else
              v12 = (Class)*((_QWORD *)a3 + 6);
            v13 = __clz(__rbit64(*(_QWORD *)&vshrn_n_s16((int16x8_t)vmvnq_s8(vuzp1q_s8((int8x16_t)vceqq_s16(*(int16x8_t *)&self->_inOutIndexes.__impl_.__data.__dummy, *((int16x8_t *)a3 + 1)), (int8x16_t)vceqq_s16(*((int16x8_t *)&self->_inOutIndexes.__impl_.__data.__tail+ 1), *((int16x8_t *)a3 + 2)))), 4uLL))) >> 2;
            if (v13 < (unint64_t)v12)
              v12 = (Class)v13;
            if (v11 > v10)
              v10 = self[1].super.isa;
            v14 = v12 == v10;
            goto LABEL_150;
          }
LABEL_137:
          v5 = 0;
          return v5 & 1;
        }
        v40 = 0;
        v41 = self[1].super.isa;
        v42 = 256;
        v43 = (unint64_t *)((char *)a3 + 16);
        while (1)
        {
          v44 = *v43++;
          v45 = __clz(__rbit64(v44));
          if (v45 < 0x40)
            break;
          v40 -= 64;
          if (v40 == -256)
            goto LABEL_78;
        }
        v42 = v45 - v40;
LABEL_78:
        if (v41)
        {
          v63 = 0;
          v64 = 0;
          v66 = *p_inOutIndexes;
          v65 = *((_OWORD *)&self->_inOutIndexes.__impl_.__data.__tail + 1);
          while (v42 != 256)
          {
            v94[0] = v66;
            v94[1] = v65;
            if (v42 != *((unsigned __int16 *)v94 + (v64 & 0xF)))
              goto LABEL_137;
            v67 = v42 >> 6;
            if (v42 >> 6 == 4)
            {
LABEL_86:
              v42 = 256;
            }
            else
            {
              v68 = v42 & 0x3F;
              v69 = -64 * v67;
              while (1)
              {
                v70 = __clz(__rbit64((*((_QWORD *)a3 + v67 + 2) ^ (char)(v63 - 1)) & (-1 << v68)));
                if (v70 < 0x40)
                  break;
                v68 = 0;
                ++v67;
                v69 -= 64;
                if (v67 == 4)
                  goto LABEL_86;
              }
              v42 = v70 - v69;
            }
            v64 = (Class)((char *)v64 + 1);
            v63 ^= 1u;
            if (v64 == v41)
              goto LABEL_136;
          }
        }
        else
        {
          v64 = 0;
        }
        if (v64 != v41)
          goto LABEL_137;
        break;
      default:
        goto LABEL_137;
    }
LABEL_136:
    v14 = v42 == 256;
    goto LABEL_150;
  }
  return v5 & 1;
}

- (uint64_t)firstIndex
{
  int8x16_t *v1;
  int v2;
  unint64_t *v3;
  int8x16_t v4;
  uint64_t v5;

  if (result)
  {
    v1 = (int8x16_t *)result;
    v2 = *(_DWORD *)(result + 64);
    if (v2 == 2)
    {
      v5 = *(_QWORD *)(result + 16);
      if (v5 == *(_QWORD *)(result + 24))
        return 0x7FFFFFFFFFFFFFFFLL;
      return *(_QWORD *)v5;
    }
    else
    {
      v3 = (unint64_t *)(result + 16);
      if (v2 == 1)
      {
        if (v1[3].i64[0])
          return (unsigned __int16)*(_OWORD *)v3;
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      if (!v2)
      {
        v4 = vorrq_s8(v1[1], v1[2]);
        if (vorr_s8(*(int8x8_t *)v4.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL)))
          return _UIBitSet<256ul>::front(v3);
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      return 0;
    }
  }
  return result;
}

- (uint64_t)indexGreaterThanOrEqualToIndex:(uint16x8_t *)a1
{
  __int32 v2;
  unint64_t v3;
  uint16x8_t v4;
  uint16x8_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t *v17;
  _BOOL8 v18;
  unint64_t *v19;
  _OWORD v21[2];

  if (!a1)
    return 0;
  if (a2 > 0x7FFFFFFFFFFFFFFELL)
    return 0x7FFFFFFFFFFFFFFFLL;
  v2 = a1[4].i32[0];
  if (v2)
  {
    if (v2 == 2)
    {
      v14 = a1[1].i64[0];
      v13 = (unint64_t *)a1[1].i64[1];
      if ((unint64_t)v13 - v14 < 9)
      {
        v15 = 0;
      }
      else
      {
        v15 = 0;
        v16 = ((uint64_t)v13 - v14) >> 3;
        do
        {
          if (*(_QWORD *)(v14 + 8 * (v15 + (v16 >> 1))) <= a2)
            v15 += v16 >> 1;
          v16 -= v16 >> 1;
        }
        while (v16 > 1);
      }
      v17 = (unint64_t *)(v14 + 8 * v15);
      v18 = v13 != (unint64_t *)v14 && *v17 <= a2;
      v19 = &v17[v18];
      if ((((_DWORD)v19 - (_DWORD)v14) & 8) == 0)
      {
        if (v19 != v13)
          return *v19;
        return 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      if (v2 != 1)
        return 0;
      v3 = a1[3].u64[0];
      v4 = a1[2];
      v5 = (uint16x8_t)vdupq_n_s16(a2);
      v6 = __clz(__rbit64(*(_QWORD *)&vshrn_n_s16((int16x8_t)vuzp1q_s8((int8x16_t)vcgtq_u16(a1[1], v5), (int8x16_t)vcgtq_u16(v4, v5)), 4uLL)));
      v7 = v6 >> 2;
      if (v6 >> 2 >= v3)
        v8 = a1[3].u64[0];
      else
        v8 = v6 >> 2;
      if ((v8 & 1) == 0)
      {
        if (v3 > v7)
        {
          v21[0] = a1[1];
          v21[1] = v4;
          return *((unsigned __int16 *)v21 + (v8 & 0xF));
        }
        return 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }
  else
  {
    if (a2 > 0xFF)
      return 0x7FFFFFFFFFFFFFFFLL;
    v9 = a2 & 0x3F;
    v10 = -64 * (a2 >> 6);
    v11 = a2 >> 6;
    while (1)
    {
      v12 = __clz(__rbit64(a1[1].i64[v11] & (-1 << v9)));
      if (v12 < 0x40)
        break;
      v9 = 0;
      v10 -= 64;
      if (++v11 == 4)
        return 0x7FFFFFFFFFFFFFFFLL;
    }
    a2 = v12 - v10;
    if (v12 - v10 >= 0x100)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return a2;
}

@end
