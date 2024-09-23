@implementation VKSharedResources

- (shared_ptr<md::TextureManager>)textureManager
{
  TextureManager **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<md::TextureManager> result;

  cntrl = self->_textureManager.__cntrl_;
  *v2 = self->_textureManager.__ptr_;
  v2[1] = (TextureManager *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (TextureManager *)self;
  return result;
}

- (shared_ptr<md::StylesheetVendor>)stylesheetVendor
{
  StylesheetVendor **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<md::StylesheetVendor> result;

  cntrl = self->_stylesheetVendor.__cntrl_;
  *v2 = self->_stylesheetVendor.__ptr_;
  v2[1] = (StylesheetVendor *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (StylesheetVendor *)self;
  return result;
}

- (void)grlIconManager
{
  return self->_grlIconManager.__ptr_;
}

- (void)grlFontManager
{
  return &self->_grlFontManager;
}

- (shared_ptr<md::MaterialTextureManager>)materialTextureManager
{
  MaterialTextureManager **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<md::MaterialTextureManager> result;

  cntrl = self->_materialTextureManager.__cntrl_;
  *v2 = self->_materialTextureManager.__ptr_;
  v2[1] = (MaterialTextureManager *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (MaterialTextureManager *)self;
  return result;
}

- (const)shaderLibrary
{
  return self->_shaderLibrary.__ptr_;
}

- (void)distanceAtlas
{
  return self->_distanceAtlas.__ptr_.__value_;
}

- (void)isoAlphaAtlas
{
  return self->_isoAlphaAtlas.__ptr_.__value_;
}

- (void)gglDevice
{
  return (void *)*((_QWORD *)self->_device.__ptr_.__value_ + 1);
}

- (void)_addResourceUser
{
  ++self->_referenceCount;
}

- (void)frameDidComplete:(unint64_t)a3
{
  SharedResourcesManager *value;
  uint64_t v4;
  char v5;
  std::__shared_mutex_base *v6;
  char v7;

  value = self->_sharedResourceManager.__ptr_.__value_;
  md::SharedResourcesManager::getReferencesForFrameStamp((md::SharedResourcesManager *)&v4, (std::__shared_mutex_base *)value, a3, 0);
  if (v5)
    md::SharedResourcesManager::FrameReferences::clear((std::__shared_mutex_base *)((char *)value + 208 * v4 + 304));
  if (v7)
    std::__shared_mutex_base::unlock_shared(v6);
}

- (void)alphaAtlas
{
  return self->_alphaAtlas.__ptr_.__value_;
}

- (shared_ptr<md::StandardCommandBufferSelector>)standardCommandBufferSelector
{
  StandardCommandBufferSelector **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<md::StandardCommandBufferSelector> result;

  cntrl = self->_standardCommandBufferSelector.__cntrl_;
  *v2 = self->_standardCommandBufferSelector.__ptr_;
  v2[1] = (StandardCommandBufferSelector *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (StandardCommandBufferSelector *)self;
  return result;
}

- (unint64_t)globalFrameStamp
{
  atomic<unsigned long> *p_globalFrameStamp;
  unint64_t v3;
  unint64_t result;

  p_globalFrameStamp = &self->_globalFrameStamp;
  do
  {
    v3 = __ldaxr(&p_globalFrameStamp->__a_.__a_value);
    result = v3 + 1;
  }
  while (__stlxr(v3 + 1, &p_globalFrameStamp->__a_.__a_value));
  return result;
}

- (void)highInflationAlphaAtlas
{
  return self->_highInflationAlphaAtlas.__ptr_.__value_;
}

- (id)_initWithDevice:(void *)a3 standardLibrary:(const void *)a4
{
  VKSharedResources *v5;
  VKSharedResources *v6;
  Device *value;
  md::SharedDeviceResources *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  VKResourceManager *v12;
  VKResourceManager *v13;
  uint64_t v14;
  md::SharedResourcesManager *v15;
  VKResourceManager *v16;
  uint64_t v17;
  SharedResourcesManager *v18;
  char *v19;
  VKResourceManager *v20;
  geo::read_write_lock *v21;
  const char *v22;
  geo::read_write_lock *v23;
  const char *v24;
  VKResourceManager *v25;
  char *v26;
  unint64_t *v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  std::__shared_weak_count *v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;
  char *v34;
  unint64_t v35;
  int shared_owners_high;
  int shared_owners;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  std::__shared_weak_count *v44;
  unint64_t *v45;
  std::__shared_weak_count *v46;
  _QWORD *v47;
  _QWORD *v48;
  _QWORD *v49;
  char *v50;
  unint64_t v51;
  int v52;
  int v53;
  unint64_t v54;
  __int128 v55;
  unint64_t *v56;
  unint64_t v57;
  unint64_t v58;
  std::__shared_weak_count *v59;
  unint64_t *v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  std::__shared_weak_count *v70;
  unint64_t *v71;
  unint64_t v72;
  unint64_t v73;
  std::__shared_weak_count *v74;
  unint64_t *v75;
  unint64_t v76;
  unint64_t v77;
  std::__shared_weak_count *v78;
  unint64_t *v79;
  unint64_t v80;
  unint64_t v81;
  std::__shared_weak_count *v82;
  unint64_t *v83;
  unint64_t v84;
  unint64_t v85;
  std::__shared_weak_count *v86;
  unint64_t *v87;
  unint64_t v88;
  unint64_t v89;
  std::__shared_weak_count *v90;
  unint64_t *v91;
  unint64_t v92;
  unint64_t v93;
  std::__shared_weak_count *v94;
  unint64_t *v95;
  unint64_t v96;
  _QWORD *v97;
  uint64_t v98;
  std::__shared_weak_count *v99;
  unint64_t *v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  void *v104;
  std::__shared_weak_count *size;
  id *v106;
  unint64_t *v107;
  unint64_t v108;
  std::__shared_weak_count *cntrl;
  unint64_t *v110;
  unint64_t v111;
  VKResourceManager *v112;
  uint64_t v113;
  TextureManager *ptr;
  SharedResourcesManager *v115;
  char *v116;
  VKResourceManager *v117;
  geo::read_write_lock *v118;
  const char *v119;
  VKResourceManager *v120;
  VKResourceManager *v121;
  uint64_t v122;
  unint64_t *v123;
  unint64_t v124;
  std::__shared_weak_count *v125;
  unint64_t *v126;
  unint64_t v127;
  id v128;
  shared_ptr<md::StylesheetVendor> v129;
  std::__shared_weak_count *v130;
  unint64_t *v131;
  unint64_t v132;
  std::__shared_weak_count *v133;
  unint64_t *v134;
  unint64_t v135;
  _QWORD *v136;
  id v137;
  void **v138;
  void *v139;
  void *v140;
  const void *v141;
  unint64_t v142;
  std::string::size_type v143;
  std::string *p_dst;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  std::ios_base *v151;
  __int128 *v152;
  VKResourceManager **v153;
  VKResourceManager **v154;
  void *v155;
  std::string::size_type j;
  VKResourceManager **v157;
  uint64_t v158;
  uint64_t *v159;
  uint64_t *v160;
  uint64_t *v161;
  uint64_t *v162;
  uint64_t *v163;
  uint64_t *v164;
  uint64_t *v165;
  uint64_t *v166;
  uint64_t *v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  std::string::size_type v171;
  std::string *v172;
  uint64_t v173;
  std::string::size_type v174;
  std::string *v175;
  uint64_t v176;
  std::string::size_type v177;
  std::string *p_p;
  uint64_t v179;
  std::string::size_type v180;
  std::string *v181;
  uint64_t v182;
  std::string *v183;
  int v184;
  float v185;
  float v186;
  float v187;
  float v188;
  float v189;
  std::string::size_type v190;
  unsigned int v191;
  float v192;
  unsigned int v193;
  float v194;
  float v195;
  float v196;
  float v197;
  float v198;
  std::string *v199;
  float v200;
  float v201;
  float v202;
  std::string::size_type v203;
  unsigned int v204;
  float v205;
  unsigned int v206;
  float v207;
  float v208;
  float v209;
  float v210;
  float v211;
  unint64_t v212;
  uint64_t *v213;
  _QWORD *v214;
  uint64_t *v215;
  unint64_t v216;
  unint64_t v217;
  unint64_t v218;
  unint64_t v219;
  char *v220;
  char *v221;
  char *v222;
  __int128 v223;
  __int128 v224;
  char *v225;
  std::__shared_weak_count *v226;
  unint64_t *v227;
  unint64_t v228;
  uint64_t v229;
  unsigned __int8 *v230;
  float v231;
  float v232;
  int v233;
  char *v234;
  std::__shared_weak_count *v235;
  unint64_t *v236;
  char *v237;
  int v238;
  uint64_t v239;
  __int128 v240;
  unint64_t *v241;
  unint64_t v242;
  int v243;
  unint64_t *v244;
  unint64_t v245;
  unint64_t v246;
  uint64_t v247;
  unint64_t *v248;
  unint64_t v249;
  std::__shared_weak_count *v250;
  unint64_t *v251;
  unint64_t v252;
  _QWORD *v253;
  uint64_t v254;
  void *v255;
  unint64_t v256;
  std::string::size_type v257;
  uint64_t v258;
  std::string::size_type v259;
  uint64_t v260;
  std::string::size_type v261;
  _QWORD *v262;
  uint64_t **v263;
  int v264;
  const std::string::value_type *v265;
  size_t v266;
  std::string::size_type v267;
  const void *v268;
  const void *v269;
  int v270;
  const void *v271;
  size_t v272;
  size_t v273;
  int v274;
  int v275;
  char *v276;
  std::string *v277;
  __int128 v278;
  uint64_t *v279;
  void **v280;
  void **v281;
  BOOL v282;
  char v283;
  __int128 v284;
  void *v285;
  size_t v286;
  std::string::size_type i;
  void **v288;
  std::string::size_type v289;
  uint64_t *v290;
  _QWORD *v291;
  uint64_t *v292;
  char *v293;
  std::string *v294;
  __int128 v295;
  std::string *v296;
  __int128 v297;
  std::string::size_type v298;
  VKResourceManager *isa;
  char *v300;
  uint64_t v301;
  char *v302;
  uint64_t v303;
  _BYTE *v304;
  int v305;
  uint64_t v306;
  int v307;
  uint64_t *v308;
  uint64_t v309;
  uint64_t v310;
  char *v311;
  uint64_t v312;
  _QWORD *v313;
  unint64_t v314;
  unint64_t v315;
  char *v316;
  char *v317;
  char *v318;
  std::string::size_type v319;
  VKResourceManager **v320;
  uint64_t v321;
  uint64_t *v322;
  _QWORD *v323;
  uint64_t **v324;
  uint64_t *v325;
  std::string *v326;
  __int128 v327;
  std::string *v328;
  __int128 v329;
  std::string::size_type v330;
  _QWORD *v331;
  _QWORD *v332;
  char *v333;
  VKResourceManager *v334;
  _QWORD *v335;
  uint64_t v336;
  VKResourceManager *v337;
  char *v338;
  VKResourceManager **v339;
  uint64_t v340;
  std::string::size_type v341;
  uint64_t v342;
  std::string::size_type v343;
  unint64_t v344;
  std::__shared_weak_count *v345;
  unint64_t *v346;
  unint64_t v347;
  AlphaAtlas *v348;
  uint64_t v349;
  uint64_t v350;
  ggl::IsoAlphaAtlas *v351;
  ggl::Device *v352;
  float v353;
  float v354;
  float v355;
  ggl::IsoAlphaAtlas *v356;
  IsoAlphaAtlas *v357;
  std::__shared_weak_count *v358;
  unint64_t *v359;
  unint64_t v360;
  uint64_t v361;
  uint64_t v362;
  ggl::IsoAlphaAtlas *v363;
  ggl::Device *v364;
  float v365;
  float v366;
  float v367;
  ggl::IsoAlphaAtlas *v368;
  IsoAlphaAtlas *v369;
  std::__shared_weak_count *v370;
  unint64_t *v371;
  unint64_t v372;
  uint64_t v373;
  uint64_t v374;
  std::__shared_weak_count *v375;
  unint64_t *v376;
  std::__shared_weak_count *v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  unint64_t v382;
  float v383;
  unint64_t k;
  float v385;
  float v386;
  std::__shared_weak_count *v387;
  unint64_t *v388;
  uint64_t v389;
  unint64_t v390;
  int v391;
  int v392;
  unint64_t v393;
  unint64_t v394;
  uint64_t v395;
  unint64_t v396;
  std::__shared_weak_count *v397;
  unint64_t *v398;
  unint64_t v399;
  _QWORD *v400;
  uint64_t v401;
  uint64_t v402;
  std::string::size_type v403;
  uint64_t v404;
  std::string::size_type v405;
  unint64_t v406;
  unint64_t v407;
  DistanceAtlas *v408;
  uint64_t v409;
  uint64_t v410;
  StandardLibrary *v411;
  unint64_t *v412;
  unint64_t v413;
  std::__shared_weak_count *v414;
  unint64_t *v415;
  unint64_t v416;
  _QWORD *v417;
  md::GeoResourceProvider *v418;
  std::__shared_weak_count *v419;
  unint64_t *v420;
  unint64_t v421;
  uint64_t v422;
  uint64_t v423;
  __shared_weak_count *v424;
  unint64_t *v425;
  unint64_t v426;
  __shared_weak_count *v427;
  std::__shared_weak_count *v428;
  unint64_t *v429;
  unint64_t v430;
  std::__shared_weak_count *v431;
  unint64_t *v432;
  unint64_t v433;
  _QWORD *v434;
  std::__shared_weak_count *v435;
  unint64_t *v436;
  unint64_t v437;
  VKInternalIconManager *v438;
  __shared_weak_count *v439;
  unint64_t *v440;
  unint64_t v441;
  __shared_weak_count *v442;
  unint64_t *v443;
  unint64_t v444;
  id v445;
  id v446;
  std::__shared_weak_count *v447;
  unint64_t *v448;
  unint64_t v449;
  std::__shared_weak_count *v450;
  unint64_t *v451;
  unint64_t v452;
  uint64_t v453;
  char v454;
  __shared_weak_count *v455;
  std::__shared_weak_count *v456;
  unint64_t *v457;
  unint64_t v458;
  uint64_t v459;
  char v460;
  __shared_weak_count *v461;
  std::__shared_weak_count *v462;
  unint64_t *v463;
  unint64_t v464;
  id v466;
  id v467;
  void *v468;
  VKSharedResources *v470;
  uint64_t **v471;
  VKResourceManager **v472;
  VKResourceManager **v473;
  _QWORD *v474;
  _QWORD v475[5];
  _QWORD v476[3];
  VKResourceManager **p_obj;
  __int128 v478;
  StylesheetVendor *v479;
  std::__shared_weak_count *v480;
  IconManager *v481;
  std::__shared_weak_count *v482;
  objc_super v483;
  void *v484[2];
  char v485;
  unsigned int v486;
  std::string v487;
  std::string v488;
  std::string v489;
  std::string __p;
  std::string __dst;
  std::string v492;
  _BYTE v493[32];
  __int128 v494;
  __int128 v495;
  __int128 v496;
  void *v497[2];
  __int128 v498;
  int v499;
  _QWORD v500[23];

  v500[20] = *MEMORY[0x1E0C80C00];
  v483.receiver = self;
  v483.super_class = (Class)VKSharedResources;
  v5 = -[VKSharedResources init](&v483, sel_init);

  v6 = 0;
  if (!a3 || !v5)
    goto LABEL_666;
  value = v5->_device.__ptr_.__value_;
  v5->_device.__ptr_.__value_ = (Device *)a3;
  if (value)
  {
    v8 = (md::SharedDeviceResources *)*((_QWORD *)value + 3);
    *((_QWORD *)value + 3) = 0;
    if (v8)
    {
      md::SharedDeviceResources::~SharedDeviceResources(v8);
      MEMORY[0x1A1AF4E00]();
    }
    v9 = (std::__shared_weak_count *)*((_QWORD *)value + 2);
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
    MEMORY[0x1A1AF4E00](value, 0x1020C40E72D6CFBLL);
  }
  v470 = v5;
  v12 = objc_alloc_init(VKResourceManager);
  v13 = v12;
  objc_storeStrong((id *)&v5->_resourceManager._obj, v12);

  v14 = operator new();
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)v14);
  *(_QWORD *)(v14 + 168) = 0;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)(v14 + 304));
  *(_OWORD *)(v14 + 488) = 0u;
  *(_OWORD *)(v14 + 472) = 0u;
  *(_DWORD *)(v14 + 504) = 1065353216;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)(v14 + 512));
  *(_OWORD *)(v14 + 696) = 0u;
  *(_OWORD *)(v14 + 680) = 0u;
  *(_DWORD *)(v14 + 712) = 1065353216;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)(v14 + 720));
  *(_OWORD *)(v14 + 904) = 0u;
  *(_OWORD *)(v14 + 888) = 0u;
  *(_DWORD *)(v14 + 920) = 1065353216;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)(v14 + 928));
  *(_OWORD *)(v14 + 1112) = 0u;
  *(_OWORD *)(v14 + 1096) = 0u;
  *(_DWORD *)(v14 + 1128) = 1065353216;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)(v14 + 1136));
  *(_OWORD *)(v14 + 1320) = 0u;
  *(_OWORD *)(v14 + 1304) = 0u;
  *(_DWORD *)(v14 + 1336) = 1065353216;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)(v14 + 1344));
  *(_OWORD *)(v14 + 1528) = 0u;
  *(_OWORD *)(v14 + 1512) = 0u;
  *(_DWORD *)(v14 + 1544) = 1065353216;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)(v14 + 1552));
  *(_OWORD *)(v14 + 1736) = 0u;
  *(_OWORD *)(v14 + 1720) = 0u;
  *(_DWORD *)(v14 + 1752) = 1065353216;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)(v14 + 1760));
  *(_OWORD *)(v14 + 1944) = 0u;
  *(_OWORD *)(v14 + 1928) = 0u;
  *(_DWORD *)(v14 + 1960) = 1065353216;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)(v14 + 1968));
  *(_OWORD *)(v14 + 2152) = 0u;
  *(_OWORD *)(v14 + 2136) = 0u;
  *(_DWORD *)(v14 + 2168) = 1065353216;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)(v14 + 2176));
  *(_OWORD *)(v14 + 2360) = 0u;
  *(_OWORD *)(v14 + 2344) = 0u;
  *(_DWORD *)(v14 + 2376) = 1065353216;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)(v14 + 2384));
  *(_OWORD *)(v14 + 2568) = 0u;
  *(_OWORD *)(v14 + 2552) = 0u;
  *(_DWORD *)(v14 + 2584) = 1065353216;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)(v14 + 2592));
  *(_OWORD *)(v14 + 2776) = 0u;
  *(_OWORD *)(v14 + 2760) = 0u;
  *(_DWORD *)(v14 + 2792) = 1065353216;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)(v14 + 2800));
  *(_OWORD *)(v14 + 2984) = 0u;
  *(_OWORD *)(v14 + 2968) = 0u;
  *(_DWORD *)(v14 + 3000) = 1065353216;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)(v14 + 3008));
  *(_OWORD *)(v14 + 3192) = 0u;
  *(_OWORD *)(v14 + 3176) = 0u;
  *(_DWORD *)(v14 + 3208) = 1065353216;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)(v14 + 3216));
  *(_OWORD *)(v14 + 3400) = 0u;
  *(_OWORD *)(v14 + 3384) = 0u;
  *(_DWORD *)(v14 + 3416) = 1065353216;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)(v14 + 3424));
  *(_OWORD *)(v14 + 3608) = 0u;
  *(_OWORD *)(v14 + 3592) = 0u;
  *(_DWORD *)(v14 + 3624) = 1065353216;
  *(_OWORD *)(v14 + 176) = 0u;
  *(_OWORD *)(v14 + 192) = 0u;
  *(_OWORD *)(v14 + 208) = 0u;
  *(_OWORD *)(v14 + 224) = 0u;
  *(_OWORD *)(v14 + 240) = 0u;
  *(_OWORD *)(v14 + 256) = 0u;
  *(_OWORD *)(v14 + 272) = 0u;
  *(_OWORD *)(v14 + 288) = 0u;
  v15 = (md::SharedResourcesManager *)v5->_sharedResourceManager.__ptr_.__value_;
  v5->_sharedResourceManager.__ptr_.__value_ = (SharedResourcesManager *)v14;
  if (v15)
  {
    md::SharedResourcesManager::~SharedResourcesManager(v15);
    MEMORY[0x1A1AF4E00]();
  }
  v16 = v5->_resourceManager._obj;
  v17 = *((_QWORD *)v5->_device.__ptr_.__value_ + 1);
  v18 = v5->_sharedResourceManager.__ptr_.__value_;
  v475[2] = v16;
  v19 = (char *)operator new(0x260uLL);
  *((_QWORD *)v19 + 1) = 0;
  *((_QWORD *)v19 + 2) = 0;
  *(_QWORD *)v19 = &off_1E42DB2E8;
  v20 = v16;
  *(_OWORD *)(v19 + 88) = 0u;
  *(_OWORD *)(v19 + 24) = 0u;
  *(_OWORD *)(v19 + 40) = 0u;
  *(_OWORD *)(v19 + 56) = 0u;
  *(_OWORD *)(v19 + 72) = 0u;
  *(_OWORD *)(v19 + 104) = 0u;
  *(_OWORD *)(v19 + 120) = 0u;
  *(_OWORD *)(v19 + 136) = 0u;
  *(_OWORD *)(v19 + 152) = 0u;
  *(_OWORD *)(v19 + 168) = 0u;
  *(_OWORD *)(v19 + 184) = 0u;
  *(_OWORD *)(v19 + 200) = 0u;
  *(_OWORD *)(v19 + 216) = 0u;
  *(_OWORD *)(v19 + 232) = 0u;
  *(_OWORD *)(v19 + 248) = 0u;
  *((_QWORD *)v19 + 35) = 0;
  *(_OWORD *)(v19 + 264) = 0u;
  v476[0] = v20;
  v21 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v19 + 88), 0);
  if ((_DWORD)v21)
    geo::read_write_lock::logFailure(v21, (uint64_t)"initialization", v22);
  *((_QWORD *)v19 + 60) = 0;
  *((_OWORD *)v19 + 28) = 0u;
  *((_OWORD *)v19 + 29) = 0u;
  *((_OWORD *)v19 + 26) = 0u;
  *((_OWORD *)v19 + 27) = 0u;
  *((_OWORD *)v19 + 24) = 0u;
  *((_OWORD *)v19 + 25) = 0u;
  *((_OWORD *)v19 + 22) = 0u;
  *((_OWORD *)v19 + 23) = 0u;
  *((_OWORD *)v19 + 20) = 0u;
  *((_OWORD *)v19 + 21) = 0u;
  *((_OWORD *)v19 + 18) = 0u;
  *((_OWORD *)v19 + 19) = 0u;
  v475[3] = v19 + 88;
  v23 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v19 + 288), 0);
  if ((_DWORD)v23)
    geo::read_write_lock::logFailure(v23, (uint64_t)"initialization", v24);
  *(_OWORD *)(v19 + 488) = 0u;
  *(_OWORD *)(v19 + 504) = 0u;
  *((_DWORD *)v19 + 130) = 1065353216;
  *((_OWORD *)v19 + 33) = 0u;
  *((_OWORD *)v19 + 34) = 0u;
  *((_DWORD *)v19 + 140) = 1065353216;
  v25 = v20;
  *((_QWORD *)v19 + 71) = &off_1E42B4D10;
  *(_QWORD *)&v478 = v25;
  *((_QWORD *)v19 + 72) = v25;
  *((_QWORD *)v19 + 74) = v17;
  *((_QWORD *)v19 + 75) = v18;
  v475[0] = v19 + 24;
  v475[1] = v19 + 288;
  v26 = (char *)operator new(0x58uLL);
  v476[1] = v19 + 24;
  p_obj = &v5->_resourceManager._obj;
  *((_QWORD *)v26 + 1) = 0;
  v27 = (unint64_t *)(v26 + 8);
  *((_QWORD *)v26 + 2) = 0;
  *(_QWORD *)v26 = &off_1E42DED18;
  *((_QWORD *)v26 + 3) = &off_1E42B63B0;
  *((_QWORD *)v26 + 5) = 0;
  *((_QWORD *)v26 + 6) = 0;
  *((_QWORD *)v26 + 4) = 0;
  *((_DWORD *)v26 + 14) = 0;
  *(_OWORD *)(v26 + 60) = xmmword_19FFB2E40;
  *(_QWORD *)(v26 + 76) = 0x100000000;
  *((_DWORD *)v26 + 21) = 0;
  v492.__r_.__value_.__r.__words[0] = (std::string::size_type)(v26 + 24);
  v492.__r_.__value_.__l.__size_ = (std::string::size_type)v26;
  v28 = (std::__shared_weak_count *)operator new(0x60uLL);
  v28->__shared_owners_ = 0;
  v29 = (unint64_t *)&v28->__shared_owners_;
  v28->__shared_weak_owners_ = 0;
  v28->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42DEFB8;
  v30 = v28 + 1;
  v31 = ggl::TextureData2D::TextureData2D((uint64_t)&v28[1], 1, 1, 1u, 12, 0);
  *(_BYTE *)((uint64_t (*)(_QWORD *, _QWORD))v28[1].__on_zero_shared)(v31, 0) = -1;
  *(_BYTE *)(((uint64_t (*)(std::__shared_weak_count *, _QWORD))v30->__on_zero_shared)(v30, 0) + 1) = -1;
  *(_BYTE *)(((uint64_t (*)(std::__shared_weak_count *, _QWORD))v30->__on_zero_shared)(v30, 0) + 2) = -1;
  *(_BYTE *)(((uint64_t (*)(std::__shared_weak_count *, _QWORD))v30->__on_zero_shared)(v30, 0) + 3) = -1;
  v32 = operator new(0xB0uLL);
  v33 = v32;
  v32[1] = 0;
  v32[2] = 0;
  *v32 = &off_1E42E53B0;
  v34 = (char *)(v32 + 3);
  do
    v35 = __ldxr(v29);
  while (__stxr(v35 + 1, v29));
  v32[13] = 0;
  shared_owners = v28[1].__shared_owners_;
  shared_owners_high = HIDWORD(v28[1].__shared_owners_);
  *((_DWORD *)v32 + 22) = 0;
  *((_DWORD *)v32 + 23) = shared_owners_high;
  v32[8] = &unk_1E42BE458;
  v32[9] = "";
  v32[5] = 0;
  v32[6] = 0;
  *((_DWORD *)v32 + 14) = 0;
  v32[10] = 0x100000001;
  v32[12] = 0x100000001;
  v32[14] = 0;
  v32[15] = 0;
  v32[3] = &off_1E42BE438;
  v32[4] = 0;
  *((_DWORD *)v32 + 32) = shared_owners;
  v32[17] = v30;
  v32[18] = v28;
  do
    v38 = __ldxr(v29);
  while (__stxr(v38 + 1, v29));
  *((_WORD *)v32 + 76) = 0;
  *((_BYTE *)v32 + 154) = 1;
  v32[20] = v26 + 24;
  v32[21] = v26;
  do
    v39 = __ldxr(v27);
  while (__stxr(v39 + 1, v27));
  v32[13] = v28[1].__shared_weak_owners_;
  do
    v40 = __ldaxr(v29);
  while (__stlxr(v40 - 1, v29));
  if (!v40)
  {
    ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
    std::__shared_weak_count::__release_weak(v28);
  }
  v41 = (std::__shared_weak_count *)*((_QWORD *)v19 + 4);
  *((_QWORD *)v19 + 3) = v34;
  *((_QWORD *)v19 + 4) = v33;
  if (v41)
  {
    v42 = (unint64_t *)&v41->__shared_owners_;
    do
      v43 = __ldaxr(v42);
    while (__stlxr(v43 - 1, v42));
    if (!v43)
    {
      ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
      std::__shared_weak_count::__release_weak(v41);
    }
  }
  v44 = (std::__shared_weak_count *)operator new(0x60uLL);
  v44->__shared_owners_ = 0;
  v45 = (unint64_t *)&v44->__shared_owners_;
  v44->__shared_weak_owners_ = 0;
  v44->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42DEFB8;
  v46 = v44 + 1;
  v47 = ggl::TextureData2D::TextureData2D((uint64_t)&v44[1], 1, 1, 1u, 12, 0);
  *(_BYTE *)((uint64_t (*)(_QWORD *, _QWORD))v44[1].__on_zero_shared)(v47, 0) = 0;
  *(_BYTE *)(((uint64_t (*)(std::__shared_weak_count *, _QWORD))v46->__on_zero_shared)(v46, 0) + 1) = 0;
  *(_BYTE *)(((uint64_t (*)(std::__shared_weak_count *, _QWORD))v46->__on_zero_shared)(v46, 0) + 2) = 0;
  *(_BYTE *)(((uint64_t (*)(std::__shared_weak_count *, _QWORD))v46->__on_zero_shared)(v46, 0) + 3) = 0;
  v48 = operator new(0xB0uLL);
  v49 = v48;
  v48[1] = 0;
  v48[2] = 0;
  v50 = (char *)(v48 + 3);
  *v48 = &off_1E42E53B0;
  do
    v51 = __ldxr(v45);
  while (__stxr(v51 + 1, v45));
  v48[13] = 0;
  v53 = v44[1].__shared_owners_;
  v52 = HIDWORD(v44[1].__shared_owners_);
  *((_DWORD *)v48 + 22) = 0;
  *((_DWORD *)v48 + 23) = v52;
  v48[8] = &unk_1E42BE458;
  v48[9] = "";
  v48[5] = 0;
  v48[6] = 0;
  *((_DWORD *)v48 + 14) = 0;
  v48[10] = 0x100000001;
  v48[12] = 0x100000001;
  v48[14] = 0;
  v48[15] = 0;
  v48[3] = &off_1E42BE438;
  v48[4] = 0;
  *((_DWORD *)v48 + 32) = v53;
  v48[17] = v46;
  v48[18] = v44;
  do
    v54 = __ldxr(v45);
  while (__stxr(v54 + 1, v45));
  *((_WORD *)v48 + 76) = 0;
  *((_BYTE *)v48 + 154) = 1;
  v55 = *(_OWORD *)&v492.__r_.__value_.__l.__data_;
  *((_OWORD *)v48 + 10) = *(_OWORD *)&v492.__r_.__value_.__l.__data_;
  if (*((_QWORD *)&v55 + 1))
  {
    v56 = (unint64_t *)(*((_QWORD *)&v55 + 1) + 8);
    do
      v57 = __ldxr(v56);
    while (__stxr(v57 + 1, v56));
  }
  v48[13] = v44[1].__shared_weak_owners_;
  do
    v58 = __ldaxr(v45);
  while (__stlxr(v58 - 1, v45));
  if (!v58)
  {
    ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
    std::__shared_weak_count::__release_weak(v44);
  }
  v59 = (std::__shared_weak_count *)*((_QWORD *)v19 + 6);
  *((_QWORD *)v19 + 5) = v50;
  *((_QWORD *)v19 + 6) = v49;
  if (v59)
  {
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
  v496 = 0u;
  *(_OWORD *)v497 = 0u;
  v494 = 0u;
  v495 = 0u;
  memset(v493, 0, sizeof(v493));
  do
    v62 = __ldxr(v29);
  while (__stxr(v62 + 1, v29));
  *(_QWORD *)v493 = v28 + 1;
  *(_QWORD *)&v493[8] = v28;
  do
    v63 = __ldxr(v29);
  while (__stxr(v63 + 1, v29));
  *(_QWORD *)&v493[16] = v28 + 1;
  *(_QWORD *)&v493[24] = v28;
  do
    v64 = __ldxr(v29);
  while (__stxr(v64 + 1, v29));
  *(_QWORD *)&v494 = v28 + 1;
  *((_QWORD *)&v494 + 1) = v28;
  do
    v65 = __ldxr(v29);
  while (__stxr(v65 + 1, v29));
  *(_QWORD *)&v495 = v28 + 1;
  *((_QWORD *)&v495 + 1) = v28;
  do
    v66 = __ldxr(v29);
  while (__stxr(v66 + 1, v29));
  *(_QWORD *)&v496 = v28 + 1;
  *((_QWORD *)&v496 + 1) = v28;
  do
    v67 = __ldxr(v29);
  while (__stxr(v67 + 1, v29));
  v497[0] = &v28[1];
  v497[1] = v28;
  v68 = operator new(0xF8uLL);
  v68[1] = 0;
  v68[2] = 0;
  *v68 = &off_1E42DEAB0;
  v69 = ggl::TextureCube::TextureCube((uint64_t)(v68 + 3), v493, &v492);
  v70 = (std::__shared_weak_count *)*((_QWORD *)v19 + 8);
  *((_QWORD *)v19 + 7) = v69;
  *((_QWORD *)v19 + 8) = v68;
  if (v70)
  {
    v71 = (unint64_t *)&v70->__shared_owners_;
    do
      v72 = __ldaxr(v71);
    while (__stlxr(v72 - 1, v71));
    if (!v72)
    {
      ((void (*)(std::__shared_weak_count *))v70->__on_zero_shared)(v70);
      std::__shared_weak_count::__release_weak(v70);
    }
  }
  do
    v73 = __ldxr(v45);
  while (__stxr(v73 + 1, v45));
  v74 = *(std::__shared_weak_count **)&v493[8];
  *(_QWORD *)v493 = v44 + 1;
  *(_QWORD *)&v493[8] = v44;
  if (v74)
  {
    v75 = (unint64_t *)&v74->__shared_owners_;
    do
      v76 = __ldaxr(v75);
    while (__stlxr(v76 - 1, v75));
    if (!v76)
    {
      ((void (*)(std::__shared_weak_count *))v74->__on_zero_shared)(v74);
      std::__shared_weak_count::__release_weak(v74);
    }
  }
  do
    v77 = __ldxr(v45);
  while (__stxr(v77 + 1, v45));
  v78 = *(std::__shared_weak_count **)&v493[24];
  *(_QWORD *)&v493[16] = v44 + 1;
  *(_QWORD *)&v493[24] = v44;
  if (v78)
  {
    v79 = (unint64_t *)&v78->__shared_owners_;
    do
      v80 = __ldaxr(v79);
    while (__stlxr(v80 - 1, v79));
    if (!v80)
    {
      ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
      std::__shared_weak_count::__release_weak(v78);
    }
  }
  do
    v81 = __ldxr(v45);
  while (__stxr(v81 + 1, v45));
  v82 = (std::__shared_weak_count *)*((_QWORD *)&v494 + 1);
  *(_QWORD *)&v494 = v44 + 1;
  *((_QWORD *)&v494 + 1) = v44;
  if (v82)
  {
    v83 = (unint64_t *)&v82->__shared_owners_;
    do
      v84 = __ldaxr(v83);
    while (__stlxr(v84 - 1, v83));
    if (!v84)
    {
      ((void (*)(std::__shared_weak_count *))v82->__on_zero_shared)(v82);
      std::__shared_weak_count::__release_weak(v82);
    }
  }
  do
    v85 = __ldxr(v45);
  while (__stxr(v85 + 1, v45));
  v86 = (std::__shared_weak_count *)*((_QWORD *)&v495 + 1);
  *(_QWORD *)&v495 = v44 + 1;
  *((_QWORD *)&v495 + 1) = v44;
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
  do
    v89 = __ldxr(v45);
  while (__stxr(v89 + 1, v45));
  v90 = (std::__shared_weak_count *)*((_QWORD *)&v496 + 1);
  *(_QWORD *)&v496 = v44 + 1;
  *((_QWORD *)&v496 + 1) = v44;
  if (v90)
  {
    v91 = (unint64_t *)&v90->__shared_owners_;
    do
      v92 = __ldaxr(v91);
    while (__stlxr(v92 - 1, v91));
    if (!v92)
    {
      ((void (*)(std::__shared_weak_count *))v90->__on_zero_shared)(v90);
      std::__shared_weak_count::__release_weak(v90);
    }
  }
  do
    v93 = __ldxr(v45);
  while (__stxr(v93 + 1, v45));
  v94 = (std::__shared_weak_count *)v497[1];
  v497[0] = &v44[1];
  v497[1] = v44;
  if (v94)
  {
    v95 = (unint64_t *)&v94->__shared_owners_;
    do
      v96 = __ldaxr(v95);
    while (__stlxr(v96 - 1, v95));
    if (!v96)
    {
      ((void (*)(std::__shared_weak_count *))v94->__on_zero_shared)(v94);
      std::__shared_weak_count::__release_weak(v94);
    }
  }
  v97 = operator new(0xF8uLL);
  v97[2] = 0;
  *v97 = &off_1E42DEAB0;
  v97[1] = 0;
  v98 = ggl::TextureCube::TextureCube((uint64_t)(v97 + 3), v493, &v492);
  v99 = (std::__shared_weak_count *)*((_QWORD *)v19 + 10);
  *((_QWORD *)v19 + 9) = v98;
  *((_QWORD *)v19 + 10) = v97;
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
  md::realistic::RoadRenderLayer::RoadModelPipelineStates::~RoadModelPipelineStates((md::realistic::RoadRenderLayer::RoadModelPipelineStates *)v493);
  do
    v102 = __ldaxr(v45);
  while (__stlxr(v102 - 1, v45));
  if (!v102)
  {
    ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
    std::__shared_weak_count::__release_weak(v44);
  }
  do
    v103 = __ldaxr(v29);
  while (__stlxr(v103 - 1, v29));
  v104 = (void *)v478;
  if (!v103)
  {
    ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
    std::__shared_weak_count::__release_weak(v28);
  }
  size = (std::__shared_weak_count *)v492.__r_.__value_.__l.__size_;
  v106 = (id *)p_obj;
  if (v492.__r_.__value_.__l.__size_)
  {
    v107 = (unint64_t *)(v492.__r_.__value_.__l.__size_ + 8);
    do
      v108 = __ldaxr(v107);
    while (__stlxr(v108 - 1, v107));
    if (!v108)
    {
      ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
      std::__shared_weak_count::__release_weak(size);
    }
  }

  cntrl = (std::__shared_weak_count *)v470->_textureManager.__cntrl_;
  v470->_textureManager.__ptr_ = (TextureManager *)v476[1];
  v470->_textureManager.__cntrl_ = (__shared_weak_count *)v19;
  if (cntrl)
  {
    v110 = (unint64_t *)&cntrl->__shared_owners_;
    do
      v111 = __ldaxr(v110);
    while (__stlxr(v111 - 1, v110));
    if (!v111)
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
  }

  v112 = v470->_resourceManager._obj;
  v113 = *((_QWORD *)v470->_device.__ptr_.__value_ + 1);
  ptr = v470->_textureManager.__ptr_;
  v115 = v470->_sharedResourceManager.__ptr_.__value_;
  v116 = (char *)operator new(0x168uLL);
  *((_QWORD *)v116 + 1) = 0;
  *((_QWORD *)v116 + 2) = 0;
  *(_QWORD *)v116 = &off_1E42DCA88;
  v117 = v112;
  *(_OWORD *)(v116 + 24) = 0u;
  *(_OWORD *)(v116 + 40) = 0u;
  *(_OWORD *)(v116 + 56) = 0u;
  *(_OWORD *)(v116 + 72) = 0u;
  *(_OWORD *)(v116 + 88) = 0u;
  *(_OWORD *)(v116 + 104) = 0u;
  *(_OWORD *)(v116 + 120) = 0u;
  *(_OWORD *)(v116 + 136) = 0u;
  *(_OWORD *)(v116 + 152) = 0u;
  *(_OWORD *)(v116 + 168) = 0u;
  *(_OWORD *)(v116 + 184) = 0u;
  *(_OWORD *)(v116 + 200) = 0u;
  *((_QWORD *)v116 + 27) = 0;
  v118 = (geo::read_write_lock *)pthread_rwlock_init((pthread_rwlock_t *)(v116 + 24), 0);
  if ((_DWORD)v118)
    geo::read_write_lock::logFailure(v118, (uint64_t)"initialization", v119);
  *((_OWORD *)v116 + 14) = 0u;
  *((_OWORD *)v116 + 15) = 0u;
  *((_DWORD *)v116 + 64) = 1065353216;
  *(_OWORD *)(v116 + 264) = 0u;
  *(_OWORD *)(v116 + 280) = 0u;
  *((_DWORD *)v116 + 74) = 1065353216;
  v120 = v117;
  v121 = v120;
  *((_QWORD *)v116 + 38) = &off_1E42B4D10;
  *((_QWORD *)v116 + 39) = v120;
  *((_QWORD *)v116 + 41) = v113;
  *((_QWORD *)v116 + 42) = *(_QWORD *)ptr;
  v122 = *((_QWORD *)ptr + 1);
  *((_QWORD *)v116 + 43) = v122;
  if (v122)
  {
    v123 = (unint64_t *)(v122 + 8);
    do
      v124 = __ldxr(v123);
    while (__stxr(v124 + 1, v123));
  }
  *((_QWORD *)v116 + 44) = v115;

  v125 = (std::__shared_weak_count *)v470->_materialTextureManager.__cntrl_;
  v470->_materialTextureManager.__ptr_ = (MaterialTextureManager *)(v116 + 24);
  v470->_materialTextureManager.__cntrl_ = (__shared_weak_count *)v116;
  if (v125)
  {
    v126 = (unint64_t *)&v125->__shared_owners_;
    do
      v127 = __ldaxr(v126);
    while (__stlxr(v127 - 1, v126));
    if (!v127)
    {
      ((void (*)(std::__shared_weak_count *))v125->__on_zero_shared)(v125);
      std::__shared_weak_count::__release_weak(v125);
    }
  }

  v128 = *v106;
  std::allocate_shared[abi:nn180100]<md::StylesheetVendor,std::allocator<md::StylesheetVendor>,VKResourceManager * {__strong},void>(v493, v128);
  v129 = *(shared_ptr<md::StylesheetVendor> *)v493;
  *(_OWORD *)v493 = 0uLL;
  v130 = (std::__shared_weak_count *)v470->_stylesheetVendor.__cntrl_;
  v470->_stylesheetVendor = v129;
  if (v130)
  {
    v131 = (unint64_t *)&v130->__shared_owners_;
    do
      v132 = __ldaxr(v131);
    while (__stlxr(v132 - 1, v131));
    if (!v132)
    {
      ((void (*)(std::__shared_weak_count *))v130->__on_zero_shared)(v130);
      std::__shared_weak_count::__release_weak(v130);
    }
  }
  v133 = *(std::__shared_weak_count **)&v493[8];
  if (*(_QWORD *)&v493[8])
  {
    v134 = (unint64_t *)(*(_QWORD *)&v493[8] + 8);
    do
      v135 = __ldaxr(v134);
    while (__stlxr(v135 - 1, v134));
    if (!v135)
    {
      ((void (*)(std::__shared_weak_count *))v133->__on_zero_shared)(v133);
      std::__shared_weak_count::__release_weak(v133);
    }
  }

  v466 = *v106;
  v136 = operator new(0x30uLL);
  v136[1] = 0;
  v136[2] = 0;
  *v136 = &off_1E42DC078;
  v485 = 7;
  strcpy((char *)v484, "default");
  v137 = v466;
  v136[3] = 0;
  v136[4] = 0;
  v136[5] = 0;
  v471 = (uint64_t **)(v136 + 3);
  v138 = v484;
  if (v485 < 0)
    v138 = (void **)v484[0];
  v474 = v136;
  v468 = v137;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s.csv"), v138, v466);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "dataForResourceWithName:", v139);
  v140 = (void *)objc_claimAutoreleasedReturnValue();

  v467 = objc_retainAutorelease(v140);
  v141 = (const void *)objc_msgSend(v467, "bytes");
  v142 = objc_msgSend(v467, "length");
  v143 = v142;
  if (v142 >= 0x7FFFFFFFFFFFFFF8)
    goto LABEL_667;
  if (v142 >= 0x17)
  {
    v145 = (v142 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v142 | 7) != 0x17)
      v145 = v142 | 7;
    v146 = v145 + 1;
    p_dst = (std::string *)operator new(v145 + 1);
    __dst.__r_.__value_.__l.__size_ = v143;
    __dst.__r_.__value_.__r.__words[2] = v146 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_153;
  }
  *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v142;
  p_dst = &__dst;
  if (v142)
