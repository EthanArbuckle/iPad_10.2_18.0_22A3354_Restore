@implementation VKMuninCameraController

- (VKMuninCameraController)initWithTaskContext:(shared_ptr<md:(void *)a4 :(AnimationRunner *)a5 TaskContext>)a3 mapDataAccess:(RunLoopController *)a6 animationRunner:(id)a7 runLoopController:(void *)a8 cameraDelegate:(void *)a9 muninSceneLogic:elevationLogic:
{
  TaskContext *ptr;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  objc_super v23;

  ptr = a3.__ptr_;
  v23.receiver = self;
  v23.super_class = (Class)VKMuninCameraController;
  v11 = -[VKCameraController initWithMapDataAccess:animationRunner:runLoopController:cameraDelegate:](&v23, sel_initWithMapDataAccess_animationRunner_runLoopController_cameraDelegate_, a3.__cntrl_, a4, a5, a6);
  v12 = v11;
  if (v11)
  {
    *((_QWORD *)v11 + 17) = a7;
    *((_QWORD *)v11 + 18) = a8;
    v14 = *(_QWORD *)ptr;
    v13 = *((_QWORD *)ptr + 1);
    if (v13)
    {
      v15 = (unint64_t *)(v13 + 8);
      do
        v16 = __ldxr(v15);
      while (__stxr(v16 + 1, v15));
    }
    v17 = (std::__shared_weak_count *)*((_QWORD *)v11 + 20);
    *((_QWORD *)v11 + 19) = v14;
    *((_QWORD *)v11 + 20) = v13;
    if (v17)
    {
      p_shared_owners = (unint64_t *)&v17->__shared_owners_;
      do
        v19 = __ldaxr(p_shared_owners);
      while (__stlxr(v19 - 1, p_shared_owners));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    v12[4248] = 0;
    v12[4249] = 0;
    v12[4296] = 0;
    *((_DWORD *)v12 + 1087) = 0;
    *((_QWORD *)v12 + 547) = 0;
    v12[4440] = 1;
    v20 = *(_QWORD *)(*((_QWORD *)v12 + 17) + 720);
    *((_QWORD *)v12 + 556) = v20;
    *((_QWORD *)v12 + 539) = v20;
    v12[4344] = 1;
    *(_QWORD *)(v12 + 4260) = 0;
    *((_QWORD *)v12 + 567) = 0;
    v12[4576] = 7;
    v21 = v12;
  }

  return (VKMuninCameraController *)v12;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 19) = 0;
  *((_QWORD *)self + 20) = 0;
  *((_BYTE *)self + 168) = 0;
  *((_QWORD *)self + 520) = 0;
  *((_QWORD *)self + 521) = 0;
  *((_QWORD *)self + 522) = 850045863;
  *(_OWORD *)((char *)self + 4184) = 0u;
  *(_OWORD *)((char *)self + 4200) = 0u;
  *(_OWORD *)((char *)self + 4216) = 0u;
  *((_QWORD *)self + 529) = 0;
  *((_QWORD *)self + 530) = 0;
  *((_QWORD *)self + 534) = &off_1E42B4C90;
  *((_QWORD *)self + 535) = 0;
  *((_QWORD *)self + 540) = &off_1E42B4C90;
  *((_QWORD *)self + 541) = 0;
  *((_QWORD *)self + 544) = &off_1E42B4C90;
  *((_QWORD *)self + 545) = 0;
  *((_QWORD *)self + 549) = 0;
  *((_QWORD *)self + 550) = 0;
  *((_QWORD *)self + 548) = 0;
  *(_OWORD *)((char *)self + 4408) = xmmword_19FFB4EE0;
  *((_QWORD *)self + 558) = 0;
  *((_QWORD *)self + 559) = 0;
  *((_QWORD *)self + 557) = 0;
  *((int64x2_t *)self + 280) = vdupq_n_s64(0xC00921FB54442D18);
  *((_OWORD *)self + 281) = 0u;
  *((_OWORD *)self + 282) = 0u;
  *((_QWORD *)self + 566) = 0;
  *((_QWORD *)self + 568) = 0;
  *((_QWORD *)self + 569) = 0;
  *((_QWORD *)self + 570) = 0;
  *((_QWORD *)self + 571) = 0;
  return self;
}

- (void)updateWithTimestamp:(double)a3 withContext:(void *)a4
{
  char *v4;
  md::LayoutContext *v5;
  md::LayoutContext *v6;
  double v7;
  char *v8;
  float32x2_t *v9;
  float64x2_t v10;
  float32x2_t v11;
  float64x2_t v12;
  float32x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v20;
  float64x2_t v21;
  float v22;
  uint64_t v23;
  int v24;
  double v25;
  double v26;
  __double2 v27;
  double v28;
  double v29;
  __double2 v30;
  double v31;
  double v32;
  float v33;
  float v34;
  float v35;
  __float2 v36;
  uint64_t v37;
  void *v38;
  double v39;
  double v40;
  uint64_t v41;
  double v42;
  double v43;
  uint64_t v44;
  double v46;
  double v47;
  float v48;
  unsigned __int8 *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  long double v59;
  double v60;
  uint64_t v61;
  geo::read_write_lock *v62;
  const char *v63;
  _QWORD *v64;
  float64x2_t v65;
  long double v66;
  long double v67;
  long double v68;
  long double v69;
  long double v70;
  long double v71;
  long double v72;
  double v73;
  long double v74;
  long double v75;
  double v76;
  double v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  BOOL v83;
  _QWORD *v84;
  _QWORD *v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  double v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  unint64_t v96;
  unint64_t v97;
  uint64_t *v98;
  uint64_t *v99;
  uint64_t *v100;
  float v101;
  double v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  uint64_t *v107;
  unint64_t v108;
  uint64_t *v109;
  uint64_t *v110;
  float v111;
  double v112;
  unsigned __int16 *v113;
  unint64_t v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t *v119;
  unint64_t v120;
  uint64_t *v121;
  uint64_t *v122;
  float v123;
  double v124;
  __int128 v125;
  uint64_t v126;
  __int128 v127;
  uint64_t v128;
  _QWORD *v129;
  _QWORD *v130;
  void *v131;
  float64x2_t v132;
  double v133;
  _QWORD *v134;
  _QWORD *v135;
  void *v136;
  geo::read_write_lock *v137;
  const char *v138;
  long double v139;
  long double v140;
  double v141;
  double v142;
  double v143;
  long double v144;
  __double2 v145;
  double v146;
  __double2 v147;
  uint64_t v148;
  _QWORD *v149;
  _QWORD *v150;
  void *v151;
  const gdc::LayerDataRequestKey *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  unsigned __int8 *v158;
  unint64_t v159;
  unint64_t v160;
  unsigned int v161;
  _QWORD *v162;
  std::__shared_weak_count *v163;
  unint64_t *v164;
  unint64_t v165;
  unint64_t v166;
  uint64_t v167;
  uint64_t v168;
  unint64_t v169;
  float v170;
  uint64_t v171;
  float v172;
  unint64_t *p_shared_owners;
  unint64_t v174;
  float v175;
  void *v176;
  float v177;
  float v178;
  void *v179;
  void *v180;
  int v181;
  int v182;
  float v183;
  float v184;
  float v185;
  float v186;
  float v187;
  float v188;
  float v189;
  float v190;
  float v191;
  float v192;
  float v193;
  float v194;
  float v195;
  double v196;
  void *v197;
  float v198;
  float v199;
  uint64_t v200;
  void *v201;
  float v202;
  float v203;
  float v204;
  uint64_t v205;
  void *v206;
  float v207;
  float v208;
  void *v209;
  char v210;
  float v211;
  float v212;
  uint64_t v213;
  float v214;
  float v215;
  float v216;
  float v217;
  float v218;
  float v219;
  float v220;
  float v221;
  float v222;
  float v223;
  float v224;
  float v225;
  float v226;
  float v227;
  double *v228;
  void *v229;
  double v230;
  double v231;
  uint64_t v232;
  _BOOL4 v233;
  double v234;
  double *v235;
  double v236;
  double v237;
  void *v238;
  double v239;
  double v240;
  uint64_t v241;
  double v242;
  double v243;
  uint64_t v244;
  uint64_t v245;
  double v246;
  double v247;
  long double v248;
  __double2 v249;
  double v250;
  __double2 v251;
  uint64_t v252;
  double v253;
  void *v254;
  int v255;
  double *v256;
  float64x2_t v257;
  md::LayoutContext *v258;
  double v259;
  double v260;
  double v261;
  double v262;
  _QWORD v263[5];
  _QWORD v264[2];
  uint64_t v265;
  __int128 v266;
  uint64_t v267;
  uint64_t v268;
  int v269;
  uint64_t v270;
  __int128 v271;
  __int128 v272;
  _BYTE *v273;
  _BYTE *v274;
  _BYTE *v275;
  uint64_t v276;
  _BYTE v277[1728];
  _QWORD v278[2];
  void *v279;
  long double *v280;
  long double *v281;
  uint64_t v282;
  long double v283[4];
  unint64_t v284;
  void *v285;
  _QWORD *v286;
  _QWORD *v287;
  uint64_t v288;
  char v289[8];
  void *v290;
  void *v291;
  float64x2_t v292;
  void *v293;
  _QWORD *v294;
  _QWORD *v295;
  uint64_t v296;

  v4 = (char *)MEMORY[0x1E0C80A78](self);
  v6 = v5;
  v259 = v7;
  v8 = v4;
  v296 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)(*(_QWORD *)(objc_msgSend(v4, "mapDataAccess") + 16) + 464) = xmmword_19FFB4EC0;
  v258 = v6;
  md::LayoutContext::frameState(v6);
  *(float32x2_t *)&v10.f64[0] = v9[63];
  v11 = (float32x2_t)0x3F0000003F000000;
  if (v10.f64[0] > 0.0 && *(double *)&v9[62] > 0.0)
  {
    *(float32x2_t *)&v10.f64[1] = v9[62];
    v12 = vaddq_f64(v10, v10);
    v13 = vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(v9[70]), v12));
    v14 = vcvtq_f64_f32(vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(v9[71]), v12)));
    v15 = vcvtq_f64_f32(v13);
    __asm { FMOV            V2.2D, #0.5 }
    v20 = vsubq_f64(_Q2, v15);
    v21 = vaddq_f64(v15, _Q2);
    *(_QWORD *)&_Q2.f64[0] = *(_OWORD *)&vaddq_f64(v20, v14);
    _Q2.f64[1] = vsubq_f64(v21, v14).f64[1];
    v11 = vcvt_f32_f64(_Q2);
  }
  v22 = v11.f32[0] + -0.5;
  *(float *)(*(_QWORD *)(objc_msgSend(v8, "mapDataAccess") + 16) + 488) = v11.f32[1] + -0.5;
  *(float *)(*(_QWORD *)(objc_msgSend(v8, "mapDataAccess") + 16) + 492) = v22;
  v23 = *((_QWORD *)v8 + 18);
  if (v23)
    *(_DWORD *)(v23 + 288) = 0;
  if (v8[168])
  {
    v24 = 1;
  }
  else
  {
    v56 = *((_QWORD *)v8 + 17);
    v57 = *(_QWORD *)(v56 + 152);
    if (*(_BYTE *)(v57 + 88))
    {
      if (*(_BYTE *)(v57 + 89))
      {
        v58 = *((double *)v8 + 558);
        v256 = (double *)(v8 + 4456);
        v59 = tan(*((double *)v8 + 557) * 0.5 + 0.785398163);
        v60 = log(v59);
        v61 = *(_QWORD *)(v56 + 168);
        v264[1] = v61 + 96;
        v62 = (geo::read_write_lock *)pthread_rwlock_rdlock((pthread_rwlock_t *)(v61 + 96));
        if ((_DWORD)v62)
          geo::read_write_lock::logFailure(v62, (uint64_t)"read lock", v63);
        LOBYTE(v279) = 0;
        v64 = *(_QWORD **)(v61 + 48);
        if (v64 != (_QWORD *)(v61 + 56))
        {
          v65.f64[0] = v58 * 0.159154943 + 0.5;
          v262 = v65.f64[0];
          v65.f64[1] = v60 * 0.159154943 + 0.5;
          v257 = v65;
          v260 = v65.f64[1];
          v66 = exp(v65.f64[1] * 6.28318531 + -3.14159265);
          v67 = atan(v66) * 114.591559 + -90.0;
          v68 = cos(v67 * 0.034906585) * -559.82 + 111132.92;
          v69 = v68 + cos(v67 * 0.0698131701) * 1.175;
          v70 = v69 + cos(v67 * 0.104719755) * -0.0023;
          v71 = v67 * 0.00872664626;
          v72 = tan(v67 * 0.00872664626 + 0.78103484);
          v73 = log(v72);
          v74 = tan(v71 + 0.789761487);
          v75 = fabs((log(v74) - v73) * 0.159154943) * 20.0 / v70;
          v76 = v75 * v75;
          v77 = 1.79769313e308;
          do
          {
            v78 = v64[4];
            v79 = md::mun::MuninMetadata::_searchBounds(v78, v262, v260, 20.0);
            v81 = HIDWORD(v79);
            v82 = HIDWORD(v80);
            v83 = SHIDWORD(v79) <= SHIDWORD(v80) && (int)v79 <= (int)v80;
            if (v83)
            {
              v86 = 0;
              v87 = v78 + 344;
              v88 = (int)v79;
              v89 = v80 + 1;
              v90 = 1.79769313e308;
              do
              {
                v91 = 10 * (int)v81;
                v92 = v88;
                v93 = v88;
                if ((_DWORD)v81 == 9)
                {
                  do
                  {
                    v94 = *(unsigned __int16 *)(v87 + 2 * (v91 + v93));
                    if (v93 == 9)
                    {
                      v95 = *(_QWORD *)(v78 + 320);
                      v96 = (*(_QWORD *)(v78 + 328) - v95) >> 3;
                      v83 = v96 > v94;
                      v97 = v96 - v94;
                      if (v83)
                      {
                        v98 = (uint64_t *)(v95 + 8 * v94);
                        do
                        {
                          v100 = (uint64_t *)*v98++;
                          v99 = v100;
                          v101 = (*((double *)v100 + 7) - v262) * (*((double *)v100 + 7) - v262)
                               + (*((double *)v100 + 8) - v260) * (*((double *)v100 + 8) - v260);
                          v102 = v101;
                          if (v76 >= v102 && v90 > v102)
                          {
                            v90 = v102;
                            v86 = v99;
                          }
                          --v97;
                        }
                        while (v97);
                      }
                    }
                    else
                    {
                      v103 = *(unsigned __int16 *)(v87 + 2 * (v91 + v93) + 2);
                      if (v94 < v103)
                      {
                        v104 = *(_QWORD *)(v78 + 320);
                        v105 = (*(_QWORD *)(v78 + 328) - v104) >> 3;
                        v106 = v103 - v94;
                        v107 = (uint64_t *)(v104 + 8 * v94);
                        _CF = v105 >= v94;
                        v108 = v105 - v94;
                        if (!_CF)
                          v108 = 0;
                        do
                        {
                          if (!v108)
                            break;
                          v110 = (uint64_t *)*v107++;
                          v109 = v110;
                          v111 = (*((double *)v110 + 7) - v262) * (*((double *)v110 + 7) - v262)
                               + (*((double *)v110 + 8) - v260) * (*((double *)v110 + 8) - v260);
                          v112 = v111;
                          if (v76 >= v112 && v90 > v112)
                          {
                            v90 = v112;
                            v86 = v109;
                          }
                          --v108;
                          --v106;
                        }
                        while (v106);
                      }
                    }
                    ++v93;
                  }
                  while (v89 != (_DWORD)v93);
                }
                else
                {
                  do
                  {
                    v113 = (unsigned __int16 *)(v87 + 2 * (v91 + v92));
                    v114 = *v113;
                    v115 = v113[1];
                    if (v114 < v115)
                    {
                      v116 = *(_QWORD *)(v78 + 320);
                      v117 = (*(_QWORD *)(v78 + 328) - v116) >> 3;
                      v118 = v115 - v114;
                      v119 = (uint64_t *)(v116 + 8 * v114);
                      _CF = v117 >= v114;
                      v120 = v117 - v114;
                      if (!_CF)
                        v120 = 0;
                      do
                      {
                        if (!v120)
                          break;
                        v122 = (uint64_t *)*v119++;
                        v121 = v122;
                        v123 = (*((double *)v122 + 7) - v262) * (*((double *)v122 + 7) - v262)
                             + (*((double *)v122 + 8) - v260) * (*((double *)v122 + 8) - v260);
                        v124 = v123;
                        if (v76 >= v124 && v90 > v124)
                        {
                          v90 = v124;
                          v86 = v121;
                        }
                        --v120;
                        --v118;
                      }
                      while (v118);
                    }
                    ++v92;
                  }
                  while (v89 != (_DWORD)v92);
                }
                LODWORD(v81) = v81 + 1;
              }
              while ((int)v81 <= (int)v82);
              if (v86)
              {
                v265 = *v86;
                v125 = *(_OWORD *)(v86 + 1);
                v126 = v86[4];
                v267 = v86[3];
                v266 = v125;
                v269 = *((_DWORD *)v86 + 10);
                v268 = v126;
                v270 = *(uint64_t *)((char *)v86 + 44);
                v127 = *(_OWORD *)(v86 + 9);
                v271 = *(_OWORD *)(v86 + 7);
                v272 = v127;
                v273 = v277;
                v274 = v277;
                v275 = v277;
                v276 = 6;
                geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)&v273, (__int128 *)v86[11], (__int128 *)v86[12]);
                v128 = v86[231];
                *(_QWORD *)((char *)v278 + 5) = *(uint64_t *)((char *)v86 + 1853);
                v278[0] = v128;
                geo::optional<md::mun::CollectionPoint>::optional((uint64_t)&v288, (uint64_t)&v265);
                v129 = v273;
                v130 = v274;
                if (v273 != v274)
                {
                  do
                  {
                    v131 = (void *)v129[31];
                    if (v131 != (void *)v129[33])
                      free(v131);
                    v129 += 36;
                  }
                  while (v129 != v130);
                  v129 = v273;
                }
                if (v129 != (_QWORD *)v275)
                  free(v129);
                if ((_BYTE)v288)
                {
                  v132 = vsubq_f64(v292, v257);
                  v133 = vaddvq_f64(vmulq_f64(v132, v132));
                  if (v133 >= v77
                    || (geo::optional<md::mun::CollectionPoint>::operator=((uint64_t)&v279, (uint64_t)&v288),
                        v77 = v133,
                        (_BYTE)v288))
                  {
                    v134 = v293;
                    v135 = v294;
                    if (v293 != v294)
                    {
                      do
                      {
                        v136 = (void *)v134[31];
                        if (v136 != (void *)v134[33])
                          free(v136);
                        v134 += 36;
                      }
                      while (v134 != v135);
                      v134 = v293;
                    }
                    if (v134 != v295)
                      free(v134);
                  }
                }
              }
            }
            v84 = (_QWORD *)v64[1];
            if (v84)
            {
              do
              {
                v85 = v84;
                v84 = (_QWORD *)*v84;
              }
              while (v84);
            }
            else
            {
              do
              {
                v85 = (_QWORD *)v64[2];
                _ZF = *v85 == (_QWORD)v64;
                v64 = v85;
              }
              while (!_ZF);
            }
            v64 = v85;
          }
          while (v85 != (_QWORD *)(v61 + 56));
        }
        v137 = (geo::read_write_lock *)pthread_rwlock_unlock((pthread_rwlock_t *)(v61 + 96));
        if ((_DWORD)v137)
          geo::read_write_lock::logFailure(v137, (uint64_t)"unlock", v138);
        if ((_BYTE)v279)
        {
          objc_msgSend(v8, "setCurrentPoint:", &v280);
          v139 = *(double *)&v281;
          v140 = *(double *)&v282;
          v141 = v283[0];
          v142 = sqrt(v139 * v139 + v140 * v140);
          v143 = atan2(v283[0], v142 * 0.996647189);
          v144 = atan2(v140, v139);
          v145 = __sincos_stret(v143);
          v146 = atan2(v141 + v145.__sinval * v145.__sinval * 42841.3115 * v145.__sinval, v142 + v145.__cosval * v145.__cosval * -42697.6727 * v145.__cosval);
          v147 = __sincos_stret(v146);
          *v256 = v146;
          *((long double *)v8 + 558) = v144;
          *((double *)v8 + 559) = v142 / v147.__cosval
                                + -6378137.0 / sqrt(v147.__sinval * v147.__sinval * -0.00669437999 + 1.0);
        }
        v148 = *(_QWORD *)objc_msgSend(v8, "runLoopController", v256);
        if (v148)
        {
          LOBYTE(v288) = 4;
          md::MapEngine::setNeedsTick(v148, &v288);
        }
        if ((_BYTE)v279)
        {
          v149 = v285;
          v150 = v286;
          if (v285 != v286)
          {
            do
            {
              v151 = (void *)v149[31];
              if (v151 != (void *)v149[33])
                free(v151);
              v149 += 36;
            }
            while (v149 != v150);
            v149 = v285;
          }
          if (v149 != v287)
            free(v149);
        }
        v24 = v8[168];
      }
      else
      {
        v24 = 0;
      }
    }
    else
    {
      v24 = 0;
    }
  }
  v25 = *((double *)v8 + 558);
  v26 = *((double *)v8 + 559);
  v27 = __sincos_stret(*((double *)v8 + 557));
  v28 = 6378137.0 / sqrt(v27.__sinval * v27.__sinval * -0.00669437999 + 1.0);
  v29 = (v28 + v26) * v27.__cosval;
  v30 = __sincos_stret(v25);
  v31 = v29 * v30.__cosval;
  v32 = v29 * v30.__sinval;
  v261 = (v26 + v28 * 0.99330562) * v27.__sinval;
  if (v24)
  {
    if ((objc_msgSend(v8, "isAnimationsRunning") & 1) == 0)
      objc_msgSend(v8, "updateCurrentPointView:", 0);
    v33 = *((double *)v8 + 553);
    v34 = fmodf((float)(3.1416 - *((float *)v8 + 56)) + v33, 6.2832);
    v35 = fmodf(v34 + 6.2832, 6.2832) + -3.1416;
    v36 = __sincosf_stret(v35 * 0.5);
    v37 = *((_QWORD *)v8 + 17);
    objc_msgSend(v8, "canvas");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "size");
    *(float *)&v39 = v39;
    *(float *)&v40 = v40;
    v41 = 720;
    if ((float)(*(float *)&v39 / fmaxf(*(float *)&v40, 0.01)) > 1.0)
      v41 = 736;
    v42 = *(double *)(v37 + v41);
    v43 = *((double *)v8 + 556);

    if (v43 < v42)
    {
      v44 = *((_QWORD *)v8 + 553);
      *((_QWORD *)v8 + 550) = v44;
      *((_QWORD *)v8 + 548) = v44;
      *((_QWORD *)v8 + 549) = 0;
    }
    if (v8[4344])
    {
      _ZF = v43 < v42 || v8[2034] == 0;
      if (!_ZF)
      {
        v46 = fmax(fabs(*((double *)v8 + 554)), 0.34906585);
        v47 = v46 * 2.29183118 + -0.8;
        if (v46 > 0.785398163)
          v47 = 1.0;
        v48 = v47 * v47 * (v47 * 2.0 + -3.0) + 1.0;
        v49 = (unsigned __int8 *)*((_QWORD *)v8 + 261);
        v50 = *((_QWORD *)v8 + 17);
        if (*((unsigned __int8 **)v8 + 262) != v49)
        {
          v51 = *v49;
          v52 = v49[1];
          v53 = *(_QWORD *)(v50 + 144);
          v54 = *(_QWORD *)(v53 + 80);
          v55 = *(_QWORD *)(v53 + 88);
          if (v54 != v55)
          {
            while (*(_WORD *)v54 != 36)
            {
              v54 += 16;
              if (v54 == v55)
                goto LABEL_143;
            }
          }
          if (v54 != v55)
          {
            v152 = *(const gdc::LayerDataRequestKey **)(v54 + 8);
            if (v152)
            {
              v153 = *((_QWORD *)v8 + 22);
              v154 = v8[2035];
              v155 = *((unsigned __int16 *)v8 + 1016);
              v156 = *((unsigned int *)v8 + 507);
              v279 = v283;
              v280 = v283;
              *(double *)&v281 = COERCE_DOUBLE(v283);
              v282 = 32;
              v284 = 0;
              v157 = (v51 << 16) | (v156 << 32) | v52;
              v288 = v155;
              geo::small_vector_base<unsigned char>::insert<unsigned char *>(&v279, (char *)v283, (char *)&v288, v289);
              v288 = v153;
              geo::small_vector_base<unsigned char>::insert<unsigned char *>(&v279, (char *)v280, (char *)&v288, v289);
              v288 = v157;
              geo::small_vector_base<unsigned char>::insert<unsigned char *>(&v279, (char *)v280, (char *)&v288, v289);
              v288 = v154;
              geo::small_vector_base<unsigned char>::insert<unsigned char *>(&v279, (char *)v280, (char *)&v288, v289);
              v158 = (unsigned __int8 *)v279;
              v159 = (char *)v280 - (_BYTE *)v279;
              if (v280 == v279)
              {
                v160 = 0;
              }
              else
              {
                v160 = 0;
                if (v159 <= 1)
                  v159 = 1;
                do
                {
                  v161 = *v158++;
                  v160 ^= (v160 << 6) + (v160 >> 2) - 0x61C8864680B583EBLL + v161;
                  --v159;
                }
                while (v159);
              }
              v284 = v160;
              gdc::LayerDataRequestKey::LayerDataRequestKey((unsigned __int8 *)&v288, 0, 0x24u, (uint64_t)&v279, 2147483646);
              if (v279 != v281)
                free(v279);
              gdc::LayerDataStore::get((gdc::LayerDataStore *)&v279, v152, (unsigned __int8 *)&v288);
              v162 = v279;
              v163 = (std::__shared_weak_count *)v280;
              if (v280)
              {
                v164 = (unint64_t *)(v280 + 1);
                do
                  v165 = __ldxr(v164);
                while (__stxr(v165 + 1, v164));
                do
                  v166 = __ldaxr(v164);
                while (__stlxr(v166 - 1, v164));
                if (!v166)
                {
                  ((void (*)(std::__shared_weak_count *))v163->__on_zero_shared)(v163);
                  std::__shared_weak_count::__release_weak(v163);
                }
              }
              if ((_BYTE)v293)
                LOBYTE(v293) = 0;
              if (v290 != v291)
                free(v290);
              if (v162)
              {
                v167 = v162[65];
                v168 = v162[66] - v167;
                if (v168)
                {
                  v169 = v168 >> 2;
                  v170 = (float)((float)v169 * v35) * -0.159154943;
                  v171 = ((int)(vcvtms_s32_f32(v170) + v169) % v169);
                  v172 = *(float *)(v167 + 4 * (int)v171)
                       + (float)((float)(*(float *)(v167 + 4 * (int)((((v171 << 32) + 0x100000000) >> 32) % v169))
                                       - *(float *)(v167 + 4 * (int)v171))
                               * (float)(v170 - floorf(v170)));
                }
                else
                {
                  v172 = 1.0;
                }
                v48 = v172 * v48;
              }
              if (v163)
              {
                p_shared_owners = (unint64_t *)&v163->__shared_owners_;
                do
                  v174 = __ldaxr(p_shared_owners);
                while (__stlxr(v174 - 1, p_shared_owners));
                if (!v174)
                {
                  ((void (*)(std::__shared_weak_count *))v163->__on_zero_shared)(v163);
                  std::__shared_weak_count::__release_weak(v163);
                }
              }
            }
          }
LABEL_143:
          v50 = *((_QWORD *)v8 + 17);
        }
        v175 = *((float *)v8 + 1087);
        if (v175 <= 0.0)
        {
LABEL_155:
          v196 = *((double *)v8 + 547);
          +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
          v197 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v197, "muninOverrideParallax"))
          {
            objc_msgSend(v197, "muninParallaxSpring");
            v199 = v198;
          }
          else if (*(_BYTE *)(v50 + 600))
          {
            v199 = *(float *)(v50 + 604);
          }
          else
          {
            v199 = 25.0;
          }

          v200 = *((_QWORD *)v8 + 17);
          +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
          v201 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v201, "muninOverrideParallax"))
          {
            objc_msgSend(v201, "muninParallaxDamper");
            v203 = v202;
          }
          else if (*(_BYTE *)(v200 + 608))
          {
            v203 = *(float *)(v200 + 612);
          }
          else
          {
            v203 = 0.75;
          }

          v204 = fmax(fmin(v259 - v196, 0.0666666667), 0.0);
          *((double *)v8 + 551) = v199 * v199;
          *((double *)v8 + 552) = v199 * (v203 + v203);
          gdc::Spring<double,1,(gdc::SpringType)1>::update((double *)v8 + 548, v204);
          v205 = *((_QWORD *)v8 + 17);
          +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
          v206 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v206, "muninOverrideParallax"))
          {
            objc_msgSend(v206, "muninParallaxScale");
            v208 = v207;
            goto LABEL_170;
          }
          +[VKPlatform sharedPlatform](VKPlatform, "sharedPlatform");
          v209 = (void *)objc_claimAutoreleasedReturnValue();
          v210 = objc_msgSend(v209, "isPad");

          if ((v210 & 1) != 0)
          {
            v208 = 0.04;
            if (!*(_BYTE *)(v205 + 592))
              goto LABEL_170;
          }
          else
          {
            +[VKPlatform sharedPlatform](VKPlatform, "sharedPlatform");
            v254 = (void *)objc_claimAutoreleasedReturnValue();
            v255 = objc_msgSend(v254, "isMac");

            if (v255)
              v208 = 0.015;
            else
              v208 = 0.08;
            if (!*(_BYTE *)(v205 + 592))
              goto LABEL_170;
          }
          v208 = *(float *)(v205 + 596);
LABEL_170:

          v211 = *((double *)v8 + 549);
          v212 = 0.0;
          if (fabsf(v211) > 0.0001)
          {
            v212 = (float)-(float)(v48 * v208) * v211;
            v213 = *(_QWORD *)objc_msgSend(v8, "runLoopController");
            if (v213)
            {
              LOBYTE(v288) = 4;
              md::MapEngine::setNeedsTick(v213, &v288);
            }
          }
          v214 = fabsf(v212);
          if (v214 <= 1.0)
            v215 = (float)(2.0 - v214) * v214;
          else
            v215 = 1.0;
          v216 = v215 * (float)(int)((__PAIR64__(v212 > 0.0, LODWORD(v212)) - COERCE_UNSIGNED_INT(0.0)) >> 32);
          v218 = *((float *)v8 + 54);
          v217 = *((float *)v8 + 55);
          v219 = *((float *)v8 + 52);
          v220 = *((float *)v8 + 53);
          v221 = v219 * v36.__sinval;
          v222 = -(float)((float)(v218 * v36.__sinval) - (float)(v219 * v36.__cosval));
          v223 = (float)(v217 * v36.__sinval) + (float)(v220 * v36.__cosval);
          v224 = v221 + (float)(v218 * v36.__cosval);
          v225 = -(float)((float)(v220 * v36.__sinval) - (float)(v217 * v36.__cosval));
          v226 = v216 * (float)(v224 + v224);
          v227 = v216 * (float)(-2.0 * v223);
          v31 = v31 + (float)((float)(v216 + (float)(v227 * v223)) - (float)(v226 * v224));
          v32 = v32 + (float)-(float)((float)(v227 * v222) - (float)(v226 * v225));
          v261 = v261 + (float)((float)(v227 * v225) + (float)(v226 * v222));
          goto LABEL_177;
        }
        +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v176, "muninOverrideParallax"))
        {
          objc_msgSend(v176, "muninCameraPanOffset");
          v178 = v177;
LABEL_154:

          v183 = fminf(fmaxf(v175, 0.0), 1.0);
          v184 = (float)((float)-(float)(v48 * (float)(v183 * v183)) * (float)((float)(v183 * -2.0) + 3.0)) * v178;
          v186 = *((float *)v8 + 54);
          v185 = *((float *)v8 + 55);
          v187 = *((float *)v8 + 52);
          v188 = *((float *)v8 + 53);
          v189 = v187 * v36.__sinval;
          v190 = -(float)((float)(v186 * v36.__sinval) - (float)(v187 * v36.__cosval));
          v191 = (float)(v185 * v36.__sinval) + (float)(v188 * v36.__cosval);
          v192 = v189 + (float)(v186 * v36.__cosval);
          v193 = -(float)((float)(v188 * v36.__sinval) - (float)(v185 * v36.__cosval));
          v194 = v184 * (float)(v191 + v191);
          v195 = v184 * (float)(-2.0 * v190);
          v31 = v31 + (float)-(float)((float)(v195 * v192) - (float)(v194 * v193));
          v32 = v32 + (float)((float)(v194 * v192) + (float)(v195 * v193));
          v261 = v261 + (float)((float)(v184 - (float)(v194 * v191)) + (float)(v195 * v190));
          v50 = *((_QWORD *)v8 + 17);
          goto LABEL_155;
        }
        +[VKPlatform sharedPlatform](VKPlatform, "sharedPlatform");
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v179, "isPad"))
        {

        }
        else
        {
          +[VKPlatform sharedPlatform](VKPlatform, "sharedPlatform");
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          v181 = objc_msgSend(v180, "isMac");

          if (!v181)
          {
            *(float *)&v182 = -0.1;
LABEL_152:
            v178 = *(float *)&v182;
            if (*(_BYTE *)(v50 + 584))
              v178 = *(float *)(v50 + 588);
            goto LABEL_154;
          }
        }
        *(float *)&v182 = -0.08;
        goto LABEL_152;
      }
    }
  }
LABEL_177:
  v228 = (double *)*((_QWORD *)v8 + 17);
  if (*((double *)v8 + 556) < fmax(v228[94] - v228[95], 0.00872664626))
    goto LABEL_181;
  objc_msgSend(v8, "canvas");
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v229, "size");
  *(float *)&v230 = v230;
  *(float *)&v231 = v231;
  v232 = 91;
  if ((float)(*(float *)&v230 / fmaxf(*(float *)&v231, 0.01)) > 1.0)
    v232 = 93;
  v233 = *((double *)v8 + 556) > v228[96] + v228[v232];

  if (v233)
  {
LABEL_181:
    if ((objc_msgSend(v8, "isAnimationsRunning") & 1) == 0)
    {
      v234 = *((double *)v8 + 556);
      v235 = (double *)*((_QWORD *)v8 + 17);
      v236 = v235[94];
      v237 = v235[95];
      objc_msgSend(v8, "canvas");
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v238, "size");
      *(float *)&v239 = v239;
      *(float *)&v240 = v240;
      v241 = 91;
      if ((float)(*(float *)&v239 / fmaxf(*(float *)&v240, 0.01)) > 1.0)
        v241 = 93;
      v242 = v235[v241];
      v243 = v235[96];

      v8[4440] = 0;
      v264[0] = fmin(fmax(v234, fmax(v236 - v237, 0.00872664626)), v243 + v242);
      v263[0] = MEMORY[0x1E0C809B0];
      v263[1] = 3221225472;
      v263[2] = __59__VKMuninCameraController_updateWithTimestamp_withContext___block_invoke;
      v263[3] = &unk_1E42F3E78;
      v263[4] = v8;
      objc_msgSend(v8, "zoomAnimatedWithDuration:duration:completion:", v264, v263, COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(0.5)));
    }
  }
  v244 = *((_QWORD *)v8 + 553);
  v245 = *((_QWORD *)v8 + 554);
  v246 = sqrt(v31 * v31 + v32 * v32);
  v247 = atan2(v261, v246 * 0.996647189);
  v248 = atan2(v32, v31);
  v249 = __sincos_stret(v247);
  v250 = atan2(v261 + v249.__sinval * v249.__sinval * 42841.3115 * v249.__sinval, v246 + v249.__cosval * v249.__cosval * -42697.6727 * v249.__cosval);
  v251 = __sincos_stret(v250);
  v252 = *(_QWORD *)(objc_msgSend(v8, "mapDataAccess") + 16);
  *(double *)(v252 + 8) = v250;
  *(long double *)(v252 + 16) = v248;
  v253 = v246 / v251.__cosval + -6378137.0 / sqrt(v251.__sinval * v251.__sinval * -0.00669437999 + 1.0);
  *(double *)(v252 + 24) = v253;
  *(_QWORD *)(v252 + 32) = 0;
  *(_QWORD *)(v252 + 40) = v245;
  *(_QWORD *)(v252 + 48) = v244;
  *(_QWORD *)(v252 + 56) = 0;
  *((double *)v8 + 560) = v250;
  *((long double *)v8 + 561) = v248;
  *((double *)v8 + 562) = v253;
  *((_QWORD *)v8 + 563) = 0;
  *((_QWORD *)v8 + 564) = v245;
  *((_QWORD *)v8 + 565) = v244;
  *((_QWORD *)v8 + 566) = 0;
  *((double *)v8 + 547) = v259;
  objc_msgSend(v8, "_updateDebugOverlay:", v258);
}

