@implementation VKClusterFeatureAnnotation

- (VKClusterFeatureAnnotation)initWithClusterNode:(void *)a3 clusterTree:(const void *)a4 baseStyle:(const void *)a5 imageText:(id)a6 annotationText:(id)a7 annotationLocale:(id)a8
{
  id v14;
  id v15;
  id v16;
  VKClusterFeatureAnnotation *v17;
  double v18;
  double v19;
  VKCustomFeature *v20;
  VKCustomFeature *customFeature;
  uint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  unint64_t *p_shared_weak_owners;
  unint64_t v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  unsigned int *v32;
  unint64_t *v33;
  unint64_t *v34;
  unint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  unsigned __int8 v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t *v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t *v59;
  __int128 *v60;
  uint64_t v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  _QWORD *v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t *v81;
  __int128 *v82;
  uint64_t v83;
  __int128 v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t *v91;
  _QWORD *v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t *v96;
  __int128 *v97;
  uint64_t v98;
  __int128 v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t *v104;
  uint64_t *v105;
  uint64_t v106;
  __int128 v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  unint64_t v111;
  uint64_t v112;
  uint64_t v113;
  _QWORD *v114;
  unint64_t v115;
  uint64_t v116;
  uint64_t *v117;
  _OWORD *v118;
  uint64_t *v119;
  uint64_t v120;
  __int128 v121;
  uint64_t v122;
  unint64_t v123;
  unsigned __int8 v124;
  uint64_t *v125;
  uint64_t v126;
  unint64_t v127;
  unint64_t v128;
  uint64_t v129;
  uint64_t v130;
  _QWORD *v131;
  unint64_t v132;
  uint64_t v133;
  uint64_t *v134;
  _OWORD *v135;
  __int128 *v136;
  uint64_t v137;
  __int128 v138;
  uint64_t v139;
  uint64_t v140;
  char *v141;
  char *v142;
  char *v143;
  uint64_t v144;
  unint64_t v145;
  unint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t *v149;
  unint64_t v150;
  uint64_t v151;
  uint64_t *v152;
  uint64_t *v153;
  uint64_t *v154;
  uint64_t v155;
  __int128 v156;
  uint64_t v157;
  uint64_t v158;
  unint64_t v159;
  unint64_t v160;
  uint64_t v161;
  uint64_t v162;
  _QWORD *v163;
  unint64_t v164;
  uint64_t v165;
  uint64_t *v166;
  _OWORD *v167;
  char *v168;
  uint64_t v169;
  __int128 v170;
  uint64_t v171;
  uint64_t v172;
  unint64_t v173;
  unint64_t v174;
  uint64_t v175;
  uint64_t v176;
  char *v177;
  unint64_t v178;
  uint64_t v179;
  char *v180;
  char *v181;
  char *v182;
  uint64_t v183;
  __int128 v184;
  uint64_t v185;
  int64x2_t *v186;
  uint64_t v187;
  char v188;
  uint64_t v189;
  uint64_t v190;
  unsigned __int8 v191;
  size_t v192;
  _QWORD *v193;
  uint64_t v194;
  int *v195;
  int v196;
  uint64_t v197;
  int *v198;
  int v199;
  uint64_t v200;
  std::__shared_weak_count *v201;
  unint64_t *v202;
  unint64_t v203;
  unint64_t v204;
  std::__shared_weak_count *v205;
  unint64_t *v206;
  unint64_t v207;
  unint64_t *v208;
  unint64_t v209;
  void *v210;
  void *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  void **v215;
  const char *v216;
  VKClusterFeatureAnnotation *v217;
  std::__shared_weak_count *v218;
  unint64_t *v219;
  unint64_t v220;
  uint64_t v222;
  id v223;
  id v224;
  VKClusterFeatureAnnotation *v225;
  id v226;
  int64x2_t *v227;
  uint64_t v228;
  void *v229[2];
  void *v230[2];
  __int128 v231;
  void *v232[2];
  void *__p[2];
  __int128 v234;
  uint64_t v235;
  std::__shared_weak_count *v236;
  _QWORD v237[3];
  objc_super v238;

  v14 = a6;
  v15 = a7;
  v16 = a8;
  v238.receiver = self;
  v238.super_class = (Class)VKClusterFeatureAnnotation;
  v17 = -[VKClusterFeatureAnnotation init](&v238, sel_init);

  if (!v17)
    goto LABEL_328;
  md::LabelPoint::coordinate((md::LabelPoint *)v237, (uint64_t)a3 + 16);
  v18 = *(double *)v237;
  v19 = *(double *)&v237[1];
  *(_QWORD *)&v17->_coordinate.latitude = v237[0];
  v17->_coordinate.longitude = v19;
  v225 = v17;
  v226 = v14;
  v223 = v15;
  v224 = v16;
  v20 = -[VKCustomFeature _initInternalFeatureWithCoordinate:]([VKCustomFeature alloc], "_initInternalFeatureWithCoordinate:", v18, v19, *(double *)&v237[2]);
  customFeature = v17->_customFeature;
  v17->_customFeature = v20;

  v227 = -[VKCustomFeature pointFeature](v17->_customFeature, "pointFeature");
  v22 = *(_QWORD *)a4;
  v23 = (std::__shared_weak_count *)*((_QWORD *)a4 + 1);
  if (v23)
  {
    p_shared_owners = (unint64_t *)&v23->__shared_owners_;
    do
      v25 = __ldxr(p_shared_owners);
    while (__stxr(v25 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v23->__shared_weak_owners_;
    do
      v27 = __ldxr(p_shared_weak_owners);
    while (__stxr(v27 + 1, p_shared_weak_owners));
    v227[18].i64[0] = (uint64_t)a3;
    do
      v28 = __ldxr(p_shared_weak_owners);
    while (__stxr(v28 + 1, p_shared_weak_owners));
  }
  else
  {
    v227[18].i64[0] = (uint64_t)a3;
  }
  v29 = (std::__shared_weak_count *)v227[19].i64[0];
  v227[18].i64[1] = v22;
  v227[19].i64[0] = (uint64_t)v23;
  if (v29)
    std::__shared_weak_count::__release_weak(v29);
  if (v23)
  {
    std::__shared_weak_count::__release_weak(v23);
    v30 = (unint64_t *)&v23->__shared_owners_;
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  if (*((_BYTE *)a3 + 68))
  {
    v227[13].i32[2] = *((_DWORD *)a3 + 16);
    v227[13].i8[12] = 1;
  }
  v32 = (unsigned int *)*((_QWORD *)a3 + 20);
  v33 = (unint64_t *)*((_QWORD *)a5 + 1);
  v228 = *(_QWORD *)a5;
  v229[0] = v33;
  if (v33)
  {
    v34 = v33 + 1;
    do
      v35 = __ldxr(v34);
    while (__stxr(v35 + 1, v34));
  }
  geo::codec::copyFeatureStyleAttributes(&v228, &v235);
  v36 = (std::__shared_weak_count *)v229[0];
  if (v229[0])
  {
    v37 = (unint64_t *)((char *)v229[0] + 8);
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }
  {
    v222 = operator new();
    mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v222, "VectorKitLabels", 0x5ED09DD50000000FLL);
  }
  v40 = mdm::Allocator::instance(void)::alloc;
  v41 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc
                                                                        + 16))(mdm::Allocator::instance(void)::alloc, 8, 4);
  v42 = v41;
  v43 = (unint64_t)(v41 + 1);
  if (v41)
    *v41 = 0x300000005;
  if (!v32)
  {
    v46 = v41;
    v47 = v41 + 1;
    goto LABEL_138;
  }
  v44 = v32[21];
  if ((_DWORD)v44 == -1)
  {
    v46 = v41;
  }
  else
  {
    v45 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v40 + 16))(v40, 16, 4);
    v46 = v45;
    v43 = (unint64_t)(v45 + 2);
    if (v45)
      v45[1] = (v44 << 32) | 6;
    *v45 = *v42;
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)v40 + 40))(v40, v42, 8);
  }
  v48 = v32[23];
  if ((_DWORD)v48 == -1)
  {
    v52 = v43;
    v55 = (uint64_t *)v43;
    goto LABEL_64;
  }
  v49 = v43 - (_QWORD)v46;
  v50 = (uint64_t)(v43 - (_QWORD)v46) >> 3;
  v51 = v50 + 1;
  if ((unint64_t)(v50 + 1) >> 61)
    abort();
  if (v49 >> 2 > v51)
    v51 = v49 >> 2;
  if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFF8)
    v52 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v52 = v51;
  if (v52)
  {
    v53 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)v40 + 16))(v40, 8 * v52, 4);
    v54 = (uint64_t *)(v53 + 8 * v50);
    v52 = v53 + 8 * v52;
    if (v53)
      *v54 = (v48 << 32) | 0x52;
  }
  else
  {
    v54 = (uint64_t *)(8 * v50);
  }
  v55 = v54 + 1;
  if ((uint64_t *)v43 == v46)
  {
    v49 = 0;
    v46 = (uint64_t *)v43;
LABEL_62:
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)v40 + 40))(v40, v46, v49);
    goto LABEL_63;
  }
  v56 = v43 - (_QWORD)v46 - 8;
  if (v56 < 0x38)
  {
    v58 = v43;
    do
    {
LABEL_60:
      v63 = *(_QWORD *)(v58 - 8);
      v58 -= 8;
      *--v54 = v63;
    }
    while ((uint64_t *)v58 != v46);
    goto LABEL_61;
  }
  if (v43 - (unint64_t)v54 < 0x20)
  {
    v58 = v43;
    goto LABEL_60;
  }
  v57 = (v56 >> 3) + 1;
  v58 = v43 - 8 * (v57 & 0x3FFFFFFFFFFFFFFCLL);
  v59 = v54 - 2;
  v60 = (__int128 *)(v43 - 16);
  v61 = v57 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    v62 = *v60;
    *((_OWORD *)v59 - 1) = *(v60 - 1);
    *(_OWORD *)v59 = v62;
    v59 -= 4;
    v60 -= 2;
    v61 -= 4;
  }
  while (v61);
  v54 -= v57 & 0x3FFFFFFFFFFFFFFCLL;
  if (v57 != (v57 & 0x3FFFFFFFFFFFFFFCLL))
    goto LABEL_60;
