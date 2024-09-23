@implementation VKMapCameraController

- (double)altitude
{
  void *v3;
  double v4;
  double v5;
  double v6;
  long double v7;
  long double v8;
  long double v9;
  double v10;
  long double v11;
  double v12;
  long double v13;

  -[VKCameraController vkCamera](self, "vkCamera");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(double *)(objc_msgSend(v3, "position") + 16);

  -[VKMapCameraController centerCoordinate](self, "centerCoordinate");
  v6 = v5;
  v7 = cos(v5 * 0.034906585) * -559.82 + 111132.92;
  v8 = v7 + cos(v6 * 0.0698131701) * 1.175;
  v9 = v8 + cos(v6 * 0.104719755) * -0.0023;
  v10 = v6 * 0.00872664626;
  v11 = tan(v6 * 0.00872664626 + 0.78103484);
  v12 = log(v11);
  v13 = tan(v10 + 0.789761487);
  return v9 * v4 / fabs((log(v13) - v12) * 0.159154943);
}

- (double)topDownMinimumZoomLevel
{
  float v2;

  -[VKMapCameraController currentTopDownMinimumNormalizedZoomLevel](self, "currentTopDownMinimumNormalizedZoomLevel");
  return v2;
}

- (float)currentTopDownMinimumNormalizedZoomLevel
{
  unint64_t *p_shared_owners;
  unint64_t v4;
  float v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v9;
  std::__shared_weak_count *v10;

  -[VKCameraController camera](self, "camera");
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)())v10->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v10);
      if (v9)
        goto LABEL_6;
      return 1.0;
    }
  }
  if (!v9)
    return 1.0;
LABEL_6:
  -[VKCameraController camera](self, "camera");
  v5 = ceilf(*(float *)(v9 + 88) * 1000.0);
  if (v10)
  {
    v6 = (unint64_t *)&v10->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)())v10->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  return v5 * 0.001;
}

- (void)updateCameraZBounds
{
  void *v3;
  BOOL v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  long double v27;
  double v28;
  VKMapCameraController *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  BOOL v34;
  double v35;
  void *v36;
  double v37;
  float v38;
  float v39;
  double v40;
  _QWORD *mapEngine;
  uint64_t v42;
  uint64_t v43;
  int v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  float v48;
  double v49;
  double v50;
  double v51;
  float v52;
  float v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  void *v59;
  float v60;
  float v61;
  VKMapCameraController *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  uint64_t v67;
  void *v68;
  double v69;
  float v70;
  float v71;
  VKMapCameraController *v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  uint64_t v77;
  void *v78;
  double v79;
  float v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  VKMapCameraController *v87;
  void *v88;
  double v89;
  double v90;
  double v91;
  uint64_t v92;
  void *v93;
  double v94;
  float v95;
  int8x8_t *v96;
  int8x8_t v97;
  uint8x8_t v98;
  unint64_t v99;
  _QWORD *v100;
  _QWORD *v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  double v106;
  VKMapCameraController *v107;
  void *v108;
  double v109;
  double v110;
  double v111;
  uint64_t v112;
  void *v113;
  double v114;
  float v115;
  float v116;
  float v117;
  void *v118;
  void *v119;
  char v120;
  void *v121;
  void *v122;
  VKMapCameraController *v123;
  void *v124;
  double v125;
  double v126;
  double v127;
  uint64_t v128;
  void *v129;
  double v130;
  float v131;
  uint64_t v132;
  void *v133;
  double v134;
  float v135;
  float v136;
  float v137;
  float v138;
  float v139;
  uint64_t v140;
  void *v141;
  double v142;
  float v143;
  float v144;
  float v145;
  float v146;
  uint64_t v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  long double v153;
  long double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  long double v161;
  long double v162;
  double v163;
  uint64_t v164;
  double v165;
  float v166;
  std::__shared_weak_count *v167;
  unint64_t *v168;
  unint64_t v169;
  std::__shared_weak_count *v170;
  unint64_t *v171;
  unint64_t v172;
  std::__shared_weak_count *v173;
  unint64_t *v174;
  unint64_t v175;
  std::__shared_weak_count *v176;
  unint64_t *v177;
  unint64_t v178;
  double v179;
  void *v180;
  double v181;
  void *v182;
  double v183;
  void *v184;
  __int128 v185;
  uint64_t v186;
  std::__shared_weak_count *v187;
  __int128 v188;
  unint64_t *v189;
  unint64_t v190;
  double v191;
  float v192;
  double v193;
  _QWORD v194[2];
  std::__shared_weak_count *v195;
  double *v196;
  std::__shared_weak_count *v197;
  double v198;
  double *v199;
  std::__shared_weak_count *v200;
  double v201;
  uint64_t v202;
  std::__shared_weak_count *v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  double v208;
  float v209;
  double v210;
  double v211;
  float v212;
  double v213;
  double v214;
  double v215;
  double v216;
  unsigned __int8 v217;
  uint64_t v218;
  char v219[8];
  std::__shared_weak_count *v220;

  -[VKCameraController camera](self, "camera");
  if ((_QWORD)v204)
  {
    -[VKCameraController vkCamera](self, "vkCamera");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 == 0;

    v5 = (std::__shared_weak_count *)*((_QWORD *)&v204 + 1);
    if (!*((_QWORD *)&v204 + 1))
      goto LABEL_8;
  }
  else
  {
    v4 = 1;
    v5 = (std::__shared_weak_count *)*((_QWORD *)&v204 + 1);
    if (!*((_QWORD *)&v204 + 1))
      goto LABEL_8;
  }
  p_shared_owners = (unint64_t *)&v5->__shared_owners_;
  do
    v7 = __ldaxr(p_shared_owners);
  while (__stlxr(v7 - 1, p_shared_owners));
  if (!v7)
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
    if (v4)
      return;
    goto LABEL_9;
  }
LABEL_8:
  if (v4)
    return;
LABEL_9:
  -[VKCameraController vkCamera](self, "vkCamera");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "position");
  v10 = *(double *)v9;
  v11 = *(double *)(v9 + 8);
  v12 = *(double *)(v9 + 16);

  -[VKCameraController vkCamera](self, "vkCamera");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "forwardVector");
  v15 = v14;
  v17 = v16;
  v19 = v18;

  -[VKCameraController vkCamera](self, "vkCamera");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    objc_msgSend(v20, "groundPointFromScreenPoint:", 0.5, 0.5);
  }
  else
  {
    v204 = 0u;
    v205 = 0u;
  }

  if (!(_BYTE)v204)
    return;
  v191 = v19;
  v22 = v17;
  v23 = v15;
  v24 = v10;
  v25 = *((double *)&v205 + 1);
  -[VKCameraController vkCamera](self, "vkCamera");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "widthOfViewAtDepth:", (*((double *)&v204 + 1) - v24) * v23 + (*(double *)&v205 - v11) * v22 + (*((double *)&v205 + 1) - v12) * v191);
  v28 = 0.0;
  if (v27 > 0.0)
    v28 = -log2(v27);

  v29 = self;
  -[VKCameraController canvas](v29, "canvas");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "size");
  v32 = v31;

  v33 = 0.0;
  v34 = v32 <= 0.0;
  v35 = 0.0;
  if (!v34)
  {
    -[VKCameraController canvas](v29, "canvas");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "size");
    v35 = log2(v37 / (double)-[VKMapCameraController tileSize](v29, "tileSize"));

  }
  v38 = v28;
  v39 = v35 + v38;

  mapEngine = v29->_mapEngine;
  if (mapEngine && (v42 = mapEngine[149]) != 0 && *(_BYTE *)(v42 + 528))
  {
    -[VKCameraController camera](v29, "camera");
    v212 = v39;
    v43 = *(_QWORD *)(v42 + 520);
    if (!v43)
    {
      std::__throw_bad_function_call[abi:nn180100]();
      __break(1u);
      return;
    }
    (*(void (**)(double *__return_ptr, uint64_t, char *, float *))(*(_QWORD *)v43 + 48))(&v215, v43, v219, &v212);
    v33 = v215;
    v25 = v216;
    v44 = v217;
    v45 = v220;
    if (v220)
    {
      v46 = (unint64_t *)&v220->__shared_owners_;
      do
        v47 = __ldaxr(v46);
      while (__stlxr(v47 - 1, v46));
      if (!v47)
      {
        ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
        std::__shared_weak_count::__release_weak(v45);
      }
    }
  }
  else
  {
    v44 = 0;
  }
  *(float *)&v40 = v39;
  -[VKMapCameraController maxPitchForNormalizedZoomLevel:](v29, "maxPitchForNormalizedZoomLevel:", v40);
  v49 = v48;
  v50 = fmin(v33, v49);
  if (v44)
    v51 = v50;
  else
    v51 = v49;
  *(float *)&v49 = v39;
  -[VKMapCameraController minimumPitchForNormalizedZoomLevel:](v29, "minimumPitchForNormalizedZoomLevel:", v49);
  v53 = v52;
  -[VKCameraController vkCamera](v29, "vkCamera");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "maxPitch");
  v56 = v55;

  -[VKCameraController vkCamera](v29, "vkCamera");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setMaxPitch:", v51);
  v58 = v53;

  if (v51 > v58 == v56 <= v58)
  {
    -[VKCameraController cameraDelegate](v29, "cameraDelegate");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "mapLayerCanEnter3DModeDidChange:", v51 > v58);

  }
  -[VKMapCameraController minimumNormalizedZoomLevel](v29, "minimumNormalizedZoomLevel");
  v61 = v60;
  v62 = v29;
  -[VKCameraController canvas](v62, "canvas");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v192 = v61;
  objc_msgSend(v63, "size");
  v65 = v64;

  v66 = 0.0;
  if (v65 > 0.0)
  {
    v67 = -[VKMapCameraController tileSize](v62, "tileSize");
    -[VKCameraController canvas](v62, "canvas");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "size");
    v66 = log2((double)v67 / v69);

  }
  -[VKMapCameraController maximumNormalizedZoomLevel](v62, "maximumNormalizedZoomLevel");
  v71 = v70;
  v72 = v62;
  -[VKCameraController canvas](v72, "canvas");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "size");
  v75 = v74;

  v76 = 0.0;
  if (v75 > 0.0)
  {
    v77 = -[VKMapCameraController tileSize](v72, "tileSize");
    -[VKCameraController canvas](v72, "canvas");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "size");
    v76 = log2((double)v77 / v79);

  }
  v80 = v76 + v71;

  v81 = v80;
  v82 = fmin(v25, v80);
  if (v44)
    v83 = v82;
  else
    v83 = v80;
  v84 = v29->_mapEngine;
  if (v84)
  {
    v85 = *((_QWORD *)v84 + 112);
    if (v85)
    {
      v86 = *(_QWORD *)(v85 + 272);
      if (v86)
      {
        if (*(_BYTE *)(v86 + 344))
        {
          v87 = v72;
          -[VKCameraController canvas](v87, "canvas");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "size");
          v90 = v89;

          v91 = 0.0;
          if (v90 > 0.0)
          {
            v92 = -[VKMapCameraController tileSize](v87, "tileSize");
            -[VKCameraController canvas](v87, "canvas");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "size");
            v91 = log2((double)v92 / v94);

          }
          v95 = v91 + 25.0;
          v83 = v95;
          v84 = v29->_mapEngine;
        }
      }
    }
    v96 = (int8x8_t *)*((_QWORD *)v84 + 140);
    v97 = v96[2];
    if (v97)
    {
      v98 = (uint8x8_t)vcnt_s8(v97);
      v98.i16[0] = vaddlv_u8(v98);
      if (v98.u32[0] > 1uLL)
      {
        v99 = 0xEC9B77B4222D22FFLL;
        if (*(_QWORD *)&v97 <= 0xEC9B77B4222D22FFLL)
          v99 = 0xEC9B77B4222D22FFLL % *(_QWORD *)&v97;
      }
      else
      {
        v99 = (*(_QWORD *)&v97 - 1) & 0xEC9B77B4222D22FFLL;
      }
      v100 = *(_QWORD **)(*(_QWORD *)&v96[1] + 8 * v99);
      if (v100)
      {
        v101 = (_QWORD *)*v100;
        if (v101)
        {
          if (v98.u32[0] < 2uLL)
          {
            v102 = *(_QWORD *)&v97 - 1;
            while (1)
            {
              v104 = v101[1];
              if (v104 == 0xEC9B77B4222D22FFLL)
              {
                if (v101[2] == 0xEC9B77B4222D22FFLL)
                  goto LABEL_69;
              }
              else if ((v104 & v102) != v99)
              {
                goto LABEL_75;
              }
              v101 = (_QWORD *)*v101;
              if (!v101)
                goto LABEL_75;
            }
          }
          do
          {
            v103 = v101[1];
            if (v103 == 0xEC9B77B4222D22FFLL)
            {
              if (v101[2] == 0xEC9B77B4222D22FFLL)
              {
LABEL_69:
                v105 = v101[5];
                if (v105 && *(_BYTE *)(v105 + 56) && *(_QWORD *)(v105 + 568))
                {
                  v106 = *(double *)(v105 + 584);
                  v107 = v72;
                  -[VKCameraController canvas](v107, "canvas");
                  v108 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v108, "size");
                  v110 = v109;

                  v111 = 0.0;
                  if (v110 > 0.0)
                  {
                    v112 = -[VKMapCameraController tileSize](v107, "tileSize");
                    -[VKCameraController canvas](v107, "canvas");
                    v113 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v113, "size");
                    v111 = log2((double)v112 / v114);

                  }
                  v115 = fmin(fmax(v106 * 1048576.0 + -0.5, 0.0), 1.0);

                  v116 = v111 + 23.0;
                  v117 = 1.0 - cos(v115 * 3.14159265);
                  v83 = v116 + (v81 - v116) * (float)(v117 * 0.5);
                }
                break;
              }
            }
            else
            {
              if (v103 >= *(_QWORD *)&v97)
                v103 %= *(_QWORD *)&v97;
              if (v103 != v99)
                break;
            }
            v101 = (_QWORD *)*v101;
          }
          while (v101);
        }
      }
    }
  }
LABEL_75:
  LOBYTE(v215) = 0;
  v217 = 0;
  -[VKCameraController vkCamera](v72, "vkCamera");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = v118;
  if (v118)
  {
    objc_msgSend(v118, "minDistanceToGroundRestriction");
    LOBYTE(v215) = 1;
    v216 = *((double *)&v204 + 1);
    LOBYTE(v204) = 0;
    v120 = 0;
  }
  else
  {
    v204 = 0uLL;
    v120 = 1;
  }

  -[VKCameraController vkCamera](v72, "vkCamera");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = v121;
  if (v121)
  {
    objc_msgSend(v121, "maxDistanceToGroundRestriction");
    if ((_BYTE)v204)
    {
      v217 = 1;
      v218 = *((_QWORD *)&v204 + 1);
      LOBYTE(v204) = 0;
    }

    if ((v120 & 1) != 0)
      goto LABEL_87;
    goto LABEL_84;
  }
  v204 = 0uLL;

  if ((v120 & 1) == 0)
  {
LABEL_84:
    v123 = v72;
    -[VKCameraController canvas](v123, "canvas");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "size");
    v126 = v125;

    v127 = 0.0;
    if (v126 > 0.0)
    {
      v128 = -[VKMapCameraController tileSize](v123, "tileSize");
      -[VKCameraController canvas](v123, "canvas");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "size");
      v127 = log2((double)v128 / v130);

    }
    v131 = v127 + 25.0;

    v83 = fmax(v83, v131);
  }
LABEL_87:
  v132 = -[VKMapCameraController tileSize](v72, "tileSize");
  -[VKCameraController canvas](v72, "canvas");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "size");
  v135 = v66 + v192;
  v213 = (double)v132;
  v214 = v134;
  v136 = 0.0;
  if (v134 > 0.0)
  {
    v137 = v134;
    v138 = (float)v132;
    v136 = log2f(v137 / v138);
  }
  v139 = fminf(fmaxf(v136 + v135, 1.0), 25.0);
  v212 = v139;

  v140 = -[VKMapCameraController tileSize](v72, "tileSize");
  -[VKCameraController canvas](v72, "canvas");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "size");
  v210 = (double)v140;
  v211 = v142;
  v144 = 0.0;
  if (v142 > 0.0)
  {
    v145 = v142;
    v146 = (float)v140;
    v144 = log2f(v145 / v146);
  }
  v143 = v83;
  v209 = fminf(fmaxf(v144 + v143, 1.0), 25.0);

  -[VKCameraController camera](v72, "camera");
  v147 = v202;
  -[VKCameraController camera](v72, "camera");
  v149 = v199[46];
  v148 = v199[47];
  if (v148 >= v149)
  {
    v155 = v199[57];
  }
  else
  {
    v150 = v148 * v149;
    v151 = v148 / v149;
    if (v150 <= 0.0)
      v152 = 1.0;
    else
      v152 = v151;
    v153 = tan(v199[57] * 0.5);
    v154 = atan(v152 * v153);
    v155 = v154 + v154;
  }
  v201 = v155;
  -[VKCameraController camera](v72, "camera");
  v156 = v196[46];
  v157 = v196[47];
  if (v156 >= v157)
  {
    v163 = v196[57];
  }
  else
  {
    v158 = v157 * v156;
    v159 = v156 / v157;
    if (v158 <= 0.0)
      v160 = 1.0;
    else
      v160 = v159;
    v161 = tan(v196[57] * 0.5);
    v162 = atan(v160 * v161);
    v163 = v162 + v162;
  }
  v198 = v163;
  -[VKCameraController camera](v72, "camera");
  v164 = v194[1];
  *(double *)v194 = v51;
  *(float *)&v165 = v139;
  -[VKMapCameraController maxPitchForNormalizedZoomLevel:](v72, "maxPitchForNormalizedZoomLevel:", v165);
  v193 = v166;
  gdc::CameraLimits::CameraLimits((uint64_t)&v204, (double *)(v147 + 8), &v201, &v198, (long double *)(v164 + 40), v194, &v193, (uint64_t)&v212, v58, (uint64_t)&v209, (uint64_t)&v215);
  v167 = v195;
  if (v195)
  {
    v168 = (unint64_t *)&v195->__shared_owners_;
    do
      v169 = __ldaxr(v168);
    while (__stlxr(v169 - 1, v168));
    if (!v169)
    {
      ((void (*)(std::__shared_weak_count *))v167->__on_zero_shared)(v167);
      std::__shared_weak_count::__release_weak(v167);
    }
  }
  v170 = v197;
  if (v197)
  {
    v171 = (unint64_t *)&v197->__shared_owners_;
    do
      v172 = __ldaxr(v171);
    while (__stlxr(v172 - 1, v171));
    if (!v172)
    {
      ((void (*)(std::__shared_weak_count *))v170->__on_zero_shared)(v170);
      std::__shared_weak_count::__release_weak(v170);
    }
  }
  v173 = v200;
  if (v200)
  {
    v174 = (unint64_t *)&v200->__shared_owners_;
    do
      v175 = __ldaxr(v174);
    while (__stlxr(v175 - 1, v174));
    if (!v175)
    {
      ((void (*)(std::__shared_weak_count *))v173->__on_zero_shared)(v173);
      std::__shared_weak_count::__release_weak(v173);
    }
  }
  v176 = v203;
  if (v203)
  {
    v177 = (unint64_t *)&v203->__shared_owners_;
    do
      v178 = __ldaxr(v177);
    while (__stlxr(v178 - 1, v177));
    if (!v178)
    {
      ((void (*)(std::__shared_weak_count *))v176->__on_zero_shared)(v176);
      std::__shared_weak_count::__release_weak(v176);
    }
  }
  v179 = *(double *)&v207;
  -[VKCameraController vkCamera](v72, "vkCamera");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "setMinHeight:", v179);

  v181 = *((double *)&v207 + 1);
  -[VKCameraController vkCamera](v72, "vkCamera");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "setMaxHeight:", v181);

  v183 = v208;
  -[VKCameraController vkCamera](v72, "vkCamera");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "setMaxHeightNoPitch:", v183);

  -[VKCameraController camera](v72, "camera");
  v185 = v207;
  v186 = v202;
  v187 = v203;
  *(_OWORD *)(v202 + 96) = v206;
  *(_OWORD *)(v186 + 112) = v185;
  *(double *)(v186 + 128) = v208;
  v188 = v205;
  *(_OWORD *)(v186 + 64) = v204;
  *(_OWORD *)(v186 + 80) = v188;
  if (v187)
  {
    v189 = (unint64_t *)&v187->__shared_owners_;
    do
      v190 = __ldaxr(v189);
    while (__stlxr(v190 - 1, v189));
    if (!v190)
    {
      ((void (*)(std::__shared_weak_count *))v187->__on_zero_shared)(v187);
      std::__shared_weak_count::__release_weak(v187);
    }
  }
}

- (int64_t)tileSize
{
  _QWORD *mapEngine;
  uint64_t v3;

  mapEngine = self->_mapEngine;
  if (mapEngine && (v3 = mapEngine[112]) != 0)
    return *(_QWORD *)(v3 + 312);
  else
    return 256;
}

- (float)maxPitchForNormalizedZoomLevel:(float)a3
{
  void *v5;
  char v6;
  float result;
  _QWORD *mapEngine;
  uint64_t v9;

  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "relaxTiltLimits");

  if ((v6 & 1) != 0)
    return 1.4835;
  mapEngine = self->_mapEngine;
  result = 0.0;
  if (mapEngine)
  {
    v9 = mapEngine[149];
    if (v9)
      return pitchForZ((_QWORD *)(v9 + 408), a3);
  }
  return result;
}

- (float)minimumPitchForNormalizedZoomLevel:(float)a3
{
  _QWORD *mapEngine;
  uint64_t v4;

  mapEngine = self->_mapEngine;
  if (mapEngine && (v4 = mapEngine[149]) != 0)
    return pitchForZ((_QWORD *)(v4 + 384), a3);
  else
    return 0.0;
}

- (float)minimumNormalizedZoomLevel
{
  _QWORD *mapEngine;
  float v3;
  int8x8_t *v4;
  int8x8_t v5;
  uint8x8_t v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v15;

  mapEngine = self->_mapEngine;
  v3 = 1.0;
  if (!mapEngine)
    return fmaxf(v3, 1.0);
  if (!mapEngine[149])
    return fmaxf(v3, 1.0);
  v4 = (int8x8_t *)mapEngine[140];
  v5 = v4[2];
  if (!*(_QWORD *)&v5)
    return fmaxf(v3, 1.0);
  v6 = (uint8x8_t)vcnt_s8(v5);
  v6.i16[0] = vaddlv_u8(v6);
  v7 = v6.u32[0];
  if (v6.u32[0] > 1uLL)
  {
    v8 = 0xAF46DE79C836B0D8;
    if (*(_QWORD *)&v5 <= 0xAF46DE79C836B0D8)
      v8 = 0xAF46DE79C836B0D8 % *(_QWORD *)&v5;
  }
  else
  {
    v8 = (*(_QWORD *)&v5 - 1) & 0xAF46DE79C836B0D8;
  }
  v9 = *(_QWORD **)(*(_QWORD *)&v4[1] + 8 * v8);
  v3 = 1.0;
  if (!v9)
    return fmaxf(v3, 1.0);
  v10 = (_QWORD *)*v9;
  if (!v10)
    return fmaxf(v3, 1.0);
  if (v7 < 2)
  {
    v11 = *(_QWORD *)&v5 - 1;
    while (1)
    {
      v13 = v10[1];
      if (v13 == 0xAF46DE79C836B0D8)
      {
        if (v10[2] == 0xAF46DE79C836B0D8)
          goto LABEL_24;
      }
      else if ((v13 & v11) != v8)
      {
        return fmaxf(1.0, 1.0);
      }
      v10 = (_QWORD *)*v10;
      if (!v10)
        return fmaxf(1.0, 1.0);
    }
  }
  while (1)
  {
    v12 = v10[1];
    if (v12 == 0xAF46DE79C836B0D8)
      break;
    if (v12 >= *(_QWORD *)&v5)
      v12 %= *(_QWORD *)&v5;
    if (v12 != v8)
      return fmaxf(1.0, 1.0);
LABEL_13:
    v10 = (_QWORD *)*v10;
    if (!v10)
      return fmaxf(1.0, 1.0);
  }
  if (v10[2] != 0xAF46DE79C836B0D8)
    goto LABEL_13;
LABEL_24:
  v15 = v10[5];
  v3 = 1.0;
  if (v15)
    v3 = (float)*(unsigned int *)(v15 + 312);
  return fmaxf(v3, 1.0);
}

- (float)maximumNormalizedZoomLevel
{
  _QWORD *mapEngine;
  uint64_t v4;
  float v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v11;
  void *v12;
  int v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  uint64_t v20;

  mapEngine = self->_mapEngine;
  if (!mapEngine)
    return 20.0;
  v4 = mapEngine[149];
  if (v4)
    v5 = (float)*(unsigned int *)(v4 + 52);
  else
    v5 = 20.0;
  v6 = (uint64_t *)mapEngine[141];
  v7 = *v6;
  v8 = v6[1];
  if (v7 != v8)
  {
    while (*(_BYTE *)v7 != 20)
    {
      v7 += 16;
      if (v7 == v8)
        return v5;
    }
  }
  if (v7 != v8)
  {
    v9 = *(_DWORD *)(v7 + 8);
    if ((v9 - 1) < 4 || v9 == 10)
    {
      objc_msgSend(MEMORY[0x1E0D27008], "sharedConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "countryCode");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("KR"));

      if (v13)
      {
        if (_southKoreaRect(void)::onceToken != -1)
          dispatch_once(&_southKoreaRect(void)::onceToken, &__block_literal_global_249);
        -[VKCameraController vkCamera](self, "vkCamera", _southKoreaRect(void)::koreaRect, _southKoreaRect(void)::koreaRect, _southKoreaRect(void)::koreaRect, _southKoreaRect(void)::koreaRect);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "footprint");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "rejectsRect:", &v20);

        if ((v17 & 1) == 0)
        {
          v18 = (uint64_t)log2f(128.0 / (float)-[VKMapCameraController tileSize](self, "tileSize"));
          if (v18 <= -14)
            v18 = -14;
          return fminf(v5, (float)(v18 + 15));
        }
      }
    }
  }
  return v5;
}

- (void)_jumpToCenterPoint:()Matrix<double pitchRadians:()3 yawRadians:(1>)a3
{
  double v7;
  double v8;
  double v9;
  _BOOL4 v11;
  __double2 v12;
  __double2 v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  int64x2_t v19;
  double v22;
  __int128 v23;
  void *v24;
  double *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v30;
  _BOOL8 v31;
  void *v32;
  double v33[3];
  __int128 v34;
  __int128 v35;
  double v36[3];
  double v37;
  double v38;
  double v39;
  double v40;
  Matrix<double, 3, 1> v41;
  int64x2_t v42[2];

  v7 = a3._e[2];
  v8 = a3._e[1];
  v9 = a3._e[0];
  v41 = a3;
  -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
  v11 = -[VKMapCameraController isPitched](self, "isPitched");
  v12 = __sincos_stret(a4 * 0.5);
  v13 = __sincos_stret(a5 * 0.5);
  v37 = v13.__cosval * v12.__sinval;
  v38 = v13.__sinval * v12.__sinval;
  v39 = v13.__sinval * v12.__cosval;
  v40 = v13.__cosval * v12.__cosval;
  -[VKCameraController vkCamera](self, "vkCamera");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOrientation:", &v37);

  v15 = v38 * v7 + v38 * v7;
  v16 = v7 * -2.0 * v37;
  v36[0] = v9 - v16 * v39 + v15 * v40;
  v36[1] = v8 + v16 * v40 + v15 * v39;
  v36[2] = v7 + v16 * v37 - v15 * v38;
  -[VKCameraController vkCamera](self, "vkCamera");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPosition:", v36);

  -[VKCameraController vkCamera](self, "vkCamera");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
  if (v18)
  {
    objc_msgSend(v18, "groundPointFromScreenPoint:");
  }
  else
  {
    v34 = 0u;
    v35 = 0u;
  }

  v19 = vdupq_n_s64(0x7FF8000000000000uLL);
  v42[0] = v19;
  if (*(_QWORD *)&v41._e[0] != v19.i64[0]
    || *(_QWORD *)&v41._e[1] != v19.i64[1]
    || *(_QWORD *)&v41._e[2] != 0x7FF8000000000000)
  {
    v22 = *((double *)&v34 + 1);
    v23 = v35;
    -[VKCameraController vkCamera](self, "vkCamera");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (double *)objc_msgSend(v24, "position");
    v26 = v25[1];
    v27 = v25[2] - *((double *)&v23 + 1);
    v33[0] = v9 - v22 + *v25;
    v33[1] = v8 - *(double *)&v23 + v26;
    v33[2] = v27;
    -[VKCameraController vkCamera](self, "vkCamera");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setPosition:", v33);

  }
  -[VKMapCameraController updateCameraZBounds](self, "updateCameraZBounds");
  -[VKScreenCameraController clampZoomLevelIfNecessary](self, "clampZoomLevelIfNecessary");
  -[VKCameraController cameraDelegate](self, "cameraDelegate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "mapLayerDidChangeVisibleRegion");

  v30 = *(_QWORD *)-[VKCameraController runLoopController](self, "runLoopController");
  if (v30)
  {
    v42[0].i8[0] = 4;
    md::MapEngine::setNeedsTick(v30, v42);
  }
  v31 = -[VKMapCameraController isPitched](self, "isPitched");
  if (v11 != v31)
  {
    -[VKCameraController cameraDelegate](self, "cameraDelegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "mapLayerDidBecomePitched:", v31);

  }
  -[VKCameraController endRegionChange](self, "endRegionChange");
}

- (BOOL)isPitched
{
  void *v2;
  double v3;
  BOOL v4;

  -[VKCameraController vkCamera](self, "vkCamera");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pitch");
  v4 = v3 > 0.0001;

  return v4;
}

- (BOOL)canEnter3DMode
{
  int v3;
  int v4;
  float v5;
  float v6;
  double v7;
  float v8;

  -[VKMapCameraController updateCameraZBounds](self, "updateCameraZBounds");
  -[VKMapCameraController currentNormalizedZoomLevel](self, "currentNormalizedZoomLevel");
  v4 = v3;
  -[VKMapCameraController minimumPitchForNormalizedZoomLevel:](self, "minimumPitchForNormalizedZoomLevel:");
  v6 = v5;
  LODWORD(v7) = v4;
  -[VKMapCameraController maxPitchForNormalizedZoomLevel:](self, "maxPitchForNormalizedZoomLevel:", v7);
  return v8 > v6;
}

- (double)zoomLevelAdjustmentForTileSize:(int64_t)a3
{
  float v3;

  -[VKMapCameraController normalizedZoomLevelAdjustmentForTileSize:](self, "normalizedZoomLevelAdjustmentForTileSize:", a3);
  return v3;
}

- (float)normalizedZoomLevelAdjustmentForTileSize:(int64_t)a3
{
  int64_t v4;
  int v5;

  v4 = -[VKMapCameraController tileSize](self, "tileSize");
  v5 = 0;
  if (a3 && v4)
  {
    if (v4 <= a3)
    {
      v5 = 0;
    }
    else
    {
      v5 = 0;
      do
      {
        ++v5;
        a3 *= 2;
      }
      while (a3 < v4);
    }
    while (a3 > v4)
    {
      --v5;
      v4 *= 2;
    }
  }
  return (float)v5;
}

- (double)currentZoomLevel
{
  float v2;

  -[VKMapCameraController currentNormalizedZoomLevel](self, "currentNormalizedZoomLevel");
  return v2;
}

- (float)currentNormalizedZoomLevel
{
  float v3;
  float v4;
  VKMapCameraController *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;

  -[VKMapCameraController currentDisplayZoomLevel](self, "currentDisplayZoomLevel");
  v4 = v3;
  v5 = self;
  -[VKCameraController canvas](v5, "canvas");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "size");
  v8 = v7;

  v9 = 0.0;
  if (v8 > 0.0)
  {
    -[VKCameraController canvas](v5, "canvas");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "size");
    v9 = log2(v11 / (double)-[VKMapCameraController tileSize](v5, "tileSize"));

  }
  return v9 + v4;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  void *v7;
  double v8;
  void *v9;
  long double v10;
  long double v11;
  double v12;
  long double v13;
  long double v14;
  double v15;
  _OWORD v16[5];
  VKCameraState v17;
  CGPoint v18;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
  v4 = v3;
  v6 = v5;
  -[VKCameraController vkCamera](self, "vkCamera");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (v7)
    objc_msgSend(v7, "cameraState");
  else
    memset(v16, 0, sizeof(v16));
  v18.x = v4;
  v18.y = v6;
  VKCameraMakeGroundPoint(&v17, v18, v8, (double *)v16);

  if (LOBYTE(v17.var0._translation._e[0]))
  {
    v10 = v17.var0._translation._e[1] * 6.28318531;
    v11 = exp(v17.var0._translation._e[2] * 6.28318531 + -3.14159265);
    v12 = atan(v11);
    v13 = fmod(v10, 6.28318531);
    v14 = fmod(v13 + 6.28318531, 6.28318531) * 57.2957795 + -180.0;
    v15 = v12 * 114.591559 + -90.0;
  }
  else
  {
    v14 = -180.0;
    v15 = -180.0;
  }
  result.var1 = v14;
  result.var0 = v15;
  return result;
}

- (double)pitch
{
  VKTimedAnimation *regionAnimation;
  double v4;
  void *v5;
  double v6;

  regionAnimation = self->super._regionAnimation;
  if (regionAnimation && -[VKAnimation running](regionAnimation, "running"))
    return self->_finalPitch;
  -[VKCameraController vkCamera](self, "vkCamera");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pitch");
  v4 = v6 * 57.2957795;

  return v4;
}

- (float)currentDisplayZoomLevel
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  long double v23;
  float v24;
  float v25;
  double v27;

  -[VKCameraController vkCamera](self, "vkCamera");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "footprint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nearestGroundPoint");
  v27 = v5;
  v7 = v6;
  v9 = v8;

  -[VKCameraController vkCamera](self, "vkCamera");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (double *)objc_msgSend(v10, "position");
  v12 = *v11;
  v13 = v11[1];
  v14 = v11[2];

  -[VKCameraController vkCamera](self, "vkCamera");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "forwardVector");
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[VKCameraController vkCamera](self, "vkCamera");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "widthOfViewAtDepth:", v17 * (v9 - v12) + v19 * (v7 - v13) + v21 * (v27 - v14));
  v24 = 0.0;
  if (v23 > 0.0)
  {
    v25 = log2(v23);
    v24 = -v25;
  }

  return v24;
}

- (double)heading
{
  VKTimedAnimation *regionAnimation;
  double v4;
  void *v5;
  double v6;

  regionAnimation = self->super._regionAnimation;
  if (regionAnimation && -[VKAnimation running](regionAnimation, "running"))
    return self->_finalYaw;
  -[VKCameraController vkCamera](self, "vkCamera");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "yaw");
  v4 = v6 * 57.2957795;

  return v4;
}

- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4
{
  _QWORD *mapEngine;
  int8x8_t *v5;
  int8x8_t v6;
  uint8x8_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;

  mapEngine = self->_mapEngine;
  if (mapEngine)
  {
    v5 = (int8x8_t *)mapEngine[140];
    v6 = v5[2];
    if (v6)
    {
      v7 = (uint8x8_t)vcnt_s8(v6);
      v7.i16[0] = vaddlv_u8(v7);
      if (v7.u32[0] > 1uLL)
      {
        v8 = 0x17767EADC5B287BLL;
        if (*(_QWORD *)&v6 <= 0x17767EADC5B287BuLL)
          v8 = 0x17767EADC5B287BuLL % *(_QWORD *)&v6;
      }
      else
      {
        v8 = (*(_QWORD *)&v6 - 1) & 0x17767EADC5B287BLL;
      }
      v9 = *(_QWORD **)(*(_QWORD *)&v5[1] + 8 * v8);
      if (v9)
      {
        v10 = (_QWORD *)*v9;
        if (v10)
        {
          if (v7.u32[0] < 2uLL)
          {
            v11 = *(_QWORD *)&v6 - 1;
            while (1)
            {
              v13 = v10[1];
              if (v13 == 0x17767EADC5B287BLL)
              {
                if (v10[2] == 0x17767EADC5B287BLL)
                  goto LABEL_23;
              }
              else if ((v13 & v11) != v8)
              {
                return;
              }
              v10 = (_QWORD *)*v10;
              if (!v10)
                return;
            }
          }
          do
          {
            v12 = v10[1];
            if (v12 == 0x17767EADC5B287BLL)
            {
              if (v10[2] == 0x17767EADC5B287BLL)
              {
LABEL_23:
                v14 = v10[5];
                if (v14)
                  *(_DWORD *)(v14 + 288) = 3;
                return;
              }
            }
            else
            {
              if (v12 >= *(_QWORD *)&v6)
                v12 %= *(_QWORD *)&v6;
              if (v12 != v8)
                return;
            }
            v10 = (_QWORD *)*v10;
          }
          while (v10);
        }
      }
    }
  }
}

- (double)maximumZoomLevel
{
  float v2;

  -[VKMapCameraController currentMaximumNormalizedZoomLevel](self, "currentMaximumNormalizedZoomLevel");
  return v2;
}

- (float)currentMaximumNormalizedZoomLevel
{
  unint64_t *p_shared_owners;
  unint64_t v4;
  float v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v9;
  std::__shared_weak_count *v10;

  -[VKCameraController camera](self, "camera");
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)())v10->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v10);
      if (v9)
        goto LABEL_6;
      return 25.0;
    }
  }
  if (!v9)
    return 25.0;
LABEL_6:
  -[VKCameraController camera](self, "camera");
  v5 = floorf(*(float *)(v9 + 80) * 1000.0);
  if (v10)
  {
    v6 = (unint64_t *)&v10->__shared_owners_;
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)())v10->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  return v5 * 0.001;
}

