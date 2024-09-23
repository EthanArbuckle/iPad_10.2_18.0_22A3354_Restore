@implementation CLHarvesterService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)objc_msgSend(a3, "count"))
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

+ (id)getSilo
{
  if (qword_1023015B0 != -1)
    dispatch_once(&qword_1023015B0, &stru_10213F418);
  return (id)qword_1023015A8;
}

+ (BOOL)isSupported
{
  if (qword_1023015C0 != -1)
    dispatch_once(&qword_1023015C0, &stru_10213F438);
  return byte_1023015B8;
}

- (CLHarvesterService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLHarvesterService;
  return -[CLHarvesterService initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLHarvesterProtocol, &OBJC_PROTOCOL___CLHarvesterClientProtocol);
}

- (void)constructController
{
  std::__shared_weak_count *v3;
  unint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  id v9;
  __int128 v10;
  id v11;
  __int128 v12;

  v11 = -[CLHarvesterService universe](self, "universe");
  v9 = -[CLHarvesterService universe](self, "universe");
  sub_1004F1F64(&v9, &v10);
  sub_1004F2064((uint64_t *)&v11, &v10, &v12);
  sub_1002B7674((uint64_t)&self->_harvestController, &v12);
  v3 = (std::__shared_weak_count *)*((_QWORD *)&v12 + 1);
  if (*((_QWORD *)&v12 + 1))
  {
    v4 = (unint64_t *)(*((_QWORD *)&v12 + 1) + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  v6 = (std::__shared_weak_count *)*((_QWORD *)&v10 + 1);
  if (*((_QWORD *)&v10 + 1))
  {
    v7 = (unint64_t *)(*((_QWORD *)&v10 + 1) + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

- (void)constructMonitors
{
  uint64_t *p_harvestController;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  id v13;
  __int128 v14;
  id v15;
  uint8_t buf[1640];

  p_harvestController = (uint64_t *)&self->_harvestController;
  if (self->_harvestController.__ptr_)
  {
    v15 = -[CLHarvesterService universe](self, "universe");
    v13 = -[CLHarvesterService universe](self, "universe");
    sub_1004F2208(&v13, &v14);
    sub_1004F2308((uint64_t *)&v15, &v14, p_harvestController, p_harvestController, buf);
    sub_1002B7674((uint64_t)&self->_monitorGps, (__int128 *)buf);
    v4 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v5 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    v7 = (std::__shared_weak_count *)*((_QWORD *)&v14 + 1);
    if (*((_QWORD *)&v14 + 1))
    {
      v8 = (unint64_t *)(*((_QWORD *)&v14 + 1) + 8);
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }
  else
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_10213F4E0);
    v10 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "Service attempting to construct monitors without controller", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_10213F4E0);
      LOWORD(v14) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0208, 17, "Service attempting to construct monitors without controller", &v14, 2);
      v12 = (uint8_t *)v11;
      sub_100512490("Generic", 1, 0, 0, "-[CLHarvesterService constructMonitors]", "%s\n", v11);
      if (v12 != buf)
        free(v12);
    }
  }
}

- (void)constructPolicies
{
  uint64_t *p_harvestController;
  uint64_t *p_monitorGps;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  id v17;
  __int128 v18;
  id v19;
  __int128 v20;

  p_harvestController = (uint64_t *)&self->_harvestController;
  if (!self->_harvestController.__ptr_)
    sub_1018FCC84();
  p_monitorGps = (uint64_t *)&self->_monitorGps;
  if (!self->_monitorGps.__ptr_)
    sub_1018FCDF8();
  v19 = -[CLHarvesterService universe](self, "universe");
  v17 = -[CLHarvesterService universe](self, "universe");
  sub_1004F25A0(&v17, &v18);
  sub_1004F26A0((uint64_t *)&v19, &v18, p_harvestController, p_harvestController, p_monitorGps, p_harvestController, &v20);
  sub_1002B7674((uint64_t)&self->_policyProactive, &v20);
  v5 = (std::__shared_weak_count *)*((_QWORD *)&v20 + 1);
  if (*((_QWORD *)&v20 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v20 + 1) + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  v8 = (std::__shared_weak_count *)*((_QWORD *)&v18 + 1);
  if (*((_QWORD *)&v18 + 1))
  {
    v9 = (unint64_t *)(*((_QWORD *)&v18 + 1) + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  v19 = -[CLHarvesterService universe](self, "universe");
  sub_1004F2A2C((uint64_t *)&v19, &v18);
  sub_1004F2B2C(&v18, p_harvestController, p_monitorGps, (uint64_t *)&self->_policyProactive, &v20);
  sub_1002B7674((uint64_t)&self->_policyTrip, &v20);
  v11 = (std::__shared_weak_count *)*((_QWORD *)&v20 + 1);
  if (*((_QWORD *)&v20 + 1))
  {
    v12 = (unint64_t *)(*((_QWORD *)&v20 + 1) + 8);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  v14 = (std::__shared_weak_count *)*((_QWORD *)&v18 + 1);
  if (*((_QWORD *)&v18 + 1))
  {
    v15 = (unint64_t *)(*((_QWORD *)&v18 + 1) + 8);
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

- (void)constructSubHarvesters
{
  std::__shared_weak_count *v3;
  unint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  vector<std::shared_ptr<CLSubHarvester>, std::allocator<std::shared_ptr<CLSubHarvester>>> *p_subHarvesters;
  __int128 v8;
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t value;
  _QWORD *end;
  _QWORD *v14;
  NSObject *v15;
  const char *v16;
  __int128 *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  _QWORD *v29;
  _QWORD *begin;
  char *v31;
  __int128 v32;
  void *v33;
  void *v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  vector<std::shared_ptr<CLSubHarvester>, std::allocator<std::shared_ptr<CLSubHarvester>>> *v38;
  __int128 v39;
  uint64_t v40;
  unint64_t *v41;
  unint64_t v42;
  unint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  _QWORD *v53;
  _QWORD *v54;
  char *v55;
  __int128 v56;
  void *v57;
  void *v58;
  std::__shared_weak_count *v59;
  unint64_t *v60;
  unint64_t v61;
  vector<std::shared_ptr<CLSubHarvester>, std::allocator<std::shared_ptr<CLSubHarvester>>> *v62;
  __int128 v63;
  uint64_t v64;
  unint64_t *v65;
  unint64_t v66;
  unint64_t v67;
  _QWORD *v68;
  _QWORD *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  char *v74;
  uint64_t v75;
  char *v76;
  _QWORD *v77;
  _QWORD *v78;
  char *v79;
  __int128 v80;
  void *v81;
  void *v82;
  std::__shared_weak_count *v83;
  unint64_t *v84;
  unint64_t v85;
  vector<std::shared_ptr<CLSubHarvester>, std::allocator<std::shared_ptr<CLSubHarvester>>> *v86;
  __int128 v87;
  uint64_t v88;
  unint64_t *v89;
  unint64_t v90;
  unint64_t v91;
  _QWORD *v92;
  _QWORD *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  char *v98;
  uint64_t v99;
  char *v100;
  _QWORD *v101;
  _QWORD *v102;
  char *v103;
  __int128 v104;
  void *v105;
  void *v106;
  std::__shared_weak_count *v107;
  unint64_t *v108;
  unint64_t v109;
  vector<std::shared_ptr<CLSubHarvester>, std::allocator<std::shared_ptr<CLSubHarvester>>> *v110;
  __int128 v111;
  uint64_t v112;
  unint64_t *v113;
  unint64_t v114;
  unint64_t v115;
  _QWORD *v116;
  _QWORD *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  char *v122;
  uint64_t v123;
  char *v124;
  _QWORD *v125;
  _QWORD *v126;
  char *v127;
  __int128 v128;
  void *v129;
  void *v130;
  std::__shared_weak_count *v131;
  unint64_t *v132;
  unint64_t v133;
  vector<std::shared_ptr<CLSubHarvester>, std::allocator<std::shared_ptr<CLSubHarvester>>> *v134;
  __int128 v135;
  uint64_t v136;
  unint64_t *v137;
  unint64_t v138;
  unint64_t v139;
  _QWORD *v140;
  _QWORD *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  unint64_t v145;
  char *v146;
  uint64_t v147;
  char *v148;
  _QWORD *v149;
  _QWORD *v150;
  char *v151;
  __int128 v152;
  void *v153;
  void *v154;
  std::__shared_weak_count *v155;
  unint64_t *v156;
  unint64_t v157;
  vector<std::shared_ptr<CLSubHarvester>, std::allocator<std::shared_ptr<CLSubHarvester>>> *v158;
  __int128 v159;
  uint64_t v160;
  unint64_t *v161;
  unint64_t v162;
  unint64_t v163;
  _QWORD *v164;
  _QWORD *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  unint64_t v169;
  char *v170;
  uint64_t v171;
  char *v172;
  _QWORD *v173;
  _QWORD *v174;
  char *v175;
  __int128 v176;
  void *v177;
  void *v178;
  std::__shared_weak_count *v179;
  unint64_t *v180;
  unint64_t v181;
  vector<std::shared_ptr<CLSubHarvester>, std::allocator<std::shared_ptr<CLSubHarvester>>> *v182;
  __int128 v183;
  uint64_t v184;
  unint64_t *v185;
  unint64_t v186;
  unint64_t v187;
  _QWORD *v188;
  _QWORD *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  unint64_t v193;
  char *v194;
  uint64_t v195;
  char *v196;
  _QWORD *v197;
  _QWORD *v198;
  char *v199;
  __int128 v200;
  void *v201;
  void *v202;
  std::__shared_weak_count *v203;
  unint64_t *v204;
  unint64_t v205;
  vector<std::shared_ptr<CLSubHarvester>, std::allocator<std::shared_ptr<CLSubHarvester>>> *v206;
  __int128 v207;
  uint64_t v208;
  unint64_t *v209;
  unint64_t v210;
  unint64_t v211;
  _QWORD *v212;
  _QWORD *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  unint64_t v217;
  char *v218;
  uint64_t v219;
  char *v220;
  _QWORD *v221;
  _QWORD *v222;
  char *v223;
  __int128 v224;
  void *v225;
  void *v226;
  std::__shared_weak_count *v227;
  unint64_t *v228;
  unint64_t v229;
  vector<std::shared_ptr<CLSubHarvester>, std::allocator<std::shared_ptr<CLSubHarvester>>> *v230;
  __int128 v231;
  uint64_t v232;
  unint64_t *v233;
  unint64_t v234;
  unint64_t v235;
  _QWORD *v236;
  _QWORD *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  unint64_t v241;
  char *v242;
  uint64_t v243;
  char *v244;
  _QWORD *v245;
  _QWORD *v246;
  char *v247;
  __int128 v248;
  void *v249;
  void *v250;
  std::__shared_weak_count *v251;
  unint64_t *v252;
  unint64_t v253;
  vector<std::shared_ptr<CLSubHarvester>, std::allocator<std::shared_ptr<CLSubHarvester>>> *v254;
  __int128 v255;
  uint64_t v256;
  unint64_t *v257;
  unint64_t v258;
  unint64_t v259;
  _QWORD *v260;
  _QWORD *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  unint64_t v265;
  char *v266;
  uint64_t v267;
  char *v268;
  _QWORD *v269;
  _QWORD *v270;
  char *v271;
  __int128 v272;
  void *v273;
  void *v274;
  std::__shared_weak_count *v275;
  unint64_t *v276;
  unint64_t v277;
  vector<std::shared_ptr<CLSubHarvester>, std::allocator<std::shared_ptr<CLSubHarvester>>> *v278;
  __int128 v279;
  uint64_t v280;
  unint64_t *v281;
  unint64_t v282;
  unint64_t v283;
  _QWORD *v284;
  _QWORD *v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  unint64_t v289;
  char *v290;
  uint64_t v291;
  char *v292;
  _QWORD *v293;
  _QWORD *v294;
  char *v295;
  __int128 v296;
  void *v297;
  void *v298;
  std::__shared_weak_count *v299;
  unint64_t *v300;
  unint64_t v301;
  vector<std::shared_ptr<CLSubHarvester>, std::allocator<std::shared_ptr<CLSubHarvester>>> *v302;
  __int128 v303;
  uint64_t v304;
  unint64_t *v305;
  unint64_t v306;
  unint64_t v307;
  _QWORD *v308;
  _QWORD *v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  unint64_t v313;
  char *v314;
  uint64_t v315;
  char *v316;
  _QWORD *v317;
  _QWORD *v318;
  char *v319;
  __int128 v320;
  void *v321;
  void *v322;
  std::__shared_weak_count *v323;
  unint64_t *v324;
  unint64_t v325;
  std::__shared_weak_count *v326;
  unint64_t *v327;
  unint64_t v328;
  std::__shared_weak_count *v329;
  unint64_t *v330;
  unint64_t v331;
  std::__shared_weak_count *v332;
  unint64_t *v333;
  unint64_t v334;
  std::__shared_weak_count *v335;
  unint64_t *v336;
  unint64_t v337;
  std::__shared_weak_count *v338;
  unint64_t *v339;
  unint64_t v340;
  std::__shared_weak_count *v341;
  unint64_t *v342;
  unint64_t v343;
  std::__shared_weak_count *v344;
  unint64_t *v345;
  unint64_t v346;
  std::__shared_weak_count *v347;
  unint64_t *v348;
  unint64_t v349;
  std::__shared_weak_count *v350;
  unint64_t *v351;
  unint64_t v352;
  std::__shared_weak_count *v353;
  unint64_t *v354;
  unint64_t v355;
  std::__shared_weak_count *v356;
  unint64_t *v357;
  unint64_t v358;
  std::__shared_weak_count *v359;
  unint64_t *v360;
  unint64_t v361;
  __int128 v362;
  __int128 v363;
  __int128 v364;
  __int128 v365;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  __int128 v371;
  __int128 v372;
  __int128 v373;
  __int128 v374;
  __int128 v375;
  id v376;
  __int128 v377;
  __int128 v378;
  __int128 v379;
  __int128 v380;
  __int128 v381;
  __int128 v382;
  __int128 v383;
  __int128 v384;
  __int128 v385;
  __int128 v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  CLHarvesterService *v390;
  __int128 buf;
  _QWORD *v392;
  void *v393;
  __compressed_pair<std::shared_ptr<CLSubHarvester> *, std::allocator<std::shared_ptr<CLSubHarvester>>> *p_end_cap;

  v390 = self;
  if (self->_harvestController.__ptr_)
  {
    if (self->_monitorGps.__ptr_)
    {
      if (self->_policyProactive.__ptr_ && self->_policyTrip.__ptr_)
      {
        *(_QWORD *)&v388 = -[CLHarvesterService universe](self, "universe");
        *(_QWORD *)&v387 = -[CLHarvesterService universe](self, "universe");
        sub_1004F2E18(&v387, &v390, &buf);
        sub_1004F2F24((uint64_t *)&v388, &buf, &v390->_harvestController.__ptr_, &v390->_harvestController.__ptr_, (uint64_t *)&v390->_harvestController, &v390->_networkController, &v390->_requestStore, &v389);
        v3 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
        if (*((_QWORD *)&buf + 1))
        {
          v4 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
          do
            v5 = __ldaxr(v4);
          while (__stlxr(v5 - 1, v4));
          if (!v5)
          {
            ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
            std::__shared_weak_count::__release_weak(v3);
          }
        }
        sub_100C37B20(v389, v390->_mescalSigner);
        p_subHarvesters = &v390->_subHarvesters;
        v8 = v389;
        v388 = v389;
        v9 = *((_QWORD *)&v389 + 1);
        if (*((_QWORD *)&v389 + 1))
        {
          v10 = (unint64_t *)(*((_QWORD *)&v389 + 1) + 8);
          do
            v11 = __ldxr(v10);
          while (__stxr(v11 + 1, v10));
        }
        value = (unint64_t)p_subHarvesters->__end_cap_.__value_;
        end = p_subHarvesters->__end_;
        if ((unint64_t)end >= value)
        {
          v362 = v8;
          v22 = ((char *)end - (char *)p_subHarvesters->__begin_) >> 4;
          if ((unint64_t)(v22 + 1) >> 60)
            sub_100259694();
          v23 = value - (unint64_t)p_subHarvesters->__begin_;
          v24 = v23 >> 3;
          if (v23 >> 3 <= (unint64_t)(v22 + 1))
            v24 = v22 + 1;
          if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF0)
            v25 = 0xFFFFFFFFFFFFFFFLL;
          else
            v25 = v24;
          p_end_cap = &p_subHarvesters->__end_cap_;
          v26 = (char *)sub_10028E224((uint64_t)&p_subHarvesters->__end_cap_, v25);
          v28 = &v26[16 * v22];
          *(_OWORD *)v28 = v362;
          begin = p_subHarvesters->__begin_;
          v29 = p_subHarvesters->__end_;
          if (v29 == p_subHarvesters->__begin_)
          {
            v33 = p_subHarvesters->__end_;
            v31 = &v26[16 * v22];
          }
          else
          {
            v31 = &v26[16 * v22];
            do
            {
              v32 = *((_OWORD *)v29 - 1);
              v29 -= 2;
              *((_OWORD *)v31 - 1) = v32;
              v31 -= 16;
              *v29 = 0;
              v29[1] = 0;
            }
            while (v29 != begin);
            v33 = p_subHarvesters->__begin_;
            v29 = p_subHarvesters->__end_;
          }
          v14 = v28 + 16;
          p_subHarvesters->__begin_ = v31;
          *((_QWORD *)&buf + 1) = v33;
          p_subHarvesters->__end_ = v28 + 16;
          v392 = v29;
          v34 = p_subHarvesters->__end_cap_.__value_;
          p_subHarvesters->__end_cap_.__value_ = &v26[16 * v27];
          v393 = v34;
          *(_QWORD *)&buf = v33;
          sub_100014F20((uint64_t)&buf);
        }
        else
        {
          *end = v8;
          end[1] = v9;
          v14 = end + 2;
        }
        p_subHarvesters->__end_ = v14;
        if (objc_opt_class(SPFinderInterface, v6))
        {
          *(_QWORD *)&v387 = -[CLHarvesterService universe](v390, "universe");
          *(_QWORD *)&v386 = -[CLHarvesterService universe](v390, "universe");
          sub_1004F3270(&v386, &buf);
          sub_1004F3370((uint64_t)&v385, (uint64_t *)&v387, &buf, &v390->_harvestController.__ptr_, &v390->_harvestController.__ptr_, (uint64_t *)&v390->_harvestController, (uint64_t *)&v390->_networkController, (uint64_t *)&v390->_requestStore);
        }
        *(_QWORD *)&v387 = -[CLHarvesterService universe](v390, "universe");
        *(_QWORD *)&v386 = -[CLHarvesterService universe](v390, "universe");
        sub_1004F36C0((uint64_t *)&v386, &buf);
        sub_1004F37C0((uint64_t *)&v387, &buf, &v390->_harvestController.__ptr_, &v390->_harvestController.__ptr_, (uint64_t *)&v390->_harvestController, (uint64_t *)&v390->_monitorGps, (uint64_t *)&v390->_networkController, &v388, (uint64_t *)&v390->_requestStore);
        v35 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
        if (*((_QWORD *)&buf + 1))
        {
          v36 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
          do
            v37 = __ldaxr(v36);
          while (__stlxr(v37 - 1, v36));
          if (!v37)
          {
            ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
            std::__shared_weak_count::__release_weak(v35);
          }
        }
        v38 = &v390->_subHarvesters;
        v39 = v388;
        v387 = v388;
        v40 = *((_QWORD *)&v388 + 1);
        if (*((_QWORD *)&v388 + 1))
        {
          v41 = (unint64_t *)(*((_QWORD *)&v388 + 1) + 8);
          do
            v42 = __ldxr(v41);
          while (__stxr(v42 + 1, v41));
        }
        v43 = (unint64_t)v38->__end_cap_.__value_;
        v44 = v38->__end_;
        if ((unint64_t)v44 >= v43)
        {
          v363 = v39;
          v46 = ((char *)v44 - (char *)v38->__begin_) >> 4;
          if ((unint64_t)(v46 + 1) >> 60)
            sub_100259694();
          v47 = v43 - (unint64_t)v38->__begin_;
          v48 = v47 >> 3;
          if (v47 >> 3 <= (unint64_t)(v46 + 1))
            v48 = v46 + 1;
          if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF0)
            v49 = 0xFFFFFFFFFFFFFFFLL;
          else
            v49 = v48;
          p_end_cap = &v38->__end_cap_;
          v50 = (char *)sub_10028E224((uint64_t)&v38->__end_cap_, v49);
          v52 = &v50[16 * v46];
          *(_OWORD *)v52 = v363;
          v54 = v38->__begin_;
          v53 = v38->__end_;
          if (v53 == v38->__begin_)
          {
            v57 = v38->__end_;
            v55 = &v50[16 * v46];
          }
          else
          {
            v55 = &v50[16 * v46];
            do
            {
              v56 = *((_OWORD *)v53 - 1);
              v53 -= 2;
              *((_OWORD *)v55 - 1) = v56;
              v55 -= 16;
              *v53 = 0;
              v53[1] = 0;
            }
            while (v53 != v54);
            v57 = v38->__begin_;
            v53 = v38->__end_;
          }
          v45 = v52 + 16;
          v38->__begin_ = v55;
          *((_QWORD *)&buf + 1) = v57;
          v38->__end_ = v52 + 16;
          v392 = v53;
          v58 = v38->__end_cap_.__value_;
          v38->__end_cap_.__value_ = &v50[16 * v51];
          v393 = v58;
          *(_QWORD *)&buf = v57;
          sub_100014F20((uint64_t)&buf);
        }
        else
        {
          *v44 = v39;
          v44[1] = v40;
          v45 = v44 + 2;
        }
        v38->__end_ = v45;
        *(_QWORD *)&v386 = -[CLHarvesterService universe](v390, "universe");
        *(_QWORD *)&v385 = -[CLHarvesterService universe](v390, "universe");
        sub_1004F36C0((uint64_t *)&v385, &buf);
        sub_1004F3B88((uint64_t *)&v386, &buf, &v390->_harvestController.__ptr_, &v390->_harvestController.__ptr_, (uint64_t *)&v390->_harvestController, (uint64_t *)&v390->_monitorGps, (uint64_t *)&v390->_networkController, &v387, (uint64_t *)&v390->_requestStore);
        v59 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
        if (*((_QWORD *)&buf + 1))
        {
          v60 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
          do
            v61 = __ldaxr(v60);
          while (__stlxr(v61 - 1, v60));
          if (!v61)
          {
            ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
            std::__shared_weak_count::__release_weak(v59);
          }
        }
        v62 = &v390->_subHarvesters;
        v63 = v387;
        v386 = v387;
        v64 = *((_QWORD *)&v387 + 1);
        if (*((_QWORD *)&v387 + 1))
        {
          v65 = (unint64_t *)(*((_QWORD *)&v387 + 1) + 8);
          do
            v66 = __ldxr(v65);
          while (__stxr(v66 + 1, v65));
        }
        v67 = (unint64_t)v62->__end_cap_.__value_;
        v68 = v62->__end_;
        if ((unint64_t)v68 >= v67)
        {
          v364 = v63;
          v70 = ((char *)v68 - (char *)v62->__begin_) >> 4;
          if ((unint64_t)(v70 + 1) >> 60)
            sub_100259694();
          v71 = v67 - (unint64_t)v62->__begin_;
          v72 = v71 >> 3;
          if (v71 >> 3 <= (unint64_t)(v70 + 1))
            v72 = v70 + 1;
          if ((unint64_t)v71 >= 0x7FFFFFFFFFFFFFF0)
            v73 = 0xFFFFFFFFFFFFFFFLL;
          else
            v73 = v72;
          p_end_cap = &v62->__end_cap_;
          v74 = (char *)sub_10028E224((uint64_t)&v62->__end_cap_, v73);
          v76 = &v74[16 * v70];
          *(_OWORD *)v76 = v364;
          v78 = v62->__begin_;
          v77 = v62->__end_;
          if (v77 == v62->__begin_)
          {
            v81 = v62->__end_;
            v79 = &v74[16 * v70];
          }
          else
          {
            v79 = &v74[16 * v70];
            do
            {
              v80 = *((_OWORD *)v77 - 1);
              v77 -= 2;
              *((_OWORD *)v79 - 1) = v80;
              v79 -= 16;
              *v77 = 0;
              v77[1] = 0;
            }
            while (v77 != v78);
            v81 = v62->__begin_;
            v77 = v62->__end_;
          }
          v69 = v76 + 16;
          v62->__begin_ = v79;
          *((_QWORD *)&buf + 1) = v81;
          v62->__end_ = v76 + 16;
          v392 = v77;
          v82 = v62->__end_cap_.__value_;
          v62->__end_cap_.__value_ = &v74[16 * v75];
          v393 = v82;
          *(_QWORD *)&buf = v81;
          sub_100014F20((uint64_t)&buf);
        }
        else
        {
          *v68 = v63;
          v68[1] = v64;
          v69 = v68 + 2;
        }
        v62->__end_ = v69;
        *(_QWORD *)&v385 = -[CLHarvesterService universe](v390, "universe");
        *(_QWORD *)&v384 = -[CLHarvesterService universe](v390, "universe");
        sub_1004F3F50((uint64_t *)&v384, &buf);
        sub_1004F4050((uint64_t *)&v385, &buf, &v390->_harvestController.__ptr_, &v390->_harvestController.__ptr_, (uint64_t *)&v390->_harvestController, &v390->_networkController, &v390->_requestStore, &v386);
        v83 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
        if (*((_QWORD *)&buf + 1))
        {
          v84 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
          do
            v85 = __ldaxr(v84);
          while (__stlxr(v85 - 1, v84));
          if (!v85)
          {
            ((void (*)(std::__shared_weak_count *))v83->__on_zero_shared)(v83);
            std::__shared_weak_count::__release_weak(v83);
          }
        }
        v86 = &v390->_subHarvesters;
        v87 = v386;
        v385 = v386;
        v88 = *((_QWORD *)&v386 + 1);
        if (*((_QWORD *)&v386 + 1))
        {
          v89 = (unint64_t *)(*((_QWORD *)&v386 + 1) + 8);
          do
            v90 = __ldxr(v89);
          while (__stxr(v90 + 1, v89));
        }
        v91 = (unint64_t)v86->__end_cap_.__value_;
        v92 = v86->__end_;
        if ((unint64_t)v92 >= v91)
        {
          v365 = v87;
          v94 = ((char *)v92 - (char *)v86->__begin_) >> 4;
          if ((unint64_t)(v94 + 1) >> 60)
            sub_100259694();
          v95 = v91 - (unint64_t)v86->__begin_;
          v96 = v95 >> 3;
          if (v95 >> 3 <= (unint64_t)(v94 + 1))
            v96 = v94 + 1;
          if ((unint64_t)v95 >= 0x7FFFFFFFFFFFFFF0)
            v97 = 0xFFFFFFFFFFFFFFFLL;
          else
            v97 = v96;
          p_end_cap = &v86->__end_cap_;
          v98 = (char *)sub_10028E224((uint64_t)&v86->__end_cap_, v97);
          v100 = &v98[16 * v94];
          *(_OWORD *)v100 = v365;
          v102 = v86->__begin_;
          v101 = v86->__end_;
          if (v101 == v86->__begin_)
          {
            v105 = v86->__end_;
            v103 = &v98[16 * v94];
          }
          else
          {
            v103 = &v98[16 * v94];
            do
            {
              v104 = *((_OWORD *)v101 - 1);
              v101 -= 2;
              *((_OWORD *)v103 - 1) = v104;
              v103 -= 16;
              *v101 = 0;
              v101[1] = 0;
            }
            while (v101 != v102);
            v105 = v86->__begin_;
            v101 = v86->__end_;
          }
          v93 = v100 + 16;
          v86->__begin_ = v103;
          *((_QWORD *)&buf + 1) = v105;
          v86->__end_ = v100 + 16;
          v392 = v101;
          v106 = v86->__end_cap_.__value_;
          v86->__end_cap_.__value_ = &v98[16 * v99];
          v393 = v106;
          *(_QWORD *)&buf = v105;
          sub_100014F20((uint64_t)&buf);
        }
        else
        {
          *v92 = v87;
          v92[1] = v88;
          v93 = v92 + 2;
        }
        v86->__end_ = v93;
        *(_QWORD *)&v384 = -[CLHarvesterService universe](v390, "universe");
        *(_QWORD *)&v383 = -[CLHarvesterService universe](v390, "universe");
        sub_1004F3F50((uint64_t *)&v383, &buf);
        sub_1004F439C((uint64_t *)&v384, &buf, &v390->_harvestController.__ptr_, &v390->_harvestController.__ptr_, (uint64_t *)&v390->_harvestController, &v390->_networkController, &v390->_requestStore, &v385);
        v107 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
        if (*((_QWORD *)&buf + 1))
        {
          v108 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
          do
            v109 = __ldaxr(v108);
          while (__stlxr(v109 - 1, v108));
          if (!v109)
          {
            ((void (*)(std::__shared_weak_count *))v107->__on_zero_shared)(v107);
            std::__shared_weak_count::__release_weak(v107);
          }
        }
        v110 = &v390->_subHarvesters;
        v111 = v385;
        v384 = v385;
        v112 = *((_QWORD *)&v385 + 1);
        if (*((_QWORD *)&v385 + 1))
        {
          v113 = (unint64_t *)(*((_QWORD *)&v385 + 1) + 8);
          do
            v114 = __ldxr(v113);
          while (__stxr(v114 + 1, v113));
        }
        v115 = (unint64_t)v110->__end_cap_.__value_;
        v116 = v110->__end_;
        if ((unint64_t)v116 >= v115)
        {
          v366 = v111;
          v118 = ((char *)v116 - (char *)v110->__begin_) >> 4;
          if ((unint64_t)(v118 + 1) >> 60)
            sub_100259694();
          v119 = v115 - (unint64_t)v110->__begin_;
          v120 = v119 >> 3;
          if (v119 >> 3 <= (unint64_t)(v118 + 1))
            v120 = v118 + 1;
          if ((unint64_t)v119 >= 0x7FFFFFFFFFFFFFF0)
            v121 = 0xFFFFFFFFFFFFFFFLL;
          else
            v121 = v120;
          p_end_cap = &v110->__end_cap_;
          v122 = (char *)sub_10028E224((uint64_t)&v110->__end_cap_, v121);
          v124 = &v122[16 * v118];
          *(_OWORD *)v124 = v366;
          v126 = v110->__begin_;
          v125 = v110->__end_;
          if (v125 == v110->__begin_)
          {
            v129 = v110->__end_;
            v127 = &v122[16 * v118];
          }
          else
          {
            v127 = &v122[16 * v118];
            do
            {
              v128 = *((_OWORD *)v125 - 1);
              v125 -= 2;
              *((_OWORD *)v127 - 1) = v128;
              v127 -= 16;
              *v125 = 0;
              v125[1] = 0;
            }
            while (v125 != v126);
            v129 = v110->__begin_;
            v125 = v110->__end_;
          }
          v117 = v124 + 16;
          v110->__begin_ = v127;
          *((_QWORD *)&buf + 1) = v129;
          v110->__end_ = v124 + 16;
          v392 = v125;
          v130 = v110->__end_cap_.__value_;
          v110->__end_cap_.__value_ = &v122[16 * v123];
          v393 = v130;
          *(_QWORD *)&buf = v129;
          sub_100014F20((uint64_t)&buf);
        }
        else
        {
          *v116 = v111;
          v116[1] = v112;
          v117 = v116 + 2;
        }
        v110->__end_ = v117;
        *(_QWORD *)&v383 = -[CLHarvesterService universe](v390, "universe");
        *(_QWORD *)&v382 = -[CLHarvesterService universe](v390, "universe");
        sub_1004F46E8((uint64_t *)&v382, &buf);
        sub_1004F47E8((uint64_t *)&v383, &buf, &v390->_harvestController.__ptr_, &v390->_harvestController.__ptr_, (uint64_t *)&v390->_harvestController, (uint64_t *)&v390->_monitorGps, (uint64_t *)&v390->_policyTrip, &v384, (uint64_t *)&v390->_networkController, (uint64_t *)&v390->_requestStore);
        v131 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
        if (*((_QWORD *)&buf + 1))
        {
          v132 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
          do
            v133 = __ldaxr(v132);
          while (__stlxr(v133 - 1, v132));
          if (!v133)
          {
            ((void (*)(std::__shared_weak_count *))v131->__on_zero_shared)(v131);
            std::__shared_weak_count::__release_weak(v131);
          }
        }
        v134 = &v390->_subHarvesters;
        v135 = v384;
        v383 = v384;
        v136 = *((_QWORD *)&v384 + 1);
        if (*((_QWORD *)&v384 + 1))
        {
          v137 = (unint64_t *)(*((_QWORD *)&v384 + 1) + 8);
          do
            v138 = __ldxr(v137);
          while (__stxr(v138 + 1, v137));
        }
        v139 = (unint64_t)v134->__end_cap_.__value_;
        v140 = v134->__end_;
        if ((unint64_t)v140 >= v139)
        {
          v367 = v135;
          v142 = ((char *)v140 - (char *)v134->__begin_) >> 4;
          if ((unint64_t)(v142 + 1) >> 60)
            sub_100259694();
          v143 = v139 - (unint64_t)v134->__begin_;
          v144 = v143 >> 3;
          if (v143 >> 3 <= (unint64_t)(v142 + 1))
            v144 = v142 + 1;
          if ((unint64_t)v143 >= 0x7FFFFFFFFFFFFFF0)
            v145 = 0xFFFFFFFFFFFFFFFLL;
          else
            v145 = v144;
          p_end_cap = &v134->__end_cap_;
          v146 = (char *)sub_10028E224((uint64_t)&v134->__end_cap_, v145);
          v148 = &v146[16 * v142];
          *(_OWORD *)v148 = v367;
          v150 = v134->__begin_;
          v149 = v134->__end_;
          if (v149 == v134->__begin_)
          {
            v153 = v134->__end_;
            v151 = &v146[16 * v142];
          }
          else
          {
            v151 = &v146[16 * v142];
            do
            {
              v152 = *((_OWORD *)v149 - 1);
              v149 -= 2;
              *((_OWORD *)v151 - 1) = v152;
              v151 -= 16;
              *v149 = 0;
              v149[1] = 0;
            }
            while (v149 != v150);
            v153 = v134->__begin_;
            v149 = v134->__end_;
          }
          v141 = v148 + 16;
          v134->__begin_ = v151;
          *((_QWORD *)&buf + 1) = v153;
          v134->__end_ = v148 + 16;
          v392 = v149;
          v154 = v134->__end_cap_.__value_;
          v134->__end_cap_.__value_ = &v146[16 * v147];
          v393 = v154;
          *(_QWORD *)&buf = v153;
          sub_100014F20((uint64_t)&buf);
        }
        else
        {
          *v140 = v135;
          v140[1] = v136;
          v141 = v140 + 2;
        }
        v134->__end_ = v141;
        *(_QWORD *)&v382 = -[CLHarvesterService universe](v390, "universe");
        *(_QWORD *)&v381 = -[CLHarvesterService universe](v390, "universe");
        sub_1004F4C1C((uint64_t *)&v381, &buf);
        sub_1004F4D1C((uint64_t *)&v382, &buf, &v390->_harvestController.__ptr_, &v390->_harvestController.__ptr_, (uint64_t *)&v390->_harvestController, &v390->_networkController, &v390->_requestStore, &v383);
        v155 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
        if (*((_QWORD *)&buf + 1))
        {
          v156 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
          do
            v157 = __ldaxr(v156);
          while (__stlxr(v157 - 1, v156));
          if (!v157)
          {
            ((void (*)(std::__shared_weak_count *))v155->__on_zero_shared)(v155);
            std::__shared_weak_count::__release_weak(v155);
          }
        }
        sub_100C37B20(v383, v390->_mescalSigner);
        v158 = &v390->_subHarvesters;
        v159 = v383;
        v382 = v383;
        v160 = *((_QWORD *)&v383 + 1);
        if (*((_QWORD *)&v383 + 1))
        {
          v161 = (unint64_t *)(*((_QWORD *)&v383 + 1) + 8);
          do
            v162 = __ldxr(v161);
          while (__stxr(v162 + 1, v161));
        }
        v163 = (unint64_t)v158->__end_cap_.__value_;
        v164 = v158->__end_;
        if ((unint64_t)v164 >= v163)
        {
          v368 = v159;
          v166 = ((char *)v164 - (char *)v158->__begin_) >> 4;
          if ((unint64_t)(v166 + 1) >> 60)
            sub_100259694();
          v167 = v163 - (unint64_t)v158->__begin_;
          v168 = v167 >> 3;
          if (v167 >> 3 <= (unint64_t)(v166 + 1))
            v168 = v166 + 1;
          if ((unint64_t)v167 >= 0x7FFFFFFFFFFFFFF0)
            v169 = 0xFFFFFFFFFFFFFFFLL;
          else
            v169 = v168;
          p_end_cap = &v158->__end_cap_;
          v170 = (char *)sub_10028E224((uint64_t)&v158->__end_cap_, v169);
          v172 = &v170[16 * v166];
          *(_OWORD *)v172 = v368;
          v174 = v158->__begin_;
          v173 = v158->__end_;
          if (v173 == v158->__begin_)
          {
            v177 = v158->__end_;
            v175 = &v170[16 * v166];
          }
          else
          {
            v175 = &v170[16 * v166];
            do
            {
              v176 = *((_OWORD *)v173 - 1);
              v173 -= 2;
              *((_OWORD *)v175 - 1) = v176;
              v175 -= 16;
              *v173 = 0;
              v173[1] = 0;
            }
            while (v173 != v174);
            v177 = v158->__begin_;
            v173 = v158->__end_;
          }
          v165 = v172 + 16;
          v158->__begin_ = v175;
          *((_QWORD *)&buf + 1) = v177;
          v158->__end_ = v172 + 16;
          v392 = v173;
          v178 = v158->__end_cap_.__value_;
          v158->__end_cap_.__value_ = &v170[16 * v171];
          v393 = v178;
          *(_QWORD *)&buf = v177;
          sub_100014F20((uint64_t)&buf);
        }
        else
        {
          *v164 = v159;
          v164[1] = v160;
          v165 = v164 + 2;
        }
        v158->__end_ = v165;
        *(_QWORD *)&v381 = -[CLHarvesterService universe](v390, "universe");
        *(_QWORD *)&v380 = -[CLHarvesterService universe](v390, "universe");
        sub_1004F5068((uint64_t *)&v380, &buf);
        sub_1004F5168((uint64_t *)&v381, &buf, &v390->_harvestController.__ptr_, &v390->_harvestController.__ptr_, (uint64_t *)&v390->_harvestController, &v390->_networkController, &v390->_requestStore, &v382);
        v179 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
        if (*((_QWORD *)&buf + 1))
        {
          v180 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
          do
            v181 = __ldaxr(v180);
          while (__stlxr(v181 - 1, v180));
          if (!v181)
          {
            ((void (*)(std::__shared_weak_count *))v179->__on_zero_shared)(v179);
            std::__shared_weak_count::__release_weak(v179);
          }
        }
        v182 = &v390->_subHarvesters;
        v183 = v382;
        v381 = v382;
        v184 = *((_QWORD *)&v382 + 1);
        if (*((_QWORD *)&v382 + 1))
        {
          v185 = (unint64_t *)(*((_QWORD *)&v382 + 1) + 8);
          do
            v186 = __ldxr(v185);
          while (__stxr(v186 + 1, v185));
        }
        v187 = (unint64_t)v182->__end_cap_.__value_;
        v188 = v182->__end_;
        if ((unint64_t)v188 >= v187)
        {
          v369 = v183;
          v190 = ((char *)v188 - (char *)v182->__begin_) >> 4;
          if ((unint64_t)(v190 + 1) >> 60)
            sub_100259694();
          v191 = v187 - (unint64_t)v182->__begin_;
          v192 = v191 >> 3;
          if (v191 >> 3 <= (unint64_t)(v190 + 1))
            v192 = v190 + 1;
          if ((unint64_t)v191 >= 0x7FFFFFFFFFFFFFF0)
            v193 = 0xFFFFFFFFFFFFFFFLL;
          else
            v193 = v192;
          p_end_cap = &v182->__end_cap_;
          v194 = (char *)sub_10028E224((uint64_t)&v182->__end_cap_, v193);
          v196 = &v194[16 * v190];
          *(_OWORD *)v196 = v369;
          v198 = v182->__begin_;
          v197 = v182->__end_;
          if (v197 == v182->__begin_)
          {
            v201 = v182->__end_;
            v199 = &v194[16 * v190];
          }
          else
          {
            v199 = &v194[16 * v190];
            do
            {
              v200 = *((_OWORD *)v197 - 1);
              v197 -= 2;
              *((_OWORD *)v199 - 1) = v200;
              v199 -= 16;
              *v197 = 0;
              v197[1] = 0;
            }
            while (v197 != v198);
            v201 = v182->__begin_;
            v197 = v182->__end_;
          }
          v189 = v196 + 16;
          v182->__begin_ = v199;
          *((_QWORD *)&buf + 1) = v201;
          v182->__end_ = v196 + 16;
          v392 = v197;
          v202 = v182->__end_cap_.__value_;
          v182->__end_cap_.__value_ = &v194[16 * v195];
          v393 = v202;
          *(_QWORD *)&buf = v201;
          sub_100014F20((uint64_t)&buf);
        }
        else
        {
          *v188 = v183;
          v188[1] = v184;
          v189 = v188 + 2;
        }
        v182->__end_ = v189;
        *(_QWORD *)&v380 = -[CLHarvesterService universe](v390, "universe");
        *(_QWORD *)&v379 = -[CLHarvesterService universe](v390, "universe");
        sub_1004F54B4((uint64_t *)&v379, &buf);
        sub_1004F55B4((uint64_t *)&v380, &buf, &v390->_harvestController.__ptr_, &v390->_harvestController.__ptr_, (uint64_t *)&v390->_harvestController, &v390->_networkController, &v390->_requestStore, &v381);
        v203 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
        if (*((_QWORD *)&buf + 1))
        {
          v204 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
          do
            v205 = __ldaxr(v204);
          while (__stlxr(v205 - 1, v204));
          if (!v205)
          {
            ((void (*)(std::__shared_weak_count *))v203->__on_zero_shared)(v203);
            std::__shared_weak_count::__release_weak(v203);
          }
        }
        v206 = &v390->_subHarvesters;
        v207 = v381;
        v380 = v381;
        v208 = *((_QWORD *)&v381 + 1);
        if (*((_QWORD *)&v381 + 1))
        {
          v209 = (unint64_t *)(*((_QWORD *)&v381 + 1) + 8);
          do
            v210 = __ldxr(v209);
          while (__stxr(v210 + 1, v209));
        }
        v211 = (unint64_t)v206->__end_cap_.__value_;
        v212 = v206->__end_;
        if ((unint64_t)v212 >= v211)
        {
          v370 = v207;
          v214 = ((char *)v212 - (char *)v206->__begin_) >> 4;
          if ((unint64_t)(v214 + 1) >> 60)
            sub_100259694();
          v215 = v211 - (unint64_t)v206->__begin_;
          v216 = v215 >> 3;
          if (v215 >> 3 <= (unint64_t)(v214 + 1))
            v216 = v214 + 1;
          if ((unint64_t)v215 >= 0x7FFFFFFFFFFFFFF0)
            v217 = 0xFFFFFFFFFFFFFFFLL;
          else
            v217 = v216;
          p_end_cap = &v206->__end_cap_;
          v218 = (char *)sub_10028E224((uint64_t)&v206->__end_cap_, v217);
          v220 = &v218[16 * v214];
          *(_OWORD *)v220 = v370;
          v222 = v206->__begin_;
          v221 = v206->__end_;
          if (v221 == v206->__begin_)
          {
            v225 = v206->__end_;
            v223 = &v218[16 * v214];
          }
          else
          {
            v223 = &v218[16 * v214];
            do
            {
              v224 = *((_OWORD *)v221 - 1);
              v221 -= 2;
              *((_OWORD *)v223 - 1) = v224;
              v223 -= 16;
              *v221 = 0;
              v221[1] = 0;
            }
            while (v221 != v222);
            v225 = v206->__begin_;
            v221 = v206->__end_;
          }
          v213 = v220 + 16;
          v206->__begin_ = v223;
          *((_QWORD *)&buf + 1) = v225;
          v206->__end_ = v220 + 16;
          v392 = v221;
          v226 = v206->__end_cap_.__value_;
          v206->__end_cap_.__value_ = &v218[16 * v219];
          v393 = v226;
          *(_QWORD *)&buf = v225;
          sub_100014F20((uint64_t)&buf);
        }
        else
        {
          *v212 = v207;
          v212[1] = v208;
          v213 = v212 + 2;
        }
        v206->__end_ = v213;
        *(_QWORD *)&v379 = -[CLHarvesterService universe](v390, "universe");
        *(_QWORD *)&v378 = -[CLHarvesterService universe](v390, "universe");
        sub_1004F5900((uint64_t *)&v378, &buf);
        sub_1004F5A00((uint64_t *)&v379, &buf, &v390->_harvestController.__ptr_, &v390->_harvestController.__ptr_, (uint64_t *)&v390->_harvestController, (uint64_t *)&v390->_monitorGps, (uint64_t *)&v390->_policyProactive, &v380, (uint64_t *)&v390->_policyTrip, (uint64_t *)&v390->_networkController, (uint64_t *)&v390->_requestStore);
        v227 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
        if (*((_QWORD *)&buf + 1))
        {
          v228 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
          do
            v229 = __ldaxr(v228);
          while (__stlxr(v229 - 1, v228));
          if (!v229)
          {
            ((void (*)(std::__shared_weak_count *))v227->__on_zero_shared)(v227);
            std::__shared_weak_count::__release_weak(v227);
          }
        }
        v230 = &v390->_subHarvesters;
        v231 = v380;
        v379 = v380;
        v232 = *((_QWORD *)&v380 + 1);
        if (*((_QWORD *)&v380 + 1))
        {
          v233 = (unint64_t *)(*((_QWORD *)&v380 + 1) + 8);
          do
            v234 = __ldxr(v233);
          while (__stxr(v234 + 1, v233));
        }
        v235 = (unint64_t)v230->__end_cap_.__value_;
        v236 = v230->__end_;
        if ((unint64_t)v236 >= v235)
        {
          v371 = v231;
          v238 = ((char *)v236 - (char *)v230->__begin_) >> 4;
          if ((unint64_t)(v238 + 1) >> 60)
            sub_100259694();
          v239 = v235 - (unint64_t)v230->__begin_;
          v240 = v239 >> 3;
          if (v239 >> 3 <= (unint64_t)(v238 + 1))
            v240 = v238 + 1;
          if ((unint64_t)v239 >= 0x7FFFFFFFFFFFFFF0)
            v241 = 0xFFFFFFFFFFFFFFFLL;
          else
            v241 = v240;
          p_end_cap = &v230->__end_cap_;
          v242 = (char *)sub_10028E224((uint64_t)&v230->__end_cap_, v241);
          v244 = &v242[16 * v238];
          *(_OWORD *)v244 = v371;
          v246 = v230->__begin_;
          v245 = v230->__end_;
          if (v245 == v230->__begin_)
          {
            v249 = v230->__end_;
            v247 = &v242[16 * v238];
          }
          else
          {
            v247 = &v242[16 * v238];
            do
            {
              v248 = *((_OWORD *)v245 - 1);
              v245 -= 2;
              *((_OWORD *)v247 - 1) = v248;
              v247 -= 16;
              *v245 = 0;
              v245[1] = 0;
            }
            while (v245 != v246);
            v249 = v230->__begin_;
            v245 = v230->__end_;
          }
          v237 = v244 + 16;
          v230->__begin_ = v247;
          *((_QWORD *)&buf + 1) = v249;
          v230->__end_ = v244 + 16;
          v392 = v245;
          v250 = v230->__end_cap_.__value_;
          v230->__end_cap_.__value_ = &v242[16 * v243];
          v393 = v250;
          *(_QWORD *)&buf = v249;
          sub_100014F20((uint64_t)&buf);
        }
        else
        {
          *v236 = v231;
          v236[1] = v232;
          v237 = v236 + 2;
        }
        v230->__end_ = v237;
        *(_QWORD *)&v378 = -[CLHarvesterService universe](v390, "universe");
        *(_QWORD *)&v377 = -[CLHarvesterService universe](v390, "universe");
        sub_1004F5EB8((uint64_t *)&v377, &buf);
        sub_1004F5FB8((uint64_t *)&v378, &buf, &v390->_harvestController.__ptr_, &v390->_harvestController.__ptr_, (uint64_t *)&v390->_harvestController, (uint64_t *)&v390->_monitorGps, (uint64_t *)&v390->_networkController, &v379, (uint64_t *)&v390->_requestStore);
        v251 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
        if (*((_QWORD *)&buf + 1))
        {
          v252 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
          do
            v253 = __ldaxr(v252);
          while (__stlxr(v253 - 1, v252));
          if (!v253)
          {
            ((void (*)(std::__shared_weak_count *))v251->__on_zero_shared)(v251);
            std::__shared_weak_count::__release_weak(v251);
          }
        }
        v254 = &v390->_subHarvesters;
        v255 = v379;
        v378 = v379;
        v256 = *((_QWORD *)&v379 + 1);
        if (*((_QWORD *)&v379 + 1))
        {
          v257 = (unint64_t *)(*((_QWORD *)&v379 + 1) + 8);
          do
            v258 = __ldxr(v257);
          while (__stxr(v258 + 1, v257));
        }
        v259 = (unint64_t)v254->__end_cap_.__value_;
        v260 = v254->__end_;
        if ((unint64_t)v260 >= v259)
        {
          v372 = v255;
          v262 = ((char *)v260 - (char *)v254->__begin_) >> 4;
          if ((unint64_t)(v262 + 1) >> 60)
            sub_100259694();
          v263 = v259 - (unint64_t)v254->__begin_;
          v264 = v263 >> 3;
          if (v263 >> 3 <= (unint64_t)(v262 + 1))
            v264 = v262 + 1;
          if ((unint64_t)v263 >= 0x7FFFFFFFFFFFFFF0)
            v265 = 0xFFFFFFFFFFFFFFFLL;
          else
            v265 = v264;
          p_end_cap = &v254->__end_cap_;
          v266 = (char *)sub_10028E224((uint64_t)&v254->__end_cap_, v265);
          v268 = &v266[16 * v262];
          *(_OWORD *)v268 = v372;
          v270 = v254->__begin_;
          v269 = v254->__end_;
          if (v269 == v254->__begin_)
          {
            v273 = v254->__end_;
            v271 = &v266[16 * v262];
          }
          else
          {
            v271 = &v266[16 * v262];
            do
            {
              v272 = *((_OWORD *)v269 - 1);
              v269 -= 2;
              *((_OWORD *)v271 - 1) = v272;
              v271 -= 16;
              *v269 = 0;
              v269[1] = 0;
            }
            while (v269 != v270);
            v273 = v254->__begin_;
            v269 = v254->__end_;
          }
          v261 = v268 + 16;
          v254->__begin_ = v271;
          *((_QWORD *)&buf + 1) = v273;
          v254->__end_ = v268 + 16;
          v392 = v269;
          v274 = v254->__end_cap_.__value_;
          v254->__end_cap_.__value_ = &v266[16 * v267];
          v393 = v274;
          *(_QWORD *)&buf = v273;
          sub_100014F20((uint64_t)&buf);
        }
        else
        {
          *v260 = v255;
          v260[1] = v256;
          v261 = v260 + 2;
        }
        v254->__end_ = v261;
        *(_QWORD *)&v377 = -[CLHarvesterService universe](v390, "universe");
        *(_QWORD *)&v375 = -[CLHarvesterService universe](v390, "universe");
        sub_1004F6380(&v375, &buf);
        sub_1004F6480((uint64_t *)&v377, &buf, &v390->_harvestController.__ptr_, &v390->_harvestController.__ptr_, (uint64_t *)&v390->_harvestController, &v390->_networkController, &v390->_requestStore, &v378);
        v275 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
        if (*((_QWORD *)&buf + 1))
        {
          v276 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
          do
            v277 = __ldaxr(v276);
          while (__stlxr(v277 - 1, v276));
          if (!v277)
          {
            ((void (*)(std::__shared_weak_count *))v275->__on_zero_shared)(v275);
            std::__shared_weak_count::__release_weak(v275);
          }
        }
        v278 = &v390->_subHarvesters;
        v279 = v378;
        v377 = v378;
        v280 = *((_QWORD *)&v378 + 1);
        if (*((_QWORD *)&v378 + 1))
        {
          v281 = (unint64_t *)(*((_QWORD *)&v378 + 1) + 8);
          do
            v282 = __ldxr(v281);
          while (__stxr(v282 + 1, v281));
        }
        v283 = (unint64_t)v278->__end_cap_.__value_;
        v284 = v278->__end_;
        if ((unint64_t)v284 >= v283)
        {
          v373 = v279;
          v286 = ((char *)v284 - (char *)v278->__begin_) >> 4;
          if ((unint64_t)(v286 + 1) >> 60)
            sub_100259694();
          v287 = v283 - (unint64_t)v278->__begin_;
          v288 = v287 >> 3;
          if (v287 >> 3 <= (unint64_t)(v286 + 1))
            v288 = v286 + 1;
          if ((unint64_t)v287 >= 0x7FFFFFFFFFFFFFF0)
            v289 = 0xFFFFFFFFFFFFFFFLL;
          else
            v289 = v288;
          p_end_cap = &v278->__end_cap_;
          v290 = (char *)sub_10028E224((uint64_t)&v278->__end_cap_, v289);
          v292 = &v290[16 * v286];
          *(_OWORD *)v292 = v373;
          v294 = v278->__begin_;
          v293 = v278->__end_;
          if (v293 == v278->__begin_)
          {
            v297 = v278->__end_;
            v295 = &v290[16 * v286];
          }
          else
          {
            v295 = &v290[16 * v286];
            do
            {
              v296 = *((_OWORD *)v293 - 1);
              v293 -= 2;
              *((_OWORD *)v295 - 1) = v296;
              v295 -= 16;
              *v293 = 0;
              v293[1] = 0;
            }
            while (v293 != v294);
            v297 = v278->__begin_;
            v293 = v278->__end_;
          }
          v285 = v292 + 16;
          v278->__begin_ = v295;
          *((_QWORD *)&buf + 1) = v297;
          v278->__end_ = v292 + 16;
          v392 = v293;
          v298 = v278->__end_cap_.__value_;
          v278->__end_cap_.__value_ = &v290[16 * v291];
          v393 = v298;
          *(_QWORD *)&buf = v297;
          sub_100014F20((uint64_t)&buf);
        }
        else
        {
          *v284 = v279;
          v284[1] = v280;
          v285 = v284 + 2;
        }
        v278->__end_ = v285;
        *(_QWORD *)&v375 = -[CLHarvesterService universe](v390, "universe");
        v376 = -[CLHarvesterService universe](v390, "universe");
        sub_1004F67CC((uint64_t *)&v376, &buf);
        sub_1004F68CC((uint64_t *)&v375, &buf, &v390->_harvestController.__ptr_, &v390->_harvestController.__ptr_, (uint64_t *)&v390->_harvestController, &v390->_networkController, &v390->_requestStore, &v377);
        v299 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
        if (*((_QWORD *)&buf + 1))
        {
          v300 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
          do
            v301 = __ldaxr(v300);
          while (__stlxr(v301 - 1, v300));
          if (!v301)
          {
            ((void (*)(std::__shared_weak_count *))v299->__on_zero_shared)(v299);
            std::__shared_weak_count::__release_weak(v299);
          }
        }
        v302 = &v390->_subHarvesters;
        v303 = v377;
        v375 = v377;
        v304 = *((_QWORD *)&v377 + 1);
        if (*((_QWORD *)&v377 + 1))
        {
          v305 = (unint64_t *)(*((_QWORD *)&v377 + 1) + 8);
          do
            v306 = __ldxr(v305);
          while (__stxr(v306 + 1, v305));
        }
        v307 = (unint64_t)v302->__end_cap_.__value_;
        v308 = v302->__end_;
        if ((unint64_t)v308 >= v307)
        {
          v374 = v303;
          v310 = ((char *)v308 - (char *)v302->__begin_) >> 4;
          if ((unint64_t)(v310 + 1) >> 60)
            sub_100259694();
          v311 = v307 - (unint64_t)v302->__begin_;
          v312 = v311 >> 3;
          if (v311 >> 3 <= (unint64_t)(v310 + 1))
            v312 = v310 + 1;
          if ((unint64_t)v311 >= 0x7FFFFFFFFFFFFFF0)
            v313 = 0xFFFFFFFFFFFFFFFLL;
          else
            v313 = v312;
          p_end_cap = &v302->__end_cap_;
          v314 = (char *)sub_10028E224((uint64_t)&v302->__end_cap_, v313);
          v316 = &v314[16 * v310];
          *(_OWORD *)v316 = v374;
          v318 = v302->__begin_;
          v317 = v302->__end_;
          if (v317 == v302->__begin_)
          {
            v321 = v302->__end_;
            v319 = &v314[16 * v310];
          }
          else
          {
            v319 = &v314[16 * v310];
            do
            {
              v320 = *((_OWORD *)v317 - 1);
              v317 -= 2;
              *((_OWORD *)v319 - 1) = v320;
              v319 -= 16;
              *v317 = 0;
              v317[1] = 0;
            }
            while (v317 != v318);
            v321 = v302->__begin_;
            v317 = v302->__end_;
          }
          v309 = v316 + 16;
          v302->__begin_ = v319;
          *((_QWORD *)&buf + 1) = v321;
          v302->__end_ = v316 + 16;
          v392 = v317;
          v322 = v302->__end_cap_.__value_;
          v302->__end_cap_.__value_ = &v314[16 * v315];
          v393 = v322;
          *(_QWORD *)&buf = v321;
          sub_100014F20((uint64_t)&buf);
        }
        else
        {
          *v308 = v303;
          v308[1] = v304;
          v309 = v308 + 2;
        }
        v302->__end_ = v309;
        v323 = (std::__shared_weak_count *)*((_QWORD *)&v377 + 1);
        if (*((_QWORD *)&v377 + 1))
        {
          v324 = (unint64_t *)(*((_QWORD *)&v377 + 1) + 8);
          do
            v325 = __ldaxr(v324);
          while (__stlxr(v325 - 1, v324));
          if (!v325)
          {
            ((void (*)(std::__shared_weak_count *))v323->__on_zero_shared)(v323);
            std::__shared_weak_count::__release_weak(v323);
          }
        }
        v326 = (std::__shared_weak_count *)*((_QWORD *)&v378 + 1);
        if (*((_QWORD *)&v378 + 1))
        {
          v327 = (unint64_t *)(*((_QWORD *)&v378 + 1) + 8);
          do
            v328 = __ldaxr(v327);
          while (__stlxr(v328 - 1, v327));
          if (!v328)
          {
            ((void (*)(std::__shared_weak_count *))v326->__on_zero_shared)(v326);
            std::__shared_weak_count::__release_weak(v326);
          }
        }
        v329 = (std::__shared_weak_count *)*((_QWORD *)&v379 + 1);
        if (*((_QWORD *)&v379 + 1))
        {
          v330 = (unint64_t *)(*((_QWORD *)&v379 + 1) + 8);
          do
            v331 = __ldaxr(v330);
          while (__stlxr(v331 - 1, v330));
          if (!v331)
          {
            ((void (*)(std::__shared_weak_count *))v329->__on_zero_shared)(v329);
            std::__shared_weak_count::__release_weak(v329);
          }
        }
        v332 = (std::__shared_weak_count *)*((_QWORD *)&v380 + 1);
        if (*((_QWORD *)&v380 + 1))
        {
          v333 = (unint64_t *)(*((_QWORD *)&v380 + 1) + 8);
          do
            v334 = __ldaxr(v333);
          while (__stlxr(v334 - 1, v333));
          if (!v334)
          {
            ((void (*)(std::__shared_weak_count *))v332->__on_zero_shared)(v332);
            std::__shared_weak_count::__release_weak(v332);
          }
        }
        v335 = (std::__shared_weak_count *)*((_QWORD *)&v381 + 1);
        if (*((_QWORD *)&v381 + 1))
        {
          v336 = (unint64_t *)(*((_QWORD *)&v381 + 1) + 8);
          do
            v337 = __ldaxr(v336);
          while (__stlxr(v337 - 1, v336));
          if (!v337)
          {
            ((void (*)(std::__shared_weak_count *))v335->__on_zero_shared)(v335);
            std::__shared_weak_count::__release_weak(v335);
          }
        }
        v338 = (std::__shared_weak_count *)*((_QWORD *)&v382 + 1);
        if (*((_QWORD *)&v382 + 1))
        {
          v339 = (unint64_t *)(*((_QWORD *)&v382 + 1) + 8);
          do
            v340 = __ldaxr(v339);
          while (__stlxr(v340 - 1, v339));
          if (!v340)
          {
            ((void (*)(std::__shared_weak_count *))v338->__on_zero_shared)(v338);
            std::__shared_weak_count::__release_weak(v338);
          }
        }
        v341 = (std::__shared_weak_count *)*((_QWORD *)&v383 + 1);
        if (*((_QWORD *)&v383 + 1))
        {
          v342 = (unint64_t *)(*((_QWORD *)&v383 + 1) + 8);
          do
            v343 = __ldaxr(v342);
          while (__stlxr(v343 - 1, v342));
          if (!v343)
          {
            ((void (*)(std::__shared_weak_count *))v341->__on_zero_shared)(v341);
            std::__shared_weak_count::__release_weak(v341);
          }
        }
        v344 = (std::__shared_weak_count *)*((_QWORD *)&v384 + 1);
        if (*((_QWORD *)&v384 + 1))
        {
          v345 = (unint64_t *)(*((_QWORD *)&v384 + 1) + 8);
          do
            v346 = __ldaxr(v345);
          while (__stlxr(v346 - 1, v345));
          if (!v346)
          {
            ((void (*)(std::__shared_weak_count *))v344->__on_zero_shared)(v344);
            std::__shared_weak_count::__release_weak(v344);
          }
        }
        v347 = (std::__shared_weak_count *)*((_QWORD *)&v385 + 1);
        if (*((_QWORD *)&v385 + 1))
        {
          v348 = (unint64_t *)(*((_QWORD *)&v385 + 1) + 8);
          do
            v349 = __ldaxr(v348);
          while (__stlxr(v349 - 1, v348));
          if (!v349)
          {
            ((void (*)(std::__shared_weak_count *))v347->__on_zero_shared)(v347);
            std::__shared_weak_count::__release_weak(v347);
          }
        }
        v350 = (std::__shared_weak_count *)*((_QWORD *)&v386 + 1);
        if (*((_QWORD *)&v386 + 1))
        {
          v351 = (unint64_t *)(*((_QWORD *)&v386 + 1) + 8);
          do
            v352 = __ldaxr(v351);
          while (__stlxr(v352 - 1, v351));
          if (!v352)
          {
            ((void (*)(std::__shared_weak_count *))v350->__on_zero_shared)(v350);
            std::__shared_weak_count::__release_weak(v350);
          }
        }
        v353 = (std::__shared_weak_count *)*((_QWORD *)&v387 + 1);
        if (*((_QWORD *)&v387 + 1))
        {
          v354 = (unint64_t *)(*((_QWORD *)&v387 + 1) + 8);
          do
            v355 = __ldaxr(v354);
          while (__stlxr(v355 - 1, v354));
          if (!v355)
          {
            ((void (*)(std::__shared_weak_count *))v353->__on_zero_shared)(v353);
            std::__shared_weak_count::__release_weak(v353);
          }
        }
        v356 = (std::__shared_weak_count *)*((_QWORD *)&v388 + 1);
        if (*((_QWORD *)&v388 + 1))
        {
          v357 = (unint64_t *)(*((_QWORD *)&v388 + 1) + 8);
          do
            v358 = __ldaxr(v357);
          while (__stlxr(v358 - 1, v357));
          if (!v358)
          {
            ((void (*)(std::__shared_weak_count *))v356->__on_zero_shared)(v356);
            std::__shared_weak_count::__release_weak(v356);
          }
        }
        v359 = (std::__shared_weak_count *)*((_QWORD *)&v389 + 1);
        if (*((_QWORD *)&v389 + 1))
        {
          v360 = (unint64_t *)(*((_QWORD *)&v389 + 1) + 8);
          do
            v361 = __ldaxr(v360);
          while (__stlxr(v361 - 1, v360));
          if (!v361)
          {
            ((void (*)(std::__shared_weak_count *))v359->__on_zero_shared)(v359);
            std::__shared_weak_count::__release_weak(v359);
          }
        }
        return;
      }
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_10213F4E0);
      v18 = qword_1022A0208;
      if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_FAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "Service attempting to construct subharvesters without policies", (uint8_t *)&buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(&buf, 0x65CuLL);
        if (qword_1022A0200 != -1)
          dispatch_once(&qword_1022A0200, &stru_10213F4E0);
        LOWORD(v389) = 0;
        _os_log_send_and_compose_impl(2, 0, &buf, 1628, &_mh_execute_header, qword_1022A0208, 17, "Service attempting to construct subharvesters without policies", &v389, 2);
        v17 = (__int128 *)v19;
        sub_100512490("Generic", 1, 0, 0, "-[CLHarvesterService constructSubHarvesters]", "%s\n", v19);
LABEL_39:
        if (v17 != &buf)
          free(v17);
      }
    }
    else
    {
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_10213F4E0);
      v20 = qword_1022A0208;
      if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_FAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "Service attempting to construct subharvesters without gps monitor", (uint8_t *)&buf, 2u);
      }
      if (sub_1001BFF7C(115, 0))
      {
        bzero(&buf, 0x65CuLL);
        if (qword_1022A0200 != -1)
          dispatch_once(&qword_1022A0200, &stru_10213F4E0);
        LOWORD(v389) = 0;
        _os_log_send_and_compose_impl(2, 0, &buf, 1628, &_mh_execute_header, qword_1022A0208, 17, "Service attempting to construct subharvesters without gps monitor", &v389, 2);
        v17 = (__int128 *)v21;
        sub_100512490("Generic", 1, 0, 0, "-[CLHarvesterService constructSubHarvesters]", "%s\n", v21);
        goto LABEL_39;
      }
    }
  }
  else
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_10213F4E0);
    v15 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "Service attempting to construct subharvesters without controller", (uint8_t *)&buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_10213F4E0);
      LOWORD(v389) = 0;
      _os_log_send_and_compose_impl(2, 0, &buf, 1628, &_mh_execute_header, qword_1022A0208, 17, "Service attempting to construct subharvesters without controller", &v389, 2);
      v17 = (__int128 *)v16;
      sub_100512490("Generic", 1, 0, 0, "-[CLHarvesterService constructSubHarvesters]", "%s\n", v16);
      goto LABEL_39;
    }
  }
}