LABEL_61:
  if (v46)
    goto LABEL_62;
LABEL_63:
  v46 = v54;
LABEL_64:
  v64 = v32[22];
  if ((_DWORD)v64 == -1)
    goto LABEL_67;
  if ((unint64_t)v55 < v52)
  {
    *v55++ = (v64 << 32) | 4;
LABEL_67:
    v43 = v52;
    v47 = v55;
    if ((unint64_t)v55 < v52)
      goto LABEL_68;
    goto LABEL_138;
  }
  v72 = v55 - v46;
  v73 = v72 + 1;
  if ((unint64_t)(v72 + 1) >> 61)
    abort();
  v74 = v52 - (_QWORD)v46;
  if ((uint64_t)(v52 - (_QWORD)v46) >> 2 > v73)
    v73 = (uint64_t)(v52 - (_QWORD)v46) >> 2;
  if (v74 >= 0x7FFFFFFFFFFFFFF8)
    v43 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v43 = v73;
  if (v43)
  {
    v75 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)v40 + 16))(v40, 8 * v43, 4);
    v76 = (uint64_t *)(v75 + 8 * v72);
    v43 = v75 + 8 * v43;
    if (v75)
      *v76 = (v64 << 32) | 4;
  }
  else
  {
    v76 = (uint64_t *)(8 * v72);
  }
  v47 = v76 + 1;
  if (v55 != v46)
  {
    v101 = (char *)v55 - (char *)v46 - 8;
    if (v101 < 0x38 || (unint64_t)((char *)v55 - (char *)v76) <= 0x1F)
    {
      v103 = v55;
    }
    else
    {
      v102 = (v101 >> 3) + 1;
      v103 = &v55[-(v102 & 0x3FFFFFFFFFFFFFFCLL)];
      v104 = v76 - 2;
      v105 = v55 - 2;
      v106 = v102 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v107 = *(_OWORD *)v105;
        *((_OWORD *)v104 - 1) = *((_OWORD *)v105 - 1);
        *(_OWORD *)v104 = v107;
        v104 -= 4;
        v105 -= 4;
        v106 -= 4;
      }
      while (v106);
      v76 -= v102 & 0x3FFFFFFFFFFFFFFCLL;
      if (v102 == (v102 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_135:
        if (!v46)
          goto LABEL_137;
        goto LABEL_136;
      }
    }
    do
    {
      v108 = *--v103;
      *--v76 = v108;
    }
    while (v103 != v46);
    goto LABEL_135;
  }
  v74 = v52 - (_QWORD)v55;
  v46 = v55;