LABEL_153:
    memcpy(p_dst, v141, v143);
  p_dst->__r_.__value_.__s.__data_[v143] = 0;
  v147 = MEMORY[0x1E0DE4FD8];
  v148 = MEMORY[0x1E0DE4FD8] + 64;
  v149 = *(_QWORD *)(MEMORY[0x1E0DE4F58] + 8);
  v150 = *(_QWORD *)(MEMORY[0x1E0DE4F58] + 16);
  v500[0] = MEMORY[0x1E0DE4FD8] + 64;
  *(_QWORD *)v493 = v149;
  *(_QWORD *)&v493[*(_QWORD *)(v149 - 24)] = v150;
  *(_QWORD *)&v493[8] = 0;
  v151 = (std::ios_base *)&v493[*(_QWORD *)(*(_QWORD *)v493 - 24)];
  std::ios_base::init(v151, &v493[16]);
  v151[1].__vftable = 0;
  v151[1].__fmtflags_ = -1;
  *(_QWORD *)v493 = v147 + 24;
  v500[0] = v148;
  std::streambuf::basic_streambuf();
  *(_QWORD *)&v493[16] = MEMORY[0x1E0DE4FB8] + 16;
  *(_OWORD *)v497 = 0u;
  v498 = 0u;
  v499 = 8;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__assign_no_alias<true>(v497, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)v497 = *(_OWORD *)&__dst.__r_.__value_.__l.__data_;
    *(_QWORD *)&v498 = *((_QWORD *)&__dst.__r_.__value_.__l + 2);
  }
  v475[2] = &v493[16];
  std::stringbuf::__init_buf_ptrs[abi:nn180100]((uint64_t)&v493[16]);
  parseUnnamedRow((std::string **)&__p, v493);
  v152 = &v494;
  if (!*(_DWORD *)((char *)&v494 + *(_QWORD *)(*(_QWORD *)v493 - 24)))
  {
    v476[0] = 0;
    v153 = 0;
    v154 = 0;
    *(_QWORD *)&v478 = &v489.__r_.__value_.__l.__size_;
    v475[3] = &v494;
    while (1)
    {
      parseUnnamedRow((std::string **)&v492, v493);
      v255 = (void *)v492.__r_.__value_.__r.__words[0];
      v256 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v492.__r_.__value_.__l.__size_ - v492.__r_.__value_.__r.__words[0]) >> 3);
      if (v256 >= 0xAAAAAAAAAAAAAAABLL
                 * ((uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3))
        v256 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3);
      *(_QWORD *)v478 = 0;
      *(_QWORD *)(v478 + 8) = 0;
      v489.__r_.__value_.__r.__words[0] = v478;
      p_obj = v153;
      v476[1] = v256;
      if (v256)
      {
        v473 = v154;
        v257 = 0;
        v258 = 0;
        while (1)
        {
          v259 = v492.__r_.__value_.__r.__words[0];
          v260 = 24 * v258;
          v261 = __p.__r_.__value_.__r.__words[0] + 24 * v258;
          v262 = (_QWORD *)v478;
          v263 = (uint64_t **)v478;
          if (v257)
            break;
LABEL_401:
          v276 = (char *)operator new(0x50uLL);
          v277 = (std::string *)(v276 + 32);
          if (*(char *)(v261 + 23) < 0)
          {
            std::string::__init_copy_ctor_external(v277, *(const std::string::value_type **)v261, *(_QWORD *)(v261 + 8));
          }
          else
          {
            v278 = *(_OWORD *)v261;
            *((_QWORD *)v276 + 6) = *(_QWORD *)(v261 + 16);
            *(_OWORD *)&v277->__r_.__value_.__l.__data_ = v278;
          }
          *((_QWORD *)v276 + 7) = 0;
          *((_QWORD *)v276 + 8) = 0;
          *((_QWORD *)v276 + 9) = 0;
          *(_QWORD *)v276 = 0;
          *((_QWORD *)v276 + 1) = 0;
          *((_QWORD *)v276 + 2) = v262;
          *v263 = (uint64_t *)v276;
          v279 = (uint64_t *)v276;
          if (*(_QWORD *)v489.__r_.__value_.__l.__data_)
          {
            v489.__r_.__value_.__r.__words[0] = *(_QWORD *)v489.__r_.__value_.__l.__data_;
            v279 = *v263;
          }
          std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>((uint64_t *)v489.__r_.__value_.__l.__size_, v279);
          ++v489.__r_.__value_.__r.__words[2];
LABEL_408:
          v280 = (void **)(v259 + v260);
          v281 = (void **)(v276 + 56);
          v282 = v276 + 56 == (char *)(v259 + v260);
          v153 = p_obj;
          if (!v282)
          {
            v283 = *((_BYTE *)v280 + 23);
            if (v276[79] < 0)
            {
              if (v283 >= 0)
                v285 = v280;
              else
                v285 = *v280;
              if (v283 >= 0)
                v286 = *((unsigned __int8 *)v280 + 23);
              else
                v286 = (size_t)v280[1];
              std::string::__assign_no_alias<false>(v281, v285, v286);
            }
            else if ((*((_BYTE *)v280 + 23) & 0x80) != 0)
            {
              std::string::__assign_no_alias<true>(v281, *v280, (size_t)v280[1]);
            }
            else
            {
              v284 = *(_OWORD *)v280;
              *((_QWORD *)v276 + 9) = v280[2];
              *(_OWORD *)v281 = v284;
            }
          }
          if (++v258 == v476[1])
          {
            v255 = (void *)v492.__r_.__value_.__r.__words[0];
            v154 = v473;
            v136 = v474;
            v152 = (__int128 *)v475[3];
            goto LABEL_423;
          }
          v257 = v489.__r_.__value_.__l.__size_;
        }
        v264 = *(char *)(v261 + 23);
        if (v264 >= 0)
          v265 = (const std::string::value_type *)(__p.__r_.__value_.__r.__words[0] + 24 * v258);
        else
          v265 = *(const std::string::value_type **)v261;
        if (v264 >= 0)
          v266 = *(unsigned __int8 *)(v261 + 23);
        else
          v266 = *(_QWORD *)(v261 + 8);
        while (1)
        {
          v262 = (_QWORD *)v257;
          v269 = *(const void **)(v257 + 32);
          v267 = v257 + 32;
          v268 = v269;
          v270 = *(char *)(v267 + 23);
          if (v270 >= 0)
            v271 = (const void *)v267;
          else
            v271 = v268;
          if (v270 >= 0)
            v272 = *(unsigned __int8 *)(v267 + 23);
          else
            v272 = *(_QWORD *)(v267 + 8);
          if (v272 >= v266)
            v273 = v266;
          else
            v273 = v272;
          v274 = memcmp(v265, v271, v273);
          if (v274)
          {
            if (v274 < 0)
              goto LABEL_381;
LABEL_395:
            v275 = memcmp(v271, v265, v273);
            if (v275)
            {
              if ((v275 & 0x80000000) == 0)
                goto LABEL_407;
            }
            else if (v272 >= v266)
            {
LABEL_407:
              v276 = (char *)v262;
              goto LABEL_408;
            }
            v257 = v262[1];
            if (!v257)
            {
              v263 = (uint64_t **)(v262 + 1);
              goto LABEL_401;
            }
          }
          else
          {
            if (v266 >= v272)
              goto LABEL_395;
LABEL_381:
            v257 = *v262;
            v263 = (uint64_t **)v262;
            if (!*v262)
              goto LABEL_401;
          }
        }
      }
