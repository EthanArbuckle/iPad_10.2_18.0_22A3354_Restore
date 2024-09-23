@implementation VKVenueGroup

- (VKVenueGroup)initWithStyleQuery:(void *)a3 tileZoom:(float)a4 layer:(int)a5 buildingId:(unint64_t)a6 contentScale:(float)a7 storage:(shared_ptr<md::MeshSetStorage>)a8
{
  MeshSetStorage *ptr;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  VKVenueGroup *v14;
  VKVenueGroup *v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  unint64_t *v22;
  char *v23;
  uint64_t *v24;
  uint64_t **v25;
  uint64_t **v26;
  unint64_t v27;
  uint64_t *v28;
  uint64_t *v29;
  unint64_t v30;
  uint64_t v31;
  __int128 v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char *v47;
  char *v48;
  unint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  void **p_value;
  void *v57;
  void **v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  std::__shared_weak_count *v62;
  unint64_t *v63;
  unint64_t v64;
  __int128 v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  std::__shared_weak_count *v69;
  unint64_t *v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  unint64_t *v75;
  char *v76;
  uint64_t *v77;
  uint64_t **v78;
  uint64_t **v79;
  unint64_t v80;
  uint64_t *v81;
  uint64_t *v82;
  unint64_t v83;
  uint64_t v84;
  __int128 v85;
  std::__shared_weak_count *v86;
  unint64_t *v87;
  unint64_t v88;
  std::__shared_weak_count *v89;
  unint64_t *v90;
  unint64_t v91;
  char *v92;
  char *v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  unint64_t v99;
  char *v100;
  char *v101;
  unint64_t v102;
  uint64_t v103;
  char *v104;
  char *v105;
  uint64_t v106;
  __int128 v107;
  uint64_t v108;
  void **v109;
  void *v110;
  void **v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  std::__shared_weak_count *v115;
  unint64_t *v116;
  unint64_t v117;
  __int128 v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t v121;
  __int128 v122;
  std::__shared_weak_count *v123;
  unint64_t *v124;
  unint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t *v128;
  char *v129;
  unint64_t *v130;
  char *v131;
  uint64_t *v132;
  uint64_t **v133;
  uint64_t **v134;
  unint64_t v135;
  uint64_t *v136;
  uint64_t *v137;
  unint64_t v138;
  uint64_t v139;
  __int128 v140;
  std::__shared_weak_count *v141;
  unint64_t *v142;
  unint64_t v143;
  std::__shared_weak_count *v144;
  unint64_t *v145;
  unint64_t v146;
  char *v147;
  char *v148;
  char *v149;
  uint64_t v150;
  uint64_t v151;
  unint64_t v152;
  uint64_t v153;
  unint64_t v154;
  char *v155;
  char *v156;
  unint64_t v157;
  uint64_t v158;
  char *v159;
  char *v160;
  uint64_t v161;
  __int128 v162;
  uint64_t v163;
  uint64_t *v164;
  void **v165;
  void *v166;
  void **v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  std::__shared_weak_count *v171;
  unint64_t *v172;
  unint64_t v173;
  __int128 v174;
  uint64_t v175;
  uint64_t v176;
  __int128 v177;
  std::__shared_weak_count *v178;
  unint64_t *v179;
  unint64_t v180;
  uint64_t v181;
  uint64_t v182;
  char *v183;
  unint64_t *v184;
  char *v185;
  uint64_t *v186;
  uint64_t **v187;
  uint64_t **v188;
  unint64_t v189;
  uint64_t *v190;
  uint64_t *v191;
  unint64_t v192;
  uint64_t v193;
  __int128 v194;
  std::__shared_weak_count *v195;
  unint64_t *v196;
  unint64_t v197;
  std::__shared_weak_count *v198;
  unint64_t *v199;
  unint64_t v200;
  char *v201;
  char *v202;
  char *v203;
  uint64_t v204;
  uint64_t v205;
  unint64_t v206;
  uint64_t v207;
  unint64_t v208;
  char *v209;
  char *v210;
  char *v211;
  unint64_t v212;
  uint64_t v213;
  char *v214;
  char *v215;
  uint64_t v216;
  __int128 v217;
  uint64_t v218;
  void **v219;
  void *v220;
  void **v221;
  uint64_t v222;
  uint64_t v223;
  void *v224;
  std::__shared_weak_count *v225;
  unint64_t *v226;
  unint64_t v227;
  __int128 v228;
  uint64_t v229;
  uint64_t v230;
  __int128 v231;
  std::__shared_weak_count *v232;
  unint64_t *v233;
  unint64_t v234;
  VKVenueGroup *v236;
  __int128 v237;
  _OWORD v238[2];
  __int128 v239;
  __int128 v240;
  __int16 v241;
  uint64_t v242;
  __int128 v243;
  __int128 v244;
  __int16 v245;
  uint64_t v246;
  _OWORD v247[3];
  objc_super v248;
  uint64_t v249;
  std::__shared_weak_count *v250;
  __int128 v251;

  ptr = a8.__ptr_;
  v11 = (std::__shared_weak_count *)*((_QWORD *)a8.__ptr_ + 1);
  v249 = *(_QWORD *)a8.__ptr_;
  v250 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  v248.receiver = self;
  v248.super_class = (Class)VKVenueGroup;
  v14 = -[VKPolygonGroup initWithStyleQuery:tileZoom:fixedAroundCentroid:contentScale:storage:](&v248, sel_initWithStyleQuery_tileZoom_fixedAroundCentroid_contentScale_storage_, a3, 0, &v249);
  v15 = v14;
  v16 = v250;
  if (!v250)
    goto LABEL_8;
  v17 = (unint64_t *)&v250->__shared_owners_;
  do
    v18 = __ldaxr(v17);
  while (__stlxr(v18 - 1, v17));
  if (!v18)
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
    if (!v15)
      return v15;
  }
  else
  {
LABEL_8:
    if (!v14)
      return v15;
  }
  v15->_layer = a5;
  v236 = v15;
  v15->_buildingId = a6;
  v19 = *(_QWORD *)ptr;
  LOBYTE(v247[0]) = 0;
  memset((char *)v247 + 2, 0, 38);
  v237 = 0u;
  memset(v238, 0, sizeof(v238));
  v239 = 0u;
  v246 = 0;
  v243 = 0uLL;
  v242 = 0;
  *((_QWORD *)&v247[0] + 1) = v19;
  if (!v19)
  {
    v19 = operator new();
    *(_QWORD *)(v19 + 160) = 0;
    *(_QWORD *)(v19 + 168) = 0;
    *(_OWORD *)(v19 + 128) = 0u;
    *(_OWORD *)(v19 + 144) = 0u;
    *(_OWORD *)(v19 + 96) = 0u;
    *(_OWORD *)(v19 + 112) = 0u;
    *(_OWORD *)(v19 + 64) = 0u;
    *(_OWORD *)(v19 + 80) = 0u;
    *(_OWORD *)(v19 + 32) = 0u;
    *(_OWORD *)(v19 + 48) = 0u;
    *(_OWORD *)v19 = 0u;
    *(_OWORD *)(v19 + 16) = 0u;
    *(_QWORD *)(v19 + 16) = v19 + 24;
    *(_QWORD *)(v19 + 120) = 0;
    *(_QWORD *)(v19 + 128) = 0;
    *(_QWORD *)(v19 + 136) = 0;
    v20 = *(_QWORD *)&v247[1];
    *(_QWORD *)&v247[1] = v19;
    if (v20)
      std::default_delete<md::MeshSetStorage>::operator()[abi:nn180100](v20);
    *((_QWORD *)&v247[0] + 1) = v19;
  }
  v21 = (char *)operator new(0x90uLL);
  *((_QWORD *)v21 + 1) = 0;
  v22 = (unint64_t *)(v21 + 8);
  *((_QWORD *)v21 + 2) = 0;
  *(_QWORD *)v21 = &off_1E42DC3C0;
  *((_QWORD *)v21 + 3) = v19;
  v23 = v21 + 24;
  *((_QWORD *)v21 + 4) = 24;
  *(_OWORD *)(v21 + 40) = 0u;
  *(_OWORD *)(v21 + 56) = 0u;
  *(_OWORD *)(v21 + 72) = 0u;
  *(_OWORD *)(v21 + 88) = 0u;
  v21[104] = 0;
  *((_QWORD *)v21 + 14) = &off_1E42CC020;
  *((_QWORD *)v21 + 17) = v21 + 112;
  *(_QWORD *)&v251 = v21 + 24;
  *((_QWORD *)&v251 + 1) = v21;
  v25 = (uint64_t **)(v19 + 24);
  v24 = *(uint64_t **)(v19 + 24);
  if (v24)
  {
    while (1)
    {
      while (1)
      {
        v26 = (uint64_t **)v24;
        v27 = v24[4];
        if ((unint64_t)v23 >= v27)
          break;
        v24 = *v26;
        v25 = v26;
        if (!*v26)
          goto LABEL_20;
      }
      if (v27 >= (unint64_t)v23)
        break;
      v24 = v26[1];
      if (!v24)
      {
        v25 = v26 + 1;
        goto LABEL_20;
      }
    }
  }
  else
  {
    v26 = (uint64_t **)(v19 + 24);
LABEL_20:
    v28 = (uint64_t *)operator new(0x30uLL);
    v29 = v28;
    v28[4] = (uint64_t)v23;
    v28[5] = (uint64_t)v21;
    do
      v30 = __ldxr(v22);
    while (__stxr(v30 + 1, v22));
    *v28 = 0;
    v28[1] = 0;
    v28[2] = (uint64_t)v26;
    *v25 = v28;
    v31 = **(_QWORD **)(v19 + 16);
    if (v31)
    {
      *(_QWORD *)(v19 + 16) = v31;
      v29 = *v25;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v19 + 24), v29);
    ++*(_QWORD *)(v19 + 32);
  }
  v32 = v251;
  v251 = 0uLL;
  v33 = *(std::__shared_weak_count **)&v247[2];
  *(_OWORD *)((char *)&v247[1] + 8) = v32;
  if (v33)
  {
    v34 = (unint64_t *)&v33->__shared_owners_;
    do
      v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  v36 = (std::__shared_weak_count *)*((_QWORD *)&v251 + 1);
  if (*((_QWORD *)&v251 + 1))
  {
    v37 = (unint64_t *)(*((_QWORD *)&v251 + 1) + 8);
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }
  v39 = (char *)*((_QWORD *)&v237 + 1);
  if (*((_QWORD *)&v237 + 1) >= *(_QWORD *)&v238[0])
  {
    v41 = (char *)v237;
    v42 = *((_QWORD *)&v237 + 1) - v237;
    v43 = (uint64_t)(*((_QWORD *)&v237 + 1) - v237) >> 3;
    v44 = v43 + 1;
    if ((unint64_t)(v43 + 1) >> 61)
      abort();
    v45 = *(_QWORD *)&v238[0] - v237;
    if ((uint64_t)(*(_QWORD *)&v238[0] - v237) >> 2 > v44)
      v44 = v45 >> 2;
    if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFF8)
      v46 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v46 = v44;
    if (v46 >> 61)
      goto LABEL_277;
    v47 = (char *)operator new(8 * v46);
    v48 = &v47[8 * v43];
    *(_WORD *)v48 = 0;
    *((_DWORD *)v48 + 1) = 0;
    v40 = v48 + 8;
    if (v39 != v41)
    {
      v49 = v39 - v41 - 8;
      if (v49 < 0x58)
        goto LABEL_284;
      if ((unint64_t)(&v39[-v42] - v47) < 0x20)
        goto LABEL_284;
      v50 = (v49 >> 3) + 1;
      v51 = &v47[8 * v43 - 16];
      v52 = v39 - 16;
      v53 = v50 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v54 = *(_OWORD *)v52;
        *((_OWORD *)v51 - 1) = *((_OWORD *)v52 - 1);
        *(_OWORD *)v51 = v54;
        v51 -= 32;
        v52 -= 32;
        v53 -= 4;
      }
      while (v53);
      v48 -= 8 * (v50 & 0x3FFFFFFFFFFFFFFCLL);
      v39 -= 8 * (v50 & 0x3FFFFFFFFFFFFFFCLL);
      if (v50 != (v50 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_284:
        do
        {
          v55 = *((_QWORD *)v39 - 1);
          v39 -= 8;
          *((_QWORD *)v48 - 1) = v55;
          v48 -= 8;
        }
        while (v39 != v41);
      }
    }
    *(_QWORD *)&v237 = v48;
    *((_QWORD *)&v237 + 1) = v40;
    *(_QWORD *)&v238[0] = &v47[8 * v46];
    if (v41)
      operator delete(v41);
  }
  else
  {
    **((_WORD **)&v237 + 1) = 0;
    *((_DWORD *)v39 + 1) = 0;
    v40 = v39 + 8;
  }
  *((_QWORD *)&v237 + 1) = v40;
  p_value = (void **)&v15->_venueWallMeshInfo._value;
  if (v15->_venueWallMeshInfo._hasValue)
  {
    v57 = *p_value;
    if (*p_value)
    {
      *(_QWORD *)v15->_anon_c48 = v57;
      operator delete(v57);
      *p_value = 0;
      *(_QWORD *)v15->_anon_c48 = 0;
      *(_QWORD *)&v15->_anon_c48[8] = 0;
    }
    *(_OWORD *)v15->_venueWallMeshInfo._value.data = v237;
    *(_QWORD *)&v15->_anon_c48[8] = *(_QWORD *)&v238[0];
    v237 = 0uLL;
    *(_QWORD *)&v238[0] = 0;
    v58 = (void **)&v15->_anon_c48[16];
    v59 = *(_QWORD *)&v15->_anon_c48[16];
    if (v59)
    {
      v60 = *(_QWORD *)&v15->_anon_c48[24];
      v61 = *(void **)&v15->_anon_c48[16];
      if (v60 != v59)
      {
        do
        {
          v62 = *(std::__shared_weak_count **)(v60 - 8);
          if (v62)
          {
            v63 = (unint64_t *)&v62->__shared_owners_;
            do
              v64 = __ldaxr(v63);
            while (__stlxr(v64 - 1, v63));
            if (!v64)
            {
              ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
              std::__shared_weak_count::__release_weak(v62);
            }
          }
          v60 -= 16;
        }
        while (v60 != v59);
        v61 = *v58;
      }
      *(_QWORD *)&v15->_anon_c48[24] = v59;
      operator delete(v61);
      *v58 = 0;
      *(_QWORD *)&v15->_anon_c48[24] = 0;
      *(_QWORD *)&v15->_anon_c48[32] = 0;
    }
    *(_OWORD *)&v15->_anon_c48[16] = *(_OWORD *)((char *)v238 + 8);
    *(_QWORD *)&v15->_anon_c48[32] = *((_QWORD *)&v238[1] + 1);
    memset((char *)v238 + 8, 0, 24);
    ggl::BufferMemory::operator=((uint64_t *)&v15->_anon_c48[40], (uint64_t)&v239);
    ggl::BufferMemory::operator=((uint64_t *)&v15->_anon_c48[88], (uint64_t)&v243);
    *(_OWORD *)&v15->_anon_c48[136] = v247[0];
    v66 = *(_QWORD *)&v247[1];
    *(_QWORD *)&v247[1] = 0;
    v67 = *(_QWORD *)&v15->_anon_c48[152];
    *(_QWORD *)&v15->_anon_c48[152] = v66;
    if (v67)
      std::default_delete<md::MeshSetStorage>::operator()[abi:nn180100](v67);
    v68 = *(_OWORD *)((char *)&v247[1] + 8);
    *((_QWORD *)&v247[1] + 1) = 0;
    *(_QWORD *)&v247[2] = 0;
    v69 = *(std::__shared_weak_count **)&v15->_anon_c48[168];
    *(_OWORD *)&v15->_anon_c48[160] = v68;
    if (v69)
    {
      v70 = (unint64_t *)&v69->__shared_owners_;
      do
        v71 = __ldaxr(v70);
      while (__stlxr(v71 - 1, v70));
      if (!v71)
      {
        ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
        std::__shared_weak_count::__release_weak(v69);
      }
    }
  }
  else
  {
    *p_value = 0;
    *(_QWORD *)v15->_anon_c48 = 0;
    *(_QWORD *)&v15->_anon_c48[8] = 0;
    *(_OWORD *)v15->_venueWallMeshInfo._value.data = v237;
    *(_QWORD *)&v15->_anon_c48[8] = *(_QWORD *)&v238[0];
    v237 = 0uLL;
    *(_QWORD *)&v238[0] = 0;
    *(_QWORD *)&v15->_anon_c48[16] = 0;
    *(_QWORD *)&v15->_anon_c48[24] = 0;
    *(_QWORD *)&v15->_anon_c48[32] = 0;
    *(_OWORD *)&v15->_anon_c48[16] = *(_OWORD *)((char *)v238 + 8);
    *(_QWORD *)&v15->_anon_c48[32] = *((_QWORD *)&v238[1] + 1);
    memset((char *)v238 + 8, 0, 24);
    *(_OWORD *)&v15->_anon_c48[40] = v239;
    *(_OWORD *)&v15->_anon_c48[56] = v240;
    *(_WORD *)&v15->_anon_c48[72] = v241;
    *(_QWORD *)&v15->_anon_c48[80] = v242;
    v242 = 0;
    v239 = 0uLL;
    *(_OWORD *)&v15->_anon_c48[88] = v243;
    *(_OWORD *)&v15->_anon_c48[104] = v244;
    *(_WORD *)&v15->_anon_c48[120] = v245;
    *(_QWORD *)&v15->_anon_c48[128] = v246;
    v246 = 0;
    v243 = 0uLL;
    *(_OWORD *)&v15->_anon_c48[136] = v247[0];
    v65 = v247[1];
    *(_QWORD *)&v247[1] = 0;
    *(_OWORD *)&v15->_anon_c48[152] = v65;
    *(_QWORD *)&v15->_anon_c48[168] = *(_QWORD *)&v247[2];
    *((_QWORD *)&v247[1] + 1) = 0;
    *(_QWORD *)&v247[2] = 0;
    v15->_venueWallMeshInfo._hasValue = 1;
  }
  md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&v237);
  v72 = *(_QWORD *)ptr;
  LOBYTE(v247[0]) = 0;
  memset((char *)v247 + 2, 0, 38);
  v237 = 0u;
  memset(v238, 0, sizeof(v238));
  v239 = 0u;
  v246 = 0;
  v243 = 0uLL;
  v242 = 0;
  *((_QWORD *)&v247[0] + 1) = v72;
  if (!v72)
  {
    v72 = operator new();
    *(_QWORD *)(v72 + 160) = 0;
    *(_QWORD *)(v72 + 168) = 0;
    *(_OWORD *)(v72 + 128) = 0u;
    *(_OWORD *)(v72 + 144) = 0u;
    *(_OWORD *)(v72 + 96) = 0u;
    *(_OWORD *)(v72 + 112) = 0u;
    *(_OWORD *)(v72 + 64) = 0u;
    *(_OWORD *)(v72 + 80) = 0u;
    *(_OWORD *)(v72 + 32) = 0u;
    *(_OWORD *)(v72 + 48) = 0u;
    *(_OWORD *)v72 = 0u;
    *(_OWORD *)(v72 + 16) = 0u;
    *(_QWORD *)(v72 + 16) = v72 + 24;
    *(_QWORD *)(v72 + 120) = 0;
    *(_QWORD *)(v72 + 128) = 0;
    *(_QWORD *)(v72 + 136) = 0;
    v73 = *(_QWORD *)&v247[1];
    *(_QWORD *)&v247[1] = v72;
    if (v73)
      std::default_delete<md::MeshSetStorage>::operator()[abi:nn180100](v73);
    *((_QWORD *)&v247[0] + 1) = v72;
  }
  v74 = (char *)operator new(0x90uLL);
  *((_QWORD *)v74 + 1) = 0;
  v75 = (unint64_t *)(v74 + 8);
  *((_QWORD *)v74 + 2) = 0;
  *(_QWORD *)v74 = &off_1E42DC3C0;
  *((_QWORD *)v74 + 3) = v72;
  v76 = v74 + 24;
  *((_QWORD *)v74 + 4) = 24;
  *(_OWORD *)(v74 + 40) = 0u;
  *(_OWORD *)(v74 + 56) = 0u;
  *(_OWORD *)(v74 + 72) = 0u;
  *(_OWORD *)(v74 + 88) = 0u;
  v74[104] = 0;
  *((_QWORD *)v74 + 14) = &off_1E42CC068;
  *((_QWORD *)v74 + 17) = v74 + 112;
  *(_QWORD *)&v251 = v74 + 24;
  *((_QWORD *)&v251 + 1) = v74;
  v78 = (uint64_t **)(v72 + 24);
  v77 = *(uint64_t **)(v72 + 24);
  if (v77)
  {
    while (1)
    {
      while (1)
      {
        v79 = (uint64_t **)v77;
        v80 = v77[4];
        if ((unint64_t)v76 >= v80)
          break;
        v77 = *v79;
        v78 = v79;
        if (!*v79)
          goto LABEL_88;
      }
      if (v80 >= (unint64_t)v76)
        break;
      v77 = v79[1];
      if (!v77)
      {
        v78 = v79 + 1;
        goto LABEL_88;
      }
    }
  }
  else
  {
    v79 = (uint64_t **)(v72 + 24);
LABEL_88:
    v81 = (uint64_t *)operator new(0x30uLL);
    v82 = v81;
    v81[4] = (uint64_t)v76;
    v81[5] = (uint64_t)v74;
    do
      v83 = __ldxr(v75);
    while (__stxr(v83 + 1, v75));
    *v81 = 0;
    v81[1] = 0;
    v81[2] = (uint64_t)v79;
    *v78 = v81;
    v84 = **(_QWORD **)(v72 + 16);
    if (v84)
    {
      *(_QWORD *)(v72 + 16) = v84;
      v82 = *v78;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v72 + 24), v82);
    ++*(_QWORD *)(v72 + 32);
  }
  v85 = v251;
  v251 = 0uLL;
  v86 = *(std::__shared_weak_count **)&v247[2];
  *(_OWORD *)((char *)&v247[1] + 8) = v85;
  if (v86)
  {
    v87 = (unint64_t *)&v86->__shared_owners_;
    do
      v88 = __ldaxr(v87);
    while (__stlxr(v88 - 1, v87));
    if (!v88)
    {
      ((void (*)(std::__shared_weak_count *))v86->__on_zero_shared)(v86);
      std::__shared_weak_count::__release_weak(v86);
    }
  }
  v89 = (std::__shared_weak_count *)*((_QWORD *)&v251 + 1);
  if (*((_QWORD *)&v251 + 1))
  {
    v90 = (unint64_t *)(*((_QWORD *)&v251 + 1) + 8);
    do
      v91 = __ldaxr(v90);
    while (__stlxr(v91 - 1, v90));
    if (!v91)
    {
      ((void (*)(std::__shared_weak_count *))v89->__on_zero_shared)(v89);
      std::__shared_weak_count::__release_weak(v89);
    }
  }
  v92 = (char *)*((_QWORD *)&v237 + 1);
  if (*((_QWORD *)&v237 + 1) >= *(_QWORD *)&v238[0])
  {
    v94 = (char *)v237;
    v95 = *((_QWORD *)&v237 + 1) - v237;
    v96 = (uint64_t)(*((_QWORD *)&v237 + 1) - v237) >> 3;
    v97 = v96 + 1;
    if ((unint64_t)(v96 + 1) >> 61)
      abort();
    v98 = *(_QWORD *)&v238[0] - v237;
    if ((uint64_t)(*(_QWORD *)&v238[0] - v237) >> 2 > v97)
      v97 = v98 >> 2;
    if ((unint64_t)v98 >= 0x7FFFFFFFFFFFFFF8)
      v99 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v99 = v97;
    if (v99 >> 61)
      goto LABEL_277;
    v100 = (char *)operator new(8 * v99);
    v101 = &v100[8 * v96];
    *(_WORD *)v101 = 0;
    *((_DWORD *)v101 + 1) = 0;
    v93 = v101 + 8;
    if (v92 != v94)
    {
      v102 = v92 - v94 - 8;
      if (v102 < 0x58)
        goto LABEL_285;
      if ((unint64_t)(&v92[-v95] - v100) < 0x20)
        goto LABEL_285;
      v103 = (v102 >> 3) + 1;
      v104 = &v100[8 * v96 - 16];
      v105 = v92 - 16;
      v106 = v103 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v107 = *(_OWORD *)v105;
        *((_OWORD *)v104 - 1) = *((_OWORD *)v105 - 1);
        *(_OWORD *)v104 = v107;
        v104 -= 32;
        v105 -= 32;
        v106 -= 4;
      }
      while (v106);
      v101 -= 8 * (v103 & 0x3FFFFFFFFFFFFFFCLL);
      v92 -= 8 * (v103 & 0x3FFFFFFFFFFFFFFCLL);
      if (v103 != (v103 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_285:
        do
        {
          v108 = *((_QWORD *)v92 - 1);
          v92 -= 8;
          *((_QWORD *)v101 - 1) = v108;
          v101 -= 8;
        }
        while (v92 != v94);
      }
    }
    *(_QWORD *)&v237 = v101;
    *((_QWORD *)&v237 + 1) = v93;
    *(_QWORD *)&v238[0] = &v100[8 * v99];
    if (v94)
      operator delete(v94);
  }
  else
  {
    **((_WORD **)&v237 + 1) = 0;
    *((_DWORD *)v92 + 1) = 0;
    v93 = v92 + 8;
  }
  *((_QWORD *)&v237 + 1) = v93;
  v109 = (void **)&v15->_venueWallEndCapMeshInfo._value;
  if (v15->_venueWallEndCapMeshInfo._hasValue)
  {
    v110 = *v109;
    if (*v109)
    {
      *(_QWORD *)v15->_anon_d08 = v110;
      operator delete(v110);
      *v109 = 0;
      *(_QWORD *)v15->_anon_d08 = 0;
      *(_QWORD *)&v15->_anon_d08[8] = 0;
    }
    *(_OWORD *)v15->_venueWallEndCapMeshInfo._value.data = v237;
    *(_QWORD *)&v15->_anon_d08[8] = *(_QWORD *)&v238[0];
    v237 = 0uLL;
    *(_QWORD *)&v238[0] = 0;
    v111 = (void **)&v15->_anon_d08[16];
    v112 = *(_QWORD *)&v15->_anon_d08[16];
    if (v112)
    {
      v113 = *(_QWORD *)&v15->_anon_d08[24];
      v114 = *(void **)&v15->_anon_d08[16];
      if (v113 != v112)
      {
        do
        {
          v115 = *(std::__shared_weak_count **)(v113 - 8);
          if (v115)
          {
            v116 = (unint64_t *)&v115->__shared_owners_;
            do
              v117 = __ldaxr(v116);
            while (__stlxr(v117 - 1, v116));
            if (!v117)
            {
              ((void (*)(std::__shared_weak_count *))v115->__on_zero_shared)(v115);
              std::__shared_weak_count::__release_weak(v115);
            }
          }
          v113 -= 16;
        }
        while (v113 != v112);
        v114 = *v111;
      }
      *(_QWORD *)&v15->_anon_d08[24] = v112;
      operator delete(v114);
      *v111 = 0;
      *(_QWORD *)&v15->_anon_d08[24] = 0;
      *(_QWORD *)&v15->_anon_d08[32] = 0;
    }
    *(_OWORD *)&v15->_anon_d08[16] = *(_OWORD *)((char *)v238 + 8);
    *(_QWORD *)&v15->_anon_d08[32] = *((_QWORD *)&v238[1] + 1);
    memset((char *)v238 + 8, 0, 24);
    ggl::BufferMemory::operator=((uint64_t *)&v15->_anon_d08[40], (uint64_t)&v239);
    ggl::BufferMemory::operator=((uint64_t *)&v15->_anon_d08[88], (uint64_t)&v243);
    *(_OWORD *)&v15->_anon_d08[136] = v247[0];
    v120 = *(_QWORD *)&v247[1];
    *(_QWORD *)&v247[1] = 0;
    v121 = *(_QWORD *)&v15->_anon_d08[152];
    *(_QWORD *)&v15->_anon_d08[152] = v120;
    if (v121)
      std::default_delete<md::MeshSetStorage>::operator()[abi:nn180100](v121);
    v122 = *(_OWORD *)((char *)&v247[1] + 8);
    *((_QWORD *)&v247[1] + 1) = 0;
    *(_QWORD *)&v247[2] = 0;
    v123 = *(std::__shared_weak_count **)&v15->_anon_d08[168];
    *(_OWORD *)&v15->_anon_d08[160] = v122;
    v119 = (uint64_t *)ptr;
    if (v123)
    {
      v124 = (unint64_t *)&v123->__shared_owners_;
      do
        v125 = __ldaxr(v124);
      while (__stlxr(v125 - 1, v124));
      if (!v125)
      {
        ((void (*)(std::__shared_weak_count *))v123->__on_zero_shared)(v123);
        std::__shared_weak_count::__release_weak(v123);
      }
    }
  }
  else
  {
    *v109 = 0;
    *(_QWORD *)v15->_anon_d08 = 0;
    *(_QWORD *)&v15->_anon_d08[8] = 0;
    *(_OWORD *)v15->_venueWallEndCapMeshInfo._value.data = v237;
    *(_QWORD *)&v15->_anon_d08[8] = *(_QWORD *)&v238[0];
    v237 = 0uLL;
    *(_QWORD *)&v238[0] = 0;
    *(_QWORD *)&v15->_anon_d08[16] = 0;
    *(_QWORD *)&v15->_anon_d08[24] = 0;
    *(_QWORD *)&v15->_anon_d08[32] = 0;
    *(_OWORD *)&v15->_anon_d08[16] = *(_OWORD *)((char *)v238 + 8);
    *(_QWORD *)&v15->_anon_d08[32] = *((_QWORD *)&v238[1] + 1);
    memset((char *)v238 + 8, 0, 24);
    *(_OWORD *)&v15->_anon_d08[40] = v239;
    *(_OWORD *)&v15->_anon_d08[56] = v240;
    *(_WORD *)&v15->_anon_d08[72] = v241;
    *(_QWORD *)&v15->_anon_d08[80] = v242;
    v242 = 0;
    v239 = 0uLL;
    *(_OWORD *)&v15->_anon_d08[88] = v243;
    *(_OWORD *)&v15->_anon_d08[104] = v244;
    *(_WORD *)&v15->_anon_d08[120] = v245;
    *(_QWORD *)&v15->_anon_d08[128] = v246;
    v246 = 0;
    v243 = 0uLL;
    *(_OWORD *)&v15->_anon_d08[136] = v247[0];
    v118 = v247[1];
    *(_QWORD *)&v247[1] = 0;
    *(_OWORD *)&v15->_anon_d08[152] = v118;
    *(_QWORD *)&v15->_anon_d08[168] = *(_QWORD *)&v247[2];
    *((_QWORD *)&v247[1] + 1) = 0;
    *(_QWORD *)&v247[2] = 0;
    v15->_venueWallEndCapMeshInfo._hasValue = 1;
    v119 = (uint64_t *)ptr;
  }
  md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&v237);
  v126 = *v119;
  LOBYTE(v247[0]) = 0;
  memset((char *)v247 + 2, 0, 38);
  v237 = 0u;
  memset(v238, 0, sizeof(v238));
  v239 = 0u;
  v246 = 0;
  v243 = 0uLL;
  v242 = 0;
  *((_QWORD *)&v247[0] + 1) = v126;
  if (!v126)
  {
    v126 = operator new();
    *(_QWORD *)(v126 + 160) = 0;
    *(_QWORD *)(v126 + 168) = 0;
    *(_OWORD *)(v126 + 128) = 0u;
    *(_OWORD *)(v126 + 144) = 0u;
    *(_OWORD *)(v126 + 96) = 0u;
    *(_OWORD *)(v126 + 112) = 0u;
    *(_OWORD *)(v126 + 64) = 0u;
    *(_OWORD *)(v126 + 80) = 0u;
    *(_OWORD *)(v126 + 32) = 0u;
    *(_OWORD *)(v126 + 48) = 0u;
    *(_OWORD *)v126 = 0u;
    *(_OWORD *)(v126 + 16) = 0u;
    *(_QWORD *)(v126 + 16) = v126 + 24;
    *(_QWORD *)(v126 + 120) = 0;
    *(_QWORD *)(v126 + 128) = 0;
    *(_QWORD *)(v126 + 136) = 0;
    v127 = *(_QWORD *)&v247[1];
    *(_QWORD *)&v247[1] = v126;
    if (v127)
      std::default_delete<md::MeshSetStorage>::operator()[abi:nn180100](v127);
    *((_QWORD *)&v247[0] + 1) = v126;
  }
  v128 = v119;
  v129 = (char *)operator new(0x90uLL);
  *((_QWORD *)v129 + 1) = 0;
  v130 = (unint64_t *)(v129 + 8);
  *((_QWORD *)v129 + 2) = 0;
  *(_QWORD *)v129 = &off_1E42DC3C0;
  *((_QWORD *)v129 + 3) = v126;
  v131 = v129 + 24;
  *((_QWORD *)v129 + 4) = 40;
  *(_OWORD *)(v129 + 40) = 0u;
  *(_OWORD *)(v129 + 56) = 0u;
  *(_OWORD *)(v129 + 72) = 0u;
  *(_OWORD *)(v129 + 88) = 0u;
  v129[104] = 0;
  *((_QWORD *)v129 + 14) = &off_1E42CBF48;
  *((_QWORD *)v129 + 17) = v129 + 112;
  *(_QWORD *)&v251 = v129 + 24;
  *((_QWORD *)&v251 + 1) = v129;
  v133 = (uint64_t **)(v126 + 24);
  v132 = *(uint64_t **)(v126 + 24);
  if (v132)
  {
    while (1)
    {
      while (1)
      {
        v134 = (uint64_t **)v132;
        v135 = v132[4];
        if ((unint64_t)v131 >= v135)
          break;
        v132 = *v134;
        v133 = v134;
        if (!*v134)
          goto LABEL_154;
      }
      if (v135 >= (unint64_t)v131)
        break;
      v132 = v134[1];
      if (!v132)
      {
        v133 = v134 + 1;
        goto LABEL_154;
      }
    }
  }
  else
  {
    v134 = (uint64_t **)(v126 + 24);
LABEL_154:
    v136 = (uint64_t *)operator new(0x30uLL);
    v137 = v136;
    v136[4] = (uint64_t)v131;
    v136[5] = (uint64_t)v129;
    do
      v138 = __ldxr(v130);
    while (__stxr(v138 + 1, v130));
    *v136 = 0;
    v136[1] = 0;
    v136[2] = (uint64_t)v134;
    *v133 = v136;
    v139 = **(_QWORD **)(v126 + 16);
    if (v139)
    {
      *(_QWORD *)(v126 + 16) = v139;
      v137 = *v133;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v126 + 24), v137);
    ++*(_QWORD *)(v126 + 32);
  }
  v140 = v251;
  v251 = 0uLL;
  v141 = *(std::__shared_weak_count **)&v247[2];
  *(_OWORD *)((char *)&v247[1] + 8) = v140;
  if (v141)
  {
    v142 = (unint64_t *)&v141->__shared_owners_;
    do
      v143 = __ldaxr(v142);
    while (__stlxr(v143 - 1, v142));
    if (!v143)
    {
      ((void (*)(std::__shared_weak_count *))v141->__on_zero_shared)(v141);
      std::__shared_weak_count::__release_weak(v141);
    }
  }
  v144 = (std::__shared_weak_count *)*((_QWORD *)&v251 + 1);
  if (*((_QWORD *)&v251 + 1))
  {
    v145 = (unint64_t *)(*((_QWORD *)&v251 + 1) + 8);
    do
      v146 = __ldaxr(v145);
    while (__stlxr(v146 - 1, v145));
    if (!v146)
    {
      ((void (*)(std::__shared_weak_count *))v144->__on_zero_shared)(v144);
      std::__shared_weak_count::__release_weak(v144);
    }
  }
  v147 = (char *)*((_QWORD *)&v237 + 1);
  if (*((_QWORD *)&v237 + 1) >= *(_QWORD *)&v238[0])
  {
    v149 = (char *)v237;
    v150 = *((_QWORD *)&v237 + 1) - v237;
    v151 = (uint64_t)(*((_QWORD *)&v237 + 1) - v237) >> 3;
    v152 = v151 + 1;
    if ((unint64_t)(v151 + 1) >> 61)
      abort();
    v153 = *(_QWORD *)&v238[0] - v237;
    if ((uint64_t)(*(_QWORD *)&v238[0] - v237) >> 2 > v152)
      v152 = v153 >> 2;
    if ((unint64_t)v153 >= 0x7FFFFFFFFFFFFFF8)
      v154 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v154 = v152;
    if (v154 >> 61)
      goto LABEL_277;
    v155 = (char *)operator new(8 * v154);
    v156 = &v155[8 * v151];
    *(_WORD *)v156 = 0;
    *((_DWORD *)v156 + 1) = 0;
    v148 = v156 + 8;
    if (v147 != v149)
    {
      v157 = v147 - v149 - 8;
      if (v157 < 0x58)
        goto LABEL_286;
      if ((unint64_t)(&v147[-v150] - v155) < 0x20)
        goto LABEL_286;
      v158 = (v157 >> 3) + 1;
      v159 = &v155[8 * v151 - 16];
      v160 = v147 - 16;
      v161 = v158 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v162 = *(_OWORD *)v160;
        *((_OWORD *)v159 - 1) = *((_OWORD *)v160 - 1);
        *(_OWORD *)v159 = v162;
        v159 -= 32;
        v160 -= 32;
        v161 -= 4;
      }
      while (v161);
      v156 -= 8 * (v158 & 0x3FFFFFFFFFFFFFFCLL);
      v147 -= 8 * (v158 & 0x3FFFFFFFFFFFFFFCLL);
      if (v158 != (v158 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_286:
        do
        {
          v163 = *((_QWORD *)v147 - 1);
          v147 -= 8;
          *((_QWORD *)v156 - 1) = v163;
          v156 -= 8;
        }
        while (v147 != v149);
      }
    }
    *(_QWORD *)&v237 = v156;
    *((_QWORD *)&v237 + 1) = v148;
    *(_QWORD *)&v238[0] = &v155[8 * v154];
    if (v149)
      operator delete(v149);
  }
  else
  {
    **((_WORD **)&v237 + 1) = 0;
    *((_DWORD *)v147 + 1) = 0;
    v148 = v147 + 8;
  }
  v164 = v128;
  *((_QWORD *)&v237 + 1) = v148;
  v165 = (void **)&v15->_venueWallHorizontalStrokeMeshInfo._value;
  if (v15->_venueWallHorizontalStrokeMeshInfo._hasValue)
  {
    v166 = *v165;
    if (*v165)
    {
      *(_QWORD *)v15->_anon_dc8 = v166;
      operator delete(v166);
      *v165 = 0;
      *(_QWORD *)v15->_anon_dc8 = 0;
      *(_QWORD *)&v15->_anon_dc8[8] = 0;
    }
    *(_OWORD *)v15->_venueWallHorizontalStrokeMeshInfo._value.data = v237;
    *(_QWORD *)&v15->_anon_dc8[8] = *(_QWORD *)&v238[0];
    v237 = 0uLL;
    *(_QWORD *)&v238[0] = 0;
    v167 = (void **)&v15->_anon_dc8[16];
    v168 = *(_QWORD *)&v15->_anon_dc8[16];
    if (v168)
    {
      v169 = *(_QWORD *)&v15->_anon_dc8[24];
      v170 = *(void **)&v15->_anon_dc8[16];
      if (v169 != v168)
      {
        do
        {
          v171 = *(std::__shared_weak_count **)(v169 - 8);
          if (v171)
          {
            v172 = (unint64_t *)&v171->__shared_owners_;
            do
              v173 = __ldaxr(v172);
            while (__stlxr(v173 - 1, v172));
            if (!v173)
            {
              ((void (*)(std::__shared_weak_count *))v171->__on_zero_shared)(v171);
              std::__shared_weak_count::__release_weak(v171);
            }
          }
          v169 -= 16;
        }
        while (v169 != v168);
        v170 = *v167;
      }
      *(_QWORD *)&v15->_anon_dc8[24] = v168;
      operator delete(v170);
      *v167 = 0;
      *(_QWORD *)&v15->_anon_dc8[24] = 0;
      *(_QWORD *)&v15->_anon_dc8[32] = 0;
    }
    *(_OWORD *)&v15->_anon_dc8[16] = *(_OWORD *)((char *)v238 + 8);
    *(_QWORD *)&v15->_anon_dc8[32] = *((_QWORD *)&v238[1] + 1);
    memset((char *)v238 + 8, 0, 24);
    ggl::BufferMemory::operator=((uint64_t *)&v15->_anon_dc8[40], (uint64_t)&v239);
    ggl::BufferMemory::operator=((uint64_t *)&v15->_anon_dc8[88], (uint64_t)&v243);
    *(_OWORD *)&v15->_anon_dc8[136] = v247[0];
    v175 = *(_QWORD *)&v247[1];
    *(_QWORD *)&v247[1] = 0;
    v176 = *(_QWORD *)&v15->_anon_dc8[152];
    *(_QWORD *)&v15->_anon_dc8[152] = v175;
    if (v176)
      std::default_delete<md::MeshSetStorage>::operator()[abi:nn180100](v176);
    v177 = *(_OWORD *)((char *)&v247[1] + 8);
    *((_QWORD *)&v247[1] + 1) = 0;
    *(_QWORD *)&v247[2] = 0;
    v178 = *(std::__shared_weak_count **)&v15->_anon_dc8[168];
    *(_OWORD *)&v15->_anon_dc8[160] = v177;
    if (v178)
    {
      v179 = (unint64_t *)&v178->__shared_owners_;
      do
        v180 = __ldaxr(v179);
      while (__stlxr(v180 - 1, v179));
      if (!v180)
      {
        ((void (*)(std::__shared_weak_count *))v178->__on_zero_shared)(v178);
        std::__shared_weak_count::__release_weak(v178);
      }
    }
  }
  else
  {
    *v165 = 0;
    *(_QWORD *)v15->_anon_dc8 = 0;
    *(_QWORD *)&v15->_anon_dc8[8] = 0;
    *(_OWORD *)v15->_venueWallHorizontalStrokeMeshInfo._value.data = v237;
    *(_QWORD *)&v15->_anon_dc8[8] = *(_QWORD *)&v238[0];
    v237 = 0uLL;
    *(_QWORD *)&v238[0] = 0;
    *(_QWORD *)&v15->_anon_dc8[16] = 0;
    *(_QWORD *)&v15->_anon_dc8[24] = 0;
    *(_QWORD *)&v15->_anon_dc8[32] = 0;
    *(_OWORD *)&v15->_anon_dc8[16] = *(_OWORD *)((char *)v238 + 8);
    *(_QWORD *)&v15->_anon_dc8[32] = *((_QWORD *)&v238[1] + 1);
    memset((char *)v238 + 8, 0, 24);
    *(_OWORD *)&v15->_anon_dc8[40] = v239;
    *(_OWORD *)&v15->_anon_dc8[56] = v240;
    *(_WORD *)&v15->_anon_dc8[72] = v241;
    *(_QWORD *)&v15->_anon_dc8[80] = v242;
    v242 = 0;
    v239 = 0uLL;
    *(_OWORD *)&v15->_anon_dc8[88] = v243;
    *(_OWORD *)&v15->_anon_dc8[104] = v244;
    *(_WORD *)&v15->_anon_dc8[120] = v245;
    *(_QWORD *)&v15->_anon_dc8[128] = v246;
    v246 = 0;
    v243 = 0uLL;
    *(_OWORD *)&v15->_anon_dc8[136] = v247[0];
    v174 = v247[1];
    *(_QWORD *)&v247[1] = 0;
    *(_OWORD *)&v15->_anon_dc8[152] = v174;
    *(_QWORD *)&v15->_anon_dc8[168] = *(_QWORD *)&v247[2];
    *((_QWORD *)&v247[1] + 1) = 0;
    *(_QWORD *)&v247[2] = 0;
    v15->_venueWallHorizontalStrokeMeshInfo._hasValue = 1;
  }
  md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&v237);
  v181 = *v164;
  LOBYTE(v247[0]) = 0;
  memset((char *)v247 + 2, 0, 38);
  v237 = 0u;
  memset(v238, 0, sizeof(v238));
  v239 = 0u;
  v246 = 0;
  v243 = 0uLL;
  v242 = 0;
  *((_QWORD *)&v247[0] + 1) = v181;
  if (!v181)
  {
    v181 = operator new();
    *(_QWORD *)(v181 + 160) = 0;
    *(_QWORD *)(v181 + 168) = 0;
    *(_OWORD *)(v181 + 128) = 0u;
    *(_OWORD *)(v181 + 144) = 0u;
    *(_OWORD *)(v181 + 96) = 0u;
    *(_OWORD *)(v181 + 112) = 0u;
    *(_OWORD *)(v181 + 64) = 0u;
    *(_OWORD *)(v181 + 80) = 0u;
    *(_OWORD *)(v181 + 32) = 0u;
    *(_OWORD *)(v181 + 48) = 0u;
    *(_OWORD *)v181 = 0u;
    *(_OWORD *)(v181 + 16) = 0u;
    *(_QWORD *)(v181 + 16) = v181 + 24;
    *(_QWORD *)(v181 + 120) = 0;
    *(_QWORD *)(v181 + 128) = 0;
    *(_QWORD *)(v181 + 136) = 0;
    v182 = *(_QWORD *)&v247[1];
    *(_QWORD *)&v247[1] = v181;
    if (v182)
      std::default_delete<md::MeshSetStorage>::operator()[abi:nn180100](v182);
    *((_QWORD *)&v247[0] + 1) = v181;
  }
  v183 = (char *)operator new(0x90uLL);
  *((_QWORD *)v183 + 1) = 0;
  v184 = (unint64_t *)(v183 + 8);
  *((_QWORD *)v183 + 2) = 0;
  *(_QWORD *)v183 = &off_1E42DC3C0;
  *((_QWORD *)v183 + 3) = v181;
  v185 = v183 + 24;
  *((_QWORD *)v183 + 4) = 32;
  *(_OWORD *)(v183 + 40) = 0u;
  *(_OWORD *)(v183 + 56) = 0u;
  *(_OWORD *)(v183 + 72) = 0u;
  *(_OWORD *)(v183 + 88) = 0u;
  v183[104] = 0;
  *((_QWORD *)v183 + 14) = &off_1E42CBF00;
  *((_QWORD *)v183 + 17) = v183 + 112;
  *(_QWORD *)&v251 = v183 + 24;
  *((_QWORD *)&v251 + 1) = v183;
  v187 = (uint64_t **)(v181 + 24);
  v186 = *(uint64_t **)(v181 + 24);
  if (v186)
  {
    while (1)
    {
      while (1)
      {
        v188 = (uint64_t **)v186;
        v189 = v186[4];
        if ((unint64_t)v185 >= v189)
          break;
        v186 = *v188;
        v187 = v188;
        if (!*v188)
          goto LABEL_220;
      }
      if (v189 >= (unint64_t)v185)
        break;
      v186 = v188[1];
      if (!v186)
      {
        v187 = v188 + 1;
        goto LABEL_220;
      }
    }
  }
  else
  {
    v188 = (uint64_t **)(v181 + 24);
LABEL_220:
    v190 = (uint64_t *)operator new(0x30uLL);
    v191 = v190;
    v190[4] = (uint64_t)v185;
    v190[5] = (uint64_t)v183;
    do
      v192 = __ldxr(v184);
    while (__stxr(v192 + 1, v184));
    *v190 = 0;
    v190[1] = 0;
    v190[2] = (uint64_t)v188;
    *v187 = v190;
    v193 = **(_QWORD **)(v181 + 16);
    if (v193)
    {
      *(_QWORD *)(v181 + 16) = v193;
      v191 = *v187;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v181 + 24), v191);
    ++*(_QWORD *)(v181 + 32);
  }
  v194 = v251;
  v251 = 0uLL;
  v195 = *(std::__shared_weak_count **)&v247[2];
  *(_OWORD *)((char *)&v247[1] + 8) = v194;
  v15 = v236;
  if (v195)
  {
    v196 = (unint64_t *)&v195->__shared_owners_;
    do
      v197 = __ldaxr(v196);
    while (__stlxr(v197 - 1, v196));
    if (!v197)
    {
      ((void (*)(std::__shared_weak_count *))v195->__on_zero_shared)(v195);
      std::__shared_weak_count::__release_weak(v195);
    }
  }
  v198 = (std::__shared_weak_count *)*((_QWORD *)&v251 + 1);
  if (*((_QWORD *)&v251 + 1))
  {
    v199 = (unint64_t *)(*((_QWORD *)&v251 + 1) + 8);
    do
      v200 = __ldaxr(v199);
    while (__stlxr(v200 - 1, v199));
    if (!v200)
    {
      ((void (*)(std::__shared_weak_count *))v198->__on_zero_shared)(v198);
      std::__shared_weak_count::__release_weak(v198);
    }
  }
  v201 = (char *)*((_QWORD *)&v237 + 1);
  if (*((_QWORD *)&v237 + 1) >= *(_QWORD *)&v238[0])
  {
    v203 = (char *)v237;
    v204 = *((_QWORD *)&v237 + 1) - v237;
    v205 = (uint64_t)(*((_QWORD *)&v237 + 1) - v237) >> 3;
    v206 = v205 + 1;
    if ((unint64_t)(v205 + 1) >> 61)
      abort();
    v207 = *(_QWORD *)&v238[0] - v237;
    if ((uint64_t)(*(_QWORD *)&v238[0] - v237) >> 2 > v206)
      v206 = v207 >> 2;
    if ((unint64_t)v207 >= 0x7FFFFFFFFFFFFFF8)
      v208 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v208 = v206;
    if (!(v208 >> 61))
    {
      v209 = (char *)operator new(8 * v208);
      v210 = &v209[8 * v205];
      v211 = &v209[8 * v208];
      *(_WORD *)v210 = 0;
      *((_DWORD *)v210 + 1) = 0;
      v202 = v210 + 8;
      if (v201 != v203)
      {
        v212 = v201 - v203 - 8;
        if (v212 < 0x58)
          goto LABEL_287;
        if ((unint64_t)(&v201[-v204] - v209) < 0x20)
          goto LABEL_287;
        v213 = (v212 >> 3) + 1;
        v214 = &v209[8 * v205 - 16];
        v215 = v201 - 16;
        v216 = v213 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v217 = *(_OWORD *)v215;
          *((_OWORD *)v214 - 1) = *((_OWORD *)v215 - 1);
          *(_OWORD *)v214 = v217;
          v214 -= 32;
          v215 -= 32;
          v216 -= 4;
        }
        while (v216);
        v210 -= 8 * (v213 & 0x3FFFFFFFFFFFFFFCLL);
        v201 -= 8 * (v213 & 0x3FFFFFFFFFFFFFFCLL);
        if (v213 != (v213 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_287:
          do
          {
            v218 = *((_QWORD *)v201 - 1);
            v201 -= 8;
            *((_QWORD *)v210 - 1) = v218;
            v210 -= 8;
          }
          while (v201 != v203);
        }
      }
      *(_QWORD *)&v237 = v210;
      *((_QWORD *)&v237 + 1) = v202;
      *(_QWORD *)&v238[0] = v211;
      if (v203)
        operator delete(v203);
      goto LABEL_253;
    }
LABEL_277:
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  **((_WORD **)&v237 + 1) = 0;
  *((_DWORD *)v201 + 1) = 0;
  v202 = v201 + 8;
LABEL_253:
  *((_QWORD *)&v237 + 1) = v202;
  v219 = (void **)&v236->_venueWallVerticalStrokeMeshInfo._value;
  if (v236->_venueWallVerticalStrokeMeshInfo._hasValue)
  {
    v220 = *v219;
    if (*v219)
    {
      *(_QWORD *)v236->_anon_e88 = v220;
      operator delete(v220);
      *v219 = 0;
      *(_QWORD *)v236->_anon_e88 = 0;
      *(_QWORD *)&v236->_anon_e88[8] = 0;
    }
    *(_OWORD *)v236->_venueWallVerticalStrokeMeshInfo._value.data = v237;
    *(_QWORD *)&v236->_anon_e88[8] = *(_QWORD *)&v238[0];
    v237 = 0uLL;
    *(_QWORD *)&v238[0] = 0;
    v221 = (void **)&v236->_anon_e88[16];
    v222 = *(_QWORD *)&v236->_anon_e88[16];
    if (v222)
    {
      v223 = *(_QWORD *)&v236->_anon_e88[24];
      v224 = *(void **)&v236->_anon_e88[16];
      if (v223 != v222)
      {
        do
        {
          v225 = *(std::__shared_weak_count **)(v223 - 8);
          if (v225)
          {
            v226 = (unint64_t *)&v225->__shared_owners_;
            do
              v227 = __ldaxr(v226);
            while (__stlxr(v227 - 1, v226));
            if (!v227)
            {
              ((void (*)(std::__shared_weak_count *))v225->__on_zero_shared)(v225);
              std::__shared_weak_count::__release_weak(v225);
            }
          }
          v223 -= 16;
        }
        while (v223 != v222);
        v224 = *v221;
      }
      *(_QWORD *)&v236->_anon_e88[24] = v222;
      operator delete(v224);
      *v221 = 0;
      *(_QWORD *)&v236->_anon_e88[24] = 0;
      *(_QWORD *)&v236->_anon_e88[32] = 0;
    }
    *(_OWORD *)&v236->_anon_e88[16] = *(_OWORD *)((char *)v238 + 8);
    *(_QWORD *)&v236->_anon_e88[32] = *((_QWORD *)&v238[1] + 1);
    memset((char *)v238 + 8, 0, 24);
    ggl::BufferMemory::operator=((uint64_t *)&v236->_anon_e88[40], (uint64_t)&v239);
    ggl::BufferMemory::operator=((uint64_t *)&v236->_anon_e88[88], (uint64_t)&v243);
    *(_OWORD *)&v236->_anon_e88[136] = v247[0];
    v229 = *(_QWORD *)&v247[1];
    *(_QWORD *)&v247[1] = 0;
    v230 = *(_QWORD *)&v236->_anon_e88[152];
    *(_QWORD *)&v236->_anon_e88[152] = v229;
    if (v230)
      std::default_delete<md::MeshSetStorage>::operator()[abi:nn180100](v230);
    v231 = *(_OWORD *)((char *)&v247[1] + 8);
    *((_QWORD *)&v247[1] + 1) = 0;
    *(_QWORD *)&v247[2] = 0;
    v232 = *(std::__shared_weak_count **)&v236->_anon_e88[168];
    *(_OWORD *)&v236->_anon_e88[160] = v231;
    if (v232)
    {
      v233 = (unint64_t *)&v232->__shared_owners_;
      do
        v234 = __ldaxr(v233);
      while (__stlxr(v234 - 1, v233));
      if (!v234)
      {
        ((void (*)(std::__shared_weak_count *))v232->__on_zero_shared)(v232);
        std::__shared_weak_count::__release_weak(v232);
      }
    }
  }
  else
  {
    *v219 = 0;
    *(_QWORD *)v236->_anon_e88 = 0;
    *(_QWORD *)&v236->_anon_e88[8] = 0;
    *(_OWORD *)v236->_venueWallVerticalStrokeMeshInfo._value.data = v237;
    *(_QWORD *)&v236->_anon_e88[8] = *(_QWORD *)&v238[0];
    v237 = 0uLL;
    *(_QWORD *)&v238[0] = 0;
    *(_QWORD *)&v236->_anon_e88[16] = 0;
    *(_QWORD *)&v236->_anon_e88[24] = 0;
    *(_QWORD *)&v236->_anon_e88[32] = 0;
    *(_OWORD *)&v236->_anon_e88[16] = *(_OWORD *)((char *)v238 + 8);
    *(_QWORD *)&v236->_anon_e88[32] = *((_QWORD *)&v238[1] + 1);
    memset((char *)v238 + 8, 0, 24);
    *(_OWORD *)&v236->_anon_e88[40] = v239;
    *(_OWORD *)&v236->_anon_e88[56] = v240;
    *(_WORD *)&v236->_anon_e88[72] = v241;
    *(_QWORD *)&v236->_anon_e88[80] = v242;
    v242 = 0;
    v239 = 0uLL;
    *(_OWORD *)&v236->_anon_e88[88] = v243;
    *(_OWORD *)&v236->_anon_e88[104] = v244;
    *(_WORD *)&v236->_anon_e88[120] = v245;
    *(_QWORD *)&v236->_anon_e88[128] = v246;
    v246 = 0;
    v243 = 0uLL;
    *(_OWORD *)&v236->_anon_e88[136] = v247[0];
    v228 = v247[1];
    *(_QWORD *)&v247[1] = 0;
    *(_OWORD *)&v236->_anon_e88[152] = v228;
    *(_QWORD *)&v236->_anon_e88[168] = *(_QWORD *)&v247[2];
    *((_QWORD *)&v247[1] + 1) = 0;
    *(_QWORD *)&v247[2] = 0;
    v236->_venueWallVerticalStrokeMeshInfo._hasValue = 1;
  }
  md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&v237);
  return v15;
}