- (void)setMapEngine:(void *)a3
{
  self->_mapEngine = a3;
}

- (BOOL)canRotate
{
  float v2;

  -[VKMapCameraController currentStyleZoomLevel](self, "currentStyleZoomLevel");
  return v2 > 6.0;
}

- (float)currentStyleZoomLevel
{
  float v3;
  float v4;
  uint64_t v5;
  int v6;
  uint64_t i;

  -[VKMapCameraController currentNormalizedZoomLevel](self, "currentNormalizedZoomLevel");
  v4 = v3;
  v5 = -[VKMapCameraController tileSize](self, "tileSize");
  if (v5)
  {
    if (v5 < 513)
    {
      v6 = 0;
      i = 512;
    }
    else
    {
      v6 = 0;
      for (i = 512; i < v5; i *= 2)
        ++v6;
    }
    while (i > v5)
    {
      --v6;
      v5 *= 2;
    }
  }
  else
  {
    v6 = 0;
  }
  return v4 + (float)v6;
}

- (void)setCamera:(shared_ptr<gdc::Camera>)a3
{
  Camera *ptr;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  double *v11;
  void *v12;
  void *v13;
  double v14[3];
  uint64_t v15;
  objc_super v16;
  uint64_t v17;
  std::__shared_weak_count *v18;

  ptr = a3.__ptr_;
  v5 = (std::__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  v17 = *(_QWORD *)a3.__ptr_;
  v18 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  v16.receiver = self;
  v16.super_class = (Class)VKMapCameraController;
  -[VKScreenCameraController setCamera:](&v16, sel_setCamera_, &v17, a3.__cntrl_);
  v8 = v18;
  if (!v18)
    goto LABEL_8;
  v9 = (unint64_t *)&v18->__shared_owners_;
  do
    v10 = __ldaxr(v9);
  while (__stlxr(v10 - 1, v9));
  if (!v10)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
    v11 = *(double **)ptr;
    if (!*(_QWORD *)ptr)
      return;
  }
  else
  {
LABEL_8:
    v11 = *(double **)ptr;
    if (!*(_QWORD *)ptr)
      return;
  }
  -[VKCameraController vkCamera](self, "vkCamera", gdc::CameraFrame<geo::Radians,double>::toRigidTransformMercator(v14, v11 + 1, *(unsigned __int8 *)v11 == 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPosition:", v14);

  -[VKCameraController vkCamera](self, "vkCamera");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setOrientation:", &v15);

}

void __103__VKMapCameraController__animateToPosition_pitch_yaw_duration_timingCurve_forceDestination_completion___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained;
  void *v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  long double v12;
  long double v13;
  long double v14;
  double v15;
  __double2 v16;
  __double2 v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  __int128 v28;
  void *v29;
  double *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40[3];
  __int128 v41;
  __int128 v42;
  double v43[3];
  double v44;
  double v45;
  double v46;
  double v47;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = objc_msgSend(WeakRetained, "isPitched");
    v7 = a2;
    v9 = *(double *)(a1 + 48);
    v8 = *(double *)(a1 + 56);
    v10 = *(double *)(a1 + 64);
    v37 = *(double *)(a1 + 72);
    v38 = *(double *)(a1 + 80);
    v11 = *(double *)(a1 + 96);
    v39 = *(double *)(a1 + 88);
    v12 = fmod(3.14159265 - v11 + *(double *)(a1 + 104), 6.28318531);
    v13 = fmod(v12 + 6.28318531, 6.28318531);
    v14 = fmod(v11 + 3.14159265 + (v13 + -3.14159265) * a2, 6.28318531);
    v15 = fmod(v14 + 6.28318531, 6.28318531);
    v16 = __sincos_stret((*(double *)(a1 + 112) + (*(double *)(a1 + 120) - *(double *)(a1 + 112)) * v7) * 0.5);
    v17 = __sincos_stret(v15 * 0.5 + -1.57079633);
    v44 = v17.__cosval * v16.__sinval;
    v45 = v17.__sinval * v16.__sinval;
    v46 = v17.__sinval * v16.__cosval;
    v47 = v17.__cosval * v16.__cosval;
    objc_msgSend(v5, "vkCamera");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setOrientation:", &v44);
    v19 = v9 + (v37 - v9) * v7;
    v20 = v8 + (v38 - v8) * v7;
    v21 = v10 + (v39 - v10) * v7;

    v22 = *(double *)(a1 + 128) + (*(double *)(a1 + 136) - *(double *)(a1 + 128)) * v7;
    v23 = (v22 - v21) * (v45 + v45);
    v24 = v44 * -2.0 * (v22 - v21);
    v43[0] = v19 + v23 * v47 - v24 * v46;
    v43[1] = v20 + v23 * v46 + v24 * v47;
    v43[2] = v22 + v24 * v44 - v23 * v45;
    objc_msgSend(v5, "vkCamera");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setPosition:", v43);

    objc_msgSend(v5, "clampZoomLevelIfNecessary");
    objc_msgSend(v5, "vkCamera");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centerScreenPoint");
    if (v26)
    {
      objc_msgSend(v26, "groundPointFromScreenPoint:");
    }
    else
    {
      v41 = 0u;
      v42 = 0u;
    }

    if ((_BYTE)v41)
    {
      v27 = *((double *)&v41 + 1);
      v28 = v42;
      objc_msgSend(v5, "vkCamera");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (double *)objc_msgSend(v29, "position");
      v31 = v30[1];
      v32 = v30[2];
      v40[0] = v19 - v27 + *v30;
      v40[1] = v20 - *(double *)&v28 + v31;
      v40[2] = v21 - *((double *)&v28 + 1) + v32;
      objc_msgSend(v5, "vkCamera");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setPosition:", v40);

    }
    objc_msgSend(v5, "clampZoomLevelIfNecessary", *(_QWORD *)&v37, *(_QWORD *)&v38, *(_QWORD *)&v39);
    objc_msgSend(v5, "cameraDelegate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "mapLayerDidChangeVisibleRegion");

    v35 = objc_msgSend(v5, "isPitched");
    if (v6 != (_DWORD)v35)
    {
      objc_msgSend(v5, "cameraDelegate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "mapLayerDidBecomePitched:", v35);

    }
  }

}

- (void)clampZoomLevelIfNecessaryAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  VKAnimation *zoomAnimation;
  void *v27;
  void *v28;
  uint64_t v29;
  VKSpringAnimation *v30;
  double v31;
  double v32;
  float v33;
  double v34;
  double v35;
  VKSpringAnimation *v36;
  uint64_t v37;
  VKSpringAnimation *v38;
  double v39;
  double v40;
  void *v41;
  __int128 v42;
  float64x2_t v43;
  _QWORD v44[4];
  VKSpringAnimation *v45;
  VKMapCameraController *v46;
  _QWORD v47[5];
  __int128 v48;
  uint64_t v49;
  float64x2_t v50;
  double v51;
  float64x2_t v52;
  double v53;
  _QWORD v54[4];
  __int128 v55;
  uint64_t v56;
  uint64_t v57;

  v3 = a3;
  v57 = *MEMORY[0x1E0C80C00];
  if (!-[VKGestureCameraBehavior isPinching](self->super._gestureCameraControllerBehavior, "isPinching")
    || !-[VKGestureCameraBehavior allowsZoomRubberbanding](self->super._gestureCameraControllerBehavior, "allowsZoomRubberbanding"))
  {
    -[VKMapCameraController updateCameraZBounds](self, "updateCameraZBounds");
    -[VKCameraController vkCamera](self, "vkCamera");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[VKCameraController vkCamera](self, "vkCamera");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(double *)(objc_msgSend(v6, "position") + 16);
      -[VKCameraController vkCamera](self, "vkCamera");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "minHeight");
      if (v7 >= v9)
      {
        -[VKCameraController vkCamera](self, "vkCamera");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(double *)(objc_msgSend(v10, "position") + 16);
        -[VKCameraController vkCamera](self, "vkCamera");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "maxHeight");
        v14 = v13;

        if (v11 <= v14)
          return;
      }
      else
      {

      }
      -[VKCameraController vkCamera](self, "vkCamera");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
      if (v15)
        objc_msgSend(v15, "groundPointFromScreenPoint:");
      else
        memset(v54, 0, sizeof(v54));

      if (LOBYTE(v54[0]))
      {
        -[VKCameraController vkCamera](self, "vkCamera");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "position");
        v42 = *(_OWORD *)v17;
        v18 = *(double *)(v17 + 16);

        -[VKCameraController vkCamera](self, "vkCamera");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "minHeight");
        if (v18 >= v20)
        {
          -[VKCameraController vkCamera](self, "vkCamera", v42);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "maxHeight");
        }
        else
        {
          -[VKCameraController vkCamera](self, "vkCamera", v42);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "minHeight");
        }
        v39 = v22;

        v40 = (v18 - v39) / v18;
        v52 = vmlaq_n_f64(v43, vsubq_f64(*(float64x2_t *)&v54[1], v43), v40);
        v53 = v18 + (*(double *)&v54[3] - v18) * v40;
        if (!v3)
          goto LABEL_17;
      }
      else
      {
        -[VKCameraController vkCamera](self, "vkCamera");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = *(float64x2_t *)objc_msgSend(v23, "position");

        -[VKCameraController vkCamera](self, "vkCamera");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "minHeight");
        v53 = v25;

        if (!v3)
        {
LABEL_17:
          -[VKCameraController vkCamera](self, "vkCamera");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setPosition:", &v52);

          goto LABEL_18;
        }
      }
      -[VKAnimation stop](self->super._zoomAnimation, "stop");
      zoomAnimation = self->super._zoomAnimation;
      self->super._zoomAnimation = 0;

      -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1);
      -[VKCameraController cameraDelegate](self, "cameraDelegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "mapLayerWillPerformZoomBounceAnimation");

      -[VKCameraController vkCamera](self, "vkCamera");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "position");
      v55 = *(_OWORD *)v29;
      v56 = *(_QWORD *)(v29 + 16);

      v30 = [VKSpringAnimation alloc];
      GEOConfigGetDouble();
      v32 = v31;
      GEOConfigGetDouble();
      v33 = v32;
      *(float *)&v35 = v34;
      *(float *)&v34 = v33;
      v36 = -[VKSpringAnimation initWithTension:friction:name:](v30, "initWithTension:friction:name:", CFSTR("rubberband"), v34, v35);
      v37 = MEMORY[0x1E0C809B0];
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __59__VKMapCameraController_clampZoomLevelIfNecessaryAnimated___block_invoke;
      v47[3] = &unk_1E42ED220;
      v47[4] = self;
      v48 = v55;
      v49 = v56;
      v50 = v52;
      v51 = v53;
      -[VKSpringAnimation setStepHandler:](v36, "setStepHandler:", v47);
      v44[0] = v37;
      v44[1] = 3221225472;
      v44[2] = __59__VKMapCameraController_clampZoomLevelIfNecessaryAnimated___block_invoke_2;
      v44[3] = &unk_1E42ED270;
      v38 = v36;
      v45 = v38;
      v46 = self;
      -[VKAnimation setCompletionHandler:](v38, "setCompletionHandler:", v44);
      objc_storeStrong((id *)&self->super._zoomAnimation, v36);
      self->super._zoomAnimationCanBeInterrupted = 1;
      md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), self->super._zoomAnimation);

LABEL_18:
      -[VKMapCameraController updateCameraZBounds](self, "updateCameraZBounds");
    }
  }
}

- (void)mapEngine
{
  return self->_mapEngine;
}

- (VKMapCameraController)initWithMapDataAccess:(void *)a3 animationRunner:(AnimationRunner *)a4 runLoopController:(RunLoopController *)a5 cameraDelegate:(id)a6
{
  id v10;
  char *v11;
  VKMapCameraController *v12;
  VKMapGestureCameraController *v13;
  VKGestureCameraBehavior *gestureCameraControllerBehavior;
  VKMapCameraController *v15;
  objc_super v17;

  v10 = a6;
  v17.receiver = self;
  v17.super_class = (Class)VKMapCameraController;
  v11 = -[VKScreenCameraController initWithMapDataAccess:animationRunner:runLoopController:cameraDelegate:](&v17, sel_initWithMapDataAccess_animationRunner_runLoopController_cameraDelegate_, a3, a4, a5, v10);
  v12 = (VKMapCameraController *)v11;
  if (v11)
  {
    *((_QWORD *)v11 + 27) = 1;
    *(_OWORD *)(v11 + 200) = VKAnnotationTrackingBehaviorDefault;
    objc_msgSend(v11, "setIsPitchEnabled:", 1);
    v13 = -[VKGestureCameraBehavior initWithCameraController:]([VKMapGestureCameraController alloc], "initWithCameraController:", v12);
    gestureCameraControllerBehavior = v12->super._gestureCameraControllerBehavior;
    v12->super._gestureCameraControllerBehavior = &v13->super;

    v12->_tourShouldResumeWhenDoneGesturing = 1;
    v15 = v12;
  }

  return v12;
}

- (void)setMapRegion:(id)a3 pitch:(double)a4 yaw:(double)a5 duration:(double)a6 timingCurve:(id)a7 completion:(id)a8
{
  id v14;
  void (**v15)(id, uint64_t);
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  long double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  float v39;
  float v40;
  float v41;
  float v42;
  int v43;
  float v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  id v53;

  v53 = a3;
  v14 = a7;
  v15 = (void (**)(id, uint64_t))a8;
  -[VKCameraController canvas](self, "canvas");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "size");
  v18 = v17;

  -[VKCameraController canvas](self, "canvas");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "size");
  v21 = v20;

  if (v18 <= 0.0 || v21 <= 0.0)
  {
    if (v15)
      v15[2](v15, 1);
  }
  else
  {
    v50 = v21;
    v51 = v18;
    v52 = a4;
    -[VKMapCameraController _mercatorCenterCoordinateForMapRegion:](self, "_mercatorCenterCoordinateForMapRegion:", v53);
    v49 = v22;
    v24 = tan(v23 * 0.00872664626 + 0.785398163);
    v48 = log(v24);
    GEOMapRectForMapRegion();
    v27 = v26;
    v28 = v25;
    if (v26 == 0.0 || v25 == 0.0)
    {
      GEOMapPointsPerMeterAtLatitude();
      GEOMapRectInset();
      v27 = v29;
      v28 = v30;
    }
    -[VKCameraController vkCamera](self, "vkCamera");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "tanHalfHorizFOV");
    v33 = v32;

    -[VKCameraController vkCamera](self, "vkCamera");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v33;
    v46 = a5;
    v47 = a6;
    objc_msgSend(v34, "tanHalfVerticalFOV");
    v36 = v35;

    v38 = *MEMORY[0x1E0D266F8];
    v37 = *(double *)(MEMORY[0x1E0D266F8] + 8);
    -[VKCameraController edgeInsets](self, "edgeInsets");
    v40 = v39;
    -[VKCameraController edgeInsets](self, "edgeInsets");
    v42 = v41;
    -[VKCameraController edgeInsets](self, "edgeInsets");
    LODWORD(v33) = v43;
    -[VKCameraController edgeInsets](self, "edgeInsets");
    -[VKMapCameraController _animateToPosition:pitch:yaw:duration:timingCurve:completion:](self, "_animateToPosition:pitch:yaw:duration:timingCurve:completion:", v14, v15, v49 * 0.00277777778 + 0.5, v48 * 0.159154943 + 0.5, fmax(v27 / v38 * 0.5 * (v27 / v38 * 0.5) / (v45 * 0.5 * (v27 / v38 - v27 / v38 * (float)(v42 + v40) / v51)), v28/ v37* 0.5* (v28/ v37* 0.5)/ (v36* 0.5* (v28 / v37 - v28 / v37 * (float)(v44 + *(float *)&v33) / v50))), v52, v46,
      v47);
  }

}

- (void)setCenterCoordinate:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 animationStyle:(int64_t)a8 timingCurve:(id)a9 forceDestination:(BOOL)a10 completion:(id)a11
{
  _BOOL8 v12;
  double var1;
  double var0;
  id v21;
  double v25;
  long double v26;
  double v27;
  double v28;
  long double v29;
  long double v30;
  long double v31;
  long double v32;
  double v33;
  long double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;

  v12 = a10;
  var1 = a3.var1;
  var0 = a3.var0;
  v40 = a9;
  v21 = a11;
  if (var0 <= 90.0 && var0 >= -90.0 && var1 <= 180.0 && var1 >= -180.0)
  {
    v38 = fmax(cos(a6 * 0.0174532925), 0.00001);
    v39 = a5;
    v25 = var0 * 0.00872664626;
    v26 = tan(var0 * 0.00872664626 + 0.785398163);
    v37 = var1 * 0.00277777778 + 0.5;
    v27 = log(v26) * 0.159154943 + 0.5;
    v28 = a7;
    v29 = cos(var0 * 0.034906585) * -559.82 + 111132.92;
    v30 = v29 + cos(var0 * 0.0698131701) * 1.175;
    v31 = v30 + cos(var0 * 0.104719755) * -0.0023;
    v32 = tan(var0 * 0.00872664626 + 0.78103484);
    v33 = log(v32);
    v34 = tan(v25 + 0.789761487);
    v35 = fabs((log(v34) - v33) * 0.159154943) * a4 / (v31 * v38);
    if (a8 == 2)
      v36 = 0.0;
    else
      v36 = v28;
    -[VKMapCameraController _animateToPosition:pitch:yaw:duration:timingCurve:forceDestination:completion:](self, "_animateToPosition:pitch:yaw:duration:timingCurve:forceDestination:completion:", v40, v12, v21, v37, v27, v35, a6, v39, v36, *(_QWORD *)&v37);
  }

}

- (void)_animateToPosition:()Matrix<double pitch:()3 yaw:(1>)a3 duration:(double)a4 timingCurve:(double)a5 forceDestination:(double)a6 completion:(id)a7
{
  void *v9;
  double v12;
  double v13;
  double v14;
  id v16;
  void (**v17)(id, _QWORD);
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  VKMapCameraController *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  double v35;
  id v36;
  void *v37;
  double v38;
  float v39;
  double v40;
  double v41;
  double v42;
  double v43;
  float v44;
  double v45;
  float v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double *v58;
  double v59;
  void *v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  VKTimedAnimation *v87;
  VKTimedAnimation *regionAnimation;
  void *v89;
  double v90;
  double v91;
  uint64_t v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  void *v98;
  _QWORD v100[4];
  void (**v101)(id, _QWORD);
  id v102[6];
  BOOL v103;
  _QWORD v104[4];
  id v105;
  char v106;
  __int128 v107;
  uint64_t v108;
  double v109;
  void *v110;
  uint64_t v111;
  double v112;
  double v113;
  uint64_t v114;
  double v115;
  double v116;
  double v117;
  __int128 v118;
  __int128 v119;
  _OWORD v120[2];
  id location;
  double v122;
  uint64_t v123;
  double v124;
  double v125;
  double v126[2];

  v12 = a3._e[2];
  v13 = a3._e[1];
  v14 = a3._e[0];
  v125 = a5;
  v126[0] = a4;
  v16 = a7;
  v17 = (void (**)(id, _QWORD))a9;
  -[VKAnimation stop](self->super._regionAnimation, "stop");
  if (self->super._regionAnimation)
  {
    if (v17)
      v17[2](v17, 0);
    goto LABEL_72;
  }
  -[VKMapCameraController positionClampedToCameraRestriction:](self, "positionClampedToCameraRestriction:", v14, v13, v12);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[VKCameraController vkCamera](self, "vkCamera");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    objc_msgSend(v24, "minDistanceToGroundRestriction");
    if (LOBYTE(v120[0]))
    {
      LOBYTE(v120[0]) = 0;

      -[VKCameraController vkCamera](self, "vkCamera");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26)
      {
        objc_msgSend(v26, "minDistanceToGroundRestriction");
        v28 = *((double *)v120 + 1);
      }
      else
      {
        v120[0] = 0uLL;
        v28 = 0.0;
      }

      goto LABEL_17;
    }

  }
  v29 = self;
  -[VKCameraController canvas](v29, "canvas");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v21;
  objc_msgSend(v9, "size");
  v32 = v31;

  v33 = 0.0;
  if (v32 > 0.0)
  {
    v34 = -[VKMapCameraController tileSize](v29, "tileSize");
    -[VKCameraController canvas](v29, "canvas");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "size");
    v33 = log2((double)v34 / v35);

  }
  -[VKCameraController vkCamera](v29, "vkCamera");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v36)
  {
    objc_msgSend(v36, "verticalFieldOfView");
    v38 = *(double *)v120 * 0.5;
  }
  else
  {
    v38 = 0.0;
  }
  v39 = v33 + 25.0;
  objc_msgSend(v37, "depthForViewWidth:", (double)exp2(-v39));
  v41 = v40;
  objc_msgSend(v37, "maxPitch");
  v43 = v42;

  v44 = v43 - v38;
  v45 = v41 * cosf(v44);
  v46 = v38;
  v28 = v45 / cosf(v46);

  v21 = v30;
LABEL_17:
  -[VKCameraController vkCamera](self, "vkCamera");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v47;
  v98 = v21;
  if (!v47)
  {
    v50 = 0;
    v120[0] = 0uLL;
LABEL_23:
    v51 = 1.0;
    goto LABEL_24;
  }
  objc_msgSend(v47, "maxDistanceToGroundRestriction");
  if (!LOBYTE(v120[0]))
  {
    v50 = 0;
    goto LABEL_23;
  }
  -[VKCameraController vkCamera](self, "vkCamera");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v49;
  if (v49)
  {
    objc_msgSend(v49, "maxDistanceToGroundRestriction");
    v50 = 1;
    v51 = v124;
  }
  else
  {
    v123 = 0;
    v124 = 0.0;
    v51 = 0.0;
    v50 = 1;
  }
LABEL_24:
  v52 = v28;
  if (v51 > v28)
  {
    -[VKCameraController vkCamera](self, "vkCamera");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v53;
    if (v53)
    {
      objc_msgSend(v53, "maxDistanceToGroundRestriction");
      if ((_BYTE)v118)
      {
        -[VKCameraController vkCamera](self, "vkCamera");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v55;
        if (v55)
        {
          objc_msgSend(v55, "maxDistanceToGroundRestriction");
          v52 = v122;
          if ((_BYTE)location)
            LOBYTE(location) = 0;
        }
        else
        {
          location = 0;
          v122 = 0.0;
          v52 = 0.0;
        }

        LOBYTE(v118) = 0;
        goto LABEL_35;
      }
    }
    else
    {
      v118 = 0uLL;
    }
    v52 = 1.0;
LABEL_35:

  }
  if (v50)
  {
    if ((_BYTE)v123)
      LOBYTE(v123) = 0;

  }
  if (LOBYTE(v120[0]))
    LOBYTE(v120[0]) = 0;

  -[VKCameraController vkCamera](self, "vkCamera");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (double *)objc_msgSend(v57, "position");
  v59 = *v58;
  v96 = v58[1];
  v97 = v58[2];

  -[VKCameraController vkCamera](self, "vkCamera");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = *(double *)objc_msgSend(v60, "position");

  if (v61 - v19 == 0.0)
  {
    v63 = v19;
  }
  else
  {
    -[VKCameraController vkCamera](self, "vkCamera");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (*(double *)objc_msgSend(v62, "position") - v19) / vabdd_f64(v61, v19) + v19;

  }
  v64 = fmin(fmax(v23, v28), v52);
  if ((v64 - v97) * (v64 - v97) + (*(double *)&v98 - v96) * (*(double *)&v98 - v96) + (v63 - v59) * (v63 - v59) < (*(double *)&v98 - v96) * (*(double *)&v98 - v96) + (v19 - v59) * (v19 - v59) + (v64 - v97) * (v64 - v97))
    v19 = v63;
  -[VKMapCameraController clampPitch:yaw:atTargetPositionZ:](self, "clampPitch:yaw:atTargetPositionZ:", v126, &v125, v64);
  v65 = v125;
  v66 = v126[0];
  self->_finalYaw = v125;
  self->_finalPitch = v66;
  self->super._userChangedZoomSinceLastProgrammaticRegionChange = 0;
  -[VKAnnotationTrackingCameraController setHasUserSpecifiedZoomLevel:](self->super._annotationTrackingCameraController, "setHasUserSpecifiedZoomLevel:", 0);
  -[VKAnnotationTrackingCameraController pauseAnimation](self->super._annotationTrackingCameraController, "pauseAnimation");
  v67 = v66 * 0.0174532925;
  v68 = v65 * -0.0174532925;
  if (a6 <= 0.0)
  {
    -[VKMapCameraController _jumpToCenterPoint:pitchRadians:yawRadians:](self, "_jumpToCenterPoint:pitchRadians:yawRadians:", v19, *(double *)&v98, v64, v67, v65 * -0.0174532925);
    -[VKAnnotationTrackingCameraController resumeAnimation](self->super._annotationTrackingCameraController, "resumeAnimation");
    if (v17)
      v17[2](v17, 1);
  }
  else
  {
    -[VKCameraController vkCamera](self, "vkCamera", a6);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
    if (v69)
      objc_msgSend(v69, "groundPointFromScreenPoint:");
    else
      memset(v120, 0, sizeof(v120));

    if (LOBYTE(v120[0]))
    {
      -[VKCameraController vkCamera](self, "vkCamera");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v70;
      if (v70)
      {
        objc_msgSend(v70, "groundPointFromScreenPoint:", 0.5, 0.5);
      }
      else
      {
        v118 = 0u;
        v119 = 0u;
      }

      v93 = *(double *)&v119;
      v94 = *((double *)&v118 + 1);
      v95 = *((double *)&v119 + 1);
      -[VKCameraController vkCamera](self, "vkCamera");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "upVector");
      v74 = v73;
      v76 = v75;
      v78 = v77;

      v79 = -1.0;
      v80 = sqrt(-(v78 * v78 + -1.0));
      v81 = -v76 / v80;
      if (v81 > -1.0)
      {
        v79 = 1.0;
        if (v81 < 1.0)
          v79 = -v76 / v80;
      }
      v82 = acos(v79);
      if (v74 <= 0.0)
        v83 = -v82;
      else
        v83 = v82;
      -[VKCameraController vkCamera](self, "vkCamera");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "pitch");
      v86 = v85;

      v87 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", a6);
      regionAnimation = self->super._regionAnimation;
      self->super._regionAnimation = v87;

      if (v16)
        v89 = v16;
      else
        v89 = VKAnimationCurveEaseInOut;
      -[VKTimedAnimation setTimingFunction:](self->super._regionAnimation, "setTimingFunction:", v89);
      objc_initWeak(&location, self);
      -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1);
      v90 = sqrt((v59 - v94) * (v59 - v94) + (v96 - v93) * (v96 - v93) + (v97 - v95) * (v97 - v95));
      v91 = v83 + 3.14159265;
      v92 = MEMORY[0x1E0C809B0];
      v104[0] = MEMORY[0x1E0C809B0];
      v104[1] = 3321888768;
      v104[2] = __103__VKMapCameraController__animateToPosition_pitch_yaw_duration_timingCurve_forceDestination_completion___block_invoke;
      v104[3] = &unk_1E42E92D8;
      objc_copyWeak(&v105, &location);
      v106 = 0;
      if (LOBYTE(v120[0]))
      {
        v107 = *(_OWORD *)((char *)v120 + 8);
        v108 = *((_QWORD *)&v120[1] + 1);
        v106 = 1;
      }
      v109 = v19;
      v110 = v98;
      v111 = 0;
      v112 = v91;
      v113 = v68;
      v114 = v86;
      v115 = v67;
      v116 = v90;
      v117 = v64;
      -[VKTimedAnimation setStepHandler:](self->super._regionAnimation, "setStepHandler:", v104);
      v100[0] = v92;
      v100[1] = 3221225472;
      v100[2] = __103__VKMapCameraController__animateToPosition_pitch_yaw_duration_timingCurve_forceDestination_completion___block_invoke_23;
      v100[3] = &unk_1E42ED298;
      objc_copyWeak(v102, &location);
      v103 = a8;
      v102[1] = *(id *)&v19;
      v102[2] = v98;
      v102[3] = *(id *)&v64;
      v102[4] = *(id *)&v67;
      v102[5] = *(id *)&v68;
      v101 = v17;
      -[VKAnimation setCompletionHandler:](self->super._regionAnimation, "setCompletionHandler:", v100);
      md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), &self->super._regionAnimation->super);

      objc_destroyWeak(v102);
      if (v106)
        v106 = 0;
      objc_destroyWeak(&v105);
      objc_destroyWeak(&location);
    }
    else
    {
      -[VKAnnotationTrackingCameraController resumeAnimation](self->super._annotationTrackingCameraController, "resumeAnimation");
    }
  }
LABEL_72:

}

- (Matrix<double,)positionClampedToCameraRestriction:()Matrix<double
{
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  Matrix<double, 3, 1> result;

  v3 = a3._e[2];
  v4 = a3._e[1];
  v5 = a3._e[0];
  -[VKScreenCameraController regionRestriction](self, "regionRestriction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clampedPosition:", v5, v4);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  v13 = v3;
  result._e[2] = v13;
  result._e[1] = v12;
  result._e[0] = v11;
  return result;
}

- (void)clampPitch:(double *)a3 yaw:(double *)a4 atTargetPositionZ:(double)a5
{
  double v9;
  double v10;
  void *v11;
  double v12;
  float v13;
  VKMapCameraController *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  float v21;
  double v22;
  float v23;
  float v24;
  double v25;
  _BOOL4 v26;
  uint64_t v27;
  int v28;
  uint64_t i;
  int v30;
  double v31;

  v9 = 0.0;
  v10 = 0.0;
  if (a3)
    v10 = *a3;
  if (a4)
    v9 = *a4;
  -[VKCameraController vkCamera](self, "vkCamera");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tanHalfHorizFOV");
  *(float *)&v12 = v12 * a5;
  v13 = log2f(*(float *)&v12);

  v14 = self;
  -[VKCameraController canvas](v14, "canvas");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "size");
  v17 = v16;

  v18 = 0.0;
  if (v17 > 0.0)
  {
    -[VKCameraController canvas](v14, "canvas");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "size");
    v18 = log2(v20 / (double)-[VKMapCameraController tileSize](v14, "tileSize"));

  }
  v21 = v18 + (float)(-1.0 - v13);

  *(float *)&v22 = v21;
  -[VKMapCameraController maxPitchForNormalizedZoomLevel:](v14, "maxPitchForNormalizedZoomLevel:", v22);
  v24 = v23;
  v25 = fabs(v9 * 0.0174532925);
  v26 = v25 < 2.22507386e-308 || v25 <= v25 * 2.22044605e-14;
  v27 = -[VKMapCameraController tileSize](v14, "tileSize");
  if (v27)
  {
    if (v27 < 513)
    {
      v28 = 0;
      i = 512;
    }
    else
    {
      v28 = 0;
      for (i = 512; i < v27; i *= 2)
        ++v28;
    }
    while (i > v27)
    {
      --v28;
      v27 *= 2;
    }
  }
  else
  {
    v28 = 0;
  }
  v30 = (float)((float)v28 + v21) > 6.0 || v26;
  v31 = 0.0;
  if (v30)
    v31 = v9;
  if (a3)
    *a3 = fmin(v10, v24 * 57.2957795);
  if (a4)
    *a4 = v31;
}

- (void)setCenterCoordinate:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 animationStyle:(int64_t)a8 timingCurve:(id)a9 completion:(id)a10
{
  -[VKMapCameraController setCenterCoordinate:altitude:yaw:pitch:duration:animationStyle:timingCurve:forceDestination:completion:](self, "setCenterCoordinate:altitude:yaw:pitch:duration:animationStyle:timingCurve:forceDestination:completion:", a8, a9, 0, a10, a3.var0, a3.var1, a4, a5, a6, a7);
}

- (void)canvasDidLayout
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  -[VKCameraController canvas](self, "canvas");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  -[VKCameraController canvas](self, "canvas");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "size");
  v8 = v7 * v5;

  if (v8 > 0.0)
    -[VKMapCameraController updateCameraZBounds](self, "updateCameraZBounds");
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_mercatorCenterCoordinateForMapRegion:(id)a3
{
  double v3;
  double v4;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  GEOMapRectForMapRegion();
  GEOCoordinate2DForMapPoint();
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (void)_animateToPosition:()Matrix<double pitch:()3 yaw:(1>)a3 duration:(double)a4 timingCurve:(double)a5 completion:(double)a6
{
  -[VKMapCameraController _animateToPosition:pitch:yaw:duration:timingCurve:forceDestination:completion:](self, "_animateToPosition:pitch:yaw:duration:timingCurve:forceDestination:completion:", a7, 0, a8, a3._e[0], a3._e[1], a3._e[2], a4, a5, a6);
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;

  objc_storeStrong((id *)&self->_horizontalOffsetAnimation, 0);
  cntrl = self->_flyoverTour.__cntrl_;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  -[VKAnimation stop](self->_horizontalOffsetAnimation, "stop");
  v3.receiver = self;
  v3.super_class = (Class)VKMapCameraController;
  -[VKScreenCameraController dealloc](&v3, sel_dealloc);
}

- (float)currentMinimumNormalizedZoomLevel
{
  uint64_t *p_shared_owners;
  unint64_t v4;
  float v5;
  uint64_t *v6;
  unint64_t v7;
  NSObject *v9;
  uint64_t v10;
  std::__shared_weak_count *v11;

  -[VKCameraController camera](self, "camera");
  if (!v11)
    goto LABEL_5;
  p_shared_owners = &v11->__shared_owners_;
  do
    v4 = __ldaxr((unint64_t *)p_shared_owners);
  while (__stlxr(v4 - 1, (unint64_t *)p_shared_owners));
  if (!v4)
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
    if (v10)
      goto LABEL_6;
  }
  else
  {
LABEL_5:
    if (v10)
    {
LABEL_6:
      -[VKCameraController camera](self, "camera");
      v5 = ceilf(*(float *)(v10 + 84) * 1000.0);
      if (v11)
      {
        v6 = &v11->__shared_owners_;
        do
          v7 = __ldaxr((unint64_t *)v6);
        while (__stlxr(v7 - 1, (unint64_t *)v6));
        if (!v7)
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
      }
      return v5 * 0.001;
    }
  }
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
  v9 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_19F029000, v9, OS_LOG_TYPE_ERROR, "no self.camera in VKMapCameraController for tap zoom", (uint8_t *)&v10, 2u);
  }

  return 1.0;
}

- (float)idealPitchForNormalizedZoomLevel:(float)a3
{
  _QWORD *mapEngine;
  uint64_t v4;

  mapEngine = self->_mapEngine;
  if (mapEngine && (v4 = mapEngine[149]) != 0)
    return pitchForZ((_QWORD *)(v4 + 432), a3);
  else
    return 0.0;
}

