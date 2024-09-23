@implementation VKVectorOverlayPolygon

- (VKVectorOverlayPolygon)initWithMapPoints:(id *)a3 count:(unint64_t)a4
{
  char *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  int32x2_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  double v14;
  uint64_t v15;
  const $F24F406B2B787EFB06265DBA3D28CBD5 *v16;
  double v17;
  double v18;
  double var0;
  double var1;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double *p_var1;
  unint64_t v27;
  unint64_t v28;
  double *v29;
  unint64_t v30;
  double *v31;
  double *v32;
  double *v33;
  signed int v34;
  signed int v35;
  unint64_t v36;
  const $F24F406B2B787EFB06265DBA3D28CBD5 *v37;
  double v38;
  double v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  char *v43;
  double *v44;
  char *v45;
  char *v46;
  _QWORD *v47;
  _QWORD *v48;
  std::__shared_weak_count *v49;
  unint64_t *p_shared_owners;
  unint64_t v51;
  objc_super v53;

  if (!a4)
  {
    v6 = 0;
    goto LABEL_60;
  }
  v53.receiver = self;
  v53.super_class = (Class)VKVectorOverlayPolygon;
  v6 = -[VKVectorOverlayPolygon init](&v53, sel_init);
  if (!v6)
  {
    self = 0;
    goto LABEL_60;
  }
  v7 = operator new();
  *(_QWORD *)v7 = 4;
  *(_OWORD *)(v7 + 8) = 0u;
  *(_OWORD *)(v7 + 24) = 0u;
  *(_DWORD *)(v7 + 40) = 1065353216;
  *(_QWORD *)(v7 + 48) = v7 + 48;
  *(_QWORD *)(v7 + 56) = v7 + 48;
  *(_QWORD *)(v7 + 64) = 0;
  v8 = (_QWORD *)*((_QWORD *)v6 + 4);
  *((_QWORD *)v6 + 4) = v7;
  if (v8)
  {
    v9 = geo::Cache<unsigned long,std::shared_ptr<md::LabelIcon>,std::hash<unsigned long>,geo::LRUPolicy>::~Cache(v8);
    MEMORY[0x1A1AF4E00](v9, 0x10A0C407D9D2971);
  }
  v10 = vmovn_s64(vcgeq_f64(vabdq_f64((float64x2_t)a3[a4 - 1], *(float64x2_t *)a3), (float64x2_t)vdupq_n_s64(0x3E45798EE2308C3AuLL)));
  v11 = (v10.i8[0] | v10.i8[4]) & 1;
  v12 = a4 - 1;
  if (a4 > 1)
  {
    v15 = 0;
    v13 = a4 & 0xFFFFFFFFFFFFFFFELL;
    v16 = a3 + 1;
    v17 = 0.0;
    v18 = 0.0;
    do
    {
      var0 = v16[-1].var0;
      var1 = v16[-1].var1;
      v21 = v16->var0;
      v22 = v16->var1;
      v16 += 2;
      if (v12 == v15)
        v23 = 0;
      else
        v23 = v15 + 1;
      v24 = v15 + 2;
      if (a4 - 2 == v15)
        v25 = 0;
      else
        v25 = v15 + 2;
      v17 = (a3[v23].var0 - var0) / (a3[v23].var1 + var1) + v17;
      v18 = (a3[v25].var0 - v21) / (a3[v25].var1 + v22) + v18;
      v15 = v24;
    }
    while (v13 != v24);
    v14 = v18 + v17;
    if (v13 == a4)
      goto LABEL_23;
  }
  else
  {
    v13 = 0;
    v14 = 0.0;
  }
  p_var1 = &a3[v13].var1;
  do
  {
    if (v12 == v13)
      v27 = 0;
    else
      v27 = v13 + 1;
    v14 = (a3[v27].var0 - *(p_var1 - 1)) / (a3[v27].var1 + *p_var1) + v14;
    p_var1 += 2;
    ++v13;
  }
  while (a4 != v13);
LABEL_23:
  v28 = v11 + a4;
  if (v11 + a4)
  {
    if (v28 >> 60)
      abort();
    v29 = (double *)operator new(16 * v28);
    v30 = 0;
    v31 = &v29[2 * v28];
    *((_WORD *)v6 + 12) = 256;
    v32 = (double *)MEMORY[0x1E0D266F8];
    v33 = v29;
    do
    {
      v36 = v28 + ~v30;
      if (v14 < 0.0)
        v36 = v30;
      v37 = &a3[v36 % a4];
      v38 = v37->var0 / *v32;
      v39 = 1.0 - v37->var1 / v32[1];
      if (v29 < v31)
      {
        *v29 = v38;
        v29[1] = v39;
        v29 += 2;
      }
      else
      {
        v40 = ((char *)v29 - (char *)v33) >> 4;
        v41 = v40 + 1;
        if ((unint64_t)(v40 + 1) >> 60)
          abort();
        if (v31 - v33 > v41)
          v41 = v31 - v33;
        if ((unint64_t)((char *)v31 - (char *)v33) >= 0x7FFFFFFFFFFFFFF0)
          v42 = 0xFFFFFFFFFFFFFFFLL;
        else
          v42 = v41;
        if (v42)
        {
          if (v42 >> 60)
            std::__throw_bad_array_new_length[abi:nn180100]();
          v43 = (char *)operator new(16 * v42);
        }
        else
        {
          v43 = 0;
        }
        v44 = (double *)&v43[16 * v40];
        *v44 = v38;
        v44[1] = v39;
        if (v29 == v33)
        {
          v46 = &v43[16 * v40];
        }
        else
        {
          v45 = &v43[16 * v40];
          do
          {
            v46 = v45 - 16;
            *((_OWORD *)v45 - 1) = *((_OWORD *)v29 - 1);
            v29 -= 2;
            v45 -= 16;
          }
          while (v29 != v33);
        }
        v31 = (double *)&v43[16 * v42];
        v29 = v44 + 2;
        if (v33)
          operator delete(v33);
        v33 = (double *)v46;
      }
      v34 = vcvtmd_s64_f64(v38);
      if (v6[24] < v34)
        LOBYTE(v34) = v6[24];
      v6[24] = v34;
      v35 = vcvtpd_s64_f64(v38);
      if (v6[25] > v35)
        LOBYTE(v35) = v6[25];
      v6[25] = v35;
      ++v30;
    }
    while (v30 != v28);
  }
  else
  {
    v31 = 0;
    v29 = 0;
    v33 = 0;
    *((_WORD *)v6 + 12) = 256;
  }
  v47 = (_QWORD *)operator new();
  *v47 = v33;
  v47[1] = v29;
  v47[2] = v31;
  v48 = (_QWORD *)operator new();
  *v48 = &off_1E42E7640;
  v48[1] = 0;
  v48[2] = 0;
  v48[3] = v47;
  v49 = (std::__shared_weak_count *)*((_QWORD *)v6 + 2);
  *((_QWORD *)v6 + 1) = v47;
  *((_QWORD *)v6 + 2) = v48;
  if (v49)
  {
    p_shared_owners = (unint64_t *)&v49->__shared_owners_;
    do
      v51 = __ldaxr(p_shared_owners);
    while (__stlxr(v51 - 1, p_shared_owners));
    if (!v51)
    {
      ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
      std::__shared_weak_count::__release_weak(v49);
    }
  }
  self = v6;
  v6 = (char *)self;
LABEL_60:

  return (VKVectorOverlayPolygon *)v6;
}

