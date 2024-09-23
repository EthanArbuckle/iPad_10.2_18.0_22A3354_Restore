@implementation VKVectorOverlayPolyline

- (VKVectorOverlayPolyline)initWithMapPoints:(id *)a3 elevations:(const double *)a4 count:(unint64_t)a5 needsElevationCorrection:(BOOL)a6
{
  _BOOL4 v6;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  _BYTE *v15;
  _BYTE *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  _BYTE *v21;
  _BYTE *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  __int128 *v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  _BOOL4 v36;
  double *v37;
  signed int v38;
  signed int v39;
  const $F24F406B2B787EFB06265DBA3D28CBD5 *v40;
  double v41;
  double v42;
  unint64_t v43;
  double *v44;
  double *v45;
  double *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  double *v52;
  double *v53;
  unint64_t v54;
  double *v55;
  double *v56;
  double *v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  _BYTE *v62;
  double *v63;
  unint64_t v64;
  uint64_t v65;
  _OWORD *v66;
  double *v67;
  uint64_t v68;
  __int128 v69;
  uint64_t v70;
  uint64_t v71;
  long double v72;
  double v73;
  long double v74;
  long double v75;
  unint64_t Undulation;
  double v77;
  char *v78;
  md::GeoidModel *v80;
  _BOOL4 v81;
  unint64_t v82;
  objc_super v84;

  v6 = a6;
  v84.receiver = self;
  v84.super_class = (Class)VKVectorOverlayPolyline;
  v9 = -[VKVectorOverlayPolyline init](&v84, sel_init);
  if (v9)
  {
    v10 = operator new();
    *(_QWORD *)v10 = 4;
    *(_OWORD *)(v10 + 8) = 0u;
    *(_OWORD *)(v10 + 24) = 0u;
    *(_DWORD *)(v10 + 40) = 1065353216;
    *(_QWORD *)(v10 + 48) = v10 + 48;
    *(_QWORD *)(v10 + 56) = v10 + 48;
    *(_QWORD *)(v10 + 64) = 0;
    v11 = (_QWORD *)*((_QWORD *)v9 + 8);
    *((_QWORD *)v9 + 8) = v10;
    if (v11)
    {
      std::__list_imp<std::pair<unsigned char,PolylineWithElevation>>::clear(v11 + 6);
      v12 = (_QWORD *)v11[3];
      if (v12)
      {
        do
        {
          v13 = (_QWORD *)*v12;
          operator delete(v12);
          v12 = v13;
        }
        while (v13);
      }
      v14 = (void *)v11[1];
      v11[1] = 0;
      if (v14)
        operator delete(v14);
      MEMORY[0x1A1AF4E00](v11, 0x10A0C407D9D2971);
    }
    v15 = (_BYTE *)*((_QWORD *)v9 + 1);
    if (a5 > (uint64_t)(*((_QWORD *)v9 + 3) - (_QWORD)v15) >> 4)
    {
      if (a5 >> 60)
        goto LABEL_89;
      v16 = (_BYTE *)*((_QWORD *)v9 + 2);
      v17 = (char *)operator new(16 * a5);
      v18 = &v17[(v16 - v15) & 0xFFFFFFFFFFFFFFF0];
      v19 = v18;
      if (v16 != v15)
      {
        v20 = &v17[(v16 - v15) & 0xFFFFFFFFFFFFFFF0];
        do
        {
          v19 = v20 - 16;
          *((_OWORD *)v20 - 1) = *((_OWORD *)v16 - 1);
          v16 -= 16;
          v20 -= 16;
        }
        while (v16 != v15);
      }
      *((_QWORD *)v9 + 1) = v19;
      *((_QWORD *)v9 + 2) = v18;
      *((_QWORD *)v9 + 3) = &v17[16 * a5];
      if (v15)
        operator delete(v15);
    }
    if (!a4)
      goto LABEL_28;
    v21 = (_BYTE *)*((_QWORD *)v9 + 4);
    if (a5 <= (uint64_t)(*((_QWORD *)v9 + 6) - (_QWORD)v21) >> 3)
      goto LABEL_28;
    if (!(a5 >> 61))
    {
      v22 = (_BYTE *)*((_QWORD *)v9 + 5);
      v23 = (char *)operator new(8 * a5);
      v24 = v22 - v21;
      v25 = &v23[(v22 - v21) & 0xFFFFFFFFFFFFFFF8];
      v26 = v25;
      if (v22 == v21)
        goto LABEL_26;
      if ((unint64_t)(v24 - 8) >= 0x58)
      {
        v26 = &v23[(v22 - v21) & 0xFFFFFFFFFFFFFFF8];
        if ((unint64_t)(v22 - &v23[v24 & 0xFFFFFFFFFFFFFFF8]) >= 0x20)
        {
          v27 = v24 >> 3;
          v28 = ((unint64_t)(v24 - 8) >> 3) + 1;
          v29 = &v23[8 * v27 - 16];
          v30 = (__int128 *)(v22 - 16);
          v31 = v28 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v32 = *v30;
            *((_OWORD *)v29 - 1) = *(v30 - 1);
            *(_OWORD *)v29 = v32;
            v29 -= 32;
            v30 -= 2;
            v31 -= 4;
          }
          while (v31);
          v26 = &v25[-8 * (v28 & 0x3FFFFFFFFFFFFFFCLL)];
          v22 -= 8 * (v28 & 0x3FFFFFFFFFFFFFFCLL);
          if (v28 == (v28 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_26:
            *((_QWORD *)v9 + 4) = v26;
            *((_QWORD *)v9 + 5) = v25;
            *((_QWORD *)v9 + 6) = &v23[8 * a5];
            if (v21)
              operator delete(v21);
LABEL_28:
            *((_WORD *)v9 + 28) = 256;
            if (v6)
            {
              +[VKSharedResourcesManager sharedResources](VKSharedResourcesManager, "sharedResources");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v80 = (md::GeoidModel *)objc_msgSend(v34, "undulationModel");

              if (!a5)
                goto LABEL_85;
            }
            else
            {
              v80 = 0;
              if (!a5)
              {
LABEL_85:
                v78 = v9;
                goto LABEL_86;
              }
            }
            v35 = 0;
            if (v80)
              v36 = v6;
            else
              v36 = 0;
            v81 = v36;
            v37 = (double *)MEMORY[0x1E0D266F8];
            v82 = a5;
            do
            {
              v40 = &a3[v35];
              v41 = v40->var0 / *v37;
              v42 = 1.0 - v40->var1 / v37[1];
              v44 = (double *)*((_QWORD *)v9 + 2);
              v43 = *((_QWORD *)v9 + 3);
              if ((unint64_t)v44 >= v43)
              {
                v46 = (double *)*((_QWORD *)v9 + 1);
                v47 = ((char *)v44 - (char *)v46) >> 4;
                v48 = v47 + 1;
                if ((unint64_t)(v47 + 1) >> 60)
                  goto LABEL_87;
                v49 = v43 - (_QWORD)v46;
                if (v49 >> 3 > v48)
                  v48 = v49 >> 3;
                if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFF0)
                  v50 = 0xFFFFFFFFFFFFFFFLL;
                else
                  v50 = v48;
                if (v50)
                {
                  if (v50 >> 60)
                    goto LABEL_88;
                  v51 = (char *)operator new(16 * v50);
                }
                else
                {
                  v51 = 0;
                }
                v52 = (double *)&v51[16 * v47];
                *v52 = v41;
                v52[1] = v42;
                a5 = v82;
                v53 = v52;
                if (v44 != v46)
                {
                  do
                  {
                    *((_OWORD *)v53 - 1) = *((_OWORD *)v44 - 1);
                    v53 -= 2;
                    v44 -= 2;
                  }
                  while (v44 != v46);
                  v44 = (double *)*((_QWORD *)v9 + 1);
                }
                v45 = v52 + 2;
                *((_QWORD *)v9 + 1) = v53;
                *((_QWORD *)v9 + 2) = v52 + 2;
                *((_QWORD *)v9 + 3) = &v51[16 * v50];
                if (v44)
                  operator delete(v44);
              }
              else
              {
                *v44 = v41;
                v44[1] = v42;
                v45 = v44 + 2;
              }
              *((_QWORD *)v9 + 2) = v45;
              if (a4)
              {
                v55 = (double *)*((_QWORD *)v9 + 5);
                v54 = *((_QWORD *)v9 + 6);
                if ((unint64_t)v55 >= v54)
                {
                  v57 = (double *)*((_QWORD *)v9 + 4);
                  v58 = v55 - v57;
                  v59 = v58 + 1;
                  if ((unint64_t)(v58 + 1) >> 61)
LABEL_87:
                    abort();
                  v60 = v54 - (_QWORD)v57;
                  if (v60 >> 2 > v59)
                    v59 = v60 >> 2;
                  if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFF8)
                    v61 = 0x1FFFFFFFFFFFFFFFLL;
                  else
                    v61 = v59;
                  if (v61)
                  {
                    if (v61 >> 61)
LABEL_88:
                      std::__throw_bad_array_new_length[abi:nn180100]();
                    v62 = operator new(8 * v61);
                  }
                  else
                  {
                    v62 = 0;
                  }
                  v63 = (double *)&v62[8 * v58];
                  *v63 = a4[v35];
                  v56 = v63 + 1;
                  if (v55 != v57)
                  {
                    v64 = (char *)(v55 - 1) - (char *)v57;
                    if (v64 < 0x58)
                      goto LABEL_92;
                    if ((unint64_t)((char *)v57 - v62) < 0x20)
                      goto LABEL_92;
                    v65 = (v64 >> 3) + 1;
                    v66 = &v62[8 * v58 - 16];
                    v67 = v55 - 2;
                    v68 = v65 & 0x3FFFFFFFFFFFFFFCLL;
                    do
                    {
                      v69 = *(_OWORD *)v67;
                      *(v66 - 1) = *((_OWORD *)v67 - 1);
                      *v66 = v69;
                      v66 -= 2;
                      v67 -= 4;
                      v68 -= 4;
                    }
                    while (v68);
                    v63 -= v65 & 0x3FFFFFFFFFFFFFFCLL;
                    v55 -= v65 & 0x3FFFFFFFFFFFFFFCLL;
                    if (v65 != (v65 & 0x3FFFFFFFFFFFFFFCLL))
                    {
LABEL_92:
                      do
                      {
                        v70 = *((_QWORD *)v55-- - 1);
                        *((_QWORD *)v63-- - 1) = v70;
                      }
                      while (v55 != v57);
                    }
                  }
                  *((_QWORD *)v9 + 4) = v63;
                  *((_QWORD *)v9 + 5) = v56;
                  *((_QWORD *)v9 + 6) = &v62[8 * v61];
                  if (v57)
                    operator delete(v57);
                  a5 = v82;
                }
                else
                {
                  *v55 = a4[v35];
                  v56 = v55 + 1;
                }
                *((_QWORD *)v9 + 5) = v56;
                if (v81)
                {
                  v71 = *((_QWORD *)v9 + 2);
                  v72 = exp(*(double *)(v71 - 8) * 6.28318531 + -3.14159265);
                  v73 = atan(v72) * 114.591559 + -90.0;
                  v74 = fmod(*(double *)(v71 - 16) * 6.28318531, 6.28318531);
                  v75 = fmod(v74 + 6.28318531, 6.28318531);
                  Undulation = md::GeoidModel::getUndulation(v80, v73, v75 * 57.2957795 + -180.0);
                  v77 = *(float *)&Undulation;
                  if (!HIDWORD(Undulation))
                    v77 = 0.0;
                  *(v56 - 1) = *(v56 - 1) + v77;
                }
              }
              v38 = vcvtmd_s64_f64(v41);
              if (v9[56] < v38)
                LOBYTE(v38) = v9[56];
              v9[56] = v38;
              v39 = vcvtpd_s64_f64(v41);
              if (v9[57] > v39)
                LOBYTE(v39) = v9[57];
              v9[57] = v39;
              ++v35;
            }
            while (v35 != a5);
            goto LABEL_85;
          }
        }
      }
      else
      {
        v26 = &v23[(v22 - v21) & 0xFFFFFFFFFFFFFFF8];
      }
      do
      {
        v33 = *((_QWORD *)v22 - 1);
        v22 -= 8;
        *((_QWORD *)v26 - 1) = v33;
        v26 -= 8;
      }
      while (v22 != v21);
      goto LABEL_26;
    }