- (void)rotateToPitch:(double)a3 withPoint:(const void *)a4 preserveAltitude:(BOOL)a5 animated:(BOOL)a6 exaggerate:(BOOL)a7 maxPitch:(double)a8
{
  _BOOL4 v9;
  double v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  VKTimedAnimation *v16;
  double v17;
  VKTimedAnimation *v18;
  VKTimedAnimation *pitchAnimation;
  uint64_t v20;
  _BOOL4 v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  __double2 v33;
  void *v34;
  double *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  __int128 v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  double v71;
  void *v72;
  double v73;
  void *v74;
  void *v75;
  uint64_t v76;
  _BOOL4 v77;
  void *v78;
  __int128 v79;
  double v80[3];
  float64x2_t v81;
  __int128 v82;
  float64x2_t v83[2];
  id location[4];
  _QWORD v85[5];
  id v86[2];
  BOOL v87;
  _QWORD v88[4];
  id v89[4];
  BOOL v90;

  v9 = a5;
  v11 = fmin(fmax(a3, 0.0), a8 + 0.0698131701);
  if (!a6)
  {
    v22 = -[VKMapCameraController isPitched](self, "isPitched", a4, a5, a6, a7);
    -[VKCameraController vkCamera](self, "vkCamera");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "pitch");
    v25 = v24;

    -[VKCameraController vkCamera](self, "vkCamera");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "rightVector");
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v33 = __sincos_stret((v11 - v25) * 0.5);

    -[VKCameraController vkCamera](self, "vkCamera");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (double *)objc_msgSend(v34, "orientation");
    v36 = v33.__sinval / sqrt(v28 * v28 + v30 * v30 + v32 * v32);
    v37 = v36 * v28;
    v38 = v36 * v30;
    v39 = v36 * v32;
    v40 = v35[1];
    v41 = v35[2];
    v42 = v35[3];
    v43 = *v35 * v39 + v40 * v33.__cosval - v41 * v37 + v42 * v38;
    v44 = v41 * v33.__cosval - (*v35 * v38 - v40 * v37) + v42 * v39;
    v45 = *v35 * v37 + v40 * v38 + v41 * v39;
    *(double *)location = v41 * v38 - (v40 * v39 - *v35 * v33.__cosval) + v42 * v37;
    location[1] = *(id *)&v43;
    location[2] = *(id *)&v44;
    *(double *)&location[3] = -(v45 - v42 * v33.__cosval);

    if (a4)
    {
      *(float64x2_t *)((char *)v83 + 8) = *(float64x2_t *)a4;
      v83[1].f64[1] = *((float64_t *)a4 + 2);
      LOBYTE(v83[0].f64[0]) = 1;
    }
    else
    {
      -[VKCameraController vkCamera](self, "vkCamera");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
      if (v46)
        objc_msgSend(v46, "groundPointFromScreenPoint:");
      else
        memset(v83, 0, sizeof(v83));

    }
    -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
    if (LOBYTE(v83[0].f64[0]))
    {
      -[VKCameraController vkCamera](self, "vkCamera");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (double *)objc_msgSend(v47, "position");
      v49 = v48[1];
      v50 = *v48 - v83[0].f64[1];
      v51 = v48[2];
      v52 = -((v49 - v83[1].f64[0]) * v39 - (v51 - v83[1].f64[1]) * v38);
      v53 = -((v51 - v83[1].f64[1]) * v37 - v50 * v39);
      v54 = -(v50 * v38 - (v49 - v83[1].f64[0]) * v37);
      v55 = v53 + v53;
      v56 = v54 + v54;
      v81.f64[0] = *v48 + v56 * v38 + (v52 + v52) * v33.__cosval - v55 * v39;
      v81.f64[1] = v49 - v56 * v37 + (v52 + v52) * v39 + v55 * v33.__cosval;
      *(double *)&v82 = v51 + v56 * v33.__cosval + v55 * v37 - (v52 + v52) * v38;

      if (v9)
      {
        -[VKCameraController vkCamera](self, "vkCamera");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(double *)&v58 = *(double *)(objc_msgSend(v57, "position") + 16) / (v83[1].f64[1] - *(double *)&v82) + 1.0;
        v79 = v58;

        v81 = vmlaq_n_f64(v81, vsubq_f64(*(float64x2_t *)((char *)v83 + 8), v81), *(double *)&v79);
        *(double *)&v82 = *(double *)&v82 + (v83[1].f64[1] - *(double *)&v82) * *(double *)&v79;
      }
      -[VKCameraController vkCamera](self, "vkCamera", v79);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setPosition:", &v81);

      -[VKCameraController vkCamera](self, "vkCamera");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setOrientation:", location);
    }
    else
    {
      -[VKCameraController vkCamera](self, "vkCamera");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setOrientation:", location);

      -[VKCameraController vkCamera](self, "vkCamera");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
      if (v62)
      {
        objc_msgSend(v62, "groundPointFromScreenPoint:");
      }
      else
      {
        v81 = 0u;
        v82 = 0u;
      }

      -[VKCameraController vkCamera](self, "vkCamera");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = (double *)objc_msgSend(v63, "position");
      v65 = v81.f64[1];
      v66 = *(double *)&v82;
      v68 = *v64;
      v67 = v64[1];

      -[VKCameraController vkCamera](self, "vkCamera");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = *(double *)objc_msgSend(v60, "position");
      -[VKCameraController vkCamera](self, "vkCamera");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = *(double *)(objc_msgSend(v70, "position") + 8);
      -[VKCameraController vkCamera](self, "vkCamera");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = *(double *)(objc_msgSend(v72, "position") + 16);
      v80[0] = v68 - v65 + v69;
      v80[1] = v67 - v66 + v71;
      v80[2] = v73;
      -[VKCameraController vkCamera](self, "vkCamera");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "setPosition:", v80);

    }
    -[VKCameraController cameraDelegate](self, "cameraDelegate");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "mapLayerDidChangeVisibleRegion");

    v76 = *(_QWORD *)-[VKCameraController runLoopController](self, "runLoopController");
    if (v76)
    {
      LOBYTE(v81.f64[0]) = 4;
      md::MapEngine::setNeedsTick(v76, &v81);
    }
    v77 = -[VKMapCameraController isPitched](self, "isPitched");
    if (v22 || !v77)
    {
      if (!v22 || v77)
      {
LABEL_26:
        -[VKCameraController endRegionChange](self, "endRegionChange");
        return;
      }
      -[VKCameraController cameraDelegate](self, "cameraDelegate");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "mapLayerDidBecomePitched:", 0);
    }
    else
    {
      -[VKCameraController cameraDelegate](self, "cameraDelegate");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "mapLayerDidBecomePitched:", 1);
    }

    goto LABEL_26;
  }
  v12 = a7;
  -[VKCameraController vkCamera](self, "vkCamera", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pitch");
  v15 = v14;

  -[VKAnimation stop](self->super._pitchAnimation, "stop");
  v16 = [VKTimedAnimation alloc];
  v17 = 0.3;
  if (v12)
    v17 = 0.5;
  v18 = -[VKTimedAnimation initWithDuration:](v16, "initWithDuration:", v17);
  pitchAnimation = self->super._pitchAnimation;
  self->super._pitchAnimation = v18;

  -[VKTimedAnimation setTimingFunction:](self->super._pitchAnimation, "setTimingFunction:", VKAnimationCurveEaseOut);
  objc_initWeak(location, self);
  v20 = MEMORY[0x1E0C809B0];
  v88[0] = MEMORY[0x1E0C809B0];
  v88[1] = 3221225472;
  v88[2] = __95__VKMapCameraController_rotateToPitch_withPoint_preserveAltitude_animated_exaggerate_maxPitch___block_invoke;
  v88[3] = &unk_1E42ED180;
  objc_copyWeak(v89, location);
  v89[1] = v15;
  v89[2] = *(id *)&v11;
  v90 = v9;
  v89[3] = *(id *)&a8;
  -[VKTimedAnimation setStepHandler:](self->super._pitchAnimation, "setStepHandler:", v88);
  v85[0] = v20;
  v85[1] = 3221225472;
  v85[2] = __95__VKMapCameraController_rotateToPitch_withPoint_preserveAltitude_animated_exaggerate_maxPitch___block_invoke_2;
  v85[3] = &unk_1E42ED1A8;
  objc_copyWeak(v86, location);
  v85[4] = self;
  v86[1] = *(id *)&a8;
  v87 = v9;
  -[VKAnimation setCompletionHandler:](self->super._pitchAnimation, "setCompletionHandler:", v85);
  -[VKAnnotationTrackingCameraController pauseAnimation](self->super._annotationTrackingCameraController, "pauseAnimation");
  -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1);
  md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), &self->super._pitchAnimation->super);
  objc_destroyWeak(v86);
  objc_destroyWeak(v89);
  objc_destroyWeak(location);
}

- (void)rotateToYaw:(double)a3 withPoint:(const void *)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  void *v9;
  double v10;
  long double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void (**v20)(_QWORD, double);
  double v21;
  VKTimedAnimation *v22;
  VKTimedAnimation *rotationAnimation;
  void (**v24)(_QWORD, double);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, int);
  void *v29;
  void (**v30)(_QWORD, double);
  id v31[2];
  _QWORD v32[4];
  id v33;
  double v34;
  id location;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, double);
  void *v39;
  VKMapCameraController *v40;
  char v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  _OWORD v49[2];
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;

  v5 = a5;
  v54 = *MEMORY[0x1E0C80C00];
  -[VKCameraController vkCamera](self, "vkCamera");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "yaw");
  v11 = fmod(3.14159265 - a3 + v10, 6.28318531);
  v12 = fmod(v11 + 6.28318531, 6.28318531);

  -[VKCameraController vkCamera](self, "vkCamera");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "position");
  v52 = *(_OWORD *)v14;
  v53 = *(_QWORD *)(v14 + 16);

  -[VKCameraController vkCamera](self, "vkCamera");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "orientation");
  v50 = *(_OWORD *)v16;
  v51 = *(_QWORD *)(v16 + 16);
  v17 = *(_QWORD *)(v16 + 24);

  v18 = MEMORY[0x1E0C809B0];
  if (a4)
  {
    *(_OWORD *)((char *)v49 + 8) = *(_OWORD *)a4;
    *((_QWORD *)&v49[1] + 1) = *((_QWORD *)a4 + 2);
    LOBYTE(v49[0]) = 1;
    v36 = MEMORY[0x1E0C809B0];
    v37 = 3321888768;
    v38 = __56__VKMapCameraController_rotateToYaw_withPoint_animated___block_invoke;
    v39 = &unk_1E42E9200;
    v41 = 0;
LABEL_7:
    v42 = *(_OWORD *)((char *)v49 + 8);
    v43 = *((_QWORD *)&v49[1] + 1);
    v41 = 1;
    goto LABEL_8;
  }
  -[VKCameraController vkCamera](self, "vkCamera");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
  if (v19)
    objc_msgSend(v19, "groundPointFromScreenPoint:");
  else
    memset(v49, 0, sizeof(v49));

  v36 = v18;
  v37 = 3321888768;
  v38 = __56__VKMapCameraController_rotateToYaw_withPoint_animated___block_invoke;
  v39 = &unk_1E42E9200;
  v41 = 0;
  if (LOBYTE(v49[0]))
    goto LABEL_7;
LABEL_8:
  v44 = v52;
  v46 = v50;
  v47 = v51;
  v48 = v17;
  v45 = v53;
  v40 = self;
  v20 = (void (**)(_QWORD, double))MEMORY[0x1A1AF5730](&v36);
  v21 = v12 + -3.14159265;
  if (v5)
  {
    -[VKAnimation stop](self->super._rotationAnimation, "stop");
    v22 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", 0.3);
    rotationAnimation = self->super._rotationAnimation;
    self->super._rotationAnimation = v22;

    -[VKTimedAnimation setTimingFunction:](self->super._rotationAnimation, "setTimingFunction:", VKAnimationCurveEaseOut);
    objc_initWeak(&location, self);
    v32[0] = v18;
    v32[1] = 3221225472;
    v32[2] = __56__VKMapCameraController_rotateToYaw_withPoint_animated___block_invoke_15;
    v32[3] = &unk_1E42ED1D0;
    v34 = v21;
    v24 = v20;
    v33 = v24;
    -[VKTimedAnimation setStepHandler:](self->super._rotationAnimation, "setStepHandler:", v32);
    v26 = v18;
    v27 = 3221225472;
    v28 = __56__VKMapCameraController_rotateToYaw_withPoint_animated___block_invoke_2;
    v29 = &unk_1E42F9FC8;
    objc_copyWeak(v31, &location);
    v30 = v24;
    v31[1] = *(id *)&v21;
    -[VKAnimation setCompletionHandler:](self->super._rotationAnimation, "setCompletionHandler:", &v26);
    -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1, v26, v27, v28, v29);
    md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), &self->super._rotationAnimation->super);

    objc_destroyWeak(v31);
    objc_destroyWeak(&location);
  }
  else
  {
    -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
    v20[2](v20, v21);
    v25 = *(_QWORD *)-[VKCameraController runLoopController](self, "runLoopController");
    if (v25)
    {
      LOBYTE(location) = 4;
      md::MapEngine::setNeedsTick(v25, &location);
    }
    -[VKCameraController endRegionChange](self, "endRegionChange");
  }

}

- (void)zoom:(double)a3 withFocusPoint:(CGPoint)a4 completionHandler:(id)a5
{
  double y;
  double x;
  id v8;

  y = a4.y;
  x = a4.x;
  v8 = a5;
  if (-[VKCameraController staysCenteredDuringPinch](self, "staysCenteredDuringPinch"))
    -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
  else
    -[VKCameraController scaledScreenPointForPoint:](self, "scaledScreenPointForPoint:", x, y);
  -[VKMapCameraController tapZoom:levels:completionHandler:](self, "tapZoom:levels:completionHandler:", v8);

}

- (void)tapZoom:(CGPoint)a3 levels:(double)a4 completionHandler:(id)a5
{
  double y;
  double x;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  long double v15;
  double v16;
  VKMapCameraController *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  VKMapCameraController *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  void *v30;
  double v31;
  void *v32;
  float v33;
  float v34;
  float v35;
  float v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  BOOL v50;
  void *v51;
  double v52;
  double v53;
  __int128 v54;
  __int128 v55;

  y = a3.y;
  x = a3.x;
  v9 = (void (**)(_QWORD))a5;
  -[VKCameraController vkCamera](self, "vkCamera");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "groundPointFromScreenPoint:", x, y);
  }
  else
  {
    v54 = 0u;
    v55 = 0u;
  }

  if (!(_BYTE)v54)
  {
    if (!v9)
      goto LABEL_20;
    goto LABEL_16;
  }
  -[VKCameraController vkCamera](self, "vkCamera");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCameraController vkCamera](self, "vkCamera");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "footprint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "maxDepth");
  objc_msgSend(v12, "widthOfViewAtDepth:");
  v16 = log2(v15);

  v17 = self;
  -[VKCameraController canvas](v17, "canvas");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "size");
  v20 = v19;

  v21 = 0.0;
  if (v20 > 0.0)
  {
    -[VKCameraController canvas](v17, "canvas");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "size");
    v21 = log2(v23 / (double)-[VKMapCameraController tileSize](v17, "tileSize"));

  }
  v24 = v17;
  -[VKCameraController canvas](v24, "canvas");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "size");
  v27 = v26;

  v28 = 0.0;
  if (v27 > 0.0)
  {
    v29 = -[VKMapCameraController tileSize](v24, "tileSize");
    -[VKCameraController canvas](v24, "canvas");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "size");
    v28 = log2((double)v29 / v31);

  }
  -[VKCameraController vkCamera](v24, "vkCamera");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v16;
  v34 = v21 + (float)-v33;
  v35 = a4 + 0.8 + v34;
  v36 = v28 + v35;
  objc_msgSend(v32, "depthForViewWidth:", (double)exp2(-v36));
  v38 = v37;

  -[VKCameraController vkCamera](v24, "vkCamera");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "footprint");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "maxDepth");
  v42 = v41;

  -[VKMapCameraController positionClampedToCameraRestriction:](v24, "positionClampedToCameraRestriction:", *((double *)&v54 + 1), v55);
  v44 = v43;
  -[VKCameraController vkCamera](v24, "vkCamera");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = *(double *)(objc_msgSend(v45, "position") + 16);

  -[VKCameraController vkCamera](v24, "vkCamera");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "minHeight");
  v49 = v46 + (v44 - v46) * (1.0 - v38 / v42);
  v50 = a4 > 0.0 && v49 < v48;

  -[VKCameraController vkCamera](v24, "vkCamera");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "maxHeight");
  v53 = v52;

  if (!v50 && (v49 <= v53 || a4 >= 0.0))
  {
    -[VKMapCameraController zoom:withPoint:completionHandler:](v24, "zoom:withPoint:completionHandler:", v9, a4, *((double *)&v54 + 1), v55, (_QWORD)v54);
    goto LABEL_20;
  }
  if (v9)
LABEL_16:
    v9[2](v9);
LABEL_20:

}

- (void)zoom:(double)a3 withPoint:()Matrix<double completionHandler:()3
{
  double v5;
  double v6;
  double v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  long double v14;
  double v15;
  VKMapCameraController *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  VKTimedAnimation *v23;
  float v24;
  float v25;
  double v26;
  double v27;
  uint64_t v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34[6];
  id location;

  v5 = a4._e[2];
  v6 = a4._e[1];
  v7 = a4._e[0];
  v10 = a5;
  -[VKCameraController vkCamera](self, "vkCamera");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCameraController vkCamera](self, "vkCamera");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "footprint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "maxDepth");
  objc_msgSend(v11, "widthOfViewAtDepth:");
  v15 = log2(v14);

  v16 = self;
  -[VKCameraController canvas](v16, "canvas");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "size");
  v19 = v18;

  v20 = 0.0;
  if (v19 > 0.0)
  {
    -[VKCameraController canvas](v16, "canvas");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "size");
    v20 = log2(v22 / (double)-[VKMapCameraController tileSize](v16, "tileSize"));

  }
  -[VKAnimation stop](v16->super._zoomAnimation, "stop");
  v23 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", 0.25);
  v24 = v15;
  v25 = v20 + (float)-v24;
  v26 = v25;
  v27 = a3 + 0.00001 + round(v25);
  objc_initWeak(&location, v16);
  v28 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __58__VKMapCameraController_zoom_withPoint_completionHandler___block_invoke;
  v33[3] = &unk_1E42ED1F8;
  objc_copyWeak(v34, &location);
  v34[1] = *(id *)&v26;
  v34[2] = *(id *)&v27;
  v34[3] = *(id *)&v7;
  v34[4] = *(id *)&v6;
  v34[5] = *(id *)&v5;
  -[VKTimedAnimation setStepHandler:](v23, "setStepHandler:", v33);
  v30[0] = v28;
  v30[1] = 3221225472;
  v30[2] = __58__VKMapCameraController_zoom_withPoint_completionHandler___block_invoke_2;
  v30[3] = &unk_1E42F9D20;
  objc_copyWeak(&v32, &location);
  v29 = v10;
  v31 = v29;
  -[VKAnimation setCompletionHandler:](v23, "setCompletionHandler:", v30);
  objc_storeStrong((id *)&v16->super._zoomAnimation, v23);
  v16->super._zoomAnimationCanBeInterrupted = 0;
  -[VKCameraController beginRegionChange:](v16, "beginRegionChange:", 1);
  md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](v16, "animationRunner"), v16->super._zoomAnimation);

  objc_destroyWeak(&v32);
  objc_destroyWeak(v34);
  objc_destroyWeak(&location);

}

- (void)zoomToLevel:(double)a3 withPoint:()Matrix<double
{
  double v4;
  double v5;
  double v6;
  float v9;
  double v10;
  float v11;
  double v12;
  float v13;
  float v14;
  VKMapCameraController *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  double v22;
  float v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  int8x16_t v34;
  float64x2_t v35;
  int8x16_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  float64x2_t *v43;
  double v44;
  double v45;
  float64x2_t v46;
  void *v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  _BOOL4 v55;
  _BOOL4 v56;
  void *v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  double v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  void *v75;
  uint64_t v76;
  float64_t v77;
  float64_t v78;
  float64x2_t v79;
  double v80;
  _QWORD v81[3];
  char v82;

  v4 = a4._e[2];
  v5 = a4._e[1];
  v6 = a4._e[0];
  -[VKMapCameraController currentMinimumNormalizedZoomLevel](self, "currentMinimumNormalizedZoomLevel");
  v10 = v9;
  -[VKMapCameraController currentMaximumNormalizedZoomLevel](self, "currentMaximumNormalizedZoomLevel");
  v12 = fmax(v10, a3);
  if (v12 <= v11)
  {
    v13 = v12;
    v14 = v13;
  }
  else
  {
    v14 = v11;
  }
  v15 = self;
  -[VKCameraController canvas](v15, "canvas");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "size");
  v18 = v17;

  v19 = 0.0;
  if (v18 > 0.0)
  {
    v20 = -[VKMapCameraController tileSize](v15, "tileSize");
    -[VKCameraController canvas](v15, "canvas");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "size");
    v19 = log2((double)v20 / v22);

  }
  v23 = v19 + v14;
  v24 = exp2(-v23);
  -[VKCameraController vkCamera](v15, "vkCamera");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "depthForViewWidth:", v24);
  v27 = v26;

  -[VKCameraController vkCamera](v15, "vkCamera");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "footprint");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "maxDepth");
  v31 = v30;

  -[VKCameraController vkCamera](v15, "vkCamera");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = *(double *)objc_msgSend(v32, "position");

  *(double *)v34.i64 = v33 - v6;
  v35.f64[0] = NAN;
  v35.f64[1] = NAN;
  v36.i64[0] = 1.0;
  v37 = *(double *)vbslq_s8((int8x16_t)vnegq_f64(v35), v36, v34).i64 + v6;
  if (vabdd_f64(v33, v37) >= vabdd_f64(v33, v6))
    v37 = v6;
  -[VKMapCameraController positionClampedToCameraRestriction:](v15, "positionClampedToCameraRestriction:", v37, v5, v4);
  v39 = v38;
  v77 = v41;
  v78 = v40;
  *(double *)v81 = v40;
  *(double *)&v81[1] = v41;
  *(double *)&v81[2] = v38;
  -[VKCameraController vkCamera](v15, "vkCamera");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (float64x2_t *)objc_msgSend(v42, "position");
  v44 = 1.0 - v27 / v31;
  v45 = v43[1].f64[0] + (v39 - v43[1].f64[0]) * v44;
  v46.f64[0] = v78;
  v46.f64[1] = v77;
  v79 = vmlaq_n_f64(*v43, vsubq_f64(v46, *v43), v44);
  v80 = v45;

  -[VKCameraController vkCamera](v15, "vkCamera");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = *(double *)(objc_msgSend(v47, "position") + 16);

  -[VKCameraController vkCamera](v15, "vkCamera");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "minHeight");
  v51 = v50;

  -[VKCameraController vkCamera](v15, "vkCamera");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "maxHeight");
  v54 = v53;

  v55 = v48 < v45 || v45 >= v51;
  v56 = v48 < v45 && v45 > v54;
  if (!v55 || v56)
  {
    -[VKCameraController vkCamera](v15, "vkCamera");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "minHeight");
    v60 = v59;
    -[VKCameraController vkCamera](v15, "vkCamera");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "maxHeight");
    v80 = fmin(fmax(v45, v60), v62);

  }
  -[VKCameraController vkCamera](v15, "vkCamera");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setPosition:", &v79);

  v15->super._userChangedZoomSinceLastProgrammaticRegionChange = 1;
  -[VKAnnotationTrackingCameraController setHasUserSpecifiedZoomLevel:](v15->super._annotationTrackingCameraController, "setHasUserSpecifiedZoomLevel:", 1);
  -[VKMapCameraController updateCameraZBounds](v15, "updateCameraZBounds");
  -[VKCameraController vkCamera](v15, "vkCamera");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "pitch");
  v66 = v65;
  -[VKCameraController vkCamera](v15, "vkCamera");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "maxPitch");
  v69 = v68;

  if (v66 > v69)
  {
    -[VKCameraController vkCamera](v15, "vkCamera");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "maxPitch");
    v72 = v71;
    -[VKCameraController vkCamera](v15, "vkCamera");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "maxPitch");
    -[VKMapCameraController rotateToPitch:withPoint:preserveAltitude:animated:exaggerate:maxPitch:](v15, "rotateToPitch:withPoint:preserveAltitude:animated:exaggerate:maxPitch:", v81, 1, 0, 0, v72, v74);

  }
  -[VKCameraController cameraDelegate](v15, "cameraDelegate");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "mapLayerDidChangeVisibleRegion");

  v76 = *(_QWORD *)-[VKCameraController runLoopController](v15, "runLoopController");
  if (v76)
  {
    v82 = 4;
    md::MapEngine::setNeedsTick(v76, &v82);
  }
}

- (void)startTrackingAnnotation:(id)a3 trackHeading:(BOOL)a4 animated:(BOOL)a5 duration:(double)a6 timingFunction:(id)a7
{
  uint64_t v9;
  _BOOL8 v10;
  id v12;
  id v13;
  VKAnnotationTrackingCameraController *annotationTrackingCameraController;
  VKMapAnnotationTrackingCameraController *v15;
  void *v16;
  AnimationRunner *v17;
  RunLoopController *v18;
  void *v19;
  VKAnnotationTrackingCameraController *v20;
  VKAnnotationTrackingCameraController *v21;
  void *v22;
  int8x8_t *v23;
  int8x8_t v24;
  uint8x8_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  VKAnnotationTrackingCameraController *v33;
  std::__shared_weak_count *v34;
  unint64_t *p_shared_owners;
  unint64_t v36;
  void *v37;
  unsigned int v38;
  __int128 v39;
  uint64_t v40;
  _BYTE v41[8];
  std::__shared_weak_count *v42;

  v9 = a5;
  v10 = a4;
  v12 = a3;
  v13 = a7;
  annotationTrackingCameraController = self->super._annotationTrackingCameraController;
  if (!annotationTrackingCameraController)
  {
    v38 = v9;
    v15 = [VKMapAnnotationTrackingCameraController alloc];
    v16 = -[VKCameraController mapDataAccess](self, "mapDataAccess");
    v17 = -[VKCameraController animationRunner](self, "animationRunner");
    v18 = -[VKCameraController runLoopController](self, "runLoopController");
    -[VKCameraController cameraDelegate](self, "cameraDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[VKAnnotationTrackingCameraController initWithMapDataAccess:animationRunner:runLoopController:cameraDelegate:](v15, "initWithMapDataAccess:animationRunner:runLoopController:cameraDelegate:", v16, v17, v18, v19);
    v21 = self->super._annotationTrackingCameraController;
    self->super._annotationTrackingCameraController = v20;

    -[VKCameraController vkCamera](self, "vkCamera");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCameraController setVkCamera:](self->super._annotationTrackingCameraController, "setVkCamera:", v22);

    v23 = (int8x8_t *)*((_QWORD *)self->_mapEngine + 140);
    v24 = v23[2];
    if (v24)
    {
      v25 = (uint8x8_t)vcnt_s8(v24);
      v25.i16[0] = vaddlv_u8(v25);
      if (v25.u32[0] > 1uLL)
      {
        v26 = 0x17767EADC5B287BLL;
        if (*(_QWORD *)&v24 <= 0x17767EADC5B287BuLL)
          v26 = 0x17767EADC5B287BuLL % *(_QWORD *)&v24;
      }
      else
      {
        v26 = (*(_QWORD *)&v24 - 1) & 0x17767EADC5B287BLL;
      }
      v27 = *(_QWORD **)(*(_QWORD *)&v23[1] + 8 * v26);
      if (v27)
      {
        v28 = (_QWORD *)*v27;
        if (v28)
        {
          if (v25.u32[0] < 2uLL)
          {
            v29 = *(_QWORD *)&v24 - 1;
            while (1)
            {
              v31 = v28[1];
              if (v31 == 0x17767EADC5B287BLL)
              {
                if (v28[2] == 0x17767EADC5B287BLL)
                  goto LABEL_30;
              }
              else if ((v31 & v29) != v26)
              {
                goto LABEL_22;
              }
              v28 = (_QWORD *)*v28;
              if (!v28)
                goto LABEL_22;
            }
          }
          do
          {
            v30 = v28[1];
            if (v30 == 0x17767EADC5B287BLL)
            {
              if (v28[2] == 0x17767EADC5B287BLL)
              {
LABEL_30:
                v32 = v28[5];
                goto LABEL_23;
              }
            }
            else
            {
              if (v30 >= *(_QWORD *)&v24)
                v30 %= *(_QWORD *)&v24;
              if (v30 != v26)
                break;
            }
            v28 = (_QWORD *)*v28;
          }
          while (v28);
        }
      }
    }
LABEL_22:
    v32 = 0;
LABEL_23:
    -[VKAnnotationTrackingCameraController setElevationLogic:](self->super._annotationTrackingCameraController, "setElevationLogic:", v32);
    v33 = self->super._annotationTrackingCameraController;
    -[VKCameraController camera](self, "camera");
    -[VKCameraController setCamera:](v33, "setCamera:", v41);
    v34 = v42;
    if (v42)
    {
      p_shared_owners = (unint64_t *)&v42->__shared_owners_;
      do
        v36 = __ldaxr(p_shared_owners);
      while (__stlxr(v36 - 1, p_shared_owners));
      if (!v36)
      {
        ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
        std::__shared_weak_count::__release_weak(v34);
      }
    }
    -[VKCameraController canvas](self, "canvas");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCameraController setCanvas:](self->super._annotationTrackingCameraController, "setCanvas:", v37);

    v39 = *(_OWORD *)&self->super._annotationTrackingBehavior.shouldZoomToFit;
    v40 = *(_QWORD *)&self->super._annotationTrackingBehavior.shouldPreserveUserSpecifiedZoomLevel;
    -[VKAnnotationTrackingCameraController setBehavior:](self->super._annotationTrackingCameraController, "setBehavior:", &v39);
    -[VKAnnotationTrackingCameraController setHasUserSpecifiedZoomLevel:](self->super._annotationTrackingCameraController, "setHasUserSpecifiedZoomLevel:", self->super._userChangedZoomSinceLastProgrammaticRegionChange);
    -[VKAnnotationTrackingCameraController setHeadingAnimationDisplayRate:](self->super._annotationTrackingCameraController, "setHeadingAnimationDisplayRate:", self->super._annotationTrackingHeadingAnimationDisplayRate);
    -[VKCameraController edgeInsets](self, "edgeInsets");
    -[VKCameraController setEdgeInsets:](self->super._annotationTrackingCameraController, "setEdgeInsets:");
    annotationTrackingCameraController = self->super._annotationTrackingCameraController;
    v9 = v38;
  }
  -[VKAnnotationTrackingCameraController startTrackingAnnotation:trackHeading:animated:duration:timingFunction:](annotationTrackingCameraController, "startTrackingAnnotation:trackHeading:animated:duration:timingFunction:", v12, v10, v9, v13, a6);

}

- (BOOL)snapMapIfNecessary:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  float v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  float v25;

  v3 = a3;
  -[VKCameraController vkCamera](self, "vkCamera");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[VKCameraController vkCamera](self, "vkCamera");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pitch");
    v8 = v7;

    -[VKCameraController vkCamera](self, "vkCamera");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "yaw");
    v11 = v10;

    -[VKMapCameraController currentNormalizedZoomLevel](self, "currentNormalizedZoomLevel");
    -[VKMapCameraController minimumPitchForNormalizedZoomLevel:](self, "minimumPitchForNormalizedZoomLevel:");
    v13 = v12;
    if ((v8 >= v12 || v8 <= 0.0001)
      && (-[VKCameraController vkCamera](self, "vkCamera"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v14, "maxPitch"),
          v16 = v15,
          v14,
          v8 <= v16))
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      -[VKCameraController vkCamera](self, "vkCamera");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "maxPitch");
      v19 = v18;

      if (v8 <= v19)
      {
        if (-[VKGestureCameraBehavior isPitchIncreasing](self->super._gestureCameraControllerBehavior, "isPitchIncreasing"))v22 = v13;
        else
          v22 = 0.0;
      }
      else
      {
        -[VKCameraController vkCamera](self, "vkCamera");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "maxPitch");
        v22 = v21;

      }
      -[VKCameraController vkCamera](self, "vkCamera");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "maxPitch");
      -[VKMapCameraController rotateToPitch:withPoint:preserveAltitude:animated:exaggerate:maxPitch:](self, "rotateToPitch:withPoint:preserveAltitude:animated:exaggerate:maxPitch:", 0, 0, v3, 0, v22, v23);

      LOBYTE(v5) = 1;
    }
    v24 = fabs(v11);
    -[VKMapCameraController currentStyleZoomLevel](self, "currentStyleZoomLevel");
    if (v24 > v24 * 2.22044605e-14 && v24 >= 2.22507386e-308 && v25 <= 6.0)
    {
      -[VKMapCameraController rotateToYaw:withPoint:animated:](self, "rotateToYaw:withPoint:animated:", 0, v3, 0.0);
      LOBYTE(v5) = 1;
    }
  }
  return (char)v5;
}

- (void)zoomToLevel:(double)a3 withFocusPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v8;
  __int128 v9;
  __int128 v10;

  y = a4.y;
  x = a4.x;
  -[VKCameraController vkCamera](self, "vkCamera");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCameraController scaledScreenPointForPoint:](self, "scaledScreenPointForPoint:", x, y);
  if (v8)
  {
    objc_msgSend(v8, "groundPointFromScreenPoint:");
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
  }

  if ((_BYTE)v9)
    -[VKMapCameraController zoomToLevel:withPoint:](self, "zoomToLevel:withPoint:", a3, *((double *)&v9 + 1), v10);
}

- (void)enter3DMode
{
  void *v3;
  void *v4;
  void *v5;
  double *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  long double v17;
  double v18;
  float v19;
  VKMapCameraController *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  float v26;
  double v27;
  _BYTE *mapEngine;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  float v33;
  double v34;
  unsigned int v35;
  float v36;
  double v37;
  double v38;
  char v39;
  double v40;
  __int128 v41;
  __int128 v42;

  -[VKCameraController vkCamera](self, "vkCamera");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "groundPointFromScreenPoint:", 0.5, 0.5);
  }
  else
  {
    v41 = 0u;
    v42 = 0u;
  }

  if ((_BYTE)v41)
  {
    -[VKCameraController vkCamera](self, "vkCamera");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (double *)objc_msgSend(v5, "position");
    v7 = v6[1];
    v40 = *v6;
    v8 = v6[2];

    -[VKCameraController vkCamera](self, "vkCamera");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "forwardVector");
    v11 = v10;
    v13 = v12;
    v15 = v14;

    -[VKCameraController vkCamera](self, "vkCamera");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "widthOfViewAtDepth:", (*((double *)&v41 + 1) - v40) * v11 + (*(double *)&v42 - v7) * v13 + (*((double *)&v42 + 1) - v8) * v15);
    v18 = 0.0;
    if (v17 > 0.0)
    {
      v19 = log2(v17);
      v18 = (float)-v19;
    }

    v20 = self;
    -[VKCameraController canvas](v20, "canvas");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "size");
    v23 = v22;

    v24 = 0.0;
    if (v23 > 0.0)
    {
      -[VKCameraController canvas](v20, "canvas");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "size");
      v24 = log2(v25 / (double)-[VKMapCameraController tileSize](v20, "tileSize"));

    }
    v26 = v24 + v18;

    mapEngine = v20->_mapEngine;
    if (!mapEngine[1241])
      goto LABEL_16;
    v29 = (uint64_t *)*((_QWORD *)mapEngine + 141);
    v30 = *v29;
    v31 = v29[1];
    if (v30 != v31)
    {
      while (*(_BYTE *)v30 != 20)
      {
        v30 += 16;
        if (v30 == v31)
          goto LABEL_17;
      }
    }
    if (v30 == v31)
    {
LABEL_17:
      LOBYTE(v32) = 0;
    }
    else
    {
      v32 = *(_DWORD *)(v30 + 8);
      if (v32 >= 0xB)
      {
LABEL_16:
        *(float *)&v27 = v26;
        -[VKMapCameraController idealPitchForNormalizedZoomLevel:](v20, "idealPitchForNormalizedZoomLevel:", v27);
        v34 = v33;
        goto LABEL_19;
      }
    }
    v35 = 0x418u >> v32;
    *(float *)&v27 = v26;
    -[VKMapCameraController idealPitchForNormalizedZoomLevel:](v20, "idealPitchForNormalizedZoomLevel:", v27);
    v34 = v36;
    if ((v35 & 1) != 0)
    {
      v39 = 1;
      v38 = v36;
LABEL_21:
      -[VKMapCameraController rotateToPitch:withPoint:preserveAltitude:animated:exaggerate:maxPitch:](v20, "rotateToPitch:withPoint:preserveAltitude:animated:exaggerate:maxPitch:", 0, 0, 1, 1, v34, v38);
      if ((v39 & 1) == 0)

      return;
    }
LABEL_19:
    -[VKCameraController vkCamera](v20, "vkCamera");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "maxPitch");
    v38 = v37;
    v39 = 0;
    goto LABEL_21;
  }
}

- (void)exit3DMode
{
  double v3;
  id v4;

  -[VKCameraController vkCamera](self, "vkCamera");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maxPitch");
  -[VKMapCameraController rotateToPitch:withPoint:preserveAltitude:animated:exaggerate:maxPitch:](self, "rotateToPitch:withPoint:preserveAltitude:animated:exaggerate:maxPitch:", 0, 0, 1, 1, 0.0, v3);

}

- (BOOL)isFullyPitched
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  BOOL v8;

  -[VKCameraController vkCamera](self, "vkCamera");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pitch");
  v5 = v4;
  -[VKCameraController vkCamera](self, "vkCamera");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "maxPitch");
  v8 = v5 >= v7;

  return v8;
}

- (double)minPitch
{
  float v3;

  -[VKMapCameraController currentNormalizedZoomLevel](self, "currentNormalizedZoomLevel");
  -[VKMapCameraController minimumPitchForNormalizedZoomLevel:](self, "minimumPitchForNormalizedZoomLevel:");
  return v3 * 57.2957795;
}

- (double)maxPitch
{
  float v3;

  -[VKMapCameraController currentNormalizedZoomLevel](self, "currentNormalizedZoomLevel");
  -[VKMapCameraController maxPitchForNormalizedZoomLevel:](self, "maxPitchForNormalizedZoomLevel:");
  return v3 * 57.2957795;
}

- (void)panWithOffset:(CGPoint)a3 relativeToScreenPoint:(CGPoint)a4 animated:(BOOL)a5 duration:(double)a6 completionHandler:(id)a7
{
  _BOOL4 v8;
  double y;
  double x;
  double v11;
  double v12;
  void (**v14)(_QWORD);
  _BOOL4 v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  double *v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  VKTimedAnimation *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  double v48;
  _QWORD v49[5];
  void (**v50)(_QWORD);
  _QWORD v51[8];
  __int128 v52;
  double v53;
  __int128 v54;
  double v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  double v61[3];
  char v62;

  v8 = a5;
  y = a4.y;
  x = a4.x;
  v11 = a3.y;
  v12 = a3.x;
  v14 = (void (**)(_QWORD))a7;
  v48 = a6;
  v15 = a6 > 0.0 && v8;
  -[VKCameraController canvas](self, "canvas");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "size");
  v18 = v17;
  -[VKCameraController canvas](self, "canvas");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "size");
  v21 = v20;

  -[VKCameraController canvas](self, "canvas");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "size");
  v24 = v23;
  -[VKCameraController canvas](self, "canvas");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "size");
  v27 = v26;

  -[VKCameraController vkCamera](self, "vkCamera");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  v30 = x / v18;
  v31 = 1.0 - y / v21;
  if (v28)
  {
    objc_msgSend(v28, "groundPointFromScreenPoint:", v12 / v24 + v30, v31 - v11 / v27);
  }
  else
  {
    v60 = 0u;
    *(_OWORD *)v61 = 0u;
  }

  -[VKCameraController vkCamera](self, "vkCamera");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    objc_msgSend(v32, "groundPointFromScreenPoint:", v30, v31);
  }
  else
  {
    v58 = 0u;
    v59 = 0u;
  }

  if ((_BYTE)v60 && (_BYTE)v58)
  {
    -[VKCameraController vkCamera](self, "vkCamera");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (double *)objc_msgSend(v34, "position");
    v36 = *v35;
    v37 = v35[1];
    v38 = v35[2];

    -[VKCameraController vkCamera](self, "vkCamera");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
    if (v39)
    {
      objc_msgSend(v39, "groundPointFromScreenPoint:");
    }
    else
    {
      v56 = 0u;
      v57 = 0u;
    }

    -[VKMapCameraController positionClampedToCameraRestriction:](self, "positionClampedToCameraRestriction:", *((double *)&v58 + 1) - *((double *)&v60 + 1) + *((double *)&v56 + 1), *(double *)&v59 - v61[0] + *(double *)&v57, *((double *)&v57 + 1));
    *(double *)&v54 = v40 + v36 - *((double *)&v56 + 1);
    *((double *)&v54 + 1) = v41 + v37 - *(double *)&v57;
    v55 = v42 + v38 - *((double *)&v57 + 1);
    if (v15)
    {
      v43 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", v48);
      -[VKTimedAnimation setTimingFunction:](v43, "setTimingFunction:", VKAnimationCurveLinear);
      -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1);
      v44 = MEMORY[0x1E0C809B0];
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __97__VKMapCameraController_panWithOffset_relativeToScreenPoint_animated_duration_completionHandler___block_invoke;
      v51[3] = &unk_1E42ED220;
      v51[4] = self;
      *(double *)&v51[5] = v36;
      *(double *)&v51[6] = v37;
      *(double *)&v51[7] = v38;
      v52 = v54;
      v53 = v55;
      -[VKTimedAnimation setStepHandler:](v43, "setStepHandler:", v51);
      v49[0] = v44;
      v49[1] = 3221225472;
      v49[2] = __97__VKMapCameraController_panWithOffset_relativeToScreenPoint_animated_duration_completionHandler___block_invoke_2;
      v49[3] = &unk_1E42ED248;
      v49[4] = self;
      v50 = v14;
      -[VKAnimation setCompletionHandler:](v43, "setCompletionHandler:", v49);
      md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), &v43->super);

    }
    else
    {
      -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
      -[VKCameraController vkCamera](self, "vkCamera");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setPosition:", &v54);

      -[VKCameraController cameraDelegate](self, "cameraDelegate");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "mapLayerDidChangeVisibleRegion");

      v47 = *(_QWORD *)-[VKCameraController runLoopController](self, "runLoopController");
      if (v47)
      {
        v62 = 4;
        md::MapEngine::setNeedsTick(v47, &v62);
      }
      -[VKCameraController endRegionChange](self, "endRegionChange");
      if (v14)
        v14[2](v14);
    }
  }
  else if (v14)
  {
    v14[2](v14);
  }

}