- (void)_updateDebugOverlay:(void *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  float v13;
  double v14;
  float v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  double v22;
  unint64_t *v23;
  unint64_t v24;
  char v25;
  float v26;
  int v27;
  float v28;
  unint64_t *v29;
  unint64_t v30;
  unint64_t *v31;
  unint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  float32_t v43;
  unsigned int v44;
  double v45;
  void *v46;
  double v47;
  float v48;
  int8x16_t *v49;
  size_t v50;
  double v51;
  int32x2_t v52;
  unint64_t v53;
  float v54;
  uint64_t v55;
  uint64_t v56;
  float v57;
  uint64_t v58;
  uint64_t v59;
  float v60;
  int v61;
  float v62;
  int v63;
  float v64;
  int v65;

  if (*(_QWORD *)a3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v5 = objc_msgSend(*(id *)a3, "debugConsoleForId:", 18);
      if (v5)
      {
        v6 = v5;
        +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "muninShowLODInfo");

        if (v8)
        {
          ggl::DebugConsole::begin((ggl::DebugConsole *)v6);
          *(_QWORD *)(v6 + 80) = 0;
          -[VKCameraController canvas](self, "canvas");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "size");
          v11 = v10;
          -[VKCameraController canvas](self, "canvas");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "size");
          v13 = v11;
          v15 = v14;
          v16 = *((_QWORD *)a3 + 4);
          v17 = (std::__shared_weak_count *)*((_QWORD *)a3 + 5);
          if (v17)
          {
            p_shared_owners = (unint64_t *)&v17->__shared_owners_;
            do
              v19 = __ldxr(p_shared_owners);
            while (__stxr(v19 + 1, p_shared_owners));
            v20 = *((_QWORD *)a3 + 4);
            v21 = (std::__shared_weak_count *)*((_QWORD *)a3 + 5);
            v22 = *(double *)(v16 + 64);
            if (v21)
            {
              v23 = (unint64_t *)&v21->__shared_owners_;
              do
                v24 = __ldxr(v23);
              while (__stxr(v24 + 1, v23));
              v25 = 0;
            }
            else
            {
              v25 = 1;
            }
            v16 = v20;
          }
          else
          {
            v21 = 0;
            v22 = *(double *)(v16 + 64);
            v25 = 1;
          }
          v26 = v22;
          v27 = *(unsigned __int8 *)(v16 + 72);
          v54 = 2.0 / v13;
          v56 = 0;
          v55 = 0;
          v57 = -2.0 / v15;
          v28 = v26 + -1.0;
          if (!v27)
            v28 = 1.0 - v26;
          v58 = 0;
          v59 = 0;
          v60 = v28;
          v61 = 0;
          v62 = (float)-v13 / v13;
          v63 = 1065353216;
          v64 = v26;
          v65 = 1065353216;
          if ((v25 & 1) == 0)
          {
            v29 = (unint64_t *)&v21->__shared_owners_;
            do
              v30 = __ldaxr(v29);
            while (__stlxr(v30 - 1, v29));
            if (!v30)
            {
              ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
              std::__shared_weak_count::__release_weak(v21);
            }
          }
          if (v17)
          {
            v31 = (unint64_t *)&v17->__shared_owners_;
            do
              v32 = __ldaxr(v31);
            while (__stlxr(v32 - 1, v31));
            if (!v32)
            {
              ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
              std::__shared_weak_count::__release_weak(v17);
            }
          }

          ggl::DebugConsole::setProjection(v6, &v54);
          v33 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          objc_msgSend(v33, "appendFormat:", CFSTR("Desired LOD:%u\n"), *((unsigned __int8 *)self + 4576));
          if (v33)
          {
            objc_msgSend(v33, "componentsSeparatedByString:", CFSTR("\n"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "count");

            if (v35 >= 2)
            {
              *(_DWORD *)(v6 + 96) = 0x80000000;
              -[VKCameraController canvas](self, "canvas");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "size");
              v38 = v37;
              -[VKCameraController canvas](self, "canvas");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "size");
              v41 = v40;
              -[VKCameraController canvas](self, "canvas");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "size");
              v43 = v38 * 0.333333333;
              *(float *)&v44 = v41;
              *(float *)&v45 = (float)(*(float *)(v6 + 28) * (float)(v35 - 1)) + v45 * 0.333333333;
              v53 = __PAIR64__(LODWORD(v45), v44);
              *(_DWORD *)(v6 + 8) = 0;
              *(float32_t *)(v6 + 12) = v43;
              ggl::DebugConsole::drawRectangleWithFill((float32x2_t *)v6, (float32x2_t *)&v53, v43);

              *(_DWORD *)(v6 + 96) = -1;
              -[VKCameraController canvas](self, "canvas");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "size");
              v48 = v47 * 0.333333333;
              *(_DWORD *)(v6 + 8) = 1084227584;
              *(float *)(v6 + 12) = v48;

              v49 = (int8x16_t *)objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
              v50 = strlen(v49->i8);
              ggl::DebugConsole::drawString(v6, v49, v50, v51, v52);
            }
          }
          ggl::DebugConsole::end(v6);

        }
      }
    }
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate
{
  double v2;
  double v3;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v2 = *((double *)self + 557) * 57.2957795;
  v3 = *((double *)self + 558) * 57.2957795;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (double)heading
{
  return *((double *)self + 553) * -57.2957795;
}

- (void)_setHeading:()Unit<geo:(double>)a3 :RadianUnitDescription
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v4 = *v3;
  *((_QWORD *)self + 553) = *v3;
  *((_QWORD *)self + 550) = v4;
  v5 = *((_QWORD *)self + 553);
  *((_QWORD *)self + 550) = v5;
  *((_QWORD *)self + 548) = v5;
  *((_QWORD *)self + 549) = 0;
}

- (double)pitch
{
  return *((double *)self + 554) * 57.2957795;
}

- (double)altitude
{
  return *((double *)self + 559);
}

- (void)setVkCamera:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  objc_super v10;
  char v11;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VKMuninCameraController;
  -[VKCameraController setVkCamera:](&v10, sel_setVkCamera_, v4);
  if (v4)
  {
    objc_msgSend(v4, "cameraFrame:", 0);
  }
  else
  {
    v9 = 0;
    v7 = 0u;
    v8 = 0u;
    v6 = 0u;
  }
  *(_OWORD *)((char *)self + 4456) = v6;
  *((_QWORD *)self + 559) = v7;
  if (*((_BYTE *)self + 168))
  {
    *((_BYTE *)self + 168) = 0;
  }
  v5 = *(_QWORD *)-[VKCameraController runLoopController](self, "runLoopController", v6, v7, v8, v9);
  if (v5)
  {
    v11 = 4;
    md::MapEngine::setNeedsTick(v5, &v11);
  }

}

- (void)setCameraFrame:()CameraFrame<geo:(double> *)a3 :Radians
{
  double value;
  uint64_t v5;
  double v6;
  char v7;

  value = a3->_target.altitude._value;
  *(_OWORD *)((char *)self + 4456) = *(_OWORD *)&a3->_target.latitude._value;
  *((double *)self + 559) = value;
  *((_QWORD *)self + 554) = *(_QWORD *)&a3->_pitch._value;
  v6 = a3->_heading._value;
  -[VKMuninCameraController _setHeading:](self, "_setHeading:", &v6);
  v5 = *(_QWORD *)-[VKCameraController runLoopController](self, "runLoopController");
  if (v5)
  {
    v7 = 4;
    md::MapEngine::setNeedsTick(v5, &v7);
  }
}

- (void)setCenterCoordinate:(id)a3 altitude:(double)a4 yaw:(double)a5 pitch:(double)a6 duration:(double)a7 animationStyle:(int64_t)a8 timingCurve:(id)a9 completion:(id)a10
{
  double var1;
  double var0;
  void (**v17)(id, uint64_t);
  double v18;
  __double2 v19;
  __double2 v20;
  double v21;
  double v22;
  __double2 v23;
  __double2 v24;
  double v25;
  long double v26;
  double v27;
  long double v28;
  double v29;
  VKTimedAnimation *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  _QWORD v52[5];
  id v53;
  id v54;
  _QWORD v55[4];
  id v56[11];
  id location;

  var1 = a3.var1;
  var0 = a3.var0;
  v17 = (void (**)(id, uint64_t))a10;
  -[VKMuninCameraController cancelPendingMoveExceptBump](self, "cancelPendingMoveExceptBump");
  if (a7 <= 0.0)
  {
    -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
    -[VKCameraController cameraDelegate](self, "cameraDelegate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "mapLayerWillAnimateToLocation:", var0, var1);

    *((double *)self + 557) = var0 * 0.0174532925;
    *((double *)self + 558) = var1 * 0.0174532925;
    *((double *)self + 559) = a4;
    *((double *)self + 554) = a6 * 0.0174532925;
    v51 = a5 * -0.0174532925;
    -[VKMuninCameraController _setHeading:](self, "_setHeading:", &v51);
    -[VKCameraController endRegionChange](self, "endRegionChange");
    v45 = *(_QWORD *)-[VKCameraController runLoopController](self, "runLoopController");
    if (v45)
    {
      LOBYTE(location) = 4;
      md::MapEngine::setNeedsTick(v45, &location);
    }
    if (v17)
      v17[2](v17, 1);
  }
  else
  {
    v48 = a4;
    v18 = *((double *)self + 558);
    v46 = *((double *)self + 559);
    v19 = __sincos_stret(*((double *)self + 557));
    v20 = __sincos_stret(v18);
    v21 = *((double *)self + 553);
    v22 = *((double *)self + 554);
    v23 = __sincos_stret(var0 * 0.0174532925);
    v24 = __sincos_stret(var1 * 0.0174532925);
    v25 = a6 * 0.0174532925;
    v47 = a5 * -0.0174532925;
    v50 = v21;
    v26 = fmod(3.14159265 - a5 * -0.0174532925 + v21, 6.28318531);
    v27 = fmod(v26 + 6.28318531, 6.28318531);
    v49 = v22;
    v28 = fmod(3.14159265 - v25 + v22, 6.28318531);
    v29 = fmod(v28 + 6.28318531, 6.28318531);
    -[VKMuninCameraController stopPanningAtPoint:](self, "stopPanningAtPoint:", 0.5, 0.5);
    v30 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", fmax(fabs(v27 * 0.159154943 + -0.5), fabs(v29 * 0.318309886 + -1.0)) * 1.9 + 0.1);
    v31 = 6378137.0 / sqrt(-(v19.__sinval * v19.__sinval * 0.00669437999 + -1.0));
    v32 = (v31 + v46) * v19.__cosval;
    v33 = v32 * v20.__cosval;
    v34 = v32 * v20.__sinval;
    v35 = (v46 + v31 * 0.99330562) * v19.__sinval;
    v36 = 6378137.0 / sqrt(-(v23.__sinval * v23.__sinval * 0.00669437999 + -1.0));
    v37 = (v36 + v48) * v23.__cosval;
    v38 = v37 * v24.__cosval;
    v39 = v37 * v24.__sinval;
    v40 = (v48 + v36 * 0.99330562) * v23.__sinval;
    v41 = (void *)*((_QWORD *)self + 535);
    *((_QWORD *)self + 535) = v30;

    objc_initWeak(&location, self);
    v42 = MEMORY[0x1E0C809B0];
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3321888768;
    v55[2] = __113__VKMuninCameraController_setCenterCoordinate_altitude_yaw_pitch_duration_animationStyle_timingCurve_completion___block_invoke;
    v55[3] = &unk_1E42E9128;
    objc_copyWeak(v56, &location);
    v56[1] = *(id *)&v49;
    v56[2] = *(id *)&v25;
    v56[3] = *(id *)&v50;
    v56[4] = *(id *)&v47;
    v56[5] = *(id *)&v33;
    v56[6] = *(id *)&v34;
    v56[7] = *(id *)&v35;
    v56[8] = *(id *)&v38;
    v56[9] = *(id *)&v39;
    v56[10] = *(id *)&v40;
    objc_msgSend(*((id *)self + 535), "setStepHandler:", v55);
    v52[0] = v42;
    v52[1] = 3221225472;
    v52[2] = __113__VKMuninCameraController_setCenterCoordinate_altitude_yaw_pitch_duration_animationStyle_timingCurve_completion___block_invoke_20;
    v52[3] = &unk_1E42F10B8;
    v52[4] = self;
    v43 = (id)MEMORY[0x1A1AF5730](v17);
    v53 = v43;
    objc_copyWeak(&v54, &location);
    objc_msgSend(*((id *)self + 535), "setCompletionHandler:", v52);
    -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1);
    md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), *((VKAnimation **)self + 535));
    objc_destroyWeak(&v54);

    objc_destroyWeak(v56);
    objc_destroyWeak(&location);
  }

}

- (void)setCurrentPoint:(const void *)a3
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  char v6[96];
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6[0] = 0;
  -[VKMuninCameraController setCurrentPoint:secondaryPoint:](self, "setCurrentPoint:secondaryPoint:", a3, v6);
  if (v6[0])
  {
    v3 = v7;
    v4 = v8;
    if (v7 != v8)
    {
      do
      {
        v5 = (void *)v3[31];
        if (v5 != (void *)v3[33])
          free(v5);
        v3 += 36;
      }
      while (v3 != v4);
      v3 = v7;
    }
    if (v3 != v9)
      free(v3);
  }
}

- (void)setCurrentPoint:(const void *)a3 secondaryPoint:(optional<md::mun::CollectionPoint>)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const md::mun::CollectionPoint *v7;
  const md::mun::CollectionPoint *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  _BYTE *v16;
  unint64_t v17;
  _OWORD *v18;
  char *v19;
  uint64_t *v20;
  char *v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 *v26;
  _OWORD *v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  __int128 *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  _BYTE *v41;
  unint64_t v42;
  _OWORD *v43;
  char *v44;
  uint64_t *v45;
  char *v46;
  unint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  __int128 *v51;
  _OWORD *v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  __int128 *v56;
  __int128 v57;
  uint64_t v58;
  _QWORD *v59;
  _QWORD *v60;
  void *v61;
  _QWORD *v62;
  _QWORD *v63;
  void *v64;
  uint64_t v65;
  _QWORD *v66;
  _QWORD *v67;
  _QWORD *v68;
  _QWORD *v69;
  void *v70;
  _QWORD *v71;
  _QWORD *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  uint64_t v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE *v82;
  _BYTE *v83;
  _BYTE *v84;
  uint64_t v85;
  _BYTE v86[1728];
  _QWORD v87[2];
  void *v88;
  char *v89;
  _BYTE *v90;
  uint64_t v91;
  _BYTE v92[48];
  _BYTE v93[88];
  void *v94;
  _QWORD *v95;
  _QWORD *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  __int128 v104;
  uint64_t v105;
  uint64_t v106;
  int v107;
  uint64_t v108;
  __int128 v109;
  __int128 v110;
  void *v111;
  _BYTE *v112;
  _BYTE *v113;
  uint64_t v114;
  _BYTE v115[1728];
  _QWORD v116[2];
  void *v117;
  char *v118;
  _BYTE *v119;
  uint64_t v120;
  _BYTE v121[48];
  _BYTE v122[88];
  void *v123;
  _QWORD *v124;
  _QWORD *v125;
  char v126;
  void *v127;
  _QWORD *v128;
  char v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *__p;
  void *v135;
  void *v136;
  void *v137;
  uint64_t v138;

  v4 = MEMORY[0x1E0C80A78](self);
  v6 = v5;
  v8 = v7;
  v9 = v4;
  v138 = *MEMORY[0x1E0C80C00];
  md::mun::MuninMetadataContainer::addActiveMetadataPoint(*(std::mutex **)(*(_QWORD *)(v4 + 136) + 168), v7);
  if (*(_BYTE *)v6)
    md::mun::MuninMetadataContainer::addActiveMetadataPoint(*(std::mutex **)(*(_QWORD *)(v9 + 136) + 168), (const md::mun::CollectionPoint *)(v6 + 8));
  v10 = v121;
  v117 = v121;
  v118 = v121;
  v119 = v121;
  v120 = 6;
  v11 = *((_QWORD *)v8 + 11);
  v12 = *((_QWORD *)v8 + 12);
  v74 = v9;
  if (v11 != v12)
  {
    v13 = 6;
    v14 = v121;
    while (1)
    {
      v15 = (v14 - v10) >> 3;
      if (v13 < v15 + 1)
        break;
LABEL_6:
      *v14 = *(_BYTE *)(v11 + 240);
      *(_WORD *)(v14 + 1) = 1;
      *((_DWORD *)v14 + 1) = 0;
      v14 += 8;
      v118 = v14;
      v11 += 288;
      if (v11 == v12)
      {
        v31 = (__int128 *)*((_QWORD *)v8 + 11);
        v11 = *((_QWORD *)v8 + 12);
        v9 = v74;
        goto LABEL_26;
      }
    }
    v16 = v119;
    v17 = (1 << -(char)__clz(v13 + 1));
    if (v13 >= 0xFFFFFFFFFFFFFFFELL)
      v17 = 1;
    if (v17 <= v15 + 1)
      v13 = v15 + 1;
    else
      v13 = v17;
    v18 = malloc_type_malloc(8 * v13, 0x100004087EB8081uLL);
    v19 = (char *)v18;
    v20 = (uint64_t *)v117;
    v21 = v118;
    if (v117 != v118)
    {
      v22 = v118 - (_BYTE *)v117 - 8;
      if (v22 < 0x18)
      {
        v23 = v18;
      }
      else
      {
        v23 = v18;
        if ((unint64_t)((char *)v18 - (_BYTE *)v117) >= 0x20)
        {
          v24 = (v22 >> 3) + 1;
          v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
          v23 = (_QWORD *)((char *)v18 + v25);
          v26 = (__int128 *)((char *)v117 + 16);
          v27 = v18 + 1;
          v28 = v24 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v29 = *v26;
            *(v27 - 1) = *(v26 - 1);
            *v27 = v29;
            v26 += 2;
            v27 += 2;
            v28 -= 4;
          }
          while (v28);
          if (v24 == (v24 & 0x3FFFFFFFFFFFFFFCLL))
            goto LABEL_22;
          v20 = (uint64_t *)((char *)v20 + v25);
        }
      }
      do
      {
        v30 = *v20++;
        *v23++ = v30;
      }
      while (v20 != (uint64_t *)v21);
    }
LABEL_22:
    if (v10 != v16)
      free(v117);
    v14 = &v19[8 * v15];
    v117 = v19;
    v120 = v13;
    v10 = v19;
    goto LABEL_6;
  }
  v31 = (__int128 *)*((_QWORD *)v8 + 11);
LABEL_26:
  v32 = *(_QWORD *)v8;
  v104 = *(_OWORD *)((char *)v8 + 8);
  v33 = *((_QWORD *)v8 + 3);
  v34 = *((_QWORD *)v8 + 4);
  v103 = v32;
  v105 = v33;
  v106 = v34;
  v107 = *((_DWORD *)v8 + 10);
  v108 = *(_QWORD *)((char *)v8 + 44);
  v109 = *(_OWORD *)((char *)v8 + 56);
  v110 = *(_OWORD *)((char *)v8 + 72);
  v111 = v115;
  v112 = v115;
  v113 = v115;
  v114 = 6;
  geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)&v111, v31, (__int128 *)v11);
  *(_QWORD *)((char *)v116 + 5) = *(_QWORD *)((char *)v8 + 1853);
  v116[0] = *((_QWORD *)v8 + 231);
  md::mun::PointView::PointView((uint64_t)v93, (uint64_t)&v103, (uint64_t **)&v117);
  if (*(_BYTE *)v6)
  {
    v35 = v92;
    v88 = v92;
    v89 = v92;
    v90 = v92;
    v91 = 6;
    v36 = *(_QWORD *)(v6 + 96);
    v37 = *(_QWORD *)(v6 + 104);
    if (v36 != v37)
    {
      v38 = 6;
      v39 = v92;
      while (1)
      {
        v40 = (v39 - v35) >> 3;
        if (v38 < v40 + 1)
          break;
LABEL_30:
        *v39 = *(_BYTE *)(v36 + 240);
        *(_WORD *)(v39 + 1) = 1;
        *((_DWORD *)v39 + 1) = 0;
        v39 += 8;
        v89 = v39;
        v36 += 288;
        if (v36 == v37)
        {
          v56 = *(__int128 **)(v6 + 96);
          v36 = *(_QWORD *)(v6 + 104);
          v9 = v74;
          goto LABEL_52;
        }
      }
      v41 = v90;
      v42 = (1 << -(char)__clz(v38 + 1));
      if (v38 >= 0xFFFFFFFFFFFFFFFELL)
        v42 = 1;
      if (v42 <= v40 + 1)
        v38 = v40 + 1;
      else
        v38 = v42;
      v43 = malloc_type_malloc(8 * v38, 0x100004087EB8081uLL);
      v44 = (char *)v43;
      v45 = (uint64_t *)v88;
      v46 = v89;
      if (v88 != v89)
      {
        v47 = v89 - (_BYTE *)v88 - 8;
        if (v47 < 0x18)
        {
          v48 = v43;
        }
        else
        {
          v48 = v43;
          if ((unint64_t)((char *)v43 - (_BYTE *)v88) >= 0x20)
          {
            v49 = (v47 >> 3) + 1;
            v50 = 8 * (v49 & 0x3FFFFFFFFFFFFFFCLL);
            v48 = (_QWORD *)((char *)v43 + v50);
            v51 = (__int128 *)((char *)v88 + 16);
            v52 = v43 + 1;
            v53 = v49 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              v54 = *v51;
              *(v52 - 1) = *(v51 - 1);
              *v52 = v54;
              v51 += 2;
              v52 += 2;
              v53 -= 4;
            }
            while (v53);
            if (v49 == (v49 & 0x3FFFFFFFFFFFFFFCLL))
              goto LABEL_46;
            v45 = (uint64_t *)((char *)v45 + v50);
          }
        }
        do
        {
          v55 = *v45++;
          *v48++ = v55;
        }
        while (v45 != (uint64_t *)v46);
      }
LABEL_46:
      if (v35 != v41)
        free(v88);
      v39 = &v44[8 * v40];
      v88 = v44;
      v91 = v38;
      v35 = v44;
      goto LABEL_30;
    }
    v56 = *(__int128 **)(v6 + 96);
LABEL_52:
    v76 = *(_OWORD *)(v6 + 16);
    *(_QWORD *)((char *)&v79 + 4) = *(_QWORD *)(v6 + 52);
    v57 = *(_OWORD *)(v6 + 80);
    v80 = *(_OWORD *)(v6 + 64);
    v75 = *(_QWORD *)(v6 + 8);
    v58 = *(_QWORD *)(v6 + 40);
    v77 = *(_QWORD *)(v6 + 32);
    v78 = v58;
    LODWORD(v79) = *(_DWORD *)(v6 + 48);
    v81 = v57;
    v82 = v86;
    v83 = v86;
    v84 = v86;
    v85 = 6;
    geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)&v82, v56, (__int128 *)v36);
    *(_QWORD *)((char *)v87 + 5) = *(_QWORD *)(v6 + 1861);
    v87[0] = *(_QWORD *)(v6 + 1856);
    md::mun::PointView::PointView((uint64_t)v122, (uint64_t)&v75, (uint64_t **)&v117);
    if (*(_BYTE *)(v9 + 168))
    else
      *(_BYTE *)(v9 + 168) = 1;
    if (v136 != v137)
      free(v136);
    if (__p)
    {
      v135 = __p;
      operator delete(__p);
    }
    if (v132)
    {
      v133 = v132;
      operator delete(v132);
    }
    v59 = v123;
    v60 = v124;
    if (v123 != v124)
    {
      do
      {
        v61 = (void *)v59[31];
        if (v61 != (void *)v59[33])
          free(v61);
        v59 += 36;
      }
      while (v59 != v60);
      v59 = v123;
    }
    if (v59 != v125)
      free(v59);
    v63 = v82;
    v62 = v83;
    if (v82 != v83)
    {
      do
      {
        v64 = (void *)v63[31];
        if (v64 != (void *)v63[33])
          free(v64);
        v63 += 36;
      }
      while (v63 != v62);
      v63 = v82;
    }
    if (v63 != (_QWORD *)v84)
      free(v63);
    if (v88 != v90)
      free(v88);
  }
  else
  {
    if (*(_BYTE *)(v9 + 168))
    else
      *(_BYTE *)(v9 + 168) = 1;
  }
  objc_msgSend((id)v9, "updateCurrentPointView:", 1, 136, v74, v75, v76, v77, v78, v79, v80, v81);
  v65 = *(_QWORD *)(v9 + 136);
  v122[8] = 0;
  v126 = 0;
  v129 = 0;
  v122[0] = 6;
  md::MuninSceneLogic::addSceneEvent(v65, (uint64_t)v122);
  if (v129)
  {
    if (v130)
    {
      v131 = v130;
      operator delete(v130);
    }
    v129 = 0;
  }
  if (v126)
  {
    v66 = v127;
    if (v127)
    {
      v67 = v128;
      if (v128 != v127)
      {
        do
        {
          v67 -= 249;
          std::__destroy_at[abi:nn180100]<md::mun::PointView,0>(v67);
        }
        while (v67 != v66);
        v66 = v127;
      }
      operator delete(v66);
    }
  }
  if (v101 != v102)
    free(v101);
  if (v99)
  {
    v100 = v99;
    operator delete(v99);
  }
  if (v97)
  {
    v98 = v97;
    operator delete(v97);
  }
  v68 = v94;
  v69 = v95;
  if (v94 != v95)
  {
    do
    {
      v70 = (void *)v68[31];
      if (v70 != (void *)v68[33])
        free(v70);
      v68 += 36;
    }
    while (v68 != v69);
    v68 = v94;
  }
  if (v68 != v96)
    free(v68);
  v71 = v111;
  v72 = v112;
  if (v111 != v112)
  {
    do
    {
      v73 = (void *)v71[31];
      if (v73 != (void *)v71[33])
        free(v73);
      v71 += 36;
    }
    while (v71 != v72);
    v71 = v111;
  }
  if (v71 != (_QWORD *)v113)
    free(v71);
  if (v117 != v119)
    free(v117);
}

- (const)currentPoint
{
  if (*((_BYTE *)self + 168))
    return (char *)self + 176;
  else
    return 0;
}

- (void)updateCurrentPointView:(BOOL)a3
{
  _QWORD *v3;
  _BOOL4 v4;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  md::MuninSceneLogic *v12;
  void *v13;
  _BOOL4 v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  _BOOL4 v23;
  _BOOL4 isPhotoVisible;
  float v25;
  float v26;
  unsigned __int8 v28;
  NSObject *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  unsigned __int8 *v33;
  unsigned __int8 *v34;
  int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  _BOOL4 v41;
  _BOOL4 v42;
  float v43;
  float v44;
  unsigned __int8 v46;
  uint64_t v47;
  geo::read_write_lock *v48;
  const char *v49;
  void *v50;
  geo::read_write_lock *v51;
  const char *v52;
  _OWORD *v53;
  _OWORD *v54;
  int64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  char *v62;
  char *v63;
  char *v64;
  char *v65;
  __int128 v66;
  uint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  _BOOL4 v72;
  _BOOL4 v73;
  uint64_t v74;
  VKMuninCameraController *v75;
  _QWORD *v76;
  void *__p;
  char *v78;
  char *v79;
  void *v80[2];
  uint64_t v81;
  char *v82;
  uint8_t buf[984];
  double v84[49];
  char v85[8];
  uint64_t v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  int64x2_t v95;
  int64x2_t v96;
  int64x2_t v97;
  int64x2_t v98;
  int64x2_t v99;
  int64x2_t v100;
  int64x2_t v101;
  int64x2_t v102;
  int64x2_t v103;
  int64x2_t v104;
  int64x2_t v105;
  int64x2_t v106;
  char v107;
  char v108;
  char v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  int v115;
  uint64_t v116;
  __int128 v117;
  uint64_t v118;
  uint64_t v119;
  char v120;
  _QWORD v121[3];
  _QWORD *v122;
  uint64_t v123;
  CGSize v124;

  v123 = *MEMORY[0x1E0C80C00];
  v3 = (_QWORD *)((char *)self + 168);
  if (!*((_BYTE *)self + 168))
  {
    if (GEOGetVectorKitVKMuninLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMuninLog_onceToken, &__block_literal_global_10_11776);
    v29 = (id)GEOGetVectorKitVKMuninLog_log;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F029000, v29, OS_LOG_TYPE_ERROR, "No current point segment.", buf, 2u);
    }

    return;
  }
  v4 = a3;
  v120 = *(_BYTE *)(*((_QWORD *)self + 17) + 832);
  v6 = *(_QWORD *)(-[VKCameraController mapDataAccess](self, "mapDataAccess") + 16);
  v86 = *((_QWORD *)self + 560);
  v7 = *(_OWORD *)((char *)self + 4504);
  v87 = *(_OWORD *)((char *)self + 4488);
  v88 = v7;
  v89 = *(_OWORD *)((char *)self + 4520);
  v91 = 0;
  v90 = 0;
  v94 = 0;
  v92 = 0;
  v93 = 0;
  v95 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  v96 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
  v97 = v95;
  v98 = v96;
  v99 = v95;
  v100 = v96;
  v101 = v95;
  v102 = v96;
  v103 = v95;
  v104 = v96;
  v105 = v95;
  v106 = v96;
  v107 = 1;
  v108 = 0;
  v109 = 0;
  v8 = *(_OWORD *)(v6 + 384);
  v110 = *(_OWORD *)(v6 + 368);
  v111 = v8;
  v9 = *(_OWORD *)(v6 + 416);
  v112 = *(_OWORD *)(v6 + 400);
  v113 = v9;
  v114 = *(_OWORD *)(v6 + 432);
  v115 = *(_DWORD *)(v6 + 448);
  v10 = *(_QWORD *)(v6 + 456);
  v117 = *(_OWORD *)(v6 + 464);
  *(_QWORD *)&v9 = *(_QWORD *)(v6 + 480);
  v11 = *(_QWORD *)(v6 + 488);
  v116 = v10;
  v118 = v9;
  v119 = v11;
  gdc::CameraView::ecefCameraView((gdc::CameraView *)buf, (const Camera *)v85);
  v12 = (md::MuninSceneLogic *)*((_QWORD *)self + 17);
  -[VKCameraController canvas](self, "canvas");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sizeInPixels");
  *((_BYTE *)self + 4576) = md::MuninSceneLogic::getLodForCavasSize(v12, v124);

  v75 = self;
  v14 = *((double *)self + 556) < 0.698131701;
  v15 = (unsigned __int8 *)v3[240];
  v16 = (unsigned __int8 *)v3[241];
  v76 = v3;
  v73 = v4;
  v72 = v14;
  if (v15 == v16)
  {
    v21 = 0;
  }
  else
  {
    v17 = *((unsigned __int8 *)self + 4576);
    v18 = (v17 - v14) & ~((v17 - v14) >> 31);
    v20 = v3[12];
    v19 = v3[13];
    if (v20 == v19)
    {
      v21 = 0;
      do
      {
        if (v15[1] != v18)
        {
          v15[1] = v18;
          v21 = 1;
        }
        v15 += 8;
      }
      while (v15 != v16);
    }
    else
    {
      v21 = 0;
      do
      {
        v22 = v20;
        while (*(unsigned __int8 *)(v22 + 240) != *v15)
        {
          v22 += 288;
          if (v22 == v19)
          {
            v23 = 0;
            isPhotoVisible = 1;
            goto LABEL_17;
          }
        }
        v25 = *(float *)(v22 + 56);
        v26 = *(float *)(v22 + 72);
        v23 = fabsf(v26 + v25) >= 3960.0
           && (__PAIR64__(v25 > 0.0, LODWORD(v25)) - COERCE_UNSIGNED_INT(0.0)) >> 32 != (__PAIR64__(v26 < 0.0, 0.0)
                                                                                       - LODWORD(v26)) >> 32;
        isPhotoVisible = md::mun::isPhotoVisible(v84, v22);
LABEL_17:
        if (v23 || !isPhotoVisible)
          v28 = v17;
        else
          v28 = v18;
        if (v15[1] != v28)
        {
          v15[1] = v28;
          v21 = 1;
        }
        v15 += 8;
      }
      while (v15 != v16);
    }
  }
  v30 = v76;
  v31 = v76[250];
  v32 = v76[1];
  if (v31 == v32)
  {
    if (((v21 | v73) & 1) == 0)
      return;
  }
  else
  {
    v70 = v21 | v73;
    v71 = v76[1];
    v74 = v76[250];
    v33 = (unsigned __int8 *)v76[489];
    v34 = (unsigned __int8 *)v76[490];
    if (v33 == v34)
    {
      v39 = 0;
    }
    else
    {
      v35 = *((unsigned __int8 *)v75 + 4576);
      v36 = (v35 - v72) & ~((v35 - v72) >> 31);
      v37 = v76[261];
      v38 = v76[262];
      if (v37 == v38)
      {
        v39 = 0;
        do
        {
          if (v33[1] != v36)
          {
            v33[1] = v36;
            v39 = 1;
          }
          v33 += 8;
        }
        while (v33 != v34);
      }
      else
      {
        v39 = 0;
        do
        {
          v40 = v37;
          while (*(unsigned __int8 *)(v40 + 240) != *v33)
          {
            v40 += 288;
            if (v40 == v38)
            {
              v41 = 0;
              v42 = 1;
              goto LABEL_46;
            }
          }
          v43 = *(float *)(v40 + 56);
          v44 = *(float *)(v40 + 72);
          v41 = fabsf(v44 + v43) >= 3960.0
             && (__PAIR64__(v43 > 0.0, LODWORD(v43)) - COERCE_UNSIGNED_INT(0.0)) >> 32 != (__PAIR64__(v44 < 0.0, 0.0)
                                                                                         - LODWORD(v44)) >> 32;
          v42 = md::mun::isPhotoVisible(v84, v40);
LABEL_46:
          if (v41 || !v42)
            v46 = v35;
          else
            v46 = (v35 - v72) & ~((v35 - v72) >> 31);
          if (v33[1] != v46)
          {
            v33[1] = v46;
            v39 = 1;
          }
          v33 += 8;
        }
        while (v33 != v34);
      }
    }
    v30 = v76;
    v31 = v74;
    v32 = v71;
    if (((v70 | v39) & 1) == 0)
      return;
  }
  v81 = 0;
  v82 = &v120;
  v80[0] = 0;
  v80[1] = 0;
  -[VKMuninCameraController updateCurrentPointView:]::$_1::operator()(&v82, v30 + 1, v84, v80);
  v47 = *((_QWORD *)v75 + 17);
  v48 = (geo::read_write_lock *)pthread_rwlock_wrlock((pthread_rwlock_t *)(v47 + 208));
  if ((_DWORD)v48)
    geo::read_write_lock::logFailure(v48, (uint64_t)"write lock", v49);
  v50 = *(void **)(v47 + 184);
  if (v50)
  {
    *(_QWORD *)(v47 + 192) = v50;
    operator delete(v50);
    *(_QWORD *)(v47 + 184) = 0;
    *(_QWORD *)(v47 + 192) = 0;
    *(_QWORD *)(v47 + 200) = 0;
  }
  *(_OWORD *)(v47 + 184) = *(_OWORD *)v80;
  *(_QWORD *)(v47 + 200) = v81;
  v80[1] = 0;
  v81 = 0;
  v80[0] = 0;
  v51 = (geo::read_write_lock *)pthread_rwlock_unlock((pthread_rwlock_t *)(v47 + 208));
  if ((_DWORD)v51)
    geo::read_write_lock::logFailure(v51, (uint64_t)"unlock", v52);
  *(_BYTE *)(v47 + 472) = 1;
  if (v31 != v32)
  {
    __p = 0;
    v78 = 0;
    v79 = 0;
    v80[1] = 0;
    -[VKMuninCameraController updateCurrentPointView:]::$_1::operator()(&v82, v30 + 250, v84, v80);
    v54 = v80[0];
    v53 = v80[1];
    v55 = (char *)v80[1] - (char *)v80[0];
    if (v80[1] != v80[0])
    {
      if (v55 < 0)
        abort();
      v56 = v55 >> 4;
      v57 = (char *)operator new(24 * (v55 >> 4));
      __p = v57;
      v78 = v57;
      v79 = &v57[24 * v56];
      do
      {
        if (v57 < v79)
        {
          *(_OWORD *)v57 = *v54;
          *((_DWORD *)v57 + 4) = 2147483646;
          v57 += 24;
        }
        else
        {
          v58 = (char *)__p;
          v59 = 0xAAAAAAAAAAAAAAABLL * ((v57 - (_BYTE *)__p) >> 3);
          v60 = v59 + 1;
          if (v59 + 1 > 0xAAAAAAAAAAAAAAALL)
            abort();
          if (0x5555555555555556 * ((v79 - (_BYTE *)__p) >> 3) > v60)
            v60 = 0x5555555555555556 * ((v79 - (_BYTE *)__p) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * ((v79 - (_BYTE *)__p) >> 3) >= 0x555555555555555)
            v61 = 0xAAAAAAAAAAAAAAALL;
          else
            v61 = v60;
          if (v61 > 0xAAAAAAAAAAAAAAALL)
            std::__throw_bad_array_new_length[abi:nn180100]();
          v62 = (char *)operator new(24 * v61);
          v63 = &v62[8 * ((v57 - (_BYTE *)__p) >> 3)];
          *(_OWORD *)v63 = *v54;
          *((_DWORD *)v63 + 4) = 2147483646;
          if (v57 == v58)
          {
            v65 = &v62[24 * v59];
          }
          else
          {
            v64 = &v62[24 * v59];
            do
            {
              v65 = v64 - 24;
              v66 = *(_OWORD *)(v57 - 24);
              *((_QWORD *)v64 - 1) = *((_QWORD *)v57 - 1);
              *(_OWORD *)(v64 - 24) = v66;
              v57 -= 24;
              v64 -= 24;
            }
            while (v57 != v58);
          }
          v57 = v63 + 24;
          __p = v65;
          v79 = &v62[24 * v61];
          if (v58)
            operator delete(v58);
        }
        v78 = v57;
        ++v54;
      }
      while (v54 != v53);
    }
    v67 = *((_QWORD *)v75 + 17);
    v122 = 0;
    md::MuninSceneLogic::addPreloadViews(v67, (const void **)&__p, v121);
    v68 = v122;
    if (v122 == v121)
    {
      v69 = 4;
      v68 = v121;
    }
    else
    {
      if (!v122)
      {
LABEL_93:
        if (__p)
          operator delete(__p);
        if (v80[0])
          operator delete(v80[0]);
        return;
      }
      v69 = 5;
    }
    (*(void (**)(void))(*v68 + 8 * v69))();
    goto LABEL_93;
  }
}

- (Matrix<float,)screenPointWithOffset:(CGPoint)a3
{
  double y;
  CGFloat x;
  float v6;
  double v7;
  float v8;
  float v9;
  double v10;
  float v11;
  float v12;
  float v13;
  Matrix<float, 2, 1> result;

  y = a3.y;
  x = a3.x;
  -[VKCameraController edgeInsets](self, "edgeInsets");
  v7 = v6;
  -[VKCameraController edgeInsets](self, "edgeInsets");
  *(float *)&x = x + (v8 - v7) * 0.5;
  -[VKCameraController edgeInsets](self, "edgeInsets");
  v10 = v9;
  -[VKCameraController edgeInsets](self, "edgeInsets");
  v12 = y + (v11 - v10) * 0.5;
  v13 = *(float *)&x;
  result._e[1] = v12;
  result._e[0] = v13;
  return result;
}