- (void)beginService
{
  NSObject *v3;
  CLHNetworkController *v4;
  CLHLocationClassifier *v5;
  id v6;
  CLHarvestController *ptr;
  __shared_weak_count *cntrl;
  unint64_t *v9;
  unint64_t v10;
  __shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  __shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  uint64_t *v26[3];
  CLPolicyTrip *v27;
  __shared_weak_count *v28;
  CLPolicyProactive *v29;
  __shared_weak_count *v30;
  CLMonitorGps *v31;
  __shared_weak_count *v32;
  int out_token[2];

  v3 = objc_msgSend(objc_msgSend(-[CLHarvesterService universe](self, "universe"), "silo"), "queue");
  -[CLHarvesterService constructController](self, "constructController");
  -[CLHarvesterService constructMonitors](self, "constructMonitors");
  self->_endpointSelector = objc_alloc_init(CLHEndpointSelector);
  v4 = -[CLHNetworkController initWithQueue:]([CLHNetworkController alloc], "initWithQueue:", v3);
  self->_networkController = v4;
  -[CLHNetworkController setEndpointSelector:](v4, "setEndpointSelector:", self->_endpointSelector);
  v5 = -[CLHLocationClassifier initInUniverse:]([CLHLocationClassifier alloc], "initInUniverse:", -[CLHarvesterService universe](self, "universe"));
  self->_classifier = v5;
  -[CLHLocationClassifier fetchLocationsOfInterestIfPossibleWithCompletionHandler:](v5, "fetchLocationsOfInterestIfPossibleWithCompletionHandler:", &stru_10213F458);
  v6 = objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithPath:isDirectory:", CFSTR("/var/root/Library/Caches/locationd/harvest/"), 1);
  self->_requestStore = -[CLHRequestStore initWithRootDirectory:classifier:]([CLHRequestStore alloc], "initWithRootDirectory:classifier:", v6, self->_classifier);

  self->_mescalSigner = (CLMescalSigner *)-[CLMescalSigner initInSilo:]([CLMescalSigner alloc], "initInSilo:", objc_msgSend(-[CLHarvesterService universe](self, "universe"), "silo"));
  -[CLHarvesterService constructPolicies](self, "constructPolicies");
  -[CLHarvesterService constructSubHarvesters](self, "constructSubHarvesters");
  sub_100197040();
  if (sub_10075D288())
  {
    out_token[0] = 0;
    notify_register_dispatch("persistHarvestData", out_token, v3, &stru_10213F498);
  }
  +[CLPMeta updateRegulatoryDomainEstimates](CLPMeta, "updateRegulatoryDomainEstimates");
  ptr = self->_harvestController.__ptr_;
  cntrl = self->_monitorGps.__cntrl_;
  v31 = self->_monitorGps.__ptr_;
  v32 = cntrl;
  if (cntrl)
  {
    v9 = (unint64_t *)((char *)cntrl + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  v11 = self->_policyProactive.__cntrl_;
  v29 = self->_policyProactive.__ptr_;
  v30 = v11;
  if (v11)
  {
    v12 = (unint64_t *)((char *)v11 + 8);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  v14 = self->_policyTrip.__cntrl_;
  v27 = self->_policyTrip.__ptr_;
  v28 = v14;
  if (v14)
  {
    v15 = (unint64_t *)((char *)v14 + 8);
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  memset(v26, 0, sizeof(v26));
  sub_1004F6C18((char *)v26, (_QWORD *)self->_subHarvesters.__begin_, (_QWORD *)self->_subHarvesters.__end_, ((char *)self->_subHarvesters.__end_ - (char *)self->_subHarvesters.__begin_) >> 4);
  sub_10058D56C(ptr, (uint64_t *)&v31, (uint64_t *)&v29, (uint64_t *)&v27, v26);
  *(_QWORD *)out_token = v26;
  sub_1002A3684((void ***)out_token);
  v17 = (std::__shared_weak_count *)v28;
  if (v28)
  {
    v18 = (unint64_t *)((char *)v28 + 8);
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  v20 = (std::__shared_weak_count *)v30;
  if (v30)
  {
    v21 = (unint64_t *)((char *)v30 + 8);
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  v23 = (std::__shared_weak_count *)v32;
  if (v32)
  {
    v24 = (unint64_t *)((char *)v32 + 8);
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  objc_msgSend(-[CLHarvesterService universe](self, "universe"), "silo");
  -[CLHarvesterService universe](self, "universe");
  operator new();
}

- (void)endService
{
  CLHarvestSettings *value;
  vector<std::shared_ptr<CLSubHarvester>, std::allocator<std::shared_ptr<CLSubHarvester>>> *p_subHarvesters;
  uint64_t i;
  void *begin;
  _QWORD v7[5];

  value = self->fHarvestSettings.__ptr_.__value_;
  if (value)
    sub_100FC40B4(value);

  notify_cancel(self->_countryCodeNotificationToken);
  dispatch_queue_set_specific((dispatch_queue_t)objc_msgSend(objc_msgSend(-[CLHarvesterService universe](self, "universe"), "silo"), "queue"), &unk_1023015C8, &unk_1023015C8, 0);
  if (dispatch_get_specific(&unk_1023015C8) == &unk_1023015C8)
  {
    sub_100346F9C(&self->_harvestController.__ptr_);
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1004F1370;
    v7[3] = &unk_10212BB58;
    v7[4] = self;
    objc_msgSend(objc_msgSend(-[CLHarvesterService universe](self, "universe"), "silo"), "sync:", v7);
  }
  sub_100346F9C(&self->_monitorGps.__ptr_);
  sub_100346F9C(&self->_policyTrip.__ptr_);
  sub_100346F9C(&self->_policyProactive.__ptr_);
  p_subHarvesters = &self->_subHarvesters;
  begin = p_subHarvesters->__begin_;
  for (i = (uint64_t)p_subHarvesters->__end_; (void *)i != begin; i = sub_100261F44(i - 16))
    ;
  p_subHarvesters->__end_ = begin;
}

- (void)setPrivateMode:(BOOL)a3
{
  sub_10058F5A0(self->_harvestController.__ptr_, a3);
}

- (void)setHarvestingEnabled:(BOOL)a3
{
  sub_10058D920((uint64_t)self->_harvestController.__ptr_, a3);
}

- (void)shutdown
{
  sub_10058D32C((uint64_t)self->_harvestController.__ptr_);
}

- (id)jsonObject
{
  id v3;
  _QWORD v5[2];
  _QWORD v6[2];

  v5[0] = CFSTR("endpointSelector");
  v3 = -[CLHEndpointSelector jsonObject](self->_endpointSelector, "jsonObject");
  v5[1] = CFSTR("locationClassifier");
  v6[0] = v3;
  v6[1] = -[CLHLocationClassifier jsonObject](self->_classifier, "jsonObject");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
}

- (void)submitSample:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *begin;
  uint64_t *end;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  int v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[10];
  __int16 v31;
  uint64_t v32;

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_10213F4E0);
  v5 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
  {
    v29 = 68289026;
    *(_WORD *)v30 = 2082;
    *(_QWORD *)&v30[2] = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"-submitSample: called\"}", (uint8_t *)&v29, 0x12u);
  }
  if (sub_1004F17D4(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), (uint64_t)CFSTR("com.apple.locationd.harvest.contribute")))
  {
    v7 = objc_opt_class(CLPPoiHarvest, v6);
    if ((objc_opt_isKindOfClass(a3, v7) & 1) != 0)
    {
      begin = (uint64_t *)self->_subHarvesters.__begin_;
      end = (uint64_t *)self->_subHarvesters.__end_;
      if (begin != end)
      {
        while (1)
        {
          v10 = *begin;
          v11 = (std::__shared_weak_count *)begin[1];
          v29 = *begin;
          *(_QWORD *)v30 = v11;
          if (v11)
          {
            p_shared_owners = (unint64_t *)&v11->__shared_owners_;
            do
              v13 = __ldxr(p_shared_owners);
            while (__stxr(v13 + 1, p_shared_owners));
          }
          v14 = sub_100201404(v10);
          if (v11)
          {
            v15 = (unint64_t *)&v11->__shared_owners_;
            do
              v16 = __ldaxr(v15);
            while (__stlxr(v16 - 1, v15));
            if (!v16)
            {
              ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
              std::__shared_weak_count::__release_weak(v11);
            }
          }
          if (v14 == 9)
            break;
          begin += 2;
          if (begin == end)
          {
            begin = end;
            break;
          }
        }
      }
      v17 = *begin;
      v18 = (std::__shared_weak_count *)begin[1];
      v29 = *begin;
      *(_QWORD *)v30 = v18;
      if (v18)
      {
        v19 = (unint64_t *)&v18->__shared_owners_;
        do
          v20 = __ldxr(v19);
        while (__stxr(v20 + 1, v19));
      }
      sub_100429CD0(v17, a3);
      if (v18)
      {
        v21 = (unint64_t *)&v18->__shared_owners_;
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
        if (!v22)
        {
          ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
          std::__shared_weak_count::__release_weak(v18);
        }
      }
    }
    else
    {
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_10213F4E0);
      v23 = qword_1022A0208;
      if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_FAULT))
      {
        v25 = objc_opt_class(a3, v24);
        v29 = 68289282;
        *(_WORD *)v30 = 2082;
        *(_QWORD *)&v30[2] = "";
        v31 = 2114;
        v32 = v25;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"received sample of unrecognized type\", \"class\":%{public, location:escape_only}@}", (uint8_t *)&v29, 0x1Cu);
        if (qword_1022A0200 != -1)
          dispatch_once(&qword_1022A0200, &stru_10213F4E0);
      }
      v26 = qword_1022A0208;
      if (os_signpost_enabled((os_log_t)qword_1022A0208))
      {
        v28 = objc_opt_class(a3, v27);
        v29 = 68289282;
        *(_WORD *)v30 = 2082;
        *(_QWORD *)&v30[2] = "";
        v31 = 2114;
        v32 = v28;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "received sample of unrecognized type", "{\"msg%{public}.0s\":\"received sample of unrecognized type\", \"class\":%{public, location:escape_only}@}", (uint8_t *)&v29, 0x1Cu);
      }
    }
  }
}