- (void)setGesturing:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VKMapCameraController;
  -[VKCameraController setGesturing:](&v5, sel_setGesturing_);
  -[VKAnnotationTrackingCameraController setGesturing:](self->super._annotationTrackingCameraController, "setGesturing:", v3);
  if (self->_tourShouldResumeWhenDoneGesturing)
  {
    if (v3)
      -[VKMapCameraController pauseFlyoverTourAnimation](self, "pauseFlyoverTourAnimation");
    else
      -[VKMapCameraController resumeFlyoverTourAnimation](self, "resumeFlyoverTourAnimation");
  }
}

- (void)updateCameraToPositionOrientationLimits
{
  -[VKScreenCameraController clampZoomLevelIfNecessary](self, "clampZoomLevelIfNecessary");
  -[VKMapCameraController snapMapIfNecessary:](self, "snapMapIfNecessary:", 0);
}

- (double)presentationYaw
{
  void *v2;
  double v3;
  double v4;

  -[VKCameraController vkCamera](self, "vkCamera");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "yaw");
  v4 = v3 * 57.2957795;

  return v4;
}

- (double)yaw
{
  VKTimedAnimation *regionAnimation;
  double v4;
  void *v5;
  double v6;

  regionAnimation = self->super._regionAnimation;
  if (regionAnimation && -[VKAnimation running](regionAnimation, "running"))
    return self->_finalYaw;
  -[VKCameraController vkCamera](self, "vkCamera");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "yaw");
  v4 = v6 * 57.2957795;

  return v4;
}

- (void)setYaw:(double)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  double v8;
  double v9;
  double v10;
  long double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (**v19)(_QWORD, double);
  double v20;
  VKTimedAnimation *v21;
  VKTimedAnimation *regionAnimation;
  void (**v23)(_QWORD, double);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, int);
  void *v28;
  void (**v29)(_QWORD, double);
  id v30[2];
  _QWORD v31[4];
  id v32;
  double v33;
  id location;
  _QWORD v35[5];
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;

  v4 = a4;
  v45 = *MEMORY[0x1E0C80C00];
  -[VKAnimation stop](self->super._regionAnimation, "stop");
  if (!self->super._regionAnimation)
  {
    -[VKMapCameraController yaw](self, "yaw");
    if (vabdd_f64(a3, v7) >= 0.000001)
    {
      -[VKMapCameraController yaw](self, "yaw");
      v9 = v8;
      self->_finalYaw = a3;
      -[VKMapCameraController pitch](self, "pitch");
      self->_finalPitch = v10;
      v11 = fmod((v9 - a3) * 0.0174532925 + 3.14159265, 6.28318531);
      v12 = fmod(v11 + 6.28318531, 6.28318531);
      -[VKCameraController vkCamera](self, "vkCamera");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "position");
      v43 = *(_OWORD *)v14;
      v44 = *(_QWORD *)(v14 + 16);

      -[VKCameraController vkCamera](self, "vkCamera");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "orientation");
      v41 = *(_OWORD *)v16;
      v42 = *(_QWORD *)(v16 + 16);
      v17 = *(_QWORD *)(v16 + 24);

      v18 = MEMORY[0x1E0C809B0];
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3321888768;
      v35[2] = __41__VKMapCameraController_setYaw_animated___block_invoke;
      v35[3] = &unk_1E42EA030;
      v35[4] = self;
      v36 = v43;
      v37 = v44;
      v38 = v41;
      v39 = v42;
      v40 = v17;
      v19 = (void (**)(_QWORD, double))MEMORY[0x1A1AF5730](v35);
      v20 = v12 + -3.14159265;
      if (v4)
      {
        v21 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", 0.200000003);
        regionAnimation = self->super._regionAnimation;
        self->super._regionAnimation = v21;

        -[VKTimedAnimation setTimingFunction:](self->super._regionAnimation, "setTimingFunction:", VKAnimationCurveEaseInOut);
        -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1);
        objc_initWeak(&location, self);
        v31[0] = v18;
        v31[1] = 3221225472;
        v31[2] = __41__VKMapCameraController_setYaw_animated___block_invoke_22;
        v31[3] = &unk_1E42ED1D0;
        v33 = v20;
        v23 = v19;
        v32 = v23;
        -[VKTimedAnimation setStepHandler:](self->super._regionAnimation, "setStepHandler:", v31);
        v25 = v18;
        v26 = 3221225472;
        v27 = __41__VKMapCameraController_setYaw_animated___block_invoke_2;
        v28 = &unk_1E42F9FC8;
        objc_copyWeak(v30, &location);
        v29 = v23;
        v30[1] = *(id *)&v20;
        -[VKAnimation setCompletionHandler:](self->super._regionAnimation, "setCompletionHandler:", &v25);
        md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner", v25, v26, v27, v28), &self->super._regionAnimation->super);

        objc_destroyWeak(v30);
        objc_destroyWeak(&location);
      }
      else
      {
        -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
        v19[2](v19, v20);
        v24 = *(_QWORD *)-[VKCameraController runLoopController](self, "runLoopController");
        if (v24)
        {
          LOBYTE(location) = 4;
          md::MapEngine::setNeedsTick(v24, &location);
        }
        -[VKCameraController endRegionChange](self, "endRegionChange");
      }

    }
  }
}

- (double)durationToAnimateToMapRegion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v11;
  __int128 v12;
  float64x2_t v13;

  -[VKCameraController vkCamera](self, "vkCamera", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
  if (v4)
  {
    objc_msgSend(v4, "groundPointFromScreenPoint:");
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
  }

  if (!(_BYTE)v12)
    return 0.0;
  -[VKCameraController vkCamera](self, "vkCamera");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "position");
  v7 = *(double *)v6;
  v11 = *(float64x2_t *)(v6 + 8);

  v8 = vsubq_f64(v11, v13);
  v9 = vmulq_f64(v8, v8);
  return fmax(fmin(sqrt(v9.f64[0] + (v7 - *((double *)&v12 + 1)) * (v7 - *((double *)&v12 + 1)) + v9.f64[1]) * 1300.0, 1.0), 0.200000003);
}

- (void)setCenterCoordinate3D:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 animationStyle:(int64_t)a8 timingCurve:(id)a9 completion:(id)a10
{
  double var2;
  double var1;
  long double v19;
  double v20;
  double v21;

  var2 = a3.var2;
  var1 = a3.var1;
  v19 = tan(a3.var0 * 0.00872664626 + 0.785398163);
  v20 = log(v19) * 0.159154943 + 0.5;
  if (a8 == 2)
    v21 = 0.0;
  else
    v21 = a7;
  -[VKMapCameraController _animateToPosition:pitch:yaw:duration:timingCurve:completion:](self, "_animateToPosition:pitch:yaw:duration:timingCurve:completion:", a9, a10, var1 * 0.00277777778 + 0.5, v20, var2, a6, a5, v21);
}

- (double)distanceFromCenterCoordinate
{
  double v3;
  double v4;
  void *v5;
  long double v6;
  double v7;

  -[VKMapCameraController altitude](self, "altitude");
  v4 = v3;
  -[VKCameraController vkCamera](self, "vkCamera");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pitch");
  v7 = v4 / cos(v6);

  return v7;
}

- (void)setCenterCoordinateDistanceRange:(id *)a3 duration:(double)a4 timingFunction:(id)a5
{
  id v8;
  double var0;
  double v10;
  double v11;
  double v12;
  VKMapCameraController *v13;
  void *v14;
  double v15;
  double v16;
  float v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  VKCamera *v22;
  double v23;
  double v24;
  double v25;
  long double v26;
  long double v27;
  long double v28;
  double v29;
  long double v30;
  double v31;
  long double v32;
  uint64_t v33;
  double var1;
  double v35;
  void *v36;
  objc_super v37;
  __int128 v38;
  uint64_t v39;
  objc_super v40;
  __int128 v41;
  uint64_t v42;
  _QWORD v43[5];
  id v44;
  __int128 v45;
  uint64_t v46;
  _QWORD v47[5];
  id v48;
  __int128 v49;
  uint64_t v50;
  double v51;
  double v52;
  uint64_t v53;
  double v54;
  uint64_t v55;

  v8 = a5;
  v53 = 0;
  v54 = 0.0;
  v55 = 0;
  -[VKScreenCameraController centerCoordinateDistanceRange](self, "centerCoordinateDistanceRange");
  var0 = a3->var0;
  if (a3->var0 != 0.0 || (var0 = a3->var1, var0 != v54) || a3->var2 != v55)
  {
    -[VKMapCameraController distanceFromCenterCoordinate](self, "distanceFromCenterCoordinate", var0);
    v11 = v10;
    v12 = a3->var0;
    if (a3->var0 < 0.0)
    {
      v13 = self;
      -[VKCameraController canvas](v13, "canvas");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "size");
      v16 = v15;

      v17 = 20.0;
      if (v16 > 0.0)
      {
        v18 = -[VKMapCameraController tileSize](v13, "tileSize");
        -[VKCameraController canvas](v13, "canvas");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "size");
        v21 = log2((double)v18 / v20);

        v17 = v21 + 20.0;
      }

      -[VKCameraController vkCamera](v13, "vkCamera");
      v22 = (VKCamera *)objc_claimAutoreleasedReturnValue();
      v23 = VKCameraDistanceForDisplayZoomLevel(v17, v22);

      -[VKMapCameraController centerCoordinate](v13, "centerCoordinate");
      v25 = v24;
      v26 = cos(v24 * 0.034906585) * -559.82 + 111132.92;
      v27 = v26 + cos(v25 * 0.0698131701) * 1.175;
      v28 = v27 + cos(v25 * 0.104719755) * -0.0023;
      v29 = v25 * 0.00872664626;
      v30 = tan(v25 * 0.00872664626 + 0.78103484);
      v31 = log(v30);
      v32 = tan(v29 + 0.789761487);
      v12 = v28 * v23 / fabs((log(v32) - v31) * 0.159154943);
    }
    if (v11 < v12
      || (var1 = a3->var1, var1 >= 0.0)
      && (-[VKMapCameraController distanceFromCenterCoordinate](self, "distanceFromCenterCoordinate"), var1 < v35))
    {
      if (a4 <= 0.0)
      {
        v41 = *(_OWORD *)&a3->var0;
        v42 = *(_QWORD *)&a3->var2;
        v40.receiver = self;
        v40.super_class = (Class)VKMapCameraController;
        -[VKScreenCameraController setCenterCoordinateDistanceRange:duration:timingFunction:](&v40, sel_setCenterCoordinateDistanceRange_duration_timingFunction_, &v41, 0, 0.0);
        -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
        -[VKScreenCameraController clampZoomLevelIfNecessary](self, "clampZoomLevelIfNecessary");
        -[VKMapCameraController snapMapIfNecessary:](self, "snapMapIfNecessary:", 0);
        -[VKCameraController cameraDelegate](self, "cameraDelegate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "mapLayerDidChangeVisibleRegion");

        -[VKCameraController endRegionChange](self, "endRegionChange");
      }
      else
      {
        v33 = MEMORY[0x1E0C809B0];
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __82__VKMapCameraController_setCenterCoordinateDistanceRange_duration_timingFunction___block_invoke;
        v47[3] = &unk_1E42ED2C0;
        v49 = *(_OWORD *)&a3->var0;
        v50 = *(_QWORD *)&a3->var2;
        v51 = v11;
        v52 = v12;
        v47[4] = self;
        v48 = v8;
        v43[0] = v33;
        v43[1] = 3221225472;
        v43[2] = __82__VKMapCameraController_setCenterCoordinateDistanceRange_duration_timingFunction___block_invoke_2;
        v43[3] = &unk_1E42ED2E8;
        v45 = *(_OWORD *)&a3->var0;
        v46 = *(_QWORD *)&a3->var2;
        v43[4] = self;
        v44 = v48;
        -[VKMapCameraController animateRegionWithDuration:timingFunction:stepHandler:completionHandler:](self, "animateRegionWithDuration:timingFunction:stepHandler:completionHandler:", v44, v47, v43, a4);

      }
    }
    else
    {
      v38 = *(_OWORD *)&a3->var0;
      v39 = *(_QWORD *)&a3->var2;
      v37.receiver = self;
      v37.super_class = (Class)VKMapCameraController;
      -[VKScreenCameraController setCenterCoordinateDistanceRange:duration:timingFunction:](&v37, sel_setCenterCoordinateDistanceRange_duration_timingFunction_, &v38, 0, 0.0);
      -[VKMapCameraController updateCameraZBounds](self, "updateCameraZBounds");
    }
  }

}

- (void)animateRegionWithDuration:(double)a3 timingFunction:(id)a4 stepHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  VKTimedAnimation *v13;
  VKTimedAnimation *regionAnimation;
  void *v15;
  _QWORD v16[4];
  void (**v17)(id, _QWORD);
  id v18;
  id location;

  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD))a6;
  -[VKAnimation stop](self->super._regionAnimation, "stop");
  if (self->super._regionAnimation)
  {
    if (v12)
      v12[2](v12, 0);
  }
  else
  {
    v13 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", a3);
    regionAnimation = self->super._regionAnimation;
    self->super._regionAnimation = v13;

    if (v10)
      v15 = v10;
    else
      v15 = VKAnimationCurveEaseInOut;
    -[VKTimedAnimation setTimingFunction:](self->super._regionAnimation, "setTimingFunction:", v15);
    -[VKTimedAnimation setStepHandler:](self->super._regionAnimation, "setStepHandler:", v11);
    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __96__VKMapCameraController_animateRegionWithDuration_timingFunction_stepHandler_completionHandler___block_invoke;
    v16[3] = &unk_1E42F9D20;
    objc_copyWeak(&v18, &location);
    v17 = v12;
    -[VKAnimation setCompletionHandler:](self->super._regionAnimation, "setCompletionHandler:", v16);
    -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1);
    md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), &self->super._regionAnimation->super);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

}

- (void)setRegionRestriction:(id)a3 duration:(double)a4 timingFunction:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  char v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;

  v8 = a3;
  v9 = a5;
  -[VKScreenCameraController regionRestriction](self, "regionRestriction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", v8);

  if ((v11 & 1) == 0)
  {
    v28.receiver = self;
    v28.super_class = (Class)VKMapCameraController;
    -[VKScreenCameraController setRegionRestriction:duration:timingFunction:](&v28, sel_setRegionRestriction_duration_timingFunction_, v8, v9, a4);
    -[VKMapCameraController centerCoordinate](self, "centerCoordinate");
    v13 = v12;
    v15 = v14;
    -[VKScreenCameraController regionRestriction](self, "regionRestriction");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsCoordinate:", v13, v15);

    if ((v17 & 1) == 0)
    {
      -[VKScreenCameraController regionRestriction](self, "regionRestriction");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "clampedCoordinate:", v13, v15);
      v20 = v19;
      v22 = v21;

      -[VKMapCameraController altitude](self, "altitude");
      v24 = v23;
      -[VKMapCameraController yaw](self, "yaw");
      v26 = v25;
      -[VKMapCameraController pitch](self, "pitch");
      -[VKMapCameraController setCenterCoordinate:altitude:yaw:pitch:duration:animationStyle:timingCurve:forceDestination:completion:](self, "setCenterCoordinate:altitude:yaw:pitch:duration:animationStyle:timingCurve:forceDestination:completion:", 1, VKAnimationCurveEaseInOut, 1, 0, v20, v22, v24, v26, v27, a4);
    }
  }

}

- (double)minimumZoomLevel
{
  float v2;

  -[VKMapCameraController currentMinimumNormalizedZoomLevel](self, "currentMinimumNormalizedZoomLevel");
  return v2;
}

- (id)createMoveToZoomOutZoomInFrameFunction:()CameraFrame<geo:(double> *)a3 :()CameraFrame<geo:(double> *)a4 :Radians Radians toLatLon:
{
  double value;
  double v7;
  double v8;
  double v9;
  double v10;
  __double2 v11;
  double v12;
  double v13;
  __double2 v14;
  __double2 v15;
  double v16;
  double v17;
  __double2 v18;
  long double v19;
  long double v20;
  long double v21;
  long double v22;
  long double v23;
  long double v24;
  long double v25;
  long double v26;
  double v27;
  long double v28;
  double v29;
  __double2 v30;
  double v31;
  double v32;
  __double2 v33;
  __double2 v34;
  double v35;
  double v36;
  __double2 v37;
  long double v39;
  double v40;
  double v41;
  long double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  long double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  _QWORD v64[44];

  value = a3->_target.latitude._value;
  v7 = a4->_target.longitude._value;
  v8 = a4->_target.altitude._value;
  v62 = a4->_distanceFromTarget._value;
  v63 = a3->_target.longitude._value;
  v56 = a3->_target.altitude._value;
  v9 = a3->_heading._value;
  v10 = a4->_heading._value;
  v48 = v10;
  v60 = a3->_distanceFromTarget._value;
  v61 = v9;
  v53 = v10 - v9;
  if ((v9 > 0.0) - (v9 < 0.0) == (v10 > 0.0) - (v10 < 0.0))
  {
    v40 = 0.95;
    v51 = 0.05;
  }
  else
  {
    v51 = -v9 / (v10 - v9);
    v40 = v51;
  }
  v59 = a4->_target.latitude._value;
  v11 = __sincos_stret(a4->_target.latitude._value);
  v12 = 6378137.0 / sqrt(-(v11.__sinval * v11.__sinval * 0.00669437999 + -1.0));
  v13 = (v12 + v8) * v11.__cosval;
  v14 = __sincos_stret(v7);
  v55 = v13 * v14.__cosval;
  v15 = __sincos_stret(value);
  v58 = v7;
  v16 = 6378137.0 / sqrt(-(v15.__sinval * v15.__sinval * 0.00669437999 + -1.0));
  v17 = (v16 + v56) * v15.__cosval;
  v18 = __sincos_stret(v63);
  v44 = v17 * v18.__cosval;
  v57 = v8;
  v46 = v13 * v14.__sinval;
  v47 = (v8 + v12 * 0.99330562) * v11.__sinval;
  v43 = v17 * v18.__sinval;
  v45 = fmax(fmax(acos(fmax(fmin((v47 * ((v56 + v16 * 0.99330562) * v15.__sinval)+ v55 * (v17 * v18.__cosval)+ v46 * (v17 * v18.__sinval))/ sqrt((v55 * v55 + v46 * v46 + v47 * v47)* (v44 * v44+ v43 * v43+ (v56 + v16 * 0.99330562) * v15.__sinval * ((v56 + v16 * 0.99330562) * v15.__sinval))), 1.0), -1.0))* 6378137.0, v62 + v8), v60 + v56);
  v19 = fmod(v61 + 3.14159265 + v51 * v53, 6.28318531);
  v42 = fmod(v19 + 6.28318531, 6.28318531) + -3.14159265;
  v20 = fmod(3.14159265 - value + v59, 6.28318531);
  v39 = fmod(v20 + 6.28318531, 6.28318531) + -3.14159265;
  v21 = fmod(value + 3.14159265 + v39 * 0.0500000007, 6.28318531);
  v52 = fmod(v21 + 6.28318531, 6.28318531) + -3.14159265;
  v22 = fmod(3.14159265 - v63 + v58, 6.28318531);
  v23 = fmod(v22 + 6.28318531, 6.28318531) + -3.14159265;
  v24 = fmod(v63 + 3.14159265 + v23 * 0.0500000007, 6.28318531);
  v50 = fmod(v24 + 6.28318531, 6.28318531) + -3.14159265;
  v49 = v56 + (v8 - v56) * 0.05;
  v25 = fmod(v61 + 3.14159265 + v40 * v53, 6.28318531);
  v54 = fmod(v25 + 6.28318531, 6.28318531) + -3.14159265;
  v26 = fmod(value + 3.14159265 + v39 * 0.949999988, 6.28318531);
  v27 = fmod(v26 + 6.28318531, 6.28318531) + -3.14159265;
  v28 = fmod(v63 + 3.14159265 + v23 * 0.949999988, 6.28318531);
  v41 = fmod(v28 + 6.28318531, 6.28318531) + -3.14159265;
  v29 = v56 + (v8 - v56) * 0.95;
  v30 = __sincos_stret(v52);
  v31 = 6378137.0 / sqrt(-(v30.__sinval * v30.__sinval * 0.00669437999 + -1.0));
  v32 = (v31 + v49) * v30.__cosval;
  v33 = __sincos_stret(v50);
  v34 = __sincos_stret(v27);
  v35 = 6378137.0 / sqrt(-(v34.__sinval * v34.__sinval * 0.00669437999 + -1.0));
  v36 = (v35 + v29) * v34.__cosval;
  v37 = __sincos_stret(v41);
  *(double *)&v64[4] = v44;
  *(double *)&v64[5] = v43;
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3321888768;
  v64[2] = __73__VKMapCameraController_createMoveToZoomOutZoomInFrameFunction_toLatLon___block_invoke;
  v64[3] = &__block_descriptor_352_ea8_128c40_ZTSN3gdc11CameraFrameIN3geo7RadiansEdEE184c40_ZTSN3gdc11CameraFrameIN3geo7RadiansEdEE240c40_ZTSN3gdc11CameraFrameIN3geo7RadiansEdEE296c40_ZTSN3gdc11CameraFrameIN3geo7RadiansEdEE_e386__CameraFrame_geo::Radians__double___Coordinate3D_geo::Radians__double___Unit_geo::RadianUnitDescription__double__d__Unit_geo::RadianUnitDescription__double__d__Unit_geo::MeterUnitDescription__double__d___Unit_geo::MeterUnitDescription__double__d__Unit_geo::RadianUnitDescription__double__d__Unit_geo::RadianUnitDescription__double__d__Unit_geo::RadianUnitDescription__double__d__12__0f8l;
  *(double *)&v64[6] = (v56 + v16 * 0.99330562) * v15.__sinval;
  *(double *)&v64[7] = v32 * v33.__cosval;
  *(double *)&v64[8] = v32 * v33.__sinval;
  *(double *)&v64[9] = (v49 + v31 * 0.99330562) * v30.__sinval;
  *(double *)&v64[10] = v36 * v37.__cosval;
  *(double *)&v64[11] = v36 * v37.__sinval;
  *(double *)&v64[12] = (v29 + v35 * 0.99330562) * v34.__sinval;
  *(double *)&v64[13] = v55;
  *(double *)&v64[14] = v46;
  *(double *)&v64[15] = v47;
  *(double *)&v64[16] = value;
  *(double *)&v64[17] = v63;
  *(double *)&v64[18] = v56;
  *(double *)&v64[19] = v60;
  v64[20] = *(_QWORD *)&a3->_pitch._value;
  *(double *)&v64[21] = v61;
  v64[22] = *(_QWORD *)&a3->_roll._value;
  *(double *)&v64[23] = v52;
  *(double *)&v64[24] = v50;
  *(double *)&v64[25] = v49;
  *(double *)&v64[26] = v45;
  v64[27] = 0;
  *(long double *)&v64[28] = v42;
  v64[29] = 0;
  *(double *)&v64[30] = v27;
  *(double *)&v64[31] = v41;
  *(double *)&v64[32] = v29;
  *(double *)&v64[33] = v45;
  v64[34] = 0;
  *(long double *)&v64[35] = v54;
  v64[36] = 0;
  *(double *)&v64[37] = v59;
  *(double *)&v64[38] = v58;
  *(double *)&v64[39] = v57;
  *(double *)&v64[40] = v62;
  v64[41] = *(_QWORD *)&a4->_pitch._value;
  *(double *)&v64[42] = v48;
  v64[43] = *(_QWORD *)&a4->_roll._value;
  return (id)objc_msgSend(v64, "copy");
}

- (id)createFlyoverPreTourAnimation:(id)a3 duration:(double)a4
{
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t *p_shared_owners;
  unint64_t v16;
  void (**v17)(_QWORD *__return_ptr, _QWORD, float);
  double v18;
  _QWORD *v19;
  double v20;
  uint64_t v21;
  float v22;
  float v23;
  BOOL v24;
  double v25;
  double v26;
  float v27;
  int8x16_t v28;
  id v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  int8x16_t v36;
  int8x16_t v37;
  __int128 v38;
  uint64_t v39;
  int8x16_t v40;
  int8x16_t v41;
  _OWORD v42[3];
  uint64_t v43;
  __int128 v44;
  _OWORD v45[3];
  int8x16_t v46;
  uint64_t v47;
  uint64_t v48;
  std::__shared_weak_count *v49;
  _QWORD v50[11007];

  v4 = MEMORY[0x1E0C80A78](self);
  v6 = v5;
  v7 = (void *)v4;
  v50[11006] = *MEMORY[0x1E0C80C00];
  v9 = v8;
  v10 = v9;
  v47 = 0;
  v46 = 0u;
  memset(v45, 0, sizeof(v45));
  v44 = 0u;
  if (v9)
    objc_msgSend(v9, "cameraPathAtIndex:", 0);
  objc_msgSend(v7, "camera");
  v11 = *(_OWORD *)(v48 + 8);
  v12 = *(_OWORD *)(v48 + 24);
  v13 = *(_OWORD *)(v48 + 40);
  v14 = *(_QWORD *)(v48 + 56);
  if (v49)
  {
    p_shared_owners = &v49->__shared_owners_;
    do
      v16 = __ldaxr((unint64_t *)p_shared_owners);
    while (__stlxr(v16 - 1, (unint64_t *)p_shared_owners));
    if (!v16)
    {
      v32 = v12;
      v33 = v13;
      v31 = v11;
      ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
      std::__shared_weak_count::__release_weak(v49);
      v11 = v31;
      v12 = v32;
      v13 = v33;
    }
  }
  v42[0] = v11;
  v42[1] = v12;
  v42[2] = v13;
  v43 = v14;
  v38 = *(_OWORD *)((char *)v45 + 8);
  v39 = *(_QWORD *)&v45[0];
  v40 = vextq_s8(v46, v46, 8uLL);
  v41 = vextq_s8(*(int8x16_t *)((char *)&v45[1] + 8), *(int8x16_t *)((char *)&v45[1] + 8), 8uLL);
  objc_msgSend(v7, "createMoveToZoomOutZoomInFrameFunction:toLatLon:", v42, &v38);
  v17 = (void (**)(_QWORD *__return_ptr, _QWORD, float))objc_claimAutoreleasedReturnValue();
  v18 = v6 * 0.001;
  v19 = v50;
  v20 = 0.0;
  v21 = 1001;
  do
  {
    v22 = v20;
    v23 = v22 + v22;
    v24 = v23 < 1.0;
    v25 = (float)((float)((float)(v23 + -2.0) * (float)(v23 + -2.0)) * (float)(v23 + -2.0)) * 0.5 + 1.0;
    v26 = v23 * v23 * (0.5 * v23);
    if (!v24)
      v26 = v25;
    v27 = v26;
    ((void (**)(__int128 *__return_ptr, _QWORD, float))v17)[2](&v34, v17, v27);
    *(v19 - 3) = v35;
    v28 = vextq_s8(v37, v37, 8uLL);
    *((_OWORD *)v19 - 1) = v34;
    *(int8x16_t *)v19 = v28;
    *(int8x16_t *)(v19 + 3) = vextq_s8(v36, v36, 8uLL);
    *((double *)v19 + 2) = v18;
    *(v19 - 5) = 0x3F80000000000000;
    v20 = v20 + 0.001;
    v19 += 11;
    --v21;
  }
  while (v21);
  v29 = objc_alloc_init(MEMORY[0x1E0D272D8]);
  objc_msgSend(v29, "setCameraPaths:count:", &v48, 1001);

  return v29;
}

- (void)prepareFlyoverAnimation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  long double v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  _OWORD v22[2];

  v6 = a3;
  v7 = a4;
  memset(v22, 0, 24);
  if (v6)
    objc_msgSend(v6, "cameraPathAtIndex:", 0);
  -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1);
  -[VKCameraController camera](self, "camera");
  *(_OWORD *)(v20 + 8) = *(_OWORD *)((char *)v22 + 8);
  *(_QWORD *)(v20 + 24) = *(_QWORD *)&v22[0];
  if (v21)
  {
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v21->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  -[VKCameraController camera](self, "camera");
  *(_QWORD *)(v20 + 32) = 0;
  if (v21)
  {
    v10 = (unint64_t *)&v21->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)())v21->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  -[VKCameraController camera](self, "camera");
  *(_QWORD *)(v20 + 40) = 0;
  if (v21)
  {
    v12 = (unint64_t *)&v21->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)())v21->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  -[VKCameraController camera](self, "camera");
  v14 = fmod(0.0 + 3.14159265, 6.28318531);
  *(long double *)(v20 + 48) = fmod(v14 + 6.28318531, 6.28318531) + -3.14159265;
  if (v21)
  {
    v15 = (unint64_t *)&v21->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)())v21->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  -[VKCameraController camera](self, "camera");
  *(_QWORD *)(v20 + 56) = 0;
  if (v21)
  {
    v17 = (unint64_t *)&v21->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)())v21->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  -[VKCameraController cameraDelegate](self, "cameraDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "mapLayerDidChangeVisibleRegion");

  -[VKCameraController endRegionChange](self, "endRegionChange");
}

- (void)startFlyoverTourAnimation:(unint64_t)a3 animateToStart:(BOOL)a4 labelChanged:(id)a5 stateChange:(id)a6
{
  id v10;
  id v11;
  shared_ptr<md::VKFlyoverTour> *p_flyoverTour;
  VKFlyoverTour *ptr;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  BOOL v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  md::VKFlyoverTour *v24;
  __shared_weak_count *cntrl;
  unint64_t *v26;
  unint64_t v27;
  void *v28;
  VKMapCameraController *v29;
  id v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  id location;
  id v35;
  _BYTE v36[24];
  _BYTE *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  p_flyoverTour = &self->_flyoverTour;
  if (!self->_flyoverTour.__ptr_)
  {
    v23 = operator new(0x118uLL);
    v23[1] = 0;
    v23[2] = 0;
    *v23 = &off_1E4289F80;
    v24 = md::VKFlyoverTour::VKFlyoverTour((md::VKFlyoverTour *)(v23 + 3));
    cntrl = self->_flyoverTour.__cntrl_;
    p_flyoverTour->__ptr_ = (VKFlyoverTour *)v24;
    self->_flyoverTour.__cntrl_ = (__shared_weak_count *)v23;
    if (cntrl)
    {
      v26 = (unint64_t *)((char *)cntrl + 8);
      do
        v27 = __ldaxr(v26);
      while (__stlxr(v27 - 1, v26));
      if (!v27)
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      }
    }
  }
  objc_initWeak(&location, self);
  ptr = p_flyoverTour->__ptr_;
  v29 = self;
  objc_copyWeak(&v30, &location);
  v31 = MEMORY[0x1A1AF5730](v11);
  v32 = a4;
  v33 = MEMORY[0x1A1AF5730](v10);
  v37 = 0;
  v14 = operator new(0x30uLL);
  *(_QWORD *)v14 = &off_1E42ED340;
  *((_QWORD *)v14 + 1) = v29;
  objc_moveWeak((id *)v14 + 2, &v30);
  *((_QWORD *)v14 + 3) = v31;
  *((_BYTE *)v14 + 32) = v32;
  v15 = v33;
  v31 = 0;
  v33 = 0;
  *((_QWORD *)v14 + 5) = v15;
  v37 = v14;
  objc_destroyWeak(&v30);

  v16 = *(_QWORD **)(*(_QWORD *)ptr + 8);
  if (!v16)
    goto LABEL_13;
  v17 = *(_QWORD *)ptr + 8;
  do
  {
    v18 = v16[4];
    v19 = v18 >= a3;
    if (v18 >= a3)
      v20 = v16;
    else
      v20 = v16 + 1;
    if (v19)
      v17 = (uint64_t)v16;
    v16 = (_QWORD *)*v20;
  }
  while (*v20);
  if (v17 == *(_QWORD *)ptr + 8 || *(_QWORD *)(v17 + 32) > a3)
  {
LABEL_13:
    v35 = 0;
    (*(void (**)(void *, id *))(*(_QWORD *)v14 + 48))(v14, &v35);

    goto LABEL_14;
  }
  v28 = *(void **)(v17 + 40);
  if (!v28)
  {
LABEL_14:
    v21 = v37;
    if (v37 == v36)
    {
      v22 = 4;
      v21 = v36;
    }
    else
    {
      if (!v37)
      {
LABEL_24:
        objc_destroyWeak(&location);

        return;
      }
      v22 = 5;
    }
    (*(void (**)(void))(*v21 + 8 * v22))();
    goto LABEL_24;
  }
  v35 = v28;
  if (v37)
  {
    (*(void (**)(_BYTE *, id *))(*(_QWORD *)v37 + 48))(v37, &v35);

    goto LABEL_14;
  }
  std::__throw_bad_function_call[abi:nn180100]();
  __break(1u);
}