- (void)selectLabelMarker:(const void *)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  uint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  int v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  unsigned int v24;
  BOOL v25;
  uint64_t *v26;
  __int128 *v27;
  __int128 v28;
  uint64_t v29;
  uint64_t *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t *v34;
  unint64_t v35;
  unint64_t *v36;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  void *v41;
  double v42;
  double v43;
  __double2 v44;
  double v45;
  double v46;
  __double2 v47;
  _BYTE *v48;
  _BYTE *v49;
  void *v50;
  _BYTE *v51;
  _QWORD *v52;
  _QWORD *v53;
  void *v54;
  void *v55;
  id v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  VKTimedAnimation *v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(uint64_t);
  void *v67;
  VKMuninCameraController *v68;
  id v69;
  id v70;
  _QWORD v71[4];
  id v72[5];
  id from;
  char v74[32];
  double v75;
  double v76;
  id location[2];
  double v78;
  __int128 v79;
  uint64_t v80;
  uint64_t v81;
  __int128 v82;
  uint64_t v83;
  uint64_t v84;
  __int128 v85;
  double v86;
  _QWORD v87[4];
  id v88;
  id v89;
  void *__p;
  _BYTE *v91;
  __int128 v92;
  uint64_t v93;
  uint64_t v94;
  std::__shared_weak_count *v95;
  uint64_t v96;
  std::__shared_weak_count *v97;
  uint64_t v98;
  std::__shared_weak_count *v99;
  _QWORD v100[3];
  _QWORD *v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a4;
  v7 = *((_QWORD *)self + 520);
  if (v7 && (objc_msgSend(*(id *)(v7 + 600), "running") & 1) != 0
    || (v8 = *(_QWORD *)a3, *(_BYTE *)(*(_QWORD *)a3 + 224)))
  {
    v6[2](v6, 0);
    goto LABEL_5;
  }
  v9 = (std::__shared_weak_count *)*((_QWORD *)a3 + 1);
  v98 = *(_QWORD *)a3;
  v99 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  v12 = *(_QWORD *)(v8 + 288);
  v13 = *(std::__shared_weak_count **)(v8 + 296);
  v96 = v12;
  v97 = v13;
  if (v13)
  {
    v14 = (unint64_t *)&v13->__shared_owners_;
    do
      v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
  }
  v16 = *(unsigned __int8 *)(v12 + 1211);
  if (v16 == 17)
  {
    v33 = 1;
  }
  else
  {
    if (v16 == 18)
    {
      v17 = *(_QWORD *)(v12 + 8);
      v18 = *(std::__shared_weak_count **)(v12 + 16);
      v94 = v17;
      v95 = v18;
      if (v18)
      {
        v19 = (unint64_t *)&v18->__shared_owners_;
        do
          v20 = __ldxr(v19);
        while (__stxr(v20 + 1, v19));
      }
      v21 = *(_QWORD *)(v17 + 464);
      if (!v21)
        goto LABEL_36;
      v22 = *(_DWORD *)(v12 + 48);
      v23 = v17 + 464;
      do
      {
        v24 = *(_DWORD *)(v21 + 32);
        v25 = v24 >= v22;
        if (v24 >= v22)
          v26 = (uint64_t *)v21;
        else
          v26 = (uint64_t *)(v21 + 8);
        if (v25)
          v23 = v21;
        v21 = *v26;
      }
      while (*v26);
      if (v23 == v17 + 464
        || v22 < *(_DWORD *)(v23 + 32)
        || (v27 = *(__int128 **)(*(_QWORD *)(v17 + 672) + 16 * *(unsigned __int8 *)(v23 + 121))) == 0)
      {
LABEL_36:
        v6[2](v6, 0);
        goto LABEL_37;
      }
      -[VKMuninCameraController cancelPendingMove](self, "cancelPendingMove");
      v28 = *v27;
      v93 = *((_QWORD *)v27 + 2);
      v92 = v28;
      v29 = *((_QWORD *)self + 17);
      v30 = *(uint64_t **)(v29 + 528);
      v100[0] = &off_1E42C7D30;
      v100[1] = v29;
      v101 = v100;
      md::mun::MuninNavigation::path(&__p, *v30, (char *)self + 176, (uint64_t)&v92, 1, v29 + 616, (uint64_t)v100);
      v31 = v101;
      if (v101 == v100)
      {
        v32 = 4;
        v31 = v100;
      }
      else
      {
        if (!v101)
        {
LABEL_54:
          +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v41, "forceBumpNextTap") & 1) != 0 || objc_msgSend(v41, "forceBumpAll"))
          {
            v42 = *((double *)self + 558);
            v43 = *((double *)self + 559);
            v44 = __sincos_stret(*((double *)self + 557));
            v45 = 6378137.0 / sqrt(v44.__sinval * v44.__sinval * -0.00669437999 + 1.0);
            v46 = (v45 + v43) * v44.__cosval;
            v47 = __sincos_stret(v42);
            *(double *)location = v46 * v47.__cosval;
            *(double *)&location[1] = v46 * v47.__sinval;
            v78 = (v43 + v45 * 0.99330562) * v44.__sinval;
            -[VKMuninCameraController runBumpAnimation:targetPoint:completionHandler:](self, "runBumpAnimation:targetPoint:completionHandler:", location, &v92, &__block_literal_global_13544);
            objc_msgSend(v41, "setForceBumpNextTap:", 0);
          }
          else if ((unint64_t)(0x63FB9AEB1FDCD759 * ((v91 - (_BYTE *)__p) >> 3)) < 2)
          {
            geo::Geocentric<double>::Geocentric<geo::Radians,double>((double *)&v85, (double *)self + 557);
            md::mun::lookAtOrientation((double *)&v82, (double *)&v85, (double *)&v92);
            *(_OWORD *)location = v85;
            v78 = v86;
            v79 = v82;
            v80 = v83;
            v81 = v84;
            gdc::CameraFrame<geo::Radians,double>::fromRigidTransformEcefNoOffset((uint64_t)v74, (double *)location);
            v58 = v75;
            v57 = v76;
            v59 = (void *)*((_QWORD *)self + 553);
            v60 = (void *)*((_QWORD *)self + 554);
            geo::_retain_ptr<VKTimedAnimation * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::reset((uint64_t)self + 4272, v61);

            objc_initWeak(&from, self);
            v62 = MEMORY[0x1E0C809B0];
            v71[0] = MEMORY[0x1E0C809B0];
            v71[1] = 3321888768;
            v71[2] = __56__VKMuninCameraController_selectLabelMarker_completion___block_invoke_3;
            v71[3] = &unk_1E42E9D58;
            objc_copyWeak(v72, &from);
            v72[1] = v60;
            v72[2] = *(id *)&v58;
            v72[3] = v59;
            v72[4] = *(id *)&v57;
            objc_msgSend(*((id *)self + 535), "setStepHandler:", v71);
            v64 = v62;
            v65 = 3221225472;
            v66 = __56__VKMuninCameraController_selectLabelMarker_completion___block_invoke_22;
            v67 = &unk_1E42F10B8;
            v68 = self;
            v63 = (id)MEMORY[0x1A1AF5730](v6);
            v69 = v63;
            objc_copyWeak(&v70, &from);
            objc_msgSend(*((id *)self + 535), "setCompletionHandler:", &v64);
            -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1, v64, v65, v66, v67, v68);
            md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), *((VKAnimation **)self + 535));
            objc_destroyWeak(&v70);

            objc_destroyWeak(v72);
            objc_destroyWeak(&from);
          }
          else
          {
            objc_initWeak(location, self);
            v55 = (void *)MEMORY[0x1A1AF5730](v6);
            v87[0] = MEMORY[0x1E0C809B0];
            v87[1] = 3221225472;
            v87[2] = __56__VKMuninCameraController_selectLabelMarker_completion___block_invoke_2;
            v87[3] = &unk_1E42F9D20;
            v88 = v55;
            v56 = v55;
            objc_copyWeak(&v89, location);
            -[VKMuninCameraController animatePath:withTarget:lookAtTarget:constantLod:prePruneData:completionHandler:](self, "animatePath:withTarget:lookAtTarget:constantLod:prePruneData:completionHandler:", &__p, &v92, 1, 0, 1, v87);
            objc_destroyWeak(&v89);

            objc_destroyWeak(location);
          }

          v48 = __p;
          if (__p)
          {
            v49 = v91;
            v50 = __p;
            if (v91 != __p)
            {
              do
              {
                v51 = v49 - 1864;
                v52 = (_QWORD *)*((_QWORD *)v49 - 222);
                v53 = (_QWORD *)*((_QWORD *)v49 - 221);
                if (v52 != v53)
                {
                  do
                  {
                    v54 = (void *)v52[31];
                    if (v54 != (void *)v52[33])
                      free(v54);
                    v52 += 36;
                  }
                  while (v52 != v53);
                  v52 = (_QWORD *)*((_QWORD *)v49 - 222);
                }
                if (v52 != *((_QWORD **)v49 - 220))
                  free(v52);
                v49 -= 1864;
              }
              while (v51 != v48);
              v50 = __p;
            }
            v91 = v48;
            operator delete(v50);
          }
LABEL_37:
          if (v18)
          {
            v34 = (unint64_t *)&v18->__shared_owners_;
            do
              v35 = __ldaxr(v34);
            while (__stlxr(v35 - 1, v34));
            if (!v35)
            {
              ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
              std::__shared_weak_count::__release_weak(v18);
            }
          }
          v13 = v97;
          if (!v97)
            goto LABEL_47;
          goto LABEL_43;
        }
        v32 = 5;
      }
      (*(void (**)(void))(*v31 + 8 * v32))();
      goto LABEL_54;
    }
    v33 = 0;
  }
  v6[2](v6, v33);
  if (v13)
  {
LABEL_43:
    v36 = (unint64_t *)&v13->__shared_owners_;
    do
      v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
LABEL_47:
  v38 = v99;
  if (v99)
  {
    v39 = (unint64_t *)&v99->__shared_owners_;
    do
      v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }
LABEL_5:

}

- (BOOL)moveToPoint:(const void *)a3 withHeading:()Unit<geo:(double>)a4 :()Unit<geo:(double>)a5 :(BOOL)a6 RadianUnitDescription RadianUnitDescription withPitch:(id)a7 animated:completionHandler:
{
  int v7;
  void *v8;
  int v9;
  double *v11;
  id v14;
  __double2 v15;
  double v16;
  double v17;
  long double v18;
  double v19;
  __double2 v20;
  long double v21;
  long double v22;
  double v23;
  double v24;
  __double2 v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __double2 v31;
  long double v32;
  long double v33;
  double v34;
  long double v35;
  long double v36;
  uint64_t v37;
  double v38;
  uint64_t v39;
  char *v40;
  char *v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  char *v47;
  md::MuninSceneLogic *v48;
  void *v49;
  uint64_t LodForCavasSize;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  uint64_t v55;
  char v56;
  char v57;
  double v58;
  const void *v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  double v63;
  unint64_t v64;
  char *v65;
  char *v66;
  char *v67;
  double v68;
  __int128 v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  __int128 v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  id v79;
  _QWORD *v80;
  uint64_t v81;
  __int128 *v82;
  __int128 *v83;
  void *v84;
  uint64_t v85;
  double v86;
  char *v87;
  char *v88;
  char *v89;
  _QWORD *v90;
  _QWORD *v91;
  void *v92;
  __int128 *v94;
  VKMuninCameraController *v95;
  id v96;
  uint64_t v97;
  id to;
  uint64_t v99;
  __int128 v100;
  uint64_t v101;
  uint64_t v102;
  int v103;
  uint64_t v104;
  __int128 v105;
  __int128 v106;
  __int128 *v107;
  __int128 *v108;
  __int128 *v109;
  uint64_t v110;
  _BYTE v111[1728];
  _QWORD v112[2];
  _BYTE v113[56];
  id v114;
  double v115[3];
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  id location;
  char *v124;
  unint64_t v125;
  double v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _QWORD v130[3];
  _QWORD *v131;
  uint64_t v132;
  CGSize v133;

  v9 = v7;
  v11 = (double *)a6;
  v132 = *MEMORY[0x1E0C80C00];
  v14 = v8;
  if (*((_BYTE *)self + 168) && *((_QWORD *)self + 22) == *(_QWORD *)a3)
  {
    v15 = __sincos_stret(*((double *)self + 557));
    v16 = 6378137.0 / sqrt(1.0 - v15.__sinval * v15.__sinval * 0.00669437999);
    v17 = *((double *)self + 559);
    v18 = (v17 + v16 * 0.99330562) * v15.__sinval;
    v19 = (v16 + v17) * v15.__cosval;
    v20 = __sincos_stret(*((double *)self + 558));
    v21 = v19 * v20.__sinval;
    v22 = v19 * v20.__cosval;
    v23 = sqrt(v22 * v22 + v21 * v21);
    v24 = atan2(v18, v23 * 0.996647189);
    v25 = __sincos_stret(v24);
    v26 = atan2(v18 + v25.__sinval * v25.__sinval * 42841.3115 * v25.__sinval, v23 + v25.__cosval * v25.__cosval * -42697.6727 * v25.__cosval);
    v27 = atan2(v21, v22) * 57.2957795;
    v28 = *v11;
    v29 = *(double *)a7 * 57.2957795;
    if (v9)
      v30 = 0.5;
    else
      v30 = 0.0;
    v31 = __sincos_stret(v26);
    -[VKMuninCameraController setCenterCoordinate:altitude:yaw:pitch:duration:animationStyle:timingCurve:completion:](self, "setCenterCoordinate:altitude:yaw:pitch:duration:animationStyle:timingCurve:completion:", 0, VKAnimationCurveLinear, v14, v26 * 57.2957795, v27, v23 / v31.__cosval - 6378137.0 / sqrt(1.0 - v31.__sinval * v31.__sinval * 0.00669437999), v28 * -57.2957795, v29, v30);
    goto LABEL_65;
  }
  -[VKMuninCameraController cancelPendingMove](self, "cancelPendingMove");
  v129 = 0u;
  v128 = 0u;
  v32 = *((double *)a3 + 7) * 6.28318531;
  v33 = exp(*((double *)a3 + 8) * 6.28318531 + -3.14159265);
  v34 = atan(v33) * 2.0 + -1.57079633;
  v35 = fmod(v32, 6.28318531);
  v36 = fmod(v35 + 6.28318531, 6.28318531);
  v37 = *((_QWORD *)a3 + 9);
  v126 = v34;
  *(double *)&v127 = v36 + -3.14159265;
  v38 = *v11;
  v39 = *(_QWORD *)a7;
  *((_QWORD *)&v127 + 1) = v37;
  *((_QWORD *)&v128 + 1) = v39;
  *(double *)&v129 = v38;
  if (v9 && *((_BYTE *)self + 168))
  {
    v124 = 0;
    *(double *)&location = 0.0;
    v125 = 0;
    v40 = std::vector<md::mun::CollectionPoint>::__push_back_slow_path<md::mun::CollectionPoint const&>((uint64_t *)&location, (uint64_t)self + 176);
    v41 = v40;
    v124 = v40;
    if ((unint64_t)v40 >= v125)
    {
      v47 = std::vector<md::mun::CollectionPoint>::__push_back_slow_path<md::mun::CollectionPoint const&>((uint64_t *)&location, (uint64_t)a3);
    }
    else
    {
      *(_QWORD *)v40 = *(_QWORD *)a3;
      v42 = *(_OWORD *)((char *)a3 + 8);
      *((_QWORD *)v40 + 3) = *((_QWORD *)a3 + 3);
      *(_OWORD *)(v40 + 8) = v42;
      v43 = *((_QWORD *)a3 + 4);
      *((_DWORD *)v40 + 10) = *((_DWORD *)a3 + 10);
      *((_QWORD *)v40 + 4) = v43;
      *(_QWORD *)(v40 + 44) = *(_QWORD *)((char *)a3 + 44);
      v44 = *(_OWORD *)((char *)a3 + 56);
      v45 = *(_OWORD *)((char *)a3 + 72);
      *((_QWORD *)v40 + 11) = v40 + 120;
      *(_OWORD *)(v40 + 56) = v44;
      *(_OWORD *)(v40 + 72) = v45;
      *((_QWORD *)v40 + 12) = v40 + 120;
      *((_QWORD *)v40 + 13) = v40 + 120;
      *((_QWORD *)v40 + 14) = 6;
      geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)(v40 + 88), *((__int128 **)a3 + 11), *((__int128 **)a3 + 12));
      v46 = *((_QWORD *)a3 + 231);
      *(_QWORD *)(v41 + 1853) = *(_QWORD *)((char *)a3 + 1853);
      *((_QWORD *)v41 + 231) = v46;
      v47 = v41 + 1864;
    }
    v124 = v47;
    gdc::CameraFrame<geo::Radians,double>::toRigidTransformEcefNoOffset((uint64_t)&v116, &v126);
    v115[0] = v116 - (v121 * (v119 * 200.0) - v122 * (v120 * -200.0));
    v115[1] = v117 + v120 * -200.0 * v121 + v122 * (v119 * 200.0);
    v115[2] = v118 - -(v119 * 200.0 * v119 + -100.0 - v120 * -200.0 * v120);
    -[VKMuninCameraController animatePath:withTarget:lookAtTarget:constantLod:prePruneData:completionHandler:](self, "animatePath:withTarget:lookAtTarget:constantLod:prePruneData:completionHandler:", &location, v115, 1, 1, 0, v14);
    v87 = (char *)location;
    if (*(double *)&location != 0.0)
    {
      v88 = v124;
      v86 = *(double *)&location;
      if (v124 != location)
      {
        do
        {
          v89 = v88 - 1864;
          v90 = (_QWORD *)*((_QWORD *)v88 - 222);
          v91 = (_QWORD *)*((_QWORD *)v88 - 221);
          if (v90 != v91)
          {
            do
            {
              v92 = (void *)v90[31];
              if (v92 != (void *)v90[33])
                free(v92);
              v90 += 36;
            }
            while (v90 != v91);
            v90 = (_QWORD *)*((_QWORD *)v88 - 222);
          }
          if (v90 != *((_QWORD **)v88 - 220))
            free(v90);
          v88 -= 1864;
        }
        while (v89 != v87);
        v86 = *(double *)&location;
      }
      v124 = v87;
      goto LABEL_64;
    }
    goto LABEL_65;
  }
  v48 = (md::MuninSceneLogic *)*((_QWORD *)self + 17);
  v96 = v14;
  -[VKCameraController canvas](self, "canvas");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = (__int128 *)((char *)a3 + 56);
  v95 = self;
  objc_msgSend(v49, "sizeInPixels");
  LodForCavasSize = md::MuninSceneLogic::getLodForCavasSize(v48, v133);

  v117 = 0.0;
  v116 = 0.0;
  v118 = 0.0;
  v52 = *((_QWORD *)a3 + 11);
  v51 = *((_QWORD *)a3 + 12);
  if (v52 == v51)
  {
    v54 = 0.0;
  }
  else
  {
    v53 = 0.0;
    v54 = 0.0;
    v97 = *((_QWORD *)a3 + 12);
    do
    {
      v55 = *(_QWORD *)a3;
      v56 = *(_BYTE *)(v52 + 240);
      v57 = *((_BYTE *)a3 + 1859);
      if (*(_QWORD *)&v53 < *(_QWORD *)&v118)
      {
        **(_QWORD **)&v53 = v55;
        *(_BYTE *)(*(_QWORD *)&v53 + 8) = v56;
        *(_BYTE *)(*(_QWORD *)&v53 + 9) = LodForCavasSize;
        *(_BYTE *)(*(_QWORD *)&v53 + 10) = v57;
        *(_DWORD *)(*(_QWORD *)&v53 + 16) = -1073741827;
        *(_QWORD *)&v53 += 24;
      }
      else
      {
        v58 = v54;
        v59 = a3;
        v60 = LodForCavasSize;
        v61 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&v53 - *(_QWORD *)&v58) >> 3);
        v62 = v61 + 1;
        v63 = v58;
        if (v61 + 1 > 0xAAAAAAAAAAAAAAALL)
        {
          v116 = v58;
          abort();
        }
        if (0x5555555555555556 * ((uint64_t)(*(_QWORD *)&v118 - *(_QWORD *)&v58) >> 3) > v62)
          v62 = 0x5555555555555556 * ((uint64_t)(*(_QWORD *)&v118 - *(_QWORD *)&v58) >> 3);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&v118 - *(_QWORD *)&v58) >> 3) >= 0x555555555555555)
          v64 = 0xAAAAAAAAAAAAAAALL;
        else
          v64 = v62;
        if (v64 > 0xAAAAAAAAAAAAAAALL)
          std::__throw_bad_array_new_length[abi:nn180100]();
        v65 = (char *)operator new(24 * v64);
        v66 = &v65[24 * v61];
        *(_QWORD *)v66 = v55;
        v66[8] = v56;
        LodForCavasSize = v60;
        v66[9] = v60;
        v66[10] = v57;
        *((_DWORD *)v66 + 4) = -1073741827;
        if (*(_QWORD *)&v53 == *(_QWORD *)&v63)
        {
          v68 = *(double *)&v66;
          a3 = v59;
        }
        else
        {
          v67 = v66;
          a3 = v59;
          do
          {
            *(_QWORD *)&v68 = v67 - 24;
            v69 = *(_OWORD *)(*(_QWORD *)&v53 - 24);
            *((_QWORD *)v67 - 1) = *(_QWORD *)(*(_QWORD *)&v53 - 8);
            *(_OWORD *)(v67 - 24) = v69;
            *(_QWORD *)&v53 -= 24;
            v67 -= 24;
          }
          while (*(_QWORD *)&v53 != *(_QWORD *)&v63);
        }
        *(_QWORD *)&v53 = v66 + 24;
        *(_QWORD *)&v118 = &v65[24 * v64];
        if (v63 != 0.0)
          operator delete(*(void **)&v63);
        v54 = v68;
        v51 = v97;
      }
      v117 = v53;
      v52 += 288;
    }
    while (v52 != v51);
  }
  v116 = v54;
  md::mun::MuninMetadataContainer::addActiveMetadataPoint(*(std::mutex **)(*((_QWORD *)v95 + 17) + 168), (const md::mun::CollectionPoint *)a3);
  -[VKCameraController beginRegionChange:](v95, "beginRegionChange:", 1);
  v14 = v96;
  v70 = (void *)MEMORY[0x1A1AF5730](v96);
  objc_initWeak(&location, v95);
  v71 = *((_QWORD *)v95 + 17);
  objc_copyWeak(&to, &location);
  v99 = *(_QWORD *)a3;
  v100 = *(_OWORD *)((char *)a3 + 8);
  v72 = *((_QWORD *)a3 + 4);
  v101 = *((_QWORD *)a3 + 3);
  v102 = v72;
  v103 = *((_DWORD *)a3 + 10);
  v104 = *(_QWORD *)((char *)a3 + 44);
  v73 = v94[1];
  v105 = *v94;
  v106 = v73;
  v107 = (__int128 *)v111;
  v108 = (__int128 *)v111;
  v109 = (__int128 *)v111;
  v110 = 6;
  geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)&v107, *((__int128 **)a3 + 11), *((__int128 **)a3 + 12));
  *(_QWORD *)((char *)v112 + 5) = *(_QWORD *)((char *)a3 + 1853);
  v112[0] = *((_QWORD *)a3 + 231);
  *(double *)v113 = v34;
  *(_OWORD *)&v113[8] = v127;
  *(_OWORD *)&v113[24] = v128;
  *(_OWORD *)&v113[40] = v129;
  v114 = (id)MEMORY[0x1A1AF5730](v70);
  v131 = 0;
  v74 = (char *)operator new(0x798uLL);
  *(_QWORD *)v74 = &off_1E42C8048;
  objc_moveWeak((id *)v74 + 1, &to);
  v75 = v99;
  *((_QWORD *)v74 + 13) = v74 + 136;
  *((_QWORD *)v74 + 2) = v75;
  *(_OWORD *)(v74 + 24) = v100;
  v76 = v102;
  *((_QWORD *)v74 + 5) = v101;
  *((_QWORD *)v74 + 6) = v76;
  *((_DWORD *)v74 + 14) = v103;
  *(_QWORD *)(v74 + 60) = v104;
  v77 = v106;
  *(_OWORD *)(v74 + 72) = v105;
  *(_OWORD *)(v74 + 88) = v77;
  *((_QWORD *)v74 + 14) = v74 + 136;
  *((_QWORD *)v74 + 15) = v74 + 136;
  *((_QWORD *)v74 + 16) = 6;
  geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)(v74 + 104), v107, v108);
  *((_QWORD *)v74 + 233) = v112[0];
  *(_QWORD *)(v74 + 1869) = *(_QWORD *)((char *)v112 + 5);
  v78 = *(_OWORD *)&v113[16];
  *(_OWORD *)(v74 + 1880) = *(_OWORD *)v113;
  *(_OWORD *)(v74 + 1896) = v78;
  *(_OWORD *)(v74 + 1912) = *(_OWORD *)&v113[32];
  *((_QWORD *)v74 + 241) = *(_QWORD *)&v113[48];
  v79 = v114;
  v114 = 0;
  *((_QWORD *)v74 + 242) = v79;
  v131 = v74;
  md::MuninSceneLogic::addPreloadViews(v71, (const void **)&v116, v130);
  v80 = v131;
  if (v131 == v130)
  {
    v81 = 4;
    v80 = v130;
  }
  else
  {
    if (!v131)
      goto LABEL_37;
    v81 = 5;
  }
  (*(void (**)(void))(*v80 + 8 * v81))();
LABEL_37:

  v83 = v107;
  v82 = v108;
  if (v107 != v108)
  {
    do
    {
      v84 = (void *)*((_QWORD *)v83 + 31);
      if (v84 != *((void **)v83 + 33))
        free(v84);
      v83 += 18;
    }
    while (v83 != v82);
    v83 = v107;
  }
  if (v83 != v109)
    free(v83);
  objc_destroyWeak(&to);
  v85 = *(_QWORD *)-[VKCameraController runLoopController](v95, "runLoopController");
  if (v85)
  {
    LOBYTE(v115[0]) = 4;
    md::MapEngine::setNeedsTick(v85, v115);
  }
  objc_destroyWeak(&location);

  if (v54 != 0.0)
  {
    v117 = v54;
    v86 = v54;
LABEL_64:
    operator delete(*(void **)&v86);
  }
LABEL_65:

  return 1;
}

- (void)setCurrentSegment:(void *)a3
{
  _BYTE *v4;
  md::mun::PointView *v5;
  _BYTE v6[1992];
  uint64_t v7;

  v4 = (char *)self + 168;
  v5 = (md::mun::PointView *)(v4 + 8);
  if (*v4)
  {
    md::mun::PointView::operator=((uint64_t)v5, (uint64_t)v6);
    md::mun::PointView::operator=((uint64_t)(v4 + 2000), (uint64_t)&v7);
  }
  else
  {
    *v4 = 1;
  }
}

- (void)stopAnimationsExceptBump
{
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];

  v3 = (_QWORD *)((char *)self + 4160);
  v4 = *((_QWORD *)self + 520);
  if (v4)
  {
    if (objc_msgSend(*(id *)(v4 + 600), "running"))
    {
      objc_msgSend(*(id *)(*v3 + 600), "stop");
    }
    else
    {
      if (GEOGetVectorKitVKMuninLog_onceToken != -1)
        dispatch_once(&GEOGetVectorKitVKMuninLog_onceToken, &__block_literal_global_10_11776);
      v5 = (id)GEOGetVectorKitVKMuninLog_log;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_19F029000, v5, OS_LOG_TYPE_INFO, "reset path animator in stopAnimationsExceptBump", v19, 2u);
      }

      if (std::mutex::try_lock((std::mutex *)((char *)self + 4176)))
      {
        v6 = (std::__shared_weak_count *)v3[1];
        *v3 = 0;
        v3[1] = 0;
        if (v6)
        {
          p_shared_owners = (unint64_t *)&v6->__shared_owners_;
          do
            v8 = __ldaxr(p_shared_owners);
          while (__stlxr(v8 - 1, p_shared_owners));
          if (!v8)
          {
            ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
            std::__shared_weak_count::__release_weak(v6);
          }
        }
        std::mutex::unlock((std::mutex *)((char *)self + 4176));
      }
    }
    v9 = *(_QWORD *)(*((_QWORD *)self + 17) + 520);
    *(_DWORD *)v9 = 3;
    *(_QWORD *)(v9 + 12) = 0;
    *(_QWORD *)(v9 + 4) = 0;
    if (*(_QWORD *)(v9 + 88))
    {
      v10 = *(_QWORD **)(v9 + 80);
      if (v10)
      {
        do
        {
          v11 = (_QWORD *)*v10;
          operator delete(v10);
          v10 = v11;
        }
        while (v11);
      }
      *(_QWORD *)(v9 + 80) = 0;
      v12 = *(_QWORD *)(v9 + 72);
      if (v12)
      {
        for (i = 0; i != v12; ++i)
          *(_QWORD *)(*(_QWORD *)(v9 + 64) + 8 * i) = 0;
      }
      *(_QWORD *)(v9 + 88) = 0;
    }
    *(_OWORD *)(v9 + 48) = 0u;
    *(_OWORD *)(v9 + 36) = 0u;
    *(_OWORD *)(v9 + 20) = 0u;
  }
  v14 = (void *)*((_QWORD *)self + 535);
  if (v14)
  {
    if (objc_msgSend(v14, "running"))
      objc_msgSend(*((id *)self + 535), "stop");
    v15 = (void *)*((_QWORD *)self + 535);
    if (v15)
    {
      *((_QWORD *)self + 535) = 0;

    }
  }
  v16 = (char *)self + 4320;
  v17 = (void *)*((_QWORD *)v16 + 1);
  if (v17)
  {
    if (objc_msgSend(v17, "running"))
      objc_msgSend(*((id *)v16 + 1), "stop");
    v18 = (void *)*((_QWORD *)v16 + 1);
    if (v18)
    {
      *((_QWORD *)v16 + 1) = 0;

    }
  }
}

- (void)stopAnimations
{
  uint64_t *v3;

  -[VKMuninCameraController stopAnimationsExceptBump](self, "stopAnimationsExceptBump");
  v3 = (uint64_t *)((char *)self + 4240);
  if (*v3)
  {
    if (objc_msgSend(*(id *)(*v3 + 64), "running"))
      objc_msgSend(*(id *)(*v3 + 64), "stop");
    else
  }
}

- (BOOL)cancelPendingMove
{
  void ***v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  _BYTE v8[128];
  char v9;
  void *v10;
  _QWORD *v11;
  char v12;
  void *__p;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void ***)((char *)self + 4560);
  if (*v3)
  ++*((_QWORD *)self + 567);
  md::MuninSceneLogic::cancelAllViewPreloads(*((md::MuninSceneLogic **)self + 17));
  if (-[VKMuninCameraController isPathAnimationRunning](self, "isPathAnimationRunning"))
  {
    v4 = *((_QWORD *)self + 17);
    v8[8] = 0;
    v9 = 0;
    v12 = 0;
    v8[0] = 4;
    md::MuninSceneLogic::addSceneEvent(v4, (uint64_t)v8);
    if (v12 && __p)
      operator delete(__p);
    if (v9)
    {
      v5 = v10;
      if (v10)
      {
        v6 = v11;
        if (v11 != v10)
        {
          do
          {
            v6 -= 249;
            std::__destroy_at[abi:nn180100]<md::mun::PointView,0>(v6);
          }
          while (v6 != v5);
        }
        operator delete(v5);
      }
    }
  }
  -[VKMuninCameraController stopAnimations](self, "stopAnimations");
  return 1;
}

- (BOOL)cancelPendingMoveExceptBump
{
  void ***v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  _BYTE v8[128];
  char v9;
  void *v10;
  _QWORD *v11;
  char v12;
  void *__p;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void ***)((char *)self + 4560);
  if (*v3)
  ++*((_QWORD *)self + 567);
  md::MuninSceneLogic::cancelAllViewPreloads(*((md::MuninSceneLogic **)self + 17));
  v4 = *((_QWORD *)self + 17);
  v8[8] = 0;
  v9 = 0;
  v12 = 0;
  v8[0] = 4;
  md::MuninSceneLogic::addSceneEvent(v4, (uint64_t)v8);
  if (v12 && __p)
    operator delete(__p);
  if (v9)
  {
    v5 = v10;
    if (v10)
    {
      v6 = v11;
      if (v11 != v10)
      {
        do
        {
          v6 -= 249;
          std::__destroy_at[abi:nn180100]<md::mun::PointView,0>(v6);
        }
        while (v6 != v5);
      }
      operator delete(v5);
    }
  }
  -[VKMuninCameraController stopAnimationsExceptBump](self, "stopAnimationsExceptBump");
  return 1;
}

- (BOOL)isAnimationsRunningExceptBump
{
  void *v3;
  void *v4;

  v3 = (void *)*((_QWORD *)self + 535);
  if (v3 && (objc_msgSend(v3, "running") & 1) != 0
    || -[VKMuninCameraController isPathAnimationRunning](self, "isPathAnimationRunning"))
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    v4 = (void *)*((_QWORD *)self + 541);
    if (v4)
      LOBYTE(v4) = objc_msgSend(v4, "running");
  }
  return (char)v4;
}

- (BOOL)isPathAnimationRunning
{
  uint64_t v2;

  v2 = *((_QWORD *)self + 520);
  if (v2)
    return objc_msgSend(*(id *)(v2 + 600), "running");
  else
    return 0;
}

- (BOOL)isBumpAnimationRunning
{
  uint64_t v2;

  v2 = *((_QWORD *)self + 530);
  if (v2)
    return objc_msgSend(*(id *)(v2 + 64), "running");
  else
    return 0;
}

- (BOOL)isAnimationsRunning
{
  return -[VKMuninCameraController isAnimationsRunningExceptBump](self, "isAnimationsRunningExceptBump")
      || -[VKMuninCameraController isBumpAnimationRunning](self, "isBumpAnimationRunning");
}

- (void)animatePath:(void *)a3 animator:(const void *)a4 preloadedRequiredViews:(void *)a5 prePruneData:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  float64x2_t v21;
  double v22;
  float64x2_t *v23;
  double v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  unint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  id *v47;
  uint8_t *v48;
  uint8_t *v49;
  uint8_t *v50;
  uint8_t *v51;
  uint64_t v52;
  id *v53;
  uint64_t v54;
  char *v55;
  char *v56;
  void *v57;
  char *v58;
  _QWORD *v59;
  _QWORD *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint8_t *v65;
  uint64_t v66;
  uint8_t *v67;
  uint64_t v68;
  uint64_t (***v69)();
  uint64_t v70;
  uint64_t v71;
  void *v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t (***v76)();
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t *v80;
  unint64_t v81;
  std::__shared_weak_count *v82;
  unint64_t *p_shared_owners;
  unint64_t v84;
  NSObject *v85;
  const md::mun::CollectionPoint *v86;
  const md::mun::CollectionPoint *v87;
  uint64_t v88;
  uint64_t v89;
  __int128 *v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  NSObject *v94;
  NSObject *v95;
  uint64_t v96;
  id *v97;
  id *v98;
  uint64_t v99;
  NSObject *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t (***v105)();
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  double v112;
  double v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  int64_t v120;
  unint64_t v121;
  char *v122;
  uint64_t v123;
  char *v124;
  char *v125;
  __int128 v126;
  _QWORD *v127;
  _QWORD *v128;
  void *v129;
  char v130;
  uint64_t v131;
  void *v132;
  id v133;
  _QWORD *v134;
  uint64_t v135;
  id v136;
  id v137;
  __int128 v138;
  id v139;
  id v140;
  uint64_t v141;
  id from;
  id to;
  void *__p[2];
  char *v145;
  id location;
  id v147[7];
  uint64_t (**v148)();
  id v149;
  uint64_t (***v150)();
  uint64_t v151;
  id *v152;
  uint64_t (**v153)();
  id v154[2];
  uint64_t (***v155)();
  uint64_t (**v156)();
  id v157;
  uint64_t (***v158)();
  _BYTE v159[24];
  id *v160;
  uint8_t buf[8];
  uint8_t *v162;
  uint64_t i;
  uint8_t *v164;
  void (*v165)(uint64_t);
  const char *v166;
  _BYTE v167[80];
  char v168;
  __int128 v169;
  char *v170;
  char v171;
  char v172;
  void *v173;
  void *v174;
  __int128 v175;
  uint64_t v176;
  uint64_t (*v177)(uint64_t, uint64_t);
  _QWORD *(*v178)(uint64_t);
  const char *v179;
  _BYTE v180[24];
  _BYTE *v181;
  uint64_t v182;

  v7 = MEMORY[0x1E0C80A78](self);
  v9 = v8;
  v131 = v10;
  v134 = v11;
  v13 = v12;
  v14 = v7;
  v182 = *MEMORY[0x1E0C80C00];
  v133 = v15;
  v16 = *v13;
  v17 = v13[1] - *v13;
  if (v17 != 1864)
  {
    v18 = *(_QWORD *)(*(_QWORD *)(v14 + 136) + 520);
    v19 = 0x63FB9AEB1FDCD759 * (v17 >> 3) - 1;
    v20 = *(_DWORD *)(v18 + 20);
    v21 = *(float64x2_t *)(v16 + 16);
    v22 = *(double *)(v16 + 8);
    if (v19 <= 1)
      v19 = 1;
    v23 = (float64x2_t *)(v16 + 1880);
    do
    {
      v24 = v23[-1].f64[1];
      v25 = *v23;
      v26 = vsubq_f64(*v23, v21);
      v27 = vmulq_f64(v26, v26);
      v20 += (unint64_t)sqrt(v27.f64[0] + (v24 - v22) * (v24 - v22) + v27.f64[1]);
      v23 = (float64x2_t *)((char *)v23 + 1864);
      v22 = v24;
      v21 = v25;
      --v19;
    }
    while (v19);
    *(_DWORD *)(v18 + 20) = v20;
  }
  v28 = *(_QWORD *)(v14 + 4160);
  if (v28)
  {
    v29 = *v134;
    *(_OWORD *)(*v134 + 624) = *(_OWORD *)(v28 + 624);
    v30 = *(id *)(v28 + 600);
    objc_msgSend(v30, "lastTimestamp");
    objc_msgSend(*(id *)(v29 + 600), "setLastTimestamp:");

  }
  v130 = v9;
  objc_initWeak(&location, (id)v14);
  v31 = *v134;
  objc_copyWeak(&to, &location);
  __p[0] = 0;
  __p[1] = 0;
  v145 = 0;
  v32 = *v13;
  v33 = v13[1];
  v34 = v33 - *v13;
  if (v33 != *v13)
  {
    v35 = 0x63FB9AEB1FDCD759 * (v34 >> 3);
    if (v35 >= 0x2328A701194539)
      abort();
    v36 = (char *)operator new(v34);
    v37 = 0;
    __p[0] = v36;
    __p[1] = v36;
    v145 = &v36[1864 * v35];
    do
    {
      v38 = v32 + v37;
      v39 = &v36[v37];
      *(_QWORD *)v39 = *(_QWORD *)(v32 + v37);
      v40 = *(_OWORD *)(v32 + v37 + 8);
      *((_QWORD *)v39 + 3) = *(_QWORD *)(v32 + v37 + 24);
      *(_OWORD *)(v39 + 8) = v40;
      v41 = *(_QWORD *)(v32 + v37 + 32);
      *((_DWORD *)v39 + 10) = *(_DWORD *)(v32 + v37 + 40);
      *((_QWORD *)v39 + 4) = v41;
      *(_QWORD *)(v39 + 44) = *(_QWORD *)(v32 + v37 + 44);
      v42 = *(_OWORD *)(v32 + v37 + 56);
      v43 = *(_OWORD *)(v32 + v37 + 72);
      v44 = (uint64_t)&v36[v37 + 120];
      *((_QWORD *)v39 + 11) = v44;
      v45 = &v36[v37 + 88];
      *((_OWORD *)v45 - 2) = v42;
      *((_OWORD *)v45 - 1) = v43;
      *((_QWORD *)v45 + 1) = v44;
      *((_QWORD *)v45 + 2) = v44;
      *((_QWORD *)v45 + 3) = 6;
      geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)v45, *(__int128 **)(v32 + v37 + 88), *(__int128 **)(v32 + v37 + 96));
      v46 = *(_QWORD *)(v32 + v37 + 1848);
      *(_QWORD *)&v36[v37 + 1853] = *(_QWORD *)(v32 + v37 + 1853);
      *(_QWORD *)&v36[v37 + 1848] = v46;
      v37 += 1864;
    }
    while (v38 + 1864 != v33);
    __p[1] = &v36[v37];
  }
  v160 = 0;
  v47 = (id *)operator new(0x28uLL);
  *v47 = &off_1E42C7160;
  objc_moveWeak(v47 + 1, &to);
  *((_OWORD *)v47 + 1) = *(_OWORD *)__p;
  v47[4] = v145;
  __p[1] = 0;
  v145 = 0;
  __p[0] = 0;
  v160 = v47;
  v48 = (uint8_t *)(*((uint64_t (**)(id *))*v47 + 2))(v47);
  v49 = v48;
  v50 = (uint8_t *)(v31 + 528);
  v164 = v48;
  if (buf == (uint8_t *)(v31 + 528))
    goto LABEL_21;
  v51 = *(uint8_t **)(v31 + 552);
  if (v48 == buf)
  {
    if (v51 == v50)
    {
      (*(void (**)(uint8_t *, __int128 *))(*(_QWORD *)buf + 24))(buf, &v175);
      (*(void (**)(uint8_t *))(*(_QWORD *)v164 + 32))(v164);
      v164 = 0;
      (*(void (**)(_QWORD, uint8_t *))(**(_QWORD **)(v31 + 552) + 24))(*(_QWORD *)(v31 + 552), buf);
      (*(void (**)(_QWORD))(**(_QWORD **)(v31 + 552) + 32))(*(_QWORD *)(v31 + 552));
      *(_QWORD *)(v31 + 552) = 0;
      v164 = buf;
      (*(void (**)(__int128 *, uint64_t))(v175 + 24))(&v175, v31 + 528);
      (*(void (**)(__int128 *))(v175 + 32))(&v175);
      *(_QWORD *)(v31 + 552) = v50;
      v49 = v164;
      if (v164 != buf)
        goto LABEL_22;
      goto LABEL_18;
    }
    (*(void (**)(uint8_t *, uint64_t))(*(_QWORD *)buf + 24))(buf, v31 + 528);
    (*(void (**)(uint8_t *))(*(_QWORD *)v164 + 32))(v164);
    v49 = *(uint8_t **)(v31 + 552);
    v164 = v49;
    *(_QWORD *)(v31 + 552) = v50;
LABEL_21:
    if (v49 != buf)
      goto LABEL_22;
LABEL_18:
    v52 = 4;
    v49 = buf;
    goto LABEL_25;
  }
  if (v51 == v50)
  {
    v49 = buf;
    (*(void (**)(uint64_t, uint8_t *))(*(_QWORD *)(v31 + 528) + 24))(v31 + 528, buf);
    (*(void (**)(_QWORD))(**(_QWORD **)(v31 + 552) + 32))(*(_QWORD *)(v31 + 552));
    *(_QWORD *)(v31 + 552) = v164;
    v164 = buf;
    v52 = 4;
    goto LABEL_25;
  }
  v164 = *(uint8_t **)(v31 + 552);
  *(_QWORD *)(v31 + 552) = v48;
  v49 = v51;
  if (v51 == buf)
    goto LABEL_18;