- (VKVenueGroup)initWithStyleQuery:(void *)a3 tileZoom:(float)a4 layer:(int)a5 buildingId:(unint64_t)a6 contentScale:(float)a7
{
  VKVenueGroup *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  uint64_t v12;
  std::__shared_weak_count *v13;

  v12 = 0;
  v13 = 0;
  v7 = -[VKPolygonGroup initWithStyleQuery:tileZoom:fixedAroundCentroid:contentScale:storage:](self, "initWithStyleQuery:tileZoom:fixedAroundCentroid:contentScale:storage:", a3, 0, &v12);
  v8 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }

  return v7;
}

- (const)venueWallMeshes
{
  return &self->_venueWallMeshes;
}

- (const)venueWallEndMeshes
{
  return &self->_venueWallEndMeshes;
}

- (const)venueWallHorizontalStrokeMeshes
{
  return &self->_venueWallHorizontalStrokeMeshes;
}

- (const)venueWallVerticalStrokeMeshes
{
  return &self->_venueWallVerticalStrokeMeshes;
}

- (unint64_t)buildingId
{
  return self->_buildingId;
}

- (float)maximumSectionLength
{
  return self->_maximumSectionLength;
}

- (void)wallTexture
{
  return self->_wallTexture.__ptr_;
}

- (const)generateEdgeListForPolygonSection:(const void *)a3 key:(const void *)a4
{
  _QWORD *v5;
  _QWORD *v6;
  void **v7;
  _BYTE *v8;
  unint64_t v9;
  _BYTE *v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  int *v21;
  int v22;
  int v23;
  unint64_t v24;
  int *v25;
  int v26;
  int v27;
  unint64_t v28;
  char *v29;
  char *v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  char *v44;

  v5 = std::__hash_table<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::__unordered_map_hasher<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::hash<std::pair<void const*,unsigned long>>,std::equal_to<std::pair<void const*,unsigned long>>,true>,std::__unordered_map_equal<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::equal_to<std::pair<void const*,unsigned long>>,std::hash<std::pair<void const*,unsigned long>>,true>,std::allocator<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>>>::__emplace_unique_key_args<std::pair<void const*,unsigned long>,std::piecewise_construct_t const&,std::tuple<std::pair<void const*,unsigned long> const&>,std::tuple<>>((uint64_t)&self->_venueWalls, *(_QWORD *)a4, *((_QWORD *)a4 + 1), a4);
  v6 = v5;
  v7 = (void **)(v5 + 4);
  v8 = (_BYTE *)v5[4];
  v9 = *((_QWORD *)a3 + 11);
  if (0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v5[6] - (_QWORD)v8) >> 3) >= v9)
  {
    if (!v9)
      return v7;
LABEL_11:
    v18 = 0;
    while (1)
    {
      if (((*(_QWORD *)(*((_QWORD *)a3 + 8) + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v18) & 1) != 0)
      {
        v19 = v18 + 1;
      }
      else
      {
        v20 = *((_QWORD *)a3 + 1);
        v21 = (int *)(v20 + 8 * v18);
        v23 = *v21;
        v22 = v21[1];
        v19 = v18 + 1;
        v24 = (v18 + 1) % v9;
        v25 = (int *)(v20 + 8 * v24);
        v27 = *v25;
        v26 = v25[1];
        v29 = (char *)v6[5];
        v28 = v6[6];
        if ((unint64_t)v29 >= v28)
        {
          v31 = (char *)*v7;
          v32 = 0x6DB6DB6DB6DB6DB7 * ((v29 - (_BYTE *)*v7) >> 3);
          v33 = v32 + 1;
          if ((unint64_t)(v32 + 1) > 0x492492492492492)
            goto LABEL_33;
          v34 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v28 - (_QWORD)v31) >> 3);
          if (2 * v34 > v33)
            v33 = 2 * v34;
          if (v34 >= 0x249249249249249)
            v35 = 0x492492492492492;
          else
            v35 = v33;
          if (v35 > 0x492492492492492)
            std::__throw_bad_array_new_length[abi:nn180100]();
          v36 = 56 * v35;
          v37 = (char *)operator new(56 * v35);
          v38 = &v37[56 * v32];
          *(_DWORD *)v38 = v23;
          *((_DWORD *)v38 + 1) = v22;
          *((_DWORD *)v38 + 2) = 0;
          *((_DWORD *)v38 + 3) = v27;
          *((_DWORD *)v38 + 4) = v26;
          *((_DWORD *)v38 + 5) = 0;
          *((_QWORD *)v38 + 3) = v18;
          *((_QWORD *)v38 + 4) = v24;
          *((_QWORD *)v38 + 5) = v18;
          *((_QWORD *)v38 + 6) = v24;
          if (v29 == v31)
          {
            v40 = &v37[56 * v32];
          }
          else
          {
            v39 = &v37[56 * v32];
            do
            {
              v40 = v39 - 56;
              v41 = *(_OWORD *)(v29 - 56);
              v42 = *(_OWORD *)(v29 - 40);
              v43 = *(_OWORD *)(v29 - 24);
              *((_QWORD *)v39 - 1) = *((_QWORD *)v29 - 1);
              *(_OWORD *)(v39 - 24) = v43;
              *(_OWORD *)(v39 - 40) = v42;
              *(_OWORD *)(v39 - 56) = v41;
              v29 -= 56;
              v39 -= 56;
            }
            while (v29 != v31);
          }
          v44 = &v37[v36];
          v30 = v38 + 56;
          v6[4] = v40;
          v6[5] = v38 + 56;
          v6[6] = v44;
          if (v31)
            operator delete(v31);
        }
        else
        {
          *(_DWORD *)v29 = v23;
          *((_DWORD *)v29 + 1) = v22;
          *((_DWORD *)v29 + 2) = 0;
          *((_DWORD *)v29 + 3) = v27;
          *((_DWORD *)v29 + 4) = v26;
          *((_DWORD *)v29 + 5) = 0;
          *((_QWORD *)v29 + 3) = v18;
          *((_QWORD *)v29 + 4) = v24;
          v30 = v29 + 56;
          *((_QWORD *)v29 + 5) = v18;
          *((_QWORD *)v29 + 6) = v24;
        }
        v6[5] = v30;
        v9 = *((_QWORD *)a3 + 11);
      }
      v18 = v19;
      if (v19 >= v9)
        return v7;
    }
  }
  if (v9 > 0x492492492492492)