LABEL_136:
  (*(void (**)(uint64_t, uint64_t *, unint64_t))(*(_QWORD *)v40 + 40))(v40, v46, v74);
LABEL_137:
  v46 = v76;
  if ((unint64_t)v47 < v43)
  {
LABEL_68:
    *v47 = 0x100010024;
    v65 = v47 + 1;
    if ((unint64_t)(v47 + 1) >= v43)
      goto LABEL_69;
    goto LABEL_161;
  }
LABEL_138:
  v109 = v47 - v46;
  v110 = v109 + 1;
  if ((unint64_t)(v109 + 1) >> 61)
    abort();
  v111 = v43 - (_QWORD)v46;
  if ((uint64_t)(v43 - (_QWORD)v46) >> 2 > v110)
    v110 = (uint64_t)(v43 - (_QWORD)v46) >> 2;
  if (v111 >= 0x7FFFFFFFFFFFFFF8)
    v112 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v112 = v110;
  if (v112)
  {
    v113 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v40 + 16))(v40, 8 * v112, 4);
    v114 = (_QWORD *)(v113 + 8 * v109);
    v43 = v113 + 8 * v112;
    if (v113)
      *v114 = 0x100010024;
  }
  else
  {
    v43 = 0;
    v114 = (_QWORD *)(8 * v109);
  }
  v65 = v114 + 1;
  if (v47 != v46)
  {
    v115 = (char *)v47 - (char *)v46 - 8;
    if (v115 < 0x38)
    {
      v117 = v47;
    }
    else if ((unint64_t)((char *)v47 - (char *)v114) < 0x20)
    {
      v117 = v47;
    }
    else
    {
      v116 = (v115 >> 3) + 1;
      v117 = &v47[-(v116 & 0x3FFFFFFFFFFFFFFCLL)];
      v118 = v114 - 2;
      v119 = v47 - 2;
      v120 = v116 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v121 = *(_OWORD *)v119;
        *(v118 - 1) = *((_OWORD *)v119 - 1);
        *v118 = v121;
        v118 -= 2;
        v119 -= 4;
        v120 -= 4;
      }
      while (v120);
      v114 -= v116 & 0x3FFFFFFFFFFFFFFCLL;
      if (v116 == (v116 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_158:
        if (!v46)
          goto LABEL_160;
        goto LABEL_159;
      }
    }
    do
    {
      v122 = *--v117;
      *--v114 = v122;
    }
    while (v117 != v46);
    goto LABEL_158;
  }