LABEL_423:
      if (v255)
      {
        for (i = v492.__r_.__value_.__l.__size_; (void *)i != v255; i -= 24)
        {
          if (*(char *)(i - 1) < 0)
            operator delete(*(void **)(i - 24));
        }
        operator delete(v255);
      }
      if ((unint64_t)v153 >= v476[0])
        break;
      v153[1] = 0;
      v288 = (void **)(v153 + 1);
      v153[2] = 0;
      *v153 = (VKResourceManager *)(v153 + 1);
      v289 = v489.__r_.__value_.__r.__words[0];
      if (v489.__r_.__value_.__r.__words[0] != (_QWORD)v478)
      {
        do
        {
          v290 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__find_equal<std::string>((uint64_t **)v153, (uint64_t *)v153 + 1, (uint64_t **)&v492, (uint64_t **)&v488, (const void **)(v289 + 32));
          if (*v290)
          {
            v291 = *(_QWORD **)(v289 + 8);
            if (v291)
              goto LABEL_474;
          }
          else
          {
            v292 = v290;
            v293 = (char *)operator new(0x50uLL);
            v294 = (std::string *)(v293 + 32);
            if (*(char *)(v289 + 55) < 0)
            {
              std::string::__init_copy_ctor_external(v294, *(const std::string::value_type **)(v289 + 32), *(_QWORD *)(v289 + 40));
            }
            else
            {
              v295 = *(_OWORD *)(v289 + 32);
              *((_QWORD *)v293 + 6) = *(_QWORD *)(v289 + 48);
              *(_OWORD *)&v294->__r_.__value_.__l.__data_ = v295;
            }
            v296 = (std::string *)(v293 + 56);
            if (*(char *)(v289 + 79) < 0)
            {
              std::string::__init_copy_ctor_external(v296, *(const std::string::value_type **)(v289 + 56), *(_QWORD *)(v289 + 64));
            }
            else
            {
              v297 = *(_OWORD *)(v289 + 56);
              *((_QWORD *)v293 + 9) = *(_QWORD *)(v289 + 72);
              *(_OWORD *)&v296->__r_.__value_.__l.__data_ = v297;
            }
            v298 = v492.__r_.__value_.__r.__words[0];
            *(_QWORD *)v293 = 0;
            *((_QWORD *)v293 + 1) = 0;
            *((_QWORD *)v293 + 2) = v298;
            *v292 = (uint64_t)v293;
            isa = (VKResourceManager *)(*v153)->super.isa;
            if (isa)
            {
              *v153 = isa;
              v293 = (char *)*v292;
            }
            v300 = (char *)*v288;
            v282 = v293 == *v288;
            v293[24] = v282;
            if (!v282)
            {
              do
              {
                v301 = *((_QWORD *)v293 + 2);
                if (*(_BYTE *)(v301 + 24))
                  break;
                v302 = *(char **)(v301 + 16);
                v303 = *(_QWORD *)v302;
                if (*(_QWORD *)v302 == v301)
                {
                  v306 = *((_QWORD *)v302 + 1);
                  if (!v306 || (v307 = *(unsigned __int8 *)(v306 + 24), v304 = (_BYTE *)(v306 + 24), v307))
                  {
                    if (*(char **)v301 == v293)
                    {
                      v308 = (uint64_t *)*((_QWORD *)v293 + 2);
                    }
                    else
                    {
                      v308 = *(uint64_t **)(v301 + 8);
                      v309 = *v308;
                      *(_QWORD *)(v301 + 8) = *v308;
                      if (v309)
                      {
                        *(_QWORD *)(v309 + 16) = v301;
                        v302 = *(char **)(v301 + 16);
                      }
                      v308[2] = (uint64_t)v302;
                      *(_QWORD *)(*(_QWORD *)(v301 + 16) + 8 * (**(_QWORD **)(v301 + 16) != v301)) = v308;
                      *v308 = v301;
                      *(_QWORD *)(v301 + 16) = v308;
                      v302 = (char *)v308[2];
                      v301 = *(_QWORD *)v302;
                    }
                    *((_BYTE *)v308 + 24) = 1;
                    v302[24] = 0;
                    v312 = *(_QWORD *)(v301 + 8);
                    *(_QWORD *)v302 = v312;
                    if (v312)
                      *(_QWORD *)(v312 + 16) = v302;
                    *(_QWORD *)(v301 + 16) = *((_QWORD *)v302 + 2);
                    *(_QWORD *)(*((_QWORD *)v302 + 2) + 8 * (**((_QWORD **)v302 + 2) != (_QWORD)v302)) = v301;
                    *(_QWORD *)(v301 + 8) = v302;
                    goto LABEL_472;
                  }
                }
                else if (!v303 || (v305 = *(unsigned __int8 *)(v303 + 24), v304 = (_BYTE *)(v303 + 24), v305))
                {
                  if (*(char **)v301 == v293)
                  {
                    v310 = *((_QWORD *)v293 + 1);
                    *(_QWORD *)v301 = v310;
                    if (v310)
                    {
                      *(_QWORD *)(v310 + 16) = v301;
                      v302 = *(char **)(v301 + 16);
                    }
                    *((_QWORD *)v293 + 2) = v302;
                    *(_QWORD *)(*(_QWORD *)(v301 + 16) + 8 * (**(_QWORD **)(v301 + 16) != v301)) = v293;
                    *((_QWORD *)v293 + 1) = v301;
                    *(_QWORD *)(v301 + 16) = v293;
                    v302 = (char *)*((_QWORD *)v293 + 2);
                  }
                  else
                  {
                    v293 = (char *)*((_QWORD *)v293 + 2);
                  }
                  v293[24] = 1;
                  v302[24] = 0;
                  v301 = *((_QWORD *)v302 + 1);
                  v311 = *(char **)v301;
                  *((_QWORD *)v302 + 1) = *(_QWORD *)v301;
                  if (v311)
                    *((_QWORD *)v311 + 2) = v302;
                  *(_QWORD *)(v301 + 16) = *((_QWORD *)v302 + 2);
                  *(_QWORD *)(*((_QWORD *)v302 + 2) + 8 * (**((_QWORD **)v302 + 2) != (_QWORD)v302)) = v301;
                  *(_QWORD *)v301 = v302;
LABEL_472:
                  *((_QWORD *)v302 + 2) = v301;
                  break;
                }
                *(_BYTE *)(v301 + 24) = 1;
                v293 = v302;
                v302[24] = v302 == v300;
                *v304 = 1;
              }
              while (v302 != v300);
            }
            v153[2] = (VKResourceManager *)((char *)v153[2] + 1);
            v291 = *(_QWORD **)(v289 + 8);
            if (v291)
            {
              do
              {
LABEL_474:
                v313 = v291;
                v291 = (_QWORD *)*v291;
              }
              while (v291);
              goto LABEL_433;
            }
          }
          do
          {
            v313 = *(_QWORD **)(v289 + 16);
            v282 = *v313 == v289;
            v289 = (std::string::size_type)v313;
          }
          while (!v282);
LABEL_433:
          v289 = (std::string::size_type)v313;
        }
        while (v313 != (_QWORD *)v478);
      }
      v153 += 3;