- (void)flyoverTourAnimation:(id)a3 animateToStart:(BOOL)a4 labelChanged:(id)a5 stateChange:(id)a6
{
  VKTimedAnimation *moveToTourPositionAnimation;
  _QWORD *v10;
  VKFlyoverTour *v11;
  __shared_weak_count *cntrl;
  unint64_t *v13;
  unint64_t v14;
  VKFlyoverTour *ptr;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  float v21;
  NSObject *v22;
  int v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  char **v32;
  unint64_t v33;
  __int16 v34;
  int v35;
  double v36;
  _OWORD *v37;
  int v38;
  __int128 v39;
  char *v40;
  __int128 v41;
  char *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  unint64_t v47;
  unint64_t v48;
  char *v49;
  __int128 v50;
  char *v51;
  __int128 v52;
  char *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  unint64_t v59;
  char *v60;
  uint64_t v61;
  unsigned int v62;
  char *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  unint64_t v68;
  unint64_t v69;
  char *v70;
  __int128 v71;
  char *v72;
  __int128 v73;
  char *v74;
  void *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  char *v80;
  unint64_t v81;
  double *v82;
  double *v83;
  char *v84;
  char *v85;
  char *v86;
  char *v87;
  __int128 v88;
  _BYTE *v89;
  _BYTE *v90;
  char *v91;
  char *v92;
  char *v93;
  char *v94;
  __int128 v95;
  _BYTE *v96;
  _BYTE *v97;
  char *v98;
  char *v99;
  char *v100;
  char *v101;
  __int128 v102;
  _BYTE *v103;
  _BYTE *v104;
  char *v105;
  uint64_t v106;
  char *v107;
  char *v108;
  unint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  __int128 *v113;
  uint64_t v114;
  __int128 v115;
  uint64_t v116;
  double v117;
  unint64_t v118;
  int v119;
  char *v120;
  float v121;
  __int128 v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  __double2 v129;
  double v130;
  double v131;
  __double2 v132;
  double v133;
  unint64_t v134;
  double *v135;
  _QWORD *v136;
  unint64_t v137;
  double *v138;
  unint64_t v139;
  unint64_t v140;
  unint64_t v141;
  unint64_t v142;
  double v143;
  uint64_t v144;
  char *v145;
  double *v146;
  unint64_t v147;
  unint64_t v148;
  unint64_t v149;
  uint64_t v150;
  char *v151;
  double *v152;
  __int128 v153;
  __int128 v154;
  char *v155;
  double *v156;
  double *v157;
  double v158;
  double v159;
  double v160;
  unint64_t v161;
  double *v162;
  double v163;
  unint64_t v164;
  unint64_t v165;
  unint64_t v166;
  char *v167;
  double *v168;
  double *v169;
  __int128 v170;
  unint64_t v171;
  _QWORD *v172;
  __int128 v173;
  _QWORD *v174;
  _QWORD *v175;
  unint64_t v176;
  unint64_t v177;
  unint64_t v178;
  char *v179;
  char *v180;
  char *v181;
  unint64_t v182;
  double *v183;
  double *v184;
  double *v185;
  uint64_t v186;
  unint64_t v187;
  uint64_t v188;
  unint64_t v189;
  _BYTE *v190;
  double *v191;
  unint64_t v192;
  uint64_t v193;
  _OWORD *v194;
  double *v195;
  uint64_t v196;
  uint64_t v197;
  unint64_t v198;
  int v199;
  void *v200;
  void *v201;
  _QWORD *v202;
  id v203;
  char *v204;
  double *v205;
  double *v206;
  double v207;
  double v208;
  unint64_t v209;
  unint64_t v210;
  void **v211;
  uint64_t v212;
  char *v213;
  char *v214;
  char *v215;
  char *v216;
  uint64_t v217;
  __int128 v218;
  void **v219;
  unint64_t v220;
  float v221;
  unsigned int v222;
  float v223;
  unint64_t v224;
  float v225;
  unint64_t v226;
  char *v227;
  void *v228;
  void *v229;
  _BYTE *v230;
  _QWORD *v231;
  std::string *v232;
  __int128 v233;
  char *v234;
  void *v235;
  md::AnimationData *v236;
  md::AnimationData **v237;
  md::AnimationData *v238;
  void *v239;
  int v240;
  uint64_t v241;
  unint64_t v242;
  char *v243;
  _QWORD *v244;
  uint64_t v245;
  uint64_t v246;
  _QWORD *v247;
  uint64_t v248;
  uint64_t v249;
  _QWORD *v250;
  uint64_t v251;
  uint64_t *v252;
  uint64_t *v253;
  uint64_t v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  void *v258;
  int v259;
  uint64_t v260;
  uint64_t (***v261)();
  VKMapCameraController *v262;
  uint64_t v263;
  uint64_t (***v264)();
  uint64_t v265;
  uint64_t (***v266)();
  uint64_t v267;
  _QWORD *mapEngine;
  int8x8_t *v269;
  int8x8_t v270;
  uint8x8_t v271;
  unint64_t v272;
  uint64_t v273;
  _QWORD *v274;
  _QWORD *v275;
  unint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t (***v279)();
  uint64_t v280;
  NSObject *v281;
  uint8x8_t v282;
  unint64_t v283;
  _QWORD *v284;
  _QWORD *v285;
  unint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t (***v289)();
  uint64_t v290;
  NSObject *v291;
  uint8x8_t v292;
  uint64_t v293;
  _QWORD *v294;
  _QWORD *v295;
  uint64_t v296;
  unint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  std::__shared_weak_count *v301;
  unint64_t *p_shared_owners;
  unint64_t v303;
  unint64_t *v304;
  unint64_t v305;
  NSObject *v306;
  VKTimedAnimation *v307;
  id *p_flyoverAnimation;
  id v309;
  uint64_t v310;
  void (**v311)(id, uint64_t);
  float v312;
  void *v313;
  double v314;
  _QWORD *v315;
  VKFlyoverTour *v316;
  id v317;
  shared_ptr<md::VKFlyoverTour> *p_flyoverTour;
  md::AnimationData **v319;
  _BOOL4 v320;
  id v321;
  VKMapCameraController *v322;
  id v323;
  void (**v324)(id, uint64_t);
  void **v325;
  void *v326;
  unint64_t v327;
  float v328;
  float v329;
  uint64_t v330;
  double v331;
  double v332;
  char *__p;
  _QWORD v334[4];
  void (**v335)(id, uint64_t);
  id v336;
  _QWORD v337[4];
  void (**v338)(id, uint64_t);
  id v339;
  _QWORD v340[4];
  id v341;
  id v342;
  id v343;
  id from;
  uint64_t v345;
  id to;
  uint64_t v347;
  id location;
  uint64_t (**v349)();
  id v350;
  uint64_t (***v351)();
  char v352;
  uint64_t (**v353)();
  id v354;
  uint64_t (***v355)();
  char v356;
  uint64_t (**v357)();
  id v358;
  uint64_t (***v359)();
  uint64_t (**v360)();
  id v361[2];
  uint64_t (***v362)();
  uint64_t (**v363)();
  id v364[2];
  uint64_t (***v365)();
  _QWORD buf[4];
  __int128 v367;
  __int128 v368;
  __int128 v369;
  uint64_t v370;
  uint64_t v371;

  v320 = a4;
  v371 = *MEMORY[0x1E0C80C00];
  v323 = a3;
  v321 = a5;
  v324 = (void (**)(id, uint64_t))a6;
  moveToTourPositionAnimation = self->super._moveToTourPositionAnimation;
  if (moveToTourPositionAnimation)
    -[VKAnimation stop](moveToTourPositionAnimation, "stop");
  *(int64x2_t *)&self->_resumeTourPosition._target.latitude._value = vdupq_n_s64(0xC00921FB54442D18);
  *(_OWORD *)&self->_resumeTourPosition._target.altitude._value = 0u;
  *(_OWORD *)&self->_resumeTourPosition._pitch._value = 0u;
  self->_resumeTourPosition._roll._value = 0.0;
  self->_resumeTourFraction = 0.0;
  -[VKMapCameraController stopFlyoverTourAnimation](self, "stopFlyoverTourAnimation");
  if (!v323 || self->super._flyoverAnimation)
  {
    if (v324)
      v324[2](v324, 6);
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
    v22 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19F029000, v22, OS_LOG_TYPE_ERROR, "Flyover Tour: failed to start", (uint8_t *)buf, 2u);
    }

    goto LABEL_460;
  }
  v10 = operator new(0x118uLL);
  v10[1] = 0;
  v10[2] = 0;
  *v10 = &off_1E4289F80;
  v11 = (VKFlyoverTour *)md::VKFlyoverTour::VKFlyoverTour((md::VKFlyoverTour *)(v10 + 3));
  cntrl = self->_flyoverTour.__cntrl_;
  self->_flyoverTour.__ptr_ = v11;
  self->_flyoverTour.__cntrl_ = (__shared_weak_count *)v10;
  p_flyoverTour = &self->_flyoverTour;
  if (cntrl)
  {
    v13 = (unint64_t *)((char *)cntrl + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  v322 = self;
  objc_initWeak(&location, self);
  ptr = p_flyoverTour->__ptr_;
  objc_copyWeak(&to, &location);
  v347 = MEMORY[0x1A1AF5730](v321);
  v365 = 0;
  v363 = &off_1E42ED3B0;
  objc_moveWeak(v364, &to);
  v16 = (void *)v347;
  v347 = 0;
  v364[1] = v16;
  v365 = &v363;
  objc_destroyWeak(&to);
  objc_copyWeak(&from, &location);
  v345 = MEMORY[0x1A1AF5730](v324);
  v362 = 0;
  v360 = &off_1E42ED3F8;
  objc_moveWeak(v361, &from);
  v17 = (void *)v345;
  v345 = 0;
  v361[1] = v17;
  v362 = &v360;
  objc_destroyWeak(&from);
  objc_copyWeak(&v343, &location);
  v359 = 0;
  v357 = &off_1E42ED468;
  objc_moveWeak(&v358, &v343);
  v359 = &v357;
  objc_destroyWeak(&v343);
  v317 = v323;
  v18 = *((_QWORD *)ptr + 27);
  if (!v18)
    goto LABEL_36;
  v19 = (uint64_t *)*((_QWORD *)ptr + 1);
  if (v19)
  {
    v20 = *v19;
    if (v20)
      v21 = *(double *)(v20 + 144);
    else
      v21 = 0.0;
    if (vabds_f32(*((float *)ptr + 35), v21) <= 0.01)
      v23 = 5;
    else
      v23 = 3;
  }
  else
  {
    v23 = 5;
  }
  LODWORD(buf[0]) = v23;
  (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v18 + 48))(v18, buf);
  v24 = (_QWORD *)*((_QWORD *)ptr + 27);
  *((_QWORD *)ptr + 27) = 0;
  if (v24 == (_QWORD *)((char *)ptr + 192))
  {
    v25 = 4;
    v24 = (_QWORD *)((char *)ptr + 192);
    goto LABEL_30;
  }
  if (v24)
  {
    v25 = 5;
LABEL_30:
    (*(void (**)(void))(*v24 + 8 * v25))();
  }
  v26 = (_QWORD *)*((_QWORD *)ptr + 31);
  *((_QWORD *)ptr + 31) = 0;
  if (v26 == (_QWORD *)((char *)ptr + 224))
  {
    v27 = 4;
    v26 = (_QWORD *)((char *)ptr + 224);
  }
  else
  {
    if (!v26)
      goto LABEL_36;
    v27 = 5;
  }
  (*(void (**)(void))(*v26 + 8 * v27))();
LABEL_36:
  v28 = operator new();
  v315 = (_QWORD *)((char *)ptr + 192);
  v316 = ptr;
  v29 = v317;
  *(_QWORD *)(v28 + 24) = 0;
  *(_BYTE *)(v28 + 32) = 0;
  *(_QWORD *)v28 = 0;
  *(_QWORD *)(v28 + 8) = 0;
  v319 = (md::AnimationData **)v28;
  *(_DWORD *)(v28 + 16) = 0;
  v30 = operator new();
  v31 = v29;
  *(_OWORD *)(v30 + 96) = 0u;
  v325 = (void **)(v30 + 96);
  v326 = v31;
  v32 = (char **)(v30 + 120);
  *(_OWORD *)v30 = 0u;
  *(_OWORD *)(v30 + 16) = 0u;
  *(_OWORD *)(v30 + 32) = 0u;
  *(_OWORD *)(v30 + 48) = 0u;
  *(_OWORD *)(v30 + 64) = 0u;
  *(_OWORD *)(v30 + 80) = 0u;
  *(_OWORD *)(v30 + 112) = 0u;
  *(_OWORD *)(v30 + 128) = 0u;
  *(_OWORD *)(v30 + 137) = 0u;
  *(_BYTE *)(v30 + 152) = objc_msgSend(v31, "useSplines");
  v33 = objc_msgSend(v31, "cameraPathsCount");
  if (!v33)
  {
    __p = 0;
    goto LABEL_92;
  }
  if (v33 == 1)
  {
    v370 = 0;
    v368 = 0u;
    v369 = 0u;
    v367 = 0u;
    memset(buf, 0, sizeof(buf));
    objc_msgSend(v31, "cameraPathAtIndex:", 0);
    v34 = v370;
    if ((v370 & 1) == 0)
    {
      v34 = v370 | 1;
      LOWORD(v370) = v370 | 1;
      LODWORD(buf[0]) = 0;
    }
    if ((v34 & 2) == 0)
    {
      LOWORD(v370) = v34 | 2;
      HIDWORD(buf[0]) = 1065353216;
    }
    v35 = _AXSReduceMotionEnabled();
    v36 = 30.0;
    if (!v35)
      v36 = 15.0;
    *((double *)&v368 + 1) = v36;
    v37 = operator new(0x318uLL);
    v38 = 0;
    v39 = v368;
    v40 = (char *)v37 + 792;
    v37[2] = v367;
    v37[3] = v39;
    v37[4] = v369;
    *((_QWORD *)v37 + 10) = v370;
    v41 = *(_OWORD *)&buf[2];
    v42 = (char *)v37 + 88;
    *v37 = *(_OWORD *)buf;
    v37[1] = v41;
    __p = (char *)v37;
    while (1)
    {
      *(double *)&v368 = *(double *)&v368 + 1.57079633;
      if (v42 >= v40)
        break;
      v43 = *(_OWORD *)&buf[2];
      *(_OWORD *)v42 = *(_OWORD *)buf;
      *((_OWORD *)v42 + 1) = v43;
      v44 = v367;
      v45 = v368;
      v46 = v369;
      *((_QWORD *)v42 + 10) = v370;
      *((_OWORD *)v42 + 3) = v45;
      *((_OWORD *)v42 + 4) = v46;
      *((_OWORD *)v42 + 2) = v44;
      v42 += 88;
LABEL_46:
      if (++v38 == 8)
      {
        v33 = 0x2E8BA2E8BA2E8BA3 * ((v42 - __p) >> 3);
        goto LABEL_92;
      }
    }
    v47 = 0x2E8BA2E8BA2E8BA3 * ((v42 - __p) >> 3) + 1;
    if (v47 > 0x2E8BA2E8BA2E8BALL)
      abort();
    if (0x5D1745D1745D1746 * ((v40 - __p) >> 3) > v47)
      v47 = 0x5D1745D1745D1746 * ((v40 - __p) >> 3);
    if ((unint64_t)(0x2E8BA2E8BA2E8BA3 * ((v40 - __p) >> 3)) >= 0x1745D1745D1745DLL)
      v48 = 0x2E8BA2E8BA2E8BALL;
    else
      v48 = v47;
    if (v48)
    {
      if (v48 > 0x2E8BA2E8BA2E8BALL)
        goto LABEL_461;
      v49 = (char *)operator new(88 * v48);
    }
    else
    {
      v49 = 0;
    }
    v50 = v368;
    v51 = &v49[8 * ((v42 - __p) >> 3)];
    v40 = &v49[88 * v48];
    *((_OWORD *)v51 + 2) = v367;
    *((_OWORD *)v51 + 3) = v50;
    *((_OWORD *)v51 + 4) = v369;
    *((_QWORD *)v51 + 10) = v370;
    v52 = *(_OWORD *)&buf[2];
    *(_OWORD *)v51 = *(_OWORD *)buf;
    *((_OWORD *)v51 + 1) = v52;
    v53 = v51 + 88;
    if (v42 == __p)
    {
      v54 = __p;
    }
    else
    {
      v54 = __p;
      do
      {
        v55 = *(_OWORD *)(v42 - 88);
        *(_OWORD *)(v51 - 72) = *(_OWORD *)(v42 - 72);
        *(_OWORD *)(v51 - 88) = v55;
        v56 = *(_OWORD *)(v42 - 56);
        v57 = *(_OWORD *)(v42 - 40);
        v58 = *(_OWORD *)(v42 - 24);
        *((_QWORD *)v51 - 1) = *((_QWORD *)v42 - 1);
        *(_OWORD *)(v51 - 24) = v58;
        *(_OWORD *)(v51 - 40) = v57;
        *(_OWORD *)(v51 - 56) = v56;
        v51 -= 88;
        v42 -= 88;
      }
      while (v42 != __p);
      if (!__p)
        goto LABEL_65;
    }
    operator delete(v54);
LABEL_65:
    __p = v51;
    v42 = v53;
    v32 = (char **)(v30 + 120);
    goto LABEL_46;
  }
  if (v33 > 0x2E8BA2E8BA2E8BALL)
    abort();
  v59 = v33;
  v60 = (char *)operator new(88 * v33);
  v61 = 0;
  v62 = 0;
  v63 = &v60[88 * v59];
  __p = v60;
  do
  {
    objc_msgSend(v31, "cameraPathAtIndex:", v61);
    if (v60 < v63)
    {
      v64 = *(_OWORD *)&buf[2];
      *(_OWORD *)v60 = *(_OWORD *)buf;
      *((_OWORD *)v60 + 1) = v64;
      v65 = v367;
      v66 = v368;
      v67 = v369;
      *((_QWORD *)v60 + 10) = v370;
      *((_OWORD *)v60 + 3) = v66;
      *((_OWORD *)v60 + 4) = v67;
      *((_OWORD *)v60 + 2) = v65;
      v60 += 88;
      v31 = v326;
    }
    else
    {
      v68 = 0x2E8BA2E8BA2E8BA3 * ((v60 - __p) >> 3) + 1;
      if (v68 > 0x2E8BA2E8BA2E8BALL)
        abort();
      if (0x5D1745D1745D1746 * ((v63 - __p) >> 3) > v68)
        v68 = 0x5D1745D1745D1746 * ((v63 - __p) >> 3);
      if ((unint64_t)(0x2E8BA2E8BA2E8BA3 * ((v63 - __p) >> 3)) >= 0x1745D1745D1745DLL)
        v69 = 0x2E8BA2E8BA2E8BALL;
      else
        v69 = v68;
      if (v69)
      {
        if (v69 > 0x2E8BA2E8BA2E8BALL)
LABEL_461:
          std::__throw_bad_array_new_length[abi:nn180100]();
        v70 = (char *)operator new(88 * v69);
      }
      else
      {
        v70 = 0;
      }
      v71 = v368;
      v72 = &v70[8 * ((v60 - __p) >> 3)];
      *((_OWORD *)v72 + 2) = v367;
      *((_OWORD *)v72 + 3) = v71;
      *((_OWORD *)v72 + 4) = v369;
      *((_QWORD *)v72 + 10) = v370;
      v73 = *(_OWORD *)&buf[2];
      *(_OWORD *)v72 = *(_OWORD *)buf;
      *((_OWORD *)v72 + 1) = v73;
      if (v60 == __p)
      {
        v80 = &v70[8 * ((v60 - __p) >> 3)];
        v31 = v326;
        v75 = __p;
      }
      else
      {
        v74 = &v70[8 * ((v60 - __p) >> 3)];
        v31 = v326;
        v75 = __p;
        do
        {
          v76 = *(_OWORD *)(v60 - 88);
          *(_OWORD *)(v74 - 72) = *(_OWORD *)(v60 - 72);
          *(_OWORD *)(v74 - 88) = v76;
          v77 = *(_OWORD *)(v60 - 56);
          v78 = *(_OWORD *)(v60 - 40);
          v79 = *(_OWORD *)(v60 - 24);
          v80 = v74 - 88;
          *((_QWORD *)v74 - 1) = *((_QWORD *)v60 - 1);
          *(_OWORD *)(v74 - 24) = v79;
          *(_OWORD *)(v74 - 40) = v78;
          *(_OWORD *)(v74 - 56) = v77;
          v60 -= 88;
          v74 -= 88;
        }
        while (v60 != __p);
      }
      v63 = &v70[88 * v69];
      v60 = v72 + 88;
      if (v75)
        operator delete(v75);
      __p = v80;
      v32 = (char **)(v30 + 120);
    }
    v61 = ++v62;
  }
  while (v59 > v62);
  v33 = v59;
LABEL_92:
  v327 = v33;
  v81 = v33;
  v82 = *(double **)v30;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v30 + 16) - *(_QWORD *)v30) >> 3) < v33)
  {
    v83 = *(double **)(v30 + 8);
    v84 = (char *)operator new(24 * v33);
    v85 = &v84[24 * (((char *)v83 - (char *)v82) / 24)];
    v86 = v85;
    if (v83 != v82)
    {
      v87 = &v84[24 * (((char *)v83 - (char *)v82) / 24)];
      do
      {
        v86 = v87 - 24;
        v88 = *(_OWORD *)(v83 - 3);
        *((double *)v87 - 1) = *(v83 - 1);
        *(_OWORD *)(v87 - 24) = v88;
        v83 -= 3;
        v87 -= 24;
      }
      while (v83 != v82);
    }
    *(_QWORD *)v30 = v86;
    *(_QWORD *)(v30 + 8) = v85;
    *(_QWORD *)(v30 + 16) = &v84[24 * v81];
    if (v82)
      operator delete(v82);
  }
  v89 = *(_BYTE **)(v30 + 24);
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v30 + 40) - (_QWORD)v89) >> 3) < v81)
  {
    v90 = *(_BYTE **)(v30 + 32);
    v91 = (char *)operator new(24 * v81);
    v92 = &v91[24 * ((v90 - v89) / 24)];
    v93 = v92;
    if (v90 != v89)
    {
      v94 = &v91[24 * ((v90 - v89) / 24)];
      do
      {
        v93 = v94 - 24;
        v95 = *(_OWORD *)(v90 - 24);
        *((_QWORD *)v94 - 1) = *((_QWORD *)v90 - 1);
        *(_OWORD *)(v94 - 24) = v95;
        v90 -= 24;
        v94 -= 24;
      }
      while (v90 != v89);
    }
    *(_QWORD *)(v30 + 24) = v93;
    *(_QWORD *)(v30 + 32) = v92;
    *(_QWORD *)(v30 + 40) = &v91[24 * v81];
    if (v89)
      operator delete(v89);
  }
  v96 = *(_BYTE **)(v30 + 48);
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v30 + 64) - (_QWORD)v96) >> 3) < v81)
  {
    v97 = *(_BYTE **)(v30 + 56);
    v98 = (char *)operator new(24 * v81);
    v99 = &v98[24 * ((v97 - v96) / 24)];
    v100 = v99;
    if (v97 != v96)
    {
      v101 = &v98[24 * ((v97 - v96) / 24)];
      do
      {
        v100 = v101 - 24;
        v102 = *(_OWORD *)(v97 - 24);
        *((_QWORD *)v101 - 1) = *((_QWORD *)v97 - 1);
        *(_OWORD *)(v101 - 24) = v102;
        v97 -= 24;
        v101 -= 24;
      }
      while (v97 != v96);
    }
    *(_QWORD *)(v30 + 48) = v100;
    *(_QWORD *)(v30 + 56) = v99;
    *(_QWORD *)(v30 + 64) = &v98[24 * v81];
    if (v96)
      operator delete(v96);
  }
  v103 = *(_BYTE **)(v30 + 72);
  if (v81 > (uint64_t)(*(_QWORD *)(v30 + 88) - (_QWORD)v103) >> 3)
  {
    v104 = *(_BYTE **)(v30 + 80);
    v105 = (char *)operator new(8 * v81);
    v106 = v104 - v103;
    v107 = &v105[(v104 - v103) & 0xFFFFFFFFFFFFFFF8];
    v108 = v107;
    if (v104 == v103)
      goto LABEL_119;
    v109 = v104 - v103 - 8;
    if (v109 >= 0x58)
    {
      v108 = &v105[(v104 - v103) & 0xFFFFFFFFFFFFFFF8];
      if ((unint64_t)(v104 - &v105[v106 & 0xFFFFFFFFFFFFFFF8]) >= 0x20)
      {
        v110 = v106 >> 3;
        v111 = (v109 >> 3) + 1;
        v112 = &v105[8 * v110 - 16];
        v113 = (__int128 *)(v104 - 16);
        v114 = v111 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v115 = *v113;
          *((_OWORD *)v112 - 1) = *(v113 - 1);
          *(_OWORD *)v112 = v115;
          v112 -= 32;
          v113 -= 2;
          v114 -= 4;
        }
        while (v114);
        v108 = &v107[-8 * (v111 & 0x3FFFFFFFFFFFFFFCLL)];
        v104 -= 8 * (v111 & 0x3FFFFFFFFFFFFFFCLL);
        if (v111 == (v111 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_119:
          *(_QWORD *)(v30 + 72) = v108;
          *(_QWORD *)(v30 + 80) = v107;
          *(_QWORD *)(v30 + 88) = &v105[8 * v81];
          if (v103)
            operator delete(v103);
          goto LABEL_121;
        }
      }
    }
    else
    {
      v108 = &v105[(v104 - v103) & 0xFFFFFFFFFFFFFFF8];
    }
    do
    {
      v116 = *((_QWORD *)v104 - 1);
      v104 -= 8;
      *((_QWORD *)v108 - 1) = v116;
      v108 -= 8;
    }
    while (v104 != v103);
    goto LABEL_119;
  }
LABEL_121:
  std::vector<geo::_retain_ptr<CAMediaTimingFunction * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>::reserve((uint64_t)v325, v81);
  if (v327)
  {
    v118 = 0;
    v119 = 0;
    do
    {
      v120 = &__p[88 * v118];
      v121 = *((float *)v120 + 1);
      *(_QWORD *)&v122 = *((_QWORD *)v120 + 2);
      v123 = *((double *)v120 + 3);
      v125 = *((double *)v120 + 4);
      v124 = *((double *)v120 + 5);
      v126 = *((double *)v120 + 6);
      v331 = v124;
      v332 = *((double *)v120 + 7);
      v127 = *((double *)v120 + 8);
      v330 = *((_QWORD *)v120 + 9);
      if (*(_BYTE *)(v30 + 152))
      {
        v328 = *((float *)v120 + 1);
        v128 = *((double *)v120 + 2);
        v129 = __sincos_stret(v123);
        v130 = 6378137.0 / sqrt(v129.__sinval * v129.__sinval * -0.00669437999 + 1.0);
        v131 = (v130 + v128) * v129.__cosval;
        v132 = __sincos_stret(v125);
        v124 = v131 * v132.__cosval;
        *(double *)&v122 = v131 * v132.__sinval;
        v133 = (v128 + v130 * 0.99330562) * v129.__sinval;
        v135 = *(double **)(v30 + 8);
        v134 = *(_QWORD *)(v30 + 16);
        if ((unint64_t)v135 >= v134)
        {
          v138 = *(double **)v30;
          v139 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v135 - *(_QWORD *)v30) >> 3);
          v140 = v139 + 1;
          if (v139 + 1 > 0xAAAAAAAAAAAAAAALL)
            abort();
          v141 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v134 - (_QWORD)v138) >> 3);
          if (2 * v141 > v140)
            v140 = 2 * v141;
          if (v141 >= 0x555555555555555)
            v142 = 0xAAAAAAAAAAAAAAALL;
          else
            v142 = v140;
          v121 = v328;
          if (v142)
          {
            if (v142 > 0xAAAAAAAAAAAAAAALL)
              goto LABEL_461;
            v143 = v124;
            v144 = v122;
            v145 = (char *)operator new(24 * v142);
            *(_QWORD *)&v122 = v144;
            v124 = v143;
            v121 = v328;
            v133 = (v128 + v130 * 0.99330562) * v129.__sinval;
          }
          else
          {
            v145 = 0;
          }
          v151 = &v145[24 * v139];
          *(double *)v151 = v124;
          *((_QWORD *)v151 + 1) = v122;
          *((double *)v151 + 2) = v133;
          v152 = (double *)v151;
          if (v135 != v138)
          {
            do
            {
              v153 = *(_OWORD *)(v135 - 3);
              *(v152 - 1) = *(v135 - 1);
              *(_OWORD *)(v152 - 3) = v153;
              v152 -= 3;
              v135 -= 3;
            }
            while (v135 != v138);
            goto LABEL_154;
          }
          goto LABEL_155;
        }
        *v135 = v124;
        *((_QWORD *)v135 + 1) = v122;
        v136 = v135 + 3;
        v135[2] = v133;
        v121 = v328;
      }
      else
      {
        v135 = *(double **)(v30 + 8);
        v137 = *(_QWORD *)(v30 + 16);
        if ((unint64_t)v135 >= v137)
        {
          v146 = *(double **)v30;
          v147 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v135 - *(_QWORD *)v30) >> 3);
          v148 = v147 + 1;
          if (v147 + 1 > 0xAAAAAAAAAAAAAAALL)
            abort();
          v149 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v137 - (_QWORD)v146) >> 3);
          if (2 * v149 > v148)
            v148 = 2 * v149;
          if (v149 >= 0x555555555555555)
            v142 = 0xAAAAAAAAAAAAAAALL;
          else
            v142 = v148;
          if (v142)
          {
            v329 = v121;
            if (v142 > 0xAAAAAAAAAAAAAAALL)
              goto LABEL_461;
            v150 = v122;
            v145 = (char *)operator new(24 * v142);
            *(_QWORD *)&v122 = v150;
            v121 = v329;
          }
          else
          {
            v145 = 0;
          }
          v151 = &v145[24 * v147];
          *(double *)v151 = v123;
          *((double *)v151 + 1) = v125;
          *((_QWORD *)v151 + 2) = v122;
          v152 = (double *)v151;
          if (v135 != v146)
          {
            do
            {
              v154 = *(_OWORD *)(v135 - 3);
              *(v152 - 1) = *(v135 - 1);
              *(_OWORD *)(v152 - 3) = v154;
              v152 -= 3;
              v135 -= 3;
            }
            while (v135 != v146);
LABEL_154:
            v135 = *(double **)v30;
          }
LABEL_155:
          v155 = &v145[24 * v142];
          v136 = v151 + 24;
          *(_QWORD *)v30 = v152;
          *(_QWORD *)(v30 + 8) = v151 + 24;
          *(_QWORD *)(v30 + 16) = v155;
          if (v135)
            operator delete(v135);
          goto LABEL_157;
        }
        *v135 = v123;
        v135[1] = v125;
        v136 = v135 + 3;
        *((_QWORD *)v135 + 2) = v122;
      }
LABEL_157:
      *(_QWORD *)(v30 + 8) = v136;
      v156 = *(double **)(v30 + 48);
      v157 = *(double **)(v30 + 56);
      if (v156 != v157)
      {
        v158 = *(v157 - 3);
        while (1)
        {
          v159 = v126 - v158;
          if (v126 - v158 <= 3.14159265)
            break;
          v126 = v126 + -6.28318531;
        }
        while (v159 < -3.14159265)
        {
          v126 = v126 + 6.28318531;
          v159 = v126 - v158;
        }
        v160 = *(v157 - 2);
        while (1)
        {
          *(double *)&v122 = v127 - v160;
          if (v127 - v160 <= 3.14159265)
            break;
          v127 = v127 + -6.28318531;
        }
        while (*(double *)&v122 < -3.14159265)
        {
          v127 = v127 + 6.28318531;
          *(double *)&v122 = v127 - v160;
        }
      }
      v161 = *(_QWORD *)(v30 + 64);
      if ((unint64_t)v157 >= v161)
      {
        v164 = 0xAAAAAAAAAAAAAAABLL * (v157 - v156) + 1;
        if (v164 > 0xAAAAAAAAAAAAAAALL)
          abort();
        v165 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v161 - (_QWORD)v156) >> 3);
        if (2 * v165 > v164)
          v164 = 2 * v165;
        if (v165 >= 0x555555555555555)
          v166 = 0xAAAAAAAAAAAAAAALL;
        else
          v166 = v164;
        if (v166)
        {
          if (v166 > 0xAAAAAAAAAAAAAAALL)
            goto LABEL_461;
          v167 = (char *)operator new(24 * v166);
        }
        else
        {
          v167 = 0;
        }
        v168 = (double *)&v167[8 * (v157 - v156)];
        *v168 = v126;
        v168[1] = v127;
        v168[2] = v331;
        v169 = v168;
        if (v156 == v157)
        {
          v163 = v332;
        }
        else
        {
          v163 = v332;
          do
          {
            v170 = *(_OWORD *)(v157 - 3);
            *(v169 - 1) = *(v157 - 1);
            *(_OWORD *)(v169 - 3) = v170;
            v169 -= 3;
            v157 -= 3;
          }
          while (v157 != v156);
          v156 = *(double **)(v30 + 48);
        }
        v162 = v168 + 3;
        *(_QWORD *)(v30 + 48) = v169;
        *(_QWORD *)(v30 + 56) = v168 + 3;
        *(_QWORD *)(v30 + 64) = &v167[24 * v166];
        if (v156)
          operator delete(v156);
      }
      else
      {
        *v157 = v126;
        v157[1] = v127;
        v162 = v157 + 3;
        v163 = v332;
        v157[2] = v331;
      }
      *(_QWORD *)(v30 + 56) = v162;
      v172 = *(_QWORD **)(v30 + 32);
      v171 = *(_QWORD *)(v30 + 40);
      if ((unint64_t)v172 >= v171)
      {
        v175 = *(_QWORD **)(v30 + 24);
        v176 = 0xAAAAAAAAAAAAAAABLL * (v172 - v175) + 1;
        if (v176 > 0xAAAAAAAAAAAAAAALL)
          abort();
        v177 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v171 - (_QWORD)v175) >> 3);
        if (2 * v177 > v176)
          v176 = 2 * v177;
        if (v177 >= 0x555555555555555)
          v178 = 0xAAAAAAAAAAAAAAALL;
        else
          v178 = v176;
        if (v178)
        {
          if (v178 > 0xAAAAAAAAAAAAAAALL)
            goto LABEL_461;
          v179 = (char *)operator new(24 * v178);
        }
        else
        {
          v179 = 0;
        }
        v180 = &v179[8 * (v172 - v175)];
        DWORD1(v173) = HIDWORD(v330);
        *(_QWORD *)v180 = v330;
        *((_QWORD *)v180 + 1) = 0;
        *((_QWORD *)v180 + 2) = 0;
        v181 = v180;
        if (v172 != v175)
        {
          do
          {
            v173 = *(_OWORD *)(v172 - 3);
            *((_QWORD *)v181 - 1) = *(v172 - 1);
            *(_OWORD *)(v181 - 24) = v173;
            v181 -= 24;
            v172 -= 3;
          }
          while (v172 != v175);
          v172 = *(_QWORD **)(v30 + 24);
        }
        v174 = v180 + 24;
        *(_QWORD *)(v30 + 24) = v181;
        *(_QWORD *)(v30 + 32) = v180 + 24;
        *(_QWORD *)(v30 + 40) = &v179[24 * v178];
        if (v172)
          operator delete(v172);
      }
      else
      {
        DWORD1(v173) = HIDWORD(v330);
        *v172 = v330;
        v174 = v172 + 3;
        v172[1] = 0;
        v172[2] = 0;
      }
      *(_QWORD *)(v30 + 32) = v174;
      v183 = *(double **)(v30 + 80);
      v182 = *(_QWORD *)(v30 + 88);
      if ((unint64_t)v183 >= v182)
      {
        v185 = *(double **)(v30 + 72);
        v186 = v183 - v185;
        v187 = v186 + 1;
        if ((unint64_t)(v186 + 1) >> 61)
          abort();
        v188 = v182 - (_QWORD)v185;
        if (v188 >> 2 > v187)
          v187 = v188 >> 2;
        if ((unint64_t)v188 >= 0x7FFFFFFFFFFFFFF8)
          v189 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v189 = v187;
        if (v189)
        {
          if (v189 >> 61)
            goto LABEL_461;
          v190 = operator new(8 * v189);
        }
        else
        {
          v190 = 0;
        }
        v191 = (double *)&v190[8 * v186];
        *v191 = v163;
        v184 = v191 + 1;
        if (v183 != v185)
        {
          v192 = (char *)(v183 - 1) - (char *)v185;
          if (v192 < 0x58)
            goto LABEL_473;
          if ((unint64_t)((char *)v185 - v190) < 0x20)
            goto LABEL_473;
          v193 = (v192 >> 3) + 1;
          v194 = &v190[8 * v186 - 16];
          v195 = v183 - 2;
          v196 = v193 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v122 = *((_OWORD *)v195 - 1);
            v173 = *(_OWORD *)v195;
            *(v194 - 1) = v122;
            *v194 = v173;
            v194 -= 2;
            v195 -= 4;
            v196 -= 4;
          }
          while (v196);
          v191 -= v193 & 0x3FFFFFFFFFFFFFFCLL;
          v183 -= v193 & 0x3FFFFFFFFFFFFFFCLL;
          if (v193 != (v193 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_473:
            do
            {
              v197 = *((_QWORD *)v183-- - 1);
              DWORD1(v173) = HIDWORD(v197);
              *((_QWORD *)v191-- - 1) = v197;
            }
            while (v183 != v185);
          }
        }
        *(_QWORD *)(v30 + 72) = v191;
        *(_QWORD *)(v30 + 80) = v184;
        *(_QWORD *)(v30 + 88) = &v190[8 * v189];
        if (v185)
          operator delete(v185);
      }
      else
      {
        *v183 = v163;
        v184 = v183 + 1;
      }
      *(_QWORD *)(v30 + 80) = v184;
      if (v327 - 1 > v118)
      {
        *(double *)&v173 = *(double *)(v30 + 144) + v163;
        *(_QWORD *)(v30 + 144) = v173;
      }
      v118 = (v119 + 1);
      v198 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v30 + 8) - *(_QWORD *)v30) >> 3);
      if (v198 > v118)
        v199 = v119 + 1;
      else
        v199 = v198 - 1;
      *(float *)&v173 = 1.0 - v121;
      *(float *)&v124 = 1.0 - *(float *)&__p[88 * v199];
      LODWORD(v122) = 0;
      LODWORD(v117) = 1.0;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", *(double *)&v173, *(double *)&v122, v124, v117);
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      v201 = v200;
      v202 = *(_QWORD **)(v30 + 104);
      if ((unint64_t)v202 >= *(_QWORD *)(v30 + 112))
      {
        v204 = std::vector<geo::_retain_ptr<CAMediaTimingFunction * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>>::__emplace_back_slow_path<CAMediaTimingFunction * {__strong},geo::memory_management_mode const&>(v325, v200);
      }
      else
      {
        v203 = v200;
        *v202 = &off_1E42B4F30;
        v202[1] = v203;
        v204 = (char *)(v202 + 3);
      }
      v32 = (char **)(v30 + 120);
      *(_QWORD *)(v30 + 104) = v204;

      ++v119;
    }
    while (v327 > v118);
  }
  v205 = *(double **)(v30 + 72);
  v206 = *(double **)(v30 + 80);
  if (v205 != v206)
  {
    v207 = 0.0;
    do
    {
      v208 = *v205;
      *v205++ = v207 / *(double *)(v30 + 144);
      v207 = v208 + v207;
    }
    while (v205 != v206);
  }
  v209 = objc_msgSend(v326, "labelFramesCount");
  v210 = v209;
  v211 = *(void ***)(v30 + 120);
  if (v209 > (uint64_t)(*(_QWORD *)(v30 + 136) - (_QWORD)v211) >> 5)
  {
    if (v209 >> 59)
      abort();
    v212 = *(_QWORD *)(v30 + 128);
    v213 = (char *)operator new(32 * v209);
    v214 = &v213[32 * v210];
    v215 = &v213[v212 - (_QWORD)v211];
    if ((void **)v212 == v211)
    {
      *(_QWORD *)(v30 + 120) = v215;
      *(_QWORD *)(v30 + 128) = v215;
      *(_QWORD *)(v30 + 136) = v214;
      if (v211)
LABEL_252:
        operator delete(v211);
    }
    else
    {
      v216 = &v213[v212 - (_QWORD)v211];
      do
      {
        v217 = *(_QWORD *)(v212 - 32);
        v212 -= 32;
        *((_QWORD *)v216 - 4) = v217;
        v216 -= 32;
        v218 = *(_OWORD *)(v212 + 8);
        *((_QWORD *)v216 + 3) = *(_QWORD *)(v212 + 24);
        *(_OWORD *)(v216 + 8) = v218;
        *(_QWORD *)(v212 + 16) = 0;
        *(_QWORD *)(v212 + 24) = 0;
        *(_QWORD *)(v212 + 8) = 0;
      }
      while ((void **)v212 != v211);
      v211 = *(void ***)(v30 + 120);
      v219 = *(void ***)(v30 + 128);
      *(_QWORD *)(v30 + 120) = v216;
      *(_QWORD *)(v30 + 128) = v215;
      *(_QWORD *)(v30 + 136) = v214;
      while (v219 != v211)
      {
        if (*((char *)v219 - 1) < 0)
          operator delete(*(v219 - 3));
        v219 -= 4;
      }
      v32 = (char **)(v30 + 120);
      if (v211)
        goto LABEL_252;
    }
  }
  if (v210)
  {
    v220 = 0;
    v221 = 0.0;
    v222 = 1;
    do
    {
      v224 = objc_msgSend(v326, "labelFrameAtIndex:", v220);
      v225 = v223;
      if (v221 < v223)
      {
        HIBYTE(buf[3]) = 0;
        LOBYTE(buf[1]) = 0;
        buf[0] = __PAIR64__(LODWORD(v223), LODWORD(v221));
        v226 = *(_QWORD *)(v30 + 128);
        if (v226 >= *(_QWORD *)(v30 + 136))
        {
          v227 = std::vector<md::AnimationData::LabelEntry>::__push_back_slow_path<md::AnimationData::LabelEntry const&>(v32, (uint64_t)buf);
        }
        else
        {
          *(_QWORD *)v226 = buf[0];
          *(_OWORD *)(v226 + 8) = *(_OWORD *)&buf[1];
          *(_QWORD *)(v226 + 24) = buf[3];
          v227 = (char *)(v226 + 32);
          *(_QWORD *)(v30 + 128) = v226 + 32;
        }
        *(_QWORD *)(v30 + 128) = v227;
      }
      HIBYTE(buf[3]) = 0;
      LOBYTE(buf[1]) = 0;
      buf[0] = __PAIR64__(v224, LODWORD(v225));
      objc_msgSend(v326, "bestLocalizedLabelAtIndex:", HIDWORD(v224));
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      v229 = v228;
      if (v228)
      {
        std::string::__assign_external((std::string *)&buf[1], (const std::string::value_type *)objc_msgSend(objc_retainAutorelease(v228), "UTF8String"));
      }
      else
      {
        if (SHIBYTE(buf[3]) < 0)
        {
          buf[2] = 0;
          v230 = (_BYTE *)buf[1];
        }
        else
        {
          HIBYTE(buf[3]) = 0;
          v230 = &buf[1];
        }
        *v230 = 0;
      }
      v231 = *(_QWORD **)(v30 + 128);
      if ((unint64_t)v231 >= *(_QWORD *)(v30 + 136))
      {
        v32 = (char **)(v30 + 120);
        v234 = std::vector<md::AnimationData::LabelEntry>::__push_back_slow_path<md::AnimationData::LabelEntry const&>((char **)(v30 + 120), (uint64_t)buf);
      }
      else
      {
        *v231 = buf[0];
        v232 = (std::string *)(v231 + 1);
        if (SHIBYTE(buf[3]) < 0)
        {
          std::string::__init_copy_ctor_external(v232, (const std::string::value_type *)buf[1], buf[2]);
        }
        else
        {
          v233 = *(_OWORD *)&buf[1];
          v231[3] = buf[3];
          *(_OWORD *)&v232->__r_.__value_.__l.__data_ = v233;
        }
        v234 = (char *)(v231 + 4);
        *(_QWORD *)(v30 + 128) = v231 + 4;
        v32 = (char **)(v30 + 120);
      }
      *(_QWORD *)(v30 + 128) = v234;

      if (SHIBYTE(buf[3]) < 0)
        operator delete((void *)buf[1]);
      LODWORD(v221) = v224;
      v220 = v222++;
    }
    while (v210 > v220);
    if (*(float *)&v224 >= 1.0)
    {
      v235 = __p;
      if (!__p)
        goto LABEL_278;
      goto LABEL_277;
    }
  }
  else
  {
    v221 = 0.0;
  }
  HIBYTE(buf[3]) = 0;
  LOBYTE(buf[1]) = 0;
  buf[0] = LODWORD(v221) | 0x3F80000000000000;
  v242 = *(_QWORD *)(v30 + 128);
  if (v242 >= *(_QWORD *)(v30 + 136))
  {
    v243 = std::vector<md::AnimationData::LabelEntry>::__push_back_slow_path<md::AnimationData::LabelEntry const&>(v32, (uint64_t)buf);
  }
  else
  {
    *(_QWORD *)v242 = buf[0];
    *(_OWORD *)(v242 + 8) = *(_OWORD *)&buf[1];
    *(_QWORD *)(v242 + 24) = buf[3];
    v243 = (char *)(v242 + 32);
  }
  *(_QWORD *)(v30 + 128) = v243;
  v235 = __p;
  if (__p)