LABEL_89:
    abort();
  }
LABEL_86:

  return (VKVectorOverlayPolyline *)v9;
}

- (PolylineWithElevation)simplifiedGeometryAtZoomLevel:(SEL)a3
{
  unsigned int v4;
  unfair_lock *p_simplifiedGeometryCacheLock;
  _QWORD *value;
  uint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  uint64_t ***v14;
  uint64_t **v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  __shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  __shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  PolylineWithElevation *result;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  double v33;
  std::vector<std::pair<unsigned long, const char *>> *v34;
  std::__shared_weak_count *v35;
  unint64_t *p_end;
  std::vector<std::pair<unsigned long, const char *>> *v37;
  int64_t v38;
  double *begin;
  std::__shared_weak_count *v40;
  _BYTE *v41;
  _BYTE *v42;
  _QWORD *v43;
  _QWORD *v44;
  _BYTE *end;
  _QWORD *v46;
  unint64_t v47;
  _QWORD *p_first;
  _QWORD *v49;
  uint64_t *v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  _QWORD *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  _QWORD *v61;
  _QWORD *v62;
  uint64_t v63;
  _QWORD *v64;
  double v65;
  std::__shared_weak_count_vtbl *v66;
  unint64_t v67;
  _QWORD *p_var0;
  unint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  _QWORD *v72;
  std::__shared_weak_count_vtbl *v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t *p_shared_owners;
  unint64_t v77;
  char *v78;
  unint64_t v79;
  unint64_t *v80;
  unint64_t v81;
  unint64_t v82;
  _QWORD *v83;
  unint64_t v84;
  unint64_t *v85;
  unint64_t v86;
  int8x8_t v87;
  unint64_t v88;
  unint64_t v89;
  uint8x8_t v90;
  unint64_t v91;
  uint64_t ***v92;
  uint64_t **v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t *v96;
  uint64_t *v97;
  uint64_t v98;
  std::__shared_weak_count *v99;
  unint64_t *v100;
  unint64_t v101;
  std::__shared_weak_count *v102;
  unint64_t *v103;
  unint64_t v104;
  _BYTE *v105;
  _BYTE *v106;
  std::__shared_weak_count *v107;
  unint64_t *v108;
  unint64_t v109;
  std::__shared_weak_count *v110;
  unint64_t *v111;
  unint64_t v112;
  _QWORD *v113;
  uint64_t v114;
  unint64_t v115;
  uint8x8_t v116;
  uint64_t ***v117;
  uint64_t **v118;
  unint64_t v119;
  uint64_t *v120;
  _QWORD *v121;
  float v122;
  float v123;
  _BOOL8 v124;
  unint64_t v125;
  unint64_t v126;
  size_t prime;
  void *v128;
  void *v129;
  uint64_t v130;
  _QWORD *v131;
  char *v132;
  size_t v133;
  size_t v134;
  size_t v135;
  _QWORD *v136;
  size_t v137;
  uint64_t v138;
  uint64_t v139;
  unint64_t v140;
  uint8x8_t v141;
  uint64_t v142;
  _QWORD *v143;
  uint64_t v144;
  size_t v145;
  uint64_t v146;
  void *v147;
  uint64_t v148;
  _QWORD *v149;
  unint64_t v150;
  unint64_t *v151;
  unint64_t v152;
  std::__shared_weak_count *v153;
  unint64_t *v154;
  unint64_t v155;
  std::__shared_weak_count *v156;
  uint64_t v157;
  unint64_t v158;
  std::__shared_weak_count *v159;
  unint64_t *v160;
  unint64_t v161;
  std::__shared_weak_count *v162;
  unint64_t *v163;
  unint64_t v164;
  uint64_t *v165;
  uint64_t v166;
  std::__shared_weak_count *v167;
  unint64_t *v168;
  unint64_t v169;
  std::__shared_weak_count *v170;
  unint64_t *v171;
  unint64_t v172;
  int8x8_t v173;
  uint8x8_t v174;
  unint64_t v175;
  uint64_t ***v176;
  uint64_t **v177;
  uint64_t v178;
  unint64_t v179;
  uint64_t *v180;
  unint64_t *v181;
  unint64_t v182;
  unint64_t *v183;
  unint64_t v184;
  unint64_t *v185;
  unint64_t v186;
  unint64_t *v187;
  unint64_t v188;
  std::__shared_weak_count *v189;
  unint64_t *v190;
  unint64_t v191;
  std::vector<std::pair<unsigned long, const char *>> *v192;
  unfair_lock *v193;
  PolylineWithElevation *v194;
  _QWORD *v195;
  std::__shared_weak_count *v196;
  std::__shared_weak_count *v197;
  unint64_t v198;
  _QWORD *v199;
  std::__shared_weak_count *v200;
  std::vector<std::pair<unsigned long, const char *>> *v201;
  std::__shared_weak_count *v202;
  std::vector<std::pair<unsigned long, const char *>> *v203;
  std::__shared_weak_count *v204;
  _QWORD *v205;
  std::__shared_weak_count *v206;
  void *v207[4];

  v4 = a4;
  v201 = 0;
  v202 = 0;
  v199 = 0;
  v200 = 0;
  p_simplifiedGeometryCacheLock = &self->_simplifiedGeometryCacheLock;
  os_unfair_lock_lock(&self->_simplifiedGeometryCacheLock._lock);
  value = self->_simplifiedGeometryCache.__ptr_.__value_;
  v9 = value + 6;
  v10 = v4;
  v11 = value[2];
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    if (v12.u32[0] > 1uLL)
    {
      v13 = v4;
      if (v11 <= v4)
        v13 = v4 % v11;
    }
    else
    {
      v13 = ((_DWORD)v11 - 1) & v4;
    }
    v14 = *(uint64_t ****)(value[1] + 8 * v13);
    if (v14)
    {
      v15 = *v14;
      if (v15)
      {
        if (v12.u32[0] < 2uLL)
        {
          v16 = v11 - 1;
          while (1)
          {
            v18 = v15[1];
            if (v18 == (uint64_t *)v4)
            {
              if (*((unsigned __int8 *)v15 + 16) == v4)
                goto LABEL_22;
            }
            else if (((unint64_t)v18 & v16) != v13)
            {
              goto LABEL_25;
            }
            v15 = (uint64_t **)*v15;
            if (!v15)
              goto LABEL_25;
          }
        }
        do
        {
          v17 = (unint64_t)v15[1];
          if (v17 == v4)
          {
            if (*((unsigned __int8 *)v15 + 16) == v4)
            {
LABEL_22:
              v9 = (uint64_t *)value[7];
              v19 = v15[3];
              if (v9 != v19)
              {
                v20 = (uint64_t *)v19[1];
                if (v20 != v9)
                {
                  v21 = *v19;
                  *(_QWORD *)(v21 + 8) = v20;
                  *(_QWORD *)v19[1] = v21;
                  v22 = *v9;
                  *(_QWORD *)(v22 + 8) = v19;
                  *v19 = v22;
                  *v9 = (uint64_t)v19;
                  v19[1] = (uint64_t)v9;
                  v9 = (uint64_t *)value[7];
                  value = self->_simplifiedGeometryCache.__ptr_.__value_;
                }
              }
              break;
            }
          }
          else
          {
            if (v17 >= v11)
              v17 %= v11;
            if (v17 != v13)
              break;
          }
          v15 = (uint64_t **)*v15;
        }
        while (v15);
      }
    }
  }