LABEL_33:
    abort();
  v10 = (_BYTE *)v5[5];
  v11 = (char *)operator new(56 * v9);
  v12 = &v11[56 * ((v10 - v8) / 56)];
  v13 = v12;
  if (v10 != v8)
  {
    v14 = &v11[56 * ((v10 - v8) / 56)];
    do
    {
      v13 = v14 - 56;
      v15 = *(_OWORD *)(v10 - 56);
      v16 = *(_OWORD *)(v10 - 40);
      v17 = *(_OWORD *)(v10 - 24);
      *((_QWORD *)v14 - 1) = *((_QWORD *)v10 - 1);
      *(_OWORD *)(v14 - 24) = v17;
      *(_OWORD *)(v14 - 40) = v16;
      *(_OWORD *)(v14 - 56) = v15;
      v10 -= 56;
      v14 -= 56;
    }
    while (v10 != v8);
  }
  v6[4] = v13;
  v6[5] = v12;
  v6[6] = &v11[56 * v9];
  if (v8)
  {
    operator delete(v8);
    v9 = *((_QWORD *)a3 + 11);
  }
  if (v9)
    goto LABEL_11;
  return v7;
}

- (unint64_t)verticalStrokeCountForSection:(const void *)a3 styles:(const void *)a4 edges:(const void *)a5
{
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  uint64_t v8;

  v5 = *(_QWORD *)a5;
  v6 = *((_QWORD *)a5 + 1);
  if (*(_QWORD *)a5 == v6)
    return 0;
  result = 0;
  do
  {
    v8 = *(_QWORD *)(v5 + 24);
    if ((fabsf(vaddv_f32(vmul_f32(*(float32x2_t *)(*((_QWORD *)a3 + 2) + 8 * v8), *(float32x2_t *)(*((_QWORD *)a3 + 5)
                                                                                                  + 8 * v8)))) <= 0.93969
       || *(_BYTE *)(*(_QWORD *)a4 + 12 * v8))
      && (*(_QWORD *)(*((_QWORD *)a3 + 8)
                    + ((((unint64_t)(v8 + *((_QWORD *)a3 + 11) - 1) % *((_QWORD *)a3 + 11)) >> 3) & 0x1FFFFFFFFFFFFFF8)) & (1 << ((unint64_t)(v8 + *((_QWORD *)a3 + 11) - 1) % *((_QWORD *)a3 + 11)))) == 0)
    {
      ++result;
    }
    v5 += 56;
  }
  while (v5 != v6);
  return result;
}

- (StrokeBufferSizing)bufferSizingForStrokesOnSection:(SEL)a3 styles:(const void *)a4 edges:(const void *)a5
{
  StrokeBufferSizing *result;
  uint64_t v9;

  result = -[VKVenueGroup verticalStrokeCountForSection:styles:edges:](self, "verticalStrokeCountForSection:styles:edges:", a4, a5);
  v9 = (uint64_t)(*((_QWORD *)a6 + 1) - *(_QWORD *)a6) >> 3;
  retstr->var0 = 0xB6DB6DB6DB6DB6DCLL * v9;
  retstr->var1 = 0x924924924924924ALL * v9;
  retstr->var2 = 4 * (_QWORD)result;
  retstr->var3 = 6 * (_QWORD)result;
  return result;
}