LABEL_159:
  (*(void (**)(uint64_t, uint64_t *, unint64_t))(*(_QWORD *)v40 + 40))(v40, v46, v111);
LABEL_160:
  v46 = v114;
  if ((unint64_t)v65 >= v43)
  {
LABEL_69:
    v66 = v65 - v46;
    v67 = v66 + 1;
    if ((unint64_t)(v66 + 1) >> 61)
      abort();
    v68 = v43 - (_QWORD)v46;
    if ((uint64_t)(v43 - (_QWORD)v46) >> 2 > v67)
      v67 = (uint64_t)(v43 - (_QWORD)v46) >> 2;
    if (v68 >= 0x7FFFFFFFFFFFFFF8)
      v69 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v69 = v67;
    if (v69)
    {
      v70 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v40 + 16))(v40, 8 * v69, 4);
      v71 = (uint64_t *)(v70 + 8 * v66);
      v43 = v70 + 8 * v69;
      if (v70)
        *v71 = 0x10001001FLL;
    }
    else
    {
      v43 = 0;
      v71 = (uint64_t *)(8 * v66);
    }
    v77 = v71 + 1;
    if (v65 == v46)
    {
LABEL_99:
      (*(void (**)(uint64_t, uint64_t *, unint64_t))(*(_QWORD *)v40 + 40))(v40, v46, v68);
LABEL_100:
      v46 = v71;
      if ((unint64_t)v77 >= v43)
        goto LABEL_101;
      goto LABEL_162;
    }
    v78 = (char *)v65 - (char *)v46 - 8;
    if (v78 < 0x38)
    {
      v80 = v65;
    }
    else if ((unint64_t)((char *)v65 - (char *)v71) < 0x20)
    {
      v80 = v65;
    }
    else
    {
      v79 = (v78 >> 3) + 1;
      v80 = &v65[-(v79 & 0x3FFFFFFFFFFFFFFCLL)];
      v81 = v71 - 2;
      v82 = (__int128 *)(v65 - 2);
      v83 = v79 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v84 = *v82;
        *((_OWORD *)v81 - 1) = *(v82 - 1);
        *(_OWORD *)v81 = v84;
        v81 -= 4;
        v82 -= 2;
        v83 -= 4;
      }
      while (v83);
      v71 -= v79 & 0x3FFFFFFFFFFFFFFCLL;
      if (v79 == (v79 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_98:
        if (!v46)
          goto LABEL_100;
        goto LABEL_99;
      }
    }
    do
    {
      v85 = *--v80;
      *--v71 = v85;
    }
    while (v80 != v46);
    goto LABEL_98;
  }