- (shared_ptr<geo::Polygon2<double>>)simplifiedGeometryAtZoomLevel:(unsigned __int8)a3
{
  void **v3;
  unsigned int v4;
  void **v6;
  unfair_lock *p_simplifiedGeometryCacheLock;
  _QWORD *value;
  uint64_t *v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  uint64_t ***v13;
  uint64_t **v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t *v22;
  unint64_t *v23;
  unint64_t v24;
  double v25;
  char **ptr;
  char *v27;
  uint64_t v28;
  VKVectorOverlayPolygon *v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  unint64_t v34;
  _QWORD *v35;
  uint64_t *v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  unint64_t v43;
  BOOL v44;
  unint64_t v45;
  unint64_t v46;
  char *v47;
  char *v48;
  char *v49;
  unint64_t v50;
  VKVectorOverlayPolygon *v51;
  char *v52;
  std::__shared_weak_count *v53;
  unint64_t *p_shared_owners;
  float64_t v55;
  uint64_t v56;
  _QWORD *v57;
  float *v58;
  float64_t v59;
  unint64_t *v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  char *v64;
  __n128 v65;
  char *v66;
  unint64_t v67;
  uint64_t v68;
  char *v69;
  unint64_t v70;
  unint64_t *v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  double *v75;
  BOOL v76;
  char *v77;
  unint64_t v78;
  unint64_t v79;
  char *v80;
  char *v81;
  char *v82;
  char *v83;
  BOOL v84;
  unint64_t v85;
  unint64_t v86;
  char *v87;
  char *v88;
  char *v89;
  char *v90;
  float64_t v91;
  unint64_t *v92;
  unint64_t v93;
  unint64_t *v94;
  unint64_t v95;
  std::__shared_weak_count *cntrl;
  unint64_t v97;
  uint64_t v98;
  char *v99;
  int v100;
  float64x2_t v101;
  uint64_t **v102;
  uint64_t **v103;
  float64x2_t *v104;
  float64x2_t *v105;
  uint64_t **v106;
  float64x2_t v107;
  uint64_t *v108;
  uint64_t *v109;
  uint64_t **v110;
  uint64_t *v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v122;
  BOOL v124;
  uint64_t v125;
  uint64_t v126;
  double v128;
  double v129;
  BOOL v130;
  BOOL v131;
  double *v132;
  double *v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v143;
  uint64_t v146;
  uint64_t v147;
  double v149;
  double v150;
  uint64_t v153;
  float64x2_t v154;
  uint64_t *v155;
  float64x2_t v156;
  uint64_t *v157;
  uint64_t *v158;
  int v159;
  float64_t *v160;
  uint64_t *v161;
  float64x2_t v163;
  float64x2_t v164;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  float64x2_t *v173;
  uint64_t v174;
  uint64_t *v175;
  uint64_t v176;
  _QWORD *v177;
  uint64_t *v178;
  _QWORD *v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v192;
  double v195;
  double v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v200;
  uint64_t v201;
  uint64_t *v204;
  uint64_t *v205;
  uint64_t **v206;
  VKVectorOverlayPolygon *v207;
  unint64_t v208;
  unint64_t v209;
  float64_t v210;
  unint64_t *v211;
  unint64_t v212;
  unint64_t *v213;
  unint64_t v214;
  unint64_t *v215;
  unint64_t v216;
  unint64_t *v217;
  unint64_t v218;
  void *v219;
  __shared_weak_count *v220;
  VKVectorOverlayPolygon *v221;
  unint64_t *v222;
  std::__shared_weak_count *v223;
  unfair_lock *v224;
  void **v225;
  float64_t v226;
  unint64_t v227;
  float64x2_t v228;
  std::__shared_weak_count *v229;
  std::__shared_weak_count *v230;
  _QWORD *v231;
  std::__shared_weak_count *v232;
  uint64_t v233;
  unsigned __int8 v234;
  double v235;
  double v236;
  double v237;
  double v238;
  float64x2_t v239;
  float64x2_t v240;
  uint64_t **v241;
  float64x2_t *v242;
  uint64_t v243;
  float64x2_t v244;
  float64x2_t v245;
  shared_ptr<geo::Polygon2<double>> result;

  v4 = a3;
  v6 = v3;
  v234 = a3;
  p_simplifiedGeometryCacheLock = &self->_simplifiedGeometryCacheLock;
  os_unfair_lock_lock(&self->_simplifiedGeometryCacheLock._lock);
  value = self->_simplifiedGeometryCache.__ptr_.__value_;
  v9 = value + 6;
  v10 = value[2];
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      v12 = v4;
      if (v10 <= v4)
        v12 = v4 % v10;
    }
    else
    {
      v12 = ((_DWORD)v10 - 1) & v4;
    }
    v13 = *(uint64_t ****)(value[1] + 8 * v12);
    if (v13)
    {
      v14 = *v13;
      if (v14)
      {
        if (v11.u32[0] < 2uLL)
        {
          v15 = v10 - 1;
          while (1)
          {
            v17 = v14[1];
            if (v17 == (uint64_t *)v4)
            {
              if (*((unsigned __int8 *)v14 + 16) == v4)
                goto LABEL_22;
            }
            else if (((unint64_t)v17 & v15) != v12)
            {
              goto LABEL_25;
            }
            v14 = (uint64_t **)*v14;
            if (!v14)
              goto LABEL_25;
          }
        }
        do
        {
          v16 = (unint64_t)v14[1];
          if (v16 == v4)
          {
            if (*((unsigned __int8 *)v14 + 16) == v4)
            {
LABEL_22:
              v9 = (uint64_t *)value[7];
              v18 = v14[3];
              if (v9 != v18)
              {
                v19 = (uint64_t *)v18[1];
                if (v19 != v9)
                {
                  v20 = *v18;
                  *(_QWORD *)(v20 + 8) = v19;
                  *(_QWORD *)v18[1] = v20;
                  v21 = *v9;
                  *(_QWORD *)(v21 + 8) = v18;
                  *v18 = v21;
                  *v9 = (uint64_t)v18;
                  v18[1] = (uint64_t)v9;
                  v9 = (uint64_t *)value[7];
                  value = self->_simplifiedGeometryCache.__ptr_.__value_;
                }
              }
              break;
            }
          }
          else
          {
            if (v16 >= v10)
              v16 %= v10;
            if (v16 != v12)
              break;
          }
          v14 = (uint64_t **)*v14;
        }
        while (v14);
      }
    }
  }
