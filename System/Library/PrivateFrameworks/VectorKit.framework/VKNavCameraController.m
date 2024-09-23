@implementation VKNavCameraController

- (shared_ptr<gss::StylesheetManager<gss::ScenePropertyID>>)_getActiveSceneManager
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __shared_weak_count *v7;
  int8x8_t *v8;
  int8x8_t v9;
  uint8x8_t v10;
  uint64_t v11;
  uint64_t ***v12;
  uint64_t **v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  shared_ptr<gss::StylesheetManager<gss::ScenePropertyID>> result;

  v3 = v2;
  -[VKNavCameraController screenCanvas](self, "screenCanvas");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "mapEngine");

  if (!v5)
    goto LABEL_31;
  v8 = *(int8x8_t **)(v5 + 1120);
  if (!v8)
    goto LABEL_31;
  v9 = v8[2];
  if (!*(_QWORD *)&v9)
    goto LABEL_31;
  v10 = (uint8x8_t)vcnt_s8(v9);
  v10.i16[0] = vaddlv_u8(v10);
  if (v10.u32[0] > 1uLL)
  {
    v11 = 0x2FED70A4459DFCA1;
    if (*(_QWORD *)&v9 <= 0x2FED70A4459DFCA1uLL)
      v11 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v9;
  }
  else
  {
    v11 = (*(_QWORD *)&v9 - 1) & 0x2FED70A4459DFCA1;
  }
  v12 = *(uint64_t ****)(*(_QWORD *)&v8[1] + 8 * v11);
  if (!v12)
    goto LABEL_31;
  v13 = *v12;
  if (!v13)
    goto LABEL_31;
  if (v10.u32[0] < 2uLL)
  {
    v14 = *(_QWORD *)&v9 - 1;
    while (1)
    {
      v16 = v13[1];
      if (v16 == (uint64_t *)0x2FED70A4459DFCA1)
      {
        if (v13[2] == (uint64_t *)0x2FED70A4459DFCA1)
          goto LABEL_24;
      }
      else if (((unint64_t)v16 & v14) != v11)
      {
        goto LABEL_31;
      }
      v13 = (uint64_t **)*v13;
      if (!v13)
        goto LABEL_31;
    }
  }
  while (1)
  {
    v15 = (unint64_t)v13[1];
    if (v15 == 0x2FED70A4459DFCA1)
      break;
    if (v15 >= *(_QWORD *)&v9)
      v15 %= *(_QWORD *)&v9;
    if (v15 != v11)
      goto LABEL_31;
LABEL_13:
    v13 = (uint64_t **)*v13;
    if (!v13)
      goto LABEL_31;
  }
  if (v13[2] != (uint64_t *)0x2FED70A4459DFCA1)
    goto LABEL_13;
LABEL_24:
  v17 = v13[5];
  if (!v17)
  {
LABEL_31:
    *v3 = 0;
    v3[1] = 0;
    goto LABEL_32;
  }
  v18 = v17[34];
  if (!v18)
  {
    md::StyleLogic::updateConfiguration((md::StyleLogic *)v13[5], *((_DWORD *)v17 + 274));
    v18 = v17[34];
  }
  v19 = v17[35];
  *v3 = v18;
  v3[1] = v19;
  if (v19)
  {
    v20 = (unint64_t *)(v19 + 8);
    do
      v21 = __ldxr(v20);
    while (__stxr(v21 + 1, v20));
  }
LABEL_32:
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (void)stylesheetDidReload
{
  self->_routeFocusCoordinate.longitude._value = 0.0;
  -[VKNavCameraController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateSceneQuery
{
  double *v3;
  double farClipPlaneFactor;
  unint64_t *v5;
  unint64_t v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  gss::Allocator *v11;
  uint64_t v12;
  __int128 v13;
  double v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  double v20;
  double v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  float *v28;
  float v29;
  _BOOL4 v30;
  unsigned int v32;
  float v33;
  _BOOL4 v34;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  _DWORD *v39;
  float v40;
  _BOOL4 v41;
  unsigned int v43;
  float v44;
  _BOOL4 v45;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  _DWORD *v50;
  gss::Allocator *v51;
  uint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t *p_shared_owners;
  unint64_t v55;
  double v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  unsigned __int8 v60;
  __int128 v61;
  _BYTE v62[15];
  char v63;
  uint64_t v64;
  std::__shared_weak_count *v65;
  char v66;

  -[VKNavCameraController _getActiveSceneManager](self, "_getActiveSceneManager");
  v3 = &self->_lastProjectedPosition._e[2];
  farClipPlaneFactor = self->_farClipPlaneFactor;
  self->_lastProjectedPosition._e[2] = 0.0;
  self->_farClipPlaneFactor = 0.0;
  if (farClipPlaneFactor == 0.0)
    goto LABEL_5;
  v5 = (unint64_t *)(*(_QWORD *)&farClipPlaneFactor + 8);
  do
    v6 = __ldaxr(v5);
  while (__stlxr(v6 - 1, v5));
  if (v6)
  {
LABEL_5:
    if (!v64)
      goto LABEL_103;
  }
  else
  {
    (*(void (**)(double))(**(_QWORD **)&farClipPlaneFactor + 16))(COERCE_DOUBLE(*(_QWORD *)&farClipPlaneFactor));
    std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&farClipPlaneFactor);
    if (!v64)
      goto LABEL_103;
  }
  memset(v62, 0, sizeof(v62));
  v63 = 1;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "navCameraForceComplexIntersection");

  if (v8)
    *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[](v62, 0x10055u) = 1;
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "shouldForceWindshieldMode");

  if (v10)
  {
    *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[](v62, 0x10064u) = 1;
    v11 = (gss::Allocator *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[](v62, 0x1006Bu);
    *(_WORD *)v11 = 1;
  }
  v12 = v64;
  v56 = 0.0;
  v57 = 0.0;
  v58 = 0;
  v59 = gss::Allocator::instance(v11);
  gss::StylesheetManager<gss::ScenePropertyID>::styleQueryForFeatureAttributes((unint64_t *)&v61, v12, (gss::FeatureAttributeSet *)&v56, (gss::QueryOverrides *)v62);
  v13 = v61;
  v61 = 0uLL;
  v14 = self->_farClipPlaneFactor;
  *(_OWORD *)v3 = v13;
  if (v14 != 0.0)
  {
    v15 = (unint64_t *)(*(_QWORD *)&v14 + 8);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      (*(void (**)(double))(**(_QWORD **)&v14 + 16))(COERCE_DOUBLE(*(_QWORD *)&v14));
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v14);
    }
  }
  v17 = (std::__shared_weak_count *)*((_QWORD *)&v61 + 1);
  if (*((_QWORD *)&v61 + 1))
  {
    v18 = (unint64_t *)(*((_QWORD *)&v61 + 1) + 8);
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  if (v56 != 0.0)
  {
    v57 = v56;
    (*(void (**)(uint64_t, double, uint64_t))(*(_QWORD *)v59 + 40))(v59, COERCE_DOUBLE(*(_QWORD *)&v56), v58 - *(_QWORD *)&v56);
  }
  v20 = *v3;
  v21 = self->_farClipPlaneFactor;
  *(double *)&v61 = *v3;
  *((double *)&v61 + 1) = v21;
  if (v21 == 0.0)
  {
    v57 = 0.0;
  }
  else
  {
    v22 = (unint64_t *)(*(_QWORD *)&v21 + 8);
    do
      v23 = __ldxr(v22);
    while (__stxr(v23 + 1, v22));
    v57 = v21;
    do
      v24 = __ldxr(v22);
    while (__stxr(v24 + 1, v22));
  }
  v58 = 0;
  v59 = 0;
  v56 = v20;
  v60 = 0;
  if (v20 != 0.0)
    LODWORD(v20) = (*(uint64_t (**)(double, uint64_t *))(**(_QWORD **)&v20 + 48))(COERCE_DOUBLE(*(_QWORD *)&v20), &v58);
  v60 = LOBYTE(v20);
  if (v21 != 0.0)
  {
    v25 = (unint64_t *)(*(_QWORD *)&v21 + 8);
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      (*(void (**)(double))(**(_QWORD **)&v21 + 16))(COERCE_DOUBLE(*(_QWORD *)&v21));
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&v21);
    }
    LODWORD(v20) = v60;
  }
  if (LODWORD(v20))
  {
    v27 = *(_QWORD *)(*(_QWORD *)&v56 + 24);
    v28 = *(float **)v27;
    if (*(_QWORD *)v27)
    {
      v29 = *v28;
      v30 = *v28 == 1.0;
      if (*(_BYTE *)(v27 + 10))
      {
        if (v29 != 0.0 && v29 != 1.0)
        {
LABEL_50:
          if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(*(_QWORD *)(*(_QWORD *)&v56 + 24), 0x2Eu, 0) & 1) != 0)goto LABEL_53;
          v32 = 1;
LABEL_52:
          if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v27, 0x2Eu, v32))
            goto LABEL_70;
LABEL_53:
          if (v28)
          {
            v33 = *v28;
            v34 = *v28 == 1.0;
            if (*(_BYTE *)(v27 + 10))
            {
              if (v33 != 0.0 && v33 != 1.0)
                goto LABEL_63;
            }
          }
          else
          {
            v34 = 0;
          }
          v36 = *(unsigned __int8 *)(v27 + v34 + 11);
          v33 = 0.0;
          if (v36 != 2)
          {
            if (*(_BYTE *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v27, 0x2Eu, v36, 0))
              goto LABEL_99;
            goto LABEL_69;
          }
LABEL_63:
          LOBYTE(v61) = 1;
          v66 = 1;
          v37 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v27, 0x2Eu, 0, &v61);
          v38 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v27, 0x2Eu, 1u, &v66);
          if (v33 >= 1.0)
            v39 = (_DWORD *)v38;
          else
            v39 = (_DWORD *)v37;
          if (*v39)
            goto LABEL_99;
LABEL_69:
          v27 = *(_QWORD *)(*(_QWORD *)&v56 + 24);
          v28 = *(float **)v27;
LABEL_70:
          if (v28)
          {
            v40 = *v28;
            v41 = *v28 == 1.0;
            if (*(_BYTE *)(v27 + 10))
            {
              if (v40 != 0.0 && v40 != 1.0)
              {
LABEL_80:
                if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v27, 0x55u, 0) & 1) != 0)
                  goto LABEL_83;
                v43 = 1;
LABEL_82:
                if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v27, 0x55u, v43))
                  goto LABEL_100;
LABEL_83:
                if (v28)
                {
                  v44 = *v28;
                  v45 = *v28 == 1.0;
                  if (*(_BYTE *)(v27 + 10))
                  {
                    if (v44 != 0.0 && v44 != 1.0)
                      goto LABEL_93;
                  }
                }
                else
                {
                  v45 = 0;
                }
                v47 = *(unsigned __int8 *)(v27 + v45 + 11);
                v44 = 0.0;
                if (v47 != 2)
                {
                  if (!*(_BYTE *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v27, 0x55u, v47, 0))goto LABEL_100;
                  goto LABEL_99;
                }
LABEL_93:
                LOBYTE(v61) = 1;
                v66 = 1;
                v48 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v27, 0x55u, 0, &v61);
                v49 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v27, 0x55u, 1u, &v66);
                if (v44 >= 1.0)
                  v50 = (_DWORD *)v49;
                else
                  v50 = (_DWORD *)v48;
                if (!*v50)
                  goto LABEL_100;
LABEL_99:
                -[VKNavCameraController stopIgnoreStyleChange](self, "stopIgnoreStyleChange");
                goto LABEL_100;
              }
            }
          }
          else
          {
            v41 = 0;
          }
          v43 = *(unsigned __int8 *)(v27 + v41 + 11);
          if (v43 != 2)
            goto LABEL_82;
          goto LABEL_80;
        }
      }
    }
    else
    {
      v30 = 0;
    }
    v32 = *(unsigned __int8 *)(v27 + v30 + 11);
    if (v32 != 2)
      goto LABEL_52;
    goto LABEL_50;
  }
LABEL_100:
  v51 = (gss::Allocator *)gss::QueryableLocker<gss::ScenePropertyID>::~QueryableLocker((uint64_t)&v56);
  if (!v62[14] && *(_QWORD *)v62)
  {
    v52 = gss::Allocator::instance(v51);
    (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v52 + 40))(v52, *(_QWORD *)v62, *(unsigned __int16 *)&v62[12]);
  }
LABEL_103:
  v53 = v65;
  if (v65)
  {
    p_shared_owners = (unint64_t *)&v65->__shared_owners_;
    do
      v55 = __ldaxr(p_shared_owners);
    while (__stlxr(v55 - 1, p_shared_owners));
    if (!v55)
    {
      ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
      std::__shared_weak_count::__release_weak(v53);
    }
  }
}

- (void)_updateSceneStyles:(BOOL)a3 updatePitchLimitOnly:(BOOL)a4
{
  double v7;
  double farClipPlaneFactor;
  unint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  unint64_t *v13;
  unint64_t v14;
  const Camera *v15;
  float v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  unsigned int v21;
  float *v22;
  float v23;
  _BOOL4 v24;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *data;
  std::__shared_weak_count *v27;
  unsigned int v28;
  float v29;
  _BOOL4 v30;
  unsigned int v32;
  float v33;
  float v34;
  float v35;
  _BOOL4 v36;
  unsigned int v38;
  float v39;
  _BOOL4 v40;
  unsigned int v42;
  float v43;
  float v44;
  uint64_t v45;
  std::__shared_weak_count *v46;
  uint64_t v47;
  unint64_t *p_shared_owners;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  std::__shared_weak_count *v52;
  double v53;
  unint64_t *v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  std::__shared_weak_count *v59;
  unint64_t *v60;
  unint64_t v61;
  const std::string::value_type *v62;
  const std::string::value_type *v63;
  unint64_t *v64;
  unint64_t v65;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_currentStyleName;
  uint64_t v67;
  float *v68;
  float v69;
  _BOOL4 v70;
  unsigned int v72;
  float v73;
  _BOOL4 v74;
  unsigned int v76;
  float v77;
  float v78;
  float v79;
  _BOOL4 v80;
  unsigned int v82;
  float v83;
  _BOOL4 v84;
  unsigned int v86;
  int v87;
  int v88;
  double v89;
  unsigned __int8 *v90;
  float *v91;
  float v92;
  _BOOL4 v93;
  unsigned int v95;
  float v96;
  _BOOL4 v97;
  unsigned int v99;
  float v100;
  float v101;
  float v102;
  _BOOL4 v103;
  unsigned int v105;
  float v106;
  _BOOL4 v107;
  unsigned int v108;
  float v109;
  float v110;
  float v111;
  _BOOL4 v112;
  unsigned int v113;
  float v114;
  _BOOL4 v115;
  unsigned int v116;
  float v117;
  float v118;
  double v119;
  float v120;
  _BOOL4 v121;
  unsigned int v122;
  float v123;
  _BOOL4 v124;
  unsigned int v125;
  float v126;
  float v127;
  double v128;
  float v129;
  _BOOL4 v130;
  unsigned int v131;
  float v132;
  _BOOL4 v133;
  unsigned int v134;
  float v135;
  float v136;
  double v137;
  float v138;
  _BOOL4 v139;
  unsigned int v140;
  __int128 v141;
  _BOOL4 v142;
  int v143;
  float32x2_t v144;
  Matrix<float, 2, 1> v145;
  unint64_t v146;
  float *v147;
  float v148;
  _BOOL4 v149;
  unsigned int v150;
  float v151;
  _BOOL4 v152;
  unsigned int v153;
  float *v154;
  float v155;
  float v156;
  _BOOL4 v157;
  unsigned int v158;
  float v159;
  _BOOL4 v160;
  unsigned int v161;
  uint64_t v162;
  uint64_t v163;
  int *v164;
  int v165;
  float v166;
  _BOOL4 v167;
  unsigned int v168;
  float v169;
  _BOOL4 v170;
  unsigned int v171;
  float *v172;
  float v173;
  float v174;
  _BOOL4 v175;
  unsigned int v176;
  float v177;
  _BOOL4 v178;
  unsigned int v179;
  float *v180;
  float v181;
  float v182;
  _BOOL4 v183;
  unsigned int v184;
  float v185;
  _BOOL4 v186;
  char v187;
  unsigned int v188;
  unint64_t v189;
  unint64_t v190;
  char *v191;
  unint64_t v192;
  float *v193;
  float v194;
  _BOOL4 v195;
  unsigned int v196;
  float v197;
  _BOOL4 v198;
  char v199;
  unsigned int v200;
  unint64_t v201;
  unint64_t v202;
  char *v203;
  unint64_t v204;
  float *v205;
  float v206;
  _BOOL4 v207;
  unsigned int v208;
  float v209;
  _BOOL4 v210;
  char v211;
  unsigned int v212;
  unint64_t v213;
  unint64_t v214;
  char *v215;
  uint64_t v216;
  float *v217;
  float v218;
  unsigned int v219;
  double v220;
  double v221;
  uint64_t v222;
  float *v223;
  float v224;
  unsigned int v225;
  float *v226;
  float v227;
  double v228;
  uint64_t v229;
  float *v230;
  float v231;
  _BOOL4 v232;
  unsigned int v233;
  float v234;
  _BOOL4 v235;
  unsigned int v236;
  float *v237;
  float v238;
  double v239;
  float v240;
  _BOOL4 v241;
  unsigned int v242;
  __int128 v243;
  _BOOL4 v244;
  unsigned int v245;
  float32x2_t *v246;
  float32x2_t v247;
  float v248;
  _BOOL4 v249;
  unsigned int v250;
  __int128 v251;
  float32x2_t v252;
  _BOOL4 v253;
  unsigned int v254;
  float32x2_t *v255;
  float v256;
  _BOOL4 v257;
  unsigned int v258;
  uint64_t v259;
  uint64_t v260;
  int *v261;
  int v262;
  uint64_t v263;
  float *v264;
  float v265;
  unsigned int v266;
  uint64_t v267;
  uint64_t v268;
  int *v269;
  int v270;
  uint64_t v271;
  float *v272;
  float v273;
  unsigned int v274;
  uint64_t v275;
  uint64_t v276;
  int *v277;
  int v278;
  uint64_t v279;
  float *v280;
  float v281;
  unsigned int v282;
  uint64_t v283;
  uint64_t v284;
  int *v285;
  int v286;
  uint64_t v287;
  float *v288;
  float v289;
  unsigned int v290;
  float *v291;
  float v292;
  uint64_t v293;
  float *v294;
  float v295;
  unsigned int v296;
  float *v297;
  float v298;
  uint64_t v299;
  float *v300;
  float v301;
  unsigned int v302;
  float *v303;
  float v304;
  uint64_t v305;
  float *v306;
  float v307;
  unsigned int v308;
  float *v309;
  float v310;
  unint64_t v311;
  float *v312;
  float v313;
  _BOOL4 v314;
  unsigned int v315;
  float v316;
  _BOOL4 v317;
  unsigned int v318;
  float *v319;
  float v320;
  float v321;
  _BOOL4 v322;
  unsigned int v323;
  float v324;
  _BOOL4 v325;
  unsigned int v326;
  float *v327;
  float v328;
  float v329;
  _BOOL4 v330;
  unsigned int v331;
  float v332;
  _BOOL4 v333;
  unsigned int v334;
  float *v335;
  float v336;
  float v337;
  _BOOL4 v338;
  unsigned int v339;
  float v340;
  _BOOL4 v341;
  unsigned int v342;
  float *v343;
  float v344;
  float v345;
  _BOOL4 v346;
  unsigned int v347;
  float v348;
  _BOOL4 v349;
  unsigned int v350;
  unint64_t v351;
  unint64_t v352;
  char *v353;
  char v354;
  float v355;
  _BOOL4 v356;
  unsigned int v357;
  float v358;
  _BOOL4 v359;
  unsigned int v360;
  unint64_t v361;
  unint64_t v362;
  char *v363;
  char v364;
  float v365;
  _BOOL4 v366;
  unsigned int v367;
  float v368;
  _BOOL4 v369;
  unsigned int v370;
  unint64_t v371;
  unint64_t v372;
  char *v373;
  char v374;
  float v375;
  _BOOL4 v376;
  unsigned int v377;
  float v378;
  _BOOL4 v379;
  unsigned int v380;
  unint64_t v381;
  unint64_t v382;
  char *v383;
  char v384;
  float v385;
  _BOOL4 v386;
  unsigned int v387;
  float v388;
  _BOOL4 v389;
  unsigned int v390;
  float *v391;
  float v392;
  float v393;
  _BOOL4 v394;
  unsigned int v395;
  float v396;
  _BOOL4 v397;
  unsigned int v398;
  uint64_t v399;
  uint64_t v400;
  int *v401;
  int v402;
  float v403;
  _BOOL4 v404;
  unsigned int v405;
  float v406;
  _BOOL4 v407;
  unsigned int v408;
  uint64_t v409;
  uint64_t v410;
  int *v411;
  int v412;
  float v413;
  _BOOL4 v414;
  unsigned int v415;
  float v416;
  _BOOL4 v417;
  unsigned int v418;
  unint64_t v419;
  unint64_t v420;
  char *v421;
  char v422;
  float v423;
  _BOOL4 v424;
  unsigned int v425;
  float v426;
  _BOOL4 v427;
  unsigned int v428;
  unint64_t v429;
  unint64_t v430;
  char *v431;
  char v432;
  float v433;
  _BOOL4 v434;
  unsigned int v435;
  float v436;
  _BOOL4 v437;
  unsigned int v438;
  unint64_t v439;
  unint64_t v440;
  char *v441;
  char v442;
  float v443;
  _BOOL4 v444;
  unsigned int v445;
  int hasValueForKeyAtEnd;
  double v447;
  float v448;
  _BOOL4 v449;
  unsigned int v450;
  float *v451;
  float v452;
  float v453;
  _BOOL4 v454;
  unsigned int v455;
  int v456;
  double v457;
  float v458;
  _BOOL4 v459;
  unsigned int v460;
  float *v461;
  float v462;
  float v463;
  _BOOL4 v464;
  unsigned int v465;
  float v466;
  _BOOL4 v467;
  double v468;
  unsigned int v469;
  float *v470;
  float v471;
  float v472;
  NSObject *v473;
  id v474;
  uint64_t v475;
  unint64_t *v476;
  unint64_t v477;
  __int128 v478;
  double v479;
  double v480;
  _QWORD v481[2];
  unsigned __int8 v482;
  std::__shared_weak_count *v483;
  char v484;
  __int128 buf;
  uint64_t v486;

  v486 = *MEMORY[0x1E0C80C00];
  -[VKNavCameraController _getActiveSceneManager](self, "_getActiveSceneManager");
  v7 = self->_lastProjectedPosition._e[2];
  if (v7 != 0.0)
  {
    farClipPlaneFactor = self->_farClipPlaneFactor;
    *(double *)&buf = self->_lastProjectedPosition._e[2];
    *((double *)&buf + 1) = farClipPlaneFactor;
    if (farClipPlaneFactor == 0.0)
    {
      v480 = 0.0;
    }
    else
    {
      v9 = (unint64_t *)(*(_QWORD *)&farClipPlaneFactor + 8);
      do
        v10 = __ldxr(v9);
      while (__stxr(v10 + 1, v9));
      v480 = farClipPlaneFactor;
      do
        v11 = __ldxr(v9);
      while (__stxr(v11 + 1, v9));
    }
    v481[0] = 0;
    v481[1] = 0;
    v479 = v7;
    v482 = 0;
    v12 = (*(uint64_t (**)(double, _QWORD *))(**(_QWORD **)&v7 + 48))(COERCE_DOUBLE(*(_QWORD *)&v7), v481);
    v482 = v12;
    if (farClipPlaneFactor != 0.0)
    {
      v13 = (unint64_t *)(*(_QWORD *)&farClipPlaneFactor + 8);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        (*(void (**)(double))(**(_QWORD **)&farClipPlaneFactor + 16))(COERCE_DOUBLE(*(_QWORD *)&farClipPlaneFactor));
        std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&farClipPlaneFactor);
      }
      v12 = v482;
    }
    if (v12)
    {
      -[VKCameraController camera](self, "camera");
      v16 = gdc::DisplayZoomLevel::centerZoomLevel((gdc::DisplayZoomLevel *)buf, v15);
      v17 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
      if (*((_QWORD *)&buf + 1))
      {
        v18 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
        do
          v19 = __ldaxr(v18);
        while (__stlxr(v19 - 1, v18));
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
          std::__shared_weak_count::__release_weak(v17);
        }
      }
      v20 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
      if ((int)v16 >= 0x17)
        v21 = 23;
      else
        v21 = (int)v16;
      v22 = *(float **)v20;
      if (*(_QWORD *)v20)
      {
        v23 = *v22;
        v24 = *v22 == 1.0;
        if (*(_BYTE *)(v20 + 10))
        {
          if (v23 != 0.0 && v23 != 1.0)
          {
LABEL_40:
            if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd(*(_QWORD *)(*(_QWORD *)&v479 + 24), 0x28u, v21, 0) & 1) != 0)goto LABEL_43;
            v28 = 1;
LABEL_42:
            if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd(v20, 0x28u, v21, v28))
              goto LABEL_56;
LABEL_43:
            if (v22)
            {
              v29 = *v22;
              v30 = *v22 == 1.0;
              if (*(_BYTE *)(v20 + 10))
              {
                if (v29 != 0.0 && v29 != 1.0)
                  goto LABEL_53;
              }
            }
            else
            {
              v30 = 0;
            }
            v32 = *(unsigned __int8 *)(v20 + v30 + 11);
            v29 = 0.0;
            if (v32 != 2)
            {
              v34 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>(v20, 0x28u, v21, v32, 0);
              goto LABEL_55;
            }
LABEL_53:
            LOBYTE(buf) = 1;
            v484 = 1;
            v33 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>(v20, 0x28u, v21, 0, &buf);
            v34 = v33
                + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>(v20, 0x28u, v21, 1u, &v484)- v33)* v29);
LABEL_55:
            self->_maxCameraHeight = v34 * 0.0174532925;
            v20 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
            v22 = *(float **)v20;
LABEL_56:
            if (v22)
            {
              v35 = *v22;
              v36 = *v22 == 1.0;
              if (*(_BYTE *)(v20 + 10))
              {
                if (v35 != 0.0 && v35 != 1.0)
                {
LABEL_66:
                  if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd(v20, 0x29u, v21, 0) & 1) != 0)
                    goto LABEL_69;
                  v38 = 1;
LABEL_68:
                  if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd(v20, 0x29u, v21, v38))goto LABEL_82;
LABEL_69:
                  if (v22)
                  {
                    v39 = *v22;
                    v40 = *v22 == 1.0;
                    if (*(_BYTE *)(v20 + 10))
                    {
                      if (v39 != 0.0 && v39 != 1.0)
                        goto LABEL_79;
                    }
                  }
                  else
                  {
                    v40 = 0;
                  }
                  v42 = *(unsigned __int8 *)(v20 + v40 + 11);
                  v39 = 0.0;
                  if (v42 != 2)
                  {
                    v44 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>(v20, 0x29u, v21, v42, 0);
                    goto LABEL_81;
                  }
LABEL_79:
                  LOBYTE(buf) = 1;
                  v484 = 1;
                  v43 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>(v20, 0x29u, v21, 0, &buf);
                  v44 = v43
                      + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>(v20, 0x29u, v21, 1u, &v484)- v43)* v39);
LABEL_81:
                  self->_minCameraHeight = v44 * 0.0174532925;
LABEL_82:
                  if (a4)
                    goto LABEL_975;
                  v45 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                  v47 = *(_QWORD *)(v45 + 16);
                  v46 = *(std::__shared_weak_count **)(v45 + 24);
                  if (v46)
                  {
                    p_shared_owners = (unint64_t *)&v46->__shared_owners_;
                    do
                      v49 = __ldxr(p_shared_owners);
                    while (__stxr(v49 + 1, p_shared_owners));
                    do
                      v50 = __ldaxr(p_shared_owners);
                    while (__stlxr(v50 - 1, p_shared_owners));
                    if (!v50)
                    {
                      ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
                      std::__shared_weak_count::__release_weak(v46);
                    }
                  }
                  if (v47)
                  {
                    v51 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                    v53 = *(double *)(v51 + 16);
                    v52 = *(std::__shared_weak_count **)(v51 + 24);
                    if (v52)
                    {
                      v54 = (unint64_t *)&v52->__shared_owners_;
                      do
                        v55 = __ldxr(v54);
                      while (__stxr(v55 + 1, v54));
                      do
                        v56 = __ldaxr(v54);
                      while (__stlxr(v56 - 1, v54));
                      if (!v56)
                      {
                        ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
                        std::__shared_weak_count::__release_weak(v52);
                      }
                    }
                    v57 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                    v58 = *(_QWORD *)(v57 + 16);
                    v59 = *(std::__shared_weak_count **)(v57 + 24);
                    *(_QWORD *)&buf = v58;
                    *((_QWORD *)&buf + 1) = v59;
                    if (v59)
                    {
                      v60 = (unint64_t *)&v59->__shared_owners_;
                      do
                        v61 = __ldxr(v60);
                      while (__stxr(v61 + 1, v60));
                    }
                    v62 = *(const std::string::value_type **)(v58 + 104);
                    if (v62)
                      v63 = v62;
                    else
                      v63 = "";
                    std::string::__assign_external((std::string *)&self->_currentStyleName, v63);
                    if (v59)
                    {
                      v64 = (unint64_t *)&v59->__shared_owners_;
                      do
                        v65 = __ldaxr(v64);
                      while (__stlxr(v65 - 1, v64));
                      if (!v65)
                      {
                        ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
                        std::__shared_weak_count::__release_weak(v59);
                      }
                    }
                  }
                  else
                  {
                    p_currentStyleName = &self->_currentStyleName;
                    if (*((char *)&self->_currentStyleName.__r_.__value_.var0.__l + 23) < 0)
                    {
                      self->_currentStyleName.__r_.__value_.var0.__l.__size_ = 7;
                      p_currentStyleName = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_currentStyleName->__r_.__value_.var0.__l.__data_;
                    }
                    else
                    {
                      *((_BYTE *)&self->_currentStyleName.__r_.__value_.var0.__l + 23) = 7;
                    }
                    v53 = 0.0;
                    strcpy(p_currentStyleName->__r_.__value_.var0.__s.__data_, "Unknown");
                  }
                  v67 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                  v68 = *(float **)v67;
                  if (*(_QWORD *)v67)
                  {
                    v69 = *v68;
                    v70 = *v68 == 1.0;
                    if (*(_BYTE *)(v67 + 10))
                    {
                      if (v69 != 0.0 && v69 != 1.0)
                      {
LABEL_121:
                        if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd(*(_QWORD *)(*(_QWORD *)&v479 + 24), 0x14u, v21, 0) & 1) != 0)goto LABEL_124;
                        v72 = 1;
LABEL_123:
                        if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd(v67, 0x14u, v21, v72))goto LABEL_137;
LABEL_124:
                        if (v68)
                        {
                          v73 = *v68;
                          v74 = *v68 == 1.0;
                          if (*(_BYTE *)(v67 + 10))
                          {
                            if (v73 != 0.0 && v73 != 1.0)
                              goto LABEL_134;
                          }
                        }
                        else
                        {
                          v74 = 0;
                        }
                        v76 = *(unsigned __int8 *)(v67 + v74 + 11);
                        v73 = 0.0;
                        if (v76 != 2)
                        {
                          v78 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>(v67, 0x14u, v21, v76, 0);
                          goto LABEL_136;
                        }
LABEL_134:
                        LOBYTE(buf) = 1;
                        v484 = 1;
                        v77 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>(v67, 0x14u, v21, 0, &buf);
                        v78 = v77
                            + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>(v67, 0x14u, v21, 1u, &v484)- v77)* v73);
LABEL_136:
                        self->_cameraPitch._value = v78 * 0.0174532925;
                        v67 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                        v68 = *(float **)v67;
LABEL_137:
                        if (v68)
                        {
                          v79 = *v68;
                          v80 = *v68 == 1.0;
                          if (*(_BYTE *)(v67 + 10))
                          {
                            if (v79 != 0.0 && v79 != 1.0)
                            {
LABEL_147:
                              if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd(v67, 0x15u, v21, 0) & 1) != 0)
                                goto LABEL_150;
                              v82 = 1;
LABEL_149:
                              if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd(v67, 0x15u, v21, v82))goto LABEL_165;
LABEL_150:
                              if (v68)
                              {
                                v83 = *v68;
                                v84 = *v68 == 1.0;
                                if (*(_BYTE *)(v67 + 10))
                                {
                                  if (v83 != 0.0 && v83 != 1.0)
                                    goto LABEL_160;
                                }
                              }
                              else
                              {
                                v84 = 0;
                              }
                              v86 = *(unsigned __int8 *)(v67 + v84 + 11);
                              v83 = 0.0;
                              if (v86 != 2)
                              {
                                v88 = *gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<unsigned int>(v67, v21, v86, 0);
LABEL_164:
                                self->_headingType = v88;
LABEL_165:
                                -[VKNavCameraController currentZoomLevel](self, "currentZoomLevel");
                                if (v89 <= 6.0)
                                  self->_headingType = 0;
                                v90 = *(unsigned __int8 **)(*(_QWORD *)&v479 + 24);
                                v91 = *(float **)v90;
                                if (*(_QWORD *)v90)
                                {
                                  v92 = *v91;
                                  v93 = *v91 == 1.0;
                                  if (v90[10])
                                  {
                                    if (v92 != 0.0 && v92 != 1.0)
                                    {
LABEL_177:
                                      if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd(*(_QWORD *)(*(_QWORD *)&v479 + 24), 0x1Bu, v21, 0) & 1) != 0)goto LABEL_180;
                                      v95 = 1;
LABEL_179:
                                      if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd((uint64_t)v90, 0x1Bu, v21, v95))goto LABEL_193;
LABEL_180:
                                      if (v91)
                                      {
                                        v96 = *v91;
                                        v97 = *v91 == 1.0;
                                        if (v90[10])
                                        {
                                          if (v96 != 0.0 && v96 != 1.0)
                                            goto LABEL_190;
                                        }
                                      }
                                      else
                                      {
                                        v97 = 0;
                                      }
                                      v99 = v90[v97 + 11];
                                      v96 = 0.0;
                                      if (v99 != 2)
                                      {
                                        v101 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v90, 0x1Bu, v21, v99, 0);
                                        goto LABEL_192;
                                      }
LABEL_190:
                                      LOBYTE(buf) = 1;
                                      v484 = 1;
                                      v100 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v90, 0x1Bu, v21, 0, &buf);
                                      v101 = v100
                                           + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v90, 0x1Bu, v21, 1u, &v484)- v100)* v96);
LABEL_192:
                                      self->_headingDelta._value = v101 * 0.0174532925;
                                      v90 = *(unsigned __int8 **)(*(_QWORD *)&v479 + 24);
                                      v91 = *(float **)v90;
LABEL_193:
                                      if (v91)
                                      {
                                        v102 = *v91;
                                        v103 = *v91 == 1.0;
                                        if (v90[10])
                                        {
                                          if (v102 != 0.0 && v102 != 1.0)
                                          {
LABEL_203:
                                            if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd((uint64_t)v90, 0x37u, v21, 0) & 1) != 0)goto LABEL_206;
                                            v105 = 1;
LABEL_205:
                                            if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd((uint64_t)v90, 0x37u, v21, v105))goto LABEL_216;
LABEL_206:
                                            if (v91)
                                            {
                                              v106 = *v91;
                                              v107 = *v91 == 1.0;
                                              if (v90[10] && v106 != 0.0 && v106 != 1.0)
                                                goto LABEL_213;
                                            }
                                            else
                                            {
                                              v107 = 0;
                                            }
                                            v108 = v90[v107 + 11];
                                            v106 = 0.0;
                                            if (v108 != 2)
                                            {
                                              v110 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v90, 0x37u, v21, v108, 0);
                                              goto LABEL_215;
                                            }
LABEL_213:
                                            LOBYTE(buf) = 1;
                                            v484 = 1;
                                            v109 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v90, 0x37u, v21, 0, &buf);
                                            v110 = v109
                                                 + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v90, 0x37u, v21, 1u, &v484)- v109)* v106);
LABEL_215:
                                            self->_headingMinDelta._value = v110 * 0.0174532925;
                                            v90 = *(unsigned __int8 **)(*(_QWORD *)&v479 + 24);
                                            v91 = *(float **)v90;
LABEL_216:
                                            if (v91)
                                            {
                                              v111 = *v91;
                                              v112 = *v91 == 1.0;
                                              if (v90[10] && v111 != 0.0 && v111 != 1.0)
                                              {
LABEL_223:
                                                if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd((uint64_t)v90, 0x1Eu, v21, 0) & 1) != 0)goto LABEL_226;
                                                v113 = 1;
LABEL_225:
                                                if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd((uint64_t)v90, 0x1Eu, v21, v113))goto LABEL_236;
LABEL_226:
                                                if (v91)
                                                {
                                                  v114 = *v91;
                                                  v115 = *v91 == 1.0;
                                                  if (v90[10] && v114 != 0.0 && v114 != 1.0)
                                                    goto LABEL_233;
                                                }
                                                else
                                                {
                                                  v115 = 0;
                                                }
                                                v116 = v90[v115 + 11];
                                                v114 = 0.0;
                                                if (v116 != 2)
                                                {
                                                  v118 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v90, 0x1Eu, v21, v116, 0);
                                                  goto LABEL_235;
                                                }
LABEL_233:
                                                LOBYTE(buf) = 1;
                                                v484 = 1;
                                                v117 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v90, 0x1Eu, v21, 0, &buf);
                                                v118 = v117
                                                     + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v90, 0x1Eu, v21, 1u, &v484)- v117)* v114);
LABEL_235:
                                                v119 = v118;
                                                self->_headingSpring._kSpring = v119 * v119;
                                                self->_headingSpring._kDamper = v119 + v119;
                                                v90 = *(unsigned __int8 **)(*(_QWORD *)&v479 + 24);
                                                v91 = *(float **)v90;
LABEL_236:
                                                if (v91)
                                                {
                                                  v120 = *v91;
                                                  v121 = *v91 == 1.0;
                                                  if (v90[10] && v120 != 0.0 && v120 != 1.0)
                                                  {
LABEL_243:
                                                    if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd((uint64_t)v90, 0x1Du, v21, 0) & 1) != 0)goto LABEL_246;
                                                    v122 = 1;
LABEL_245:
                                                    if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd((uint64_t)v90, 0x1Du, v21, v122))goto LABEL_256;
LABEL_246:
                                                    if (v91)
                                                    {
                                                      v123 = *v91;
                                                      v124 = *v91 == 1.0;
                                                      if (v90[10] && v123 != 0.0 && v123 != 1.0)
                                                        goto LABEL_253;
                                                    }
                                                    else
                                                    {
                                                      v124 = 0;
                                                    }
                                                    v125 = v90[v124 + 11];
                                                    v123 = 0.0;
                                                    if (v125 != 2)
                                                    {
                                                      v127 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v90, 0x1Du, v21, v125, 0);
                                                      goto LABEL_255;
                                                    }
LABEL_253:
                                                    LOBYTE(buf) = 1;
                                                    v484 = 1;
                                                    v126 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v90, 0x1Du, v21, 0, &buf);
                                                    v127 = v126
                                                         + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v90, 0x1Du, v21, 1u, &v484)- v126)* v123);
LABEL_255:
                                                    v128 = v127;
                                                    self->_pitchSpring._kSpring = v128 * v128;
                                                    self->_pitchSpring._kDamper = v128 + v128;
                                                    v90 = *(unsigned __int8 **)(*(_QWORD *)&v479 + 24);
                                                    v91 = *(float **)v90;
LABEL_256:
                                                    if (v91)
                                                    {
                                                      v129 = *v91;
                                                      v130 = *v91 == 1.0;
                                                      if (v90[10] && v129 != 0.0 && v129 != 1.0)
                                                      {
LABEL_263:
                                                        if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd((uint64_t)v90, 0x1Fu, v21, 0) & 1) != 0)goto LABEL_266;
                                                        v131 = 1;
LABEL_265:
                                                        if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd((uint64_t)v90, 0x1Fu, v21, v131))goto LABEL_276;
LABEL_266:
                                                        if (v91)
                                                        {
                                                          v132 = *v91;
                                                          v133 = *v91 == 1.0;
                                                          if (v90[10] && v132 != 0.0 && v132 != 1.0)
                                                            goto LABEL_273;
                                                        }
                                                        else
                                                        {
                                                          v133 = 0;
                                                        }
                                                        v134 = v90[v133 + 11];
                                                        v132 = 0.0;
                                                        if (v134 != 2)
                                                        {
                                                          v136 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v90, 0x1Fu, v21, v134, 0);
                                                          goto LABEL_275;
                                                        }
LABEL_273:
                                                        LOBYTE(buf) = 1;
                                                        v484 = 1;
                                                        v135 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v90, 0x1Fu, v21, 0, &buf);
                                                        v136 = v135
                                                             + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<float>((uint64_t)v90, 0x1Fu, v21, 1u, &v484)- v135)* v132);
LABEL_275:
                                                        v137 = v136;
                                                        self->_screenPositionSpring._kSpring = v137 * v137;
                                                        self->_screenPositionSpring._kDamper = v137 + v137;
                                                        v90 = *(unsigned __int8 **)(*(_QWORD *)&v479 + 24);
                                                        v91 = *(float **)v90;
LABEL_276:
                                                        if (v91)
                                                        {
                                                          v138 = *v91;
                                                          v139 = *v91 == 1.0;
                                                          if (v90[10] && v138 != 0.0 && v138 != 1.0)
                                                          {
LABEL_283:
                                                            if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd((uint64_t)v90, 0x20u, v21, 0) & 1) != 0)goto LABEL_286;
                                                            v140 = 1;
LABEL_285:
                                                            if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtZAtEnd((uint64_t)v90, 0x20u, v21, v140))goto LABEL_296;
LABEL_286:
                                                            if (v91)
                                                            {
                                                              *(float *)&v141 = *v91;
                                                              v142 = *v91 == 1.0;
                                                              if (v90[10]
                                                                && *(float *)&v141 != 0.0
                                                                && *(float *)&v141 != 1.0)
                                                              {
                                                                goto LABEL_293;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              v142 = 0;
                                                            }
                                                            v143 = v90[v142 + 11];
                                                            LODWORD(v141) = 0;
                                                            if (v143 != 2)
                                                            {
                                                              v145 = *(Matrix<float, 2, 1> *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<gm::Matrix<float,2,1>>(v90, v21, v143, 0);
                                                              goto LABEL_295;
                                                            }
LABEL_293:
                                                            v478 = v141;
                                                            LOBYTE(buf) = 1;
                                                            v484 = 1;
                                                            v144 = *(float32x2_t *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<gm::Matrix<float,2,1>>(v90, v21, 0, &buf);
                                                            v145 = (Matrix<float, 2, 1>)vmla_n_f32(v144, vsub_f32(*(float32x2_t *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<gm::Matrix<float,2,1>>(v90, v21, 1, &v484), v144), *(float *)&v478);
LABEL_295:
                                                            self->_puckMovementBoundsMin = v145;
LABEL_296:
                                                            if (*(_QWORD *)&v53 == *(_QWORD *)&self->_routeFocusCoordinate.longitude._value)
                                                              goto LABEL_975;
                                                            v146 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                            v147 = *(float **)v146;
                                                            if (*(_QWORD *)v146)
                                                            {
                                                              v148 = *v147;
                                                              v149 = *v147 == 1.0;
                                                              if (*(_BYTE *)(v146 + 10) && v148 != 0.0 && v148 != 1.0)
                                                              {
LABEL_304:
                                                                if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(*(_QWORD *)(*(_QWORD *)&v479 + 24), 0x16u, 0) & 1) != 0)goto LABEL_307;
                                                                v150 = 1;
LABEL_306:
                                                                if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v146, 0x16u, v150))goto LABEL_317;
LABEL_307:
                                                                if (v147)
                                                                {
                                                                  v151 = *v147;
                                                                  v152 = *v147 == 1.0;
                                                                  if (*(_BYTE *)(v146 + 10)
                                                                    && v151 != 0.0
                                                                    && v151 != 1.0)
                                                                  {
                                                                    goto LABEL_314;
                                                                  }
                                                                }
                                                                else
                                                                {
                                                                  v152 = 0;
                                                                }
                                                                v153 = *(unsigned __int8 *)(v146 + v152 + 11);
                                                                v151 = 0.0;
                                                                if (v153 != 2)
                                                                {
                                                                  v155 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v146, 0x16u, v153, 0);
                                                                  goto LABEL_316;
                                                                }
LABEL_314:
                                                                LOBYTE(buf) = 1;
                                                                v484 = 1;
                                                                v154 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v146, 0x16u, 0, &buf);
                                                                v155 = *v154
                                                                     + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v146, 0x16u, 1u, &v484)- *v154)* v151);
LABEL_316:
                                                                self->_cameraDistanceFromTarget._value = v155;
                                                                v146 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                v147 = *(float **)v146;
LABEL_317:
                                                                if (v147)
                                                                {
                                                                  v156 = *v147;
                                                                  v157 = *v147 == 1.0;
                                                                  if (*(_BYTE *)(v146 + 10)
                                                                    && v156 != 0.0
                                                                    && v156 != 1.0)
                                                                  {
LABEL_324:
                                                                    if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v146, 0x17u, 0) & 1) != 0)goto LABEL_327;
                                                                    v158 = 1;
LABEL_326:
                                                                    if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v146, 0x17u, v158))goto LABEL_340;
LABEL_327:
                                                                    if (v147)
                                                                    {
                                                                      v159 = *v147;
                                                                      v160 = *v147 == 1.0;
                                                                      if (*(_BYTE *)(v146 + 10)
                                                                        && v159 != 0.0
                                                                        && v159 != 1.0)
                                                                      {
                                                                        goto LABEL_334;
                                                                      }
                                                                    }
                                                                    else
                                                                    {
                                                                      v160 = 0;
                                                                    }
                                                                    v161 = *(unsigned __int8 *)(v146 + v160 + 11);
                                                                    v159 = 0.0;
                                                                    if (v161 != 2)
                                                                    {
                                                                      v165 = *(_DWORD *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v146, 0x17u, v161, 0);
LABEL_339:
                                                                      self->_cameraType = v165;
                                                                      v146 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                      v147 = *(float **)v146;
LABEL_340:
                                                                      if (v147)
                                                                      {
                                                                        v166 = *v147;
                                                                        v167 = *v147 == 1.0;
                                                                        if (*(_BYTE *)(v146 + 10)
                                                                          && v166 != 0.0
                                                                          && v166 != 1.0)
                                                                        {
LABEL_347:
                                                                          if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v146, 0x18u, 0) & 1) != 0)goto LABEL_350;
                                                                          v168 = 1;
LABEL_349:
                                                                          if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v146, 0x18u, v168))goto LABEL_360;
LABEL_350:
                                                                          if (v147)
                                                                          {
                                                                            v169 = *v147;
                                                                            v170 = *v147 == 1.0;
                                                                            if (*(_BYTE *)(v146 + 10)
                                                                              && v169 != 0.0
                                                                              && v169 != 1.0)
                                                                            {
                                                                              goto LABEL_357;
                                                                            }
                                                                          }
                                                                          else
                                                                          {
                                                                            v170 = 0;
                                                                          }
                                                                          v171 = *(unsigned __int8 *)(v146 + v170 + 11);
                                                                          v169 = 0.0;
                                                                          if (v171 != 2)
                                                                          {
                                                                            v173 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v146, 0x18u, v171, 0);
                                                                            goto LABEL_359;
                                                                          }
LABEL_357:
                                                                          LOBYTE(buf) = 1;
                                                                          v484 = 1;
                                                                          v172 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v146, 0x18u, 0, &buf);
                                                                          v173 = *v172
                                                                               + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v146, 0x18u, 1u, &v484)
                                                                                               - *v172)
                                                                                       * v169);
LABEL_359:
                                                                          *(double *)&self->_styleManeuversToFrame = v173;
                                                                          v146 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                          v147 = *(float **)v146;
LABEL_360:
                                                                          if (v147)
                                                                          {
                                                                            v174 = *v147;
                                                                            v175 = *v147 == 1.0;
                                                                            if (*(_BYTE *)(v146 + 10)
                                                                              && v174 != 0.0
                                                                              && v174 != 1.0)
                                                                            {
LABEL_367:
                                                                              if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v146, 0x19u, 0) & 1) != 0)goto LABEL_370;
                                                                              v176 = 1;
LABEL_369:
                                                                              if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v146, 0x19u, v176))goto LABEL_380;
LABEL_370:
                                                                              if (v147)
                                                                              {
                                                                                v177 = *v147;
                                                                                v178 = *v147 == 1.0;
                                                                                if (*(_BYTE *)(v146 + 10)
                                                                                  && v177 != 0.0
                                                                                  && v177 != 1.0)
                                                                                {
                                                                                  goto LABEL_377;
                                                                                }
                                                                              }
                                                                              else
                                                                              {
                                                                                v178 = 0;
                                                                              }
                                                                              v179 = *(unsigned __int8 *)(v146 + v178 + 11);
                                                                              v177 = 0.0;
                                                                              if (v179 != 2)
                                                                              {
                                                                                v181 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v146, 0x19u, v179, 0);
                                                                                goto LABEL_379;
                                                                              }
LABEL_377:
                                                                              LOBYTE(buf) = 1;
                                                                              v484 = 1;
                                                                              v180 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v146, 0x19u, 0, &buf);
                                                                              v181 = *v180
                                                                                   + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v146, 0x19u, 1u, &v484) - *v180)
                                                                                           * v177);
LABEL_379:
                                                                              *(double *)&self->_coordinatesToFrame.__end_cap_.__value_ = v181;
                                                                              v146 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                              v147 = *(float **)v146;
LABEL_380:
                                                                              if (v147)
                                                                              {
                                                                                v182 = *v147;
                                                                                v183 = *v147 == 1.0;
                                                                                if (*(_BYTE *)(v146 + 10)
                                                                                  && v182 != 0.0
                                                                                  && v182 != 1.0)
                                                                                {
LABEL_387:
                                                                                  if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v146, 0x1Au, 0) & 1) != 0)goto LABEL_390;
                                                                                  v184 = 1;
LABEL_389:
                                                                                  if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v146, 0x1Au, v184))
                                                                                  {
                                                                                    v187 = 1;
                                                                                    goto LABEL_403;
                                                                                  }
LABEL_390:
                                                                                  if (v147)
                                                                                  {
                                                                                    v185 = *v147;
                                                                                    v186 = *v147 == 1.0;
                                                                                    if (*(_BYTE *)(v146 + 10)
                                                                                      && v185 != 0.0
                                                                                      && v185 != 1.0)
                                                                                    {
                                                                                      goto LABEL_398;
                                                                                    }
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    v186 = 0;
                                                                                  }
                                                                                  v188 = *(unsigned __int8 *)(v146 + v186 + 11);
                                                                                  v185 = 0.0;
                                                                                  if (v188 != 2)
                                                                                  {
                                                                                    v187 = *(_BYTE *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned char>(v146, 0x1Au, v188, 0);
                                                                                    goto LABEL_403;
                                                                                  }
LABEL_398:
                                                                                  LOBYTE(buf) = 1;
                                                                                  v484 = 1;
                                                                                  v189 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned char>(v146, 0x1Au, 0, &buf);
                                                                                  v190 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned char>(v146, 0x1Au, 1u, &v484);
                                                                                  if (v185 >= 1.0)
                                                                                    v191 = (char *)v190;
                                                                                  else
                                                                                    v191 = (char *)v189;
                                                                                  v187 = *v191;
LABEL_403:
                                                                                  LOBYTE(self->_coordinatesToFrame.__end_) = v187;
                                                                                  v192 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                  v193 = *(float **)v192;
                                                                                  if (*(_QWORD *)v192)
                                                                                  {
                                                                                    v194 = *v193;
                                                                                    v195 = *v193 == 1.0;
                                                                                    if (*(_BYTE *)(v192 + 10)
                                                                                      && v194 != 0.0
                                                                                      && v194 != 1.0)
                                                                                    {
LABEL_410:
                                                                                      if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(*(_QWORD *)(*(_QWORD *)&v479 + 24), 0x4Fu, 0) & 1) != 0)goto LABEL_413;
                                                                                      v196 = 1;
LABEL_412:
                                                                                      if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v192, 0x4Fu, v196))
                                                                                      {
                                                                                        v199 = 0;
                                                                                        goto LABEL_426;
                                                                                      }
LABEL_413:
                                                                                      if (v193)
                                                                                      {
                                                                                        v197 = *v193;
                                                                                        v198 = *v193 == 1.0;
                                                                                        if (*(_BYTE *)(v192 + 10)
                                                                                          && v197 != 0.0
                                                                                          && v197 != 1.0)
                                                                                        {
                                                                                          goto LABEL_421;
                                                                                        }
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        v198 = 0;
                                                                                      }
                                                                                      v200 = *(unsigned __int8 *)(v192 + v198 + 11);
                                                                                      v197 = 0.0;
                                                                                      if (v200 != 2)
                                                                                      {
                                                                                        v199 = *(_BYTE *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned char>(v192, 0x4Fu, v200, 0);
                                                                                        goto LABEL_426;
                                                                                      }
LABEL_421:
                                                                                      LOBYTE(buf) = 1;
                                                                                      v484 = 1;
                                                                                      v201 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned char>(v192, 0x4Fu, 0, &buf);
                                                                                      v202 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned char>(v192, 0x4Fu, 1u, &v484);
                                                                                      if (v197 >= 1.0)
                                                                                        v203 = (char *)v202;
                                                                                      else
                                                                                        v203 = (char *)v201;
                                                                                      v199 = *v203;
LABEL_426:
                                                                                      BYTE2(self->_coordinatesToFrame.__end_) = v199;
                                                                                      v204 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                      v205 = *(float **)v204;
                                                                                      if (*(_QWORD *)v204)
                                                                                      {
                                                                                        v206 = *v205;
                                                                                        v207 = *v205 == 1.0;
                                                                                        if (*(_BYTE *)(v204 + 10)
                                                                                          && v206 != 0.0
                                                                                          && v206 != 1.0)
                                                                                        {
LABEL_433:
                                                                                          if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(*(_QWORD *)(*(_QWORD *)&v479 + 24), 0x56u, 0) & 1) != 0)goto LABEL_436;
                                                                                          v208 = 1;
LABEL_435:
                                                                                          if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v204, 0x56u, v208))
                                                                                          {
                                                                                            v211 = 0;
                                                                                            goto LABEL_449;
                                                                                          }
LABEL_436:
                                                                                          if (v205)
                                                                                          {
                                                                                            v209 = *v205;
                                                                                            v210 = *v205 == 1.0;
                                                                                            if (*(_BYTE *)(v204 + 10)
                                                                                              && v209 != 0.0
                                                                                              && v209 != 1.0)
                                                                                            {
                                                                                              goto LABEL_444;
                                                                                            }
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            v210 = 0;
                                                                                          }
                                                                                          v212 = *(unsigned __int8 *)(v204 + v210 + 11);
                                                                                          v209 = 0.0;
                                                                                          if (v212 != 2)
                                                                                          {
                                                                                            v211 = *(_BYTE *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned char>(v204, 0x56u, v212, 0);
                                                                                            goto LABEL_449;
                                                                                          }
LABEL_444:
                                                                                          LOBYTE(buf) = 1;
                                                                                          v484 = 1;
                                                                                          v213 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned char>(v204, 0x56u, 0, &buf);
                                                                                          v214 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned char>(v204, 0x56u, 1u, &v484);
                                                                                          if (v209 >= 1.0)
                                                                                            v215 = (char *)v214;
                                                                                          else
                                                                                            v215 = (char *)v213;
                                                                                          v211 = *v215;
LABEL_449:
                                                                                          BYTE3(self->_coordinatesToFrame.__end_) = v211;
                                                                                          v216 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                          v217 = *(float **)v216;
                                                                                          if (*(_QWORD *)v216
                                                                                            && (v218 = *v217,
                                                                                                LODWORD(v217) = *v217 == 1.0,
                                                                                                *(_BYTE *)(v216 + 10))
                                                                                            && v218 != 0.0
                                                                                            && v218 != 1.0
                                                                                            || (v219 = *(unsigned __int8 *)(v216 + v217 + 11),
                                                                                                v219 == 2))
                                                                                          {
                                                                                            if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(*(_QWORD *)(*(_QWORD *)&v479 + 24), 0x57u, 0) & 1) != 0)goto LABEL_457;
                                                                                            v219 = 1;
                                                                                          }
                                                                                          if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v216, 0x57u, v219))
                                                                                          {
                                                                                            GEOConfigGetDouble();
                                                                                            goto LABEL_466;
                                                                                          }
LABEL_457:
                                                                                          GEOConfigGetDouble();
                                                                                          v221 = v220;
                                                                                          v222 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                          v223 = *(float **)v222;
                                                                                          if (*(_QWORD *)v222
                                                                                            && (v224 = *v223,
                                                                                                LODWORD(v223) = *v223 == 1.0,
                                                                                                *(_BYTE *)(v222 + 10))
                                                                                            && v224 != 0.0
                                                                                            && v224 != 1.0
                                                                                            || (v225 = *(unsigned __int8 *)(v222 + v223 + 11),
                                                                                                v224 = 0.0,
                                                                                                v225 == 2))
                                                                                          {
                                                                                            LOBYTE(buf) = 1;
                                                                                            v484 = 1;
                                                                                            v226 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v222, 0x57u, 0, &buf);
                                                                                            v227 = *v226
                                                                                                 + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v222, 0x57u, 1u, &v484) - *v226) * v224);
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            v227 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(*(_QWORD *)(*(_QWORD *)&v479 + 24), 0x57u, v225, 0);
                                                                                          }
                                                                                          v228 = fmin(v221, v227);
LABEL_466:
                                                                                          self->_lastProjectedPosition._e[1] = v228;
                                                                                          v229 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                          v230 = *(float **)v229;
                                                                                          if (*(_QWORD *)v229)
                                                                                          {
                                                                                            v231 = *v230;
                                                                                            v232 = *v230 == 1.0;
                                                                                            if (*(_BYTE *)(v229 + 10)
                                                                                              && v231 != 0.0
                                                                                              && v231 != 1.0)
                                                                                            {
LABEL_473:
                                                                                              if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(*(_QWORD *)(*(_QWORD *)&v479 + 24), 0x1Cu, 0) & 1) != 0)
                                                                                                goto LABEL_476;
                                                                                              v233 = 1;
LABEL_475:
                                                                                              if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v229, 0x1Cu, v233))
                                                                                                goto LABEL_486;
LABEL_476:
                                                                                              if (v230)
                                                                                              {
                                                                                                v234 = *v230;
                                                                                                v235 = *v230 == 1.0;
                                                                                                if (*(_BYTE *)(v229 + 10) && v234 != 0.0 && v234 != 1.0)
                                                                                                  goto LABEL_483;
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                v235 = 0;
                                                                                              }
                                                                                              v236 = *(unsigned __int8 *)(v229 + v235 + 11);
                                                                                              v234 = 0.0;
                                                                                              if (v236 != 2)
                                                                                              {
                                                                                                v238 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v229, 0x1Cu, v236, 0);
                                                                                                goto LABEL_485;
                                                                                              }
LABEL_483:
                                                                                              LOBYTE(buf) = 1;
                                                                                              v484 = 1;
                                                                                              v237 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v229, 0x1Cu, 0, &buf);
                                                                                              v238 = *v237 + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v229, 0x1Cu, 1u, &v484) - *v237) * v234);
LABEL_485:
                                                                                              v239 = v238;
                                                                                              self->_distanceFromTargetSpring._kSpring = v239 * v239;
                                                                                              self->_distanceFromTargetSpring._kDamper = v239 + v239;
                                                                                              v229 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                              v230 = *(float **)v229;
LABEL_486:
                                                                                              if (v230)
                                                                                              {
                                                                                                v240 = *v230;
                                                                                                v241 = *v230 == 1.0;
                                                                                                if (*(_BYTE *)(v229 + 10) && v240 != 0.0 && v240 != 1.0)
                                                                                                {
LABEL_493:
                                                                                                  if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v229, 0x21u, 0) & 1) != 0)
                                                                                                    goto LABEL_496;
                                                                                                  v242 = 1;
LABEL_495:
                                                                                                  if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v229, 0x21u, v242))
                                                                                                    goto LABEL_506;
LABEL_496:
                                                                                                  if (v230)
                                                                                                  {
                                                                                                    *(float *)&v243 = *v230;
                                                                                                    v244 = *v230 == 1.0;
                                                                                                    if (*(_BYTE *)(v229 + 10) && *(float *)&v243 != 0.0 && *(float *)&v243 != 1.0)
                                                                                                      goto LABEL_503;
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    v244 = 0;
                                                                                                  }
                                                                                                  v245 = *(unsigned __int8 *)(v229 + v244 + 11);
                                                                                                  LODWORD(v243) = 0;
                                                                                                  if (v245 != 2)
                                                                                                  {
                                                                                                    v247 = *(float32x2_t *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<gm::Matrix<float,2,1>>(v229, 0x21u, v245, 0);
                                                                                                    goto LABEL_505;
                                                                                                  }
LABEL_503:
                                                                                                  v478 = v243;
                                                                                                  LOBYTE(buf) = 1;
                                                                                                  v484 = 1;
                                                                                                  v246 = (float32x2_t *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<gm::Matrix<float,2,1>>(v229, 0x21u, 0, &buf);
                                                                                                  v247 = vmla_n_f32(*v246, vsub_f32(*(float32x2_t *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<gm::Matrix<float,2,1>>(v229, 0x21u, 1u, &v484), *v246), *(float *)&v478);
LABEL_505:
                                                                                                  *(float32x2_t *)&self->_clientFramingInsets.top = v247;
                                                                                                  v229 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                                  v230 = *(float **)v229;
LABEL_506:
                                                                                                  if (v230)
                                                                                                  {
                                                                                                    v248 = *v230;
                                                                                                    v249 = *v230 == 1.0;
                                                                                                    if (*(_BYTE *)(v229 + 10) && v248 != 0.0 && v248 != 1.0)
                                                                                                    {
LABEL_513:
                                                                                                      if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v229, 0x3Fu, 0) & 1) != 0)
                                                                                                        goto LABEL_516;
                                                                                                      v250 = 1;
LABEL_515:
                                                                                                      if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v229, 0x3Fu, v250))
                                                                                                      {
                                                                                                        v252.i32[0] = LODWORD(self->_clientFramingInsets.top);
                                                                                                        goto LABEL_527;
                                                                                                      }
LABEL_516:
                                                                                                      if (v230)
                                                                                                      {
                                                                                                        *(float *)&v251 = *v230;
                                                                                                        v253 = *v230 == 1.0;
                                                                                                        if (*(_BYTE *)(v229 + 10) && *(float *)&v251 != 0.0 && *(float *)&v251 != 1.0)
                                                                                                          goto LABEL_524;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        v253 = 0;
                                                                                                      }
                                                                                                      v254 = *(unsigned __int8 *)(v229 + v253 + 11);
                                                                                                      LODWORD(v251) = 0;
                                                                                                      if (v254 != 2)
                                                                                                      {
                                                                                                        v252 = *(float32x2_t *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<gm::Matrix<float,2,1>>(v229, 0x3Fu, v254, 0);
                                                                                                        goto LABEL_526;
                                                                                                      }
LABEL_524:
                                                                                                      v478 = v251;
                                                                                                      LOBYTE(buf) = 1;
                                                                                                      v484 = 1;
                                                                                                      v255 = (float32x2_t *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<gm::Matrix<float,2,1>>(v229, 0x3Fu, 0, &buf);
                                                                                                      v252 = vmla_n_f32(*v255, vsub_f32(*(float32x2_t *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<gm::Matrix<float,2,1>>(v229, 0x3Fu, 1u, &v484), *v255), *(float *)&v478);
LABEL_526:
                                                                                                      v229 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                                      v230 = *(float **)v229;
LABEL_527:
                                                                                                      *(float32x2_t *)&self->_clientFramingInsets.bottom = v252;
                                                                                                      if (v230)
                                                                                                      {
                                                                                                        v256 = *v230;
                                                                                                        v257 = *v230 == 1.0;
                                                                                                        if (*(_BYTE *)(v229 + 10) && v256 != 0.0 && v256 != 1.0)
                                                                                                          goto LABEL_534;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        v257 = 0;
                                                                                                      }
                                                                                                      v258 = *(unsigned __int8 *)(v229 + v257 + 11);
                                                                                                      v256 = 0.0;
                                                                                                      if (v258 != 2)
                                                                                                      {
                                                                                                        v262 = *(_DWORD *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<int>(v229, 0x22u, v258, 0);
                                                                                                        goto LABEL_539;
                                                                                                      }
LABEL_534:
                                                                                                      LOBYTE(buf) = 1;
                                                                                                      v484 = 1;
                                                                                                      v259 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<int>(v229, 0x22u, 0, &buf);
                                                                                                      v260 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<int>(v229, 0x22u, 1u, &v484);
                                                                                                      if (v256 >= 1.0)
                                                                                                        v261 = (int *)v260;
                                                                                                      else
                                                                                                        v261 = (int *)v259;
                                                                                                      v262 = *v261;
LABEL_539:
                                                                                                      self->_previousMapEdgeInsets.left = (float)v262;
                                                                                                      v263 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                                      v264 = *(float **)v263;
                                                                                                      if (*(_QWORD *)v263 && (v265 = *v264, LODWORD(v264) = *v264 == 1.0, *(_BYTE *)(v263 + 10)) && v265 != 0.0 && v265 != 1.0 || (v266 = *(unsigned __int8 *)(v263 + v264 + 11), v265 = 0.0, v266 == 2))
                                                                                                      {
                                                                                                        LOBYTE(buf) = 1;
                                                                                                        v484 = 1;
                                                                                                        v267 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<int>(v263, 0x23u, 0, &buf);
                                                                                                        v268 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<int>(v263, 0x23u, 1u, &v484);
                                                                                                        if (v265 >= 1.0)
                                                                                                          v269 = (int *)v268;
                                                                                                        else
                                                                                                          v269 = (int *)v267;
                                                                                                        v270 = *v269;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        v270 = *(_DWORD *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<int>(*(_QWORD *)(*(_QWORD *)&v479 + 24), 0x23u, v266, 0);
                                                                                                      }
                                                                                                      self->_previousMapEdgeInsets.right = (float)(__int16)v270;
                                                                                                      v271 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                                      v272 = *(float **)v271;
                                                                                                      if (*(_QWORD *)v271 && (v273 = *v272, LODWORD(v272) = *v272 == 1.0, *(_BYTE *)(v271 + 10)) && v273 != 0.0 && v273 != 1.0 || (v274 = *(unsigned __int8 *)(v271 + v272 + 11), v273 = 0.0, v274 == 2))
                                                                                                      {
                                                                                                        LOBYTE(buf) = 1;
                                                                                                        v484 = 1;
                                                                                                        v275 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<int>(v271, 0x24u, 0, &buf);
                                                                                                        v276 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<int>(v271, 0x24u, 1u, &v484);
                                                                                                        if (v273 >= 1.0)
                                                                                                          v277 = (int *)v276;
                                                                                                        else
                                                                                                          v277 = (int *)v275;
                                                                                                        v278 = *v277;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        v278 = *(_DWORD *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<int>(*(_QWORD *)(*(_QWORD *)&v479 + 24), 0x24u, v274, 0);
                                                                                                      }
                                                                                                      self->_previousMapEdgeInsets.top = (float)v278;
                                                                                                      v279 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                                      v280 = *(float **)v279;
                                                                                                      if (*(_QWORD *)v279 && (v281 = *v280, LODWORD(v280) = *v280 == 1.0, *(_BYTE *)(v279 + 10)) && v281 != 0.0 && v281 != 1.0 || (v282 = *(unsigned __int8 *)(v279 + v280 + 11), v281 = 0.0, v282 == 2))
                                                                                                      {
                                                                                                        LOBYTE(buf) = 1;
                                                                                                        v484 = 1;
                                                                                                        v283 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<int>(v279, 0x25u, 0, &buf);
                                                                                                        v284 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<int>(v279, 0x25u, 1u, &v484);
                                                                                                        if (v281 >= 1.0)
                                                                                                          v285 = (int *)v284;
                                                                                                        else
                                                                                                          v285 = (int *)v283;
                                                                                                        v286 = *v285;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        v286 = *(_DWORD *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<int>(*(_QWORD *)(*(_QWORD *)&v479 + 24), 0x25u, v282, 0);
                                                                                                      }
                                                                                                      self->_previousMapEdgeInsets.bottom = (float)v286;
                                                                                                      v287 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                                      v288 = *(float **)v287;
                                                                                                      if (*(_QWORD *)v287 && (v289 = *v288, LODWORD(v288) = *v288 == 1.0, *(_BYTE *)(v287 + 10)) && v289 != 0.0 && v289 != 1.0 || (v290 = *(unsigned __int8 *)(v287 + v288 + 11), v289 = 0.0, v290 == 2))
                                                                                                      {
                                                                                                        LOBYTE(buf) = 1;
                                                                                                        v484 = 1;
                                                                                                        v291 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v287, 0x44u, 0, &buf);
                                                                                                        v292 = *v291 + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v287, 0x44u, 1u, &v484) - *v291) * v289);
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        v292 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(*(_QWORD *)(*(_QWORD *)&v479 + 24), 0x44u, v290, 0);
                                                                                                      }
                                                                                                      self->_framingEdgeInset.left = v292;
                                                                                                      v293 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                                      v294 = *(float **)v293;
                                                                                                      if (*(_QWORD *)v293 && (v295 = *v294, LODWORD(v294) = *v294 == 1.0, *(_BYTE *)(v293 + 10)) && v295 != 0.0 && v295 != 1.0 || (v296 = *(unsigned __int8 *)(v293 + v294 + 11), v295 = 0.0, v296 == 2))
                                                                                                      {
                                                                                                        LOBYTE(buf) = 1;
                                                                                                        v484 = 1;
                                                                                                        v297 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v293, 0x45u, 0, &buf);
                                                                                                        v298 = *v297 + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v293, 0x45u, 1u, &v484) - *v297) * v295);
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        v298 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(*(_QWORD *)(*(_QWORD *)&v479 + 24), 0x45u, v296, 0);
                                                                                                      }
                                                                                                      self->_framingEdgeInset.right = v298;
                                                                                                      v299 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                                      v300 = *(float **)v299;
                                                                                                      if (*(_QWORD *)v299 && (v301 = *v300, LODWORD(v300) = *v300 == 1.0, *(_BYTE *)(v299 + 10)) && v301 != 0.0 && v301 != 1.0 || (v302 = *(unsigned __int8 *)(v299 + v300 + 11), v301 = 0.0, v302 == 2))
                                                                                                      {
                                                                                                        LOBYTE(buf) = 1;
                                                                                                        v484 = 1;
                                                                                                        v303 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v299, 0x46u, 0, &buf);
                                                                                                        v304 = *v303 + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v299, 0x46u, 1u, &v484) - *v303) * v301);
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        v304 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(*(_QWORD *)(*(_QWORD *)&v479 + 24), 0x46u, v302, 0);
                                                                                                      }
                                                                                                      self->_framingEdgeInset.top = v304;
                                                                                                      v305 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                                      v306 = *(float **)v305;
                                                                                                      if (*(_QWORD *)v305 && (v307 = *v306, LODWORD(v306) = *v306 == 1.0, *(_BYTE *)(v305 + 10)) && v307 != 0.0 && v307 != 1.0 || (v308 = *(unsigned __int8 *)(v305 + v306 + 11), v307 = 0.0, v308 == 2))
                                                                                                      {
                                                                                                        LOBYTE(buf) = 1;
                                                                                                        v484 = 1;
                                                                                                        v309 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v305, 0x47u, 0, &buf);
                                                                                                        v310 = *v309 + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v305, 0x47u, 1u, &v484) - *v309) * v307);
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        v310 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(*(_QWORD *)(*(_QWORD *)&v479 + 24), 0x47u, v308, 0);
                                                                                                      }
                                                                                                      self->_framingEdgeInset.bottom = v310;
                                                                                                      v311 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                                      v312 = *(float **)v311;
                                                                                                      if (*(_QWORD *)v311)
                                                                                                      {
                                                                                                        v313 = *v312;
                                                                                                        v314 = *v312 == 1.0;
                                                                                                        if (*(_BYTE *)(v311 + 10) && v313 != 0.0 && v313 != 1.0)
                                                                                                        {
LABEL_604:
                                                                                                          if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(*(_QWORD *)(*(_QWORD *)&v479 + 24), 0x26u, 0) & 1) != 0)
                                                                                                            goto LABEL_607;
                                                                                                          v315 = 1;
LABEL_606:
                                                                                                          if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x26u, v315))
                                                                                                            goto LABEL_617;
LABEL_607:
                                                                                                          if (v312)
                                                                                                          {
                                                                                                            v316 = *v312;
                                                                                                            v317 = *v312 == 1.0;
                                                                                                            if (*(_BYTE *)(v311 + 10) && v316 != 0.0 && v316 != 1.0)
                                                                                                              goto LABEL_614;
                                                                                                          }
                                                                                                          else
                                                                                                          {
                                                                                                            v317 = 0;
                                                                                                          }
                                                                                                          v318 = *(unsigned __int8 *)(v311 + v317 + 11);
                                                                                                          v316 = 0.0;
                                                                                                          if (v318 != 2)
                                                                                                          {
                                                                                                            v320 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v311, 0x26u, v318, 0);
                                                                                                            goto LABEL_616;
                                                                                                          }
LABEL_614:
                                                                                                          LOBYTE(buf) = 1;
                                                                                                          v484 = 1;
                                                                                                          v319 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v311, 0x26u, 0, &buf);
                                                                                                          v320 = *v319 + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v311, 0x26u, 1u, &v484) - *v319) * v316);
LABEL_616:
                                                                                                          *(double *)&self->_puckMovementBoundsMax = v320;
                                                                                                          v311 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                                          v312 = *(float **)v311;
LABEL_617:
                                                                                                          if (v312)
                                                                                                          {
                                                                                                            v321 = *v312;
                                                                                                            v322 = *v312 == 1.0;
                                                                                                            if (*(_BYTE *)(v311 + 10) && v321 != 0.0 && v321 != 1.0)
                                                                                                            {
LABEL_624:
                                                                                                              if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x27u, 0) & 1) != 0)
                                                                                                                goto LABEL_627;
                                                                                                              v323 = 1;
LABEL_626:
                                                                                                              if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x27u, v323))
                                                                                                                goto LABEL_637;
LABEL_627:
                                                                                                              if (v312)
                                                                                                              {
                                                                                                                v324 = *v312;
                                                                                                                v325 = *v312 == 1.0;
                                                                                                                if (*(_BYTE *)(v311 + 10) && v324 != 0.0 && v324 != 1.0)
                                                                                                                  goto LABEL_634;
                                                                                                              }
                                                                                                              else
                                                                                                              {
                                                                                                                v325 = 0;
                                                                                                              }
                                                                                                              v326 = *(unsigned __int8 *)(v311 + v325 + 11);
                                                                                                              v324 = 0.0;
                                                                                                              if (v326 != 2)
                                                                                                              {
                                                                                                                v328 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v311, 0x27u, v326, 0);
                                                                                                                goto LABEL_636;
                                                                                                              }
LABEL_634:
                                                                                                              LOBYTE(buf) = 1;
                                                                                                              v484 = 1;
                                                                                                              v327 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v311, 0x27u, 0, &buf);
                                                                                                              v328 = *v327 + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v311, 0x27u, 1u, &v484) - *v327) * v324);
LABEL_636:
                                                                                                              *(double *)&self->_idealPuckScreenPosition = v328;
                                                                                                              v311 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                                              v312 = *(float **)v311;
LABEL_637:
                                                                                                              if (v312)
                                                                                                              {
                                                                                                                v329 = *v312;
                                                                                                                v330 = *v312 == 1.0;
                                                                                                                if (*(_BYTE *)(v311 + 10) && v329 != 0.0 && v329 != 1.0)
                                                                                                                {
LABEL_644:
                                                                                                                  if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x35u, 0) & 1) != 0)
                                                                                                                    goto LABEL_647;
                                                                                                                  v331 = 1;
LABEL_646:
                                                                                                                  if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x35u, v331))
                                                                                                                    goto LABEL_657;
LABEL_647:
                                                                                                                  if (v312)
                                                                                                                  {
                                                                                                                    v332 = *v312;
                                                                                                                    v333 = *v312 == 1.0;
                                                                                                                    if (*(_BYTE *)(v311 + 10) && v332 != 0.0 && v332 != 1.0)
                                                                                                                      goto LABEL_654;
                                                                                                                  }
                                                                                                                  else
                                                                                                                  {
                                                                                                                    v333 = 0;
                                                                                                                  }
                                                                                                                  v334 = *(unsigned __int8 *)(v311 + v333 + 11);
                                                                                                                  v332 = 0.0;
                                                                                                                  if (v334 != 2)
                                                                                                                  {
                                                                                                                    v336 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v311, 0x35u, v334, 0);
                                                                                                                    goto LABEL_656;
                                                                                                                  }
LABEL_654:
                                                                                                                  LOBYTE(buf) = 1;
                                                                                                                  v484 = 1;
                                                                                                                  v335 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v311, 0x35u, 0, &buf);
                                                                                                                  v336 = *v335 + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v311, 0x35u, 1u, &v484) - *v335) * v332);
LABEL_656:
                                                                                                                  self->_minHeightDeltaChangeHorizontal = v336;
                                                                                                                  v311 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                                                  v312 = *(float **)v311;
LABEL_657:
                                                                                                                  if (v312)
                                                                                                                  {
                                                                                                                    v337 = *v312;
                                                                                                                    v338 = *v312 == 1.0;
                                                                                                                    if (*(_BYTE *)(v311 + 10) && v337 != 0.0 && v337 != 1.0)
                                                                                                                    {
LABEL_664:
                                                                                                                      if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x36u, 0) & 1) != 0)
                                                                                                                        goto LABEL_667;
                                                                                                                      v339 = 1;
LABEL_666:
                                                                                                                      if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x36u, v339))
                                                                                                                        goto LABEL_677;
LABEL_667:
                                                                                                                      if (v312)
                                                                                                                      {
                                                                                                                        v340 = *v312;
                                                                                                                        v341 = *v312 == 1.0;
                                                                                                                        if (*(_BYTE *)(v311 + 10) && v340 != 0.0 && v340 != 1.0)
                                                                                                                          goto LABEL_674;
                                                                                                                      }
                                                                                                                      else
                                                                                                                      {
                                                                                                                        v341 = 0;
                                                                                                                      }
                                                                                                                      v342 = *(unsigned __int8 *)(v311 + v341 + 11);
                                                                                                                      v340 = 0.0;
                                                                                                                      if (v342 != 2)
                                                                                                                      {
                                                                                                                        v344 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v311, 0x36u, v342, 0);
                                                                                                                        goto LABEL_676;
                                                                                                                      }
LABEL_674:
                                                                                                                      LOBYTE(buf) = 1;
                                                                                                                      v484 = 1;
                                                                                                                      v343 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v311, 0x36u, 0, &buf);
                                                                                                                      v344 = *v343 + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v311, 0x36u, 1u, &v484) - *v343) * v340);
LABEL_676:
                                                                                                                      self->_maxHeightDeltaChangeHorizontal = v344;
                                                                                                                      v311 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                                                      v312 = *(float **)v311;
LABEL_677:
                                                                                                                      if (v312)
                                                                                                                      {
                                                                                                                        v345 = *v312;
                                                                                                                        v346 = *v312 == 1.0;
                                                                                                                        if (*(_BYTE *)(v311 + 10) && v345 != 0.0 && v345 != 1.0)
                                                                                                                        {
LABEL_684:
                                                                                                                          if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x2Fu, 0) & 1) != 0)
                                                                                                                            goto LABEL_687;
                                                                                                                          v347 = 1;
LABEL_686:
                                                                                                                          if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x2Fu, v347))
                                                                                                                            goto LABEL_700;
LABEL_687:
                                                                                                                          if (v312)
                                                                                                                          {
                                                                                                                            v348 = *v312;
                                                                                                                            v349 = *v312 == 1.0;
                                                                                                                            if (*(_BYTE *)(v311 + 10) && v348 != 0.0 && v348 != 1.0)
                                                                                                                              goto LABEL_694;
                                                                                                                          }
                                                                                                                          else
                                                                                                                          {
                                                                                                                            v349 = 0;
                                                                                                                          }
                                                                                                                          v350 = *(unsigned __int8 *)(v311 + v349 + 11);
                                                                                                                          v348 = 0.0;
                                                                                                                          if (v350 != 2)
                                                                                                                          {
                                                                                                                            v354 = *(_BYTE *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v311, 0x2Fu, v350, 0);
LABEL_699:
                                                                                                                            LOBYTE(self->_framingScreenRect._maximum._e[0]) = v354 != 0;
                                                                                                                            v311 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                                                            v312 = *(float **)v311;
LABEL_700:
                                                                                                                            if (v312)
                                                                                                                            {
                                                                                                                              v355 = *v312;
                                                                                                                              v356 = *v312 == 1.0;
                                                                                                                              if (*(_BYTE *)(v311 + 10) && v355 != 0.0 && v355 != 1.0)
                                                                                                                              {
LABEL_707:
                                                                                                                                if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x30u, 0) & 1) != 0)
                                                                                                                                  goto LABEL_710;
                                                                                                                                v357 = 1;
LABEL_709:
                                                                                                                                if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x30u, v357))
                                                                                                                                  goto LABEL_723;
LABEL_710:
                                                                                                                                if (v312)
                                                                                                                                {
                                                                                                                                  v358 = *v312;
                                                                                                                                  v359 = *v312 == 1.0;
                                                                                                                                  if (*(_BYTE *)(v311 + 10) && v358 != 0.0 && v358 != 1.0)
                                                                                                                                    goto LABEL_717;
                                                                                                                                }
                                                                                                                                else
                                                                                                                                {
                                                                                                                                  v359 = 0;
                                                                                                                                }
                                                                                                                                v360 = *(unsigned __int8 *)(v311 + v359 + 11);
                                                                                                                                v358 = 0.0;
                                                                                                                                if (v360 != 2)
                                                                                                                                {
                                                                                                                                  v364 = *(_BYTE *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v311, 0x30u, v360, 0);
LABEL_722:
                                                                                                                                  BYTE1(self->_framingScreenRect._maximum._e[0]) = v364 != 0;
                                                                                                                                  v311 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                                                                  v312 = *(float **)v311;
LABEL_723:
                                                                                                                                  if (v312)
                                                                                                                                  {
                                                                                                                                    v365 = *v312;
                                                                                                                                    v366 = *v312 == 1.0;
                                                                                                                                    if (*(_BYTE *)(v311 + 10) && v365 != 0.0 && v365 != 1.0)
                                                                                                                                    {
LABEL_730:
                                                                                                                                      if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x32u, 0) & 1) != 0)
                                                                                                                                        goto LABEL_733;
                                                                                                                                      v367 = 1;
LABEL_732:
                                                                                                                                      if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x32u, v367))
                                                                                                                                        goto LABEL_746;
LABEL_733:
                                                                                                                                      if (v312)
                                                                                                                                      {
                                                                                                                                        v368 = *v312;
                                                                                                                                        v369 = *v312 == 1.0;
                                                                                                                                        if (*(_BYTE *)(v311 + 10) && v368 != 0.0 && v368 != 1.0)
                                                                                                                                          goto LABEL_740;
                                                                                                                                      }
                                                                                                                                      else
                                                                                                                                      {
                                                                                                                                        v369 = 0;
                                                                                                                                      }
                                                                                                                                      v370 = *(unsigned __int8 *)(v311 + v369 + 11);
                                                                                                                                      v368 = 0.0;
                                                                                                                                      if (v370 != 2)
                                                                                                                                      {
                                                                                                                                        v374 = *(_BYTE *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v311, 0x32u, v370, 0);
LABEL_745:
                                                                                                                                        BYTE3(self->_framingScreenRect._maximum._e[0]) = v374 != 0;
                                                                                                                                        v311 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                                                                        v312 = *(float **)v311;
LABEL_746:
                                                                                                                                        if (v312)
                                                                                                                                        {
                                                                                                                                          v375 = *v312;
                                                                                                                                          v376 = *v312 == 1.0;
                                                                                                                                          if (*(_BYTE *)(v311 + 10) && v375 != 0.0 && v375 != 1.0)
                                                                                                                                          {
LABEL_753:
                                                                                                                                            if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x31u, 0) & 1) != 0)
                                                                                                                                              goto LABEL_756;
                                                                                                                                            v377 = 1;
LABEL_755:
                                                                                                                                            if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x31u, v377))
                                                                                                                                              goto LABEL_769;
LABEL_756:
                                                                                                                                            if (v312)
                                                                                                                                            {
                                                                                                                                              v378 = *v312;
                                                                                                                                              v379 = *v312 == 1.0;
                                                                                                                                              if (*(_BYTE *)(v311 + 10) && v378 != 0.0 && v378 != 1.0)
                                                                                                                                                goto LABEL_763;
                                                                                                                                            }
                                                                                                                                            else
                                                                                                                                            {
                                                                                                                                              v379 = 0;
                                                                                                                                            }
                                                                                                                                            v380 = *(unsigned __int8 *)(v311 + v379 + 11);
                                                                                                                                            v378 = 0.0;
                                                                                                                                            if (v380 != 2)
                                                                                                                                            {
                                                                                                                                              v384 = *(_BYTE *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v311, 0x31u, v380, 0);
LABEL_768:
                                                                                                                                              BYTE2(self->_framingScreenRect._maximum._e[0]) = v384 != 0;
                                                                                                                                              v311 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                                                                              v312 = *(float **)v311;
LABEL_769:
                                                                                                                                              if (v312)
                                                                                                                                              {
                                                                                                                                                v385 = *v312;
                                                                                                                                                v386 = *v312 == 1.0;
                                                                                                                                                if (*(_BYTE *)(v311 + 10) && v385 != 0.0 && v385 != 1.0)
                                                                                                                                                {
LABEL_776:
                                                                                                                                                  if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x2Au, 0) & 1) != 0)
                                                                                                                                                    goto LABEL_779;
                                                                                                                                                  v387 = 1;
LABEL_778:
                                                                                                                                                  if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x2Au, v387))
                                                                                                                                                    goto LABEL_789;
LABEL_779:
                                                                                                                                                  if (v312)
                                                                                                                                                  {
                                                                                                                                                    v388 = *v312;
                                                                                                                                                    v389 = *v312 == 1.0;
                                                                                                                                                    if (*(_BYTE *)(v311 + 10) && v388 != 0.0 && v388 != 1.0)
                                                                                                                                                      goto LABEL_786;
                                                                                                                                                  }
                                                                                                                                                  else
                                                                                                                                                  {
                                                                                                                                                    v389 = 0;
                                                                                                                                                  }
                                                                                                                                                  v390 = *(unsigned __int8 *)(v311 + v389 + 11);
                                                                                                                                                  v388 = 0.0;
                                                                                                                                                  if (v390 != 2)
                                                                                                                                                  {
                                                                                                                                                    v392 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v311, 0x2Au, v390, 0);
                                                                                                                                                    goto LABEL_788;
                                                                                                                                                  }
LABEL_786:
                                                                                                                                                  LOBYTE(buf) = 1;
                                                                                                                                                  v484 = 1;
                                                                                                                                                  v391 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v311, 0x2Au, 0, &buf);
                                                                                                                                                  v392 = *v391 + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v311, 0x2Au, 1u, &v484) - *v391) * v388);
LABEL_788:
                                                                                                                                                  *((float *)self->_framingScreenRect._maximum._e + 1) = v392;
                                                                                                                                                  v311 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                                                                                  v312 = *(float **)v311;
LABEL_789:
                                                                                                                                                  if (v312)
                                                                                                                                                  {
                                                                                                                                                    v393 = *v312;
                                                                                                                                                    v394 = *v312 == 1.0;
                                                                                                                                                    if (*(_BYTE *)(v311 + 10) && v393 != 0.0 && v393 != 1.0)
                                                                                                                                                    {
LABEL_796:
                                                                                                                                                      if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x2Eu, 0) & 1) != 0)
                                                                                                                                                        goto LABEL_799;
                                                                                                                                                      v395 = 1;
LABEL_798:
                                                                                                                                                      if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x2Eu, v395))
                                                                                                                                                        goto LABEL_812;
LABEL_799:
                                                                                                                                                      if (v312)
                                                                                                                                                      {
                                                                                                                                                        v396 = *v312;
                                                                                                                                                        v397 = *v312 == 1.0;
                                                                                                                                                        if (*(_BYTE *)(v311 + 10) && v396 != 0.0 && v396 != 1.0)
                                                                                                                                                          goto LABEL_806;
                                                                                                                                                      }
                                                                                                                                                      else
                                                                                                                                                      {
                                                                                                                                                        v397 = 0;
                                                                                                                                                      }
                                                                                                                                                      v398 = *(unsigned __int8 *)(v311 + v397 + 11);
                                                                                                                                                      v396 = 0.0;
                                                                                                                                                      if (v398 != 2)
                                                                                                                                                      {
                                                                                                                                                        v402 = *(_DWORD *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v311, 0x2Eu, v398, 0);
LABEL_811:
                                                                                                                                                        LOBYTE(self->_framingScreenRect._maximum._e[1]) = v402;
                                                                                                                                                        v311 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                                                                                        v312 = *(float **)v311;
LABEL_812:
                                                                                                                                                        if (v312)
                                                                                                                                                        {
                                                                                                                                                          v403 = *v312;
                                                                                                                                                          v404 = *v312 == 1.0;
                                                                                                                                                          if (*(_BYTE *)(v311 + 10) && v403 != 0.0 && v403 != 1.0)
                                                                                                                                                          {
LABEL_819:
                                                                                                                                                            if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x55u, 0) & 1) != 0)
                                                                                                                                                              goto LABEL_822;
                                                                                                                                                            v405 = 1;
LABEL_821:
                                                                                                                                                            if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x55u, v405))
                                                                                                                                                              goto LABEL_835;
LABEL_822:
                                                                                                                                                            if (v312)
                                                                                                                                                            {
                                                                                                                                                              v406 = *v312;
                                                                                                                                                              v407 = *v312 == 1.0;
                                                                                                                                                              if (*(_BYTE *)(v311 + 10) && v406 != 0.0 && v406 != 1.0)
                                                                                                                                                                goto LABEL_829;
                                                                                                                                                            }
                                                                                                                                                            else
                                                                                                                                                            {
                                                                                                                                                              v407 = 0;
                                                                                                                                                            }
                                                                                                                                                            v408 = *(unsigned __int8 *)(v311 + v407 + 11);
                                                                                                                                                            v406 = 0.0;
                                                                                                                                                            if (v408 != 2)
                                                                                                                                                            {
                                                                                                                                                              v412 = *(_DWORD *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v311, 0x55u, v408, 0);
LABEL_834:
                                                                                                                                                              BYTE1(self->_framingScreenRect._maximum._e[1]) = v412;
                                                                                                                                                              v311 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                                                                                              v312 = *(float **)v311;
LABEL_835:
                                                                                                                                                              if (v312)
                                                                                                                                                              {
                                                                                                                                                                v413 = *v312;
                                                                                                                                                                v414 = *v312 == 1.0;
                                                                                                                                                                if (*(_BYTE *)(v311 + 10) && v413 != 0.0 && v413 != 1.0)
                                                                                                                                                                {
LABEL_842:
                                                                                                                                                                  if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x2Bu, 0) & 1) != 0)
                                                                                                                                                                    goto LABEL_845;
                                                                                                                                                                  v415 = 1;
LABEL_844:
                                                                                                                                                                  if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x2Bu, v415))
                                                                                                                                                                    goto LABEL_858;
LABEL_845:
                                                                                                                                                                  if (v312)
                                                                                                                                                                  {
                                                                                                                                                                    v416 = *v312;
                                                                                                                                                                    v417 = *v312 == 1.0;
                                                                                                                                                                    if (*(_BYTE *)(v311 + 10) && v416 != 0.0 && v416 != 1.0)
                                                                                                                                                                      goto LABEL_852;
                                                                                                                                                                  }
                                                                                                                                                                  else
                                                                                                                                                                  {
                                                                                                                                                                    v417 = 0;
                                                                                                                                                                  }
                                                                                                                                                                  v418 = *(unsigned __int8 *)(v311 + v417 + 11);
                                                                                                                                                                  v416 = 0.0;
                                                                                                                                                                  if (v418 != 2)
                                                                                                                                                                  {
                                                                                                                                                                    v422 = *(_BYTE *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v311, 0x2Bu, v418, 0);
LABEL_857:
                                                                                                                                                                    LOBYTE(self->_locationCoordinate.longitude) = v422 != 0;
                                                                                                                                                                    v311 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                                                                                                    v312 = *(float **)v311;
LABEL_858:
                                                                                                                                                                    if (v312)
                                                                                                                                                                    {
                                                                                                                                                                      v423 = *v312;
                                                                                                                                                                      v424 = *v312 == 1.0;
                                                                                                                                                                      if (*(_BYTE *)(v311 + 10) && v423 != 0.0 && v423 != 1.0)
                                                                                                                                                                      {
LABEL_865:
                                                                                                                                                                        if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x2Cu, 0) & 1) != 0)
                                                                                                                                                                          goto LABEL_868;
                                                                                                                                                                        v425 = 1;
LABEL_867:
                                                                                                                                                                        if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x2Cu, v425))
                                                                                                                                                                          goto LABEL_881;
LABEL_868:
                                                                                                                                                                        if (v312)
                                                                                                                                                                        {
                                                                                                                                                                          v426 = *v312;
                                                                                                                                                                          v427 = *v312 == 1.0;
                                                                                                                                                                          if (*(_BYTE *)(v311 + 10) && v426 != 0.0 && v426 != 1.0)
                                                                                                                                                                            goto LABEL_875;
                                                                                                                                                                        }
                                                                                                                                                                        else
                                                                                                                                                                        {
                                                                                                                                                                          v427 = 0;
                                                                                                                                                                        }
                                                                                                                                                                        v428 = *(unsigned __int8 *)(v311 + v427 + 11);
                                                                                                                                                                        v426 = 0.0;
                                                                                                                                                                        if (v428 != 2)
                                                                                                                                                                        {
                                                                                                                                                                          v432 = *(_BYTE *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned char>(v311, 0x2Cu, v428, 0);
LABEL_880:
                                                                                                                                                                          BYTE1(self->_locationCoordinate.longitude) = v432;
                                                                                                                                                                          v311 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                                                                                                          v312 = *(float **)v311;
LABEL_881:
                                                                                                                                                                          if (v312)
                                                                                                                                                                          {
                                                                                                                                                                            v433 = *v312;
                                                                                                                                                                            v434 = *v312 == 1.0;
                                                                                                                                                                            if (*(_BYTE *)(v311 + 10) && v433 != 0.0 && v433 != 1.0)
                                                                                                                                                                            {
LABEL_888:
                                                                                                                                                                              if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x34u, 0) & 1) != 0)
                                                                                                                                                                                goto LABEL_891;
                                                                                                                                                                              v435 = 1;
LABEL_890:
                                                                                                                                                                              if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x34u, v435))
                                                                                                                                                                                goto LABEL_904;
LABEL_891:
                                                                                                                                                                              if (v312)
                                                                                                                                                                              {
                                                                                                                                                                                v436 = *v312;
                                                                                                                                                                                v437 = *v312 == 1.0;
                                                                                                                                                                                if (*(_BYTE *)(v311 + 10) && v436 != 0.0 && v436 != 1.0)
                                                                                                                                                                                  goto LABEL_898;
                                                                                                                                                                              }
                                                                                                                                                                              else
                                                                                                                                                                              {
                                                                                                                                                                                v437 = 0;
                                                                                                                                                                              }
                                                                                                                                                                              v438 = *(unsigned __int8 *)(v311 + v437 + 11);
                                                                                                                                                                              v436 = 0.0;
                                                                                                                                                                              if (v438 != 2)
                                                                                                                                                                              {
                                                                                                                                                                                v442 = *(_BYTE *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v311, 0x34u, v438, 0);
LABEL_903:
                                                                                                                                                                                BYTE2(self->_locationCoordinate.longitude) = v442 != 0;
                                                                                                                                                                                v311 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                                                                                                                v312 = *(float **)v311;
LABEL_904:
                                                                                                                                                                                if (v312)
                                                                                                                                                                                {
                                                                                                                                                                                  v443 = *v312;
                                                                                                                                                                                  v444 = *v312 == 1.0;
                                                                                                                                                                                  if (*(_BYTE *)(v311 + 10) && v443 != 0.0 && v443 != 1.0)
                                                                                                                                                                                  {
LABEL_911:
                                                                                                                                                                                    if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x2Du, 0) & 1) != 0)
                                                                                                                                                                                      goto LABEL_914;
                                                                                                                                                                                    v445 = 1;
LABEL_913:
                                                                                                                                                                                    hasValueForKeyAtEnd = gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x2Du, v445);
                                                                                                                                                                                    v447 = -1.0;
                                                                                                                                                                                    if (!hasValueForKeyAtEnd)
                                                                                                                                                                                      goto LABEL_924;
LABEL_914:
                                                                                                                                                                                    if (v312)
                                                                                                                                                                                    {
                                                                                                                                                                                      v448 = *v312;
                                                                                                                                                                                      v449 = *v312 == 1.0;
                                                                                                                                                                                      if (*(_BYTE *)(v311 + 10) && v448 != 0.0 && v448 != 1.0)
                                                                                                                                                                                        goto LABEL_921;
                                                                                                                                                                                    }
                                                                                                                                                                                    else
                                                                                                                                                                                    {
                                                                                                                                                                                      v449 = 0;
                                                                                                                                                                                    }
                                                                                                                                                                                    v450 = *(unsigned __int8 *)(v311 + v449 + 11);
                                                                                                                                                                                    v448 = 0.0;
                                                                                                                                                                                    if (v450 != 2)
                                                                                                                                                                                    {
                                                                                                                                                                                      v452 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v311, 0x2Du, v450, 0);
                                                                                                                                                                                      goto LABEL_923;
                                                                                                                                                                                    }
LABEL_921:
                                                                                                                                                                                    LOBYTE(buf) = 1;
                                                                                                                                                                                    v484 = 1;
                                                                                                                                                                                    v451 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v311, 0x2Du, 0, &buf);
                                                                                                                                                                                    v452 = *v451 + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v311, 0x2Du, 1u, &v484) - *v451) * v448);
LABEL_923:
                                                                                                                                                                                    v447 = v452;
                                                                                                                                                                                    v311 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                                                                                                                    v312 = *(float **)v311;
LABEL_924:
                                                                                                                                                                                    *(double *)&self->_enablePan = v447;
                                                                                                                                                                                    if (v312)
                                                                                                                                                                                    {
                                                                                                                                                                                      v453 = *v312;
                                                                                                                                                                                      v454 = *v312 == 1.0;
                                                                                                                                                                                      if (*(_BYTE *)(v311 + 10) && v453 != 0.0 && v453 != 1.0)
                                                                                                                                                                                      {
LABEL_931:
                                                                                                                                                                                        if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x38u, 0) & 1) != 0)
                                                                                                                                                                                          goto LABEL_934;
                                                                                                                                                                                        v455 = 1;
LABEL_933:
                                                                                                                                                                                        v456 = gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x38u, v455);
                                                                                                                                                                                        v457 = 0.0;
                                                                                                                                                                                        if (!v456)
                                                                                                                                                                                          goto LABEL_944;
LABEL_934:
                                                                                                                                                                                        if (v312)
                                                                                                                                                                                        {
                                                                                                                                                                                          v458 = *v312;
                                                                                                                                                                                          v459 = *v312 == 1.0;
                                                                                                                                                                                          if (*(_BYTE *)(v311 + 10) && v458 != 0.0 && v458 != 1.0)
                                                                                                                                                                                            goto LABEL_941;
                                                                                                                                                                                        }
                                                                                                                                                                                        else
                                                                                                                                                                                        {
                                                                                                                                                                                          v459 = 0;
                                                                                                                                                                                        }
                                                                                                                                                                                        v460 = *(unsigned __int8 *)(v311 + v459 + 11);
                                                                                                                                                                                        v458 = 0.0;
                                                                                                                                                                                        if (v460 != 2)
                                                                                                                                                                                        {
                                                                                                                                                                                          v462 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v311, 0x38u, v460, 0);
                                                                                                                                                                                          goto LABEL_943;
                                                                                                                                                                                        }
LABEL_941:
                                                                                                                                                                                        LOBYTE(buf) = 1;
                                                                                                                                                                                        v484 = 1;
                                                                                                                                                                                        v461 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v311, 0x38u, 0, &buf);
                                                                                                                                                                                        v462 = *v461 + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v311, 0x38u, 1u, &v484) - *v461) * v458);
LABEL_943:
                                                                                                                                                                                        v457 = v462;
                                                                                                                                                                                        v311 = *(_QWORD *)(*(_QWORD *)&v479 + 24);
                                                                                                                                                                                        v312 = *(float **)v311;
LABEL_944:
                                                                                                                                                                                        *(double *)&self->_alternateFramingSource = v457;
                                                                                                                                                                                        if (v312)
                                                                                                                                                                                        {
                                                                                                                                                                                          v463 = *v312;
                                                                                                                                                                                          v464 = *v312 == 1.0;
                                                                                                                                                                                          if (*(_BYTE *)(v311 + 10) && v463 != 0.0 && v463 != 1.0)
                                                                                                                                                                                          {
LABEL_951:
                                                                                                                                                                                            if ((gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x43u, 0) & 1) != 0)
                                                                                                                                                                                              goto LABEL_954;
                                                                                                                                                                                            v465 = 1;
LABEL_953:
                                                                                                                                                                                            if (!gss::RenderStyle<gss::ScenePropertyID>::hasValueForKeyAtEnd(v311, 0x43u, v465))
                                                                                                                                                                                            {
                                                                                                                                                                                              v468 = -1.0;
                                                                                                                                                                                              if (!a3)
                                                                                                                                                                                                goto LABEL_970;
                                                                                                                                                                                              goto LABEL_967;
                                                                                                                                                                                            }
LABEL_954:
                                                                                                                                                                                            if (v312)
                                                                                                                                                                                            {
                                                                                                                                                                                              v466 = *v312;
                                                                                                                                                                                              v467 = *v312 == 1.0;
                                                                                                                                                                                              if (*(_BYTE *)(v311 + 10) && v466 != 0.0 && v466 != 1.0)
                                                                                                                                                                                                goto LABEL_963;
                                                                                                                                                                                            }
                                                                                                                                                                                            else
                                                                                                                                                                                            {
                                                                                                                                                                                              v467 = 0;
                                                                                                                                                                                            }
                                                                                                                                                                                            v469 = *(unsigned __int8 *)(v311 + v467 + 11);
                                                                                                                                                                                            v466 = 0.0;
                                                                                                                                                                                            if (v469 != 2)
                                                                                                                                                                                            {
                                                                                                                                                                                              v471 = *(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v311, 0x43u, v469, 0);
                                                                                                                                                                                              v468 = v471;
                                                                                                                                                                                              if (!a3)
                                                                                                                                                                                              {
LABEL_970:
                                                                                                                                                                                                self->_routeFocusCoordinate.longitude._value = v53;
                                                                                                                                                                                                v472 = v468;
                                                                                                                                                                                                *(float *)&self->_previousSearchItemCount = v472;
                                                                                                                                                                                                -[VKNavCameraController _updateLabelMetrics](self, "_updateLabelMetrics", v478);
                                                                                                                                                                                                -[VKNavCameraController _setNeedsUpdate](self, "_setNeedsUpdate");
                                                                                                                                                                                                if (GEOGetVectorKitVKNavCameraLog_onceToken != -1)
                                                                                                                                                                                                  dispatch_once(&GEOGetVectorKitVKNavCameraLog_onceToken, &__block_literal_global_31);
                                                                                                                                                                                                v473 = (id)GEOGetVectorKitVKNavCameraLog_log;
                                                                                                                                                                                                if (os_log_type_enabled(v473, OS_LOG_TYPE_INFO))
                                                                                                                                                                                                {
                                                                                                                                                                                                  -[VKNavCameraController detailedDescription](self, "detailedDescription");
                                                                                                                                                                                                  v474 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                                                                                                                                                                                                  v475 = objc_msgSend(v474, "UTF8String");
                                                                                                                                                                                                  LODWORD(buf) = 136315138;
                                                                                                                                                                                                  *(_QWORD *)((char *)&buf + 4) = v475;
                                                                                                                                                                                                  _os_log_impl(&dword_19F029000, v473, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&buf, 0xCu);

                                                                                                                                                                                                }
LABEL_975:
                                                                                                                                                                                                gss::QueryableLocker<gss::ScenePropertyID>::~QueryableLocker((uint64_t)&v479);
                                                                                                                                                                                                v27 = v483;
                                                                                                                                                                                                if (!v483)
                                                                                                                                                                                                  return;
                                                                                                                                                                                                goto LABEL_976;
                                                                                                                                                                                              }
LABEL_966:
                                                                                                                                                                                              if (v471 > 0.0)
                                                                                                                                                                                              {
LABEL_968:
                                                                                                                                                                                                -[VKNavCameraController animateCameraWithDuration:fromFrame:completionHandler:](self, "animateCameraWithDuration:fromFrame:completionHandler:", &self->_cameraFrame, 0, v478);
                                                                                                                                                                                                goto LABEL_970;
                                                                                                                                                                                              }
LABEL_967:
                                                                                                                                                                                              if (*(float *)&self->_previousSearchItemCount <= 0.0)
                                                                                                                                                                                              {
                                                                                                                                                                                                -[VKNavCameraController returnToTrackingWithDelay:resetZoom:](self, "returnToTrackingWithDelay:resetZoom:", 1, 0.0);
                                                                                                                                                                                                goto LABEL_970;
                                                                                                                                                                                              }
                                                                                                                                                                                              goto LABEL_968;
                                                                                                                                                                                            }
LABEL_963:
                                                                                                                                                                                            LOBYTE(buf) = 1;
                                                                                                                                                                                            v484 = 1;
                                                                                                                                                                                            v470 = (float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v311, 0x43u, 0, &buf);
                                                                                                                                                                                            v471 = *v470 + (float)((float)(*(float *)gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<float>(v311, 0x43u, 1u, &v484) - *v470) * v466);
                                                                                                                                                                                            v468 = v471;
                                                                                                                                                                                            if (!a3)
                                                                                                                                                                                              goto LABEL_970;
                                                                                                                                                                                            goto LABEL_966;
                                                                                                                                                                                          }
                                                                                                                                                                                        }
                                                                                                                                                                                        else
                                                                                                                                                                                        {
                                                                                                                                                                                          v464 = 0;
                                                                                                                                                                                        }
                                                                                                                                                                                        v465 = *(unsigned __int8 *)(v311 + v464 + 11);
                                                                                                                                                                                        if (v465 != 2)
                                                                                                                                                                                          goto LABEL_953;
                                                                                                                                                                                        goto LABEL_951;
                                                                                                                                                                                      }
                                                                                                                                                                                    }
                                                                                                                                                                                    else
                                                                                                                                                                                    {
                                                                                                                                                                                      v454 = 0;
                                                                                                                                                                                    }
                                                                                                                                                                                    v455 = *(unsigned __int8 *)(v311 + v454 + 11);
                                                                                                                                                                                    if (v455 != 2)
                                                                                                                                                                                      goto LABEL_933;
                                                                                                                                                                                    goto LABEL_931;
                                                                                                                                                                                  }
                                                                                                                                                                                }
                                                                                                                                                                                else
                                                                                                                                                                                {
                                                                                                                                                                                  v444 = 0;
                                                                                                                                                                                }
                                                                                                                                                                                v445 = *(unsigned __int8 *)(v311 + v444 + 11);
                                                                                                                                                                                if (v445 != 2)
                                                                                                                                                                                  goto LABEL_913;
                                                                                                                                                                                goto LABEL_911;
                                                                                                                                                                              }
LABEL_898:
                                                                                                                                                                              LOBYTE(buf) = 1;
                                                                                                                                                                              v484 = 1;
                                                                                                                                                                              v439 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v311, 0x34u, 0, &buf);
                                                                                                                                                                              v440 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v311, 0x34u, 1u, &v484);
                                                                                                                                                                              if (v436 >= 1.0)
                                                                                                                                                                                v441 = (char *)v440;
                                                                                                                                                                              else
                                                                                                                                                                                v441 = (char *)v439;
                                                                                                                                                                              v442 = *v441;
                                                                                                                                                                              goto LABEL_903;
                                                                                                                                                                            }
                                                                                                                                                                          }
                                                                                                                                                                          else
                                                                                                                                                                          {
                                                                                                                                                                            v434 = 0;
                                                                                                                                                                          }
                                                                                                                                                                          v435 = *(unsigned __int8 *)(v311 + v434 + 11);
                                                                                                                                                                          if (v435 != 2)
                                                                                                                                                                            goto LABEL_890;
                                                                                                                                                                          goto LABEL_888;
                                                                                                                                                                        }
LABEL_875:
                                                                                                                                                                        LOBYTE(buf) = 1;
                                                                                                                                                                        v484 = 1;
                                                                                                                                                                        v429 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned char>(v311, 0x2Cu, 0, &buf);
                                                                                                                                                                        v430 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned char>(v311, 0x2Cu, 1u, &v484);
                                                                                                                                                                        if (v426 >= 1.0)
                                                                                                                                                                          v431 = (char *)v430;
                                                                                                                                                                        else
                                                                                                                                                                          v431 = (char *)v429;
                                                                                                                                                                        v432 = *v431;
                                                                                                                                                                        goto LABEL_880;
                                                                                                                                                                      }
                                                                                                                                                                    }
                                                                                                                                                                    else
                                                                                                                                                                    {
                                                                                                                                                                      v424 = 0;
                                                                                                                                                                    }
                                                                                                                                                                    v425 = *(unsigned __int8 *)(v311 + v424 + 11);
                                                                                                                                                                    if (v425 != 2)
                                                                                                                                                                      goto LABEL_867;
                                                                                                                                                                    goto LABEL_865;
                                                                                                                                                                  }
LABEL_852:
                                                                                                                                                                  LOBYTE(buf) = 1;
                                                                                                                                                                  v484 = 1;
                                                                                                                                                                  v419 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v311, 0x2Bu, 0, &buf);
                                                                                                                                                                  v420 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v311, 0x2Bu, 1u, &v484);
                                                                                                                                                                  if (v416 >= 1.0)
                                                                                                                                                                    v421 = (char *)v420;
                                                                                                                                                                  else
                                                                                                                                                                    v421 = (char *)v419;
                                                                                                                                                                  v422 = *v421;
                                                                                                                                                                  goto LABEL_857;
                                                                                                                                                                }
                                                                                                                                                              }
                                                                                                                                                              else
                                                                                                                                                              {
                                                                                                                                                                v414 = 0;
                                                                                                                                                              }
                                                                                                                                                              v415 = *(unsigned __int8 *)(v311 + v414 + 11);
                                                                                                                                                              if (v415 != 2)
                                                                                                                                                                goto LABEL_844;
                                                                                                                                                              goto LABEL_842;
                                                                                                                                                            }
LABEL_829:
                                                                                                                                                            LOBYTE(buf) = 1;
                                                                                                                                                            v484 = 1;
                                                                                                                                                            v409 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v311, 0x55u, 0, &buf);
                                                                                                                                                            v410 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v311, 0x55u, 1u, &v484);
                                                                                                                                                            if (v406 >= 1.0)
                                                                                                                                                              v411 = (int *)v410;
                                                                                                                                                            else
                                                                                                                                                              v411 = (int *)v409;
                                                                                                                                                            v412 = *v411;
                                                                                                                                                            goto LABEL_834;
                                                                                                                                                          }
                                                                                                                                                        }
                                                                                                                                                        else
                                                                                                                                                        {
                                                                                                                                                          v404 = 0;
                                                                                                                                                        }
                                                                                                                                                        v405 = *(unsigned __int8 *)(v311 + v404 + 11);
                                                                                                                                                        if (v405 != 2)
                                                                                                                                                          goto LABEL_821;
                                                                                                                                                        goto LABEL_819;
                                                                                                                                                      }
LABEL_806:
                                                                                                                                                      LOBYTE(buf) = 1;
                                                                                                                                                      v484 = 1;
                                                                                                                                                      v399 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v311, 0x2Eu, 0, &buf);
                                                                                                                                                      v400 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v311, 0x2Eu, 1u, &v484);
                                                                                                                                                      if (v396 >= 1.0)
                                                                                                                                                        v401 = (int *)v400;
                                                                                                                                                      else
                                                                                                                                                        v401 = (int *)v399;
                                                                                                                                                      v402 = *v401;
                                                                                                                                                      goto LABEL_811;
                                                                                                                                                    }
                                                                                                                                                  }
                                                                                                                                                  else
                                                                                                                                                  {
                                                                                                                                                    v394 = 0;
                                                                                                                                                  }
                                                                                                                                                  v395 = *(unsigned __int8 *)(v311 + v394 + 11);
                                                                                                                                                  if (v395 != 2)
                                                                                                                                                    goto LABEL_798;
                                                                                                                                                  goto LABEL_796;
                                                                                                                                                }
                                                                                                                                              }
                                                                                                                                              else
                                                                                                                                              {
                                                                                                                                                v386 = 0;
                                                                                                                                              }
                                                                                                                                              v387 = *(unsigned __int8 *)(v311 + v386 + 11);
                                                                                                                                              if (v387 != 2)
                                                                                                                                                goto LABEL_778;
                                                                                                                                              goto LABEL_776;
                                                                                                                                            }
LABEL_763:
                                                                                                                                            LOBYTE(buf) = 1;
                                                                                                                                            v484 = 1;
                                                                                                                                            v381 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v311, 0x31u, 0, &buf);
                                                                                                                                            v382 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v311, 0x31u, 1u, &v484);
                                                                                                                                            if (v378 >= 1.0)
                                                                                                                                              v383 = (char *)v382;
                                                                                                                                            else
                                                                                                                                              v383 = (char *)v381;
                                                                                                                                            v384 = *v383;
                                                                                                                                            goto LABEL_768;
                                                                                                                                          }
                                                                                                                                        }
                                                                                                                                        else
                                                                                                                                        {
                                                                                                                                          v376 = 0;
                                                                                                                                        }
                                                                                                                                        v377 = *(unsigned __int8 *)(v311 + v376 + 11);
                                                                                                                                        if (v377 != 2)
                                                                                                                                          goto LABEL_755;
                                                                                                                                        goto LABEL_753;
                                                                                                                                      }
LABEL_740:
                                                                                                                                      LOBYTE(buf) = 1;
                                                                                                                                      v484 = 1;
                                                                                                                                      v371 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v311, 0x32u, 0, &buf);
                                                                                                                                      v372 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v311, 0x32u, 1u, &v484);
                                                                                                                                      if (v368 >= 1.0)
                                                                                                                                        v373 = (char *)v372;
                                                                                                                                      else
                                                                                                                                        v373 = (char *)v371;
                                                                                                                                      v374 = *v373;
                                                                                                                                      goto LABEL_745;
                                                                                                                                    }
                                                                                                                                  }
                                                                                                                                  else
                                                                                                                                  {
                                                                                                                                    v366 = 0;
                                                                                                                                  }
                                                                                                                                  v367 = *(unsigned __int8 *)(v311 + v366 + 11);
                                                                                                                                  if (v367 != 2)
                                                                                                                                    goto LABEL_732;
                                                                                                                                  goto LABEL_730;
                                                                                                                                }
LABEL_717:
                                                                                                                                LOBYTE(buf) = 1;
                                                                                                                                v484 = 1;
                                                                                                                                v361 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v311, 0x30u, 0, &buf);
                                                                                                                                v362 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v311, 0x30u, 1u, &v484);
                                                                                                                                if (v358 >= 1.0)
                                                                                                                                  v363 = (char *)v362;
                                                                                                                                else
                                                                                                                                  v363 = (char *)v361;
                                                                                                                                v364 = *v363;
                                                                                                                                goto LABEL_722;
                                                                                                                              }
                                                                                                                            }
                                                                                                                            else
                                                                                                                            {
                                                                                                                              v356 = 0;
                                                                                                                            }
                                                                                                                            v357 = *(unsigned __int8 *)(v311 + v356 + 11);
                                                                                                                            if (v357 != 2)
                                                                                                                              goto LABEL_709;
                                                                                                                            goto LABEL_707;
                                                                                                                          }
LABEL_694:
                                                                                                                          LOBYTE(buf) = 1;
                                                                                                                          v484 = 1;
                                                                                                                          v351 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v311, 0x2Fu, 0, &buf);
                                                                                                                          v352 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<BOOL>(v311, 0x2Fu, 1u, &v484);
                                                                                                                          if (v348 >= 1.0)
                                                                                                                            v353 = (char *)v352;
                                                                                                                          else
                                                                                                                            v353 = (char *)v351;
                                                                                                                          v354 = *v353;
                                                                                                                          goto LABEL_699;
                                                                                                                        }
                                                                                                                      }
                                                                                                                      else
                                                                                                                      {
                                                                                                                        v346 = 0;
                                                                                                                      }
                                                                                                                      v347 = *(unsigned __int8 *)(v311 + v346 + 11);
                                                                                                                      if (v347 != 2)
                                                                                                                        goto LABEL_686;
                                                                                                                      goto LABEL_684;
                                                                                                                    }
                                                                                                                  }
                                                                                                                  else
                                                                                                                  {
                                                                                                                    v338 = 0;
                                                                                                                  }
                                                                                                                  v339 = *(unsigned __int8 *)(v311 + v338 + 11);
                                                                                                                  if (v339 != 2)
                                                                                                                    goto LABEL_666;
                                                                                                                  goto LABEL_664;
                                                                                                                }
                                                                                                              }
                                                                                                              else
                                                                                                              {
                                                                                                                v330 = 0;
                                                                                                              }
                                                                                                              v331 = *(unsigned __int8 *)(v311 + v330 + 11);
                                                                                                              if (v331 != 2)
                                                                                                                goto LABEL_646;
                                                                                                              goto LABEL_644;
                                                                                                            }
                                                                                                          }
                                                                                                          else
                                                                                                          {
                                                                                                            v322 = 0;
                                                                                                          }
                                                                                                          v323 = *(unsigned __int8 *)(v311 + v322 + 11);
                                                                                                          if (v323 != 2)
                                                                                                            goto LABEL_626;
                                                                                                          goto LABEL_624;
                                                                                                        }
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        v314 = 0;
                                                                                                      }
                                                                                                      v315 = *(unsigned __int8 *)(v311 + v314 + 11);
                                                                                                      if (v315 != 2)
                                                                                                        goto LABEL_606;
                                                                                                      goto LABEL_604;
                                                                                                    }
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    v249 = 0;
                                                                                                  }
                                                                                                  v250 = *(unsigned __int8 *)(v229 + v249 + 11);
                                                                                                  if (v250 != 2)
                                                                                                    goto LABEL_515;
                                                                                                  goto LABEL_513;
                                                                                                }
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                v241 = 0;
                                                                                              }
                                                                                              v242 = *(unsigned __int8 *)(v229 + v241 + 11);
                                                                                              if (v242 != 2)
                                                                                                goto LABEL_495;
                                                                                              goto LABEL_493;
                                                                                            }
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            v232 = 0;
                                                                                          }
                                                                                          v233 = *(unsigned __int8 *)(v229 + v232 + 11);
                                                                                          if (v233 != 2)
                                                                                            goto LABEL_475;
                                                                                          goto LABEL_473;
                                                                                        }
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        v207 = 0;
                                                                                      }
                                                                                      v208 = *(unsigned __int8 *)(v204 + v207 + 11);
                                                                                      if (v208 != 2)
                                                                                        goto LABEL_435;
                                                                                      goto LABEL_433;
                                                                                    }
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    v195 = 0;
                                                                                  }
                                                                                  v196 = *(unsigned __int8 *)(v192 + v195 + 11);
                                                                                  if (v196 != 2)
                                                                                    goto LABEL_412;
                                                                                  goto LABEL_410;
                                                                                }
                                                                              }
                                                                              else
                                                                              {
                                                                                v183 = 0;
                                                                              }
                                                                              v184 = *(unsigned __int8 *)(v146 + v183 + 11);
                                                                              if (v184 != 2)
                                                                                goto LABEL_389;
                                                                              goto LABEL_387;
                                                                            }
                                                                          }
                                                                          else
                                                                          {
                                                                            v175 = 0;
                                                                          }
                                                                          v176 = *(unsigned __int8 *)(v146 + v175 + 11);
                                                                          if (v176 != 2)
                                                                            goto LABEL_369;
                                                                          goto LABEL_367;
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        v167 = 0;
                                                                      }
                                                                      v168 = *(unsigned __int8 *)(v146 + v167 + 11);
                                                                      if (v168 != 2)
                                                                        goto LABEL_349;
                                                                      goto LABEL_347;
                                                                    }
LABEL_334:
                                                                    LOBYTE(buf) = 1;
                                                                    v484 = 1;
                                                                    v162 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v146, 0x17u, 0, &buf);
                                                                    v163 = gss::RenderStyle<gss::ScenePropertyID>::styleValueForKey<unsigned int>(v146, 0x17u, 1u, &v484);
                                                                    if (v159 >= 1.0)
                                                                      v164 = (int *)v163;
                                                                    else
                                                                      v164 = (int *)v162;
                                                                    v165 = *v164;
                                                                    goto LABEL_339;
                                                                  }
                                                                }
                                                                else
                                                                {
                                                                  v157 = 0;
                                                                }
                                                                v158 = *(unsigned __int8 *)(v146 + v157 + 11);
                                                                if (v158 != 2)
                                                                  goto LABEL_326;
                                                                goto LABEL_324;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              v149 = 0;
                                                            }
                                                            v150 = *(unsigned __int8 *)(v146 + v149 + 11);
                                                            if (v150 != 2)
                                                              goto LABEL_306;
                                                            goto LABEL_304;
                                                          }
                                                        }
                                                        else
                                                        {
                                                          v139 = 0;
                                                        }
                                                        v140 = v90[v139 + 11];
                                                        if (v140 != 2)
                                                          goto LABEL_285;
                                                        goto LABEL_283;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      v130 = 0;
                                                    }
                                                    v131 = v90[v130 + 11];
                                                    if (v131 != 2)
                                                      goto LABEL_265;
                                                    goto LABEL_263;
                                                  }
                                                }
                                                else
                                                {
                                                  v121 = 0;
                                                }
                                                v122 = v90[v121 + 11];
                                                if (v122 != 2)
                                                  goto LABEL_245;
                                                goto LABEL_243;
                                              }
                                            }
                                            else
                                            {
                                              v112 = 0;
                                            }
                                            v113 = v90[v112 + 11];
                                            if (v113 != 2)
                                              goto LABEL_225;
                                            goto LABEL_223;
                                          }
                                        }
                                      }
                                      else
                                      {
                                        v103 = 0;
                                      }
                                      v105 = v90[v103 + 11];
                                      if (v105 != 2)
                                        goto LABEL_205;
                                      goto LABEL_203;
                                    }
                                  }
                                }
                                else
                                {
                                  v93 = 0;
                                }
                                v95 = v90[v93 + 11];
                                if (v95 != 2)
                                  goto LABEL_179;
                                goto LABEL_177;
                              }
LABEL_160:
                              LOBYTE(buf) = 1;
                              v484 = 1;
                              v87 = *gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<unsigned int>(v67, v21, 0, &buf);
                              v88 = *gss::RenderStyle<gss::ScenePropertyID>::styleValueForKeyAtZ<unsigned int>(v67, v21, 1u, &v484);
                              if (v83 < 1.0)
                                LOBYTE(v88) = v87;
                              goto LABEL_164;
                            }
                          }
                        }
                        else
                        {
                          v80 = 0;
                        }
                        v82 = *(unsigned __int8 *)(v67 + v80 + 11);
                        if (v82 != 2)
                          goto LABEL_149;
                        goto LABEL_147;
                      }
                    }
                  }
                  else
                  {
                    v70 = 0;
                  }
                  v72 = *(unsigned __int8 *)(v67 + v70 + 11);
                  if (v72 != 2)
                    goto LABEL_123;
                  goto LABEL_121;
                }
              }
            }
            else
            {
              v36 = 0;
            }
            v38 = *(unsigned __int8 *)(v20 + v36 + 11);
            if (v38 != 2)
              goto LABEL_68;
            goto LABEL_66;
          }
        }
      }
      else
      {
        v24 = 0;
      }
      v28 = *(unsigned __int8 *)(v20 + v24 + 11);
      if (v28 != 2)
        goto LABEL_42;
      goto LABEL_40;
    }
    gss::QueryableLocker<gss::ScenePropertyID>::~QueryableLocker((uint64_t)&v479);
  }
  data = &self->_currentStyleName;
  if (*((char *)&self->_currentStyleName.__r_.__value_.var0.__l + 23) < 0)
  {
    self->_currentStyleName.__r_.__value_.var0.__l.__size_ = 4;
    data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)data->__r_.__value_.var0.__l.__data_;
  }
  else
  {
    *((_BYTE *)&self->_currentStyleName.__r_.__value_.var0.__l + 23) = 4;
  }
  strcpy(data->__r_.__value_.var0.__s.__data_, "None");
  self->_routeFocusCoordinate.longitude._value = 0.0;
  LODWORD(self->_previousSearchItemCount) = -1082130432;
  v27 = v483;
  if (v483)
  {
LABEL_976:
    v476 = (unint64_t *)&v27->__shared_owners_;
    do
      v477 = __ldaxr(v476);
    while (__stlxr(v477 - 1, v476));
    if (!v477)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
}

- (void)_updateStyles
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  gss::Allocator *v10;
  uint64_t v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  void *v19;
  double v20;
  double v21;
  uint64_t v22;
  unsigned int v23;
  float *v24;
  float v25;
  _BOOL4 v26;
  unsigned int v28;
  float v29;
  _BOOL4 v30;
  unsigned int v32;
  float v33;
  float v34;
  double v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  unint64_t v42;
  std::__shared_weak_count *v43;
  __int128 v44;
  _QWORD v45[2];
  char v46;
  unint64_t v47;
  std::__shared_weak_count *v48;
  uint64_t v49;
  std::__shared_weak_count *v50;
  _QWORD *v51;
  _QWORD *v52;
  char *v53;
  uint64_t v54;
  char v55;

  v3 = gss::Allocator::instance((gss::Allocator *)self);
  v4 = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v3 + 16))(v3, 8, 4);
  v5 = v4;
  if (v4)
    *v4 = 0xE00000005;
  v51 = 0;
  v52 = 0;
  v53 = 0;
  v54 = v3;
  v6 = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v3 + 16))(v3, 8, 4);
  v51 = v6;
  v53 = (char *)(v6 + 1);
  if (v6)
    *v6 = *v5;
  v52 = v6 + 1;
  gss::FeatureAttributeSet::sort((gss::FeatureAttributeSet *)&v51);
  if (v5)
    (*(void (**)(uint64_t, _QWORD *, uint64_t))(*(_QWORD *)v3 + 40))(v3, v5, 8);
  -[VKNavCameraController sceneConfiguration](self, "sceneConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "styleManager");
  }
  else
  {
    v49 = 0;
    v50 = 0;
  }

  v9 = v49;
  if (v49)
  {
    *(_QWORD *)((char *)&v44 + 7) = 0;
    *(_QWORD *)&v44 = 0;
    HIBYTE(v44) = 1;
    *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[](&v44, 0x10000u) = 3;
    gss::StylesheetManager<gss::PropertyID>::styleQueryForFeatureAttributes(&v47, v9, (gss::FeatureAttributeSet *)&v51, (gss::QueryOverrides *)&v44);
    if (!BYTE14(v44) && (_QWORD)v44)
    {
      v11 = gss::Allocator::instance(v10);
      (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v11 + 40))(v11, v44, WORD6(v44));
    }
    v12 = v47;
    v13 = v48;
    v42 = v47;
    v43 = v48;
    if (v48)
    {
      p_shared_owners = (unint64_t *)&v48->__shared_owners_;
      do
        v15 = __ldxr(p_shared_owners);
      while (__stxr(v15 + 1, p_shared_owners));
      *((_QWORD *)&v44 + 1) = v13;
      do
        v16 = __ldxr(p_shared_owners);
      while (__stxr(v16 + 1, p_shared_owners));
    }
    else
    {
      *((_QWORD *)&v44 + 1) = 0;
    }
    v45[0] = 0;
    v45[1] = 0;
    *(_QWORD *)&v44 = v12;
    v46 = 0;
    if (v12)
      LOBYTE(v12) = (*(uint64_t (**)(unint64_t, _QWORD *))(*(_QWORD *)v12 + 48))(v12, v45);
    v46 = v12;
    if (v13)
    {
      v17 = (unint64_t *)&v13->__shared_owners_;
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    -[VKCameraController vkCamera](self, "vkCamera", v42, v43);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "displayZoomLevel");
    v21 = v20;

    if (!v46)
      goto LABEL_60;
    v22 = *(_QWORD *)(v44 + 24);
    if ((int)v21 >= 0x17)
      v23 = 23;
    else
      v23 = (int)v21;
    v24 = *(float **)v22;
    if (*(_QWORD *)v22)
    {
      v25 = *v24;
      v26 = *v24 == 1.0;
      if (*(_BYTE *)(v22 + 10))
      {
        if (v25 != 0.0 && v25 != 1.0)
        {
LABEL_42:
          if ((gss::RenderStyle<gss::PropertyID>::hasValueForKeyAtZAtEnd(*(_QWORD *)(v44 + 24), 0xFAu, v23, 0) & 1) != 0)
            goto LABEL_45;
          v28 = 1;
LABEL_44:
          if (!gss::RenderStyle<gss::PropertyID>::hasValueForKeyAtZAtEnd(v22, 0xFAu, v23, v28))
          {
LABEL_60:
            gss::QueryableLocker<gss::PropertyID>::~QueryableLocker((uint64_t)&v44);
            v36 = v48;
            if (v48)
            {
              v37 = (unint64_t *)&v48->__shared_owners_;
              do
                v38 = __ldaxr(v37);
              while (__stlxr(v38 - 1, v37));
              if (!v38)
              {
                ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
                std::__shared_weak_count::__release_weak(v36);
              }
            }
            goto LABEL_65;
          }
LABEL_45:
          if (v24)
          {
            v29 = *v24;
            v30 = *v24 == 1.0;
            if (*(_BYTE *)(v22 + 10))
            {
              if (v29 != 0.0 && v29 != 1.0)
                goto LABEL_56;
            }
          }
          else
          {
            v30 = 0;
          }
          v32 = *(unsigned __int8 *)(v22 + v30 + 11);
          v29 = 0.0;
          if (v32 != 2)
          {
            v34 = *(float *)gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<float>(v22, 0xFAu, v23, v32, 0);
LABEL_58:
            v35 = v34 * 0.5;
            if (v35 != self->_minHeightDeltaChangeVertical)
            {
              self->_minHeightDeltaChangeVertical = v35;
              -[VKNavCameraController _setNeedsUpdate](self, "_setNeedsUpdate");
            }
            goto LABEL_60;
          }
LABEL_56:
          LOBYTE(v42) = 1;
          v55 = 1;
          v33 = *(float *)gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<float>(v22, 0xFAu, v23, 0, &v42);
          v34 = v33
              + (float)((float)(*(float *)gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<float>(v22, 0xFAu, v23, 1u, &v55)- v33)* v29);
          goto LABEL_58;
        }
      }
    }
    else
    {
      v26 = 0;
    }
    v28 = *(unsigned __int8 *)(v22 + v26 + 11);
    if (v28 != 2)
      goto LABEL_44;
    goto LABEL_42;
  }
LABEL_65:
  v39 = v50;
  if (v50)
  {
    v40 = (unint64_t *)&v50->__shared_owners_;
    do
      v41 = __ldaxr(v40);
    while (__stlxr(v41 - 1, v40));
    if (!v41)
    {
      ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
      std::__shared_weak_count::__release_weak(v39);
    }
  }
  if (v51)
  {
    v52 = v51;
    (*(void (**)(uint64_t, _QWORD *, int64_t))(*(_QWORD *)v54 + 40))(v54, v51, v53 - (char *)v51);
  }
}

- (void)_updateLabelMetrics
{
  void *v3;
  uint64_t v4;
  int8x8_t *v5;
  int8x8_t v6;
  uint8x8_t v7;
  uint64_t v8;
  int8x8_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v32;
  void *v33;
  uint64_t v34;

  -[VKNavCameraController screenCanvas](self, "screenCanvas");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mapEngine");

  if (!v4)
    return;
  v5 = *(int8x8_t **)(v4 + 1120);
  if (!v5)
    return;
  v6 = v5[2];
  if (!*(_QWORD *)&v6)
    return;
  v7 = (uint8x8_t)vcnt_s8(v6);
  v7.i16[0] = vaddlv_u8(v7);
  if (v7.u32[0] > 1uLL)
  {
    v8 = 0x2FED70A4459DFCA1;
    if (*(_QWORD *)&v6 <= 0x2FED70A4459DFCA1uLL)
      v8 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v6;
  }
  else
  {
    v8 = (*(_QWORD *)&v6 - 1) & 0x2FED70A4459DFCA1;
  }
  v9 = v5[1];
  v10 = *(_QWORD **)(*(_QWORD *)&v9 + 8 * v8);
  if (!v10)
    return;
  v11 = (_QWORD *)*v10;
  if (!*v10)
    return;
  v12 = *(_QWORD *)&v6 - 1;
  if (v7.u32[0] < 2uLL)
  {
    while (1)
    {
      v13 = v11[1];
      if (v13 == 0x2FED70A4459DFCA1)
      {
        if (v11[2] == 0x2FED70A4459DFCA1)
          goto LABEL_24;
      }
      else if ((v13 & v12) != v8)
      {
        return;
      }
      v11 = (_QWORD *)*v11;
      if (!v11)
        return;
    }
  }
  while (1)
  {
    v14 = v11[1];
    if (v14 == 0x2FED70A4459DFCA1)
      break;
    if (v14 >= *(_QWORD *)&v6)
      v14 %= *(_QWORD *)&v6;
    if (v14 != v8)
      return;
LABEL_18:
    v11 = (_QWORD *)*v11;
    if (!v11)
      return;
  }
  if (v11[2] != 0x2FED70A4459DFCA1)
    goto LABEL_18;
LABEL_24:
  v15 = v11[5];
  if (!v15)
    return;
  if (v7.u32[0] > 1uLL)
  {
    v16 = 0x20A1ED17D78F322BLL;
    if (*(_QWORD *)&v6 <= 0x20A1ED17D78F322BuLL)
      v16 = 0x20A1ED17D78F322BuLL % *(_QWORD *)&v6;
  }
  else
  {
    v16 = v12 & 0x20A1ED17D78F322BLL;
  }
  v17 = *(_QWORD **)(*(_QWORD *)&v9 + 8 * v16);
  if (!v17)
    return;
  v18 = (_QWORD *)*v17;
  if (!v18)
    return;
  if (v7.u32[0] < 2uLL)
  {
    while (1)
    {
      v19 = v18[1];
      if (v19 == 0x20A1ED17D78F322BLL)
      {
        if (v18[2] == 0x20A1ED17D78F322BLL)
          goto LABEL_45;
      }
      else if ((v19 & v12) != v16)
      {
        return;
      }
      v18 = (_QWORD *)*v18;
      if (!v18)
        return;
    }
  }
  while (2)
  {
    v20 = v18[1];
    if (v20 != 0x20A1ED17D78F322BLL)
    {
      if (v20 >= *(_QWORD *)&v6)
        v20 %= *(_QWORD *)&v6;
      if (v20 != v16)
        return;
      goto LABEL_39;
    }
    if (v18[2] != 0x20A1ED17D78F322BLL)
    {
LABEL_39:
      v18 = (_QWORD *)*v18;
      if (!v18)
        return;
      continue;
    }
    break;
  }
LABEL_45:
  v21 = v18[5];
  if (!v21)
    return;
  v22 = *(unsigned __int8 *)(v15 + 163);
  v23 = *(_QWORD *)(**(_QWORD **)(v21 + 144) + 40);
  v24 = *(unsigned __int8 *)(v23 + 1);
  v25 = *(unsigned __int8 *)(v23 + 48);
  v26 = *(_QWORD *)&self->_isElevatedRoute;
  if (v26)
  {
    if ((v22 != 0) == (*(_BYTE *)(v26 + 24) != 0)
      && v24 == *(unsigned __int8 *)(v26 + 25)
      && v25 == *(unsigned __int8 *)(v26 + 26))
    {
      return;
    }
  }
  else
  {
    v26 = operator new();
    *(_QWORD *)(v26 + 8) = 0;
    *(_QWORD *)(v26 + 16) = 0;
    *(_QWORD *)v26 = 0;
    *(_BYTE *)(v26 + 24) = 0;
    *(_WORD *)(v26 + 25) = 260;
    __asm { FMOV            V0.2S, #1.0 }
    *(_QWORD *)(v26 + 28) = _D0;
    v32 = *(_QWORD *)&self->_isElevatedRoute;
    *(_QWORD *)&self->_isElevatedRoute = v26;
    if (v32)
    {
      v33 = *(void **)v32;
      if (*(_QWORD *)v32)
      {
        *(_QWORD *)(v32 + 8) = v33;
        v34 = v32;
        operator delete(v33);
        v32 = v34;
      }
      MEMORY[0x1A1AF4E00](v32, 0x1020C4040A25C38);
      v26 = *(_QWORD *)&self->_isElevatedRoute;
    }
  }
  *(_BYTE *)(v26 + 24) = v22 != 0;
  *(_BYTE *)(v26 + 25) = v24;
  *(_BYTE *)(v26 + 26) = v25;
  if (!*(_QWORD *)(v15 + 256))
    md::StyleLogic::updateConfiguration((md::StyleLogic *)v15, *(_DWORD *)(v15 + 1096));
  md::LabelMetrics::initialize(v26, (uint64_t *)(v15 + 256));
}

- (id)detailedDescription
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("Nav Camera Controller\n"));
  v7.receiver = self;
  v7.super_class = (Class)VKNavCameraController;
  -[VKCameraController detailedDescription](&v7, sel_detailedDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v4);

  -[VKNavCameraController _debugText:showNavCameraDebugConsoleAttributes:includeSensitiveAttributes:](self, "_debugText:showNavCameraDebugConsoleAttributes:includeSensitiveAttributes:", 1, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v5);

  return v3;
}

- (id)_debugText:(BOOL)a3 showNavCameraDebugConsoleAttributes:(BOOL)a4 includeSensitiveAttributes:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  id v9;
  void *v10;
  __int16 *data;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_currentStyleName;
  double v13;
  void *v14;
  uint64_t v15;
  unint64_t lastTargetStyleIdentifier;
  uint64_t v17;
  double maxHeightDeltaChangeVertical;
  double v19;
  double halfPuckSize;
  double v21;
  double v22;
  double v23;
  const char *v24;
  const char *v25;
  double value;
  double v27;
  double v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  char *v33;
  double maxFramingDistance;
  const char *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  id WeakRetained;
  void *v45;
  uint64_t v46;
  pthread_rwlock_t *v47;
  geo::read_write_lock *v48;
  const char *v49;
  geo::read_write_lock *v50;
  const char *v51;
  unsigned int v52;
  char *v53;
  int *v54;
  unsigned int v55;
  char *v56;
  const char *v57;
  unsigned int v58;
  uint64_t v59;
  std::__shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  std::__shared_weak_count *v63;
  unint64_t *p_shared_owners;
  unint64_t v65;
  void *v67[2];
  char v68;
  char v69;
  void *__p[2];
  char v71;
  char v72;
  _QWORD v73[5];
  uint64_t v74;
  std::__shared_weak_count *v75;
  uint64_t v76;
  char v77;
  double v78[9];

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v10 = v9;
  data = (__int16 *)self->_currentStyleName.__r_.__value_.var0.__s.__data_;
  p_currentStyleName = &self->_currentStyleName;
  if (*((char *)&self->_currentStyleName.__r_.__value_.var0.__l + 23) < 0)
    p_currentStyleName = *(basic_string<char, std::char_traits<char>, std::allocator<char>> **)data;
  objc_msgSend(v9, "appendFormat:", CFSTR("Style Name: %s\n"), p_currentStyleName);
  v13 = gdc::ViewDataAccess::rigidTransformForFrame(v78, **(_BYTE **)(-[VKCameraController mapDataAccess](self, "mapDataAccess") + 16), &self->_cameraFrame._target.latitude._value);
  if (v7)
  {
    objc_msgSend(v10, "appendFormat:", CFSTR("Camera\n"), v13);
    if (v5)
    {
      objc_msgSend(v10, "appendFormat:", CFSTR("\tLat: %f, Long: %f, Altitude: %f\n"), *(_QWORD *)&self->_cameraFrame._target.latitude._value, *(_QWORD *)&self->_cameraFrame._target.longitude._value, *(_QWORD *)&self->_cameraFrame._target.altitude._value);
      objc_msgSend(v10, "appendFormat:", CFSTR("\tHeight off Puck (Lat): %.2f\n"), self->_cameraFrame._distanceFromTarget._value * cos(self->_pitchSpring._position));
    }
    objc_msgSend(v10, "appendFormat:", CFSTR("\tPitch: %.2f\n"), self->_cameraFrame._pitch._value * 57.2957795);
    objc_msgSend(v10, "appendFormat:", CFSTR("\tHeading: %.2f\n"), self->_cameraFrame._heading._value * 57.2957795);
    objc_msgSend(v10, "appendFormat:", CFSTR("\tCoordinates to frame: %lu\n"), 0xAAAAAAAAAAAAAAABLL * ((self->_currentStyleName.var0 - *(_QWORD *)&self->_currentStyleName.__r_.var0) >> 3));
    objc_msgSend(v10, "appendFormat:", CFSTR("\tComputed Maneuvers To Frame: %d\n"), BYTE1(self->_coordinatesToFrame.__end_));
    objc_msgSend(v10, "appendFormat:", CFSTR("\tSegments To Frame: %d\n"), BYTE3(self->_coordinatesToFrame.__end_));
    -[VKCameraController vkCamera](self, "vkCamera");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displayZoomLevel");
    objc_msgSend(v10, "appendFormat:", CFSTR("\tZoom Level: %f\n"), v15);

    lastTargetStyleIdentifier = self->_lastTargetStyleIdentifier;
    -[VKNavCameraController zoomScale](self, "zoomScale");
    objc_msgSend(v10, "appendFormat:", CFSTR("\tZoom Scale: (%f, %f), Min: %f, Max: %f\n"), lastTargetStyleIdentifier, v17, *(_QWORD *)&self->_minZoomScale, *(_QWORD *)&self->_maxZoomScale);
    objc_msgSend(v10, "appendFormat:", CFSTR("\tPuck Course: %f\n"), self->_puckCourse._value * 57.2957795);
    objc_msgSend(v10, "appendFormat:", CFSTR("\tDisplay Rate: (requested: %ld, avg:%.f) - Pixel Change: %f\n"), *(_QWORD *)&self->_requesteDisplayRateSampler._sum, *(_QWORD *)&self->_requesteDisplayRateSampler._min, *(_QWORD *)&self->_pixelSamples._min);
    objc_msgSend(v10, "appendFormat:", CFSTR("\tViewable Screen Rect: "));
    maxHeightDeltaChangeVertical = self->_maxHeightDeltaChangeVertical;
    if (self->_viewableScreenRect._minimum._e[0] >= maxHeightDeltaChangeVertical
      && (v19 = self->_viewableScreenRect._minimum._e[1], halfPuckSize = self->_halfPuckSize, v19 >= halfPuckSize))
    {
      objc_msgSend(v10, "appendFormat:", CFSTR("(Min: %f, %f), (Max: %f, %f)\n"), *(_QWORD *)&maxHeightDeltaChangeVertical, *(_QWORD *)&halfPuckSize, *(_QWORD *)&self->_viewableScreenRect._minimum._e[0], *(_QWORD *)&v19);
    }
    else
    {
      objc_msgSend(v10, "appendFormat:", CFSTR("Empty\n"));
    }
    objc_msgSend(v10, "appendFormat:", CFSTR("\tFraming Screen Rect: "));
    v21 = self->_viewableScreenRect._maximum._e[0];
    if (self->_framingScreenRect._minimum._e[0] >= v21
      && (v22 = self->_framingScreenRect._minimum._e[1], v23 = self->_viewableScreenRect._maximum._e[1], v22 >= v23))
    {
      objc_msgSend(v10, "appendFormat:", CFSTR("(Min: %f, %f), (Max: %f, %f)\n"), *(_QWORD *)&v21, *(_QWORD *)&v23, *(_QWORD *)&self->_framingScreenRect._minimum._e[0], *(_QWORD *)&v22);
    }
    else
    {
      objc_msgSend(v10, "appendFormat:", CFSTR("Empty\n"));
    }
    if (self->_isDetached)
      v24 = "Y";
    else
      v24 = "N";
    objc_msgSend(v10, "appendFormat:", CFSTR("\tDetached: %s"), v24);
    if (-[VKAnimation running](self->_transitionAnimation, "running"))
      v25 = "Y";
    else
      v25 = "N";
    objc_msgSend(v10, "appendFormat:", CFSTR(" Transitioning: %s\n"), v25);
    value = self->_puckCoordinate.latitude._value;
    v27 = self->_puckCoordinate.longitude._value;
    v28 = self->_puckCoordinate.altitude._value;
    objc_msgSend(v10, "appendFormat:", CFSTR("Springs:\n"));
    if (v5)
      objc_msgSend(v10, "appendFormat:", CFSTR("\tPuck Lat: %f, Long: %f, Alt: %f\n"), value * 57.2957795, v27 * 57.2957795, *(_QWORD *)&v28);
    objc_msgSend(v10, "appendFormat:", CFSTR("\tPitch: %.2f => %.2f\n"), self->_pitchSpring._position * 57.2957795, self->_pitchSpring._restingPosition * 57.2957795);
    objc_msgSend(v10, "appendFormat:", CFSTR("\tHeading: %.2f => %.2f\n"), self->_headingSpring._position * 57.2957795, self->_headingSpring._restingPosition * 57.2957795);
    objc_msgSend(v10, "appendFormat:", CFSTR("\tDistance From Target: %.2fm => %.2fm\n"), *(_QWORD *)&self->_distanceFromTargetSpring._position, *(_QWORD *)&self->_distanceFromTargetSpring._restingPosition);
    objc_msgSend(v10, "appendFormat:", CFSTR("\tScreen Pos: %.2f, %.2f  => %.2f, %.2f\n"), *(_QWORD *)&self->_screenPositionSpring._position._e[0], *(_QWORD *)&self->_screenPositionSpring._position._e[1], *(_QWORD *)&self->_screenPositionSpring._restingPosition._e[0], *(_QWORD *)&self->_screenPositionSpring._restingPosition._e[1]);
    objc_msgSend(*(id *)&self->_maxFramingDistance, "route");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
      v30 = "Y";
    else
      v30 = "N";
    objc_msgSend(v10, "appendFormat:", CFSTR("Route: %s\n"), v30);
    if (v29)
    {
      objc_msgSend(v10, "appendFormat:", CFSTR("\tSteps: %lu\n"), objc_msgSend(v29, "stepsCount"));
      objc_msgSend(v10, "appendFormat:", CFSTR("\tCurrent Step: %ld\n"), objc_msgSend(*(id *)&self->_maxFramingDistance, "currentStepIndex"));
      objc_msgSend(v10, "appendFormat:", CFSTR("\tGrouped Maneuvers: %lu\n"), objc_msgSend(*(id *)&self->_maxFramingDistance, "groupedManeuverCount"));
    }
    objc_msgSend(*(id *)&self->_maxFramingDistance, "routeMatch");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
      v32 = "Y";
    else
      v32 = "N";
    objc_msgSend(v10, "appendFormat:", CFSTR("RouteMatch: %s\n"), v32);
    if (v29)
    {
      v33 = objc_msgSend(v31, "isGoodMatch") ? "Y" : "N";
      objc_msgSend(v10, "appendFormat:", CFSTR("\tisGoodMatch: %s\n"), v33);
      objc_msgSend(v10, "appendFormat:", CFSTR("\tStep: %lu\n"), objc_msgSend(v31, "stepIndex"));
      if (v5)
        objc_msgSend(v10, "appendFormat:", CFSTR("\tLocation Lat: %f, Long: %f\n"), *(_QWORD *)&self->_framingDistanceAfterManeuver, self->_navContext);
    }
    v74 = 0;
    v75 = (std::__shared_weak_count *)&v74;
    v76 = 0x2020000000;
    maxFramingDistance = self->_maxFramingDistance;
    v77 = 0;
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __106__VKNavCameraController_Debug___debugText_showNavCameraDebugConsoleAttributes_includeSensitiveAttributes___block_invoke;
    v73[3] = &unk_1E42EF788;
    v73[4] = &v74;
    objc_msgSend(*(id *)&maxFramingDistance, "enumerateAdditionalRoutesToFrameUsingBlock:", v73);
    objc_msgSend(v10, "appendFormat:", CFSTR("Alternate Routes: %d\n"), LOBYTE(v75[1].__vftable));
    objc_msgSend(v10, "appendFormat:", CFSTR("Style:\n"));
    if (*((char *)&self->_currentStyleName.__r_.__value_.var0.__l + 23) < 0)
      data = *(__int16 **)data;
    objc_msgSend(v10, "appendFormat:", CFSTR("\tName: %s\n"), data);
    if (self->_cameraType == 1)
    {
      v72 = 7;
      strcpy((char *)__p, "Framing");
    }
    else if (self->_cameraType)
    {
      v72 = 0;
      LOBYTE(__p[0]) = 0;
    }
    else
    {
      v72 = 8;
      strcpy((char *)__p, "Tracking");
    }
    objc_msgSend(v10, "appendFormat:", CFSTR("\tCamera Type: %s\n"), __p);
    if (v72 < 0)
      operator delete(__p[0]);
    if (objc_msgSend(*(id *)&self->_maxFramingDistance, "navigationCameraHeadingOverride"))
      v35 = "YES";
    else
      v35 = "NO";
    switch(-[VKNavCameraController cameraHeadingType](self, "cameraHeadingType"))
    {
      case 0u:
        v72 = 5;
        strcpy((char *)__p, "North");
        break;
      case 1u:
        v72 = 6;
        strcpy((char *)__p, "Course");
        break;
      case 2u:
        v72 = 5;
        strcpy((char *)__p, "Route");
        break;
      case 3u:
        v72 = 11;
        strcpy((char *)__p, "Destination");
        break;
      default:
        v72 = 0;
        LOBYTE(__p[0]) = 0;
        break;
    }
    objc_msgSend(v10, "appendFormat:", CFSTR("\tHeading Type(Overriden: %s): %s\n"), v35, __p);
    if (v72 < 0)
      operator delete(__p[0]);
    objc_msgSend(v10, "appendFormat:", CFSTR("\tHeading Delta : %.2f\n"), self->_headingDelta._value * 57.2957795);
    objc_msgSend(v10, "appendFormat:", CFSTR("\tHeading Delta Min: %.2f\n"), self->_headingMinDelta._value * 57.2957795);
    objc_msgSend(v10, "appendFormat:", CFSTR("\tPuckScreenPosition: %f, %f\n"), self->_puckMovementBoundsMin._e[0], self->_puckMovementBoundsMin._e[1]);
    objc_msgSend(v10, "appendFormat:", CFSTR("\tPuck Movement Bounds: %.2f, %.2f - %.2f, %.2f\n"), self->_clientFramingInsets.top, self->_clientFramingInsets.left, self->_clientFramingInsets.bottom, self->_clientFramingInsets.right);
    objc_msgSend(v10, "appendFormat:", CFSTR("\tPitch: %.2f\n"), self->_cameraPitch._value * 57.2957795);
    objc_msgSend(v10, "appendFormat:", CFSTR("\tMin/Max Pitch: %.2f, %.2f\n"), self->_minCameraHeight * 57.2957795, self->_maxCameraHeight * 57.2957795);
    objc_msgSend(v10, "appendFormat:", CFSTR("\tDistanceFromTarget: %.2fm\n"), *(_QWORD *)&self->_cameraDistanceFromTarget._value);
    objc_msgSend(v10, "appendFormat:", CFSTR("\tMin Camera Height: %.2fm\n"), self->_coordinatesToFrame.__end_cap_.__value_);
    objc_msgSend(v10, "appendFormat:", CFSTR("\tMax Camera Height: %.2fm\n"), *(_QWORD *)&self->_styleManeuversToFrame);
    objc_msgSend(v10, "appendFormat:", CFSTR("\tHeight Delta: H(%.2f, %.2f), V(%.2f, %.2f)\n"), *(_QWORD *)&self->_puckMovementBoundsMax, *(_QWORD *)&self->_idealPuckScreenPosition, *(_QWORD *)&self->_minHeightDeltaChangeHorizontal, *(_QWORD *)&self->_maxHeightDeltaChangeHorizontal);
    objc_msgSend(v10, "appendFormat:", CFSTR("\tFraming Insets: (%.2f + %.2f), (%.2f + %.2f) - (%.2f + %.2f), (%.2f + %.2f)\n"), self->_framingEdgeInset.left, self->_previousMapEdgeInsets.left, self->_framingEdgeInset.right, self->_previousMapEdgeInsets.right, self->_framingEdgeInset.top, self->_previousMapEdgeInsets.top, self->_framingEdgeInset.bottom, self->_previousMapEdgeInsets.bottom);
    if (LOBYTE(self->_framingScreenRect._maximum._e[0]))
      v36 = "Y";
    else
      v36 = "N";
    if (BYTE1(self->_framingScreenRect._maximum._e[0]))
      v37 = "Y";
    else
      v37 = "N";
    if (BYTE3(self->_framingScreenRect._maximum._e[0]))
      v38 = "Y";
    else
      v38 = "N";
    if (BYTE2(self->_framingScreenRect._maximum._e[0]))
      v39 = "Y";
    else
      v39 = "N";
    objc_msgSend(v10, "appendFormat:", CFSTR("\tGesture Enable pan:%s zoom:%s rotate:%s pitch:%s\n"), v36, v37, v38, v39);
    objc_msgSend(v10, "appendFormat:", CFSTR("\tPan Return Delay: %.2fs\n"), *((float *)self->_framingScreenRect._maximum._e + 1));
    switch(LOBYTE(self->_framingScreenRect._maximum._e[1]))
    {
      case 0:
        v72 = 4;
        strcpy((char *)__p, "None");
        break;
      case 1:
        v72 = 9;
        strcpy((char *)__p, "Incidents");
        break;
      case 2:
        v72 = 13;
        strcpy((char *)__p, "SearchResults");
        break;
      case 3:
        v72 = 16;
        v40 = "AdditionalRoutes";
        goto LABEL_76;
      case 4:
        v72 = 14;
        strcpy((char *)__p, "NextTrafficEnd");
        break;
      case 5:
        v72 = 16;
        v40 = "VehiclePositions";
LABEL_76:
        *(_OWORD *)__p = *(_OWORD *)v40;
        v71 = 0;
        break;
      default:
        v72 = 0;
        LOBYTE(__p[0]) = 0;
        break;
    }
    switch(BYTE1(self->_framingScreenRect._maximum._e[1]))
    {
      case 0:
        v69 = 4;
        strcpy((char *)v67, "None");
        break;
      case 1:
        v69 = 9;
        strcpy((char *)v67, "Incidents");
        break;
      case 2:
        v69 = 13;
        strcpy((char *)v67, "SearchResults");
        break;
      case 3:
        v69 = 16;
        v41 = "AdditionalRoutes";
        goto LABEL_85;
      case 4:
        v69 = 14;
        strcpy((char *)v67, "NextTrafficEnd");
        break;
      case 5:
        v69 = 16;
        v41 = "VehiclePositions";
LABEL_85:
        *(_OWORD *)v67 = *(_OWORD *)v41;
        v68 = 0;
        break;
      default:
        v69 = 0;
        LOBYTE(v67[0]) = 0;
        break;
    }
    objc_msgSend(v10, "appendFormat:", CFSTR("\tFraming Source: primary=%s secondary=%s\n"), __p, v67);
    if (v69 < 0)
    {
      operator delete(v67[0]);
      if ((v72 & 0x80000000) == 0)
        goto LABEL_88;
    }
    else if ((v72 & 0x80000000) == 0)
    {
LABEL_88:
      objc_msgSend(v10, "appendFormat:", CFSTR("\tMax Framing Distance: %f\n"), *(_QWORD *)&self->_enablePan);
      objc_msgSend(v10, "appendFormat:", CFSTR("\tManeuvers To Frame: %d\n"), LOBYTE(self->_coordinatesToFrame.__end_));
      objc_msgSend(v10, "appendFormat:", CFSTR("\tFraming Distance After Maneuver: %f\n"), *(_QWORD *)&self->_alternateFramingSource);
      objc_msgSend(v10, "appendFormat:", CFSTR("\tMax Maneuver: %d\n"), BYTE1(self->_locationCoordinate.longitude));
      if (LOBYTE(self->_locationCoordinate.longitude))
        v42 = "Y";
      else
        v42 = "N";
      objc_msgSend(v10, "appendFormat:", CFSTR("\tFrame Grouped Maneuvers: %s\n"), v42);
      if (BYTE2(self->_locationCoordinate.longitude))
        v43 = "Y";
      else
        v43 = "N";
      objc_msgSend(v10, "appendFormat:", CFSTR("\tIgnore Points Behind: %s\n"), v43);
      objc_msgSend(v10, "appendFormat:", CFSTR("\tFar Clip Plane Factor: %.2f\n"), *(_QWORD *)&self->_lastProjectedPosition._e[1]);
      _Block_object_dispose(&v74, 8);

      goto LABEL_95;
    }
    operator delete(__p[0]);
    goto LABEL_88;
  }
LABEL_95:
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_cameraMode);
    v45 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "sceneClientStyleState");
    }
    else
    {
      v74 = 0;
      v75 = 0;
    }

    -[VKNavCameraController _getActiveSceneManager](self, "_getActiveSceneManager");
    if (v74)
    {
      objc_msgSend(v10, "appendFormat:", CFSTR("Client Attributes:\n"));
      v46 = v74;
      v47 = (pthread_rwlock_t *)(v74 + 16);
      *(_QWORD *)&v78[7] = v74 + 16;
      v48 = (geo::read_write_lock *)pthread_rwlock_rdlock((pthread_rwlock_t *)(v74 + 16));
      if ((_DWORD)v48)
        geo::read_write_lock::logFailure(v48, (uint64_t)"read lock", v49);
      *(void **)((char *)v67 + 7) = 0;
      v67[0] = 0;
      HIBYTE(v67[1]) = 1;
      geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::copy(v67, v46 + 216);
      v50 = (geo::read_write_lock *)pthread_rwlock_unlock(v47);
      if ((_DWORD)v50)
        geo::read_write_lock::logFailure(v50, (uint64_t)"unlock", v51);
      v52 = WORD1(v67[1]);
      v53 = (char *)v67[0];
      if (WORD1(v67[1]))
      {
        v54 = 0;
        v55 = 0;
        v56 = (char *)v67[0] + LOWORD(v67[1]);
        do
        {
          if (v55 < v52)
          {
            v54 = (int *)&v53[4 * v55];
            data = (__int16 *)&v56[2 * v55];
          }
          v57 = gss::to_string(*v54);
          v50 = (geo::read_write_lock *)objc_msgSend(v10, "appendFormat:", CFSTR("\t%s: %s\n"), v57, gss::to_string(*v54, *data));
          v58 = v55 + 1;
          if (v55 + 1 < v52)
            ++v55;
          else
            v55 = v52;
        }
        while (v58 < v52);
      }
      if (!BYTE6(v67[1]) && v53)
      {
        v59 = gss::Allocator::instance(v50);
        (*(void (**)(uint64_t, char *, _QWORD))(*(_QWORD *)v59 + 40))(v59, v53, WORD2(v67[1]));
      }
    }
    v60 = (std::__shared_weak_count *)__p[1];
    if (__p[1])
    {
      v61 = (unint64_t *)((char *)__p[1] + 8);
      do
        v62 = __ldaxr(v61);
      while (__stlxr(v62 - 1, v61));
      if (!v62)
      {
        ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
        std::__shared_weak_count::__release_weak(v60);
      }
    }
    v63 = v75;
    if (v75)
    {
      p_shared_owners = (unint64_t *)&v75->__shared_owners_;
      do
        v65 = __ldaxr(p_shared_owners);
      while (__stlxr(v65 - 1, p_shared_owners));
      if (!v65)
      {
        ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
        std::__shared_weak_count::__release_weak(v63);
      }
    }
  }
  return v10;
}

- (void)_updateDebugText
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  float v13;
  double v14;
  float v15;
  int cntrl_low;
  float v17;
  float v18;
  float v19;
  float v20;
  id v21;
  int8x16_t *v22;
  size_t v23;
  double v24;
  int32x2_t v25;
  _BYTE v26[24];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  -[VKCameraController canvas](self, "canvas");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[VKCameraController canvas](self, "canvas");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      if (LOBYTE(self->_showConsole._key.key.identifier))
      {
        -[VKCameraController canvas](self, "canvas");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "debugConsoleForId:", 7);

        if (v8)
        {
          ggl::DebugConsole::begin((ggl::DebugConsole *)v8);
          *(_QWORD *)(v8 + 80) = 0;
          -[VKCameraController canvas](self, "canvas");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "size");
          v11 = v10;
          -[VKCameraController canvas](self, "canvas");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "size");
          v13 = v11;
          *(float *)&v14 = v14;
          v15 = *(double *)&self->_taskContext.__ptr_;
          cntrl_low = LOBYTE(self->_taskContext.__cntrl_);
          *(float *)v26 = 2.0 / v13;
          *(_QWORD *)&v26[12] = 0;
          *(_QWORD *)&v26[4] = 0;
          *(float *)&v26[20] = -2.0 / *(float *)&v14;
          v17 = v15 + -1.0;
          if (!cntrl_low)
            v17 = 1.0 - v15;
          v27 = 0;
          v28 = 0;
          v29 = LODWORD(v17);
          *(float *)&v30 = (float)-v13 / v13;
          HIDWORD(v30) = 1065353216;
          v31 = LODWORD(v15) | 0x3F80000000000000;

          ggl::DebugConsole::setProjection(v8, v26);
          *(_DWORD *)(v8 + 96) = -16777216;
          -[VKCameraController edgeInsets](self, "edgeInsets", *(_OWORD *)v26, *(_QWORD *)&v26[16], v27, v28, v29, v30, v31);
          v19 = v18 + 10.0;
          -[VKCameraController edgeInsets](self, "edgeInsets");
          *(float *)(v8 + 8) = v19;
          *(float *)(v8 + 12) = v20 + 10.0;
          -[VKNavCameraController _debugText:showNavCameraDebugConsoleAttributes:includeSensitiveAttributes:](self, "_debugText:showNavCameraDebugConsoleAttributes:includeSensitiveAttributes:", LOBYTE(self->_showProperties._key.key.identifier), LOBYTE(self->_showAttributes._key.key.identifier), 1);
          v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v22 = (int8x16_t *)objc_msgSend(v21, "UTF8String");
          v23 = strlen(v22->i8);
          ggl::DebugConsole::drawString(v8, v22, v23, v24, v25);
          ggl::DebugConsole::end(v8);

        }
      }
    }
  }
}

- (void)_updateDebugOverlay
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  float v13;
  double v14;
  float v15;
  int cntrl_low;
  float v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  double v28;
  float v29;
  int32x2_t v30;
  double v31;
  int32x2_t v32;
  double v33;
  int32x2_t v34;
  double v35;
  int32x2_t v36;
  double v37;
  int32x2_t v38;
  double v39;
  int32x2_t v40;
  double v41;
  double v42;
  int32x2_t v43;
  double v44;
  int32x2_t v45;
  double v46;
  int32x2_t v47;
  double v48;
  int32x2_t v49;
  double v50;
  int32x2_t v51;
  double v52;
  double v53;
  int32x2_t v54;
  double v55;
  int32x2_t v56;
  double v57;
  int32x2_t v58;
  float v59;
  double v60;
  int32x2_t v61;
  void *v62;
  unint64_t v63;
  unint64_t i;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double **v72;
  double v73;
  double v74;
  char v75;
  float v76;
  float v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  double v84;
  double v85;
  float v86;
  double maxFramingDistance;
  uint64_t v88;
  double v89;
  _BOOL4 v90;
  uint64_t v91;
  long double v92;
  double v93;
  double v94;
  double v95;
  float v96;
  float v97;
  double v98;
  int32x2_t v99;
  __double2 v100;
  float v101;
  float v102;
  double v103;
  float v104;
  float v105;
  double **v106;
  double v107;
  long double v108;
  long double v109;
  long double v110;
  long double v111;
  long double v112;
  double v113;
  double v114;
  int32x2_t v115;
  float64x2_t v116;
  unsigned int v117;
  unsigned int v118;
  uint64_t v119;
  double v120;
  double v121;
  double v122;
  __double2 v123;
  float sinval;
  float cosval;
  __double2 v126;
  float v127;
  float v128;
  __double2 v129;
  float v130;
  float v131;
  __double2 v132;
  float v133;
  float v134;
  double v135;
  double v136;
  int v137;
  _QWORD v138[5];
  __int128 v139;
  __int128 v140;
  __int128 v141;
  uint64_t v142;
  uint64_t v143;
  int v144;
  _QWORD v145[6];
  int v146;
  float32x4_t v147;
  double v148;
  _OWORD v149[3];
  uint64_t v150;
  float v151;
  uint64_t v152;
  uint64_t v153;
  float v154;
  uint64_t v155;
  uint64_t v156;
  float v157;
  int v158;
  float v159;
  int v160;
  float v161;
  int v162;
  int v163;
  int v164;
  float v165[6];

  -[VKCameraController canvas](self, "canvas");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[VKCameraController canvas](self, "canvas");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      if (LOBYTE(self->_showConsole._key.key.identifier))
      {
        -[VKCameraController canvas](self, "canvas");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "debugConsoleForId:", 8);

        if (v8)
        {
          ggl::DebugConsole::begin((ggl::DebugConsole *)v8);
          *(_QWORD *)(v8 + 80) = 0;
          -[VKCameraController canvas](self, "canvas");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "size");
          v11 = v10;
          -[VKCameraController canvas](self, "canvas");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "size");
          v13 = v11;
          *(float *)&v14 = v14;
          v15 = *(double *)&self->_taskContext.__ptr_;
          cntrl_low = LOBYTE(self->_taskContext.__cntrl_);
          v153 = 0;
          v152 = 0;
          v151 = 2.0 / v13;
          v154 = -2.0 / *(float *)&v14;
          v17 = v15 + -1.0;
          if (!cntrl_low)
            v17 = 1.0 - v15;
          v155 = 0;
          v156 = 0;
          v157 = v17;
          v158 = 0;
          v159 = (float)-v13 / v13;
          v160 = 1065353216;
          v161 = v15;
          v162 = 1065353216;

          ggl::DebugConsole::setProjection(v8, &v151);
          gdc::ViewDataAccess::screenPointForCoordinate(*(double **)(-[VKCameraController mapDataAccess](self, "mapDataAccess") + 16), &self->_puckCoordinate.latitude._value, (uint64_t *)&self->_cameraFrame);
          v19 = v18;
          v21 = v20;
          if (LOBYTE(self->_showLegend._key.key.identifier))
          {
            -[VKCameraController edgeInsets](self, "edgeInsets");
            v23 = v22;
            v24 = v22 + 10.0;
            -[VKCameraController edgeInsets](self, "edgeInsets");
            v26 = v25;
            *(_DWORD *)(v8 + 96) = -256;
            v27 = v25 + 25.0;
            *(float *)(v8 + 8) = v24;
            *(float *)(v8 + 12) = v25 + 25.0;
            LODWORD(v28) = 6.0;
            ggl::DebugConsole::drawCircleWithFill(v8, v28);
            *(_DWORD *)(v8 + 96) = -16777216;
            v29 = v23 + 17.0;
            *(float *)(v8 + 8) = v29;
            *(float *)(v8 + 12) = v27;
            ggl::DebugConsole::drawString(v8, (int8x16_t *)"Maneuver", 8uLL, COERCE_DOUBLE(COERCE_UNSIGNED_INT(17.0) | 0xFF00000000000000), v30);
            *(_DWORD *)(v8 + 96) = -7403777;
            *(float *)(v8 + 8) = v24;
            *(float *)(v8 + 12) = v26 + 39.0;
            LODWORD(v31) = 6.0;
            ggl::DebugConsole::drawCircleWithFill(v8, v31);
            *(_DWORD *)(v8 + 96) = -16777216;
            *(float *)(v8 + 8) = v29;
            *(float *)(v8 + 12) = v26 + 39.0;
            ggl::DebugConsole::drawString(v8, (int8x16_t *)"Grouped Maneuver", 0x10uLL, -5.48612928e303, v32);
            *(_DWORD *)(v8 + 96) = -16711936;
            *(float *)(v8 + 8) = v24;
            *(float *)(v8 + 12) = v26 + 53.0;
            LODWORD(v33) = 6.0;
            ggl::DebugConsole::drawCircleWithFill(v8, v33);
            *(_DWORD *)(v8 + 96) = -16777216;
            *(float *)(v8 + 8) = v29;
            *(float *)(v8 + 12) = v26 + 53.0;
            ggl::DebugConsole::drawString(v8, (int8x16_t *)"Current Maneuver", 0x10uLL, -5.48612928e303, v34);
            *(_DWORD *)(v8 + 96) = -16711681;
            *(float *)(v8 + 8) = v24;
            *(float *)(v8 + 12) = v26 + 67.0;
            LODWORD(v35) = 6.0;
            ggl::DebugConsole::drawCircleWithFill(v8, v35);
            *(_DWORD *)(v8 + 96) = -16777216;
            *(float *)(v8 + 8) = v29;
            *(float *)(v8 + 12) = v26 + 67.0;
            ggl::DebugConsole::drawString(v8, (int8x16_t *)"Point To Frame", 0xEuLL, -5.48612928e303, v36);
            *(_DWORD *)(v8 + 96) = -13210;
            *(float *)(v8 + 8) = v24;
            *(float *)(v8 + 12) = v26 + 81.0;
            LODWORD(v37) = 6.0;
            ggl::DebugConsole::drawCircleWithFill(v8, v37);
            *(_DWORD *)(v8 + 96) = -16777216;
            *(float *)(v8 + 8) = v29;
            *(float *)(v8 + 12) = v26 + 81.0;
            ggl::DebugConsole::drawString(v8, (int8x16_t *)"Alternate Route Maneuver", 0x18uLL, -5.48612928e303, v38);
            *(_DWORD *)(v8 + 96) = -16737793;
            *(float *)(v8 + 8) = v24;
            *(float *)(v8 + 12) = v26 + 95.0;
            LODWORD(v39) = 6.0;
            ggl::DebugConsole::drawCircleWithFill(v8, v39);
            *(_DWORD *)(v8 + 96) = -16777216;
            *(float *)(v8 + 8) = v29;
            *(float *)(v8 + 12) = v26 + 95.0;
            ggl::DebugConsole::drawString(v8, (int8x16_t *)"Additional Points To Frame", 0x1AuLL, -5.48612928e303, v40);
            *(_DWORD *)(v8 + 96) = -16776961;
            *(float *)(v8 + 8) = v24;
            *(float *)(v8 + 12) = v26 + 109.0;
            LODWORD(v41) = 6.0;
            ggl::DebugConsole::drawCircleWithFill(v8, v41);
            *(float *)(v8 + 8) = v29;
            *(float *)(v8 + 12) = v26 + 109.0;
            ggl::DebugConsole::drawString(v8, (int8x16_t *)"Framing Rect", 0xCuLL, v42, v43);
            *(_DWORD *)(v8 + 96) = -16712580;
            *(float *)(v8 + 8) = v24;
            *(float *)(v8 + 12) = v26 + 123.0;
            LODWORD(v44) = 6.0;
            ggl::DebugConsole::drawCircleWithFill(v8, v44);
            *(_DWORD *)(v8 + 96) = -16777216;
            *(float *)(v8 + 8) = v29;
            *(float *)(v8 + 12) = v26 + 123.0;
            ggl::DebugConsole::drawString(v8, (int8x16_t *)"Viewable Rect", 0xDuLL, -5.48612928e303, v45);
            *(_DWORD *)(v8 + 96) = -65281;
            *(float *)(v8 + 8) = v24;
            *(float *)(v8 + 12) = v26 + 137.0;
            LODWORD(v46) = 6.0;
            ggl::DebugConsole::drawCircleWithFill(v8, v46);
            *(_DWORD *)(v8 + 96) = -16777216;
            *(float *)(v8 + 8) = v29;
            *(float *)(v8 + 12) = v26 + 137.0;
            ggl::DebugConsole::drawString(v8, (int8x16_t *)"Heading", 7uLL, -5.48612928e303, v47);
            *(_DWORD *)(v8 + 96) = -16711936;
            *(float *)(v8 + 8) = v24;
            *(float *)(v8 + 12) = v26 + 151.0;
            LODWORD(v48) = 6.0;
            ggl::DebugConsole::drawCircleWithFill(v8, v48);
            *(_DWORD *)(v8 + 96) = -16777216;
            *(float *)(v8 + 8) = v29;
            *(float *)(v8 + 12) = v26 + 151.0;
            ggl::DebugConsole::drawString(v8, (int8x16_t *)"Desired Heading", 0xFuLL, -5.48612928e303, v49);
            *(_DWORD *)(v8 + 96) = -65281;
            *(float *)(v8 + 8) = v24;
            *(float *)(v8 + 12) = v26 + 165.0;
            LODWORD(v50) = 6.0;
            ggl::DebugConsole::drawCircleWithFill(v8, v50);
            *(_DWORD *)(v8 + 96) = -16777216;
            *(float *)(v8 + 8) = v29;
            *(float *)(v8 + 12) = v26 + 165.0;
            ggl::DebugConsole::drawString(v8, (int8x16_t *)"Puck Movement Box", 0x11uLL, -5.48612928e303, v51);
            *(_DWORD *)(v8 + 96) = -16777216;
            *(float *)(v8 + 8) = v24;
            *(float *)(v8 + 12) = v26 + 179.0;
            LODWORD(v52) = 6.0;
            ggl::DebugConsole::drawCircleWithFill(v8, v52);
            *(float *)(v8 + 8) = v29;
            *(float *)(v8 + 12) = v26 + 179.0;
            ggl::DebugConsole::drawString(v8, (int8x16_t *)"Ideal Puck Point", 0x10uLL, v53, v54);
            *(_DWORD *)(v8 + 96) = -256;
            *(float *)(v8 + 8) = v24;
            *(float *)(v8 + 12) = v26 + 193.0;
            LODWORD(v55) = 6.0;
            ggl::DebugConsole::drawCircleWithFill(v8, v55);
            *(_DWORD *)(v8 + 96) = -16777216;
            *(float *)(v8 + 8) = v29;
            *(float *)(v8 + 12) = v26 + 193.0;
            ggl::DebugConsole::drawString(v8, (int8x16_t *)"Heading Delta", 0xDuLL, -5.48612928e303, v56);
            *(_DWORD *)(v8 + 96) = -65536;
            *(float *)(v8 + 8) = v24;
            *(float *)(v8 + 12) = v26 + 207.0;
            LODWORD(v57) = 6.0;
            ggl::DebugConsole::drawCircleWithFill(v8, v57);
            *(_DWORD *)(v8 + 96) = -16777216;
            *(float *)(v8 + 8) = v29;
            *(float *)(v8 + 12) = v26 + 207.0;
            ggl::DebugConsole::drawString(v8, (int8x16_t *)"Heading Delta Min", 0x11uLL, -5.48612928e303, v58);
            v59 = v26 + 221.0;
            *(_DWORD *)(v8 + 96) = -16777072;
            *(float *)(v8 + 8) = v24;
            *(float *)(v8 + 12) = v59;
            LODWORD(v60) = 6.0;
            ggl::DebugConsole::drawCircleWithFill(v8, v60);
            *(_DWORD *)(v8 + 96) = -16777216;
            *(float *)(v8 + 8) = v29;
            *(float *)(v8 + 12) = v59;
            ggl::DebugConsole::drawString(v8, (int8x16_t *)"Last Projected Position", 0x17uLL, -5.48612928e303, v61);
          }
          if (LOBYTE(self->_showOverlay._key.key.identifier))
          {
            objc_msgSend(*(id *)&self->_maxFramingDistance, "route");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            -[VKNavCameraController restingCameraFrame](self, "restingCameraFrame");
            if (v62)
            {
              v63 = objc_msgSend(*(id *)&self->_maxFramingDistance, "currentStepIndex");
              for (i = 0; i < objc_msgSend(v62, "stepsCount"); ++i)
              {
                objc_msgSend(v62, "stepAtIndex:", i);
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "pointAtRouteCoordinate:", objc_msgSend(v65, "endRouteCoordinate"));
                v67 = v66;
                v69 = v68;
                v71 = v70;
                v72 = -[VKCameraController mapDataAccess](self, "mapDataAccess");
                -[VKNavCameraController _coordinateForGeoLocation:](self, "_coordinateForGeoLocation:", v67, v69, v71);
                gdc::ViewDataAccess::screenPointForCoordinate(v72[2], (double *)v147.i64, (uint64_t *)v149);
                if (i < v63 || i >= v63 + BYTE1(self->_coordinatesToFrame.__end_))
                  v75 = -1;
                else
                  v75 = 0;
                v76 = v73;
                *(_WORD *)(v8 + 96) = -256;
                v77 = v74;
                *(_BYTE *)(v8 + 98) = v75;
                *(_BYTE *)(v8 + 99) = -1;
                *(float *)(v8 + 8) = v76;
                *(float *)(v8 + 12) = v77;
                LODWORD(v73) = 9.0;
                ggl::DebugConsole::drawCircleWithFill(v8, v73);
                objc_msgSend(*(id *)&self->_maxFramingDistance, "groupedManeuverCounts");
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "objectAtIndex:", i);
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                v80 = objc_msgSend(v79, "unsignedIntegerValue");

                if (v80)
                {
                  *(_DWORD *)(v8 + 96) = -7403777;
                  *(float *)(v8 + 8) = v76;
                  *(float *)(v8 + 12) = v77;
                  ggl::DebugConsole::drawCircleWithFill(v8, COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(7.0)));
                }

              }
            }
            v81 = *(_QWORD *)&self->_currentStyleName.__r_.var0;
            if (self->_currentStyleName.var0 != v81)
            {
              v82 = 0;
              v83 = 0;
              do
              {
                gdc::ViewDataAccess::screenPointForCoordinate(*(double **)(-[VKCameraController mapDataAccess](self, "mapDataAccess") + 16), (double *)(v81 + v82), (uint64_t *)v149);
                *(float *)&v84 = v84;
                *(float *)&v85 = v85;
                *(_DWORD *)(v8 + 96) = -16711681;
                v86 = *(float *)&v84 + -4.0;
                *(float *)&v84 = *(float *)&v84 + 4.0;
                v147.f32[0] = v86;
                v147.f32[1] = *(float *)&v85 + -4.0;
                v147.i32[2] = LODWORD(v84);
                v147.f32[3] = *(float *)&v85 + 4.0;
                *(float *)(v8 + 8) = v86;
                *(float *)(v8 + 12) = *(float *)&v85 + -4.0;
                ggl::DebugConsole::drawRectangleWithFill((float32x2_t *)v8, (float32x2_t *)&v147.u32[2], *(float32_t *)&v84);
                ++v83;
                v81 = *(_QWORD *)&self->_currentStyleName.__r_.var0;
                v82 += 24;
              }
              while (v83 < 0xAAAAAAAAAAAAAAABLL * ((self->_currentStyleName.var0 - v81) >> 3));
            }
            maxFramingDistance = self->_maxFramingDistance;
            v88 = MEMORY[0x1E0C809B0];
            v145[0] = MEMORY[0x1E0C809B0];
            v145[1] = 3321888768;
            v145[2] = __51__VKNavCameraController_Debug___updateDebugOverlay__block_invoke;
            v145[3] = &unk_1E42E9800;
            v145[4] = self;
            v145[5] = v8;
            v146 = -13210;
            objc_msgSend(*(id *)&maxFramingDistance, "enumerateAdditionalRoutesToFrameUsingBlock:", v145);
            v138[1] = 3321888768;
            v139 = v149[0];
            v140 = v149[1];
            v89 = self->_maxFramingDistance;
            v138[0] = v88;
            v138[2] = __51__VKNavCameraController_Debug___updateDebugOverlay__block_invoke_145;
            v138[3] = &unk_1E42E9048;
            v138[4] = self;
            v141 = v149[2];
            v142 = v150;
            v143 = v8;
            v144 = -16737793;
            objc_msgSend(*(id *)&v89, "enumeratePointsToFrameUsingBlock:", v138);
            v90 = -[VKAnimation running](self->_transitionAnimation, "running");
            v91 = 248;
            if (v90)
              v91 = 616;
            v92 = fmod(3.14159265 - *(double *)((char *)&self->super._cameraDelegate + v91) + self->_puckCourse._value, 6.28318531);
            v93 = fmod(v92 + 6.28318531, 6.28318531);
            -[VKNavCameraController puckScreenPoint](self, "puckScreenPoint");
            v135 = v95;
            v136 = v94;
            v96 = v19;
            v97 = v21;
            v98 = v93 + -3.14159265;
            if (self->_viewableScreenRect._minimum._e[0] >= self->_maxHeightDeltaChangeVertical
              && self->_viewableScreenRect._minimum._e[1] >= self->_halfPuckSize)
            {
              *(_DWORD *)(v8 + 96) = -16712580;
              v99 = (int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_maxHeightDeltaChangeVertical);
              v147 = vcvt_hight_f32_f64(v99, (float64x2_t)self->_viewableScreenRect._minimum);
              *(int32x2_t *)(v8 + 8) = v99;
              ggl::DebugConsole::drawRectangle(v8, &v147.f32[2]);
            }
            *(_DWORD *)(v8 + 96) = -65281;
            *(_DWORD *)(v8 + 104) = 0x40000000;
            v100 = __sincos_stret(v93 + -3.14159265);
            v101 = v100.__sinval * -100.0;
            v102 = v100.__cosval * -100.0;
            v147.f32[0] = v101 + v96;
            v147.f32[1] = v102 + v97;
            *(float *)(v8 + 8) = v96;
            *(float *)(v8 + 12) = v97;
            ggl::DebugConsole::drawLine(v8, v147.f32);
            *(_DWORD *)(v8 + 96) = -16777216;
            HIDWORD(v103) = HIDWORD(v136);
            v104 = v136;
            v105 = v135;
            *(float *)(v8 + 8) = v104;
            *(float *)(v8 + 12) = v105;
            LODWORD(v103) = 5.0;
            ggl::DebugConsole::drawCircleWithFill(v8, v103);
            v106 = -[VKCameraController mapDataAccess](self, "mapDataAccess");
            v107 = self->_lastProjectedPosition._e[0];
            v108 = *(double *)&self->_pixelChangeFrameRate.__end_ * 6.28318531;
            v109 = exp(*(double *)&self->_pixelChangeFrameRate.__end_cap_.__value_ * 6.28318531 + -3.14159265);
            v110 = atan(v109) * 2.0 + -1.57079633;
            v111 = fmod(v108, 6.28318531);
            v112 = fmod(v111 + 6.28318531, 6.28318531);
            *(long double *)v147.i64 = v110;
            *(double *)&v147.i64[1] = v112 + -3.14159265;
            v148 = v107;
            gdc::ViewDataAccess::screenPointForCoordinate(v106[2], (double *)v147.i64, (uint64_t *)v149);
            *(float *)&v113 = v113;
            *(_DWORD *)(v8 + 96) = -16777072;
            *(float *)&v114 = v114;
            *(_DWORD *)(v8 + 8) = LODWORD(v113);
            *(_DWORD *)(v8 + 12) = LODWORD(v114);
            LODWORD(v113) = 5.0;
            ggl::DebugConsole::drawCircleWithFill(v8, v113);
            if (self->_cameraType == 1)
            {
              if (self->_framingScreenRect._minimum._e[0] >= self->_viewableScreenRect._maximum._e[0]
                && self->_framingScreenRect._minimum._e[1] >= self->_viewableScreenRect._maximum._e[1])
              {
                *(_DWORD *)(v8 + 96) = -16776961;
                *(_DWORD *)(v8 + 104) = 1065353216;
                v115 = (int32x2_t)vcvt_f32_f64((float64x2_t)self->_viewableScreenRect._maximum);
                v147 = vcvt_hight_f32_f64(v115, (float64x2_t)self->_framingScreenRect._minimum);
                *(int32x2_t *)(v8 + 8) = v115;
                ggl::DebugConsole::drawRectangle(v8, &v147.f32[2]);
              }
              v116.f64[0] = v136;
              *(float *)&v117 = v136 - self->_clientFramingInsets.top;
              *(float *)&v118 = v135 - self->_clientFramingInsets.left;
              v147.i64[0] = __PAIR64__(v118, v117);
              v116.f64[1] = v135;
              *(float32x2_t *)&v116.f64[0] = vcvt_f32_f64(vaddq_f64(v116, vcvtq_f64_f32(*(float32x2_t *)&self->_clientFramingInsets.bottom)));
              v147.i64[1] = *(_QWORD *)&v116.f64[0];
              *(_DWORD *)(v8 + 96) = -65281;
              *(_DWORD *)(v8 + 8) = v117;
              *(_DWORD *)(v8 + 12) = v118;
              *(_QWORD *)v165 = *(_QWORD *)(v8 + 8);
              v119 = *(_QWORD *)v165;
              v137 = LODWORD(v116.f64[0]);
              *(float64_t *)(v8 + 8) = v116.f64[0];
              v163 = v119;
              v164 = HIDWORD(v116.f64[0]);
              ggl::DebugConsole::drawLine(v8, (float *)&v163);
              ggl::DebugConsole::drawLine(v8, v165);
              v163 = v137;
              v164 = HIDWORD(v119);
              ggl::DebugConsole::drawLine(v8, (float *)&v163);
              *(float *)&v120 = ggl::DebugConsole::drawLine(v8, &v147.f32[2]);
              if (-[VKNavCameraController cameraHeadingType](self, "cameraHeadingType", v120) == 2)
              {
                if (*(double *)&self->_routeCoordinate != -3.14159265
                  || *(double *)&self->_frameAllGroupedManeuvers != -3.14159265
                  || self->_routeFocusCoordinate.latitude._value != 0.0)
                {
                  gdc::ViewDataAccess::screenPointForCoordinate(*(double **)(-[VKCameraController mapDataAccess](self, "mapDataAccess") + 16), (double *)&self->_routeCoordinate, (uint64_t *)&self->_cameraFrame);
                  *(float *)&v121 = v121;
                  *(float *)&v122 = v122;
                  *(_QWORD *)v165 = __PAIR64__(LODWORD(v122), LODWORD(v121));
                  *(_DWORD *)(v8 + 96) = -16711936;
                  *(float *)(v8 + 8) = v96;
                  *(float *)(v8 + 12) = v97;
                  ggl::DebugConsole::drawLine(v8, v165);
                }
                *(_DWORD *)(v8 + 96) = -256;
                *(_DWORD *)(v8 + 104) = 0x40000000;
                v123 = __sincos_stret(self->_headingDelta._value + v98);
                sinval = v123.__sinval;
                cosval = v123.__cosval;
                v165[0] = v96 - (float)(sinval * 100.0);
                v165[1] = v97 - (float)(cosval * 100.0);
                *(float *)(v8 + 8) = v96;
                *(float *)(v8 + 12) = v97;
                ggl::DebugConsole::drawLine(v8, v165);
                v126 = __sincos_stret(v98 - self->_headingDelta._value);
                v127 = v126.__sinval;
                v128 = v126.__cosval;
                v165[0] = v96 - (float)(v127 * 100.0);
                v165[1] = v97 - (float)(v128 * 100.0);
                *(float *)(v8 + 8) = v96;
                *(float *)(v8 + 12) = v97;
                ggl::DebugConsole::drawLine(v8, v165);
                *(_DWORD *)(v8 + 96) = -65536;
                v129 = __sincos_stret(self->_headingMinDelta._value + v98);
                v130 = v129.__sinval;
                v131 = v129.__cosval;
                v165[0] = v96 - (float)(v130 * 100.0);
                v165[1] = v97 - (float)(v131 * 100.0);
                *(float *)(v8 + 8) = v96;
                *(float *)(v8 + 12) = v97;
                ggl::DebugConsole::drawLine(v8, v165);
                v132 = __sincos_stret(v98 - self->_headingMinDelta._value);
                v133 = v132.__sinval;
                v134 = v132.__cosval;
                v165[0] = v96 - (float)(v133 * 100.0);
                v165[1] = v97 - (float)(v134 * 100.0);
                *(float *)(v8 + 8) = v96;
                *(float *)(v8 + 12) = v97;
                ggl::DebugConsole::drawLine(v8, v165);
              }
            }

          }
          ggl::DebugConsole::end(v8);
        }
      }
    }
  }
}

void __51__VKNavCameraController_Debug___updateDebugOverlay__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  double v11;
  double v12;
  _BYTE *v13;
  float32x2_t *v14;
  float v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  float32x2_t v25[2];

  v7 = a2;
  if ((*MEMORY[0x1E0D26A38] != (_DWORD)a3
     || vabds_f32(*((float *)&a3 + 1), *(float *)(MEMORY[0x1E0D26A38] + 4)) >= 0.00000011921)
    && (*MEMORY[0x1E0D26A38] != (_DWORD)a4
     || vabds_f32(*((float *)&a4 + 1), *(float *)(MEMORY[0x1E0D26A38] + 4)) >= 0.00000011921))
  {
    v8 = (a3 + 1);
    if (v8 < (int)a4 - 1)
    {
      v9 = a4 - a3 - 2;
      do
      {
        if (v8 >= objc_msgSend(v7, "pointCount"))
          break;
        objc_msgSend(v7, "pointAt:", v8);
        v17 = v16;
        v19 = v18;
        v21 = v20;
        v22 = objc_msgSend(*(id *)(a1 + 32), "mapDataAccess");
        v23 = *(void **)(a1 + 32);
        if (v23)
        {
          objc_msgSend(v23, "_coordinateForGeoLocation:", v17, v19, v21);
          v10 = *(_QWORD *)(a1 + 32);
        }
        else
        {
          v10 = 0;
          v24 = 0;
          v25[0] = 0;
          v25[1] = 0;
        }
        gdc::ViewDataAccess::screenPointForCoordinate(*(double **)(v22 + 16), (double *)&v24, (uint64_t *)(v10 + 248));
        *(float *)&v11 = v11;
        *(float *)&v12 = v12;
        v13 = *(_BYTE **)(a1 + 40);
        v13[96] = *(_BYTE *)(a1 + 48);
        v13[97] = *(_BYTE *)(a1 + 49);
        v13[98] = *(_BYTE *)(a1 + 50);
        v13[99] = *(_BYTE *)(a1 + 51);
        v14 = *(float32x2_t **)(a1 + 40);
        v15 = *(float *)&v11 + -4.0;
        *(float *)&v11 = *(float *)&v11 + 4.0;
        *(float *)&v24 = v15;
        *((float *)&v24 + 1) = *(float *)&v12 + -4.0;
        v25[0].i32[0] = LODWORD(v11);
        v25[0].f32[1] = *(float *)&v12 + 4.0;
        v14[1].f32[0] = v15;
        v14[1].f32[1] = *(float *)&v12 + -4.0;
        ggl::DebugConsole::drawRectangleWithFill(v14, v25, *(float32_t *)&v11);
        ++v8;
        --v9;
      }
      while (v9);
    }
  }

}

uint64_t __51__VKNavCameraController_Debug___updateDebugOverlay__block_invoke_145(uint64_t a1, double a2, double a3, double a4)
{
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  _BYTE *v12;
  uint64_t v13;
  double v15[3];

  v8 = objc_msgSend(*(id *)(a1 + 32), "mapDataAccess");
  v9 = *(void **)(a1 + 32);
  if (v9)
    objc_msgSend(v9, "_coordinateForGeoLocation:", a2, a3, a4);
  else
    memset(v15, 0, sizeof(v15));
  gdc::ViewDataAccess::screenPointForCoordinate(*(double **)(v8 + 16), v15, (uint64_t *)(a1 + 40));
  *(float *)&v10 = v10;
  *(float *)&v11 = v11;
  v12 = *(_BYTE **)(a1 + 96);
  v12[96] = *(_BYTE *)(a1 + 104);
  v12[97] = *(_BYTE *)(a1 + 105);
  v12[98] = *(_BYTE *)(a1 + 106);
  v12[99] = *(_BYTE *)(a1 + 107);
  v13 = *(_QWORD *)(a1 + 96);
  *(_DWORD *)(v13 + 8) = LODWORD(v10);
  *(_DWORD *)(v13 + 12) = LODWORD(v11);
  LODWORD(v10) = 6.0;
  return ggl::DebugConsole::drawCircleWithFill(v13, v10);
}

uint64_t __106__VKNavCameraController_Debug___debugText_showNavCameraDebugConsoleAttributes_includeSensitiveAttributes___block_invoke(uint64_t result)
{
  ++*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (VKNavCameraController)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("init is not a valid initializer for VKNavCameraController"));

  return 0;
}

- (VKNavCameraController)initWithTaskContext:(shared_ptr<md:(void *)a4 :(void *)a5 TaskContext>)a3 device:(AnimationRunner *)a6 mapDataAccess:(RunLoopController *)a7 animationRunner:(id)a8 runLoopController:cameraDelegate:
{
  __shared_weak_count *cntrl;
  TaskContext *ptr;
  char *v13;
  char *v14;
  id **v15;
  uint64_t v16;
  id *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  uint64_t v23;
  id v24;
  _QWORD *v25;
  uint64_t v26;
  id v27;
  _QWORD *v28;
  uint64_t v29;
  id v30;
  _QWORD *v31;
  uint64_t v32;
  id v33;
  _QWORD *v34;
  uint64_t v35;
  id v36;
  _QWORD *v37;
  uint64_t v38;
  VKAttachedNavGestureCameraBehavior *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  int64x2_t v43;
  int64x2_t v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t i;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char **v58;
  unint64_t v59;
  char *v60;
  _QWORD *v61;
  char *v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char *v67;
  char *v68;
  char *v69;
  int64x2_t v70;
  uint64_t v71;
  char *v72;
  RunLoopController *v74;
  id obj;
  void *v76;
  uint64_t v77;
  id v78;
  void *v79;
  char *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD v85[4];
  id v86;
  objc_super v87;
  _BYTE v88[128];
  _QWORD v89[3];
  _QWORD *v90;
  _QWORD v91[3];
  _QWORD *v92;
  _QWORD v93[3];
  _QWORD *v94;
  _QWORD v95[3];
  _QWORD *v96;
  _QWORD v97[3];
  _QWORD *v98;
  __int128 v99[5];
  uint64_t v100;

  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v100 = *MEMORY[0x1E0C80C00];
  v87.receiver = self;
  v87.super_class = (Class)VKNavCameraController;
  v74 = a7;
  v13 = -[VKCameraController initWithMapDataAccess:animationRunner:runLoopController:cameraDelegate:](&v87, sel_initWithMapDataAccess_animationRunner_runLoopController_cameraDelegate_, a4, a5, a6);
  v14 = v13;
  if (!v13)
    goto LABEL_66;
  v15 = (id **)(v13 + 1080);
  v17 = *(id **)ptr;
  v16 = *((_QWORD *)ptr + 1);
  if (v16)
  {
    v18 = (unint64_t *)(v16 + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  v20 = (std::__shared_weak_count *)*((_QWORD *)v13 + 136);
  *v15 = v17;
  *((_QWORD *)v13 + 136) = v16;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v22 = __ldaxr(p_shared_owners);
    while (__stlxr(v22 - 1, p_shared_owners));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  v23 = *((_QWORD *)cntrl + 1);
  *((_QWORD *)v14 + 137) = *(_QWORD *)(v23 + 64);
  v14[1104] = *(_BYTE *)(v23 + 72);
  v24 = **v15;
  v98 = 0;
  v80 = v14;
  md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::Monitorable((uint64_t)v99, &VectorKitDebugConfig_NavCameraEnableConsole, v24, v97);
  md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::operator=((uint64_t)(v14 + 1904), v99);
  md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::~Monitorable((uint64_t)v99);
  v25 = v98;
  if (v98 == v97)
  {
    v26 = 4;
    v25 = v97;
  }
  else
  {
    if (!v98)
      goto LABEL_15;
    v26 = 5;
  }
  (*(void (**)(void))(*v25 + 8 * v26))();
LABEL_15:

  v27 = **v15;
  v96 = 0;
  md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::Monitorable((uint64_t)v99, &VectorKitDebugConfig_NavCameraEnableOverlay, v27, v95);
  md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::operator=((uint64_t)(v14 + 1984), v99);
  md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::~Monitorable((uint64_t)v99);
  v28 = v96;
  if (v96 == v95)
  {
    v29 = 4;
    v28 = v95;
  }
  else
  {
    if (!v96)
      goto LABEL_20;
    v29 = 5;
  }
  (*(void (**)(void))(*v28 + 8 * v29))();
LABEL_20:

  v30 = **v15;
  v94 = 0;
  md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::Monitorable((uint64_t)v99, &VectorKitDebugConfig_NavCameraEnableAttributes, v30, v93);
  md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::operator=((uint64_t)(v14 + 2064), v99);
  md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::~Monitorable((uint64_t)v99);
  v31 = v94;
  if (v94 == v93)
  {
    v32 = 4;
    v31 = v93;
  }
  else
  {
    if (!v94)
      goto LABEL_25;
    v32 = 5;
  }
  (*(void (**)(void))(*v31 + 8 * v32))();
LABEL_25:

  v33 = **v15;
  v92 = 0;
  md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::Monitorable((uint64_t)v99, &VectorKitDebugConfig_NavCameraEnableProperties, v33, v91);
  md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::operator=((uint64_t)(v14 + 2144), v99);
  md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::~Monitorable((uint64_t)v99);
  v34 = v92;
  if (v92 == v91)
  {
    v35 = 4;
    v34 = v91;
  }
  else
  {
    if (!v92)
      goto LABEL_30;
    v35 = 5;
  }
  (*(void (**)(void))(*v34 + 8 * v35))();
LABEL_30:

  v36 = **v15;
  v90 = 0;
  md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::Monitorable((uint64_t)v99, &VectorKitDebugConfig_NavCameraEnableLegend, v36, v89);
  md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::operator=((uint64_t)(v14 + 2224), v99);
  md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::~Monitorable((uint64_t)v99);
  v37 = v90;
  if (v90 == v89)
  {
    v38 = 4;
    v37 = v89;
    goto LABEL_34;
  }
  if (v90)
  {
    v38 = 5;
LABEL_34:
    (*(void (**)(void))(*v37 + 8 * v38))();
  }

  v39 = -[VKAttachedNavGestureCameraBehavior initWithNavCameraController:]([VKAttachedNavGestureCameraBehavior alloc], "initWithNavCameraController:", v14);
  v40 = (void *)*((_QWORD *)v14 + 70);
  *((_QWORD *)v14 + 70) = v39;

  objc_storeWeak((id *)v14 + 69, *((id *)v14 + 70));
  *((_QWORD *)v14 + 63) = 0;
  v14[136] = 1;
  *((_OWORD *)v14 + 28) = 0u;
  *((_OWORD *)v14 + 29) = 0u;
  *((_OWORD *)v14 + 27) = 0u;
  v41 = *((_QWORD *)v14 + 63);
  *((_QWORD *)v14 + 41) = v41;
  *((_QWORD *)v14 + 39) = v41;
  *((_QWORD *)v14 + 40) = 0;
  *((_QWORD *)v14 + 45) = 0;
  *((_QWORD *)v14 + 46) = 0;
  *((_QWORD *)v14 + 44) = 0;
  *((_QWORD *)v14 + 62) = 0x407F400000000000;
  *((_QWORD *)v14 + 51) = 0x407F400000000000;
  *(_OWORD *)(v14 + 392) = xmmword_19FFB5E40;
  v14[137] = 2;
  v14[720] = 1;
  v14[721] = 1;
  v14[722] = 0;
  v14[723] = 0;
  *((_QWORD *)v14 + 91) = 0x4059000000000000;
  GEOConfigGetDouble();
  *((_QWORD *)v14 + 92) = v42;
  *((_QWORD *)v14 + 93) = 0;
  *((_QWORD *)v14 + 94) = 0x3FF8DA7E39BAE2A3;
  *((_QWORD *)v14 + 22) = 0;
  *((_QWORD *)v14 + 23) = 0;
  *((_QWORD *)v14 + 97) = 0;
  *((_QWORD *)v14 + 98) = 0;
  *((_QWORD *)v14 + 99) = 0;
  *((_QWORD *)v14 + 100) = 0;
  *((_QWORD *)v14 + 101) = 0;
  *((_QWORD *)v14 + 102) = 0;
  *((_QWORD *)v14 + 110) = 0;
  *((_QWORD *)v14 + 106) = 0;
  *((_QWORD *)v14 + 107) = 0;
  *((_QWORD *)v14 + 108) = 0;
  *((_QWORD *)v14 + 109) = 0;
  *((_QWORD *)v14 + 103) = 0;
  *((_QWORD *)v14 + 104) = 0;
  *((_QWORD *)v14 + 105) = 0x3F0000003F000000;
  v14[952] = 1;
  v14[953] = 1;
  v14[954] = 1;
  v14[955] = 1;
  *((_DWORD *)v14 + 239) = 1069547520;
  v14[960] = 0;
  v14[961] = 0;
  *((_QWORD *)v14 + 121) = 0xBFF0000000000000;
  *((_QWORD *)v14 + 122) = 0;
  v14[1016] = 0;
  v14[1017] = 10;
  v14[1018] = 0;
  *((int64x2_t *)v14 + 64) = vdupq_n_s64(0xC00921FB54442D18);
  *((_QWORD *)v14 + 130) = 0;
  *((_QWORD *)v14 + 131) = 0;
  *((_QWORD *)v14 + 132) = 0;
  v43 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  v44 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
  *(int64x2_t *)(v14 + 888) = v43;
  *(int64x2_t *)(v14 + 904) = v44;
  *(int64x2_t *)(v14 + 920) = v43;
  *(int64x2_t *)(v14 + 936) = v44;
  *((_QWORD *)v14 + 133) = 0x3FF0000000000000;
  *((_DWORD *)v14 + 268) = -1082130432;
  objc_msgSend(v14, "_updateZoomScaleLimts");
  objc_msgSend(v14, "setBaseDisplayRate:", GEOConfigGetInteger());
  objc_msgSend(v14, "setMaxDisplayRate:", GEOConfigGetInteger());
  GEOConfigGetDictionary();
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v45;
  if (v45)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = __115__VKNavCameraController_initWithTaskContext_device_mapDataAccess_animationRunner_runLoopController_cameraDelegate___block_invoke;
    v85[3] = &unk_1E42F7908;
    v47 = v46;
    v86 = v47;
    v78 = v47;
    objc_msgSend(v45, "enumerateKeysAndObjectsUsingBlock:", v85);
    objc_msgSend(v47, "allKeys");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (v48)
    {
      objc_msgSend(v48, "sortedArrayUsingComparator:", &__block_literal_global_32416);
      v83 = 0u;
      v84 = 0u;
      v81 = 0u;
      v82 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v88, 16);
      if (v50)
      {
        v76 = v49;
        v77 = *(_QWORD *)v82;
        do
        {
          for (i = 0; i != v50; ++i)
          {
            if (*(_QWORD *)v82 != v77)
              objc_enumerationMutation(obj);
            v52 = *(id *)(*((_QWORD *)&v81 + 1) + 8 * i);
            objc_msgSend(v47, "objectForKey:", v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "doubleValue");
            v55 = v54;
            v56 = objc_msgSend(v53, "integerValue");
            v57 = v56;
            v14 = v80;
            v58 = (char **)(v80 + 1808);
            v60 = (char *)*((_QWORD *)v80 + 227);
            v59 = *((_QWORD *)v80 + 228);
            if ((unint64_t)v60 >= v59)
            {
              v62 = *v58;
              v63 = (v60 - *v58) >> 4;
              v64 = v63 + 1;
              if ((unint64_t)(v63 + 1) >> 60)
                abort();
              v65 = v59 - (_QWORD)v62;
              if (v65 >> 3 > v64)
                v64 = v65 >> 3;
              if ((unint64_t)v65 >= 0x7FFFFFFFFFFFFFF0)
                v66 = 0xFFFFFFFFFFFFFFFLL;
              else
                v66 = v64;
              if (v66)
              {
                if (v66 >> 60)
                  std::__throw_bad_array_new_length[abi:nn180100]();
                v67 = (char *)operator new(16 * v66);
              }
              else
              {
                v67 = 0;
              }
              v68 = &v67[16 * v63];
              *(_QWORD *)v68 = v55;
              *((_QWORD *)v68 + 1) = v57;
              v69 = v68;
              if (v60 == v62)
              {
                v14 = v80;
              }
              else
              {
                v14 = v80;
                do
                {
                  *((_OWORD *)v69 - 1) = *((_OWORD *)v60 - 1);
                  v69 -= 16;
                  v60 -= 16;
                }
                while (v60 != v62);
                v60 = *v58;
              }
              v61 = v68 + 16;
              *v58 = v69;
              *((_QWORD *)v80 + 227) = v68 + 16;
              *((_QWORD *)v80 + 228) = &v67[16 * v66];
              if (v60)
                operator delete(v60);
            }
            else
            {
              *(_QWORD *)v60 = v55;
              *((_QWORD *)v60 + 1) = v56;
              v61 = v60 + 16;
            }
            v47 = v78;
            v45 = v79;
            v49 = v76;
            *((_QWORD *)v80 + 227) = v61;

          }
          v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v88, 16);
        }
        while (v50);
      }

    }
  }
  v14[1076] = 0;
  v14[1105] = 0;
  v14[1106] = 0;
  v70 = vdupq_n_s64(0xC00921FB54442D18);
  *(int64x2_t *)(v14 + 1112) = v70;
  *(_OWORD *)(v14 + 1128) = xmmword_19FFB5E50;
  *(_OWORD *)(v14 + 1144) = xmmword_19FFB5140;
  *(int64x2_t *)(v14 + 1160) = v70;
  *(_OWORD *)(v14 + 1176) = xmmword_19FFB5E50;
  *(_OWORD *)(v14 + 1192) = xmmword_19FFB5140;
  v14[1784] = 0;
  GEOConfigGetDouble();
  *((_QWORD *)v14 + 232) = v71;
  *((_QWORD *)v14 + 65) = 0;
  objc_msgSend(v14, "stopIgnoreStyleChange");
  v72 = v14;

LABEL_66:
  return (VKNavCameraController *)v14;
}

- (void)dealloc
{
  VKAttachedNavGestureCameraBehavior *attachedGestureBehavior;
  VKDetachedNavGestureCameraBehavior *detachedGestureBehavior;
  VKDaVinciGestureCameraController *davinciGestureCameraController;
  int64_t requestedDisplayRate;
  double maxFramingDistance;
  VKTimedAnimation *snapPitchAnimation;
  VKTimedAnimation *snapHeadingAnimation;
  VKTimedAnimation *transitionAnimation;
  objc_super v11;

  -[VKCameraController setCameraDelegate:](self, "setCameraDelegate:", 0);
  objc_storeWeak((id *)&self->_gestureBehavior, 0);
  attachedGestureBehavior = self->_attachedGestureBehavior;
  self->_attachedGestureBehavior = 0;

  detachedGestureBehavior = self->_detachedGestureBehavior;
  self->_detachedGestureBehavior = 0;

  davinciGestureCameraController = self->_davinciGestureCameraController;
  self->_davinciGestureCameraController = 0;

  requestedDisplayRate = self->_requestedDisplayRate;
  if (requestedDisplayRate)
  {
    (*(void (**)(int64_t))(*(_QWORD *)requestedDisplayRate + 8))(requestedDisplayRate);
    self->_requestedDisplayRate = 0;
  }
  objc_msgSend(*(id *)&self->_maxFramingDistance, "removeObserver:", self);
  maxFramingDistance = self->_maxFramingDistance;
  self->_maxFramingDistance = 0.0;

  -[VKAnimation stop](self->_snapPitchAnimation, "stop");
  snapPitchAnimation = self->_snapPitchAnimation;
  self->_snapPitchAnimation = 0;

  -[VKAnimation stop](self->_snapHeadingAnimation, "stop");
  snapHeadingAnimation = self->_snapHeadingAnimation;
  self->_snapHeadingAnimation = 0;

  -[VKAnimation stop](self->_transitionAnimation, "stop");
  transitionAnimation = self->_transitionAnimation;
  self->_transitionAnimation = 0;

  objc_storeWeak((id *)&self->_cameraMode, 0);
  v11.receiver = self;
  v11.super_class = (Class)VKNavCameraController;
  -[VKNavCameraController dealloc](&v11, sel_dealloc);
}

- (void)updatePuckOffset:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  uint64_t v6;
  int8x8_t *v7;
  int8x8_t v8;
  uint8x8_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  unint64_t *v19;
  unint64_t v20;
  unsigned int v21;
  unint64_t *v22;
  unint64_t v23;
  double v24;
  double v25;
  __double2 v26;
  double v27;
  __double2 v28;
  __int128 v29;
  double v30;
  double v31;
  __double2 v32;
  double v33;
  __double2 v34;
  double v35;
  double v36;
  double v37;
  __double2 v38;
  __double2 v39;
  double v40;
  double v41;
  double v42;
  double v43;
  __double2 v44;
  double v45;
  long double v46;
  double v47;
  double v48;
  double v49;
  double value;
  double v51;
  long double v52;
  long double v53;
  double v54;
  double v55;
  NSObject *v57;
  NSObject *v58;
  double v59;
  double v60;
  double v61;
  double sinval;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  __int128 buf;
  double v72;
  uint64_t v73;

  v3 = a3;
  v73 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
  v6 = objc_msgSend(WeakRetained, "mapEngine");

  if (!v6)
    return;
  v7 = *(int8x8_t **)(v6 + 1120);
  if (!v7)
    return;
  v8 = v7[2];
  if (!*(_QWORD *)&v8)
    goto LABEL_31;
  v9 = (uint8x8_t)vcnt_s8(v8);
  v9.i16[0] = vaddlv_u8(v9);
  if (v9.u32[0] > 1uLL)
  {
    v10 = 0x7173CF8D2BE8FE53;
    if (*(_QWORD *)&v8 <= 0x7173CF8D2BE8FE53uLL)
      v10 = 0x7173CF8D2BE8FE53uLL % *(_QWORD *)&v8;
  }
  else
  {
    v10 = (*(_QWORD *)&v8 - 1) & 0x7173CF8D2BE8FE53;
  }
  v11 = *(_QWORD **)(*(_QWORD *)&v7[1] + 8 * v10);
  if (!v11)
    goto LABEL_31;
  v12 = (_QWORD *)*v11;
  if (!v12)
    goto LABEL_31;
  if (v9.u32[0] < 2uLL)
  {
    v13 = *(_QWORD *)&v8 - 1;
    while (1)
    {
      v15 = v12[1];
      if (v15 == 0x7173CF8D2BE8FE53)
      {
        if (v12[2] == 0x7173CF8D2BE8FE53)
          goto LABEL_24;
      }
      else if ((v15 & v13) != v10)
      {
        goto LABEL_31;
      }
      v12 = (_QWORD *)*v12;
      if (!v12)
        goto LABEL_31;
    }
  }
  while (1)
  {
    v14 = v12[1];
    if (v14 == 0x7173CF8D2BE8FE53)
      break;
    if (v14 >= *(_QWORD *)&v8)
      v14 %= *(_QWORD *)&v8;
    if (v14 != v10)
      goto LABEL_31;
LABEL_13:
    v12 = (_QWORD *)*v12;
    if (!v12)
      goto LABEL_31;
  }
  if (v12[2] != 0x7173CF8D2BE8FE53)
    goto LABEL_13;
LABEL_24:
  v16 = v12[5];
  if (!v16)
  {
LABEL_31:
    if (GEOGetVectorKitVKNavCameraLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKNavCameraLog_onceToken, &__block_literal_global_31);
    v18 = (id)GEOGetVectorKitVKNavCameraLog_log;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_19F029000, v18, OS_LOG_TYPE_ERROR, "updatePuckOffset with no RouteLineLogic", (uint8_t *)&buf, 2u);
    }

    return;
  }
  if (v3)
  {
    if (GEOGetVectorKitVKNavCameraLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKNavCameraLog_onceToken, &__block_literal_global_31);
    v17 = (id)GEOGetVectorKitVKNavCameraLog_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_19F029000, v17, OS_LOG_TYPE_INFO, "Reset puckZScale", (uint8_t *)&buf, 2u);
    }
    goto LABEL_54;
  }
  -[VKCameraController camera](self, "camera");
  if (*((_QWORD *)&buf + 1))
  {
    v19 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&buf + 1) + 16))(*((_QWORD *)&buf + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&buf + 1));
    }
  }
  if ((_QWORD)buf)
  {
    -[VKCameraController camera](self, "camera");
    v21 = *(unsigned __int8 *)buf - 1;
    if (*((_QWORD *)&buf + 1))
    {
      v22 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        (*(void (**)(_QWORD))(**((_QWORD **)&buf + 1) + 16))(*((_QWORD *)&buf + 1));
        std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&buf + 1));
      }
    }
    -[VKNavCameraController cameraFrame](self, "cameraFrame");
    if (v21 >= 3)
    {
      v38 = __sincos_stret((v69 - v70) * 0.5);
      v39 = __sincos_stret(v68 * 0.5);
      v40 = v38.__sinval * v39.__sinval;
      v41 = v40 + v40;
      v42 = v38.__cosval * v39.__sinval * -2.0;
      v43 = -(v42 * (v38.__cosval * v39.__sinval) + 1.0 - (v40 + v40) * v40);
      v44 = __sincos_stret((v70 + v69) * 0.5);
      v45 = v42 * (v44.__cosval * v39.__cosval) + v41 * (v44.__sinval * v39.__cosval);
      v46 = tan(v64 * 0.5 + 0.785398163);
      v63 = log(v46);
      v47 = -(v42 * (v44.__sinval * v39.__cosval) - v41 * (v44.__cosval * v39.__cosval)) * (v67 * 0.0000000249532021);
      v48 = v45 * (v67 * 0.0000000249532021);
      v49 = -(v43 * (v67 * 0.0000000249532021));
      value = self->_puckCoordinate.longitude._value;
      v51 = self->_puckCoordinate.altitude._value;
      v52 = tan(self->_puckCoordinate.latitude._value * 0.5 + 0.785398163);
      v53 = log(v52);
      v54 = -(v49 + v66 * 0.0000000249532021 - v51 * 0.0000000249532021);
      v36 = sqrt(-(v47 - (value - v65) * 0.159154943) * -(v47 - (value - v65) * 0.159154943)+ v54 * v54+ -(v48 - (v53 - v63) * 0.159154943) * -(v48 - (v53 - v63) * 0.159154943));
      v37 = v47 * v47 + v48 * v48 + v49 * v49;
    }
    else
    {
      gdc::CameraFrame<geo::Radians,double>::toRigidTransformGeocentric((double *)&buf, &v64);
      v24 = v65;
      v25 = v66;
      v26 = __sincos_stret(v64);
      sinval = v26.__sinval;
      v27 = 6378137.0 / sqrt(1.0 - sinval * sinval * 0.00669437999);
      v61 = (v27 + v25) * v26.__cosval;
      v28 = __sincos_stret(v24);
      v29 = buf;
      v30 = v72;
      v59 = self->_puckCoordinate.longitude._value;
      v60 = v25 + v27 * 0.99330562;
      v31 = self->_puckCoordinate.altitude._value;
      v32 = __sincos_stret(self->_puckCoordinate.latitude._value);
      v33 = 6378137.0 / sqrt(1.0 - v32.__sinval * v32.__sinval * 0.00669437999);
      v34 = __sincos_stret(v59);
      v35 = -(v30 - (v31 + v33 * 0.99330562) * v32.__sinval);
      v36 = sqrt(-(*(double *)&v29 - (v33 + v31) * v32.__cosval * v34.__cosval)* -(*(double *)&v29 - (v33 + v31) * v32.__cosval * v34.__cosval)+ -(*((double *)&v29 + 1) - (v33 + v31) * v32.__cosval * v34.__sinval)* -(*((double *)&v29 + 1) - (v33 + v31) * v32.__cosval * v34.__sinval)+ v35 * v35);
      v37 = -(*(double *)&v29 - v61 * v28.__cosval) * -(*(double *)&v29 - v61 * v28.__cosval)
          + -(*((double *)&v29 + 1) - v61 * v28.__sinval) * -(*((double *)&v29 + 1) - v61 * v28.__sinval)
          + -(v30 - v60 * sinval) * -(v30 - v60 * sinval);
    }
    v55 = v36 / sqrt(v37);
    if (v55 < 0.4 || v55 > 2.0)
    {
      if (GEOGetVectorKitVKNavCameraLog_onceToken != -1)
        dispatch_once(&GEOGetVectorKitVKNavCameraLog_onceToken, &__block_literal_global_31);
      v57 = (id)GEOGetVectorKitVKNavCameraLog_log;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 134217984;
        *(double *)((char *)&buf + 4) = v55;
        _os_log_impl(&dword_19F029000, v57, OS_LOG_TYPE_ERROR, "out of range puckZScale:%.2f", (uint8_t *)&buf, 0xCu);
      }

      v55 = 1.0;
    }
    if (GEOGetVectorKitVKNavCameraLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKNavCameraLog_onceToken, &__block_literal_global_31);
    v58 = (id)GEOGetVectorKitVKNavCameraLog_log;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(double *)((char *)&buf + 4) = v55;
      _os_log_impl(&dword_19F029000, v58, OS_LOG_TYPE_INFO, "Set puckZScale:%.2f", (uint8_t *)&buf, 0xCu);
    }

    *(double *)(v16 + 208) = v55;
    *(_BYTE *)(v16 + 216) = 1;
  }
  else
  {
    if (GEOGetVectorKitVKNavCameraLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKNavCameraLog_onceToken, &__block_literal_global_31);
    v17 = (id)GEOGetVectorKitVKNavCameraLog_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_19F029000, v17, OS_LOG_TYPE_ERROR, "updatePuckOffset with no camera, reset puckZScale", (uint8_t *)&buf, 2u);
    }
LABEL_54:

    *(_BYTE *)(v16 + 208) = 0;
    *(_BYTE *)(v16 + 216) = 0;
  }
}

- (void)startWithPounce:(BOOL)a3 startLocation:(id)a4 startCourse:(double)a5 pounceCompletionHandler:(id)a6
{
  double var1;
  double var0;
  _BOOL4 v9;
  void (**v11)(id, uint64_t);
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  VKTimedAnimation *transitionAnimation;
  VKAttachedNavGestureCameraBehavior *WeakRetained;
  BOOL v21;
  id v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  long double v29;
  long double v30;
  long double v31;
  long double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  long double v42;
  long double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  __int128 v50;
  double value;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  double v56;
  _BYTE buf[56];
  uint64_t v58;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a3;
  v58 = *MEMORY[0x1E0C80C00];
  v11 = (void (**)(id, uint64_t))a6;
  if (BYTE4(self->_previousSearchItemCount))
  {
    if (GEOGetVectorKitVKNavCameraLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKNavCameraLog_onceToken, &__block_literal_global_31);
    v12 = (id)GEOGetVectorKitVKNavCameraLog_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F029000, v12, OS_LOG_TYPE_INFO, "Nav Camera Started With Pounce but is already tracking", buf, 2u);
    }

    if (v11)
      v11[2](v11, 1);
  }
  else
  {
    BYTE2(self->_taskContext.__cntrl_) = GEOConfigGetBOOL();
    if (GEOGetVectorKitVKNavCameraLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKNavCameraLog_onceToken, &__block_literal_global_31);
    v13 = (id)GEOGetVectorKitVKNavCameraLog_log;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = "NO";
      *(_DWORD *)buf = 136315907;
      if (v9)
        v14 = "YES";
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2049;
      *(double *)&buf[14] = var0;
      *(_WORD *)&buf[22] = 2049;
      *(double *)&buf[24] = var1;
      *(_WORD *)&buf[32] = 2048;
      *(double *)&buf[34] = a5;
      _os_log_impl(&dword_19F029000, v13, OS_LOG_TYPE_INFO, "Nav Camera Started With Pounce:%s to lat:%{private}f lon:%{private}f with course:%f", buf, 0x2Au);
    }

    -[VKCameraController edgeInsets](self, "edgeInsets");
    LODWORD(self->_minCameraPitch._value) = v15;
    HIDWORD(self->_minCameraPitch._value) = v16;
    LODWORD(self->_maxCameraPitch._value) = v17;
    HIDWORD(self->_maxCameraPitch._value) = v18;
    if (GEOConfigGetBOOL() && var0 <= 90.0 && var0 >= -90.0 && var1 <= 180.0 && var1 >= -180.0)
    {
      *(double *)buf = var0 * 0.0174532925;
      *(double *)&buf[8] = var1 * 0.0174532925;
      *(_QWORD *)&buf[16] = 0;
      v56 = a5 * 0.0174532925;
      -[VKNavCameraController updateLocation:andCourse:](self, "updateLocation:andCourse:", buf, &v56);
    }
    -[VKAnimation stop](self->_transitionAnimation, "stop");
    transitionAnimation = self->_transitionAnimation;
    self->_transitionAnimation = 0;

    -[VKNavCameraController _setNavCameraIsDetached:](self, "_setNavCameraIsDetached:", 0);
    WeakRetained = (VKAttachedNavGestureCameraBehavior *)objc_loadWeakRetained((id *)&self->_gestureBehavior);
    v21 = WeakRetained == self->_attachedGestureBehavior;

    if (!v21)
    {
      v22 = objc_loadWeakRetained((id *)&self->_gestureBehavior);
      objc_msgSend(v22, "transferGestureState:", self->_attachedGestureBehavior);

      objc_storeWeak((id *)&self->_gestureBehavior, self->_attachedGestureBehavior);
    }
    -[VKCameraController cameraDelegate](self, "cameraDelegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "mapLayerNavigationCameraHasStoppedPanning");

    self->_lastTargetStyleIdentifier = 0x3FF0000000000000;
    BYTE4(self->_previousSearchItemCount) = 1;
    objc_msgSend(*(id *)&self->_maxFramingDistance, "addObserver:", self);
    -[VKNavCameraController _updateSceneQuery](self, "_updateSceneQuery");
    -[VKNavCameraController _updateSceneStyles:updatePitchLimitOnly:](self, "_updateSceneStyles:updatePitchLimitOnly:", 0, 0);
    -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1);
    if (v9)
    {
      memset(&buf[24], 0, 32);
      -[VKCameraController vkCamera](self, "vkCamera");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "groundPlaneIntersectionPoint");
      v26 = v25;
      v28 = v27;

      v29 = exp(v28 * 6.28318531 + -3.14159265);
      v30 = atan(v29) * 2.0 + -1.57079633;
      v31 = fmod(v26 * 6.28318531, 6.28318531);
      v32 = fmod(v31 + 6.28318531, 6.28318531);
      *(long double *)buf = v30;
      *(double *)&buf[8] = v32 + -3.14159265;
      *(_QWORD *)&buf[16] = 0;
      -[VKCameraController vkCamera](self, "vkCamera");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "pitch");
      v35 = v34;
      *(double *)&buf[32] = v34;

      -[VKCameraController vkCamera](self, "vkCamera");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "yaw");
      v38 = -v37;
      *(double *)&buf[40] = -v37;

      -[VKCameraController vkCamera](self, "vkCamera");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = *(double *)(objc_msgSend(v39, "position") + 16);
      -[VKCameraController vkCamera](self, "vkCamera");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "pitch");
      v43 = v40 * 40075017.0 / cos(v42);
      *(long double *)&buf[24] = v43;

      -[VKNavCameraController calculateViewableScreenRect](self, "calculateViewableScreenRect");
      if (v46 >= v44 && v47 >= v45)
      {
        self->_maxHeightDeltaChangeVertical = v44;
        self->_halfPuckSize = v45;
        self->_viewableScreenRect._minimum._e[0] = v46;
        self->_viewableScreenRect._minimum._e[1] = v47;
      }
      self->_distanceFromTargetSpring._restingPosition = v43;
      self->_distanceFromTargetSpring._position = v43;
      self->_distanceFromTargetSpring._velocity = 0.0;
      -[VKNavCameraController puckScreenPoint](self, "puckScreenPoint");
      self->_screenPositionSpring._restingPosition._e[0] = v48;
      self->_screenPositionSpring._restingPosition._e[1] = v49;
      self->_screenPositionSpring._position._e[0] = v48;
      self->_screenPositionSpring._position._e[1] = v49;
      self->_screenPositionSpring._velocity._e[0] = 0.0;
      self->_screenPositionSpring._velocity._e[1] = 0.0;
      self->_pitchSpring._restingPosition = v35;
      self->_pitchSpring._position = v35;
      self->_pitchSpring._velocity = 0.0;
      self->_headingSpring._restingPosition = v38;
      self->_headingSpring._position = v38;
      self->_headingSpring._velocity = 0.0;
      v50 = *(_OWORD *)&buf[16];
      *(_OWORD *)&self->_cameraFrame._target.latitude._value = *(_OWORD *)buf;
      *(_OWORD *)&self->_cameraFrame._target.altitude._value = v50;
      HIDWORD(v48) = *(_DWORD *)&buf[36];
      *(_OWORD *)&self->_cameraFrame._pitch._value = *(_OWORD *)&buf[32];
      self->_cameraFrame._roll._value = *(double *)&buf[48];
      LODWORD(v48) = 1.5;
      -[VKNavCameraController animateCameraWithDuration:fromFrame:completionHandler:](self, "animateCameraWithDuration:fromFrame:completionHandler:", buf, v11, v48);
    }
    else
    {
      self->_lastTargetStyleIdentifier = 0x3FF0000000000000;
      *(int64x2_t *)&self->_routeCoordinate.index = vdupq_n_s64(0xC00921FB54442D18);
      self->_routeFocusCoordinate.latitude._value = 0.0;
      value = self->_puckCourse._value;
      self->_headingSpring._restingPosition = value;
      self->_headingSpring._position = value;
      self->_headingSpring._velocity = 0.0;
      -[VKNavCameraController updateCameraState](self, "updateCameraState");
      -[VKNavCameraController resetSpringsToResting](self, "resetSpringsToResting");
      -[VKNavCameraController stopIgnoreStyleChange](self, "stopIgnoreStyleChange");
      -[VKNavCameraController currentCameraFrame](self, "currentCameraFrame");
      v52 = *(_OWORD *)&buf[16];
      *(_OWORD *)&self->_cameraFrame._target.latitude._value = *(_OWORD *)buf;
      *(_OWORD *)&self->_cameraFrame._target.altitude._value = v52;
      *(_OWORD *)&self->_cameraFrame._pitch._value = *(_OWORD *)&buf[32];
      self->_cameraFrame._roll._value = *(double *)&buf[48];
      v54 = *(_OWORD *)&self->_cameraFrame._target.altitude._value;
      v53 = *(_OWORD *)&self->_cameraFrame._pitch._value;
      v55 = *(_OWORD *)&self->_cameraFrame._target.latitude._value;
      self->_lastCalculatedCameraFrame._roll._value = self->_cameraFrame._roll._value;
      *(_OWORD *)&self->_lastCalculatedCameraFrame._target.altitude._value = v54;
      *(_OWORD *)&self->_lastCalculatedCameraFrame._pitch._value = v53;
      *(_OWORD *)&self->_lastCalculatedCameraFrame._target.latitude._value = v55;
      if (v11)
        v11[2](v11, 1);
    }
    -[VKNavCameraController updatePuckOffset:](self, "updatePuckOffset:", 1);
  }

}

- (id)_detachedGestureController
{
  VKDetachedNavGestureCameraBehavior *detachedGestureBehavior;
  VKDetachedNavGestureCameraBehavior *v4;
  VKDetachedNavGestureCameraBehavior *v5;

  detachedGestureBehavior = self->_detachedGestureBehavior;
  if (!detachedGestureBehavior)
  {
    v4 = -[VKDetachedNavGestureCameraBehavior initWithNavCameraController:]([VKDetachedNavGestureCameraBehavior alloc], "initWithNavCameraController:", self);
    v5 = self->_detachedGestureBehavior;
    self->_detachedGestureBehavior = v4;

    detachedGestureBehavior = self->_detachedGestureBehavior;
  }
  return detachedGestureBehavior;
}

- (void)_setDetached:(BOOL)a3
{
  void *v4;
  VKAttachedNavGestureCameraBehavior *v5;
  void *v6;
  VKAttachedNavGestureCameraBehavior *WeakRetained;
  id v8;
  VKAttachedNavGestureCameraBehavior *obj;

  if (self->_isDetached == a3)
  {
    obj = 0;
  }
  else
  {
    self->_isDetached = a3;
    if (a3)
    {
      -[VKCameraController cameraDelegate](self, "cameraDelegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "mapLayerNavigationCameraHasStartedPanning");

      -[VKNavCameraController _setNavCameraIsDetached:](self, "_setNavCameraIsDetached:", 1);
      -[VKNavCameraController _detachedGestureController](self, "_detachedGestureController");
      v5 = (VKAttachedNavGestureCameraBehavior *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[VKCameraController cameraDelegate](self, "cameraDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "mapLayerNavigationCameraHasStoppedPanning");

      -[VKNavCameraController resetSpringsToResting](self, "resetSpringsToResting");
      -[VKNavCameraController _setNavCameraIsDetached:](self, "_setNavCameraIsDetached:", 0);
      v5 = self->_attachedGestureBehavior;
    }
    obj = v5;
    WeakRetained = (VKAttachedNavGestureCameraBehavior *)objc_loadWeakRetained((id *)&self->_gestureBehavior);

    if (obj != WeakRetained)
    {
      v8 = objc_loadWeakRetained((id *)&self->_gestureBehavior);
      objc_msgSend(v8, "transferGestureState:", obj);

      objc_storeWeak((id *)&self->_gestureBehavior, obj);
      -[VKNavCameraController updatePuckOffset:](self, "updatePuckOffset:", !self->_isDetached);
    }
    -[VKNavCameraController _setNeedsUpdate](self, "_setNeedsUpdate");
  }

}

- (void)zoom:(double)a3 withFocusPoint:(CGPoint)a4 completionHandler:(id)a5
{
  double y;
  double x;
  id v9;
  id WeakRetained;
  _QWORD v11[5];
  id v12;

  y = a4.y;
  x = a4.x;
  v9 = a5;
  if (BYTE1(self->_framingScreenRect._maximum._e[0]))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_gestureBehavior);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __63__VKNavCameraController_zoom_withFocusPoint_completionHandler___block_invoke;
    v11[3] = &unk_1E42F7970;
    v11[4] = self;
    v12 = v9;
    objc_msgSend(WeakRetained, "zoom:withFocusPoint:completionHandler:", v11, a3, x, y);

  }
}

- (void)startIgnoreStyleChangeTimer
{
  NSObject *v3;
  uint8_t v4[16];

  if (GEOGetVectorKitVKNavCameraLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKNavCameraLog_onceToken, &__block_literal_global_31);
  v3 = (id)GEOGetVectorKitVKNavCameraLog_log;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "startIgnoreStyleChange", v4, 2u);
  }

  self->_ignoreStyleChangeStartTime = self->_previousUpdateTime;
  self->_isIgnoringStyleChange = 1;
}

- (void)stopIgnoreStyleChange
{
  self->_isIgnoringStyleChange = 0;
}

- (void)startPinchingWithFocusPoint:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;

  if (BYTE1(self->_framingScreenRect._maximum._e[0]))
  {
    y = a3.y;
    x = a3.x;
    -[VKNavCameraController stopAnimations](self, "stopAnimations");
    self->_zooming = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_gestureBehavior);
    objc_msgSend(WeakRetained, "startPinchingWithFocusPoint:", x, y);

    -[VKNavCameraController _setNeedsUpdate](self, "_setNeedsUpdate");
  }
}

- (void)updatePinchWithFocusPoint:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5
{
  double y;
  double x;
  id WeakRetained;

  if (self->_zooming)
  {
    y = a3.y;
    x = a3.x;
    WeakRetained = objc_loadWeakRetained((id *)&self->_gestureBehavior);
    objc_msgSend(WeakRetained, "updatePinchWithFocusPoint:oldFactor:newFactor:", x, y, a4, a5);

    -[VKNavCameraController _setNeedsUpdate](self, "_setNeedsUpdate");
  }
}

- (void)stopPinchingWithFocusPoint:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;

  if (self->_zooming)
  {
    y = a3.y;
    x = a3.x;
    WeakRetained = objc_loadWeakRetained((id *)&self->_gestureBehavior);
    objc_msgSend(WeakRetained, "stopPinchingWithFocusPoint:", x, y);

    -[VKNavCameraController _setNeedsUpdate](self, "_setNeedsUpdate");
    -[VKNavCameraController returnToTrackingWithDelay:resetZoom:](self, "returnToTrackingWithDelay:resetZoom:", 0, *((float *)self->_framingScreenRect._maximum._e + 1));
    if (self->_isDetached)
    {
      -[VKNavCameraController snapMapIfNecessary:](self, "snapMapIfNecessary:", 1);
    }
    else
    {
      -[VKNavCameraController _snapPitch](self, "_snapPitch");
      -[VKNavCameraController _snapHeading](self, "_snapHeading");
    }
    -[VKNavCameraController startIgnoreStyleChangeTimer](self, "startIgnoreStyleChangeTimer");
    self->_zooming = 0;
  }
}

- (void)setZoomScale:(double)a3
{
  _BOOL8 v5;
  _BOOL8 v6;
  double v7;
  double v8;

  if (*(double *)&self->_lastTargetStyleIdentifier != a3)
  {
    v5 = -[VKNavCameraController _canZoomIn](self, "_canZoomIn");
    v6 = -[VKNavCameraController _canZoomOut](self, "_canZoomOut");
    *(double *)&self->_lastTargetStyleIdentifier = a3;
    GEOConfigGetDouble();
    v8 = fmin(fmax(v7, 10.0), 100000.0);
    if (*(double *)&self->_lastTargetStyleIdentifier > v8)
    {
      *(double *)&self->_lastTargetStyleIdentifier = v8 * 0.5;
      -[VKNavCameraController _setDetached:](self, "_setDetached:", 1);
    }
    -[VKNavCameraController _updateObserverCouldZoomIn:couldZoomOut:](self, "_updateObserverCouldZoomIn:couldZoomOut:", v5, v6);
    -[VKNavCameraController _setNeedsUpdate](self, "_setNeedsUpdate");
  }
}

- (void)_updateObserverCouldZoomIn:(BOOL)a3 couldZoomOut:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL8 v7;
  _BOOL8 v8;
  double v9;
  double v10;
  _BOOL4 v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v4 = a4;
  v5 = a3;
  v7 = -[VKNavCameraController _canZoomIn](self, "_canZoomIn");
  v8 = -[VKNavCameraController _canZoomOut](self, "_canZoomOut");
  v9 = *(double *)&self->_lastTargetStyleIdentifier;
  v10 = fabs(v9 + -1.0);
  v11 = v10 <= fabs(v9 + 1.0) * 2.22044605e-14;
  v12 = v10 < 2.22507386e-308 || v11;
  if (v7 != v5)
  {
    -[VKCameraController cameraDelegate](self, "cameraDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mapLayerCanZoomInDidChange:", v7);

  }
  if (v8 != v4)
  {
    -[VKCameraController cameraDelegate](self, "cameraDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "mapLayerCanZoomOutDidChange:", v8);

  }
  if (v12)
  {
    if (!BYTE1(self->_taskContext.__cntrl_))
      return;
    -[VKCameraController cameraDelegate](self, "cameraDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "mapLayerNavigationCameraDidReturnToDefaultZoom");
    v16 = 0;
  }
  else
  {
    if (BYTE1(self->_taskContext.__cntrl_))
      return;
    -[VKCameraController cameraDelegate](self, "cameraDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "mapLayerNavigationCameraDidLeaveDefaultZoom");
    v16 = 1;
  }

  BYTE1(self->_taskContext.__cntrl_) = v16;
}

- (void)startPanningAtPoint:(CGPoint)a3 panAtStartPoint:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  id WeakRetained;

  if (LOBYTE(self->_framingScreenRect._maximum._e[0]))
  {
    v4 = a4;
    y = a3.y;
    x = a3.x;
    if (!self->_zooming || self->_panning)
    {
      -[VKNavCameraController stopAnimations](self, "stopAnimations");
      self->_panning = 1;
      -[VKNavCameraController _setDetached:](self, "_setDetached:", 1);
      WeakRetained = objc_loadWeakRetained((id *)&self->_gestureBehavior);
      objc_msgSend(WeakRetained, "startPanningAtPoint:panAtStartPoint:", v4, x, y);

      -[VKNavCameraController _setNeedsUpdate](self, "_setNeedsUpdate");
    }
  }
}

- (void)updatePanWithTranslation:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;

  if (self->_panning)
  {
    y = a3.y;
    x = a3.x;
    WeakRetained = objc_loadWeakRetained((id *)&self->_gestureBehavior);
    objc_msgSend(WeakRetained, "updatePanWithTranslation:", x, y);

    -[VKNavCameraController _setNeedsUpdate](self, "_setNeedsUpdate");
  }
}

- (void)stopPanningAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;

  if (self->_panning)
  {
    y = a3.y;
    x = a3.x;
    WeakRetained = objc_loadWeakRetained((id *)&self->_gestureBehavior);
    objc_msgSend(WeakRetained, "stopPanningAtPoint:", x, y);

    -[VKNavCameraController _setNeedsUpdate](self, "_setNeedsUpdate");
    -[VKNavCameraController returnToTrackingWithDelay:resetZoom:](self, "returnToTrackingWithDelay:resetZoom:", 0, *((float *)self->_framingScreenRect._maximum._e + 1));
    self->_panning = 0;
    -[VKNavCameraController startIgnoreStyleChangeTimer](self, "startIgnoreStyleChangeTimer");
  }
}

- (void)startRotatingWithFocusPoint:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;

  if (BYTE3(self->_framingScreenRect._maximum._e[0]))
  {
    y = a3.y;
    x = a3.x;
    -[VKNavCameraController stopAnimations](self, "stopAnimations");
    self->_rotating = 1;
    -[VKNavCameraController _setDetached:](self, "_setDetached:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_gestureBehavior);
    objc_msgSend(WeakRetained, "startRotatingWithFocusPoint:", x, y);

    -[VKNavCameraController _setNeedsUpdate](self, "_setNeedsUpdate");
  }
}

- (void)updateRotationWithFocusPoint:(CGPoint)a3 newValue:(double)a4
{
  double y;
  double x;
  id WeakRetained;

  if (self->_rotating)
  {
    y = a3.y;
    x = a3.x;
    WeakRetained = objc_loadWeakRetained((id *)&self->_gestureBehavior);
    objc_msgSend(WeakRetained, "updateRotationWithFocusPoint:newValue:", x, y, a4);

    -[VKNavCameraController _setNeedsUpdate](self, "_setNeedsUpdate");
  }
}

- (void)stopRotatingWithFocusPoint:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;

  if (self->_rotating)
  {
    y = a3.y;
    x = a3.x;
    WeakRetained = objc_loadWeakRetained((id *)&self->_gestureBehavior);
    objc_msgSend(WeakRetained, "stopRotatingWithFocusPoint:", x, y);

    -[VKNavCameraController _setNeedsUpdate](self, "_setNeedsUpdate");
    -[VKNavCameraController returnToTrackingWithDelay:resetZoom:](self, "returnToTrackingWithDelay:resetZoom:", 0, *((float *)self->_framingScreenRect._maximum._e + 1));
    if (self->_isDetached)
    {
      -[VKNavCameraController snapMapIfNecessary:](self, "snapMapIfNecessary:", 1);
    }
    else
    {
      -[VKNavCameraController _snapPitch](self, "_snapPitch");
      -[VKNavCameraController _snapHeading](self, "_snapHeading");
    }
    self->_rotating = 0;
  }
}

- (void)startPitchingWithFocusPoint:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;

  if (BYTE2(self->_framingScreenRect._maximum._e[0]))
  {
    y = a3.y;
    x = a3.x;
    -[VKNavCameraController stopAnimations](self, "stopAnimations");
    self->_pitching = 1;
    -[VKNavCameraController _setDetached:](self, "_setDetached:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_gestureBehavior);
    objc_msgSend(WeakRetained, "startPitchingWithFocusPoint:", x, y);

    -[VKNavCameraController _setNeedsUpdate](self, "_setNeedsUpdate");
  }
}

- (void)updatePitchWithFocusPoint:(CGPoint)a3 translation:(double)a4
{
  double y;
  double x;
  id WeakRetained;

  if (self->_pitching)
  {
    y = a3.y;
    x = a3.x;
    WeakRetained = objc_loadWeakRetained((id *)&self->_gestureBehavior);
    objc_msgSend(WeakRetained, "updatePitchWithFocusPoint:translation:", x, y, a4);

    -[VKNavCameraController _setNeedsUpdate](self, "_setNeedsUpdate");
  }
}

- (void)updatePitchWithFocusPoint:(CGPoint)a3 degrees:(double)a4
{
  double y;
  double x;
  id WeakRetained;

  if (self->_pitching)
  {
    y = a3.y;
    x = a3.x;
    WeakRetained = objc_loadWeakRetained((id *)&self->_gestureBehavior);
    objc_msgSend(WeakRetained, "updatePitchWithFocusPoint:degrees:", x, y, a4);

    -[VKNavCameraController _setNeedsUpdate](self, "_setNeedsUpdate");
  }
}

- (void)stopPitchingWithFocusPoint:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;

  if (self->_pitching)
  {
    y = a3.y;
    x = a3.x;
    WeakRetained = objc_loadWeakRetained((id *)&self->_gestureBehavior);
    objc_msgSend(WeakRetained, "stopPitchingWithFocusPoint:", x, y);

    -[VKNavCameraController _setNeedsUpdate](self, "_setNeedsUpdate");
    -[VKNavCameraController returnToTrackingWithDelay:resetZoom:](self, "returnToTrackingWithDelay:resetZoom:", 0, *((float *)self->_framingScreenRect._maximum._e + 1));
    if (self->_isDetached)
      -[VKNavCameraController snapMapIfNecessary:](self, "snapMapIfNecessary:", 1);
    else
      -[VKNavCameraController _snapPitch](self, "_snapPitch");
    self->_pitching = 0;
  }
}

- (BOOL)tapAtPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)isGesturing
{
  if (self->_panning)
    return 1;
  if (self->_zooming)
    return 1;
  if (self->_rotating)
    return 1;
  return self->_pitching;
}

- (void)puckAnimator:(id)a3 runAnimation:(id)a4
{
  VKAnimation *v5;

  v5 = (VKAnimation *)a4;
  md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), v5);

}

- (void)puckAnimator:(id)a3 updatedPosition:(const void *)a4 course:(const void *)a5 polylineCoordinate:(PolylineCoordinate)a6
{
  NavCameraPixelFrameRate *v9;
  NavCameraPixelFrameRate *v10;
  double v11;
  id v12;

  v12 = a3;
  -[VKNavCameraController updateLocation:andCourse:](self, "updateLocation:andCourse:", a4, a5);
  objc_msgSend(v12, "lastProjectedPosition");
  self->_pixelChangeFrameRate.__end_ = v9;
  self->_pixelChangeFrameRate.__end_cap_.__value_ = v10;
  self->_lastProjectedPosition._e[0] = v11;

}

- (optional<double>)puckAnimator:(id)a3 getElevationWithCoordinate:(const void *)a4
{
  void *v6;
  char v7;
  ValueUnion v8;
  optional<double> result;

  v6 = -[VKCameraController mapDataAccess](self, "mapDataAccess", a3);
  if (v6)
  {
    md::MapDataAccess::heightAtCoordinate((unsigned __int8 *)-[VKCameraController mapDataAccess](self, "mapDataAccess"), a4);
    if (!v7)
      v6 = 0;
    *(_QWORD *)&v8.type = 1;
  }
  else
  {
    v8.type = 0.0;
  }
  result._value = v8;
  result._hasValue = (char)v6;
  return result;
}

- (void)updateLocation:(const void *)a3 andCourse:(const void *)a4
{
  Coordinate3D<geo::Radians, double> *p_puckCoordinate;
  __int128 v8;
  void *v9;
  double value;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int i;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  int v33;
  float v34;
  float v35;
  float v36;
  unsigned int v37;
  float v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  VKNavContext *v45;
  VKNavContext *v46;
  double v47;
  double v48;
  double v49;
  char v50;
  double v51;
  long double v52;
  long double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  uint8_t buf[16];

  p_puckCoordinate = &self->_puckCoordinate;
  if (*(double *)a3 != self->_puckCoordinate.latitude._value
    || *((double *)a3 + 1) != self->_puckCoordinate.longitude._value
    || *((double *)a3 + 2) != self->_puckCoordinate.altitude._value
    || *((float *)&self->_locationCoordinate.latitude + 1) < 0.0
    && (objc_msgSend(*(id *)&self->_maxFramingDistance, "routeMatch"),
        v54 = (void *)objc_claimAutoreleasedReturnValue(),
        v54,
        v54))
  {
    v8 = *(_OWORD *)a3;
    p_puckCoordinate->altitude._value = *((double *)a3 + 2);
    *(_OWORD *)&p_puckCoordinate->latitude._value = v8;
    objc_msgSend(*(id *)&self->_maxFramingDistance, "routeMatch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      value = p_puckCoordinate->latitude._value;
      v11 = p_puckCoordinate->longitude._value;
      objc_msgSend(*(id *)&self->_maxFramingDistance, "route");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)&self->_maxFramingDistance, "routeMatch");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "routeCoordinate");

      v15 = objc_msgSend(v12, "routeCoordinateForDistance:beforeRouteCoordinate:", v14, 50.0);
      v16 = objc_msgSend(v12, "routeCoordinateForDistance:afterRouteCoordinate:", v14, 50.0);
      objc_msgSend(MEMORY[0x1E0D27370], "iteratorWithRange:", v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "advance");
      objc_msgSend(v12, "pointAtRouteCoordinate:", objc_msgSend(v17, "previous"));
      v19 = v18;
      v21 = v20;
      v56 = v11 * 57.2957795;
      v57 = value * 57.2957795;
      v22 = 1.79769313e308;
      for (i = objc_msgSend(v17, "isCurrentValid", ((v18 - value * 57.2957795) * (v18 - value * 57.2957795)+ (v20 - v11 * 57.2957795) * (v20 - v11 * 57.2957795))* 0.000002); i; i = objc_msgSend(v17, "isCurrentValid", *(_QWORD *)&v55))
      {
        objc_msgSend(v12, "pointAtRouteCoordinate:", objc_msgSend(v17, "current"));
        v25 = v24;
        v27 = v26;
        v28 = v24 - v19;
        v29 = v26 - v21;
        v30 = v28 * v28 + v29 * v29;
        v31 = 0.0;
        if (v30 > 1.0e-15)
          v31 = fmin(fmax((v28 * (v57 - v19) + v29 * (v56 - v21)) / v30, 0.0), 1.0);
        v32 = objc_msgSend(v17, "currentSegmentRange");
        if (v33 == (_DWORD)v32 || v33 - 1 == (_DWORD)v32 && fabsf(v34) <= 0.01)
        {
          v35 = v31;
          v36 = *((float *)&v32 + 1)
              + (float)((float)((float)(v34 + (float)(v33 - v32)) - *((float *)&v32 + 1)) * v35);
          v37 = vcvtms_u32_f32(v36) + v32;
          v38 = v36 - floorf(v36);
          if (v36 >= 1.0)
            v36 = v38;
          else
            v37 = v32;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_19F029000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: isSingleSegment", buf, 2u);
          }
          v37 = *MEMORY[0x1E0D26A38];
          v36 = *(float *)(MEMORY[0x1E0D26A38] + 4);
        }
        *(_QWORD *)&v39 = v37 | ((unint64_t)LODWORD(v36) << 32);
        objc_msgSend(v12, "distanceBetweenRouteCoordinate:andRouteCoordinate:", v14, *(_QWORD *)&v39);
        v41 = (v57 - (v19 + v31 * v28)) * (v57 - (v19 + v31 * v28))
            + (v56 - (v21 + v31 * v29)) * (v56 - (v21 + v31 * v29))
            + v55 * fabs(v40);
        if (v41 < v22)
        {
          self->_locationCoordinate.latitude = v39;
          v22 = v41;
        }
        objc_msgSend(v17, "advance");
        v19 = v25;
        v21 = v27;
      }
      objc_msgSend(*(id *)&self->_maxFramingDistance, "route");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "pointWithAltitudeCorrectionAtRouteCoordinate:", *(_QWORD *)&self->_locationCoordinate.latitude);
      v44 = v43;
      v46 = v45;
      v48 = v47;

      self->_framingDistanceAfterManeuver = v44;
      self->_navContext = v46;
      p_puckCoordinate->altitude._value = v48;

    }
    else if (-[VKCameraController mapDataAccess](self, "mapDataAccess"))
    {
      md::MapDataAccess::heightAtCoordinate((unsigned __int8 *)-[VKCameraController mapDataAccess](self, "mapDataAccess"), p_puckCoordinate);
      if (v50)
        v51 = v49;
      else
        v51 = 0.0;
      p_puckCoordinate->altitude._value = v51;
    }
    if (!LOBYTE(self->_requesteDisplayRateSampler._count))
      p_puckCoordinate->altitude._value = 0.0;
    -[VKNavCameraController _setNeedsUpdate](self, "_setNeedsUpdate");
  }
  v52 = fmod(-*(double *)a4, 6.28318531);
  v53 = fmod(v52 + 6.28318531, 6.28318531);
  if (self->_puckCourse._value != v53)
  {
    self->_puckCourse._value = v53;
    -[VKNavCameraController _setNeedsUpdate](self, "_setNeedsUpdate");
  }
}

- (void)projectCoordinate:(id)a3 toPoint:(CGPoint *)a4
{
  double var1;
  double var0;
  CGFloat v7;
  CGFloat v8;
  id WeakRetained;

  var1 = a3.var1;
  var0 = a3.var0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
  objc_msgSend(WeakRetained, "convertCoordinateToPoint:", var0, var1);
  a4->x = v7;
  a4->y = v8;

}

- (BOOL)wantsTimerTick
{
  return self->_needsUpdate;
}

- (void)updateCameraState
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v8;

  if (self->_isIgnoringStyleChange)
  {
    -[VKNavCameraController calculateHeading](self, "calculateHeading");
    self->_headingSpring._restingPosition = v8;
    -[VKNavCameraController _updateForAnimatedEdgeInsets](self, "_updateForAnimatedEdgeInsets");
  }
  else
  {
    -[VKNavCameraController calculateViewableScreenRect](self, "calculateViewableScreenRect");
    if (v5 >= v3 && v6 >= v4)
    {
      self->_maxHeightDeltaChangeVertical = v3;
      self->_halfPuckSize = v4;
      self->_viewableScreenRect._minimum._e[0] = v5;
      self->_viewableScreenRect._minimum._e[1] = v6;
    }
    if (self->_cameraType == 1)
    {
      -[VKNavCameraController updateSpringsForFramingCamera](self, "updateSpringsForFramingCamera");
    }
    else if (!self->_cameraType)
    {
      -[VKNavCameraController updateSpringsForTrackingCamera](self, "updateSpringsForTrackingCamera");
    }
  }
}

- (void)resetSpringsToResting
{
  self->_pitchSpring._position = self->_pitchSpring._restingPosition;
  self->_pitchSpring._velocity = 0.0;
  self->_headingSpring._position = self->_headingSpring._restingPosition;
  self->_headingSpring._velocity = 0.0;
  self->_distanceFromTargetSpring._position = self->_distanceFromTargetSpring._restingPosition;
  self->_distanceFromTargetSpring._velocity = 0.0;
  self->_screenPositionSpring._position = self->_screenPositionSpring._restingPosition;
  self->_screenPositionSpring._velocity._e[0] = 0.0;
  self->_screenPositionSpring._velocity._e[1] = 0.0;
}

- (void)_updateClipPlanes
{
  double v3;
  double v4;
  double v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  uint64_t v16;
  std::__shared_weak_count *v17;

  v3 = self->_lastProjectedPosition._e[1];
  -[VKCameraController camera](self, "camera");
  -[VKCameraController camera](self, "camera");
  v4 = *(double *)(v14 + 32);
  -[VKCameraController camera](self, "camera");
  v5 = fmax(*(double *)(v12 + 32) * v3, 600.0);
  *(double *)(v16 + 464) = fmax(v4 * 0.01, 0.01);
  *(double *)(v16 + 472) = v5;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)())v13->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  if (v15)
  {
    v8 = (unint64_t *)&v15->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)())v15->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  if (v17)
  {
    v10 = (unint64_t *)&v17->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)())v17->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v17);
    }
  }
}

- (int64_t)defaultDisplayRate
{
  double v3;
  double v4;
  double v5;
  Unit<geo::RadianUnitDescription, double> *p_longitude;
  double sum;
  Unit<geo::RadianUnitDescription, double> *v8;
  double value;
  double v10;
  double v11;
  int64_t v13;
  double min;
  LabelMetrics *cameraManager;
  LabelMetrics *v16;

  v3 = self->_previousUpdateTime - self->_lastSARUpdateTime;
  if (BYTE2(self->_taskContext.__cntrl_))
  {
    -[VKNavCameraController _calculateMaxPixelChangeAndUpdateCorners](self, "_calculateMaxPixelChangeAndUpdateCorners");
    v5 = v4;
    p_longitude = &self->_cornerCoordinates[3].longitude;
    if (LOBYTE(self->_pixelSamples._avg))
    {
      sum = self->_pixelSamples._sum;
      v8 = &p_longitude[*(_QWORD *)&sum];
      value = v8[6]._value;
      v8[6]._value = v5;
      *(_QWORD *)&self->_pixelSamples._sum = (*(_QWORD *)&sum + 1) % 0x3CuLL;
      v10 = fmax(self->_cornerCoordinates[3].altitude._value, v5);
      p_longitude->_value = fmin(p_longitude->_value, v5);
      self->_cornerCoordinates[3].altitude._value = v10;
      v11 = self->_pixelSamples._max - value + v5;
      self->_pixelSamples._min = v11 * 0.0166666667;
      self->_pixelSamples._max = v11;
    }
    else
    {
      LOBYTE(self->_pixelSamples._avg) = 1;
      self->_pixelSamples._sum = 0.0;
      p_longitude->_value = v4;
      self->_cornerCoordinates[3].altitude._value = v4;
      self->_pixelSamples._min = v4;
      self->_pixelSamples._max = v4 * 60.0;
      *(double *)&self->_pixelSamples._idx._hasValue = v4;
      self->_pixelSamples._idx._value.type = v4;
      self->_pixelSamples._samples.__elems_[0] = v4;
      self->_pixelSamples._samples.__elems_[1] = v4;
      self->_pixelSamples._samples.__elems_[2] = v4;
      self->_pixelSamples._samples.__elems_[3] = v4;
      self->_pixelSamples._samples.__elems_[4] = v4;
      self->_pixelSamples._samples.__elems_[5] = v4;
      self->_pixelSamples._samples.__elems_[6] = v4;
      self->_pixelSamples._samples.__elems_[7] = v4;
      self->_pixelSamples._samples.__elems_[8] = v4;
      self->_pixelSamples._samples.__elems_[9] = v4;
      self->_pixelSamples._samples.__elems_[10] = v4;
      self->_pixelSamples._samples.__elems_[11] = v4;
      self->_pixelSamples._samples.__elems_[12] = v4;
      self->_pixelSamples._samples.__elems_[13] = v4;
      self->_pixelSamples._samples.__elems_[14] = v4;
      self->_pixelSamples._samples.__elems_[15] = v4;
      self->_pixelSamples._samples.__elems_[16] = v4;
      self->_pixelSamples._samples.__elems_[17] = v4;
      self->_pixelSamples._samples.__elems_[18] = v4;
      self->_pixelSamples._samples.__elems_[19] = v4;
      self->_pixelSamples._samples.__elems_[20] = v4;
      self->_pixelSamples._samples.__elems_[21] = v4;
      self->_pixelSamples._samples.__elems_[22] = v4;
      self->_pixelSamples._samples.__elems_[23] = v4;
      self->_pixelSamples._samples.__elems_[24] = v4;
      self->_pixelSamples._samples.__elems_[25] = v4;
      self->_pixelSamples._samples.__elems_[26] = v4;
      self->_pixelSamples._samples.__elems_[27] = v4;
      self->_pixelSamples._samples.__elems_[28] = v4;
      self->_pixelSamples._samples.__elems_[29] = v4;
      self->_pixelSamples._samples.__elems_[30] = v4;
      self->_pixelSamples._samples.__elems_[31] = v4;
      self->_pixelSamples._samples.__elems_[32] = v4;
      self->_pixelSamples._samples.__elems_[33] = v4;
      self->_pixelSamples._samples.__elems_[34] = v4;
      self->_pixelSamples._samples.__elems_[35] = v4;
      self->_pixelSamples._samples.__elems_[36] = v4;
      self->_pixelSamples._samples.__elems_[37] = v4;
      self->_pixelSamples._samples.__elems_[38] = v4;
      self->_pixelSamples._samples.__elems_[39] = v4;
      self->_pixelSamples._samples.__elems_[40] = v4;
      self->_pixelSamples._samples.__elems_[41] = v4;
      self->_pixelSamples._samples.__elems_[42] = v4;
      self->_pixelSamples._samples.__elems_[43] = v4;
      self->_pixelSamples._samples.__elems_[44] = v4;
      self->_pixelSamples._samples.__elems_[45] = v4;
      self->_pixelSamples._samples.__elems_[46] = v4;
      self->_pixelSamples._samples.__elems_[47] = v4;
      self->_pixelSamples._samples.__elems_[48] = v4;
      self->_pixelSamples._samples.__elems_[49] = v4;
      self->_pixelSamples._samples.__elems_[50] = v4;
      self->_pixelSamples._samples.__elems_[51] = v4;
      self->_pixelSamples._samples.__elems_[52] = v4;
      self->_pixelSamples._samples.__elems_[53] = v4;
      self->_pixelSamples._samples.__elems_[54] = v4;
      self->_pixelSamples._samples.__elems_[55] = v4;
      self->_pixelSamples._samples.__elems_[56] = v4;
      self->_pixelSamples._samples.__elems_[57] = v4;
    }
    v13 = -[VKCameraController baseDisplayRate](self, "baseDisplayRate");
    if (-[VKNavCameraController _hasRunningAnimation](self, "_hasRunningAnimation")
      || self->_isDetached
      || -[VKCameraController edgeInsetsAnimating](self, "edgeInsetsAnimating")
      || v3 < 3.1)
    {
      v13 = -[VKCameraController maxDisplayRate](self, "maxDisplayRate");
      min = self->_pixelSamples._min;
    }
    else
    {
      min = self->_pixelSamples._min;
      cameraManager = (LabelMetrics *)self->_cameraManager;
      v16 = self->_labelMetrics.__ptr_.__value_;
      if (cameraManager != v16)
      {
        while (*(double *)cameraManager <= min)
        {
          cameraManager = (LabelMetrics *)((char *)cameraManager + 16);
          if (cameraManager == v16)
            goto LABEL_11;
        }
        v13 = *((_QWORD *)cameraManager + 1);
      }
    }
LABEL_11:
    printf("pixelChange: %f, avg: %f. rate: %ld\n", v5, min, v13);
    return v13;
  }
  else if (-[VKNavCameraController _hasRunningAnimation](self, "_hasRunningAnimation")
         || self->_isDetached
         || -[VKCameraController edgeInsetsAnimating](self, "edgeInsetsAnimating")
         || v3 < 3.1)
  {
    return -[VKCameraController maxDisplayRate](self, "maxDisplayRate");
  }
  else
  {
    return -[VKCameraController baseDisplayRate](self, "baseDisplayRate");
  }
}

- (int64_t)displayRate
{
  void *v3;
  uint64_t v4;

  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "navDisplayRate");

  switch(v4)
  {
    case 0:
      return -[VKNavCameraController defaultDisplayRate](self, "defaultDisplayRate");
    case 2:
      return 30;
    case 3:
      return 60;
  }
  return 1;
}

- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4
{
  id WeakRetained;
  int8x8_t *v8;
  int8x8_t v9;
  uint8x8_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  int8x8_t v18;
  uint8x8_t v19;
  unint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  double v33;
  VKTimedAnimation *transitionAnimation;
  __int128 v35;
  __int128 v36;
  unint64_t *v37;
  unint64_t v38;
  uint64_t v39;
  __int128 v40;
  unint64_t *v41;
  unint64_t v42;
  __n128 v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  __int128 v50;
  double v51;
  NSObject *v52;
  double sum;
  RunLoopController *v54;
  uint64_t v55;
  uint64_t var0;
  int v57;
  int v58;
  int v59;
  int v60;
  double v61;
  double v62;
  double *v63;
  double avg;
  double v65;
  double v66;
  double v67;
  unint64_t v68;
  int64x2_t v69;
  __int128 v70;
  __int128 v71;
  double v72;
  int64x2_t v73;
  __int128 v74;
  __int128 v75;
  double value;
  __int128 buf;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
  v8 = *(int8x8_t **)(objc_msgSend(WeakRetained, "mapEngine") + 1120);
  v9 = v8[2];
  if (!*(_QWORD *)&v9)
    goto LABEL_21;
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
  if (!v12 || (v13 = (_QWORD *)*v12) == 0)
  {
LABEL_21:

    goto LABEL_22;
  }
  if (v10.u32[0] < 2uLL)
  {
    v14 = *(_QWORD *)&v9 - 1;
    while (1)
    {
      v16 = v13[1];
      if (v16 == 0x17767EADC5B287BLL)
      {
        if (v13[2] == 0x17767EADC5B287BLL)
          goto LABEL_46;
      }
      else if ((v16 & v14) != v11)
      {
        goto LABEL_21;
      }
      v13 = (_QWORD *)*v13;
      if (!v13)
        goto LABEL_21;
    }
  }
  while (1)
  {
    v15 = v13[1];
    if (v15 == 0x17767EADC5B287BLL)
      break;
    if (v15 >= *(_QWORD *)&v9)
      v15 %= *(_QWORD *)&v9;
    if (v15 != v11)
      goto LABEL_21;
LABEL_11:
    v13 = (_QWORD *)*v13;
    if (!v13)
      goto LABEL_21;
  }
  if (v13[2] != 0x17767EADC5B287BLL)
    goto LABEL_11;
LABEL_46:
  v26 = v13[5];

  if (v26)
    *(_DWORD *)(v26 + 288) = 2;
LABEL_22:
  if (!self->_isIgnoringStyleChange || self->_previousUpdateTime - self->_ignoreStyleChangeStartTime > 10.0)
    -[VKNavCameraController stopIgnoreStyleChange](self, "stopIgnoreStyleChange");
  -[VKNavCameraController _updateDidNavCameraTransition](self, "_updateDidNavCameraTransition");
  -[VKNavCameraController _updateCameraLimits](self, "_updateCameraLimits");
  -[VKNavCameraController _updateSceneQuery](self, "_updateSceneQuery");
  -[VKNavCameraController _updateSceneStyles:updatePitchLimitOnly:](self, "_updateSceneStyles:updatePitchLimitOnly:", 1, self->_isIgnoringStyleChange);
  -[VKNavCameraController _updateStyles](self, "_updateStyles");
  -[VKNavCameraController _updateZoomScaleLimts](self, "_updateZoomScaleLimts");
  v17 = (_QWORD *)*((_QWORD *)a4 + 1);
  v18 = (int8x8_t)v17[1];
  if (v18)
  {
    v19 = (uint8x8_t)vcnt_s8(v18);
    v19.i16[0] = vaddlv_u8(v19);
    if (v19.u32[0] > 1uLL)
    {
      v20 = 0x8BD499FBD96FBB9ELL;
      if (*(_QWORD *)&v18 <= 0x8BD499FBD96FBB9ELL)
        v20 = 0x8BD499FBD96FBB9ELL % *(_QWORD *)&v18;
    }
    else
    {
      v20 = (*(_QWORD *)&v18 - 1) & 0x8BD499FBD96FBB9ELL;
    }
    v21 = *(_QWORD **)(*v17 + 8 * v20);
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
            if (v25 == 0x8BD499FBD96FBB9ELL)
            {
              if (v22[2] == 0x8BD499FBD96FBB9ELL)
                goto LABEL_48;
            }
            else if ((v25 & v23) != v20)
            {
              goto LABEL_51;
            }
            v22 = (_QWORD *)*v22;
            if (!v22)
              goto LABEL_51;
          }
        }
        do
        {
          v24 = v22[1];
          if (v24 == 0x8BD499FBD96FBB9ELL)
          {
            if (v22[2] == 0x8BD499FBD96FBB9ELL)
            {
LABEL_48:
              v27 = v22[5];
              if (*(_QWORD *)(v27 + 8) == 0x8BD499FBD96FBB9ELL)
              {
                v28 = *(_BYTE **)(v27 + 32);
                if (v28)
                  LOBYTE(self->_requesteDisplayRateSampler._count) = *v28;
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
LABEL_51:
  -[VKNavCameraController _updateSprings:](self, "_updateSprings:", a3);
  if (self->_needsUpdate
    || self->_isDetached
    || -[VKCameraController edgeInsetsAnimating](self, "edgeInsetsAnimating")
    || -[VKNavCameraController _hasRunningAnimation](self, "_hasRunningAnimation"))
  {
    -[VKCameraController cameraDelegate](self, "cameraDelegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "mapLayerWillChangeRegionAnimated:", 0);

    v30 = objc_loadWeakRetained((id *)&self->_gestureBehavior);
    objc_msgSend(v30, "updateWithTimestamp:withContext:", a4, a3);

    v73 = vdupq_n_s64(0xC00921FB54442D18);
    v74 = 0u;
    v75 = 0u;
    value = 0.0;
    if (self->_isDetached && !self->_transitionAnimation)
    {
      transitionAnimation = 0;
    }
    else
    {
      -[VKNavCameraController updateCameraState](self, "updateCameraState");
      -[VKNavCameraController currentCameraFrame](self, "currentCameraFrame");
      v31 = v70;
      v73 = v69;
      v74 = v70;
      v32 = v71;
      v75 = v71;
      v33 = v72;
      value = v72;
      *(int64x2_t *)&self->_lastCalculatedCameraFrame._target.latitude._value = v69;
      *(_OWORD *)&self->_lastCalculatedCameraFrame._target.altitude._value = v31;
      *(_OWORD *)&self->_lastCalculatedCameraFrame._pitch._value = v32;
      self->_lastCalculatedCameraFrame._roll._value = v33;
      transitionAnimation = self->_transitionAnimation;
    }
    if (-[VKAnimation running](transitionAnimation, "running"))
    {
      v35 = *(_OWORD *)&self->_transitionFrame._target.altitude._value;
      v73 = *(int64x2_t *)&self->_transitionFrame._target.latitude._value;
      v74 = v35;
      v75 = *(_OWORD *)&self->_transitionFrame._pitch._value;
      value = self->_transitionFrame._roll._value;
    }
    else if (self->_isDetached)
    {
      -[VKCameraController camera](self, "camera");
      v36 = *(_OWORD *)(v69.i64[0] + 24);
      v73 = *(int64x2_t *)(v69.i64[0] + 8);
      v74 = v36;
      v75 = *(_OWORD *)(v69.i64[0] + 40);
      value = *(double *)(v69.i64[0] + 56);
      if (v69.i64[1])
      {
        v37 = (unint64_t *)(v69.i64[1] + 8);
        do
          v38 = __ldaxr(v37);
        while (__stlxr(v38 - 1, v37));
        if (!v38)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v69.i64[1] + 16))(v69.i64[1]);
          std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v69.i64[1]);
        }
      }
    }
    -[VKCameraController camera](self, "camera");
    v39 = v69.i64[0];
    v40 = v74;
    *(int64x2_t *)(v69.i64[0] + 8) = v73;
    *(_OWORD *)(v39 + 24) = v40;
    *(_OWORD *)(v39 + 40) = v75;
    *(double *)(v39 + 56) = value;
    if (v69.i64[1])
    {
      v41 = (unint64_t *)(v69.i64[1] + 8);
      do
        v42 = __ldaxr(v41);
      while (__stlxr(v42 - 1, v41));
      if (!v42)
      {
        (*(void (**)(uint64_t))(*(_QWORD *)v69.i64[1] + 16))(v69.i64[1]);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v69.i64[1]);
      }
    }
    -[VKCameraController camera](self, "camera");
    v43.n128_f64[0] = gdc::CameraFrame<geo::Radians,double>::toRigidTransformMercator((double *)v69.i64, (double *)v73.i64, *(_BYTE *)buf == 0);
    v44 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
    if (*((_QWORD *)&buf + 1))
    {
      v45 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
      do
        v46 = __ldaxr(v45);
      while (__stlxr(v46 - 1, v45));
      if (!v46)
      {
        ((void (*)(std::__shared_weak_count *, __n128))v44->__on_zero_shared)(v44, v43);
        std::__shared_weak_count::__release_weak(v44);
      }
    }
    -[VKCameraController vkCamera](self, "vkCamera", v43.n128_f64[0]);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setPosition:", &v69);

    -[VKCameraController vkCamera](self, "vkCamera");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setOrientation:", (char *)&v70 + 8);

    -[VKNavCameraController _updateClipPlanes](self, "_updateClipPlanes");
    -[VKNavCameraController _updateDebugOverlay](self, "_updateDebugOverlay");
    -[VKNavCameraController _updateDebugText](self, "_updateDebugText");
    -[VKCameraController cameraDelegate](self, "cameraDelegate");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "mapLayerDidChangeVisibleRegion");

    v50 = v74;
    *(int64x2_t *)&self->_cameraFrame._target.latitude._value = v73;
    *(_OWORD *)&self->_cameraFrame._target.altitude._value = v50;
    *(_OWORD *)&self->_cameraFrame._pitch._value = v75;
    self->_cameraFrame._roll._value = value;
    if (-[VKNavCameraController _springsNeedUpdate](self, "_springsNeedUpdate"))
      -[VKNavCameraController _setNeedsUpdate](self, "_setNeedsUpdate");
    else
      self->_needsUpdate = 0;
    v51 = COERCE_DOUBLE(-[VKNavCameraController displayRate](self, "displayRate"));
    if (*(_QWORD *)&v51 != *(_QWORD *)&self->_requesteDisplayRateSampler._sum)
    {
      self->_requesteDisplayRateSampler._sum = v51;
      if (GEOGetVectorKitVKNavCameraLog_onceToken != -1)
        dispatch_once(&GEOGetVectorKitVKNavCameraLog_onceToken, &__block_literal_global_31);
      v52 = (id)GEOGetVectorKitVKNavCameraLog_log;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        sum = self->_requesteDisplayRateSampler._sum;
        LODWORD(buf) = 134217984;
        *(double *)((char *)&buf + 4) = sum;
        _os_log_impl(&dword_19F029000, v52, OS_LOG_TYPE_INFO, "Requested display rate changed: %ld", (uint8_t *)&buf, 0xCu);
      }

    }
    v54 = -[VKCameraController runLoopController](self, "runLoopController");
    v55 = *(_QWORD *)&self->_requesteDisplayRateSampler._sum;
    v54->var1 = v55;
    var0 = (uint64_t)v54->var0;
    if (var0 && !**(_BYTE **)(var0 + 1056))
      md::MapEngine::setDisplayRate(var0, v55);
    -[VKCameraController edgeInsets](self, "edgeInsets");
    LODWORD(self->_minCameraPitch._value) = v57;
    HIDWORD(self->_minCameraPitch._value) = v58;
    LODWORD(self->_maxCameraPitch._value) = v59;
    HIDWORD(self->_maxCameraPitch._value) = v60;
    v61 = self->_requesteDisplayRateSampler._sum;
    v62 = (double)*(uint64_t *)&v61;
    v63 = &self->_pixelSamples._samples.__elems_[58];
    if (*(uint64_t *)&v61 <= 0)
      v62 = 60.0;
    avg = self->_requesteDisplayRateSampler._avg;
    if (avg == 0.0)
    {
      *v63 = v62;
      self->_pixelSamples._samples.__elems_[59] = v62;
      v68 = 1;
      self->_requesteDisplayRateSampler._min = v62;
    }
    else
    {
      v65 = fmax(self->_pixelSamples._samples.__elems_[59], v62);
      *v63 = fmin(*v63, v62);
      self->_pixelSamples._samples.__elems_[59] = v65;
      v66 = (double)*(unint64_t *)&avg;
      v67 = self->_requesteDisplayRateSampler._min + v62 / (double)*(unint64_t *)&avg;
      v68 = *(_QWORD *)&avg + 1;
      v62 = self->_requesteDisplayRateSampler._max + v62;
      self->_requesteDisplayRateSampler._min = v67 * v66 / (double)v68;
    }
    self->_requesteDisplayRateSampler._max = v62;
    *(_QWORD *)&self->_requesteDisplayRateSampler._avg = v68;
  }
}

- (double)_calculateMaxPixelChangeAndUpdateCorners
{
  Matrix<double, 2, 1> minimum;
  double halfPuckSize;
  double *p_depthNear;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t *p_cameraFrame;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  unsigned __int128 v20;
  float64x2_t v21;
  float64x2_t v22;
  __int128 v23;
  uint64_t v24;
  _BYTE v25[32];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  minimum = self->_viewableScreenRect._minimum;
  halfPuckSize = self->_halfPuckSize;
  *(double *)v25 = self->_maxHeightDeltaChangeVertical;
  *(int8x16_t *)&v25[8] = vextq_s8((int8x16_t)minimum, (int8x16_t)minimum, 8uLL);
  *(double *)&v25[24] = halfPuckSize;
  p_depthNear = &self->_depthNear;
  v20 = __PAIR128__(*(unint64_t *)&halfPuckSize, *(unint64_t *)v25);
  v22 = (float64x2_t)minimum;
  if (self->_depthNear == -3.14159265
    && *(double *)&self->_leftHanded == -3.14159265
    && self->_cornerCoordinates[0].latitude._value == 0.0)
  {
    v7 = 0.0;
  }
  else
  {
    gdc::ViewDataAccess::screenPointForCoordinate(*(double **)(-[VKCameraController mapDataAccess](self, "mapDataAccess", *(_QWORD *)v25, *(_QWORD *)&halfPuckSize)+ 16), p_depthNear, (uint64_t *)&self->_cameraFrame);
    v7 = fmax(sqrt((*(double *)&v20 - v6) * (*(double *)&v20 - v6)+ (halfPuckSize - minimum._e[0]) * (halfPuckSize - minimum._e[0])), 0.0);
    minimum._e[1] = v22.f64[1];
  }
  v8 = minimum._e[1];
  v9 = -[VKCameraController mapDataAccess](self, "mapDataAccess", v20);
  p_cameraFrame = (uint64_t *)&self->_cameraFrame;
  md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)&v23, (uint64_t)v9, (uint64_t)&self->_cameraFrame, 0, v21);
  *(_OWORD *)p_depthNear = v23;
  *((_QWORD *)p_depthNear + 2) = v24;
  if (p_depthNear[3] != -3.14159265 || p_depthNear[4] != -3.14159265 || p_depthNear[5] != 0.0)
  {
    gdc::ViewDataAccess::screenPointForCoordinate(*(double **)(-[VKCameraController mapDataAccess](self, "mapDataAccess") + 16), p_depthNear + 3, p_cameraFrame);
    v7 = fmax(v7, sqrt((v21.f64[0] - v11) * (v21.f64[0] - v11) + (v8 - v12) * (v8 - v12)));
  }
  v13 = -[VKCameraController mapDataAccess](self, "mapDataAccess");
  md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)&v23, (uint64_t)v13, (uint64_t)p_cameraFrame, 0, *(float64x2_t *)v25);
  *(_OWORD *)(p_depthNear + 3) = v23;
  *((_QWORD *)p_depthNear + 5) = v24;
  if (p_depthNear[6] != -3.14159265 || p_depthNear[7] != -3.14159265 || p_depthNear[8] != 0.0)
  {
    gdc::ViewDataAccess::screenPointForCoordinate(*(double **)(-[VKCameraController mapDataAccess](self, "mapDataAccess") + 16), p_depthNear + 6, p_cameraFrame);
    v7 = fmax(v7, sqrt((v22.f64[0] - v14) * (v22.f64[0] - v14) + (halfPuckSize - v15) * (halfPuckSize - v15)));
  }
  v16 = -[VKCameraController mapDataAccess](self, "mapDataAccess");
  md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)&v23, (uint64_t)v16, (uint64_t)p_cameraFrame, 0, *(float64x2_t *)&v25[16]);
  *((_OWORD *)p_depthNear + 3) = v23;
  *((_QWORD *)p_depthNear + 8) = v24;
  if (p_depthNear[9] != -3.14159265 || p_depthNear[10] != -3.14159265 || p_depthNear[11] != 0.0)
  {
    gdc::ViewDataAccess::screenPointForCoordinate(*(double **)(-[VKCameraController mapDataAccess](self, "mapDataAccess") + 16), p_depthNear + 9, p_cameraFrame);
    v7 = fmax(v7, sqrt((v22.f64[0] - v17) * (v22.f64[0] - v17) + (v8 - v18) * (v8 - v18)));
  }
  md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)&v23, (uint64_t)-[VKCameraController mapDataAccess](self, "mapDataAccess"), (uint64_t)p_cameraFrame, 0, v22);
  *(_OWORD *)(p_depthNear + 9) = v23;
  *((_QWORD *)p_depthNear + 11) = v24;
  return v7;
}

- (BOOL)_hasRunningAnimation
{
  return -[VKAnimation running](self->_transitionAnimation, "running")
      || -[VKAnimation running](self->_snapHeadingAnimation, "running")
      || -[VKAnimation running](self->_snapPitchAnimation, "running");
}

- (Matrix<double,)puckScreenPoint
{
  double *p_minHeightDeltaChangeVertical;
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  double v6;
  Matrix<double, 2, 1> result;

  p_minHeightDeltaChangeVertical = &self->_minHeightDeltaChangeVertical;
  v3.f64[0] = self->_puckMovementBoundsMin._e[0];
  v3.f64[1] = 1.0 - self->_puckMovementBoundsMin._e[1];
  v4 = vld1q_dup_f64(p_minHeightDeltaChangeVertical);
  v5 = vminnmq_f64(vmaxnmq_f64(vmlaq_f64(*(float64x2_t *)&self->_maxHeightDeltaChangeVertical, v3, vsubq_f64((float64x2_t)self->_viewableScreenRect._minimum, *(float64x2_t *)&self->_maxHeightDeltaChangeVertical)), vaddq_f64(*(float64x2_t *)&self->_maxHeightDeltaChangeVertical, v4)), vsubq_f64((float64x2_t)self->_viewableScreenRect._minimum, v4));
  v6 = v5.f64[1];
  result._e[0] = v5.f64[0];
  result._e[1] = v6;
  return result;
}

- (void)_updateSprings:(double)a3
{
  double previousUpdateTime;
  double v6;
  double kSpring;
  double restingPosition;
  double position;
  double velocity;
  double kDamper;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  Matrix<double, 2, 1> v29;
  Matrix<double, 2, 1> v30;
  Matrix<double, 2, 1> v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;
  float64x2_t v36;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  double v46;
  double v47;
  double v48;
  double v49;

  previousUpdateTime = self->_previousUpdateTime;
  v6 = fmax(previousUpdateTime, a3) - previousUpdateTime;
  if (previousUpdateTime >= 0.0 && v6 <= 1.0)
  {
    restingPosition = self->_pitchSpring._restingPosition;
    kSpring = self->_pitchSpring._kSpring;
    position = self->_pitchSpring._position;
    velocity = self->_pitchSpring._velocity;
    kDamper = self->_pitchSpring._kDamper;
    v13 = velocity + -(velocity * kDamper - (restingPosition - position) * kSpring) * (v6 * 0.5);
    v14 = v6;
    v48 = v6 * -0.5;
    v49 = v6 * 0.5;
    v15 = -(v13 * kDamper - (restingPosition - position + velocity * (v6 * -0.5)) * kSpring);
    v16 = velocity + v15 * v49;
    v17 = velocity + -(v16 * kDamper - (restingPosition - position + v13 * v48) * kSpring) * v14;
    v46 = v14;
    v47 = v14 * 0.166666667;
    self->_pitchSpring._position = position + (velocity + (v16 + v13) * 2.0 + v17) * (v14 * 0.166666667);
    self->_pitchSpring._velocity = velocity
                                 - -((restingPosition - (position + v16 * v14)) * kSpring
                                   - (velocity * kDamper
                                    - (restingPosition - position) * kSpring)
                                   + (v15 - (v16 * kDamper - (restingPosition - position + v13 * v48) * kSpring)) * 2.0
                                   - v17 * kDamper)
                                 * (v14
                                  * 0.166666667);
    gdc::Spring<double,1,(gdc::SpringType)1>::update(&self->_headingSpring._position, v14);
    v19 = self->_distanceFromTargetSpring._restingPosition;
    v18 = self->_distanceFromTargetSpring._kSpring;
    v20 = self->_distanceFromTargetSpring._position;
    v21 = self->_distanceFromTargetSpring._velocity;
    v22 = self->_distanceFromTargetSpring._kDamper;
    v23 = v21 + -(v21 * v22 - (v19 - v20) * v18) * v49;
    v24 = -(v23 * v22 - (v19 - v20 + v21 * v48) * v18);
    v25 = v21 + v24 * v49;
    v26 = v21 + -(v25 * v22 - (v19 - v20 + v23 * v48) * v18) * v46;
    self->_distanceFromTargetSpring._position = v20 + (v21 + (v25 + v23) * 2.0 + v26) * v47;
    self->_distanceFromTargetSpring._velocity = v21
                                              - -((v19 - (v20 + v25 * v46)) * v18
                                                - (v21 * v22
                                                 - (v19 - v20) * v18)
                                                + (v24 - (v25 * v22 - (v19 - v20 + v23 * v48) * v18)) * 2.0
                                                - v26 * v22)
                                              * v47;
    v27 = self->_screenPositionSpring._kSpring;
    v28 = self->_screenPositionSpring._kDamper;
    v30 = self->_screenPositionSpring._velocity;
    v29 = self->_screenPositionSpring._restingPosition;
    v31 = self->_screenPositionSpring._position;
    v32 = vsubq_f64((float64x2_t)v29, (float64x2_t)v31);
    v33 = vmlaq_n_f64(vnegq_f64(vmulq_n_f64((float64x2_t)v30, v28)), v32, v27);
    v34 = vmlaq_n_f64((float64x2_t)v30, v33, v49);
    v35 = vmlaq_n_f64(vnegq_f64(vmulq_n_f64(v34, v28)), vmlaq_n_f64(v32, (float64x2_t)v30, v48), v27);
    v36 = vmlaq_n_f64((float64x2_t)v30, v35, v49);
    v37 = vmlaq_n_f64(vnegq_f64(vmulq_n_f64(v36, v28)), vmlaq_n_f64(v32, v34, v48), v27);
    v38 = vmlaq_n_f64((float64x2_t)v30, v37, v46);
    v39 = vsubq_f64((float64x2_t)v29, vmlaq_n_f64((float64x2_t)v31, v36, v46));
    v40 = vaddq_f64(v36, v34);
    __asm { FMOV            V16.2D, #2.0 }
    self->_screenPositionSpring._position = (Matrix<double, 2, 1>)vmlaq_n_f64((float64x2_t)v31, vaddq_f64(vmlaq_f64((float64x2_t)v30, _Q16, v40), v38), v47);
    self->_screenPositionSpring._velocity = (Matrix<double, 2, 1>)vmlsq_lane_f64((float64x2_t)v30, vmlaq_n_f64(vnegq_f64(vmlaq_f64(vmlaq_n_f64(v33, v39, v27), _Q16, vaddq_f64(v35, v37))), v38, v28), v47, 0);
  }
  else
  {
    -[VKNavCameraController resetSpringsToResting](self, "resetSpringsToResting");
  }
  self->_previousUpdateTime = a3;
}

- (BOOL)_springsNeedUpdate
{
  long double v3;
  BOOL result;

  result = vabdd_f64(self->_pitchSpring._position, self->_pitchSpring._restingPosition) > 0.00001
        || (v3 = fmod(3.14159265 - self->_headingSpring._restingPosition + self->_headingSpring._position, 6.28318531),
            fabs(fmod(v3 + 6.28318531, 6.28318531) + -3.14159265) >= 0.001)
        || vabdd_f64(self->_distanceFromTargetSpring._position, self->_distanceFromTargetSpring._restingPosition) > 1.0;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate
{
  double v2;
  double v3;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v2 = self->_cameraFrame._target.latitude._value * 57.2957795;
  v3 = self->_cameraFrame._target.longitude._value * 57.2957795;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (double)distanceFromCenterCoordinate
{
  return self->_cameraFrame._distanceFromTarget._value;
}

- (double)altitude
{
  double value;

  value = self->_cameraFrame._distanceFromTarget._value;
  return cos(self->_cameraFrame._pitch._value) * value;
}

- (double)heading
{
  return self->_cameraFrame._heading._value * -57.2957795;
}

- (double)pitch
{
  return self->_cameraFrame._pitch._value * 57.2957795;
}

- (CameraFrame<geo::Radians,)currentCameraFrame
{
  Coordinate3D<geo::Radians, double> *p_puckCoordinate;
  double position;
  double v7;
  double v8;
  double v9;
  double v10;
  double minHeightDeltaChangeVertical;
  float v12;
  float64x2_t v13;
  CameraFrame<geo::Radians, double> *result;
  Matrix<double, 2, 1> v20;
  float64x2_t v21;
  float64x2_t v22;
  double v23;
  BOOL v24;

  retstr->_roll._value = 0.0;
  p_puckCoordinate = &self->_puckCoordinate;
  *(_OWORD *)&retstr->_target.latitude._value = *(_OWORD *)&self->_puckCoordinate.latitude._value;
  position = self->_headingSpring._position;
  retstr->_target.altitude._value = self->_puckCoordinate.altitude._value;
  v7 = self->_pitchSpring._position;
  retstr->_pitch._value = v7;
  retstr->_heading._value = position;
  v8 = self->_distanceFromTargetSpring._position;
  retstr->_distanceFromTarget._value = v8;
  -[VKNavCameraController zoomScale](self, "zoomScale");
  v10 = v9 * v8;
  v20 = self->_screenPositionSpring._position;
  minHeightDeltaChangeVertical = self->_minHeightDeltaChangeVertical;
  retstr->_distanceFromTarget._value = v10;
  *(float *)&v10 = v7;
  v12 = expf((float)(*(float *)&v10 * -10.0) + 7.5);
  v13.f64[0] = v20._e[0];
  v13.f64[1] = v20._e[1] + minHeightDeltaChangeVertical * 0.636619772 * (v7 + (float)(-0.5 / (float)(v12 + 1.0)));
  v21 = v13;
  v24 = **(unsigned __int8 **)(-[VKCameraController mapDataAccess](self, "mapDataAccess") + 16) - 4 < 0xFFFFFFFD;
  md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)&v22, (uint64_t)-[VKCameraController mapDataAccess](self, "mapDataAccess"), (uint64_t)retstr, &v24, v21);
  if (v24 && (v22.f64[0] != -3.14159265 || v22.f64[1] != -3.14159265 || v23 != 0.0))
  {
    __asm { FMOV            V2.2D, #-2.0 }
    *(float64x2_t *)&retstr->_target.latitude._value = vnegq_f64(vmlaq_f64(v22, _Q2, *(float64x2_t *)&p_puckCoordinate->latitude._value));
  }
  return result;
}

- (CameraFrame<geo::Radians,)restingCameraFrame
{
  Coordinate3D<geo::Radians, double> *p_puckCoordinate;
  double value;
  double restingPosition;
  double v8;
  double v9;
  double minHeightDeltaChangeVertical;
  double v11;
  float v12;
  float v13;
  float64x2_t v14;
  CameraFrame<geo::Radians, double> *result;
  Matrix<double, 2, 1> v21;
  float64x2_t v22;
  float64x2_t v23;
  double v24;
  BOOL v25;

  retstr->_roll._value = 0.0;
  p_puckCoordinate = &self->_puckCoordinate;
  *(_OWORD *)&retstr->_target.latitude._value = *(_OWORD *)&self->_puckCoordinate.latitude._value;
  value = self->_puckCoordinate.altitude._value;
  restingPosition = self->_headingSpring._restingPosition;
  v8 = self->_pitchSpring._restingPosition;
  retstr->_pitch._value = v8;
  retstr->_heading._value = restingPosition;
  v9 = self->_distanceFromTargetSpring._restingPosition;
  retstr->_target.altitude._value = value;
  retstr->_distanceFromTarget._value = v9;
  minHeightDeltaChangeVertical = self->_minHeightDeltaChangeVertical;
  v21 = self->_screenPositionSpring._restingPosition;
  v11 = v8;
  v12 = v8;
  v13 = expf((float)(v12 * -10.0) + 7.5);
  v14.f64[0] = v21._e[0];
  v14.f64[1] = v21._e[1] + minHeightDeltaChangeVertical * 0.636619772 * (v11 + (float)(-0.5 / (float)(v13 + 1.0)));
  v22 = v14;
  v25 = **(unsigned __int8 **)(-[VKCameraController mapDataAccess](self, "mapDataAccess") + 16) - 4 < 0xFFFFFFFD;
  md::MapDataAccess::groundCoordinateForScreenPoint((uint64_t)&v23, (uint64_t)-[VKCameraController mapDataAccess](self, "mapDataAccess"), (uint64_t)retstr, &v25, v22);
  if (v25 && (v23.f64[0] != -3.14159265 || v23.f64[1] != -3.14159265 || v24 != 0.0))
  {
    __asm { FMOV            V2.2D, #-2.0 }
    *(float64x2_t *)&retstr->_target.latitude._value = vnegq_f64(vmlaq_f64(v23, _Q2, *(float64x2_t *)&p_puckCoordinate->latitude._value));
  }
  return result;
}

- (void)animateCameraWithDuration:(float)a3 fromFrame:(const void *)a4 completionHandler:(id)a5
{
  id v8;
  VKTimedAnimation *transitionAnimation;
  VKTimedAnimation *v10;
  VKTimedAnimation *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  double value;
  uint64_t v16;
  id v17;
  RunLoopController *v18;
  uint64_t v19;
  uint64_t var0;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[4];
  id location;

  v8 = a5;
  -[VKNavCameraController stopSnappingAnimations](self, "stopSnappingAnimations");
  -[VKAnimation stop](self->_transitionAnimation, "stop");
  transitionAnimation = self->_transitionAnimation;
  self->_transitionAnimation = 0;

  v10 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", a3);
  v11 = self->_transitionAnimation;
  self->_transitionAnimation = v10;

  -[VKTimedAnimation setTimingFunction:](self->_transitionAnimation, "setTimingFunction:", VKAnimationCurveEaseInOut);
  v13 = *((_OWORD *)a4 + 1);
  v12 = *((_OWORD *)a4 + 2);
  v14 = *(_OWORD *)a4;
  self->_transitionFrame._roll._value = *((double *)a4 + 6);
  *(_OWORD *)&self->_transitionFrame._target.altitude._value = v13;
  *(_OWORD *)&self->_transitionFrame._pitch._value = v12;
  *(_OWORD *)&self->_transitionFrame._target.latitude._value = v14;
  -[VKNavCameraController setZoomScale:](self, "setZoomScale:", 1.0);
  *(int64x2_t *)&self->_routeCoordinate.index = vdupq_n_s64(0xC00921FB54442D18);
  self->_routeFocusCoordinate.latitude._value = 0.0;
  value = self->_puckCourse._value;
  self->_headingSpring._restingPosition = value;
  self->_headingSpring._position = value;
  self->_headingSpring._velocity = 0.0;
  -[VKNavCameraController updateCameraState](self, "updateCameraState");
  -[VKNavCameraController resetSpringsToResting](self, "resetSpringsToResting");
  objc_initWeak(&location, self);
  -[VKNavCameraController stopIgnoreStyleChange](self, "stopIgnoreStyleChange");
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  v16 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __79__VKNavCameraController_animateCameraWithDuration_fromFrame_completionHandler___block_invoke;
  v24[3] = &unk_1E42F7998;
  objc_copyWeak(&v25, &location);
  v24[4] = v26;
  -[VKTimedAnimation setStepHandler:](self->_transitionAnimation, "setStepHandler:", v24);
  v21[0] = v16;
  v21[1] = 3221225472;
  v21[2] = __79__VKNavCameraController_animateCameraWithDuration_fromFrame_completionHandler___block_invoke_2;
  v21[3] = &unk_1E42F9D20;
  objc_copyWeak(&v23, &location);
  v17 = v8;
  v22 = v17;
  -[VKAnimation setCompletionHandler:](self->_transitionAnimation, "setCompletionHandler:", v21);
  -[VKNavCameraController _setDetached:](self, "_setDetached:", 0);
  -[VKNavCameraController _setNavCameraTransitionComplete:](self, "_setNavCameraTransitionComplete:", LOBYTE(self->_sceneQuery.__cntrl_) == 0);
  -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1);
  md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), &self->_transitionAnimation->super);
  -[VKCameraController endRegionChange](self, "endRegionChange");
  v18 = -[VKCameraController runLoopController](self, "runLoopController");
  v19 = -[VKCameraController maxDisplayRate](self, "maxDisplayRate");
  v18->var1 = v19;
  var0 = (uint64_t)v18->var0;
  if (v18->var0 && !**(_BYTE **)(var0 + 1056))
    md::MapEngine::setDisplayRate(var0, v19);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  _Block_object_dispose(v26, 8);
  objc_destroyWeak(&location);

}

- (void)returnToTrackingWithDelay:(double)a3 resetZoom:(BOOL)a4
{
  _BOOL4 v4;
  VKTimedAnimation *transitionAnimation;
  VKTimedAnimation *v8;
  VKTimedAnimation *v9;
  double value;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  BOOL v18;
  void *v19;
  void *v20;
  uint64_t v21;
  VKTimedAnimation *v22;
  dispatch_time_t v23;
  NSObject *v24;
  VKTimedAnimation *v25;
  double v26;
  double v27;
  BOOL v28;
  NSObject *v29;
  RunLoopController *v30;
  uint64_t v31;
  uint64_t var0;
  double v33;
  uint8_t buf[8];
  _QWORD block[4];
  VKTimedAnimation *v36;
  VKNavCameraController *v37;
  _QWORD v38[4];
  id v39;
  BOOL v40;
  BOOL v41;
  _QWORD v42[4];
  id v43[9];
  BOOL v44;
  id location;

  v4 = a4;
  if (!-[VKAnimation running](self->_transitionAnimation, "running"))
  {
    if (self->_isDetached
      || v4
      && ((-[VKNavCameraController zoomScale](self, "zoomScale"),
           v27 = fabs(v26 + -1.0),
           v27 > fabs(v26 + 1.0) * 2.22044605e-14)
        ? (v28 = v27 < 2.22507386e-308)
        : (v28 = 1),
          !v28))
    {
      v33 = a3;
      -[VKNavCameraController stopSnappingAnimations](self, "stopSnappingAnimations");
      -[VKAnimation stop](self->_transitionAnimation, "stop");
      transitionAnimation = self->_transitionAnimation;
      self->_transitionAnimation = 0;

      v8 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", 1.0);
      v9 = self->_transitionAnimation;
      self->_transitionAnimation = v8;

      -[VKTimedAnimation setTimingFunction:](self->_transitionAnimation, "setTimingFunction:", VKAnimationCurveEaseInOut);
      value = self->_cameraFrame._target.latitude._value;
      v11 = self->_cameraFrame._target.longitude._value;
      v12 = self->_cameraFrame._target.altitude._value;
      v13 = self->_cameraFrame._distanceFromTarget._value;
      v15 = self->_cameraFrame._pitch._value;
      v14 = self->_cameraFrame._heading._value;
      v16 = self->_cameraFrame._roll._value;
      self->_transitionFrame._target.latitude._value = value;
      self->_transitionFrame._target.longitude._value = v11;
      self->_transitionFrame._target.altitude._value = v12;
      self->_transitionFrame._distanceFromTarget._value = v13;
      self->_transitionFrame._pitch._value = v15;
      self->_transitionFrame._heading._value = v14;
      self->_transitionFrame._roll._value = v16;
      v17 = -[VKNavCameraController _canZoomIn](self, "_canZoomIn");
      v18 = -[VKNavCameraController _canZoomOut](self, "_canZoomOut");
      objc_initWeak(&location, self);
      -[VKNavCameraController zoomScale](self, "zoomScale");
      v20 = v19;
      v21 = MEMORY[0x1E0C809B0];
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3321888768;
      v42[2] = __61__VKNavCameraController_returnToTrackingWithDelay_resetZoom___block_invoke;
      v42[3] = &unk_1E42E9010;
      objc_copyWeak(v43, &location);
      v43[1] = *(id *)&value;
      v43[2] = *(id *)&v11;
      v43[3] = *(id *)&v12;
      v43[4] = *(id *)&v13;
      v43[5] = *(id *)&v15;
      v43[6] = *(id *)&v14;
      v44 = v4;
      v43[7] = *(id *)&v16;
      v43[8] = v20;
      -[VKTimedAnimation setStepHandler:](self->_transitionAnimation, "setStepHandler:", v42);
      v38[0] = v21;
      v38[1] = 3221225472;
      v38[2] = __61__VKNavCameraController_returnToTrackingWithDelay_resetZoom___block_invoke_26;
      v38[3] = &unk_1E42F79C0;
      objc_copyWeak(&v39, &location);
      v40 = v17;
      v41 = v18;
      -[VKAnimation setCompletionHandler:](self->_transitionAnimation, "setCompletionHandler:", v38);
      if (v33 <= 0.0)
      {
        if (GEOGetVectorKitVKNavCameraLog_onceToken != -1)
          dispatch_once(&GEOGetVectorKitVKNavCameraLog_onceToken, &__block_literal_global_31);
        v29 = (id)GEOGetVectorKitVKNavCameraLog_log;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F029000, v29, OS_LOG_TYPE_INFO, "Returning to tracking", buf, 2u);
        }

        -[VKNavCameraController _setDetached:](self, "_setDetached:", 0);
        -[VKNavCameraController _setNavCameraTransitionComplete:](self, "_setNavCameraTransitionComplete:", 0);
        -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1);
        md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), &self->_transitionAnimation->super);
        -[VKCameraController endRegionChange](self, "endRegionChange");
        v30 = -[VKCameraController runLoopController](self, "runLoopController");
        v31 = -[VKCameraController maxDisplayRate](self, "maxDisplayRate");
        v30->var1 = v31;
        var0 = (uint64_t)v30->var0;
        if (v30->var0)
        {
          if (!**(_BYTE **)(var0 + 1056))
            md::MapEngine::setDisplayRate(var0, v31);
        }
        -[VKNavCameraController stopIgnoreStyleChange](self, "stopIgnoreStyleChange");
      }
      else
      {
        v22 = self->_transitionAnimation;
        v23 = dispatch_time(0, (uint64_t)(v33 * 1000000000.0));
        v24 = **(NSObject ***)&self->_desiredZoomScale;
        block[0] = v21;
        block[1] = 3221225472;
        block[2] = __61__VKNavCameraController_returnToTrackingWithDelay_resetZoom___block_invoke_27;
        block[3] = &unk_1E42FAFB0;
        v36 = v22;
        v37 = self;
        v25 = v22;
        dispatch_after(v23, v24, block);

      }
      objc_destroyWeak(&v39);
      objc_destroyWeak(v43);
      objc_destroyWeak(&location);
    }
  }
}

- (void)returnToPuck
{
  -[VKNavCameraController returnToTrackingWithDelay:resetZoom:](self, "returnToTrackingWithDelay:resetZoom:", 1, 0.0);
}

- (void)setNavContext:(id)a3
{
  id v5;
  double maxFramingDistance;
  id v7;

  v5 = a3;
  maxFramingDistance = self->_maxFramingDistance;
  v7 = v5;
  if (*(id *)&maxFramingDistance != v5)
  {
    objc_msgSend(*(id *)&maxFramingDistance, "removeObserver:", self);
    objc_storeStrong((id *)&self->_maxFramingDistance, a3);
    objc_msgSend(*(id *)&self->_maxFramingDistance, "addObserver:", self);
    -[VKNavCameraController navContextStateDidChange:](self, "navContextStateDidChange:", v7);
  }

}

- (BOOL)canEnter3DMode
{
  return 1;
}

- (double)_normalizedZoomLevelForDisplayZoomLevel:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  id WeakRetained;

  -[VKCameraController canvas](self, "canvas");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v6;

  v8 = 0.0;
  if (v7 > 0.0)
  {
    -[VKCameraController canvas](self, "canvas");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "size");
    v11 = v10;
    WeakRetained = objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
    v8 = log2(v11 / (float)objc_msgSend(WeakRetained, "tileSize"));

  }
  return v8 + a3;
}

- (double)minimumZoomLevel
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  long double v8;
  double result;
  double v10;

  -[VKCameraController vkCamera](self, "vkCamera");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maxHeight");
  v5 = v4;

  -[VKCameraController vkCamera](self, "vkCamera");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "widthOfViewAtDepth:", v5);
  v8 = v7;

  result = 0.0;
  if (v8 > 0.0)
  {
    -[VKNavCameraController _normalizedZoomLevelForDisplayZoomLevel:](self, "_normalizedZoomLevelForDisplayZoomLevel:", (double)-log2(v8));
    return ceil(v10 * 1000.0) * 0.001;
  }
  return result;
}

- (double)maximumZoomLevel
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  long double v8;
  double result;
  double v10;

  -[VKCameraController vkCamera](self, "vkCamera");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minHeight");
  v5 = v4;

  -[VKCameraController vkCamera](self, "vkCamera");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "widthOfViewAtDepth:", v5);
  v8 = v7;

  result = 0.0;
  if (v8 > 0.0)
  {
    -[VKNavCameraController _normalizedZoomLevelForDisplayZoomLevel:](self, "_normalizedZoomLevelForDisplayZoomLevel:", (double)-log2(v8));
    return floor(v10 * 1000.0) * 0.001;
  }
  return result;
}

- (double)currentZoomLevel
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
  double v23;
  long double v24;
  double result;
  double v26;

  -[VKCameraController vkCamera](self, "vkCamera");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "footprint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nearestGroundPoint");
  v26 = v5;
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
  objc_msgSend(v22, "widthOfViewAtDepth:", v17 * (v9 - v12) + v19 * (v7 - v13) + v21 * (v26 - v14));
  v24 = v23;

  if (v24 <= 0.0)
    return 0.0;
  -[VKNavCameraController _normalizedZoomLevelForDisplayZoomLevel:](self, "_normalizedZoomLevelForDisplayZoomLevel:", (double)-log2(v24));
  return result;
}

- (double)topDownMinimumZoomLevel
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  long double v8;
  double result;
  double v10;

  -[VKCameraController vkCamera](self, "vkCamera");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maxHeightNoPitch");
  v5 = v4;

  -[VKCameraController vkCamera](self, "vkCamera");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "widthOfViewAtDepth:", v5);
  v8 = v7;

  result = 0.0;
  if (v8 > 0.0)
  {
    -[VKNavCameraController _normalizedZoomLevelForDisplayZoomLevel:](self, "_normalizedZoomLevelForDisplayZoomLevel:", (double)-log2(v8));
    return ceil(v10 * 1000.0) * 0.001;
  }
  return result;
}

- (BOOL)_canZoomIn
{
  double v3;

  -[VKNavCameraController zoomScale](self, "zoomScale");
  return v3 > self->_minZoomScale + 0.001;
}

- (BOOL)_canZoomOut
{
  double v3;

  -[VKNavCameraController zoomScale](self, "zoomScale");
  return v3 < self->_maxZoomScale + -0.001;
}

- (BOOL)isPitchEnabled
{
  return 1;
}

- (BOOL)isRotateEnabled
{
  return 1;
}

- (void)stop
{
  RunLoopController *v3;
  uint64_t var0;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  ggl::DebugConsole *v10;
  void *v11;
  ggl::DebugConsole *v12;
  int64x2_t v13;

  v3 = -[VKCameraController runLoopController](self, "runLoopController");
  v3->var1 = -1;
  var0 = (uint64_t)v3->var0;
  if (var0 && !**(_BYTE **)(var0 + 1056))
    md::MapEngine::setDisplayRate(var0, -1);
  objc_msgSend(*(id *)&self->_maxFramingDistance, "removeObserver:", self);
  BYTE4(self->_previousSearchItemCount) = 0;
  -[VKNavCameraController _setDetached:](self, "_setDetached:", 1);
  -[VKNavCameraController updatePuckOffset:](self, "updatePuckOffset:", 1);
  -[VKCameraController endRegionChange](self, "endRegionChange");
  if (LOBYTE(self->_showConsole._key.key.identifier))
  {
    -[VKCameraController canvas](self, "canvas");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[VKCameraController canvas](self, "canvas");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        -[VKCameraController canvas](self, "canvas");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (ggl::DebugConsole *)objc_msgSend(v9, "debugConsoleForId:", 7);

        if (v10)
        {
          ggl::DebugConsole::begin(v10);
          *((_QWORD *)v10 + 10) = 0;
          ggl::DebugConsole::end((uint64_t)v10);
        }
        -[VKCameraController canvas](self, "canvas");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (ggl::DebugConsole *)objc_msgSend(v11, "debugConsoleForId:", 8);

        if (v12)
        {
          ggl::DebugConsole::begin(v12);
          *((_QWORD *)v12 + 10) = 0;
          ggl::DebugConsole::end((uint64_t)v12);
        }
      }
    }
  }
  if (LOBYTE(self->_pixelSamples._avg))
    LOBYTE(self->_pixelSamples._avg) = 0;
  *(_OWORD *)&self->_cornerCoordinates[3].longitude._value = 0u;
  *(_OWORD *)&self->_pixelSamples._min = 0u;
  self->_pixelSamples._idx = 0u;
  *(_OWORD *)self->_pixelSamples._samples.__elems_ = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[2] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[4] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[6] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[8] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[10] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[12] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[14] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[16] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[18] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[20] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[22] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[24] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[26] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[28] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[30] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[32] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[34] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[36] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[38] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[40] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[42] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[44] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[46] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[48] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[50] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[52] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[54] = 0u;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[56] = 0u;
  v13 = vdupq_n_s64(0xC00921FB54442D18);
  *(int64x2_t *)&self->_depthNear = v13;
  *(_OWORD *)&self->_cornerCoordinates[0].latitude._value = xmmword_19FFB5E50;
  *(_OWORD *)&self->_cornerCoordinates[0].altitude._value = xmmword_19FFB5140;
  *(int64x2_t *)&self->_cornerCoordinates[1].longitude._value = v13;
  *(_OWORD *)&self->_cornerCoordinates[2].latitude._value = xmmword_19FFB5E50;
  *(_OWORD *)&self->_cornerCoordinates[2].altitude._value = xmmword_19FFB5140;
  self->_requesteDisplayRateSampler._avg = 0.0;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[58] = 0u;
  *(_OWORD *)&self->_requesteDisplayRateSampler._min = 0u;
}

- (Unit<geo::RadianUnitDescription,)calculateHeading
{
  double *v2;
  double *v4;
  int v5;
  long double v6;
  double restingPosition;
  void *v8;
  void *v9;
  long double v10;
  long double v11;
  long double v12;
  long double v13;
  long double v14;
  id WeakRetained;
  int v16;
  void *v17;
  $AB5116BA7E623E054F959CECB034F4E7 *p_locationCoordinate;
  unsigned int latitude_low;
  void *v20;
  unsigned int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  long double v30;
  long double v31;
  double v32;
  double value;
  long double v35;
  long double v36;
  Unit<geo::RadianUnitDescription, double> v37;

  v4 = v2;
  v5 = -[VKNavCameraController cameraHeadingType](self, "cameraHeadingType");
  if (v5 == 3)
  {
    objc_msgSend(*(id *)&self->_maxFramingDistance, "route");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v8, "stepAtIndex:", objc_msgSend(*(id *)&self->_maxFramingDistance, "currentStepIndex"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pointAtRouteCoordinate:", objc_msgSend(v9, "startRouteCoordinate"));
      objc_msgSend(v8, "pointAt:", objc_msgSend(v8, "pointCount") - 1);
      GEOBearingFromCoordinateToCoordinate();
      v11 = fmod(v10, 360.0);
      v6 = fmod(v11 + 360.0, 360.0) * -0.0174532925;

    }
    else
    {
      v6 = 0.0;
    }
LABEL_27:

    goto LABEL_28;
  }
  if (v5 == 2)
  {
    if (*(double *)&self->_routeCoordinate != -3.14159265
      || *(double *)&self->_frameAllGroupedManeuvers != -3.14159265
      || self->_routeFocusCoordinate.latitude._value != 0.0)
    {
      GEOBearingFromCoordinateToCoordinate();
      v13 = fmod(v12, 360.0);
      restingPosition = fmod(v13 + 360.0, 360.0) * -0.0174532925;
LABEL_11:
      v14 = fmod(self->_puckCourse._value, 6.28318531);
      v6 = fmod(v14 + 6.28318531, 6.28318531);
      WeakRetained = objc_loadWeakRetained((id *)&self->_cameraMode);
      v16 = objc_msgSend(WeakRetained, "navigationState");

      objc_msgSend(*(id *)&self->_maxFramingDistance, "routeMatch");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v17;
      if (v16 == 2)
      {
        if (v17)
        {
          if (objc_msgSend(v17, "isGoodMatch"))
          {
            p_locationCoordinate = &self->_locationCoordinate;
            if (*((float *)&self->_locationCoordinate.latitude + 1) >= 0.0)
            {
              latitude_low = LODWORD(p_locationCoordinate->latitude);
              objc_msgSend(*(id *)&self->_maxFramingDistance, "route");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "pointCount");

              if (latitude_low < v21)
              {
                objc_msgSend(*(id *)&self->_maxFramingDistance, "route");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v22, "coordinateAtOffset:fromRouteCoordinate:", *(_QWORD *)&p_locationCoordinate->latitude, 5.0);

                objc_msgSend(*(id *)&self->_maxFramingDistance, "route");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "pointAtRouteCoordinate:", v23);
                v26 = v25;
                v28 = v27;

                if (v28 >= -180.0 && v28 <= 180.0 && v26 >= -90.0 && v26 <= 90.0)
                {
                  GEOBearingFromCoordinateToCoordinate();
                  v30 = fmod(-v29, 360.0);
                  v6 = fmod(v30 + 360.0, 360.0) * 0.0174532925;
                }
              }
            }
          }
        }
      }
      v31 = fmod(restingPosition + 3.14159265 - v6, 6.28318531);
      v32 = fmod(v31 + 6.28318531, 6.28318531) + -3.14159265;
      value = self->_headingMinDelta._value;
      if (v32 <= -value || v32 >= value)
      {
        v35 = fmod(fmin(fmax(v32, -self->_headingDelta._value), self->_headingDelta._value) + v6, 6.28318531);
        v6 = fmod(v35 + 6.28318531, 6.28318531);
      }
      goto LABEL_27;
    }
LABEL_4:
    restingPosition = self->_headingSpring._restingPosition;
    goto LABEL_11;
  }
  v6 = 0.0;
  if (v5 == 1)
    goto LABEL_4;
LABEL_28:
  v36 = fmod(v6, 6.28318531);
  v37._value = fmod(v36 + 6.28318531, 6.28318531);
  *v4 = v37._value;
  return v37;
}

- (Box<double,)calculateViewableScreenRectForEdgeInsets:(VKEdgeInsets)a3
{
  float right;
  float bottom;
  float left;
  float top;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  float v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  Box<double, 2> result;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[VKCameraController canvas](self, "canvas");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v10 = v9;
  v12 = v11;

  if (v10 * v12 <= 0.0)
  {
    v17 = -1.79769313e308;
    v15 = 1.79769313e308;
    v16 = 1.79769313e308;
    v19 = -1.79769313e308;
  }
  else
  {
    -[VKNavCameraController _currentRoadSignOffset](self, "_currentRoadSignOffset", v10 * v12);
    v14 = v13 + bottom;
    v15 = left;
    v16 = top;
    v17 = v10 - right;
    v18 = v14;
    v19 = v12 - v14;
    if (v17 < left || v19 < v16)
    {
      v15 = 0.0;
      v16 = 0.0;
      v17 = v10;
      v19 = v12;
    }
    else
    {
      v21 = self->_previousMapEdgeInsets.left
          + (v17 - v15) * self->_framingEdgeInset.left
          + self->_framingEdgeInsetProportional.left;
      v22 = self->_previousMapEdgeInsets.right
          + (v17 - v15) * self->_framingEdgeInset.right
          + self->_framingEdgeInsetProportional.right;
      v23 = v19 - v16;
      v24 = self->_previousMapEdgeInsets.top
          + (v19 - v16) * self->_framingEdgeInset.top
          + self->_framingEdgeInsetProportional.top;
      v25 = self->_previousMapEdgeInsets.bottom
          + (v19 - v16) * self->_framingEdgeInset.bottom
          + self->_framingEdgeInsetProportional.bottom;
      if (v21 + 25.0 > v17 - v15 - v22)
      {
        v26 = (v21 + 25.0 - (v17 - v15) + v22) * 0.5 + 12.5;
        v21 = v21 - v26;
        v22 = v22 - v26;
      }
      if (v25 + 25.0 > v23 - v24)
      {
        v27 = (v24 - v23 + v25 + 25.0) * 0.5 + 12.5;
        v25 = v25 - v27;
        v24 = v24 - v27;
      }
      v28 = fmax(v22, -right);
      v29 = fmax(v21, -v15) + v15;
      v30 = fmax(v24, -v18) + v16;
      v31 = v19 - fmax(v25, -v16);
      if (v17 - v28 >= v29 && v31 >= v30)
      {
        v15 = v29;
        v16 = v30;
        v17 = v17 - v28;
        v19 = v31;
      }
    }
  }
  result._maximum._e[1] = v19;
  result._maximum._e[0] = v17;
  result._minimum._e[1] = v16;
  result._minimum._e[0] = v15;
  return result;
}

- (Box<double,)calculateViewableScreenRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  Box<double, 2> result;

  -[VKCameraController edgeInsets](self, "edgeInsets");
  -[VKNavCameraController calculateViewableScreenRectForEdgeInsets:](self, "calculateViewableScreenRectForEdgeInsets:");
  result._maximum._e[1] = v6;
  result._maximum._e[0] = v5;
  result._minimum._e[1] = v4;
  result._minimum._e[0] = v3;
  return result;
}

- (void)updateSpringsForTrackingCamera
{
  Spring<double, 1, gdc::SpringType::Angular> *p_headingSpring;
  double v4;
  double v5;
  double v6;

  *(int64x2_t *)&self->_routeCoordinate.index = vdupq_n_s64(0xC00921FB54442D18);
  self->_routeFocusCoordinate.latitude._value = 0.0;
  self->_pitchSpring._restingPosition = self->_cameraPitch._value;
  p_headingSpring = &self->_headingSpring;
  -[VKNavCameraController calculateHeading](self, "calculateHeading");
  p_headingSpring->_restingPosition = v6;
  self->_distanceFromTargetSpring._restingPosition = self->_cameraDistanceFromTarget._value;
  -[VKNavCameraController puckScreenPoint](self, "puckScreenPoint");
  self->_screenPositionSpring._restingPosition._e[0] = v4;
  self->_screenPositionSpring._restingPosition._e[1] = v5;
  -[VKNavCameraController _updateForAnimatedEdgeInsets](self, "_updateForAnimatedEdgeInsets");
}

- (double)distanceToManeuver:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;

  objc_msgSend(*(id *)&self->_maxFramingDistance, "route");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "stepsCount");

  if (v6 <= a3)
  {
    objc_msgSend(*(id *)&self->_maxFramingDistance, "route");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v7, "stepsCount") - 1;

  }
  objc_msgSend(*(id *)&self->_maxFramingDistance, "route");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stepAtIndex:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "endRouteCoordinate");
  objc_msgSend(*(id *)&self->_maxFramingDistance, "route");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stepDistanceFromPoint:toPoint:", *(_QWORD *)&self->_locationCoordinate.latitude, v10);
  v13 = v12;

  return v13;
}

- (Coordinate3D<geo::Radians,)routeLocationAtDistance:(double)a3 fromManeuver:(unint64_t)a4
{
  int64x2_t *v4;
  int64x2_t *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  id v37;
  id v38;
  Coordinate3D<geo::Radians, double> result;

  v8 = v4;
  objc_msgSend(*(id *)&self->_maxFramingDistance, "route");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v36, "stepsCount");

  if (v9 <= a4)
  {
    objc_msgSend(*(id *)&self->_maxFramingDistance, "route");
    v37 = (id)objc_claimAutoreleasedReturnValue();
    a4 = objc_msgSend(v37, "stepsCount") - 1;

  }
  objc_msgSend(*(id *)&self->_maxFramingDistance, "route");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stepAtIndex:", a4);
  v38 = (id)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v38, "endRouteCoordinate");
  objc_msgSend(*(id *)&self->_maxFramingDistance, "route");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pointAtRouteCoordinate:", v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = objc_alloc(MEMORY[0x1E0D274E0]);
  objc_msgSend(*(id *)&self->_maxFramingDistance, "route");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)&self->_maxFramingDistance, "route");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "courseAtRouteCoordinateIndex:", v11);
  v23 = v22;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v19, "initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:", v20, v11, a4, v24, v14, v16, v18, v23);

  objc_msgSend(v25, "setIsGoodMatch:", 0);
  objc_msgSend(*(id *)&self->_maxFramingDistance, "route");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "locationAtDistance:from:", v25, a3);
  v28 = v27;
  v30 = v29;
  v32 = v31;

  if (v30 < -180.0 || v30 > 180.0 || v28 < -90.0 || v28 > 90.0)
  {
    *v8 = vdupq_n_s64(0xC00921FB54442D18);
    v8[1].i64[0] = 0;
  }
  else
  {
    -[VKNavCameraController _coordinateForGeoLocation:](self, "_coordinateForGeoLocation:", v28, v30, v32);
  }

  result.altitude = *(Unit<geo::MeterUnitDescription, double> *)&v35;
  result.longitude = *(Unit<geo::RadianUnitDescription, double> *)&v34;
  result.latitude = *(Unit<geo::RadianUnitDescription, double> *)&v33;
  return result;
}

- (Coordinate3D<geo::Radians,)routeCoordinateAtDistance:(double)a3
{
  int64x2_t *v3;
  int64x2_t *v6;
  $AB5116BA7E623E054F959CECB034F4E7 *p_locationCoordinate;
  float v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int64x2_t v25;
  Coordinate3D<geo::Radians, double> result;

  v6 = v3;
  p_locationCoordinate = &self->_locationCoordinate;
  v8 = *((float *)&self->_locationCoordinate.latitude + 1);
  objc_msgSend(*(id *)&self->_maxFramingDistance, "route");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 >= 0.0)
    v11 = objc_msgSend(v9, "coordinateAtOffset:fromRouteCoordinate:", *(_QWORD *)&p_locationCoordinate->latitude, a3);
  else
    v11 = objc_msgSend(v9, "coordinateAtOffset:", a3);
  v12 = v11;

  objc_msgSend(*(id *)&self->_maxFramingDistance, "route");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pointAtRouteCoordinate:", v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;

  if (v17 >= -180.0 && v17 <= 180.0 && v15 >= -90.0 && v15 <= 90.0)
  {
    -[VKNavCameraController _coordinateForGeoLocation:](self, "_coordinateForGeoLocation:", v15, v17, v19);
  }
  else
  {
    v25 = vdupq_n_s64(0xC00921FB54442D18);
    *v6 = v25;
    v6[1].i64[0] = 0;
  }
  result.latitude = *(Unit<geo::RadianUnitDescription, double> *)v25.i8;
  result.altitude = *(Unit<geo::MeterUnitDescription, double> *)&v21;
  result.longitude = *(Unit<geo::RadianUnitDescription, double> *)&v20;
  return result;
}

- (void)updateManeuversToFrame
{
  unsigned int end_low;
  unsigned __int8 v4;

  end_low = LOBYTE(self->_coordinatesToFrame.__end_);
  BYTE1(self->_coordinatesToFrame.__end_) = end_low;
  if (LOBYTE(self->_locationCoordinate.longitude))
  {
    v4 = objc_msgSend(*(id *)&self->_maxFramingDistance, "groupedManeuverCount");
    end_low = v4;
    if ((v4 & 0xFE) == 0)
      end_low = 1;
    BYTE1(self->_coordinatesToFrame.__end_) = end_low;
  }
  if (BYTE1(self->_locationCoordinate.longitude) < end_low)
    LOBYTE(end_low) = BYTE1(self->_locationCoordinate.longitude);
  BYTE1(self->_coordinatesToFrame.__end_) = end_low;
}

- (BOOL)_addStepToFraming:(unint64_t)a3 forRoute:(id)a4
{
  void *v6;
  unsigned int v7;
  int latitude_low;
  unsigned int v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  void *v14;
  int64_t v15;
  int *v16;
  _BYTE *v17;
  unint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  unint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  BOOL v36;
  unint64_t v38;
  const double *v39;
  double *v40;
  uint64_t v41;
  int64_t v42;
  unsigned int v43;
  double v44;
  double v45;
  int *p_var0;
  _BYTE *begin;
  unint64_t var0;
  _BYTE *v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  char *v54;
  char *v55;
  unint64_t v56;
  char *v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  BOOL v65;
  unint64_t v67;
  const double *v68;
  double *v69;
  uint64_t v70;
  int *v71;
  _BYTE *v72;
  unint64_t v73;
  _QWORD *v74;
  _BYTE *v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  char *v80;
  char *v81;
  unint64_t v82;
  uint64_t v83;
  unint64_t v85;
  BOOL v87;
  BOOL v88;
  unint64_t v89;
  const double *v90;
  double *v91;
  uint64_t v92;
  void *v93;
  unsigned int v94;
  id v95;
  _BYTE v96[24];
  float64x2x3_t v97;
  float64x2x3_t v98;
  float64x2x3_t v99;

  v95 = a4;
  objc_msgSend(v95, "stepAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = v6;
  v7 = objc_msgSend(v6, "startRouteCoordinate");
  latitude_low = LODWORD(self->_locationCoordinate.latitude);
  if (latitude_low + 1 > v7)
    v9 = latitude_low + 1;
  else
    v9 = v7;
  v94 = objc_msgSend(v6, "endRouteCoordinate");
  if (*(double *)&self->_enablePan > 0.0)
  {
    -[VKNavCameraController distanceToManeuver:](self, "distanceToManeuver:", a3);
    v11 = v10;
    v12 = *(double *)&self->_enablePan;
    if (v11 > v12)
    {
      if (v9 <= v94)
      {
        while (1)
        {
          v43 = v9;
          objc_msgSend(v95, "stepDistanceFromPoint:toPoint:", *(_QWORD *)&self->_locationCoordinate.latitude, v9);
          v45 = v44;
          v12 = *(double *)&self->_enablePan;
          if (v45 > v12)
            goto LABEL_81;
          objc_msgSend(v95, "pointWithAltitudeCorrectionAtIndex:", v9);
          -[VKNavCameraController _coordinateForGeoLocation:](self, "_coordinateForGeoLocation:");
          p_var0 = &self->_currentStyleName.__r_.var0;
          var0 = self->_currentStyleName.var0;
          begin = self->_coordinatesToFrame.__begin_;
          if (var0 >= (unint64_t)begin)
            break;
          *(_QWORD *)var0 = *(_QWORD *)v96;
          *(_OWORD *)(var0 + 8) = *(_OWORD *)&v96[8];
          v42 = var0 + 24;
LABEL_46:
          self->_currentStyleName.var0 = v42;
          v9 = v43 + 1;
          if (v43 + 1 > v94)
          {
            v12 = *(double *)&self->_enablePan;
            goto LABEL_81;
          }
        }
        v49 = *(_BYTE **)p_var0;
        v50 = var0 - *(_QWORD *)p_var0;
        v51 = 0xAAAAAAAAAAAAAAABLL * (v50 >> 3) + 1;
        if (v51 > 0xAAAAAAAAAAAAAAALL)
          abort();
        v52 = 0xAAAAAAAAAAAAAAABLL * ((begin - v49) >> 3);
        if (2 * v52 > v51)
          v51 = 2 * v52;
        if (v52 >= 0x555555555555555)
          v53 = 0xAAAAAAAAAAAAAAALL;
        else
          v53 = v51;
        if (v53 > 0xAAAAAAAAAAAAAAALL)
          goto LABEL_120;
        v54 = (char *)operator new(24 * v53);
        v55 = &v54[8 * (v50 >> 3)];
        *(_OWORD *)v55 = *(_OWORD *)v96;
        *((_QWORD *)v55 + 2) = *(_QWORD *)&v96[16];
        if ((_BYTE *)var0 == v49)
        {
          v57 = &v54[8 * (v50 >> 3)];
          goto LABEL_62;
        }
        v56 = var0 - (_QWORD)v49 - 24;
        if (v56 >= 0x168)
        {
          v59 = v56 / 0x18;
          v60 = -24 * (v56 / 0x18) + v50;
          v61 = (unint64_t)&v54[v60 - 24];
          v62 = var0 - 24 * (v56 / 0x18) - 24;
          v63 = var0 - 8 - 24 * (v56 / 0x18);
          v65 = (unint64_t)&v54[v60 - 8] < var0 && v63 < (unint64_t)v55;
          v57 = &v54[8 * (v50 >> 3)];
          if ((v62 >= (unint64_t)&v54[v50 - 8] || v61 >= var0 - 8) && !v65)
          {
            v67 = v59 + 1;
            v68 = (const double *)(var0 - 48);
            v69 = (double *)(v55 - 48);
            v70 = v67 & 0x1FFFFFFFFFFFFFFELL;
            do
            {
              v98 = vld3q_f64(v68);
              vst3q_f64(v69, v98);
              v69 -= 6;
              v68 -= 6;
              v70 -= 2;
            }
            while (v70);
            v57 = &v55[-24 * (v67 & 0x1FFFFFFFFFFFFFFELL)];
            var0 -= 24 * (v67 & 0x1FFFFFFFFFFFFFFELL);
            if (v67 == (v67 & 0x1FFFFFFFFFFFFFFELL))
            {
LABEL_62:
              v42 = (int64_t)(v55 + 24);
              *(_QWORD *)p_var0 = v57;
              self->_currentStyleName.var0 = (int64_t)(v55 + 24);
              self->_coordinatesToFrame.__begin_ = &v54[24 * v53];
              if (v49)
                operator delete(v49);
              goto LABEL_46;
            }
          }
        }
        else
        {
          v57 = &v54[8 * (v50 >> 3)];
        }
        do
        {
          v58 = *(_QWORD *)(var0 - 24);
          var0 -= 24;
          *((_QWORD *)v57 - 3) = v58;
          v57 -= 24;
          *(_OWORD *)(v57 + 8) = *(_OWORD *)(var0 + 8);
        }
        while ((_BYTE *)var0 != v49);
        goto LABEL_62;
      }
LABEL_81:
      -[VKNavCameraController routeCoordinateAtDistance:](self, "routeCoordinateAtDistance:", v12);
      v14 = v93;
      if (*(double *)v96 == -3.14159265 && *(double *)&v96[8] == -3.14159265 && *(double *)&v96[16] == 0.0)
      {
LABEL_102:
        v13 = 1;
        goto LABEL_103;
      }
      v71 = &self->_currentStyleName.__r_.var0;
      v73 = self->_currentStyleName.var0;
      v72 = self->_coordinatesToFrame.__begin_;
      if (v73 < (unint64_t)v72)
      {
        *(_OWORD *)v73 = *(_OWORD *)v96;
        *(_QWORD *)(v73 + 16) = *(_QWORD *)&v96[16];
        v74 = (_QWORD *)(v73 + 24);
LABEL_101:
        *((_QWORD *)v71 + 1) = v74;
        goto LABEL_102;
      }
      v75 = *(_BYTE **)v71;
      v76 = v73 - *(_QWORD *)v71;
      v77 = 0xAAAAAAAAAAAAAAABLL * (v76 >> 3) + 1;
      if (v77 > 0xAAAAAAAAAAAAAAALL)
        abort();
      v78 = 0xAAAAAAAAAAAAAAABLL * ((v72 - v75) >> 3);
      if (2 * v78 > v77)
        v77 = 2 * v78;
      if (v78 >= 0x555555555555555)
        v79 = 0xAAAAAAAAAAAAAAALL;
      else
        v79 = v77;
      if (v79 > 0xAAAAAAAAAAAAAAALL)
LABEL_120:
        std::__throw_bad_array_new_length[abi:nn180100]();
      v80 = (char *)operator new(24 * v79);
      v81 = &v80[8 * (v76 >> 3)];
      *(_QWORD *)v81 = *(_QWORD *)v96;
      *((_QWORD *)v81 + 1) = *(_QWORD *)&v96[8];
      *((_QWORD *)v81 + 2) = *(_QWORD *)&v96[16];
      v74 = v81 + 24;
      if ((_BYTE *)v73 == v75)
      {
        v14 = v93;
        goto LABEL_99;
      }
      v82 = v73 - (_QWORD)v75 - 24;
      if (v82 >= 0x1C8)
      {
        v85 = v82 / 0x18;
        v87 = (unint64_t)&v80[v76 - 8 - 24 * v85] < v73 && v73 - 24 * v85 - 8 < (unint64_t)v81;
        v88 = v73 - 24 * v85 - 24 >= (unint64_t)&v80[v76 - 8]
           || (unint64_t)&v80[v76 - 24 * v85 - 24] >= v73 - 8;
        v14 = v93;
        if (v88 && !v87)
        {
          v89 = v85 + 1;
          v90 = (const double *)(v73 - 48);
          v91 = (double *)(v81 - 48);
          v92 = v89 & 0x1FFFFFFFFFFFFFFELL;
          do
          {
            v99 = vld3q_f64(v90);
            vst3q_f64(v91, v99);
            v91 -= 6;
            v90 -= 6;
            v92 -= 2;
          }
          while (v92);
          v81 -= 24 * (v89 & 0x1FFFFFFFFFFFFFFELL);
          v73 -= 24 * (v89 & 0x1FFFFFFFFFFFFFFELL);
          if (v89 == (v89 & 0x1FFFFFFFFFFFFFFELL))
          {
LABEL_99:
            *(_QWORD *)v71 = v81;
            *((_QWORD *)v71 + 1) = v74;
            *((_QWORD *)v71 + 2) = &v80[24 * v79];
            if (v75)
              operator delete(v75);
            goto LABEL_101;
          }
        }
      }
      else
      {
        v14 = v93;
      }
      do
      {
        v83 = *(_QWORD *)(v73 - 24);
        v73 -= 24;
        *((_QWORD *)v81 - 3) = v83;
        v81 -= 24;
        *(_OWORD *)(v81 + 8) = *(_OWORD *)(v73 + 8);
      }
      while ((_BYTE *)v73 != v75);
      goto LABEL_99;
    }
  }
  if (v9 <= v94)
  {
    while (1)
    {
      objc_msgSend(v95, "pointWithAltitudeCorrectionAtIndex:", v9);
      -[VKNavCameraController _coordinateForGeoLocation:](self, "_coordinateForGeoLocation:");
      v16 = &self->_currentStyleName.__r_.var0;
      v18 = self->_currentStyleName.var0;
      v17 = self->_coordinatesToFrame.__begin_;
      if (v18 >= (unint64_t)v17)
        break;
      *(_QWORD *)v18 = *(_QWORD *)v96;
      *(_OWORD *)(v18 + 8) = *(_OWORD *)&v96[8];
      v15 = v18 + 24;
LABEL_10:
      self->_currentStyleName.var0 = v15;
      if (++v9 > v94)
        goto LABEL_7;
    }
    v19 = *(_BYTE **)v16;
    v20 = v18 - *(_QWORD *)v16;
    v21 = 0xAAAAAAAAAAAAAAABLL * (v20 >> 3) + 1;
    if (v21 > 0xAAAAAAAAAAAAAAALL)
      abort();
    v22 = 0xAAAAAAAAAAAAAAABLL * ((v17 - v19) >> 3);
    if (2 * v22 > v21)
      v21 = 2 * v22;
    if (v22 >= 0x555555555555555)
      v23 = 0xAAAAAAAAAAAAAAALL;
    else
      v23 = v21;
    if (v23 > 0xAAAAAAAAAAAAAAALL)
      goto LABEL_120;
    v24 = (char *)operator new(24 * v23);
    v25 = &v24[8 * (v20 >> 3)];
    *(_OWORD *)v25 = *(_OWORD *)v96;
    *((_QWORD *)v25 + 2) = *(_QWORD *)&v96[16];
    if ((_BYTE *)v18 == v19)
    {
      v27 = &v24[8 * (v20 >> 3)];
    }
    else
    {
      v26 = v18 - (_QWORD)v19 - 24;
      if (v26 >= 0x168)
      {
        v30 = v26 / 0x18;
        v31 = -24 * (v26 / 0x18) + v20;
        v32 = (unint64_t)&v24[v31 - 24];
        v33 = v18 - 24 * (v26 / 0x18) - 24;
        v34 = v18 - 8 - 24 * (v26 / 0x18);
        v36 = (unint64_t)&v24[v31 - 8] < v18 && v34 < (unint64_t)v25;
        v27 = &v24[8 * (v20 >> 3)];
        if ((v33 >= (unint64_t)&v24[v20 - 8] || v32 >= v18 - 8) && !v36)
        {
          v38 = v30 + 1;
          v39 = (const double *)(v18 - 48);
          v40 = (double *)(v25 - 48);
          v41 = v38 & 0x1FFFFFFFFFFFFFFELL;
          do
          {
            v97 = vld3q_f64(v39);
            vst3q_f64(v40, v97);
            v40 -= 6;
            v39 -= 6;
            v41 -= 2;
          }
          while (v41);
          v27 = &v25[-24 * (v38 & 0x1FFFFFFFFFFFFFFELL)];
          v18 -= 24 * (v38 & 0x1FFFFFFFFFFFFFFELL);
          if (v38 == (v38 & 0x1FFFFFFFFFFFFFFELL))
            goto LABEL_25;
        }
      }
      else
      {
        v27 = &v24[8 * (v20 >> 3)];
      }
      do
      {
        v28 = *(_QWORD *)(v18 - 24);
        v18 -= 24;
        *((_QWORD *)v27 - 3) = v28;
        v27 -= 24;
        *(_OWORD *)(v27 + 8) = *(_OWORD *)(v18 + 8);
      }
      while ((_BYTE *)v18 != v19);
    }
LABEL_25:
    v29 = &v24[24 * v23];
    v15 = (int64_t)(v25 + 24);
    *(_QWORD *)v16 = v27;
    self->_currentStyleName.var0 = (int64_t)(v25 + 24);
    self->_coordinatesToFrame.__begin_ = v29;
    if (v19)
      operator delete(v19);
    goto LABEL_10;
  }
LABEL_7:
  v13 = 0;
  v14 = v93;
LABEL_103:

  return v13;
}

- (void)_addWaypointToFraming:(id)a3 forRoute:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  const char *v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  int v24;
  double v25;
  float64x2_t *v26;
  double v27;
  float64x2_t v28;
  __double2 v29;
  double v30;
  double v31;
  __double2 v32;
  long double v33;
  float64x2_t v34;
  float64x2_t v40;
  unint64_t *p_shared_owners;
  unint64_t v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  _QWORD *v46;
  _QWORD *v47;
  uint64_t v48;
  unsigned int v49;
  double *v50;
  std::__shared_weak_count *v51;
  float64x2_t v52;
  double v53;
  float64x2_t v54;
  double v55;
  float64x2_t v56;
  double v57;
  float64x2_t v58;
  double v59;
  float64x2_t *v60;
  std::__shared_weak_count *v61;
  float64x2_t v62;
  uint64_t v63[7];
  __int128 v64;
  char v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  VKNavCameraController *v72;
  _BYTE v73[24];
  _BYTE *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v72 = self;
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (*(_QWORD *)&self->_isElevatedRoute)
  {
    objc_msgSend(v7, "waypointDisplayInfoForWaypoint:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "waypointCaption");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithDefaultOptions");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (const char *)objc_msgSend(v11, "UTF8String");
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localeIdentifier");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    md::StringWithLocaleImp<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>::StringWithLocaleImp((uint64_t)&v66, v12, (const char *)objc_msgSend(v14, "UTF8String"));

    md::LabelMetrics::boundingRectForItem((uint64_t)&v64, *(unsigned __int8 ***)&self->_isElevatedRoute, 1, &v66);
    if (!v65)
      goto LABEL_29;
    -[VKNavCameraController restingCameraFrame](self, "restingCameraFrame");
    objc_msgSend(v6, "location");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "coordinate");
    v17 = v16;
    objc_msgSend(v6, "location");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "coordinate");
    v20 = v19;
    objc_msgSend(v6, "location");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0.0;
    if (objc_msgSend(v21, "hasAltitude"))
    {
      objc_msgSend(v6, "location");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "altitude");

      v22 = (double)v24;
    }

    -[VKCameraController camera](self, "camera");
    -[VKCameraController camera](self, "camera");
    gdc::ViewDataAccess::worldViewProjectionMatrix((uint64_t)&v52, v50, v63);
    v26 = v60;
    v27 = v60[23].f64[1] * v60[23].f64[0];
    v28 = 0uLL;
    if (v27 != 0.0)
    {
      if (LOBYTE(v60->f64[0]) - 1 >= 3)
      {
        if (!LOBYTE(v60->f64[0]))
        {
          v33 = tan(v17 * 0.00872664626 + 0.785398163);
          v28.f64[0] = log(v33);
          v27 = v20 * 0.00277777778 + 0.5;
          v28.f64[0] = v28.f64[0] * 0.159154943 + 0.5;
          v25 = v22 * 0.0000000249532021;
        }
      }
      else
      {
        v29 = __sincos_stret(v17 * 0.0174532925);
        v30 = 6378137.0 / sqrt(v29.__sinval * v29.__sinval * -0.00669437999 + 1.0);
        v31 = (v30 + v22) * v29.__cosval;
        v32 = __sincos_stret(v20 * 0.0174532925);
        v27 = v31 * v32.__cosval;
        v28.f64[0] = v31 * v32.__sinval;
        v25 = (v22 + v30 * 0.99330562) * v29.__sinval;
      }
      v34 = vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v58, v52, v27), v54, v28.f64[0]), v56, v25), 0.5 / (v59 + v53 * v27 + v55 * v28.f64[0] + v57 * v25));
      __asm { FMOV            V1.2D, #0.5 }
      *(_QWORD *)&v40.f64[0] = *(_OWORD *)&vaddq_f64(v34, _Q1);
      v40.f64[1] = vsubq_f64(_Q1, v34).f64[1];
      v28 = vmulq_f64(v40, v26[23]);
    }
    v62 = v28;
    if (v51)
    {
      p_shared_owners = (unint64_t *)&v51->__shared_owners_;
      do
        v42 = __ldaxr(p_shared_owners);
      while (__stlxr(v42 - 1, p_shared_owners));
      if (!v42)
      {
        ((void (*)())v51->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v51);
      }
    }
    v43 = v61;
    if (v61)
    {
      v44 = (unint64_t *)&v61->__shared_owners_;
      do
        v45 = __ldaxr(v44);
      while (__stlxr(v45 - 1, v44));
      if (!v45)
      {
        ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
        std::__shared_weak_count::__release_weak(v43);
      }
    }
    v74 = 0;
    v46 = operator new(0x20uLL);
    *v46 = &off_1E42C7D78;
    v46[1] = &v72;
    v46[2] = &v62;
    v46[3] = v63;
    v74 = v46;
    v49 = HIDWORD(v64);
    v52.f64[0] = *((float64_t *)&v64 + 1);
    std::__function::__func<-[VKNavCameraController _addWaypointToFraming:forRoute:]::$_0,std::allocator<-[VKNavCameraController _addWaypointToFraming:forRoute:]::$_0>,void ()(gm::Matrix<float,2,1> &)>::operator()((uint64_t)v46, (float32x2_t *)&v52);
    *(_QWORD *)&v52.f64[0] = __PAIR64__(v49, v64);
    if (!v74
      || ((*(void (**)(_BYTE *, float64x2_t *))(*(_QWORD *)v74 + 48))(v74, &v52),
          *(int32x2_t *)&v52.f64[0] = vrev64_s32(*(int32x2_t *)((char *)&v64 + 4)),
          !v74)
      || ((*(void (**)(_BYTE *, float64x2_t *))(*(_QWORD *)v74 + 48))(v74, &v52),
          *(_QWORD *)&v52.f64[0] = v64,
          !v74))
    {
      std::__throw_bad_function_call[abi:nn180100]();
      __break(1u);
    }
    (*(void (**)(_BYTE *, float64x2_t *))(*(_QWORD *)v74 + 48))(v74, &v52);
    v47 = v74;
    if (v74 == v73)
    {
      v48 = 4;
      v47 = v73;
    }
    else
    {
      if (!v74)
        goto LABEL_29;
      v48 = 5;
    }
    (*(void (**)(void))(*v47 + 8 * v48))();
LABEL_29:
    if (SHIBYTE(v70) < 0)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v71 + 40))(v71, v69, v70 & 0x7FFFFFFFFFFFFFFFLL);
      if ((SHIBYTE(v67) & 0x80000000) == 0)
        goto LABEL_31;
    }
    else if ((SHIBYTE(v67) & 0x80000000) == 0)
    {
      goto LABEL_31;
    }
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v68 + 40))(v68, v66, v67 & 0x7FFFFFFFFFFFFFFFLL);
  }
LABEL_31:

}

- (void)updatePointsToFrame
{
  unint64_t v3;
  double maxFramingDistance;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t i;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v16;
  void *v17;
  unint64_t j;
  void *v19;
  void *v20;
  unint64_t v21;
  id v23;
  int v24;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char *v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  char *v49;
  unint64_t v50;
  char *v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v56;
  uint64_t v57;
  double v58;
  uint64_t v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  char *v84;
  unint64_t v85;
  char *v86;
  unint64_t v87;
  uint64_t v88;
  unint64_t v89;
  BOOL v91;
  BOOL v92;
  unint64_t v93;
  const double *v94;
  double *v95;
  uint64_t v96;
  unint64_t v97;
  BOOL v98;
  BOOL v99;
  unint64_t v101;
  const double *v102;
  double *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  unsigned int v108;
  int latitude_low;
  uint64_t v110;
  unsigned int v111;
  id WeakRetained;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  char v118;
  uint64_t v119;
  double v120;
  char v121;
  int *v122;
  double v123;
  char v124;
  double v125;
  id v126;
  _QWORD *v127;
  int8x8_t v128;
  uint8x8_t v129;
  uint64_t v130;
  double v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t **v134;
  uint64_t *v135;
  uint64_t v136;
  unint64_t v137;
  uint64_t v138;
  void *v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  unint64_t v146;
  unint64_t v147;
  unint64_t v148;
  void *v149;
  unint64_t v150;
  unint64_t v151;
  unint64_t v152;
  char *v153;
  unint64_t v154;
  unint64_t v155;
  char *v156;
  uint64_t v157;
  unint64_t v158;
  unint64_t v159;
  unint64_t v160;
  BOOL v162;
  unint64_t v164;
  const double *v165;
  double *v166;
  uint64_t v167;
  uint64_t v168;
  unint64_t v169;
  void *v170;
  double v171;
  double v172;
  unint64_t v173;
  unint64_t v174;
  void *v175;
  uint64_t v176;
  unint64_t v177;
  unint64_t v178;
  unint64_t v179;
  char *v180;
  unint64_t v181;
  unint64_t v182;
  char *v183;
  unint64_t v184;
  uint64_t v185;
  unint64_t v186;
  unint64_t v187;
  BOOL v188;
  char v189;
  BOOL v190;
  unint64_t v191;
  const double *v192;
  double *v193;
  uint64_t v194;
  unint64_t v195;
  BOOL v197;
  unint64_t v199;
  const double *v200;
  double *v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  char v205;
  unint64_t v206;
  unint64_t v207;
  void *v208;
  void *v209;
  uint64_t v210;
  int *p_var0;
  _QWORD v212[5];
  _QWORD v213[5];
  _QWORD v214[5];
  _BYTE v215[2];
  _BYTE v216[24];
  float64x2x3_t v217;
  float64x2x3_t v218;
  float64x2x3_t v219;
  float64x2x3_t v220;
  float64x2x3_t v221;

  p_var0 = &self->_currentStyleName.__r_.var0;
  self->_currentStyleName.var0 = *(_QWORD *)&self->_currentStyleName.__r_.var0;
  v3 = objc_msgSend(*(id *)&self->_maxFramingDistance, "currentStepIndex");
  maxFramingDistance = self->_maxFramingDistance;
  if (maxFramingDistance != 0.0)
  {
    objc_msgSend(*(id *)&maxFramingDistance, "route");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(*(id *)&self->_maxFramingDistance, "route");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (BYTE3(self->_coordinatesToFrame.__end_))
      {
        v8 = objc_msgSend(v6, "segmentIndexForStepIndex:", v3);
        for (i = v8; ; ++i)
        {
          objc_msgSend(v7, "segments");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (i >= objc_msgSend(v10, "count"))
            break;
          v11 = v8 + BYTE3(self->_coordinatesToFrame.__end_);

          if (i >= v11)
            goto LABEL_16;
          objc_msgSend(v7, "segments");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectAtIndex:", i);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            v14 = v3;
            if (objc_msgSend(v13, "startStepIndex") > v3)
              v14 = objc_msgSend(v13, "startStepIndex");
            do
            {
              if (v14 > objc_msgSend(v13, "endStepIndex"))
                break;
            }
            while (!-[VKNavCameraController _addStepToFraming:forRoute:](self, "_addStepToFraming:forRoute:", v14++, v7));
          }

        }
      }
LABEL_16:
      if (BYTE2(self->_coordinatesToFrame.__end_))
      {
        v16 = objc_msgSend(v7, "legIndexForStepIndex:", v3);
        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v7, "legs");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          for (j = v16;
                j < objc_msgSend(v17, "count") && j < v16 + (unint64_t)BYTE2(self->_coordinatesToFrame.__end_);
                ++j)
          {
            objc_msgSend(v17, "objectAtIndex:", j);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v19;
            if (v19)
            {
              v21 = v3;
              if (objc_msgSend(v19, "startStepIndex") > v3)
                v21 = objc_msgSend(v20, "startStepIndex");
              do
              {
                if (v21 > objc_msgSend(v20, "endStepIndex"))
                  break;
              }
              while (!-[VKNavCameraController _addStepToFraming:forRoute:](self, "_addStepToFraming:forRoute:", v21++, v7));
            }

          }
        }
      }
      if (!BYTE1(self->_coordinatesToFrame.__end_))
      {
LABEL_154:
        WeakRetained = objc_loadWeakRetained((id *)&self->_cameraMode);
        v113 = objc_msgSend(WeakRetained, "navCameraMode");

        if (v113 == 1)
        {
          objc_msgSend(v7, "destination");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          -[VKNavCameraController _addWaypointToFraming:forRoute:](self, "_addWaypointToFraming:forRoute:", v116, v7);
        }
        else
        {
          if (v113 != 3)
            goto LABEL_160;
          v114 = objc_msgSend(v7, "legIndexForStepIndex:", v3);
          if (v114 == 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_160;
          objc_msgSend(v7, "legs");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "objectAtIndex:", v114);
          v116 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v116, "destination");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          -[VKNavCameraController _addWaypointToFraming:forRoute:](self, "_addWaypointToFraming:forRoute:", v117, v7);

        }
LABEL_160:

        goto LABEL_161;
      }
      v23 = objc_loadWeakRetained((id *)&self->_cameraMode);
      v24 = objc_msgSend(v23, "navigationState");

      if (v24 != 6 && v24 != 1)
      {
LABEL_75:
        v54 = v3;
        while (v54 < objc_msgSend(v7, "stepsCount") && v54 < v3 + BYTE1(self->_coordinatesToFrame.__end_))
        {
          if (-[VKNavCameraController _addStepToFraming:forRoute:](self, "_addStepToFraming:forRoute:", v54++, v7))
          {
            v56 = 1;
            goto LABEL_81;
          }
        }
        v56 = 0;
LABEL_81:
        v57 = *((_QWORD *)p_var0 + 1);
        if (v57 == *(_QWORD *)p_var0)
        {
          *(int64x2_t *)&self->_routeCoordinate.index = vdupq_n_s64(0xC00921FB54442D18);
          self->_routeFocusCoordinate.latitude._value = 0.0;
        }
        else
        {
          v58 = *(double *)(v57 - 8);
          *(_OWORD *)&self->_routeCoordinate.index = *(_OWORD *)(v57 - 24);
          self->_routeFocusCoordinate.latitude._value = v58;
        }
        v59 = objc_msgSend(v7, "stepsCount");
        if (v24 != 6)
        {
          if (v3 != v59 - 1)
            goto LABEL_142;
          -[VKNavCameraController distanceToManeuver:](self, "distanceToManeuver:", v3);
          v71 = v70;
          if (v70 >= *(double *)&self->_enablePan)
            goto LABEL_142;
          objc_msgSend(v7, "destination");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v60, "hasLatLng"))
            goto LABEL_141;
          objc_msgSend(v7, "stepAtIndex:", v3);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "pointAtRouteCoordinate:", objc_msgSend(v72, "endRouteCoordinate"));
          objc_msgSend(v60, "latLng");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "lat");
          objc_msgSend(v60, "latLng");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "lng");
          GEOCalculateDistance();
          v76 = v75;

          v77 = v76 + v71;
          v78 = *(double *)&self->_enablePan;

          if (v77 >= v78)
          {
LABEL_142:
            if ((v56 & 1) != 0)
              goto LABEL_154;
            if (*(double *)&self->_alternateFramingSource <= 0.0)
              goto LABEL_154;
            v105 = BYTE1(self->_coordinatesToFrame.__end_);
            v106 = v3 + v105;
            if (v3 + v105 >= objc_msgSend(v7, "stepsCount"))
              goto LABEL_154;
            objc_msgSend(v7, "stepAtIndex:", v3 + v105);
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            v204 = v107;
            v108 = objc_msgSend(v107, "startRouteCoordinate");
            v203 = v106;
            latitude_low = LODWORD(self->_locationCoordinate.latitude);
            if (latitude_low + 1 > v108)
              v110 = (latitude_low + 1);
            else
              v110 = v108;
            v111 = objc_msgSend(v107, "endRouteCoordinate");
            if (v110 > v111)
            {
LABEL_149:
              -[VKNavCameraController routeLocationAtDistance:fromManeuver:](self, "routeLocationAtDistance:fromManeuver:", v203 - 1, *(double *)&self->_alternateFramingSource);
              if (*(double *)v216 != -3.14159265 || *(double *)&v216[8] != -3.14159265 || *(double *)&v216[16] != 0.0)
                std::vector<geo::Coordinate3D<geo::Radians,double>>::push_back[abi:nn180100]((uint64_t)p_var0, (uint64_t)v216);

              goto LABEL_154;
            }
            v168 = v110;
            while (1)
            {
              objc_msgSend(*(id *)&self->_maxFramingDistance, "route");
              v170 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v170, "distanceBetweenRoutePointIndex:toPointIndex:", v110, v168);
              v172 = v171;

              if (v172 > *(double *)&self->_alternateFramingSource)
                goto LABEL_149;
              objc_msgSend(v7, "pointWithAltitudeCorrectionAtIndex:", v168);
              -[VKNavCameraController _coordinateForGeoLocation:](self, "_coordinateForGeoLocation:");
              v174 = *((_QWORD *)p_var0 + 1);
              v173 = *((_QWORD *)p_var0 + 2);
              if (v174 >= v173)
                break;
              *(_QWORD *)v174 = *(_QWORD *)v216;
              *(_OWORD *)(v174 + 8) = *(_OWORD *)&v216[8];
              v169 = v174 + 24;
LABEL_235:
              *((_QWORD *)p_var0 + 1) = v169;
              v168 = (v168 + 1);
              if (v168 > v111)
                goto LABEL_149;
            }
            v175 = *(void **)p_var0;
            v176 = v174 - *(_QWORD *)p_var0;
            v177 = 0xAAAAAAAAAAAAAAABLL * (v176 >> 3) + 1;
            if (v177 > 0xAAAAAAAAAAAAAAALL)
              abort();
            v178 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v173 - (_QWORD)v175) >> 3);
            if (2 * v178 > v177)
              v177 = 2 * v178;
            if (v178 >= 0x555555555555555)
              v179 = 0xAAAAAAAAAAAAAAALL;
            else
              v179 = v177;
            if (v179 > 0xAAAAAAAAAAAAAAALL)
              goto LABEL_285;
            v207 = v179;
            v180 = (char *)operator new(24 * v179);
            v181 = (unint64_t)&v180[8 * (v176 >> 3)];
            *(_OWORD *)v181 = *(_OWORD *)v216;
            *(_QWORD *)(v181 + 16) = *(_QWORD *)&v216[16];
            if ((void *)v174 == v175)
            {
              v183 = &v180[8 * (v176 >> 3)];
              v184 = v207;
              goto LABEL_251;
            }
            v182 = v174 - (_QWORD)v175 - 24;
            if (v182 >= 0x168
              && ((v186 = v182 / 0x18, v187 = -24 * (v182 / 0x18), (unint64_t)&v180[v187 - 8 + v176] < v174)
                ? (v188 = v174 - 8 - 24 * v186 >= v181)
                : (v188 = 1),
                  v188 ? (v189 = 0) : (v189 = 1),
                  v174 - 24 * v186 - 24 < (unint64_t)&v180[v176 - 8]
                ? (v190 = (unint64_t)&v180[v187 - 24 + v176] >= v174 - 8)
                : (v190 = 1),
                  v190))
            {
              v183 = &v180[8 * (v176 >> 3)];
              v184 = v207;
              if ((v189 & 1) == 0)
              {
                v191 = v186 + 1;
                v192 = (const double *)(v174 - 48);
                v193 = (double *)(v181 - 48);
                v194 = v191 & 0x1FFFFFFFFFFFFFFELL;
                do
                {
                  v220 = vld3q_f64(v192);
                  vst3q_f64(v193, v220);
                  v193 -= 6;
                  v192 -= 6;
                  v194 -= 2;
                }
                while (v194);
                v183 = (char *)(v181 - 24 * (v191 & 0x1FFFFFFFFFFFFFFELL));
                v174 -= 24 * (v191 & 0x1FFFFFFFFFFFFFFELL);
                if (v191 == (v191 & 0x1FFFFFFFFFFFFFFELL))
                {
LABEL_251:
                  v169 = v181 + 24;
                  *(_QWORD *)p_var0 = v183;
                  *((_QWORD *)p_var0 + 1) = v181 + 24;
                  *((_QWORD *)p_var0 + 2) = &v180[24 * v184];
                  if (v175)
                    operator delete(v175);
                  goto LABEL_235;
                }
              }
            }
            else
            {
              v183 = &v180[8 * (v176 >> 3)];
              v184 = v207;
            }
            do
            {
              v185 = *(_QWORD *)(v174 - 24);
              v174 -= 24;
              *((_QWORD *)v183 - 3) = v185;
              v183 -= 24;
              *(_OWORD *)(v183 + 8) = *(_OWORD *)(v174 + 8);
            }
            while ((void *)v174 != v175);
            goto LABEL_251;
          }
        }
        objc_msgSend(v7, "destination");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v60, "hasLatLng"))
        {
LABEL_141:

          goto LABEL_142;
        }
        objc_msgSend(v60, "latLng");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "lat");
        v63 = v62;
        objc_msgSend(v61, "lng");
        v64 = v63 * 0.0174532925;
        v66 = v65 * 0.0174532925;
        v68 = *((_QWORD *)p_var0 + 1);
        v67 = *((_QWORD *)p_var0 + 2);
        if (v68 < v67)
        {
          *(double *)v68 = v64;
          *(double *)(v68 + 8) = v66;
          v69 = v68 + 24;
          *(_QWORD *)(v68 + 16) = 0;
LABEL_140:
          *((_QWORD *)p_var0 + 1) = v69;

          goto LABEL_141;
        }
        v209 = v61;
        v205 = v56;
        v79 = *(void **)p_var0;
        v80 = v68 - *(_QWORD *)p_var0;
        v81 = 0xAAAAAAAAAAAAAAABLL * (v80 >> 3) + 1;
        if (v81 > 0xAAAAAAAAAAAAAAALL)
          abort();
        v82 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v67 - (_QWORD)v79) >> 3);
        if (2 * v82 > v81)
          v81 = 2 * v82;
        if (v82 >= 0x555555555555555)
          v83 = 0xAAAAAAAAAAAAAAALL;
        else
          v83 = v81;
        if (v83 <= 0xAAAAAAAAAAAAAAALL)
        {
          v84 = (char *)operator new(24 * v83);
          v85 = (unint64_t)&v84[8 * (v80 >> 3)];
          v86 = &v84[24 * v83];
          *(double *)v85 = v64;
          *(double *)(v85 + 8) = v66;
          *(_QWORD *)(v85 + 16) = 0;
          v69 = v85 + 24;
          if ((void *)v68 == v79)
          {
            v56 = v205;
            v61 = v209;
            goto LABEL_138;
          }
          v87 = v68 - (_QWORD)v79 - 24;
          v56 = v205;
          if (v87 >= 0x1C8)
          {
            v195 = v87 / 0x18;
            v197 = (unint64_t)&v84[v80 - 8 - 24 * v195] < v68 && v68 - 24 * v195 - 8 < v85;
            if (v68 - 24 * v195 - 24 >= (unint64_t)&v84[v80 - 8]
              || (unint64_t)&v84[v80 - 24 * v195 - 24] >= v68 - 8)
            {
              v61 = v209;
              if (!v197)
              {
                v199 = v195 + 1;
                v200 = (const double *)(v68 - 48);
                v201 = (double *)(v85 - 48);
                v202 = v199 & 0x1FFFFFFFFFFFFFFELL;
                do
                {
                  v221 = vld3q_f64(v200);
                  vst3q_f64(v201, v221);
                  v201 -= 6;
                  v200 -= 6;
                  v202 -= 2;
                }
                while (v202);
                v85 -= 24 * (v199 & 0x1FFFFFFFFFFFFFFELL);
                v68 -= 24 * (v199 & 0x1FFFFFFFFFFFFFFELL);
                if (v199 == (v199 & 0x1FFFFFFFFFFFFFFELL))
                {
LABEL_138:
                  *(_QWORD *)p_var0 = v85;
                  *((_QWORD *)p_var0 + 1) = v69;
                  *((_QWORD *)p_var0 + 2) = v86;
                  if (v79)
                    operator delete(v79);
                  goto LABEL_140;
                }
              }
            }
            else
            {
              v61 = v209;
            }
          }
          else
          {
            v61 = v209;
          }
          do
          {
            v88 = *(_QWORD *)(v68 - 24);
            v68 -= 24;
            *(_QWORD *)(v85 - 24) = v88;
            v85 -= 24;
            *(_OWORD *)(v85 + 8) = *(_OWORD *)(v68 + 8);
          }
          while ((void *)v68 != v79);
          goto LABEL_138;
        }
LABEL_285:
        std::__throw_bad_array_new_length[abi:nn180100]();
      }
      objc_msgSend(*(id *)&self->_maxFramingDistance, "routeMatch");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v208 = v26;
      if (v26)
      {
        objc_msgSend(v26, "locationCoordinate3D");
        -[VKNavCameraController _coordinateForGeoLocation:](self, "_coordinateForGeoLocation:");
        v28 = *((_QWORD *)p_var0 + 1);
        v27 = *((_QWORD *)p_var0 + 2);
        if (v28 >= v27)
        {
          v30 = *(void **)p_var0;
          v31 = v28 - *(_QWORD *)p_var0;
          v32 = 0xAAAAAAAAAAAAAAABLL * (v31 >> 3) + 1;
          if (v32 > 0xAAAAAAAAAAAAAAALL)
            abort();
          v33 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v27 - (_QWORD)v30) >> 3);
          if (2 * v33 > v32)
            v32 = 2 * v33;
          if (v33 >= 0x555555555555555)
            v34 = 0xAAAAAAAAAAAAAAALL;
          else
            v34 = v32;
          if (v34 > 0xAAAAAAAAAAAAAAALL)
            goto LABEL_285;
          v35 = (char *)operator new(24 * v34);
          v36 = (unint64_t)&v35[8 * (v31 >> 3)];
          *(_OWORD *)v36 = *(_OWORD *)v216;
          *(_QWORD *)(v36 + 16) = *(_QWORD *)&v216[16];
          v29 = v36 + 24;
          if ((void *)v28 != v30)
          {
            v37 = v28 - (_QWORD)v30 - 24;
            if (v37 < 0x1C8)
              goto LABEL_293;
            v97 = v37 / 0x18;
            v98 = (unint64_t)&v35[v31 - 8 - 24 * v97] >= v28 || v28 - 24 * v97 - 8 >= v36;
            v99 = !v98;
            if (v28 - 24 * v97 - 24 < (unint64_t)&v35[v31 - 8]
              && (unint64_t)&v35[v31 - 24 * v97 - 24] < v28 - 8)
            {
              goto LABEL_293;
            }
            if (v99)
              goto LABEL_293;
            v101 = v97 + 1;
            v102 = (const double *)(v28 - 48);
            v103 = (double *)(v36 - 48);
            v104 = v101 & 0x1FFFFFFFFFFFFFFELL;
            do
            {
              v218 = vld3q_f64(v102);
              vst3q_f64(v103, v218);
              v103 -= 6;
              v102 -= 6;
              v104 -= 2;
            }
            while (v104);
            v36 -= 24 * (v101 & 0x1FFFFFFFFFFFFFFELL);
            v28 -= 24 * (v101 & 0x1FFFFFFFFFFFFFFELL);
            if (v101 != (v101 & 0x1FFFFFFFFFFFFFFELL))
            {
LABEL_293:
              do
              {
                v38 = *(_QWORD *)(v28 - 24);
                v28 -= 24;
                *(_QWORD *)(v36 - 24) = v38;
                v36 -= 24;
                *(_OWORD *)(v36 + 8) = *(_OWORD *)(v28 + 8);
              }
              while ((void *)v28 != v30);
            }
          }
          *(_QWORD *)p_var0 = v36;
          *((_QWORD *)p_var0 + 1) = v29;
          *((_QWORD *)p_var0 + 2) = &v35[24 * v34];
          if (v30)
            operator delete(v30);
        }
        else
        {
          *(_QWORD *)v28 = *(_QWORD *)v216;
          *(_OWORD *)(v28 + 8) = *(_OWORD *)&v216[8];
          v29 = v28 + 24;
        }
        *((_QWORD *)p_var0 + 1) = v29;
      }
      if (v24 == 1)
      {
        v39 = 0;
        v3 = 0;
      }
      else if (objc_msgSend(v7, "pointCount"))
      {
        v39 = objc_msgSend(v7, "pointCount") - 1;
      }
      else
      {
        v39 = 0;
      }
      objc_msgSend(v7, "pointWithAltitudeCorrectionAtIndex:", v39);
      -[VKNavCameraController _coordinateForGeoLocation:](self, "_coordinateForGeoLocation:");
      v41 = *((_QWORD *)p_var0 + 1);
      v40 = *((_QWORD *)p_var0 + 2);
      if (v41 < v40)
      {
        *(_QWORD *)v41 = *(_QWORD *)v216;
        *(_OWORD *)(v41 + 8) = *(_OWORD *)&v216[8];
        v42 = v41 + 24;
        v43 = v208;
LABEL_74:
        *((_QWORD *)p_var0 + 1) = v42;

        goto LABEL_75;
      }
      v44 = *(void **)p_var0;
      v45 = v41 - *(_QWORD *)p_var0;
      v46 = 0xAAAAAAAAAAAAAAABLL * (v45 >> 3) + 1;
      if (v46 > 0xAAAAAAAAAAAAAAALL)
        abort();
      v47 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v40 - (_QWORD)v44) >> 3);
      if (2 * v47 > v46)
        v46 = 2 * v47;
      if (v47 >= 0x555555555555555)
        v48 = 0xAAAAAAAAAAAAAAALL;
      else
        v48 = v46;
      if (v48 > 0xAAAAAAAAAAAAAAALL)
        goto LABEL_285;
      v49 = (char *)operator new(24 * v48);
      v50 = (unint64_t)&v49[8 * (v45 >> 3)];
      v51 = &v49[24 * v48];
      *(_OWORD *)v50 = *(_OWORD *)v216;
      *(_QWORD *)(v50 + 16) = *(_QWORD *)&v216[16];
      v42 = v50 + 24;
      if ((void *)v41 == v44)
      {
        v43 = v208;
        goto LABEL_72;
      }
      v52 = v41 - (_QWORD)v44 - 24;
      if (v52 >= 0x1C8)
      {
        v89 = v52 / 0x18;
        v91 = (unint64_t)&v49[v45 - 8 - 24 * v89] < v41 && v41 - 24 * v89 - 8 < v50;
        v92 = v41 - 24 * v89 - 24 >= (unint64_t)&v49[v45 - 8]
           || (unint64_t)&v49[v45 - 24 * v89 - 24] >= v41 - 8;
        v43 = v208;
        if (v92 && !v91)
        {
          v93 = v89 + 1;
          v94 = (const double *)(v41 - 48);
          v95 = (double *)(v50 - 48);
          v96 = v93 & 0x1FFFFFFFFFFFFFFELL;
          do
          {
            v217 = vld3q_f64(v94);
            vst3q_f64(v95, v217);
            v95 -= 6;
            v94 -= 6;
            v96 -= 2;
          }
          while (v96);
          v50 -= 24 * (v93 & 0x1FFFFFFFFFFFFFFELL);
          v41 -= 24 * (v93 & 0x1FFFFFFFFFFFFFFELL);
          if (v93 == (v93 & 0x1FFFFFFFFFFFFFFELL))
          {
LABEL_72:
            *(_QWORD *)p_var0 = v50;
            *((_QWORD *)p_var0 + 1) = v42;
            *((_QWORD *)p_var0 + 2) = v51;
            if (v44)
              operator delete(v44);
            goto LABEL_74;
          }
        }
      }
      else
      {
        v43 = v208;
      }
      do
      {
        v53 = *(_QWORD *)(v41 - 24);
        v41 -= 24;
        *(_QWORD *)(v50 - 24) = v53;
        v50 -= 24;
        *(_OWORD *)(v50 + 8) = *(_OWORD *)(v41 + 8);
      }
      while ((void *)v41 != v44);
      goto LABEL_72;
    }
  }
  *(int64x2_t *)&self->_routeCoordinate.index = vdupq_n_s64(0xC00921FB54442D18);
  self->_routeFocusCoordinate.latitude._value = 0.0;
LABEL_161:
  v118 = 0;
  v119 = 0;
  v120 = 0.0;
  v121 = 0;
  v215[0] = LOBYTE(self->_framingScreenRect._maximum._e[1]);
  v215[1] = BYTE1(self->_framingScreenRect._maximum._e[1]);
  v122 = p_var0;
  do
  {
    v124 = v118;
    switch(v215[v119])
    {
      case 1:
        if ((v121 & 1) == 0)
          -[VKNavCameraController _addAdditionalRoutePointsToFrameToList:](self, "_addAdditionalRoutePointsToFrameToList:", v122);
        v125 = self->_maxFramingDistance;
        v214[0] = MEMORY[0x1E0C809B0];
        v214[1] = 3221225472;
        v214[2] = __44__VKNavCameraController_updatePointsToFrame__block_invoke;
        v214[3] = &unk_1E42F79E8;
        v214[4] = self;
        objc_msgSend(*(id *)&v125, "enumeratePointsToFrameOfType:usingBlock:", 1, v214);
        goto LABEL_163;
      case 2:
        v131 = self->_maxFramingDistance;
        v132 = *(_QWORD *)v122;
        v133 = *((_QWORD *)v122 + 1);
        v213[0] = MEMORY[0x1E0C809B0];
        v213[1] = 3221225472;
        v213[2] = __44__VKNavCameraController_updatePointsToFrame__block_invoke_2;
        v213[3] = &unk_1E42F79E8;
        v213[4] = self;
        objc_msgSend(*(id *)&v131, "enumeratePointsToFrameOfType:usingBlock:", 2, v213);
        *(_QWORD *)&v120 = 0x5555555555555555 * ((v133 - v132) >> 3)
                         - 0x5555555555555555 * ((uint64_t)(*((_QWORD *)v122 + 1) - *(_QWORD *)v122) >> 3);
        goto LABEL_163;
      case 3:
        if ((v121 & 1) == 0)
          -[VKNavCameraController _addAdditionalRoutePointsToFrameToList:](self, "_addAdditionalRoutePointsToFrameToList:", v122);
        v121 = 1;
        goto LABEL_163;
      case 4:
        v126 = objc_loadWeakRetained((id *)&self->_cameraMode);
        v127 = (_QWORD *)objc_msgSend(v126, "styleAttributeCoordinateRanges");

        v128 = (int8x8_t)v127[1];
        if (!*(_QWORD *)&v128)
          goto LABEL_193;
        v129 = (uint8x8_t)vcnt_s8(v128);
        v129.i16[0] = vaddlv_u8(v129);
        if (v129.u32[0] > 1uLL)
        {
          v130 = 65644;
          if (*(_QWORD *)&v128 <= 0x1006CuLL)
            v130 = 0x1006Cu % v128.i32[0];
        }
        else
        {
          v130 = (v128.i32[0] - 1) & 0x1006CLL;
        }
        v134 = *(uint64_t ***)(*v127 + 8 * v130);
        if (!v134)
        {
LABEL_193:
          v122 = p_var0;
          goto LABEL_163;
        }
        v135 = *v134;
        v122 = p_var0;
        if (!*v134)
          goto LABEL_163;
        if (v129.u32[0] < 2uLL)
        {
          v136 = *(_QWORD *)&v128 - 1;
          while (1)
          {
            v138 = v135[1];
            if (v138 == 65644)
            {
              if (*((_DWORD *)v135 + 4) == 65644)
                goto LABEL_194;
            }
            else if ((v138 & v136) != v130)
            {
              goto LABEL_163;
            }
            v135 = (uint64_t *)*v135;
            if (!v135)
              goto LABEL_163;
          }
        }
        break;
      case 5:
        v123 = self->_maxFramingDistance;
        v212[0] = MEMORY[0x1E0C809B0];
        v212[1] = 3221225472;
        v212[2] = __44__VKNavCameraController_updatePointsToFrame__block_invoke_3;
        v212[3] = &unk_1E42F79E8;
        v212[4] = self;
        objc_msgSend(*(id *)&v123, "enumeratePointsToFrameOfType:usingBlock:", 3, v212);
        goto LABEL_163;
      default:
        goto LABEL_163;
    }
    while (1)
    {
      v137 = v135[1];
      if (v137 == 65644)
        break;
      if (v137 >= *(_QWORD *)&v128)
        v137 %= *(_QWORD *)&v128;
      if (v137 != v130)
        goto LABEL_163;
LABEL_182:
      v135 = (uint64_t *)*v135;
      if (!v135)
        goto LABEL_163;
    }
    if (*((_DWORD *)v135 + 4) != 65644)
      goto LABEL_182;
LABEL_194:
    if (!GEOPolylineCoordinateIsValid())
      goto LABEL_163;
    objc_msgSend(*(id *)&self->_maxFramingDistance, "route");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "pointAtRouteCoordinate:", *(uint64_t *)((char *)v135 + 28));
    v141 = v140;
    v143 = v142;
    v145 = v144;

    -[VKNavCameraController _coordinateForGeoLocation:](self, "_coordinateForGeoLocation:", v141, v143, v145);
    v122 = p_var0;
    v147 = *((_QWORD *)p_var0 + 1);
    v146 = *((_QWORD *)p_var0 + 2);
    if (v147 < v146)
    {
      *(_QWORD *)v147 = *(_QWORD *)v216;
      *(_OWORD *)(v147 + 8) = *(_OWORD *)&v216[8];
      v148 = v147 + 24;
      goto LABEL_213;
    }
    v149 = *(void **)p_var0;
    v150 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v147 - *(_QWORD *)p_var0) >> 3) + 1;
    if (v150 > 0xAAAAAAAAAAAAAAALL)
      abort();
    v206 = v147 - (_QWORD)v149;
    v151 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v146 - (_QWORD)v149) >> 3);
    if (2 * v151 > v150)
      v150 = 2 * v151;
    if (v151 >= 0x555555555555555)
      v152 = 0xAAAAAAAAAAAAAAALL;
    else
      v152 = v150;
    if (v152 > 0xAAAAAAAAAAAAAAALL)
      goto LABEL_285;
    v210 = 24 * v152;
    v153 = (char *)operator new(24 * v152);
    v154 = (unint64_t)&v153[8 * ((uint64_t)(v147 - (_QWORD)v149) >> 3)];
    *(_OWORD *)v154 = *(_OWORD *)v216;
    *(_QWORD *)(v154 + 16) = *(_QWORD *)&v216[16];
    if ((void *)v147 == v149)
    {
      v156 = &v153[8 * ((uint64_t)(v147 - (_QWORD)v149) >> 3)];
    }
    else
    {
      v155 = v147 - (_QWORD)v149 - 24;
      if (v155 < 0x168)
      {
        v156 = &v153[8 * ((uint64_t)(v147 - (_QWORD)v149) >> 3)];
        goto LABEL_207;
      }
      v158 = v155 / 0x18;
      v159 = -24 * (v155 / 0x18);
      v160 = (unint64_t)&v153[v159 - 24 + v206];
      v162 = (unint64_t)&v153[v159 - 8 + v206] < v147 && v147 - 8 - 24 * v158 < v154;
      v156 = &v153[8 * ((uint64_t)(v147 - (_QWORD)v149) >> 3)];
      if (v147 - 24 * v158 - 24 < (unint64_t)&v153[v206 - 8] && v160 < v147 - 8)
        goto LABEL_294;
      if (v162)
        goto LABEL_294;
      v164 = v158 + 1;
      v165 = (const double *)(v147 - 48);
      v166 = (double *)(v154 - 48);
      v167 = v164 & 0x1FFFFFFFFFFFFFFELL;
      do
      {
        v219 = vld3q_f64(v165);
        vst3q_f64(v166, v219);
        v166 -= 6;
        v165 -= 6;
        v167 -= 2;
      }
      while (v167);
      v156 = (char *)(v154 - 24 * (v164 & 0x1FFFFFFFFFFFFFFELL));
      v147 -= 24 * (v164 & 0x1FFFFFFFFFFFFFFELL);
      if (v164 != (v164 & 0x1FFFFFFFFFFFFFFELL))
      {
LABEL_294:
        do
        {
LABEL_207:
          v157 = *(_QWORD *)(v147 - 24);
          v147 -= 24;
          *((_QWORD *)v156 - 3) = v157;
          v156 -= 24;
          *(_OWORD *)(v156 + 8) = *(_OWORD *)(v147 + 8);
        }
        while ((void *)v147 != v149);
      }
    }
    v148 = v154 + 24;
    *(_QWORD *)p_var0 = v156;
    *((_QWORD *)p_var0 + 1) = v154 + 24;
    *((_QWORD *)p_var0 + 2) = &v153[v210];
    if (v149)
      operator delete(v149);
    v122 = p_var0;
LABEL_213:
    *((_QWORD *)v122 + 1) = v148;
LABEL_163:
    v118 = 1;
    v119 = 1;
  }
  while ((v124 & 1) == 0);
  if (*(_QWORD *)&v120 != *(_QWORD *)&self->_routeFocusCoordinate.altitude._value)
  {
    self->_lastSARUpdateTime = self->_previousUpdateTime;
    self->_routeFocusCoordinate.altitude._value = v120;
  }
}

- (Coordinate3D<geo::Radians,)_coordinateForGeoLocation:()Coordinate3D<geo:(double>)result :Radians
{
  double *v3;
  double v4;
  double v5;

  if (!LOBYTE(self->_requesteDisplayRateSampler._count))
    result.altitude._value = 0.0;
  v4 = result.latitude._value * 0.0174532925;
  v5 = result.longitude._value * 0.0174532925;
  *v3 = v4;
  v3[1] = v5;
  v3[2] = result.altitude._value;
  result.longitude = *(Unit<geo::RadianUnitDescription, double> *)&v5;
  result.latitude = *(Unit<geo::RadianUnitDescription, double> *)&v4;
  return result;
}

- (void)_addAdditionalRoutePointsToFrameToList:(void *)a3
{
  double maxFramingDistance;
  _QWORD v4[6];

  maxFramingDistance = self->_maxFramingDistance;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__VKNavCameraController__addAdditionalRoutePointsToFrameToList___block_invoke;
  v4[3] = &unk_1E42F7A10;
  v4[4] = self;
  v4[5] = a3;
  objc_msgSend(*(id *)&maxFramingDistance, "enumerateAdditionalRoutesToFrameUsingBlock:", v4);
}

- (void)_updateRouteSinuosity
{
  double *p_routeCoordinate;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  __double2 v8;
  double v9;
  double v10;
  __double2 v11;
  double value;
  double v13;
  __double2 v14;
  double v15;
  __double2 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  id v23;
  id WeakRetained;

  p_routeCoordinate = (double *)&self->_routeCoordinate;
  if (*(double *)&self->_routeCoordinate != -3.14159265
    || *(double *)&self->_frameAllGroupedManeuvers != -3.14159265
    || self->_routeFocusCoordinate.latitude._value != 0.0)
  {
    objc_msgSend(*(id *)&self->_maxFramingDistance, "route");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v22, "closestPointOnRoute:", *p_routeCoordinate * 57.2957795, p_routeCoordinate[1] * 57.2957795);

    objc_msgSend(*(id *)&self->_maxFramingDistance, "route");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "distanceBetweenRouteCoordinate:andRouteCoordinate:", *(_QWORD *)&self->_locationCoordinate.latitude, v4);
    v20 = v5;

    v6 = p_routeCoordinate[1];
    v7 = p_routeCoordinate[2];
    v8 = __sincos_stret(*p_routeCoordinate);
    v9 = 6378137.0 / sqrt(1.0 - v8.__sinval * v8.__sinval * 0.00669437999);
    v10 = (v9 + v7) * v8.__cosval;
    v11 = __sincos_stret(v6);
    v21 = v7 + v9 * 0.99330562;
    value = self->_puckCoordinate.longitude._value;
    v13 = self->_puckCoordinate.altitude._value;
    v14 = __sincos_stret(self->_puckCoordinate.latitude._value);
    v15 = 6378137.0 / sqrt(1.0 - v14.__sinval * v14.__sinval * 0.00669437999);
    v16 = __sincos_stret(value);
    v17 = -((v13 + v15 * 0.99330562) * v14.__sinval - v21 * v8.__sinval);
    v18 = sqrt(-((v15 + v13) * v14.__cosval * v16.__cosval - v10 * v11.__cosval)* -((v15 + v13) * v14.__cosval * v16.__cosval - v10 * v11.__cosval)+ -((v15 + v13) * v14.__cosval * v16.__sinval - v10 * v11.__sinval)* -((v15 + v13) * v14.__cosval * v16.__sinval - v10 * v11.__sinval)+ v17 * v17);
    if (v18 != 0.0)
    {
      v19 = v20 / v18;
      WeakRetained = objc_loadWeakRetained((id *)&self->_cameraMode);
      objc_msgSend(WeakRetained, "setSinuosity:", v19);

    }
  }
}

- (void)updateSpringsForFramingCamera
{
  int *p_var0;
  double v4;
  double v5;
  double v6;
  _QWORD *v7;
  void *v8;
  int v9;
  float64x2_t *v10;
  double v11;
  uint64_t v12;
  int64_t v13;
  double v14;
  double v15;
  unint64_t v16;
  uint64_t v17;
  double *v18;
  double v24;
  double v25;
  double v26;
  double v27;
  __double2 v28;
  double v29;
  double v30;
  __double2 v31;
  float64x2_t v32;
  double v33;
  float64x2_t v34;
  float64x2_t v35;
  double v36;
  double v37;
  long double v38;
  double v39;
  double v40;
  double minHeightDeltaChangeVertical;
  double v42;
  double v43;
  double halfPuckSize;
  double maxHeightDeltaChangeVertical;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  BOOL v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
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
  double v84;
  double *v85;
  double v86;
  double v88;
  __double2 v89;
  double v90;
  double v91;
  __double2 v92;
  float64x2_t v93;
  double v94;
  float64x2_t v95;
  float64x2_t v96;
  double v97;
  double v98;
  long double v99;
  uint64_t v100;
  double v101;
  float v102;
  float64x2_t v103;
  float v104;
  float64x2_t v105;
  double v106;
  double v107;
  double v108;
  float top;
  double v110;
  float64x2_t v111;
  float bottom;
  float64x2_t v113;
  double v114;
  float64x2_t v115;
  float left;
  float64x2_t v117;
  float right;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  void *value;
  double v125;
  double restingPosition;
  double v127;
  uint64_t v128[7];
  __int128 v129;
  double v130;
  float64x2_t v131;
  double v132;
  float64x2_t v133;
  double v134;
  float64x2_t v135;
  double v136;

  -[VKNavCameraController updateManeuversToFrame](self, "updateManeuversToFrame");
  -[VKNavCameraController updatePointsToFrame](self, "updatePointsToFrame");
  -[VKNavCameraController _updateRouteSinuosity](self, "_updateRouteSinuosity");
  if (self->_cameraDistanceFromTarget._value == 0.0)
  {
    -[VKNavCameraController cameraFrame](self, "cameraFrame");
    self->_cameraDistanceFromTarget._value = v130;
  }
  self->_pitchSpring._restingPosition = self->_cameraPitch._value;
  -[VKNavCameraController calculateHeading](self, "calculateHeading");
  *(_QWORD *)&self->_headingSpring._restingPosition = v129;
  p_var0 = &self->_currentStyleName.__r_.var0;
  if (*(_QWORD *)&self->_currentStyleName.__r_.var0 == self->_currentStyleName.var0)
  {
    self->_viewableScreenRect._maximum = (Matrix<double, 2, 1>)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    self->_framingScreenRect._minimum = (Matrix<double, 2, 1>)vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
    -[VKNavCameraController puckScreenPoint](self, "puckScreenPoint");
    self->_screenPositionSpring._restingPosition._e[0] = v39;
    self->_screenPositionSpring._restingPosition._e[1] = v40;
    self->_distanceFromTargetSpring._restingPosition = self->_cameraDistanceFromTarget._value;
LABEL_35:
    -[VKNavCameraController _updateForAnimatedEdgeInsets](self, "_updateForAnimatedEdgeInsets");
    return;
  }
  -[VKNavCameraController restingCameraFrame](self, "restingCameraFrame");
  gdc::ViewDataAccess::screenPointForCoordinate(*(double **)(-[VKCameraController mapDataAccess](self, "mapDataAccess") + 16), &self->_puckCoordinate.latitude._value, v128);
  v5 = v4;
  v127 = v6;
  v7 = -[VKCameraController mapDataAccess](self, "mapDataAccess");
  -[VKCameraController canvas](self, "canvas");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v9 = BYTE2(self->_locationCoordinate.longitude);
  v10 = (float64x2_t *)v7[2];
  gdc::ViewDataAccess::worldViewProjectionMatrix((uint64_t)&v129, v10->f64, v128);
  v12 = *(_QWORD *)p_var0;
  v13 = self->_currentStyleName.var0 - *(_QWORD *)p_var0;
  v101 = v5;
  if (v13)
  {
    v14 = v10[23].f64[1] * v10[23].f64[0];
    v123 = v132;
    v125 = v130;
    v119 = v136;
    v121 = v134;
    v115 = v131;
    v117 = (float64x2_t)v129;
    v15 = v133.f64[0];
    v111 = v135;
    v113 = v133;
    v16 = v13 / 24;
    if (v16 <= 1)
      v17 = 1;
    else
      v17 = v16;
    v106 = v10[23].f64[1] * v10[23].f64[0];
    if (v9)
    {
      v18 = (double *)(v12 + 16);
      v100 = 0x3FC45F306DC9C883;
      __asm { FMOV            V0.2D, #0.5 }
      v103 = _Q0;
      v24 = v127;
      v25 = v127;
      v26 = v5;
      do
      {
        v32 = 0uLL;
        if (v14 != 0.0)
        {
          if (LOBYTE(v10->f64[0]) - 1 < 3)
          {
            v108 = *(v18 - 1);
            v27 = *v18;
            v28 = __sincos_stret(*(v18 - 2));
            v29 = 6378137.0 / sqrt(v28.__sinval * v28.__sinval * -0.00669437999 + 1.0);
            v30 = (v29 + v27) * v28.__cosval;
            v31 = __sincos_stret(v108);
            v15 = v30 * v31.__cosval;
            v32.f64[0] = v30 * v31.__sinval;
            v33 = v27 + v29 * 0.99330562;
            v14 = v106;
            v11 = v33 * v28.__sinval;
          }
          else if (!LOBYTE(v10->f64[0]))
          {
            v36 = *(v18 - 1);
            v37 = *v18;
            v38 = tan(*(v18 - 2) * 0.5 + 0.785398163);
            v32.f64[0] = log(v38);
            v15 = v36 * 0.159154943 + 0.5;
            v32.f64[0] = v32.f64[0] * 0.159154943 + 0.5;
            v11 = v37 * 0.0000000249532021;
          }
          v34 = vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v111, v117, v15), v115, v32.f64[0]), v113, v11), 0.5 / (v119 + v125 * v15 + v123 * v32.f64[0] + v121 * v11));
          *(_QWORD *)&v35.f64[0] = *(_OWORD *)&vaddq_f64(v34, v103);
          v35.f64[1] = vsubq_f64(v103, v34).f64[1];
          v32 = vmulq_f64(v35, v10[23]);
        }
        v11 = v127;
        v15 = fmin(v32.f64[1], v127);
        v26 = fmin(v32.f64[0], v26);
        v5 = fmax(v5, v32.f64[0]);
        v24 = fmin(v15, v24);
        v25 = fmax(v25, v15);
        v18 += 3;
        --v17;
      }
      while (v17);
    }
    else
    {
      v85 = (double *)(v12 + 16);
      v86 = 0.5;
      v100 = 0x3FC45F306DC9C883;
      __asm { FMOV            V0.2D, #0.5 }
      v105 = _Q0;
      v24 = v127;
      v25 = v127;
      v26 = v5;
      do
      {
        v93 = 0uLL;
        if (v14 != 0.0)
        {
          if (LOBYTE(v10->f64[0]) - 1 < 3)
          {
            v110 = *(v85 - 1);
            v88 = *v85;
            v89 = __sincos_stret(*(v85 - 2));
            v90 = 6378137.0 / sqrt(v89.__sinval * v89.__sinval * -0.00669437999 + 1.0);
            v91 = (v90 + v88) * v89.__cosval;
            v92 = __sincos_stret(v110);
            v15 = v91 * v92.__cosval;
            v93.f64[0] = v91 * v92.__sinval;
            v94 = v88 + v90 * 0.99330562;
            v86 = 0.5;
            v14 = v106;
            v11 = v94 * v89.__sinval;
          }
          else if (!LOBYTE(v10->f64[0]))
          {
            v97 = *(v85 - 1);
            v98 = *v85;
            v99 = tan(*(v85 - 2) * v86 + 0.785398163);
            v93.f64[0] = log(v99);
            v15 = v86 + v97 * 0.159154943;
            v93.f64[0] = v86 + v93.f64[0] * 0.159154943;
            v11 = v98 * 0.0000000249532021;
          }
          v95 = vmulq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v111, v117, v15), v115, v93.f64[0]), v113, v11), v86 / (v119 + v125 * v15 + v123 * v93.f64[0] + v121 * v11));
          v11 = v105.f64[0];
          *(_QWORD *)&v96.f64[0] = *(_OWORD *)&vaddq_f64(v95, v105);
          v96.f64[1] = vsubq_f64(v105, v95).f64[1];
          v93 = vmulq_f64(v96, v10[23]);
        }
        v15 = v93.f64[1];
        v26 = fmin(v93.f64[0], v26);
        v5 = fmax(v5, v93.f64[0]);
        v24 = fmin(v93.f64[1], v24);
        v25 = fmax(v25, v93.f64[1]);
        v85 += 3;
        --v17;
      }
      while (v17);
    }
  }
  else
  {
    v26 = v5;
    v25 = v127;
    v24 = v127;
  }
  self->_viewableScreenRect._maximum._e[0] = v26;
  self->_viewableScreenRect._maximum._e[1] = v24;
  self->_framingScreenRect._minimum._e[0] = v5;
  self->_framingScreenRect._minimum._e[1] = v25;

  minHeightDeltaChangeVertical = self->_minHeightDeltaChangeVertical;
  v42 = self->_viewableScreenRect._minimum._e[0];
  v43 = self->_viewableScreenRect._minimum._e[1];
  maxHeightDeltaChangeVertical = self->_maxHeightDeltaChangeVertical;
  halfPuckSize = self->_halfPuckSize;
  v102 = self->_puckMovementBoundsMin._e[0];
  v104 = self->_puckMovementBoundsMin._e[1];
  v46 = self->_viewableScreenRect._maximum._e[0];
  v47 = self->_viewableScreenRect._maximum._e[1];
  v107 = self->_framingScreenRect._minimum._e[0];
  v114 = self->_framingScreenRect._minimum._e[1];
  top = self->_clientFramingInsets.top;
  left = self->_clientFramingInsets.left;
  bottom = self->_clientFramingInsets.bottom;
  right = self->_clientFramingInsets.right;
  v48 = cos(self->_pitchSpring._restingPosition);
  value = self->_coordinatesToFrame.__end_cap_.__value_;
  restingPosition = self->_distanceFromTargetSpring._restingPosition;
  -[VKNavCameraController minZoomHeight](self, "minZoomHeight");
  v122 = v49;
  v120 = *(double *)&self->_styleManeuversToFrame;
  -[VKNavCameraController maxZoomHeight](self, "maxZoomHeight");
  v51 = fabs(v48);
  if (v51 <= v51 * 2.22044605e-14 || v51 < 2.22507386e-308)
  {
    -[VKNavCameraController puckScreenPoint](self, "puckScreenPoint", v100);
    self->_screenPositionSpring._restingPosition._e[0] = v83;
    self->_screenPositionSpring._restingPosition._e[1] = v84;
    self->_distanceFromTargetSpring._restingPosition = self->_cameraDistanceFromTarget._value;
    goto LABEL_35;
  }
  v52 = 1.0 - v104;
  v53 = fmin(fmax(maxHeightDeltaChangeVertical + (v42 - maxHeightDeltaChangeVertical) * v102, maxHeightDeltaChangeVertical + minHeightDeltaChangeVertical), v42 - minHeightDeltaChangeVertical);
  v54 = fmin(fmax(halfPuckSize + v52 * (v43 - halfPuckSize), halfPuckSize + minHeightDeltaChangeVertical), v43 - minHeightDeltaChangeVertical);
  v55 = fmin(fmax(fmin(fmax(v101 - v46 + v53 + (v46 - v107) * v102, v53 - top), v53 + bottom), fmin(v42, maxHeightDeltaChangeVertical + minHeightDeltaChangeVertical)), fmax(v42 - minHeightDeltaChangeVertical, maxHeightDeltaChangeVertical));
  v56 = fmin(fmax(fmin(fmax(v127 - v47 + v54 + (v47 - v114) * v52, v54 - left), v54 + right), fmin(v43, halfPuckSize + minHeightDeltaChangeVertical)), fmax(v43 - minHeightDeltaChangeVertical, halfPuckSize));
  v57 = fmax(*(double *)&value, v122);
  v58 = fmin(v120, v50);
  v59 = fmin(fmax(fmax((v55 - self->_viewableScreenRect._maximum._e[0]) / (v55 - self->_maxHeightDeltaChangeVertical), (self->_framingScreenRect._minimum._e[0] - v55) / (self->_viewableScreenRect._minimum._e[0] - v55))* (restingPosition* v48), v57), v58);
  v60 = fmin(fmax(fmax((self->_framingScreenRect._minimum._e[1] - v56) / (self->_viewableScreenRect._minimum._e[1] - v56), (v56 - self->_viewableScreenRect._maximum._e[1]) / (v56 - self->_halfPuckSize))* (restingPosition* v48), v57), v58);
  if (v60 < self->_maxHeightDeltaChangeHorizontal + restingPosition * v48
    && v60 > restingPosition * v48 - self->_minHeightDeltaChangeHorizontal)
  {
    v60 = restingPosition * v48;
  }
  v62 = v59 >= *(double *)&self->_idealPuckScreenPosition + restingPosition * v48
     || v59 <= restingPosition * v48 - *(double *)&self->_puckMovementBoundsMax;
  v63 = fmax(v60, v59);
  if (v62)
    v60 = v63;
  self->_screenPositionSpring._restingPosition._e[0] = v55;
  self->_screenPositionSpring._restingPosition._e[1] = v56;
  self->_distanceFromTargetSpring._restingPosition = v60 / v48;
  if (-[VKCameraController edgeInsetsAnimating](self, "edgeInsetsAnimating", v100))
  {
    LODWORD(v64) = LODWORD(self->_minCameraPitch._value);
    LODWORD(v65) = HIDWORD(self->_minCameraPitch._value);
    LODWORD(v66) = LODWORD(self->_maxCameraPitch._value);
    LODWORD(v67) = HIDWORD(self->_maxCameraPitch._value);
    -[VKNavCameraController calculateViewableScreenRectForEdgeInsets:](self, "calculateViewableScreenRectForEdgeInsets:", v64, v65, v66, v67);
    v68 = self->_minHeightDeltaChangeVertical;
    v69 = self->_puckMovementBoundsMin._e[0];
    v70 = 1.0 - self->_puckMovementBoundsMin._e[1];
    v72 = v71 + v68;
    v74 = v73 - v68;
    v75 = fmin(fmax(v71 + (v73 - v71) * v69, v71 + v68), v73 - v68);
    v76 = fmin(fmax(v101- self->_viewableScreenRect._maximum._e[0]+ (self->_viewableScreenRect._maximum._e[0] - self->_framingScreenRect._minimum._e[0]) * v69+ v75, v75 - self->_clientFramingInsets.top), v75 + self->_clientFramingInsets.bottom);
    v78 = v77 + v68;
    v80 = v79 - v68;
    v81 = fmin(fmax(v77 + v70 * (v79 - v77), v78), v80);
    v82 = self->_screenPositionSpring._position._e[1]
        + v56
        - fmin(fmax(fmin(fmax(v127- self->_viewableScreenRect._maximum._e[1]+ v81+ (self->_viewableScreenRect._maximum._e[1] - self->_framingScreenRect._minimum._e[1]) * v70, v81 - self->_clientFramingInsets.left), v81 + self->_clientFramingInsets.right), fmin(v79, v78)), fmax(v80, v77));
    self->_screenPositionSpring._position._e[0] = self->_screenPositionSpring._position._e[0]
                                                + v55
                                                - fmin(fmax(v76, fmin(v73, v72)), fmax(v74, v71));
    self->_screenPositionSpring._position._e[1] = v82;
  }
}

- (void)_updateForAnimatedEdgeInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double *p_minHeightDeltaChangeVertical;
  float64x2_t v8;
  float64_t v9;
  float64x2_t v10;
  float64_t v11;
  float64x2_t v12;
  float64x2_t v13;

  if (-[VKCameraController edgeInsetsAnimating](self, "edgeInsetsAnimating"))
  {
    LODWORD(v3) = LODWORD(self->_minCameraPitch._value);
    LODWORD(v4) = HIDWORD(self->_minCameraPitch._value);
    LODWORD(v5) = LODWORD(self->_maxCameraPitch._value);
    LODWORD(v6) = HIDWORD(self->_maxCameraPitch._value);
    -[VKNavCameraController calculateViewableScreenRectForEdgeInsets:](self, "calculateViewableScreenRectForEdgeInsets:", v3, v4, v5, v6);
    p_minHeightDeltaChangeVertical = &self->_minHeightDeltaChangeVertical;
    v8.f64[0] = self->_puckMovementBoundsMin._e[0];
    v10.f64[1] = v9;
    v12.f64[1] = v11;
    v8.f64[1] = 1.0 - self->_puckMovementBoundsMin._e[1];
    v13 = vld1q_dup_f64(p_minHeightDeltaChangeVertical);
    self->_screenPositionSpring._position = (Matrix<double, 2, 1>)vsubq_f64(vaddq_f64((float64x2_t)self->_screenPositionSpring._position, (float64x2_t)self->_screenPositionSpring._restingPosition), vminnmq_f64(vmaxnmq_f64(vmlaq_f64(v12, v8, vsubq_f64(v10, v12)), vaddq_f64(v13, v12)), vsubq_f64(v10, v13)));
  }
}

- (void)navContextCameraHeadingOverrideDidChange:(id)a3
{
  double v4;

  if (!-[VKAnimation running](self->_transitionAnimation, "running", a3))
  {
    -[VKNavCameraController _updateDidNavCameraTransition](self, "_updateDidNavCameraTransition");
    LODWORD(v4) = 1050253722;
    -[VKNavCameraController animateCameraWithDuration:fromFrame:completionHandler:](self, "animateCameraWithDuration:fromFrame:completionHandler:", &self->_cameraFrame, 0, v4);
  }
}

- (void)_setNeedsUpdate
{
  uint64_t v2;
  char v3;

  self->_needsUpdate = 1;
  v2 = *(_QWORD *)-[VKCameraController runLoopController](self, "runLoopController");
  if (v2)
  {
    v3 = 4;
    md::MapEngine::setNeedsTick(v2, &v3);
  }
}

- (void)_updateZoomScaleLimts
{
  _BOOL4 v3;
  _BOOL4 v4;
  double restingPosition;
  long double v6;
  double v7;
  double v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v11;
  id v12;

  v3 = -[VKNavCameraController _canZoomIn](self, "_canZoomIn");
  v4 = -[VKNavCameraController _canZoomOut](self, "_canZoomOut");
  restingPosition = self->_distanceFromTargetSpring._restingPosition;
  v6 = cos(self->_pitchSpring._restingPosition) * restingPosition;
  -[VKNavCameraController minZoomHeight](self, "minZoomHeight");
  self->_minZoomScale = fmin(v7 / v6, 1.0);
  -[VKNavCameraController maxZoomHeight](self, "maxZoomHeight");
  self->_maxZoomScale = fmax(v8 / v6, 1.0);
  v9 = -[VKNavCameraController _canZoomIn](self, "_canZoomIn");
  v10 = -[VKNavCameraController _canZoomOut](self, "_canZoomOut");
  if (v3 != v9)
  {
    -[VKCameraController cameraDelegate](self, "cameraDelegate");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mapLayerCanZoomInDidChange:", v9);

  }
  if (v4 != v10)
  {
    -[VKCameraController cameraDelegate](self, "cameraDelegate");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mapLayerCanZoomOutDidChange:", v10);

  }
}

- (void)_updateDidNavCameraTransition
{
  void *ptr;
  uint64_t v4;
  id WeakRetained;
  id v6;

  if (!-[VKAnimation running](self->_transitionAnimation, "running"))
  {
    LOBYTE(self->_sceneQuery.__cntrl_) = 0;
    ptr = self->_sceneQuery.__ptr_;
    WeakRetained = objc_loadWeakRetained((id *)&self->_cameraMode);
    v4 = objc_msgSend(WeakRetained, "navCameraMode");

    if (ptr != (void *)v4)
    {
      LOBYTE(self->_sceneQuery.__cntrl_) = 1;
      v6 = objc_loadWeakRetained((id *)&self->_cameraMode);
      self->_sceneQuery.__ptr_ = (void *)objc_msgSend(v6, "navCameraMode");

    }
  }
}

- (double)zoomScale
{
  return fmin(fmax(*(double *)&self->_lastTargetStyleIdentifier, self->_minZoomScale), self->_maxZoomScale);
}

- (double)minZoomScale
{
  return self->_minZoomScale;
}

- (double)maxZoomScale
{
  return self->_maxZoomScale;
}

- (double)minZoomHeight
{
  unint64_t *p_shared_owners;
  unint64_t v4;
  void *value;
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
LABEL_12:
      value = self->_coordinatesToFrame.__end_cap_.__value_;
      return *(double *)&value;
    }
  }
  if (!v9)
    goto LABEL_12;
LABEL_6:
  -[VKCameraController camera](self, "camera");
  value = *(void **)(v9 + 96);
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
  return *(double *)&value;
}

- (double)maxZoomHeight
{
  unint64_t *p_shared_owners;
  unint64_t v4;
  double v5;
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
      return *(double *)&self->_styleManeuversToFrame;
    }
  }
  if (!v9)
    return *(double *)&self->_styleManeuversToFrame;
LABEL_6:
  -[VKCameraController camera](self, "camera");
  v5 = *(double *)(v9 + 104);
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
  return v5;
}

- (Unit<geo::RadianUnitDescription,)minCameraPitch
{
  _QWORD *v2;
  Unit<geo::RadianUnitDescription, double> v3;

  v3._value = self->_minCameraHeight;
  *v2 = *(Unit<geo::RadianUnitDescription, double> *)&v3._value;
  return v3;
}

- (Unit<geo::RadianUnitDescription,)maxCameraPitch
{
  _QWORD *v2;
  Unit<geo::RadianUnitDescription, double> v3;

  v3._value = self->_maxCameraHeight;
  *v2 = *(Unit<geo::RadianUnitDescription, double> *)&v3._value;
  return v3;
}

- (void)setEdgeInsetsAnimating:(BOOL)a3
{
  _BOOL8 v3;
  RunLoopController *v5;
  uint64_t v6;
  uint64_t var0;
  int v8;
  int v9;
  int v10;
  int v11;
  objc_super v12;

  v3 = a3;
  if (a3)
  {
    v5 = -[VKCameraController runLoopController](self, "runLoopController");
    v6 = -[VKCameraController maxDisplayRate](self, "maxDisplayRate");
    v5->var1 = v6;
    var0 = (uint64_t)v5->var0;
    if (v5->var0 && !**(_BYTE **)(var0 + 1056))
      md::MapEngine::setDisplayRate(var0, v6);
    -[VKNavCameraController _setNeedsUpdate](self, "_setNeedsUpdate");
  }
  -[VKCameraController edgeInsets](self, "edgeInsets");
  LODWORD(self->_minCameraPitch._value) = v8;
  HIDWORD(self->_minCameraPitch._value) = v9;
  LODWORD(self->_maxCameraPitch._value) = v10;
  HIDWORD(self->_maxCameraPitch._value) = v11;
  v12.receiver = self;
  v12.super_class = (Class)VKNavCameraController;
  -[VKCameraController setEdgeInsetsAnimating:](&v12, sel_setEdgeInsetsAnimating_, v3);
}

- (void)setEdgeInsets:(VKEdgeInsets)a3
{
  float right;
  float bottom;
  float left;
  float top;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;
  VKEdgeInsets v14;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v14 = a3;
  -[VKCameraController edgeInsets](self, "edgeInsets");
  LODWORD(self->_minCameraPitch._value) = LODWORD(v8);
  HIDWORD(self->_minCameraPitch._value) = LODWORD(v9);
  LODWORD(self->_maxCameraPitch._value) = LODWORD(v10);
  HIDWORD(self->_maxCameraPitch._value) = LODWORD(v11);
  if (*(_QWORD *)&self->_minCameraPitch._value != *(_QWORD *)&v14.top
    || *(_QWORD *)&self->_maxCameraPitch._value != *(_QWORD *)&v14.bottom)
  {
    v13.receiver = self;
    v13.super_class = (Class)VKNavCameraController;
    *(float *)&v8 = top;
    *(float *)&v9 = left;
    *(float *)&v10 = bottom;
    *(float *)&v11 = right;
    -[VKCameraController setEdgeInsets:](&v13, sel_setEdgeInsets_, v8, v9, v10, v11);
    -[VKNavCameraController _setNeedsUpdate](self, "_setNeedsUpdate");
  }
}

- (void)_snapPitch
{
  double minCameraHeight;
  double value;
  double maxCameraHeight;
  double v6;
  VKTimedAnimation *snapPitchAnimation;
  VKTimedAnimation *v8;
  VKTimedAnimation *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14[3];
  id location;

  if (!self->_snapPitchAnimation && !-[VKAnimation running](self->_transitionAnimation, "running"))
  {
    minCameraHeight = self->_minCameraHeight;
    value = self->_cameraFrame._pitch._value;
    maxCameraHeight = self->_maxCameraHeight;
    if (value < minCameraHeight || (minCameraHeight = self->_cameraFrame._pitch._value, value > maxCameraHeight))
    {
      v6 = fmin(minCameraHeight, maxCameraHeight);
      -[VKAnimation stop](self->_snapPitchAnimation, "stop");
      snapPitchAnimation = self->_snapPitchAnimation;
      self->_snapPitchAnimation = 0;

      v8 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", 0.3);
      v9 = self->_snapPitchAnimation;
      self->_snapPitchAnimation = v8;

      -[VKTimedAnimation setTimingFunction:](self->_snapPitchAnimation, "setTimingFunction:", VKAnimationCurveEaseInOut);
      objc_initWeak(&location, self);
      v10 = MEMORY[0x1E0C809B0];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __35__VKNavCameraController__snapPitch__block_invoke;
      v13[3] = &unk_1E42F9418;
      objc_copyWeak(v14, &location);
      v14[1] = *(id *)&value;
      v14[2] = *(id *)&v6;
      -[VKTimedAnimation setStepHandler:](self->_snapPitchAnimation, "setStepHandler:", v13);
      v11[0] = v10;
      v11[1] = 3221225472;
      v11[2] = __35__VKNavCameraController__snapPitch__block_invoke_2;
      v11[3] = &unk_1E42F7A38;
      objc_copyWeak(&v12, &location);
      -[VKAnimation setCompletionHandler:](self->_snapPitchAnimation, "setCompletionHandler:", v11);
      md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), &self->_snapPitchAnimation->super);
      objc_destroyWeak(&v12);
      objc_destroyWeak(v14);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_snapHeading
{
  double v3;
  VKTimedAnimation *snapHeadingAnimation;
  VKTimedAnimation *v6;
  VKTimedAnimation *v7;
  double value;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, int);
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16[2];
  id location;

  if (!self->_snapHeadingAnimation
    && !-[VKAnimation running](self->_transitionAnimation, "running")
    && !self->_isDetached
    && !-[VKNavCameraController cameraHeadingType](self, "cameraHeadingType"))
  {
    v3 = fabs(self->_cameraFrame._heading._value);
    if (v3 > v3 * 2.22044605e-14 && v3 >= 2.22507386e-308)
    {
      -[VKAnimation stop](self->_snapHeadingAnimation, "stop");
      snapHeadingAnimation = self->_snapHeadingAnimation;
      self->_snapHeadingAnimation = 0;

      v6 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", 0.3);
      v7 = self->_snapHeadingAnimation;
      self->_snapHeadingAnimation = v6;

      -[VKTimedAnimation setTimingFunction:](self->_snapHeadingAnimation, "setTimingFunction:", VKAnimationCurveEaseInOut);
      objc_initWeak(&location, self);
      value = self->_cameraFrame._heading._value;
      v9 = MEMORY[0x1E0C809B0];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __37__VKNavCameraController__snapHeading__block_invoke;
      v15[3] = &unk_1E42F7A60;
      objc_copyWeak(v16, &location);
      v16[1] = *(id *)&value;
      -[VKTimedAnimation setStepHandler:](self->_snapHeadingAnimation, "setStepHandler:", v15);
      v10 = v9;
      v11 = 3221225472;
      v12 = __37__VKNavCameraController__snapHeading__block_invoke_2;
      v13 = &unk_1E42F7A38;
      objc_copyWeak(&v14, &location);
      -[VKAnimation setCompletionHandler:](self->_snapHeadingAnimation, "setCompletionHandler:", &v10);
      md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner", v10, v11, v12, v13), &self->_snapHeadingAnimation->super);
      objc_destroyWeak(&v14);
      objc_destroyWeak(v16);
      objc_destroyWeak(&location);
    }
  }
}

- (CameraFrame<geo::Radians,)cameraFrame
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4]._heading._value;
  *(_OWORD *)&retstr->_target.latitude._value = *(_OWORD *)&self[4]._distanceFromTarget._value;
  *(_OWORD *)&retstr->_target.altitude._value = v3;
  *(_OWORD *)&retstr->_pitch._value = *(_OWORD *)&self[5]._target.latitude._value;
  retstr->_roll._value = self[5]._target.altitude._value;
  return self;
}

- (void)setCameraFrame:()CameraFrame<geo:(double> *)a3 :Radians
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v4 = *(_OWORD *)&a3->_target.altitude._value;
  v3 = *(_OWORD *)&a3->_pitch._value;
  v5 = *(_OWORD *)&a3->_target.latitude._value;
  self->_cameraFrame._roll._value = a3->_roll._value;
  *(_OWORD *)&self->_cameraFrame._target.altitude._value = v4;
  *(_OWORD *)&self->_cameraFrame._pitch._value = v3;
  *(_OWORD *)&self->_cameraFrame._target.latitude._value = v5;
  -[VKNavCameraController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)stopAnimations
{
  VKTimedAnimation *snapPitchAnimation;
  VKTimedAnimation *transitionAnimation;
  VKTimedAnimation *snapHeadingAnimation;

  -[VKAnimation stop](self->_snapPitchAnimation, "stop");
  snapPitchAnimation = self->_snapPitchAnimation;
  self->_snapPitchAnimation = 0;

  -[VKAnimation stop](self->_transitionAnimation, "stop");
  transitionAnimation = self->_transitionAnimation;
  self->_transitionAnimation = 0;

  -[VKAnimation stop](self->_snapHeadingAnimation, "stop");
  snapHeadingAnimation = self->_snapHeadingAnimation;
  self->_snapHeadingAnimation = 0;

}

- (void)setVkCamera:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (!v4)
    -[VKNavCameraController stopAnimations](self, "stopAnimations");
  v5.receiver = self;
  v5.super_class = (Class)VKNavCameraController;
  -[VKCameraController setVkCamera:](&v5, sel_setVkCamera_, v4);
  if (v4)
    -[VKNavCameraController _setNeedsUpdate](self, "_setNeedsUpdate");

}

- (void)setCamera:(shared_ptr<gdc::Camera>)a3
{
  Camera *ptr;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  objc_super v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  ptr = a3.__ptr_;
  v5 = *(_QWORD *)a3.__ptr_;
  if (!*(_QWORD *)a3.__ptr_)
  {
    -[VKNavCameraController stopAnimations](self, "stopAnimations");
    v5 = *(_QWORD *)ptr;
  }
  v6 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
  v13 = v5;
  v14 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v12.receiver = self;
  v12.super_class = (Class)VKNavCameraController;
  -[VKCameraController setCamera:](&v12, sel_setCamera_, &v13, a3.__cntrl_);
  v9 = v14;
  if (v14)
  {
    v10 = (unint64_t *)&v14->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  -[VKNavCameraController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)canvasDidLayout
{
  double v3;

  -[VKNavCameraController updateCameraState](self, "updateCameraState");
  -[VKNavCameraController resetSpringsToResting](self, "resetSpringsToResting");
  -[VKNavCameraController _setNeedsUpdate](self, "_setNeedsUpdate");
  if (!self->_isDetached)
  {
    LODWORD(v3) = 2.0;
    -[VKNavCameraController animateCameraWithDuration:fromFrame:completionHandler:](self, "animateCameraWithDuration:fromFrame:completionHandler:", &self->_cameraFrame, 0, v3);
  }
}

- (unsigned)cameraHeadingType
{
  uint64_t v3;
  unsigned __int8 result;

  v3 = objc_msgSend(*(id *)&self->_maxFramingDistance, "navigationCameraHeadingOverride");
  result = 0;
  switch(v3)
  {
    case 1:
      return result;
    case 2:
      result = 1;
      break;
    case 3:
      result = 2;
      break;
    case 4:
      result = 3;
      break;
    default:
      result = self->_headingType;
      break;
  }
  return result;
}

- (void)_setNavCameraIsDetached:(BOOL)a3
{
  unsigned int v3;
  id WeakRetained;
  uint64_t v5;
  int8x8_t *v6;
  int8x8_t v7;
  uint8x8_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8x8_t v16;
  uint64_t v17;
  int8x8_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
  v5 = objc_msgSend(WeakRetained, "mapEngine");

  if (!v5)
    return;
  v6 = *(int8x8_t **)(v5 + 1120);
  if (!v6)
    return;
  v7 = v6[2];
  if (!*(_QWORD *)&v7)
    return;
  v8 = (uint8x8_t)vcnt_s8(v7);
  v8.i16[0] = vaddlv_u8(v8);
  v9 = v8.u32[0];
  if (v8.u32[0] > 1uLL)
  {
    v10 = 0xBEC1A12372CEEC00;
    if (*(_QWORD *)&v7 <= 0xBEC1A12372CEEC00)
      v10 = 0xBEC1A12372CEEC00 % *(_QWORD *)&v7;
  }
  else
  {
    v10 = (*(_QWORD *)&v7 - 1) & 0xBEC1A12372CEEC00;
  }
  v11 = *(_QWORD **)(*(_QWORD *)&v6[1] + 8 * v10);
  if (!v11)
    goto LABEL_30;
  v12 = (_QWORD *)*v11;
  if (!v12)
    goto LABEL_30;
  if (v8.u32[0] < 2uLL)
  {
    while (1)
    {
      v14 = v12[1];
      if (v14 == 0xBEC1A12372CEEC00)
      {
        if (v12[2] == 0xBEC1A12372CEEC00)
          goto LABEL_24;
      }
      else if ((v14 & (*(_QWORD *)&v7 - 1)) != v10)
      {
        goto LABEL_28;
      }
      v12 = (_QWORD *)*v12;
      if (!v12)
        goto LABEL_28;
    }
  }
  while (1)
  {
    v13 = v12[1];
    if (v13 == 0xBEC1A12372CEEC00)
      break;
    if (v13 >= *(_QWORD *)&v7)
      v13 %= *(_QWORD *)&v7;
    if (v13 != v10)
      goto LABEL_28;
LABEL_13:
    v12 = (_QWORD *)*v12;
    if (!v12)
      goto LABEL_28;
  }
  if (v12[2] != 0xBEC1A12372CEEC00)
    goto LABEL_13;
LABEL_24:
  v15 = v12[5];
  if (v15)
  {
    if (*(unsigned __int8 *)(v15 + 240) != (v3 ^ 1))
    {
      std::__hash_table<md::NavigationLogicEvent,std::hash<md::NavigationLogicEvent>,std::equal_to<md::NavigationLogicEvent>,std::allocator<md::NavigationLogicEvent>>::__emplace_unique_key_args<md::NavigationLogicEvent,md::NavigationLogicEvent const&>(v15 + 248, 0, 0);
      v7 = v6[2];
    }
    *(_BYTE *)(v15 + 240) = v3 ^ 1;
  }
LABEL_28:
  if (!*(_QWORD *)&v7)
    return;
  v16 = (uint8x8_t)vcnt_s8(v7);
  v16.i16[0] = vaddlv_u8(v16);
  v9 = v16.u32[0];
LABEL_30:
  if (v9 > 1)
  {
    v17 = 0x2FED70A4459DFCA1;
    if (*(_QWORD *)&v7 <= 0x2FED70A4459DFCA1uLL)
      v17 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v7;
  }
  else
  {
    v17 = (*(_QWORD *)&v7 - 1) & 0x2FED70A4459DFCA1;
  }
  v18 = v6[1];
  v19 = *(_QWORD **)(*(_QWORD *)&v18 + 8 * v17);
  if (!v19)
    return;
  v20 = (_QWORD *)*v19;
  if (!*v19)
    return;
  v21 = *(_QWORD *)&v7 - 1;
  if (v9 < 2)
  {
    while (1)
    {
      v22 = v20[1];
      if (v22 == 0x2FED70A4459DFCA1)
      {
        if (v20[2] == 0x2FED70A4459DFCA1)
          goto LABEL_50;
      }
      else if ((v22 & v21) != v17)
      {
        return;
      }
      v20 = (_QWORD *)*v20;
      if (!v20)
        return;
    }
  }
  while (2)
  {
    v23 = v20[1];
    if (v23 != 0x2FED70A4459DFCA1)
    {
      if (v23 >= *(_QWORD *)&v7)
        v23 %= *(_QWORD *)&v7;
      if (v23 != v17)
        return;
      goto LABEL_44;
    }
    if (v20[2] != 0x2FED70A4459DFCA1)
    {
LABEL_44:
      v20 = (_QWORD *)*v20;
      if (!v20)
        return;
      continue;
    }
    break;
  }
LABEL_50:
  v24 = v20[5];
  if (v24)
  {
    if (v9 > 1)
    {
      v25 = 0x20A1ED17D78F322BLL;
      if (*(_QWORD *)&v7 <= 0x20A1ED17D78F322BuLL)
        v25 = 0x20A1ED17D78F322BuLL % *(_QWORD *)&v7;
    }
    else
    {
      v25 = v21 & 0x20A1ED17D78F322BLL;
    }
    v26 = *(_QWORD **)(*(_QWORD *)&v18 + 8 * v25);
    if (v26)
    {
      v27 = (_QWORD *)*v26;
      if (v27)
      {
        if (v9 < 2)
        {
          while (1)
          {
            v28 = v27[1];
            if (v28 == 0x20A1ED17D78F322BLL)
            {
              if (v27[2] == 0x20A1ED17D78F322BLL)
                goto LABEL_71;
            }
            else if ((v28 & v21) != v25)
            {
              return;
            }
            v27 = (_QWORD *)*v27;
            if (!v27)
              return;
          }
        }
        do
        {
          v29 = v27[1];
          if (v29 == 0x20A1ED17D78F322BLL)
          {
            if (v27[2] == 0x20A1ED17D78F322BLL)
            {
LABEL_71:
              v30 = v27[5];
              if (v30)
              {
                *(_BYTE *)(v24 + 1112) = v3;
                md::LabelSettings_Navigation::setDetachedCamera(*(md::LabelSettings_Navigation **)(*(_QWORD *)(*(_QWORD *)(v30 + 144) + 8) + 24), v3);
                v31 = *(_QWORD *)(v5 + 1128);
                v32 = 38;
                md::MapEngineSettings::set(v31, &v32, (_QWORD *)v3);
              }
              return;
            }
          }
          else
          {
            if (v29 >= *(_QWORD *)&v7)
              v29 %= *(_QWORD *)&v7;
            if (v29 != v25)
              return;
          }
          v27 = (_QWORD *)*v27;
        }
        while (v27);
      }
    }
  }
}

- (void)_setNavCameraTransitionComplete:(BOOL)a3
{
  id WeakRetained;
  uint64_t v5;
  int8x8_t *v6;
  int8x8_t v7;
  uint8x8_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;

  WeakRetained = objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
  v5 = objc_msgSend(WeakRetained, "mapEngine");

  if (v5)
  {
    v6 = *(int8x8_t **)(v5 + 1120);
    if (v6)
    {
      v7 = v6[2];
      if (v7)
      {
        v8 = (uint8x8_t)vcnt_s8(v7);
        v8.i16[0] = vaddlv_u8(v8);
        if (v8.u32[0] > 1uLL)
        {
          v9 = 0x2FED70A4459DFCA1;
          if (*(_QWORD *)&v7 <= 0x2FED70A4459DFCA1uLL)
            v9 = 0x2FED70A4459DFCA1uLL % *(_QWORD *)&v7;
        }
        else
        {
          v9 = (*(_QWORD *)&v7 - 1) & 0x2FED70A4459DFCA1;
        }
        v10 = *(_QWORD **)(*(_QWORD *)&v6[1] + 8 * v9);
        if (v10)
        {
          v11 = (_QWORD *)*v10;
          if (v11)
          {
            if (v8.u32[0] < 2uLL)
            {
              v12 = *(_QWORD *)&v7 - 1;
              while (1)
              {
                v14 = v11[1];
                if (v14 == 0x2FED70A4459DFCA1)
                {
                  if (v11[2] == 0x2FED70A4459DFCA1)
                    goto LABEL_24;
                }
                else if ((v14 & v12) != v9)
                {
                  return;
                }
                v11 = (_QWORD *)*v11;
                if (!v11)
                  return;
              }
            }
            do
            {
              v13 = v11[1];
              if (v13 == 0x2FED70A4459DFCA1)
              {
                if (v11[2] == 0x2FED70A4459DFCA1)
                {
LABEL_24:
                  v15 = v11[5];
                  if (v15)
                    *(_BYTE *)(v15 + 1113) = a3;
                  return;
                }
              }
              else
              {
                if (v13 >= *(_QWORD *)&v7)
                  v13 %= *(_QWORD *)&v7;
                if (v13 != v9)
                  return;
              }
              v11 = (_QWORD *)*v11;
            }
            while (v11);
          }
        }
      }
    }
  }
}

- (float)_currentRoadSignOffset
{
  id WeakRetained;
  uint64_t v3;
  int8x8_t *v4;
  int8x8_t v5;
  uint8x8_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  float result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
  v3 = objc_msgSend(WeakRetained, "mapEngine");

  if (!v3)
    return 0.0;
  v4 = *(int8x8_t **)(v3 + 1120);
  if (!v4)
    return 0.0;
  v5 = v4[2];
  if (!*(_QWORD *)&v5)
    return 0.0;
  v6 = (uint8x8_t)vcnt_s8(v5);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    v7 = 0x20A1ED17D78F322BLL;
    if (*(_QWORD *)&v5 <= 0x20A1ED17D78F322BuLL)
      v7 = 0x20A1ED17D78F322BuLL % *(_QWORD *)&v5;
  }
  else
  {
    v7 = (*(_QWORD *)&v5 - 1) & 0x20A1ED17D78F322BLL;
  }
  v8 = *(_QWORD **)(*(_QWORD *)&v4[1] + 8 * v7);
  if (!v8)
    return 0.0;
  v9 = (_QWORD *)*v8;
  if (!v9)
    return 0.0;
  if (v6.u32[0] < 2uLL)
  {
    v10 = *(_QWORD *)&v5 - 1;
    while (1)
    {
      v12 = v9[1];
      if (v12 == 0x20A1ED17D78F322BLL)
      {
        if (v9[2] == 0x20A1ED17D78F322BLL)
          goto LABEL_24;
      }
      else if ((v12 & v10) != v7)
      {
        return 0.0;
      }
      v9 = (_QWORD *)*v9;
      if (!v9)
        return 0.0;
    }
  }
  while (1)
  {
    v11 = v9[1];
    if (v11 == 0x20A1ED17D78F322BLL)
      break;
    if (v11 >= *(_QWORD *)&v5)
      v11 %= *(_QWORD *)&v5;
    if (v11 != v7)
      return 0.0;
LABEL_13:
    v9 = (_QWORD *)*v9;
    if (!v9)
      return 0.0;
  }
  if (v9[2] != 0x20A1ED17D78F322BLL)
    goto LABEL_13;
LABEL_24:
  v13 = v9[5];
  if (v13)
  {
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v13 + 144) + 8) + 24) + 168) + 32);
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 40))(v14);
    return result;
  }
  return 0.0;
}

- (BOOL)usesVKCamera
{
  return 0;
}

- (BOOL)snapMapIfNecessary:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t *p_shared_owners;
  unint64_t v6;
  double v7;
  unint64_t *v8;
  unint64_t v9;
  double v10;
  double v11;
  unint64_t *v12;
  unint64_t v13;
  double v14;
  BOOL v15;
  unint64_t *v16;
  unint64_t v17;
  double v18;
  char v19;
  double *v21;
  std::__shared_weak_count *v22;

  if (self->_isDetached)
  {
    v3 = a3;
    -[VKCameraController camera](self, "camera");
    if (v22)
    {
      p_shared_owners = (unint64_t *)&v22->__shared_owners_;
      do
        v6 = __ldaxr(p_shared_owners);
      while (__stlxr(v6 - 1, p_shared_owners));
      if (!v6)
      {
        ((void (*)())v22->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    if (*(double *)&v21 != 0.0)
    {
      -[VKCameraController camera](self, "camera");
      v7 = v21[5];
      if (v22)
      {
        v8 = (unint64_t *)&v22->__shared_owners_;
        do
          v9 = __ldaxr(v8);
        while (__stlxr(v9 - 1, v8));
        if (!v9)
        {
          ((void (*)())v22->__on_zero_shared)();
          std::__shared_weak_count::__release_weak(v22);
        }
      }
      -[VKNavCameraController maxCameraPitch](self, "maxCameraPitch");
      -[VKNavCameraController minCameraPitch](self, "minCameraPitch");
      if (v7 < *(double *)&v21 && v7 > 0.0001 || (v10 = *(double *)&v21, v7 > *(double *)&v21))
        -[VKNavCameraController pitchTo:animated:](self, "pitchTo:animated:", v3);
      -[VKCameraController camera](self, "camera", v10);
      v11 = fabs(v21[1]);
      if (v22)
      {
        v12 = (unint64_t *)&v22->__shared_owners_;
        do
          v13 = __ldaxr(v12);
        while (__stlxr(v13 - 1, v12));
        if (!v13)
        {
          ((void (*)())v22->__on_zero_shared)();
          std::__shared_weak_count::__release_weak(v22);
        }
      }
      if (v11 < 1.30899694)
      {
        -[VKCameraController camera](self, "camera");
        v14 = fabs(v21[6]);
        v15 = v14 < 2.22507386e-308 || v14 <= v14 * 2.22044605e-14;
        if (v22)
        {
          v16 = (unint64_t *)&v22->__shared_owners_;
          do
            v17 = __ldaxr(v16);
          while (__stlxr(v17 - 1, v16));
          if (!v17)
          {
            ((void (*)())v22->__on_zero_shared)();
            std::__shared_weak_count::__release_weak(v22);
          }
        }
        -[VKNavCameraController currentZoomLevel](self, "currentZoomLevel");
        v19 = v18 > 6.0 || v15;
        if ((v19 & 1) == 0)
          -[VKNavCameraController rotateTo:animated:](self, "rotateTo:animated:", v3, 0.0);
      }
    }
  }
  return 0;
}

- (void)rotateTo:(double)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  VKTimedAnimation *snapHeadingAnimation;
  VKTimedAnimation *v8;
  VKTimedAnimation *v9;
  double value;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  id v15[2];
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19[3];

  v4 = a4;
  -[VKAnimation stop](self->_snapHeadingAnimation, "stop");
  snapHeadingAnimation = self->_snapHeadingAnimation;
  self->_snapHeadingAnimation = 0;

  if (v4)
  {
    v8 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", 0.3);
    v9 = self->_snapHeadingAnimation;
    self->_snapHeadingAnimation = v8;

    -[VKTimedAnimation setTimingFunction:](self->_snapHeadingAnimation, "setTimingFunction:", VKAnimationCurveEaseInOut);
    value = self->_cameraFrame._heading._value;
    objc_initWeak(v15, self);
    v11 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __43__VKNavCameraController_rotateTo_animated___block_invoke;
    v18[3] = &unk_1E42F9418;
    objc_copyWeak(v19, v15);
    v19[1] = *(id *)&value;
    v19[2] = *(id *)&a3;
    -[VKTimedAnimation setStepHandler:](self->_snapHeadingAnimation, "setStepHandler:", v18);
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __43__VKNavCameraController_rotateTo_animated___block_invoke_2;
    v16[3] = &unk_1E42F7A38;
    objc_copyWeak(&v17, v15);
    -[VKAnimation setCompletionHandler:](self->_snapHeadingAnimation, "setCompletionHandler:", v16);
    md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), &self->_snapHeadingAnimation->super);
    objc_destroyWeak(&v17);
    objc_destroyWeak(v19);
    objc_destroyWeak(v15);
  }
  else
  {
    -[VKCameraController camera](self, "camera");
    v12 = (std::__shared_weak_count *)v15[1];
    *((double *)v15[0] + 6) = a3;
    if (v12)
    {
      p_shared_owners = (unint64_t *)&v12->__shared_owners_;
      do
        v14 = __ldaxr(p_shared_owners);
      while (__stlxr(v14 - 1, p_shared_owners));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
  }
}

- (void)pitchTo:(double)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  VKTimedAnimation *snapPitchAnimation;
  VKTimedAnimation *v8;
  VKTimedAnimation *v9;
  void *v10;
  uint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20[3];
  uint64_t v21;
  std::__shared_weak_count *v22;
  id location;

  v4 = a4;
  -[VKAnimation stop](self->_snapPitchAnimation, "stop");
  snapPitchAnimation = self->_snapPitchAnimation;
  self->_snapPitchAnimation = 0;

  if (v4)
  {
    v8 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", 0.3);
    v9 = self->_snapPitchAnimation;
    self->_snapPitchAnimation = v8;

    -[VKTimedAnimation setTimingFunction:](self->_snapPitchAnimation, "setTimingFunction:", VKAnimationCurveEaseInOut);
    objc_initWeak(&location, self);
    -[VKCameraController camera](self, "camera");
    v10 = *(void **)(v21 + 40);
    if (v22)
    {
      p_shared_owners = &v22->__shared_owners_;
      do
        v12 = __ldaxr((unint64_t *)p_shared_owners);
      while (__stlxr(v12 - 1, (unint64_t *)p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    v13 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __42__VKNavCameraController_pitchTo_animated___block_invoke;
    v19[3] = &unk_1E42F9418;
    objc_copyWeak(v20, &location);
    v20[1] = v10;
    v20[2] = *(id *)&a3;
    -[VKTimedAnimation setStepHandler:](self->_snapPitchAnimation, "setStepHandler:", v19);
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __42__VKNavCameraController_pitchTo_animated___block_invoke_2;
    v17[3] = &unk_1E42F7A38;
    objc_copyWeak(&v18, &location);
    -[VKAnimation setCompletionHandler:](self->_snapPitchAnimation, "setCompletionHandler:", v17);
    md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), &self->_snapPitchAnimation->super);
    objc_destroyWeak(&v18);
    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }
  else
  {
    -[VKCameraController camera](self, "camera");
    v14 = v22;
    *(double *)(v21 + 40) = a3;
    if (v14)
    {
      v15 = (unint64_t *)&v14->__shared_owners_;
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
  }
}

- (void)_updateCameraLimits
{
  unint64_t *v3;
  unint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  const Camera *v7;
  float v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  double v12;
  float v13;
  float v14;
  float v15;
  unint64_t *v16;
  unint64_t v17;
  id WeakRetained;
  double v19;
  float v20;
  id v21;
  float v22;
  double v23;
  unint64_t *v24;
  unint64_t v25;
  void *v26;
  float v27;
  float v28;
  uint64_t v29;
  double v30;
  float v31;
  unint64_t *v32;
  unint64_t v33;
  float v34;
  float v35;
  uint64_t v36;
  double v37;
  float v38;
  unint64_t *v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  float v46;
  double v47;
  float v48;
  float v49;
  float v50;
  unint64_t *v51;
  unint64_t v52;
  uint64_t v53;
  float v54;
  double v55;
  float v56;
  float v57;
  float v58;
  unint64_t *v59;
  unint64_t v60;
  uint64_t v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  long double v67;
  long double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  long double v75;
  long double v76;
  double v77;
  std::__shared_weak_count *v78;
  unint64_t *p_shared_owners;
  unint64_t v80;
  std::__shared_weak_count *v81;
  unint64_t *v82;
  unint64_t v83;
  std::__shared_weak_count *v84;
  unint64_t *v85;
  unint64_t v86;
  std::__shared_weak_count *v87;
  unint64_t *v88;
  unint64_t v89;
  __int128 v90;
  uint64_t v91;
  std::__shared_weak_count *v92;
  __int128 v93;
  unint64_t *v94;
  unint64_t v95;
  double v96[2];
  std::__shared_weak_count *v97;
  double *v98;
  std::__shared_weak_count *v99;
  double v100;
  double *v101;
  std::__shared_weak_count *v102;
  double v103;
  uint64_t v104;
  std::__shared_weak_count *v105;
  gdc::DisplayZoomLevel *v106[2];
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint64_t v110;
  float v111;
  double v112;
  double v113;
  float v114;
  double v115;
  double v116;
  char v117[8];
  gdc::DisplayZoomLevel *v118;
  char v119;
  gdc::DisplayZoomLevel *v120;
  double v121;

  -[VKCameraController camera](self, "camera");
  if (!v106[1])
    goto LABEL_5;
  v3 = (unint64_t *)((char *)v106[1] + 8);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(v4 - 1, v3));
  if (!v4)
  {
    (*(void (**)(gdc::DisplayZoomLevel *))(*(_QWORD *)v106[1] + 16))(v106[1]);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v106[1]);
    if (!v106[0])
      return;
  }
  else
  {
LABEL_5:
    if (!v106[0])
      return;
  }
  -[VKCameraController camera](self, "camera");
  v121 = *((double *)v106[0] + 9);
  if (v106[1])
  {
    v5 = (unint64_t *)((char *)v106[1] + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      (*(void (**)(gdc::DisplayZoomLevel *))(*(_QWORD *)v106[1] + 16))(v106[1]);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v106[1]);
    }
  }
  -[VKCameraController camera](self, "camera");
  v8 = gdc::DisplayZoomLevel::centerZoomLevel(v106[0], v7);
  if (v106[1])
  {
    v9 = (unint64_t *)((char *)v106[1] + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      (*(void (**)(gdc::DisplayZoomLevel *))(*(_QWORD *)v106[1] + 16))(v106[1]);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v106[1]);
    }
  }
  v11 = -[VKNavCameraController tileSize](self, "tileSize");
  -[VKCameraController camera](self, "camera");
  v12 = *((double *)v106[0] + 46);
  v13 = 0.0;
  if (v12 > 0.0)
  {
    v14 = v12;
    v15 = (float)v11;
    v13 = log2f(v14 / v15);
  }
  if (v106[1])
  {
    v16 = (unint64_t *)((char *)v106[1] + 8);
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      (*(void (**)(gdc::DisplayZoomLevel *))(*(_QWORD *)v106[1] + 16))(v106[1]);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v106[1]);
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
  v19 = fminf(fmaxf(v8 + v13, 1.0), 25.0);
  v20 = pitchForZ((_QWORD *)(*(_QWORD *)(objc_msgSend(WeakRetained, "mapEngine") + 1192) + 384), v19);

  v21 = objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
  v22 = pitchForZ((_QWORD *)(*(_QWORD *)(objc_msgSend(v21, "mapEngine") + 1192) + 408), v19);

  -[VKCameraController camera](self, "camera");
  v23 = *((double *)v106[0] + 9);
  if (v106[1])
  {
    v24 = (unint64_t *)((char *)v106[1] + 8);
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      (*(void (**)(gdc::DisplayZoomLevel *))(*(_QWORD *)v106[1] + 16))(v106[1]);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v106[1]);
    }
  }
  v121 = v22;
  if (v23 > v20 != v22 > v20)
  {
    -[VKCameraController cameraDelegate](self, "cameraDelegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "mapLayerCanEnter3DModeDidChange:", v22 > v20);

  }
  -[VKNavCameraController minimumNormalizedZoomLevel](self, "minimumNormalizedZoomLevel");
  v28 = v27;
  v29 = -[VKNavCameraController tileSize](self, "tileSize");
  -[VKCameraController camera](self, "camera");
  v30 = *((double *)v106[0] + 46);
  v31 = 0.0;
  if (v30 > 0.0)
    v31 = log2((double)v29 / v30);
  if (v106[1])
  {
    v32 = (unint64_t *)((char *)v106[1] + 8);
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      (*(void (**)(gdc::DisplayZoomLevel *))(*(_QWORD *)v106[1] + 16))(v106[1]);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v106[1]);
    }
  }
  -[VKNavCameraController maximumNormalizedZoomLevel](self, "maximumNormalizedZoomLevel");
  v35 = v34;
  v36 = -[VKNavCameraController tileSize](self, "tileSize");
  -[VKCameraController camera](self, "camera");
  v37 = *((double *)v106[0] + 46);
  v38 = 0.0;
  if (v37 > 0.0)
    v38 = log2((double)v36 / v37);
  if (v106[1])
  {
    v39 = (unint64_t *)((char *)v106[1] + 8);
    do
      v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
    if (!v40)
    {
      (*(void (**)(gdc::DisplayZoomLevel *))(*(_QWORD *)v106[1] + 16))(v106[1]);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v106[1]);
    }
  }
  v117[0] = 0;
  v119 = 0;
  -[VKCameraController vkCamera](self, "vkCamera");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (v41)
  {
    objc_msgSend(v41, "minDistanceToGroundRestriction");
    if (LOBYTE(v106[0]))
    {
      v117[0] = 1;
      v118 = v106[1];
      LOBYTE(v106[0]) = 0;
    }
  }
  else
  {
    v106[0] = 0;
    v106[1] = 0;
  }

  -[VKCameraController vkCamera](self, "vkCamera");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (v43)
  {
    objc_msgSend(v43, "maxDistanceToGroundRestriction");
    if (LOBYTE(v106[0]))
    {
      v119 = 1;
      v120 = v106[1];
      LOBYTE(v106[0]) = 0;
    }
  }
  else
  {
    v106[0] = 0;
    v106[1] = 0;
  }

  v45 = -[VKNavCameraController tileSize](self, "tileSize");
  -[VKCameraController camera](self, "camera");
  v46 = fminf(fmaxf(fminf(fmaxf(v28, 1.0), 25.0) + v31, 1.0), 25.0);
  v47 = *((double *)v106[0] + 46);
  v115 = (double)v45;
  v116 = v47;
  v48 = 0.0;
  if (v47 > 0.0)
  {
    v49 = v47;
    v50 = (float)v45;
    v48 = log2f(v49 / v50);
  }
  v114 = fminf(fmaxf(v46 + v48, 1.0), 25.0);
  if (v106[1])
  {
    v51 = (unint64_t *)((char *)v106[1] + 8);
    do
      v52 = __ldaxr(v51);
    while (__stlxr(v52 - 1, v51));
    if (!v52)
    {
      (*(void (**)(gdc::DisplayZoomLevel *))(*(_QWORD *)v106[1] + 16))(v106[1]);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v106[1]);
    }
  }
  v53 = -[VKNavCameraController tileSize](self, "tileSize");
  -[VKCameraController camera](self, "camera");
  v54 = fminf(fmaxf(fminf(fmaxf(v35, 1.0), 25.0) + v38, 1.0), 25.0);
  v55 = *((double *)v106[0] + 46);
  v112 = (double)v53;
  v113 = v55;
  v56 = 0.0;
  if (v55 > 0.0)
  {
    v57 = v55;
    v58 = (float)v53;
    v56 = log2f(v57 / v58);
  }
  v111 = fminf(fmaxf(v54 + v56, 1.0), 25.0);
  if (v106[1])
  {
    v59 = (unint64_t *)((char *)v106[1] + 8);
    do
      v60 = __ldaxr(v59);
    while (__stlxr(v60 - 1, v59));
    if (!v60)
    {
      (*(void (**)(gdc::DisplayZoomLevel *))(*(_QWORD *)v106[1] + 16))(v106[1]);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v106[1]);
    }
  }
  -[VKCameraController camera](self, "camera");
  v61 = v104;
  -[VKCameraController camera](self, "camera");
  v63 = v101[46];
  v62 = v101[47];
  if (v62 >= v63)
  {
    v69 = v101[57];
  }
  else
  {
    v64 = v62 * v63;
    v65 = v62 / v63;
    if (v64 <= 0.0)
      v66 = 1.0;
    else
      v66 = v65;
    v67 = tan(v101[57] * 0.5);
    v68 = atan(v66 * v67);
    v69 = v68 + v68;
  }
  v103 = v69;
  -[VKCameraController camera](self, "camera");
  v70 = v98[46];
  v71 = v98[47];
  if (v70 >= v71)
  {
    v77 = v98[57];
  }
  else
  {
    v72 = v71 * v70;
    v73 = v70 / v71;
    if (v72 <= 0.0)
      v74 = 1.0;
    else
      v74 = v73;
    v75 = tan(v98[57] * 0.5);
    v76 = atan(v74 * v75);
    v77 = v76 + v76;
  }
  v100 = v77;
  -[VKCameraController camera](self, "camera");
  v96[0] = 0.0;
  gdc::CameraLimits::CameraLimits((uint64_t)v106, (double *)(v61 + 8), &v103, &v100, (long double *)(*(_QWORD *)&v96[1] + 40), &v121, v96, (uint64_t)&v114, v121, (uint64_t)&v111, (uint64_t)v117);
  v78 = v97;
  if (v97)
  {
    p_shared_owners = (unint64_t *)&v97->__shared_owners_;
    do
      v80 = __ldaxr(p_shared_owners);
    while (__stlxr(v80 - 1, p_shared_owners));
    if (!v80)
    {
      ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
      std::__shared_weak_count::__release_weak(v78);
    }
  }
  v81 = v99;
  if (v99)
  {
    v82 = (unint64_t *)&v99->__shared_owners_;
    do
      v83 = __ldaxr(v82);
    while (__stlxr(v83 - 1, v82));
    if (!v83)
    {
      ((void (*)(std::__shared_weak_count *))v81->__on_zero_shared)(v81);
      std::__shared_weak_count::__release_weak(v81);
    }
  }
  v84 = v102;
  if (v102)
  {
    v85 = (unint64_t *)&v102->__shared_owners_;
    do
      v86 = __ldaxr(v85);
    while (__stlxr(v86 - 1, v85));
    if (!v86)
    {
      ((void (*)(std::__shared_weak_count *))v84->__on_zero_shared)(v84);
      std::__shared_weak_count::__release_weak(v84);
    }
  }
  v87 = v105;
  if (v105)
  {
    v88 = (unint64_t *)&v105->__shared_owners_;
    do
      v89 = __ldaxr(v88);
    while (__stlxr(v89 - 1, v88));
    if (!v89)
    {
      ((void (*)(std::__shared_weak_count *))v87->__on_zero_shared)(v87);
      std::__shared_weak_count::__release_weak(v87);
    }
  }
  -[VKCameraController camera](self, "camera");
  v90 = v109;
  v91 = v104;
  v92 = v105;
  *(_OWORD *)(v104 + 96) = v108;
  *(_OWORD *)(v91 + 112) = v90;
  *(_QWORD *)(v91 + 128) = v110;
  v93 = v107;
  *(_OWORD *)(v91 + 64) = *(_OWORD *)v106;
  *(_OWORD *)(v91 + 80) = v93;
  if (v92)
  {
    v94 = (unint64_t *)&v92->__shared_owners_;
    do
      v95 = __ldaxr(v94);
    while (__stlxr(v95 - 1, v94));
    if (!v95)
    {
      ((void (*)(std::__shared_weak_count *))v92->__on_zero_shared)(v92);
      std::__shared_weak_count::__release_weak(v92);
    }
  }
}

- (int64_t)tileSize
{
  id *v2;
  id WeakRetained;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  int64_t v8;

  v2 = (id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16];
  WeakRetained = objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v5 = objc_loadWeakRetained(v2);
    if (!objc_msgSend(v5, "mapEngine"))
    {

      v8 = 256;
      goto LABEL_7;
    }
    v6 = objc_loadWeakRetained(v2);
    v7 = *(_QWORD *)(objc_msgSend(v6, "mapEngine") + 896);

    if (v7)
    {
      v4 = objc_loadWeakRetained(v2);
      v8 = *(_QWORD *)(*(_QWORD *)(objc_msgSend(v4, "mapEngine") + 896) + 312);
LABEL_7:

      return v8;
    }
  }
  return 256;
}

- (float)maximumNormalizedZoomLevel
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  id v5;
  float v6;

  v2 = (id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16];
  WeakRetained = objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
  v4 = *(_QWORD *)(objc_msgSend(WeakRetained, "mapEngine") + 1192);

  if (!v4)
    return 20.0;
  v5 = objc_loadWeakRetained(v2);
  v6 = (float)*(unsigned int *)(*(_QWORD *)(objc_msgSend(v5, "mapEngine") + 1192) + 52);

  return v6;
}

- (float)minimumNormalizedZoomLevel
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  float v5;
  id v6;
  int8x8_t *v7;
  int8x8_t v8;
  uint8x8_t v9;
  unint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v2 = (id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16];
  WeakRetained = objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
  v4 = *(_QWORD *)(objc_msgSend(WeakRetained, "mapEngine") + 1192);

  v5 = 1.0;
  if (!v4)
    return fmaxf(v5, 1.0);
  v6 = objc_loadWeakRetained(v2);
  v7 = *(int8x8_t **)(objc_msgSend(v6, "mapEngine") + 1120);
  v8 = v7[2];
  if (!*(_QWORD *)&v8)
    goto LABEL_22;
  v9 = (uint8x8_t)vcnt_s8(v8);
  v9.i16[0] = vaddlv_u8(v9);
  if (v9.u32[0] > 1uLL)
  {
    v10 = 0xAF46DE79C836B0D8;
    if (*(_QWORD *)&v8 <= 0xAF46DE79C836B0D8)
      v10 = 0xAF46DE79C836B0D8 % *(_QWORD *)&v8;
  }
  else
  {
    v10 = (*(_QWORD *)&v8 - 1) & 0xAF46DE79C836B0D8;
  }
  v11 = *(_QWORD **)(*(_QWORD *)&v7[1] + 8 * v10);
  if (!v11 || (v12 = (_QWORD *)*v11) == 0)
  {
LABEL_22:

    v5 = 1.0;
    return fmaxf(v5, 1.0);
  }
  if (v9.u32[0] < 2uLL)
  {
    v13 = *(_QWORD *)&v8 - 1;
    while (1)
    {
      v15 = v12[1];
      if (v15 == 0xAF46DE79C836B0D8)
      {
        if (v12[2] == 0xAF46DE79C836B0D8)
          goto LABEL_24;
      }
      else if ((v15 & v13) != v10)
      {
        goto LABEL_22;
      }
      v12 = (_QWORD *)*v12;
      if (!v12)
        goto LABEL_22;
    }
  }
  while (1)
  {
    v14 = v12[1];
    if (v14 == 0xAF46DE79C836B0D8)
      break;
    if (v14 >= *(_QWORD *)&v8)
      v14 %= *(_QWORD *)&v8;
    if (v14 != v10)
      goto LABEL_22;
LABEL_12:
    v12 = (_QWORD *)*v12;
    if (!v12)
      goto LABEL_22;
  }
  if (v12[2] != 0xAF46DE79C836B0D8)
    goto LABEL_12;
LABEL_24:
  v17 = v12[5];

  v5 = 1.0;
  if (v17)
    v5 = (float)*(unsigned int *)(v17 + 312);
  return fmaxf(v5, 1.0);
}

- (float)minPitchForNormalizedZoomLevel:(float)a3
{
  id *v4;
  id WeakRetained;
  uint64_t v6;
  id v7;
  float v8;

  v4 = (id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16];
  WeakRetained = objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
  v6 = *(_QWORD *)(objc_msgSend(WeakRetained, "mapEngine") + 1192);

  if (!v6)
    return 0.0;
  v7 = objc_loadWeakRetained(v4);
  v8 = pitchForZ((_QWORD *)(*(_QWORD *)(objc_msgSend(v7, "mapEngine") + 1192) + 384), a3);

  return v8;
}

- (float)idealPitchForNormalizedZoomLevel:(float)a3
{
  id *v4;
  id WeakRetained;
  uint64_t v6;
  id v7;
  float v8;

  v4 = (id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16];
  WeakRetained = objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
  v6 = *(_QWORD *)(objc_msgSend(WeakRetained, "mapEngine") + 1192);

  if (!v6)
    return 0.0;
  v7 = objc_loadWeakRetained(v4);
  v8 = pitchForZ((_QWORD *)(*(_QWORD *)(objc_msgSend(v7, "mapEngine") + 1192) + 432), a3);

  return v8;
}

- (float)maxPitchForNormalizedZoomLevel:(float)a3
{
  void *v5;
  char v6;
  id *v8;
  id WeakRetained;
  uint64_t v10;
  id v11;
  float v12;

  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "relaxTiltLimits");

  if ((v6 & 1) != 0)
    return 1.4835;
  v8 = (id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16];
  WeakRetained = objc_loadWeakRetained(v8);
  v10 = *(_QWORD *)(objc_msgSend(WeakRetained, "mapEngine") + 1192);

  if (!v10)
    return 0.0;
  v11 = objc_loadWeakRetained(v8);
  v12 = pitchForZ((_QWORD *)(*(_QWORD *)(objc_msgSend(v11, "mapEngine") + 1192) + 408), a3);

  return v12;
}

- (VKInteractiveMap)screenCanvas
{
  return (VKInteractiveMap *)objc_loadWeakRetained((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
}

- (void)setScreenCanvas:(id)a3
{
  objc_storeWeak((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16], a3);
}

- (VKSceneConfiguration)sceneConfiguration
{
  return (VKSceneConfiguration *)objc_loadWeakRetained((id *)&self->_cameraMode);
}

- (void)setSceneConfiguration:(id)a3
{
  objc_storeWeak((id *)&self->_cameraMode, a3);
}

- (VKEdgeInsets)clientFramingInsets
{
  float top;
  float left;
  float bottom;
  float right;
  VKEdgeInsets result;

  top = self->_framingEdgeInsetProportional.top;
  left = self->_framingEdgeInsetProportional.left;
  bottom = self->_framingEdgeInsetProportional.bottom;
  right = self->_framingEdgeInsetProportional.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setClientFramingInsets:(VKEdgeInsets)a3
{
  self->_framingEdgeInsetProportional = a3;
}

- (Coordinate3D<geo::Radians,)puckCoordinate
{
  uint64_t v2;
  double value;
  Coordinate3D<geo::Radians, double> result;

  *(_OWORD *)v2 = *(_OWORD *)&self->_puckCoordinate.latitude._value;
  value = self->_puckCoordinate.altitude._value;
  *(double *)(v2 + 16) = value;
  result.latitude = *(Unit<geo::RadianUnitDescription, double> *)&value;
  return result;
}

- (void).cxx_destruct
{
  double farClipPlaneFactor;
  unint64_t *v4;
  unint64_t v5;
  LabelMetrics *cameraManager;
  uint64_t v7;
  void *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  void *v12;

  objc_destroyWeak((id *)&self->_showLegend._delegate.__f_.__buf_.__lx[16]);
  md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::~Monitorable((uint64_t)&self->_showProperties._delegate.__f_.__buf_.__lx[16]);
  md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::~Monitorable((uint64_t)&self->_showAttributes._delegate.__f_.__buf_.__lx[16]);
  md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::~Monitorable((uint64_t)&self->_showOverlay._delegate.__f_.__buf_.__lx[16]);
  md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::~Monitorable((uint64_t)&self->_showConsole._delegate.__f_.__buf_.__lx[16]);
  md::Monitorable<md::ConfigValue<GEOConfigKeyBOOL,BOOL>>::~Monitorable((uint64_t)&self->_didNavCameraTransition);
  objc_destroyWeak((id *)&self->_cameraMode);
  farClipPlaneFactor = self->_farClipPlaneFactor;
  if (farClipPlaneFactor != 0.0)
  {
    v4 = (unint64_t *)(*(_QWORD *)&farClipPlaneFactor + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(double))(**(_QWORD **)&farClipPlaneFactor + 16))(COERCE_DOUBLE(*(_QWORD *)&farClipPlaneFactor));
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)&farClipPlaneFactor);
    }
  }
  cameraManager = (LabelMetrics *)self->_cameraManager;
  if (cameraManager)
  {
    self->_labelMetrics.__ptr_.__value_ = cameraManager;
    operator delete(cameraManager);
  }
  v7 = *(_QWORD *)&self->_isElevatedRoute;
  *(_QWORD *)&self->_isElevatedRoute = 0;
  if (v7)
  {
    v8 = *(void **)v7;
    if (*(_QWORD *)v7)
    {
      *(_QWORD *)(v7 + 8) = v8;
      operator delete(v8);
    }
    MEMORY[0x1A1AF4E00](v7, 0x1020C4040A25C38);
  }
  if (LOBYTE(self->_pixelSamples._avg))
    LOBYTE(self->_pixelSamples._avg) = 0;
  v9 = *(std::__shared_weak_count **)&self->_animationTime;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  objc_storeStrong((id *)&self->_maxFramingDistance, 0);
  v12 = *(void **)&self->_currentStyleName.__r_.var0;
  if (v12)
  {
    self->_currentStyleName.var0 = (int64_t)v12;
    operator delete(v12);
  }
  if (*((char *)&self->_currentStyleName.__r_.__value_.var0.__l + 23) < 0)
    operator delete(self->_currentStyleName.__r_.__value_.var0.__l.__data_);
  objc_storeStrong((id *)&self->_snapHeadingAnimation, 0);
  objc_storeStrong((id *)&self->_snapPitchAnimation, 0);
  objc_storeStrong((id *)&self->_transitionAnimation, 0);
  objc_storeStrong((id *)&self->_davinciGestureCameraController, 0);
  objc_storeStrong((id *)&self->_detachedGestureBehavior, 0);
  objc_storeStrong((id *)&self->_attachedGestureBehavior, 0);
  objc_destroyWeak((id *)&self->_gestureBehavior);
}

- (id).cxx_construct
{
  int64x2_t v3;
  BOOL *p_didNavCameraTransition;
  _OWORD *v5;
  _QWORD *v6;
  _valid *v7;
  _valid *v8;
  _valid *v9;
  _valid *v10;

  self->_puckCoordinate.longitude._value = 0.0;
  self->_puckCoordinate.altitude._value = 0.0;
  self->_puckCoordinate.latitude._value = 0.0;
  v3 = vdupq_n_s64(0xC00921FB54442D18);
  *(int64x2_t *)&self->_lastCalculatedCameraFrame._target.latitude._value = v3;
  *(_OWORD *)&self->_lastCalculatedCameraFrame._target.altitude._value = 0u;
  *(_OWORD *)&self->_lastCalculatedCameraFrame._pitch._value = 0u;
  self->_lastCalculatedCameraFrame._roll._value = 0.0;
  *(int64x2_t *)&self->_cameraFrame._target.latitude._value = v3;
  *(_OWORD *)&self->_cameraFrame._target.altitude._value = 0u;
  *(_OWORD *)&self->_cameraFrame._pitch._value = 0u;
  self->_cameraFrame._roll._value = 0.0;
  self->_pitchSpring._velocity = 0.0;
  self->_pitchSpring._restingPosition = 0.0;
  self->_pitchSpring._position = 0.0;
  *(_OWORD *)&self->_pitchSpring._kSpring = xmmword_19FFB4EE0;
  self->_headingSpring._velocity = 0.0;
  self->_headingSpring._restingPosition = 0.0;
  self->_headingSpring._position = 0.0;
  *(_OWORD *)&self->_headingSpring._kSpring = xmmword_19FFB4EE0;
  self->_distanceFromTargetSpring._velocity = 0.0;
  self->_distanceFromTargetSpring._restingPosition = 0.0;
  self->_distanceFromTargetSpring._position = 0.0;
  *(_OWORD *)&self->_distanceFromTargetSpring._kSpring = xmmword_19FFB4EE0;
  self->_screenPositionSpring._position = 0u;
  self->_screenPositionSpring._velocity = 0u;
  self->_screenPositionSpring._restingPosition = 0u;
  *(_OWORD *)&self->_screenPositionSpring._kSpring = xmmword_19FFB4EE0;
  *(int64x2_t *)&self->_transitionFrame._target.latitude._value = v3;
  *(_OWORD *)&self->_transitionFrame._target.altitude._value = 0u;
  *(_OWORD *)&self->_transitionFrame._pitch._value = 0u;
  self->_transitionFrame._roll._value = 0.0;
  *(_OWORD *)&self->_currentStyleName.__r_.__value_.var0.__l.__size_ = 0uLL;
  self->_currentStyleName.__r_.__value_.var0.__l.__data_ = 0;
  self->_currentStyleName.var0 = 0;
  self->_coordinatesToFrame.__begin_ = 0;
  *(_QWORD *)&self->_currentStyleName.__r_.var0 = 0;
  self->_locationCoordinate.latitude = -0.0078125;
  *(_QWORD *)&self->_frameAllGroupedManeuvers = 0;
  self->_routeFocusCoordinate.latitude._value = 0.0;
  self->_routeCoordinate = 0;
  self->_desiredZoomScale = 0.0;
  *(_QWORD *)&self->_animationTime = 0;
  *(_OWORD *)&self->_depthNear = 0u;
  *(_OWORD *)&self->_cornerCoordinates[0].latitude._value = 0u;
  *(_OWORD *)&self->_cornerCoordinates[0].altitude._value = 0u;
  *(_OWORD *)&self->_cornerCoordinates[1].longitude._value = 0u;
  *(_OWORD *)&self->_cornerCoordinates[2].latitude._value = 0u;
  *(_OWORD *)&self->_cornerCoordinates[2].altitude._value = 0u;
  *(_OWORD *)&self->_cornerCoordinates[3].longitude._value = 0u;
  *(_OWORD *)&self->_pixelSamples._min = 0u;
  LOBYTE(self->_pixelSamples._avg) = 0;
  *(_OWORD *)&self->_pixelSamples._samples.__elems_[58] = 0u;
  *(_OWORD *)&self->_requesteDisplayRateSampler._min = 0u;
  self->_requesteDisplayRateSampler._avg = 0.0;
  *(_QWORD *)&self->_isElevatedRoute = 0;
  self->_labelMetrics.__ptr_.__value_ = 0;
  self->_pixelChangeFrameRate.__begin_ = 0;
  self->_cameraManager = 0;
  self->_lastProjectedPosition._e[2] = 0.0;
  self->_farClipPlaneFactor = 0.0;
  p_didNavCameraTransition = &self->_didNavCameraTransition;
  v5 = (_OWORD *)MEMORY[0x1E0D264E0];
  *(_OWORD *)&self->_didNavCameraTransition = *MEMORY[0x1E0D264E0];
  self->_showConsole._key.key.metadata = 0;
  v6 = operator new(0x20uLL);
  v6[1] = 0;
  v6[2] = 0;
  *v6 = &off_1E428A338;
  *((_QWORD *)p_didNavCameraTransition + 5) = v6;
  *((_BYTE *)v6 + 24) = 1;
  *((_QWORD *)p_didNavCameraTransition + 4) = v6 + 3;
  *((_QWORD *)p_didNavCameraTransition + 9) = 0;
  *(_OWORD *)&self->_showConsole._delegate.__f_.__buf_.__lx[16] = *v5;
  self->_showOverlay._key.key.metadata = 0;
  v7 = (_valid *)operator new(0x20uLL);
  *((_QWORD *)v7 + 1) = 0;
  *((_QWORD *)v7 + 2) = 0;
  *(_QWORD *)v7 = &off_1E428A338;
  self->_showOverlay._listener = v7;
  *((_BYTE *)v7 + 24) = 1;
  *(_QWORD *)&self->_showOverlay._value = (char *)v7 + 24;
  *(_QWORD *)&self->_showOverlay._delegate.__f_.__buf_.__lx[8] = 0;
  *(_OWORD *)&self->_showOverlay._delegate.__f_.__buf_.__lx[16] = *v5;
  self->_showAttributes._key.key.metadata = 0;
  v8 = (_valid *)operator new(0x20uLL);
  *((_QWORD *)v8 + 1) = 0;
  *((_QWORD *)v8 + 2) = 0;
  *(_QWORD *)v8 = &off_1E428A338;
  self->_showAttributes._listener = v8;
  *((_BYTE *)v8 + 24) = 1;
  *(_QWORD *)&self->_showAttributes._value = (char *)v8 + 24;
  *(_QWORD *)&self->_showAttributes._delegate.__f_.__buf_.__lx[8] = 0;
  *(_OWORD *)&self->_showAttributes._delegate.__f_.__buf_.__lx[16] = *v5;
  self->_showProperties._key.key.metadata = 0;
  v9 = (_valid *)operator new(0x20uLL);
  *((_QWORD *)v9 + 1) = 0;
  *((_QWORD *)v9 + 2) = 0;
  *(_QWORD *)v9 = &off_1E428A338;
  self->_showProperties._listener = v9;
  *((_BYTE *)v9 + 24) = 1;
  *(_QWORD *)&self->_showProperties._value = (char *)v9 + 24;
  *(_QWORD *)&self->_showProperties._delegate.__f_.__buf_.__lx[8] = 0;
  *(_OWORD *)&self->_showProperties._delegate.__f_.__buf_.__lx[16] = *v5;
  self->_showLegend._key.key.metadata = 0;
  v10 = (_valid *)operator new(0x20uLL);
  *((_QWORD *)v10 + 1) = 0;
  *((_QWORD *)v10 + 2) = 0;
  *(_QWORD *)v10 = &off_1E428A338;
  self->_showLegend._listener = v10;
  *((_BYTE *)v10 + 24) = 1;
  *(_QWORD *)&self->_showLegend._value = (char *)v10 + 24;
  *(_QWORD *)&self->_showLegend._delegate.__f_.__buf_.__lx[8] = 0;
  return self;
}

void __42__VKNavCameraController_pitchTo_animated___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained;
  void *v5;
  double v6;
  double v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = *(double *)(a1 + 40);
    v7 = *(double *)(a1 + 48);
    objc_msgSend(WeakRetained, "camera");
    *(double *)(v10 + 40) = v6 + (v7 - v6) * a2;
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)())v11->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    objc_msgSend(v5, "_setNeedsUpdate");
  }

}

void __42__VKNavCameraController_pitchTo_animated___block_invoke_2(uint64_t a1, int a2)
{
  _QWORD *WeakRetained;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && a2)
  {
    v4 = (void *)WeakRetained[75];
    WeakRetained[75] = 0;
    v5 = WeakRetained;

    WeakRetained = v5;
  }

}

void __43__VKNavCameraController_rotateTo_animated___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained;
  void *v5;
  double v6;
  double v7;
  long double v8;
  long double v9;
  long double v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v7 = *(double *)(a1 + 40);
    v6 = *(double *)(a1 + 48);
    objc_msgSend(WeakRetained, "camera");
    v8 = fmod(3.14159265 - v7 + v6, 6.28318531);
    v9 = fmod(v8 + 6.28318531, 6.28318531);
    v10 = fmod(v7 + (v9 + -3.14159265) * a2, 6.28318531);
    *(long double *)(v13 + 48) = fmod(v10 + 6.28318531, 6.28318531);
    if (v14)
    {
      p_shared_owners = (unint64_t *)&v14->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)())v14->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    objc_msgSend(v5, "_setNeedsUpdate");
  }

}

void __43__VKNavCameraController_rotateTo_animated___block_invoke_2(uint64_t a1, int a2)
{
  _QWORD *WeakRetained;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && a2)
  {
    v4 = (void *)WeakRetained[76];
    WeakRetained[76] = 0;
    v5 = WeakRetained;

    WeakRetained = v5;
  }

}

void __37__VKNavCameraController__snapHeading__block_invoke(uint64_t a1, float a2)
{
  double v4;
  long double v5;
  long double v6;
  long double v7;
  long double v8;
  long double *WeakRetained;

  WeakRetained = (long double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = *(double *)(a1 + 40);
    v5 = fmod(3.14159265 - v4, 6.28318531);
    v6 = fmod(v5 + 6.28318531, 6.28318531);
    v7 = fmod(v4 + (v6 + -3.14159265) * a2, 6.28318531);
    v8 = fmod(v7 + 6.28318531, 6.28318531);
    WeakRetained[46] = v8;
    WeakRetained[44] = v8;
    WeakRetained[45] = 0.0;
    WeakRetained[36] = v8;
    objc_msgSend(WeakRetained, "_setNeedsUpdate");
  }

}

void __37__VKNavCameraController__snapHeading__block_invoke_2(uint64_t a1, int a2)
{
  _QWORD *WeakRetained;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && a2)
  {
    v4 = (void *)WeakRetained[76];
    WeakRetained[76] = 0;
    v5 = WeakRetained;

    WeakRetained = v5;
  }

}

void __35__VKNavCameraController__snapPitch__block_invoke(uint64_t a1, float a2)
{
  double v4;
  double *WeakRetained;

  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = *(double *)(a1 + 40) + (*(double *)(a1 + 48) - *(double *)(a1 + 40)) * a2;
    WeakRetained[41] = v4;
    WeakRetained[39] = v4;
    WeakRetained[40] = 0.0;
    WeakRetained[35] = v4;
    objc_msgSend(WeakRetained, "_setNeedsUpdate");
  }

}

void __35__VKNavCameraController__snapPitch__block_invoke_2(uint64_t a1, int a2)
{
  _QWORD *WeakRetained;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && a2)
  {
    v4 = (void *)WeakRetained[75];
    WeakRetained[75] = 0;
    v5 = WeakRetained;

    WeakRetained = v5;
  }

}

void __64__VKNavCameraController__addAdditionalRoutePointsToFrameToList___block_invoke(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  id v6;
  int v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  BOOL v29;
  unint64_t v31;
  const double *v32;
  double *v33;
  uint64_t v34;
  _OWORD v36[2];
  float64x2x3_t v37;

  v6 = a2;
  if (objc_msgSend(v6, "pointCount"))
  {
    v7 = objc_msgSend(v6, "pointCount");
    if (*MEMORY[0x1E0D26A38] == (_DWORD)a3
      && fabsf(*((float *)&a3 + 1) - *(float *)(MEMORY[0x1E0D26A38] + 4)) < 0.00000011921)
    {
      LODWORD(a3) = 0;
    }
    if (*MEMORY[0x1E0D26A38] == (_DWORD)a4
      && fabsf(*((float *)&a4 + 1) - *(float *)(MEMORY[0x1E0D26A38] + 4)) < 0.00000011921)
    {
      LODWORD(a4) = v7 - 1;
    }
    if (a3 <= a4)
    {
      a3 = a3;
      while (1)
      {
        if (a3 >= objc_msgSend(v6, "pointCount"))
          goto LABEL_9;
        objc_msgSend(v6, "pointWithAltitudeCorrectionAtIndex:", a3);
        v9 = *(void **)(a1 + 32);
        v10 = *(_QWORD *)(a1 + 40);
        if (v9)
          objc_msgSend(v9, "_coordinateForGeoLocation:");
        else
          memset(v36, 0, 24);
        v12 = *(_QWORD *)(v10 + 8);
        v11 = *(_QWORD *)(v10 + 16);
        if (v12 >= v11)
          break;
        *(_QWORD *)v12 = *(_QWORD *)&v36[0];
        *(_OWORD *)(v12 + 8) = *(_OWORD *)((char *)v36 + 8);
        v8 = v12 + 24;
LABEL_12:
        *(_QWORD *)(v10 + 8) = v8;
        if (a4 < ++a3)
          goto LABEL_9;
      }
      v13 = *(void **)v10;
      v14 = v12 - *(_QWORD *)v10;
      v15 = 0xAAAAAAAAAAAAAAABLL * (v14 >> 3) + 1;
      if (v15 > 0xAAAAAAAAAAAAAAALL)
        abort();
      v16 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - (_QWORD)v13) >> 3);
      if (2 * v16 > v15)
        v15 = 2 * v16;
      if (v16 >= 0x555555555555555)
        v17 = 0xAAAAAAAAAAAAAAALL;
      else
        v17 = v15;
      if (v17 > 0xAAAAAAAAAAAAAAALL)
        std::__throw_bad_array_new_length[abi:nn180100]();
      v18 = (char *)operator new(24 * v17);
      v19 = &v18[8 * (v14 >> 3)];
      *(_OWORD *)v19 = v36[0];
      *((_QWORD *)v19 + 2) = *(_QWORD *)&v36[1];
      if ((void *)v12 == v13)
      {
        v21 = &v18[8 * (v14 >> 3)];
      }
      else
      {
        v20 = v12 - (_QWORD)v13 - 24;
        if (v20 >= 0x168)
        {
          v23 = v20 / 0x18;
          v24 = -24 * (v20 / 0x18) + v14;
          v25 = (unint64_t)&v18[v24 - 24];
          v26 = v12 - 24 * (v20 / 0x18) - 24;
          v27 = v12 - 8 - 24 * (v20 / 0x18);
          v29 = (unint64_t)&v18[v24 - 8] < v12 && v27 < (unint64_t)v19;
          v21 = &v18[8 * (v14 >> 3)];
          if ((v26 >= (unint64_t)&v18[v14 - 8] || v25 >= v12 - 8) && !v29)
          {
            v31 = v23 + 1;
            v32 = (const double *)(v12 - 48);
            v33 = (double *)(v19 - 48);
            v34 = v31 & 0x1FFFFFFFFFFFFFFELL;
            do
            {
              v37 = vld3q_f64(v32);
              vst3q_f64(v33, v37);
              v33 -= 6;
              v32 -= 6;
              v34 -= 2;
            }
            while (v34);
            v21 = &v19[-24 * (v31 & 0x1FFFFFFFFFFFFFFELL)];
            v12 -= 24 * (v31 & 0x1FFFFFFFFFFFFFFELL);
            if (v31 == (v31 & 0x1FFFFFFFFFFFFFFELL))
              goto LABEL_31;
          }
        }
        else
        {
          v21 = &v18[8 * (v14 >> 3)];
        }
        do
        {
          v22 = *(_QWORD *)(v12 - 24);
          v12 -= 24;
          *((_QWORD *)v21 - 3) = v22;
          v21 -= 24;
          *(_OWORD *)(v21 + 8) = *(_OWORD *)(v12 + 8);
        }
        while ((void *)v12 != v13);
      }
LABEL_31:
      v8 = (unint64_t)(v19 + 24);
      *(_QWORD *)v10 = v21;
      *(_QWORD *)(v10 + 8) = v19 + 24;
      *(_QWORD *)(v10 + 16) = &v18[24 * v17];
      if (v13)
        operator delete(v13);
      goto LABEL_12;
    }
  }
LABEL_9:

}

void __44__VKNavCameraController_updatePointsToFrame__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  BOOL v18;
  unint64_t v20;
  const double *v21;
  double *v22;
  uint64_t v23;
  uint64_t v24;
  _OWORD v25[2];
  float64x2x3_t v26;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    objc_msgSend(*(id *)(a1 + 32), "_coordinateForGeoLocation:");
  else
    memset(v25, 0, 24);
  v2 = v1 + 696;
  v4 = *(_QWORD *)(v1 + 704);
  v3 = *(_QWORD *)(v1 + 712);
  if (v4 >= v3)
  {
    v6 = *(void **)v2;
    v7 = v4 - *(_QWORD *)v2;
    v8 = 0xAAAAAAAAAAAAAAABLL * (v7 >> 3) + 1;
    if (v8 > 0xAAAAAAAAAAAAAAALL)
      abort();
    v9 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v3 - (_QWORD)v6) >> 3);
    if (2 * v9 > v8)
      v8 = 2 * v9;
    if (v9 >= 0x555555555555555)
      v10 = 0xAAAAAAAAAAAAAAALL;
    else
      v10 = v8;
    if (v10 > 0xAAAAAAAAAAAAAAALL)
      std::__throw_bad_array_new_length[abi:nn180100]();
    v11 = 24 * v10;
    v12 = (char *)operator new(24 * v10);
    v13 = (unint64_t)&v12[8 * (v7 >> 3)];
    v14 = &v12[v11];
    *(_OWORD *)v13 = v25[0];
    *(_QWORD *)(v13 + 16) = *(_QWORD *)&v25[1];
    v5 = v13 + 24;
    if ((void *)v4 != v6)
    {
      v15 = v4 - (_QWORD)v6 - 24;
      if (v15 < 0x1C8)
        goto LABEL_38;
      v16 = v15 / 0x18;
      v17 = (unint64_t)&v12[v7 - 8 - 24 * v16] >= v4 || v4 - 24 * v16 - 8 >= v13;
      v18 = !v17;
      if (v4 - 24 * v16 - 24 < (unint64_t)&v12[v7 - 8] && (unint64_t)&v12[v7 - 24 * v16 - 24] < v4 - 8)
        goto LABEL_38;
      if (v18)
        goto LABEL_38;
      v20 = v16 + 1;
      v21 = (const double *)(v4 - 48);
      v22 = (double *)(v13 - 48);
      v23 = v20 & 0x1FFFFFFFFFFFFFFELL;
      do
      {
        v26 = vld3q_f64(v21);
        vst3q_f64(v22, v26);
        v22 -= 6;
        v21 -= 6;
        v23 -= 2;
      }
      while (v23);
      v13 -= 24 * (v20 & 0x1FFFFFFFFFFFFFFELL);
      v4 -= 24 * (v20 & 0x1FFFFFFFFFFFFFFELL);
      if (v20 != (v20 & 0x1FFFFFFFFFFFFFFELL))
      {
LABEL_38:
        do
        {
          v24 = *(_QWORD *)(v4 - 24);
          v4 -= 24;
          *(_QWORD *)(v13 - 24) = v24;
          v13 -= 24;
          *(_OWORD *)(v13 + 8) = *(_OWORD *)(v4 + 8);
        }
        while ((void *)v4 != v6);
      }
    }
    *(_QWORD *)v2 = v13;
    *(_QWORD *)(v2 + 8) = v5;
    *(_QWORD *)(v2 + 16) = v14;
    if (v6)
      operator delete(v6);
  }
  else
  {
    *(_QWORD *)v4 = *(_QWORD *)&v25[0];
    *(_OWORD *)(v4 + 8) = *(_OWORD *)((char *)v25 + 8);
    v5 = v4 + 24;
  }
  *(_QWORD *)(v2 + 8) = v5;
}

void __44__VKNavCameraController_updatePointsToFrame__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  BOOL v18;
  unint64_t v20;
  const double *v21;
  double *v22;
  uint64_t v23;
  uint64_t v24;
  _OWORD v25[2];
  float64x2x3_t v26;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    objc_msgSend(*(id *)(a1 + 32), "_coordinateForGeoLocation:");
  else
    memset(v25, 0, 24);
  v2 = v1 + 696;
  v4 = *(_QWORD *)(v1 + 704);
  v3 = *(_QWORD *)(v1 + 712);
  if (v4 >= v3)
  {
    v6 = *(void **)v2;
    v7 = v4 - *(_QWORD *)v2;
    v8 = 0xAAAAAAAAAAAAAAABLL * (v7 >> 3) + 1;
    if (v8 > 0xAAAAAAAAAAAAAAALL)
      abort();
    v9 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v3 - (_QWORD)v6) >> 3);
    if (2 * v9 > v8)
      v8 = 2 * v9;
    if (v9 >= 0x555555555555555)
      v10 = 0xAAAAAAAAAAAAAAALL;
    else
      v10 = v8;
    if (v10 > 0xAAAAAAAAAAAAAAALL)
      std::__throw_bad_array_new_length[abi:nn180100]();
    v11 = 24 * v10;
    v12 = (char *)operator new(24 * v10);
    v13 = (unint64_t)&v12[8 * (v7 >> 3)];
    v14 = &v12[v11];
    *(_OWORD *)v13 = v25[0];
    *(_QWORD *)(v13 + 16) = *(_QWORD *)&v25[1];
    v5 = v13 + 24;
    if ((void *)v4 != v6)
    {
      v15 = v4 - (_QWORD)v6 - 24;
      if (v15 < 0x1C8)
        goto LABEL_38;
      v16 = v15 / 0x18;
      v17 = (unint64_t)&v12[v7 - 8 - 24 * v16] >= v4 || v4 - 24 * v16 - 8 >= v13;
      v18 = !v17;
      if (v4 - 24 * v16 - 24 < (unint64_t)&v12[v7 - 8] && (unint64_t)&v12[v7 - 24 * v16 - 24] < v4 - 8)
        goto LABEL_38;
      if (v18)
        goto LABEL_38;
      v20 = v16 + 1;
      v21 = (const double *)(v4 - 48);
      v22 = (double *)(v13 - 48);
      v23 = v20 & 0x1FFFFFFFFFFFFFFELL;
      do
      {
        v26 = vld3q_f64(v21);
        vst3q_f64(v22, v26);
        v22 -= 6;
        v21 -= 6;
        v23 -= 2;
      }
      while (v23);
      v13 -= 24 * (v20 & 0x1FFFFFFFFFFFFFFELL);
      v4 -= 24 * (v20 & 0x1FFFFFFFFFFFFFFELL);
      if (v20 != (v20 & 0x1FFFFFFFFFFFFFFELL))
      {
LABEL_38:
        do
        {
          v24 = *(_QWORD *)(v4 - 24);
          v4 -= 24;
          *(_QWORD *)(v13 - 24) = v24;
          v13 -= 24;
          *(_OWORD *)(v13 + 8) = *(_OWORD *)(v4 + 8);
        }
        while ((void *)v4 != v6);
      }
    }
    *(_QWORD *)v2 = v13;
    *(_QWORD *)(v2 + 8) = v5;
    *(_QWORD *)(v2 + 16) = v14;
    if (v6)
      operator delete(v6);
  }
  else
  {
    *(_QWORD *)v4 = *(_QWORD *)&v25[0];
    *(_OWORD *)(v4 + 8) = *(_OWORD *)((char *)v25 + 8);
    v5 = v4 + 24;
  }
  *(_QWORD *)(v2 + 8) = v5;
}

void __44__VKNavCameraController_updatePointsToFrame__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  BOOL v18;
  unint64_t v20;
  const double *v21;
  double *v22;
  uint64_t v23;
  uint64_t v24;
  _OWORD v25[2];
  float64x2x3_t v26;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    objc_msgSend(*(id *)(a1 + 32), "_coordinateForGeoLocation:");
  else
    memset(v25, 0, 24);
  v2 = v1 + 696;
  v4 = *(_QWORD *)(v1 + 704);
  v3 = *(_QWORD *)(v1 + 712);
  if (v4 >= v3)
  {
    v6 = *(void **)v2;
    v7 = v4 - *(_QWORD *)v2;
    v8 = 0xAAAAAAAAAAAAAAABLL * (v7 >> 3) + 1;
    if (v8 > 0xAAAAAAAAAAAAAAALL)
      abort();
    v9 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v3 - (_QWORD)v6) >> 3);
    if (2 * v9 > v8)
      v8 = 2 * v9;
    if (v9 >= 0x555555555555555)
      v10 = 0xAAAAAAAAAAAAAAALL;
    else
      v10 = v8;
    if (v10 > 0xAAAAAAAAAAAAAAALL)
      std::__throw_bad_array_new_length[abi:nn180100]();
    v11 = 24 * v10;
    v12 = (char *)operator new(24 * v10);
    v13 = (unint64_t)&v12[8 * (v7 >> 3)];
    v14 = &v12[v11];
    *(_OWORD *)v13 = v25[0];
    *(_QWORD *)(v13 + 16) = *(_QWORD *)&v25[1];
    v5 = v13 + 24;
    if ((void *)v4 != v6)
    {
      v15 = v4 - (_QWORD)v6 - 24;
      if (v15 < 0x1C8)
        goto LABEL_38;
      v16 = v15 / 0x18;
      v17 = (unint64_t)&v12[v7 - 8 - 24 * v16] >= v4 || v4 - 24 * v16 - 8 >= v13;
      v18 = !v17;
      if (v4 - 24 * v16 - 24 < (unint64_t)&v12[v7 - 8] && (unint64_t)&v12[v7 - 24 * v16 - 24] < v4 - 8)
        goto LABEL_38;
      if (v18)
        goto LABEL_38;
      v20 = v16 + 1;
      v21 = (const double *)(v4 - 48);
      v22 = (double *)(v13 - 48);
      v23 = v20 & 0x1FFFFFFFFFFFFFFELL;
      do
      {
        v26 = vld3q_f64(v21);
        vst3q_f64(v22, v26);
        v22 -= 6;
        v21 -= 6;
        v23 -= 2;
      }
      while (v23);
      v13 -= 24 * (v20 & 0x1FFFFFFFFFFFFFFELL);
      v4 -= 24 * (v20 & 0x1FFFFFFFFFFFFFFELL);
      if (v20 != (v20 & 0x1FFFFFFFFFFFFFFELL))
      {
LABEL_38:
        do
        {
          v24 = *(_QWORD *)(v4 - 24);
          v4 -= 24;
          *(_QWORD *)(v13 - 24) = v24;
          v13 -= 24;
          *(_OWORD *)(v13 + 8) = *(_OWORD *)(v4 + 8);
        }
        while ((void *)v4 != v6);
      }
    }
    *(_QWORD *)v2 = v13;
    *(_QWORD *)(v2 + 8) = v5;
    *(_QWORD *)(v2 + 16) = v14;
    if (v6)
      operator delete(v6);
  }
  else
  {
    *(_QWORD *)v4 = *(_QWORD *)&v25[0];
    *(_OWORD *)(v4 + 8) = *(_OWORD *)((char *)v25 + 8);
    v5 = v4 + 24;
  }
  *(_QWORD *)(v2 + 8) = v5;
}

- (void)_addWaypointToFraming:forRoute:
{
  JUMPOUT(0x1A1AF4E00);
}

- (__n128)_addWaypointToFraming:forRoute:
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E42C7D78;
  result = *(__n128 *)(a1 + 8);
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void __61__VKNavCameraController_returnToTrackingWithDelay_resetZoom___block_invoke(uint64_t a1, float a2)
{
  __int128 v4;
  double v5;
  double v6;
  uint64_t v7;
  long double v8;
  long double v9;
  long double v10;
  long double v11;
  double v12;
  float64x2_t v13;
  __int128 v14;
  char *WeakRetained;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = *(double *)(a1 + 72);
    v6 = *(double *)(a1 + 80);
    v7 = *(_QWORD *)(a1 + 88);
    *(double *)&v4 = a2;
    v14 = v4;
    v8 = fmod(3.14159265 - v6 + *((double *)WeakRetained + 29), 6.28318531);
    v9 = fmod(v8 + 6.28318531, 6.28318531);
    v10 = fmod(v6 + (v9 + -3.14159265) * *(double *)&v14, 6.28318531);
    v11 = fmod(v10 + 6.28318531, 6.28318531);
    v12 = v5 + (*((double *)WeakRetained + 28) - v5) * *(double *)&v14;
    v13 = vmlaq_n_f64(*(float64x2_t *)(a1 + 56), vsubq_f64(*((float64x2_t *)WeakRetained + 13), *(float64x2_t *)(a1 + 56)), *(double *)&v14);
    *(float64x2_t *)(WeakRetained + 616) = vmlaq_n_f64(*(float64x2_t *)(a1 + 40), vsubq_f64(*((float64x2_t *)WeakRetained + 12), *(float64x2_t *)(a1 + 40)), *(double *)&v14);
    *(float64x2_t *)(WeakRetained + 632) = v13;
    *((double *)WeakRetained + 81) = v12;
    *((long double *)WeakRetained + 82) = v11;
    *((_QWORD *)WeakRetained + 83) = v7;
    if (*(_BYTE *)(a1 + 104))
      objc_msgSend(WeakRetained, "setZoomScale:", *(double *)(a1 + 96) + (1.0 - *(double *)(a1 + 96)) * *(double *)&v14);
    objc_msgSend(WeakRetained, "_setNeedsUpdate", v14);
  }

}

void __61__VKNavCameraController_returnToTrackingWithDelay_resetZoom___block_invoke_26(uint64_t a1, int a2)
{
  _QWORD *WeakRetained;
  _QWORD *v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_updateObserverCouldZoomIn:couldZoomOut:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
    if (GEOGetVectorKitVKNavCameraLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKNavCameraLog_onceToken, &__block_literal_global_31);
    v6 = (id)GEOGetVectorKitVKNavCameraLog_log;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = "N";
      if (a2)
        v7 = "Y";
      v9 = 136315138;
      v10 = v7;
      _os_log_impl(&dword_19F029000, v6, OS_LOG_TYPE_INFO, "transition animation completed: %s", (uint8_t *)&v9, 0xCu);
    }

    if (a2)
    {
      objc_msgSend(v5, "_setDetached:", 0);
      objc_msgSend(v5, "_setNavCameraTransitionComplete:", 1);
      v8 = (void *)v5[74];
      v5[74] = 0;

      objc_msgSend(v5, "_snapPitch");
      objc_msgSend(v5, "_snapHeading");
    }
  }

}

uint64_t __61__VKNavCameraController_returnToTrackingWithDelay_resetZoom___block_invoke_27(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6[16];

  if (*(_QWORD *)(result + 32) == *(_QWORD *)(*(_QWORD *)(result + 40) + 592))
  {
    v1 = result;
    if (GEOGetVectorKitVKNavCameraLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKNavCameraLog_onceToken, &__block_literal_global_31);
    v2 = (id)GEOGetVectorKitVKNavCameraLog_log;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_19F029000, v2, OS_LOG_TYPE_INFO, "Returning to tracking", v6, 2u);
    }

    objc_msgSend(*(id *)(v1 + 40), "_setDetached:", 0);
    objc_msgSend(*(id *)(v1 + 40), "_setNavCameraTransitionComplete:", 0);
    objc_msgSend(*(id *)(v1 + 40), "beginRegionChange:", 1);
    md::AnimationRunner::runAnimation((md::MapEngine **)objc_msgSend(*(id *)(v1 + 40), "animationRunner"), *(VKAnimation **)(*(_QWORD *)(v1 + 40) + 592));
    objc_msgSend(*(id *)(v1 + 40), "endRegionChange");
    v3 = (uint64_t *)objc_msgSend(*(id *)(v1 + 40), "runLoopController");
    v4 = objc_msgSend(*(id *)(v1 + 40), "maxDisplayRate");
    v3[1] = v4;
    v5 = *v3;
    if (*v3)
    {
      if (!**(_BYTE **)(v5 + 1056))
        md::MapEngine::setDisplayRate(v5, v4);
    }
    return objc_msgSend(*(id *)(v1 + 40), "stopIgnoreStyleChange");
  }
  return result;
}

void __79__VKNavCameraController_animateCameraWithDuration_fromFrame_completionHandler___block_invoke(uint64_t a1, float a2)
{
  double *WeakRetained;
  double *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  double v12;
  long double v13;
  long double v14;
  long double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if (vabdd_f64(1.0, v6) > 0.00001)
    {
      objc_msgSend(WeakRetained, "restingCameraFrame");
      v7 = (a2 - v6) / (1.0 - v6);
      v8 = v5[78];
      v5[77] = v5[77] + (v16 - v5[77]) * v7;
      v5[78] = v8 + (v17 - v8) * v7;
      v9 = v5[80];
      v5[79] = v5[79] + (v18 - v5[79]) * v7;
      v5[80] = v9 + (v19 - v9) * v7;
      v10 = v5[82];
      v11 = v7;
      v12 = v11;
      v13 = fmod(3.14159265 - v10 + v21, 6.28318531);
      v14 = fmod(v13 + 6.28318531, 6.28318531);
      v15 = fmod(v10 + (v14 + -3.14159265) * v12, 6.28318531);
      v5[82] = fmod(v15 + 6.28318531, 6.28318531);
      v5[81] = v5[81] + (v20 - v5[81]) * v7;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
      objc_msgSend(v5, "resetSpringsToResting");
      objc_msgSend(v5, "_setNeedsUpdate");
    }
  }

}

void __79__VKNavCameraController_animateCameraWithDuration_fromFrame_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD *WeakRetained;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[80];
    WeakRetained[51] = v6;
    WeakRetained[49] = v6;
    WeakRetained[50] = 0;
    v7 = WeakRetained[81];
    WeakRetained[41] = v7;
    WeakRetained[39] = v7;
    WeakRetained[40] = 0;
    v8 = WeakRetained[82];
    WeakRetained[46] = v8;
    WeakRetained[44] = v8;
    WeakRetained[45] = 0;
    objc_msgSend(WeakRetained, "_setNeedsUpdate");
    if (GEOGetVectorKitVKNavCameraLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKNavCameraLog_onceToken, &__block_literal_global_31);
    v9 = (id)GEOGetVectorKitVKNavCameraLog_log;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = "N";
      if ((_DWORD)a2)
        v10 = "Y";
      v13 = 136315138;
      v14 = v10;
      _os_log_impl(&dword_19F029000, v9, OS_LOG_TYPE_INFO, "transition animation completed: %s", (uint8_t *)&v13, 0xCu);
    }

    if ((_DWORD)a2)
    {
      v11 = (void *)v5[74];
      v5[74] = 0;

      objc_msgSend(v5, "_setNavCameraTransitionComplete:", 1);
      objc_msgSend(v5, "_snapPitch");
      objc_msgSend(v5, "_snapHeading");
    }
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, a2);
  }

}

uint64_t __63__VKNavCameraController_zoom_withFocusPoint_completionHandler___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "returnToTrackingWithDelay:resetZoom:", 0, *(float *)(*(_QWORD *)(a1 + 32) + 956));
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[584])
  {
    objc_msgSend(v2, "snapMapIfNecessary:", 1);
    result = *(_QWORD *)(a1 + 40);
    if (!result)
      return result;
    return (*(uint64_t (**)(void))(result + 16))();
  }
  objc_msgSend(v2, "_snapPitch");
  objc_msgSend(*(id *)(a1 + 32), "_snapHeading");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __115__VKNavCameraController_initWithTaskContext_device_mapDataAccess_animationRunner_runLoopController_cameraDelegate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "doubleValue");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v8);

}

uint64_t __115__VKNavCameraController_initWithTaskContext_device_mapDataAccess_animationRunner_runLoopController_cameraDelegate___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

@end