LABEL_161:
  *v65 = 0x10001001FLL;
  v77 = v65 + 1;
  if ((unint64_t)(v65 + 1) >= v43)
  {
LABEL_101:
    v86 = v77 - v46;
    v87 = v86 + 1;
    if ((unint64_t)(v86 + 1) >> 61)
      abort();
    v88 = v43 - (_QWORD)v46;
    if ((uint64_t)(v43 - (_QWORD)v46) >> 2 > v87)
      v87 = (uint64_t)(v43 - (_QWORD)v46) >> 2;
    if (v88 >= 0x7FFFFFFFFFFFFFF8)
      v89 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v89 = v87;
    if (v89)
    {
      v90 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v40 + 16))(v40, 8 * v89, 4);
      v91 = (uint64_t *)(v90 + 8 * v86);
      v43 = v90 + 8 * v89;
      if (v90)
        *v91 = 0x10001002DLL;
    }
    else
    {
      v43 = 0;
      v91 = (uint64_t *)(8 * v86);
    }
    v92 = v91 + 1;
    if (v77 == v46)
      goto LABEL_122;
    v93 = (char *)v77 - (char *)v46 - 8;
    if (v93 < 0x38)
    {
      v95 = v77;
    }
    else if ((unint64_t)((char *)v77 - (char *)v91) < 0x20)
    {
      v95 = v77;
    }
    else
    {
      v94 = (v93 >> 3) + 1;
      v95 = &v77[-(v94 & 0x3FFFFFFFFFFFFFFCLL)];
      v96 = v91 - 2;
      v97 = (__int128 *)(v77 - 2);
      v98 = v94 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v99 = *v97;
        *((_OWORD *)v96 - 1) = *(v97 - 1);
        *(_OWORD *)v96 = v99;
        v96 -= 4;
        v97 -= 2;
        v98 -= 4;
      }
      while (v98);
      v91 -= v94 & 0x3FFFFFFFFFFFFFFCLL;
      if (v94 == (v94 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_121:
        if (!v46)
        {
LABEL_123:
          v46 = v91;
          goto LABEL_163;
        }
LABEL_122:
        (*(void (**)(uint64_t, uint64_t *, unint64_t))(*(_QWORD *)v40 + 40))(v40, v46, v88);
        goto LABEL_123;
      }
    }
    do
    {
      v100 = *--v95;
      *--v91 = v100;
    }
    while (v95 != v46);
    goto LABEL_121;
  }
LABEL_162:
  *v77 = 0x10001002DLL;
  v92 = v77 + 1;
LABEL_163:
  v123 = *((unsigned int *)a3 + 44);
  if (v123 >= 6)
    v124 = 6;
  else
    v124 = 0x50403020000uLL >> (8 * v123);
  if ((unint64_t)v92 < v43)
  {
    *v92 = (((unint64_t)v124 << 32) | 0x1002E) + 46;
    v125 = v92 + 1;
    goto LABEL_191;
  }
  v126 = v92 - v46;
  v127 = v126 + 1;
  if ((unint64_t)(v126 + 1) >> 61)
    abort();
  v128 = v43 - (_QWORD)v46;
  if ((uint64_t)(v43 - (_QWORD)v46) >> 2 > v127)
    v127 = (uint64_t)(v43 - (_QWORD)v46) >> 2;
  if (v128 >= 0x7FFFFFFFFFFFFFF8)
    v129 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v129 = v127;
  if (v129)
  {
    v130 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v40 + 16))(v40, 8 * v129, 4);
    v131 = (_QWORD *)(v130 + 8 * v126);
    v43 = v130 + 8 * v129;
    if (v130)
      *v131 = (((unint64_t)v124 << 32) | 0x1002E) + 46;
  }
  else
  {
    v43 = 0;
    v131 = (_QWORD *)(8 * v126);
  }
  v125 = v131 + 1;
  if (v92 == v46)
    goto LABEL_189;
  v132 = (char *)v92 - (char *)v46 - 8;
  if (v132 < 0x38)
  {
    v134 = v92;
    do
    {
LABEL_187:
      v139 = *--v134;
      *--v131 = v139;
    }
    while (v134 != v46);
    goto LABEL_188;
  }
  if ((unint64_t)((char *)v92 - (char *)v131) < 0x20)
  {
    v134 = v92;
    goto LABEL_187;
  }
  v133 = (v132 >> 3) + 1;
  v134 = &v92[-(v133 & 0x3FFFFFFFFFFFFFFCLL)];
  v135 = v131 - 2;
  v136 = (__int128 *)(v92 - 2);
  v137 = v133 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    v138 = *v136;
    *(v135 - 1) = *(v136 - 1);
    *v135 = v138;
    v135 -= 2;
    v136 -= 2;
    v137 -= 4;
  }
  while (v137);
  v131 -= v133 & 0x3FFFFFFFFFFFFFFCLL;
  if (v133 != (v133 & 0x3FFFFFFFFFFFFFFCLL))
    goto LABEL_187;
LABEL_188:
  if (v46)
LABEL_189:
    (*(void (**)(uint64_t, uint64_t *, unint64_t))(*(_QWORD *)v40 + 40))(v40, v46, v128);
  v46 = v131;