LABEL_25:
  if (value + 6 != v9)
  {
    v22 = (unint64_t *)v9[4];
    *v6 = (void *)v9[3];
    v6[1] = v22;
    if (v22)
    {
      v23 = v22 + 1;
      do
        v24 = __ldxr(v23);
      while (__stxr(v24 + 1, v23));
    }
    goto LABEL_324;
  }
  if (v4 <= 0x12)
    v25 = (double)(1 << (19 - v4)) / *MEMORY[0x1E0D266F8];
  else
    v25 = 1.0e-10;
  ptr = (char **)self->_geometry.__ptr_;
  v27 = ptr[1];
  v28 = v27 - *ptr;
  if (v27 == *ptr)
  {
    v29 = self;
    v30 = 0;
    v32 = 0;
    v31 = 0;
    v33 = ptr[1];
  }
  else
  {
    if (v28 < 0)
      abort();
    v29 = self;
    v30 = (char *)operator new(v27 - *ptr);
    v31 = &v30[16 * (v28 >> 4)];
    v32 = &v30[v28];
    v27 = *ptr;
    v33 = ptr[1];
  }
  v34 = (v33 - v27) >> 4;
  if ((unint64_t)(v33 - v27) > 0x2F)
  {
    v233 = 1;
    *(_QWORD *)v30 = *(_QWORD *)v27;
    *((_QWORD *)v30 + 1) = *((_QWORD *)v27 + 1);
    v39 = v34 - 1;
    geo::dpSimplify<geo::Mercator2<double>>((uint64_t)v27, 0, v34 - 1, (uint64_t)v30, &v233, v25);
    v40 = &v27[16 * v39];
    v41 = v233;
    v34 = ++v233;
    v42 = &v30[16 * v41];
    *(_QWORD *)v42 = *(_QWORD *)v40;
    *((_QWORD *)v42 + 1) = *((_QWORD *)v40 + 1);
  }
  else
  {
    if (v33 != v27)
    {
      v35 = v30 + 8;
      v36 = (uint64_t *)(v27 + 8);
      v37 = v34;
      do
      {
        *(v35 - 1) = *(v36 - 1);
        v38 = *v36;
        v36 += 2;
        *v35 = v38;
        v35 += 2;
        --v37;
      }
      while (v37);
    }
    v233 = v34;
  }
  v43 = (v32 - v30) >> 4;
  v44 = v34 >= v43;
  v45 = v34 - v43;
  if (v34 <= v43)
  {
    v52 = &v30[16 * v34];
    if (v44)
      v49 = v32;
    else
      v49 = v52;
    goto LABEL_61;
  }
  if (v45 <= (v31 - v32) >> 4)
  {
    v49 = &v32[16 * v45];
LABEL_61:
    v51 = v29;
    goto LABEL_62;
  }
  if (v34 >> 60)
    abort();
  if ((v31 - v30) >> 3 > v34)
    v34 = (v31 - v30) >> 3;
  if ((unint64_t)(v31 - v30) >= 0x7FFFFFFFFFFFFFF0)
    v46 = 0xFFFFFFFFFFFFFFFLL;
  else
    v46 = v34;
  if (v46 >> 60)