- (void)prepareToGenerateWallsForSection:(const void *)a3 styles:(void *)a4 edges:(const void *)a5
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  unint64_t v13;
  float v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  float32x2_t v19;
  NSObject *v20;
  unint64_t v21;
  unint64_t v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;
  double type;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  char *v32;
  double v33;
  char *v34;
  unint64_t v35;
  uint64_t v36;
  char *v37;
  __int128 *v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  std::__shared_weak_count *v44;
  unint64_t *p_shared_owners;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t *v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  NSObject *v53;
  optional<md::MeshSet<ggl::VenueWall::EndCapMesh, ggl::VenueWall::EndCapVbo>> *p_venueWallEndCapMeshInfo;
  unint64_t v55;
  __int16 v56;
  unint64_t v57;
  char *v58;
  double v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  char *v67;
  unint64_t v68;
  uint64_t v69;
  char *v70;
  __int128 *v71;
  uint64_t v72;
  __int128 v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  std::__shared_weak_count *v77;
  unint64_t *v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t *v82;
  unint64_t v83;
  __int16 v84[8];
  uint8_t buf[16];

  v6 = *((_QWORD *)a3 + 11);
  if (v6)
  {
    v7 = 0;
    v8 = 0;
    v9 = *(unsigned __int8 **)a4;
    v10 = *((_QWORD *)a3 + 8);
    do
    {
      v11 = *v9;
      v9 += 12;
      if (v11 && ((*(_QWORD *)(v10 + ((v7 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
        v8 += (~*(_QWORD *)(v10 + ((((v6 + v7 - 1) % v6) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> ((v6 + v7 - 1) % v6)) & 1;
      ++v7;
    }
    while (v6 != v7);
  }
  else
  {
    v8 = 0;
  }
  v12 = *((_QWORD *)a5 + 1) - *(_QWORD *)a5;
  if (v12)
    v13 = 4 * v6;
  else
    v13 = 0;
  v14 = *((float *)a3 + 34);
  v15 = v14 == 0.0 && v6 >= 2;
  if (v15)
  {
    v16 = 0;
    v17 = *((_QWORD *)a3 + 1);
    do
    {
      if (v6 - 1 == v16)
        v18 = 0;
      else
        v18 = v16 + 1;
      v19 = vsub_f32(*(float32x2_t *)(v17 + 8 * v18), *(float32x2_t *)(v17 + 8 * v16));
      v14 = sqrtf(vaddv_f32(vmul_f32(v19, v19))) + v14;
      *((float *)a3 + 34) = v14;
      ++v16;
    }
    while (v6 != v16);
  }
  self->_maximumSectionLength = fmaxf(self->_maximumSectionLength, v14);
  if (v13 < 0x10000)
  {
    v21 = 0x924924924924924ALL * (v12 >> 3);
    v22 = *(_QWORD *)self->_anon_c48;
    v23 = *(_WORD *)(v22 - 8);
    if (v13 <= (unsigned __int16)~v23)
    {
      *(_WORD *)(v22 - 8) = v23 + v13;
      *(_DWORD *)(v22 - 4) += v21;
    }
    else
    {
      v24 = *(_QWORD *)&self->_anon_c48[8];
      if (v22 >= v24)
      {
        type = self->_venueWallMeshInfo._value.type;
        v27 = (uint64_t)(v22 - *(_QWORD *)&type) >> 3;
        v28 = v27 + 1;
        if ((unint64_t)(v27 + 1) >> 61)
          goto LABEL_100;
        v29 = v24 - *(_QWORD *)&type;
        if (v29 >> 2 > v28)
          v28 = v29 >> 2;
        v15 = (unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8;
        v30 = 0x1FFFFFFFFFFFFFFFLL;
        if (!v15)
          v30 = v28;
        if (v30 >> 61)
          goto LABEL_101;
        v31 = 8 * v30;
        v32 = (char *)operator new(8 * v30);
        *(_QWORD *)&v33 = &v32[8 * v27];
        v34 = &v32[v31];
        **(_WORD **)&v33 = v13;
        *(_DWORD *)(*(_QWORD *)&v33 + 4) = v21;
        v25 = *(_QWORD *)&v33 + 8;
        if (v22 != *(_QWORD *)&type)
        {
          v35 = v22 - *(_QWORD *)&type - 8;
          if (v35 < 0x58)
            goto LABEL_104;
          if (*(_QWORD *)&type - (_QWORD)v32 < 0x20uLL)
            goto LABEL_104;
          v36 = (v35 >> 3) + 1;
          v37 = &v32[8 * v27 - 16];
          v38 = (__int128 *)(v22 - 16);
          v39 = v36 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v40 = *v38;
            *((_OWORD *)v37 - 1) = *(v38 - 1);
            *(_OWORD *)v37 = v40;
            v37 -= 32;
            v38 -= 2;
            v39 -= 4;
          }
          while (v39);
          *(_QWORD *)&v33 -= 8 * (v36 & 0x3FFFFFFFFFFFFFFCLL);
          v22 -= 8 * (v36 & 0x3FFFFFFFFFFFFFFCLL);
          if (v36 != (v36 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_104:
            do
            {
              v41 = *(_QWORD *)(v22 - 8);
              v22 -= 8;
              *(_QWORD *)(*(_QWORD *)&v33 - 8) = v41;
              *(_QWORD *)&v33 -= 8;
            }
            while (v22 != *(_QWORD *)&type);
          }
        }
        self->_venueWallMeshInfo._value.type = v33;
        *(_QWORD *)self->_anon_c48 = v25;
        *(_QWORD *)&self->_anon_c48[8] = v34;
        if (type != 0.0)
          operator delete(*(void **)&type);
      }
      else
      {
        *(_WORD *)v22 = v13;
        *(_DWORD *)(v22 + 4) = v21;
        v25 = v22 + 8;
      }
      *(_QWORD *)self->_anon_c48 = v25;
    }
    v42 = *(_QWORD *)&self->_anon_c48[144];
    v43 = *(_QWORD **)&self->_anon_c48[160];
    v44 = *(std::__shared_weak_count **)&self->_anon_c48[168];
    if (v44)
    {
      p_shared_owners = (unint64_t *)&v44->__shared_owners_;
      do
        v46 = __ldxr(p_shared_owners);
      while (__stxr(v46 + 1, p_shared_owners));
    }
    if (v43 && *v43 == v42 && !*(_BYTE *)(v42 + 40))
    {
      v47 = *(_QWORD *)(v42 + 8) + v21;
      *(_QWORD *)v42 += 24 * v13;
      *(_QWORD *)(v42 + 8) = v47;
      v48 = v43[3] + v21;
      v43[2] += 24 * v13;
      v43[3] = v48;
    }
    if (v44)
    {
      v49 = (unint64_t *)&v44->__shared_owners_;
      do
        v50 = __ldaxr(v49);
      while (__stlxr(v50 - 1, v49));
      if (!v50)
      {
        ((void (*)(std::__shared_weak_count *, SEL))v44->__on_zero_shared)(v44, a2);
        std::__shared_weak_count::__release_weak(v44);
      }
    }
  }
  else
  {
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
    v20 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v84[0] = 0;
      _os_log_impl(&dword_19F029000, v20, OS_LOG_TYPE_ERROR, "MeshSet: Cannot prepare space polygons points: polygon is too large", (uint8_t *)v84, 2u);
    }

  }
  v51 = 6 * v8;
  if (!(6 * v8))
    return;
  v52 = 4 * v8;
  if (!(4 * v8))
    return;
  if (v52 >= 0x10000)
  {
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
    v53 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F029000, v53, OS_LOG_TYPE_ERROR, "MeshSet: Cannot prepare space polygons points: polygon is too large", buf, 2u);
    }

    return;
  }
  p_venueWallEndCapMeshInfo = &self->_venueWallEndCapMeshInfo;
  v55 = *(_QWORD *)self->_anon_d08;
  v56 = *(_WORD *)(v55 - 8);
  if (v52 > (unsigned __int16)~v56)
  {
    v57 = *(_QWORD *)&self->_anon_d08[8];
    if (v55 < v57)
    {
      *(_WORD *)v55 = v52;
      *(_DWORD *)(v55 + 4) = v51;
      v58 = (char *)(v55 + 8);
LABEL_86:
      *(_QWORD *)&p_venueWallEndCapMeshInfo[1]._hasValue = v58;
      goto LABEL_87;
    }
    v59 = self->_venueWallEndCapMeshInfo._value.type;
    v60 = (uint64_t)(v55 - *(_QWORD *)&v59) >> 3;
    v61 = v60 + 1;
    if (!((unint64_t)(v60 + 1) >> 61))
    {
      v62 = v57 - *(_QWORD *)&v59;
      if (v62 >> 2 > v61)
        v61 = v62 >> 2;
      v15 = (unint64_t)v62 >= 0x7FFFFFFFFFFFFFF8;
      v63 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v15)
        v63 = v61;
      if (!(v63 >> 61))
      {
        v64 = 8 * v63;
        v65 = (char *)operator new(8 * v63);
        v66 = &v65[8 * v60];
        v67 = &v65[v64];
        *(_WORD *)v66 = v52;
        *((_DWORD *)v66 + 1) = v51;
        v58 = v66 + 8;
        if (v55 != *(_QWORD *)&v59)
        {
          v68 = v55 - *(_QWORD *)&v59 - 8;
          if (v68 < 0x58)
            goto LABEL_105;
          if (*(_QWORD *)&v59 - (_QWORD)v65 < 0x20uLL)
            goto LABEL_105;
          v69 = (v68 >> 3) + 1;
          v70 = &v65[8 * v60 - 16];
          v71 = (__int128 *)(v55 - 16);
          v72 = v69 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v73 = *v71;
            *((_OWORD *)v70 - 1) = *(v71 - 1);
            *(_OWORD *)v70 = v73;
            v70 -= 32;
            v71 -= 2;
            v72 -= 4;
          }
          while (v72);
          v66 -= 8 * (v69 & 0x3FFFFFFFFFFFFFFCLL);
          v55 -= 8 * (v69 & 0x3FFFFFFFFFFFFFFCLL);
          if (v69 != (v69 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_105:
            do
            {
              v74 = *(_QWORD *)(v55 - 8);
              v55 -= 8;
              *((_QWORD *)v66 - 1) = v74;
              v66 -= 8;
            }
            while (v55 != *(_QWORD *)&v59);
          }
        }
        *(_QWORD *)&p_venueWallEndCapMeshInfo->_value.type = v66;
        *(_QWORD *)&p_venueWallEndCapMeshInfo[1]._hasValue = v58;
        *(_QWORD *)&p_venueWallEndCapMeshInfo[1]._value.type = v67;
        if (v59 != 0.0)
          operator delete(*(void **)&v59);
        goto LABEL_86;
      }
LABEL_101:
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
LABEL_100:
    abort();
  }
  *(_WORD *)(v55 - 8) = v56 + v52;
  *(_DWORD *)(v55 - 4) += v51;
LABEL_87:
  v75 = *(_QWORD *)&p_venueWallEndCapMeshInfo[10]._hasValue;
  v76 = *(_QWORD **)&p_venueWallEndCapMeshInfo[11]._hasValue;
  v77 = *(std::__shared_weak_count **)&p_venueWallEndCapMeshInfo[11]._value.type;
  if (v77)
  {
    v78 = (unint64_t *)&v77->__shared_owners_;
    do
      v79 = __ldxr(v78);
    while (__stxr(v79 + 1, v78));
  }
  if (v76 && *v76 == v75 && !*(_BYTE *)(v75 + 40))
  {
    v80 = *(_QWORD *)(v75 + 8) + v51;
    *(_QWORD *)v75 += 96 * v8;
    *(_QWORD *)(v75 + 8) = v80;
    v81 = v76[3] + v51;
    v76[2] += 96 * v8;
    v76[3] = v81;
  }
  if (v77)
  {
    v82 = (unint64_t *)&v77->__shared_owners_;
    do
      v83 = __ldaxr(v82);
    while (__stlxr(v83 - 1, v82));
    if (!v83)
    {
      ((void (*)(std::__shared_weak_count *))v77->__on_zero_shared)(v77);
      std::__shared_weak_count::__release_weak(v77);
    }
  }
}

- (void)prepareToGenerateWallStrokesForSection:(const void *)a3 styles:(const void *)a4 edges:(const void *)a5
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t v15;

  -[VKVenueGroup bufferSizingForStrokesOnSection:styles:edges:](self, "bufferSizingForStrokesOnSection:styles:edges:", a3, a4, a5);
  v6 = *(_QWORD *)self->_anon_dc8;
  *(_WORD *)(v6 - 8) = *(_WORD *)(v6 - 8);
  *(_DWORD *)(v6 - 4) = *(_DWORD *)(v6 - 4);
  v7 = *(_QWORD *)&self->_anon_dc8[144];
  v8 = *(_QWORD **)&self->_anon_dc8[160];
  v9 = *(std::__shared_weak_count **)&self->_anon_dc8[168];
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  if (v8 && *v8 == v7 && !*(_BYTE *)(v7 + 40))
  {
    v12 = *(_QWORD *)(v7 + 8);
    *(_QWORD *)v7 = *(_QWORD *)v7;
    *(_QWORD *)(v7 + 8) = v12;
    v13 = v8[3];
    v8[2] = v8[2];
    v8[3] = v13;
  }
  if (v9)
  {
    v14 = (unint64_t *)&v9->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
}

- (void)prepareToStrokeSection:(const void *)a3 key:(const void *)a4 styles:(void *)a5 paddedCount:(unsigned int)a6
{
  const void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VKVenueGroup;
  -[VKPolygonGroup prepareToStrokeSection:key:styles:paddedCount:](&v11, sel_prepareToStrokeSection_key_styles_paddedCount_, a3, a4, a5, *(_QWORD *)&a6);
  v10 = -[VKVenueGroup generateEdgeListForPolygonSection:key:](self, "generateEdgeListForPolygonSection:key:", a3, a4);
  -[VKVenueGroup prepareToGenerateWallsForSection:styles:edges:](self, "prepareToGenerateWallsForSection:styles:edges:", a3, a5, v10);
  -[VKVenueGroup prepareToGenerateWallStrokesForSection:styles:edges:](self, "prepareToGenerateWallStrokesForSection:styles:edges:", a3, a5, v10);
}

- (void)willAddDataWithAccessor:(ResourceAccessor *)a3
{
  __n128 v4;
  optional<md::MeshSet<ggl::VenueWall::MeshMesh, ggl::VenueWall::DefaultVbo>> *p_venueWallMeshInfo;
  uint64_t *v6;
  unsigned __int16 *v7;
  double type;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  char *v17;
  const char *v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  _QWORD *v24;
  uint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  unint64_t *v36;
  unint64_t v37;
  unint64_t *v38;
  unint64_t v39;
  unint64_t v40;
  double v41;
  __n128 *v42;
  _QWORD *v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char *v48;
  __n128 *v49;
  char *v50;
  __n128 v51;
  double v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  std::__shared_weak_count *v56;
  unint64_t *v57;
  unint64_t v58;
  std::__shared_weak_count *v59;
  unint64_t *v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unsigned __int8 v64;
  int v65;
  uint64_t v66;
  geo::read_write_lock *v67;
  const char *v68;
  malloc_zone_t *zone;
  int v70;
  uint64_t v71;
  uint64_t v72;
  geo::read_write_lock *v73;
  const char *v74;
  malloc_zone_t *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  __int128 v80;
  uint64_t v81;
  __int128 v82;
  unint64_t v83;
  unint64_t v84;
  __int128 v85;
  int v86;
  int v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  unint64_t v95;
  __int128 v96;
  int v97;
  int v98;
  unint64_t v99;
  unint64_t v100;
  uint64_t *v101;
  unsigned __int16 *v102;
  double v103;
  uint64_t v104;
  _QWORD *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  std::__shared_weak_count *v109;
  unint64_t *v110;
  unint64_t v111;
  char *v112;
  const char *v113;
  std::__shared_weak_count *v114;
  unint64_t *v115;
  unint64_t v116;
  unsigned __int8 v117;
  unsigned __int8 v118;
  _QWORD *v119;
  uint64_t v120;
  unint64_t *v121;
  unint64_t v122;
  std::__shared_weak_count *v123;
  unint64_t *v124;
  unint64_t v125;
  unint64_t *v126;
  unint64_t v127;
  std::__shared_weak_count *v128;
  unint64_t *v129;
  unint64_t v130;
  unint64_t *v131;
  unint64_t v132;
  unint64_t *v133;
  unint64_t v134;
  unint64_t v135;
  char *v136;
  __n128 *v137;
  char *v138;
  uint64_t v139;
  unint64_t v140;
  uint64_t v141;
  unint64_t v142;
  char *v143;
  __n128 *v144;
  char *v145;
  __n128 v146;
  char *v147;
  std::__shared_weak_count *v148;
  unint64_t *v149;
  unint64_t v150;
  std::__shared_weak_count *v151;
  unint64_t *v152;
  unint64_t v153;
  std::__shared_weak_count *v154;
  unint64_t *v155;
  unint64_t v156;
  uint64_t v157;
  uint64_t v158;
  unsigned __int8 v159;
  int v160;
  uint64_t v161;
  geo::read_write_lock *v162;
  const char *v163;
  malloc_zone_t *v164;
  int v165;
  uint64_t v166;
  uint64_t v167;
  geo::read_write_lock *v168;
  const char *v169;
  malloc_zone_t *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  __int128 v175;
  uint64_t v176;
  __int128 v177;
  unint64_t v178;
  unint64_t v179;
  __int128 v180;
  int v181;
  int v182;
  unint64_t v183;
  unint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  unint64_t v189;
  unint64_t v190;
  __int128 v191;
  int v192;
  int v193;
  unint64_t v194;
  unint64_t v195;
  uint64_t *v196;
  unsigned __int16 *v197;
  double v198;
  uint64_t v199;
  _QWORD *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  std::__shared_weak_count *v204;
  unint64_t *v205;
  unint64_t v206;
  char *v207;
  const char *v208;
  std::__shared_weak_count *v209;
  unint64_t *v210;
  unint64_t v211;
  unsigned __int8 v212;
  unsigned __int8 v213;
  _QWORD *v214;
  uint64_t v215;
  unint64_t *v216;
  unint64_t v217;
  std::__shared_weak_count *v218;
  unint64_t *v219;
  unint64_t v220;
  unint64_t *v221;
  unint64_t v222;
  std::__shared_weak_count *v223;
  unint64_t *v224;
  unint64_t v225;
  unint64_t *v226;
  unint64_t v227;
  unint64_t *v228;
  unint64_t v229;
  unint64_t v230;
  char *v231;
  __n128 *v232;
  char *v233;
  uint64_t v234;
  unint64_t v235;
  uint64_t v236;
  unint64_t v237;
  char *v238;
  __n128 *v239;
  char *v240;
  __n128 v241;
  char *v242;
  std::__shared_weak_count *v243;
  unint64_t *v244;
  unint64_t v245;
  std::__shared_weak_count *v246;
  unint64_t *v247;
  unint64_t v248;
  std::__shared_weak_count *v249;
  unint64_t *v250;
  unint64_t v251;
  uint64_t v252;
  uint64_t v253;
  unsigned __int8 v254;
  int v255;
  uint64_t v256;
  geo::read_write_lock *v257;
  const char *v258;
  malloc_zone_t *v259;
  int v260;
  uint64_t v261;
  uint64_t v262;
  geo::read_write_lock *v263;
  const char *v264;
  malloc_zone_t *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  __int128 v270;
  uint64_t v271;
  __int128 v272;
  unint64_t v273;
  unint64_t v274;
  __int128 v275;
  int v276;
  int v277;
  unint64_t v278;
  unint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  unint64_t v284;
  unint64_t v285;
  __int128 v286;
  int v287;
  int v288;
  unint64_t v289;
  unint64_t v290;
  uint64_t *v291;
  unsigned __int16 *v292;
  double v293;
  uint64_t v294;
  _QWORD *v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  std::__shared_weak_count *v299;
  unint64_t *v300;
  unint64_t v301;
  char *v302;
  const char *v303;
  std::__shared_weak_count *v304;
  unint64_t *v305;
  unint64_t v306;
  unsigned __int8 v307;
  unsigned __int8 v308;
  _QWORD *v309;
  uint64_t v310;
  unint64_t *v311;
  unint64_t v312;
  std::__shared_weak_count *v313;
  unint64_t *v314;
  unint64_t v315;
  unint64_t *v316;
  unint64_t v317;
  std::__shared_weak_count *v318;
  unint64_t *v319;
  unint64_t v320;
  unint64_t *v321;
  unint64_t v322;
  unint64_t *v323;
  unint64_t v324;
  unint64_t v325;
  char *v326;
  __n128 *v327;
  char *v328;
  uint64_t v329;
  unint64_t v330;
  uint64_t v331;
  unint64_t v332;
  char *v333;
  __n128 *v334;
  char *v335;
  __n128 v336;
  char *v337;
  std::__shared_weak_count *v338;
  unint64_t *v339;
  unint64_t v340;
  std::__shared_weak_count *v341;
  unint64_t *v342;
  unint64_t v343;
  std::__shared_weak_count *v344;
  unint64_t *v345;
  unint64_t v346;
  uint64_t v347;
  uint64_t v348;
  unsigned __int8 v349;
  int v350;
  uint64_t v351;
  geo::read_write_lock *v352;
  const char *v353;
  malloc_zone_t *v354;
  int v355;
  uint64_t v356;
  uint64_t v357;
  geo::read_write_lock *v358;
  const char *v359;
  malloc_zone_t *v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  __int128 v365;
  uint64_t v366;
  __int128 v367;
  unint64_t v368;
  unint64_t v369;
  __int128 v370;
  int v371;
  int v372;
  unint64_t v373;
  unint64_t v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  unint64_t v379;
  unint64_t v380;
  __int128 v381;
  int v382;
  int v383;
  unint64_t v384;
  unint64_t v385;
  VKVenueGroup *v386;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  __int128 v392;
  __n128 v393;
  __int128 v394;
  __int128 v395;
  __n128 v396;
  __int128 v397;
  __int128 v398;
  __n128 v399;
  __int128 v400;
  __int128 v401;
  __n128 v402;
  __int128 v403;
  objc_super v404;
  const char *v405;
  std::__shared_weak_count *v406;
  __int128 v407;
  __int128 v408;
  unint64_t v409;
  unint64_t v410;
  __int16 v411;
  uint64_t v412;
  uint64_t v413;

  v413 = *MEMORY[0x1E0C80C00];
  v404.receiver = self;
  v404.super_class = (Class)VKVenueGroup;
  -[VKPolygonGroup willAddDataWithAccessor:](&v404, sel_willAddDataWithAccessor_);
  v386 = self;
  p_venueWallMeshInfo = &self->_venueWallMeshInfo;
  v6 = *(uint64_t **)&p_venueWallMeshInfo[10]._value.type;
  if (v6)
    md::MeshSetStorage::prepareStorage(v6, a3);
  type = p_venueWallMeshInfo->_value.type;
  v7 = *(unsigned __int16 **)&p_venueWallMeshInfo[1]._hasValue;
  if (*(unsigned __int16 **)&type != v7)
  {
    v4.n128_u64[1] = 0;
    do
    {
      if (!**(_WORD **)&type || !*(_DWORD *)(*(_QWORD *)&type + 4))
        goto LABEL_6;
      v9 = *(_QWORD *)&p_venueWallMeshInfo[10]._hasValue;
      if (*(_BYTE *)(v9 + 40)
        && (v10 = *(_QWORD **)&p_venueWallMeshInfo[11]._hasValue) != 0
        && *v10 == v9
        && (v11 = v10[1] * (unsigned __int16)**(_WORD **)&type,
            v12 = v10[8],
            v13 = v10[4],
            v12 + v11 <= (unint64_t)(v10[5] - v13)))
      {
        *(_QWORD *)&v408 = v13 + v12;
        *((_QWORD *)&v408 + 1) = v13 + v12 + v11;
        v10[8] = v12 + v11;
        v62 = *(_QWORD *)(v9 + 48);
        v405 = "Venue Wall Vertex Data";
        v63 = v10[14];
        if (!v63)
LABEL_575:
          std::__throw_bad_function_call[abi:nn180100]();
        (*(void (**)(__int128 *__return_ptr, uint64_t, const char **, uint64_t, __int128 *))(*(_QWORD *)v63 + 48))(&v407, v63, &v405, v62, &v408);
        v9 = *(_QWORD *)&p_venueWallMeshInfo[10]._hasValue;
      }
      else
      {
        v407 = 0uLL;
      }
      md::MeshSetStorage::buildSubIndexData(&v405, v9, *(_QWORD **)&p_venueWallMeshInfo[11]._hasValue, (uint64_t)"Venue Wall Index Data", *(unsigned int *)(*(_QWORD *)&type + 4));
      v392 = v407;
      v14 = (std::__shared_weak_count *)*((_QWORD *)&v407 + 1);
      if (*((_QWORD *)&v407 + 1))
      {
        v15 = (unint64_t *)(*((_QWORD *)&v407 + 1) + 8);
        do
          v16 = __ldxr(v15);
        while (__stxr(v16 + 1, v15));
      }
      v17 = (char *)operator new(0xA8uLL);
      *((_QWORD *)v17 + 1) = 0;
      *((_QWORD *)v17 + 2) = 0;
      *(_QWORD *)v17 = &off_1E42E54C8;
      v18 = v405;
      v19 = v406;
      if (v406)
      {
        p_shared_owners = (unint64_t *)&v406->__shared_owners_;
        do
          v21 = __ldxr(p_shared_owners);
        while (__stxr(v21 + 1, p_shared_owners));
      }
      if ((v22 & 1) == 0
      {
        if ((v64 & 1) == 0
        {
          ggl::MeshTyped<ggl::VenueWall::DefaultVbo>::attributesReflection(void)::r = (uint64_t)&ggl::VenueWall::defaultVboReflection;
        }
        ggl::MeshTyped<ggl::VenueWall::DefaultVbo>::typedReflection(void)::r = (uint64_t)&ggl::MeshTyped<ggl::VenueWall::DefaultVbo>::attributesReflection(void)::r;
        unk_1ECE43E40 = 1;
      }
      *((_QWORD *)v17 + 11) = 0;
      *((_QWORD *)v17 + 7) = 0;
      *((_QWORD *)v17 + 8) = 0;
      *((_DWORD *)v17 + 18) = 0;
      *((_QWORD *)v17 + 3) = &off_1E42BBC08;
      *((_QWORD *)v17 + 4) = "Venue Wall Mesh";
      *((_QWORD *)v17 + 5) = &unk_1E42BBC28;
      *((_QWORD *)v17 + 6) = 0;
      *((_QWORD *)v17 + 10) = &ggl::MeshTyped<ggl::VenueWall::DefaultVbo>::typedReflection(void)::r;
      *((_QWORD *)v17 + 12) = 0;
      *((_QWORD *)v17 + 13) = 0;
      v24 = &unk_1ECE44000;
      if ((v23 & 1) == 0)
      {
        v24 = (_QWORD *)&unk_1ECE44000;
        if (v65)
        {
          v66 = operator new();
          *(_QWORD *)(v66 + 16) = 0xA3D02C1100000005;
          *(_QWORD *)(v66 + 24) = "GeoGL";
          *(_OWORD *)(v66 + 32) = xmmword_19FFB2DE0;
          *(_QWORD *)v66 = &off_1E42B5668;
          *(_QWORD *)(v66 + 8) = "GeoGL";
          *(_OWORD *)(v66 + 72) = 0u;
          *(_OWORD *)(v66 + 88) = 0u;
          *(_OWORD *)(v66 + 104) = 0u;
          *(_OWORD *)(v66 + 120) = 0u;
          *(_OWORD *)(v66 + 136) = 0u;
          *(_OWORD *)(v66 + 152) = 0u;
          *(_OWORD *)(v66 + 168) = 0u;
          *(_OWORD *)(v66 + 184) = 0u;
          *(_OWORD *)(v66 + 200) = 0u;
          *(_OWORD *)(v66 + 216) = 0u;
          *(_OWORD *)(v66 + 232) = 0u;
          *(_QWORD *)(v66 + 248) = 0;
          *(_OWORD *)(v66 + 56) = 0u;
          v67 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v66 + 56), 0);
          if ((_DWORD)v67)
            geo::read_write_lock::logFailure(v67, (uint64_t)"initialization", v68);
          zone = malloc_create_zone(0, 0);
          *(_QWORD *)(v66 + 48) = zone;
          malloc_set_zone_name(zone, "GeoGL");
          *(_QWORD *)(v66 + 256) = os_log_create("com.apple.VectorKit", "Memory");
          ggl::Allocator::instance(void)::alloc = v66;
          v24 = &unk_1ECE44000;
        }
      }
      v25 = v24[495];
      *((_QWORD *)v17 + 18) = 0;
      *((_QWORD *)v17 + 15) = 0;
      *((_QWORD *)v17 + 16) = 0;
      *((_QWORD *)v17 + 14) = v25;
      if ((v25 & 1) == 0)
      {
        v24 = (_QWORD *)&unk_1ECE44000;
        if (v70)
        {
          v71 = operator new();
          *(_QWORD *)(v71 + 16) = 0xA3D02C1100000005;
          *(_QWORD *)(v71 + 24) = "GeoGL";
          *(_OWORD *)(v71 + 32) = xmmword_19FFB2DE0;
          *(_QWORD *)v71 = &off_1E42B5668;
          *(_QWORD *)(v71 + 8) = "GeoGL";
          *(_OWORD *)(v71 + 72) = 0u;
          *(_OWORD *)(v71 + 88) = 0u;
          *(_OWORD *)(v71 + 104) = 0u;
          *(_OWORD *)(v71 + 120) = 0u;
          *(_OWORD *)(v71 + 136) = 0u;
          *(_OWORD *)(v71 + 152) = 0u;
          *(_OWORD *)(v71 + 168) = 0u;
          *(_OWORD *)(v71 + 184) = 0u;
          *(_OWORD *)(v71 + 200) = 0u;
          *(_OWORD *)(v71 + 216) = 0u;
          *(_OWORD *)(v71 + 232) = 0u;
          *(_QWORD *)(v71 + 248) = 0;
          v72 = v71;
          *(_OWORD *)(v71 + 56) = 0u;
          v73 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v71 + 56), 0);
          if ((_DWORD)v73)
            geo::read_write_lock::logFailure(v73, (uint64_t)"initialization", v74);
          v75 = malloc_create_zone(0, 0);
          *(_QWORD *)(v72 + 48) = v75;
          malloc_set_zone_name(v75, "GeoGL");
          *(_QWORD *)(v72 + 256) = os_log_create("com.apple.VectorKit", "Memory");
          ggl::Allocator::instance(void)::alloc = v72;
          v24 = &unk_1ECE44000;
        }
      }
      *((_QWORD *)v17 + 19) = v24[495];
      *((_QWORD *)v17 + 20) = 0;
      *((_QWORD *)v17 + 17) = v17 + 144;
      *((_QWORD *)v17 + 3) = &off_1E42BE1F8;
      *((_QWORD *)v17 + 5) = &unk_1E42BE218;
      v408 = v392;
      if (v14)
      {
        v26 = (unint64_t *)&v14->__shared_owners_;
        do
          v27 = __ldxr(v26);
        while (__stxr(v27 + 1, v26));
      }
      std::vector<std::shared_ptr<ggl::VertexData>,geo::StdAllocator<std::shared_ptr<ggl::VertexData>,ggl::Allocator>>::__assign_with_size[abi:nn180100]<std::shared_ptr<ggl::VertexData> const*,std::shared_ptr<ggl::VertexData> const*>((uint64_t)(v17 + 88), (uint64_t *)&v408, (uint64_t *)&v409, 1uLL);
      v28 = (std::__shared_weak_count *)*((_QWORD *)&v408 + 1);
      if (!*((_QWORD *)&v408 + 1))
        goto LABEL_30;
      v29 = (unint64_t *)(*((_QWORD *)&v408 + 1) + 8);
      do
        v30 = __ldaxr(v29);
      while (__stlxr(v30 - 1, v29));
      if (!v30)
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
        if (!v19)
          goto LABEL_33;
      }
      else
      {
LABEL_30:
        if (!v19)
          goto LABEL_33;
      }
      v31 = (unint64_t *)&v19->__shared_owners_;
      do
        v32 = __ldxr(v31);
      while (__stxr(v32 + 1, v31));
LABEL_33:
      v33 = (std::__shared_weak_count *)*((_QWORD *)v17 + 16);
      *((_QWORD *)v17 + 15) = v18;
      *((_QWORD *)v17 + 16) = v19;
      if (v33)
      {
        v34 = (unint64_t *)&v33->__shared_owners_;
        do
          v35 = __ldaxr(v34);
        while (__stlxr(v35 - 1, v34));
        if (!v35)
        {
          ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
          std::__shared_weak_count::__release_weak(v33);
        }
      }
      *((_QWORD *)v17 + 3) = &off_1E42BE5C8;
      *((_QWORD *)v17 + 5) = &unk_1E42BE5E8;
      if (!v19)
        goto LABEL_42;
      v36 = (unint64_t *)&v19->__shared_owners_;
      do
        v37 = __ldaxr(v36);
      while (__stlxr(v37 - 1, v36));
      if (!v37)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
        if (!v14)
          goto LABEL_50;
      }
      else
      {
LABEL_42:
        if (!v14)
          goto LABEL_50;
      }
      v38 = (unint64_t *)&v14->__shared_owners_;
      do
        v39 = __ldaxr(v38);
      while (__stlxr(v39 - 1, v38));
      if (!v39)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
LABEL_50:
      v41 = p_venueWallMeshInfo[2]._value.type;
      v40 = *(_QWORD *)&p_venueWallMeshInfo[3]._hasValue;
      if (*(_QWORD *)&v41 >= v40)
      {
        v43 = *(_QWORD **)&p_venueWallMeshInfo[2]._hasValue;
        v44 = (uint64_t)(*(_QWORD *)&v41 - (_QWORD)v43) >> 4;
        v45 = v44 + 1;
        if ((unint64_t)(v44 + 1) >> 60)
          abort();
        v46 = v40 - (_QWORD)v43;
        if (v46 >> 3 > v45)
          v45 = v46 >> 3;
        if ((unint64_t)v46 >= 0x7FFFFFFFFFFFFFF0)
          v47 = 0xFFFFFFFFFFFFFFFLL;
        else
          v47 = v45;
        if (v47 >> 60)
LABEL_570:
          std::__throw_bad_array_new_length[abi:nn180100]();
        v48 = (char *)operator new(16 * v47);
        v4.n128_u64[0] = (unint64_t)(v17 + 24);
        v4.n128_u64[1] = (unint64_t)v17;
        v49 = (__n128 *)&v48[16 * v44];
        v50 = &v48[16 * v47];
        *v49 = v4;
        v42 = v49 + 1;
        if (*(_QWORD **)&v41 == v43)
        {
          *(_QWORD *)&p_venueWallMeshInfo[2]._hasValue = v49;
          *(_QWORD *)&p_venueWallMeshInfo[2]._value.type = v42;
          *(_QWORD *)&p_venueWallMeshInfo[3]._hasValue = v50;
        }
        else
        {
          do
          {
            v51 = *(__n128 *)(*(_QWORD *)&v41 - 16);
            *(_QWORD *)&v41 -= 16;
            v4.n128_u64[1] = v51.n128_u64[1];
            v49[-1] = v51;
            --v49;
            **(_QWORD **)&v41 = 0;
            *(_QWORD *)(*(_QWORD *)&v41 + 8) = 0;
          }
          while (*(_QWORD **)&v41 != v43);
          v41 = *(double *)&p_venueWallMeshInfo[2]._hasValue;
          v52 = p_venueWallMeshInfo[2]._value.type;
          *(_QWORD *)&p_venueWallMeshInfo[2]._hasValue = v49;
          *(_QWORD *)&p_venueWallMeshInfo[2]._value.type = v42;
          *(_QWORD *)&p_venueWallMeshInfo[3]._hasValue = v50;
          while (*(_QWORD *)&v52 != *(_QWORD *)&v41)
          {
            v53 = *(std::__shared_weak_count **)(*(_QWORD *)&v52 - 8);
            if (v53)
            {
              v54 = (unint64_t *)&v53->__shared_owners_;
              do
                v55 = __ldaxr(v54);
              while (__stlxr(v55 - 1, v54));
              if (!v55)
              {
                ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
                std::__shared_weak_count::__release_weak(v53);
              }
            }
            *(_QWORD *)&v52 -= 16;
          }
        }
        if (v41 != 0.0)
          operator delete(*(void **)&v41);
      }
      else
      {
        **(_QWORD **)&v41 = v17 + 24;
        *(_QWORD *)(*(_QWORD *)&v41 + 8) = v17;
        v42 = (__n128 *)(*(_QWORD *)&v41 + 16);
      }
      *(_QWORD *)&p_venueWallMeshInfo[2]._value.type = v42;
      v56 = v406;
      if (!v406)
        goto LABEL_76;
      v57 = (unint64_t *)&v406->__shared_owners_;
      do
        v58 = __ldaxr(v57);
      while (__stlxr(v58 - 1, v57));
      if (!v58)
      {
        ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
        std::__shared_weak_count::__release_weak(v56);
        v59 = (std::__shared_weak_count *)*((_QWORD *)&v407 + 1);
        if (*((_QWORD *)&v407 + 1))
        {
LABEL_77:
          v60 = (unint64_t *)&v59->__shared_owners_;
          do
            v61 = __ldaxr(v60);
          while (__stlxr(v61 - 1, v60));
          if (!v61)
          {
            ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
            std::__shared_weak_count::__release_weak(v59);
          }
        }
      }
      else
      {
LABEL_76:
        v59 = (std::__shared_weak_count *)*((_QWORD *)&v407 + 1);
        if (*((_QWORD *)&v407 + 1))
          goto LABEL_77;
      }
      v7 = *(unsigned __int16 **)&p_venueWallMeshInfo[1]._hasValue;
LABEL_6:
      *(_QWORD *)&type += 8;
    }
    while (*(unsigned __int16 **)&type != v7);
  }
  v76 = *(_QWORD *)&p_venueWallMeshInfo[2]._hasValue;
  if (v76 != *(_QWORD *)&p_venueWallMeshInfo[2]._value.type)
  {
    v77 = **(_QWORD **)(*(_QWORD *)v76 + 64);
    v78 = **(unsigned __int16 **)&p_venueWallMeshInfo->_value.type;
    v408 = 0uLL;
    v79 = *(_QWORD *)(v77 + 8) * v78;
    v4.n128_u64[0] = (unint64_t)a3;
    *(_QWORD *)&v80 = a3;
    *((_QWORD *)&v80 + 1) = v77;
    v393 = v4;
    if (v79)
    {
      if (a3 && *(_BYTE *)(v77 + 17) != 2)
      {
        v388 = v80;
        v81 = (*((uint64_t (**)(void))a3->var0 + 7))();
        v80 = v388;
      }
      else
      {
        v81 = *(_QWORD *)(v77 + 72);
      }
    }
    else
    {
      v81 = 0;
    }
    v408 = v80;
    v409 = 0;
    v410 = v79;
    v412 = v81;
    v411 = 257;
    ggl::BufferMemory::operator=((uint64_t *)&p_venueWallMeshInfo[3]._value, (uint64_t)&v408);
    *(_QWORD *)&v82 = v393.n128_u64[0];
    if (v412)
    {
      v84 = v409;
      v83 = v410;
      if (v410 != v409)
      {
        v85 = v408;
        v86 = v411;
        v87 = HIBYTE(v411);
        if ((_QWORD)v408 && *(_BYTE *)(*((_QWORD *)&v408 + 1) + 17) != 2)
        {
          (*(void (**)(__n128))(*(_QWORD *)v408 + 64))(v393);
          *(_QWORD *)&v82 = v393.n128_u64[0];
        }
        if (v86 && !v87)
        {
          v89 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 56);
          v88 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 64);
          if (v88 == v89)
            v89 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v85 + 1) + 72);
          if (v84 < v89)
            v89 = v84;
          if (v88 <= v83)
            v88 = v83;
          if (v88 == v89)
            v88 = v89 + *(_QWORD *)(*((_QWORD *)&v85 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v85 + 1) + 72);
          *(_QWORD *)(*((_QWORD *)&v85 + 1) + 56) = v89;
          *(_QWORD *)(*((_QWORD *)&v85 + 1) + 64) = v88;
        }
      }
    }
    v90 = *(_QWORD *)(**(_QWORD **)&p_venueWallMeshInfo[2]._hasValue + 96);
    v91 = *(unsigned int *)(*(_QWORD *)&p_venueWallMeshInfo->_value.type + 4);
    v408 = 0uLL;
    v92 = *(_QWORD *)(v90 + 8) * v91;
    *((_QWORD *)&v82 + 1) = v90;
    if (v92)
    {
      if (a3 && *(_BYTE *)(v90 + 17) != 2)
      {
        v394 = v82;
        v93 = (*((uint64_t (**)(void))a3->var0 + 7))();
        v82 = v394;
      }
      else
      {
        v93 = *(_QWORD *)(v90 + 72);
      }
    }
    else
    {
      v93 = 0;
    }
    v408 = v82;
    v409 = 0;
    v410 = v92;
    v412 = v93;
    v411 = 257;
    ggl::BufferMemory::operator=((uint64_t *)&p_venueWallMeshInfo[6]._value, (uint64_t)&v408);
    if (v412)
    {
      v95 = v409;
      v94 = v410;
      if (v410 != v409)
      {
        v96 = v408;
        v97 = v411;
        v98 = HIBYTE(v411);
        if ((_QWORD)v408 && *(_BYTE *)(*((_QWORD *)&v408 + 1) + 17) != 2)
          (*(void (**)(void))(*(_QWORD *)v408 + 64))();
        if (v97 && !v98)
        {
          v100 = *(_QWORD *)(*((_QWORD *)&v96 + 1) + 56);
          v99 = *(_QWORD *)(*((_QWORD *)&v96 + 1) + 64);
          if (v99 == v100)
            v100 = *(_QWORD *)(*((_QWORD *)&v96 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v96 + 1) + 72);
          if (v95 < v100)
            v100 = v95;
          if (v99 <= v94)
            v99 = v94;
          if (v99 == v100)
            v99 = v100 + *(_QWORD *)(*((_QWORD *)&v96 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v96 + 1) + 72);
          *(_QWORD *)(*((_QWORD *)&v96 + 1) + 56) = v100;
          *(_QWORD *)(*((_QWORD *)&v96 + 1) + 64) = v99;
        }
      }
    }
  }
  v101 = *(uint64_t **)&v386->_anon_d08[152];
  if (v101)
    md::MeshSetStorage::prepareStorage(v101, a3);
  v103 = v386->_venueWallEndCapMeshInfo._value.type;
  v102 = *(unsigned __int16 **)v386->_anon_d08;
  if (*(unsigned __int16 **)&v103 != v102)
  {
    v4.n128_u64[1] = 0;
    do
    {
      if (!**(_WORD **)&v103 || !*(_DWORD *)(*(_QWORD *)&v103 + 4))
        goto LABEL_148;
      v104 = *(_QWORD *)&v386->_anon_d08[144];
      if (*(_BYTE *)(v104 + 40)
        && (v105 = *(_QWORD **)&v386->_anon_d08[160]) != 0
        && *v105 == v104
        && (v106 = v105[1] * (unsigned __int16)**(_WORD **)&v103,
            v107 = v105[8],
            v108 = v105[4],
            v107 + v106 <= (unint64_t)(v105[5] - v108)))
      {
        *(_QWORD *)&v408 = v108 + v107;
        *((_QWORD *)&v408 + 1) = v108 + v107 + v106;
        v105[8] = v107 + v106;
        v157 = *(_QWORD *)(v104 + 48);
        v405 = "Venue Wall End Cap Vertex Data";
        v158 = v105[14];
        if (!v158)
          goto LABEL_575;
        (*(void (**)(__int128 *__return_ptr, uint64_t, const char **, uint64_t, __int128 *))(*(_QWORD *)v158 + 48))(&v407, v158, &v405, v157, &v408);
        v104 = *(_QWORD *)&v386->_anon_d08[144];
      }
      else
      {
        v407 = 0uLL;
      }
      md::MeshSetStorage::buildSubIndexData(&v405, v104, *(_QWORD **)&v386->_anon_d08[160], (uint64_t)"Venue Wall End Cap Index Data", *(unsigned int *)(*(_QWORD *)&v103 + 4));
      v395 = v407;
      v109 = (std::__shared_weak_count *)*((_QWORD *)&v407 + 1);
      if (*((_QWORD *)&v407 + 1))
      {
        v110 = (unint64_t *)(*((_QWORD *)&v407 + 1) + 8);
        do
          v111 = __ldxr(v110);
        while (__stxr(v111 + 1, v110));
      }
      v112 = (char *)operator new(0xA8uLL);
      *((_QWORD *)v112 + 1) = 0;
      *((_QWORD *)v112 + 2) = 0;
      *(_QWORD *)v112 = &off_1E42E53E8;
      v113 = v405;
      v114 = v406;
      if (v406)
      {
        v115 = (unint64_t *)&v406->__shared_owners_;
        do
          v116 = __ldxr(v115);
        while (__stxr(v116 + 1, v115));
      }
      if ((v117 & 1) == 0
      {
        if ((v159 & 1) == 0
        {
          ggl::MeshTyped<ggl::VenueWall::EndCapVbo>::attributesReflection(void)::r = (uint64_t)&ggl::VenueWall::endCapVboReflection;
        }
        ggl::MeshTyped<ggl::VenueWall::EndCapVbo>::typedReflection(void)::r = (uint64_t)&ggl::MeshTyped<ggl::VenueWall::EndCapVbo>::attributesReflection(void)::r;
        unk_1ECE43E60 = 1;
      }
      *((_QWORD *)v112 + 11) = 0;
      *((_QWORD *)v112 + 7) = 0;
      *((_QWORD *)v112 + 8) = 0;
      *((_DWORD *)v112 + 18) = 0;
      *((_QWORD *)v112 + 3) = &off_1E42BBC08;
      *((_QWORD *)v112 + 4) = "Venue Wall End Cap Mesh";
      *((_QWORD *)v112 + 5) = &unk_1E42BBC28;
      *((_QWORD *)v112 + 6) = 0;
      *((_QWORD *)v112 + 10) = &ggl::MeshTyped<ggl::VenueWall::EndCapVbo>::typedReflection(void)::r;
      *((_QWORD *)v112 + 12) = 0;
      *((_QWORD *)v112 + 13) = 0;
      v119 = &unk_1ECE44000;
      if ((v118 & 1) == 0)
      {
        v119 = (_QWORD *)&unk_1ECE44000;
        if (v160)
        {
          v161 = operator new();
          *(_QWORD *)(v161 + 16) = 0xA3D02C1100000005;
          *(_QWORD *)(v161 + 24) = "GeoGL";
          *(_OWORD *)(v161 + 32) = xmmword_19FFB2DE0;
          *(_QWORD *)v161 = &off_1E42B5668;
          *(_QWORD *)(v161 + 8) = "GeoGL";
          *(_OWORD *)(v161 + 72) = 0u;
          *(_OWORD *)(v161 + 88) = 0u;
          *(_OWORD *)(v161 + 104) = 0u;
          *(_OWORD *)(v161 + 120) = 0u;
          *(_OWORD *)(v161 + 136) = 0u;
          *(_OWORD *)(v161 + 152) = 0u;
          *(_OWORD *)(v161 + 168) = 0u;
          *(_OWORD *)(v161 + 184) = 0u;
          *(_OWORD *)(v161 + 200) = 0u;
          *(_OWORD *)(v161 + 216) = 0u;
          *(_OWORD *)(v161 + 232) = 0u;
          *(_QWORD *)(v161 + 248) = 0;
          *(_OWORD *)(v161 + 56) = 0u;
          v162 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v161 + 56), 0);
          if ((_DWORD)v162)
            geo::read_write_lock::logFailure(v162, (uint64_t)"initialization", v163);
          v164 = malloc_create_zone(0, 0);
          *(_QWORD *)(v161 + 48) = v164;
          malloc_set_zone_name(v164, "GeoGL");
          *(_QWORD *)(v161 + 256) = os_log_create("com.apple.VectorKit", "Memory");
          ggl::Allocator::instance(void)::alloc = v161;
          v119 = &unk_1ECE44000;
        }
      }
      v120 = v119[495];
      *((_QWORD *)v112 + 18) = 0;
      *((_QWORD *)v112 + 15) = 0;
      *((_QWORD *)v112 + 16) = 0;
      *((_QWORD *)v112 + 14) = v120;
      if ((v120 & 1) == 0)
      {
        v119 = (_QWORD *)&unk_1ECE44000;
        if (v165)
        {
          v166 = operator new();
          *(_QWORD *)(v166 + 16) = 0xA3D02C1100000005;
          *(_QWORD *)(v166 + 24) = "GeoGL";
          *(_OWORD *)(v166 + 32) = xmmword_19FFB2DE0;
          *(_QWORD *)v166 = &off_1E42B5668;
          *(_QWORD *)(v166 + 8) = "GeoGL";
          *(_OWORD *)(v166 + 72) = 0u;
          *(_OWORD *)(v166 + 88) = 0u;
          *(_OWORD *)(v166 + 104) = 0u;
          *(_OWORD *)(v166 + 120) = 0u;
          *(_OWORD *)(v166 + 136) = 0u;
          *(_OWORD *)(v166 + 152) = 0u;
          *(_OWORD *)(v166 + 168) = 0u;
          *(_OWORD *)(v166 + 184) = 0u;
          *(_OWORD *)(v166 + 200) = 0u;
          *(_OWORD *)(v166 + 216) = 0u;
          *(_OWORD *)(v166 + 232) = 0u;
          *(_QWORD *)(v166 + 248) = 0;
          v167 = v166;
          *(_OWORD *)(v166 + 56) = 0u;
          v168 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v166 + 56), 0);
          if ((_DWORD)v168)
            geo::read_write_lock::logFailure(v168, (uint64_t)"initialization", v169);
          v170 = malloc_create_zone(0, 0);
          *(_QWORD *)(v167 + 48) = v170;
          malloc_set_zone_name(v170, "GeoGL");
          *(_QWORD *)(v167 + 256) = os_log_create("com.apple.VectorKit", "Memory");
          ggl::Allocator::instance(void)::alloc = v167;
          v119 = &unk_1ECE44000;
        }
      }
      *((_QWORD *)v112 + 19) = v119[495];
      *((_QWORD *)v112 + 20) = 0;
      *((_QWORD *)v112 + 17) = v112 + 144;
      *((_QWORD *)v112 + 3) = &off_1E42BE238;
      *((_QWORD *)v112 + 5) = &unk_1E42BE258;
      v408 = v395;
      if (v109)
      {
        v121 = (unint64_t *)&v109->__shared_owners_;
        do
          v122 = __ldxr(v121);
        while (__stxr(v122 + 1, v121));
      }
      std::vector<std::shared_ptr<ggl::VertexData>,geo::StdAllocator<std::shared_ptr<ggl::VertexData>,ggl::Allocator>>::__assign_with_size[abi:nn180100]<std::shared_ptr<ggl::VertexData> const*,std::shared_ptr<ggl::VertexData> const*>((uint64_t)(v112 + 88), (uint64_t *)&v408, (uint64_t *)&v409, 1uLL);
      v123 = (std::__shared_weak_count *)*((_QWORD *)&v408 + 1);
      if (!*((_QWORD *)&v408 + 1))
        goto LABEL_172;
      v124 = (unint64_t *)(*((_QWORD *)&v408 + 1) + 8);
      do
        v125 = __ldaxr(v124);
      while (__stlxr(v125 - 1, v124));
      if (!v125)
      {
        ((void (*)(std::__shared_weak_count *))v123->__on_zero_shared)(v123);
        std::__shared_weak_count::__release_weak(v123);
        if (!v114)
          goto LABEL_175;
      }
      else
      {
LABEL_172:
        if (!v114)
          goto LABEL_175;
      }
      v126 = (unint64_t *)&v114->__shared_owners_;
      do
        v127 = __ldxr(v126);
      while (__stxr(v127 + 1, v126));