LABEL_191:
  v140 = *((unsigned __int8 *)a3 + 181);
  if ((unint64_t)v125 < v43)
  {
    *v125 = (v140 << 32) | 0x1002E;
    v141 = (char *)(v125 + 1);
    if ((unint64_t)(v125 + 1) < v43)
      goto LABEL_193;
LABEL_218:
    v158 = (v141 - (char *)v46) >> 3;
    v159 = v158 + 1;
    if ((unint64_t)(v158 + 1) >> 61)
      abort();
    v160 = v43 - (_QWORD)v46;
    if ((uint64_t)(v43 - (_QWORD)v46) >> 2 > v159)
      v159 = (uint64_t)(v43 - (_QWORD)v46) >> 2;
    if (v160 >= 0x7FFFFFFFFFFFFFF8)
      v161 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v161 = v159;
    if (v161)
    {
      v162 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v40 + 16))(v40, 8 * v161, 4);
      v163 = (_QWORD *)(v162 + 8 * v158);
      v43 = v162 + 8 * v161;
      if (v162)
        *v163 = 65583;
    }
    else
    {
      v43 = 0;
      v163 = (_QWORD *)(8 * v158);
    }
    v142 = (char *)(v163 + 1);
    if (v141 == (char *)v46)
    {
LABEL_239:
      (*(void (**)(uint64_t, uint64_t *, unint64_t))(*(_QWORD *)v40 + 40))(v40, v46, v160);
LABEL_240:
      v46 = v163;
      if ((unint64_t)v142 < v43)
        goto LABEL_194;
      goto LABEL_241;
    }
    v164 = v141 - (char *)v46 - 8;
    if (v164 < 0x38)
    {
      v166 = (uint64_t *)v141;
    }
    else if ((unint64_t)(v141 - (char *)v163) < 0x20)
    {
      v166 = (uint64_t *)v141;
    }
    else
    {
      v165 = (v164 >> 3) + 1;
      v166 = (uint64_t *)&v141[-8 * (v165 & 0x3FFFFFFFFFFFFFFCLL)];
      v167 = v163 - 2;
      v168 = v141 - 16;
      v169 = v165 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v170 = *(_OWORD *)v168;
        *(v167 - 1) = *((_OWORD *)v168 - 1);
        *v167 = v170;
        v167 -= 2;
        v168 -= 32;
        v169 -= 4;
      }
      while (v169);
      v163 -= v165 & 0x3FFFFFFFFFFFFFFCLL;
      if (v165 == (v165 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_238:
        if (!v46)
          goto LABEL_240;
        goto LABEL_239;
      }
    }
    do
    {
      v171 = *--v166;
      *--v163 = v171;
    }
    while (v166 != v46);
    goto LABEL_238;
  }
  v144 = v125 - v46;
  v145 = v144 + 1;
  if ((unint64_t)(v144 + 1) >> 61)
    abort();
  v146 = v43 - (_QWORD)v46;
  if ((uint64_t)(v43 - (_QWORD)v46) >> 2 > v145)
    v145 = (uint64_t)(v43 - (_QWORD)v46) >> 2;
  if (v146 >= 0x7FFFFFFFFFFFFFF8)
    v147 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v147 = v145;
  if (v147)
  {
    v148 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v40 + 16))(v40, 8 * v147, 4);
    v149 = (uint64_t *)(v148 + 8 * v144);
    v43 = v148 + 8 * v147;
    if (v148)
      *v149 = (v140 << 32) | 0x1002E;
  }
  else
  {
    v43 = 0;
    v149 = (uint64_t *)(8 * v144);
  }
  v141 = (char *)(v149 + 1);
  if (v125 != v46)
  {
    v150 = (char *)v125 - (char *)v46 - 8;
    if (v150 < 0x38)
    {
      v152 = v125;
    }
    else if ((unint64_t)((char *)v125 - (char *)v149) < 0x20)
    {
      v152 = v125;
    }
    else
    {
      v151 = (v150 >> 3) + 1;
      v152 = &v125[-(v151 & 0x3FFFFFFFFFFFFFFCLL)];
      v153 = v149 - 2;
      v154 = v125 - 2;
      v155 = v151 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v156 = *(_OWORD *)v154;
        *((_OWORD *)v153 - 1) = *((_OWORD *)v154 - 1);
        *(_OWORD *)v153 = v156;
        v153 -= 4;
        v154 -= 4;
        v155 -= 4;
      }
      while (v155);
      v149 -= v151 & 0x3FFFFFFFFFFFFFFCLL;
      if (v151 == (v151 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_215:
        if (!v46)
          goto LABEL_217;
        goto LABEL_216;
      }
    }
    do
    {
      v157 = *--v152;
      *--v149 = v157;
    }
    while (v152 != v46);
    goto LABEL_215;
  }
LABEL_216:
  (*(void (**)(uint64_t, uint64_t *, unint64_t))(*(_QWORD *)v40 + 40))(v40, v46, v146);
LABEL_217:
  v46 = v149;
  if ((unint64_t)v141 >= v43)
    goto LABEL_218;