LABEL_326:
    std::__throw_bad_array_new_length[abi:nn180100]();
  v47 = (char *)operator new(16 * v46);
  v48 = &v47[16 * v43];
  v31 = &v47[16 * v46];
  v49 = &v48[16 * v45];
  if (v32 != v30)
  {
    v50 = (v32 - v30 - 16) & 0xFFFFFFFFFFFFFFF0;
    v48 = &v47[v32 - v30 - v50 - 16];
    memcpy(v48, &v32[-v50 - 16], v50 + 16);
  }
  v51 = v29;
  if (v30)
    operator delete(v30);
  v30 = v48;
LABEL_62:
  v225 = v6;
  v53 = (std::__shared_weak_count *)operator new(0x30uLL);
  v53->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v53->__shared_owners_;
  v53->__shared_weak_owners_ = 0;
  v53->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42DE458;
  v53[1].__vftable = (std::__shared_weak_count_vtbl *)v30;
  *(_QWORD *)&v55 = &v53[1];
  v53[1].__shared_owners_ = (uint64_t)v49;
  v53[1].__shared_weak_owners_ = (uint64_t)v31;
  v231 = &v53[1].__vftable;
  v232 = v53;
  v56 = v49 - v30;
  v57 = v51->_geometry.__ptr_;
  if (v49 - v30 == v57[1] - *v57)
  {
    v58 = (float *)v51->_simplifiedGeometryCache.__ptr_.__value_;
    goto LABEL_64;
  }
  *(_QWORD *)&v226 = &v53[1];
  if ((unint64_t)v56 > 0x2F)
  {
    v222 = (unint64_t *)&v53->__shared_owners_;
    v223 = v53;
    v224 = p_simplifiedGeometryCacheLock;
    if (v56 < 0)
      abort();
    v63 = v56 >> 4;
    v64 = (char *)operator new(24 * (v56 >> 4));
    v66 = v64;
    v221 = v51;
    v67 = v63 - 1;
    if (*(_OWORD *)v30 != *(_OWORD *)&v30[16 * v63 - 16])
      v67 = v63;
    v227 = v67;
    if (v67)
    {
      v68 = 0;
      v69 = &v64[24 * v63];
      v70 = (unint64_t)v64;
      while (1)
      {
        v71 = (unint64_t *)(**(_QWORD **)&v55 + 16 * v68);
        v72 = v68 + 1;
        v73 = v63;
        v74 = (v68 + 1) % v63;
        v75 = (double *)(**(_QWORD **)&v55 + 16 * v74);
        v65.n128_u64[0] = *v71;
        if (*(double *)v71 >= *v75)
        {
          if (*(double *)v71 == *v75)
          {
            v65.n128_u64[0] = v71[1];
            v76 = v65.n128_f64[0] < v75[1];
            if (v70 < (unint64_t)v69)
              goto LABEL_81;
          }
          else
          {
            v76 = 0;
            if (v70 < (unint64_t)v69)
            {
LABEL_81:
              *(_QWORD *)v70 = v68;
              *(_QWORD *)(v70 + 8) = v74;
              v77 = (char *)(v70 + 24);
              *(_BYTE *)(v70 + 16) = v76;
              goto LABEL_101;
            }
          }
        }
        else
        {
          v76 = 1;
          if (v70 < (unint64_t)v69)
            goto LABEL_81;
        }
        v78 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v70 - (_QWORD)v66) >> 3) + 1;
        if (v78 > 0xAAAAAAAAAAAAAAALL)
          abort();
        if (0x5555555555555556 * ((v69 - v66) >> 3) > v78)
          v78 = 0x5555555555555556 * ((v69 - v66) >> 3);
        if (0xAAAAAAAAAAAAAAABLL * ((v69 - v66) >> 3) >= 0x555555555555555)
          v79 = 0xAAAAAAAAAAAAAAALL;
        else
          v79 = v78;
        if (v79 > 0xAAAAAAAAAAAAAAALL)
          goto LABEL_326;
        v80 = (char *)operator new(24 * v79);
        v81 = &v80[8 * ((uint64_t)(v70 - (_QWORD)v66) >> 3)];
        *(_QWORD *)v81 = v68;
        *((_QWORD *)v81 + 1) = v74;
        v81[16] = v76;
        if ((char *)v70 == v66)
        {
          v83 = &v80[8 * ((uint64_t)(v70 - (_QWORD)v66) >> 3)];
        }
        else
        {
          v82 = &v80[8 * ((uint64_t)(v70 - (_QWORD)v66) >> 3)];
          do
          {
            v65 = *(__n128 *)(v70 - 24);
            v83 = v82 - 24;
            *(v82 - 8) = *(_BYTE *)(v70 - 8);
            *(__n128 *)(v82 - 24) = v65;
            v70 -= 24;
            v82 -= 24;
          }
          while ((char *)v70 != v66);
        }
        v69 = &v80[24 * v79];
        v77 = v81 + 24;
        if (v66)
          operator delete(v66);
        v66 = v83;
        v55 = v226;
LABEL_101:
        v84 = !v76;
        if (v77 < v69)
        {
          *(_QWORD *)v77 = v74;
          *((_QWORD *)v77 + 1) = v68;
          v70 = (unint64_t)(v77 + 24);
          v77[16] = v84;
          v63 = v73;
        }
        else
        {
          v85 = 0xAAAAAAAAAAAAAAABLL * ((v77 - v66) >> 3) + 1;
          if (v85 > 0xAAAAAAAAAAAAAAALL)
            abort();
          if (0x5555555555555556 * ((v69 - v66) >> 3) > v85)
            v85 = 0x5555555555555556 * ((v69 - v66) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * ((v69 - v66) >> 3) >= 0x555555555555555)
            v86 = 0xAAAAAAAAAAAAAAALL;
          else
            v86 = v85;
          if (v86 > 0xAAAAAAAAAAAAAAALL)
            goto LABEL_326;
          v87 = (char *)operator new(24 * v86);
          v88 = &v87[8 * ((v77 - v66) >> 3)];
          *(_QWORD *)v88 = v74;
          *((_QWORD *)v88 + 1) = v68;
          v88[16] = v84;
          if (v77 == v66)
          {
            v90 = &v87[8 * ((v77 - v66) >> 3)];
            v63 = v73;
          }
          else
          {
            v89 = &v87[8 * ((v77 - v66) >> 3)];
            v63 = v73;
            do
            {
              v65 = *(__n128 *)(v77 - 24);
              v90 = v89 - 24;
              *(v89 - 8) = *(v77 - 8);
              *(__n128 *)(v89 - 24) = v65;
              v77 -= 24;
              v89 -= 24;
            }
            while (v77 != v66);
          }
          v69 = &v87[24 * v86];
          v70 = (unint64_t)(v88 + 24);
          if (v66)
            operator delete(v66);
          v66 = v90;
        }
        v68 = v72;
        if (v72 == v227)
          goto LABEL_134;
      }
    }
    v70 = (unint64_t)v64;