LABEL_175:
      v128 = (std::__shared_weak_count *)*((_QWORD *)v112 + 16);
      *((_QWORD *)v112 + 15) = v113;
      *((_QWORD *)v112 + 16) = v114;
      if (v128)
      {
        v129 = (unint64_t *)&v128->__shared_owners_;
        do
          v130 = __ldaxr(v129);
        while (__stlxr(v130 - 1, v129));
        if (!v130)
        {
          ((void (*)(std::__shared_weak_count *))v128->__on_zero_shared)(v128);
          std::__shared_weak_count::__release_weak(v128);
        }
      }
      *((_QWORD *)v112 + 3) = &off_1E42BE498;
      *((_QWORD *)v112 + 5) = &unk_1E42BE4B8;
      if (!v114)
        goto LABEL_184;
      v131 = (unint64_t *)&v114->__shared_owners_;
      do
        v132 = __ldaxr(v131);
      while (__stlxr(v132 - 1, v131));
      if (!v132)
      {
        ((void (*)(std::__shared_weak_count *))v114->__on_zero_shared)(v114);
        std::__shared_weak_count::__release_weak(v114);
        if (!v109)
          goto LABEL_192;
      }
      else
      {
LABEL_184:
        if (!v109)
          goto LABEL_192;
      }
      v133 = (unint64_t *)&v109->__shared_owners_;
      do
        v134 = __ldaxr(v133);
      while (__stlxr(v134 - 1, v133));
      if (!v134)
      {
        ((void (*)(std::__shared_weak_count *))v109->__on_zero_shared)(v109);
        std::__shared_weak_count::__release_weak(v109);
      }
LABEL_192:
      v136 = *(char **)&v386->_anon_d08[24];
      v135 = *(_QWORD *)&v386->_anon_d08[32];
      if ((unint64_t)v136 >= v135)
      {
        v138 = *(char **)&v386->_anon_d08[16];
        v139 = (v136 - v138) >> 4;
        v140 = v139 + 1;
        if ((unint64_t)(v139 + 1) >> 60)
          abort();
        v141 = v135 - (_QWORD)v138;
        if (v141 >> 3 > v140)
          v140 = v141 >> 3;
        if ((unint64_t)v141 >= 0x7FFFFFFFFFFFFFF0)
          v142 = 0xFFFFFFFFFFFFFFFLL;
        else
          v142 = v140;
        if (v142 >> 60)
          goto LABEL_570;
        v143 = (char *)operator new(16 * v142);
        v4.n128_u64[0] = (unint64_t)(v112 + 24);
        v4.n128_u64[1] = (unint64_t)v112;
        v144 = (__n128 *)&v143[16 * v139];
        v145 = &v143[16 * v142];
        *v144 = v4;
        v137 = v144 + 1;
        if (v136 == v138)
        {
          *(_QWORD *)&v386->_anon_d08[16] = v144;
          *(_QWORD *)&v386->_anon_d08[24] = v137;
          *(_QWORD *)&v386->_anon_d08[32] = v145;
        }
        else
        {
          do
          {
            v146 = *((__n128 *)v136 - 1);
            v136 -= 16;
            v4.n128_u64[1] = v146.n128_u64[1];
            v144[-1] = v146;
            --v144;
            *(_QWORD *)v136 = 0;
            *((_QWORD *)v136 + 1) = 0;
          }
          while (v136 != v138);
          v136 = *(char **)&v386->_anon_d08[16];
          v147 = *(char **)&v386->_anon_d08[24];
          *(_QWORD *)&v386->_anon_d08[16] = v144;
          *(_QWORD *)&v386->_anon_d08[24] = v137;
          *(_QWORD *)&v386->_anon_d08[32] = v145;
          while (v147 != v136)
          {
            v148 = (std::__shared_weak_count *)*((_QWORD *)v147 - 1);
            if (v148)
            {
              v149 = (unint64_t *)&v148->__shared_owners_;
              do
                v150 = __ldaxr(v149);
              while (__stlxr(v150 - 1, v149));
              if (!v150)
              {
                ((void (*)(std::__shared_weak_count *))v148->__on_zero_shared)(v148);
                std::__shared_weak_count::__release_weak(v148);
              }
            }
            v147 -= 16;
          }
        }
        if (v136)
          operator delete(v136);
      }
      else
      {
        *(_QWORD *)v136 = v112 + 24;
        *((_QWORD *)v136 + 1) = v112;
        v137 = (__n128 *)(v136 + 16);
      }
      *(_QWORD *)&v386->_anon_d08[24] = v137;
      v151 = v406;
      if (!v406)
        goto LABEL_218;
      v152 = (unint64_t *)&v406->__shared_owners_;
      do
        v153 = __ldaxr(v152);
      while (__stlxr(v153 - 1, v152));
      if (!v153)
      {
        ((void (*)(std::__shared_weak_count *))v151->__on_zero_shared)(v151);
        std::__shared_weak_count::__release_weak(v151);
        v154 = (std::__shared_weak_count *)*((_QWORD *)&v407 + 1);
        if (*((_QWORD *)&v407 + 1))
        {
LABEL_219:
          v155 = (unint64_t *)&v154->__shared_owners_;
          do
            v156 = __ldaxr(v155);
          while (__stlxr(v156 - 1, v155));
          if (!v156)
          {
            ((void (*)(std::__shared_weak_count *))v154->__on_zero_shared)(v154);
            std::__shared_weak_count::__release_weak(v154);
          }
        }
      }
      else
      {
LABEL_218:
        v154 = (std::__shared_weak_count *)*((_QWORD *)&v407 + 1);
        if (*((_QWORD *)&v407 + 1))
          goto LABEL_219;
      }
      v102 = *(unsigned __int16 **)v386->_anon_d08;
LABEL_148:
      *(_QWORD *)&v103 += 8;
    }
    while (*(unsigned __int16 **)&v103 != v102);
  }
  v171 = *(_QWORD *)&v386->_anon_d08[16];
  if (v171 != *(_QWORD *)&v386->_anon_d08[24])
  {
    v172 = **(_QWORD **)(*(_QWORD *)v171 + 64);
    v173 = **(unsigned __int16 **)&v386->_venueWallEndCapMeshInfo._value.type;
    v408 = 0uLL;
    v174 = *(_QWORD *)(v172 + 8) * v173;
    v4.n128_u64[0] = (unint64_t)a3;
    *(_QWORD *)&v175 = a3;
    *((_QWORD *)&v175 + 1) = v172;
    v396 = v4;
    if (v174)
    {
      if (a3 && *(_BYTE *)(v172 + 17) != 2)
      {
        v389 = v175;
        v176 = (*((uint64_t (**)(void))a3->var0 + 7))();
        v175 = v389;
      }
      else
      {
        v176 = *(_QWORD *)(v172 + 72);
      }
    }
    else
    {
      v176 = 0;
    }
    v408 = v175;
    v409 = 0;
    v410 = v174;
    v412 = v176;
    v411 = 257;
    ggl::BufferMemory::operator=((uint64_t *)&v386->_anon_d08[40], (uint64_t)&v408);
    *(_QWORD *)&v177 = v396.n128_u64[0];
    if (v412)
    {
      v179 = v409;
      v178 = v410;
      if (v410 != v409)
      {
        v180 = v408;
        v181 = v411;
        v182 = HIBYTE(v411);
        if ((_QWORD)v408 && *(_BYTE *)(*((_QWORD *)&v408 + 1) + 17) != 2)
        {
          (*(void (**)(__n128))(*(_QWORD *)v408 + 64))(v396);
          *(_QWORD *)&v177 = v396.n128_u64[0];
        }
        if (v181 && !v182)
        {
          v184 = *(_QWORD *)(*((_QWORD *)&v180 + 1) + 56);
          v183 = *(_QWORD *)(*((_QWORD *)&v180 + 1) + 64);
          if (v183 == v184)
            v184 = *(_QWORD *)(*((_QWORD *)&v180 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v180 + 1) + 72);
          if (v179 < v184)
            v184 = v179;
          if (v183 <= v178)
            v183 = v178;
          if (v183 == v184)
            v183 = v184 + *(_QWORD *)(*((_QWORD *)&v180 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v180 + 1) + 72);
          *(_QWORD *)(*((_QWORD *)&v180 + 1) + 56) = v184;
          *(_QWORD *)(*((_QWORD *)&v180 + 1) + 64) = v183;
        }
      }
    }
    v185 = *(_QWORD *)(**(_QWORD **)&v386->_anon_d08[16] + 96);
    v186 = *(unsigned int *)(*(_QWORD *)&v386->_venueWallEndCapMeshInfo._value.type + 4);
    v408 = 0uLL;
    v187 = *(_QWORD *)(v185 + 8) * v186;
    *((_QWORD *)&v177 + 1) = v185;
    if (v187)
    {
      if (a3 && *(_BYTE *)(v185 + 17) != 2)
      {
        v397 = v177;
        v188 = (*((uint64_t (**)(void))a3->var0 + 7))();
        v177 = v397;
      }
      else
      {
        v188 = *(_QWORD *)(v185 + 72);
      }
    }
    else
    {
      v188 = 0;
    }
    v408 = v177;
    v409 = 0;
    v410 = v187;
    v412 = v188;
    v411 = 257;
    ggl::BufferMemory::operator=((uint64_t *)&v386->_anon_d08[88], (uint64_t)&v408);
    if (v412)
    {
      v190 = v409;
      v189 = v410;
      if (v410 != v409)
      {
        v191 = v408;
        v192 = v411;
        v193 = HIBYTE(v411);
        if ((_QWORD)v408 && *(_BYTE *)(*((_QWORD *)&v408 + 1) + 17) != 2)
          (*(void (**)(void))(*(_QWORD *)v408 + 64))();
        if (v192 && !v193)
        {
          v195 = *(_QWORD *)(*((_QWORD *)&v191 + 1) + 56);
          v194 = *(_QWORD *)(*((_QWORD *)&v191 + 1) + 64);
          if (v194 == v195)
            v195 = *(_QWORD *)(*((_QWORD *)&v191 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v191 + 1) + 72);
          if (v190 < v195)
            v195 = v190;
          if (v194 <= v189)
            v194 = v189;
          if (v194 == v195)
            v194 = v195 + *(_QWORD *)(*((_QWORD *)&v191 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v191 + 1) + 72);
          *(_QWORD *)(*((_QWORD *)&v191 + 1) + 56) = v195;
          *(_QWORD *)(*((_QWORD *)&v191 + 1) + 64) = v194;
        }
      }
    }
  }
  v196 = *(uint64_t **)&v386->_anon_dc8[152];
  if (v196)
    md::MeshSetStorage::prepareStorage(v196, a3);
  v198 = v386->_venueWallHorizontalStrokeMeshInfo._value.type;
  v197 = *(unsigned __int16 **)v386->_anon_dc8;
  if (*(unsigned __int16 **)&v198 != v197)
  {
    v4.n128_u64[1] = 0;
    do
    {
      if (!**(_WORD **)&v198 || !*(_DWORD *)(*(_QWORD *)&v198 + 4))
        goto LABEL_290;
      v199 = *(_QWORD *)&v386->_anon_dc8[144];
      if (*(_BYTE *)(v199 + 40)
        && (v200 = *(_QWORD **)&v386->_anon_dc8[160]) != 0
        && *v200 == v199
        && (v201 = v200[1] * (unsigned __int16)**(_WORD **)&v198,
            v202 = v200[8],
            v203 = v200[4],
            v202 + v201 <= (unint64_t)(v200[5] - v203)))
      {
        *(_QWORD *)&v408 = v203 + v202;
        *((_QWORD *)&v408 + 1) = v203 + v202 + v201;
        v200[8] = v202 + v201;
        v252 = *(_QWORD *)(v199 + 48);
        v405 = "Venue Wall Horizontal Stroke Vertex Data";
        v253 = v200[14];
        if (!v253)
          goto LABEL_575;
        (*(void (**)(__int128 *__return_ptr, uint64_t, const char **, uint64_t, __int128 *))(*(_QWORD *)v253 + 48))(&v407, v253, &v405, v252, &v408);
        v199 = *(_QWORD *)&v386->_anon_dc8[144];
      }
      else
      {
        v407 = 0uLL;
      }
      md::MeshSetStorage::buildSubIndexData(&v405, v199, *(_QWORD **)&v386->_anon_dc8[160], (uint64_t)"Venue Wall Horizontal Stroke Index Data", *(unsigned int *)(*(_QWORD *)&v198 + 4));
      v398 = v407;
      v204 = (std::__shared_weak_count *)*((_QWORD *)&v407 + 1);
      if (*((_QWORD *)&v407 + 1))
      {
        v205 = (unint64_t *)(*((_QWORD *)&v407 + 1) + 8);
        do
          v206 = __ldxr(v205);
        while (__stxr(v206 + 1, v205));
      }
      v207 = (char *)operator new(0xA8uLL);
      *((_QWORD *)v207 + 1) = 0;
      *((_QWORD *)v207 + 2) = 0;
      *(_QWORD *)v207 = &off_1E42DF028;
      v208 = v405;
      v209 = v406;
      if (v406)
      {
        v210 = (unint64_t *)&v406->__shared_owners_;
        do
          v211 = __ldxr(v210);
        while (__stxr(v211 + 1, v210));
      }
      if ((v212 & 1) == 0
      {
        if ((v254 & 1) == 0
        {
          ggl::MeshTyped<ggl::Venue3DStroke::HorizontalDefaultVbo>::attributesReflection(void)::r = (uint64_t)&ggl::Venue3DStroke::horizontalDefaultVboReflection;
        }
        ggl::MeshTyped<ggl::Venue3DStroke::HorizontalDefaultVbo>::typedReflection(void)::r = (uint64_t)&ggl::MeshTyped<ggl::Venue3DStroke::HorizontalDefaultVbo>::attributesReflection(void)::r;
        *(_QWORD *)algn_1ECE43BD0 = 1;
      }
      *((_QWORD *)v207 + 11) = 0;
      *((_QWORD *)v207 + 7) = 0;
      *((_QWORD *)v207 + 8) = 0;
      *((_DWORD *)v207 + 18) = 0;
      *((_QWORD *)v207 + 3) = &off_1E42BBC08;
      *((_QWORD *)v207 + 4) = "Venue Wall Horizontal Stroke Mesh";
      *((_QWORD *)v207 + 5) = &unk_1E42BBC28;
      *((_QWORD *)v207 + 6) = 0;
      *((_QWORD *)v207 + 10) = &ggl::MeshTyped<ggl::Venue3DStroke::HorizontalDefaultVbo>::typedReflection(void)::r;
      *((_QWORD *)v207 + 12) = 0;
      *((_QWORD *)v207 + 13) = 0;
      v214 = &unk_1ECE44000;
      if ((v213 & 1) == 0)
      {
        v214 = (_QWORD *)&unk_1ECE44000;
        if (v255)
        {
          v256 = operator new();
          *(_QWORD *)(v256 + 16) = 0xA3D02C1100000005;
          *(_QWORD *)(v256 + 24) = "GeoGL";
          *(_OWORD *)(v256 + 32) = xmmword_19FFB2DE0;
          *(_QWORD *)v256 = &off_1E42B5668;
          *(_QWORD *)(v256 + 8) = "GeoGL";
          *(_OWORD *)(v256 + 72) = 0u;
          *(_OWORD *)(v256 + 88) = 0u;
          *(_OWORD *)(v256 + 104) = 0u;
          *(_OWORD *)(v256 + 120) = 0u;
          *(_OWORD *)(v256 + 136) = 0u;
          *(_OWORD *)(v256 + 152) = 0u;
          *(_OWORD *)(v256 + 168) = 0u;
          *(_OWORD *)(v256 + 184) = 0u;
          *(_OWORD *)(v256 + 200) = 0u;
          *(_OWORD *)(v256 + 216) = 0u;
          *(_OWORD *)(v256 + 232) = 0u;
          *(_QWORD *)(v256 + 248) = 0;
          *(_OWORD *)(v256 + 56) = 0u;
          v257 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v256 + 56), 0);
          if ((_DWORD)v257)
            geo::read_write_lock::logFailure(v257, (uint64_t)"initialization", v258);
          v259 = malloc_create_zone(0, 0);
          *(_QWORD *)(v256 + 48) = v259;
          malloc_set_zone_name(v259, "GeoGL");
          *(_QWORD *)(v256 + 256) = os_log_create("com.apple.VectorKit", "Memory");
          ggl::Allocator::instance(void)::alloc = v256;
          v214 = &unk_1ECE44000;
        }
      }
      v215 = v214[495];
      *((_QWORD *)v207 + 18) = 0;
      *((_QWORD *)v207 + 15) = 0;
      *((_QWORD *)v207 + 16) = 0;
      *((_QWORD *)v207 + 14) = v215;
      if ((v215 & 1) == 0)
      {
        v214 = (_QWORD *)&unk_1ECE44000;
        if (v260)
        {
          v261 = operator new();
          *(_QWORD *)(v261 + 16) = 0xA3D02C1100000005;
          *(_QWORD *)(v261 + 24) = "GeoGL";
          *(_OWORD *)(v261 + 32) = xmmword_19FFB2DE0;
          *(_QWORD *)v261 = &off_1E42B5668;
          *(_QWORD *)(v261 + 8) = "GeoGL";
          *(_OWORD *)(v261 + 72) = 0u;
          *(_OWORD *)(v261 + 88) = 0u;
          *(_OWORD *)(v261 + 104) = 0u;
          *(_OWORD *)(v261 + 120) = 0u;
          *(_OWORD *)(v261 + 136) = 0u;
          *(_OWORD *)(v261 + 152) = 0u;
          *(_OWORD *)(v261 + 168) = 0u;
          *(_OWORD *)(v261 + 184) = 0u;
          *(_OWORD *)(v261 + 200) = 0u;
          *(_OWORD *)(v261 + 216) = 0u;
          *(_OWORD *)(v261 + 232) = 0u;
          *(_QWORD *)(v261 + 248) = 0;
          v262 = v261;
          *(_OWORD *)(v261 + 56) = 0u;
          v263 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v261 + 56), 0);
          if ((_DWORD)v263)
            geo::read_write_lock::logFailure(v263, (uint64_t)"initialization", v264);
          v265 = malloc_create_zone(0, 0);
          *(_QWORD *)(v262 + 48) = v265;
          malloc_set_zone_name(v265, "GeoGL");
          *(_QWORD *)(v262 + 256) = os_log_create("com.apple.VectorKit", "Memory");
          ggl::Allocator::instance(void)::alloc = v262;
          v214 = &unk_1ECE44000;
        }
      }
      *((_QWORD *)v207 + 19) = v214[495];
      *((_QWORD *)v207 + 20) = 0;
      *((_QWORD *)v207 + 17) = v207 + 144;
      *((_QWORD *)v207 + 3) = &off_1E42BD5F8;
      *((_QWORD *)v207 + 5) = &unk_1E42BD618;
      v408 = v398;
      if (v204)
      {
        v216 = (unint64_t *)&v204->__shared_owners_;
        do
          v217 = __ldxr(v216);
        while (__stxr(v217 + 1, v216));
      }
      std::vector<std::shared_ptr<ggl::VertexData>,geo::StdAllocator<std::shared_ptr<ggl::VertexData>,ggl::Allocator>>::__assign_with_size[abi:nn180100]<std::shared_ptr<ggl::VertexData> const*,std::shared_ptr<ggl::VertexData> const*>((uint64_t)(v207 + 88), (uint64_t *)&v408, (uint64_t *)&v409, 1uLL);
      v218 = (std::__shared_weak_count *)*((_QWORD *)&v408 + 1);
      if (!*((_QWORD *)&v408 + 1))
        goto LABEL_314;
      v219 = (unint64_t *)(*((_QWORD *)&v408 + 1) + 8);
      do
        v220 = __ldaxr(v219);
      while (__stlxr(v220 - 1, v219));
      if (!v220)
      {
        ((void (*)(std::__shared_weak_count *))v218->__on_zero_shared)(v218);
        std::__shared_weak_count::__release_weak(v218);
        if (!v209)
          goto LABEL_317;
      }
      else
      {
LABEL_314:
        if (!v209)
          goto LABEL_317;
      }
      v221 = (unint64_t *)&v209->__shared_owners_;
      do
        v222 = __ldxr(v221);
      while (__stxr(v222 + 1, v221));
LABEL_317:
      v223 = (std::__shared_weak_count *)*((_QWORD *)v207 + 16);
      *((_QWORD *)v207 + 15) = v208;
      *((_QWORD *)v207 + 16) = v209;
      if (v223)
      {
        v224 = (unint64_t *)&v223->__shared_owners_;
        do
          v225 = __ldaxr(v224);
        while (__stlxr(v225 - 1, v224));
        if (!v225)
        {
          ((void (*)(std::__shared_weak_count *))v223->__on_zero_shared)(v223);
          std::__shared_weak_count::__release_weak(v223);
        }
      }
      *((_QWORD *)v207 + 3) = &off_1E42B6858;
      *((_QWORD *)v207 + 5) = &unk_1E42B6878;
      if (!v209)
        goto LABEL_326;
      v226 = (unint64_t *)&v209->__shared_owners_;
      do
        v227 = __ldaxr(v226);
      while (__stlxr(v227 - 1, v226));
      if (!v227)
      {
        ((void (*)(std::__shared_weak_count *))v209->__on_zero_shared)(v209);
        std::__shared_weak_count::__release_weak(v209);
        if (!v204)
          goto LABEL_334;
      }
      else
      {
LABEL_326:
        if (!v204)
          goto LABEL_334;
      }
      v228 = (unint64_t *)&v204->__shared_owners_;
      do
        v229 = __ldaxr(v228);
      while (__stlxr(v229 - 1, v228));
      if (!v229)
      {
        ((void (*)(std::__shared_weak_count *))v204->__on_zero_shared)(v204);
        std::__shared_weak_count::__release_weak(v204);
      }
LABEL_334:
      v231 = *(char **)&v386->_anon_dc8[24];
      v230 = *(_QWORD *)&v386->_anon_dc8[32];
      if ((unint64_t)v231 >= v230)
      {
        v233 = *(char **)&v386->_anon_dc8[16];
        v234 = (v231 - v233) >> 4;
        v235 = v234 + 1;
        if ((unint64_t)(v234 + 1) >> 60)
          abort();
        v236 = v230 - (_QWORD)v233;
        if (v236 >> 3 > v235)
          v235 = v236 >> 3;
        if ((unint64_t)v236 >= 0x7FFFFFFFFFFFFFF0)
          v237 = 0xFFFFFFFFFFFFFFFLL;
        else
          v237 = v235;
        if (v237 >> 60)
          goto LABEL_570;
        v238 = (char *)operator new(16 * v237);
        v4.n128_u64[0] = (unint64_t)(v207 + 24);
        v4.n128_u64[1] = (unint64_t)v207;
        v239 = (__n128 *)&v238[16 * v234];
        v240 = &v238[16 * v237];
        *v239 = v4;
        v232 = v239 + 1;
        if (v231 == v233)
        {
          *(_QWORD *)&v386->_anon_dc8[16] = v239;
          *(_QWORD *)&v386->_anon_dc8[24] = v232;
          *(_QWORD *)&v386->_anon_dc8[32] = v240;
        }
        else
        {
          do
          {
            v241 = *((__n128 *)v231 - 1);
            v231 -= 16;
            v4.n128_u64[1] = v241.n128_u64[1];
            v239[-1] = v241;
            --v239;
            *(_QWORD *)v231 = 0;
            *((_QWORD *)v231 + 1) = 0;
          }
          while (v231 != v233);
          v231 = *(char **)&v386->_anon_dc8[16];
          v242 = *(char **)&v386->_anon_dc8[24];
          *(_QWORD *)&v386->_anon_dc8[16] = v239;
          *(_QWORD *)&v386->_anon_dc8[24] = v232;
          *(_QWORD *)&v386->_anon_dc8[32] = v240;
          while (v242 != v231)
          {
            v243 = (std::__shared_weak_count *)*((_QWORD *)v242 - 1);
            if (v243)
            {
              v244 = (unint64_t *)&v243->__shared_owners_;
              do
                v245 = __ldaxr(v244);
              while (__stlxr(v245 - 1, v244));
              if (!v245)
              {
                ((void (*)(std::__shared_weak_count *))v243->__on_zero_shared)(v243);
                std::__shared_weak_count::__release_weak(v243);
              }
            }
            v242 -= 16;
          }
        }
        if (v231)
          operator delete(v231);
      }
      else
      {
        *(_QWORD *)v231 = v207 + 24;
        *((_QWORD *)v231 + 1) = v207;
        v232 = (__n128 *)(v231 + 16);
      }
      *(_QWORD *)&v386->_anon_dc8[24] = v232;
      v246 = v406;
      if (!v406)
        goto LABEL_360;
      v247 = (unint64_t *)&v406->__shared_owners_;
      do
        v248 = __ldaxr(v247);
      while (__stlxr(v248 - 1, v247));
      if (!v248)
      {
        ((void (*)(std::__shared_weak_count *))v246->__on_zero_shared)(v246);
        std::__shared_weak_count::__release_weak(v246);
        v249 = (std::__shared_weak_count *)*((_QWORD *)&v407 + 1);
        if (*((_QWORD *)&v407 + 1))
        {
LABEL_361:
          v250 = (unint64_t *)&v249->__shared_owners_;
          do
            v251 = __ldaxr(v250);
          while (__stlxr(v251 - 1, v250));
          if (!v251)
          {
            ((void (*)(std::__shared_weak_count *))v249->__on_zero_shared)(v249);
            std::__shared_weak_count::__release_weak(v249);
          }
        }
      }
      else
      {
LABEL_360:
        v249 = (std::__shared_weak_count *)*((_QWORD *)&v407 + 1);
        if (*((_QWORD *)&v407 + 1))
          goto LABEL_361;
      }
      v197 = *(unsigned __int16 **)v386->_anon_dc8;