LABEL_22:
  if (!v49)
    goto LABEL_26;
  v52 = 5;
LABEL_25:
  (*(void (**)(uint8_t *))(*(_QWORD *)v49 + 8 * v52))(v49);
LABEL_26:
  v53 = v160;
  if (v160 == (id *)v159)
  {
    v54 = 4;
    v53 = (id *)v159;
  }
  else
  {
    if (!v160)
      goto LABEL_31;
    v54 = 5;
  }
  (*((void (**)(void))*v53 + v54))();
LABEL_31:
  v55 = (char *)__p[0];
  if (__p[0])
  {
    v56 = (char *)__p[1];
    v57 = __p[0];
    if (__p[1] != __p[0])
    {
      do
      {
        v58 = v56 - 1864;
        v59 = (_QWORD *)*((_QWORD *)v56 - 222);
        v60 = (_QWORD *)*((_QWORD *)v56 - 221);
        if (v59 != v60)
        {
          do
          {
            v61 = (void *)v59[31];
            if (v61 != (void *)v59[33])
              free(v61);
            v59 += 36;
          }
          while (v59 != v60);
          v59 = (_QWORD *)*((_QWORD *)v56 - 222);
        }
        if (v59 != *((_QWORD **)v56 - 220))
          free(v59);
        v56 -= 1864;
      }
      while (v58 != v55);
      v57 = __p[0];
    }
    __p[1] = v55;
    operator delete(v57);
  }
  objc_destroyWeak(&to);
  v62 = *v134;
  objc_copyWeak(&from, &location);
  v158 = 0;
  v156 = &off_1E42C71A8;
  objc_moveWeak(&v157, &from);
  v158 = &v156;
  objc_destroyWeak(&from);
  v63 = (uint64_t)v158;
  if (!v158)
    goto LABEL_48;
  if (v158 != &v156)
  {
    v63 = ((uint64_t (*)(uint64_t (***)()))(*v158)[2])(v158);
LABEL_48:
    v164 = (uint8_t *)v63;
    goto LABEL_50;
  }
  v164 = buf;
  ((void (*)(uint64_t, uint64_t))v156[3])((uint64_t)&v156, (uint64_t)buf);
LABEL_50:
  v64 = v62 + 560;
  if (buf != (uint8_t *)(v62 + 560))
  {
    v65 = v164;
    v66 = *(_QWORD *)(v62 + 584);
    if (v164 == buf)
    {
      if (v66 == v64)
      {
        (*(void (**)(uint8_t *, __int128 *))(*(_QWORD *)buf + 24))(buf, &v175);
        (*(void (**)(uint8_t *))(*(_QWORD *)v164 + 32))(v164);
        v164 = 0;
        (*(void (**)(_QWORD, uint8_t *))(**(_QWORD **)(v62 + 584) + 24))(*(_QWORD *)(v62 + 584), buf);
        (*(void (**)(_QWORD))(**(_QWORD **)(v62 + 584) + 32))(*(_QWORD *)(v62 + 584));
        *(_QWORD *)(v62 + 584) = 0;
        v164 = buf;
        (*(void (**)(__int128 *, uint64_t))(v175 + 24))(&v175, v62 + 560);
        (*(void (**)(__int128 *))(v175 + 32))(&v175);
      }
      else
      {
        (*(void (**)(uint8_t *, uint64_t))(*(_QWORD *)buf + 24))(buf, v62 + 560);
        (*(void (**)(uint8_t *))(*(_QWORD *)v164 + 32))(v164);
        v164 = *(uint8_t **)(v62 + 584);
      }
      *(_QWORD *)(v62 + 584) = v64;
    }
    else if (v66 == v64)
    {
      (*(void (**)(uint64_t, uint8_t *))(*(_QWORD *)(v62 + 560) + 24))(v62 + 560, buf);
      (*(void (**)(_QWORD))(**(_QWORD **)(v62 + 584) + 32))(*(_QWORD *)(v62 + 584));
      *(_QWORD *)(v62 + 584) = v164;
      v164 = buf;
    }
    else
    {
      v164 = *(uint8_t **)(v62 + 584);
      *(_QWORD *)(v62 + 584) = v65;
    }
  }
  v67 = v164;
  if (v164 == buf)
  {
    v68 = 4;
    v67 = buf;
  }
  else
  {
    if (!v164)
      goto LABEL_66;
    v68 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v67 + 8 * v68))();
LABEL_66:
  v69 = v158;
  if (v158 == &v156)
  {
    v70 = 4;
    v69 = &v156;
  }
  else
  {
    if (!v158)
      goto LABEL_71;
    v70 = 5;
  }
  (*v69)[v70]();
LABEL_71:
  v132 = (void *)MEMORY[0x1A1AF5730](v133);
  v71 = *v134;
  objc_copyWeak(&v140, &location);
  v141 = MEMORY[0x1A1AF5730](v132);
  v155 = 0;
  v153 = &off_1E42C71F0;
  objc_moveWeak(v154, &v140);
  v72 = (void *)v141;
  v141 = 0;
  v154[1] = v72;
  v155 = &v153;
  objc_destroyWeak(&v140);
  *(_QWORD *)&v175 = 0;
  *((_QWORD *)&v175 + 1) = &v175;
  v176 = 0x5012000000;
  v177 = __Block_byref_object_copy__13529;
  v178 = __Block_byref_object_dispose__13530;
  v179 = "";
  v73 = v180;
  v74 = (uint64_t)v155;
  if (!v155)
  {
LABEL_74:
    v181 = (_BYTE *)v74;
    goto LABEL_76;
  }
  if (v155 != &v153)
  {
    v74 = ((uint64_t (*)(uint64_t (***)()))(*v155)[2])(v155);
    goto LABEL_74;
  }
  v181 = v180;
  ((void (*)(uint64_t, uint64_t))v153[3])((uint64_t)&v153, (uint64_t)v180);
LABEL_76:
  *(_QWORD *)buf = 0;
  v162 = buf;
  i = 0xFC012000000;
  v164 = (uint8_t *)__Block_byref_object_copy__238;
  v165 = __Block_byref_object_dispose__239;
  v166 = "";
  v147[0] = (id)MEMORY[0x1E0C809B0];
  v147[1] = (id)3221225472;
  v147[2] = ___ZN12_GLOBAL__N_112PathAnimator21setCompletionCallbackENSt3__18functionIFvPS0_bONS_12PointSegmentEEEE_block_invoke;
  v147[3] = &unk_1E42F1148;
  v147[5] = buf;
  v147[6] = (id)v71;
  v147[4] = &v175;
  objc_msgSend(*(id *)(v71 + 600), "setCompletionHandler:", v147);
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v175, 8);
  if (v181 == v180)
  {
    v75 = 4;
  }
  else
  {
    if (!v181)
      goto LABEL_81;
    v75 = 5;
    v73 = v181;
  }
  (*(void (**)(_QWORD *))(*v73 + 8 * v75))(v73);
LABEL_81:
  v76 = v155;
  if (v155 == &v153)
  {
    v77 = 4;
    v76 = &v153;
  }
  else
  {
    if (!v155)
      goto LABEL_86;
    v77 = 5;
  }
  (*v76)[v77]();
LABEL_86:
  if (std::mutex::try_lock((std::mutex *)(v14 + 4176)))
  {
    v79 = *v134;
    v78 = v134[1];
    if (v78)
    {
      v80 = (unint64_t *)(v78 + 8);
      do
        v81 = __ldxr(v80);
      while (__stxr(v81 + 1, v80));
    }
    v82 = *(std::__shared_weak_count **)(v14 + 4168);
    *(_QWORD *)(v14 + 4160) = v79;
    *(_QWORD *)(v14 + 4168) = v78;
    if (v82)
    {
      p_shared_owners = (unint64_t *)&v82->__shared_owners_;
      do
        v84 = __ldaxr(p_shared_owners);
      while (__stlxr(v84 - 1, p_shared_owners));
      if (!v84)
      {
        ((void (*)(std::__shared_weak_count *))v82->__on_zero_shared)(v82);
        std::__shared_weak_count::__release_weak(v82);
      }
    }
    std::mutex::unlock((std::mutex *)(v14 + 4176));
  }
  objc_copyWeak(v147, &location);
  if (*(_QWORD *)(v131 + 24))
  {
    if (GEOGetVectorKitVKMuninLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMuninLog_onceToken, &__block_literal_global_10_11776);
    v85 = (id)GEOGetVectorKitVKMuninLog_log;
    if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F029000, v85, OS_LOG_TYPE_INFO, "Required view already loaded.", buf, 2u);
    }

    md::MuninSceneLogic::addActiveViews(*(_QWORD *)(v14 + 136), *(uint64_t **)(v131 + 16));
    -[VKMuninCameraController animatePath:animator:preloadedRequiredViews:prePruneData:completionHandler:]::$_7::operator()(v147);
    goto LABEL_138;
  }
  v87 = *(const md::mun::CollectionPoint **)(*v134 + 504);
  v86 = *(const md::mun::CollectionPoint **)(*v134 + 512);
  if (v87 == v86)
  {
    *(_QWORD *)buf = 0;
    v162 = 0;
    i = 0;
  }
  else
  {
    do
    {
      md::mun::MuninMetadataContainer::addActiveMetadataPoint(*(std::mutex **)(*(_QWORD *)(v14 + 136) + 168), v87);
      v87 = (const md::mun::CollectionPoint *)((char *)v87 + 1992);
    }
    while (v87 != v86);
    v88 = *(_QWORD *)(*v134 + 504);
    v89 = *(_QWORD *)(*v134 + 512);
    *(_QWORD *)buf = 0;
    v162 = 0;
    for (i = 0; v88 != v89; v88 += 1992)
    {
      v90 = *(__int128 **)(v88 + 1872);
      v91 = *(uint64_t **)(v88 + 1864);
      if (v90 != (__int128 *)v91)
      {
        std::vector<std::pair<md::mun::ViewId,unsigned int>>::__insert_with_size[abi:nn180100]<std::__wrap_iter<std::pair<md::mun::ViewId,unsigned int> const*>,std::__wrap_iter<std::pair<md::mun::ViewId,unsigned int> const*>>((void **)buf, (uint64_t)v162, v91, v90, 0xAAAAAAAAAAAAAAABLL * (((char *)v90 - (char *)v91) >> 3));
        ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v14 + 136) + 520) + 16);
      }
    }
  }
  v92 = *(_QWORD *)(v14 + 4432);
  v93 = *(_QWORD *)(v14 + 4424);
  if (GEOGetVectorKitVKMuninLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMuninLog_onceToken, &__block_literal_global_10_11776);
  v94 = (id)GEOGetVectorKitVKMuninLog_log;
  if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
  {
    LODWORD(v175) = 134217984;
    *(_QWORD *)((char *)&v175 + 4) = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v162[-*(_QWORD *)buf] >> 3);
    _os_log_impl(&dword_19F029000, v94, OS_LOG_TYPE_INFO, "Preloading %zu initial views", (uint8_t *)&v175, 0xCu);
  }

  if (GEOGetVectorKitResourceLoadingLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitResourceLoadingLog_onceToken, &__block_literal_global_19_11788);
  v95 = (id)GEOGetVectorKitResourceLoadingLog_log;
  if (os_signpost_enabled(v95))
  {
    LOWORD(v175) = 0;
    _os_signpost_emit_with_name_impl(&dword_19F029000, v95, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PathPreload", (const char *)&unk_1A0189141, (uint8_t *)&v175, 2u);
  }

  v96 = *(_QWORD *)(v14 + 136);
  objc_copyWeak(&v137, &location);
  *(_QWORD *)&v138 = v93;
  *((_QWORD *)&v138 + 1) = v92;
  objc_copyWeak(&v139, v147);
  v152 = 0;
  v97 = (id *)operator new(0x28uLL);
  *v97 = &off_1E42C7238;
  objc_moveWeak(v97 + 1, &v137);
  *((_OWORD *)v97 + 1) = v138;
  objc_moveWeak(v97 + 4, &v139);
  v152 = v97;
  md::MuninSceneLogic::addPreloadViews(v96, (const void **)buf, &v151);
  v98 = v152;
  if (v152 == (id *)&v151)
  {
    v99 = 4;
    v98 = (id *)&v151;
  }
  else
  {
    if (!v152)
      goto LABEL_123;
    v99 = 5;
  }
  (*((void (**)(void))*v98 + v99))();
LABEL_123:
  objc_destroyWeak(&v139);
  objc_destroyWeak(&v137);
  if (GEOGetVectorKitVKMuninLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMuninLog_onceToken, &__block_literal_global_10_11776);
  v100 = (id)GEOGetVectorKitVKMuninLog_log;
  if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
  {
    v101 = 0x367D6E020E64C149 * ((uint64_t)(*(_QWORD *)(*v134 + 512) - *(_QWORD *)(*v134 + 504)) >> 3);
    LODWORD(v175) = 134217984;
    *(_QWORD *)((char *)&v175 + 4) = v101;
    _os_log_impl(&dword_19F029000, v100, OS_LOG_TYPE_INFO, "Preloading %zu optional points", (uint8_t *)&v175, 0xCu);
  }

  v102 = *(_QWORD *)(*v134 + 504);
  v103 = *(_QWORD *)(*v134 + 512);
  if (v102 != v103)
  {
    v104 = v102 + 1888;
    do
    {
      if (*(_QWORD *)v104 != *(_QWORD *)(v104 + 8))
      {
        v108 = *(_QWORD *)(v14 + 136);
        ++*(_DWORD *)(*(_QWORD *)(v108 + 520) + 16);
        objc_copyWeak(&v136, &location);
        v150 = 0;
        v148 = &off_1E42C7280;
        objc_moveWeak(&v149, &v136);
        v150 = &v148;
        objc_destroyWeak(&v136);
        md::MuninSceneLogic::addPreloadViews(v108, (const void **)v104, &v148);
        v105 = v150;
        if (v150 == &v148)
        {
          v105 = &v148;
          v106 = 4;
        }
        else
        {
          if (!v150)
            goto LABEL_131;
          v106 = 5;
        }
        (*v105)[v106]();
      }
LABEL_131:
      v107 = v104 + 104;
      v104 += 1992;
    }
    while (v107 != v103);
  }
  if (*(_QWORD *)buf)
    operator delete(*(void **)buf);
LABEL_138:
  v109 = *(_QWORD *)objc_msgSend((id)v14, "runLoopController");
  if (v109)
  {
    buf[0] = 4;
    md::MapEngine::setNeedsTick(v109, buf);
  }
  v110 = *(_QWORD *)(v14 + 136);
  objc_msgSend((id)v14, "canvas");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "size");
  *(float *)&v112 = v112;
  *(float *)&v113 = v113;
  v114 = 720;
  if ((float)(*(float *)&v112 / fmaxf(*(float *)&v113, 0.01)) > 1.0)
    v114 = 736;
  v115 = *(_QWORD *)(v110 + v114);

  v135 = v115;
  objc_msgSend((id)v14, "zoomAnimated:completion:", &v135, 0);
  objc_destroyWeak(v147);
  v116 = *(_QWORD *)(v14 + 136);
  v117 = *v134;
  LOBYTE(v162) = 0;
  v168 = 0;
  v172 = 0;
  buf[0] = 1;
  v118 = *(_QWORD *)(v117 + 504);
  v119 = *(_QWORD *)(v117 + 512);
  v120 = v119 - v118;
  if (v119 == v118)
  {
    v124 = 0;
    v125 = 0;
    v122 = 0;
  }
  else
  {
    v121 = 0x367D6E020E64C149 * (v120 >> 3);
    if (v121 >= 0x20E64C148FEF8DLL)
      abort();
    v122 = (char *)operator new(v120);
    v123 = 0;
    v124 = &v122[1992 * v121];
    do
    {
      md::mun::PointView::PointView((md::mun::PointView *)&v122[v123], (const md::mun::PointView *)(v118 + v123));
      v123 += 1992;
    }
    while (v118 + v123 != v119);
    v125 = &v122[v123];
  }
  *(_QWORD *)&v126 = v122;
  *((_QWORD *)&v126 + 1) = v125;
  v169 = v126;
  v170 = v124;
  v171 = v130;
  v168 = 1;
  md::MuninSceneLogic::addSceneEvent(v116, (uint64_t)buf);
  if (v172)
  {
    if (v173)
    {
      v174 = v173;
      operator delete(v173);
    }
    v172 = 0;
  }
  if (v168)
  {
    v127 = (_QWORD *)v169;
    if ((_QWORD)v169)
    {
      v128 = (_QWORD *)*((_QWORD *)&v169 + 1);
      v129 = (void *)v169;
      if (*((_QWORD *)&v169 + 1) != (_QWORD)v169)
      {
        do
        {
          v128 -= 249;
          std::__destroy_at[abi:nn180100]<md::mun::PointView,0>(v128);
        }
        while (v128 != v127);
        v129 = (void *)v169;
      }
      *((_QWORD *)&v169 + 1) = v127;
      operator delete(v129);
    }
  }

  objc_destroyWeak(&location);
}

- (void)animatePath:(void *)a3 withTarget:(const void *)a4 lookAtTarget:(BOOL)a5 constantLod:(BOOL)a6 prePruneData:(BOOL)a7 completionHandler:(id)a8
{
  _BOOL8 v9;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  md::MuninSceneLogic *v15;
  void *v16;
  uint64_t LodForCavasSize;
  void *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  uint64_t v22;
  std::__shared_weak_count *shared_owners;
  unint64_t v24;
  unint64_t *p_shared_weak_owners;
  unint64_t v26;
  unint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  unint64_t v30;
  _BYTE *v31;
  void *v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  _BYTE *v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  void *v40;
  NSObject *v41;
  unsigned int v42;
  id v43;
  void *__p[2];
  void *v45[2];
  int v46;
  uint64_t v47;
  std::__shared_weak_count *v48;
  CGSize v49;

  v9 = a5;
  v13 = a8;
  v14 = (void (**)(_QWORD, _QWORD))v13;
  if ((unint64_t)(0x63FB9AEB1FDCD759 * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3)) >= 2)
  {
    v15 = (md::MuninSceneLogic *)*((_QWORD *)self + 17);
    v43 = v13;
    -[VKCameraController canvas](self, "canvas");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sizeInPixels");
    LodForCavasSize = md::MuninSceneLogic::getLodForCavasSize(v15, v49);

    v18 = -[VKCameraController mapDataAccess](self, "mapDataAccess");
    gdc::CameraFrame<geo::Radians,double>::toRigidTransformEcefNoOffset((uint64_t)__p, (double *)self + 560);
    v19 = *((_QWORD *)self + 17);
    v20 = (std::__shared_weak_count *)operator new(0x2A8uLL);
    v20->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    v20->__shared_weak_owners_ = 0;
    v20->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42DABE8;
    v47 = v22;
    v48 = v20;
    shared_owners = (std::__shared_weak_count *)v20[1].__shared_owners_;
    v14 = (void (**)(_QWORD, _QWORD))v43;
    if (shared_owners)
    {
      if (shared_owners->__shared_owners_ != -1)
        goto LABEL_15;
      do
        v24 = __ldxr(p_shared_owners);
      while (__stxr(v24 + 1, p_shared_owners));
      p_shared_weak_owners = (unint64_t *)&v20->__shared_weak_owners_;
      do
        v26 = __ldxr(p_shared_weak_owners);
      while (__stxr(v26 + 1, p_shared_weak_owners));
      v20[1].__vftable = (std::__shared_weak_count_vtbl *)&v20[1];
      v20[1].__shared_owners_ = (uint64_t)v20;
      std::__shared_weak_count::__release_weak(shared_owners);
    }
    else
    {
      do
        v27 = __ldxr(p_shared_owners);
      while (__stxr(v27 + 1, p_shared_owners));
      v28 = (unint64_t *)&v20->__shared_weak_owners_;
      do
        v29 = __ldxr(v28);
      while (__stxr(v29 + 1, v28));
      v20[1].__vftable = (std::__shared_weak_count_vtbl *)&v20[1];
      v20[1].__shared_owners_ = (uint64_t)v20;
    }
    do
      v30 = __ldaxr(p_shared_owners);
    while (__stlxr(v30 - 1, p_shared_owners));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
LABEL_15:
    *(_OWORD *)__p = 0u;
    *(_OWORD *)v45 = 0u;
    v46 = 1065353216;
    -[VKMuninCameraController animatePath:animator:preloadedRequiredViews:prePruneData:completionHandler:](self, "animatePath:animator:preloadedRequiredViews:prePruneData:completionHandler:", a3, &v47, __p, v42, v43);
    v31 = v45[0];
    if (!v45[0])
    {
LABEL_16:
      v32 = __p[0];
      __p[0] = 0;
      if (v32)
        operator delete(v32);
      v33 = v48;
      if (v48)
      {
        v34 = (unint64_t *)&v48->__shared_owners_;
        do
          v35 = __ldaxr(v34);
        while (__stlxr(v35 - 1, v34));
        if (!v35)
        {
          ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
          std::__shared_weak_count::__release_weak(v33);
        }
      }
      goto LABEL_40;
    }
    while (1)
    {
      v36 = *(_BYTE **)v31;
      v37 = (std::__shared_weak_count *)*((_QWORD *)v31 + 17);
      if (v37)
      {
        v38 = (unint64_t *)&v37->__shared_owners_;
        do
          v39 = __ldaxr(v38);
        while (__stlxr(v39 - 1, v38));
        if (!v39)
          break;
      }
      if (v31[112])
        goto LABEL_29;
LABEL_30:
      v40 = (void *)*((_QWORD *)v31 + 4);
      if (v40 != *((void **)v31 + 6))
        free(v40);
      operator delete(v31);
      v31 = v36;
      if (!v36)
        goto LABEL_16;
    }
    ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
    std::__shared_weak_count::__release_weak(v37);
    if (!v31[112])
      goto LABEL_30;
LABEL_29:
    v31[112] = 0;
    goto LABEL_30;
  }
  if (v13)
  {
    if (GEOGetVectorKitVKMuninLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKMuninLog_onceToken, &__block_literal_global_10_11776);
    v41 = (id)GEOGetVectorKitVKMuninLog_log;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_19F029000, v41, OS_LOG_TYPE_ERROR, "PointList size < 2. Cannot animate path.", (uint8_t *)__p, 2u);
    }

    v14[2](v14, 0);
  }
LABEL_40:

}

- (void)runBumpAnimation:(const void *)a3 targetPoint:(const void *)a4 completionHandler:(id)a5
{
  id v8;
  long double v9;
  double v10;
  double v11;
  __double2 v12;
  double v13;
  __double2 v14;
  long double v15;
  long double v16;
  long double v17;
  double v18;
  double v19;
  double v20;
  __double2 v21;
  long double v22;
  long double v23;
  double v24;
  long double v25;
  double v26;
  __double2 v27;
  __double2 v28;
  void *v29;
  double *v30;
  int v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  long double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  long double v54;
  double v55;
  long double v56;
  long double v57;
  VKTimedAnimation *v58;
  void *v59;
  double v60;
  double v61;
  float v62;
  long double v63;
  uint64_t v64;
  void *v65;
  double v66;
  double v67;
  float v68;
  long double v69;
  void *v70;
  double v71;
  double v72;
  uint64_t (***v73)();
  uint64_t v74;
  uint64_t (***v75)();
  uint64_t v76;
  uint64_t (***v77)();
  uint64_t v78;
  double v79;
  __int128 v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  id v89;
  uint64_t v90;
  id v91;
  id from;
  id v93;
  id v94;
  id v95;
  id to;
  id location;
  _QWORD v98[5];
  _QWORD v99[5];
  uint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  uint64_t (**v109)();
  id v110[2];
  uint64_t (***v111)();
  uint64_t (**v112)();
  id v113;
  uint64_t (***v114)();
  uint64_t (**v115)();
  id v116;
  uint64_t (***v117)();
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  objc_initWeak(&location, self);
  v9 = *((double *)a3 + 2);
  v84 = *((double *)a3 + 1);
  v86 = *(double *)a3;
  v10 = sqrt(v86 * v86 + v84 * v84);
  v11 = atan2(v9, v10 * 0.996647189);
  v12 = __sincos_stret(v11);
  v82 = v10;
  v13 = atan2(v9 + v12.__sinval * v12.__sinval * 42841.3115 * v12.__sinval, v10 - v12.__cosval * v12.__cosval * 42697.6727 * v12.__cosval);
  v14 = __sincos_stret(v13);
  v15 = *(double *)a4;
  v16 = *((double *)a4 + 1);
  v17 = *((double *)a4 + 2);
  v18 = sqrt(v15 * v15 + v16 * v16);
  v19 = atan2(v17, v18 * 0.996647189);
  v20 = atan2(v16, v15);
  v21 = __sincos_stret(v19);
  v22 = atan2(v17 + v21.__sinval * v21.__sinval * 42841.3115 * v21.__sinval, v18 - v21.__cosval * v21.__cosval * 42697.6727 * v21.__cosval);
  v23 = tan(v22 * 0.5 + 0.785398163);
  v24 = atan(v23) * 2.0 + -1.57079633;
  v25 = fmod(v20 + 3.14159265, 6.28318531);
  v26 = fmod(v25 + 6.28318531, 6.28318531) + -3.14159265;
  v27 = __sincos_stret(v24);
  v28 = __sincos_stret(v26);
  objc_copyWeak(&to, &location);
  objc_copyWeak(&v95, &location);
  v88 = (void *)MEMORY[0x1A1AF5730](v8);

  objc_copyWeak(&v93, &location);
  v94 = (id)MEMORY[0x1A1AF5730](v88);
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (double *)*((_QWORD *)self + 17);
  v31 = objc_msgSend(v29, "slowMotionBump");
  *(double *)&v32 = COERCE_DOUBLE(operator new());
  if (v31)
    v33 = 10.0;
  else
    v33 = 1.0;
  v34 = *((_QWORD *)a3 + 2);
  v35 = v30[97];
  v79 = v30[98];
  v36 = v30[99];
  v37 = v30[100];
  v80 = *(_OWORD *)a3;
  objc_copyWeak(&from, &to);
  v117 = 0;
  v115 = &off_1E42C7E50;
  objc_moveWeak(&v116, &from);
  v117 = &v115;
  objc_destroyWeak(&from);
  objc_copyWeak(&v91, &v95);
  v114 = 0;
  v112 = &off_1E42C7E98;
  objc_moveWeak(&v113, &v91);
  v114 = &v112;
  objc_destroyWeak(&v91);
  objc_copyWeak(&v89, &v93);
  v90 = MEMORY[0x1A1AF5730](v94);
  v111 = 0;
  v109 = &off_1E42C7EE0;
  objc_moveWeak(v110, &v89);
  v38 = (void *)v90;
  v90 = 0;
  v110[1] = v38;
  v111 = &v109;
  objc_destroyWeak(&v89);
  *(_OWORD *)v32 = v80;
  *(_QWORD *)(v32 + 16) = v34;
  *(_BYTE *)(v32 + 48) = 0;
  *(_QWORD *)(v32 + 56) = &off_1E42B4C90;
  *(_QWORD *)(v32 + 64) = 0;
  v39 = (uint64_t)v117;
  if (!v117)
    goto LABEL_7;
  if (v117 != &v115)
  {
    v39 = ((uint64_t (*)(uint64_t (***)()))(*v117)[2])(v117);
LABEL_7:
    *(_QWORD *)(v32 + 104) = v39;
    goto LABEL_9;
  }
  *(_QWORD *)(v32 + 104) = v32 + 80;
  ((void (*)(uint64_t, uint64_t))v115[3])((uint64_t)&v115, v32 + 80);
LABEL_9:
  v40 = (uint64_t)v114;
  if (!v114)
  {
LABEL_12:
    *(_QWORD *)(v32 + 136) = v40;
    goto LABEL_14;
  }
  if (v114 != &v112)
  {
    v40 = ((uint64_t (*)(uint64_t (***)()))(*v114)[2])(v114);
    goto LABEL_12;
  }
  *(_QWORD *)(v32 + 136) = v32 + 112;
  ((void (*)(uint64_t, uint64_t))v112[3])((uint64_t)&v112, v32 + 112);
LABEL_14:
  v41 = (uint64_t)v111;
  if (!v111)
  {
LABEL_17:
    *(_QWORD *)(v32 + 168) = v41;
    goto LABEL_19;
  }
  if (v111 != &v109)
  {
    v41 = ((uint64_t (*)(uint64_t (***)()))(*v111)[2])(v111);
    goto LABEL_17;
  }
  *(_QWORD *)(v32 + 168) = v32 + 144;
  ((void (*)(uint64_t, uint64_t))v109[3])((uint64_t)&v109, v32 + 144);
LABEL_19:
  v42 = v82 / v14.__cosval - 6378137.0 / sqrt(1.0 - v14.__sinval * v14.__sinval * 0.00669437999);
  v43 = 6378137.0 / sqrt(1.0 - v27.__sinval * v27.__sinval * 0.00669437999);
  v44 = (v43 + v42) * v27.__cosval;
  v45 = v42 + v43 * 0.99330562;
  v46 = -(v86 - v44 * v28.__cosval);
  v47 = -(v84 - v44 * v28.__sinval);
  v48 = -(v9 - v45 * v27.__sinval);
  v49 = v36 * v33;
  v50 = v37 * v33;
  v51 = 0.45 / sqrt(v46 * v46 + v47 * v47 + v48 * v48);
  v52 = *(double *)(v32 + 8) + v51 * v47;
  v53 = *(double *)(v32 + 16);
  *(double *)(v32 + 24) = *(double *)v32 + v51 * v46;
  *(double *)(v32 + 32) = v52;
  *(long double *)(v32 + 40) = v53 + v51 * v48;
  v87 = v35 * 0.025;
  v54 = 1.0 - v35 * 0.025;
  v55 = pow(v54, v49 * -1000.0);
  v56 = 1.0 - v79 * 0.025;
  v57 = pow(v56, v50 * -1000.0);
  v58 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", v50 + v49, v32 + 80);
  v83 = v57;
  v85 = v50;
  v81 = v50 + v49;
  v59 = *(void **)(v32 + 64);
  *(_QWORD *)(v32 + 64) = v58;

  v60 = pow(v54, 16.6666667);
  v61 = fabs(v55 * 0.01) * (-0.001 * v54 * (v60 + -1.0)) / v87;
  v62 = v49 * 1000.0;
  v63 = pow(v54, v62);
  v64 = MEMORY[0x1E0C809B0];
  v100 = MEMORY[0x1E0C809B0];
  v101 = 3221225472;
  *(float *)&v63 = -(v61 - v63 * v61) / (v60 + -1.0);
  v102 = __dynamicValueAnimationTimingFunction_block_invoke;
  v103 = &__block_descriptor_72_e8_f12__0f8l;
  v104 = *(float *)&v63;
  v105 = v49 * 1000.0;
  v106 = v61;
  v107 = v54;
  v108 = v60;
  v65 = (void *)objc_msgSend(&v100, "copy");
  v66 = pow(v56, 16.6666667);
  v67 = fabs(v83 * 0.01) * (-0.001 * v56 * (v66 + -1.0)) / (v79 * 0.025);
  v68 = v85 * 1000.0;
  v69 = pow(v56, v68);
  v100 = v64;
  v101 = 3221225472;
  *(float *)&v69 = -(v67 - v69 * v67) / (v66 + -1.0);
  v102 = __dynamicValueAnimationTimingFunction_block_invoke;
  v103 = &__block_descriptor_72_e8_f12__0f8l;
  v104 = *(float *)&v69;
  v105 = v85 * 1000.0;
  v106 = v67;
  v107 = v56;
  v108 = v66;
  v70 = (void *)objc_msgSend(&v100, "copy");
  v100 = v64;
  v101 = 3221225472;
  v102 = ___ZN12_GLOBAL__N_112BumpAnimatorC2EN2gm6MatrixIdLi3ELi1EEERKS3_dddddNSt3__18functionIFvRKN3geo10GeocentricIdEEEEENS7_IFvvEEENS7_IFvbEEE_block_invoke;
  v103 = &unk_1E42F1170;
  v106 = *(double *)&v32;
  v107 = v49 / v81;
  v71 = COERCE_DOUBLE(v65);
  v104 = v71;
  v72 = COERCE_DOUBLE(v70);
  v105 = v72;
  objc_msgSend(*(id *)(v32 + 64), "setTimingFunction:", &v100);
  v99[0] = v64;
  v99[1] = 3221225472;
  v99[2] = ___ZN12_GLOBAL__N_112BumpAnimatorC2EN2gm6MatrixIdLi3ELi1EEERKS3_dddddNSt3__18functionIFvRKN3geo10GeocentricIdEEEEENS7_IFvvEEENS7_IFvbEEE_block_invoke_2;
  v99[3] = &__block_descriptor_40_e8_v12__0f8l;
  v99[4] = v32;
  objc_msgSend(*(id *)(v32 + 64), "setStepHandler:", v99);
  v98[0] = v64;
  v98[1] = 3221225472;
  v98[2] = ___ZN12_GLOBAL__N_112BumpAnimatorC2EN2gm6MatrixIdLi3ELi1EEERKS3_dddddNSt3__18functionIFvRKN3geo10GeocentricIdEEEEENS7_IFvvEEENS7_IFvbEEE_block_invoke_3;
  v98[3] = &__block_descriptor_40_e8_v12__0B8l;
  v98[4] = v32;
  objc_msgSend(*(id *)(v32 + 64), "setCompletionHandler:", v98);

  v73 = v111;
  if (v111 == &v109)
  {
    v74 = 4;
    v73 = &v109;
  }
  else
  {
    if (!v111)
      goto LABEL_24;
    v74 = 5;
  }
  (*v73)[v74]();
LABEL_24:
  v75 = v114;
  if (v114 == &v112)
  {
    v76 = 4;
    v75 = &v112;
  }
  else
  {
    if (!v114)
      goto LABEL_29;
    v76 = 5;
  }
  (*v75)[v76]();
LABEL_29:
  v77 = v117;
  if (v117 == &v115)
  {
    v78 = 4;
    v77 = &v115;
    goto LABEL_33;
  }
  if (v117)
  {
    v78 = 5;
LABEL_33:
    (*v77)[v78]();
  }
  -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 1);
  md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), *(VKAnimation **)(*((_QWORD *)self + 530) + 64));

  objc_destroyWeak(&v93);
  objc_destroyWeak(&v95);
  objc_destroyWeak(&to);
  objc_destroyWeak(&location);
}