LABEL_193:
  *(_QWORD *)v141 = 65583;
  v142 = v141 + 8;
  if ((unint64_t)(v141 + 8) < v43)
  {
LABEL_194:
    *(_QWORD *)v142 = 65584;
    v143 = v142 + 8;
    v15 = v223;
    goto LABEL_264;
  }
LABEL_241:
  v172 = (v142 - (char *)v46) >> 3;
  v173 = v172 + 1;
  if ((unint64_t)(v172 + 1) >> 61)
    abort();
  v174 = v43 - (_QWORD)v46;
  if ((uint64_t)(v43 - (_QWORD)v46) >> 2 > v173)
    v173 = (uint64_t)(v43 - (_QWORD)v46) >> 2;
  if (v174 >= 0x7FFFFFFFFFFFFFF8)
    v175 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v175 = v173;
  if (v175)
  {
    v176 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v40 + 16))(v40, 8 * v175, 4);
    v177 = (char *)(v176 + 8 * v172);
    v43 = v176 + 8 * v175;
    if (v176)
      *(_QWORD *)v177 = 65584;
  }
  else
  {
    v43 = 0;
    v177 = (char *)(8 * v172);
  }
  v143 = v177 + 8;
  if (v142 == (char *)v46)
  {
    v15 = v223;
LABEL_262:
    (*(void (**)(uint64_t, uint64_t *, unint64_t))(*(_QWORD *)v40 + 40))(v40, v46, v174);
    goto LABEL_263;
  }
  v178 = v142 - (char *)v46 - 8;
  if (v178 < 0x38 || (unint64_t)(v142 - v177) < 0x20)
  {
    v180 = v142;
    v15 = v223;
    do
    {
LABEL_260:
      v185 = *((_QWORD *)v180 - 1);
      v180 -= 8;
      *((_QWORD *)v177 - 1) = v185;
      v177 -= 8;
    }
    while (v180 != (char *)v46);
    goto LABEL_261;
  }
  v179 = (v178 >> 3) + 1;
  v180 = &v142[-8 * (v179 & 0x3FFFFFFFFFFFFFFCLL)];
  v181 = v177 - 16;
  v182 = v142 - 16;
  v183 = v179 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    v184 = *(_OWORD *)v182;
    *((_OWORD *)v181 - 1) = *((_OWORD *)v182 - 1);
    *(_OWORD *)v181 = v184;
    v181 -= 32;
    v182 -= 32;
    v183 -= 4;
  }
  while (v183);
  v177 -= 8 * (v179 & 0x3FFFFFFFFFFFFFFCLL);
  v15 = v223;
  if (v179 != (v179 & 0x3FFFFFFFFFFFFFFCLL))
    goto LABEL_260;
LABEL_261:
  if (v46)
    goto LABEL_262;
LABEL_263:
  v46 = (uint64_t *)v177;
LABEL_264:
  v186 = v227;
  if (((v143 - (char *)v46) & 0x7FFFFFFF8) != 0)
  {
    v187 = 0;
    v188 = 0;
    v189 = v235;
    v190 = ((unint64_t)(v143 - (char *)v46) >> 3);
    v191 = *(_BYTE *)(v235 + 33);
    while (1)
    {
      v192 = v191;
      v193 = *(_QWORD **)v189;
      if (v191)
        break;
LABEL_266:
      v193[v192] = v46[v187];
      v191 = *(_BYTE *)(v189 + 33) + 1;
      *(_BYTE *)(v189 + 33) = v191;
      ++v187;
      v188 = 1;
      if (v187 == v190)
      {
        v193 = *(_QWORD **)v189;
        v192 = v191;
LABEL_283:
        qsort(v193, v192, 8uLL, (int (__cdecl *)(const void *, const void *))FeatureStyleAttributes::compareStylePairs);
        goto LABEL_284;
      }
    }
    if (v191 > 0x1Fu)
    {
      do
      {
        v197 = 0;
        v198 = (int *)v193;
        while (1)
        {
          v199 = *v198;
          v198 += 2;
          if (v199 == LODWORD(v46[v187]))
            break;
          if (v191 == ++v197)
            goto LABEL_277;
        }
        HIDWORD(v193[v197]) = HIDWORD(v46[v187]);
LABEL_277:
        ++v187;
      }
      while (v187 != v190);
    }
    else
    {
      do
      {
        v194 = 0;
        v195 = (int *)v193;
        while (1)
        {
          v196 = *v195;
          v195 += 2;
          if (v196 == LODWORD(v46[v187]))
            break;
          if (v192 == ++v194)
            goto LABEL_266;
        }
        HIDWORD(v193[v194]) = HIDWORD(v46[v187++]);
      }
      while (v187 != v190);
    }
    if ((v188 & 1) != 0)
      goto LABEL_283;
  }