LABEL_277:
    operator delete(v235);
LABEL_278:

  v236 = *v319;
  *v319 = (md::AnimationData *)v30;
  if (v236)
  {
    md::AnimationData::~AnimationData(v236);
    MEMORY[0x1A1AF4E00]();
  }

  v237 = (md::AnimationData **)*((_QWORD *)v316 + 1);
  *((_QWORD *)v316 + 1) = v319;
  if (v237)
  {
    v238 = *v237;
    *v237 = 0;
    if (v238)
    {
      md::AnimationData::~AnimationData(v238);
      MEMORY[0x1A1AF4E00]();
    }
    MEMORY[0x1A1AF4E00](v237, 0x1020C40F7B62AD5);
  }
  *((_DWORD *)v316 + 32) = 0;
  *((_QWORD *)v316 + 17) = 0;
  *((_QWORD *)v316 + 18) = 0;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v239, "toursInterestingViewSpeed");
  *((_DWORD *)v316 + 33) = v240;

  v241 = (uint64_t)v362;
  if (!v362)
    goto LABEL_287;
  if (v362 != &v360)
  {
    v241 = (*v362)[2]();
LABEL_287:
    buf[3] = v241;
    goto LABEL_295;
  }
  buf[3] = buf;
  ((void (*)(uint64_t, uint64_t))v360[3])((uint64_t)&v360, (uint64_t)buf);
LABEL_295:
  std::__function::__value_func<void ()(gdc::Registry *,std::span<gdc::Entity,18446744073709551615ul>)>::swap[abi:nn180100](buf, v315);
  v244 = (_QWORD *)buf[3];
  if ((_QWORD *)buf[3] == buf)
  {
    v245 = 4;
    v244 = buf;
  }
  else
  {
    if (!buf[3])
      goto LABEL_300;
    v245 = 5;
  }
  (*(void (**)(void))(*v244 + 8 * v245))();
LABEL_300:
  v246 = (uint64_t)v365;
  if (!v365)
  {
LABEL_303:
    buf[3] = v246;
    goto LABEL_305;
  }
  if (v365 != &v363)
  {
    v246 = (*v365)[2]();
    goto LABEL_303;
  }
  buf[3] = buf;
  ((void (*)(uint64_t, uint64_t))v363[3])((uint64_t)&v363, (uint64_t)buf);
LABEL_305:
  std::__function::__value_func<void ()(gdc::Registry *,std::span<gdc::Entity,18446744073709551615ul>)>::swap[abi:nn180100](buf, (_QWORD *)v316 + 28);
  v247 = (_QWORD *)buf[3];
  if ((_QWORD *)buf[3] == buf)
  {
    v248 = 4;
    v247 = buf;
  }
  else
  {
    if (!buf[3])
      goto LABEL_310;
    v248 = 5;
  }
  (*(void (**)(void))(*v247 + 8 * v248))();
LABEL_310:
  v249 = (uint64_t)v359;
  if (!v359)
  {
LABEL_313:
    buf[3] = v249;
    goto LABEL_315;
  }
  if (v359 != &v357)
  {
    v249 = (*v359)[2]();
    goto LABEL_313;
  }
  buf[3] = buf;
  ((void (*)(uint64_t, uint64_t))v357[3])((uint64_t)&v357, (uint64_t)buf);
LABEL_315:
  std::__function::__value_func<void ()(gdc::Registry *,std::span<gdc::Entity,18446744073709551615ul>)>::swap[abi:nn180100](buf, (_QWORD *)v316 + 20);
  v250 = (_QWORD *)buf[3];
  if ((_QWORD *)buf[3] == buf)
  {
    v251 = 4;
    v250 = buf;
  }
  else
  {
    if (!buf[3])
      goto LABEL_320;
    v251 = 5;
  }
  (*(void (**)(void))(*v250 + 8 * v251))();
LABEL_320:
  v252 = (uint64_t *)*((_QWORD *)v316 + 1);
  if (!v252)
  {
    *(int64x2_t *)buf = vdupq_n_s64(0xC00921FB54442D18);
    *(_OWORD *)&buf[2] = 0u;
    v367 = 0u;
    *((_QWORD *)v316 + 8) = 0;
    v255 = *(_OWORD *)buf;
    *((_OWORD *)v316 + 2) = *(_OWORD *)&buf[2];
    *((_OWORD *)v316 + 3) = v367;
    *((_OWORD *)v316 + 1) = v255;
    goto LABEL_326;
  }
  if (!*v252)
  {
    *(int64x2_t *)buf = vdupq_n_s64(0xC00921FB54442D18);
    *(_OWORD *)&buf[2] = 0u;
    v367 = 0u;
    *((_QWORD *)v316 + 8) = 0;
    v256 = *(_OWORD *)buf;
    *((_OWORD *)v316 + 2) = *(_OWORD *)&buf[2];
    *((_OWORD *)v316 + 3) = v367;
    *((_OWORD *)v316 + 1) = v256;
    v254 = *v252;
    if (*v252)
      goto LABEL_328;
LABEL_326:
    *(int64x2_t *)buf = vdupq_n_s64(0xC00921FB54442D18);
    *(_OWORD *)&buf[2] = 0u;
    v367 = 0u;
    *(_QWORD *)&v368 = 0;
    goto LABEL_329;
  }
  md::AnimationData::interpolateFrames((md::AnimationData *)buf, 0.0, *v252, 0);
  v253 = (uint64_t *)*((_QWORD *)v316 + 1);
  *((_OWORD *)v316 + 1) = *(_OWORD *)buf;
  *((_OWORD *)v316 + 2) = *(_OWORD *)&buf[2];
  *((_OWORD *)v316 + 3) = v367;
  *((_QWORD *)v316 + 8) = v368;
  if (!v253)
    goto LABEL_326;
  v254 = *v253;
  if (!*v253)
    goto LABEL_326;
LABEL_328:
  md::AnimationData::interpolateFrames((md::AnimationData *)buf, 0.0, v254, 0);
LABEL_329:
  v257 = *(_OWORD *)&buf[2];
  *(_OWORD *)((char *)v316 + 72) = *(_OWORD *)buf;
  *(_OWORD *)((char *)v316 + 88) = v257;
  *(_OWORD *)((char *)v316 + 104) = v367;
  *((_QWORD *)v316 + 15) = v368;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  v259 = objc_msgSend(v258, "toursCorrectElevation");

  if (v259)
    *((_QWORD *)v316 + 19) = *((_QWORD *)v316 + 11);
  v260 = *((_QWORD *)v316 + 27);
  if (v260)
  {
    LODWORD(buf[0]) = 0;
    (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v260 + 48))(v260, buf);
  }

  v261 = v359;
  if (v359 == &v357)
  {
    v263 = 4;
    v261 = &v357;
    v262 = v322;
  }
  else
  {
    v262 = v322;
    if (!v359)
      goto LABEL_338;
    v263 = 5;
  }
  (*v261)[v263]();
LABEL_338:
  v264 = v362;
  if (v362 == &v360)
  {
    v265 = 4;
    v264 = &v360;
  }
  else
  {
    if (!v362)
      goto LABEL_343;
    v265 = 5;
  }
  (*v264)[v265]();
LABEL_343:
  v266 = v365;
  if (v365 == &v363)
  {
    v267 = 4;
    v266 = &v363;
  }
  else
  {
    if (!v365)
      goto LABEL_348;
    v267 = 5;
  }
  (*v266)[v267]();
LABEL_348:
  mapEngine = v262->_mapEngine;
  if (!mapEngine || !mapEngine[140])
    goto LABEL_456;
  objc_copyWeak(&v342, &location);
  v269 = (int8x8_t *)*((_QWORD *)v322->_mapEngine + 140);
  v270 = v269[2];
  if (!*(_QWORD *)&v270)
    goto LABEL_455;
  v271 = (uint8x8_t)vcnt_s8(v270);
  v271.i16[0] = vaddlv_u8(v271);
  v272 = v271.u32[0];
  if (v271.u32[0] > 1uLL)
  {
    v273 = 0x4BD0C73E70A08DDBLL;
    if (*(_QWORD *)&v270 <= 0x4BD0C73E70A08DDBuLL)
      v273 = 0x4BD0C73E70A08DDBuLL % *(_QWORD *)&v270;
  }
  else
  {
    v273 = (*(_QWORD *)&v270 - 1) & 0x4BD0C73E70A08DDBLL;
  }
  v274 = *(_QWORD **)(*(_QWORD *)&v269[1] + 8 * v273);
  if (!v274)
    goto LABEL_387;
  v275 = (_QWORD *)*v274;
  if (!v275)
    goto LABEL_387;
  if (v271.u32[0] < 2uLL)
  {
    while (1)
    {
      v277 = v275[1];
      if (v277 == 0x4BD0C73E70A08DDBLL)
      {
        if (v275[2] == 0x4BD0C73E70A08DDBLL)
          goto LABEL_373;
      }
      else if ((v277 & (*(_QWORD *)&v270 - 1)) != v273)
      {
        goto LABEL_385;
      }
      v275 = (_QWORD *)*v275;
      if (!v275)
        goto LABEL_385;
    }
  }
  while (1)
  {
    v276 = v275[1];
    if (v276 == 0x4BD0C73E70A08DDBLL)
      break;
    if (v276 >= *(_QWORD *)&v270)
      v276 %= *(_QWORD *)&v270;
    if (v276 != v273)
      goto LABEL_385;
LABEL_362:
    v275 = (_QWORD *)*v275;
    if (!v275)
      goto LABEL_385;
  }
  if (v275[2] != 0x4BD0C73E70A08DDBLL)
    goto LABEL_362;
LABEL_373:
  v278 = v275[5];
  if (v278)
  {
    objc_copyWeak((id *)buf, &v342);
    v355 = 0;
    v353 = &off_1E42796D8;
    objc_moveWeak(&v354, (id *)buf);
    v355 = &v353;
    objc_destroyWeak((id *)buf);
    v356 = 1;
    std::__optional_storage_base<std::function<geo::optional<gm::Range<double>> ()(geo::QuadTile const&)>,false>::__assign_from[abi:nn180100]<std::__optional_copy_assign_base<std::function<geo::optional<gm::Range<double>> ()(geo::QuadTile const&)>,false> const&>((_QWORD *)(v278 + 288), (uint64_t)&v353);
    if (v356)
    {
      v279 = v355;
      if (v355 == &v353)
      {
        v280 = 4;
        v279 = &v353;
LABEL_379:
        (*v279)[v280]();
      }
      else if (v355)
      {
        v280 = 5;
        goto LABEL_379;
      }
    }
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
    v281 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v281, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19F029000, v281, OS_LOG_TYPE_INFO, "Flyover Tour: Attached custom NeighborCameraPositionProvider to FlyoverTileDataLogic", (uint8_t *)buf, 2u);
    }

    v269 = (int8x8_t *)*((_QWORD *)v322->_mapEngine + 140);
    v270 = v269[2];
  }
LABEL_385:
  if (!*(_QWORD *)&v270)
    goto LABEL_455;
  v282 = (uint8x8_t)vcnt_s8(v270);
  v282.i16[0] = vaddlv_u8(v282);
  v272 = v282.u32[0];
LABEL_387:
  if (v272 > 1)
  {
    v283 = 0xAF46DE79C836B0D8;
    if (*(_QWORD *)&v270 <= 0xAF46DE79C836B0D8)
      v283 = 0xAF46DE79C836B0D8 % *(_QWORD *)&v270;
  }
  else
  {
    v283 = (*(_QWORD *)&v270 - 1) & 0xAF46DE79C836B0D8;
  }
  v284 = *(_QWORD **)(*(_QWORD *)&v269[1] + 8 * v283);
  if (!v284)
    goto LABEL_421;
  v285 = (_QWORD *)*v284;
  if (!v285)
    goto LABEL_421;
  if (v272 < 2)
  {
    while (1)
    {
      v287 = v285[1];
      if (v287 == 0xAF46DE79C836B0D8)
      {
        if (v285[2] == 0xAF46DE79C836B0D8)
          goto LABEL_407;
      }
      else if ((v287 & (*(_QWORD *)&v270 - 1)) != v283)
      {
        goto LABEL_419;
      }
      v285 = (_QWORD *)*v285;
      if (!v285)
        goto LABEL_419;
    }
  }
  while (2)
  {
    v286 = v285[1];
    if (v286 != 0xAF46DE79C836B0D8)
    {
      if (v286 >= *(_QWORD *)&v270)
        v286 %= *(_QWORD *)&v270;
      if (v286 != v283)
        goto LABEL_419;
      goto LABEL_396;
    }
    if (v285[2] != 0xAF46DE79C836B0D8)
    {
LABEL_396:
      v285 = (_QWORD *)*v285;
      if (!v285)
        goto LABEL_419;
      continue;
    }
    break;
  }
LABEL_407:
  v288 = v285[5];
  if (v288)
  {
    objc_copyWeak((id *)buf, &v342);
    v351 = 0;
    v349 = &off_1E42796D8;
    objc_moveWeak(&v350, (id *)buf);
    v351 = &v349;
    objc_destroyWeak((id *)buf);
    v352 = 1;
    std::__optional_storage_base<std::function<geo::optional<gm::Range<double>> ()(geo::QuadTile const&)>,false>::__assign_from[abi:nn180100]<std::__optional_copy_assign_base<std::function<geo::optional<gm::Range<double>> ()(geo::QuadTile const&)>,false> const&>((_QWORD *)(v288 + 376), (uint64_t)&v349);
    if (v352)
    {
      v289 = v351;
      if (v351 == &v349)
      {
        v290 = 4;
        v289 = &v349;
LABEL_413:
        (*v289)[v290]();
      }
      else if (v351)
      {
        v290 = 5;
        goto LABEL_413;
      }
    }
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
    v291 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v291, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19F029000, v291, OS_LOG_TYPE_INFO, "Flyover Tour: Attached custom NeighborCameraPositionProvider to TileSelectionLogic", (uint8_t *)buf, 2u);
    }

    v269 = (int8x8_t *)*((_QWORD *)v322->_mapEngine + 140);
    v270 = v269[2];
  }
LABEL_419:
  if (!*(_QWORD *)&v270)
    goto LABEL_455;
  v292 = (uint8x8_t)vcnt_s8(v270);
  v292.i16[0] = vaddlv_u8(v292);
  v272 = v292.u32[0];
LABEL_421:
  if (v272 > 1)
  {
    v293 = 0x17767EADC5B287BLL;
    if (*(_QWORD *)&v270 <= 0x17767EADC5B287BuLL)
      v293 = 0x17767EADC5B287BuLL % *(_QWORD *)&v270;
  }
  else
  {
    v293 = (*(_QWORD *)&v270 - 1) & 0x17767EADC5B287BLL;
  }
  v294 = *(_QWORD **)(*(_QWORD *)&v269[1] + 8 * v293);
  if (v294)
  {
    v295 = (_QWORD *)*v294;
    if (v295)
    {
      if (v272 < 2)
      {
        v296 = *(_QWORD *)&v270 - 1;
        while (1)
        {
          v298 = v295[1];
          if (v298 == 0x17767EADC5B287BLL)
          {
            if (v295[2] == 0x17767EADC5B287BLL)
              goto LABEL_441;
          }
          else if ((v298 & v296) != v293)
          {
            goto LABEL_455;
          }
          v295 = (_QWORD *)*v295;
          if (!v295)
            goto LABEL_455;
        }
      }
      do
      {
        v297 = v295[1];
        if (v297 == 0x17767EADC5B287BLL)
        {
          if (v295[2] == 0x17767EADC5B287BLL)
          {
LABEL_441:
            v299 = v295[5];
            if (v299)
            {
              v300 = (uint64_t)p_flyoverTour->__ptr_;
              v301 = (std::__shared_weak_count *)p_flyoverTour->__cntrl_;
              if (v301)
              {
                p_shared_owners = (unint64_t *)&v301->__shared_owners_;
                do
                  v303 = __ldxr(p_shared_owners);
                while (__stxr(v303 + 1, p_shared_owners));
                md::ElevationLogic::setFlyoverTour(v299, v300, (uint64_t)v301);
                v304 = (unint64_t *)&v301->__shared_owners_;
                do
                  v305 = __ldaxr(v304);
                while (__stlxr(v305 - 1, v304));
                if (!v305)
                {
                  ((void (*)(std::__shared_weak_count *))v301->__on_zero_shared)(v301);
                  std::__shared_weak_count::__release_weak(v301);
                }
              }
              else
              {
                md::ElevationLogic::setFlyoverTour(v299, v300, 0);
              }
              if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
                dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
              v306 = (id)GEOGetVectorKitVKDefaultLog_log;
              if (os_log_type_enabled(v306, OS_LOG_TYPE_INFO))
              {
                LOWORD(buf[0]) = 0;
                _os_log_impl(&dword_19F029000, v306, OS_LOG_TYPE_INFO, "Flyover Tour: _flyoverTour attached to Elevation logic", (uint8_t *)buf, 2u);
              }

            }
            break;
          }
        }
        else
        {
          if (v297 >= *(_QWORD *)&v270)
            v297 %= *(_QWORD *)&v270;
          if (v297 != v293)
            break;
        }
        v295 = (_QWORD *)*v295;
      }
      while (v295);
    }
  }
LABEL_455:
  objc_destroyWeak(&v342);
  v262 = v322;
LABEL_456:
  v307 = -[VKAnimation initWithPriority:]([VKTimedAnimation alloc], "initWithPriority:", 1);
  p_flyoverAnimation = (id *)&v262->super._flyoverAnimation;
  v309 = *p_flyoverAnimation;
  *p_flyoverAnimation = v307;

  objc_msgSend(*p_flyoverAnimation, "setDuration:", 1.0);
  -[VKAnimation setRunsForever:](v322->super._flyoverAnimation, "setRunsForever:", 1);
  -[VKTimedAnimation setTimingFunction:](v322->super._flyoverAnimation, "setTimingFunction:", VKAnimationCurveLinear);
  v310 = MEMORY[0x1E0C809B0];
  v340[0] = MEMORY[0x1E0C809B0];
  v340[1] = 3221225472;
  v340[2] = __86__VKMapCameraController_flyoverTourAnimation_animateToStart_labelChanged_stateChange___block_invoke;
  v340[3] = &unk_1E42ED310;
  objc_copyWeak(&v341, &location);
  -[VKTimedAnimation setStepHandler:](v322->super._flyoverAnimation, "setStepHandler:", v340);
  v337[0] = v310;
  v337[1] = 3221225472;
  v337[2] = __86__VKMapCameraController_flyoverTourAnimation_animateToStart_labelChanged_stateChange___block_invoke_2;
  v337[3] = &unk_1E42F9D20;
  objc_copyWeak(&v339, &location);
  v311 = v324;
  v338 = v311;
  -[VKAnimation setCompletionHandler:](v322->super._flyoverAnimation, "setCompletionHandler:", v337);
  if (v320)
    v312 = 1.0;
  else
    v312 = 0.0;
  v313 = VKAnimationCurveEaseIn;
  v334[0] = v310;
  v334[1] = 3221225472;
  v334[2] = __86__VKMapCameraController_flyoverTourAnimation_animateToStart_labelChanged_stateChange___block_invoke_33;
  v334[3] = &unk_1E42F9D20;
  objc_copyWeak(&v336, &location);
  v335 = v311;
  *(float *)&v314 = v312;
  -[VKMapCameraController animateToTourPosition:timingFunction:animationStyle:completion:](v322, "animateToTourPosition:timingFunction:animationStyle:completion:", v313, 1, v334, v314);

  objc_destroyWeak(&v336);
  objc_destroyWeak(&v339);
  objc_destroyWeak(&v341);
  objc_destroyWeak(&location);
LABEL_460:

}

- (void)animateToTourPosition:(float)a3 timingFunction:(id)a4 animationStyle:(int64_t)a5 completion:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD);
  VKTimedAnimation *moveToTourPositionAnimation;
  uint64_t *p_shared_owners;
  unint64_t v14;
  _QWORD *mapEngine;
  uint64_t v16;
  int8x8_t *v17;
  int8x8_t v18;
  uint8x8_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  VKFlyoverTour *ptr;
  __shared_weak_count *cntrl;
  unint64_t *v29;
  unint64_t v30;
  unint64_t *v31;
  unint64_t v32;
  NSObject *v33;
  VKTimedAnimation *v34;
  double v35;
  VKTimedAnimation *v36;
  VKTimedAnimation *v37;
  void *v38;
  std::__shared_weak_count *v39;
  uint64_t *v40;
  unint64_t v41;
  uint64_t v42;
  NSObject *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[16];
  _QWORD v48[4];
  void (**v49)(id, _QWORD);
  id v50;
  _QWORD v51[4];
  id v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[8];
  std::__shared_weak_count *v58;

  v10 = a4;
  v11 = (void (**)(id, _QWORD))a6;
  moveToTourPositionAnimation = self->super._moveToTourPositionAnimation;
  if (moveToTourPositionAnimation)
  {
    -[VKAnimation stop](moveToTourPositionAnimation, "stop");
    if (self->super._moveToTourPositionAnimation)
      goto LABEL_14;
  }
  -[VKCameraController camera](self, "camera");
  if (v58)
  {
    p_shared_owners = &v58->__shared_owners_;
    do
      v14 = __ldaxr((unint64_t *)p_shared_owners);
    while (__stlxr(v14 - 1, (unint64_t *)p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
      std::__shared_weak_count::__release_weak(v58);
      if (*(_QWORD *)buf)
        goto LABEL_8;
LABEL_14:
      if (v11)
        v11[2](v11, 0);
      goto LABEL_63;
    }
  }
  if (!*(_QWORD *)buf)
    goto LABEL_14;
LABEL_8:
  mapEngine = self->_mapEngine;
  v16 = 0;
  if (mapEngine)
  {
    v17 = (int8x8_t *)mapEngine[140];
    if (v17)
    {
      v18 = v17[2];
      if (v18)
      {
        v19 = (uint8x8_t)vcnt_s8(v18);
        v19.i16[0] = vaddlv_u8(v19);
        if (v19.u32[0] > 1uLL)
        {
          v20 = 0x17767EADC5B287BLL;
          if (*(_QWORD *)&v18 <= 0x17767EADC5B287BuLL)
            v20 = 0x17767EADC5B287BuLL % *(_QWORD *)&v18;
        }
        else
        {
          v20 = (*(_QWORD *)&v18 - 1) & 0x17767EADC5B287BLL;
        }
        v21 = *(_QWORD **)(*(_QWORD *)&v17[1] + 8 * v20);
        if (v21)
        {
          v22 = (_QWORD *)*v21;
          if (v22)
          {
            if (v19.u32[0] < 2uLL)
            {
              v23 = *(_QWORD *)&v18 - 1;
              while (1)
              {
                v25 = v22[1];
                if (v25 == 0x17767EADC5B287BLL)
                {
                  if (v22[2] == 0x17767EADC5B287BLL)
                    goto LABEL_34;
                }
                else if ((v25 & v23) != v20)
                {
                  goto LABEL_48;
                }
                v22 = (_QWORD *)*v22;
                if (!v22)
                  goto LABEL_48;
              }
            }
            do
            {
              v24 = v22[1];
              if (v24 == 0x17767EADC5B287BLL)
              {
                if (v22[2] == 0x17767EADC5B287BLL)
                {
LABEL_34:
                  v26 = v22[5];
                  if (v26)
                  {
                    ptr = self->_flyoverTour.__ptr_;
                    cntrl = self->_flyoverTour.__cntrl_;
                    if (cntrl)
                    {
                      v29 = (unint64_t *)((char *)cntrl + 8);
                      do
                        v30 = __ldxr(v29);
                      while (__stxr(v30 + 1, v29));
                      md::ElevationLogic::setFlyoverTour(v26, (uint64_t)ptr, (uint64_t)cntrl);
                      v31 = (unint64_t *)((char *)cntrl + 8);
                      do
                        v32 = __ldaxr(v31);
                      while (__stlxr(v32 - 1, v31));
                      if (!v32)
                      {
                        (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
                        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
                      }
                    }
                    else
                    {
                      md::ElevationLogic::setFlyoverTour(v22[5], (uint64_t)ptr, 0);
                    }
                    v16 = *(_QWORD *)(v26 + 176);
                    if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
                      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
                    v33 = (id)GEOGetVectorKitVKDefaultLog_log;
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_19F029000, v33, OS_LOG_TYPE_INFO, "Flyover Tour: _flyoverTour attached to Elevation logic upon resuming", buf, 2u);
                    }

                  }
                  break;
                }
              }
              else
              {
                if (v24 >= *(_QWORD *)&v18)
                  v24 %= *(_QWORD *)&v18;
                if (v24 != v20)
                  break;
              }
              v22 = (_QWORD *)*v22;
            }
            while (v22);
          }
        }
      }
    }
  }
LABEL_48:
  v34 = [VKTimedAnimation alloc];
  v35 = a3;
  if (a5 == 2)
    v35 = 0.0;
  v36 = -[VKTimedAnimation initWithDuration:](v34, "initWithDuration:", v35);
  v37 = self->super._moveToTourPositionAnimation;
  self->super._moveToTourPositionAnimation = v36;

  if (v10)
    v38 = v10;
  else
    v38 = VKAnimationCurveEaseInOut;
  -[VKTimedAnimation setTimingFunction:](self->super._moveToTourPositionAnimation, "setTimingFunction:", v38);
  -[VKCameraController camera](self, "camera");
  v39 = v58;
  v44 = *(_OWORD *)(*(_QWORD *)buf + 8);
  v45 = *(_OWORD *)(*(_QWORD *)buf + 32);
  v46 = *(_OWORD *)(*(_QWORD *)buf + 48);
  if (v58)
  {
    v40 = &v58->__shared_owners_;
    do
      v41 = __ldaxr((unint64_t *)v40);
    while (__stlxr(v41 - 1, (unint64_t *)v40));
    if (!v41)
    {
      ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
      std::__shared_weak_count::__release_weak(v39);
    }
  }
  objc_initWeak((id *)buf, self);
  v42 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3321888768;
  v51[2] = __88__VKMapCameraController_animateToTourPosition_timingFunction_animationStyle_completion___block_invoke;
  v51[3] = &unk_1E428A7B8;
  objc_copyWeak(&v52, (id *)buf);
  v53 = v44;
  v54 = v16;
  v55 = v45;
  v56 = v46;
  -[VKTimedAnimation setStepHandler:](self->super._moveToTourPositionAnimation, "setStepHandler:", v51);
  v48[0] = v42;
  v48[1] = 3221225472;
  v48[2] = __88__VKMapCameraController_animateToTourPosition_timingFunction_animationStyle_completion___block_invoke_34;
  v48[3] = &unk_1E42F9D20;
  objc_copyWeak(&v50, (id *)buf);
  v49 = v11;
  -[VKAnimation setCompletionHandler:](self->super._moveToTourPositionAnimation, "setCompletionHandler:", v48);
  md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), &self->super._moveToTourPositionAnimation->super);
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
  v43 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v47 = 0;
    _os_log_impl(&dword_19F029000, v43, OS_LOG_TYPE_INFO, "Flyover Tour: Moving to tour position", v47, 2u);
  }

  objc_destroyWeak(&v50);
  objc_destroyWeak(&v52);
  objc_destroyWeak((id *)buf);
LABEL_63:

}

- (void)pauseFlyoverTourAnimation
{
  VKTimedAnimation *moveToTourPositionAnimation;
  VKTimedAnimation *flyoverAnimation;
  VKFlyoverTour *ptr;
  uint64_t v6;
  _QWORD *mapEngine;
  int8x8_t *v8;
  int8x8_t v9;
  uint8x8_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint8_t v19[12];
  int v20;

  moveToTourPositionAnimation = self->super._moveToTourPositionAnimation;
  if (moveToTourPositionAnimation)
    -[VKAnimation stop](moveToTourPositionAnimation, "stop");
  flyoverAnimation = self->super._flyoverAnimation;
  if (flyoverAnimation)
  {
    ptr = self->_flyoverTour.__ptr_;
    if (ptr)
    {
      v6 = *((_QWORD *)ptr + 27);
      if (v6)
      {
        v20 = 1;
        (*(void (**)(uint64_t, int *))(*(_QWORD *)v6 + 48))(v6, &v20);
        flyoverAnimation = self->super._flyoverAnimation;
      }
    }
    -[VKTimedAnimation pause](flyoverAnimation, "pause");
    -[VKCameraController endRegionChange](self, "endRegionChange");
  }
  mapEngine = self->_mapEngine;
  if (mapEngine)
  {
    v8 = (int8x8_t *)mapEngine[140];
    if (v8)
    {
      v9 = v8[2];
      if (v9)
      {
        v10 = (uint8x8_t)vcnt_s8(v9);
        v10.i16[0] = vaddlv_u8(v10);
        if (v10.u32[0] > 1uLL)
        {
          v11 = 0x17767EADC5B287BLL;
          if (*(_QWORD *)&v9 <= 0x17767EADC5B287BuLL)
            v11 = 0x17767EADC5B287BuLL % *(_QWORD *)&v9;
        }
        else
        {
          v11 = (*(_QWORD *)&v9 - 1) & 0x17767EADC5B287BLL;
        }
        v12 = *(_QWORD **)(*(_QWORD *)&v8[1] + 8 * v11);
        if (v12)
        {
          v13 = (_QWORD *)*v12;
          if (v13)
          {
            if (v10.u32[0] < 2uLL)
            {
              v14 = *(_QWORD *)&v9 - 1;
              while (1)
              {
                v16 = v13[1];
                if (v16 == 0x17767EADC5B287BLL)
                {
                  if (v13[2] == 0x17767EADC5B287BLL)
                    goto LABEL_31;
                }
                else if ((v16 & v14) != v11)
                {
                  return;
                }
                v13 = (_QWORD *)*v13;
                if (!v13)
                  return;
              }
            }
            do
            {
              v15 = v13[1];
              if (v15 == 0x17767EADC5B287BLL)
              {
                if (v13[2] == 0x17767EADC5B287BLL)
                {
LABEL_31:
                  v17 = v13[5];
                  if (v17)
                  {
                    md::ElevationLogic::setFlyoverTour(v17, 0, 0);
                    if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
                      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
                    v18 = (id)GEOGetVectorKitVKDefaultLog_log;
                    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)v19 = 0;
                      _os_log_impl(&dword_19F029000, v18, OS_LOG_TYPE_INFO, "Flyover Tour: _flyoverTour detached from Elevation logic for pause", v19, 2u);
                    }

                  }
                  return;
                }
              }
              else
              {
                if (v15 >= *(_QWORD *)&v9)
                  v15 %= *(_QWORD *)&v9;
                if (v15 != v11)
                  return;
              }
              v13 = (_QWORD *)*v13;
            }
            while (v13);
          }
        }
      }
    }
  }
}

- (void)resumeFlyoverTourAnimation
{
  shared_ptr<md::VKFlyoverTour> *p_flyoverTour;
  VKFlyoverTour *ptr;
  _QWORD *mapEngine;
  int8x8_t *v6;
  int8x8_t v7;
  uint8x8_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  double v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __shared_weak_count *cntrl;
  unint64_t *v18;
  unint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  void *v22;
  __int128 v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  std::__shared_weak_count *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  double v32;

  if (!self->super._flyoverAnimation)
    return;
  p_flyoverTour = &self->_flyoverTour;
  ptr = self->_flyoverTour.__ptr_;
  if (!ptr)
    return;
  mapEngine = self->_mapEngine;
  if (!mapEngine)
    goto LABEL_34;
  v6 = (int8x8_t *)mapEngine[140];
  if (!v6)
    goto LABEL_34;
  v7 = v6[2];
  if (!*(_QWORD *)&v7)
    goto LABEL_34;
  v8 = (uint8x8_t)vcnt_s8(v7);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] > 1uLL)
  {
    v9 = 0x17767EADC5B287BLL;
    if (*(_QWORD *)&v7 <= 0x17767EADC5B287BuLL)
      v9 = 0x17767EADC5B287BuLL % *(_QWORD *)&v7;
  }
  else
  {
    v9 = (*(_QWORD *)&v7 - 1) & 0x17767EADC5B287BLL;
  }
  v10 = *(_QWORD **)(*(_QWORD *)&v6[1] + 8 * v9);
  if (!v10)
    goto LABEL_34;
  v11 = (_QWORD *)*v10;
  if (!v11)
    goto LABEL_34;
  if (v8.u32[0] < 2uLL)
  {
    v12 = *(_QWORD *)&v7 - 1;
    while (1)
    {
      v15 = v11[1];
      if (v15 == 0x17767EADC5B287BLL)
      {
        if (v11[2] == 0x17767EADC5B287BLL)
          goto LABEL_26;
      }
      else if ((v15 & v12) != v9)
      {
        goto LABEL_34;
      }
      v13 = 0.0;
      v11 = (_QWORD *)*v11;
      if (!v11)
        goto LABEL_35;
    }
  }
  while (1)
  {
    v14 = v11[1];
    if (v14 == 0x17767EADC5B287BLL)
      break;
    if (v14 >= *(_QWORD *)&v7)
      v14 %= *(_QWORD *)&v7;
    if (v14 != v9)
      goto LABEL_34;
LABEL_15:
    v13 = 0.0;
    v11 = (_QWORD *)*v11;
    if (!v11)
      goto LABEL_35;
  }
  if (v11[2] != 0x17767EADC5B287BLL)
    goto LABEL_15;