- (void)fetchStateWithReply:(id)a3
{
  NSObject *v5;
  _QWORD v6[3];
  _QWORD v7[3];
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_10213F4E0);
  v5 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"-fetchStateWithReply: called\"}", buf, 0x12u);
  }
  if (sub_1004F17D4(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"), (uint64_t)CFSTR("com.apple.locationd.harvest.introspection")))
  {
    v7[0] = -[CLHEndpointSelector jsonObject](self->_endpointSelector, "jsonObject", CFSTR("endpointSelector"));
    v6[1] = CFSTR("classifier");
    v7[1] = -[CLHLocationClassifier jsonObject](self->_classifier, "jsonObject");
    v6[2] = CFSTR("requestStore");
    v7[2] = -[CLHRequestStore jsonObject](self->_requestStore, "jsonObject");
    (*((void (**)(id, NSDictionary *))a3 + 2))(a3, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 3));
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSObject *v6;
  _BOOL4 v7;
  int v8;
  NSXPCInterface *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v19;
  uint8_t *v20;
  _WORD v21[8];
  uint8_t buf[1640];

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_10213F4E0);
  v6 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "received connection request", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_10213F4E0);
    v21[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A0208, 0, "received connection request", v21, 2);
    v20 = (uint8_t *)v19;
    sub_100512490("Generic", 1, 0, 2, "-[CLHarvesterService listener:shouldAcceptNewConnection:]", "%s\n", v19);
    if (v20 != buf)
      free(v20);
  }
  v7 = sub_1004F17D4(a4, (uint64_t)CFSTR("com.apple.locationd.harvest.introspection"));
  v8 = v7 | sub_1004F17D4(a4, (uint64_t)CFSTR("com.apple.locationd.harvest.contribute"));
  if (v8 == 1)
  {
    v9 = +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CLHarvesterServerInterface);
    -[NSXPCInterface setClass:forSelector:argumentIndex:ofReply:](v9, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(CLPPoiHarvest, v10), "submitSample:", 0, 0);
    v12 = objc_opt_class(NSString, v11);
    v14 = objc_opt_class(NSArray, v13);
    v16 = objc_opt_class(NSDictionary, v15);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v9, "setClasses:forSelector:argumentIndex:ofReply:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, v14, v16, objc_opt_class(NSNumber, v17), 0), "fetchStateWithReply:", 0, 1);
    objc_msgSend(a4, "setExportedInterface:", v9);
    objc_msgSend(a4, "setExportedObject:", self);
    objc_msgSend(a4, "_setQueue:", objc_msgSend(objc_msgSend(-[CLHarvesterService universe](self, "universe"), "silo"), "queue"));
    objc_msgSend(a4, "resume");
  }
  return v8;
}

- (void)notifyPassKitPayment:(id)a3 transaction:(id)a4 info:(id)a5
{
  sub_100592E6C((uint64_t)self->_harvestController.__ptr_);
}

- (NSString)lastCountryCode
{
  return self->_lastCountryCode;
}

- (void)setLastCountryCode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  vector<std::shared_ptr<CLSubHarvester>, std::allocator<std::shared_ptr<CLSubHarvester>>> *p_subHarvesters;

  sub_1004F6CB8((uint64_t *)&self->fHarvestSettings, 0);
  p_subHarvesters = &self->_subHarvesters;
  sub_1002A3684((void ***)&p_subHarvesters);
  sub_100261F44((uint64_t)&self->_policyProactive);
  sub_100261F44((uint64_t)&self->_policyTrip);
  sub_100261F44((uint64_t)&self->_monitorGps);
  sub_100261F44((uint64_t)&self->_harvestController);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 19) = 0;
  return self;
}

@end