LABEL_134:
    v97 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v70 - (_QWORD)v66) >> 3));
    v239.f64[0] = v55;
    if ((char *)v70 == v66)
      v98 = 0;
    else
      v98 = v97;
    std::__introsort<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*,false>(v66, v70, (uint64_t **)&v239, v98, 1, v65);
    v242 = 0;
    v243 = 0;
    v241 = (uint64_t **)&v242;
    if ((char *)v70 == v66)
    {
      v100 = 0;
      p_simplifiedGeometryCacheLock = v224;
      goto LABEL_296;
    }
    v99 = v66;
    p_simplifiedGeometryCacheLock = v224;
LABEL_142:
    if (v99[16])
    {
      v101 = vsubq_f64(*(float64x2_t *)(**(_QWORD **)&v55 + 16 * *((_QWORD *)v99 + 1)), *(float64x2_t *)(**(_QWORD **)&v55 + 16 * *(_QWORD *)v99));
      v239 = *(float64x2_t *)(**(_QWORD **)&v55 + 16 * *(_QWORD *)v99);
      v240 = v101;
      v228 = v101;
      v102 = (uint64_t **)&v242;
      v103 = (uint64_t **)&v242;
      if (v242)
      {
        v104 = v242;
        while (1)
        {
          while (1)
          {
            v102 = (uint64_t **)v104;
            v105 = v104 + 2;
            if (!geo::Intersect::SHSegmentComparator<double>::operator()(&v239, v104 + 2))
              break;
            v104 = (float64x2_t *)*v102;
            v103 = v102;
            if (!*v102)
              goto LABEL_149;
          }
          if (!geo::Intersect::SHSegmentComparator<double>::operator()(v105, &v239))
            break;
          v103 = v102 + 1;
          v104 = (float64x2_t *)v102[1];
          if (!v104)
            goto LABEL_149;
        }
      }
      else
      {
LABEL_149:
        v106 = (uint64_t **)operator new(0x40uLL);
        v107 = v240;
        *((float64x2_t *)v106 + 2) = v239;
        *((float64x2_t *)v106 + 3) = v107;
        *v106 = 0;
        v106[1] = 0;
        v106[2] = (uint64_t *)v102;
        *v103 = (uint64_t *)v106;
        v108 = (uint64_t *)v106;
        if (*v241)
        {
          v241 = (uint64_t **)*v241;
          v108 = *v103;
        }
        std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>((uint64_t *)v242, v108);
        ++v243;
        if (v241 == v106)
          goto LABEL_216;
        v109 = *v106;
        v110 = v106;
        if (*v106)
        {
          do
          {
            v111 = v109;
            v109 = (uint64_t *)v109[1];
          }
          while (v109);
        }
        else
        {
          do
          {
            v111 = v110[2];
            v124 = *v111 == (_QWORD)v110;
            v110 = (uint64_t **)v111;
          }
          while (v124);
        }
        v112 = *((double *)v111 + 6);
        v113 = *((double *)v111 + 7);
        v114 = -(v228.f64[1] * v112 - v113 * v228.f64[0]);
        if (v114 == 0.0)
          goto LABEL_216;
        v115 = 1.0 / v114;
        v116 = v239.f64[0] + v228.f64[0];
        v117 = *((double *)v111 + 4);
        v118 = *((double *)v111 + 5);
        v119 = v239.f64[1] + v228.f64[1] - v118;
        v120 = -(v119 * v112 - (v239.f64[0] + v228.f64[0] - v117) * v113) * v115;
        if (v120 < 0.0 || v120 > 1.0)
          goto LABEL_216;
        v122 = -((v116 - v117) * v228.f64[1] - v119 * v228.f64[0]) * v115;
        if (v122 < 0.0 || v122 > 1.0)
          goto LABEL_216;
        v124 = v111[4] == *(_QWORD *)&v239.f64[0] && v111[5] == *(_QWORD *)&v239.f64[1];
        if (v124)
          goto LABEL_216;
        v245.f64[0] = v239.f64[0] + v228.f64[0];
        v245.f64[1] = v239.f64[1] + v228.f64[1];
        v126 = v111[4];
        v125 = v111[5];
        if (v126 == *(_QWORD *)&v116 && v125 == COERCE__INT64(v239.f64[1] + v228.f64[1]))
          goto LABEL_216;
        v128 = v117 + v112;
        v129 = v118 + v113;
        v244.f64[0] = v128;
        v244.f64[1] = v129;
        v130 = *(_QWORD *)&v128 == *(_QWORD *)&v239.f64[0] && *(_QWORD *)&v129 == *(_QWORD *)&v239.f64[1];
        if (v130
          || ((v237 = v128,
               v238 = v129,
               v235 = v239.f64[0] + v228.f64[0],
               v236 = v239.f64[1] + v228.f64[1],
               *(_QWORD *)&v128 == *(_QWORD *)&v116)
            ? (v131 = *(_QWORD *)&v129 == COERCE__INT64(v239.f64[1] + v228.f64[1]))
            : (v131 = 0),
              v131))
        {
LABEL_216:
          v132 = (double *)v106[1];
          if (v132)
          {
            do
            {
              v133 = v132;
              v132 = *(double **)v132;
            }
            while (v132);
          }
          else
          {
            do
            {
              v133 = (double *)v106[2];
              v124 = *(_QWORD *)v133 == (_QWORD)v106;
              v106 = (uint64_t **)v133;
            }
            while (!v124);
          }
          if (v133 == (double *)&v242)
            goto LABEL_141;
          v134 = v133[6];
          v135 = v133[7];
          v136 = -(v228.f64[1] * v134 - v135 * v228.f64[0]);
          if (v136 == 0.0)
            goto LABEL_141;
          v137 = v133[4];
          v138 = v133[5];
          v139 = v239.f64[0] + v228.f64[0] - v137;
          v140 = v239.f64[1] + v228.f64[1] - v138;
          v141 = -(v140 * v134 - v139 * v135) * (1.0 / v136);
          if (v141 < 0.0 || v141 > 1.0)
            goto LABEL_141;
          v143 = -(v139 * v228.f64[1] - v140 * v228.f64[0]) * (1.0 / v136);
          if (v143 < 0.0 || v143 > 1.0)
            goto LABEL_141;
          if (*((_QWORD *)v133 + 4) == *(_QWORD *)&v239.f64[0] && *((_QWORD *)v133 + 5) == *(_QWORD *)&v239.f64[1])
            goto LABEL_141;
          v245.f64[0] = v239.f64[0] + v228.f64[0];
          v245.f64[1] = v239.f64[1] + v228.f64[1];
          v147 = *((_QWORD *)v133 + 4);
          v146 = *((_QWORD *)v133 + 5);
          if (v147 == COERCE__INT64(v239.f64[0] + v228.f64[0]) && v146 == COERCE__INT64(v239.f64[1] + v228.f64[1]))
            goto LABEL_141;
          v149 = v137 + v134;
          v150 = v138 + v135;
          v244.f64[0] = v149;
          v244.f64[1] = v150;
          if (*(_QWORD *)&v149 == *(_QWORD *)&v239.f64[0] && *(_QWORD *)&v150 == *(_QWORD *)&v239.f64[1])
            goto LABEL_141;
          v237 = v149;
          v238 = v150;
          v235 = v239.f64[0] + v228.f64[0];
          v236 = v239.f64[1] + v228.f64[1];
          if (*(_QWORD *)&v149 == COERCE__INT64(v239.f64[0] + v228.f64[0])
            && *(_QWORD *)&v150 == COERCE__INT64(v239.f64[1] + v228.f64[1]))
          {
            goto LABEL_141;
          }
        }
      }
LABEL_295:
      v100 = 1;
LABEL_296:
      std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy(v242);
      if (v66)
      {
        operator delete(v66);
        v207 = v221;
        p_shared_owners = v222;
        v58 = (float *)v221->_simplifiedGeometryCache.__ptr_.__value_;
        v53 = v223;
        if ((v100 & 1) == 0)
          goto LABEL_300;
      }
      else
      {
        v207 = v221;
        p_shared_owners = v222;
        v58 = (float *)v221->_simplifiedGeometryCache.__ptr_.__value_;
        v53 = v223;
        if (!v100)
          goto LABEL_300;
      }
      v57 = v207->_geometry.__ptr_;
      v51 = v207;
LABEL_64:
      v59 = *(double *)&v51->_geometry.__cntrl_;
      v230 = *(std::__shared_weak_count **)&v59;
      if (v59 == 0.0)
      {
        v239.f64[1] = 0.0;
      }
      else
      {
        v60 = (unint64_t *)(*(_QWORD *)&v59 + 8);
        do
          v61 = __ldxr(v60);
        while (__stxr(v61 + 1, v60));
        v239.f64[1] = v59;
        do
          v62 = __ldxr(v60);
        while (__stxr(v62 + 1, v60));
      }
      *(_QWORD *)&v239.f64[0] = v57;
      geo::LRUPolicy<unsigned char,std::shared_ptr<geo::Polygon2<double>>,std::hash<unsigned char>>::insert((unint64_t)(v58 + 12), v58 + 2, &v234, &v239);
      v91 = v239.f64[1];
      if (*(_QWORD *)&v239.f64[1])
      {
        v92 = (unint64_t *)(*(_QWORD *)&v239.f64[1] + 8);
        do
          v93 = __ldaxr(v92);
        while (__stlxr(v93 - 1, v92));
        if (!v93)
        {
          (*(void (**)(float64_t))(**(_QWORD **)&v91 + 16))(COERCE_FLOAT64_T(*(_QWORD *)&v91));
          std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v91);
        }
      }
      while (*((_QWORD *)v58 + 8) > *(_QWORD *)v58)
        geo::Cache<unsigned char,std::shared_ptr<geo::Polygon2<double>>,std::hash<unsigned char>,geo::LRUPolicy>::_pop(v58);
      if (v230)
      {
        v94 = (unint64_t *)&v230->__shared_owners_;
        do
          v95 = __ldaxr(v94);
        while (__stlxr(v95 - 1, v94));
        if (!v95)
        {
          ((void (*)(std::__shared_weak_count *))v230->__on_zero_shared)(v230);
          std::__shared_weak_count::__release_weak(v230);
        }
      }
      cntrl = (std::__shared_weak_count *)v51->_geometry.__cntrl_;
      *v225 = v51->_geometry.__ptr_;
      v225[1] = cntrl;
      if (!cntrl)
        goto LABEL_319;
      goto LABEL_317;
    }
    v153 = 16 * *((_QWORD *)v99 + 1);
    v154 = vsubq_f64(*(float64x2_t *)(**(_QWORD **)&v55 + 16 * *(_QWORD *)v99), *(float64x2_t *)(**(_QWORD **)&v55 + v153));
    v239 = *(float64x2_t *)(**(_QWORD **)&v55 + v153);
    v240 = v154;
    v155 = (uint64_t *)v242;
    if (!v242)
      goto LABEL_141;
    v156 = vaddq_f64(v239, v154);
    v157 = (uint64_t *)&v242;
    v158 = (uint64_t *)v242;
    while (1)
    {
      while (1)
      {
        v160 = (float64_t *)(v158 + 4);
        v161 = v157;
        if (v158[4] == *(_QWORD *)&v239.f64[0] && v158[5] == *(_QWORD *)&v239.f64[1])
        {
          v163 = *((float64x2_t *)v158 + 2);
          v164 = vaddq_f64(*((float64x2_t *)v158 + 3), v163);
          v244 = v156;
          v245 = v164;
          if (*(_QWORD *)&v164.f64[0] == *(_QWORD *)&v156.f64[0] && *(_QWORD *)&v164.f64[1] == *(_QWORD *)&v156.f64[1])
            goto LABEL_220;
        }
        else
        {
          v163.f64[0] = *v160;
        }
        if (v163.f64[0] > v239.f64[0])
          break;
        v170 = *((double *)v158 + 5);
        v169 = *((double *)v158 + 6);
        v171 = *((double *)v158 + 7);
        v172 = -(v171 * (v239.f64[0] - v163.f64[0]) - (v239.f64[1] - v170) * v169);
        if (v172 != 0.0)
        {
          if (v172 > 0.0)
            goto LABEL_243;
          goto LABEL_220;
        }
        if (v163.f64[0] == v169 + v163.f64[0])
        {
          if (v170 < v239.f64[1])
            goto LABEL_243;
          goto LABEL_220;
        }
        if (-(v171 * (v239.f64[0] - v163.f64[0] + v154.f64[0]) - (v239.f64[1] - v170 + v154.f64[1]) * v169) <= 0.0)
          goto LABEL_220;
LABEL_243:
        v159 = 1;
        v158 = (uint64_t *)v158[1];
        if (!v158)
        {
LABEL_244:
          if (v157 != (uint64_t *)&v242)
          {
            v173 = v159 ? (float64x2_t *)(v161 + 4) : (float64x2_t *)v160;
            if (!geo::Intersect::SHSegmentComparator<double>::operator()(&v239, v173))
            {
              if (v157 != (uint64_t *)v241)
              {
                v174 = *v157;
                v175 = v157;
                if (*v157)
                {
                  do
                  {
                    v176 = v174;
                    v174 = *(_QWORD *)(v174 + 8);
                  }
                  while (v174);
                }
                else
                {
                  do
                  {
                    v176 = v175[2];
                    v124 = *(_QWORD *)v176 == (_QWORD)v175;
                    v175 = (uint64_t *)v176;
                  }
                  while (v124);
                }
                v177 = (_QWORD *)v157[1];
                v178 = v157;
                if (v177)
                {
                  do
                  {
                    v179 = v177;
                    v177 = (_QWORD *)*v177;
                  }
                  while (v177);
                }
                else
                {
                  do
                  {
                    v179 = (_QWORD *)v178[2];
                    v124 = *v179 == (_QWORD)v178;
                    v178 = v179;
                  }
                  while (!v124);
                }
                if (v179 != &v242)
                {
                  v180 = *(double *)(v176 + 48);
                  v181 = *(double *)(v176 + 56);
                  v183 = *((double *)v179 + 6);
                  v182 = *((double *)v179 + 7);
                  v184 = -(v181 * v183 - v182 * v180);
                  if (v184 != 0.0)
                  {
                    v185 = 1.0 / v184;
                    v186 = *(double *)(v176 + 32) + v180;
                    v187 = *((double *)v179 + 4);
                    v188 = *((double *)v179 + 5);
                    v189 = *(double *)(v176 + 40) + v181;
                    v190 = -((v189 - v188) * v183 - (v186 - v187) * v182) * v185;
                    if (v190 >= 0.0 && v190 <= 1.0)
                    {
                      v192 = -((v186 - v187) * v181 - (v189 - v188) * v180) * v185;
                      if (v192 >= 0.0
                        && v192 <= 1.0
                        && (*(_QWORD *)(v176 + 32) != v179[4] || *(_QWORD *)(v176 + 40) != v179[5]))
                      {
                        v195 = v187 + v183;
                        v196 = v188 + v182;
                        v245.f64[0] = v195;
                        v245.f64[1] = v196;
                        v198 = *(_QWORD *)(v176 + 32);
                        v197 = *(_QWORD *)(v176 + 40);
                        if (v198 != *(_QWORD *)&v195 || v197 != *(_QWORD *)&v196)
                        {
                          v244.f64[0] = v186;
                          v244.f64[1] = v189;
                          v201 = v179[4];
                          v200 = v179[5];
                          if (*(_QWORD *)&v186 != v201 || *(_QWORD *)&v189 != v200)
                          {
                            v237 = v186;
                            v238 = v189;
                            v235 = v195;
                            v236 = v196;
                            if (*(_QWORD *)&v186 != *(_QWORD *)&v195 || *(_QWORD *)&v189 != *(_QWORD *)&v196)
                              goto LABEL_295;
                          }
                        }
                      }
                    }
                  }
                }
              }
              v204 = (uint64_t *)v157[1];
              v205 = v157;
              if (v204)
              {
                do
                {
                  v206 = (uint64_t **)v204;
                  v204 = (uint64_t *)*v204;
                }
                while (v204);
              }
              else
              {
                do
                {
                  v206 = (uint64_t **)v205[2];
                  v124 = *v206 == v205;
                  v205 = (uint64_t *)v206;
                }
                while (!v124);
              }
              if (v157 == (uint64_t *)v241)
                v241 = v206;
              --v243;
              std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(v155, v157);
              operator delete(v157);
            }
          }
LABEL_141:
          v99 += 24;
          if (v99 == (char *)v70)
          {
            v100 = 0;
            goto LABEL_296;
          }
          goto LABEL_142;
        }
      }
      v166 = *((double *)v158 + 5) - v239.f64[1];
      v167 = v163.f64[0] - v239.f64[0];
      v168 = -(v167 * v154.f64[1] - v166 * v154.f64[0]);
      if (v168 == 0.0)
      {
        if (-((*((double *)v158 + 6) + v167) * v154.f64[1] - (*((double *)v158 + 7) + v166) * v154.f64[0]) > 0.0)
          goto LABEL_220;
        goto LABEL_243;
      }
      if (v168 < 0.0)
        goto LABEL_243;
LABEL_220:
      v159 = 0;
      v157 = v158;
      v158 = (uint64_t *)*v158;
      if (!v158)
        goto LABEL_244;
    }
  }
  v58 = (float *)v51->_simplifiedGeometryCache.__ptr_.__value_;