LABEL_284:
  v200 = v235;
  v201 = v236;
  if (v236)
  {
    v202 = (unint64_t *)&v236->__shared_owners_;
    do
      v203 = __ldxr(v202);
    while (__stxr(v203 + 1, v202));
    do
      v204 = __ldxr(v202);
    while (__stxr(v204 + 1, v202));
  }
  v205 = (std::__shared_weak_count *)v227[2].i64[1];
  v227[2].i64[0] = v200;
  v227[2].i64[1] = (uint64_t)v201;
  if (v205)
  {
    v206 = (unint64_t *)&v205->__shared_owners_;
    do
      v207 = __ldaxr(v206);
    while (__stlxr(v207 - 1, v206));
    if (!v207)
    {
      ((void (*)(std::__shared_weak_count *))v205->__on_zero_shared)(v205);
      std::__shared_weak_count::__release_weak(v205);
    }
  }
  if (v201)
  {
    v208 = (unint64_t *)&v201->__shared_owners_;
    do
      v209 = __ldaxr(v208);
    while (__stlxr(v209 - 1, v208));
    if (!v209)
    {
      ((void (*)(std::__shared_weak_count *))v201->__on_zero_shared)(v201);
      std::__shared_weak_count::__release_weak(v201);
    }
  }
  v227[4].i32[2] = *((_DWORD *)a3 + 2);
  v227[5].i32[0] = *((_DWORD *)a3 + 3);
  if (*((_BYTE *)a3 + 112))
  {
    v227[14].i8[13] = 1;
    v227[16].i64[0] = *((_QWORD *)a3 + 13);
  }
  md::LabelExternalFeature::addTextForZoom(v227, 0, 3, (const char *)objc_msgSend(objc_retainAutorelease(v226), "UTF8String"), 0);
  if (!v32)
    goto LABEL_318;
  v227[5].i32[1] = v32[24];
  (*(void (**)(unsigned int *))(*(_QWORD *)v32 + 88))(v32);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v210, "feature");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  v212 = objc_msgSend(v211, "pointFeature");

  if (!v212)
    goto LABEL_318;
  LOWORD(v228) = 0;
  *(_OWORD *)__p = 0u;
  v234 = 0u;
  v231 = 0u;
  *(_OWORD *)v232 = 0u;
  *(_OWORD *)v229 = 0u;
  *(_OWORD *)v230 = 0u;
  v213 = *(_QWORD *)(v212 + 48);
  v214 = *(_QWORD *)(v212 + 56);
  if (v213 != v214)
  {
    while (*(_BYTE *)(v213 + 1))
    {
      v213 += 104;
      if (v213 == v214)
        goto LABEL_314;
    }
    md::LabelExternalTextElement::operator=((uint64_t)&v228, (_QWORD *)v213);
    if (SHIBYTE(v230[0]) >= 0)
      v215 = v229;
    else
      v215 = (void **)v229[0];
    if (v231 >= 0)
      v216 = (const char *)&v230[1];
    else
      v216 = (const char *)v230[1];
    md::LabelExternalFeature::addTextForZoom(v227, 0, 0, (const char *)v215, v216);
    v15 = v223;
    if (SHIBYTE(v234) < 0)
      operator delete(__p[1]);
  }
LABEL_314:
  if (SHIBYTE(__p[0]) < 0)
  {
    operator delete(v232[0]);
    if ((SHIBYTE(v231) & 0x80000000) == 0)
      goto LABEL_316;
  }
  else if ((SHIBYTE(v231) & 0x80000000) == 0)
  {
    goto LABEL_316;
  }
  operator delete(v230[1]);
LABEL_316:
  v186 = v227;
  if (SHIBYTE(v230[0]) < 0)
    operator delete(v229[0]);
LABEL_318:
  if (objc_msgSend(v15, "length", v223))
    md::LabelExternalFeature::addTextForZoom(v186, 0, 2, (const char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v224), "UTF8String"));
  v217 = v225;
  if (v46)
    (*(void (**)(uint64_t, uint64_t *, unint64_t))(*(_QWORD *)v40 + 40))(v40, v46, v43 - (_QWORD)v46);
  v218 = v236;
  v17 = v225;
  v14 = v226;
  if (v236)
  {
    v219 = (unint64_t *)&v236->__shared_owners_;
    do
      v220 = __ldaxr(v219);
    while (__stlxr(v220 - 1, v219));
    if (!v220)
    {
      ((void (*)(std::__shared_weak_count *))v218->__on_zero_shared)(v218);
      std::__shared_weak_count::__release_weak(v218);
    }
  }
  v16 = v224;
LABEL_328:

  return v17;
}

- (id)feature
{
  return self->_customFeature;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setCoordinate:(id)a3
{
  self->_coordinate = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customFeature, 0);
}

@end