- (void)pathAnimationPrepared:(PathAnimationDescription *)a3 tap:(TapDescription *)a4 preloadedViews:()unordered_map<gdc:()std:()gdc:()std:(std:(std::shared_ptr<gdc::LayerData>>>> *)a5 :allocator<std::pair<const)gdc::LayerDataRequestKey :equal_to<gdc::LayerDataRequestKey> :LayerDataRequestKeyHash :shared_ptr<gdc::LayerData> :LayerDataRequestKey
{
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  __int128 *v8;
  __int128 *v9;
  uint64_t *v10;
  uint64_t *v11;
  _QWORD *v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  uint64_t v16;
  __n128 v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  unint64_t v37;
  _QWORD *v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  unint64_t v59;
  void *v60;
  _QWORD *v61;
  _QWORD *v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int64_t v66;
  unint64_t v67;
  char *v68;
  char *v69;
  __int128 v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t *v80;
  unint64_t v81;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  uint64_t v87;
  __int128 v88;
  _QWORD *v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD *v93;
  unint64_t v94;
  _BYTE *v95;
  void *v96;
  _QWORD *v97;
  _QWORD *v98;
  _BYTE *v99;
  std::__shared_weak_count *v100;
  unint64_t *v101;
  unint64_t v102;
  void *v103;
  void *v104;
  std::__shared_weak_count *v105;
  unint64_t *v106;
  unint64_t v107;
  char *v108;
  char *v109;
  char *v110;
  _QWORD *v111;
  _QWORD *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 *v119;
  uint64_t v120;
  uint64_t v121;
  __int128 v122;
  uint64_t v123;
  uint64_t v124;
  __int128 *v125;
  uint64_t v126;
  _QWORD *v127;
  unint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  __int128 *v132;
  BOOL v133;
  uint64_t v134;
  _OWORD *v135;
  uint64_t v136;
  __int128 v137;
  uint64_t v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  _BYTE *v148;
  char *v149;
  char *v150;
  unint64_t v151;
  unint64_t v152;
  __int128 *v153;
  _OWORD *v154;
  unint64_t v155;
  __int128 v156;
  unint64_t v157;
  unint64_t v158;
  uint64_t *v159;
  _QWORD *v160;
  uint64_t v161;
  char v162;
  _anonymous_namespace_::PendingPathAnimation *v163;
  uint64_t v164;
  uint64_t v165;
  void *v166[2];
  void *v167[2];
  int v168;
  _OWORD v169[6];
  uint64_t v170;
  __int128 v171;
  uint64_t v172;
  uint64_t v173;
  int v174;
  uint64_t v175;
  __int128 v176;
  __int128 v177;
  _BYTE *v178;
  _BYTE *v179;
  _BYTE *v180;
  uint64_t v181;
  _BYTE v182[1728];
  _QWORD v183[2];
  __int128 v184;
  uint64_t v185;
  __int128 v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  char *v191;
  _QWORD *v192;
  __int128 v193;
  uint64_t v194;
  __int128 v195;
  uint64_t v196;
  __int128 v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  std::__shared_weak_count *v202;
  uint64_t v203;
  double v204[16];
  uint64_t v205[7];
  __int128 v206;
  char *v207;
  __int128 v208;
  uint64_t v209;
  __int128 v210;
  uint64_t v211;
  __int128 v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  __int128 v216;
  uint64_t v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  uint64_t v224;
  __int128 v225;
  uint64_t v226;
  uint64_t v227;
  int v228;
  uint64_t v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  _BYTE v234[1728];
  _QWORD v235[2];
  __int128 v236;
  uint64_t v237;
  __int128 v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  _QWORD *v242;
  unint64_t v243;
  uint64_t v244;
  uint64_t v245;
  int v246;
  uint64_t v247;

  v5 = MEMORY[0x1E0C80A78](self);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (_QWORD *)v5;
  v247 = *MEMORY[0x1E0C80C00];
  v13 = *(std::__shared_weak_count **)(v5 + 4552);
  *(_QWORD *)(v5 + 4544) = 0;
  *(_QWORD *)(v5 + 4552) = 0;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  if (v12[567] != *((_QWORD *)v9 + 252))
    return;
  v16 = v12[570];
  if (v16)
  {
    objc_msgSend(v12, "camera", gdc::CameraFrame<geo::Radians,double>::fromRigidTransformEcefNoOffset((uint64_t)v205, (double *)(v16 + 48)));
    v17.n128_f64[0] = gdc::ViewDataAccess::worldViewProjectionMatrix((uint64_t)v204, (double *)v206, v205);
    v18 = (std::__shared_weak_count *)*((_QWORD *)&v206 + 1);
    if (*((_QWORD *)&v206 + 1))
    {
      v19 = (unint64_t *)(*((_QWORD *)&v206 + 1) + 8);
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *, __n128))v18->__on_zero_shared)(v18, v17);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    v21 = *((double *)v9 + 1);
    v22 = *((double *)v9 + 2);
    v23 = 1.0 / (v204[15] + v204[3] * *(double *)v9 + v204[7] * v21 + v204[11] * v22);
    v24 = v23 * (v204[12] + *(double *)v9 * v204[0] + v21 * v204[4] + v22 * v204[8]);
    v25 = v23 * (v204[13] + v204[1] * *(double *)v9 + v204[5] * v21 + v204[9] * v22);
    v26 = v23 * (v204[14] + v204[2] * *(double *)v9 + v204[6] * v21 + v204[10] * v22);
    v27 = fabs(v25);
    if (fabs(v24) > 1.0 || v27 > 1.0 || v26 > 1.0)
    {
      v30 = v12[17];
      BYTE8(v206) = 0;
      LOBYTE(v217) = 0;
      LOBYTE(v220) = 0;
      LOBYTE(v206) = 4;
      md::MuninSceneLogic::addSceneEvent(v30, (uint64_t)&v206);
      if ((_BYTE)v220)
      {
        if (*((_QWORD *)&v220 + 1))
        {
          *(_QWORD *)&v221 = *((_QWORD *)&v220 + 1);
          operator delete(*((void **)&v220 + 1));
        }
        LOBYTE(v220) = 0;
      }
      if ((_BYTE)v217)
      {
        v31 = (_QWORD *)v218;
        if ((_QWORD)v218)
        {
          v32 = (_QWORD *)*((_QWORD *)&v218 + 1);
          if (*((_QWORD *)&v218 + 1) != (_QWORD)v218)
          {
            do
            {
              v32 -= 249;
              std::__destroy_at[abi:nn180100]<md::mun::PointView,0>(v32);
            }
            while (v32 != v31);
            v31 = (_QWORD *)v218;
          }
          v33 = v31;
LABEL_96:
          operator delete(v33);
          return;
        }
      }
      return;
    }
    v206 = 0uLL;
    v207 = 0;
    v64 = *v11;
    v65 = v11[1];
    v66 = v65 - *v11;
    if (v65 != *v11)
    {
      v67 = 0x63FB9AEB1FDCD759 * (v66 >> 3);
      if (v67 > 0x2328A701194538)
        abort();
      v68 = (char *)operator new(v66);
      *(_QWORD *)&v206 = v68;
      *((_QWORD *)&v206 + 1) = v68;
      v207 = &v68[1864 * v67];
      do
      {
        v69 = v68;
        *(_QWORD *)v68 = *(_QWORD *)v64;
        v70 = *(_OWORD *)(v64 + 8);
        *((_QWORD *)v68 + 3) = *(_QWORD *)(v64 + 24);
        *(_OWORD *)(v68 + 8) = v70;
        v71 = *(_QWORD *)(v64 + 32);
        *((_DWORD *)v68 + 10) = *(_DWORD *)(v64 + 40);
        *((_QWORD *)v68 + 4) = v71;
        *(_QWORD *)(v68 + 44) = *(_QWORD *)(v64 + 44);
        v72 = *(_OWORD *)(v64 + 56);
        v73 = *(_OWORD *)(v64 + 72);
        *((_QWORD *)v68 + 11) = v68 + 120;
        v74 = v68 + 88;
        *(_OWORD *)(v68 + 56) = v72;
        *(_OWORD *)(v68 + 72) = v73;
        *((_QWORD *)v68 + 12) = v68 + 120;
        *((_QWORD *)v68 + 13) = v68 + 120;
        *((_QWORD *)v68 + 14) = 6;
        geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)(v68 + 88), *(__int128 **)(v64 + 88), *(__int128 **)(v64 + 96));
        v75 = *(_QWORD *)(v64 + 1848);
        *(_QWORD *)((char *)v74 + 1765) = *(_QWORD *)(v64 + 1853);
        v74[220] = v75;
        v64 += 1864;
        v68 = (char *)(v74 + 222);
      }
      while (v64 != v65);
      *((_QWORD *)&v206 + 1) = v69 + 1864;
    }
    v208 = *(_OWORD *)(v11 + 3);
    v76 = v11[5];
    v210 = *((_OWORD *)v11 + 3);
    v77 = v11[8];
    v209 = v76;
    v211 = v77;
    v212 = *(_OWORD *)(v11 + 9);
    v213 = v11[11];
    v214 = v11[12];
    v78 = v11[14];
    v79 = v11[15];
    v215 = v11[13];
    *(_QWORD *)&v216 = v78;
    *((_QWORD *)&v216 + 1) = v79;
    if (v79)
    {
      v80 = (unint64_t *)(v79 + 8);
      do
        v81 = __ldxr(v80);
      while (__stxr(v81 + 1, v80));
    }
    v82 = v11[16];
    v83 = v9[3];
    v220 = v9[2];
    v221 = v83;
    v84 = v9[5];
    v222 = v9[4];
    v223 = v84;
    v85 = v9[1];
    v218 = *v9;
    v219 = v85;
    v86 = *((_QWORD *)v9 + 12);
    v217 = v82;
    v224 = v86;
    v225 = *(__int128 *)((char *)v9 + 104);
    v228 = *((_DWORD *)v9 + 34);
    v87 = *((_QWORD *)v9 + 16);
    v226 = *((_QWORD *)v9 + 15);
    v227 = v87;
    v229 = *(_QWORD *)((char *)v9 + 140);
    v88 = *(__int128 *)((char *)v9 + 168);
    v230 = *(__int128 *)((char *)v9 + 152);
    v231 = v88;
    *(_QWORD *)&v232 = v234;
    *((_QWORD *)&v232 + 1) = v234;
    *(_QWORD *)&v233 = v234;
    *((_QWORD *)&v233 + 1) = 6;
    geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)&v232, *((__int128 **)v9 + 23), *((__int128 **)v9 + 24));
    *(_QWORD *)((char *)v235 + 5) = *(_QWORD *)((char *)v9 + 1949);
    v235[0] = *((_QWORD *)v9 + 243);
    v237 = *((_QWORD *)v9 + 247);
    v236 = *(__int128 *)((char *)v9 + 1960);
    v238 = v9[124];
    v239 = *((_QWORD *)v9 + 250);
    v240 = *((_QWORD *)v9 + 251);
    v241 = *((_QWORD *)v9 + 252);
    v89 = (_QWORD *)*v7;
    v90 = v7[1];
    v242 = (_QWORD *)*v7;
    v243 = v90;
    *v7 = 0;
    v7[1] = 0;
    v91 = v7[2];
    v92 = v7[3];
    v93 = v7 + 2;
    v244 = v91;
    v245 = v92;
    v246 = *((_DWORD *)v93 + 4);
    if (v92)
    {
      v94 = *(_QWORD *)(v91 + 8);
      if ((v90 & (v90 - 1)) != 0)
      {
        if (v94 >= v90)
          v94 %= v90;
      }
      else
      {
        v94 &= v90 - 1;
      }
      v89[v94] = &v244;
      *v93 = 0;
      v93[1] = 0;
    }
    v114 = operator new();
    *(_OWORD *)v114 = v206;
    *(_QWORD *)(v114 + 16) = v207;
    v207 = 0;
    v206 = 0uLL;
    *(_OWORD *)(v114 + 24) = v208;
    *(_QWORD *)(v114 + 40) = v209;
    *(_OWORD *)(v114 + 48) = v210;
    *(_QWORD *)(v114 + 64) = v211;
    *(_QWORD *)(v114 + 88) = v213;
    *(_OWORD *)(v114 + 72) = v212;
    *(_QWORD *)(v114 + 96) = v214;
    v115 = v217;
    *(_QWORD *)(v114 + 104) = v215;
    *(_OWORD *)(v114 + 112) = v216;
    v216 = 0uLL;
    *(_QWORD *)(v114 + 128) = v115;
    v116 = v222;
    *(_OWORD *)(v114 + 216) = v223;
    *(_OWORD *)(v114 + 200) = v116;
    v117 = v220;
    *(_OWORD *)(v114 + 184) = v221;
    *(_OWORD *)(v114 + 168) = v117;
    v118 = v218;
    *(_OWORD *)(v114 + 152) = v219;
    *(_OWORD *)(v114 + 136) = v118;
    v119 = (__int128 *)v232;
    *(_QWORD *)(v114 + 232) = v224;
    v120 = v226;
    *(_OWORD *)(v114 + 240) = v225;
    v121 = v227;
    *(_DWORD *)(v114 + 272) = v228;
    *(_QWORD *)(v114 + 256) = v120;
    *(_QWORD *)(v114 + 264) = v121;
    *(_QWORD *)(v114 + 276) = v229;
    v122 = v231;
    *(_OWORD *)(v114 + 288) = v230;
    *(_OWORD *)(v114 + 304) = v122;
    v123 = v114 + 352;
    *(_QWORD *)(v114 + 320) = v114 + 352;
    *(_QWORD *)(v114 + 328) = v114 + 352;
    v124 = *((_QWORD *)&v233 + 1);
    v125 = (__int128 *)v233;
    *(_QWORD *)(v114 + 336) = v114 + 352;
    *(_QWORD *)(v114 + 344) = v124;
    if (v119 != v125)
    {
      v126 = *((_QWORD *)&v232 + 1);
      *(_QWORD *)(v114 + 320) = v119;
      *(_QWORD *)(v114 + 328) = v126;
      v232 = 0u;
      v233 = 0u;
LABEL_102:
      *(_QWORD *)(v114 + 2080) = v235[0];
      *(_QWORD *)(v114 + 2085) = *(_QWORD *)((char *)v235 + 5);
      *(_OWORD *)(v114 + 2096) = v236;
      *(_QWORD *)(v114 + 2112) = v237;
      *(_OWORD *)(v114 + 2120) = v238;
      *(_QWORD *)(v114 + 2136) = v239;
      *(_QWORD *)(v114 + 2144) = v240;
      *(_QWORD *)(v114 + 2152) = v241;
      v127 = v242;
      v242 = 0;
      *(_QWORD *)(v114 + 2160) = v127;
      v128 = v243;
      *(_QWORD *)(v114 + 2168) = v243;
      v243 = 0;
      v129 = v244;
      *(_QWORD *)(v114 + 2176) = v244;
      v130 = v245;
      *(_QWORD *)(v114 + 2184) = v245;
      *(_DWORD *)(v114 + 2192) = v246;
      if (v130)
      {
        v131 = *(_QWORD *)(v129 + 8);
        if ((v128 & (v128 - 1)) != 0)
        {
          if (v131 >= v128)
            v131 %= v128;
        }
        else
        {
          v131 &= v128 - 1;
        }
        v127[v131] = v114 + 2176;
        v244 = 0;
        v245 = 0;
      }
      v163 = (_anonymous_namespace_::PendingPathAnimation *)v12[571];
      v12[571] = v114;
      if (v163)
      {
        MEMORY[0x1A1AF4E00]();
      }
      v164 = v12[520];
      if (v164)
      {
        v165 = v11[14];
        if (v165)
          *(double *)(v164 + 648) = fmax(*(double *)(v164 + 640)+ (*(double *)(v165 + 640) + *(double *)(v164 + 640)) * -0.5, 0.0);
      }
      return;
    }
    v132 = (__int128 *)*((_QWORD *)&v232 + 1);
    v133 = *((_QWORD *)&v232 + 1) == (_QWORD)v119;
    *(_QWORD *)(v114 + 328) = v123 + *((_QWORD *)&v232 + 1) - (_QWORD)v119;
    if (v133)
      goto LABEL_102;
    v134 = 0;
    v135 = (_OWORD *)(v114 + 648);
    v136 = v114 + 632;
    while (1)
    {
      v137 = *v119;
      *(_QWORD *)(v123 + 16) = *((_QWORD *)v119 + 2);
      *(_OWORD *)v123 = v137;
      v138 = *((_QWORD *)v119 + 3);
      *(_DWORD *)(v123 + 32) = *((_DWORD *)v119 + 8);
      *(_QWORD *)(v123 + 24) = v138;
      *(_QWORD *)(v123 + 36) = *(_QWORD *)((char *)v119 + 36);
      v139 = *(__int128 *)((char *)v119 + 44);
      v140 = *(__int128 *)((char *)v119 + 60);
      v141 = *(__int128 *)((char *)v119 + 76);
      *(_OWORD *)(v123 + 92) = *(__int128 *)((char *)v119 + 92);
      *(_OWORD *)(v123 + 76) = v141;
      *(_OWORD *)(v123 + 60) = v140;
      *(_OWORD *)(v123 + 44) = v139;
      v142 = *(__int128 *)((char *)v119 + 108);
      v143 = *(__int128 *)((char *)v119 + 124);
      v144 = *(__int128 *)((char *)v119 + 140);
      *(_OWORD *)(v123 + 156) = *(__int128 *)((char *)v119 + 156);
      *(_OWORD *)(v123 + 140) = v144;
      *(_OWORD *)(v123 + 124) = v143;
      *(_OWORD *)(v123 + 108) = v142;
      v145 = *(__int128 *)((char *)v119 + 172);
      v146 = *(__int128 *)((char *)v119 + 188);
      v147 = *(__int128 *)((char *)v119 + 204);
      *(_OWORD *)(v123 + 220) = *(__int128 *)((char *)v119 + 220);
      *(_OWORD *)(v123 + 204) = v147;
      *(_OWORD *)(v123 + 188) = v146;
      *(_OWORD *)(v123 + 172) = v145;
      v148 = (_BYTE *)(v123 + 280);
      *(_QWORD *)(v123 + 248) = v123 + 280;
      v149 = (char *)*((_QWORD *)v119 + 31);
      *(_DWORD *)(v123 + 236) = *((_DWORD *)v119 + 59);
      *(_BYTE *)(v123 + 240) = *((_BYTE *)v119 + 240);
      *(_QWORD *)(v123 + 256) = v123 + 280;
      *(_QWORD *)(v123 + 264) = v123 + 280;
      *(_QWORD *)(v123 + 272) = *((_QWORD *)v119 + 34);
      if (v149 == *((char **)v119 + 33))
      {
        *(_QWORD *)(v123 + 256) = &v148[*((_QWORD *)v119 + 32) - (_QWORD)v149];
        v150 = (char *)*((_QWORD *)v119 + 32);
        if (v149 != v150)
        {
          v151 = v150 - v149;
          if ((unint64_t)(v150 - v149) >= 8
            && (unint64_t)(v114 + 632 + 288 * v134 - (_QWORD)v149) >= 0x20)
          {
            if (v151 < 0x20)
            {
              v152 = 0;
              goto LABEL_119;
            }
            v152 = v151 & 0xFFFFFFFFFFFFFFE0;
            v153 = (__int128 *)(v149 + 16);
            v154 = v135;
            v155 = v151 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              v156 = *v153;
              *(v154 - 1) = *(v153 - 1);
              *v154 = v156;
              v153 += 2;
              v154 += 2;
              v155 -= 32;
            }
            while (v155);
            if (v151 == v152)
              goto LABEL_108;
            if ((v151 & 0x18) != 0)
            {
LABEL_119:
              v157 = v151 & 0xFFFFFFFFFFFFFFF8;
              v148 += v151 & 0xFFFFFFFFFFFFFFF8;
              v158 = v152 - (v151 & 0xFFFFFFFFFFFFFFF8);
              v159 = (uint64_t *)&v149[v152];
              v160 = (_QWORD *)(v136 + v152);
              do
              {
                v161 = *v159++;
                *v160++ = v161;
                v158 += 8;
              }
              while (v158);
              if (v151 == v157)
                goto LABEL_108;
              v149 += v157;
            }
            else
            {
              v149 += v152;
              v148 += v152;
            }
          }
          do
          {
            v162 = *v149++;
            *v148++ = v162;
          }
          while (v149 != v150);
        }
      }
      else
      {
        *(_QWORD *)(v123 + 248) = v149;
        *(_QWORD *)(v123 + 256) = *((_QWORD *)v119 + 32);
        *(__int128 *)((char *)v119 + 248) = 0uLL;
        *(__int128 *)((char *)v119 + 264) = 0uLL;
      }
LABEL_108:
      v123 += 288;
      v119 += 18;
      ++v134;
      v135 += 18;
      v136 += 288;
      if (v119 == v132)
        goto LABEL_102;
    }
  }
  v191 = 0;
  v190 = 0;
  v192 = 0;
  v34 = *v11;
  v35 = v11[1];
  v36 = v35 - *v11;
  if (v35 != *v11)
  {
    v37 = 0x63FB9AEB1FDCD759 * (v36 >> 3);
    if (v37 > 0x2328A701194538)
      abort();
    v38 = operator new(v36);
    v190 = v38;
    v192 = &v38[233 * v37];
    do
    {
      *v38 = *(_QWORD *)v34;
      v39 = *(_OWORD *)(v34 + 8);
      v38[3] = *(_QWORD *)(v34 + 24);
      *(_OWORD *)(v38 + 1) = v39;
      v40 = *(_QWORD *)(v34 + 32);
      *((_DWORD *)v38 + 10) = *(_DWORD *)(v34 + 40);
      v38[4] = v40;
      *(_QWORD *)((char *)v38 + 44) = *(_QWORD *)(v34 + 44);
      v41 = *(_OWORD *)(v34 + 56);
      v42 = *(_OWORD *)(v34 + 72);
      v43 = v38 + 15;
      v38[11] = v38 + 15;
      v44 = v38 + 11;
      *((_OWORD *)v44 - 2) = v41;
      *((_OWORD *)v44 - 1) = v42;
      v44[1] = v43;
      v44[2] = v43;
      v44[3] = 6;
      geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)v44, *(__int128 **)(v34 + 88), *(__int128 **)(v34 + 96));
      v45 = *(_QWORD *)(v34 + 1848);
      *(_QWORD *)((char *)v44 + 1765) = *(_QWORD *)(v34 + 1853);
      v44[220] = v45;
      v38 = v44 + 222;
      v34 += 1864;
    }
    while (v34 != v35);
    v191 = (char *)v38;
  }
  v193 = *(_OWORD *)(v11 + 3);
  v46 = v11[5];
  v195 = *((_OWORD *)v11 + 3);
  v47 = v11[8];
  v194 = v46;
  v196 = v47;
  v197 = *(_OWORD *)(v11 + 9);
  v198 = v11[11];
  v199 = v11[12];
  v48 = v11[14];
  v49 = (std::__shared_weak_count *)v11[15];
  v200 = v11[13];
  v201 = v48;
  v202 = v49;
  if (v49)
  {
    v50 = (unint64_t *)&v49->__shared_owners_;
    do
      v51 = __ldxr(v50);
    while (__stxr(v51 + 1, v50));
  }
  v203 = v11[16];
  v52 = v9[3];
  v169[2] = v9[2];
  v169[3] = v52;
  v53 = v9[5];
  v169[4] = v9[4];
  v169[5] = v53;
  v54 = v9[1];
  v169[0] = *v9;
  v169[1] = v54;
  v55 = *(__int128 *)((char *)v9 + 104);
  v56 = *((_QWORD *)v9 + 15);
  v57 = *((_QWORD *)v9 + 16);
  v170 = *((_QWORD *)v9 + 12);
  v172 = v56;
  v173 = v57;
  v171 = v55;
  v174 = *((_DWORD *)v9 + 34);
  v175 = *(_QWORD *)((char *)v9 + 140);
  v177 = *(__int128 *)((char *)v9 + 168);
  v176 = *(__int128 *)((char *)v9 + 152);
  v178 = v182;
  v179 = v182;
  v180 = v182;
  v181 = 6;
  geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)&v178, *((__int128 **)v9 + 23), *((__int128 **)v9 + 24));
  *(_QWORD *)((char *)v183 + 5) = *(_QWORD *)((char *)v9 + 1949);
  v183[0] = *((_QWORD *)v9 + 243);
  v184 = *(__int128 *)((char *)v9 + 1960);
  v185 = *((_QWORD *)v9 + 247);
  v186 = v9[124];
  v187 = *((_QWORD *)v9 + 250);
  v188 = *((_QWORD *)v9 + 251);
  v189 = *((_QWORD *)v9 + 252);
  v58 = (_QWORD *)*v7;
  v59 = v7[1];
  *v7 = 0;
  v7[1] = 0;
  v61 = (_QWORD *)v7[2];
  v60 = (void *)v7[3];
  v62 = v7 + 2;
  v166[0] = v58;
  v166[1] = (void *)v59;
  v167[0] = v61;
  v167[1] = v60;
  v168 = *((_DWORD *)v62 + 4);
  if (v60)
  {
    v63 = v61[1];
    if ((v59 & (v59 - 1)) != 0)
    {
      if (v63 >= v59)
        v63 %= v59;
    }
    else
    {
      v63 &= v59 - 1;
    }
    v58[v63] = v167;
    *v62 = 0;
    v62[1] = 0;
  }
  objc_msgSend(v12, "moveAlongPath:tap:preloadedViews:continued:", &v190, v169, v166, 0);
  v95 = v167[0];
  if (v167[0])
  {
    while (1)
    {
      v99 = *(_BYTE **)v95;
      v100 = (std::__shared_weak_count *)*((_QWORD *)v95 + 17);
      if (v100)
      {
        v101 = (unint64_t *)&v100->__shared_owners_;
        do
          v102 = __ldaxr(v101);
        while (__stlxr(v102 - 1, v101));
        if (!v102)
          break;
      }
      if (v95[112])
        goto LABEL_66;
LABEL_67:
      v103 = (void *)*((_QWORD *)v95 + 4);
      if (v103 != *((void **)v95 + 6))
        free(v103);
      operator delete(v95);
      v95 = v99;
      if (!v99)
        goto LABEL_56;
    }
    ((void (*)(std::__shared_weak_count *))v100->__on_zero_shared)(v100);
    std::__shared_weak_count::__release_weak(v100);
    if (!v95[112])
      goto LABEL_67;
LABEL_66:
    v95[112] = 0;
    goto LABEL_67;
  }
LABEL_56:
  v96 = v166[0];
  v166[0] = 0;
  if (v96)
    operator delete(v96);
  v97 = v178;
  v98 = v179;
  if (v178 != v179)
  {
    do
    {
      v104 = (void *)v97[31];
      if (v104 != (void *)v97[33])
        free(v104);
      v97 += 36;
    }
    while (v97 != v98);
    v97 = v178;
  }
  if (v97 != (_QWORD *)v180)
    free(v97);
  v105 = v202;
  if (v202)
  {
    v106 = (unint64_t *)&v202->__shared_owners_;
    do
      v107 = __ldaxr(v106);
    while (__stlxr(v107 - 1, v106));
    if (!v107)
    {
      ((void (*)(std::__shared_weak_count *))v105->__on_zero_shared)(v105);
      std::__shared_weak_count::__release_weak(v105);
    }
  }
  v108 = (char *)v190;
  if (v190)
  {
    v109 = v191;
    v33 = v190;
    if (v191 != v190)
    {
      do
      {
        v110 = v109 - 1864;
        v111 = (_QWORD *)*((_QWORD *)v109 - 222);
        v112 = (_QWORD *)*((_QWORD *)v109 - 221);
        if (v111 != v112)
        {
          do
          {
            v113 = (void *)v111[31];
            if (v113 != (void *)v111[33])
              free(v113);
            v111 += 36;
          }
          while (v111 != v112);
          v111 = (_QWORD *)*((_QWORD *)v109 - 222);
        }
        if (v111 != *((_QWORD **)v109 - 220))
          free(v111);
        v109 -= 1864;
      }
      while (v110 != v108);
      v33 = v190;
    }
    v191 = v108;
    goto LABEL_96;
  }
}

- (void)pathAnimationComplete:(unint64_t)a3
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;
  char *v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  char *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  unint64_t v35;
  _QWORD *v36;
  void *v37;
  _QWORD *v38;
  unint64_t v39;
  NSObject *v40;
  std::mutex *v41;
  _QWORD *v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  _BYTE *v46;
  void *v47;
  _QWORD *v48;
  _QWORD *v49;
  _BYTE *v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  void *v54;
  void *v55;
  std::__shared_weak_count *v56;
  unint64_t *v57;
  unint64_t v58;
  char *v59;
  char *v60;
  char *v61;
  char *v62;
  _QWORD *v63;
  _QWORD *v64;
  void *v65;
  _anonymous_namespace_::PendingPathAnimation *v66;
  __int16 v67;
  void *__p[2];
  void *v69[2];
  int v70;
  _OWORD v71[6];
  uint64_t v72;
  __int128 v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  _BYTE *v80;
  _BYTE *v81;
  _BYTE *v82;
  uint64_t v83;
  _BYTE v84[1728];
  _QWORD v85[2];
  __int128 v86;
  uint64_t v87;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  char *v93;
  char *v94;
  __int128 v95;
  uint64_t v96;
  __int128 v97;
  uint64_t v98;
  __int128 v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  std::__shared_weak_count *v104;
  uint64_t v105;

  v4 = (uint64_t *)*((_QWORD *)self + 571);
  if (v4)
  {
    v92 = 0;
    v93 = 0;
    v94 = 0;
    v5 = *v4;
    v6 = v4[1];
    v7 = v6 - *v4;
    if (v6 != *v4)
    {
      v8 = 0x63FB9AEB1FDCD759 * (v7 >> 3);
      if (v8 >= 0x2328A701194539)
        abort();
      v9 = (char *)operator new(v7);
      v92 = v9;
      v94 = &v9[1864 * v8];
      do
      {
        *(_QWORD *)v9 = *(_QWORD *)v5;
        v10 = *(_OWORD *)(v5 + 8);
        *((_QWORD *)v9 + 3) = *(_QWORD *)(v5 + 24);
        *(_OWORD *)(v9 + 8) = v10;
        v11 = *(_QWORD *)(v5 + 32);
        *((_DWORD *)v9 + 10) = *(_DWORD *)(v5 + 40);
        *((_QWORD *)v9 + 4) = v11;
        *(_QWORD *)(v9 + 44) = *(_QWORD *)(v5 + 44);
        v12 = *(_OWORD *)(v5 + 56);
        v13 = *(_OWORD *)(v5 + 72);
        v14 = v9 + 120;
        *((_QWORD *)v9 + 11) = v9 + 120;
        v15 = v9 + 88;
        *((_OWORD *)v15 - 2) = v12;
        *((_OWORD *)v15 - 1) = v13;
        v15[1] = v14;
        v15[2] = v14;
        v15[3] = 6;
        geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)v15, *(__int128 **)(v5 + 88), *(__int128 **)(v5 + 96));
        v16 = *(_QWORD *)(v5 + 1848);
        *(_QWORD *)((char *)v15 + 1765) = *(_QWORD *)(v5 + 1853);
        v15[220] = v16;
        v9 = (char *)(v15 + 222);
        v5 += 1864;
      }
      while (v5 != v6);
      v93 = v9;
    }
    v17 = v4[5];
    v95 = *(_OWORD *)(v4 + 3);
    v18 = *((_OWORD *)v4 + 3);
    v19 = v4[8];
    v96 = v17;
    v98 = v19;
    v97 = v18;
    v20 = *(_OWORD *)(v4 + 9);
    v100 = v4[11];
    v99 = v20;
    v101 = v4[12];
    v21 = v4[14];
    v22 = (std::__shared_weak_count *)v4[15];
    v102 = v4[13];
    v103 = v21;
    v104 = v22;
    if (v22)
    {
      p_shared_owners = (unint64_t *)&v22->__shared_owners_;
      do
        v24 = __ldxr(p_shared_owners);
      while (__stxr(v24 + 1, p_shared_owners));
    }
    v25 = v4[16];
    v26 = *((_QWORD *)self + 571);
    v27 = *(_OWORD *)(v26 + 184);
    v71[2] = *(_OWORD *)(v26 + 168);
    v71[3] = v27;
    v28 = *(_OWORD *)(v26 + 216);
    v71[4] = *(_OWORD *)(v26 + 200);
    v71[5] = v28;
    v29 = *(_OWORD *)(v26 + 152);
    v71[0] = *(_OWORD *)(v26 + 136);
    v71[1] = v29;
    v73 = *(_OWORD *)(v26 + 240);
    v77 = *(_QWORD *)(v26 + 276);
    v30 = *(_OWORD *)(v26 + 288);
    v79 = *(_OWORD *)(v26 + 304);
    v105 = v25;
    v31 = *(_QWORD *)(v26 + 256);
    v32 = *(_QWORD *)(v26 + 264);
    v72 = *(_QWORD *)(v26 + 232);
    v74 = v31;
    v75 = v32;
    v76 = *(_DWORD *)(v26 + 272);
    v78 = v30;
    v80 = v84;
    v81 = v84;
    v82 = v84;
    v83 = 6;
    geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)&v80, *(__int128 **)(v26 + 320), *(__int128 **)(v26 + 328));
    *(_QWORD *)((char *)v85 + 5) = *(_QWORD *)(v26 + 2085);
    v85[0] = *(_QWORD *)(v26 + 2080);
    v86 = *(_OWORD *)(v26 + 2096);
    v87 = *(_QWORD *)(v26 + 2112);
    v89 = *(_QWORD *)(v26 + 2136);
    v88 = *(_OWORD *)(v26 + 2120);
    v90 = *(_QWORD *)(v26 + 2144);
    v91 = *(_QWORD *)(v26 + 2152);
    v33 = *((_QWORD *)self + 571);
    v34 = *(void **)(v33 + 2160);
    *(_QWORD *)(v33 + 2160) = 0;
    v35 = *(_QWORD *)(v33 + 2168);
    __p[0] = v34;
    __p[1] = (void *)v35;
    *(_QWORD *)(v33 + 2168) = 0;
    v36 = *(_QWORD **)(v33 + 2176);
    v37 = *(void **)(v33 + 2184);
    v69[0] = v36;
    v69[1] = v37;
    v70 = *(_DWORD *)(v33 + 2192);
    if (v37)
    {
      v38 = (_QWORD *)(v33 + 2176);
      v39 = v36[1];
      if ((v35 & (v35 - 1)) != 0)
      {
        if (v39 >= v35)
          v39 %= v35;
      }
      else
      {
        v39 &= v35 - 1;
      }
      *((_QWORD *)v34 + v39) = v69;
      *v38 = 0;
      v38[1] = 0;
    }
    -[VKMuninCameraController moveAlongPath:tap:preloadedViews:continued:](self, "moveAlongPath:tap:preloadedViews:continued:", &v92, v71, __p, 1);
    v46 = v69[0];
    if (!v69[0])
    {
LABEL_28:
      v47 = __p[0];
      __p[0] = 0;
      if (v47)
        operator delete(v47);
      v48 = v80;
      v49 = v81;
      if (v80 != v81)
      {
        do
        {
          v55 = (void *)v48[31];
          if (v55 != (void *)v48[33])
            free(v55);
          v48 += 36;
        }
        while (v48 != v49);
        v48 = v80;
      }
      if (v48 != (_QWORD *)v82)
        free(v48);
      v56 = v104;
      if (v104)
      {
        v57 = (unint64_t *)&v104->__shared_owners_;
        do
          v58 = __ldaxr(v57);
        while (__stlxr(v58 - 1, v57));
        if (!v58)
        {
          ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
          std::__shared_weak_count::__release_weak(v56);
        }
      }
      v59 = v92;
      if (v92)
      {
        v60 = v93;
        v61 = v92;
        if (v93 != v92)
        {
          do
          {
            v62 = v60 - 1864;
            v63 = (_QWORD *)*((_QWORD *)v60 - 222);
            v64 = (_QWORD *)*((_QWORD *)v60 - 221);
            if (v63 != v64)
            {
              do
              {
                v65 = (void *)v63[31];
                if (v65 != (void *)v63[33])
                  free(v65);
                v63 += 36;
              }
              while (v63 != v64);
              v63 = (_QWORD *)*((_QWORD *)v60 - 222);
            }
            if (v63 != *((_QWORD **)v60 - 220))
              free(v63);
            v60 -= 1864;
          }
          while (v62 != v59);
          v61 = v92;
        }
        v93 = v59;
        operator delete(v61);
      }
      v66 = (_anonymous_namespace_::PendingPathAnimation *)*((_QWORD *)self + 571);
      *((_QWORD *)self + 571) = 0;
      if (v66)
      {
        MEMORY[0x1A1AF4E00]();
      }
      return;
    }
    while (1)
    {
      v50 = *(_BYTE **)v46;
      v51 = (std::__shared_weak_count *)*((_QWORD *)v46 + 17);
      if (v51)
      {
        v52 = (unint64_t *)&v51->__shared_owners_;
        do
          v53 = __ldaxr(v52);
        while (__stlxr(v53 - 1, v52));
        if (!v53)
          break;
      }
      if (v46[112])
        goto LABEL_38;
LABEL_39:
      v54 = (void *)*((_QWORD *)v46 + 4);
      if (v54 != *((void **)v46 + 6))
        free(v54);
      operator delete(v46);
      v46 = v50;
      if (!v50)
        goto LABEL_28;
    }
    ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
    std::__shared_weak_count::__release_weak(v51);
    if (!v46[112])
      goto LABEL_39;
LABEL_38:
    v46[112] = 0;
    goto LABEL_39;
  }
  if (GEOGetVectorKitVKMuninLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMuninLog_onceToken, &__block_literal_global_10_11776);
  v40 = (id)GEOGetVectorKitVKMuninLog_log;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    v67 = 0;
    _os_log_impl(&dword_19F029000, v40, OS_LOG_TYPE_INFO, "reset path animator in pathAnimationComplete", (uint8_t *)&v67, 2u);
  }

  v41 = (std::mutex *)((char *)self + 4176);
  if (std::mutex::try_lock((std::mutex *)((char *)self + 4176)))
  {
    v42 = (_QWORD *)((char *)self + 4160);
    v43 = (std::__shared_weak_count *)*((_QWORD *)self + 521);
    *v42 = 0;
    v42[1] = 0;
    if (v43)
    {
      v44 = (unint64_t *)&v43->__shared_owners_;
      do
        v45 = __ldaxr(v44);
      while (__stlxr(v45 - 1, v44));
      if (!v45)
      {
        ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
        std::__shared_weak_count::__release_weak(v43);
      }
    }
    std::mutex::unlock(v41);
  }
}

- (void)resetPathAnimation
{
  _anonymous_namespace_::PendingPathAnimation *v3;
  NSObject *v4;
  std::mutex *v5;
  _QWORD *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint8_t v10[16];

  v3 = (_anonymous_namespace_::PendingPathAnimation *)*((_QWORD *)self + 571);
  *((_QWORD *)self + 571) = 0;
  if (v3)
  {
    MEMORY[0x1A1AF4E00]();
  }
  if (GEOGetVectorKitVKMuninLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMuninLog_onceToken, &__block_literal_global_10_11776);
  v4 = (id)GEOGetVectorKitVKMuninLog_log;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_19F029000, v4, OS_LOG_TYPE_INFO, "reset path animator in resetPathAnimation", v10, 2u);
  }

  v5 = (std::mutex *)((char *)self + 4176);
  if (std::mutex::try_lock((std::mutex *)((char *)self + 4176)))
  {
    v6 = (_QWORD *)((char *)self + 4160);
    v7 = (std::__shared_weak_count *)*((_QWORD *)self + 521);
    *v6 = 0;
    v6[1] = 0;
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
    std::mutex::unlock(v5);
  }
}