LABEL_300:
  v229 = v53;
  do
    v208 = __ldxr(p_shared_owners);
  while (__stxr(v208 + 1, p_shared_owners));
  v239.f64[0] = v226;
  *(_QWORD *)&v239.f64[1] = v53;
  do
    v209 = __ldxr(p_shared_owners);
  while (__stxr(v209 + 1, p_shared_owners));
  geo::LRUPolicy<unsigned char,std::shared_ptr<geo::Polygon2<double>>,std::hash<unsigned char>>::insert((unint64_t)(v58 + 12), v58 + 2, &v234, &v239);
  v210 = v239.f64[1];
  if (*(_QWORD *)&v239.f64[1])
  {
    v211 = (unint64_t *)(*(_QWORD *)&v239.f64[1] + 8);
    do
      v212 = __ldaxr(v211);
    while (__stlxr(v212 - 1, v211));
    if (!v212)
    {
      (*(void (**)(float64_t))(**(_QWORD **)&v210 + 16))(COERCE_FLOAT64_T(*(_QWORD *)&v210));
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v210);
    }
  }
  while (*((_QWORD *)v58 + 8) > *(_QWORD *)v58)
    geo::Cache<unsigned char,std::shared_ptr<geo::Polygon2<double>>,std::hash<unsigned char>,geo::LRUPolicy>::_pop(v58);
  if (v229)
  {
    v213 = (unint64_t *)&v229->__shared_owners_;
    do
      v214 = __ldaxr(v213);
    while (__stlxr(v214 - 1, v213));
    if (!v214)
    {
      ((void (*)(std::__shared_weak_count *))v229->__on_zero_shared)(v229);
      std::__shared_weak_count::__release_weak(v229);
    }
  }
  cntrl = v232;
  *v225 = v231;
  v225[1] = v232;
  if (v232)
  {
LABEL_317:
    v215 = (unint64_t *)&cntrl->__shared_owners_;
    do
      v216 = __ldxr(v215);
    while (__stxr(v216 + 1, v215));
LABEL_319:
    if (v232)
    {
      v217 = (unint64_t *)&v232->__shared_owners_;
      do
        v218 = __ldaxr(v217);
      while (__stlxr(v218 - 1, v217));
      if (!v218)
      {
        ((void (*)(std::__shared_weak_count *))v232->__on_zero_shared)(v232);
        std::__shared_weak_count::__release_weak(v232);
      }
    }
  }
LABEL_324:
  os_unfair_lock_unlock(&p_simplifiedGeometryCacheLock->_lock);
  result.__cntrl_ = v220;
  result.__ptr_ = v219;
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
  __shared_weak_count *cntrl;
  unint64_t *v6;
  unint64_t v7;

  value = self->_simplifiedGeometryCache.__ptr_.__value_;
  self->_simplifiedGeometryCache.__ptr_.__value_ = 0;
  if (value)
  {
    v4 = geo::Cache<unsigned long,std::shared_ptr<md::LabelIcon>,std::hash<unsigned long>,geo::LRUPolicy>::~Cache(value);
    MEMORY[0x1A1AF4E00](v4, 0x10A0C407D9D2971);
  }
  cntrl = self->_geometry.__cntrl_;
  if (cntrl)
  {
    v6 = (unint64_t *)((char *)cntrl + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_DWORD *)self + 10) = 0;
  return self;
}

@end