LABEL_290:
      *(_QWORD *)&v198 += 8;
    }
    while (*(unsigned __int16 **)&v198 != v197);
  }
  v266 = *(_QWORD *)&v386->_anon_dc8[16];
  if (v266 != *(_QWORD *)&v386->_anon_dc8[24])
  {
    v267 = **(_QWORD **)(*(_QWORD *)v266 + 64);
    v268 = **(unsigned __int16 **)&v386->_venueWallHorizontalStrokeMeshInfo._value.type;
    v408 = 0uLL;
    v269 = *(_QWORD *)(v267 + 8) * v268;
    v4.n128_u64[0] = (unint64_t)a3;
    *(_QWORD *)&v270 = a3;
    *((_QWORD *)&v270 + 1) = v267;
    v399 = v4;
    if (v269)
    {
      if (a3 && *(_BYTE *)(v267 + 17) != 2)
      {
        v390 = v270;
        v271 = (*((uint64_t (**)(void))a3->var0 + 7))();
        v270 = v390;
      }
      else
      {
        v271 = *(_QWORD *)(v267 + 72);
      }
    }
    else
    {
      v271 = 0;
    }
    v408 = v270;
    v409 = 0;
    v410 = v269;
    v412 = v271;
    v411 = 257;
    ggl::BufferMemory::operator=((uint64_t *)&v386->_anon_dc8[40], (uint64_t)&v408);
    *(_QWORD *)&v272 = v399.n128_u64[0];
    if (v412)
    {
      v274 = v409;
      v273 = v410;
      if (v410 != v409)
      {
        v275 = v408;
        v276 = v411;
        v277 = HIBYTE(v411);
        if ((_QWORD)v408 && *(_BYTE *)(*((_QWORD *)&v408 + 1) + 17) != 2)
        {
          (*(void (**)(__n128))(*(_QWORD *)v408 + 64))(v399);
          *(_QWORD *)&v272 = v399.n128_u64[0];
        }
        if (v276 && !v277)
        {
          v279 = *(_QWORD *)(*((_QWORD *)&v275 + 1) + 56);
          v278 = *(_QWORD *)(*((_QWORD *)&v275 + 1) + 64);
          if (v278 == v279)
            v279 = *(_QWORD *)(*((_QWORD *)&v275 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v275 + 1) + 72);
          if (v274 < v279)
            v279 = v274;
          if (v278 <= v273)
            v278 = v273;
          if (v278 == v279)
            v278 = v279 + *(_QWORD *)(*((_QWORD *)&v275 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v275 + 1) + 72);
          *(_QWORD *)(*((_QWORD *)&v275 + 1) + 56) = v279;
          *(_QWORD *)(*((_QWORD *)&v275 + 1) + 64) = v278;
        }
      }
    }
    v280 = *(_QWORD *)(**(_QWORD **)&v386->_anon_dc8[16] + 96);
    v281 = *(unsigned int *)(*(_QWORD *)&v386->_venueWallHorizontalStrokeMeshInfo._value.type + 4);
    v408 = 0uLL;
    v282 = *(_QWORD *)(v280 + 8) * v281;
    *((_QWORD *)&v272 + 1) = v280;
    if (v282)
    {
      if (a3 && *(_BYTE *)(v280 + 17) != 2)
      {
        v400 = v272;
        v283 = (*((uint64_t (**)(void))a3->var0 + 7))();
        v272 = v400;
      }
      else
      {
        v283 = *(_QWORD *)(v280 + 72);
      }
    }
    else
    {
      v283 = 0;
    }
    v408 = v272;
    v409 = 0;
    v410 = v282;
    v412 = v283;
    v411 = 257;
    ggl::BufferMemory::operator=((uint64_t *)&v386->_anon_dc8[88], (uint64_t)&v408);
    if (v412)
    {
      v285 = v409;
      v284 = v410;
      if (v410 != v409)
      {
        v286 = v408;
        v287 = v411;
        v288 = HIBYTE(v411);
        if ((_QWORD)v408 && *(_BYTE *)(*((_QWORD *)&v408 + 1) + 17) != 2)
          (*(void (**)(void))(*(_QWORD *)v408 + 64))();
        if (v287 && !v288)
        {
          v290 = *(_QWORD *)(*((_QWORD *)&v286 + 1) + 56);
          v289 = *(_QWORD *)(*((_QWORD *)&v286 + 1) + 64);
          if (v289 == v290)
            v290 = *(_QWORD *)(*((_QWORD *)&v286 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v286 + 1) + 72);
          if (v285 < v290)
            v290 = v285;
          if (v289 <= v284)
            v289 = v284;
          if (v289 == v290)
            v289 = v290 + *(_QWORD *)(*((_QWORD *)&v286 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v286 + 1) + 72);
          *(_QWORD *)(*((_QWORD *)&v286 + 1) + 56) = v290;
          *(_QWORD *)(*((_QWORD *)&v286 + 1) + 64) = v289;
        }
      }
    }
  }
  v291 = *(uint64_t **)&v386->_anon_e88[152];
  if (v291)
    md::MeshSetStorage::prepareStorage(v291, a3);
  v293 = v386->_venueWallVerticalStrokeMeshInfo._value.type;
  v292 = *(unsigned __int16 **)v386->_anon_e88;
  if (*(unsigned __int16 **)&v293 != v292)
  {
    v4.n128_u64[1] = 0;
    do
    {
      if (!**(_WORD **)&v293 || !*(_DWORD *)(*(_QWORD *)&v293 + 4))
        goto LABEL_432;
      v294 = *(_QWORD *)&v386->_anon_e88[144];
      if (*(_BYTE *)(v294 + 40)
        && (v295 = *(_QWORD **)&v386->_anon_e88[160]) != 0
        && *v295 == v294
        && (v296 = v295[1] * (unsigned __int16)**(_WORD **)&v293,
            v297 = v295[8],
            v298 = v295[4],
            v297 + v296 <= (unint64_t)(v295[5] - v298)))
      {
        *(_QWORD *)&v408 = v298 + v297;
        *((_QWORD *)&v408 + 1) = v298 + v297 + v296;
        v295[8] = v297 + v296;
        v347 = *(_QWORD *)(v294 + 48);
        v405 = "Venue Wall Vertical Stroke Vertex Data";
        v348 = v295[14];
        if (!v348)
          goto LABEL_575;
        (*(void (**)(__int128 *__return_ptr, uint64_t, const char **, uint64_t, __int128 *))(*(_QWORD *)v348 + 48))(&v407, v348, &v405, v347, &v408);
        v294 = *(_QWORD *)&v386->_anon_e88[144];
      }
      else
      {
        v407 = 0uLL;
      }
      md::MeshSetStorage::buildSubIndexData(&v405, v294, *(_QWORD **)&v386->_anon_e88[160], (uint64_t)"Venue Wall Vertical Stroke Index Data", *(unsigned int *)(*(_QWORD *)&v293 + 4));
      v401 = v407;
      v299 = (std::__shared_weak_count *)*((_QWORD *)&v407 + 1);
      if (*((_QWORD *)&v407 + 1))
      {
        v300 = (unint64_t *)(*((_QWORD *)&v407 + 1) + 8);
        do
          v301 = __ldxr(v300);
        while (__stxr(v301 + 1, v300));
      }
      v302 = (char *)operator new(0xA8uLL);
      *((_QWORD *)v302 + 1) = 0;
      *((_QWORD *)v302 + 2) = 0;
      *(_QWORD *)v302 = &off_1E42DEFF0;
      v303 = v405;
      v304 = v406;
      if (v406)
      {
        v305 = (unint64_t *)&v406->__shared_owners_;
        do
          v306 = __ldxr(v305);
        while (__stxr(v306 + 1, v305));
      }
      if ((v307 & 1) == 0
      {
        if ((v349 & 1) == 0
        {
          ggl::MeshTyped<ggl::Venue3DStroke::VerticalDefaultVbo>::attributesReflection(void)::r = (uint64_t)&ggl::Venue3DStroke::verticalDefaultVboReflection;
        }
        ggl::MeshTyped<ggl::Venue3DStroke::VerticalDefaultVbo>::typedReflection(void)::r = (uint64_t)&ggl::MeshTyped<ggl::Venue3DStroke::VerticalDefaultVbo>::attributesReflection(void)::r;
        unk_1ECE43BA8 = 1;
      }
      *((_QWORD *)v302 + 11) = 0;
      *((_QWORD *)v302 + 7) = 0;
      *((_QWORD *)v302 + 8) = 0;
      *((_DWORD *)v302 + 18) = 0;
      *((_QWORD *)v302 + 3) = &off_1E42BBC08;
      *((_QWORD *)v302 + 4) = "Venue Wall Vertical Stroke Mesh";
      *((_QWORD *)v302 + 5) = &unk_1E42BBC28;
      *((_QWORD *)v302 + 6) = 0;
      *((_QWORD *)v302 + 10) = &ggl::MeshTyped<ggl::Venue3DStroke::VerticalDefaultVbo>::typedReflection(void)::r;
      *((_QWORD *)v302 + 12) = 0;
      *((_QWORD *)v302 + 13) = 0;
      v309 = &unk_1ECE44000;
      if ((v308 & 1) == 0)
      {
        v309 = (_QWORD *)&unk_1ECE44000;
        if (v350)
        {
          v351 = operator new();
          *(_QWORD *)(v351 + 16) = 0xA3D02C1100000005;
          *(_QWORD *)(v351 + 24) = "GeoGL";
          *(_OWORD *)(v351 + 32) = xmmword_19FFB2DE0;
          *(_QWORD *)v351 = &off_1E42B5668;
          *(_QWORD *)(v351 + 8) = "GeoGL";
          *(_OWORD *)(v351 + 72) = 0u;
          *(_OWORD *)(v351 + 88) = 0u;
          *(_OWORD *)(v351 + 104) = 0u;
          *(_OWORD *)(v351 + 120) = 0u;
          *(_OWORD *)(v351 + 136) = 0u;
          *(_OWORD *)(v351 + 152) = 0u;
          *(_OWORD *)(v351 + 168) = 0u;
          *(_OWORD *)(v351 + 184) = 0u;
          *(_OWORD *)(v351 + 200) = 0u;
          *(_OWORD *)(v351 + 216) = 0u;
          *(_OWORD *)(v351 + 232) = 0u;
          *(_QWORD *)(v351 + 248) = 0;
          *(_OWORD *)(v351 + 56) = 0u;
          v352 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v351 + 56), 0);
          if ((_DWORD)v352)
            geo::read_write_lock::logFailure(v352, (uint64_t)"initialization", v353);
          v354 = malloc_create_zone(0, 0);
          *(_QWORD *)(v351 + 48) = v354;
          malloc_set_zone_name(v354, "GeoGL");
          *(_QWORD *)(v351 + 256) = os_log_create("com.apple.VectorKit", "Memory");
          ggl::Allocator::instance(void)::alloc = v351;
          v309 = &unk_1ECE44000;
        }
      }
      v310 = v309[495];
      *((_QWORD *)v302 + 18) = 0;
      *((_QWORD *)v302 + 15) = 0;
      *((_QWORD *)v302 + 16) = 0;
      *((_QWORD *)v302 + 14) = v310;
      if ((v310 & 1) == 0)
      {
        v309 = (_QWORD *)&unk_1ECE44000;
        if (v355)
        {
          v356 = operator new();
          *(_QWORD *)(v356 + 16) = 0xA3D02C1100000005;
          *(_QWORD *)(v356 + 24) = "GeoGL";
          *(_OWORD *)(v356 + 32) = xmmword_19FFB2DE0;
          *(_QWORD *)v356 = &off_1E42B5668;
          *(_QWORD *)(v356 + 8) = "GeoGL";
          *(_OWORD *)(v356 + 72) = 0u;
          *(_OWORD *)(v356 + 88) = 0u;
          *(_OWORD *)(v356 + 104) = 0u;
          *(_OWORD *)(v356 + 120) = 0u;
          *(_OWORD *)(v356 + 136) = 0u;
          *(_OWORD *)(v356 + 152) = 0u;
          *(_OWORD *)(v356 + 168) = 0u;
          *(_OWORD *)(v356 + 184) = 0u;
          *(_OWORD *)(v356 + 200) = 0u;
          *(_OWORD *)(v356 + 216) = 0u;
          *(_OWORD *)(v356 + 232) = 0u;
          *(_QWORD *)(v356 + 248) = 0;
          v357 = v356;
          *(_OWORD *)(v356 + 56) = 0u;
          v358 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v356 + 56), 0);
          if ((_DWORD)v358)
            geo::read_write_lock::logFailure(v358, (uint64_t)"initialization", v359);
          v360 = malloc_create_zone(0, 0);
          *(_QWORD *)(v357 + 48) = v360;
          malloc_set_zone_name(v360, "GeoGL");
          *(_QWORD *)(v357 + 256) = os_log_create("com.apple.VectorKit", "Memory");
          ggl::Allocator::instance(void)::alloc = v357;
          v309 = &unk_1ECE44000;
        }
      }
      *((_QWORD *)v302 + 19) = v309[495];
      *((_QWORD *)v302 + 20) = 0;
      *((_QWORD *)v302 + 17) = v302 + 144;
      *((_QWORD *)v302 + 3) = &off_1E42BD5B8;
      *((_QWORD *)v302 + 5) = &unk_1E42BD5D8;
      v408 = v401;
      if (v299)
      {
        v311 = (unint64_t *)&v299->__shared_owners_;
        do
          v312 = __ldxr(v311);
        while (__stxr(v312 + 1, v311));
      }
      std::vector<std::shared_ptr<ggl::VertexData>,geo::StdAllocator<std::shared_ptr<ggl::VertexData>,ggl::Allocator>>::__assign_with_size[abi:nn180100]<std::shared_ptr<ggl::VertexData> const*,std::shared_ptr<ggl::VertexData> const*>((uint64_t)(v302 + 88), (uint64_t *)&v408, (uint64_t *)&v409, 1uLL);
      v313 = (std::__shared_weak_count *)*((_QWORD *)&v408 + 1);
      if (!*((_QWORD *)&v408 + 1))
        goto LABEL_456;
      v314 = (unint64_t *)(*((_QWORD *)&v408 + 1) + 8);
      do
        v315 = __ldaxr(v314);
      while (__stlxr(v315 - 1, v314));
      if (!v315)
      {
        ((void (*)(std::__shared_weak_count *))v313->__on_zero_shared)(v313);
        std::__shared_weak_count::__release_weak(v313);
        if (!v304)
          goto LABEL_459;
      }
      else
      {
LABEL_456:
        if (!v304)
          goto LABEL_459;
      }
      v316 = (unint64_t *)&v304->__shared_owners_;
      do
        v317 = __ldxr(v316);
      while (__stxr(v317 + 1, v316));
LABEL_459:
      v318 = (std::__shared_weak_count *)*((_QWORD *)v302 + 16);
      *((_QWORD *)v302 + 15) = v303;
      *((_QWORD *)v302 + 16) = v304;
      if (v318)
      {
        v319 = (unint64_t *)&v318->__shared_owners_;
        do
          v320 = __ldaxr(v319);
        while (__stlxr(v320 - 1, v319));
        if (!v320)
        {
          ((void (*)(std::__shared_weak_count *))v318->__on_zero_shared)(v318);
          std::__shared_weak_count::__release_weak(v318);
        }
      }
      *((_QWORD *)v302 + 3) = &off_1E42B6818;
      *((_QWORD *)v302 + 5) = &unk_1E42B6838;
      if (!v304)
        goto LABEL_468;
      v321 = (unint64_t *)&v304->__shared_owners_;
      do
        v322 = __ldaxr(v321);
      while (__stlxr(v322 - 1, v321));
      if (!v322)
      {
        ((void (*)(std::__shared_weak_count *))v304->__on_zero_shared)(v304);
        std::__shared_weak_count::__release_weak(v304);
        if (!v299)
          goto LABEL_476;
      }
      else
      {
LABEL_468:
        if (!v299)
          goto LABEL_476;
      }
      v323 = (unint64_t *)&v299->__shared_owners_;
      do
        v324 = __ldaxr(v323);
      while (__stlxr(v324 - 1, v323));
      if (!v324)
      {
        ((void (*)(std::__shared_weak_count *))v299->__on_zero_shared)(v299);
        std::__shared_weak_count::__release_weak(v299);
      }
LABEL_476:
      v326 = *(char **)&v386->_anon_e88[24];
      v325 = *(_QWORD *)&v386->_anon_e88[32];
      if ((unint64_t)v326 >= v325)
      {
        v328 = *(char **)&v386->_anon_e88[16];
        v329 = (v326 - v328) >> 4;
        v330 = v329 + 1;
        if ((unint64_t)(v329 + 1) >> 60)
          abort();
        v331 = v325 - (_QWORD)v328;
        if (v331 >> 3 > v330)
          v330 = v331 >> 3;
        if ((unint64_t)v331 >= 0x7FFFFFFFFFFFFFF0)
          v332 = 0xFFFFFFFFFFFFFFFLL;
        else
          v332 = v330;
        if (v332 >> 60)
          goto LABEL_570;
        v333 = (char *)operator new(16 * v332);
        v4.n128_u64[0] = (unint64_t)(v302 + 24);
        v4.n128_u64[1] = (unint64_t)v302;
        v334 = (__n128 *)&v333[16 * v329];
        v335 = &v333[16 * v332];
        *v334 = v4;
        v327 = v334 + 1;
        if (v326 == v328)
        {
          *(_QWORD *)&v386->_anon_e88[16] = v334;
          *(_QWORD *)&v386->_anon_e88[24] = v327;
          *(_QWORD *)&v386->_anon_e88[32] = v335;
        }
        else
        {
          do
          {
            v336 = *((__n128 *)v326 - 1);
            v326 -= 16;
            v4.n128_u64[1] = v336.n128_u64[1];
            v334[-1] = v336;
            --v334;
            *(_QWORD *)v326 = 0;
            *((_QWORD *)v326 + 1) = 0;
          }
          while (v326 != v328);
          v326 = *(char **)&v386->_anon_e88[16];
          v337 = *(char **)&v386->_anon_e88[24];
          *(_QWORD *)&v386->_anon_e88[16] = v334;
          *(_QWORD *)&v386->_anon_e88[24] = v327;
          *(_QWORD *)&v386->_anon_e88[32] = v335;
          while (v337 != v326)
          {
            v338 = (std::__shared_weak_count *)*((_QWORD *)v337 - 1);
            if (v338)
            {
              v339 = (unint64_t *)&v338->__shared_owners_;
              do
                v340 = __ldaxr(v339);
              while (__stlxr(v340 - 1, v339));
              if (!v340)
              {
                ((void (*)(std::__shared_weak_count *))v338->__on_zero_shared)(v338);
                std::__shared_weak_count::__release_weak(v338);
              }
            }
            v337 -= 16;
          }
        }
        if (v326)
          operator delete(v326);
      }
      else
      {
        *(_QWORD *)v326 = v302 + 24;
        *((_QWORD *)v326 + 1) = v302;
        v327 = (__n128 *)(v326 + 16);
      }
      *(_QWORD *)&v386->_anon_e88[24] = v327;
      v341 = v406;
      if (!v406)
        goto LABEL_502;
      v342 = (unint64_t *)&v406->__shared_owners_;
      do
        v343 = __ldaxr(v342);
      while (__stlxr(v343 - 1, v342));
      if (!v343)
      {
        ((void (*)(std::__shared_weak_count *))v341->__on_zero_shared)(v341);
        std::__shared_weak_count::__release_weak(v341);
        v344 = (std::__shared_weak_count *)*((_QWORD *)&v407 + 1);
        if (*((_QWORD *)&v407 + 1))
        {
LABEL_503:
          v345 = (unint64_t *)&v344->__shared_owners_;
          do
            v346 = __ldaxr(v345);
          while (__stlxr(v346 - 1, v345));
          if (!v346)
          {
            ((void (*)(std::__shared_weak_count *))v344->__on_zero_shared)(v344);
            std::__shared_weak_count::__release_weak(v344);
          }
        }
      }
      else
      {
LABEL_502:
        v344 = (std::__shared_weak_count *)*((_QWORD *)&v407 + 1);
        if (*((_QWORD *)&v407 + 1))
          goto LABEL_503;
      }
      v292 = *(unsigned __int16 **)v386->_anon_e88;
LABEL_432:
      *(_QWORD *)&v293 += 8;
    }
    while (*(unsigned __int16 **)&v293 != v292);
  }
  v361 = *(_QWORD *)&v386->_anon_e88[16];
  if (v361 != *(_QWORD *)&v386->_anon_e88[24])
  {
    v362 = **(_QWORD **)(*(_QWORD *)v361 + 64);
    v363 = **(unsigned __int16 **)&v386->_venueWallVerticalStrokeMeshInfo._value.type;
    v408 = 0uLL;
    v364 = *(_QWORD *)(v362 + 8) * v363;
    v4.n128_u64[0] = (unint64_t)a3;
    *(_QWORD *)&v365 = a3;
    *((_QWORD *)&v365 + 1) = v362;
    v402 = v4;
    if (v364)
    {
      if (a3 && *(_BYTE *)(v362 + 17) != 2)
      {
        v391 = v365;
        v366 = (*((uint64_t (**)(void))a3->var0 + 7))();
        v365 = v391;
      }
      else
      {
        v366 = *(_QWORD *)(v362 + 72);
      }
    }
    else
    {
      v366 = 0;
    }
    v408 = v365;
    v409 = 0;
    v410 = v364;
    v412 = v366;
    v411 = 257;
    ggl::BufferMemory::operator=((uint64_t *)&v386->_anon_e88[40], (uint64_t)&v408);
    *(_QWORD *)&v367 = v402.n128_u64[0];
    if (v412)
    {
      v369 = v409;
      v368 = v410;
      if (v410 != v409)
      {
        v370 = v408;
        v371 = v411;
        v372 = HIBYTE(v411);
        if ((_QWORD)v408 && *(_BYTE *)(*((_QWORD *)&v408 + 1) + 17) != 2)
        {
          (*(void (**)(__n128))(*(_QWORD *)v408 + 64))(v402);
          *(_QWORD *)&v367 = v402.n128_u64[0];
        }
        if (v371 && !v372)
        {
          v374 = *(_QWORD *)(*((_QWORD *)&v370 + 1) + 56);
          v373 = *(_QWORD *)(*((_QWORD *)&v370 + 1) + 64);
          if (v373 == v374)
            v374 = *(_QWORD *)(*((_QWORD *)&v370 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v370 + 1) + 72);
          if (v369 < v374)
            v374 = v369;
          if (v373 <= v368)
            v373 = v368;
          if (v373 == v374)
            v373 = v374 + *(_QWORD *)(*((_QWORD *)&v370 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v370 + 1) + 72);
          *(_QWORD *)(*((_QWORD *)&v370 + 1) + 56) = v374;
          *(_QWORD *)(*((_QWORD *)&v370 + 1) + 64) = v373;
        }
      }
    }
    v375 = *(_QWORD *)(**(_QWORD **)&v386->_anon_e88[16] + 96);
    v376 = *(unsigned int *)(*(_QWORD *)&v386->_venueWallVerticalStrokeMeshInfo._value.type + 4);
    v408 = 0uLL;
    v377 = *(_QWORD *)(v375 + 8) * v376;
    *((_QWORD *)&v367 + 1) = v375;
    if (v377)
    {
      if (a3 && *(_BYTE *)(v375 + 17) != 2)
      {
        v403 = v367;
        v378 = (*((uint64_t (**)(void))a3->var0 + 7))();
        v367 = v403;
      }
      else
      {
        v378 = *(_QWORD *)(v375 + 72);
      }
    }
    else
    {
      v378 = 0;
    }
    v408 = v367;
    v409 = 0;
    v410 = v377;
    v412 = v378;
    v411 = 257;
    ggl::BufferMemory::operator=((uint64_t *)&v386->_anon_e88[88], (uint64_t)&v408);
    if (v412)
    {
      v380 = v409;
      v379 = v410;
      if (v410 != v409)
      {
        v381 = v408;
        v382 = v411;
        v383 = HIBYTE(v411);
        if ((_QWORD)v408 && *(_BYTE *)(*((_QWORD *)&v408 + 1) + 17) != 2)
          (*(void (**)(void))(*(_QWORD *)v408 + 64))();
        if (v382 && !v383)
        {
          v385 = *(_QWORD *)(*((_QWORD *)&v381 + 1) + 56);
          v384 = *(_QWORD *)(*((_QWORD *)&v381 + 1) + 64);
          if (v384 == v385)
            v385 = *(_QWORD *)(*((_QWORD *)&v381 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v381 + 1) + 72);
          if (v380 < v385)
            v385 = v380;
          if (v384 <= v379)
            v384 = v379;
          if (v384 == v385)
            v384 = v385 + *(_QWORD *)(*((_QWORD *)&v381 + 1) + 80) - *(_QWORD *)(*((_QWORD *)&v381 + 1) + 72);
          *(_QWORD *)(*((_QWORD *)&v381 + 1) + 56) = v385;
          *(_QWORD *)(*((_QWORD *)&v381 + 1) + 64) = v384;
        }
      }
    }
  }
}