LABEL_25:
  if (value + 6 != v9)
  {
    retstr->var0.var0 = (void *)v9[3];
    v23 = (__shared_weak_count *)v9[4];
    retstr->var0.var1 = v23;
    if (v23)
    {
      v24 = (unint64_t *)((char *)v23 + 8);
      do
        v25 = __ldxr(v24);
      while (__stxr(v25 + 1, v24));
    }
    retstr->var1.var0 = (void *)v9[5];
    v26 = (__shared_weak_count *)v9[6];
    retstr->var1.var1 = v26;
    if (v26)
    {
      v27 = (unint64_t *)((char *)v26 + 8);
      do
        v28 = __ldxr(v27);
      while (__stxr(v28 + 1, v27));
    }
    os_unfair_lock_unlock(&p_simplifiedGeometryCacheLock->_lock);
    goto LABEL_33;
  }
  if (v4 <= 0x12)
    v33 = (double)(1 << (19 - v4)) / *MEMORY[0x1E0D266F8];
  else
    v33 = 1.0e-10;
  v34 = (std::vector<std::pair<unsigned long, const char *>> *)operator new(0x30uLL);
  v35 = (std::__shared_weak_count *)v34;
  v194 = retstr;
  v34->__end_ = 0;
  p_end = (unint64_t *)&v34->__end_;
  v34->__end_cap_.__value_ = 0;
  v34->__begin_ = (std::vector<std::pair<unsigned long, const char *>>::pointer)&off_1E42E66F0;
  v34[1].__begin_ = 0;
  v37 = v34 + 1;
  v34[1].__end_ = 0;
  v34[1].__end_cap_.__value_ = 0;
  v201 = v34 + 1;
  v202 = (std::__shared_weak_count *)v34;
  v38 = (char *)self->_points.__end_ - (char *)self->_points.__begin_;
  if (v38)
    std::vector<geo::Mercator2<double>>::__append(v34 + 1, v38 >> 4);
  begin = self->_elevations.__begin_;
  if (self->_elevations.__end_ == begin)
  {
    v46 = self->_points.__begin_;
    end = self->_points.__end_;
    v47 = (end - (_BYTE *)v46) >> 4;
    p_first = &v37->__begin_->first;
    if ((unint64_t)(end - (_BYTE *)v46) > 0x2F)
    {
      v198 = 1;
      *p_first = *v46;
      p_first[1] = v46[1];
      v69 = v47 - 1;
      geo::dpSimplify<geo::Mercator2<double>>((uint64_t)v46, 0, v69, (uint64_t)p_first, &v198, v33);
      v40 = 0;
      v195 = 0;
      v70 = &v46[2 * v69];
      v71 = v198;
      v47 = ++v198;
      v72 = &p_first[2 * v71];
      *v72 = *v70;
      v72[1] = v70[1];
    }
    else
    {
      if (end != (_BYTE *)v46)
      {
        v49 = p_first + 1;
        v50 = v46 + 1;
        v51 = v47;
        do
        {
          *(v49 - 1) = *(v50 - 1);
          v52 = *v50;
          v50 += 2;
          *v49 = v52;
          v49 += 2;
          --v51;
        }
        while (v51);
      }
      v40 = 0;
      v195 = 0;
      v198 = v47;
    }
    p_var0 = &v194->var0.var0;
  }
  else
  {
    v40 = (std::__shared_weak_count *)operator new(0x30uLL);
    v40->__shared_owners_ = 0;
    v40->__shared_weak_owners_ = 0;
    v40->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42E6808;
    v40[1].__vftable = 0;
    v40[1].__shared_owners_ = 0;
    v40[1].__shared_weak_owners_ = 0;
    v199 = &v40[1].__vftable;
    v200 = v40;
    v41 = self->_points.__begin_;
    v42 = self->_points.__end_;
    v193 = p_simplifiedGeometryCacheLock;
    v195 = &v40[1].__vftable;
    if (v42 == v41)
    {
      v43 = 0;
      v44 = self->_points.__end_;
    }
    else
    {
      std::vector<double>::__append((uint64_t)&v40[1], (v42 - v41) >> 4);
      begin = self->_elevations.__begin_;
      v41 = self->_points.__begin_;
      v42 = self->_points.__end_;
      v43 = (_QWORD *)*v195;
      v44 = v41;
    }
    v53 = v42 - v41;
    v47 = v53 >> 4;
    v54 = &v37->__begin_->first;
    v192 = v37;
    if ((unint64_t)v53 > 0x2F)
    {
      *v54 = *v44;
      v54[1] = v44[1];
      v59 = *(_QWORD *)begin;
      v198 = 1;
      *v43 = v59;
      v60 = v47 - 1;
      v61 = v43;
      geo::dpSimplify<geo::Mercator2<double>>((uint64_t)v44, (uint64_t)begin, 0, v60, (uint64_t)v54, (uint64_t)v43, (uint64_t *)&v198, v33);
      v62 = &v44[2 * v60];
      v63 = v198;
      v64 = &v54[2 * v198];
      *v64 = *v62;
      v64[1] = v62[1];
      v65 = begin[v60];
      v47 = v63 + 1;
      v198 = v63 + 1;
      *(double *)&v61[v63] = v65;
    }
    else
    {
      if (v42 != (_BYTE *)v44)
      {
        v55 = v54 + 1;
        v56 = v44 + 1;
        v57 = v53 >> 4;
        do
        {
          *(v55 - 1) = *(v56 - 1);
          v58 = *v56;
          v56 += 2;
          *v55 = v58;
          v55 += 2;
          --v57;
        }
        while (v57);
      }
      memcpy(v43, begin, (unint64_t)v53 >> 1);
      v198 = v47;
    }
    v66 = v40[1].__vftable;
    v67 = (v40[1].__shared_owners_ - (uint64_t)v66) >> 3;
    p_simplifiedGeometryCacheLock = v193;
    p_var0 = &v194->var0.var0;
    if (v47 <= v67)
    {
      v37 = v192;
      if (v47 < v67)
        v40[1].__shared_owners_ = (uint64_t)v66 + 8 * v47;
    }
    else
    {
      std::vector<double>::__append((uint64_t)v195, v47 - v67);
      v37 = v192;
    }
  }
  v73 = v35[1].__vftable;
  v74 = (v35[1].__shared_owners_ - (uint64_t)v73) >> 4;
  if (v47 <= v74)
  {
    if (v47 < v74)
      v35[1].__shared_owners_ = (uint64_t)v73 + 16 * v47;
  }
  else
  {
    std::vector<geo::Mercator2<double>>::__append(v37, v47 - v74);
  }
  *p_var0 = v37;
  p_var0[1] = v35;
  do
    v75 = __ldxr(p_end);
  while (__stxr(v75 + 1, p_end));
  p_var0[2] = v195;
  p_var0[3] = v40;
  if (v40)
  {
    p_shared_owners = (unint64_t *)&v40->__shared_owners_;
    do
      v77 = __ldxr(p_shared_owners);
    while (__stxr(v77 + 1, p_shared_owners));
    v78 = (char *)self->_simplifiedGeometryCache.__ptr_.__value_;
    v196 = v35;
    do
      v79 = __ldxr(p_end);
    while (__stxr(v79 + 1, p_end));
    v197 = v40;
    v80 = (unint64_t *)&v40->__shared_owners_;
    do
      v81 = __ldxr(v80);
    while (__stxr(v81 + 1, v80));
    v82 = (unint64_t)(v78 + 48);
    v83 = v78 + 8;
    v203 = v37;
    v204 = v35;
    do
      v84 = __ldxr(p_end);
    while (__stxr(v84 + 1, p_end));
    v205 = v195;
    v206 = v40;
    v85 = (unint64_t *)&v40->__shared_owners_;
    do
      v86 = __ldxr(v85);
    while (__stxr(v86 + 1, v85));
    v87 = *(int8x8_t *)(v78 + 16);
    if (!*(_QWORD *)&v87)
      goto LABEL_121;
  }
  else
  {
    v78 = (char *)self->_simplifiedGeometryCache.__ptr_.__value_;
    v196 = v35;
    do
      v88 = __ldxr(p_end);
    while (__stxr(v88 + 1, p_end));
    v197 = 0;
    v82 = (unint64_t)(v78 + 48);
    v83 = v78 + 8;
    v203 = v37;
    v204 = v35;
    do
      v89 = __ldxr(p_end);
    while (__stxr(v89 + 1, p_end));
    v205 = v195;
    v206 = 0;
    v87 = *(int8x8_t *)(v78 + 16);
    if (!*(_QWORD *)&v87)
      goto LABEL_121;
  }
  v90 = (uint8x8_t)vcnt_s8(v87);
  v90.i16[0] = vaddlv_u8(v90);
  if (v90.u32[0] > 1uLL)
  {
    v91 = v10;
    if (*(_QWORD *)&v87 <= v10)
      v91 = v10 % *(_QWORD *)&v87;
  }
  else
  {
    v91 = (v87.i32[0] - 1) & v10;
  }
  v92 = *(uint64_t ****)(*((_QWORD *)v78 + 1) + 8 * v91);
  if (v92)
  {
    v93 = *v92;
    if (*v92)
    {
      if (v90.u32[0] < 2uLL)
      {
        v94 = *(_QWORD *)&v87 - 1;
        while (1)
        {
          v96 = v93[1];
          if (v96 == (uint64_t *)v10)
          {
            if (*((unsigned __int8 *)v93 + 16) == (_DWORD)v10)
              goto LABEL_109;
          }
          else if (((unint64_t)v96 & v94) != v91)
          {
            goto LABEL_121;
          }
          v93 = (uint64_t **)*v93;
          if (!v93)
            goto LABEL_121;
        }
      }
      do
      {
        v95 = (unint64_t)v93[1];
        if (v95 == v10)
        {
          if (*((unsigned __int8 *)v93 + 16) == (_DWORD)v10)
          {
LABEL_109:
            v97 = v93[3];
            v98 = *v97;
            *(_QWORD *)(v98 + 8) = v97[1];
            *(_QWORD *)v97[1] = v98;
            --*((_QWORD *)v78 + 8);
            v99 = (std::__shared_weak_count *)v97[6];
            if (v99)
            {
              v100 = (unint64_t *)&v99->__shared_owners_;
              do
                v101 = __ldaxr(v100);
              while (__stlxr(v101 - 1, v100));
              if (!v101)
              {
                ((void (*)(std::__shared_weak_count *))v99->__on_zero_shared)(v99);
                std::__shared_weak_count::__release_weak(v99);
              }
            }
            v102 = (std::__shared_weak_count *)v97[4];
            if (v102)
            {
              v103 = (unint64_t *)&v102->__shared_owners_;
              do
                v104 = __ldaxr(v103);
              while (__stlxr(v104 - 1, v103));
              if (!v104)
              {
                ((void (*)(std::__shared_weak_count *))v102->__on_zero_shared)(v102);
                std::__shared_weak_count::__release_weak(v102);
              }
            }
            operator delete(v97);
            std::__hash_table<std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>,std::__unordered_map_hasher<gdc::LayerDataRequestKey,std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>,gdc::LayerDataRequestKeyHash,std::equal_to<gdc::LayerDataRequestKey>,true>,std::__unordered_map_equal<gdc::LayerDataRequestKey,std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>,std::equal_to<gdc::LayerDataRequestKey>,gdc::LayerDataRequestKeyHash,true>,std::allocator<std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>>>::remove((uint64_t)v207, v83, v93);
            if (v207[0])
              operator delete(v207[0]);
            break;
          }
        }
        else
        {
          if (v95 >= *(_QWORD *)&v87)
            v95 %= *(_QWORD *)&v87;
          if (v95 != v91)
            break;
        }
        v93 = (uint64_t **)*v93;
      }
      while (v93);
    }
  }