LABEL_369:
      std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v489.__r_.__value_.__l.__size_);
      if (*(_DWORD *)((char *)v152 + *(_QWORD *)(*(_QWORD *)v493 - 24)))
        goto LABEL_159;
    }
    v314 = 0xAAAAAAAAAAAAAAABLL * (v153 - v154) + 1;
    if (v314 <= 0xAAAAAAAAAAAAAAALL)
    {
      if (0x5555555555555556 * ((uint64_t)(v476[0] - (_QWORD)v154) >> 3) > v314)
        v314 = 0x5555555555555556 * ((uint64_t)(v476[0] - (_QWORD)v154) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v476[0] - (_QWORD)v154) >> 3) >= 0x555555555555555)
        v315 = 0xAAAAAAAAAAAAAAALL;
      else
        v315 = v314;
      if (v315)
      {
        if (v315 > 0xAAAAAAAAAAAAAAALL)
LABEL_668:
          std::__throw_bad_array_new_length[abi:nn180100]();
        v316 = (char *)operator new(24 * v315);
      }
      else
      {
        v316 = 0;
      }
      v317 = v316;
      v318 = &v316[8 * (v153 - v154)];
      *((_QWORD *)v318 + 1) = 0;
      *((_QWORD *)v318 + 2) = 0;
      *(_QWORD *)v318 = v318 + 8;
      v319 = v489.__r_.__value_.__r.__words[0];
      if (v489.__r_.__value_.__r.__words[0] == (_QWORD)v478)
      {
LABEL_490:
        v320 = p_obj;
        if (p_obj == v154)
        {
          v338 = v318;
          v154 = p_obj;
        }
        else
        {
          v321 = 0;
          do
          {
            v333 = &v318[v321 * 8];
            *((_QWORD *)v333 - 3) = v320[v321 - 3];
            v334 = (VKResourceManager *)&v320[v321 - 2];
            v335 = v334->super.isa;
            *(_QWORD *)&v318[v321 * 8 - 16] = v334->super.isa;
            v336 = (uint64_t)&v318[v321 * 8 - 16];
            v337 = v320[v321 - 1];
            *((_QWORD *)v333 - 1) = v337;
            if (v337)
            {
              v335[2] = v336;
              v320[v321 - 3] = v334;
              v334->super.isa = 0;
              v320[v321 - 1] = 0;
            }
            else
            {
              *((_QWORD *)v333 - 3) = v336;
            }
            v321 -= 3;
          }
          while (&v320[v321] != v154);
          v338 = &v318[v321 * 8];
          do
          {
            v339 = v320 - 3;
            std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)*(v320 - 2));
            v320 = v339;
          }
          while (v339 != v154);
        }
        v476[0] = &v317[24 * v315];
        v153 = (VKResourceManager **)(v318 + 24);
        if (v154)
          operator delete(v154);
        v154 = (VKResourceManager **)v338;
        v136 = v474;
        goto LABEL_369;
      }
      while (1)
      {
        v322 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__find_equal<std::string>((uint64_t **)v318, (uint64_t *)v318 + 1, (uint64_t **)&v492, (uint64_t **)&v488, (const void **)(v319 + 32));
        if (*v322)
        {
          v323 = *(_QWORD **)(v319 + 8);
          if (v323)
            goto LABEL_505;
        }
        else
        {
          v324 = (uint64_t **)v322;
          v325 = (uint64_t *)operator new(0x50uLL);
          v326 = (std::string *)(v325 + 4);
          if (*(char *)(v319 + 55) < 0)
          {
            std::string::__init_copy_ctor_external(v326, *(const std::string::value_type **)(v319 + 32), *(_QWORD *)(v319 + 40));
          }
          else
          {
            v327 = *(_OWORD *)(v319 + 32);
            v325[6] = *(_QWORD *)(v319 + 48);
            *(_OWORD *)&v326->__r_.__value_.__l.__data_ = v327;
          }
          v328 = (std::string *)(v325 + 7);
          if (*(char *)(v319 + 79) < 0)
          {
            std::string::__init_copy_ctor_external(v328, *(const std::string::value_type **)(v319 + 56), *(_QWORD *)(v319 + 64));
          }
          else
          {
            v329 = *(_OWORD *)(v319 + 56);
            v325[9] = *(_QWORD *)(v319 + 72);
            *(_OWORD *)&v328->__r_.__value_.__l.__data_ = v329;
          }
          v330 = v492.__r_.__value_.__r.__words[0];
          *v325 = 0;
          v325[1] = 0;
          v325[2] = v330;
          *v324 = v325;
          v331 = **(_QWORD ***)v318;
          if (v331)
          {
            *(_QWORD *)v318 = v331;
            v325 = *v324;
          }
          std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*((uint64_t **)v318 + 1), v325);
          ++*((_QWORD *)v318 + 2);
          v323 = *(_QWORD **)(v319 + 8);
          if (v323)
          {
            do
            {
LABEL_505:
              v332 = v323;
              v323 = (_QWORD *)*v323;
            }
            while (v323);
            goto LABEL_492;
          }
        }
        do
        {
          v332 = *(_QWORD **)(v319 + 16);
          v282 = *v332 == v319;
          v319 = (std::string::size_type)v332;
        }
        while (!v282);
LABEL_492:
        v319 = (std::string::size_type)v332;
        if (v332 == (_QWORD *)v478)
          goto LABEL_490;
      }
    }
LABEL_667:
    abort();
  }
  v153 = 0;
  v154 = 0;