LABEL_26:
  v16 = v11[5];
  if (!v16)
  {
LABEL_34:
    v13 = 0.0;
    goto LABEL_35;
  }
  cntrl = self->_flyoverTour.__cntrl_;
  if (cntrl)
  {
    v18 = (unint64_t *)((char *)cntrl + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
    md::ElevationLogic::setFlyoverTour(v16, (uint64_t)ptr, (uint64_t)cntrl);
    v20 = (unint64_t *)((char *)cntrl + 8);
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  else
  {
    md::ElevationLogic::setFlyoverTour(v11[5], (uint64_t)ptr, 0);
  }
  v13 = *(double *)(v16 + 176);
LABEL_35:
  -[VKCameraController vkCamera](self, "vkCamera");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCameraController camera](self, "camera");
  if (v22)
  {
    objc_msgSend(v22, "cameraFrame:", *v27 == 0);
  }
  else
  {
    v32 = 0.0;
    v30 = 0u;
    v31 = 0u;
    v29 = 0u;
  }
  v23 = v30;
  *(_OWORD *)&self->_resumeTourPosition._target.latitude._value = v29;
  *(_OWORD *)&self->_resumeTourPosition._target.altitude._value = v23;
  *(_OWORD *)&self->_resumeTourPosition._pitch._value = v31;
  self->_resumeTourPosition._roll._value = v32;
  if (v28)
  {
    p_shared_owners = (unint64_t *)&v28->__shared_owners_;
    do
      v25 = __ldaxr(p_shared_owners);
    while (__stlxr(v25 - 1, p_shared_owners));
    if (!v25)
    {
      ((void (*)())v28->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v28);
    }
  }

  self->_resumeTourPosition._target.altitude._value = v13;
  self->_resumeTourFraction = 1.0;
  v26 = *((_QWORD *)p_flyoverTour->__ptr_ + 27);
  if (v26)
  {
    LODWORD(v29) = 2;
    (*(void (**)(uint64_t, __int128 *))(*(_QWORD *)v26 + 48))(v26, &v29);
  }
  -[VKTimedAnimation resume](self->super._flyoverAnimation, "resume");
}

- (void)stopFlyoverTourAnimation
{
  VKTimedAnimation *moveToTourPositionAnimation;
  VKTimedAnimation *flyoverAnimation;
  VKFlyoverTour *ptr;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  float v9;
  int v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  int v15;

  moveToTourPositionAnimation = self->super._moveToTourPositionAnimation;
  if (moveToTourPositionAnimation)
    -[VKAnimation stop](moveToTourPositionAnimation, "stop");
  flyoverAnimation = self->super._flyoverAnimation;
  if (flyoverAnimation)
  {
    ptr = self->_flyoverTour.__ptr_;
    if (!ptr)
    {
LABEL_26:
      -[VKTimedAnimation stopAnimation:](flyoverAnimation, "stopAnimation:", 0);
      -[VKCameraController endRegionChange](self, "endRegionChange");
      return;
    }
    v6 = *((_QWORD *)ptr + 27);
    if (!v6)
      goto LABEL_25;
    v7 = (uint64_t *)*((_QWORD *)ptr + 1);
    if (v7)
    {
      v8 = *v7;
      if (v8)
        v9 = *(double *)(v8 + 144);
      else
        v9 = 0.0;
      if (vabds_f32(*((float *)ptr + 35), v9) <= 0.01)
        v10 = 5;
      else
        v10 = 3;
    }
    else
    {
      v10 = 5;
    }
    v15 = v10;
    (*(void (**)(uint64_t, int *))(*(_QWORD *)v6 + 48))(v6, &v15);
    v11 = (_QWORD *)*((_QWORD *)ptr + 27);
    *((_QWORD *)ptr + 27) = 0;
    if (v11 == (_QWORD *)((char *)ptr + 192))
    {
      v12 = 4;
      v11 = (_QWORD *)((char *)ptr + 192);
    }
    else
    {
      if (!v11)
      {
LABEL_20:
        v13 = (_QWORD *)*((_QWORD *)ptr + 31);
        *((_QWORD *)ptr + 31) = 0;
        if (v13 == (_QWORD *)((char *)ptr + 224))
        {
          v14 = 4;
          v13 = (_QWORD *)((char *)ptr + 224);
          goto LABEL_24;
        }
        if (v13)
        {
          v14 = 5;
LABEL_24:
          (*(void (**)(void))(*v13 + 8 * v14))();
        }
LABEL_25:
        flyoverAnimation = self->super._flyoverAnimation;
        goto LABEL_26;
      }
      v12 = 5;
    }
    (*(void (**)(void))(*v11 + 8 * v12))();
    goto LABEL_20;
  }
}

- (void)interruptFlyoverTourAnimation
{
  VKTimedAnimation *moveToTourPositionAnimation;
  VKTimedAnimation *flyoverAnimation;
  VKFlyoverTour *ptr;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  int v11;

  moveToTourPositionAnimation = self->super._moveToTourPositionAnimation;
  if (moveToTourPositionAnimation)
    -[VKAnimation stop](moveToTourPositionAnimation, "stop");
  flyoverAnimation = self->super._flyoverAnimation;
  if (flyoverAnimation)
  {
    ptr = self->_flyoverTour.__ptr_;
    if (!ptr)
    {
LABEL_18:
      -[VKTimedAnimation stopAnimation:](flyoverAnimation, "stopAnimation:", 0);
      -[VKCameraController endRegionChange](self, "endRegionChange");
      return;
    }
    v6 = *((_QWORD *)ptr + 27);
    if (!v6)
      goto LABEL_17;
    v7 = 4;
    v11 = 4;
    (*(void (**)(uint64_t, int *))(*(_QWORD *)v6 + 48))(v6, &v11);
    v8 = (_QWORD *)*((_QWORD *)ptr + 27);
    *((_QWORD *)ptr + 27) = 0;
    if (v8 == (_QWORD *)((char *)ptr + 192))
    {
      v8 = (_QWORD *)((char *)ptr + 192);
    }
    else
    {
      if (!v8)
      {
LABEL_12:
        v9 = (_QWORD *)*((_QWORD *)ptr + 31);
        *((_QWORD *)ptr + 31) = 0;
        if (v9 == (_QWORD *)((char *)ptr + 224))
        {
          v10 = 4;
          v9 = (_QWORD *)((char *)ptr + 224);
          goto LABEL_16;
        }
        if (v9)
        {
          v10 = 5;
LABEL_16:
          (*(void (**)(void))(*v9 + 8 * v10))();
        }
LABEL_17:
        flyoverAnimation = self->super._flyoverAnimation;
        goto LABEL_18;
      }
      v7 = 5;
    }
    (*(void (**)(void))(*v8 + 8 * v7))();
    goto LABEL_12;
  }
}

- (BOOL)isFlyoverTourStarted
{
  VKFlyoverTour *ptr;
  uint64_t v3;
  float v4;

  if (!self->super._flyoverAnimation)
    return 0;
  ptr = self->_flyoverTour.__ptr_;
  if (!ptr)
    return 0;
  v3 = *((_QWORD *)ptr + 1);
  if (!v3)
    return 0;
  if (*(_QWORD *)v3)
    v4 = *(double *)(*(_QWORD *)v3 + 144);
  else
    v4 = 0.0;
  return vabds_f32(*((float *)ptr + 35), v4) > 0.01;
}

- (BOOL)tourShouldResumeWhenDoneGesturing
{
  return self->_tourShouldResumeWhenDoneGesturing;
}

- (void)setTourShouldResumeWhenDoneGesturing:(BOOL)a3
{
  self->_tourShouldResumeWhenDoneGesturing = a3;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 35) = 0;
  *((_QWORD *)self + 36) = 0;
  *((int64x2_t *)self + 21) = vdupq_n_s64(0xC00921FB54442D18);
  *((_OWORD *)self + 22) = 0u;
  *((_OWORD *)self + 23) = 0u;
  *((_QWORD *)self + 48) = 0;
  return self;
}

void __88__VKMapCameraController_animateToTourPosition_timingFunction_animationStyle_completion___block_invoke(uint64_t a1, float a2)
{
  _QWORD *WeakRetained;
  uint64_t v5;
  double v6;
  double v7;
  long double v8;
  long double v9;
  long double v10;
  double v11;
  long double v12;
  long double v13;
  long double v14;
  double v15;
  long double v16;
  long double v17;
  long double v18;
  long double v19;
  __n128 v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  void *v23;
  __int128 v24;
  float64x2_t v25;
  __int128 v26;
  _BYTE *v27;
  std::__shared_weak_count *v28;
  double v29[7];
  double v30[2];
  float64x2_t v31;
  double v32;
  double v33;
  double v34;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained[35];
  v24 = *(_OWORD *)(v5 + 72);
  v25 = *(float64x2_t *)(v5 + 88);
  v6 = *(double *)(v5 + 120);
  v7 = *(double *)(a1 + 40);
  v26 = *(_OWORD *)(v5 + 104);
  v8 = fmod(3.14159265 - v7 + *(double *)&v24, 6.28318531);
  v9 = fmod(v8 + 6.28318531, 6.28318531);
  v10 = fmod(v7 + 3.14159265 + (v9 + -3.14159265) * a2, 6.28318531);
  v30[0] = fmod(v10 + 6.28318531, 6.28318531) + -3.14159265;
  v11 = *(double *)(a1 + 48);
  v12 = fmod(3.14159265 - v11 + *((double *)&v24 + 1), 6.28318531);
  v13 = fmod(v12 + 6.28318531, 6.28318531);
  v14 = fmod(v11 + 3.14159265 + (v13 + -3.14159265) * a2, 6.28318531);
  v30[1] = fmod(v14 + 6.28318531, 6.28318531) + -3.14159265;
  v31 = vmlaq_n_f64(*(float64x2_t *)(a1 + 56), vsubq_f64(v25, *(float64x2_t *)(a1 + 56)), a2);
  v15 = *(double *)(a1 + 80);
  v16 = fmod(3.14159265 - v15 + *((double *)&v26 + 1), 6.28318531);
  v17 = fmod(v16 + 6.28318531, 6.28318531);
  v18 = fmod(v15 + 3.14159265 + (v17 + -3.14159265) * a2, 6.28318531);
  v19 = fmod(v18 + 6.28318531, 6.28318531);
  v32 = *(double *)(a1 + 72) + (*(double *)&v26 - *(double *)(a1 + 72)) * a2;
  v33 = v19 + -3.14159265;
  v34 = *(double *)(a1 + 88) + (v6 - *(double *)(a1 + 88)) * a2;
  *(float64_t *)(v5 + 152) = v31.f64[0];
  v31.f64[0] = 0.0;
  objc_msgSend(WeakRetained, "camera");
  v20.n128_f64[0] = gdc::CameraFrame<geo::Radians,double>::toRigidTransformMercator(v29, v30, *v27 == 0);
  if (v28)
  {
    p_shared_owners = (unint64_t *)&v28->__shared_owners_;
    do
      v22 = __ldaxr(p_shared_owners);
    while (__stlxr(v22 - 1, p_shared_owners));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v28->__on_zero_shared)(v28, v20);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  objc_msgSend(WeakRetained, "vkCamera", v20.n128_f64[0], (_QWORD)v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTransform:", v29);

}

void __88__VKMapCameraController_animateToTourPosition_timingFunction_animationStyle_completion___block_invoke_34(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v3 = (void *)v4[22];
    v4[22] = 0;

    WeakRetained = v4;
  }

}

void __86__VKMapCameraController_flyoverTourAnimation_animateToStart_labelChanged_stateChange___block_invoke(uint64_t a1, float a2)
{
  float v2;
  float64x2_t *WeakRetained;
  float64x2_t *v5;
  float64_t v6;
  float v7;
  void *v8;
  float v9;
  double *v10;
  float v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  int v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  _DWORD *v23;
  uint64_t v24;
  void *v25;
  float v26;
  float v27;
  void *v28;
  float v29;
  float v30;
  void *v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  double v39;
  uint64_t v40;
  unint64_t v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  float *v45;
  int v46;
  unint64_t v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int v51;
  float64x2_t v52;
  uint64_t v53;
  double v54;
  double v55;
  uint64_t v56;
  uint64_t v57;
  unsigned int v58;
  float64x2_t v59;
  uint64_t v60;
  uint64_t v61;
  float v62;
  void *v63;
  int v64;
  float64_t v65;
  int64x2_t *v66;
  float64x2_t *v67;
  __int128 *v68;
  double *v69;
  int64x2_t *v70;
  float64x2_t *v71;
  __int128 *v72;
  double *v73;
  float64x2_t v74;
  __int128 v75;
  double v76;
  void *v77;
  char v78;
  double v79;
  double v80;
  float v81;
  long double v82;
  long double v83;
  long double v84;
  long double v85;
  double v86;
  long double v87;
  long double v88;
  long double v89;
  long double v90;
  double v91;
  long double v92;
  long double v93;
  long double v94;
  long double v95;
  float64_t v96;
  double v97;
  __n128 v98;
  unint64_t *p_shared_owners;
  unint64_t v100;
  void *v101;
  int64x2_t v102;
  double v103;
  __int128 v104;
  float64x2_t v105;
  _BYTE *v106;
  std::__shared_weak_count *v107;
  double v108[7];
  int64x2_t v109;
  float64x2_t v110;
  __int128 v111;
  double v112;

  WeakRetained = (float64x2_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_93;
  v6 = WeakRetained[17].f64[1];
  v7 = *(float *)(*(_QWORD *)&v6 + 128);
  if (v7 > a2)
  {
    v7 = v7 + -1.0;
    *(float *)(*(_QWORD *)&v6 + 128) = v7;
  }
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "toursAnimationSpeed");
  *(float *)(*(_QWORD *)&v6 + 148) = v9 * (float)(a2 - v7);

  v10 = *(double **)(*(_QWORD *)&v6 + 8);
  if (!v10)
  {
    *(float *)(*(_QWORD *)&v6 + 128) = a2;
LABEL_92:
    -[float64x2_t stopFlyoverTourAnimation](v5, "stopFlyoverTourAnimation");
    goto LABEL_93;
  }
  if (*(_QWORD *)v10)
    v11 = *(double *)(*(_QWORD *)v10 + 144);
  else
    v11 = 0.0;
  if (vabds_f32(*(float *)(*(_QWORD *)&v6 + 140), v11) <= 0.01)
    goto LABEL_75;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "toursInterestingViewSpeed");
  v14 = v13;

  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "toursViewRecoverySpeed");
  v17 = v16;

  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "toursForceCompleteTileLoading");

  v20 = **(_QWORD **)(*(_QWORD *)&v6 + 8);
  if (v20)
  {
    v21 = *(double *)(v20 + 144);
    v22 = *(_QWORD *)(*(_QWORD *)&v6 + 184);
    if (v22)
      goto LABEL_12;
LABEL_16:
    std::__throw_bad_function_call[abi:nn180100]();
    __break(1u);
LABEL_17:
    if (*(_QWORD *)(v24 + 16))
      goto LABEL_21;
    goto LABEL_18;
  }
  v21 = 0.0;
  v22 = *(_QWORD *)(*(_QWORD *)&v6 + 184);
  if (!v22)
    goto LABEL_16;
LABEL_12:
  v2 = (*(float (**)(uint64_t))(*(_QWORD *)v22 + 48))(v22);
  v23 = *(_DWORD **)(*(_QWORD *)&v6 + 8);
  v24 = *(_QWORD *)(*(_QWORD *)v23 + 120) + 32 * v23[4];
  if (*(char *)(v24 + 31) < 0)
    goto LABEL_17;
  if (*(_BYTE *)(v24 + 31))
    goto LABEL_21;
LABEL_18:
  if (*(float *)(*(_QWORD *)&v6 + 140) < *(float *)(*(_QWORD *)&v6 + 136) && v23[2])
    v14 = v17;
LABEL_21:
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "toursModulateSpeed"))
    v26 = v14;
  else
    v26 = 1.0;

  if (v2 < 1.0)
  {
    v27 = expf(v2) + -1.36787944;
    v17 = fmaxf(v27, 0.0);
    if (v19)
      *(_DWORD *)(*(_QWORD *)&v6 + 148) = 0;
  }
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "toursPreloadHeadTime");
  v30 = v29;

  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v21;
  v33 = v17 * v30;
  if ((objc_msgSend(v31, "toursPreloadSlowsSpeed") & (v17 < v26)) == 0)
    v17 = v26;

  v34 = *(float *)(*(_QWORD *)&v6 + 148);
  v35 = *(float *)(*(_QWORD *)&v6 + 132) + (float)((float)(v17 - *(float *)(*(_QWORD *)&v6 + 132)) * v34);
  v36 = fminf(fmaxf(*(float *)(*(_QWORD *)&v6 + 136) + v34, 0.0), v32);
  v37 = fminf(fmaxf(*(float *)(*(_QWORD *)&v6 + 140) + (float)(v35 * v34), 0.0), v32);
  v38 = fminf(fmaxf(v37 + v33, v37), v32);
  if ((v19 & 1) != 0)
    v38 = v37;
  *(float *)(*(_QWORD *)&v6 + 140) = v37;
  *(float *)(*(_QWORD *)&v6 + 144) = v38;
  *(float *)(*(_QWORD *)&v6 + 132) = v35;
  *(float *)(*(_QWORD *)&v6 + 136) = v36;
  v10 = *(double **)(*(_QWORD *)&v6 + 8);
  v39 = v37;
  v10[3] = v39;
  v40 = *(_QWORD *)v10;
  if (*(_QWORD *)v10)
  {
    v41 = *((unsigned int *)v10 + 4);
    v42 = v39 / *(double *)(v40 + 144);
    v43 = *(_QWORD *)(v40 + 120);
    if (v42 >= *(float *)(v43 + 32 * v41 + 4))
    {
      v47 = ((*(_QWORD *)(v40 + 128) - v43) >> 5) - 1;
      if (v47 > v41)
      {
        v44 = *((unsigned int *)v10 + 4);
        v48 = *((_DWORD *)v10 + 4);
        while (v42 >= *(float *)(v43 + 32 * v44 + 4))
        {
          v44 = ++v48;
          if (v47 <= v48)
            goto LABEL_48;
        }
        LODWORD(v44) = v48;
        goto LABEL_48;
      }
    }
    else if ((_DWORD)v41)
    {
      LODWORD(v44) = *((_DWORD *)v10 + 4);
      if (v42 < *(float *)(v43 + 32 * v41))
      {
        v45 = (float *)(v43 + 32 * v41);
        v46 = *((_DWORD *)v10 + 4);
        while (v42 < *v45)
        {
          v45 -= 8;
          if (!--v46)
          {
            LODWORD(v44) = 0;
            goto LABEL_48;
          }
        }
        LODWORD(v44) = v46;
      }
      goto LABEL_48;
    }
    LODWORD(v44) = *((_DWORD *)v10 + 4);
LABEL_48:
    *((_DWORD *)v10 + 4) = v44;
    v49 = *((unsigned int *)v10 + 2);
    v50 = *(_QWORD *)(v40 + 72);
    if (v42 >= *(double *)(v50 + 8 * v49))
    {
      do
      {
        v51 = v49;
        if (((*(_QWORD *)(v40 + 80) - v50) >> 3) - 1 <= (unint64_t)v49)
          break;
        LODWORD(v49) = v49 + 1;
      }
      while (v42 > *(double *)(v50 + 8 * v49));
    }
    else if ((_DWORD)v49)
    {
      while (v42 < *(double *)(v50 + 8 * v49))
      {
        if (!(_DWORD)--v49)
          goto LABEL_52;
      }
      v51 = v49;
    }
    else
    {
LABEL_52:
      v51 = 0;
    }
    *((_DWORD *)v10 + 2) = v51;
    *((_BYTE *)v10 + 32) = (_DWORD)v41 != (_DWORD)v44;
    md::AnimationData::interpolateFrames((md::AnimationData *)&v109, v39, v40, v51);
    v10 = *(double **)(*(_QWORD *)&v6 + 8);
    v38 = *(float *)(*(_QWORD *)&v6 + 144);
    goto LABEL_58;
  }
  v109 = vdupq_n_s64(0xC00921FB54442D18);
  v110 = 0u;
  v111 = 0u;
  v112 = 0.0;
LABEL_58:
  v52 = v110;
  *(int64x2_t *)(*(_QWORD *)&v6 + 72) = v109;
  *(float64x2_t *)(*(_QWORD *)&v6 + 88) = v52;
  *(_OWORD *)(*(_QWORD *)&v6 + 104) = v111;
  *(double *)(*(_QWORD *)&v6 + 120) = v112;
  v53 = *(_QWORD *)v10;
  if (*(_QWORD *)v10)
  {
    v54 = v38;
    v55 = v38 / *(double *)(v53 + 144);
    v56 = *((unsigned int *)v10 + 3);
    v57 = *(_QWORD *)(v53 + 72);
    if (v55 >= *(double *)(v57 + 8 * v56))
    {
      do
      {
        v58 = v56;
        if (((*(_QWORD *)(v53 + 80) - v57) >> 3) - 1 <= (unint64_t)v56)
          break;
        LODWORD(v56) = v56 + 1;
      }
      while (v55 > *(double *)(v57 + 8 * v56));
    }
    else if ((_DWORD)v56)
    {
      while (v55 < *(double *)(v57 + 8 * v56))
      {
        if (!(_DWORD)--v56)
          goto LABEL_63;
      }
      v58 = v56;
    }
    else
    {
LABEL_63:
      v58 = 0;
    }
    *((_DWORD *)v10 + 3) = v58;
    md::AnimationData::interpolateFrames((md::AnimationData *)&v109, v54, v53, v58);
    v10 = *(double **)(*(_QWORD *)&v6 + 8);
  }
  else
  {
    v109 = vdupq_n_s64(0xC00921FB54442D18);
    v110 = 0u;
    v111 = 0u;
    v112 = 0.0;
  }
  v59 = v110;
  *(int64x2_t *)(*(_QWORD *)&v6 + 16) = v109;
  *(float64x2_t *)(*(_QWORD *)&v6 + 32) = v59;
  *(_OWORD *)(*(_QWORD *)&v6 + 48) = v111;
  *(double *)(*(_QWORD *)&v6 + 64) = v112;
  v60 = *(_QWORD *)(*(_QWORD *)&v6 + 248);
  if (!v60)
  {
LABEL_73:
    *(float *)(*(_QWORD *)&v6 + 128) = a2;
    if (!v10)
      goto LABEL_92;
    goto LABEL_76;
  }
  if (*((_BYTE *)v10 + 32))
  {
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v60 + 48))(v60, *(_QWORD *)(*(_QWORD *)v10 + 120) + 32 * *((unsigned int *)v10 + 4) + 8);
    v10 = *(double **)(*(_QWORD *)&v6 + 8);
    goto LABEL_73;
  }
LABEL_75:
  *(float *)(*(_QWORD *)&v6 + 128) = a2;
LABEL_76:
  v61 = *(_QWORD *)v10;
  if (v61)
    v62 = *(double *)(v61 + 144);
  else
    v62 = 0.0;
  if (vabds_f32(*(float *)(*(_QWORD *)&v6 + 140), v62) <= 0.01)
    goto LABEL_92;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "tourUsePreloadPosition");
  v65 = v5[17].f64[1];
  v66 = (int64x2_t *)(*(_QWORD *)&v65 + 72);
  v67 = (float64x2_t *)(*(_QWORD *)&v65 + 88);
  v68 = (__int128 *)(*(_QWORD *)&v65 + 104);
  v69 = (double *)(*(_QWORD *)&v65 + 120);
  v70 = (int64x2_t *)(*(_QWORD *)&v65 + 16);
  v71 = (float64x2_t *)(*(_QWORD *)&v65 + 32);
  v72 = (__int128 *)(*(_QWORD *)&v65 + 48);
  v73 = (double *)(*(_QWORD *)&v65 + 64);
  if (v64)
  {
    v66 = v70;
    v68 = v72;
    v67 = v71;
  }
  else
  {
    v73 = v69;
  }
  v74 = *v67;
  v75 = *v68;
  v76 = *v73;
  v102 = *v66;
  v109 = *v66;
  v110 = v74;
  v104 = v75;
  v105 = v74;
  v111 = v75;
  v112 = v76;

  if (*(float *)&v5[24].f64[1] > 0.0)
  {
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v77, "tourUsePreloadPosition");

    if ((v78 & 1) == 0)
    {
      *(float *)&v79 = 1.0 - *(float *)&v5[24].f64[1];
      (*((void (**)(double))VKAnimationCurveEaseOut + 2))(v79);
      v80 = v5[21].f64[0];
      v103 = v81;
      v82 = fmod(3.14159265 - v80 + *(double *)v102.i64, 6.28318531);
      v83 = fmod(v82 + 6.28318531, 6.28318531);
      v84 = fmod(v80 + 3.14159265 + (v83 + -3.14159265) * v103, 6.28318531);
      v85 = fmod(v84 + 6.28318531, 6.28318531) + -3.14159265;
      v86 = v5[21].f64[1];
      v87 = fmod(3.14159265 - v86 + *(double *)&v102.i64[1], 6.28318531);
      v88 = fmod(v87 + 6.28318531, 6.28318531);
      v89 = fmod(v86 + 3.14159265 + (v88 + -3.14159265) * v103, 6.28318531);
      v90 = fmod(v89 + 6.28318531, 6.28318531) + -3.14159265;
      v105 = vmlaq_n_f64(v5[22], vsubq_f64(v105, v5[22]), v103);
      v91 = v5[23].f64[1];
      v92 = fmod(3.14159265 - v91 + *((double *)&v104 + 1), 6.28318531);
      v93 = fmod(v92 + 6.28318531, 6.28318531);
      v94 = fmod(v91 + 3.14159265 + (v93 + -3.14159265) * v103, 6.28318531);
      v95 = fmod(v94 + 6.28318531, 6.28318531);
      v96 = v5[23].f64[0] + (*(double *)&v104 - v5[23].f64[0]) * v103;
      v97 = v5[24].f64[0] + (v76 - v5[24].f64[0]) * v103;
      *(long double *)v109.i64 = v85;
      *(long double *)&v109.i64[1] = v90;
      v110 = v105;
      *(float64_t *)&v111 = v96;
      *((double *)&v111 + 1) = v95 + -3.14159265;
      v112 = v97;
      *(float *)&v95 = *(float *)&v5[24].f64[1] + *(float *)(*(_QWORD *)&v5[17].f64[1] + 148) * -0.666666667;
      LODWORD(v5[24].f64[1]) = LODWORD(v95);
    }
  }
  *(float64_t *)(*(_QWORD *)&v5[17].f64[1] + 152) = v105.f64[0];
  v110.f64[0] = 0.0;
  -[float64x2_t camera](v5, "camera", *(_OWORD *)&v102);
  v98.n128_f64[0] = gdc::CameraFrame<geo::Radians,double>::toRigidTransformMercator(v108, (double *)v109.i64, *v106 == 0);
  if (v107)
  {
    p_shared_owners = (unint64_t *)&v107->__shared_owners_;
    do
      v100 = __ldaxr(p_shared_owners);
    while (__stlxr(v100 - 1, p_shared_owners));
    if (!v100)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v107->__on_zero_shared)(v107, v98);
      std::__shared_weak_count::__release_weak(v107);
    }
  }
  -[float64x2_t vkCamera](v5, "vkCamera", v98.n128_f64[0]);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setTransform:", v108);

LABEL_93:
}

void __86__VKMapCameraController_flyoverTourAnimation_animateToStart_labelChanged_stateChange___block_invoke_2(uint64_t a1, int a2)
{
  _QWORD *WeakRetained;
  uint64_t v5;
  void (*v6)(void);
  NSObject *v7;
  uint64_t v8;
  int8x8_t *v9;
  int8x8_t v10;
  uint8x8_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  NSObject *v21;
  uint8x8_t v22;
  unint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  NSObject *v31;
  uint8x8_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  std::__shared_weak_count *v42;
  unint64_t *p_shared_owners;
  unint64_t v44;
  void *v45;
  NSObject *v46;
  uint8_t v47[8];
  _BYTE v48[24];
  _BYTE *v49;
  char v50;
  _BYTE v51[24];
  _BYTE *v52;
  char v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
    goto LABEL_119;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v6 = *(void (**)(void))(v5 + 16);
    if (a2)
    {
      v6();
    }
    else
    {
      v6();
      if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
        dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
      v7 = (id)GEOGetVectorKitVKDefaultLog_log;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v47 = 0;
        _os_log_impl(&dword_19F029000, v7, OS_LOG_TYPE_INFO, "Flyover Tour: prematurely stopped", v47, 2u);
      }

    }
  }
  v8 = WeakRetained[34];
  if (!v8)
    goto LABEL_107;
  v9 = *(int8x8_t **)(v8 + 1120);
  if (!v9)
    goto LABEL_107;
  v10 = v9[2];
  if (!*(_QWORD *)&v10)
    goto LABEL_107;
  v11 = (uint8x8_t)vcnt_s8(v10);
  v11.i16[0] = vaddlv_u8(v11);
  v12 = v11.u32[0];
  if (v11.u32[0] > 1uLL)
  {
    v13 = 0x4BD0C73E70A08DDBLL;
    if (*(_QWORD *)&v10 <= 0x4BD0C73E70A08DDBuLL)
      v13 = 0x4BD0C73E70A08DDBuLL % *(_QWORD *)&v10;
  }
  else
  {
    v13 = (*(_QWORD *)&v10 - 1) & 0x4BD0C73E70A08DDBLL;
  }
  v14 = *(_QWORD **)(*(_QWORD *)&v9[1] + 8 * v13);
  if (!v14)
    goto LABEL_47;
  v15 = (_QWORD *)*v14;
  if (!v15)
    goto LABEL_47;
  if (v11.u32[0] < 2uLL)
  {
    while (1)
    {
      v17 = v15[1];
      if (v17 == 0x4BD0C73E70A08DDBLL)
      {
        if (v15[2] == 0x4BD0C73E70A08DDBLL)
          goto LABEL_33;
      }
      else if ((v17 & (*(_QWORD *)&v10 - 1)) != v13)
      {
        goto LABEL_45;
      }
      v15 = (_QWORD *)*v15;
      if (!v15)
        goto LABEL_45;
    }
  }
  while (1)
  {
    v16 = v15[1];
    if (v16 == 0x4BD0C73E70A08DDBLL)
      break;
    if (v16 >= *(_QWORD *)&v10)
      v16 %= *(_QWORD *)&v10;
    if (v16 != v13)
      goto LABEL_45;
LABEL_22:
    v15 = (_QWORD *)*v15;
    if (!v15)
      goto LABEL_45;
  }
  if (v15[2] != 0x4BD0C73E70A08DDBLL)
    goto LABEL_22;
LABEL_33:
  v18 = v15[5];
  if (v18)
  {
    v51[0] = 0;
    v53 = 0;
    std::__optional_storage_base<std::function<geo::optional<gm::Range<double>> ()(geo::QuadTile const&)>,false>::__assign_from[abi:nn180100]<std::__optional_copy_assign_base<std::function<geo::optional<gm::Range<double>> ()(geo::QuadTile const&)>,false> const&>((_QWORD *)(v18 + 288), (uint64_t)v51);
    if (v53)
    {
      v19 = v52;
      if (v52 == v51)
      {
        v20 = 4;
        v19 = v51;
LABEL_39:
        (*(void (**)(void))(*v19 + 8 * v20))();
      }
      else if (v52)
      {
        v20 = 5;
        goto LABEL_39;
      }
    }
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
    v21 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v47 = 0;
      _os_log_impl(&dword_19F029000, v21, OS_LOG_TYPE_INFO, "Flyover Tour: NeighborCameraPositionProvider set to std::nullopt in FlyoverTileDataLogic", v47, 2u);
    }

    v9 = *(int8x8_t **)(WeakRetained[34] + 1120);
    v10 = v9[2];
  }
LABEL_45:
  if (!*(_QWORD *)&v10)
    goto LABEL_107;
  v22 = (uint8x8_t)vcnt_s8(v10);
  v22.i16[0] = vaddlv_u8(v22);
  v12 = v22.u32[0];
LABEL_47:
  if (v12 > 1)
  {
    v23 = 0xAF46DE79C836B0D8;
    if (*(_QWORD *)&v10 <= 0xAF46DE79C836B0D8)
      v23 = 0xAF46DE79C836B0D8 % *(_QWORD *)&v10;
  }
  else
  {
    v23 = (*(_QWORD *)&v10 - 1) & 0xAF46DE79C836B0D8;
  }
  v24 = *(_QWORD **)(*(_QWORD *)&v9[1] + 8 * v23);
  if (!v24)
    goto LABEL_81;
  v25 = (_QWORD *)*v24;
  if (!v25)
    goto LABEL_81;
  if (v12 < 2)
  {
    while (1)
    {
      v27 = v25[1];
      if (v27 == 0xAF46DE79C836B0D8)
      {
        if (v25[2] == 0xAF46DE79C836B0D8)
          goto LABEL_67;
      }
      else if ((v27 & (*(_QWORD *)&v10 - 1)) != v23)
      {
        goto LABEL_79;
      }
      v25 = (_QWORD *)*v25;
      if (!v25)
        goto LABEL_79;
    }
  }
  while (2)
  {
    v26 = v25[1];
    if (v26 != 0xAF46DE79C836B0D8)
    {
      if (v26 >= *(_QWORD *)&v10)
        v26 %= *(_QWORD *)&v10;
      if (v26 != v23)
        goto LABEL_79;
      goto LABEL_56;
    }
    if (v25[2] != 0xAF46DE79C836B0D8)
    {
LABEL_56:
      v25 = (_QWORD *)*v25;
      if (!v25)
        goto LABEL_79;
      continue;
    }
    break;
  }
LABEL_67:
  v28 = v25[5];
  if (v28)
  {
    v48[0] = 0;
    v50 = 0;
    std::__optional_storage_base<std::function<geo::optional<gm::Range<double>> ()(geo::QuadTile const&)>,false>::__assign_from[abi:nn180100]<std::__optional_copy_assign_base<std::function<geo::optional<gm::Range<double>> ()(geo::QuadTile const&)>,false> const&>((_QWORD *)(v28 + 376), (uint64_t)v48);
    if (v50)
    {
      v29 = v49;
      if (v49 == v48)
      {
        v30 = 4;
        v29 = v48;
LABEL_73:
        (*(void (**)(void))(*v29 + 8 * v30))();
      }
      else if (v49)
      {
        v30 = 5;
        goto LABEL_73;
      }
    }
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
    v31 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v47 = 0;
      _os_log_impl(&dword_19F029000, v31, OS_LOG_TYPE_INFO, "Flyover Tour: NeighborCameraPositionProvider set to std::nullopt in TileSelectionLogic", v47, 2u);
    }

    v9 = *(int8x8_t **)(WeakRetained[34] + 1120);
    v10 = v9[2];
  }
LABEL_79:
  if (!*(_QWORD *)&v10)
    goto LABEL_107;
  v32 = (uint8x8_t)vcnt_s8(v10);
  v32.i16[0] = vaddlv_u8(v32);
  v12 = v32.u32[0];
LABEL_81:
  if (v12 > 1)
  {
    v33 = 0x17767EADC5B287BLL;
    if (*(_QWORD *)&v10 <= 0x17767EADC5B287BuLL)
      v33 = 0x17767EADC5B287BuLL % *(_QWORD *)&v10;
  }
  else
  {
    v33 = (*(_QWORD *)&v10 - 1) & 0x17767EADC5B287BLL;
  }
  v34 = *(_QWORD **)(*(_QWORD *)&v9[1] + 8 * v33);
  if (v34)
  {
    v35 = (_QWORD *)*v34;
    if (v35)
    {
      if (v12 < 2)
      {
        v36 = *(_QWORD *)&v10 - 1;
        while (1)
        {
          v38 = v35[1];
          if (v38 == 0x17767EADC5B287BLL)
          {
            if (v35[2] == 0x17767EADC5B287BLL)
              goto LABEL_101;
          }
          else if ((v38 & v36) != v33)
          {
            goto LABEL_107;
          }
          v35 = (_QWORD *)*v35;
          if (!v35)
            goto LABEL_107;
        }
      }
      do
      {
        v37 = v35[1];
        if (v37 == 0x17767EADC5B287BLL)
        {
          if (v35[2] == 0x17767EADC5B287BLL)
          {
LABEL_101:
            v39 = v35[5];
            if (v39)
            {
              md::ElevationLogic::setFlyoverTour(v39, 0, 0);
              if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
                dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
              v40 = (id)GEOGetVectorKitVKDefaultLog_log;
              if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)v47 = 0;
                _os_log_impl(&dword_19F029000, v40, OS_LOG_TYPE_INFO, "Flyover Tour: _flyoverTour detached from Elevation logic upon completion", v47, 2u);
              }

            }
            break;
          }
        }
        else
        {
          if (v37 >= *(_QWORD *)&v10)
            v37 %= *(_QWORD *)&v10;
          if (v37 != v33)
            break;
        }
        v35 = (_QWORD *)*v35;
      }
      while (v35);
    }
  }
LABEL_107:
  v41 = (void *)WeakRetained[21];
  WeakRetained[21] = 0;

  v42 = (std::__shared_weak_count *)WeakRetained[36];
  WeakRetained[35] = 0;
  WeakRetained[36] = 0;
  if (v42)
  {
    p_shared_owners = (unint64_t *)&v42->__shared_owners_;
    do
      v44 = __ldaxr(p_shared_owners);
    while (__stlxr(v44 - 1, p_shared_owners));
    if (!v44)
    {
      ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
      std::__shared_weak_count::__release_weak(v42);
    }
  }
  v45 = (void *)WeakRetained[22];
  if (v45)
    objc_msgSend(v45, "stop");
  objc_msgSend(WeakRetained, "endRegionChange");
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
  v46 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v47 = 0;
    _os_log_impl(&dword_19F029000, v46, OS_LOG_TYPE_INFO, "Flyover Tour: completed", v47, 2u);
  }

LABEL_119:
}