- (void)didFinishAddingData
{
  optional<md::MeshSet<ggl::VenueWall::MeshMesh, ggl::VenueWall::DefaultVbo>> *p_venueWallMeshInfo;
  uint64_t v4;
  md::MeshSetStorage *v5;
  char *v6;
  char *v7;
  _QWORD *v8;
  int v9;
  int v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  _QWORD *v15;
  int v16;
  int v17;
  char *v18;
  char *v19;
  vector<std::shared_ptr<ggl::VenueWall::MeshMesh>, std::allocator<std::shared_ptr<ggl::VenueWall::MeshMesh>>> *p_venueWallMeshes;
  char *begin;
  char *end;
  void *v23;
  std::__shared_weak_count *v24;
  unint64_t *p_shared_owners;
  unint64_t v26;
  optional<md::MeshSet<ggl::VenueWall::EndCapMesh, ggl::VenueWall::EndCapVbo>> *p_venueWallEndCapMeshInfo;
  uint64_t v28;
  md::MeshSetStorage *v29;
  char *v30;
  char *v31;
  _QWORD *v32;
  int v33;
  int v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  _QWORD *v39;
  int v40;
  int v41;
  char *v42;
  char *v43;
  vector<std::shared_ptr<ggl::VenueWall::EndCapMesh>, std::allocator<std::shared_ptr<ggl::VenueWall::EndCapMesh>>> *p_venueWallEndMeshes;
  char *v45;
  char *v46;
  void *v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  optional<md::MeshSet<ggl::Venue3DStroke::HorizontalVenue3DStrokeMesh, ggl::Venue3DStroke::HorizontalDefaultVbo>> *p_venueWallHorizontalStrokeMeshInfo;
  uint64_t v52;
  md::MeshSetStorage *v53;
  char *v54;
  char *v55;
  _QWORD *v56;
  int v57;
  int v58;
  char *v59;
  char *v60;
  char *v61;
  char *v62;
  _QWORD *v63;
  int v64;
  int v65;
  char *v66;
  char *v67;
  vector<std::shared_ptr<ggl::Venue3DStroke::HorizontalVenue3DStrokeMesh>, std::allocator<std::shared_ptr<ggl::Venue3DStroke::HorizontalVenue3DStrokeMesh>>> *p_venueWallHorizontalStrokeMeshes;
  char *v69;
  char *v70;
  void *v71;
  std::__shared_weak_count *v72;
  unint64_t *v73;
  unint64_t v74;
  optional<md::MeshSet<ggl::Venue3DStroke::VerticalVenue3DStrokeMesh, ggl::Venue3DStroke::VerticalDefaultVbo>> *p_venueWallVerticalStrokeMeshInfo;
  uint64_t v76;
  md::MeshSetStorage *v77;
  char *v78;
  char *v79;
  _QWORD *v80;
  int v81;
  int v82;
  char *v83;
  char *v84;
  char *v85;
  char *v86;
  _QWORD *v87;
  int v88;
  int v89;
  char *v90;
  char *v91;
  vector<std::shared_ptr<ggl::Venue3DStroke::VerticalVenue3DStrokeMesh>, std::allocator<std::shared_ptr<ggl::Venue3DStroke::VerticalVenue3DStrokeMesh>>> *p_venueWallVerticalStrokeMeshes;
  char *v93;
  char *v94;
  void *v95;
  std::__shared_weak_count *v96;
  unint64_t *v97;
  unint64_t v98;
  _QWORD *v99;
  _QWORD *v100;
  void *v101;
  objc_super v102;
  void *__p[2];
  void *v104[2];
  int v105;
  uint64_t v106;

  v102.receiver = self;
  v102.super_class = (Class)VKVenueGroup;
  -[VKPolygonGroup didFinishAddingData](&v102, sel_didFinishAddingData);
  p_venueWallMeshInfo = &self->_venueWallMeshInfo;
  v4 = *(_QWORD *)&self->_anon_c48[160];
  if (v4 && *(_QWORD *)v4 == *(_QWORD *)&self->_anon_c48[144])
    *(_BYTE *)(v4 + 80) = 1;
  v5 = *(md::MeshSetStorage **)&self->_anon_c48[152];
  if (v5)
    md::MeshSetStorage::finalize(v5);
  v106 = 0;
  __p[0] = 0;
  __p[1] = 0;
  ggl::BufferMemory::operator=((uint64_t *)&self->_anon_c48[40], (uint64_t)__p);
  if (v106)
  {
    v7 = (char *)v104[0];
    v6 = (char *)v104[1];
    if (v104[1] != v104[0])
    {
      v8 = __p[1];
      v9 = v105;
      v10 = BYTE1(v105);
      if (__p[0] && *((_BYTE *)__p[1] + 17) != 2)
        (*(void (**)(void))(*(_QWORD *)__p[0] + 64))();
      if (v9 && !v10)
      {
        v12 = (char *)v8[7];
        v11 = (char *)v8[8];
        if (v11 == v12)
          v12 = (char *)(v8[10] - v8[9]);
        if (v7 < v12)
          v12 = v7;
        if (v11 <= v6)
          v11 = v6;
        if (v11 == v12)
          v11 = &v12[v8[10] - v8[9]];
        v8[7] = v12;
        v8[8] = v11;
      }
    }
  }
  v106 = 0;
  __p[0] = 0;
  __p[1] = 0;
  ggl::BufferMemory::operator=((uint64_t *)&self->_anon_c48[88], (uint64_t)__p);
  if (v106)
  {
    v14 = (char *)v104[0];
    v13 = (char *)v104[1];
    if (v104[1] != v104[0])
    {
      v15 = __p[1];
      v16 = v105;
      v17 = BYTE1(v105);
      if (__p[0] && *((_BYTE *)__p[1] + 17) != 2)
        (*(void (**)(void))(*(_QWORD *)__p[0] + 64))();
      if (v16 && !v17)
      {
        v19 = (char *)v15[7];
        v18 = (char *)v15[8];
        if (v18 == v19)
          v19 = (char *)(v15[10] - v15[9]);
        if (v14 < v19)
          v19 = v14;
        if (v18 <= v13)
          v18 = v13;
        if (v18 == v19)
          v18 = &v19[v15[10] - v15[9]];
        v15[7] = v19;
        v15[8] = v18;
      }
    }
  }
  p_venueWallMeshes = &self->_venueWallMeshes;
  begin = (char *)self->_venueWallMeshes.__begin_;
  if (begin)
  {
    end = (char *)self->_venueWallMeshes.__end_;
    v23 = self->_venueWallMeshes.__begin_;
    if (end != begin)
    {
      do
      {
        v24 = (std::__shared_weak_count *)*((_QWORD *)end - 1);
        if (v24)
        {
          p_shared_owners = (unint64_t *)&v24->__shared_owners_;
          do
            v26 = __ldaxr(p_shared_owners);
          while (__stlxr(v26 - 1, p_shared_owners));
          if (!v26)
          {
            ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
            std::__shared_weak_count::__release_weak(v24);
          }
        }
        end -= 16;
      }
      while (end != begin);
      v23 = p_venueWallMeshes->__begin_;
    }
    self->_venueWallMeshes.__end_ = begin;
    operator delete(v23);
    p_venueWallMeshes->__begin_ = 0;
    self->_venueWallMeshes.__end_ = 0;
    self->_venueWallMeshes.__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&p_venueWallMeshes->__begin_ = *(_OWORD *)&self->_anon_c48[16];
  self->_venueWallMeshes.__end_cap_.__value_ = *(void **)&self->_anon_c48[32];
  *(_QWORD *)&self->_anon_c48[16] = 0;
  *(_QWORD *)&self->_anon_c48[24] = 0;
  *(_QWORD *)&self->_anon_c48[32] = 0;
  p_venueWallEndCapMeshInfo = &self->_venueWallEndCapMeshInfo;
  v28 = *(_QWORD *)&self->_anon_d08[160];
  if (v28 && *(_QWORD *)v28 == *(_QWORD *)&self->_anon_d08[144])
    *(_BYTE *)(v28 + 80) = 1;
  v29 = *(md::MeshSetStorage **)&self->_anon_d08[152];
  if (v29)
    md::MeshSetStorage::finalize(v29);
  v106 = 0;
  __p[0] = 0;
  __p[1] = 0;
  ggl::BufferMemory::operator=((uint64_t *)&self->_anon_d08[40], (uint64_t)__p);
  if (v106)
  {
    v31 = (char *)v104[0];
    v30 = (char *)v104[1];
    if (v104[1] != v104[0])
    {
      v32 = __p[1];
      v33 = v105;
      v34 = BYTE1(v105);
      if (__p[0] && *((_BYTE *)__p[1] + 17) != 2)
        (*(void (**)(void))(*(_QWORD *)__p[0] + 64))();
      if (v33 && !v34)
      {
        v36 = (char *)v32[7];
        v35 = (char *)v32[8];
        if (v35 == v36)
          v36 = (char *)(v32[10] - v32[9]);
        if (v31 < v36)
          v36 = v31;
        if (v35 <= v30)
          v35 = v30;
        if (v35 == v36)
          v35 = &v36[v32[10] - v32[9]];
        v32[7] = v36;
        v32[8] = v35;
      }
    }
  }
  v106 = 0;
  __p[0] = 0;
  __p[1] = 0;
  ggl::BufferMemory::operator=((uint64_t *)&self->_anon_d08[88], (uint64_t)__p);
  if (v106)
  {
    v38 = (char *)v104[0];
    v37 = (char *)v104[1];
    if (v104[1] != v104[0])
    {
      v39 = __p[1];
      v40 = v105;
      v41 = BYTE1(v105);
      if (__p[0] && *((_BYTE *)__p[1] + 17) != 2)
        (*(void (**)(void))(*(_QWORD *)__p[0] + 64))();
      if (v40 && !v41)
      {
        v43 = (char *)v39[7];
        v42 = (char *)v39[8];
        if (v42 == v43)
          v43 = (char *)(v39[10] - v39[9]);
        if (v38 < v43)
          v43 = v38;
        if (v42 <= v37)
          v42 = v37;
        if (v42 == v43)
          v42 = &v43[v39[10] - v39[9]];
        v39[7] = v43;
        v39[8] = v42;
      }
    }
  }
  p_venueWallEndMeshes = &self->_venueWallEndMeshes;
  v45 = (char *)self->_venueWallEndMeshes.__begin_;
  if (v45)
  {
    v46 = (char *)self->_venueWallEndMeshes.__end_;
    v47 = self->_venueWallEndMeshes.__begin_;
    if (v46 != v45)
    {
      do
      {
        v48 = (std::__shared_weak_count *)*((_QWORD *)v46 - 1);
        if (v48)
        {
          v49 = (unint64_t *)&v48->__shared_owners_;
          do
            v50 = __ldaxr(v49);
          while (__stlxr(v50 - 1, v49));
          if (!v50)
          {
            ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
            std::__shared_weak_count::__release_weak(v48);
          }
        }
        v46 -= 16;
      }
      while (v46 != v45);
      v47 = p_venueWallEndMeshes->__begin_;
    }
    self->_venueWallEndMeshes.__end_ = v45;
    operator delete(v47);
    p_venueWallEndMeshes->__begin_ = 0;
    self->_venueWallEndMeshes.__end_ = 0;
    self->_venueWallEndMeshes.__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&p_venueWallEndMeshes->__begin_ = *(_OWORD *)&self->_anon_d08[16];
  self->_venueWallEndMeshes.__end_cap_.__value_ = *(void **)&self->_anon_d08[32];
  *(_QWORD *)&self->_anon_d08[16] = 0;
  *(_QWORD *)&self->_anon_d08[24] = 0;
  *(_QWORD *)&self->_anon_d08[32] = 0;
  p_venueWallHorizontalStrokeMeshInfo = &self->_venueWallHorizontalStrokeMeshInfo;
  v52 = *(_QWORD *)&self->_anon_dc8[160];
  if (v52 && *(_QWORD *)v52 == *(_QWORD *)&self->_anon_dc8[144])
    *(_BYTE *)(v52 + 80) = 1;
  v53 = *(md::MeshSetStorage **)&self->_anon_dc8[152];
  if (v53)
    md::MeshSetStorage::finalize(v53);
  v106 = 0;
  __p[0] = 0;
  __p[1] = 0;
  ggl::BufferMemory::operator=((uint64_t *)&self->_anon_dc8[40], (uint64_t)__p);
  if (v106)
  {
    v55 = (char *)v104[0];
    v54 = (char *)v104[1];
    if (v104[1] != v104[0])
    {
      v56 = __p[1];
      v57 = v105;
      v58 = BYTE1(v105);
      if (__p[0] && *((_BYTE *)__p[1] + 17) != 2)
        (*(void (**)(void))(*(_QWORD *)__p[0] + 64))();
      if (v57 && !v58)
      {
        v60 = (char *)v56[7];
        v59 = (char *)v56[8];
        if (v59 == v60)
          v60 = (char *)(v56[10] - v56[9]);
        if (v55 < v60)
          v60 = v55;
        if (v59 <= v54)
          v59 = v54;
        if (v59 == v60)
          v59 = &v60[v56[10] - v56[9]];
        v56[7] = v60;
        v56[8] = v59;
      }
    }
  }
  v106 = 0;
  __p[0] = 0;
  __p[1] = 0;
  ggl::BufferMemory::operator=((uint64_t *)&self->_anon_dc8[88], (uint64_t)__p);
  if (v106)
  {
    v62 = (char *)v104[0];
    v61 = (char *)v104[1];
    if (v104[1] != v104[0])
    {
      v63 = __p[1];
      v64 = v105;
      v65 = BYTE1(v105);
      if (__p[0] && *((_BYTE *)__p[1] + 17) != 2)
        (*(void (**)(void))(*(_QWORD *)__p[0] + 64))();
      if (v64 && !v65)
      {
        v67 = (char *)v63[7];
        v66 = (char *)v63[8];
        if (v66 == v67)
          v67 = (char *)(v63[10] - v63[9]);
        if (v62 < v67)
          v67 = v62;
        if (v66 <= v61)
          v66 = v61;
        if (v66 == v67)
          v66 = &v67[v63[10] - v63[9]];
        v63[7] = v67;
        v63[8] = v66;
      }
    }
  }
  p_venueWallHorizontalStrokeMeshes = &self->_venueWallHorizontalStrokeMeshes;
  v69 = (char *)self->_venueWallHorizontalStrokeMeshes.__begin_;
  if (v69)
  {
    v70 = (char *)self->_venueWallHorizontalStrokeMeshes.__end_;
    v71 = self->_venueWallHorizontalStrokeMeshes.__begin_;
    if (v70 != v69)
    {
      do
      {
        v72 = (std::__shared_weak_count *)*((_QWORD *)v70 - 1);
        if (v72)
        {
          v73 = (unint64_t *)&v72->__shared_owners_;
          do
            v74 = __ldaxr(v73);
          while (__stlxr(v74 - 1, v73));
          if (!v74)
          {
            ((void (*)(std::__shared_weak_count *))v72->__on_zero_shared)(v72);
            std::__shared_weak_count::__release_weak(v72);
          }
        }
        v70 -= 16;
      }
      while (v70 != v69);
      v71 = p_venueWallHorizontalStrokeMeshes->__begin_;
    }
    self->_venueWallHorizontalStrokeMeshes.__end_ = v69;
    operator delete(v71);
    p_venueWallHorizontalStrokeMeshes->__begin_ = 0;
    self->_venueWallHorizontalStrokeMeshes.__end_ = 0;
    self->_venueWallHorizontalStrokeMeshes.__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&p_venueWallHorizontalStrokeMeshes->__begin_ = *(_OWORD *)&self->_anon_dc8[16];
  self->_venueWallHorizontalStrokeMeshes.__end_cap_.__value_ = *(void **)&self->_anon_dc8[32];
  *(_QWORD *)&self->_anon_dc8[16] = 0;
  *(_QWORD *)&self->_anon_dc8[24] = 0;
  *(_QWORD *)&self->_anon_dc8[32] = 0;
  p_venueWallVerticalStrokeMeshInfo = &self->_venueWallVerticalStrokeMeshInfo;
  v76 = *(_QWORD *)&self->_anon_e88[160];
  if (v76 && *(_QWORD *)v76 == *(_QWORD *)&self->_anon_e88[144])
    *(_BYTE *)(v76 + 80) = 1;
  v77 = *(md::MeshSetStorage **)&self->_anon_e88[152];
  if (v77)
    md::MeshSetStorage::finalize(v77);
  v106 = 0;
  __p[0] = 0;
  __p[1] = 0;
  ggl::BufferMemory::operator=((uint64_t *)&self->_anon_e88[40], (uint64_t)__p);
  if (v106)
  {
    v79 = (char *)v104[0];
    v78 = (char *)v104[1];
    if (v104[1] != v104[0])
    {
      v80 = __p[1];
      v81 = v105;
      v82 = BYTE1(v105);
      if (__p[0] && *((_BYTE *)__p[1] + 17) != 2)
        (*(void (**)(void))(*(_QWORD *)__p[0] + 64))();
      if (v81 && !v82)
      {
        v84 = (char *)v80[7];
        v83 = (char *)v80[8];
        if (v83 == v84)
          v84 = (char *)(v80[10] - v80[9]);
        if (v79 < v84)
          v84 = v79;
        if (v83 <= v78)
          v83 = v78;
        if (v83 == v84)
          v83 = &v84[v80[10] - v80[9]];
        v80[7] = v84;
        v80[8] = v83;
      }
    }
  }
  v106 = 0;
  __p[0] = 0;
  __p[1] = 0;
  ggl::BufferMemory::operator=((uint64_t *)&self->_anon_e88[88], (uint64_t)__p);
  if (v106)
  {
    v86 = (char *)v104[0];
    v85 = (char *)v104[1];
    if (v104[1] != v104[0])
    {
      v87 = __p[1];
      v88 = v105;
      v89 = BYTE1(v105);
      if (__p[0] && *((_BYTE *)__p[1] + 17) != 2)
        (*(void (**)(void))(*(_QWORD *)__p[0] + 64))();
      if (v88 && !v89)
      {
        v91 = (char *)v87[7];
        v90 = (char *)v87[8];
        if (v90 == v91)
          v91 = (char *)(v87[10] - v87[9]);
        if (v86 < v91)
          v91 = v86;
        if (v90 <= v85)
          v90 = v85;
        if (v90 == v91)
          v90 = &v91[v87[10] - v87[9]];
        v87[7] = v91;
        v87[8] = v90;
      }
    }
  }
  p_venueWallVerticalStrokeMeshes = &self->_venueWallVerticalStrokeMeshes;
  v93 = (char *)self->_venueWallVerticalStrokeMeshes.__begin_;
  if (v93)
  {
    v94 = (char *)self->_venueWallVerticalStrokeMeshes.__end_;
    v95 = self->_venueWallVerticalStrokeMeshes.__begin_;
    if (v94 != v93)
    {
      do
      {
        v96 = (std::__shared_weak_count *)*((_QWORD *)v94 - 1);
        if (v96)
        {
          v97 = (unint64_t *)&v96->__shared_owners_;
          do
            v98 = __ldaxr(v97);
          while (__stlxr(v98 - 1, v97));
          if (!v98)
          {
            ((void (*)(std::__shared_weak_count *))v96->__on_zero_shared)(v96);
            std::__shared_weak_count::__release_weak(v96);
          }
        }
        v94 -= 16;
      }
      while (v94 != v93);
      v95 = p_venueWallVerticalStrokeMeshes->__begin_;
    }
    self->_venueWallVerticalStrokeMeshes.__end_ = v93;
    operator delete(v95);
    p_venueWallVerticalStrokeMeshes->__begin_ = 0;
    self->_venueWallVerticalStrokeMeshes.__end_ = 0;
    self->_venueWallVerticalStrokeMeshes.__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&p_venueWallVerticalStrokeMeshes->__begin_ = *(_OWORD *)&self->_anon_e88[16];
  self->_venueWallVerticalStrokeMeshes.__end_cap_.__value_ = *(void **)&self->_anon_e88[32];
  *(_QWORD *)&self->_anon_e88[16] = 0;
  *(_QWORD *)&self->_anon_e88[24] = 0;
  *(_QWORD *)&self->_anon_e88[32] = 0;
  if (p_venueWallMeshInfo->_hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&self->_venueWallMeshInfo._value);
    p_venueWallMeshInfo->_hasValue = 0;
  }
  if (p_venueWallEndCapMeshInfo->_hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&self->_venueWallEndCapMeshInfo._value);
    p_venueWallEndCapMeshInfo->_hasValue = 0;
  }
  if (p_venueWallHorizontalStrokeMeshInfo->_hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&self->_venueWallHorizontalStrokeMeshInfo._value);
    p_venueWallHorizontalStrokeMeshInfo->_hasValue = 0;
  }
  if (p_venueWallVerticalStrokeMeshInfo->_hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&self->_venueWallVerticalStrokeMeshInfo._value);
    p_venueWallVerticalStrokeMeshInfo->_hasValue = 0;
  }
  *(_OWORD *)__p = 0u;
  *(_OWORD *)v104 = 0u;
  v105 = 1065353216;
  std::__hash_table<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::__unordered_map_hasher<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::hash<std::pair<void const*,unsigned long>>,std::equal_to<std::pair<void const*,unsigned long>>,true>,std::__unordered_map_equal<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::equal_to<std::pair<void const*,unsigned long>>,std::hash<std::pair<void const*,unsigned long>>,true>,std::allocator<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>>>::__move_assign((uint64_t)&self->_venueWalls, (uint64_t *)__p);
  v99 = v104[0];
  if (v104[0])
  {
    do
    {
      v100 = (_QWORD *)*v99;
      v101 = (void *)v99[4];
      if (v101)
      {
        v99[5] = v101;
        operator delete(v101);
      }
      operator delete(v99);
      v99 = v100;
    }
    while (v100);
  }
  if (__p[0])
    operator delete(__p[0]);
}

- (void)addWallsForSection:(const void *)a3 edges:(const void *)a4 attributes:(const void *)a5 styles:(void *)a6 cullingMask:(unsigned int)a7 accessor:(ResourceAccessor *)a8
{
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unsigned __int8 *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  __n128 v24;
  NSObject *v25;
  unint64_t v26;
  optional<md::MeshSet<ggl::VenueWall::MeshMesh, ggl::VenueWall::DefaultVbo>> *p_venueWallMeshInfo;
  unsigned int v28;
  unsigned __int8 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  unint64_t v36;
  unint64_t v37;
  _QWORD *v38;
  int v39;
  int v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  _QWORD *v50;
  int v51;
  int v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  VKVenueGroup *v59;
  _QWORD *v60;
  __n128 v61;
  unint64_t v62;
  NSObject *v63;
  optional<md::MeshSet<ggl::VenueWall::EndCapMesh, ggl::VenueWall::EndCapVbo>> *p_venueWallEndCapMeshInfo;
  unsigned int v65;
  unsigned __int8 v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  uint64_t v71;
  __int128 v72;
  unint64_t v73;
  unint64_t v74;
  _QWORD *v75;
  int v76;
  int v77;
  unint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  _QWORD *v87;
  int v88;
  int v89;
  unint64_t v90;
  unint64_t v91;
  uint64_t v92;
  _QWORD *v93;
  uint64_t v94;
  int v95;
  __int128 v96;
  int v97;
  int v98;
  __int128 v99;
  __n128 v100;
  __int128 v101;
  int v102;
  __n128 v103;
  __int128 v104;
  unsigned int v106;
  VKVenueGroup *v107;
  uint64_t type_high;
  unint64_t v109;
  uint8_t buf[16];
  unint64_t v111;
  unint64_t v112;
  __int16 v113;
  uint64_t v114;
  _BYTE v115[24];
  _BYTE *v116;
  _BYTE v117[24];
  _BYTE *v118;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v107 = self;
  v106 = a7;
  v13 = *((_QWORD *)a3 + 11);
  if (v13)
  {
    v14 = 0;
    v15 = 0;
    v16 = *(unsigned __int8 **)a6;
    v17 = *((_QWORD *)a3 + 8);
    do
    {
      v18 = *v16;
      v16 += 12;
      if (v18 && ((*(_QWORD *)(v17 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
        v15 += (~*(_QWORD *)(v17 + ((((v13 + v14 - 1) % v13) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> ((v13 + v14 - 1) % v13)) & 1;
      ++v14;
    }
    while (v13 != v14);
  }
  else
  {
    v15 = 0;
  }
  v19 = *((_QWORD *)a4 + 1);
  v20 = 4 * v13;
  v21 = v19 - *(_QWORD *)a4;
  if (v19 == *(_QWORD *)a4)
    v22 = 0;
  else
    v22 = v20;
  v23 = operator new(0x38uLL);
  *v23 = &off_1E42C7F28;
  v23[1] = &v107;
  v23[2] = a5;
  v23[3] = a6;
  v23[4] = a3;
  v23[5] = a4;
  v23[6] = &v106;
  v118 = v23;
  if (v22 < 0x10000)
  {
    v26 = 0x924924924924924ALL * (v21 >> 3);
    p_venueWallMeshInfo = &self->_venueWallMeshInfo;
    v28 = *(unsigned __int16 *)&self->_anon_c48[138];
    if (v22 > (unsigned __int16)~(_WORD)v28)
    {
      v29 = self->_anon_c48[136] + 1;
      self->_anon_c48[136] = v29;
      *(_WORD *)&self->_anon_c48[138] = 0;
      *(_DWORD *)&self->_anon_c48[140] = 0;
      v30 = **(_QWORD **)(*(_QWORD *)(*(_QWORD *)&self->_anon_c48[16] + 16 * v29) + 64);
      v31 = *(unsigned __int16 *)(*(_QWORD *)&self->_venueWallMeshInfo._value.type + 8 * v29);
      memset(buf, 0, sizeof(buf));
      v32 = *(_QWORD *)(v30 + 8) * v31;
      v24.n128_u64[0] = (unint64_t)a8;
      *(_QWORD *)&v33 = a8;
      *((_QWORD *)&v33 + 1) = v30;
      v100 = v24;
      if (v32)
      {
        if (a8 && *(_BYTE *)(v30 + 17) != 2)
        {
          v96 = v33;
          v34 = (*((uint64_t (**)(void))a8->var0 + 7))();
          v33 = v96;
        }
        else
        {
          v34 = *(_QWORD *)(v30 + 72);
        }
      }
      else
      {
        v34 = 0;
      }
      *(_OWORD *)buf = v33;
      v111 = 0;
      v112 = v32;
      v114 = v34;
      v113 = 257;
      ggl::BufferMemory::operator=((uint64_t *)&p_venueWallMeshInfo[3]._value, (uint64_t)buf);
      *(_QWORD *)&v35 = v100.n128_u64[0];
      if (v114)
      {
        v37 = v111;
        v36 = v112;
        if (v112 != v111)
        {
          v38 = *(_QWORD **)&buf[8];
          v39 = v113;
          v40 = HIBYTE(v113);
          if (*(_QWORD *)buf && *(_BYTE *)(*(_QWORD *)&buf[8] + 17) != 2)
          {
            v95 = v113;
            v97 = HIBYTE(v113);
            (*(void (**)(__n128))(**(_QWORD **)buf + 64))(v100);
            v39 = v95;
            v40 = v97;
            *(_QWORD *)&v35 = v100.n128_u64[0];
          }
          if (v39 && !v40)
          {
            v42 = v38[7];
            v41 = v38[8];
            if (v41 == v42)
              v42 = v38[10] - v38[9];
            if (v37 < v42)
              v42 = v37;
            if (v41 <= v36)
              v41 = v36;
            if (v41 == v42)
              v41 = v42 + v38[10] - v38[9];
            v38[7] = v42;
            v38[8] = v41;
          }
        }
      }
      v43 = p_venueWallMeshInfo[9]._value.data[0];
      v44 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)&p_venueWallMeshInfo[2]._hasValue + 16 * v43) + 96);
      v45 = *(unsigned int *)(*(_QWORD *)&p_venueWallMeshInfo->_value.type + 8 * v43 + 4);
      memset(buf, 0, sizeof(buf));
      v46 = *(_QWORD *)(v44 + 8) * v45;
      *((_QWORD *)&v35 + 1) = v44;
      if (v46)
      {
        if (a8 && *(_BYTE *)(v44 + 17) != 2)
        {
          v101 = v35;
          v47 = (*((uint64_t (**)(void))a8->var0 + 7))();
          v35 = v101;
        }
        else
        {
          v47 = *(_QWORD *)(v44 + 72);
        }
      }
      else
      {
        v47 = 0;
      }
      *(_OWORD *)buf = v35;
      v111 = 0;
      v112 = v46;
      v114 = v47;
      v113 = 257;
      ggl::BufferMemory::operator=((uint64_t *)&p_venueWallMeshInfo[6]._value, (uint64_t)buf);
      if (v114)
      {
        v49 = v111;
        v48 = v112;
        if (v112 != v111)
        {
          v50 = *(_QWORD **)&buf[8];
          v51 = v113;
          v52 = HIBYTE(v113);
          if (*(_QWORD *)buf && *(_BYTE *)(*(_QWORD *)&buf[8] + 17) != 2)
          {
            v98 = v113;
            v102 = HIBYTE(v113);
            (*(void (**)(void))(**(_QWORD **)buf + 64))();
            v51 = v98;
            v52 = v102;
          }
          if (v51 && !v52)
          {
            v54 = v50[7];
            v53 = v50[8];
            if (v53 == v54)
              v54 = v50[10] - v50[9];
            if (v49 < v54)
              v54 = v49;
            if (v53 <= v48)
              v53 = v48;
            if (v53 == v54)
              v53 = v54 + v50[10] - v50[9];
            v50[7] = v54;
            v50[8] = v53;
          }
        }
      }
      v28 = WORD1(p_venueWallMeshInfo[9]._value.type);
      v23 = v118;
    }
    *(_QWORD *)buf = v28;
    *(_QWORD *)&buf[8] = v22 + v28;
    v55 = v26 + HIDWORD(p_venueWallMeshInfo[9]._value.type);
    type_high = HIDWORD(p_venueWallMeshInfo[9]._value.type);
    v109 = v55;
    if (!v23)
      goto LABEL_131;
    (*(void (**)(_QWORD *, uint8_t *, uint64_t *, ValueUnion *, ValueUnion *))(*v23 + 48))(v23, buf, &type_high, &p_venueWallMeshInfo[3]._value, &p_venueWallMeshInfo[6]._value);
    WORD1(p_venueWallMeshInfo[9]._value.type) += v22;
    HIDWORD(p_venueWallMeshInfo[9]._value.type) += v26;
  }
  else
  {
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
    v25 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F029000, v25, OS_LOG_TYPE_ERROR, "MeshSet: Cannot write points for polygons: polygon is too big", buf, 2u);
    }

  }
  v56 = 6 * v15;
  v57 = v118;
  if (v118 == v117)
  {
    v58 = 4;
    v57 = v117;
  }
  else
  {
    if (!v118)
      goto LABEL_70;
    v58 = 5;
  }
  (*(void (**)(void))(*v57 + 8 * v58))();
LABEL_70:
  if (!v56)
    return;
  v59 = v107;
  v60 = operator new(0x30uLL);
  v62 = 4 * v15;
  *v60 = &off_1E42C7F70;
  v60[1] = &v107;
  v60[2] = a5;
  v60[3] = a6;
  v60[4] = a3;
  v60[5] = &v106;
  v116 = v60;
  if ((unint64_t)(4 * v15) < 0x10000)
  {
    p_venueWallEndCapMeshInfo = &v59->_venueWallEndCapMeshInfo;
    v65 = *(unsigned __int16 *)&v59->_anon_d08[138];
    if (v62 > (unsigned __int16)~(_WORD)v65)
    {
      v66 = v59->_anon_d08[136] + 1;
      v59->_anon_d08[136] = v66;
      *(_WORD *)&v59->_anon_d08[138] = 0;
      *(_DWORD *)&v59->_anon_d08[140] = 0;
      v67 = **(_QWORD **)(*(_QWORD *)(*(_QWORD *)&v59->_anon_d08[16] + 16 * v66) + 64);
      v68 = *(unsigned __int16 *)(*(_QWORD *)&v59->_venueWallEndCapMeshInfo._value.type + 8 * v66);
      memset(buf, 0, sizeof(buf));
      v69 = *(_QWORD *)(v67 + 8) * v68;
      v61.n128_u64[0] = (unint64_t)a8;
      *(_QWORD *)&v70 = a8;
      *((_QWORD *)&v70 + 1) = v67;
      v103 = v61;
      if (v69)
      {
        if (a8 && *(_BYTE *)(v67 + 17) != 2)
        {
          v99 = v70;
          v71 = (*((uint64_t (**)(void))a8->var0 + 7))();
          v70 = v99;
        }
        else
        {
          v71 = *(_QWORD *)(v67 + 72);
        }
      }
      else
      {
        v71 = 0;
      }
      *(_OWORD *)buf = v70;
      v111 = 0;
      v112 = v69;
      v114 = v71;
      v113 = 257;
      ggl::BufferMemory::operator=((uint64_t *)&v59->_anon_d08[40], (uint64_t)buf);
      *(_QWORD *)&v72 = v103.n128_u64[0];
      if (v114)
      {
        v74 = v111;
        v73 = v112;
        if (v112 != v111)
        {
          v75 = *(_QWORD **)&buf[8];
          v76 = v113;
          v77 = HIBYTE(v113);
          if (*(_QWORD *)buf && *(_BYTE *)(*(_QWORD *)&buf[8] + 17) != 2)
          {
            (*(void (**)(__n128))(**(_QWORD **)buf + 64))(v103);
            *(_QWORD *)&v72 = v103.n128_u64[0];
          }
          if (v76 && !v77)
          {
            v79 = v75[7];
            v78 = v75[8];
            if (v78 == v79)
              v79 = v75[10] - v75[9];
            if (v74 < v79)
              v79 = v74;
            if (v78 <= v73)
              v78 = v73;
            if (v78 == v79)
              v78 = v79 + v75[10] - v75[9];
            v75[7] = v79;
            v75[8] = v78;
          }
        }
      }
      v80 = v59->_anon_d08[136];
      v81 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)&v59->_anon_d08[16] + 16 * v80) + 96);
      v82 = *(unsigned int *)(*(_QWORD *)&v59->_venueWallEndCapMeshInfo._value.type + 8 * v80 + 4);
      memset(buf, 0, sizeof(buf));
      v83 = *(_QWORD *)(v81 + 8) * v82;
      *((_QWORD *)&v72 + 1) = v81;
      if (v83)
      {
        if (a8 && *(_BYTE *)(v81 + 17) != 2)
        {
          v104 = v72;
          v84 = (*((uint64_t (**)(void))a8->var0 + 7))();
          v72 = v104;
        }
        else
        {
          v84 = *(_QWORD *)(v81 + 72);
        }
      }
      else
      {
        v84 = 0;
      }
      *(_OWORD *)buf = v72;
      v111 = 0;
      v112 = v83;
      v114 = v84;
      v113 = 257;
      ggl::BufferMemory::operator=((uint64_t *)&v59->_anon_d08[88], (uint64_t)buf);
      if (v114)
      {
        v86 = v111;
        v85 = v112;
        if (v112 != v111)
        {
          v87 = *(_QWORD **)&buf[8];
          v88 = v113;
          v89 = HIBYTE(v113);
          if (*(_QWORD *)buf && *(_BYTE *)(*(_QWORD *)&buf[8] + 17) != 2)
            (*(void (**)(void))(**(_QWORD **)buf + 64))();
          if (v88 && !v89)
          {
            v91 = v87[7];
            v90 = v87[8];
            if (v90 == v91)
              v91 = v87[10] - v87[9];
            if (v86 < v91)
              v91 = v86;
            if (v90 <= v85)
              v90 = v85;
            if (v90 == v91)
              v90 = v91 + v87[10] - v87[9];
            v87[7] = v91;
            v87[8] = v90;
          }
        }
      }
      v65 = WORD1(p_venueWallEndCapMeshInfo[9]._value.type);
      v60 = v116;
    }
    *(_QWORD *)buf = v65;
    *(_QWORD *)&buf[8] = v62 + v65;
    v92 = v56 + HIDWORD(p_venueWallEndCapMeshInfo[9]._value.type);
    type_high = HIDWORD(p_venueWallEndCapMeshInfo[9]._value.type);
    v109 = v92;
    if (v60)
    {
      (*(void (**)(_QWORD *, uint8_t *, uint64_t *, ValueUnion *, ValueUnion *))(*v60 + 48))(v60, buf, &type_high, &p_venueWallEndCapMeshInfo[3]._value, &p_venueWallEndCapMeshInfo[6]._value);
      WORD1(p_venueWallEndCapMeshInfo[9]._value.type) += v62;
      HIDWORD(p_venueWallEndCapMeshInfo[9]._value.type) += v56;
      goto LABEL_125;
    }
LABEL_131:
    std::__throw_bad_function_call[abi:nn180100]();
    __break(1u);
    return;
  }
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
  v63 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F029000, v63, OS_LOG_TYPE_ERROR, "MeshSet: Cannot write points for polygons: polygon is too big", buf, 2u);
  }