LABEL_159:
  v155 = (void *)__p.__r_.__value_.__r.__words[0];
  if (__p.__r_.__value_.__r.__words[0])
  {
    for (j = __p.__r_.__value_.__l.__size_; (void *)j != v155; j -= 24)
    {
      if (*(char *)(j - 1) < 0)
        operator delete(*(void **)(j - 24));
    }
    operator delete(v155);
  }
  *(_QWORD *)v493 = *MEMORY[0x1E0DE4F58];
  *(_QWORD *)&v493[*(_QWORD *)(*(_QWORD *)v493 - 24)] = *(_QWORD *)(MEMORY[0x1E0DE4F58] + 24);
  *(_QWORD *)&v493[16] = MEMORY[0x1E0DE4FB8] + 16;
  if (SBYTE7(v498) < 0)
    operator delete(v497[0]);
  std::streambuf::~streambuf();
  std::istream::~istream();
  MEMORY[0x1A1AF4D64](v500);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  v157 = v153;
  if (v154 != v153)
  {
    v478 = *(_OWORD *)"transit-line-type";
    qmemcpy(v476, "transit-transit-system-t", sizeof(v476));
    qmemcpy(v475, "ng-colorrouting-ay-grouptransit-display-", sizeof(v475));
    v472 = v154;
    v158 = (uint64_t)v154;
    p_obj = v153;
    while (1)
    {
      v493[23] = 17;
      strcpy(&v493[16], "e");
      *(_OWORD *)v493 = v478;
      v159 = std::__tree<std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>>>::find<std::string>(v158, (const void **)v493);
      v493[23] = 19;
      strcpy(&v493[15], "type");
      *(_OWORD *)v493 = *(_OWORD *)&v476[1];
      v160 = std::__tree<std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>>>::find<std::string>(v158, (const void **)v493);
      v493[23] = 12;
      strcpy(&v493[8], "type");
      *(_QWORD *)v493 = v476[0];
      v161 = std::__tree<std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>>>::find<std::string>(v158, (const void **)v493);
      v493[23] = 7;
      strcpy(v493, "country");
      v162 = std::__tree<std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>>>::find<std::string>(v158, (const void **)v493);
      v493[23] = 21;
      *(_OWORD *)v493 = *(_OWORD *)&v475[3];
      *(_QWORD *)&v493[13] = v475[2];
      v493[21] = 0;
      v163 = std::__tree<std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>>>::find<std::string>(v158, (const void **)v493);
      v493[23] = 5;
      strcpy(v493, "color");
      v164 = std::__tree<std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>>>::find<std::string>(v158, (const void **)v493);
      v493[23] = 13;
      *(_QWORD *)v493 = v475[1];
      *(_QWORD *)&v493[5] = v475[0];
      v493[13] = 0;
      v165 = std::__tree<std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::unique_ptr<md::StyleSettingsNode>>>>::find<std::string>(v158, (const void **)v493);
      v166 = (uint64_t *)(v158 + 8);
      if ((uint64_t *)(v158 + 8) == v159)
        goto LABEL_173;
      if (v166 == v160)
        goto LABEL_173;
      if (v166 == v161)
        goto LABEL_173;
      if (v166 == v162)
        goto LABEL_173;
      if (v166 == v163)
        goto LABEL_173;
      if (v166 == v164)
        goto LABEL_173;
      v167 = v165;
      if (v166 == v165)
        goto LABEL_173;
      if (*((char *)v159 + 79) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)v493, (const std::string::value_type *)v159[7], v159[8]);
      }
      else
      {
        *(_OWORD *)v493 = *(_OWORD *)(v159 + 7);
        *(_QWORD *)&v493[16] = v159[9];
      }
      if (*((char *)v160 + 79) < 0)
        std::string::__init_copy_ctor_external(&v492, (const std::string::value_type *)v160[7], v160[8]);
      else
        v492 = *(std::string *)(v160 + 7);
      if (*((char *)v161 + 79) < 0)
        std::string::__init_copy_ctor_external(&__dst, (const std::string::value_type *)v161[7], v161[8]);
      else
        __dst = *(std::string *)(v161 + 7);
      if (*((char *)v162 + 79) < 0)
        std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)v162[7], v162[8]);
      else
        __p = *(std::string *)(v162 + 7);
      if (*((char *)v163 + 79) < 0)
        std::string::__init_copy_ctor_external(&v489, (const std::string::value_type *)v163[7], v163[8]);
      else
        v489 = *(std::string *)(v163 + 7);
      if (*((char *)v164 + 79) < 0)
        std::string::__init_copy_ctor_external(&v488, (const std::string::value_type *)v164[7], v164[8]);
      else
        v488 = *(std::string *)(v164 + 7);
      if (*((char *)v167 + 79) < 0)
        std::string::__init_copy_ctor_external(&v487, (const std::string::value_type *)v167[7], v167[8]);
      else
        v487 = *(std::string *)(v167 + 7);
      v168 = v493[23];
      if (v493[23] < 0)
        v168 = *(_QWORD *)&v493[8];
      if (v168)
      {
        if (v493[23] >= 0)
          v169 = v493;
        else
          v169 = *(const char **)v493;
        v170 = atoi(v169);
      }
      else
      {
        v170 = -1;
      }
      v171 = HIBYTE(v492.__r_.__value_.__r.__words[2]);
      if ((v492.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v171 = v492.__r_.__value_.__l.__size_;
      if (v171)
      {
        if ((v492.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v172 = &v492;
        else
          v172 = (std::string *)v492.__r_.__value_.__r.__words[0];
        v173 = atoi((const char *)v172);
      }
      else
      {
        v173 = -1;
      }
      v174 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
      if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v174 = __dst.__r_.__value_.__l.__size_;
      if (v174)
      {
        if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v175 = &__dst;
        else
          v175 = (std::string *)__dst.__r_.__value_.__r.__words[0];
        v176 = atoi((const char *)v175);
      }
      else
      {
        v176 = -1;
      }
      v177 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v177 = __p.__r_.__value_.__l.__size_;
      if (v177)
      {
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          p_p = &__p;
        else
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        v179 = atoi((const char *)p_p);
      }
      else
      {
        v179 = -1;
      }
      v180 = HIBYTE(v489.__r_.__value_.__r.__words[2]);
      if ((v489.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v180 = v489.__r_.__value_.__l.__size_;
      if (v180)
      {
        if ((v489.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v181 = &v489;
        else
          v181 = (std::string *)v489.__r_.__value_.__r.__words[0];
        v182 = atoi((const char *)v181);
      }
      else
      {
        v182 = -1;
      }
      v486 = 0;
      if ((v488.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v183 = &v488;
      else
        v183 = (std::string *)v488.__r_.__value_.__r.__words[0];
      v184 = sscanf((const char *)v183, "#%x", &v486);
      v185 = 0.0;
      v186 = 0.0;
      v187 = 0.0;
      v188 = 0.0;
      v189 = 0.0;
      if (v184 == 1)
      {
        if ((v488.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v190 = HIBYTE(v488.__r_.__value_.__r.__words[2]);
        else
          v190 = v488.__r_.__value_.__l.__size_;
        if (v190 == 7)
        {
          v191 = bswap32((v486 << 8) | 0xFF);
          v192 = (float)v191;
          if ((float)(v192 * 0.0039216) >= 0.04045)
            v186 = powf((float)(v192 * 0.0037171) + 0.052133, 2.4);
          else
            v186 = v192 * 0.00030353;
          v195 = (float)BYTE1(v191);
          if ((float)(v195 * 0.0039216) >= 0.04045)
            v187 = powf((float)(v195 * 0.0037171) + 0.052133, 2.4);
          else
            v187 = v195 * 0.00030353;
          v197 = (float)BYTE2(v191);
          if ((float)(v197 * 0.0039216) >= 0.04045)
            v188 = powf((float)(v197 * 0.0037171) + 0.052133, 2.4);
          else
            v188 = v197 * 0.00030353;
          v189 = 1.0;
        }
        else
        {
          v193 = bswap32(v486);
          v194 = (float)v193;
          if ((float)(v194 * 0.0039216) >= 0.04045)
            v186 = powf((float)(v194 * 0.0037171) + 0.052133, 2.4);
          else
            v186 = v194 * 0.00030353;
          v196 = (float)BYTE1(v193);
          if ((float)(v196 * 0.0039216) >= 0.04045)
            v187 = powf((float)(v196 * 0.0037171) + 0.052133, 2.4);
          else
            v187 = v196 * 0.00030353;
          v198 = (float)BYTE2(v193);
          v189 = (float)HIBYTE(v193) * 0.0039216;
          if ((float)(v198 * 0.0039216) >= 0.04045)
            v188 = powf((float)(v198 * 0.0037171) + 0.052133, 2.4);
          else
            v188 = v198 * 0.00030353;
        }
        v153 = p_obj;
      }
      if ((v487.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v199 = &v487;
      else
        v199 = (std::string *)v487.__r_.__value_.__r.__words[0];
      v200 = 0.0;
      v201 = 0.0;
      v202 = 0.0;
      if (sscanf((const char *)v199, "#%x", &v486) == 1)
      {
        if ((v488.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v203 = HIBYTE(v488.__r_.__value_.__r.__words[2]);
        else
          v203 = v488.__r_.__value_.__l.__size_;
        if (v203 == 7)
        {
          v204 = bswap32((v486 << 8) | 0xFF);
          v205 = (float)v204;
          if ((float)(v205 * 0.0039216) >= 0.04045)
            v185 = powf((float)(v205 * 0.0037171) + 0.052133, 2.4);
          else
            v185 = v205 * 0.00030353;
          v208 = (float)BYTE1(v204);
          if ((float)(v208 * 0.0039216) >= 0.04045)
            v200 = powf((float)(v208 * 0.0037171) + 0.052133, 2.4);
          else
            v200 = v208 * 0.00030353;
          v210 = (float)BYTE2(v204);
          if ((float)(v210 * 0.0039216) >= 0.04045)
            v201 = powf((float)(v210 * 0.0037171) + 0.052133, 2.4);
          else
            v201 = v210 * 0.00030353;
          v202 = 1.0;
        }
        else
        {
          v206 = bswap32(v486);
          v207 = (float)v206;
          if ((float)(v207 * 0.0039216) >= 0.04045)
            v185 = powf((float)(v207 * 0.0037171) + 0.052133, 2.4);
          else
            v185 = v207 * 0.00030353;
          v209 = (float)BYTE1(v206);
          if ((float)(v209 * 0.0039216) >= 0.04045)
            v200 = powf((float)(v209 * 0.0037171) + 0.052133, 2.4);
          else
            v200 = v209 * 0.00030353;
          v211 = (float)BYTE2(v206);
          v202 = (float)HIBYTE(v206) * 0.0039216;
          if ((float)(v211 * 0.0039216) >= 0.04045)
            v201 = powf((float)(v211 * 0.0037171) + 0.052133, 2.4);
          else
            v201 = v211 * 0.00030353;
        }
        v153 = p_obj;
      }
      if (v184 == 1)
      {
        v213 = (uint64_t *)v136[4];
        v212 = v136[5];
        if ((unint64_t)v213 >= v212)
        {
          v215 = *v471;
          v216 = 0x8E38E38E38E38E39 * (v213 - *v471);
          v217 = v216 + 1;
          if (v216 + 1 > 0x38E38E38E38E38ELL)
            abort();
          v218 = 0x8E38E38E38E38E39 * ((uint64_t)(v212 - (_QWORD)v215) >> 3);
          if (2 * v218 > v217)
            v217 = 2 * v218;
          if (v218 >= 0x1C71C71C71C71C7)
            v219 = 0x38E38E38E38E38ELL;
          else
            v219 = v217;
          if (v219 > 0x38E38E38E38E38ELL)
            goto LABEL_668;
          v220 = (char *)operator new(72 * v219);
          v221 = &v220[72 * v216];
          *(_QWORD *)v221 = v176;
          *((_QWORD *)v221 + 1) = v173;
          *((_QWORD *)v221 + 2) = v170;
          *((_QWORD *)v221 + 3) = v179;
          *((_QWORD *)v221 + 4) = v182;
          *((float *)v221 + 10) = v186;
          *((float *)v221 + 11) = v187;
          *((float *)v221 + 12) = v188;
          *((float *)v221 + 13) = v189;
          *((float *)v221 + 14) = v185;
          *((float *)v221 + 15) = v200;
          *((float *)v221 + 16) = v201;
          *((float *)v221 + 17) = v202;
          v222 = v221;
          if (v213 != v215)
          {
            do
            {
              v223 = *(_OWORD *)(v213 - 9);
              v224 = *(_OWORD *)(v213 - 7);
              *((_QWORD *)v222 - 5) = *(v213 - 5);
              *(_OWORD *)(v222 - 56) = v224;
              *(_OWORD *)(v222 - 72) = v223;
              *((_OWORD *)v222 - 2) = *((_OWORD *)v213 - 2);
              *((_OWORD *)v222 - 1) = *((_OWORD *)v213 - 1);
              v222 -= 72;
              v213 -= 9;
            }
            while (v213 != v215);
            v213 = *v471;
          }
          v225 = &v220[72 * v219];
          v214 = v221 + 72;
          v136 = v474;
          v474[3] = v222;
          v474[4] = v221 + 72;
          v474[5] = v225;
          v153 = p_obj;
          if (v213)
            operator delete(v213);
        }
        else
        {
          *v213 = v176;
          v213[1] = v173;
          v213[2] = v170;
          v213[3] = v179;
          v213[4] = v182;
          *((float *)v213 + 10) = v186;
          *((float *)v213 + 11) = v187;
          *((float *)v213 + 12) = v188;
          *((float *)v213 + 13) = v189;
          *((float *)v213 + 14) = v185;
          *((float *)v213 + 15) = v200;
          v214 = v213 + 9;
          *((float *)v213 + 16) = v201;
          *((float *)v213 + 17) = v202;
        }
        v136[4] = v214;
      }
      if (SHIBYTE(v487.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v487.__r_.__value_.__l.__data_);
        if ((SHIBYTE(v488.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
LABEL_316:
          if ((SHIBYTE(v489.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            goto LABEL_317;
          goto LABEL_323;
        }
      }
      else if ((SHIBYTE(v488.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
        goto LABEL_316;
      }
      operator delete(v488.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v489.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_317:
        if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_318;
        goto LABEL_324;
      }
LABEL_323:
      operator delete(v489.__r_.__value_.__l.__data_);
      if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_318:
        if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_319;
        goto LABEL_325;
      }
LABEL_324:
      operator delete(__p.__r_.__value_.__l.__data_);
      if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_319:
        if (SHIBYTE(v492.__r_.__value_.__r.__words[2]) < 0)
          goto LABEL_172;
        goto LABEL_326;
      }
LABEL_325:
      operator delete(__dst.__r_.__value_.__l.__data_);
      if (SHIBYTE(v492.__r_.__value_.__r.__words[2]) < 0)
      {
LABEL_172:
        operator delete(v492.__r_.__value_.__l.__data_);
        if ((v493[23] & 0x80000000) != 0)
          goto LABEL_327;
        goto LABEL_173;
      }
LABEL_326:
      if ((v493[23] & 0x80000000) != 0)
LABEL_327:
        operator delete(*(void **)v493);
LABEL_173:
      v158 += 24;
      if ((VKResourceManager **)v158 == v153)
      {
        v154 = v472;
        v157 = v472;
        break;
      }
    }
  }
  if (v157)
  {
    if (v153 != v157)
    {
      do
      {
        std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)*(v153 - 2));
        v153 -= 3;
      }
      while (v153 != v157);
      v153 = v154;
    }
    operator delete(v153);
  }

  if (v485 < 0)
    operator delete(v484[0]);
  v226 = (std::__shared_weak_count *)v470->_dataOverrideManager.__cntrl_;
  v470->_dataOverrideManager.__ptr_ = (DataOverrideManager *)v471;
  v470->_dataOverrideManager.__cntrl_ = (__shared_weak_count *)v136;
  if (v226)
  {
    v227 = (unint64_t *)&v226->__shared_owners_;
    do
      v228 = __ldaxr(v227);
    while (__stlxr(v228 - 1, v227));
    if (!v228)
    {
      ((void (*)(std::__shared_weak_count *))v226->__on_zero_shared)(v226);
      std::__shared_weak_count::__release_weak(v226);
    }
  }

  md::StylesheetVendor::setupTileGroupObservationProxy((md::StylesheetVendor *)v470->_stylesheetVendor.__ptr_);
  v229 = *((_QWORD *)v470->_device.__ptr_.__value_ + 1);
  v230 = (unsigned __int8 *)operator new();
  *v230 = 1;
  *(_QWORD *)(v230 + 4) = 0x8000000008;
  *(_QWORD *)(v230 + 12) = 0x3FA0000000000080;
  *((_QWORD *)v230 + 3) = 0;
  ggl::AlphaAtlas::generateTexture((ggl::AlphaAtlas *)&v492, 0x80u, 0x80u, 1.25, 1.0, v231, v232);
  v233 = *v230;
  v234 = (char *)operator new(0x58uLL);
  v235 = (std::__shared_weak_count *)v234;
  *((_QWORD *)v234 + 1) = 0;
  v236 = (unint64_t *)(v234 + 8);
  *((_QWORD *)v234 + 2) = 0;
  *(_QWORD *)v234 = &off_1E42DED18;
  *((_QWORD *)v234 + 3) = &off_1E42B63B0;
  v237 = v234 + 24;
  *((_QWORD *)v234 + 5) = 0;
  *((_QWORD *)v234 + 6) = 0;
  *((_QWORD *)v234 + 4) = 0;
  if (v233)
    v238 = 3;
  else
    v238 = 0;
  *((_DWORD *)v234 + 14) = 0;
  *((_DWORD *)v234 + 15) = v238;
  *((_DWORD *)v234 + 16) = v238;
  *(_OWORD *)(v234 + 68) = xmmword_19FFB2E50;
  *((_DWORD *)v234 + 21) = 0;
  v239 = operator new();
  v240 = *(_OWORD *)&v492.__r_.__value_.__l.__data_;
  if (v492.__r_.__value_.__l.__size_)
  {
    v241 = (unint64_t *)(v492.__r_.__value_.__l.__size_ + 8);
    do
      v242 = __ldxr(v241);
    while (__stxr(v242 + 1, v241));
  }
  v243 = *(_DWORD *)(v240 + 12);
  *(_DWORD *)(v239 + 32) = 0;
  *(_QWORD *)(v239 + 16) = 0;
  *(_QWORD *)(v239 + 24) = 0;
  *(_QWORD *)(v239 + 56) = 0x100000001;
  *(_DWORD *)(v239 + 64) = 0;
  *(_DWORD *)(v239 + 68) = v243;
  *(_QWORD *)(v239 + 72) = 0x100000001;
  *(_QWORD *)(v239 + 88) = 0;
  *(_QWORD *)(v239 + 96) = 0;
  *(_QWORD *)(v239 + 80) = 0;
  *(_QWORD *)v239 = &off_1E42BE438;
  *(_QWORD *)(v239 + 8) = 0;
  *(_QWORD *)(v239 + 40) = &unk_1E42BE458;
  *(_QWORD *)(v239 + 48) = "";
  *(_DWORD *)(v239 + 104) = *(_DWORD *)(v240 + 8);
  *(_OWORD *)(v239 + 112) = v240;
  if (*((_QWORD *)&v240 + 1))
  {
    v244 = (unint64_t *)(*((_QWORD *)&v240 + 1) + 8);
    do
      v245 = __ldxr(v244);
    while (__stxr(v245 + 1, v244));
  }
  *(_WORD *)(v239 + 128) = 0;
  *(_BYTE *)(v239 + 130) = 1;
  *(_QWORD *)(v239 + 136) = v237;
  *(_QWORD *)(v239 + 144) = v235;
  do
    v246 = __ldxr(v236);
  while (__stxr(v246 + 1, v236));
  *(_QWORD *)(v239 + 80) = *(_QWORD *)(v240 + 16);
  v247 = *((_QWORD *)v230 + 3);
  *((_QWORD *)v230 + 3) = v239;
  if (v247)
    (*(void (**)(uint64_t))(*(_QWORD *)v247 + 8))(v247);
  if (*((_QWORD *)&v240 + 1))
  {
    v248 = (unint64_t *)(*((_QWORD *)&v240 + 1) + 8);
    do
      v249 = __ldaxr(v248);
    while (__stlxr(v249 - 1, v248));
    if (!v249)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v240 + 1) + 16))(*((_QWORD *)&v240 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v240 + 1));
    }
  }
  (*(void (**)(std::string *__return_ptr, uint64_t))(*(_QWORD *)v229 + 24))(&__p, v229);
  *(_QWORD *)v493 = &off_1E42D5F18;
  *(_QWORD *)&v493[8] = v230;
  *(_QWORD *)&v493[24] = v493;
  *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = 0uLL;
  (*(void (**)(std::string::size_type, _BYTE *, std::string *))(*(_QWORD *)__p.__r_.__value_.__l.__data_
                                                                         + 16))(__p.__r_.__value_.__r.__words[0], v493, &__dst);
  v250 = (std::__shared_weak_count *)__dst.__r_.__value_.__l.__size_;
  if (__dst.__r_.__value_.__l.__size_)
  {
    v251 = (unint64_t *)(__dst.__r_.__value_.__l.__size_ + 8);
    do
      v252 = __ldaxr(v251);
    while (__stlxr(v252 - 1, v251));
    if (!v252)
    {
      ((void (*)(std::__shared_weak_count *))v250->__on_zero_shared)(v250);
      std::__shared_weak_count::__release_weak(v250);
    }
  }
  v253 = *(_QWORD **)&v493[24];
  if (*(_BYTE **)&v493[24] == v493)
  {
    v254 = 4;
    v253 = v493;
  }
  else
  {
    if (!*(_QWORD *)&v493[24])
      goto LABEL_523;
    v254 = 5;
  }
  (*(void (**)(void))(*v253 + 8 * v254))();
LABEL_523:
  if (__p.__r_.__value_.__r.__words[0])
  {
    v340 = (*(uint64_t (**)(std::string::size_type))(*(_QWORD *)__p.__r_.__value_.__l.__data_ + 24))(__p.__r_.__value_.__r.__words[0]);
    v341 = __p.__r_.__value_.__r.__words[0];
    __p.__r_.__value_.__r.__words[0] = 0;
    *(_QWORD *)v493 = v341;
    (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v340 + 48))(v340, v493);
    v342 = *(_QWORD *)v493;
    *(_QWORD *)v493 = 0;
    if (v342)
      (*(void (**)(uint64_t))(*(_QWORD *)v342 + 8))(v342);
    v343 = __p.__r_.__value_.__r.__words[0];
    __p.__r_.__value_.__r.__words[0] = 0;
    if (v343)
      (*(void (**)(std::string::size_type))(*(_QWORD *)v343 + 8))(v343);
  }
  do
    v344 = __ldaxr(v236);
  while (__stlxr(v344 - 1, v236));
  if (!v344)
  {
    ((void (*)(std::__shared_weak_count *))v235->__on_zero_shared)(v235);
    std::__shared_weak_count::__release_weak(v235);
  }
  v345 = (std::__shared_weak_count *)v492.__r_.__value_.__l.__size_;
  if (v492.__r_.__value_.__l.__size_)
  {
    v346 = (unint64_t *)(v492.__r_.__value_.__l.__size_ + 8);
    do
      v347 = __ldaxr(v346);
    while (__stlxr(v347 - 1, v346));
    if (!v347)
    {
      ((void (*)(std::__shared_weak_count *))v345->__on_zero_shared)(v345);
      std::__shared_weak_count::__release_weak(v345);
    }
  }
  v348 = v470->_alphaAtlas.__ptr_.__value_;
  v470->_alphaAtlas.__ptr_.__value_ = (AlphaAtlas *)v230;
  if (v348)
  {
    v349 = *((_QWORD *)v348 + 3);
    *((_QWORD *)v348 + 3) = 0;
    if (v349)
      (*(void (**)(uint64_t))(*(_QWORD *)v349 + 8))(v349);
    MEMORY[0x1A1AF4E00](v348, 0x1020C40764CE0E8);
  }
  v350 = *((_QWORD *)v470->_device.__ptr_.__value_ + 1);
  v351 = (ggl::IsoAlphaAtlas *)operator new();
  v356 = ggl::IsoAlphaAtlas::IsoAlphaAtlas(v351, v350, 1.25, v353, v352, v354, v355);
  v357 = v470->_isoAlphaAtlas.__ptr_.__value_;
  v470->_isoAlphaAtlas.__ptr_.__value_ = (IsoAlphaAtlas *)v356;
  if (v357)
  {
    v358 = (std::__shared_weak_count *)*((_QWORD *)v357 + 4);
    if (v358)
    {
      v359 = (unint64_t *)&v358->__shared_owners_;
      do
        v360 = __ldaxr(v359);
      while (__stlxr(v360 - 1, v359));
      if (!v360)
      {
        ((void (*)(std::__shared_weak_count *))v358->__on_zero_shared)(v358);
        std::__shared_weak_count::__release_weak(v358);
      }
    }
    v361 = *((_QWORD *)v357 + 2);
    *((_QWORD *)v357 + 2) = 0;
    if (v361)
      (*(void (**)(uint64_t))(*(_QWORD *)v361 + 8))(v361);
    MEMORY[0x1A1AF4E00](v357, 0x1020C4081634310);
  }
  v362 = *((_QWORD *)v470->_device.__ptr_.__value_ + 1);
  v363 = (ggl::IsoAlphaAtlas *)operator new();
  v368 = ggl::IsoAlphaAtlas::IsoAlphaAtlas(v363, v362, 2.5, v365, v364, v366, v367);
  v369 = v470->_highInflationAlphaAtlas.__ptr_.__value_;
  v470->_highInflationAlphaAtlas.__ptr_.__value_ = (IsoAlphaAtlas *)v368;
  if (v369)
  {
    v370 = (std::__shared_weak_count *)*((_QWORD *)v369 + 4);
    if (v370)
    {
      v371 = (unint64_t *)&v370->__shared_owners_;
      do
        v372 = __ldaxr(v371);
      while (__stlxr(v372 - 1, v371));
      if (!v372)
      {
        ((void (*)(std::__shared_weak_count *))v370->__on_zero_shared)(v370);
        std::__shared_weak_count::__release_weak(v370);
      }
    }
    v373 = *((_QWORD *)v369 + 2);
    *((_QWORD *)v369 + 2) = 0;
    if (v373)
      (*(void (**)(uint64_t))(*(_QWORD *)v373 + 8))(v373);
    MEMORY[0x1A1AF4E00](v369, 0x1020C4081634310);
  }
  *(_QWORD *)&v478 = *((_QWORD *)v470->_device.__ptr_.__value_ + 1);
  v374 = operator new();
  *(_QWORD *)v374 = 0x8000000008;
  *(_DWORD *)(v374 + 8) = 128;
  *(_QWORD *)(v374 + 16) = 0;
  v375 = (std::__shared_weak_count *)operator new(0x60uLL);
  v375->__shared_owners_ = 0;
  v376 = (unint64_t *)&v375->__shared_owners_;
  v375->__shared_weak_owners_ = 0;
  v375->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42DEFB8;
  v377 = v375 + 1;
  ggl::TextureData2D::TextureData2D((uint64_t)&v375[1], 128, 128, 8u, 2, 0);
  if (*(_DWORD *)v374)
  {
    v378 = 0;
    do
    {
      v379 = ((uint64_t (*)(std::__shared_weak_count *, uint64_t))v377->__on_zero_shared)(v377, v378);
      v380 = (*(_DWORD *)(v374 + 8) >> v378);
      if ((_DWORD)v380)
      {
        v381 = v379;
        v382 = 0;
        if ((v380 - 1) <= 1)
          v383 = 1.0;
        else
          v383 = 1.0 / (float)(v380 - 1);
        do
        {
          for (k = 0; k != v380; ++k)
          {
            v385 = fmaxf(1.0 - hypotf((float)k * (float)(1.25 * v383), (float)v382 * (float)(1.25 * v383)), 0.0);
            if (v385 <= 1.0)
              v386 = v385 * 255.0;
            else
              v386 = 255.0;
            *(_BYTE *)(v381 + k) = llroundf(v386);
          }
          ++v382;
          v381 += v380;
        }
        while (v382 != v380);
      }
      v378 = (v378 + 1);
    }
    while (v378 < *(_DWORD *)v374);
  }
  v387 = (std::__shared_weak_count *)operator new(0x58uLL);
  v387->__shared_owners_ = 0;
  v388 = (unint64_t *)&v387->__shared_owners_;
  v387->__shared_weak_owners_ = 0;
  v387->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42DED18;
  v387[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E42B63B0;
  v387[1].__shared_weak_owners_ = 0;
  v387[2].__vftable = 0;
  v387[1].__shared_owners_ = 0;
  LODWORD(v387[2].__shared_owners_) = 0;
  *(_OWORD *)((char *)&v387[2].__shared_owners_ + 4) = xmmword_19FFB2E60;
  *(std::__shared_weak_count_vtbl **)((char *)&v387[3].__vftable + 4) = (std::__shared_weak_count_vtbl *)0x100000001;
  HIDWORD(v387[3].__shared_owners_) = 0;
  v389 = operator new();
  do
    v390 = __ldxr(v376);
  while (__stxr(v390 + 1, v376));
  v392 = v375[1].__shared_owners_;
  v391 = HIDWORD(v375[1].__shared_owners_);
  *(_DWORD *)(v389 + 64) = 0;
  *(_DWORD *)(v389 + 68) = v391;
  *(_QWORD *)(v389 + 16) = 0;
  *(_QWORD *)(v389 + 24) = 0;
  *(_DWORD *)(v389 + 32) = 0;
  *(_QWORD *)(v389 + 56) = 0x100000001;
  *(_QWORD *)(v389 + 72) = 0x100000001;
  *(_QWORD *)(v389 + 88) = 0;
  *(_QWORD *)(v389 + 96) = 0;
  *(_QWORD *)v389 = &off_1E42BE438;
  *(_QWORD *)(v389 + 8) = 0;
  *(_QWORD *)(v389 + 40) = &unk_1E42BE458;
  *(_QWORD *)(v389 + 48) = "";
  *(_DWORD *)(v389 + 104) = v392;
  *(_QWORD *)(v389 + 112) = v377;
  *(_QWORD *)(v389 + 120) = v375;
  do
    v393 = __ldxr(v376);
  while (__stxr(v393 + 1, v376));
  *(_WORD *)(v389 + 128) = 0;
  *(_BYTE *)(v389 + 130) = 1;
  *(_QWORD *)(v389 + 136) = v387 + 1;
  *(_QWORD *)(v389 + 144) = v387;
  do
    v394 = __ldxr(v388);
  while (__stxr(v394 + 1, v388));
  *(_QWORD *)(v389 + 80) = v375[1].__shared_weak_owners_;
  v395 = *(_QWORD *)(v374 + 16);
  *(_QWORD *)(v374 + 16) = v389;
  v5 = v470;
  if (v395)
    (*(void (**)(uint64_t))(*(_QWORD *)v395 + 8))(v395);
  do
    v396 = __ldaxr(v376);
  while (__stlxr(v396 - 1, v376));
  if (!v396)
  {
    ((void (*)(std::__shared_weak_count *))v375->__on_zero_shared)(v375);
    std::__shared_weak_count::__release_weak(v375);
  }
  (*(void (**)(std::string *__return_ptr))(*(_QWORD *)v478 + 24))(&__dst);
  *(_QWORD *)v493 = &off_1E42D5F60;
  *(_QWORD *)&v493[8] = v374;
  *(_QWORD *)&v493[24] = v493;
  *(_OWORD *)&v492.__r_.__value_.__l.__data_ = 0uLL;
  (*(void (**)(std::string::size_type, _BYTE *, std::string *))(*(_QWORD *)__dst.__r_.__value_.__l.__data_
                                                                         + 16))(__dst.__r_.__value_.__r.__words[0], v493, &v492);
  v397 = (std::__shared_weak_count *)v492.__r_.__value_.__l.__size_;
  if (v492.__r_.__value_.__l.__size_)
  {
    v398 = (unint64_t *)(v492.__r_.__value_.__l.__size_ + 8);
    do
      v399 = __ldaxr(v398);
    while (__stlxr(v399 - 1, v398));
    if (!v399)
    {
      ((void (*)(std::__shared_weak_count *))v397->__on_zero_shared)(v397);
      std::__shared_weak_count::__release_weak(v397);
    }
  }
  v400 = *(_QWORD **)&v493[24];
  if (*(_BYTE **)&v493[24] == v493)
  {
    v401 = 4;
    v400 = v493;
    goto LABEL_592;
  }
  if (*(_QWORD *)&v493[24])
  {
    v401 = 5;
LABEL_592:
    (*(void (**)(void))(*v400 + 8 * v401))();
  }
  if (__dst.__r_.__value_.__r.__words[0])
  {
    v402 = (*(uint64_t (**)(std::string::size_type))(*(_QWORD *)__dst.__r_.__value_.__l.__data_ + 24))(__dst.__r_.__value_.__r.__words[0]);
    v403 = __dst.__r_.__value_.__r.__words[0];
    __dst.__r_.__value_.__r.__words[0] = 0;
    *(_QWORD *)v493 = v403;
    (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v402 + 48))(v402, v493);
    v404 = *(_QWORD *)v493;
    *(_QWORD *)v493 = 0;
    if (v404)
      (*(void (**)(uint64_t))(*(_QWORD *)v404 + 8))(v404);
    v405 = __dst.__r_.__value_.__r.__words[0];
    __dst.__r_.__value_.__r.__words[0] = 0;
    if (v405)
      (*(void (**)(std::string::size_type))(*(_QWORD *)v405 + 8))(v405);
  }
  do
    v406 = __ldaxr(v388);
  while (__stlxr(v406 - 1, v388));
  if (!v406)
  {
    ((void (*)(std::__shared_weak_count *))v387->__on_zero_shared)(v387);
    std::__shared_weak_count::__release_weak(v387);
  }
  do
    v407 = __ldaxr(v376);
  while (__stlxr(v407 - 1, v376));
  if (!v407)
  {
    ((void (*)(std::__shared_weak_count *))v375->__on_zero_shared)(v375);
    std::__shared_weak_count::__release_weak(v375);
  }
  v408 = v470->_distanceAtlas.__ptr_.__value_;
  v470->_distanceAtlas.__ptr_.__value_ = (DistanceAtlas *)v374;
  if (v408)
  {
    v409 = *((_QWORD *)v408 + 2);
    *((_QWORD *)v408 + 2) = 0;
    if (v409)
      (*(void (**)(uint64_t))(*(_QWORD *)v409 + 8))(v409);
    MEMORY[0x1A1AF4E00](v408, 0x1020C406E52F545);
  }
  v411 = *(StandardLibrary **)a4;
  v410 = *((_QWORD *)a4 + 1);
  if (v410)
  {
    v412 = (unint64_t *)(v410 + 8);
    do
      v413 = __ldxr(v412);
    while (__stxr(v413 + 1, v412));
  }
  v414 = (std::__shared_weak_count *)v470->_shaderLibrary.__cntrl_;
  v470->_shaderLibrary.__ptr_ = v411;
  v470->_shaderLibrary.__cntrl_ = (__shared_weak_count *)v410;
  if (v414)
  {
    v415 = (unint64_t *)&v414->__shared_owners_;
    do
      v416 = __ldaxr(v415);
    while (__stlxr(v416 - 1, v415));
    if (!v416)
    {
      ((void (*)(std::__shared_weak_count *))v414->__on_zero_shared)(v414);
      std::__shared_weak_count::__release_weak(v414);
    }
  }
  v417 = operator new(0x170uLL);
  v417[1] = 0;
  v417[2] = 0;
  *v417 = &off_1E42DC120;
  v418 = md::GeoResourceProvider::GeoResourceProvider((md::GeoResourceProvider *)(v417 + 3));
  v419 = (std::__shared_weak_count *)v470->_resourceProvider.__cntrl_;
  v470->_resourceProvider.__ptr_ = (GeoResourceProvider *)v418;
  v470->_resourceProvider.__cntrl_ = (__shared_weak_count *)v417;
  if (v419)
  {
    v420 = (unint64_t *)&v419->__shared_owners_;
    do
      v421 = __ldaxr(v420);
    while (__stlxr(v421 - 1, v420));
    if (!v421)
    {
      ((void (*)(std::__shared_weak_count *))v419->__on_zero_shared)(v419);
      std::__shared_weak_count::__release_weak(v419);
    }
  }
  v422 = operator new();
  v423 = v422;
  *(_QWORD *)v493 = v470->_resourceProvider.__ptr_;
  v424 = v470->_resourceProvider.__cntrl_;
  *(_QWORD *)&v493[8] = v424;
  if (v424)
  {
    v425 = (unint64_t *)((char *)v424 + 8);
    do
      v426 = __ldxr(v425);
    while (__stxr(v426 + 1, v425));
  }
  grl::FontManager::FontManager(v422, (uint64_t *)v493, 0xAu);
  v427 = (__shared_weak_count *)operator new();
  *(_QWORD *)v427 = &off_1E42E7FA8;
  *((_QWORD *)v427 + 1) = 0;
  *((_QWORD *)v427 + 2) = 0;
  *((_QWORD *)v427 + 3) = v423;
  v428 = (std::__shared_weak_count *)v470->_grlFontManager.__cntrl_;
  v470->_grlFontManager.__ptr_ = (FontManager *)v423;
  v470->_grlFontManager.__cntrl_ = v427;
  if (v428)
  {
    v429 = (unint64_t *)&v428->__shared_owners_;
    do
      v430 = __ldaxr(v429);
    while (__stlxr(v430 - 1, v429));
    if (!v430)
    {
      ((void (*)(std::__shared_weak_count *))v428->__on_zero_shared)(v428);
      std::__shared_weak_count::__release_weak(v428);
    }
  }
  v431 = *(std::__shared_weak_count **)&v493[8];
  if (*(_QWORD *)&v493[8])
  {
    v432 = (unint64_t *)(*(_QWORD *)&v493[8] + 8);
    do
      v433 = __ldaxr(v432);
    while (__stlxr(v433 - 1, v432));
    if (!v433)
    {
      ((void (*)(std::__shared_weak_count *))v431->__on_zero_shared)(v431);
      std::__shared_weak_count::__release_weak(v431);
    }
  }
  v434 = operator new(0x218uLL);
  std::__shared_ptr_emplace<grl::IconManager>::__shared_ptr_emplace[abi:nn180100]<std::shared_ptr<md::GeoResourceProvider> &,std::shared_ptr<grl::FontManager> &,std::allocator<grl::IconManager>,0>(v434, (uint64_t)v470->_resourceProvider.__ptr_, (std::__shared_weak_count *)v470->_resourceProvider.__cntrl_, &v470->_grlFontManager.__ptr_);
  v435 = (std::__shared_weak_count *)v470->_grlIconManager.__cntrl_;
  v470->_grlIconManager.__ptr_ = (IconManager *)(v434 + 3);
  v470->_grlIconManager.__cntrl_ = (__shared_weak_count *)v434;
  if (v435)
  {
    v436 = (unint64_t *)&v435->__shared_owners_;
    do
      v437 = __ldaxr(v436);
    while (__stlxr(v437 - 1, v436));
    if (!v437)
    {
      ((void (*)(std::__shared_weak_count *))v435->__on_zero_shared)(v435);
      std::__shared_weak_count::__release_weak(v435);
    }
  }
  grl::IconManager::setPackCacheSize((grl::IconManager *)v470->_grlIconManager.__ptr_, 10);
  grl::IconManager::setConfigPackLocationCacheSize((grl::IconManager *)v470->_grlIconManager.__ptr_, 10);
  grl::IconManager::setDataPackImageAtlasSize((grl::IconManager *)v470->_grlIconManager.__ptr_, 10);
  v438 = [VKInternalIconManager alloc];
  v439 = v470->_grlIconManager.__cntrl_;
  v481 = v470->_grlIconManager.__ptr_;
  v482 = (std::__shared_weak_count *)v439;
  if (v439)
  {
    v440 = (unint64_t *)((char *)v439 + 8);
    do
      v441 = __ldxr(v440);
    while (__stxr(v441 + 1, v440));
  }
  v442 = v470->_stylesheetVendor.__cntrl_;
  v479 = v470->_stylesheetVendor.__ptr_;
  v480 = (std::__shared_weak_count *)v442;
  if (v442)
  {
    v443 = (unint64_t *)((char *)v442 + 8);
    do
      v444 = __ldxr(v443);
    while (__stxr(v444 + 1, v443));
  }
  v445 = -[VKInternalIconManager init:stylesheetVendor:](v438, "init:stylesheetVendor:", &v481, &v479);
  v446 = v445;
  objc_storeStrong((id *)&v470->_iconManager._obj, v445);

  v447 = v480;
  if (v480)
  {
    v448 = (unint64_t *)&v480->__shared_owners_;
    do
      v449 = __ldaxr(v448);
    while (__stlxr(v449 - 1, v448));
    if (!v449)
    {
      ((void (*)(std::__shared_weak_count *))v447->__on_zero_shared)(v447);
      std::__shared_weak_count::__release_weak(v447);
    }
  }
  v450 = v482;
  if (v482)
  {
    v451 = (unint64_t *)&v482->__shared_owners_;
    do
      v452 = __ldaxr(v451);
    while (__stlxr(v452 - 1, v451));
    if (!v452)
    {
      ((void (*)(std::__shared_weak_count *))v450->__on_zero_shared)(v450);
      std::__shared_weak_count::__release_weak(v450);
    }
  }
  v470->_defaultDecompressionSession = 0;
  v470->_snapshotterIsInService = 0;
  v453 = operator new();
  v454 = *(_BYTE *)(*((_QWORD *)v470->_device.__ptr_.__value_ + 1) + 20);
  *(_OWORD *)(v453 + 40) = 0u;
  *(_OWORD *)(v453 + 24) = 0u;
  *(_OWORD *)(v453 + 8) = 0u;
  *(_BYTE *)(v453 + 56) = v454;
  *(_QWORD *)v453 = &off_1E42A6D08;
  md::CommandBufferSelector::init((md::CommandBufferSelector *)v453, &md::kStandardCommandBufferIdCount);
  v455 = (__shared_weak_count *)operator new();
  *(_QWORD *)v455 = &off_1E42E72C0;
  *((_QWORD *)v455 + 1) = 0;
  *((_QWORD *)v455 + 2) = 0;
  *((_QWORD *)v455 + 3) = v453;
  v456 = (std::__shared_weak_count *)v470->_standardCommandBufferSelector.__cntrl_;
  v470->_standardCommandBufferSelector.__ptr_ = (StandardCommandBufferSelector *)v453;
  v470->_standardCommandBufferSelector.__cntrl_ = v455;
  if (v456)
  {
    v457 = (unint64_t *)&v456->__shared_owners_;
    do
      v458 = __ldaxr(v457);
    while (__stlxr(v458 - 1, v457));
    if (!v458)
    {
      ((void (*)(std::__shared_weak_count *))v456->__on_zero_shared)(v456);
      std::__shared_weak_count::__release_weak(v456);
    }
  }
  v459 = operator new();
  v460 = *(_BYTE *)(*((_QWORD *)v470->_device.__ptr_.__value_ + 1) + 20);
  *(_OWORD *)(v459 + 40) = 0u;
  *(_OWORD *)(v459 + 24) = 0u;
  *(_OWORD *)(v459 + 8) = 0u;
  *(_BYTE *)(v459 + 56) = v460;
  *(_QWORD *)v459 = &off_1E42A7BD0;
  *(_QWORD *)v493 = 21;
  md::CommandBufferSelector::init((md::CommandBufferSelector *)v459, (unint64_t *)v493);
  v461 = (__shared_weak_count *)operator new();
  *(_QWORD *)v461 = &off_1E42E72F8;
  *((_QWORD *)v461 + 1) = 0;
  *((_QWORD *)v461 + 2) = 0;
  *((_QWORD *)v461 + 3) = v459;
  v462 = (std::__shared_weak_count *)v470->_realisticCommandBufferSelector.__cntrl_;
  v470->_realisticCommandBufferSelector.__ptr_ = (RealisticCommandBufferSelector *)v459;
  v470->_realisticCommandBufferSelector.__cntrl_ = v461;
  if (v462)
  {
    v463 = (unint64_t *)&v462->__shared_owners_;
    do
      v464 = __ldaxr(v463);
    while (__stlxr(v464 - 1, v463));
    if (!v464)
    {
      ((void (*)(std::__shared_weak_count *))v462->__on_zero_shared)(v462);
      std::__shared_weak_count::__release_weak(v462);
    }
  }
  atomic_store(0, &v470->_globalFrameStamp.__a_.__a_value);
  v6 = v470;
LABEL_666:

  return v6;
}

- (void)device
{
  return self->_device.__ptr_.__value_;
}

- (const)dataOverrideManager
{
  return &self->_dataOverrideManager;
}

- (void)setSnapshotterIsInService:(BOOL)a3
{
  self->_snapshotterIsInService = a3;
}

- (id).cxx_construct
{
  read_write_lock *p_figCreationLock;
  geo::read_write_lock *v4;
  const char *v5;

  *(_OWORD *)&self->_figCreationLock._lock.__sig = 0u;
  p_figCreationLock = &self->_figCreationLock;
  *(_QWORD *)&p_figCreationLock[-2]._lock.__opaque[168] = &off_1E42B4F70;
  *(_QWORD *)&p_figCreationLock[-2]._lock.__opaque[176] = 0;
  *(_OWORD *)&p_figCreationLock[-1]._lock.__sig = 0u;
  *(_OWORD *)&p_figCreationLock[-1]._lock.__opaque[8] = 0u;
  *(_QWORD *)&p_figCreationLock[-1]._lock.__opaque[24] = 0;
  *(_QWORD *)&p_figCreationLock[-1]._lock.__opaque[32] = &off_1E42B4D10;
  *(_QWORD *)&p_figCreationLock[-1]._lock.__opaque[40] = 0;
  *(_OWORD *)&p_figCreationLock->_lock.__opaque[8] = 0u;
  *(_OWORD *)&p_figCreationLock->_lock.__opaque[24] = 0u;
  *(_OWORD *)&p_figCreationLock->_lock.__opaque[40] = 0u;
  *(_OWORD *)&p_figCreationLock->_lock.__opaque[56] = 0u;
  *(_OWORD *)&p_figCreationLock->_lock.__opaque[72] = 0u;
  *(_OWORD *)&p_figCreationLock->_lock.__opaque[88] = 0u;
  *(_OWORD *)&p_figCreationLock->_lock.__opaque[104] = 0u;
  *(_OWORD *)&p_figCreationLock->_lock.__opaque[120] = 0u;
  *(_OWORD *)&p_figCreationLock->_lock.__opaque[136] = 0u;
  *(_OWORD *)&p_figCreationLock->_lock.__opaque[152] = 0u;
  *(_OWORD *)&p_figCreationLock->_lock.__opaque[168] = 0u;
  *(_QWORD *)&p_figCreationLock->_lock.__opaque[184] = 0;
  *(_OWORD *)&p_figCreationLock[-1]._lock.__opaque[168] = 0u;
  *(_OWORD *)&p_figCreationLock[-1]._lock.__opaque[152] = 0u;
  *(_OWORD *)&p_figCreationLock[-1]._lock.__opaque[136] = 0u;
  *(_OWORD *)&p_figCreationLock[-1]._lock.__opaque[120] = 0u;
  *(_OWORD *)&p_figCreationLock[-1]._lock.__opaque[104] = 0u;
  *(_OWORD *)&p_figCreationLock[-1]._lock.__opaque[88] = 0u;
  *(_OWORD *)&p_figCreationLock[-1]._lock.__opaque[72] = 0u;
  *(_OWORD *)&p_figCreationLock[-1]._lock.__opaque[56] = 0u;
  v4 = (geo::read_write_lock *)pthread_rwlock_init(&p_figCreationLock->_lock, 0);
  if ((_DWORD)v4)
    geo::read_write_lock::logFailure(v4, (uint64_t)"initialization", v5);
  self->_grlIconManager = 0u;
  self->_grlFontManager = 0u;
  self->_resourceProvider = 0u;
  self->_globalFrameStamp.__a_.__a_value = 0;
  self->_undulationModelCreationFlag.__state_ = 0;
  return self;
}

- (VKResourceManager)resourceManager
{
  return self->_resourceManager._obj;
}

- (shared_ptr<md::RealisticCommandBufferSelector>)realisticCommandBufferSelector
{
  RealisticCommandBufferSelector **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<md::RealisticCommandBufferSelector> result;

  cntrl = self->_realisticCommandBufferSelector.__cntrl_;
  *v2 = self->_realisticCommandBufferSelector.__ptr_;
  v2[1] = (RealisticCommandBufferSelector *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (RealisticCommandBufferSelector *)self;
  return result;
}

- (VKInternalIconManager)iconManager
{
  return self->_iconManager._obj;
}

- (void)undulationModel
{
  once_flag *p_undulationModelCreationFlag;
  unint64_t v3;
  VKSharedResources **v5;
  VKSharedResources *v6;
  VKSharedResources ****v7;
  VKSharedResources ***v8;

  v6 = self;
  p_undulationModelCreationFlag = &self->_undulationModelCreationFlag;
  v5 = &v6;
  v3 = atomic_load(&p_undulationModelCreationFlag->__state_);
  if (v3 != -1)
  {
    v8 = &v5;
    v7 = &v8;
    std::__call_once(&p_undulationModelCreationFlag->__state_, &v7, (void (__cdecl *)(void *))std::__call_once_proxy[abi:nn180100]<std::tuple<-[VKSharedResources undulationModel]::$_0 &&>>);
  }
  return v6->_undulationModel.__ptr_.__value_;
}

- (CMPhotoDecompressionSession)defaultDecompressionSession
{
  read_write_lock *p_figCreationLock;
  geo::read_write_lock *v4;
  const char *v5;
  CMPhotoDecompressionSession *defaultDecompressionSession;
  geo::read_write_lock *v7;
  const char *v8;

  p_figCreationLock = &self->_figCreationLock;
  v4 = (geo::read_write_lock *)pthread_rwlock_rdlock(&self->_figCreationLock._lock);
  if ((_DWORD)v4)
    geo::read_write_lock::logFailure(v4, (uint64_t)"read lock", v5);
  defaultDecompressionSession = self->_defaultDecompressionSession;
  v7 = (geo::read_write_lock *)pthread_rwlock_unlock(&p_figCreationLock->_lock);
  if (defaultDecompressionSession)
  {
    if ((_DWORD)v7)
      geo::read_write_lock::logFailure(v7, (uint64_t)"unlock", v8);
  }
  else
  {
    if ((_DWORD)v7)
      geo::read_write_lock::logFailure(v7, (uint64_t)"unlock", v8);
    -[VKSharedResources startDecompressionSession](self, "startDecompressionSession");
  }
  return self->_defaultDecompressionSession;
}

- (void)dealloc
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  __shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  __shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  __shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  VKInternalIconManager *obj;
  __shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  __shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  VKResourceManager *v22;
  AlphaAtlas *value;
  uint64_t v24;
  IsoAlphaAtlas *v25;
  std::__shared_weak_count *v26;
  unint64_t *p_shared_owners;
  unint64_t v28;
  uint64_t v29;
  IsoAlphaAtlas *v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  uint64_t v34;
  DistanceAtlas *v35;
  uint64_t v36;
  __shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  Device *v40;
  md::SharedDeviceResources *v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  NSObject *v45;
  gss::Allocator *v46;
  uint64_t v47;
  unsigned __int8 v48;
  unsigned __int8 v49;
  grl::Allocator *v50;
  uint64_t v51;
  geo::codec::Allocator *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  objc_super v56;
  uint8_t buf[16];

  cntrl = self->_grlIconManager.__cntrl_;
  self->_grlIconManager.__ptr_ = 0;
  self->_grlIconManager.__cntrl_ = 0;
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
  v6 = self->_grlFontManager.__cntrl_;
  self->_grlFontManager.__ptr_ = 0;
  self->_grlFontManager.__cntrl_ = 0;
  if (v6)
  {
    v7 = (unint64_t *)((char *)v6 + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)v6 + 16))(v6, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v6);
    }
  }
  v9 = self->_resourceProvider.__cntrl_;
  self->_resourceProvider.__ptr_ = 0;
  self->_resourceProvider.__cntrl_ = 0;
  if (v9)
  {
    v10 = (unint64_t *)((char *)v9 + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)v9 + 16))(v9, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v9);
    }
  }
  v12 = self->_stylesheetVendor.__cntrl_;
  self->_stylesheetVendor.__ptr_ = 0;
  self->_stylesheetVendor.__cntrl_ = 0;
  if (v12)
  {
    v13 = (unint64_t *)((char *)v12 + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)v12 + 16))(v12, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v12);
    }
  }
  obj = self->_iconManager._obj;
  if (obj)
  {
    self->_iconManager._obj = 0;

  }
  v16 = self->_textureManager.__cntrl_;
  self->_textureManager.__ptr_ = 0;
  self->_textureManager.__cntrl_ = 0;
  if (v16)
  {
    v17 = (unint64_t *)((char *)v16 + 8);
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)v16 + 16))(v16, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v16);
    }
  }
  v19 = self->_materialTextureManager.__cntrl_;
  self->_materialTextureManager.__ptr_ = 0;
  self->_materialTextureManager.__cntrl_ = 0;
  if (v19)
  {
    v20 = (unint64_t *)((char *)v19 + 8);
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)v19 + 16))(v19, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v19);
    }
  }
  v22 = self->_resourceManager._obj;
  if (v22)
  {
    self->_resourceManager._obj = 0;

  }
  value = self->_alphaAtlas.__ptr_.__value_;
  self->_alphaAtlas.__ptr_.__value_ = 0;
  if (value)
  {
    v24 = *((_QWORD *)value + 3);
    *((_QWORD *)value + 3) = 0;
    if (v24)
      (*(void (**)(uint64_t, SEL))(*(_QWORD *)v24 + 8))(v24, a2);
    MEMORY[0x1A1AF4E00](value, 0x1020C40764CE0E8);
  }
  v25 = self->_highInflationAlphaAtlas.__ptr_.__value_;
  self->_highInflationAlphaAtlas.__ptr_.__value_ = 0;
  if (v25)
  {
    v26 = (std::__shared_weak_count *)*((_QWORD *)v25 + 4);
    if (v26)
    {
      p_shared_owners = (unint64_t *)&v26->__shared_owners_;
      do
        v28 = __ldaxr(p_shared_owners);
      while (__stlxr(v28 - 1, p_shared_owners));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *, SEL))v26->__on_zero_shared)(v26, a2);
        std::__shared_weak_count::__release_weak(v26);
      }
    }
    v29 = *((_QWORD *)v25 + 2);
    *((_QWORD *)v25 + 2) = 0;
    if (v29)
      (*(void (**)(uint64_t, SEL))(*(_QWORD *)v29 + 8))(v29, a2);
    MEMORY[0x1A1AF4E00](v25, 0x1020C4081634310);
  }
  v30 = self->_isoAlphaAtlas.__ptr_.__value_;
  self->_isoAlphaAtlas.__ptr_.__value_ = 0;
  if (v30)
  {
    v31 = (std::__shared_weak_count *)*((_QWORD *)v30 + 4);
    if (v31)
    {
      v32 = (unint64_t *)&v31->__shared_owners_;
      do
        v33 = __ldaxr(v32);
      while (__stlxr(v33 - 1, v32));
      if (!v33)
      {
        ((void (*)(std::__shared_weak_count *, SEL))v31->__on_zero_shared)(v31, a2);
        std::__shared_weak_count::__release_weak(v31);
      }
    }
    v34 = *((_QWORD *)v30 + 2);
    *((_QWORD *)v30 + 2) = 0;
    if (v34)
      (*(void (**)(uint64_t, SEL))(*(_QWORD *)v34 + 8))(v34, a2);
    MEMORY[0x1A1AF4E00](v30, 0x1020C4081634310);
  }
  v35 = self->_distanceAtlas.__ptr_.__value_;
  self->_distanceAtlas.__ptr_.__value_ = 0;
  if (v35)
  {
    v36 = *((_QWORD *)v35 + 2);
    *((_QWORD *)v35 + 2) = 0;
    if (v36)
      (*(void (**)(uint64_t, SEL))(*(_QWORD *)v36 + 8))(v36, a2);
    MEMORY[0x1A1AF4E00](v35, 0x1020C406E52F545);
  }
  v37 = self->_shaderLibrary.__cntrl_;
  self->_shaderLibrary.__ptr_ = 0;
  self->_shaderLibrary.__cntrl_ = 0;
  if (v37)
  {
    v38 = (unint64_t *)((char *)v37 + 8);
    do
      v39 = __ldaxr(v38);
    while (__stlxr(v39 - 1, v38));
    if (!v39)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)v37 + 16))(v37, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v37);
    }
  }
  v40 = self->_device.__ptr_.__value_;
  self->_device.__ptr_.__value_ = 0;
  if (v40)
  {
    v41 = (md::SharedDeviceResources *)*((_QWORD *)v40 + 3);
    *((_QWORD *)v40 + 3) = 0;
    if (v41)
    {
      md::SharedDeviceResources::~SharedDeviceResources(v41);
      MEMORY[0x1A1AF4E00]();
    }
    v42 = (std::__shared_weak_count *)*((_QWORD *)v40 + 2);
    if (v42)
    {
      v43 = (unint64_t *)&v42->__shared_owners_;
      do
        v44 = __ldaxr(v43);
      while (__stlxr(v44 - 1, v43));
      if (!v44)
      {
        ((void (*)(std::__shared_weak_count *, SEL))v42->__on_zero_shared)(v42, a2);
        std::__shared_weak_count::__release_weak(v42);
      }
    }
    MEMORY[0x1A1AF4E00](v40, 0x1020C40E72D6CFBLL);
  }
  if (self->_snapshotterIsInService)
  {
    CTFontRemoveFromCaches();
    CGFontDBGetLocal();
    CGFontDBPurgeAllFonts();
    CGFontCacheGetLocalCache();
    CGFontCacheReset();
  }
  if (self->_defaultDecompressionSession)
  {
    CMPhotoDecompressionSessionReleaseHardwareResources();
    CMPhotoDecompressionSessionFlushCachedBuffers();
    CFRelease(self->_defaultDecompressionSession);
    self->_defaultDecompressionSession = 0;
  }
  if (GEOConfigGetBOOL())
  {
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
    v45 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F029000, v45, OS_LOG_TYPE_INFO, "Resetting memory allocators", buf, 2u);
    }

    v47 = gss::Allocator::instance(v46);
    (*(void (**)(uint64_t))(*(_QWORD *)v47 + 48))(v47);
    {
      v54 = operator new();
      ggl::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v54, "GeoGL", 0xA3D02C1100000005);
    }
    (*(void (**)(uint64_t))(*(_QWORD *)ggl::Allocator::instance(void)::alloc + 48))(ggl::Allocator::instance(void)::alloc);
    {
      v55 = operator new();
      mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v55, "VectorKitLabels", 0x5ED09DD50000000FLL);
    }
    v50 = (grl::Allocator *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)mdm::Allocator::instance(void)::alloc + 48))(mdm::Allocator::instance(void)::alloc);
    v51 = grl::Allocator::instance(v50);
    v52 = (geo::codec::Allocator *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v51 + 48))(v51);
    v53 = geo::codec::Allocator::instance(v52);
    (*(void (**)(uint64_t))(*(_QWORD *)v53 + 48))(v53);
    GEOResetGeoCodecsAllocator();
  }
  v56.receiver = self;
  v56.super_class = (Class)VKSharedResources;
  -[VKSharedResources dealloc](&v56, sel_dealloc);
}