- (void)moveAlongPath:(PathAnimationDescription *)a3 tap:(TapDescription *)a4 preloadedViews:()unordered_map<gdc:()std:()gdc:()std:(std:(std:(BOOL)a6 :shared_ptr<gdc::LayerData>>>> *)a5 :allocator<std::pair<const)gdc::LayerDataRequestKey :equal_to<gdc::LayerDataRequestKey> :LayerDataRequestKeyHash :shared_ptr<gdc::LayerData> :LayerDataRequestKey continued:
{
  _BOOL4 v6;
  uint64_t v11;
  PathAnimator *ptr;
  __shared_weak_count *cntrl;
  unint64_t *v14;
  unint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  double v19;
  uint64_t v20;
  __int128 v21;
  void *v22;
  int var4;
  CollectionPoint *var0;
  void *v25;
  double v26;
  double v27;
  __double2 v28;
  double v29;
  double v30;
  __double2 v31;
  double v32;
  double v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  double v37;
  double v38;
  __double2 v39;
  double v40;
  double v41;
  __double2 v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  void *v46;
  double v47[3];
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[4];
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  unint64_t pointId;
  __int128 v59;
  double v60;
  uint64_t v61;
  float v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  _BYTE *v66;
  _BYTE *v67;
  _BYTE *v68;
  uint64_t v69;
  _BYTE v70[1728];
  _QWORD v71[2];
  __int128 v72;
  uint64_t v73;
  __int128 v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id location;
  double v79;
  double v80;
  double v81;
  char v82;
  void *v83;
  _QWORD *v84;
  char v85;
  void *__p;
  void *v87;
  uint64_t v88;

  v6 = a6;
  v88 = *MEMORY[0x1E0C80C00];
  v11 = operator new();
  std::vector<md::mun::CollectionPoint>::vector((_QWORD *)v11, (uint64_t *)a3);
  ptr = a3->var5.__ptr_;
  *(Geocentric<double> *)(v11 + 24) = a3->var1;
  *(RigidTransform<double, double> *)(v11 + 48) = a3->var2;
  cntrl = a3->var5.__cntrl_;
  *(_QWORD *)(v11 + 104) = *(_QWORD *)&a3->var3;
  *(_QWORD *)(v11 + 112) = ptr;
  *(_QWORD *)(v11 + 120) = cntrl;
  if (cntrl)
  {
    v14 = (unint64_t *)((char *)cntrl + 8);
    do
      v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
  }
  *(_QWORD *)(v11 + 128) = a3->var6;
  objc_initWeak(&location, self);
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3321888768;
  v50[2] = __70__VKMuninCameraController_moveAlongPath_tap_preloadedViews_continued___block_invoke;
  v50[3] = &unk_1E42E94F0;
  objc_copyWeak(&v51, &location);
  v16 = *(_OWORD *)a4->var1.var0._e;
  v54 = *(_OWORD *)&a4->var0.var1._e[1];
  v55 = v16;
  v17 = *(_OWORD *)&a4->var1.var1._e[1];
  v56 = *(_OWORD *)&a4->var1.var0._e[2];
  v57 = v17;
  v18 = *(_OWORD *)&a4->var0.var0._e[2];
  v52 = *(_OWORD *)a4->var0.var0._e;
  v53 = v18;
  v19 = a4->var2.frame._translation._e[2];
  v20 = *(_QWORD *)a4->var2.frame._rotation._imaginary._e;
  pointId = a4->var2.pointId;
  v60 = v19;
  v61 = v20;
  v59 = *(_OWORD *)a4->var2.frame._translation._e;
  v62 = a4->var2.frame._rotation._imaginary._e[2];
  v63 = *(_QWORD *)&a4->var2.frame._rotation._scalar;
  v21 = *(_OWORD *)&a4->var2.mercatorPosition._e[2];
  v64 = *(_OWORD *)a4->var2.mercatorPosition._e;
  v65 = v21;
  v66 = v70;
  v67 = v70;
  v68 = v70;
  v69 = 6;
  geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)&v66, (__int128 *)a4->var2.photos._begin, (__int128 *)a4->var2.photos._end);
  *(_QWORD *)((char *)v71 + 5) = *(PhotoInfo **)((char *)&a4[4].var2.photos._begin + 5);
  v71[0] = a4[4].var2.photos._begin;
  v73 = *(_QWORD *)a4[4].var2.photos.storage[0].__lx;
  v72 = *(_OWORD *)&a4[4].var2.photos._fixedStorage;
  v74 = *(_OWORD *)&a4[4].var2.photos.storage[0].__lx[8];
  v75 = *(_QWORD *)a4[4].var2.photos.storage[1].__lx;
  v76 = *(_QWORD *)&a4[4].var2.photos.storage[1].__lx[8];
  v77 = *(_QWORD *)&a4[4].var2.photos.storage[1].__lx[16];
  v22 = (void *)MEMORY[0x1A1AF5730](v50);
  var4 = a3->var4;
  if ((var4 - 2) < 2)
  {
    +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *((double *)self + 558);
    v27 = *((double *)self + 559);
    v28 = __sincos_stret(*((double *)self + 557));
    v29 = 6378137.0 / sqrt(v28.__sinval * v28.__sinval * -0.00669437999 + 1.0);
    v30 = (v29 + v27) * v28.__cosval;
    v31 = __sincos_stret(v26);
    v32 = a4->var1.var1._e[1] + v30 * v31.__sinval;
    v33 = a4->var1.var1._e[2];
    v47[0] = a4->var1.var1._e[0] + v30 * v31.__cosval;
    v47[1] = v32;
    v34 = *((_QWORD *)self + 17);
    v47[2] = v33 + (v27 + v29 * 0.99330562) * v28.__sinval;
    LOBYTE(v80) = 0;
    v82 = 0;
    v85 = 0;
    LOBYTE(v79) = 4;
    md::MuninSceneLogic::addSceneEvent(v34, (uint64_t)&v79);
    if (v85)
    {
      if (__p)
      {
        v87 = __p;
        operator delete(__p);
      }
      v85 = 0;
    }
    if (v82)
    {
      v35 = v83;
      if (v83)
      {
        v36 = v84;
        if (v84 != v83)
        {
          do
          {
            v36 -= 249;
            std::__destroy_at[abi:nn180100]<md::mun::PointView,0>(v36);
          }
          while (v36 != v35);
          v35 = v83;
        }
        operator delete(v35);
      }
    }
    v37 = *((double *)self + 558);
    v38 = *((double *)self + 559);
    v39 = __sincos_stret(*((double *)self + 557));
    v40 = 6378137.0 / sqrt(v39.__sinval * v39.__sinval * -0.00669437999 + 1.0);
    v41 = (v40 + v38) * v39.__cosval;
    v42 = __sincos_stret(v37);
    v79 = v41 * v42.__cosval;
    v80 = v41 * v42.__sinval;
    v81 = (v38 + v40 * 0.99330562) * v39.__sinval;
    -[VKMuninCameraController runBumpAnimation:targetPoint:completionHandler:](self, "runBumpAnimation:targetPoint:completionHandler:", &v79, v47, v22);
    objc_msgSend(v25, "setForceBumpNextTap:", 0);

  }
  else if (var4)
  {
    if (var4 == 1)
    {
      var0 = a3->var0.var0;
      v49 = *((_QWORD *)self + 553);
      v48 = 0;
      -[VKMuninCameraController moveToPoint:withHeading:withPitch:animated:completionHandler:](self, "moveToPoint:withHeading:withPitch:animated:completionHandler:", var0, &v49, &v48, 0, v22);
    }
  }
  else
  {
    -[VKMuninCameraController animatePath:animator:preloadedRequiredViews:prePruneData:completionHandler:](self, "animatePath:animator:preloadedRequiredViews:prePruneData:completionHandler:", a3, &a3->var5, a5, !v6, v22);
  }
  v43 = *(_QWORD *)-[VKCameraController runLoopController](self, "runLoopController");
  if (v43)
  {
    LOBYTE(v79) = 4;
    md::MapEngine::setNeedsTick(v43, &v79);
  }

  v44 = v66;
  v45 = v67;
  if (v66 != v67)
  {
    do
    {
      v46 = (void *)v44[31];
      if (v46 != (void *)v44[33])
        free(v46);
      v44 += 36;
    }
    while (v44 != v45);
    v44 = v66;
  }
  if (v44 != (_QWORD *)v68)
    free(v44);
  objc_destroyWeak(&v51);
  objc_destroyWeak(&location);
}

- (BOOL)tapAtPoint:(CGPoint)a3
{
  uint64_t v3;
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  long double v11;
  long double v12;
  double v13;
  long double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  NSObject *v26;
  std::chrono::steady_clock::time_point *v27;
  unsigned int v28;
  unsigned int v29;
  float64x2_t v30;
  float64x2_t v31;
  __n128 v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  uint64_t v36;
  unsigned __int8 *v37;
  void *v38;
  char v39;
  char v40;
  double v41;
  double v42;
  __double2 v43;
  double v44;
  double v45;
  __double2 v46;
  uint64_t v47;
  BOOL v48;
  uint64_t v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  int v53;
  unint64_t v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
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
  __int128 v85;
  double v86;
  double v87;
  std::__shared_weak_count *v88;
  unint64_t *v89;
  unint64_t v90;
  double v91;
  double v92;
  BOOL v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  __int128 v108;
  uint64_t v109;
  double v110;
  double v111;
  __double2 v112;
  double v113;
  float64x2_t v114;
  __double2 v115;
  _QWORD *v116;
  _QWORD *v117;
  __int128 v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  __int128 *v122;
  __int128 *v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  _anonymous_namespace_::PendingPathAnimation *v127;
  char *v128;
  char *v129;
  __int128 *v130;
  char *v131;
  char *v132;
  __int128 v133;
  uint64_t v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  char *v139;
  __int128 *v140;
  __int128 v141;
  std::__shared_weak_count *v142;
  unint64_t *p_shared_owners;
  unint64_t v144;
  std::__shared_weak_count *v145;
  unint64_t *v146;
  unint64_t v147;
  _QWORD *v148;
  uint64_t v149;
  __int128 *v150;
  BOOL v151;
  uint64_t v152;
  char *v153;
  _OWORD *v154;
  __int128 v155;
  uint64_t v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  _BYTE *v166;
  char *v167;
  char *v168;
  unint64_t v169;
  unint64_t v170;
  __int128 *v171;
  _OWORD *v172;
  unint64_t v173;
  __int128 v174;
  unint64_t v175;
  unint64_t v176;
  uint64_t *v177;
  char *v178;
  uint64_t v179;
  char v180;
  __int128 *v181;
  uint64_t v182;
  _OWORD *v183;
  char *v184;
  __int128 v185;
  uint64_t v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  _BYTE *v196;
  char *v197;
  char *v198;
  unint64_t v199;
  unint64_t v200;
  __int128 *v201;
  _OWORD *v202;
  unint64_t v203;
  __int128 v204;
  unint64_t v205;
  unint64_t v206;
  uint64_t *v207;
  char *v208;
  uint64_t v209;
  char v210;
  _QWORD *v211;
  _QWORD *v212;
  void *v213;
  _QWORD *v214;
  _QWORD *v215;
  void *v216;
  __int128 *v217;
  __int128 *v218;
  void *v219;
  __int128 *v220;
  __int128 *v221;
  void *v222;
  __int128 v224;
  uint64_t v225;
  __int128 v226;
  __int128 v227;
  void *v228;
  unsigned int v229;
  uint64_t v230;
  unsigned int from;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  uint64_t v238;
  __int128 v239;
  uint64_t v240;
  void *v241;
  int v242;
  uint64_t v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  _BYTE v248[1728];
  _QWORD v249[2];
  __int128 v250;
  uint64_t v251;
  __int128 v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  id v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  uint64_t v263;
  __int128 v264;
  uint64_t v265;
  void *v266;
  int v267;
  uint64_t v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  _BYTE v273[1728];
  _QWORD v274[2];
  __int128 v275;
  uint64_t v276;
  __int128 v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  id v281;
  __int128 v282;
  id v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  uint64_t v290;
  __int128 v291;
  uint64_t v292;
  void *v293;
  int v294;
  uint64_t v295;
  __int128 v296;
  __int128 v297;
  void *v298;
  __int128 *v299;
  __int128 *v300;
  uint64_t v301;
  _BYTE v302[1728];
  _QWORD v303[2];
  __int128 v304;
  uint64_t v305;
  __int128 v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  char v310[8];
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  _DWORD v317[2];
  double v318;
  double v319;
  float v320;
  float v321;
  _QWORD v322[3];
  _QWORD *v323;
  _BYTE v324[24];
  _BYTE v325[48];
  _BYTE v326[32];
  _BYTE v327[24];
  uint64_t v328;
  void *v329;
  _QWORD v330[2];
  __int128 v331;
  void *__p[2];
  void *v333;
  __int128 *v334;
  __int128 *v335;
  uint64_t v336;
  _BYTE v337[1728];
  _QWORD v338[2];
  __int128 v339;
  uint64_t v340;
  __int128 v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;

  v3 = MEMORY[0x1E0C80A78](self);
  v345 = *MEMORY[0x1E0C80C00];
  v6 = v3 + 168;
  if (!*(_BYTE *)(v3 + 168))
    return 0;
  v7 = v5;
  v8 = v4;
  v9 = v3;
  v10 = *(_QWORD *)(v3 + 4160);
  if (v10)
  {
    if (objc_msgSend(*(id *)(v10 + 600), "running") && !*(_QWORD *)(v9 + 4560))
      return 0;
  }
  ++*(_QWORD *)(v9 + 4536);
  v11 = *(double *)(v6 + 64) * 6.28318531;
  v12 = exp(*(double *)(v6 + 72) * 6.28318531 + -3.14159265);
  v13 = atan(v12);
  v14 = fmod(v11, 6.28318531);
  v15 = fmod(v14 + 6.28318531, 6.28318531);
  v16 = *(double *)(v9 + 4424);
  v17 = *(double *)(v9 + 4432);
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v15 * 57.2957795 + -180.0;
  v20 = v13 * 114.591559 + -90.0;
  v21 = v8;
  v22 = v7;
  v23 = v16 * 57.2957795;
  v24 = -v23;
  *(float *)v317 = v21;
  *(float *)&v317[1] = v22;
  v318 = v20;
  v319 = v19;
  v25 = v17 * 57.2957795;
  v320 = -v23;
  v321 = v25;
  objc_msgSend(v18, "setMuninTapState:", v317);

  if (GEOGetVectorKitVKMuninLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKMuninLog_onceToken, &__block_literal_global_10_11776);
  v26 = (id)GEOGetVectorKitVKMuninLog_log;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v324 = 134219265;
    *(double *)&v324[4] = v21;
    *(_WORD *)&v324[12] = 2048;
    *(double *)&v324[14] = v22;
    *(_WORD *)&v324[22] = 2049;
    *(double *)v325 = v20;
    *(_WORD *)&v325[8] = 2049;
    *(double *)&v325[10] = v19;
    *(_WORD *)&v325[18] = 2048;
    *(double *)&v325[20] = v24;
    *(_WORD *)&v325[28] = 2048;
    *(double *)&v325[30] = v25;
    _os_log_impl(&dword_19F029000, v26, OS_LOG_TYPE_INFO, "{\"tap_state\": {\"x\": %f, \"y\": %f, \"latitude\": %{private}f, \"longitude\": %{private}f, \"yaw\": %f, \"pitch\": %f } }", v324, 0x3Eu);
  }

  v27 = *(std::chrono::steady_clock::time_point **)(*(_QWORD *)(v9 + 136) + 520);
  v27[13].__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
  v27->__d_.__rep_ = 0x100000003;
  objc_msgSend((id)v9, "screenPointWithOffset:", v8, v7);
  from = v28;
  v229 = v29;
  objc_msgSend((id)v9, "camera");
  v30 = vsubq_f64(vcvtq_f64_f32((float32x2_t)__PAIR64__(v229, from)), vcvtq_f64_f32(vcvt_f32_f64(vmulq_f64(*(float64x2_t *)(*(_QWORD *)v324 + 368), vcvtq_f64_f32(*(float32x2_t *)(*(_QWORD *)v324 + 488))))));
  v31 = vdivq_f64(vaddq_f64(v30, v30), *(float64x2_t *)(*(_QWORD *)v324 + 368));
  v32.n128_f64[0] = gdc::ViewDataAccess::worldRayFromScreenNormalizedPoint((uint64_t)&v314, *(uint64_t *)v324, (double *)(v9 + 4480), v31.f64[0] + -1.0, 1.0 - v31.f64[1]);
  v33 = *(std::__shared_weak_count **)&v324[8];
  if (*(_QWORD *)&v324[8])
  {
    v34 = (unint64_t *)(*(_QWORD *)&v324[8] + 8);
    do
      v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v33->__on_zero_shared)(v33, v32);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  v36 = *(_QWORD *)(*(_QWORD *)(v9 + 136) + 536);
  v37 = *(unsigned __int8 **)(v36 + 24);
  if (!v37)
  {
LABEL_15:
    v310[0] = 0;
    goto LABEL_16;
  }
  while (1)
  {
    gdc::LayerDataStore::get((gdc::LayerDataStore *)v324, *(const gdc::LayerDataRequestKey **)v36, v37 + 16);
    v49 = *(_QWORD *)v324;
    if (!*(_QWORD *)v324)
      goto LABEL_35;
    v50 = *(std::__shared_weak_count **)&v324[8];
    if (*(_QWORD *)&v324[8])
      break;
    if (v310[0])
      goto LABEL_45;
LABEL_35:
    v55 = *(std::__shared_weak_count **)&v324[8];
    if (*(_QWORD *)&v324[8])
    {
      v56 = (unint64_t *)(*(_QWORD *)&v324[8] + 8);
      do
        v57 = __ldaxr(v56);
      while (__stlxr(v57 - 1, v56));
      if (!v57)
      {
        ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
        std::__shared_weak_count::__release_weak(v55);
      }
    }
    v37 = *(unsigned __int8 **)v37;
    if (!v37)
      goto LABEL_15;
  }
  v51 = (unint64_t *)(*(_QWORD *)&v324[8] + 8);
  do
    v52 = __ldxr(v51);
  while (__stxr(v52 + 1, v51));
  v53 = v310[0];
  do
    v54 = __ldaxr(v51);
  while (__stlxr(v54 - 1, v51));
  if (!v53)
  {
    if (!v54)
    {
      ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
      std::__shared_weak_count::__release_weak(v50);
    }
    goto LABEL_35;
  }
  if (!v54)
  {
    ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
    std::__shared_weak_count::__release_weak(v50);
  }
LABEL_45:
  v88 = *(std::__shared_weak_count **)&v324[8];
  if (*(_QWORD *)&v324[8])
  {
    v89 = (unint64_t *)(*(_QWORD *)&v324[8] + 8);
    do
      v90 = __ldaxr(v89);
    while (__stlxr(v90 - 1, v89));
    if (!v90)
    {
      ((void (*)(std::__shared_weak_count *))v88->__on_zero_shared)(v88);
      std::__shared_weak_count::__release_weak(v88);
    }
  }
LABEL_16:
  +[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings", v32.n128_f64[0]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v38, "forceBumpNextTap") & 1) != 0
    || ((v39 = objc_msgSend(v38, "forceBumpAll"), !v310[0]) ? (v40 = 1) : (v40 = v39), (v40 & 1) != 0))
  {
    v41 = *(double *)(v9 + 4464);
    v42 = *(double *)(v9 + 4472);
    v43 = __sincos_stret(*(double *)(v9 + 4456));
    v44 = 6378137.0 / sqrt(v43.__sinval * v43.__sinval * -0.00669437999 + 1.0);
    v45 = (v44 + v42) * v43.__cosval;
    v46 = __sincos_stret(v41);
    *(double *)v324 = v45 * v46.__cosval;
    *(double *)&v324[8] = v45 * v46.__sinval;
    *(double *)&v324[16] = (v42 + v44 * 0.99330562) * v43.__sinval;
    *(double *)&v284 = *((double *)&v315 + 1) + v45 * v46.__cosval;
    *((double *)&v284 + 1) = *(double *)&v316 + v45 * v46.__sinval;
    *(double *)&v285 = *((double *)&v316 + 1) + *(double *)&v324[16];
    objc_msgSend((id)v9, "runBumpAnimation:targetPoint:completionHandler:", v324, &v284, &__block_literal_global_24);
    objc_msgSend(v38, "setForceBumpNextTap:", 0);
    v47 = *(_QWORD *)objc_msgSend((id)v9, "runLoopController");
    if (v47)
    {
      LOBYTE(v282) = 4;
      md::MapEngine::setNeedsTick(v47, &v282);
    }
    v48 = 0;
    goto LABEL_187;
  }
  v58 = *(float *)(v6 + 40);
  v59 = *(float *)(v6 + 44);
  v60 = *(float *)(v6 + 48);
  v61 = *(float *)(v6 + 52);
  v62 = -(float)((float)((float)(v60 + v60) * v61) - (float)((float)(v58 + v58) * v59));
  v63 = (float)(1.0 - (float)((float)((float)(v58 + v58) * v58) + (float)((float)(v60 + v60) * v60)));
  v64 = (float)((float)((float)(v60 + v60) * v59) + (float)(v61 * (float)(v58 + v58)));
  v65 = *(double *)(v6 + 16) - *(double *)&v311;
  v66 = *(double *)(v6 + 24) - *((double *)&v311 + 1);
  v67 = *(double *)(v6 + 32) - *(double *)&v312;
  v68 = 1.0 / sqrt(v65 * v65 + v66 * v66 + v67 * v67);
  v69 = v68 * v65;
  v70 = v68 * v66;
  v71 = v68 * v67;
  v72 = -(v68 * v66 * v64 - v71 * v63);
  v73 = -(v71 * v62 - v69 * v64);
  v74 = -(v69 * v63 - v70 * v62);
  v75 = 1.0 / sqrt(v72 * v72 + v73 * v73 + v74 * v74);
  v76 = v75 * v72;
  v77 = v75 * v73;
  v78 = v75 * v74;
  v79 = -(v75 * v74 * v70 - v75 * v73 * v71);
  v80 = -(v76 * v71 - v75 * v74 * v69);
  v81 = -(v77 * v69 - v76 * v70);
  v82 = v76 + v70 - (v77 * v69 - v76 * v70);
  if (v82 <= 0.0)
  {
    if (v76 <= v70 || v76 <= v81)
    {
      v93 = v70 <= v81;
      v94 = sqrt(1.0 - (v76 + v70) - (v77 * v69 - v76 * v70));
      v95 = 1.0 / (v94 + v94);
      v96 = (v79 + v78) * v95;
      v97 = v80 + v71;
      v98 = v97 * v95;
      v99 = v94 * 0.5;
      v100 = (v77 - v69) * v95;
      v101 = sqrt(v70 + 1.0 - (v76 - (v77 * v69 - v76 * v70)));
      v102 = v77 + v69;
      v103 = 1.0 / (v101 + v101);
      v104 = v102 * v103;
      v105 = v101 * 0.5;
      v106 = v97 * v103;
      v107 = (v79 - v78) * v103;
      if (v93)
        v84 = v96;
      else
        v84 = v104;
      if (v93)
        *(double *)&v85 = v98;
      else
        *(double *)&v85 = v105;
      if (v93)
        v86 = v99;
      else
        v86 = v106;
      if (v93)
        v87 = v100;
      else
        v87 = v107;
    }
    else
    {
      v91 = sqrt(v76 + 1.0 - (v70 - (v77 * v69 - v76 * v70)));
      v92 = v91 + v91;
      v84 = v91 * 0.5;
      *(double *)&v85 = (v77 + v69) * (1.0 / v92);
      v86 = (v79 + v78) * (1.0 / v92);
      v87 = (v71 - v80) * (1.0 / v92);
    }
  }
  else
  {
    v83 = 0.5 / sqrt(v82 + 1.0);
    v84 = v83 * (v71 - v80);
    *(double *)&v85 = v83 * (v79 - v78);
    v86 = v83 * (v77 - v69);
    v87 = 0.25 / v83;
  }
  *(_QWORD *)&v108 = v312;
  *((double *)&v108 + 1) = v84;
  v226 = v108;
  v227 = v311;
  *((double *)&v85 + 1) = v86;
  v224 = v85;
  v225 = v312;
  v109 = *(_QWORD *)(v9 + 136);
  v110 = *(double *)(v9 + 4464);
  v111 = *(double *)(v9 + 4472);
  v112 = __sincos_stret(*(double *)(v9 + 4456));
  v113 = 6378137.0 / sqrt(v112.__sinval * v112.__sinval * -0.00669437999 + 1.0);
  v115 = __sincos_stret(v110);
  v114.f64[0] = v115.__cosval;
  v114.f64[1] = v115.__sinval;
  LOBYTE(v328) = 0;
  BYTE8(v331) = 0;
  v324[0] = 0;
  v324[16] = 0;
  *(_OWORD *)v325 = v227;
  *(_OWORD *)&v325[16] = v226;
  *(_OWORD *)&v325[32] = v224;
  *(double *)v326 = v87;
  *(_OWORD *)&v326[8] = v227;
  *(float64x2_t *)v327 = vmulq_n_f64(v114, (v113 + v111) * v112.__cosval);
  *(_QWORD *)&v326[24] = v225;
  *(double *)&v327[16] = (v111 + v113 * 0.99330562) * v112.__sinval;
  v324[8] = 1;
  v228 = v38;
  md::MuninSceneLogic::addSceneEvent(v109, (uint64_t)v324);
  if (BYTE8(v331))
  {
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    BYTE8(v331) = 0;
  }
  if ((_BYTE)v328)
  {
    v116 = v329;
    if (v329)
    {
      v117 = (_QWORD *)v330[0];
      if ((void *)v330[0] != v329)
      {
        do
        {
          v117 -= 249;
          std::__destroy_at[abi:nn180100]<md::mun::PointView,0>(v117);
        }
        while (v117 != v116);
        v116 = v329;
      }
      operator delete(v116);
    }
  }
  v284 = v311;
  v285 = v312;
  v286 = v313;
  v287 = v314;
  v288 = v315;
  v289 = v316;
  v291 = *(_OWORD *)(v6 + 16);
  v295 = *(_QWORD *)(v6 + 52);
  v118 = *(_OWORD *)(v6 + 64);
  v297 = *(_OWORD *)(v6 + 80);
  v119 = *(_QWORD *)(v6 + 32);
  v290 = *(_QWORD *)(v6 + 8);
  v292 = v119;
  v294 = *(_DWORD *)(v6 + 48);
  v293 = *(void **)(v6 + 40);
  v296 = v118;
  v298 = v302;
  v299 = (__int128 *)v302;
  v300 = (__int128 *)v302;
  v301 = 6;
  geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)&v298, *(__int128 **)(v6 + 96), *(__int128 **)(v6 + 104));
  *(_QWORD *)((char *)v303 + 5) = *(_QWORD *)(v6 + 1861);
  v303[0] = *(_QWORD *)(v6 + 1856);
  gdc::CameraFrame<geo::Radians,double>::toRigidTransformEcefNoOffset((uint64_t)&v304, (double *)(v9 + 4480));
  v309 = *(_QWORD *)(v9 + 4536);
  v120 = *(_QWORD *)(v9 + 4560);
  if (v120)
  {
    v121 = *(_QWORD *)(v120 + 8);
    if (*(_QWORD *)v120 != v121)
    {
      v306 = *(_OWORD *)(v120 + 72);
      v307 = *(_QWORD *)(v120 + 88);
      v308 = *(_QWORD *)(v120 + 96);
      v304 = *(_OWORD *)(v120 + 48);
      v305 = *(_QWORD *)(v120 + 64);
      v290 = *(_QWORD *)(v121 - 1864);
      v293 = *(void **)(v121 - 1832);
      v294 = *(_DWORD *)(v121 - 1824);
      LODWORD(v295) = *(_DWORD *)(v121 - 1820);
      v291 = *(_OWORD *)(v121 - 1856);
      v292 = *(_QWORD *)(v121 - 1840);
      HIDWORD(v295) = *(_DWORD *)(v121 - 1816);
      v296 = *(_OWORD *)(v121 - 1808);
      v297 = *(_OWORD *)(v121 - 1792);
      if (&v290 != (uint64_t *)(v121 - 1864))
      {
        v122 = (__int128 *)v298;
        v123 = v299;
        if (v298 != v299)
        {
          do
          {
            v124 = (void *)*((_QWORD *)v122 + 31);
            if (v124 != *((void **)v122 + 33))
              free(v124);
            v122 += 18;
          }
          while (v122 != v123);
          v122 = (__int128 *)v298;
        }
        if (v122 != v300)
          free(v122);
        v298 = v302;
        v299 = (__int128 *)v302;
        v300 = (__int128 *)v302;
        v301 = 6;
        geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)&v298, *(__int128 **)(v121 - 1776), *(__int128 **)(v121 - 1768));
      }
      v125 = *(_QWORD *)(v121 - 16);
      *(_QWORD *)((char *)v303 + 5) = *(_QWORD *)(v121 - 11);
      v303[0] = v125;
    }
  }
  objc_initWeak(&v283, (id)v9);
  objc_copyWeak((id *)v324, &v283);
  *(_OWORD *)&v325[16] = v286;
  *(_OWORD *)&v325[32] = v287;
  *(_OWORD *)v326 = v288;
  *(_OWORD *)&v326[16] = v289;
  *(_OWORD *)&v324[8] = v284;
  *(_OWORD *)v325 = v285;
  *(_QWORD *)v327 = v290;
  *(_OWORD *)&v327[8] = v291;
  LODWORD(v330[0]) = v294;
  v328 = v292;
  v329 = v293;
  *(_QWORD *)((char *)v330 + 4) = v295;
  *(_OWORD *)__p = v297;
  v331 = v296;
  v333 = v337;
  v334 = (__int128 *)v337;
  v335 = (__int128 *)v337;
  v336 = 6;
  geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)&v333, (__int128 *)v298, v299);
  *(_QWORD *)((char *)v338 + 5) = *(_QWORD *)((char *)v303 + 5);
  v338[0] = v303[0];
  v339 = v304;
  v340 = v305;
  v341 = v306;
  v342 = v307;
  v343 = v308;
  v344 = v309;
  v126 = *(_QWORD *)(v9 + 4544);
  if (v126)
    atomic_store(1u, (unsigned __int8 *)(v126 + 32));
  v127 = *(_anonymous_namespace_::PendingPathAnimation **)(v9 + 4568);
  *(_QWORD *)(v9 + 4568) = 0;
  if (v127)
  {
    MEMORY[0x1A1AF4E00]();
  }
  v230 = *(_QWORD *)(*(_QWORD *)(v9 + 152) + 72);
  v234 = v286;
  v235 = v287;
  v232 = v284;
  v233 = v285;
  v236 = v288;
  v237 = v289;
  v239 = v291;
  v243 = v295;
  v245 = v297;
  v238 = v290;
  v242 = v294;
  v240 = v292;
  v241 = v293;
  v244 = v296;
  *(_QWORD *)&v246 = v248;
  *((_QWORD *)&v246 + 1) = v248;
  *(_QWORD *)&v247 = v248;
  *((_QWORD *)&v247 + 1) = 6;
  geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)&v246, (__int128 *)v298, v299);
  *(_QWORD *)((char *)v249 + 5) = *(_QWORD *)((char *)v303 + 5);
  v249[0] = v303[0];
  v250 = v304;
  v251 = v305;
  v252 = v306;
  v253 = v307;
  v254 = v308;
  v255 = v309;
  objc_copyWeak(&v256, (id *)v324);
  v259 = *(_OWORD *)&v325[16];
  v260 = *(_OWORD *)&v325[32];
  v261 = *(_OWORD *)v326;
  v262 = *(_OWORD *)&v326[16];
  v257 = *(_OWORD *)&v324[8];
  v258 = *(_OWORD *)v325;
  v264 = *(_OWORD *)&v327[8];
  v268 = *(_QWORD *)((char *)v330 + 4);
  v270 = *(_OWORD *)__p;
  v263 = *(_QWORD *)v327;
  v265 = v328;
  v267 = v330[0];
  v266 = v329;
  v269 = v331;
  *(_QWORD *)&v271 = v273;
  *((_QWORD *)&v271 + 1) = v273;
  *(_QWORD *)&v272 = v273;
  *((_QWORD *)&v272 + 1) = 6;
  geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)&v271, (__int128 *)v333, v334);
  *(_QWORD *)((char *)v274 + 5) = *(_QWORD *)((char *)v338 + 5);
  v274[0] = v338[0];
  v275 = v339;
  v276 = v340;
  v277 = v341;
  v278 = v342;
  v279 = v343;
  v280 = v344;
  objc_copyWeak(&v281, &v283);
  v323 = 0;
  v128 = (char *)operator new(0xFE8uLL);
  v129 = v128;
  *(_QWORD *)v128 = &off_1E42C7940;
  v130 = (__int128 *)v246;
  *((_QWORD *)v128 + 13) = v238;
  *((_DWORD *)v128 + 36) = v242;
  v131 = v128 + 520;
  *(_OWORD *)(v128 + 40) = v234;
  *(_OWORD *)(v128 + 56) = v235;
  *(_OWORD *)(v128 + 72) = v236;
  *(_OWORD *)(v128 + 88) = v237;
  *(_OWORD *)(v128 + 8) = v232;
  *(_OWORD *)(v128 + 24) = v233;
  *((_OWORD *)v128 + 7) = v239;
  *((_QWORD *)v128 + 16) = v240;
  *((_QWORD *)v128 + 17) = v241;
  *(_QWORD *)(v128 + 148) = v243;
  *((_OWORD *)v128 + 10) = v244;
  *((_OWORD *)v128 + 11) = v245;
  v132 = v128 + 224;
  *((_QWORD *)v128 + 24) = v128 + 224;
  *((_QWORD *)v128 + 25) = v128 + 224;
  v133 = v247;
  *((_QWORD *)v128 + 26) = v128 + 224;
  *((_QWORD *)v128 + 27) = *((_QWORD *)&v133 + 1);
  if (v130 != (__int128 *)v133)
  {
    v134 = *((_QWORD *)&v246 + 1);
    *((_QWORD *)v128 + 24) = v130;
    *((_QWORD *)v128 + 25) = v134;
    v246 = 0u;
    v247 = 0u;
    goto LABEL_94;
  }
  v150 = (__int128 *)*((_QWORD *)&v246 + 1);
  v151 = *((_QWORD *)&v246 + 1) == (_QWORD)v130;
  *((_QWORD *)v128 + 25) = &v132[*((_QWORD *)&v246 + 1) - (_QWORD)v130];
  if (!v151)
  {
    v152 = 0;
    v153 = v128 + 504;
    v154 = v128 + 520;
    do
    {
      v155 = *v130;
      *((_QWORD *)v132 + 2) = *((_QWORD *)v130 + 2);
      *(_OWORD *)v132 = v155;
      v156 = *((_QWORD *)v130 + 3);
      *((_DWORD *)v132 + 8) = *((_DWORD *)v130 + 8);
      *((_QWORD *)v132 + 3) = v156;
      *(_QWORD *)(v132 + 36) = *(_QWORD *)((char *)v130 + 36);
      v157 = *(__int128 *)((char *)v130 + 44);
      v158 = *(__int128 *)((char *)v130 + 60);
      v159 = *(__int128 *)((char *)v130 + 76);
      *(_OWORD *)(v132 + 92) = *(__int128 *)((char *)v130 + 92);
      *(_OWORD *)(v132 + 76) = v159;
      *(_OWORD *)(v132 + 60) = v158;
      *(_OWORD *)(v132 + 44) = v157;
      v160 = *(__int128 *)((char *)v130 + 108);
      v161 = *(__int128 *)((char *)v130 + 124);
      v162 = *(__int128 *)((char *)v130 + 140);
      *(_OWORD *)(v132 + 156) = *(__int128 *)((char *)v130 + 156);
      *(_OWORD *)(v132 + 140) = v162;
      *(_OWORD *)(v132 + 124) = v161;
      *(_OWORD *)(v132 + 108) = v160;
      v163 = *(__int128 *)((char *)v130 + 172);
      v164 = *(__int128 *)((char *)v130 + 188);
      v165 = *(__int128 *)((char *)v130 + 204);
      *(_OWORD *)(v132 + 220) = *(__int128 *)((char *)v130 + 220);
      *(_OWORD *)(v132 + 204) = v165;
      *(_OWORD *)(v132 + 188) = v164;
      *(_OWORD *)(v132 + 172) = v163;
      v166 = v132 + 280;
      *((_QWORD *)v132 + 31) = v132 + 280;
      v167 = (char *)*((_QWORD *)v130 + 31);
      *((_DWORD *)v132 + 59) = *((_DWORD *)v130 + 59);
      v132[240] = *((_BYTE *)v130 + 240);
      *((_QWORD *)v132 + 32) = v132 + 280;
      *((_QWORD *)v132 + 33) = v132 + 280;
      *((_QWORD *)v132 + 34) = *((_QWORD *)v130 + 34);
      if (v167 == *((char **)v130 + 33))
      {
        *((_QWORD *)v132 + 32) = &v166[*((_QWORD *)v130 + 32) - (_QWORD)v167];
        v168 = (char *)*((_QWORD *)v130 + 32);
        if (v167 != v168)
        {
          v169 = v168 - v167;
          if ((unint64_t)(v168 - v167) >= 8 && (unint64_t)(&v129[288 * v152 + 504] - v167) >= 0x20)
          {
            if (v169 < 0x20)
            {
              v170 = 0;
              goto LABEL_123;
            }
            v170 = v169 & 0xFFFFFFFFFFFFFFE0;
            v171 = (__int128 *)(v167 + 16);
            v172 = v154;
            v173 = v169 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              v174 = *v171;
              *(v172 - 1) = *(v171 - 1);
              *v172 = v174;
              v171 += 2;
              v172 += 2;
              v173 -= 32;
            }
            while (v173);
            if (v169 == v170)
              goto LABEL_112;
            if ((v169 & 0x18) != 0)
            {
LABEL_123:
              v175 = v169 & 0xFFFFFFFFFFFFFFF8;
              v166 += v169 & 0xFFFFFFFFFFFFFFF8;
              v176 = v170 - (v169 & 0xFFFFFFFFFFFFFFF8);
              v177 = (uint64_t *)&v167[v170];
              v178 = &v153[v170];
              do
              {
                v179 = *v177++;
                *(_QWORD *)v178 = v179;
                v178 += 8;
                v176 += 8;
              }
              while (v176);
              if (v169 == v175)
                goto LABEL_112;
              v167 += v175;
            }
            else
            {
              v167 += v170;
              v166 += v170;
            }
          }
          do
          {
            v180 = *v167++;
            *v166++ = v180;
          }
          while (v167 != v168);
        }
      }
      else
      {
        *((_QWORD *)v132 + 31) = v167;
        *((_QWORD *)v132 + 32) = *((_QWORD *)v130 + 32);
        *(__int128 *)((char *)v130 + 248) = 0uLL;
        *(__int128 *)((char *)v130 + 264) = 0uLL;
      }
LABEL_112:
      v132 += 288;
      v130 += 18;
      ++v152;
      v154 += 18;
      v153 += 288;
    }
    while (v130 != v150);
  }