LABEL_121:
  v105 = operator new(0x38uLL);
  v106 = v105;
  v105[16] = v10;
  v107 = v204;
  *((_QWORD *)v105 + 3) = v203;
  *((_QWORD *)v105 + 4) = v107;
  if (v107)
  {
    v108 = (unint64_t *)&v107->__shared_owners_;
    do
      v109 = __ldxr(v108);
    while (__stxr(v109 + 1, v108));
  }
  v110 = v206;
  *((_QWORD *)v105 + 5) = v205;
  *((_QWORD *)v105 + 6) = v110;
  if (v110)
  {
    v111 = (unint64_t *)&v110->__shared_owners_;
    do
      v112 = __ldxr(v111);
    while (__stxr(v112 + 1, v111));
  }
  *(_QWORD *)v105 = v82;
  v113 = (_QWORD *)*((_QWORD *)v78 + 7);
  *((_QWORD *)v105 + 1) = v113;
  *v113 = v105;
  v114 = *((_QWORD *)v78 + 8) + 1;
  *((_QWORD *)v78 + 7) = v105;
  *((_QWORD *)v78 + 8) = v114;
  v115 = *((_QWORD *)v78 + 2);
  if (v115)
  {
    v116 = (uint8x8_t)vcnt_s8((int8x8_t)v115);
    v116.i16[0] = vaddlv_u8(v116);
    if (v116.u32[0] > 1uLL)
    {
      v82 = v10;
      if (v115 <= v10)
        v82 = v10 % v115;
    }
    else
    {
      v82 = ((_DWORD)v115 - 1) & v10;
    }
    v117 = *(uint64_t ****)(*((_QWORD *)v78 + 1) + 8 * v82);
    if (v117)
    {
      v118 = *v117;
      if (v118)
      {
        if (v116.u32[0] < 2uLL)
        {
          while (1)
          {
            v120 = v118[1];
            if (v120 == (uint64_t *)v10)
            {
              if (*((unsigned __int8 *)v118 + 16) == (_DWORD)v10)
                goto LABEL_215;
            }
            else if (((unint64_t)v120 & (v115 - 1)) != v82)
            {
              goto LABEL_148;
            }
            v118 = (uint64_t **)*v118;
            if (!v118)
              goto LABEL_148;
          }
        }
        do
        {
          v119 = (unint64_t)v118[1];
          if (v119 == v10)
          {
            if (*((unsigned __int8 *)v118 + 16) == (_DWORD)v10)
              goto LABEL_215;
          }
          else
          {
            if (v119 >= v115)
              v119 %= v115;
            if (v119 != v82)
              break;
          }
          v118 = (uint64_t **)*v118;
        }
        while (v118);
      }
    }
  }