- (void)_removeResourceUser
{
  unsigned int referenceCount;

  referenceCount = self->_referenceCount;
  if (referenceCount)
    self->_referenceCount = referenceCount - 1;
}

- (BOOL)_hasResourceUsers
{
  return self->_referenceCount != 0;
}

- (void)prune:(unsigned __int8)a3
{
  int v3;

  v3 = a3;
  md::TextureManager::purge((md::TextureManager *)self->_textureManager.__ptr_);
  md::MaterialTextureManager::purge((pthread_rwlock_t *)self->_materialTextureManager.__ptr_);
  if ((v3 - 1) <= 1)
  {
    -[VKInternalIconManager purge](self->_iconManager._obj, "purge");
    -[VKSharedResources purgeDecompressSessionCachedBuffers](self, "purgeDecompressSessionCachedBuffers");
  }
}

- (void)purgeDecompressSessionCachedBuffers
{
  MEMORY[0x1A1AF3F00]();
  CMPhotoDecompressionSessionFlushCachedBuffers();
}

- (void)startDecompressionSession
{
  read_write_lock *p_figCreationLock;
  geo::read_write_lock *v4;
  const char *v5;
  geo::read_write_lock *v6;
  const char *v7;

  p_figCreationLock = &self->_figCreationLock;
  v4 = (geo::read_write_lock *)pthread_rwlock_wrlock(&self->_figCreationLock._lock);
  if ((_DWORD)v4)
    geo::read_write_lock::logFailure(v4, (uint64_t)"write lock", v5);
  if (!self->_defaultDecompressionSession)
    CMPhotoDecompressionSessionCreate();
  v6 = (geo::read_write_lock *)pthread_rwlock_unlock(&p_figCreationLock->_lock);
  if ((_DWORD)v6)
    geo::read_write_lock::logFailure(v6, (uint64_t)"unlock", v7);
}