void __86__VKMapCameraController_flyoverTourAnimation_animateToStart_labelChanged_stateChange___block_invoke_33(uint64_t a1, int a2)
{
  VKAnimation **WeakRetained;
  VKAnimation **v5;
  BOOL v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  WeakRetained = (VKAnimation **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (!WeakRetained || (WeakRetained[21] ? (v6 = a2 == 0) : (v6 = 1), v6))
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, 6);
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
    v8 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_19F029000, v8, OS_LOG_TYPE_ERROR, "Flyover Tour: could not move to tour start position", v9, 2u);
    }

  }
  else
  {
    md::AnimationRunner::runAnimation((md::MapEngine **)objc_msgSend(WeakRetained, "animationRunner"), WeakRetained[21]);
  }

}

- (uint64_t)flyoverTourAnimation:animateToStart:labelChanged:stateChange:
{
  uint64_t result;

  *(_QWORD *)a2 = &off_1E42ED3B0;
  objc_copyWeak((id *)(a2 + 8), (id *)(a1 + 8));
  result = MEMORY[0x1A1AF5730](*(_QWORD *)(a1 + 16));
  *(_QWORD *)(a2 + 16) = result;
  return result;
}

- (void)flyoverTourAnimation:animateToStart:labelChanged:stateChange:
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  NSObject **v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  NSObject *v11;
  unint64_t *v12;
  unint64_t v13;
  _QWORD block[5];
  id v15;
  uint64_t v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = *((_QWORD *)WeakRetained + 34);
    if (v6)
    {
      v7 = *(NSObject ***)(v6 + 8);
      v8 = *(std::__shared_weak_count **)(v6 + 16);
      if (v8)
      {
        p_shared_owners = (unint64_t *)&v8->__shared_owners_;
        do
          v10 = __ldxr(p_shared_owners);
        while (__stxr(v10 + 1, p_shared_owners));
      }
      v11 = *v7;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = ___ZZ86__VKMapCameraController_flyoverTourAnimation_animateToStart_labelChanged_stateChange__ENK3__2clERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE_block_invoke;
      block[3] = &unk_1E42F9FF0;
      block[4] = WeakRetained;
      v15 = *(id *)(a1 + 16);
      v16 = a2;
      dispatch_async(v11, block);
      if (v8)
      {
        v12 = (unint64_t *)&v8->__shared_owners_;
        do
          v13 = __ldaxr(v12);
        while (__stlxr(v13 - 1, v12));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
          std::__shared_weak_count::__release_weak(v8);
        }
      }

    }
  }

}

- (id)flyoverTourAnimation:animateToStart:labelChanged:stateChange:
{
  id *v2;
  id *v3;

  v2 = (id *)(a1 + 8);
  v3 = (id *)operator new(0x18uLL);
  *v3 = &off_1E42ED3B0;
  objc_copyWeak(v3 + 1, v2);
  v3[2] = (id)MEMORY[0x1A1AF5730](*(_QWORD *)(a1 + 16));
  return v3;
}

- (float)flyoverTourAnimation:animateToStart:labelChanged:stateChange:
{
  _QWORD *WeakRetained;
  float v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  int8x8_t v9;
  uint64_t *v10;
  uint8x8_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  int8x8_t v15;
  uint64_t *v16;
  uint8x8_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t *v20;
  uint8x8_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t *v26;
  uint8x8_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t *v32;
  uint8x8_t v33;
  uint64_t v34;
  uint64_t **v35;
  uint64_t *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int v40;
  int v41;
  uint8x8_t v42;
  uint64_t v43;
  uint64_t **v44;
  uint64_t *v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint8x8_t v49;
  uint64_t v50;
  uint64_t **v51;
  uint64_t *v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint8x8_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  unsigned int v64;
  unsigned int v65;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  v2 = 1.0;
  if (!WeakRetained)
    goto LABEL_212;
  v3 = WeakRetained[34];
  if (!v3)
    goto LABEL_212;
  v4 = *(_QWORD *)(v3 + 1120);
  v5 = *(_QWORD *)(v4 + 16);
  if ((v5 & (v5 - 1)) != 0)
  {
    v7 = 0x87BA2765F9E38E05;
    if (v5 <= 0x87BA2765F9E38E05)
      v7 = 0x87BA2765F9E38E05 % v5;
    v6 = *(_QWORD **)(*(_QWORD *)(v4 + 8) + 8 * v7);
    do
    {
      do
        v6 = (_QWORD *)*v6;
      while (v6[1] != 0x87BA2765F9E38E05);
    }
    while (v6[2] != 0x87BA2765F9E38E05);
  }
  else
  {
    v6 = *(_QWORD **)(*(_QWORD *)(v4 + 8) + 8 * ((v5 - 1) & 0x87BA2765F9E38E05));
    do
    {
      do
        v6 = (_QWORD *)*v6;
      while (v6[1] != 0x87BA2765F9E38E05);
    }
    while (v6[2] != 0x87BA2765F9E38E05);
  }
  v8 = *(_QWORD *)(v6[5] + 392);
  v9 = *(int8x8_t *)(v8 + 400);
  if (!*(_QWORD *)&v9)
    goto LABEL_33;
  v10 = **(uint64_t ***)(v8 + 392);
  if (v10)
  {
    v10 = (uint64_t *)*v10;
    if (v10)
    {
      v11 = (uint8x8_t)vcnt_s8(v9);
      v11.i16[0] = vaddlv_u8(v11);
      if (v11.u32[0] < 2uLL)
      {
        while (1)
        {
          v12 = v10[1];
          if (v12)
          {
            if ((v12 & (*(_QWORD *)&v9 - 1)) != 0)
              goto LABEL_33;
          }
          else if (!*((_DWORD *)v10 + 4))
          {
            goto LABEL_29;
          }
          v10 = (uint64_t *)*v10;
          if (!v10)
            goto LABEL_34;
        }
      }
      do
      {
        v13 = v10[1];
        if (v13)
        {
          if (v13 < *(_QWORD *)&v9 || v13 % *(_QWORD *)&v9)
            goto LABEL_33;
        }
        else if (!*((_DWORD *)v10 + 4))
        {
LABEL_29:
          v14 = (uint64_t *)v10[5];
          if (v14)
          {
            LODWORD(v10) = 0;
            do
            {
              LODWORD(v10) = (_DWORD)v10 + *((_DWORD *)v14 + 6);
              v14 = (uint64_t *)*v14;
            }
            while (v14);
            break;
          }
LABEL_33:
          LODWORD(v10) = 0;
          break;
        }
        v10 = (uint64_t *)*v10;
      }
      while (v10);
    }
  }
LABEL_34:
  v15 = *(int8x8_t *)(v8 + 360);
  if (!*(_QWORD *)&v15)
    goto LABEL_54;
  v16 = **(uint64_t ***)(v8 + 352);
  if (v16)
  {
    v16 = (uint64_t *)*v16;
    if (v16)
    {
      v17 = (uint8x8_t)vcnt_s8(v15);
      v17.i16[0] = vaddlv_u8(v17);
      if (v17.u32[0] < 2uLL)
      {
        while (1)
        {
          v18 = v16[1];
          if (v18)
          {
            if ((v18 & (*(_QWORD *)&v15 - 1)) != 0)
              goto LABEL_54;
          }
          else if (!*((_DWORD *)v16 + 4))
          {
            goto LABEL_50;
          }
          v16 = (uint64_t *)*v16;
          if (!v16)
            goto LABEL_55;
        }
      }
      do
      {
        v19 = v16[1];
        if (v19)
        {
          if (v19 < *(_QWORD *)&v15 || v19 % *(_QWORD *)&v15)
            goto LABEL_54;
        }
        else if (!*((_DWORD *)v16 + 4))
        {
LABEL_50:
          v20 = (uint64_t *)v16[5];
          if (v20)
          {
            LODWORD(v16) = 0;
            do
            {
              LODWORD(v16) = (_DWORD)v16 + *((_DWORD *)v20 + 6);
              v20 = (uint64_t *)*v20;
            }
            while (v20);
            break;
          }
LABEL_54:
          LODWORD(v16) = 0;
          break;
        }
        v16 = (uint64_t *)*v16;
      }
      while (v16);
    }
  }
LABEL_55:
  if (!*(_QWORD *)&v9)
    goto LABEL_78;
  v21 = (uint8x8_t)vcnt_s8(v9);
  v21.i16[0] = vaddlv_u8(v21);
  v22 = *(_QWORD *)&v9 != 1;
  if (v21.u32[0] < 2uLL)
    v22 = (v9.i8[0] & 1) == 0;
  v23 = *(uint64_t **)(*(_QWORD *)(v8 + 392) + 8 * v22);
  if (v23)
  {
    v23 = (uint64_t *)*v23;
    if (v23)
    {
      if (v21.u32[0] < 2uLL)
      {
        while (1)
        {
          v24 = v23[1];
          if (v24 == 1)
          {
            if (*((_DWORD *)v23 + 4) == 1)
              goto LABEL_74;
          }
          else if ((v24 & (*(_QWORD *)&v9 - 1)) != v22)
          {
            goto LABEL_78;
          }
          v23 = (uint64_t *)*v23;
          if (!v23)
            goto LABEL_79;
        }
      }
      do
      {
        v25 = v23[1];
        if (v25 == 1)
        {
          if (*((_DWORD *)v23 + 4) == 1)
          {
LABEL_74:
            v26 = (uint64_t *)v23[5];
            if (v26)
            {
              LODWORD(v23) = 0;
              do
              {
                LODWORD(v23) = (_DWORD)v23 + *((_DWORD *)v26 + 6);
                v26 = (uint64_t *)*v26;
              }
              while (v26);
              break;
            }
LABEL_78:
            LODWORD(v23) = 0;
            break;
          }
        }
        else
        {
          if (v25 >= *(_QWORD *)&v9)
            v25 %= *(_QWORD *)&v9;
          if (v25 != v22)
            goto LABEL_78;
        }
        v23 = (uint64_t *)*v23;
      }
      while (v23);
    }
  }
LABEL_79:
  if (!*(_QWORD *)&v15)
    goto LABEL_102;
  v27 = (uint8x8_t)vcnt_s8(v15);
  v27.i16[0] = vaddlv_u8(v27);
  v28 = *(_QWORD *)&v15 != 1;
  if (v27.u32[0] < 2uLL)
    v28 = (v15.i8[0] & 1) == 0;
  v29 = *(uint64_t **)(*(_QWORD *)(v8 + 352) + 8 * v28);
  if (!v29)
    goto LABEL_103;
  v29 = (uint64_t *)*v29;
  if (!v29)
    goto LABEL_103;
  if (v27.u32[0] < 2uLL)
  {
    while (1)
    {
      v30 = v29[1];
      if (v30 == 1)
      {
        if (*((_DWORD *)v29 + 4) == 1)
          goto LABEL_98;
      }
      else if ((v30 & (*(_QWORD *)&v15 - 1)) != v28)
      {
        goto LABEL_102;
      }
      v29 = (uint64_t *)*v29;
      if (!v29)
        goto LABEL_103;
    }
  }
  while (1)
  {
    v31 = v29[1];
    if (v31 == 1)
      break;
    if (v31 >= *(_QWORD *)&v15)
      v31 %= *(_QWORD *)&v15;
    if (v31 != v28)
      goto LABEL_102;
LABEL_92:
    v29 = (uint64_t *)*v29;
    if (!v29)
      goto LABEL_103;
  }
  if (*((_DWORD *)v29 + 4) != 1)
    goto LABEL_92;
LABEL_98:
  v32 = (uint64_t *)v29[5];
  if (!v32)
  {
LABEL_102:
    LODWORD(v29) = 0;
    goto LABEL_103;
  }
  LODWORD(v29) = 0;
  do
  {
    LODWORD(v29) = (_DWORD)v29 + *((_DWORD *)v32 + 6);
    v32 = (uint64_t *)*v32;
  }
  while (v32);
LABEL_103:
  if (!*(_QWORD *)&v9)
    goto LABEL_128;
  v33 = (uint8x8_t)vcnt_s8(v9);
  v33.i16[0] = vaddlv_u8(v33);
  if (v33.u32[0] > 1uLL)
  {
    v34 = 2;
    if (*(_QWORD *)&v9 <= 2uLL)
      v34 = 2uLL % *(_QWORD *)&v9;
  }
  else
  {
    v34 = (v9.i8[0] - 1) & 2;
  }
  v35 = *(uint64_t ***)(*(_QWORD *)(v8 + 392) + 8 * v34);
  if (!v35)
    goto LABEL_128;
  v36 = *v35;
  if (!v36)
    goto LABEL_128;
  if (v33.u32[0] < 2uLL)
  {
    do
    {
      v38 = v36[1];
      if (v38 == 2)
      {
        if (*((_DWORD *)v36 + 4) == 2)
          goto LABEL_124;
      }
      else if ((v38 & (*(_QWORD *)&v9 - 1)) != v34)
      {
        goto LABEL_128;
      }
      v36 = (uint64_t *)*v36;
    }
    while (v36);
    v40 = 0;
LABEL_133:
    if (!*(_QWORD *)&v15)
      goto LABEL_129;
    goto LABEL_134;
  }
  while (2)
  {
    v37 = v36[1];
    if (v37 != 2)
    {
      if (v37 >= *(_QWORD *)&v9)
        v37 %= *(_QWORD *)&v9;
      if (v37 != v34)
        goto LABEL_128;
      goto LABEL_113;
    }
    if (*((_DWORD *)v36 + 4) != 2)
    {
LABEL_113:
      v36 = (uint64_t *)*v36;
      if (!v36)
        goto LABEL_128;
      continue;
    }
    break;
  }
LABEL_124:
  v39 = (uint64_t *)v36[5];
  if (v39)
  {
    v40 = 0;
    do
    {
      v40 += *((_DWORD *)v39 + 6);
      v39 = (uint64_t *)*v39;
    }
    while (v39);
    goto LABEL_133;
  }
LABEL_128:
  v40 = 0;
  if (!*(_QWORD *)&v15)
  {
LABEL_129:
    v41 = 0;
LABEL_130:
    if (!*(_QWORD *)&v9)
      goto LABEL_184;
    goto LABEL_159;
  }
LABEL_134:
  v42 = (uint8x8_t)vcnt_s8(v15);
  v42.i16[0] = vaddlv_u8(v42);
  if (v42.u32[0] > 1uLL)
  {
    v43 = 2;
    if (*(_QWORD *)&v15 <= 2uLL)
      v43 = 2uLL % *(_QWORD *)&v15;
  }
  else
  {
    v43 = (v15.i8[0] - 1) & 2;
  }
  v44 = *(uint64_t ***)(*(_QWORD *)(v8 + 352) + 8 * v43);
  if (!v44)
    goto LABEL_158;
  v45 = *v44;
  if (!v45)
    goto LABEL_158;
  if (v42.u32[0] < 2uLL)
  {
    while (1)
    {
      v47 = v45[1];
      if (v47 == 2)
      {
        if (*((_DWORD *)v45 + 4) == 2)
          goto LABEL_154;
      }
      else if ((v47 & (*(_QWORD *)&v15 - 1)) != v43)
      {
        goto LABEL_158;
      }
      v45 = (uint64_t *)*v45;
      if (!v45)
        goto LABEL_158;
    }
  }
  while (2)
  {
    v46 = v45[1];
    if (v46 != 2)
    {
      if (v46 >= *(_QWORD *)&v15)
        v46 %= *(_QWORD *)&v15;
      if (v46 != v43)
        goto LABEL_158;
      goto LABEL_143;
    }
    if (*((_DWORD *)v45 + 4) != 2)
    {
LABEL_143:
      v45 = (uint64_t *)*v45;
      if (!v45)
        goto LABEL_158;
      continue;
    }
    break;
  }
LABEL_154:
  v48 = (uint64_t *)v45[5];
  if (v48)
  {
    v41 = 0;
    do
    {
      v41 += *((_DWORD *)v48 + 6);
      v48 = (uint64_t *)*v48;
    }
    while (v48);
    goto LABEL_130;
  }
LABEL_158:
  v41 = 0;
  if (!*(_QWORD *)&v9)
    goto LABEL_184;
LABEL_159:
  v49 = (uint8x8_t)vcnt_s8(v9);
  v49.i16[0] = vaddlv_u8(v49);
  if (v49.u32[0] > 1uLL)
  {
    v50 = 3;
    if (*(_QWORD *)&v9 <= 3uLL)
      v50 = 3uLL % *(_QWORD *)&v9;
  }
  else
  {
    v50 = (v9.i8[0] - 1) & 3;
  }
  v51 = *(uint64_t ***)(*(_QWORD *)(v8 + 392) + 8 * v50);
  if (!v51)
    goto LABEL_183;
  v52 = *v51;
  if (!v52)
    goto LABEL_183;
  if (v49.u32[0] < 2uLL)
  {
    v53 = *(_QWORD *)&v9 - 1;
    while (1)
    {
      v55 = v52[1];
      if (v55 == 3)
      {
        if (*((_DWORD *)v52 + 4) == 3)
          goto LABEL_179;
      }
      else if ((v55 & v53) != v50)
      {
        goto LABEL_183;
      }
      v52 = (uint64_t *)*v52;
      if (!v52)
        goto LABEL_183;
    }
  }
  while (1)
  {
    v54 = v52[1];
    if (v54 == 3)
      break;
    if (v54 >= *(_QWORD *)&v9)
      v54 %= *(_QWORD *)&v9;
    if (v54 != v50)
      goto LABEL_183;
LABEL_168:
    v52 = (uint64_t *)*v52;
    if (!v52)
      goto LABEL_183;
  }
  if (*((_DWORD *)v52 + 4) != 3)
    goto LABEL_168;
LABEL_179:
  v56 = (uint64_t *)v52[5];
  if (!v56)
  {
LABEL_183:
    v9.i32[0] = 0;
    goto LABEL_184;
  }
  v9.i32[0] = 0;
  do
  {
    v9.i32[0] += *((_DWORD *)v56 + 6);
    v56 = (uint64_t *)*v56;
  }
  while (v56);
LABEL_184:
  if (!*(_QWORD *)&v15)
    goto LABEL_209;
  v57 = (uint8x8_t)vcnt_s8(v15);
  v57.i16[0] = vaddlv_u8(v57);
  if (v57.u32[0] > 1uLL)
  {
    v58 = 3;
    if (*(_QWORD *)&v15 <= 3uLL)
      v58 = 3uLL % *(_QWORD *)&v15;
  }
  else
  {
    v58 = (v15.i8[0] - 1) & 3;
  }
  v59 = *(uint64_t **)(*(_QWORD *)(v8 + 352) + 8 * v58);
  if (v59)
  {
    v59 = (uint64_t *)*v59;
    if (v59)
    {
      if (v57.u32[0] < 2uLL)
      {
        v60 = *(_QWORD *)&v15 - 1;
        while (1)
        {
          v62 = v59[1];
          if (v62 == 3)
          {
            if (*((_DWORD *)v59 + 4) == 3)
              goto LABEL_205;
          }
          else if ((v62 & v60) != v58)
          {
            goto LABEL_209;
          }
          v59 = (uint64_t *)*v59;
          if (!v59)
            goto LABEL_210;
        }
      }
      do
      {
        v61 = v59[1];
        if (v61 == 3)
        {
          if (*((_DWORD *)v59 + 4) == 3)
          {
LABEL_205:
            v63 = (uint64_t *)v59[5];
            if (v63)
            {
              LODWORD(v59) = 0;
              do
              {
                LODWORD(v59) = (_DWORD)v59 + *((_DWORD *)v63 + 6);
                v63 = (uint64_t *)*v63;
              }
              while (v63);
              break;
            }
LABEL_209:
            LODWORD(v59) = 0;
            break;
          }
        }
        else
        {
          if (v61 >= *(_QWORD *)&v15)
            v61 %= *(_QWORD *)&v15;
          if (v61 != v58)
            goto LABEL_209;
        }
        v59 = (uint64_t *)*v59;
      }
      while (v59);
    }
  }
LABEL_210:
  v64 = (_DWORD)v59 + v9.i32[0];
  v65 = (_DWORD)v16 + (_DWORD)v10 + (_DWORD)v23 + (_DWORD)v29 + v40 + v41 + v64;
  if (v65)
    v2 = (float)v64 / (float)v65;
LABEL_212:

  return v2;
}

- (id)startFlyoverTourAnimation:animateToStart:labelChanged:stateChange:
{

  objc_destroyWeak(a1 + 2);
  return a1;
}

- (void)startFlyoverTourAnimation:animateToStart:labelChanged:stateChange:
{
  id v3;
  uint64_t v4;
  void **v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  unint64_t *v12;
  unint64_t v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;

  v3 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 272);
  v5 = *(void ***)(v4 + 8);
  v6 = *(std::__shared_weak_count **)(v4 + 16);
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v9 = *v5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___ZZ91__VKMapCameraController_startFlyoverTourAnimation_animateToStart_labelChanged_stateChange__ENK3__1clEPK12GEOPDFlyover_block_invoke;
  block[3] = &unk_1E42ED380;
  v10 = v9;
  objc_copyWeak(&v18, (id *)(a1 + 16));
  v11 = v3;
  v15 = v11;
  v16 = *(id *)(a1 + 24);
  v19 = *(_BYTE *)(a1 + 32);
  v17 = *(id *)(a1 + 40);
  dispatch_async(v10, block);

  if (v6)
  {
    v12 = (unint64_t *)&v6->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

  objc_destroyWeak(&v18);
}

- (uint64_t)startFlyoverTourAnimation:animateToStart:labelChanged:stateChange:
{
  uint64_t result;

  *(_QWORD *)a2 = &off_1E42ED340;
  *(_QWORD *)(a2 + 8) = *(id *)(a1 + 8);
  objc_copyWeak((id *)(a2 + 16), (id *)(a1 + 16));
  *(_QWORD *)(a2 + 24) = MEMORY[0x1A1AF5730](*(_QWORD *)(a1 + 24));
  *(_BYTE *)(a2 + 32) = *(_BYTE *)(a1 + 32);
  result = MEMORY[0x1A1AF5730](*(_QWORD *)(a1 + 40));
  *(_QWORD *)(a2 + 40) = result;
  return result;
}

long double __73__VKMapCameraController_createMoveToZoomOutZoomInFrameFunction_toLatLon___block_invoke@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>, float a3@<S0>)
{
  float v5;
  long double v6;
  long double v7;
  long double v8;
  double v9;
  double v10;
  long double v11;
  __double2 v12;
  long double v13;
  double v14;
  double v15;
  long double v16;
  long double v17;
  double v18;
  long double v19;
  long double v20;
  long double v21;
  long double v22;
  long double v23;
  long double result;
  double v25;
  double v26;
  double v27;
  double v28;

  v25 = (float)((float)((float)(1.0 - a3) * (float)(1.0 - a3)) * (float)(1.0 - a3));
  v5 = (float)(1.0 - a3) * 3.0;
  v26 = (float)((float)((float)(1.0 - a3) * a3) * v5);
  v27 = (float)((float)(a3 * a3) * a3);
  v28 = (float)(v5 * (float)(a3 * a3));
  v6 = *(double *)(a1 + 32) * v25
     + *(double *)(a1 + 56) * v26
     + *(double *)(a1 + 80) * v28
     + *(double *)(a1 + 104) * v27;
  v7 = *(double *)(a1 + 40) * v25
     + *(double *)(a1 + 64) * v26
     + *(double *)(a1 + 88) * v28
     + *(double *)(a1 + 112) * v27;
  v8 = *(double *)(a1 + 48) * v25
     + *(double *)(a1 + 72) * v26
     + *(double *)(a1 + 96) * v28
     + *(double *)(a1 + 120) * v27;
  v9 = sqrt(v6 * v6 + v7 * v7);
  v10 = atan2(v8, v9 * 0.996647189);
  v11 = atan2(v7, v6);
  v12 = __sincos_stret(v10);
  v13 = atan2(v8 + v12.__sinval * v12.__sinval * 42841.3115 * v12.__sinval, v9 + v12.__cosval * v12.__cosval * -42697.6727 * v12.__cosval);
  *(_QWORD *)(a2 + 48) = 0;
  *(long double *)a2 = v13;
  *(long double *)(a2 + 8) = v11;
  v14 = *(double *)(a1 + 168);
  v15 = *(double *)(a1 + 224);
  *(double *)(a2 + 32) = *(double *)(a1 + 160) * v25
                       + *(double *)(a1 + 216) * v26
                       + *(double *)(a1 + 272) * v28
                       + *(double *)(a1 + 328) * v27;
  *(float64x2_t *)(a2 + 16) = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)(a1 + 144), v25), *(float64x2_t *)(a1 + 200), v26), *(float64x2_t *)(a1 + 256), v28), *(float64x2_t *)(a1 + 312), v27);
  v16 = fmod(3.14159265 - v14 + v15, 6.28318531);
  v17 = fmod(v16 + 6.28318531, 6.28318531) + -3.14159265;
  v18 = *(double *)(a1 + 280);
  v19 = fmod(3.14159265 - v15 + v18, 6.28318531);
  v20 = fmod(v19 + 6.28318531, 6.28318531) + -3.14159265;
  v21 = fmod(3.14159265 - v18 + *(double *)(a1 + 336), 6.28318531);
  v22 = fmod(v21 + 6.28318531, 6.28318531);
  v23 = fmod(v14 + 3.14159265 + v17 * v26 + (v20 + v17) * v28 + (v22 + -3.14159265 + v20 + v17) * v27, 6.28318531);
  result = fmod(v23 + 6.28318531, 6.28318531) + -3.14159265;
  *(long double *)(a2 + 40) = result;
  return result;
}

void __96__VKMapCameraController_animateRegionWithDuration_timingFunction_stepHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = (void *)WeakRetained[20];
    WeakRetained[20] = 0;

    if (objc_msgSend(WeakRetained, "mapEngine"))
    {
      objc_msgSend(WeakRetained, "endRegionChange");
      v5 = *(_QWORD *)(a1 + 32);
      if (v5)
        (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
    }
  }

}

void __82__VKMapCameraController_setCenterCoordinateDistanceRange_duration_timingFunction___block_invoke(uint64_t a1, float a2)
{
  double v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  objc_super v11;
  _QWORD v12[3];

  v3 = *(double *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v5 = *(double *)(a1 + 72);
  v6 = a2;
  v7 = v5 + (*(double *)(a1 + 80) - v5) * v6;
  v8 = v5 + (v3 - v5) * v6;
  if (v3 < 0.0)
    v8 = *(double *)(a1 + 56);
  *(double *)v12 = v7;
  *(double *)&v12[1] = v8;
  v12[2] = v4;
  v9 = *(_QWORD *)(a1 + 40);
  v11.receiver = *(id *)(a1 + 32);
  v11.super_class = (Class)VKMapCameraController;
  objc_msgSendSuper2(&v11, sel_setCenterCoordinateDistanceRange_duration_timingFunction_, v12, v9, 0.0);
  objc_msgSend(*(id *)(a1 + 32), "clampZoomLevelIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "snapMapIfNecessary:", 0);
  objc_msgSend(*(id *)(a1 + 32), "cameraDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mapLayerDidChangeVisibleRegion");

}

id __82__VKMapCameraController_setCenterCoordinateDistanceRange_duration_timingFunction___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;
  __int128 v4;
  uint64_t v5;

  v4 = *(_OWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 64);
  v1 = *(_QWORD *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)VKMapCameraController;
  return objc_msgSendSuper2(&v3, sel_setCenterCoordinateDistanceRange_duration_timingFunction_, &v4, v1, 0.0);
}

void __103__VKMapCameraController__animateToPosition_pitch_yaw_duration_timingCurve_forceDestination_completion___block_invoke_23(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = (void *)*((_QWORD *)WeakRetained + 20);
    *((_QWORD *)WeakRetained + 20) = 0;

    if (objc_msgSend(WeakRetained, "mapEngine"))
    {
      if ((a2 & 1) == 0 && *(_BYTE *)(a1 + 88))
        objc_msgSend(WeakRetained, "_jumpToCenterPoint:pitchRadians:yawRadians:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
      objc_msgSend(WeakRetained, "endRegionChange");
      objc_msgSend(*((id *)WeakRetained + 23), "resumeAnimation");
      v5 = *(_QWORD *)(a1 + 32);
      if (v5)
        (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
    }
  }

}

void __41__VKMapCameraController_setYaw_animated___block_invoke(uint64_t a1, double a2)
{
  void *v4;
  __double2 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  int8x16_t v15;
  float64x2_t v16;
  __int128 v17;
  float64x2_t v18;
  int8x16_t v19;
  float64x2_t v20;
  void *v21;
  void *v22;
  _OWORD v23[2];
  double v24[3];
  __int128 v25;
  __int128 v26;

  objc_msgSend(*(id *)(a1 + 32), "vkCamera");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "centerScreenPoint");
  if (v4)
  {
    objc_msgSend(v4, "groundPointFromScreenPoint:");
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
  }

  if ((_BYTE)v25)
  {
    v5 = __sincos_stret(a2 * 0.5);
    v6 = *(double *)(a1 + 40);
    v7 = *(double *)(a1 + 48);
    v8 = *(double *)(a1 + 56);
    v9 = v5.__sinval * -2.0 * (v7 - *(double *)&v26);
    v10 = v5.__sinval * (v6 - *((double *)&v25 + 1) + v6 - *((double *)&v25 + 1));
    v24[0] = v6 - v10 * v5.__sinval + v9 * v5.__cosval;
    v24[1] = v7 + v10 * v5.__cosval + v9 * v5.__sinval;
    v24[2] = v8;
    objc_msgSend(*(id *)(a1 + 32), "vkCamera");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPosition:", v24);

    v12 = *(float64x2_t *)(a1 + 64);
    v13 = *(float64x2_t *)(a1 + 80);
    v14 = vmulq_n_f64(v12, v5.__cosval);
    v15 = (int8x16_t)vmulq_n_f64(v12, v5.__sinval);
    v16 = (float64x2_t)vextq_s8(v15, v15, 8uLL);
    *(_QWORD *)&v17 = *(_OWORD *)&vsubq_f64(v14, v16);
    *((_QWORD *)&v17 + 1) = *(_QWORD *)&vaddq_f64(v14, v16).f64[1];
    v18 = vmulq_n_f64(v13, v5.__cosval);
    v19 = (int8x16_t)vmulq_n_f64(v13, v5.__sinval);
    v20 = (float64x2_t)vextq_s8(v19, v19, 8uLL);
    *(_QWORD *)&v14.f64[0] = *(_OWORD *)&vaddq_f64(v18, v20);
    v14.f64[1] = vsubq_f64(v18, v20).f64[1];
    v23[0] = v17;
    v23[1] = v14;
    objc_msgSend(*(id *)(a1 + 32), "vkCamera");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setOrientation:", v23);

    objc_msgSend(*(id *)(a1 + 32), "cameraDelegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "mapLayerDidChangeVisibleRegion");

  }
}

uint64_t __41__VKMapCameraController_setYaw_animated___block_invoke_22(uint64_t a1, float a2)
{
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 40) * a2);
}

void __41__VKMapCameraController_setYaw_animated___block_invoke_2(uint64_t a1, int a2)
{
  void *v4;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = (void *)WeakRetained[20];
    WeakRetained[20] = 0;

    if (objc_msgSend(WeakRetained, "mapEngine"))
    {
      if (a2)
        (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 48));
      objc_msgSend(WeakRetained, "endRegionChange");
    }
  }

}

void __59__VKMapCameraController_clampZoomLevelIfNecessaryAnimated___block_invoke(uint64_t a1, float a2)
{
  void *v3;
  void *v4;
  __int128 v5;

  objc_msgSend(*(id *)(a1 + 32), "vkCamera", vmlaq_n_f64(*(float64x2_t *)(a1 + 40), vsubq_f64(*(float64x2_t *)(a1 + 64), *(float64x2_t *)(a1 + 40)), a2), *(double *)(a1 + 56) + (*(double *)(a1 + 80) - *(double *)(a1 + 56)) * a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPosition:", &v5);

  objc_msgSend(*(id *)(a1 + 32), "cameraDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapLayerDidChangeVisibleRegion");

}

uint64_t __59__VKMapCameraController_clampZoomLevelIfNecessaryAnimated___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD **)(a1 + 40);
  if (v3 == (void *)v2[17])
  {
    v2[17] = 0;

    v2 = *(_QWORD **)(a1 + 40);
  }
  objc_msgSend(v2, "clampZoomLevelIfNecessaryAnimated:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "endRegionChange");
}

void __97__VKMapCameraController_panWithOffset_relativeToScreenPoint_animated_duration_completionHandler___block_invoke(uint64_t a1, float a2)
{
  void *v3;
  void *v4;
  __int128 v5;

  objc_msgSend(*(id *)(a1 + 32), "vkCamera", vmlaq_n_f64(*(float64x2_t *)(a1 + 40), vsubq_f64(*(float64x2_t *)(a1 + 64), *(float64x2_t *)(a1 + 40)), a2), *(double *)(a1 + 56) + (*(double *)(a1 + 80) - *(double *)(a1 + 56)) * a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPosition:", &v5);

  objc_msgSend(*(id *)(a1 + 32), "cameraDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapLayerDidChangeVisibleRegion");

}

uint64_t __97__VKMapCameraController_panWithOffset_relativeToScreenPoint_animated_duration_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "mapEngine");
  if (result)
  {
    objc_msgSend(*(id *)(a1 + 32), "endRegionChange");
    result = *(_QWORD *)(a1 + 40);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __58__VKMapCameraController_zoom_withPoint_completionHandler___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "zoomToLevel:withPoint:", *(double *)(a1 + 40) + (*(double *)(a1 + 48) - *(double *)(a1 + 40)) * a2, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

}

void __58__VKMapCameraController_zoom_withPoint_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "endRegionChange");
    objc_msgSend(WeakRetained, "snapMapIfNecessary:", 1);
    v2 = *(_QWORD *)(a1 + 32);
    if (v2)
      (*(void (**)(void))(v2 + 16))();
  }

}

void __56__VKMapCameraController_rotateToYaw_withPoint_animated___block_invoke(uint64_t a1, double a2)
{
  __double2 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  int8x16_t v12;
  float64x2_t v13;
  float64x2_t v14;
  int8x16_t v15;
  float64x2_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  double v21[3];

  if (*(_BYTE *)(a1 + 40))
  {
    v3 = __sincos_stret(a2 * 0.5);
    v4 = *(double *)(a1 + 72);
    v5 = *(double *)(a1 + 80);
    v6 = *(double *)(a1 + 88);
    v7 = v3.__sinval * -2.0 * (v5 - *(double *)(a1 + 56));
    v8 = v3.__sinval * (v4 - *(double *)(a1 + 48) + v4 - *(double *)(a1 + 48));
    v21[0] = v4 - v8 * v3.__sinval + v7 * v3.__cosval;
    v21[1] = v5 + v8 * v3.__cosval + v7 * v3.__sinval;
    v21[2] = v6;
    v9 = *(float64x2_t *)(a1 + 96);
    v10 = *(float64x2_t *)(a1 + 112);
    v11 = vmulq_n_f64(v9, v3.__cosval);
    v12 = (int8x16_t)vmulq_n_f64(v9, v3.__sinval);
    v13 = (float64x2_t)vextq_s8(v12, v12, 8uLL);
    v14 = vmulq_n_f64(v10, v3.__cosval);
    v15 = (int8x16_t)vmulq_n_f64(v10, v3.__sinval);
    v16 = (float64x2_t)vextq_s8(v15, v15, 8uLL);
    objc_msgSend(*(id *)(a1 + 32), "vkCamera", (unint64_t)*(_OWORD *)&vsubq_f64(v11, v13), *(_QWORD *)&vaddq_f64(v11, v13).f64[1], (unint64_t)*(_OWORD *)&vaddq_f64(v14, v16), *(_QWORD *)&vsubq_f64(v14, v16).f64[1]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPosition:", v21);

    objc_msgSend(*(id *)(a1 + 32), "vkCamera");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setOrientation:", &v20);

    objc_msgSend(*(id *)(a1 + 32), "cameraDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "mapLayerDidChangeVisibleRegion");

  }
}

uint64_t __56__VKMapCameraController_rotateToYaw_withPoint_animated___block_invoke_15(uint64_t a1, float a2)
{
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 40) * a2);
}

void __56__VKMapCameraController_rotateToYaw_withPoint_animated___block_invoke_2(uint64_t a1, int a2)
{
  _QWORD *WeakRetained;
  void *v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    if (objc_msgSend(WeakRetained, "mapEngine"))
    {
      if (a2)
        (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 48));
      objc_msgSend(v6, "endRegionChange");
    }
    v5 = (void *)v6[19];
    v6[19] = 0;

    WeakRetained = v6;
  }

}

void __95__VKMapCameraController_rotateToPitch_withPoint_preserveAltitude_animated_exaggerate_maxPitch___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "rotateToPitch:withPoint:preserveAltitude:animated:exaggerate:maxPitch:", 0, *(unsigned __int8 *)(a1 + 64), 0, 0, *(double *)(a1 + 40) + (*(double *)(a1 + 48) - *(double *)(a1 + 40)) * a2, *(double *)(a1 + 56));

}

void __95__VKMapCameraController_rotateToPitch_withPoint_preserveAltitude_animated_exaggerate_maxPitch___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id *v10;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v10 = WeakRetained;
    if (objc_msgSend(WeakRetained, "mapEngine"))
    {
      objc_msgSend(*(id *)(a1 + 32), "vkCamera");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pitch");
      v5 = v4;
      v6 = *(double *)(a1 + 48);

      if (v5 > v6)
      {
        objc_msgSend(v10, "vkCamera");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "maxPitch");
        objc_msgSend(v10, "rotateToPitch:withPoint:preserveAltitude:animated:exaggerate:maxPitch:", 0, *(unsigned __int8 *)(a1 + 56), 0, 0);

      }
      objc_msgSend(v10, "updateCameraZBounds");
      objc_msgSend(v10, "endRegionChange");
      objc_msgSend(v10[23], "resumeAnimation");
    }
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 144);
    *(_QWORD *)(v8 + 144) = 0;

    WeakRetained = v10;
  }

}

@end