LABEL_148:
  v121 = operator new(0x20uLL);
  *v121 = 0;
  v121[1] = v10;
  *((_BYTE *)v121 + 16) = v10;
  v121[3] = v106;
  v122 = (float)(unint64_t)(*((_QWORD *)v78 + 4) + 1);
  v123 = *((float *)v78 + 10);
  if (v115 && (float)(v123 * (float)v115) >= v122)
  {
    v10 = v82;
    goto LABEL_205;
  }
  v124 = 1;
  if (v115 >= 3)
    v124 = (v115 & (v115 - 1)) != 0;
  v125 = v124 | (2 * v115);
  v126 = vcvtps_u32_f32(v122 / v123);
  if (v125 <= v126)
    prime = v126;
  else
    prime = v125;
  if (prime == 1)
  {
    prime = 2;
  }
  else if ((prime & (prime - 1)) != 0)
  {
    prime = std::__next_prime(prime);
    v115 = *((_QWORD *)v78 + 2);
  }
  if (prime <= v115)
  {
    if (prime >= v115)
      goto LABEL_201;
    v140 = vcvtps_u32_f32((float)*((unint64_t *)v78 + 4) / *((float *)v78 + 10));
    if (v115 < 3 || (v141 = (uint8x8_t)vcnt_s8((int8x8_t)v115), v141.i16[0] = vaddlv_u8(v141), v141.u32[0] > 1uLL))
    {
      v140 = std::__next_prime(v140);
    }
    else
    {
      v142 = 1 << -(char)__clz(v140 - 1);
      if (v140 >= 2)
        v140 = v142;
    }
    if (prime <= v140)
      prime = v140;
    if (prime >= v115)
      goto LABEL_201;
    if (!prime)
    {
      v147 = (void *)*((_QWORD *)v78 + 1);
      *((_QWORD *)v78 + 1) = 0;
      if (v147)
        operator delete(v147);
      *((_QWORD *)v78 + 2) = 0;
      goto LABEL_201;
    }
  }
  if (prime >> 61)
    std::__throw_bad_array_new_length[abi:nn180100]();
  v128 = operator new(8 * prime);
  v129 = (void *)*((_QWORD *)v78 + 1);
  *((_QWORD *)v78 + 1) = v128;
  if (v129)
    operator delete(v129);
  v130 = 0;
  *((_QWORD *)v78 + 2) = prime;
  do
    *(_QWORD *)(*((_QWORD *)v78 + 1) + 8 * v130++) = 0;
  while (prime != v130);
  v132 = v78 + 24;
  v131 = (_QWORD *)*((_QWORD *)v78 + 3);
  if (v131)
  {
    v133 = v131[1];
    v134 = prime - 1;
    if ((prime & (prime - 1)) == 0)
    {
      v135 = v133 & v134;
      *(_QWORD *)(*((_QWORD *)v78 + 1) + 8 * v135) = v132;
      while (1)
      {
        v136 = (_QWORD *)*v131;
        if (!*v131)
          break;
        v137 = v136[1] & v134;
        if (v137 == v135)
        {
          v131 = (_QWORD *)*v131;
        }
        else
        {
          v138 = *((_QWORD *)v78 + 1);
          if (*(_QWORD *)(v138 + 8 * v137))
          {
            *v131 = *v136;
            v139 = 8 * v137;
            *v136 = **(_QWORD **)(*((_QWORD *)v78 + 1) + v139);
            **(_QWORD **)(*((_QWORD *)v78 + 1) + v139) = v136;
          }
          else
          {
            *(_QWORD *)(v138 + 8 * v137) = v131;
            v131 = v136;
            v135 = v137;
          }
        }
      }
      goto LABEL_201;
    }
    if (v133 >= prime)
      v133 %= prime;
    *(_QWORD *)(*((_QWORD *)v78 + 1) + 8 * v133) = v132;
    v143 = (_QWORD *)*v131;
    if (!*v131)
      goto LABEL_201;
    do
    {
      v145 = v143[1];
      if (v145 >= prime)
        v145 %= prime;
      if (v145 != v133)
      {
        v146 = *((_QWORD *)v78 + 1);
        if (!*(_QWORD *)(v146 + 8 * v145))
        {
          *(_QWORD *)(v146 + 8 * v145) = v131;
          goto LABEL_187;
        }
        *v131 = *v143;
        v144 = 8 * v145;
        *v143 = **(_QWORD **)(*((_QWORD *)v78 + 1) + v144);
        **(_QWORD **)(*((_QWORD *)v78 + 1) + v144) = v143;
        v143 = v131;
      }
      v145 = v133;
LABEL_187:
      v131 = v143;
      v143 = (_QWORD *)*v143;
      v133 = v145;
    }
    while (v143);
  }