- (BOOL)snapshotterIsInService
{
  return self->_snapshotterIsInService;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  __shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  __shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  geo::read_write_lock *v12;
  const char *v13;
  __shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  DistanceAtlas *value;
  uint64_t v18;
  IsoAlphaAtlas *v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  uint64_t v23;
  IsoAlphaAtlas *v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  AlphaAtlas *v29;
  uint64_t v30;
  GeoidModel *v31;
  void *v32;
  Device *v33;
  md::SharedDeviceResources *v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  __shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  __shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  __shared_weak_count *v44;
  unint64_t *v45;
  unint64_t v46;
  __shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  SharedResourcesManager *v50;
  __shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  __shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;

  cntrl = self->_grlFontManager.__cntrl_;
  if (!cntrl)
    goto LABEL_5;
  v4 = (unint64_t *)((char *)cntrl + 8);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 - 1, v4));
  if (!v5)
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    v6 = self->_grlIconManager.__cntrl_;
    if (!v6)
      goto LABEL_11;
  }
  else
  {
LABEL_5:
    v6 = self->_grlIconManager.__cntrl_;
    if (!v6)
      goto LABEL_11;
  }
  v7 = (unint64_t *)((char *)v6 + 8);
  do
    v8 = __ldaxr(v7);
  while (__stlxr(v8 - 1, v7));
  if (!v8)
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)v6 + 16))(v6, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v6);
  }