LABEL_125:
  v93 = v116;
  if (v116 == v115)
  {
    v94 = 4;
    v93 = v115;
  }
  else
  {
    if (!v116)
      return;
    v94 = 5;
  }
  (*(void (**)(void))(*v93 + 8 * v94))();
}

- (void)addWallStrokesForSection:(const void *)a3 edges:(const void *)a4 attributes:(const void *)a5 styles:(void *)a6 cullingMask:(unsigned int)a7 accessor:(ResourceAccessor *)a8
{
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  VKVenueGroup *v19;
  _QWORD v20[2];
  uint8_t buf[16];
  _BYTE v22[24];
  _BYTE *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = self;
  v18 = a7;
  v17 = *((_QWORD *)a3 + 11);
  -[VKVenueGroup bufferSizingForStrokesOnSection:styles:edges:](self, "bufferSizingForStrokesOnSection:styles:edges:");
  v13 = operator new(0x40uLL);
  *v13 = &off_1E42C7FB8;
  v13[1] = a4;
  v13[2] = &v17;
  v13[3] = a3;
  v13[4] = &v19;
  v13[5] = a5;
  v13[6] = a6;
  v13[7] = &v18;
  v23 = v13;
  *(_QWORD *)buf = *(unsigned __int16 *)&self->_anon_dc8[138];
  *(_QWORD *)&buf[8] = *(_QWORD *)buf;
  v14 = *(unsigned int *)&self->_anon_dc8[140];
  v20[0] = v14;
  v20[1] = v14;
  if (!v13)
  {
    std::__throw_bad_function_call[abi:nn180100]();
    __break(1u);
    return;
  }
  (*(void (**)(_QWORD *, uint8_t *, _QWORD *, unsigned __int8 *, unsigned __int8 *))(*v13 + 48))(v13, buf, v20, &self->_anon_dc8[40], &self->_anon_dc8[88]);
  *(_WORD *)&self->_anon_dc8[138] = *(_WORD *)&self->_anon_dc8[138];
  *(_DWORD *)&self->_anon_dc8[140] = *(_DWORD *)&self->_anon_dc8[140];
  v15 = v23;
  if (v23 == v22)
  {
    v16 = 4;
    v15 = v22;
  }
  else
  {
    if (!v23)
      return;
    v16 = 5;
  }
  (*(void (**)(void))(*v15 + 8 * v16))();
}

- (void)addStrokeForSection:(const void *)a3 paddedCount:(unsigned int)a4 key:(pair<const void *) attributes:(unsigned long>)a5 styles:(const void *)a6 cullingMask:(void *)a7 accessor:(unsigned int)a8
{
  unint64_t var1;
  void *var0;
  _QWORD *v15;
  _QWORD *v16;
  objc_super v17;
  pair<const void *, unsigned long> v18;

  var1 = a5.var1;
  var0 = a5.var0;
  v18 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VKVenueGroup;
  -[VKPolygonGroup addStrokeForSection:paddedCount:key:attributes:styles:cullingMask:accessor:](&v17, sel_addStrokeForSection_paddedCount_key_attributes_styles_cullingMask_accessor_, a3, *(_QWORD *)&a4, a8, a9);
  v15 = std::__hash_table<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::__unordered_map_hasher<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::hash<std::pair<void const*,unsigned long>>,std::equal_to<std::pair<void const*,unsigned long>>,true>,std::__unordered_map_equal<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::equal_to<std::pair<void const*,unsigned long>>,std::hash<std::pair<void const*,unsigned long>>,true>,std::allocator<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>>>::__emplace_unique_key_args<std::pair<void const*,unsigned long>,std::piecewise_construct_t const&,std::tuple<std::pair<void const*,unsigned long> const&>,std::tuple<>>((uint64_t)&self->_venueWalls, (unint64_t)var0, var1, &v18);
  v16 = v15 + 4;
  if (v15[5] != v15[4])
  {
    -[VKVenueGroup addWallsForSection:edges:attributes:styles:cullingMask:accessor:](self, "addWallsForSection:edges:attributes:styles:cullingMask:accessor:", a3, v16, a6, a7, a8, a9);
    -[VKVenueGroup addWallStrokesForSection:edges:attributes:styles:cullingMask:accessor:](self, "addWallStrokesForSection:edges:attributes:styles:cullingMask:accessor:", a3, v16, a6, a7, a8, a9);
  }
}

- (void)updateTextures:(unsigned __int8)a3 textureManager:(void *)a4
{
  unsigned int v5;
  _QWORD **v7;
  std::string::size_type *v8;
  std::string::size_type v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  unsigned int v16;
  std::string::size_type size;
  shared_ptr<ggl::Texture2D> v18;
  shared_ptr<ggl::Texture2D> *v19;
  __shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  shared_ptr<ggl::Texture2D> *p_wallTexture;
  __shared_weak_count *cntrl;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  shared_ptr<ggl::Texture2D> v30;
  std::string __p;
  std::string::size_type v32;
  std::__shared_weak_count *v33;
  _QWORD v34[2];
  unsigned __int8 v35;
  objc_super v36;

  v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)VKVenueGroup;
  -[VKPolygonGroup updateTextures:textureManager:](&v36, sel_updateTextures_textureManager_);
  LOWORD(v30.__ptr_) = 0;
  v7 = -[VKPolygonalItemGroup styleQueries:](self, "styleQueries:", &v30);
  v8 = *v7;
  v9 = **v7;
  v10 = (std::__shared_weak_count *)v8[1];
  __p.__r_.__value_.__r.__words[0] = v9;
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
    v33 = v10;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  else
  {
    v33 = 0;
  }
  v34[0] = 0;
  v34[1] = 0;
  v32 = v9;
  v35 = 0;
  if (v9)
    LODWORD(v9) = (*(uint64_t (**)(std::string::size_type, _QWORD *))(*(_QWORD *)v9 + 48))(v9, v34);
  v35 = v9;
  if (v10)
  {
    v14 = (unint64_t *)&v10->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
    LODWORD(v9) = v35;
  }
  if ((_DWORD)v9)
  {
    if (v5 >= 0x17)
      v16 = 23;
    else
      v16 = v5;
    gss::RenderStyle<gss::PropertyID>::valueForKeyAtZ<std::string>(&__p, *(_QWORD *)(v32 + 24), 0x152u, v16, 2);
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      size = __p.__r_.__value_.__l.__size_;
    if (size)
    {
      -[VKPolygonGroup _textureForName:textureManager:](self, "_textureForName:textureManager:", &__p, a4);
      v18 = v30;
    }
    else
    {
      v18 = (shared_ptr<ggl::Texture2D>)0;
    }
    p_wallTexture = &self->_wallTexture;
    v30 = (shared_ptr<ggl::Texture2D>)0;
    cntrl = self->_wallTexture.__cntrl_;
    *p_wallTexture = v18;
    if (cntrl)
    {
      v25 = (unint64_t *)((char *)cntrl + 8);
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      }
    }
    v27 = (std::__shared_weak_count *)v30.__cntrl_;
    if (v30.__cntrl_)
    {
      v28 = (unint64_t *)((char *)v30.__cntrl_ + 8);
      do
        v29 = __ldaxr(v28);
      while (__stlxr(v29 - 1, v28));
      if (!v29)
      {
        ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
        std::__shared_weak_count::__release_weak(v27);
        if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_41;
        goto LABEL_40;
      }
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
LABEL_40:
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    v19 = &self->_wallTexture;
    v20 = self->_wallTexture.__cntrl_;
    v19->__ptr_ = 0;
    v19->__cntrl_ = 0;
    if (v20)
    {
      v21 = (unint64_t *)((char *)v20 + 8);
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)v20 + 16))(v20);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v20);
      }
    }
  }
LABEL_41:
  gss::QueryableLocker<gss::PropertyID>::~QueryableLocker((uint64_t)&v32);
}

- (int)layer
{
  return self->_layer;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  unordered_map<std::pair<const void *, unsigned long>, std::vector<md::Edge>, std::hash<md::SectionKey>, std::equal_to<std::pair<const void *, unsigned long>>, std::allocator<std::pair<const std::pair<const void *, unsigned long>, std::vector<md::Edge>>>> *p_venueWalls;
  _QWORD *next;
  void **value;
  char *begin;
  char *end;
  void *v11;
  _QWORD *v12;
  void *v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  char *v17;
  char *v18;
  void *v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  char *v23;
  char *v24;
  void *v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  char *v29;
  char *v30;
  void *v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  optional<md::MeshSet<ggl::VenueWall::MeshMesh, ggl::VenueWall::DefaultVbo>> *p_venueWallMeshInfo;

  cntrl = self->_wallTexture.__cntrl_;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  p_venueWalls = &self->_venueWalls;
  next = self->_venueWalls.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v12 = (_QWORD *)*next;
      v13 = (void *)next[4];
      if (v13)
      {
        next[5] = v13;
        operator delete(v13);
      }
      operator delete(next);
      next = v12;
    }
    while (v12);
  }
  value = p_venueWalls->__table_.__bucket_list_.__ptr_.__value_;
  p_venueWalls->__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
  begin = (char *)self->_venueWallVerticalStrokeMeshes.__begin_;
  if (begin)
  {
    end = (char *)self->_venueWallVerticalStrokeMeshes.__end_;
    v11 = self->_venueWallVerticalStrokeMeshes.__begin_;
    if (end != begin)
    {
      do
      {
        v14 = (std::__shared_weak_count *)*((_QWORD *)end - 1);
        if (v14)
        {
          p_shared_owners = (unint64_t *)&v14->__shared_owners_;
          do
            v16 = __ldaxr(p_shared_owners);
          while (__stlxr(v16 - 1, p_shared_owners));
          if (!v16)
          {
            ((void (*)(std::__shared_weak_count *, SEL))v14->__on_zero_shared)(v14, a2);
            std::__shared_weak_count::__release_weak(v14);
          }
        }
        end -= 16;
      }
      while (end != begin);
      v11 = self->_venueWallVerticalStrokeMeshes.__begin_;
    }
    self->_venueWallVerticalStrokeMeshes.__end_ = begin;
    operator delete(v11);
  }
  v17 = (char *)self->_venueWallHorizontalStrokeMeshes.__begin_;
  if (v17)
  {
    v18 = (char *)self->_venueWallHorizontalStrokeMeshes.__end_;
    v19 = self->_venueWallHorizontalStrokeMeshes.__begin_;
    if (v18 != v17)
    {
      do
      {
        v20 = (std::__shared_weak_count *)*((_QWORD *)v18 - 1);
        if (v20)
        {
          v21 = (unint64_t *)&v20->__shared_owners_;
          do
            v22 = __ldaxr(v21);
          while (__stlxr(v22 - 1, v21));
          if (!v22)
          {
            ((void (*)(std::__shared_weak_count *, SEL))v20->__on_zero_shared)(v20, a2);
            std::__shared_weak_count::__release_weak(v20);
          }
        }
        v18 -= 16;
      }
      while (v18 != v17);
      v19 = self->_venueWallHorizontalStrokeMeshes.__begin_;
    }
    self->_venueWallHorizontalStrokeMeshes.__end_ = v17;
    operator delete(v19);
  }
  v23 = (char *)self->_venueWallEndMeshes.__begin_;
  if (v23)
  {
    v24 = (char *)self->_venueWallEndMeshes.__end_;
    v25 = self->_venueWallEndMeshes.__begin_;
    if (v24 != v23)
    {
      do
      {
        v26 = (std::__shared_weak_count *)*((_QWORD *)v24 - 1);
        if (v26)
        {
          v27 = (unint64_t *)&v26->__shared_owners_;
          do
            v28 = __ldaxr(v27);
          while (__stlxr(v28 - 1, v27));
          if (!v28)
          {
            ((void (*)(std::__shared_weak_count *, SEL))v26->__on_zero_shared)(v26, a2);
            std::__shared_weak_count::__release_weak(v26);
          }
        }
        v24 -= 16;
      }
      while (v24 != v23);
      v25 = self->_venueWallEndMeshes.__begin_;
    }
    self->_venueWallEndMeshes.__end_ = v23;
    operator delete(v25);
  }
  v29 = (char *)self->_venueWallMeshes.__begin_;
  if (v29)
  {
    v30 = (char *)self->_venueWallMeshes.__end_;
    v31 = self->_venueWallMeshes.__begin_;
    if (v30 != v29)
    {
      do
      {
        v32 = (std::__shared_weak_count *)*((_QWORD *)v30 - 1);
        if (v32)
        {
          v33 = (unint64_t *)&v32->__shared_owners_;
          do
            v34 = __ldaxr(v33);
          while (__stlxr(v34 - 1, v33));
          if (!v34)
          {
            ((void (*)(std::__shared_weak_count *, SEL))v32->__on_zero_shared)(v32, a2);
            std::__shared_weak_count::__release_weak(v32);
          }
        }
        v30 -= 16;
      }
      while (v30 != v29);
      v31 = self->_venueWallMeshes.__begin_;
    }
    self->_venueWallMeshes.__end_ = v29;
    operator delete(v31);
  }
  if (self->_venueWallVerticalStrokeMeshInfo._hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&self->_venueWallVerticalStrokeMeshInfo._value);
    self->_venueWallVerticalStrokeMeshInfo._hasValue = 0;
  }
  if (self->_venueWallHorizontalStrokeMeshInfo._hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&self->_venueWallHorizontalStrokeMeshInfo._value);
    self->_venueWallHorizontalStrokeMeshInfo._hasValue = 0;
  }
  if (self->_venueWallEndCapMeshInfo._hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&self->_venueWallEndCapMeshInfo._value);
    self->_venueWallEndCapMeshInfo._hasValue = 0;
  }
  p_venueWallMeshInfo = &self->_venueWallMeshInfo;
  if (p_venueWallMeshInfo->_hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&p_venueWallMeshInfo->_value);
    p_venueWallMeshInfo->_hasValue = 0;
  }
}

- (id).cxx_construct
{
  *((_BYTE *)self + 3128) = 0;
  *((_BYTE *)self + 3320) = 0;
  *((_BYTE *)self + 3512) = 0;
  *((_BYTE *)self + 3704) = 0;
  *((_QWORD *)self + 488) = 0;
  *((_QWORD *)self + 489) = 0;
  *((_QWORD *)self + 487) = 0;
  *((_QWORD *)self + 491) = 0;
  *((_QWORD *)self + 492) = 0;
  *((_QWORD *)self + 490) = 0;
  *((_QWORD *)self + 494) = 0;
  *((_QWORD *)self + 495) = 0;
  *((_QWORD *)self + 493) = 0;
  *((_QWORD *)self + 497) = 0;
  *((_QWORD *)self + 498) = 0;
  *((_QWORD *)self + 496) = 0;
  *(_OWORD *)((char *)self + 3992) = 0u;
  *(_OWORD *)((char *)self + 4008) = 0u;
  *((_DWORD *)self + 1006) = 1065353216;
  *((_QWORD *)self + 506) = 0;
  *((_QWORD *)self + 507) = 0;
  return self;
}

- (void)addWallStrokesForSection:edges:attributes:styles:cullingMask:accessor:
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  float *v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  float32x4_t v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int16x4_t *v33;
  uint64_t v34;
  _QWORD *v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char v39;
  char v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  unsigned int v46;
  float32x4_t v47;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;

  v6 = *(uint64_t **)(a1 + 8);
  v7 = *v6;
  if (*v6 != v6[1])
  {
    v8 = 5;
    v9 = 3;
    v47 = (float32x4_t)vdupq_n_s32(0x46FFFE00u);
    do
    {
      v34 = *(_QWORD *)(v7 + 24);
      v35 = *(_QWORD **)(a1 + 24);
      v36 = **(_QWORD **)(a1 + 16);
      v37 = (v34 + 1) % v36;
      v55 = v35[2];
      v38 = v35[11];
      v52 = *a2;
      v53 = v35[5];
      v54 = *a3;
      v39 = objc_msgSend(**(id **)(a1 + 32), "styleIndexForAttributes:edgePair:", *(_QWORD *)(a1 + 40), **(_QWORD **)(a1 + 48) + 12 * ((v34 + v36 - 1) % v36) + 4, *(_OWORD *)&v47);
      v40 = objc_msgSend(**(id **)(a1 + 32), "styleIndexForAttributes:edgePair:", *(_QWORD *)(a1 + 40), **(_QWORD **)(a1 + 48) + 12 * v34 + 4);
      v41 = v40;
      v42 = **(_QWORD **)(a1 + 48);
      if (*(_BYTE *)(v42 + 12 * v37))
        v40 = objc_msgSend(**(id **)(a1 + 32), "styleIndexForAttributes:edgePair:", *(_QWORD *)(a1 + 40), v42 + 12 * v37 + 4);
      v10 = (float *)(v55 + 8 * ((v34 + 1) % v38));
      v11 = (int)(float)(*(float *)v7 * 65535.0);
      v12 = (int)(float)(*(float *)(v7 + 4) * 65535.0);
      v13 = v9 + v52 - 3;
      v14 = (int)(float)(*(float *)(v7 + 12) * 65535.0);
      v15 = (int)(float)(*(float *)(v7 + 16) * 65535.0);
      v16.i64[0] = *(_QWORD *)(v53 + 8 * v34);
      v17 = (int)(float)(*v10 * 32767.0);
      v18 = *(_QWORD *)(v55 + 8 * v34);
      v19 = (int)(float)(v10[1] * 32767.0);
      v20 = *(_QWORD *)(a4 + 40) + 40 * v13;
      *(_WORD *)v20 = v11;
      *(_WORD *)(v20 + 2) = v12;
      *(_DWORD *)(v20 + 4) = 0xFFFF;
      *(_WORD *)(v20 + 8) = v14;
      *(_WORD *)(v20 + 10) = v15;
      *(_DWORD *)(v20 + 12) = 0xFFFF;
      *(_BYTE *)(v20 + 16) = v39;
      *(_BYTE *)(v20 + 17) = v41;
      *(_BYTE *)(v20 + 18) = v40;
      *(_BYTE *)(v20 + 19) = 0;
      v21 = *(_QWORD *)(a4 + 40);
      v16.i64[1] = v18;
      v22 = v21 + 40 * v13;
      *(int16x4_t *)v16.f32 = vmovn_s32(vcvtq_s32_f32(vmulq_f32(v16, v47)));
      *(_QWORD *)(v22 + 24) = v16.i64[0];
      *(_WORD *)(v22 + 32) = v17;
      *(_WORD *)(v22 + 34) = v19;
      v23 = 40 * (v9 + v52);
      v24 = v21 + v23 - 80;
      *(_WORD *)v24 = v11;
      *(_WORD *)(v24 + 2) = v12;
      *(_DWORD *)(v24 + 4) = 0x1FFFF;
      *(_WORD *)(v24 + 8) = v14;
      *(_WORD *)(v24 + 10) = v15;
      *(_DWORD *)(v24 + 12) = 0xFFFF;
      *(_BYTE *)(v24 + 16) = v39;
      *(_BYTE *)(v24 + 17) = v41;
      *(_BYTE *)(v24 + 18) = v40;
      *(_BYTE *)(v24 + 19) = 0;
      v25 = *(_QWORD *)(a4 + 40);
      v26 = v25 + v23 - 80;
      *(_QWORD *)(v26 + 24) = v16.i64[0];
      *(_WORD *)(v26 + 32) = v17;
      *(_WORD *)(v26 + 34) = v19;
      v27 = v25 + v23 - 40;
      *(_WORD *)v27 = v11;
      *(_WORD *)(v27 + 2) = v12;
      *(_DWORD *)(v27 + 4) = 16842751;
      *(_WORD *)(v27 + 8) = v14;
      *(_WORD *)(v27 + 10) = v15;
      *(_DWORD *)(v27 + 12) = 0xFFFF;
      *(_BYTE *)(v27 + 16) = v39;
      *(_BYTE *)(v27 + 17) = v41;
      *(_BYTE *)(v27 + 18) = v40;
      *(_BYTE *)(v27 + 19) = 0;
      v28 = *(_QWORD *)(a4 + 40);
      v29 = v28 + v23 - 40;
      *(_QWORD *)(v29 + 24) = v16.i64[0];
      *(_WORD *)(v29 + 32) = v17;
      *(_WORD *)(v29 + 34) = v19;
      v30 = v28 + v23;
      *(_WORD *)v30 = v11;
      *(_WORD *)(v30 + 2) = v12;
      *(_DWORD *)(v30 + 4) = 16908287;
      *(_WORD *)(v30 + 8) = v14;
      *(_WORD *)(v30 + 10) = v15;
      *(_DWORD *)(v30 + 12) = 0xFFFF;
      *(_BYTE *)(v30 + 16) = v39;
      *(_BYTE *)(v30 + 17) = v41;
      *(_BYTE *)(v30 + 18) = v40;
      *(_BYTE *)(v30 + 19) = 0;
      v31 = *(_QWORD *)(a4 + 40) + v23;
      *(_QWORD *)(v31 + 24) = v16.i64[0];
      *(_WORD *)(v31 + 32) = v17;
      *(_WORD *)(v31 + 34) = v19;
      v32 = *(_QWORD *)(a5 + 40);
      *(_WORD *)(v32 + 2 * (v8 + v54 - 5)) = v13;
      *(int32x2_t *)v16.f32 = vadd_s32(vdup_n_s32(v13), (int32x2_t)0x200000001);
      *(int16x4_t *)v16.f32 = vuzp1_s16(*(int16x4_t *)v16.f32, *(int16x4_t *)v16.f32);
      v33 = (int16x4_t *)(v32 + 2 * (v8 + v54));
      v33[-1] = vzip1_s16(*(int16x4_t *)v16.f32, vrev32_s16(*(int16x4_t *)v16.f32));
      v33->i16[0] = v9 + v52;
      v7 += 56;
      v8 += 6;
      v9 += 4;
    }
    while (v7 != *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8));
  }
  v43 = *(_QWORD *)(a1 + 24);
  v44 = **(_QWORD **)(a1 + 32);
  v45 = **(_DWORD **)(a1 + 56);
  v46 = *(unsigned __int8 *)(v44 + 3664);
  v56 = *(_OWORD *)a3;
  v57 = *(_QWORD *)(v43 + 104);
  _addRangeToList(v44 + 1776, v45, v46, &v56);
}

- (__n128)addWallStrokesForSection:edges:attributes:styles:cullingMask:accessor:
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_QWORD *)a2 = &off_1E42C7FB8;
  result = *(__n128 *)(a1 + 8);
  v3 = *(_OWORD *)(a1 + 24);
  v4 = *(_OWORD *)(a1 + 40);
  *(_QWORD *)(a2 + 56) = *(_QWORD *)(a1 + 56);
  *(_OWORD *)(a2 + 40) = v4;
  *(_OWORD *)(a2 + 24) = v3;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (void)addWallsForSection:edges:attributes:styles:cullingMask:accessor:
{
  __int16 v8;
  _QWORD *v9;
  __int16 v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  float v21;
  uint64_t v22;
  float32x4_t v23;
  uint64_t v24;
  float *v25;
  float v26;
  float v27;
  float v28;
  float v29;
  int v30;
  uint64_t v31;
  float32x4_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  __int16 v40;
  _WORD *v41;
  __int16 v42;
  __int16 v43;
  uint64_t v44;
  int v45;
  unsigned int v46;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  __int128 v52;
  uint64_t v53;

  v8 = objc_msgSend(**(id **)(a1 + 8), "styleIndexForAttributes:edgePair:", *(_QWORD *)(a1 + 16), **(_QWORD **)(a1 + 24) + 12 * *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) - 8);
  v9 = *(_QWORD **)(a1 + 32);
  if (v9[11])
  {
    v10 = v8;
    v11 = 0;
    v12 = 0;
    v13 = 4;
    v14 = 3;
    __asm { FMOV            V1.4S, #-1.0 }
    v50 = (float32x4_t)vdupq_n_s32(0x46FFFD00u);
    v51 = _Q1;
    __asm { FMOV            V0.4S, #1.0 }
    v49 = _Q0;
    v21 = 0.0;
    do
    {
      v34 = v9[2];
      v35 = v9[5];
      v36 = **(_QWORD **)(a1 + 24);
      if (*(_BYTE *)(v36 + v11))
      {
        v8 = objc_msgSend(**(id **)(a1 + 8), "styleIndexForAttributes:edgePair:", *(_QWORD *)(a1 + 16), v36 + v11 + 4);
        v9 = *(_QWORD **)(a1 + 32);
      }
      v22 = 8 * v12;
      v23.i64[0] = *(_QWORD *)(v35 + 8 * v12);
      v24 = *(_QWORD *)(v34 + 8 * v12);
      v25 = (float *)(v9[1] + v13);
      v26 = fmaxf(*(v25 - 1), 0.0);
      v27 = fmaxf(*v25, 0.0);
      if (v26 <= 1.0)
        v28 = v26 * 65535.0;
      else
        v28 = 65535.0;
      if (v27 <= 1.0)
        v29 = v27 * 65535.0;
      else
        v29 = 65535.0;
      v30 = (int)(float)((float)(v21 * 65535.0) / *(float *)(**(_QWORD **)(a1 + 8) + 4040));
      v31 = *(_QWORD *)(a4 + 40) + 24 * (v14 + *a2);
      *(_WORD *)(v31 - 72) = (int)v28;
      *(_WORD *)(v31 - 70) = (int)v29;
      *(_WORD *)(v31 - 68) = v10;
      *(_WORD *)(v31 - 66) = v8;
      *(_WORD *)(v31 - 64) = 0;
      *(_WORD *)(v31 - 62) = v30;
      v23.i64[1] = v24;
      v32 = vmaxnmq_f32(v23, v51);
      *(int16x4_t *)v32.f32 = vmovn_s32(vcvtq_s32_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v32, v49), (int8x16_t)v50, (int8x16_t)vmulq_f32(v32, v50))));
      *(_QWORD *)(v31 - 56) = v32.i64[0];
      *(_WORD *)(v31 - 48) = (int)v28;
      *(_WORD *)(v31 - 46) = (int)v29;
      *(_WORD *)(v31 - 44) = v10;
      *(_WORD *)(v31 - 42) = v8;
      *(_WORD *)(v31 - 40) = -256;
      *(_WORD *)(v31 - 38) = v30;
      *(_QWORD *)(v31 - 32) = v32.i64[0];
      *(_WORD *)(v31 - 24) = (int)v28;
      *(_WORD *)(v31 - 22) = (int)v29;
      *(_WORD *)(v31 - 20) = v8;
      *(_WORD *)(v31 - 18) = v10;
      *(_WORD *)(v31 - 16) = 255;
      *(_WORD *)(v31 - 14) = v30;
      *(_QWORD *)(v31 - 8) = v32.i64[0];
      *(_WORD *)v31 = (int)v28;
      *(_WORD *)(v31 + 2) = (int)v29;
      *(_WORD *)(v31 + 4) = v8;
      *(_WORD *)(v31 + 6) = v10;
      *(_WORD *)(v31 + 8) = -1;
      *(_WORD *)(v31 + 10) = v30;
      *(_QWORD *)(v31 + 16) = v32.i64[0];
      v9 = *(_QWORD **)(a1 + 32);
      ++v12;
      v33 = v9[11];
      *(float32x2_t *)v32.f32 = vsub_f32(*(float32x2_t *)(v9[1] + 8 * (v12 % v33)), *(float32x2_t *)(v9[1] + v22));
      v13 += 8;
      v21 = sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)v32.f32, *(float32x2_t *)v32.f32))) + v21;
      v14 += 4;
      v11 += 12;
      v10 = v8;
    }
    while (v12 < v33);
  }
  v37 = *(uint64_t **)(a1 + 40);
  v38 = *v37;
  v39 = v37[1];
  if (v38 != v39)
  {
    v40 = *(_WORD *)a2;
    v41 = (_WORD *)(*(_QWORD *)(a5 + 40) + 2 * *a3 + 6);
    do
    {
      v42 = v40 + 4 * *(_WORD *)(v38 + 24);
      v43 = *(_WORD *)(v38 + 32);
      *(v41 - 3) = v42 + 2;
      *(v41 - 2) = v40 + 4 * v43;
      v42 += 3;
      *(v41 - 1) = v42;
      *v41 = v42;
      v41[1] = v40 + 4 * v43;
      v41[2] = v40 + 4 * v43 + 1;
      v38 += 56;
      v41 += 6;
    }
    while (v38 != v39);
  }
  v44 = **(_QWORD **)(a1 + 8);
  v45 = **(_DWORD **)(a1 + 48);
  v46 = *(unsigned __int8 *)(v44 + 3280);
  v52 = *(_OWORD *)a3;
  v53 = v9[13];
  _addRangeToList(v44 + 1008, v45, v46, &v52);
}

- (__n128)addWallsForSection:edges:attributes:styles:cullingMask:accessor:
{
  __n128 result;
  __int128 v3;

  *(_QWORD *)a2 = &off_1E42C7F28;
  result = *(__n128 *)(a1 + 8);
  v3 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 40) = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 24) = v3;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

@end