LABEL_201:
  v115 = *((_QWORD *)v78 + 2);
  if ((v115 & (v115 - 1)) != 0)
  {
    if (v115 <= v10)
      v10 %= v115;
  }
  else
  {
    v10 = ((_DWORD)v115 - 1) & v10;
  }
LABEL_205:
  v148 = *((_QWORD *)v78 + 1);
  v149 = *(_QWORD **)(v148 + 8 * v10);
  if (v149)
  {
    *v121 = *v149;
  }
  else
  {
    *v121 = *((_QWORD *)v78 + 3);
    *((_QWORD *)v78 + 3) = v121;
    *(_QWORD *)(v148 + 8 * v10) = v78 + 24;
    if (!*v121)
      goto LABEL_214;
    v150 = *(_QWORD *)(*v121 + 8);
    if ((v115 & (v115 - 1)) != 0)
    {
      if (v150 >= v115)
        v150 %= v115;
    }
    else
    {
      v150 &= v115 - 1;
    }
    v149 = (_QWORD *)(*((_QWORD *)v78 + 1) + 8 * v150);
  }
  *v149 = v121;
LABEL_214:
  ++*((_QWORD *)v78 + 4);
LABEL_215:
  if (v110)
  {
    v151 = (unint64_t *)&v110->__shared_owners_;
    do
      v152 = __ldaxr(v151);
    while (__stlxr(v152 - 1, v151));
    if (!v152)
    {
      ((void (*)(std::__shared_weak_count *))v110->__on_zero_shared)(v110);
      std::__shared_weak_count::__release_weak(v110);
    }
  }
  v153 = v204;
  if (v204)
  {
    v154 = (unint64_t *)&v204->__shared_owners_;
    do
      v155 = __ldaxr(v154);
    while (__stlxr(v155 - 1, v154));
    if (!v155)
    {
      ((void (*)(std::__shared_weak_count *))v153->__on_zero_shared)(v153);
      v156 = v153;
LABEL_226:
      std::__shared_weak_count::__release_weak(v156);
    }
  }
  while (*((_QWORD *)v78 + 8) > *(_QWORD *)v78)
  {
    v157 = *((_QWORD *)v78 + 6);
    v158 = *(unsigned __int8 *)(v157 + 16);
    v159 = *(std::__shared_weak_count **)(v157 + 32);
    if (v159)
    {
      v160 = (unint64_t *)&v159->__shared_owners_;
      do
        v161 = __ldxr(v160);
      while (__stxr(v161 + 1, v160));
    }
    v162 = *(std::__shared_weak_count **)(v157 + 48);
    if (v162)
    {
      v163 = (unint64_t *)&v162->__shared_owners_;
      do
        v164 = __ldxr(v163);
      while (__stxr(v164 + 1, v163));
    }
    v165 = (uint64_t *)*((_QWORD *)v78 + 6);
    v166 = *v165;
    *(_QWORD *)(v166 + 8) = v165[1];
    *(_QWORD *)v165[1] = v166;
    --*((_QWORD *)v78 + 8);
    v167 = (std::__shared_weak_count *)v165[6];
    if (!v167)
      goto LABEL_238;
    v168 = (unint64_t *)&v167->__shared_owners_;
    do
      v169 = __ldaxr(v168);
    while (__stlxr(v169 - 1, v168));
    if (!v169)
    {
      ((void (*)(std::__shared_weak_count *))v167->__on_zero_shared)(v167);
      std::__shared_weak_count::__release_weak(v167);
      v170 = (std::__shared_weak_count *)v165[4];
      if (v170)
      {
LABEL_239:
        v171 = (unint64_t *)&v170->__shared_owners_;
        do
          v172 = __ldaxr(v171);
        while (__stlxr(v172 - 1, v171));
        if (!v172)
        {
          ((void (*)(std::__shared_weak_count *))v170->__on_zero_shared)(v170);
          std::__shared_weak_count::__release_weak(v170);
        }
      }
    }
    else
    {
LABEL_238:
      v170 = (std::__shared_weak_count *)v165[4];
      if (v170)
        goto LABEL_239;
    }
    operator delete(v165);
    v173 = *(int8x8_t *)(v78 + 16);
    if (v173)
    {
      v174 = (uint8x8_t)vcnt_s8(v173);
      v174.i16[0] = vaddlv_u8(v174);
      if (v174.u32[0] > 1uLL)
      {
        v175 = v158;
        if (*(_QWORD *)&v173 <= v158)
          v175 = v158 % *(_QWORD *)&v173;
      }
      else
      {
        v175 = (v173.i32[0] - 1) & v158;
      }
      v176 = *(uint64_t ****)(*((_QWORD *)v78 + 1) + 8 * v175);
      if (v176)
      {
        v177 = *v176;
        if (*v176)
        {
          if (v174.u32[0] < 2uLL)
          {
            v178 = *(_QWORD *)&v173 - 1;
            while (1)
            {
              v180 = v177[1];
              if (v180 == (uint64_t *)v158)
              {
                if (*((unsigned __int8 *)v177 + 16) == (_DWORD)v158)
                  goto LABEL_265;
              }
              else if (((unint64_t)v180 & v178) != v175)
              {
                goto LABEL_267;
              }
              v177 = (uint64_t **)*v177;
              if (!v177)
                goto LABEL_267;
            }
          }
          do
          {
            v179 = (unint64_t)v177[1];
            if (v179 == v158)
            {
              if (*((unsigned __int8 *)v177 + 16) == (_DWORD)v158)
              {
LABEL_265:
                std::__hash_table<std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>,std::__unordered_map_hasher<gdc::LayerDataRequestKey,std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>,gdc::LayerDataRequestKeyHash,std::equal_to<gdc::LayerDataRequestKey>,true>,std::__unordered_map_equal<gdc::LayerDataRequestKey,std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>,std::equal_to<gdc::LayerDataRequestKey>,gdc::LayerDataRequestKeyHash,true>,std::allocator<std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>>>::remove((uint64_t)v207, v83, v177);
                if (v207[0])
                  operator delete(v207[0]);
                goto LABEL_267;
              }
            }
            else
            {
              if (v179 >= *(_QWORD *)&v173)
                v179 %= *(_QWORD *)&v173;
              if (v179 != v175)
                goto LABEL_267;
            }
            v177 = (uint64_t **)*v177;
          }
          while (v177);
        }
      }
    }
    if (!v162)
      goto LABEL_271;
LABEL_267:
    v181 = (unint64_t *)&v162->__shared_owners_;
    do
      v182 = __ldaxr(v181);
    while (__stlxr(v182 - 1, v181));
    if (!v182)
    {
      ((void (*)(std::__shared_weak_count *))v162->__on_zero_shared)(v162);
      std::__shared_weak_count::__release_weak(v162);
      if (v159)
      {
LABEL_272:
        v183 = (unint64_t *)&v159->__shared_owners_;
        do
          v184 = __ldaxr(v183);
        while (__stlxr(v184 - 1, v183));
        if (!v184)
        {
          ((void (*)(std::__shared_weak_count *))v159->__on_zero_shared)(v159);
          v156 = v159;
          goto LABEL_226;
        }
      }
    }
    else
    {
LABEL_271:
      if (v159)
        goto LABEL_272;
    }
  }
  if (v197)
  {
    v185 = (unint64_t *)&v197->__shared_owners_;
    do
      v186 = __ldaxr(v185);
    while (__stlxr(v186 - 1, v185));
    if (!v186)
    {
      ((void (*)(std::__shared_weak_count *))v197->__on_zero_shared)(v197);
      std::__shared_weak_count::__release_weak(v197);
    }
  }
  if (v196)
  {
    v187 = (unint64_t *)&v196->__shared_owners_;
    do
      v188 = __ldaxr(v187);
    while (__stlxr(v188 - 1, v187));
    if (!v188)
    {
      ((void (*)(std::__shared_weak_count *))v196->__on_zero_shared)(v196);
      std::__shared_weak_count::__release_weak(v196);
    }
  }
  v189 = v200;
  os_unfair_lock_unlock(&p_simplifiedGeometryCacheLock->_lock);
  if (v189)
  {
    v190 = (unint64_t *)&v189->__shared_owners_;
    do
      v191 = __ldaxr(v190);
    while (__stlxr(v191 - 1, v190));
    if (!v191)
    {
      ((void (*)(std::__shared_weak_count *))v189->__on_zero_shared)(v189);
      std::__shared_weak_count::__release_weak(v189);
    }
  }