LABEL_11:
  v9 = self->_resourceProvider.__cntrl_;
  if (v9)
  {
    v10 = (unint64_t *)((char *)v9 + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)v9 + 16))(v9, a2);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v9);
    }
  }
  v12 = (geo::read_write_lock *)pthread_rwlock_destroy(&self->_figCreationLock._lock);
  if ((_DWORD)v12)
    geo::read_write_lock::logFailure(v12, (uint64_t)"destruction", v13);
  v14 = self->_shaderLibrary.__cntrl_;
  if (v14)
  {
    v15 = (unint64_t *)((char *)v14 + 8);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)v14 + 16))(v14);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v14);
    }
  }
  value = self->_distanceAtlas.__ptr_.__value_;
  self->_distanceAtlas.__ptr_.__value_ = 0;
  if (value)
  {
    v18 = *((_QWORD *)value + 2);
    *((_QWORD *)value + 2) = 0;
    if (v18)
      (*(void (**)(uint64_t))(*(_QWORD *)v18 + 8))(v18);
    MEMORY[0x1A1AF4E00](value, 0x1020C406E52F545);
  }
  v19 = self->_isoAlphaAtlas.__ptr_.__value_;
  self->_isoAlphaAtlas.__ptr_.__value_ = 0;
  if (v19)
  {
    v20 = (std::__shared_weak_count *)*((_QWORD *)v19 + 4);
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
    v23 = *((_QWORD *)v19 + 2);
    *((_QWORD *)v19 + 2) = 0;
    if (v23)
      (*(void (**)(uint64_t))(*(_QWORD *)v23 + 8))(v23);
    MEMORY[0x1A1AF4E00](v19, 0x1020C4081634310);
  }
  v24 = self->_highInflationAlphaAtlas.__ptr_.__value_;
  self->_highInflationAlphaAtlas.__ptr_.__value_ = 0;
  if (v24)
  {
    v25 = (std::__shared_weak_count *)*((_QWORD *)v24 + 4);
    if (v25)
    {
      v26 = (unint64_t *)&v25->__shared_owners_;
      do
        v27 = __ldaxr(v26);
      while (__stlxr(v27 - 1, v26));
      if (!v27)
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
      }
    }
    v28 = *((_QWORD *)v24 + 2);
    *((_QWORD *)v24 + 2) = 0;
    if (v28)
      (*(void (**)(uint64_t))(*(_QWORD *)v28 + 8))(v28);
    MEMORY[0x1A1AF4E00](v24, 0x1020C4081634310);
  }
  v29 = self->_alphaAtlas.__ptr_.__value_;
  self->_alphaAtlas.__ptr_.__value_ = 0;
  if (v29)
  {
    v30 = *((_QWORD *)v29 + 3);
    *((_QWORD *)v29 + 3) = 0;
    if (v30)
      (*(void (**)(uint64_t))(*(_QWORD *)v30 + 8))(v30);
    MEMORY[0x1A1AF4E00](v29, 0x1020C40764CE0E8);
  }
  v31 = self->_undulationModel.__ptr_.__value_;
  self->_undulationModel.__ptr_.__value_ = 0;
  if (v31)
  {
    v32 = *(void **)v31;
    if (*(_QWORD *)v31)
    {
      *((_QWORD *)v31 + 1) = v32;
      operator delete(v32);
    }
    MEMORY[0x1A1AF4E00](v31, 0x1010C4028866157);
  }
  v33 = self->_device.__ptr_.__value_;
  self->_device.__ptr_.__value_ = 0;
  if (v33)
  {
    v34 = (md::SharedDeviceResources *)*((_QWORD *)v33 + 3);
    *((_QWORD *)v33 + 3) = 0;
    if (v34)
    {
      md::SharedDeviceResources::~SharedDeviceResources(v34);
      MEMORY[0x1A1AF4E00]();
    }
    v35 = (std::__shared_weak_count *)*((_QWORD *)v33 + 2);
    if (v35)
    {
      v36 = (unint64_t *)&v35->__shared_owners_;
      do
        v37 = __ldaxr(v36);
      while (__stlxr(v37 - 1, v36));
      if (!v37)
      {
        ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
        std::__shared_weak_count::__release_weak(v35);
      }
    }
    MEMORY[0x1A1AF4E00](v33, 0x1020C40E72D6CFBLL);
  }
  v38 = self->_realisticCommandBufferSelector.__cntrl_;
  if (!v38)
    goto LABEL_66;
  v39 = (unint64_t *)((char *)v38 + 8);
  do
    v40 = __ldaxr(v39);
  while (__stlxr(v40 - 1, v39));
  if (!v40)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)v38 + 16))(v38);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v38);
    v41 = self->_standardCommandBufferSelector.__cntrl_;
    if (!v41)
      goto LABEL_72;
  }
  else
  {
LABEL_66:
    v41 = self->_standardCommandBufferSelector.__cntrl_;
    if (!v41)
      goto LABEL_72;
  }
  v42 = (unint64_t *)((char *)v41 + 8);
  do
    v43 = __ldaxr(v42);
  while (__stlxr(v43 - 1, v42));
  if (!v43)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)v41 + 16))(v41);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v41);
  }
LABEL_72:
  v44 = self->_dataOverrideManager.__cntrl_;
  if (!v44)
    goto LABEL_76;
  v45 = (unint64_t *)((char *)v44 + 8);
  do
    v46 = __ldaxr(v45);
  while (__stlxr(v46 - 1, v45));
  if (!v46)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)v44 + 16))(v44);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v44);
    v47 = self->_stylesheetVendor.__cntrl_;
    if (!v47)
      goto LABEL_82;
  }
  else
  {
LABEL_76:
    v47 = self->_stylesheetVendor.__cntrl_;
    if (!v47)
      goto LABEL_82;
  }
  v48 = (unint64_t *)((char *)v47 + 8);
  do
    v49 = __ldaxr(v48);
  while (__stlxr(v49 - 1, v48));
  if (!v49)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)v47 + 16))(v47);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v47);
  }
LABEL_82:
  self->_resourceManager._vptr$_retain_ptr = (void **)&off_1E42B4D10;

  v50 = self->_sharedResourceManager.__ptr_.__value_;
  self->_sharedResourceManager.__ptr_.__value_ = 0;
  if (v50)
  {
    md::SharedResourcesManager::~SharedResourcesManager((md::SharedResourcesManager *)v50);
    MEMORY[0x1A1AF4E00]();
  }
  v51 = self->_materialTextureManager.__cntrl_;
  if (!v51)
    goto LABEL_88;
  v52 = (unint64_t *)((char *)v51 + 8);
  do
    v53 = __ldaxr(v52);
  while (__stlxr(v53 - 1, v52));
  if (!v53)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)v51 + 16))(v51);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v51);
    v54 = self->_textureManager.__cntrl_;
    if (!v54)
      goto LABEL_94;
  }
  else
  {
LABEL_88:
    v54 = self->_textureManager.__cntrl_;
    if (!v54)
      goto LABEL_94;
  }
  v55 = (unint64_t *)((char *)v54 + 8);
  do
    v56 = __ldaxr(v55);
  while (__stlxr(v56 - 1, v55));
  if (!v56)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)v54 + 16))(v54);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v54);
  }
LABEL_94:
  self->_iconManager._vptr$_retain_ptr = (void **)&off_1E42B4F70;

}

@end