LABEL_94:
  *((_QWORD *)v129 + 244) = v249[0];
  *(_QWORD *)(v129 + 1957) = *(_QWORD *)((char *)v249 + 5);
  *((_OWORD *)v129 + 123) = v250;
  *((_QWORD *)v129 + 248) = v251;
  *(_OWORD *)(v129 + 1992) = v252;
  *((_QWORD *)v129 + 251) = v253;
  *((_QWORD *)v129 + 252) = v254;
  *((_QWORD *)v129 + 253) = v255;
  objc_moveWeak((id *)v129 + 254, &v256);
  v135 = v260;
  *(_OWORD *)(v129 + 2072) = v259;
  *(_OWORD *)(v129 + 2088) = v135;
  v136 = v262;
  *(_OWORD *)(v129 + 2104) = v261;
  *(_OWORD *)(v129 + 2120) = v136;
  v137 = v258;
  *(_OWORD *)(v129 + 2040) = v257;
  *(_OWORD *)(v129 + 2056) = v137;
  *((_OWORD *)v129 + 134) = v264;
  *(_QWORD *)(v131 + 1660) = v268;
  v138 = v269;
  *((_OWORD *)v129 + 138) = v270;
  *((_QWORD *)v129 + 267) = v263;
  *((_QWORD *)v129 + 270) = v265;
  *((_DWORD *)v129 + 544) = v267;
  *((_QWORD *)v129 + 271) = v266;
  *((_OWORD *)v129 + 137) = v138;
  v139 = v129 + 2256;
  *((_QWORD *)v129 + 278) = v129 + 2256;
  *((_QWORD *)v129 + 279) = v129 + 2256;
  *((_QWORD *)v129 + 280) = v129 + 2256;
  *((_QWORD *)v129 + 281) = *((_QWORD *)&v272 + 1);
  v140 = (__int128 *)v271;
  if ((_QWORD)v271 == (_QWORD)v272)
  {
    v181 = (__int128 *)*((_QWORD *)&v271 + 1);
    v151 = *((_QWORD *)&v271 + 1) == (_QWORD)v271;
    *((_QWORD *)v129 + 279) = &v139[*((_QWORD *)&v271 + 1) - v271];
    if (v151)
      goto LABEL_96;
    v182 = 0;
    v183 = v131 + 2032;
    v184 = v129 + 2536;
    while (1)
    {
      v185 = *v140;
      *((_QWORD *)v139 + 2) = *((_QWORD *)v140 + 2);
      *(_OWORD *)v139 = v185;
      v186 = *((_QWORD *)v140 + 3);
      *((_DWORD *)v139 + 8) = *((_DWORD *)v140 + 8);
      *((_QWORD *)v139 + 3) = v186;
      *(_QWORD *)(v139 + 36) = *(_QWORD *)((char *)v140 + 36);
      v187 = *(__int128 *)((char *)v140 + 44);
      v188 = *(__int128 *)((char *)v140 + 60);
      v189 = *(__int128 *)((char *)v140 + 76);
      *(_OWORD *)(v139 + 92) = *(__int128 *)((char *)v140 + 92);
      *(_OWORD *)(v139 + 76) = v189;
      *(_OWORD *)(v139 + 60) = v188;
      *(_OWORD *)(v139 + 44) = v187;
      v190 = *(__int128 *)((char *)v140 + 108);
      v191 = *(__int128 *)((char *)v140 + 124);
      v192 = *(__int128 *)((char *)v140 + 140);
      *(_OWORD *)(v139 + 156) = *(__int128 *)((char *)v140 + 156);
      *(_OWORD *)(v139 + 140) = v192;
      *(_OWORD *)(v139 + 124) = v191;
      *(_OWORD *)(v139 + 108) = v190;
      v193 = *(__int128 *)((char *)v140 + 172);
      v194 = *(__int128 *)((char *)v140 + 188);
      v195 = *(__int128 *)((char *)v140 + 204);
      *(_OWORD *)(v139 + 220) = *(__int128 *)((char *)v140 + 220);
      *(_OWORD *)(v139 + 204) = v195;
      *(_OWORD *)(v139 + 188) = v194;
      *(_OWORD *)(v139 + 172) = v193;
      v196 = v139 + 280;
      *((_QWORD *)v139 + 31) = v139 + 280;
      v197 = (char *)*((_QWORD *)v140 + 31);
      *((_DWORD *)v139 + 59) = *((_DWORD *)v140 + 59);
      v139[240] = *((_BYTE *)v140 + 240);
      *((_QWORD *)v139 + 32) = v139 + 280;
      *((_QWORD *)v139 + 33) = v139 + 280;
      *((_QWORD *)v139 + 34) = *((_QWORD *)v140 + 34);
      if (v197 == *((char **)v140 + 33))
      {
        *((_QWORD *)v139 + 32) = &v196[*((_QWORD *)v140 + 32) - (_QWORD)v197];
        v198 = (char *)*((_QWORD *)v140 + 32);
        if (v197 != v198)
        {
          v199 = v198 - v197;
          if ((unint64_t)(v198 - v197) >= 8 && (unint64_t)(&v129[288 * v182 + 2536] - v197) >= 0x20)
          {
            if (v199 < 0x20)
            {
              v200 = 0;
              goto LABEL_144;
            }
            v200 = v199 & 0xFFFFFFFFFFFFFFE0;
            v201 = (__int128 *)(v197 + 16);
            v202 = v183;
            v203 = v199 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              v204 = *v201;
              *(v202 - 1) = *(v201 - 1);
              *v202 = v204;
              v201 += 2;
              v202 += 2;
              v203 -= 32;
            }
            while (v203);
            if (v199 == v200)
              goto LABEL_133;
            if ((v199 & 0x18) != 0)
            {
LABEL_144:
              v205 = v199 & 0xFFFFFFFFFFFFFFF8;
              v196 += v199 & 0xFFFFFFFFFFFFFFF8;
              v206 = v200 - (v199 & 0xFFFFFFFFFFFFFFF8);
              v207 = (uint64_t *)&v197[v200];
              v208 = &v184[v200];
              do
              {
                v209 = *v207++;
                *(_QWORD *)v208 = v209;
                v208 += 8;
                v206 += 8;
              }
              while (v206);
              if (v199 == v205)
                goto LABEL_133;
              v197 += v205;
            }
            else
            {
              v197 += v200;
              v196 += v200;
            }
          }
          do
          {
            v210 = *v197++;
            *v196++ = v210;
          }
          while (v197 != v198);
        }
      }
      else
      {
        *((_QWORD *)v139 + 31) = v197;
        *((_QWORD *)v139 + 32) = *((_QWORD *)v140 + 32);
        *(__int128 *)((char *)v140 + 248) = 0uLL;
        *(__int128 *)((char *)v140 + 264) = 0uLL;
      }
LABEL_133:
      v139 += 288;
      v140 += 18;
      ++v182;
      v183 += 18;
      v184 += 288;
      if (v140 == v181)
        goto LABEL_96;
    }
  }
  *((_OWORD *)v129 + 139) = v271;
  v271 = 0u;
  v272 = 0u;
LABEL_96:
  *((_QWORD *)v129 + 498) = v274[0];
  *(_QWORD *)(v129 + 3989) = *(_QWORD *)((char *)v274 + 5);
  *((_OWORD *)v129 + 250) = v275;
  *((_QWORD *)v129 + 502) = v276;
  *(_OWORD *)(v129 + 4024) = v277;
  *((_QWORD *)v129 + 505) = v278;
  *((_QWORD *)v129 + 506) = v279;
  *((_QWORD *)v129 + 507) = v280;
  objc_moveWeak((id *)v129 + 508, &v281);
  v323 = v129;
  geo::TaskQueue::async((std::__shared_weak_count_vtbl **)&v282, v230, v322);
  v141 = v282;
  v282 = 0uLL;
  v142 = *(std::__shared_weak_count **)(v9 + 4552);
  *(_OWORD *)(v9 + 4544) = v141;
  if (v142)
  {
    p_shared_owners = (unint64_t *)&v142->__shared_owners_;
    do
      v144 = __ldaxr(p_shared_owners);
    while (__stlxr(v144 - 1, p_shared_owners));
    if (!v144)
    {
      ((void (*)(std::__shared_weak_count *))v142->__on_zero_shared)(v142);
      std::__shared_weak_count::__release_weak(v142);
    }
  }
  v145 = (std::__shared_weak_count *)*((_QWORD *)&v282 + 1);
  if (*((_QWORD *)&v282 + 1))
  {
    v146 = (unint64_t *)(*((_QWORD *)&v282 + 1) + 8);
    do
      v147 = __ldaxr(v146);
    while (__stlxr(v147 - 1, v146));
    if (!v147)
    {
      ((void (*)(std::__shared_weak_count *))v145->__on_zero_shared)(v145);
      std::__shared_weak_count::__release_weak(v145);
    }
  }
  v148 = v323;
  if (v323 == v322)
  {
    v149 = 4;
    v148 = v322;
LABEL_152:
    (*(void (**)(void))(*v148 + 8 * v149))();
  }
  else if (v323)
  {
    v149 = 5;
    goto LABEL_152;
  }
  objc_destroyWeak(&v281);
  v211 = (_QWORD *)*((_QWORD *)&v271 + 1);
  v212 = (_QWORD *)v271;
  if ((_QWORD)v271 != *((_QWORD *)&v271 + 1))
  {
    do
    {
      v213 = (void *)v212[31];
      if (v213 != (void *)v212[33])
        free(v213);
      v212 += 36;
    }
    while (v212 != v211);
    v212 = (_QWORD *)v271;
  }
  if (v212 != (_QWORD *)v272)
    free(v212);
  objc_destroyWeak(&v256);
  v214 = (_QWORD *)*((_QWORD *)&v246 + 1);
  v215 = (_QWORD *)v246;
  if ((_QWORD)v246 != *((_QWORD *)&v246 + 1))
  {
    do
    {
      v216 = (void *)v215[31];
      if (v216 != (void *)v215[33])
        free(v216);
      v215 += 36;
    }
    while (v215 != v214);
    v215 = (_QWORD *)v246;
  }
  if (v215 != (_QWORD *)v247)
    free(v215);
  v217 = (__int128 *)v333;
  v218 = v334;
  if (v333 != v334)
  {
    do
    {
      v219 = (void *)*((_QWORD *)v217 + 31);
      if (v219 != *((void **)v217 + 33))
        free(v219);
      v217 += 18;
    }
    while (v217 != v218);
    v217 = (__int128 *)v333;
  }
  if (v217 != v335)
    free(v217);
  objc_destroyWeak((id *)v324);
  objc_destroyWeak(&v283);
  v220 = (__int128 *)v298;
  v221 = v299;
  if (v298 == v299)
  {
    v38 = v228;
  }
  else
  {
    v38 = v228;
    do
    {
      v222 = (void *)*((_QWORD *)v220 + 31);
      if (v222 != *((void **)v220 + 33))
        free(v222);
      v220 += 18;
    }
    while (v220 != v221);
    v220 = (__int128 *)v298;
  }
  if (v220 != v300)
    free(v220);
  v48 = 1;
LABEL_187:

  return v48;
}

- (void)startPanningAtPoint:(CGPoint)a3 panAtStartPoint:(BOOL)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  float v14;

  y = a3.y;
  x = a3.x;
  if (!-[VKMuninCameraController isAnimationsRunningExceptBump](self, "isAnimationsRunningExceptBump", a4))
  {
    v7 = (void *)*((_QWORD *)self + 545);
    if (v7)
      objc_msgSend(v7, "stop");
    -[VKMuninCameraController cancelPendingMoveExceptBump](self, "cancelPendingMoveExceptBump");
    -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
    *(_QWORD *)((char *)self + 4260) = 0;
    -[VKCameraController canvas](self, "canvas");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "size");
    v10 = v9;
    v12 = v11;

    v13 = x / v10;
    v14 = y / v12;
    *((float *)self + 1063) = v13;
    *((float *)self + 1064) = v14;
    *((_QWORD *)self + 550) = *((_QWORD *)self + 553);
    *((_BYTE *)self + 4248) = 1;
    *((_BYTE *)self + 4249) = 0;
  }
}

- (Unit<geo::RadianUnitDescription,)_horizontalFieldOfView:()Unit<geo:(double>)a3 :RadianUnitDescription
{
  double *v3;
  double *v4;
  double *v5;
  double *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  Unit<geo::RadianUnitDescription, double> v16;

  v5 = v3;
  v7 = v4;
  -[VKCameraController canvas](self, "canvas", a3._value);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  if (v9 <= 0.0)
  {

    goto LABEL_5;
  }
  -[VKCameraController canvas](self, "canvas");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "size");
  v12 = v11;
  -[VKCameraController canvas](self, "canvas");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "size");
  v15 = v12 / v14;

  if (v15 >= 1.0)
  {
LABEL_5:
    v16._value = *v5;
    goto LABEL_6;
  }
  v16._value = *v5 * v15;
LABEL_6:
  *v7 = v16._value;
  return v16;
}

- (Unit<geo::RadianUnitDescription,)_verticalFieldOfView:()Unit<geo:(double>)a3 :RadianUnitDescription
{
  double *v3;
  double *v4;
  double *v5;
  double *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  Unit<geo::RadianUnitDescription, double> v14;

  v5 = v3;
  v7 = v4;
  -[VKCameraController canvas](self, "canvas", a3._value);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v10 = v9;
  -[VKCameraController canvas](self, "canvas");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "size");
  v13 = v10 / v12;

  v14._value = *v5 / fmax(v13, 1.0);
  *v7 = v14._value;
  return v14;
}

- (Unit<geo::RadianUnitDescription,)_pitchForScreenPoint:()Matrix<float
{
  double *v3;
  float v4;
  double *v6;
  double v7;
  float v8;
  float v9;
  Unit<geo::RadianUnitDescription, double> v10;
  _QWORD v11[2];

  v4 = a3._e[1];
  v6 = v3;
  -[VKCameraController centerScreenPoint](self, "centerScreenPoint", *(double *)&a3);
  v8 = v7;
  v9 = v4 - v8;
  v11[0] = *((_QWORD *)self + 556);
  -[VKMuninCameraController _verticalFieldOfView:](self, "_verticalFieldOfView:", v11);
  v10._value = *((double *)self + 554) + *(double *)&v11[1] * v9;
  *v6 = v10._value;
  return v10;
}

- (void)updatePanWithTranslation:(CGPoint)a3
{
  double y;
  CGFloat x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  float v12;
  float v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  long double v20;
  float v21;
  void *v22;
  uint64_t v23;
  long double __x;
  _QWORD v25[2];
  _QWORD v26[2];
  char v27;

  if (*((_BYTE *)self + 4248))
  {
    y = a3.y;
    x = a3.x;
    -[VKCameraController canvas](self, "canvas");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "size");
    v8 = v7;
    v10 = v9;

    v11 = x / v8;
    v12 = y / v10;
    *(float *)&x = v11 - *((float *)self + 1065);
    *(float *)&v10 = v12 - *((float *)self + 1066);
    *((float *)self + 1065) = v11;
    *((float *)self + 1066) = v12;
    v13 = *((float *)self + 1064) + *(float *)&v10;
    *((float *)self + 1063) = *((float *)self + 1063) + *(float *)&x;
    *((float *)self + 1064) = v13;
    v26[0] = *((_QWORD *)self + 556);
    -[VKMuninCameraController _horizontalFieldOfView:](self, "_horizontalFieldOfView:", v26);
    v25[0] = *((_QWORD *)self + 556);
    -[VKMuninCameraController _verticalFieldOfView:](self, "_verticalFieldOfView:", v25);
    v14 = *((double *)self + 553);
    LODWORD(v15) = *((_DWORD *)self + 1063);
    LODWORD(v16) = *((_DWORD *)self + 1064);
    -[VKMuninCameraController _pitchForScreenPoint:](self, "_pitchForScreenPoint:", v15, v16);
    v17 = *((double *)self + 553);
    v18 = *(double *)&v26[1] * *(float *)&x;
    *((long double *)self + 553) = v18 / cos(__x) + v17;
    *((double *)self + 554) = fmin(fmax(*((double *)self + 554) - *(double *)&v25[1] * *(float *)&v10, -1.57079633), 0.785398163);
    v19 = *((double *)self + 553);
    *((double *)self + 550) = v19;
    if (!*((_BYTE *)self + 4249))
    {
      v20 = fmod(3.14159265 - v14 + v19, 6.28318531);
      v21 = fmin(*((float *)self + 1087) + fabs(fmod(v20 + 6.28318531, 6.28318531) + -3.14159265) * 3.81971863, 1.0);
      *((float *)self + 1087) = v21;
    }
    -[VKCameraController cameraDelegate](self, "cameraDelegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "mapLayerDidChangeVisibleRegion");

    v23 = *(_QWORD *)-[VKCameraController runLoopController](self, "runLoopController");
    if (v23)
    {
      v27 = 4;
      md::MapEngine::setNeedsTick(v23, &v27);
    }
  }
}

- (void)willStopPanningAtPoint:(CGPoint)a3 withVelocity:(CGPoint)a4
{
  double x;
  int v6;
  char *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  VKTimedAnimation *v12;
  void *v13;
  double v14;
  double v15;
  float v16;
  float v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  int v22;
  id location[7];
  __int128 v24;

  if (*((_BYTE *)self + 4248))
  {
    x = a4.x;
    v6 = *((_DWORD *)self + 1087);
    v7 = (char *)self + 4352;
    v8 = (void *)*((_QWORD *)self + 545);
    if (v8)
      objc_msgSend(v8, "stop", a3.x, a3.y, a4.x, a4.y);
    *((_BYTE *)self + 4249) = 1;
    v9 = fabs(fmax(x, 100.0));
    v10 = 0.0;
    if (v9 * 0.001 > 0.0)
      v10 = log(10.0 / v9) * -11.9699749;
    v11 = ceil(v10);
    v12 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", v11 * 0.0166666667);
    v13 = (void *)*((_QWORD *)v7 + 1);
    *((_QWORD *)v7 + 1) = v12;

    v14 = v11 * 16.6666667;
    v15 = v9 * 0.0159494286;
    v16 = v14;
    v17 = -(v15 - exp2(v16 * -0.00723156923) * v15) * -12.476936;
    v18 = MEMORY[0x1E0C809B0];
    location[0] = (id)MEMORY[0x1E0C809B0];
    location[1] = (id)3221225472;
    location[2] = __dynamicValueAnimationTimingFunction_block_invoke;
    location[3] = &__block_descriptor_72_e8_f12__0f8l;
    *(double *)&location[4] = v17;
    location[5] = *(id *)&v14;
    location[6] = *(id *)&v15;
    v24 = xmmword_19FFB4ED0;
    v19 = (void *)objc_msgSend(location, "copy");
    objc_msgSend(*((id *)v7 + 1), "setTimingFunction:", v19);

    objc_initWeak(location, self);
    v20[0] = v18;
    v20[1] = 3221225472;
    v20[2] = __63__VKMuninCameraController_willStopPanningAtPoint_withVelocity___block_invoke;
    v20[3] = &unk_1E42F1100;
    objc_copyWeak(&v21, location);
    v22 = v6;
    objc_msgSend(*((id *)v7 + 1), "setStepHandler:", v20);
    objc_msgSend(*((id *)v7 + 1), "setCompletionHandler:", &__block_literal_global_25_13501);
    md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), *((VKAnimation **)v7 + 1));
    objc_destroyWeak(&v21);
    objc_destroyWeak(location);
  }
}

- (void)stopPanningAtPoint:(CGPoint)a3
{
  if (*((_BYTE *)self + 4248))
  {
    *((_BYTE *)self + 4248) = 0;
    -[VKCameraController endRegionChange](self, "endRegionChange", a3.x, a3.y);
  }
}

- (double)_zoomRubberBandFov:(double)a3
{
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;

  v5 = *((_QWORD *)self + 17);
  -[VKCameraController canvas](self, "canvas");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "size");
  *(float *)&v7 = v7;
  *(float *)&v8 = v8;
  v9 = 728;
  if ((float)(*(float *)&v7 / fmaxf(*(float *)&v8, 0.01)) > 1.0)
    v9 = 744;
  v10 = *(double *)(v5 + v9);
  v11 = *(double *)(v5 + 768);

  v12 = *((_QWORD *)self + 17);
  -[VKCameraController canvas](self, "canvas");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "size");
  *(float *)&v14 = v14;
  *(float *)&v15 = v15;
  v16 = 728;
  if ((float)(*(float *)&v14 / fmaxf(*(float *)&v15, 0.01)) > 1.0)
    v16 = 744;
  v17 = *(double *)(v12 + v16);

  v18 = *((_QWORD *)self + 17);
  v19 = *(double *)(v18 + 752);
  v20 = a3;
  v21 = fmax(v19 - *(double *)(v18 + 760), 0.00872664626);
  v22 = v19;
  v23 = v17;
  v24 = logf(v20);
  v25 = logf(v21);
  v26 = logf(v22);
  v27 = logf(v23);
  if (v24 > v27)
  {
    v28 = v27;
    v29 = v11 + v10;
    v24 = (float)((float)((float)(logf(v29) - v28) * (float)(v24 - v28)) / (float)((float)(v24 - v28) + 1.0)) + v28;
  }
  if (v24 >= v26)
    v30 = -v24;
  else
    v30 = (float)((float)((float)(v26 - v24) * (float)(v26 - v25)) / (float)((float)(v26 - v24) + 1.0)) - v26;
  return expf(-v30);
}

- (void)setWidestFieldOfView:()Unit<geo:(double>)a3 :RadianUnitDescription
{
  double *v3;
  double *v4;
  double *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *i;
  double v26;
  uint64_t v27;
  char v28[8];
  char v29;
  char v30;
  void *v31;
  _QWORD *v32;
  char v33;
  void *__p;
  uint64_t v35;

  v4 = v3;
  v35 = *MEMORY[0x1E0C80C00];
  v6 = (double *)*((_QWORD *)self + 17);
  v7 = v6[94];
  v8 = v6[95];
  -[VKCameraController canvas](self, "canvas", a3._value);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  *(float *)&v10 = v10;
  *(float *)&v11 = v11;
  v12 = 91;
  if ((float)(*(float *)&v10 / fmaxf(*(float *)&v11, 0.01)) > 1.0)
    v12 = 93;
  v13 = v6[v12];
  v14 = v6[96];

  v15 = *((_QWORD *)self + 17);
  -[VKCameraController canvas](self, "canvas");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "size");
  *(float *)&v17 = v17;
  *(float *)&v18 = v18;
  v19 = 720;
  if ((float)(*(float *)&v17 / fmaxf(*(float *)&v18, 0.01)) > 1.0)
    v19 = 736;
  v20 = *(double *)(v15 + v19);

  if (*v4 < v20 && *((double *)self + 556) >= v20)
  {
    v24 = *((_QWORD *)self + 17);
    v29 = 0;
    v30 = 0;
    v33 = 0;
    v28[0] = 7;
    md::MuninSceneLogic::addSceneEvent(v24, (uint64_t)v28);
    if (v33 && __p)
      operator delete(__p);
    if (v30)
    {
      v22 = v31;
      if (v31)
      {
        for (i = v32; i != v22; std::__destroy_at[abi:nn180100]<md::mun::PointView,0>(i))
          i -= 249;
LABEL_16:
        operator delete(v22);
      }
    }
  }
  else if (*v4 >= v20 && *((double *)self + 556) < v20)
  {
    v21 = *((_QWORD *)self + 17);
    v29 = 0;
    v30 = 0;
    v33 = 0;
    v28[0] = 8;
    md::MuninSceneLogic::addSceneEvent(v21, (uint64_t)v28);
    if (v33 && __p)
      operator delete(__p);
    if (v30)
    {
      v22 = v31;
      if (v31)
      {
        v23 = v32;
        if (v32 != v31)
        {
          do
          {
            v23 -= 249;
            std::__destroy_at[abi:nn180100]<md::mun::PointView,0>(v23);
          }
          while (v23 != v22);
        }
        goto LABEL_16;
      }
    }
  }
  v26 = *v4;
  *((double *)self + 556) = *v4;
  if (*((_BYTE *)self + 4440))
    *((double *)self + 556) = fmin(fmax(fmax(v7 - v8, 0.00872664626), v26), v14 + v13);
  *(_QWORD *)(*(_QWORD *)(-[VKCameraController mapDataAccess](self, "mapDataAccess") + 16) + 456) = *((_QWORD *)self + 556);
  v27 = *(_QWORD *)-[VKCameraController runLoopController](self, "runLoopController");
  if (v27)
  {
    v28[0] = 4;
    md::MapEngine::setNeedsTick(v27, v28);
  }
}

- (void)startPinchingWithFocusPoint:(CGPoint)a3
{
  if (!-[VKMuninCameraController isAnimationsRunningExceptBump](self, "isAnimationsRunningExceptBump", a3.x, a3.y))
  {
    -[VKMuninCameraController cancelPendingMoveExceptBump](self, "cancelPendingMoveExceptBump");
    -[VKCameraController beginRegionChange:](self, "beginRegionChange:", 0);
    *((_QWORD *)self + 539) = *((_QWORD *)self + 556);
    *((_BYTE *)self + 4296) = 1;
    *(_QWORD *)((char *)self + 4300) = 0;
  }
}

- (void)updatePinchWithFocusPoint:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5
{
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  float v28;
  float v29;
  float v30;
  double v31;
  void *v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  _QWORD v39[2];
  _QWORD v40[2];
  double v41;
  char v42;

  if (*((_BYTE *)self + 4296))
  {
    y = a3.y;
    x = a3.x;
    -[VKMuninCameraController _zoomRubberBandFov:](self, "_zoomRubberBandFov:", *((double *)self + 539) / a4);
    v10 = v9;
    -[VKMuninCameraController _zoomRubberBandFov:](self, "_zoomRubberBandFov:", *((double *)self + 539) / a5);
    v12 = v11;
    v13 = *((double *)self + 539);
    v41 = v11;
    -[VKMuninCameraController setWidestFieldOfView:](self, "setWidestFieldOfView:", &v41);
    -[VKCameraController centerScreenPoint](self, "centerScreenPoint");
    v15 = v14;
    v17 = v16;
    -[VKCameraController canvas](self, "canvas");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "size");
    v38 = v19;
    -[VKCameraController canvas](self, "canvas");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v17;
    v36 = y;
    v21 = v10;
    v37 = x;
    objc_msgSend(v20, "size");
    v23 = v22;

    LODWORD(y) = *((_DWORD *)self + 1075);
    LODWORD(v10) = *((_DWORD *)self + 1076);
    -[VKCameraController canvas](self, "canvas");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "size");
    v34 = v25;
    v27 = v26;
    v28 = v38 * v15;
    v29 = v23 * (1.0 - v35);
    v30 = v36;
    v31 = fmax(1.0 - v21 / v13, 0.0);
    *(float *)&v31 = (fmax(1.0 - v12 / v13, 0.0) - v31) / (1.0 - v31);
    *(float *)&v12 = *(float *)&v10 + (float)((float)(v29 - (float)(*(float *)&v10 + v30)) * *(float *)&v31);
    *(float *)&v25 = v37;
    *(float *)&v23 = *(float *)&y + (float)((float)(v28 - (float)(*(float *)&y + *(float *)&v25)) * *(float *)&v31);

    *(float *)&v27 = (float)(*(float *)&v23 - *((float *)self + 1075)) / v27;
    *(float *)&v13 = (float)(*((float *)self + 1076) - *(float *)&v12) / v34;
    *((_DWORD *)self + 1075) = LODWORD(v23);
    *((_DWORD *)self + 1076) = LODWORD(v12);
    v40[0] = *((_QWORD *)self + 539);
    -[VKMuninCameraController _horizontalFieldOfView:](self, "_horizontalFieldOfView:", v40);
    v39[0] = *((_QWORD *)self + 539);
    -[VKMuninCameraController _verticalFieldOfView:](self, "_verticalFieldOfView:", v39);
    *((double *)self + 553) = *((double *)self + 553) + *(double *)&v40[1] * *(float *)&v27;
    *((double *)self + 554) = fmin(fmax(*((double *)self + 554) + *(double *)&v39[1] * *(float *)&v13, -0.785398163), 0.785398163);
    -[VKCameraController cameraDelegate](self, "cameraDelegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "mapLayerDidChangeVisibleRegion");

    v33 = *(_QWORD *)-[VKCameraController runLoopController](self, "runLoopController");
    if (v33)
    {
      v42 = 4;
      md::MapEngine::setNeedsTick(v33, &v42);
    }
  }
}

- (void)stopPinchingWithFocusPoint:(CGPoint)a3
{
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  _QWORD v18[5];
  double v19;

  if (*((_BYTE *)self + 4296))
  {
    *((_BYTE *)self + 4296) = 0;
    v4 = *((_QWORD *)self + 17);
    v5 = *(double *)(v4 + 752);
    v6 = *((double *)self + 556);
    if (v6 >= v5)
    {
      -[VKCameraController canvas](self, "canvas", a3.x, a3.y);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "size");
      *(float *)&v8 = v8;
      *(float *)&v9 = v9;
      v10 = 728;
      if ((float)(*(float *)&v8 / fmaxf(*(float *)&v9, 0.01)) > 1.0)
        v10 = 744;
      v11 = *(double *)(v4 + v10);
      v12 = *((double *)self + 556);

      if (v12 <= v11)
      {
        -[VKCameraController endRegionChange](self, "endRegionChange");
        return;
      }
      v6 = *((double *)self + 556);
      v4 = *((_QWORD *)self + 17);
      v5 = *(double *)(v4 + 752);
    }
    -[VKCameraController canvas](self, "canvas");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "size");
    *(float *)&v14 = v14;
    *(float *)&v15 = v15;
    v16 = 728;
    if ((float)(*(float *)&v14 / fmaxf(*(float *)&v15, 0.01)) > 1.0)
      v16 = 744;
    v17 = fmin(fmax(v6, v5), *(double *)(v4 + v16));

    v19 = v17;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __54__VKMuninCameraController_stopPinchingWithFocusPoint___block_invoke;
    v18[3] = &unk_1E42F3E78;
    v18[4] = self;
    -[VKMuninCameraController zoomAnimated:completion:](self, "zoomAnimated:completion:", &v19, v18);
  }
}

- (void)zoomAnimatedWithDuration:()Unit<geo:(double>)a3 :(float)a4 RadianUnitDescription duration:(id)a5 completion:
{
  void *v5;
  float v6;
  id v9;
  void *v10;
  double v11;
  VKTimedAnimation *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20[3];
  id location;

  v6 = *(float *)&a3._value;
  v9 = v5;
  v10 = v9;
  v11 = *((double *)self + 556);
  if (*(double *)a5 == v11)
  {
    if (v9)
      (*((void (**)(id, uint64_t, double))v9 + 2))(v9, 1, *(double *)a5);
  }
  else
  {
    v12 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", v6);
    v13 = (void *)*((_QWORD *)self + 541);
    *((_QWORD *)self + 541) = v12;

    objc_initWeak(&location, self);
    v14 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3321888768;
    v19[2] = __72__VKMuninCameraController_zoomAnimatedWithDuration_duration_completion___block_invoke;
    v19[3] = &unk_1E42E9998;
    objc_copyWeak(v20, &location);
    v15 = *(void **)a5;
    v20[1] = *(id *)&v11;
    v20[2] = v15;
    objc_msgSend(*((id *)self + 541), "setStepHandler:", v19);
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __72__VKMuninCameraController_zoomAnimatedWithDuration_duration_completion___block_invoke_26;
    v17[3] = &unk_1E42F9440;
    v16 = (id)MEMORY[0x1A1AF5730](v10);
    v18 = v16;
    objc_msgSend(*((id *)self + 541), "setCompletionHandler:", v17);
    md::AnimationRunner::runAnimation((md::MapEngine **)-[VKCameraController animationRunner](self, "animationRunner"), *((VKAnimation **)self + 541));

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }

}

- (void)zoomAnimated:()Unit<geo:(double>)a3 :(id)a4 RadianUnitDescription completion:
{
  uint64_t v4;

  -[VKMuninCameraController zoomAnimatedWithDuration:duration:completion:](self, "zoomAnimatedWithDuration:duration:completion:", &v4, COERCE_DOUBLE(__PAIR64__(HIDWORD(*(_QWORD *)a4), 0.25)));
}

- (BOOL)canZoomInForTileSize:(int64_t)a3
{
  return 0;
}

- (BOOL)canZoomOutForTileSize:(int64_t)a3
{
  return 0;
}

- (double)currentZoomLevelForTileSize:(int64_t)a3
{
  return 17.17;
}

- (double)maximumZoomLevelForTileSize:(int64_t)a3
{
  return 17.17;
}

- (double)minimumZoomLevelForTileSize:(int64_t)a3
{
  return 17.17;
}

- (double)topDownMinimumZoomLevelForTileSize:(int64_t)a3
{
  return 17.17;
}

- (double)zoomLevelAdjustmentForTileSize:(int64_t)a3
{
  return 0.0;
}

- (BOOL)usesVKCamera
{
  return 0;
}

- (BOOL)virtualParallaxEnabled
{
  return *((_BYTE *)self + 4344);
}

- (void)setVirtualParallaxEnabled:(BOOL)a3
{
  *((_BYTE *)self + 4344) = a3;
}

- (void).cxx_destruct
{
  _anonymous_namespace_::PendingPathAnimation *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;

  v3 = (_anonymous_namespace_::PendingPathAnimation *)*((_QWORD *)self + 571);
  *((_QWORD *)self + 571) = 0;
  if (v3)
  {
    MEMORY[0x1A1AF4E00]();
  }
  v4 = (std::__shared_weak_count *)*((_QWORD *)self + 569);
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  *((_QWORD *)self + 544) = &off_1E42B4C90;

  *((_QWORD *)self + 540) = &off_1E42B4C90;
  *((_QWORD *)self + 534) = &off_1E42B4C90;

  std::mutex::~mutex((std::mutex *)((char *)self + 4176));
  v7 = (std::__shared_weak_count *)*((_QWORD *)self + 521);
  if (v7)
  {
    v8 = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  if (*((_BYTE *)self + 168))
  {
    *((_BYTE *)self + 168) = 0;
  }
  v10 = (std::__shared_weak_count *)*((_QWORD *)self + 20);
  if (v10)
  {
    v11 = (unint64_t *)&v10->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
}

void __72__VKMuninCameraController_zoomAnimatedWithDuration_duration_completion___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  double v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v7 = *(double *)(a1 + 40) + (*(double *)(a1 + 48) - *(double *)(a1 + 40)) * a2;
    objc_msgSend(WeakRetained, "setWidestFieldOfView:", &v7);
    objc_msgSend(v5, "cameraDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mapLayerDidChangeVisibleRegion");

  }
}

uint64_t __72__VKMuninCameraController_zoomAnimatedWithDuration_duration_completion___block_invoke_26(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __54__VKMuninCameraController_stopPinchingWithFocusPoint___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endRegionChange");
}

void __63__VKMuninCameraController_willStopPanningAtPoint_withVelocity___block_invoke(uint64_t a1, float a2)
{
  float *WeakRetained;
  void *v5;
  float *v6;

  WeakRetained = (float *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1087] = *(float *)(a1 + 40) - (float)(*(float *)(a1 + 40) * a2);
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "cameraDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mapLayerDidChangeVisibleRegion");

    WeakRetained = v6;
  }

}

- (uint64_t)tapAtPoint:(uint64_t)a1
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_OWORD *)(a2 + 32);
  v6 = *(_OWORD *)(a2 + 48);
  v7 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v7;
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)(a1 + 48) = v6;
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  v8 = *(_OWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = v8;
  v9 = *(_QWORD *)(a2 + 128);
  *(_DWORD *)(a1 + 136) = *(_DWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = v9;
  *(_QWORD *)(a1 + 140) = *(_QWORD *)(a2 + 140);
  v10 = *(_OWORD *)(a2 + 152);
  v11 = *(_OWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 184) = a1 + 216;
  v12 = a1 + 184;
  *(_OWORD *)(a1 + 152) = v10;
  *(_OWORD *)(a1 + 168) = v11;
  *(_QWORD *)(a1 + 192) = a1 + 216;
  *(_QWORD *)(a1 + 200) = a1 + 216;
  *(_QWORD *)(a1 + 208) = 6;
  geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>(a1 + 184, *(__int128 **)(a2 + 184), *(__int128 **)(a2 + 192));
  v13 = *(_QWORD *)(a2 + 1944);
  *(_QWORD *)(v12 + 1765) = *(_QWORD *)(a2 + 1949);
  *(_QWORD *)(v12 + 1760) = v13;
  v14 = *(_OWORD *)(a2 + 1960);
  *(_QWORD *)(v12 + 1792) = *(_QWORD *)(a2 + 1976);
  *(_OWORD *)(v12 + 1776) = v14;
  v15 = *(_OWORD *)(a2 + 1984);
  *(_QWORD *)(v12 + 1816) = *(_QWORD *)(a2 + 2000);
  *(_OWORD *)(v12 + 1800) = v15;
  *(_QWORD *)(v12 + 1824) = *(_QWORD *)(a2 + 2008);
  *(_QWORD *)(v12 + 1832) = *(_QWORD *)(a2 + 2016);
  objc_copyWeak((id *)(v12 + 1840), (id *)(a2 + 2024));
  v16 = *(_OWORD *)(a2 + 2032);
  *(_OWORD *)(v12 + 1864) = *(_OWORD *)(a2 + 2048);
  *(_OWORD *)(v12 + 1848) = v16;
  v17 = *(_OWORD *)(a2 + 2064);
  v18 = *(_OWORD *)(a2 + 2080);
  v19 = *(_OWORD *)(a2 + 2096);
  *(_OWORD *)(v12 + 1928) = *(_OWORD *)(a2 + 2112);
  *(_OWORD *)(v12 + 1912) = v19;
  *(_OWORD *)(v12 + 1896) = v18;
  *(_OWORD *)(v12 + 1880) = v17;
  *(_QWORD *)(v12 + 1944) = *(_QWORD *)(a2 + 2128);
  v20 = *(_OWORD *)(a2 + 2136);
  *(_QWORD *)(v12 + 1968) = *(_QWORD *)(a2 + 2152);
  *(_OWORD *)(v12 + 1952) = v20;
  v21 = *(_QWORD *)(a2 + 2160);
  *(_DWORD *)(v12 + 1984) = *(_DWORD *)(a2 + 2168);
  *(_QWORD *)(v12 + 1976) = v21;
  *(_DWORD *)(v12 + 1988) = *(_DWORD *)(a2 + 2172);
  *(_DWORD *)(v12 + 1992) = *(_DWORD *)(a2 + 2176);
  v22 = *(_OWORD *)(a2 + 2184);
  *(_OWORD *)(v12 + 2016) = *(_OWORD *)(a2 + 2200);
  *(_OWORD *)(v12 + 2000) = v22;
  *(_QWORD *)(v12 + 2032) = v12 + 2064;
  *(_QWORD *)(v12 + 2040) = v12 + 2064;
  *(_QWORD *)(v12 + 2048) = v12 + 2064;
  *(_QWORD *)(v12 + 2056) = 6;
  geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>(v12 + 2032, *(__int128 **)(a2 + 2216), *(__int128 **)(a2 + 2224));
  v23 = *(_QWORD *)(a2 + 3976);
  *(_QWORD *)(a1 + 3981) = *(_QWORD *)(a2 + 3981);
  *(_QWORD *)(a1 + 3976) = v23;
  v24 = *(_OWORD *)(a2 + 3992);
  *(_QWORD *)(a1 + 4008) = *(_QWORD *)(a2 + 4008);
  *(_OWORD *)(a1 + 3992) = v24;
  v25 = *(_OWORD *)(a2 + 4016);
  *(_QWORD *)(a1 + 4032) = *(_QWORD *)(a2 + 4032);
  *(_OWORD *)(a1 + 4016) = v25;
  *(_QWORD *)(a1 + 4040) = *(_QWORD *)(a2 + 4040);
  *(_QWORD *)(a1 + 4048) = *(_QWORD *)(a2 + 4048);
  objc_copyWeak((id *)(a1 + 4056), (id *)(a2 + 4056));
  return a1;
}

- (id)tapAtPoint:(id *)location
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = location[24];
  v3 = location[25];
  if (v2 != v3)
  {
    do
    {
      v4 = (void *)v2[31];
      if (v4 != (void *)v2[33])
        free(v4);
      v2 += 36;
    }
    while (v2 != v3);
    v2 = location[24];
  }
  if (v2 != location[26])
    free(v2);
  objc_destroyWeak(location);
  return location;
}