LABEL_33:
  v30 = v202;
  if (v202)
  {
    v31 = (unint64_t *)&v202->__shared_owners_;
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  return result;
}

- (Range<signed)worldIndexes
{
  return self->_worldIndexes;
}

- (void).cxx_destruct
{
  _QWORD *value;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  double *begin;
  void *v8;

  value = self->_simplifiedGeometryCache.__ptr_.__value_;
  self->_simplifiedGeometryCache.__ptr_.__value_ = 0;
  if (value)
  {
    std::__list_imp<std::pair<unsigned char,PolylineWithElevation>>::clear(value + 6);
    v4 = (_QWORD *)value[3];
    if (v4)
    {
      do
      {
        v5 = (_QWORD *)*v4;
        operator delete(v4);
        v4 = v5;
      }
      while (v5);
    }
    v6 = (void *)value[1];
    value[1] = 0;
    if (v6)
      operator delete(v6);
    MEMORY[0x1A1AF4E00](value, 0x10A0C407D9D2971);
  }
  begin = self->_elevations.__begin_;
  if (begin)
  {
    self->_elevations.__end_ = begin;
    operator delete(begin);
  }
  v8 = self->_points.__begin_;
  if (v8)
  {
    self->_points.__end_ = v8;
    operator delete(v8);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 8) = 0;
  *((_DWORD *)self + 18) = 0;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  return self;
}

@end