- (uint64_t)tapAtPoint:
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  *(_QWORD *)a1 = &off_1E42C78F8;
  v2 = *(_QWORD **)(a1 + 200);
  v3 = *(_QWORD **)(a1 + 208);
  if (v2 != v3)
  {
    do
    {
      v4 = (void *)v2[31];
      if (v4 != (void *)v2[33])
        free(v4);
      v2 += 36;
    }
    while (v2 != v3);
    v2 = *(_QWORD **)(a1 + 200);
  }
  if (v2 != *(_QWORD **)(a1 + 216))
    free(v2);
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

- (void)tapAtPoint:
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;

  objc_destroyWeak((id *)(a1 + 4056));
  v2 = *(_QWORD **)(a1 + 2216);
  v3 = *(_QWORD **)(a1 + 2224);
  if (v2 != v3)
  {
    do
    {
      v4 = (void *)v2[31];
      if (v4 != (void *)v2[33])
        free(v4);
      v2 += 36;
    }
    while (v2 != v3);
    v2 = *(_QWORD **)(a1 + 2216);
  }
  if (v2 != *(_QWORD **)(a1 + 2232))
    free(v2);
  objc_destroyWeak((id *)(a1 + 2024));
  v5 = *(_QWORD **)(a1 + 184);
  v6 = *(_QWORD **)(a1 + 192);
  if (v5 != v6)
  {
    do
    {
      v7 = (void *)v5[31];
      if (v7 != (void *)v5[33])
        free(v7);
      v5 += 36;
    }
    while (v5 != v6);
    v5 = *(_QWORD **)(a1 + 184);
  }
  if (v5 != *(_QWORD **)(a1 + 200))
    free(v5);
}

- (_QWORD)tapAtPoint:
{
  uint64_t v1;
  _QWORD *v2;

  v1 = a1 + 8;
  v2 = operator new(0xFE8uLL);
  *v2 = &off_1E42C7940;
  std::__compressed_pair_elem<-[VKMuninCameraController tapAtPoint:]::$_14,0,false>::__compressed_pair_elem[abi:nn180100]<-[VKMuninCameraController tapAtPoint:]::$_14 const&,0ul>((uint64_t)(v2 + 1), v1);
  return v2;
}

- (char)tapAtPoint:
{
  id *v2;
  char *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;

  v2 = (id *)(a1 + 8);
  v3 = (char *)operator new(0x7F8uLL);
  *(_QWORD *)v3 = &off_1E42C78F8;
  objc_copyWeak((id *)v3 + 1, v2);
  v4 = *(_OWORD *)(a1 + 64);
  *((_OWORD *)v3 + 3) = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v3 + 4) = v4;
  v5 = *(_OWORD *)(a1 + 96);
  *((_OWORD *)v3 + 5) = *(_OWORD *)(a1 + 80);
  *((_OWORD *)v3 + 6) = v5;
  v6 = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v3 + 1) = *(_OWORD *)(a1 + 16);
  *((_OWORD *)v3 + 2) = v6;
  *((_QWORD *)v3 + 14) = *(_QWORD *)(a1 + 112);
  *(_OWORD *)(v3 + 120) = *(_OWORD *)(a1 + 120);
  *((_DWORD *)v3 + 38) = *(_DWORD *)(a1 + 152);
  v7 = *(_QWORD *)(a1 + 144);
  *((_QWORD *)v3 + 17) = *(_QWORD *)(a1 + 136);
  *((_QWORD *)v3 + 18) = v7;
  *(_QWORD *)(v3 + 156) = *(_QWORD *)(a1 + 156);
  *(_OWORD *)(v3 + 184) = *(_OWORD *)(a1 + 184);
  *(_OWORD *)(v3 + 168) = *(_OWORD *)(a1 + 168);
  *((_QWORD *)v3 + 25) = v3 + 232;
  *((_QWORD *)v3 + 26) = v3 + 232;
  *((_QWORD *)v3 + 27) = v3 + 232;
  *((_QWORD *)v3 + 28) = 6;
  geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>((uint64_t)(v3 + 200), *(__int128 **)(a1 + 200), *(__int128 **)(a1 + 208));
  *((_QWORD *)v3 + 245) = *(_QWORD *)(a1 + 1960);
  *(_QWORD *)(v3 + 1965) = *(_QWORD *)(a1 + 1965);
  *((_QWORD *)v3 + 249) = *(_QWORD *)(a1 + 1992);
  *(_OWORD *)(v3 + 1976) = *(_OWORD *)(a1 + 1976);
  *((_OWORD *)v3 + 125) = *(_OWORD *)(a1 + 2000);
  *((_QWORD *)v3 + 252) = *(_QWORD *)(a1 + 2016);
  *((_QWORD *)v3 + 253) = *(_QWORD *)(a1 + 2024);
  *((_QWORD *)v3 + 254) = *(_QWORD *)(a1 + 2032);
  return v3;
}

- (double)tapAtPoint:
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  double result;

  *(_QWORD *)a2 = &off_1E42C78F8;
  objc_copyWeak((id *)(a2 + 8), (id *)(a1 + 8));
  v4 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = v4;
  v5 = *(_OWORD *)(a1 + 48);
  v6 = *(_OWORD *)(a1 + 64);
  v7 = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a2 + 80) = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 96) = v7;
  *(_OWORD *)(a2 + 48) = v5;
  *(_OWORD *)(a2 + 64) = v6;
  *(_QWORD *)(a2 + 112) = *(_QWORD *)(a1 + 112);
  v8 = *(_OWORD *)(a1 + 120);
  *(_QWORD *)(a2 + 136) = *(_QWORD *)(a1 + 136);
  *(_OWORD *)(a2 + 120) = v8;
  v9 = *(_QWORD *)(a1 + 144);
  *(_DWORD *)(a2 + 152) = *(_DWORD *)(a1 + 152);
  *(_QWORD *)(a2 + 144) = v9;
  *(_QWORD *)(a2 + 156) = *(_QWORD *)(a1 + 156);
  v10 = *(_OWORD *)(a1 + 168);
  v11 = *(_OWORD *)(a1 + 184);
  *(_QWORD *)(a2 + 200) = a2 + 232;
  *(_OWORD *)(a2 + 168) = v10;
  *(_OWORD *)(a2 + 184) = v11;
  *(_QWORD *)(a2 + 208) = a2 + 232;
  *(_QWORD *)(a2 + 216) = a2 + 232;
  *(_QWORD *)(a2 + 224) = 6;
  geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>(a2 + 200, *(__int128 **)(a1 + 200), *(__int128 **)(a1 + 208));
  v12 = *(_QWORD *)(a1 + 1960);
  *(_QWORD *)(a2 + 1965) = *(_QWORD *)(a1 + 1965);
  *(_QWORD *)(a2 + 1960) = v12;
  v13 = *(_OWORD *)(a1 + 1976);
  *(_QWORD *)(a2 + 1992) = *(_QWORD *)(a1 + 1992);
  *(_OWORD *)(a2 + 1976) = v13;
  v14 = *(_OWORD *)(a1 + 2000);
  *(_QWORD *)(a2 + 2016) = *(_QWORD *)(a1 + 2016);
  *(_OWORD *)(a2 + 2000) = v14;
  result = *(double *)(a1 + 2024);
  *(double *)(a2 + 2024) = result;
  *(_QWORD *)(a2 + 2032) = *(_QWORD *)(a1 + 2032);
  return result;
}

void __70__VKMuninCameraController_moveAlongPath_tap_preloadedViews_continued___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "pathAnimationComplete:", *(_QWORD *)(a1 + 2056));

}

- (uint64_t)runBumpAnimation:targetPoint:completionHandler:
{
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

- (void)runBumpAnimation:targetPoint:completionHandler:
{
  double *WeakRetained;
  long double v4;
  long double v5;
  long double v6;
  double v7;
  double v8;
  long double v9;
  __double2 v10;
  double v11;
  __double2 v12;
  void *v13;
  double *v14;

  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    v4 = *a2;
    v5 = a2[1];
    v6 = a2[2];
    v7 = sqrt(v4 * v4 + v5 * v5);
    v14 = WeakRetained;
    v8 = atan2(v6, v7 * 0.996647189);
    v9 = atan2(v5, v4);
    v10 = __sincos_stret(v8);
    v11 = atan2(v6 + v10.__sinval * v10.__sinval * 42841.3115 * v10.__sinval, v7 + v10.__cosval * v10.__cosval * -42697.6727 * v10.__cosval);
    v12 = __sincos_stret(v11);
    v14[557] = v11;
    v14[558] = v9;
    v14[559] = v7 / v12.__cosval + -6378137.0 / sqrt(v12.__sinval * v12.__sinval * -0.00669437999 + 1.0);
    objc_msgSend(v14, "cameraDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mapLayerDidChangeVisibleRegion");

    WeakRetained = v14;
  }

}

- (id)runBumpAnimation:targetPoint:completionHandler:
{
  id *v1;
  id *v2;

  v1 = (id *)(a1 + 8);
  v2 = (id *)operator new(0x10uLL);
  *v2 = &off_1E42C7E50;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

- (id)animatePath:(id *)location animator:preloadedRequiredViews:prePruneData:completionHandler:
{
  char *v2;
  char *v3;
  id v4;
  char *v5;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;

  v2 = (char *)location[1];
  if (v2)
  {
    v3 = (char *)location[2];
    v4 = location[1];
    if (v3 != v2)
    {
      do
      {
        v5 = v3 - 1864;
        v6 = (_QWORD *)*((_QWORD *)v3 - 222);
        v7 = (_QWORD *)*((_QWORD *)v3 - 221);
        if (v6 != v7)
        {
          do
          {
            v8 = (void *)v6[31];
            if (v8 != (void *)v6[33])
              free(v8);
            v6 += 36;
          }
          while (v6 != v7);
          v6 = (_QWORD *)*((_QWORD *)v3 - 222);
        }
        if (v6 != *((_QWORD **)v3 - 220))
          free(v6);
        v3 -= 1864;
      }
      while (v5 != v2);
      v4 = location[1];
    }
    location[2] = v2;
    operator delete(v4);
  }
  objc_destroyWeak(location);
  return location;
}

- (void)animatePath:animator:preloadedRequiredViews:prePruneData:completionHandler:
{
  uint64_t v8;
  int v9;
  int v10;
  char *WeakRetained;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  _QWORD *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _BYTE *v22;
  char *v23;
  char *v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  _OWORD *v29;
  char *v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  int64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  int64_t v38;
  char *v39;
  char *v40;
  _QWORD *v41;
  _QWORD *v42;
  __int128 v43;
  double *v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _BYTE v53[128];
  char v54;
  void *v55;
  _QWORD *v56;
  char v57;
  void *__p;
  void *v59;
  char *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  int v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v8 = *a4;
  v9 = *a5;
  v10 = *a6;
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 8));
  if (!WeakRetained)
    goto LABEL_59;
  gdc::CameraFrame<geo::Radians,double>::fromRigidTransformEcefNoOffset((uint64_t)&v49, a3);
  v12 = v50;
  *(_OWORD *)(WeakRetained + 4456) = v49;
  *((_QWORD *)WeakRetained + 559) = v12;
  *((_QWORD *)WeakRetained + 554) = v51;
  v48 = v52;
  objc_msgSend(WeakRetained, "_setHeading:", &v48);
  objc_msgSend(WeakRetained, "cameraDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mapLayerDidChangeVisibleRegion");

  v15 = *(_QWORD **)(a1 + 16);
  v14 = *(_QWORD **)(a1 + 24);
  if (v14 == v15)
  {
    v16 = 0;
    v36 = 0;
    v35 = 0;
    v33 = *((_QWORD *)WeakRetained + 17);
    goto LABEL_41;
  }
  if ((unint64_t)(0x63FB9AEB1FDCD759 * (v14 - v15)) >> 61)
    abort();
  v46 = v8;
  v16 = (char *)operator new(0x1FDCD758FEE6BAC8 * (v14 - v15));
  v44 = a3;
  v17 = v16;
  v18 = &v16[0x1FDCD758FEE6BAC8 * (v14 - v15)];
  do
  {
    if (v17 < v18)
    {
      *(_QWORD *)v17 = *v15;
      v17 += 8;
      goto LABEL_6;
    }
    v19 = (v17 - v16) >> 3;
    v20 = v19 + 1;
    if ((unint64_t)(v19 + 1) >> 61)
      abort();
    if ((v18 - v16) >> 2 > v20)
      v20 = (v18 - v16) >> 2;
    if ((unint64_t)(v18 - v16) >= 0x7FFFFFFFFFFFFFF8)
      v21 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v21 = v20;
    if (v21)
    {
      if (v21 >> 61)
        std::__throw_bad_array_new_length[abi:nn180100]();
      v22 = operator new(8 * v21);
    }
    else
    {
      v22 = 0;
    }
    v23 = &v22[8 * v19];
    *(_QWORD *)v23 = *v15;
    v24 = v23 + 8;
    if (v17 != v16)
    {
      v25 = v17 - 8 - v16;
      if (v25 >= 0x168)
      {
        if (&v22[v17 - v16 - 8 - (v25 & 0xFFFFFFFFFFFFFFF8)] > &v22[v17 - v16 - 8])
        {
          v26 = v17;
        }
        else if (&v17[-(v25 & 0xFFFFFFFFFFFFFFF8) - 8] > v17 - 8)
        {
          v26 = v17;
        }
        else if ((unint64_t)(v16 - v22) >= 0x20)
        {
          v28 = (v25 >> 3) + 1;
          v26 = &v17[-8 * (v28 & 0x3FFFFFFFFFFFFFFCLL)];
          v29 = &v22[8 * v19 - 16];
          v30 = v17 - 16;
          v31 = v28 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v32 = *(_OWORD *)v30;
            *(v29 - 1) = *((_OWORD *)v30 - 1);
            *v29 = v32;
            v29 -= 2;
            v30 -= 32;
            v31 -= 4;
          }
          while (v31);
          v23 -= 8 * (v28 & 0x3FFFFFFFFFFFFFFCLL);
          if (v28 == (v28 & 0x3FFFFFFFFFFFFFFCLL))
            goto LABEL_22;
        }
        else
        {
          v26 = v17;
        }
      }
      else
      {
        v26 = v17;
      }
      do
      {
        v27 = *((_QWORD *)v26 - 1);
        v26 -= 8;
        *((_QWORD *)v23 - 1) = v27;
        v23 -= 8;
      }
      while (v26 != v16);
    }
LABEL_22:
    v18 = &v22[8 * v21];
    if (v16)
      operator delete(v16);
    v16 = v23;
    v17 = v24;
LABEL_6:
    v15 += 233;
  }
  while (v15 != v14);
  v33 = *((_QWORD *)WeakRetained + 17);
  v34 = v17 - v16;
  if (v17 == v16)
  {
    v36 = 0;
    v35 = 0;
    v8 = v46;
  }
  else
  {
    v8 = v46;
    if (v34 < 0)
      abort();
    v35 = (char *)operator new(v34);
    v36 = &v35[8 * (v34 >> 3)];
    memcpy(v35, v16, v34);
  }
  a3 = v44;
LABEL_41:
  v45 = *((_OWORD *)a3 + 1);
  v47 = *(_OWORD *)a3;
  v43 = *((_OWORD *)a3 + 2);
  v37 = *((_QWORD *)a3 + 6);
  v53[8] = 0;
  v54 = 0;
  v57 = 0;
  v53[0] = 3;
  v38 = v36 - v35;
  if (v36 == v35)
  {
    v40 = 0;
    v39 = 0;
  }
  else
  {
    if (v38 < 0)
      abort();
    v39 = (char *)operator new(v36 - v35);
    v40 = &v39[8 * (v38 >> 3)];
    memcpy(v39, v35, v38);
  }
  v65 = v8;
  v66 = v9;
  v67 = v10;
  __p = v39;
  v59 = v40;
  v60 = v40;
  v61 = v47;
  v62 = v45;
  v63 = v43;
  v64 = v37;
  v57 = 1;
  md::MuninSceneLogic::addSceneEvent(v33, (uint64_t)v53);
  if (v57)
  {
    if (__p)
    {
      v59 = __p;
      operator delete(__p);
    }
    v57 = 0;
  }
  if (v54)
  {
    v41 = v55;
    if (v55)
    {
      v42 = v56;
      if (v56 != v55)
      {
        do
        {
          v42 -= 249;
          std::__destroy_at[abi:nn180100]<md::mun::PointView,0>(v42);
        }
        while (v42 != v41);
        v41 = v55;
      }
      operator delete(v41);
    }
  }
  if (v35)
    operator delete(v35);
  if (v16)
    operator delete(v16);
LABEL_59:

}

- (uint64_t)animatePath:animator:preloadedRequiredViews:prePruneData:completionHandler:
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;

  *(_QWORD *)a1 = &off_1E42C7160;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 24);
    v4 = *(void **)(a1 + 16);
    if (v3 != v2)
    {
      do
      {
        v5 = v3 - 1864;
        v6 = *(_QWORD **)(v3 - 1776);
        v7 = *(_QWORD **)(v3 - 1768);
        if (v6 != v7)
        {
          do
          {
            v8 = (void *)v6[31];
            if (v8 != (void *)v6[33])
              free(v8);
            v6 += 36;
          }
          while (v6 != v7);
          v6 = *(_QWORD **)(v3 - 1776);
        }
        if (v6 != *(_QWORD **)(v3 - 1760))
          free(v6);
        v3 -= 1864;
      }
      while (v5 != v2);
      v4 = *(void **)(a1 + 16);
    }
    *(_QWORD *)(a1 + 24) = v2;
    operator delete(v4);
  }
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

- (id)animatePath:animator:preloadedRequiredViews:prePruneData:completionHandler:
{
  id *v2;
  id *v3;

  v2 = (id *)(a1 + 8);
  v3 = (id *)operator new(0x28uLL);
  *v3 = &off_1E42C7160;
  objc_copyWeak(v3 + 1, v2);
  std::vector<md::mun::CollectionPoint>::vector(v3 + 2, (uint64_t *)(a1 + 16));
  return v3;
}

- (_QWORD)animatePath:animator:preloadedRequiredViews:prePruneData:completionHandler:
{
  *(_QWORD *)a2 = &off_1E42C7160;
  objc_copyWeak((id *)(a2 + 8), (id *)(a1 + 8));
  return std::vector<md::mun::CollectionPoint>::vector((_QWORD *)(a2 + 16), (uint64_t *)(a1 + 16));
}

- (uint64_t)moveToPoint:(uint64_t)a1 withHeading:withPitch:animated:completionHandler:
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 96);
  v3 = *(_QWORD **)(a1 + 104);
  if (v2 != v3)
  {
    do
    {
      v4 = (void *)v2[31];
      if (v4 != (void *)v2[33])
        free(v4);
      v2 += 36;
    }
    while (v2 != v3);
    v2 = *(_QWORD **)(a1 + 96);
  }
  if (v2 != *(_QWORD **)(a1 + 112))
    free(v2);
  objc_destroyWeak((id *)a1);
  return a1;
}

- (uint64_t)moveToPoint:withHeading:withPitch:animated:completionHandler:
{
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  objc_copyWeak((id *)a1, (id *)a2);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v4 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v5;
  *(_QWORD *)(a1 + 52) = *(_QWORD *)(a2 + 52);
  v6 = *(_OWORD *)(a2 + 64);
  v7 = *(_OWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 96) = a1 + 128;
  *(_OWORD *)(a1 + 64) = v6;
  *(_OWORD *)(a1 + 80) = v7;
  *(_QWORD *)(a1 + 104) = a1 + 128;
  *(_QWORD *)(a1 + 112) = a1 + 128;
  *(_QWORD *)(a1 + 120) = 6;
  geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>(a1 + 96, *(__int128 **)(a2 + 96), *(__int128 **)(a2 + 104));
  v8 = *(_QWORD *)(a2 + 1856);
  *(_QWORD *)(a1 + 1861) = *(_QWORD *)(a2 + 1861);
  *(_QWORD *)(a1 + 1856) = v8;
  *(_QWORD *)(a1 + 1872) = *(_QWORD *)(a2 + 1872);
  *(_QWORD *)(a1 + 1880) = *(_QWORD *)(a2 + 1880);
  *(_QWORD *)(a1 + 1888) = *(_QWORD *)(a2 + 1888);
  *(_QWORD *)(a1 + 1896) = *(_QWORD *)(a2 + 1896);
  *(_QWORD *)(a1 + 1904) = *(_QWORD *)(a2 + 1904);
  *(_QWORD *)(a1 + 1912) = *(_QWORD *)(a2 + 1912);
  *(_QWORD *)(a1 + 1920) = *(_QWORD *)(a2 + 1920);
  *(_QWORD *)(a1 + 1928) = MEMORY[0x1A1AF5730](*(_QWORD *)(a2 + 1928));
  return a1;
}

- (void)moveToPoint:withHeading:withPitch:animated:completionHandler:
{
  id *v2;
  md::MuninSceneLogic **WeakRetained;
  md::MuninSceneLogic **v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  _OWORD v17[3];
  uint64_t v18;
  uint64_t block;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24[11];
  char v25;
  void *v26;
  _QWORD *v27;
  char v28;
  void *__p;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 8);
  WeakRetained = (md::MuninSceneLogic **)objc_loadWeakRetained((id *)(a1 + 8));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    md::MuninSceneLogic::cancelAllViewPreloads(WeakRetained[17]);
    v5 = *((_QWORD *)v4[17] + 65);
    *(_DWORD *)v5 = 3;
    *(_QWORD *)(v5 + 12) = 0;
    *(_QWORD *)(v5 + 4) = 0;
    if (*(_QWORD *)(v5 + 88))
    {
      v6 = *(_QWORD **)(v5 + 80);
      if (v6)
      {
        do
        {
          v7 = (_QWORD *)*v6;
          operator delete(v6);
          v6 = v7;
        }
        while (v7);
      }
      *(_QWORD *)(v5 + 80) = 0;
      v8 = *(_QWORD *)(v5 + 72);
      if (v8)
      {
        for (i = 0; i != v8; ++i)
          *(_QWORD *)(*(_QWORD *)(v5 + 64) + 8 * i) = 0;
      }
      *(_QWORD *)(v5 + 88) = 0;
    }
    *(_OWORD *)(v5 + 48) = 0u;
    *(_OWORD *)(v5 + 36) = 0u;
    *(_OWORD *)(v5 + 20) = 0u;
    objc_msgSend(v4, "setCurrentPoint:", a1 + 16);
    v10 = *(_OWORD *)(a1 + 1896);
    v17[0] = *(_OWORD *)(a1 + 1880);
    v17[1] = v10;
    v17[2] = *(_OWORD *)(a1 + 1912);
    v18 = *(_QWORD *)(a1 + 1928);
    objc_msgSend(v4, "setCameraFrame:", v17);
    v11 = (uint64_t)v4[17];
    LOBYTE(v20) = 0;
    v25 = 0;
    v28 = 0;
    LOBYTE(block) = 5;
    md::MuninSceneLogic::addSceneEvent(v11, (uint64_t)&block);
    if (v28)
    {
      if (__p)
      {
        v30 = __p;
        operator delete(__p);
      }
      v28 = 0;
    }
    if (v25)
    {
      v12 = v26;
      if (v26)
      {
        v13 = v27;
        if (v27 != v26)
        {
          do
          {
            v13 -= 249;
            std::__destroy_at[abi:nn180100]<md::mun::PointView,0>(v13);
          }
          while (v13 != v12);
          v12 = v26;
        }
        operator delete(v12);
      }
    }
    v14 = *(void **)v4[19];
    block = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = ___ZZZ88__VKMuninCameraController_moveToPoint_withHeading_withPitch_animated_completionHandler__EN3__3clEN3gdc23RequestCompletionStatusEONSt3__113unordered_mapINS0_19LayerDataRequestKeyENS2_10shared_ptrINS0_9LayerDataEEENS0_23LayerDataRequestKeyHashENS2_8equal_toIS4_EENS2_9allocatorINS2_4pairIKS4_S7_EEEEEEENKUlvE_clEv_block_invoke;
    v22 = &unk_1E42F1090;
    v23 = *(id *)(a1 + 1936);
    v15 = v14;
    objc_copyWeak(v24, v2);
    dispatch_async(v15, &block);

    objc_destroyWeak(v24);
  }
  else
  {
    v16 = *(_QWORD *)(a1 + 1936);
    if (v16)
      (*(void (**)(uint64_t, _QWORD))(v16 + 16))(v16, 0);
  }

}

- (_QWORD)moveToPoint:withHeading:withPitch:animated:completionHandler:
{
  uint64_t v1;
  _QWORD *v2;

  v1 = a1 + 8;
  v2 = operator new(0x798uLL);
  *v2 = &off_1E42D9560;
  std::__compressed_pair_elem<-[VKMuninCameraController moveToPoint:withHeading:withPitch:animated:completionHandler:]::$_3::operator()(gdc::RequestCompletionStatus,std::unordered_map<gdc::LayerDataRequestKey,std::shared_ptr<gdc::LayerData>,gdc::LayerDataRequestKeyHash,std::equal_to<gdc::LayerDataRequestKey>,std::allocator<std::pair<gdc::LayerDataRequestKey const,std::shared_ptr<gdc::LayerData>>>> &&)::{lambda(void)#1},0,false>::__compressed_pair_elem[abi:nn180100]<std::unordered_map<gdc::LayerDataRequestKey,std::shared_ptr<gdc::LayerData>,gdc::LayerDataRequestKeyHash,std::equal_to<gdc::LayerDataRequestKey>,std::allocator<std::pair<gdc::LayerDataRequestKey const,std::shared_ptr<gdc::LayerData>>>> && const&,0ul>((uint64_t)(v2 + 1), v1);
  return v2;
}

- (uint64_t)moveToPoint:(uint64_t)a1 withHeading:(uint64_t)a2 withPitch:animated:completionHandler:
{
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  objc_copyWeak((id *)a1, (id *)a2);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v4 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v5;
  *(_QWORD *)(a1 + 52) = *(_QWORD *)(a2 + 52);
  v6 = *(_OWORD *)(a2 + 64);
  v7 = *(_OWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 96) = a1 + 128;
  *(_OWORD *)(a1 + 64) = v6;
  *(_OWORD *)(a1 + 80) = v7;
  *(_QWORD *)(a1 + 104) = a1 + 128;
  *(_QWORD *)(a1 + 112) = a1 + 128;
  *(_QWORD *)(a1 + 120) = 6;
  geo::small_vector_base<md::mun::PhotoInfo>::append<md::mun::PhotoInfo const*>(a1 + 96, *(__int128 **)(a2 + 96), *(__int128 **)(a2 + 104));
  v8 = *(_QWORD *)(a2 + 1856);
  *(_QWORD *)(a1 + 1861) = *(_QWORD *)(a2 + 1861);
  *(_QWORD *)(a1 + 1856) = v8;
  *(_QWORD *)(a1 + 1872) = *(_QWORD *)(a2 + 1872);
  *(_QWORD *)(a1 + 1880) = *(_QWORD *)(a2 + 1880);
  *(_QWORD *)(a1 + 1888) = *(_QWORD *)(a2 + 1888);
  *(_QWORD *)(a1 + 1896) = *(_QWORD *)(a2 + 1896);
  *(_QWORD *)(a1 + 1904) = *(_QWORD *)(a2 + 1904);
  *(_QWORD *)(a1 + 1912) = *(_QWORD *)(a2 + 1912);
  *(_QWORD *)(a1 + 1920) = *(_QWORD *)(a2 + 1920);
  *(_QWORD *)(a1 + 1928) = MEMORY[0x1A1AF5730](*(_QWORD *)(a2 + 1928));
  return a1;
}

void __56__VKMuninCameraController_selectLabelMarker_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "pathAnimationComplete:", 0);

}

void __56__VKMuninCameraController_selectLabelMarker_completion___block_invoke_3(uint64_t a1, float a2)
{
  long double *WeakRetained;
  double v5;
  long double v6;
  long double v7;
  long double v8;
  double v9;
  long double v10;
  long double v11;
  long double v12;
  void *v13;
  double v14;

  WeakRetained = (long double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = *(double *)(a1 + 40);
    v6 = fmod(3.14159265 - v5 + *(double *)(a1 + 48), 6.28318531);
    v7 = fmod(v6 + 6.28318531, 6.28318531);
    v8 = fmod(v5 + 3.14159265 + (v7 + -3.14159265) * a2, 6.28318531);
    WeakRetained[554] = fmod(v8 + 6.28318531, 6.28318531) + -3.14159265;
    v9 = *(double *)(a1 + 56);
    v10 = fmod(3.14159265 - v9 + *(double *)(a1 + 64), 6.28318531);
    v11 = fmod(v10 + 6.28318531, 6.28318531);
    v12 = fmod(v9 + 3.14159265 + (v11 + -3.14159265) * a2, 6.28318531);
    v14 = fmod(v12 + 6.28318531, 6.28318531) + -3.14159265;
    objc_msgSend(WeakRetained, "_setHeading:", &v14);
    objc_msgSend(WeakRetained, "cameraDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mapLayerDidChangeVisibleRegion");

  }
}

void __56__VKMuninCameraController_selectLabelMarker_completion___block_invoke_22(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 40);
  v3 = **(void ***)(*(_QWORD *)(a1 + 32) + 152);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = __56__VKMuninCameraController_selectLabelMarker_completion___block_invoke_2_23;
  v5[3] = &unk_1E42F1090;
  v5[1] = 3221225472;
  v6 = v2;
  v4 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  dispatch_async(v4, v5);

  objc_destroyWeak(&v7);
}

void __56__VKMuninCameraController_selectLabelMarker_completion___block_invoke_2_23(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "endRegionChange");

}

- (void)selectLabelMarker:completion:
{
  JUMPOUT(0x1A1AF4E00);
}

- (_QWORD)selectLabelMarker:completion:
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E42C7D30;
  result[1] = v3;
  return result;
}

- (uint64_t)selectLabelMarker:completion:
{
  uint64_t v1;
  unsigned __int8 v2;

  v1 = *(_QWORD *)(a1 + 8);
  if (!v1)
    return 1;
  v2 = atomic_load((unsigned __int8 *)(v1 + 960));
  return v2 & 1;
}

- (void)updateCurrentPointView:
{
  uint64_t v4;
  uint64_t v5;
  void **v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  char v14;
  char v15;
  unint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  char *v24;
  char *v25;
  uint64_t v26;
  int v27;
  void **v28;

  v4 = a2[240];
  v5 = a2[239];
  if (v4 != v5 && a2[11] != a2[12])
  {
    v7 = a4;
    v8 = 0;
    do
    {
      v10 = a2[11];
      v11 = a2[12];
      if (v10 != v11)
      {
        v12 = *(unsigned __int8 *)(v5 + 8 * v8);
        while (*(unsigned __int8 *)(v10 + 240) != v12)
        {
          v10 += 288;
          if (v10 == v11)
            goto LABEL_6;
        }
        if (**a1 || md::mun::isPhotoVisible(a3, v10))
        {
          v13 = *a2;
          v14 = *(_BYTE *)(v5 + 8 * v8 + 1);
          v15 = *((_BYTE *)a2 + 1859);
          v17 = (char *)v7[1];
          v16 = (unint64_t)v7[2];
          if ((unint64_t)v17 < v16)
          {
            *(_QWORD *)v17 = v13;
            v17[8] = v12;
            v17[9] = v14;
            v9 = v17 + 16;
            v17[10] = v15;
          }
          else
          {
            v18 = (char *)*v7;
            v19 = (v17 - (_BYTE *)*v7) >> 4;
            v20 = v19 + 1;
            if ((unint64_t)(v19 + 1) >> 60)
              abort();
            v21 = v16 - (_QWORD)v18;
            if (v21 >> 3 > v20)
              v20 = v21 >> 3;
            if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF0)
              v22 = 0xFFFFFFFFFFFFFFFLL;
            else
              v22 = v20;
            if (v22)
            {
              if (v22 >> 60)
                std::__throw_bad_array_new_length[abi:nn180100]();
              v23 = (char *)operator new(16 * v22);
            }
            else
            {
              v23 = 0;
            }
            v24 = &v23[16 * v19];
            *(_QWORD *)v24 = v13;
            v24[8] = v12;
            v24[9] = v14;
            v24[10] = v15;
            v25 = v24;
            if (v17 == v18)
            {
              v28 = a4;
            }
            else
            {
              do
              {
                v26 = *((_QWORD *)v17 - 2);
                v17 -= 16;
                v27 = *(_DWORD *)(v17 + 7);
                *((_QWORD *)v25 - 2) = v26;
                v25 -= 16;
                *(_DWORD *)(v25 + 7) = v27;
              }
              while (v17 != v18);
              v28 = a4;
              v17 = (char *)*a4;
            }
            v9 = v24 + 16;
            *v28 = v25;
            v28[1] = v24 + 16;
            v28[2] = &v23[16 * v22];
            v7 = v28;
            if (v17)
              operator delete(v17);
          }
          v7[1] = v9;
          v4 = a2[240];
          v5 = a2[239];
        }
      }
LABEL_6:
      ++v8;
    }
    while (v8 < (v4 - v5) >> 3);
  }
}

void __113__VKMuninCameraController_setCenterCoordinate_altitude_yaw_pitch_duration_animationStyle_timingCurve_completion___block_invoke(uint64_t a1, float a2)
{
  long double *WeakRetained;
  double v5;
  double v6;
  long double v7;
  long double v8;
  long double v9;
  double v10;
  long double v11;
  long double v12;
  long double v13;
  long double v14;
  long double v15;
  long double v16;
  double v17;
  double v18;
  long double v19;
  __double2 v20;
  double v21;
  __double2 v22;
  void *v23;
  double v24;

  WeakRetained = (long double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = *(double *)(a1 + 40);
    v6 = a2;
    v7 = fmod(3.14159265 - v5 + *(double *)(a1 + 48), 6.28318531);
    v8 = fmod(v7 + 6.28318531, 6.28318531);
    v9 = fmod(v5 + 3.14159265 + (v8 + -3.14159265) * a2, 6.28318531);
    WeakRetained[554] = fmod(v9 + 6.28318531, 6.28318531) + -3.14159265;
    v10 = *(double *)(a1 + 56);
    v11 = fmod(3.14159265 - v10 + *(double *)(a1 + 64), 6.28318531);
    v12 = fmod(v11 + 6.28318531, 6.28318531);
    v13 = fmod(v10 + 3.14159265 + (v12 + -3.14159265) * a2, 6.28318531);
    v24 = fmod(v13 + 6.28318531, 6.28318531) + -3.14159265;
    objc_msgSend(WeakRetained, "_setHeading:", &v24);
    v14 = *(double *)(a1 + 72) + (*(double *)(a1 + 96) - *(double *)(a1 + 72)) * a2;
    v15 = *(double *)(a1 + 80) + (*(double *)(a1 + 104) - *(double *)(a1 + 80)) * v6;
    v16 = *(double *)(a1 + 88) + (*(double *)(a1 + 112) - *(double *)(a1 + 88)) * v6;
    v17 = sqrt(v14 * v14 + v15 * v15);
    v18 = atan2(v16, v17 * 0.996647189);
    v19 = atan2(v15, v14);
    v20 = __sincos_stret(v18);
    v21 = atan2(v16 + v20.__sinval * v20.__sinval * 42841.3115 * v20.__sinval, v17 + v20.__cosval * v20.__cosval * -42697.6727 * v20.__cosval);
    v22 = __sincos_stret(v21);
    WeakRetained[557] = v21;
    WeakRetained[558] = v19;
    WeakRetained[559] = v17 / v22.__cosval + -6378137.0 / sqrt(v22.__sinval * v22.__sinval * -0.00669437999 + 1.0);
    objc_msgSend(WeakRetained, "cameraDelegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "mapLayerDidChangeVisibleRegion");

  }
}

void __113__VKMuninCameraController_setCenterCoordinate_altitude_yaw_pitch_duration_animationStyle_timingCurve_completion___block_invoke_20(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 40);
  v3 = **(void ***)(*(_QWORD *)(a1 + 32) + 152);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = __113__VKMuninCameraController_setCenterCoordinate_altitude_yaw_pitch_duration_animationStyle_timingCurve_completion___block_invoke_2;
  v5[3] = &unk_1E42F1090;
  v5[1] = 3221225472;
  v6 = v2;
  v4 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  dispatch_async(v4, v5);

  objc_destroyWeak(&v7);
}

void __113__VKMuninCameraController_setCenterCoordinate_altitude_yaw_pitch_duration_animationStyle_timingCurve_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "endRegionChange");

}

uint64_t __59__VKMuninCameraController_updateWithTimestamp_withContext___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 4440) = 1;
  return result;
}

@end
