@implementation PTEffectRenderer

- (BOOL)isRenderRequiredForRequest:(id)a3
{
  id v4;
  char v5;
  BOOL v6;
  char v7;
  BOOL v8;
  double v10;
  double v11;
  void *v12;
  PTEffectReactionProvider *reactionProvider;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  PTEffectReactionProvider *v18;
  BOOL v19;
  _QWORD v20[3];

  v4 = a3;
  v5 = objc_msgSend(v4, "effectType");
  if (self->_frameIndex)
    v6 = (v5 & 0x4F) == 0;
  else
    v6 = 0;
  if (!v6)
    goto LABEL_7;
  v7 = v5;
  if (-[PTBackgroundReplacement updateAndGetBackgroundState:frameIndex:](self->_backgroundReplacement, "updateAndGetBackgroundState:frameIndex:", v4))
  {
    goto LABEL_7;
  }
  if ((v7 & 0x10) != 0)
  {
    -[PTVFXRenderEffect activeReactions](self->_vfxEffect, "activeReactions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {

      goto LABEL_7;
    }
    objc_msgSend(v4, "reactions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17)
      goto LABEL_7;
  }
  objc_msgSend(v4, "frameTimeSeconds");
  if ((v7 & 0x20) == 0)
  {
LABEL_11:
    objc_msgSend(v4, "frameTimeSeconds");
    v8 = 0;
    self->_lastFrameTime = v11;
    *(_WORD *)&self->_runCVMNetworkPreviousFrame = 0;
    self->_networkFrameIndex = 0;
    goto LABEL_8;
  }
  reactionProvider = self->_reactionProvider;
  if (reactionProvider)
  {
    v14 = v10;
    -[PTEffectReactionProvider latestReactions](reactionProvider, "latestReactions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count"))
    {

    }
    else
    {
      v18 = self->_reactionProvider;
      v20[0] = (uint64_t)(v14 * 100000.0);
      v20[1] = 0x1000186A0;
      v20[2] = 0;
      v19 = -[PTEffectReactionProvider runGestureDetectionForTimeStamp:](v18, "runGestureDetectionForTimeStamp:", v20);

      if (!v19)
        goto LABEL_11;
    }
  }
LABEL_7:
  v8 = 1;
LABEL_8:

  return v8;
}

- (id)activeReactions
{
  void *v2;
  void *v3;

  -[PTVFXRenderEffect activeReactions](self->_vfxEffect, "activeReactions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (void)setEffectQuality:(int64_t)a3
{
  self->effectQuality = a3;
}

- (void)setDebug:(int64_t)a3
{
  self->_debugType = a3;
}

- (PTEffectRenderer)initWithDescriptor:(id)a3 metalContext:(id)a4 useHighResNetwork:(BOOL)a5 faceAttributesNetwork:(id)a6 humanDetections:(id)a7 prevTemporalState:(id)a8 asyncInitQueue:(id)a9 sharedResources:(id)a10
{
  id v15;
  id v16;
  id v17;
  PTEffectRenderer *v18;
  PTEffectRenderer *v19;
  id *p_metalContext;
  uint64_t v21;
  PTEffectDescriptor *effectDescriptor;
  const __CFAllocator *v23;
  const __CFDictionary *v24;
  void *v25;
  __CVMetalTextureCache **p_textureCache;
  NSObject *v27;
  PTEffectRenderer *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t availableEffectTypes;
  unsigned int v33;
  _BOOL4 v34;
  dispatch_queue_t v36;
  OS_dispatch_queue *asyncQueue;
  double v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  double v42;
  unint64_t v43;
  PTTextureYUV **intermediateYUV;
  char v45;
  char v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  PTTextureYUV *v52;
  float v53;
  void *v54;
  void *v55;
  float v56;
  char *v57;
  void *v58;
  float v59;
  char *v60;
  void *v61;
  float v62;
  char *v63;
  void *v64;
  uint64_t v65;
  MTLBuffer *faceDisparityArray;
  void *v67;
  uint64_t v68;
  MTLBuffer *focusDisparityRaw;
  void *v70;
  uint64_t v71;
  MTLBuffer *useDisparityBufferForReactions;
  PTEffectUtil *v73;
  PTEffectUtil *effectUtil;
  PTUtil *v75;
  PTUtil *util;
  PTCVMNetwork *cvmNetwork;
  PTMSRResize *msrColorPyramid;
  PTEspressoGenericExecutor *v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  NSObject *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  NSObject *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  NSObject *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  PTCVMNetwork *v142;
  PTMetalContext *metalContext;
  PTEffectUtil *v144;
  PTUtil *v145;
  uint64_t v146;
  PTCVMNetwork *v147;
  PTCVMNetwork *v148;
  void *v149;
  uint64_t v150;
  void *v151;
  NSObject *v152;
  PTMSRResize *v153;
  PTMetalContext *v154;
  uint64_t v155;
  uint64_t v156;
  PTMSRResize *v157;
  PTMSRResize *v158;
  double v159;
  double v160;
  double v161;
  double v162;
  PTMSRResize *v163;
  PTMetalContext *v164;
  uint64_t v165;
  PTMSRResize *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  PTMSRResize *v181;
  PTMetalContext *v182;
  uint64_t v183;
  PTMSRResize *v184;
  unint64_t v185;
  float v186;
  float v187;
  PTColorConversion *v188;
  PTColorConversion *colorConversion;
  PTNormalAndDiffuseEstimation *v190;
  PTNormalAndDiffuseEstimation *diffuseEstimation;
  uint64_t v192;
  void *v193;
  uint64_t v194;
  MTLTexture *diffuse;
  PTEffectTemporalFilter *v196;
  PTMetalContext *v197;
  unint64_t v198;
  uint64_t v199;
  PTEffectTemporalFilter *temporalFilter;
  void *v201;
  unint64_t v202;
  uint64_t v203;
  MTLTexture *disparityCenteredUpscaledSDOF;
  void *v205;
  uint64_t v206;
  MTLTexture *disparityCenteredUpscaledReactions;
  void *v208;
  uint64_t v209;
  MTLTexture *disparityCenteredUpscaledWithScreenCaptureRect;
  unint64_t v211;
  void *v212;
  void *v213;
  NSObject *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  void *v222;
  uint64_t v223;
  MTLTexture *guideRGBAUpscale;
  void *v225;
  uint64_t v226;
  MTLTexture *guideRGBACoefficients;
  PTGuidedFilter *v228;
  PTMetalContext *v229;
  double v230;
  uint64_t v231;
  PTGuidedFilter *guidedFilter;
  void *v233;
  uint64_t v234;
  MTLTexture *upscaledPersonSegmentation;
  void *v236;
  uint64_t v237;
  MTLBuffer *lastFocus;
  void *v239;
  uint64_t v240;
  MTLBuffer *focusDisparityModifiers;
  void *v242;
  uint64_t v243;
  MTLBuffer *studioLightEffectModifier;
  double v245;
  PTEffectRelighting *v246;
  PTMetalContext *v247;
  unint64_t v248;
  PTEffectUtil *v249;
  uint64_t v250;
  PTMSRResize *v251;
  BOOL studiolightFromSegmentation;
  PTMetalContext *v253;
  PTEffectUtil *v254;
  uint64_t v255;
  PTEffectRelighting *effectRelighting;
  void *v257;
  void *v258;
  NSObject *v259;
  double v260;
  NSObject *v261;
  PTRenderPipelineDescriptor *v262;
  void *v263;
  NSObject *v264;
  PTEffectRenderer *v265;
  void *v266;
  PTRenderPipeline *v267;
  PTRenderPipeline *renderPipeline;
  PTRenderPipeline *v269;
  uint64_t v270;
  PTRenderState *renderState;
  PTRenderState *v272;
  uint64_t v273;
  PTRenderRequest *sdofRenderRequest;
  double v275;
  double v276;
  PTEffectPersonSegmentation *v277;
  PTMetalContext *v278;
  double v279;
  double v280;
  uint64_t v281;
  PTEffectPersonSegmentation *personSegmentation;
  PTMSRResize *v283;
  double v284;
  double v285;
  __CVBuffer *v286;
  PTBackgroundReplacement *v287;
  PTBackgroundReplacement *backgroundReplacement;
  PTEffectDebugLayer *v289;
  PTEffectDebugLayer *debugLayer;
  PTEffectDebugLayer *v291;
  NSObject *v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  NSObject *v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  NSObject *v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  uint64_t v406;
  NSObject *v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  NSObject *v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  void *v423;
  uint64_t v424;
  PTVFXRenderEffect *vfxEffect;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  PTVFXRenderEffect *v440;
  PTMetalContext *v441;
  PTColorConversion *v442;
  uint64_t v443;
  PTHumanDetections *humanDetections;
  uint64_t v445;
  PTVFXRenderEffect *v446;
  PTDepthConverter *v447;
  PTDepthConverter *depthConverter;
  uint64_t v449;
  uint64_t v450;
  uint64_t v451;
  uint64_t v452;
  uint64_t v453;
  uint64_t v454;
  uint64_t v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t v464;
  unint64_t v465;
  unint64_t v466;
  unint64_t v467;
  void *v468;
  unint64_t v469;
  char v470;
  unsigned int v471;
  unint64_t v472;
  PTUtil *v473;
  NSObject *v474;
  _BOOL4 v475;
  void *v476;
  id v477;
  id v478;
  id v479;
  id v480;
  id v481;
  id v482;
  PTEffectRenderer *v483;
  unint64_t v484;
  unint64_t v485;
  _QWORD v486[3];
  int v487;
  _QWORD v488[3];
  _QWORD v489[3];
  __int128 v490;
  uint64_t v491;
  char v492;
  objc_super v493;
  _QWORD v494[3];
  _QWORD v495[3];
  void *v496;
  void *v497;
  __int128 v498;
  __int128 v499;
  int v500;
  uint64_t v501;
  int v502;
  uint64_t v503;
  _QWORD v504[3];

  v475 = a5;
  v504[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v479 = a7;
  v481 = a8;
  v480 = a9;
  v482 = a10;
  v493.receiver = self;
  v493.super_class = (Class)PTEffectRenderer;
  v18 = -[PTEffectRenderer init](&v493, sel_init);
  v483 = v18;
  if (!v18)
  {
    v28 = 0;
    v29 = v479;
    v30 = v481;
    v31 = v482;
    goto LABEL_64;
  }
  v19 = v18;
  v477 = v17;
  v478 = v16;
  PTKTraceInit();
  kdebug_trace();
  p_metalContext = (id *)&v19->_metalContext;
  objc_storeStrong((id *)&v19->_metalContext, a4);
  v21 = objc_msgSend(v15, "copy");
  effectDescriptor = v19->_effectDescriptor;
  v19->_effectDescriptor = (PTEffectDescriptor *)v21;

  v19->_debugType = 0;
  v19->_availableEffectTypes = objc_msgSend(v15, "availableEffectTypes");
  objc_storeStrong((id *)&v19->_sharedResources, a10);
  objc_storeStrong((id *)&v19->_asyncInitQueue, a9);
  objc_storeStrong((id *)&v19->_humanDetections, a7);
  v23 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v503 = *MEMORY[0x1E0CA8F48];
  v504[0] = &unk_1E8252EE8;
  v24 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v504, &v503, 1);
  -[PTMetalContext device](v19->_metalContext, "device");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  p_textureCache = &v19->_textureCache;
  LODWORD(v23) = CVMetalTextureCacheCreate(v23, v24, v25, 0, &v19->_textureCache);

  if ((_DWORD)v23 || !*p_textureCache)
  {
    _PTLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.39();

    *p_textureCache = 0;
  }
  v19->effectQuality = objc_msgSend(v15, "effectQuality");
  availableEffectTypes = v19->_availableEffectTypes;
  v469 = availableEffectTypes & 0x48;
  v470 = availableEffectTypes;
  if ((availableEffectTypes & 3) != 0)
  {
    v33 = 1;
  }
  else
  {
    v34 = (availableEffectTypes & 0x40) == 0;
    if ((availableEffectTypes & 4) != 0 && (availableEffectTypes & 0x48) != 0)
      v34 = 0;
    v33 = v34 & (availableEffectTypes >> 4);
  }
  v471 = v33;
  v19->_studiolightFromSegmentation = +[PTEffectRenderer useStudioLightFromSegmentation:](PTEffectRenderer, "useStudioLightFromSegmentation:", v15);
  v19->_frameIndex = 0;
  *(_WORD *)&v19->_runCVMNetworkPreviousFrame = 0;
  v19->_lastFrameTime = NAN;
  v36 = dispatch_queue_create("com.apple.portrait.async_queue", 0);
  asyncQueue = v19->_asyncQueue;
  v19->_asyncQueue = (OS_dispatch_queue *)v36;

  objc_msgSend(v15, "colorSize");
  v39 = (unint64_t)v38;
  v476 = v15;
  objc_msgSend(v15, "colorSize");
  v40 = 0;
  v485 = v39;
  v41 = v39 >> 1;
  v484 = (unint64_t)v42;
  v43 = (unint64_t)v42 >> 1;
  intermediateYUV = v19->_intermediateYUV;
  v45 = 1;
  do
  {
    v46 = v45;
    objc_msgSend(*p_metalContext, "textureUtil");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "createWithWidth:height:pixelFormat:", v485, v484, 10);
    v48 = objc_claimAutoreleasedReturnValue();

    if (!v48)
    {
      _PTLogSystem();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.1(v48, v82, v83, v84, v85, v86, v87, v88);
      v28 = 0;
      v15 = v476;
      v17 = v477;
      v16 = v478;
      v29 = v479;
      v30 = v481;
      v31 = v482;
      goto LABEL_63;
    }
    objc_msgSend(*p_metalContext, "textureUtil");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "createWithWidth:height:pixelFormat:", v41, v43, 30);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v50)
    {
      _PTLogSystem();
      v89 = objc_claimAutoreleasedReturnValue();
      v15 = v476;
      v17 = v477;
      v30 = v481;
      v31 = v482;
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
        -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.2(v89, v90, v91, v92, v93, v94, v95, v96);
      goto LABEL_52;
    }
    +[PTTexture createYUV420:chroma:](PTTexture, "createYUV420:chroma:", v48, v50);
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = intermediateYUV[v40];
    intermediateYUV[v40] = (PTTextureYUV *)v51;

    if (!intermediateYUV[v40])
    {
      _PTLogSystem();
      v89 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
        -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.3(v89, v97, v98, v99, v100, v101, v102, v103);
      v15 = v476;
      v17 = v477;
      v30 = v481;
      v31 = v482;
LABEL_52:

      v28 = 0;
      v16 = v478;
      v29 = v479;
      goto LABEL_63;
    }

    v45 = 0;
    v40 = 1;
  }
  while ((v46 & 1) != 0);
  if (v475)
    v53 = 0.175;
  else
    v53 = 0.1;
  v483->_focusDisparityMax = 2.0;
  *(_QWORD *)&v483->_focusDisparityUpdateCoefficientSDOF = 0x3F0000003E800000;
  PTDefaultsGetDictionary();
  v48 = objc_claimAutoreleasedReturnValue();
  v483->_disparityFocusOffsetSDOF.disparityOffsetFactor = 0.935;
  *(_QWORD *)&v483->_disparityFocusOffsetSDOF.offsetInMeters = 0x3F80000000000000;
  v483->_disparityFocusOffsetReactions.offsetInMeters = v53;
  v483->_disparityFocusOffsetStudioLight = (PTDisparityFocusOffset)0x3E4CCCCD3F800000;
  -[NSObject objectForKeyedSubscript:](v48, "objectForKeyedSubscript:", CFSTR("PTEffectFocusDisparityMax"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v54;
  v15 = v476;
  v16 = v478;
  v30 = v481;
  v31 = v482;
  if (v54)
  {
    objc_msgSend(v54, "floatValue");
    v483->_focusDisparityMax = v56;
    _PTLogSystem();
    v57 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_DEBUG))
      -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.38(v55, v57);

  }
  -[NSObject objectForKeyedSubscript:](v48, "objectForKeyedSubscript:", CFSTR("PTEffectFocusDisparityExponentialMovingAverage"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    objc_msgSend(v58, "floatValue");
    v483->_focusDisparityUpdateCoefficientSDOF = v59;
    _PTLogSystem();
    v60 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v60, OS_LOG_TYPE_DEBUG))
      -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.37(v58, v60);

  }
  -[NSObject objectForKeyedSubscript:](v48, "objectForKeyedSubscript:", CFSTR("PTEffectFocusDisparityExponentialMovingAverageStudioLight"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v477;
  if (v61)
  {
    objc_msgSend(v61, "floatValue");
    v483->_focusDisparityUpdateCoefficientStudioLight = v62;
    _PTLogSystem();
    v63 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v63, OS_LOG_TYPE_DEBUG))
      -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.36(v61, v63);

  }
  -[PTMetalContext device](v483->_metalContext, "device");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "newBufferWithLength:options:", 16, 0);
  faceDisparityArray = v483->_faceDisparityArray;
  v483->_faceDisparityArray = (MTLBuffer *)v65;

  if (!v483->_faceDisparityArray)
  {
    _PTLogSystem();
    v104 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
      -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.4(v104, v105, v106, v107, v108, v109, v110, v111);
    goto LABEL_61;
  }
  -[PTMetalContext device](v483->_metalContext, "device");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "newBufferWithLength:options:", 4, 0);
  focusDisparityRaw = v483->_focusDisparityRaw;
  v483->_focusDisparityRaw = (MTLBuffer *)v68;

  if (!v483->_focusDisparityRaw)
  {
    _PTLogSystem();
    v104 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
      -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.5(v104, v112, v113, v114, v115, v116, v117, v118);
    goto LABEL_61;
  }
  v492 = 1;
  -[PTMetalContext device](v483->_metalContext, "device");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "newBufferWithBytes:length:options:", &v492, 1, 0);
  useDisparityBufferForReactions = v483->_useDisparityBufferForReactions;
  v483->_useDisparityBufferForReactions = (MTLBuffer *)v71;

  if (!v483->_useDisparityBufferForReactions)
  {
    _PTLogSystem();
    v104 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
      -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.6(v104, v119, v120, v121, v122, v123, v124, v125);
    goto LABEL_61;
  }
  v73 = -[PTEffectUtil initWithMetalContext:]([PTEffectUtil alloc], "initWithMetalContext:", v483->_metalContext);
  effectUtil = v483->_effectUtil;
  v483->_effectUtil = v73;

  if (!v483->_effectUtil)
  {
    _PTLogSystem();
    v104 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
      -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.7(v104, v126, v127, v128, v129, v130, v131, v132);
    goto LABEL_61;
  }
  v75 = -[PTUtil initWithMetalContext:]([PTUtil alloc], "initWithMetalContext:", v483->_metalContext);
  util = v483->_util;
  v483->_util = v75;

  if (!v483->_util)
  {
    _PTLogSystem();
    v134 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
      -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.8(v134, v135, v136, v137, v138, v139, v140, v141);
    goto LABEL_142;
  }
  cvmNetwork = v483->_cvmNetwork;
  v483->_cvmNetwork = 0;

  msrColorPyramid = v483->_msrColorPyramid;
  v483->_msrColorPyramid = 0;

  if (!objc_msgSend(v476, "prewarmOnly"))
  {
    if (v471)
    {
      v142 = [PTCVMNetwork alloc];
      metalContext = v483->_metalContext;
      v145 = v483->_util;
      v144 = v483->_effectUtil;
      *(_QWORD *)&v498 = v485;
      *((_QWORD *)&v498 + 1) = v484;
      *(_QWORD *)&v499 = 1;
      v146 = -[PTCVMNetwork initWithMetalContext:colorSize:effectUtil:util:useHighResNetwork:sharedResources:](v142, "initWithMetalContext:colorSize:effectUtil:util:useHighResNetwork:sharedResources:", metalContext, &v498, v144, v145, v475, v482);
      v147 = v483->_cvmNetwork;
      v483->_cvmNetwork = (PTCVMNetwork *)v146;

      v148 = v483->_cvmNetwork;
      if (!v148)
      {
        _PTLogSystem();
        v134 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
          -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.32(v134, v174, v175, v176, v177, v178, v179, v180);
        goto LABEL_142;
      }
      v468 = v61;
      -[PTCVMNetwork outDisparity](v148, "outDisparity");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      v150 = objc_msgSend(v149, "width");
      -[PTCVMNetwork outDisparity](v483->_cvmNetwork, "outDisparity");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend(v151, "height");

      if (!v150 || !v80)
      {
        _PTLogSystem();
        v152 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
          -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.34();

        v150 = 320;
        v80 = 176;
      }
      v153 = [PTMSRResize alloc];
      v154 = v483->_metalContext;
      v155 = -[PTCVMNetwork rotated](v483->_cvmNetwork, "rotated");
      *(_QWORD *)&v498 = v485;
      *((_QWORD *)&v498 + 1) = v484;
      *(_QWORD *)&v499 = 1;
      *(_QWORD *)&v490 = v150;
      *((_QWORD *)&v490 + 1) = v80;
      v491 = 1;
      v156 = -[PTMSRResize initWithMetalContext:inputSize:targetSize:rotateTargetPixelBuffer:sRGB:sharedResources:](v153, "initWithMetalContext:inputSize:targetSize:rotateTargetPixelBuffer:sRGB:sharedResources:", v154, &v498, &v490, v155, 0, v482);
      v157 = v483->_msrColorPyramid;
      v483->_msrColorPyramid = (PTMSRResize *)v156;

      v158 = v483->_msrColorPyramid;
      if (!v158)
      {
        _PTLogSystem();
        v307 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v307, OS_LOG_TYPE_ERROR))
          -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.33(v307, v308, v309, v310, v311, v312, v313, v314);

        v28 = 0;
        v17 = v477;
        v16 = v478;
        goto LABEL_166;
      }
      v467 = v150;
      -[PTCVMNetwork bindColorInputPixelBuffer:](v483->_cvmNetwork, "bindColorInputPixelBuffer:", -[PTMSRResize targetRGBAPixelBuffer](v158, "targetRGBAPixelBuffer"));
      v81 = 1;
      v17 = v477;
    }
    else
    {
      if (v469)
      {
        objc_msgSend(v476, "colorSize");
        +[PTEffectPersonSegmentation segmentationSizeForColorSize:](PTEffectPersonSegmentation, "segmentationSizeForColorSize:");
        v160 = v159;
        v162 = v161;
        v163 = [PTMSRResize alloc];
        v164 = v483->_metalContext;
        v489[0] = (unint64_t)v160;
        v489[1] = (unint64_t)v162;
        v489[2] = 1;
        *(_QWORD *)&v498 = v485;
        *((_QWORD *)&v498 + 1) = v484;
        *(_QWORD *)&v499 = 1;
        v165 = -[PTMSRResize initWithMetalContext:inputSize:targetSize:rotateTargetPixelBuffer:sRGB:sharedResources:](v163, "initWithMetalContext:inputSize:targetSize:rotateTargetPixelBuffer:sRGB:sharedResources:", v164, &v498, v489, 0, 0, v482);
        v166 = v483->_msrColorPyramid;
        v483->_msrColorPyramid = (PTMSRResize *)v165;

        if (!v483->_msrColorPyramid)
        {
          _PTLogSystem();
          v134 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
            -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.33(v134, v315, v316, v317, v318, v319, v320, v321);
          goto LABEL_142;
        }
        v467 = 0;
        v468 = v61;
        v81 = 0;
        v80 = 0;
LABEL_87:
        v185 = v485;
        if (v485 >= v484)
          v185 = v484;
        v186 = 2.0;
        if (v185 > 0x2CF)
          v186 = 3.0;
        if (v185 <= 0x437)
          v187 = v186;
        else
          v187 = 4.0;
        v188 = -[PTColorConversion initWithMetalContext:]([PTColorConversion alloc], "initWithMetalContext:", v478);
        colorConversion = v483->_colorConversion;
        v483->_colorConversion = v188;

        if (v483->_colorConversion)
        {
          if ((v470 & 2) == 0)
            goto LABEL_98;
          v190 = -[PTNormalAndDiffuseEstimation initWithMetalContext:]([PTNormalAndDiffuseEstimation alloc], "initWithMetalContext:", v483->_metalContext);
          diffuseEstimation = v483->_diffuseEstimation;
          v483->_diffuseEstimation = v190;

          if (v483->_diffuseEstimation)
          {
            -[PTMetalContext textureUtil](v483->_metalContext, "textureUtil");
            v192 = v81;
            v193 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v193, "createWithWidth:height:pixelFormat:", v467, v80, 20);
            v194 = objc_claimAutoreleasedReturnValue();
            diffuse = v483->_diffuse;
            v483->_diffuse = (MTLTexture *)v194;

            v81 = v192;
            if (v483->_diffuse)
            {
LABEL_98:
              if (!v471)
                goto LABEL_112;
              v196 = [PTEffectTemporalFilter alloc];
              v197 = v483->_metalContext;
              v198 = v80;
              *(_QWORD *)&v498 = v467;
              *((_QWORD *)&v498 + 1) = v80;
              *(_QWORD *)&v499 = v81;
              v199 = -[PTEffectTemporalFilter initWithMetalContext:disparitySize:](v196, "initWithMetalContext:disparitySize:", v197, &v498);
              temporalFilter = v483->_temporalFilter;
              v483->_temporalFilter = (PTEffectTemporalFilter *)v199;

              if (v483->_temporalFilter)
              {
                v464 = v81;
                -[PTMetalContext textureUtil](v483->_metalContext, "textureUtil");
                v201 = (void *)objc_claimAutoreleasedReturnValue();
                v202 = (unint64_t)(float)((float)v80 * 1.5);
                v472 = (unint64_t)(float)((float)v467 * 1.5);
                objc_msgSend(v201, "createWithWidth:height:pixelFormat:");
                v203 = objc_claimAutoreleasedReturnValue();
                disparityCenteredUpscaledSDOF = v483->_disparityCenteredUpscaledSDOF;
                v483->_disparityCenteredUpscaledSDOF = (MTLTexture *)v203;

                if (v483->_disparityCenteredUpscaledSDOF)
                {
                  v465 = v198;
                  -[PTMetalContext textureUtil](v483->_metalContext, "textureUtil");
                  v205 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v205, "createWithWidth:height:pixelFormat:", v472, v202, 25);
                  v206 = objc_claimAutoreleasedReturnValue();
                  disparityCenteredUpscaledReactions = v483->_disparityCenteredUpscaledReactions;
                  v483->_disparityCenteredUpscaledReactions = (MTLTexture *)v206;

                  if (v483->_disparityCenteredUpscaledReactions)
                  {
                    if ((v470 & 0x4C) == 0)
                      goto LABEL_104;
                    -[PTMetalContext textureUtil](v483->_metalContext, "textureUtil");
                    v208 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v208, "createWithWidth:height:pixelFormat:", v472, v202, 25);
                    v209 = objc_claimAutoreleasedReturnValue();
                    disparityCenteredUpscaledWithScreenCaptureRect = v483->_disparityCenteredUpscaledWithScreenCaptureRect;
                    v483->_disparityCenteredUpscaledWithScreenCaptureRect = (MTLTexture *)v209;

                    if (!v483->_disparityCenteredUpscaledWithScreenCaptureRect)
                    {
                      _PTLogSystem();
                      v292 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v292, OS_LOG_TYPE_ERROR))
                        -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.29(v292, v385, v386, v387, v388, v389, v390, v391);
                    }
                    else
                    {
LABEL_104:
                      v211 = v202;
                      if (v481 && v483->_cvmNetwork)
                      {
                        objc_msgSend(*p_metalContext, "commandQueue");
                        v212 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v212, "commandBuffer");
                        v213 = (void *)objc_claimAutoreleasedReturnValue();

                        if (!v213)
                        {
                          _PTLogSystem();
                          v214 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v214, OS_LOG_TYPE_ERROR))
                            -[PTEffect updateEffectDelegate:].cold.1(v214, v215, v216, v217, v218, v219, v220, v221);

                          v15 = v476;
                          v30 = v481;
                          v31 = v482;
                          v211 = v202;
                        }
                        objc_msgSend(v30, "restoreState:cvmNetwork:temporalFilter:", v213, v483->_cvmNetwork, v483->_temporalFilter);
                        objc_msgSend(v213, "commit");
                        objc_msgSend(v213, "waitUntilScheduled");

                      }
                      -[PTMSRResize pyramidRGBA](v483->_msrColorPyramid, "pyramidRGBA");
                      v222 = (void *)objc_claimAutoreleasedReturnValue();
                      v488[0] = (unint64_t)(float)((float)v467 * 1.5);
                      v488[1] = v211;
                      v488[2] = 1;
                      +[PTUtil findMipmapLevel:largerThan:](PTUtil, "findMipmapLevel:largerThan:", v222, v488);
                      v223 = objc_claimAutoreleasedReturnValue();
                      guideRGBAUpscale = v483->_guideRGBAUpscale;
                      v483->_guideRGBAUpscale = (MTLTexture *)v223;

                      -[PTMSRResize pyramidRGBA](v483->_msrColorPyramid, "pyramidRGBA");
                      v225 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_QWORD *)&v498 = v467;
                      *((_QWORD *)&v498 + 1) = v465;
                      *(_QWORD *)&v499 = v464;
                      +[PTUtil findMipmapLevel:largerThan:](PTUtil, "findMipmapLevel:largerThan:", v225, &v498);
                      v226 = objc_claimAutoreleasedReturnValue();
                      guideRGBACoefficients = v483->_guideRGBACoefficients;
                      v483->_guideRGBACoefficients = (MTLTexture *)v226;

                      v228 = [PTGuidedFilter alloc];
                      v229 = v483->_metalContext;
                      *(_QWORD *)&v498 = v467;
                      *((_QWORD *)&v498 + 1) = v465;
                      v80 = v465;
                      *(_QWORD *)&v499 = v464;
                      LODWORD(v230) = 1028443341;
                      v231 = -[PTGuidedFilter initWithMetalContext:inputSize:epsilon:](v228, "initWithMetalContext:inputSize:epsilon:", v229, &v498, v230);
                      guidedFilter = v483->_guidedFilter;
                      v483->_guidedFilter = (PTGuidedFilter *)v231;

                      v17 = v477;
                      if (v483->_guidedFilter)
                      {
LABEL_112:
                        v466 = v80;
                        if (v469)
                        {
                          -[PTMetalContext textureUtil](v483->_metalContext, "textureUtil");
                          v233 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v233, "createWithWidth:height:pixelFormat:", v485, v484, 10);
                          v234 = objc_claimAutoreleasedReturnValue();
                          upscaledPersonSegmentation = v483->_upscaledPersonSegmentation;
                          v483->_upscaledPersonSegmentation = (MTLTexture *)v234;

                        }
                        v502 = 0;
                        v501 = 0;
                        -[PTMetalContext device](v483->_metalContext, "device");
                        v236 = (void *)objc_claimAutoreleasedReturnValue();
                        v237 = objc_msgSend(v236, "newBufferWithBytes:length:options:", &v501, 12, 0);
                        lastFocus = v483->_lastFocus;
                        v483->_lastFocus = (MTLBuffer *)v237;

                        if (v483->_lastFocus)
                        {
                          v500 = 0;
                          v498 = xmmword_1C9343940;
                          v499 = unk_1C9343950;
                          -[PTMetalContext device](v483->_metalContext, "device");
                          v239 = (void *)objc_claimAutoreleasedReturnValue();
                          v240 = objc_msgSend(v239, "newBufferWithBytes:length:options:", &v498, 36, 0);
                          focusDisparityModifiers = v483->_focusDisparityModifiers;
                          v483->_focusDisparityModifiers = (MTLBuffer *)v240;

                          v16 = v478;
                          v61 = v468;
                          if (v483->_focusDisparityModifiers)
                          {
                            v487 = 1065353216;
                            -[PTMetalContext device](v483->_metalContext, "device");
                            v242 = (void *)objc_claimAutoreleasedReturnValue();
                            v243 = objc_msgSend(v242, "newBufferWithBytes:length:options:", &v487, 4, 0);
                            studioLightEffectModifier = v483->_studioLightEffectModifier;
                            v483->_studioLightEffectModifier = (MTLBuffer *)v243;

                            if (!v483->_studioLightEffectModifier)
                            {
                              _PTLogSystem();
                              v259 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v259, OS_LOG_TYPE_ERROR))
                                -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.17(v259, v357, v358, v359, v360, v361, v362, v363);
                              v28 = 0;
                              goto LABEL_199;
                            }
                            if ((v470 & 2) != 0)
                            {
                              v246 = [PTEffectRelighting alloc];
                              v247 = v483->_metalContext;
                              v248 = v483->_availableEffectTypes;
                              v249 = v483->_effectUtil;
                              v473 = v483->_util;
                              v250 = objc_msgSend(v15, "prewarmOnly");
                              v251 = v483->_msrColorPyramid;
                              studiolightFromSegmentation = v483->_studiolightFromSegmentation;
                              *(_QWORD *)&v490 = v485;
                              *((_QWORD *)&v490 + 1) = v484;
                              v491 = 1;
                              LOBYTE(v463) = studiolightFromSegmentation;
                              v253 = v247;
                              v17 = v477;
                              v254 = v249;
                              v61 = v468;
                              v255 = -[PTEffectRelighting initWithMetalContext:faceAttributesNetwork:availableEffectTypes:effectUtil:util:prewarmOnly:colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:](v246, "initWithMetalContext:faceAttributesNetwork:availableEffectTypes:effectUtil:util:prewarmOnly:colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:", v253, v477, v248, v254, v473, v250, &v490, v251, v463, v31);
                              effectRelighting = v483->_effectRelighting;
                              v483->_effectRelighting = (PTEffectRelighting *)v255;

                              if (!v483->_effectRelighting)
                              {
                                _PTLogSystem();
                                v259 = objc_claimAutoreleasedReturnValue();
                                if (os_log_type_enabled(v259, OS_LOG_TYPE_ERROR))
                                  -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.27(v259, v400, v401, v402, v403, v404, v405, v406);
                                v28 = 0;
                                v16 = v478;
                                goto LABEL_199;
                              }
                            }
                            v496 = &unk_1E8252598;
                            *(float *)&v245 = fminf(v187, 4.0);
                            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v245);
                            v257 = (void *)objc_claimAutoreleasedReturnValue();
                            v497 = v257;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v497, &v496, 1);
                            v258 = (void *)objc_claimAutoreleasedReturnValue();
                            +[PTQualitySettings createWithQuality:options:](PTQualitySettings, "createWithQuality:options:", 25, v258);
                            v259 = objc_claimAutoreleasedReturnValue();

                            if (!v259)
                            {
                              _PTLogSystem();
                              v264 = objc_claimAutoreleasedReturnValue();
                              v16 = v478;
                              if (os_log_type_enabled(v264, OS_LOG_TYPE_ERROR))
                                -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.18(v264, v371, v372, v373, v374, v375, v376, v377);
                              v28 = 0;
                              v17 = v477;
                              goto LABEL_198;
                            }
                            -[NSObject setDoCenterDisparity:](v259, "setDoCenterDisparity:", 0);
                            LODWORD(v260) = 1.0;
                            -[NSObject setDisparityUpsampleFactor:](v259, "setDisparityUpsampleFactor:", v260);
                            -[NSObject setIntermediatePixelFormat:](v259, "setIntermediatePixelFormat:", 71);
                            v261 = v259;
                            v262 = [PTRenderPipelineDescriptor alloc];
                            objc_msgSend(*p_metalContext, "device");
                            v263 = (void *)objc_claimAutoreleasedReturnValue();
                            v264 = -[PTRenderPipelineDescriptor initWithDevice:version:colorSize:disparitySize:](v262, "initWithDevice:version:colorSize:disparitySize:", v263, 3001, (double)v485, (double)v484, (float)((float)v467 * 1.5), (float)((float)v466 * 1.5));

                            if (!v264)
                            {
                              v259 = v261;
                              _PTLogSystem();
                              v392 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v392, OS_LOG_TYPE_ERROR))
                                -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.19(v392, v393, v394, v395, v396, v397, v398, v399);

                              v28 = 0;
                              v17 = v477;
                              v16 = v478;
                              goto LABEL_198;
                            }
                            v494[0] = &unk_1E82525B0;
                            v494[1] = &unk_1E82525C8;
                            v495[0] = v261;
                            v495[1] = MEMORY[0x1E0C9AAA0];
                            v494[2] = &unk_1E82525E0;
                            v265 = v483;
                            v495[2] = v483->_metalContext;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v495, v494, 3);
                            v266 = (void *)objc_claimAutoreleasedReturnValue();
                            -[NSObject setOptions:](v264, "setOptions:", v266);

                            v267 = -[PTRenderPipeline initWithDescriptor:]([PTRenderPipeline alloc], "initWithDescriptor:", v264);
                            renderPipeline = v483->_renderPipeline;
                            v483->_renderPipeline = v267;

                            v269 = v483->_renderPipeline;
                            if (!v269)
                            {
                              v259 = v261;
                              _PTLogSystem();
                              v407 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v407, OS_LOG_TYPE_ERROR))
                                -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.20(v407, v408, v409, v410, v411, v412, v413, v414);

                              v28 = 0;
                              v15 = v476;
                              v17 = v477;
                              v16 = v478;
                              v30 = v481;
                              v31 = v482;
                              goto LABEL_198;
                            }
                            v474 = v261;
                            -[PTRenderPipeline createRenderStateWithQuality:](v269, "createRenderStateWithQuality:", -[NSObject quality](v261, "quality"));
                            v270 = objc_claimAutoreleasedReturnValue();
                            renderState = v483->_renderState;
                            v483->_renderState = (PTRenderState *)v270;

                            v272 = v483->_renderState;
                            if (!v272)
                            {
                              _PTLogSystem();
                              v415 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v415, OS_LOG_TYPE_ERROR))
                                -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.21(v415, v416, v417, v418, v419, v420, v421, v422);
                              goto LABEL_196;
                            }
                            -[PTRenderState setSourceColorBitDepth:](v272, "setSourceColorBitDepth:", 8);
                            -[PTRenderState prepareForRendering:](v483->_renderState, "prepareForRendering:", 1);
                            v273 = objc_opt_new();
                            sdofRenderRequest = v483->_sdofRenderRequest;
                            v483->_sdofRenderRequest = (PTRenderRequest *)v273;

                            -[PTRenderRequest setFrameId:](v483->_sdofRenderRequest, "setFrameId:", 0);
                            -[PTRenderRequest setRenderState:](v483->_sdofRenderRequest, "setRenderState:", v483->_renderState);
                            LODWORD(v275) = 1108546159;
                            if (v475)
                              *(float *)&v275 = 34.47;
                            -[PTRenderRequest setFocalLenIn35mmFilm:](v483->_sdofRenderRequest, "setFocalLenIn35mmFilm:", v275);
                            LODWORD(v276) = 1.0;
                            -[PTRenderRequest setFocusDisparity:](v483->_sdofRenderRequest, "setFocusDisparity:", v276);
                            v483->_externalHandDetectionsAvailable = 0;
                            if (v469)
                            {
                              v277 = [PTEffectPersonSegmentation alloc];
                              v278 = v483->_metalContext;
                              objc_msgSend(v476, "colorSize");
                              v281 = -[PTEffectPersonSegmentation initWithMetalContext:colorSize:msrColorPyramid:cvmNetwork:effectQuality:prewarmOnly:sharedResources:](v277, "initWithMetalContext:colorSize:msrColorPyramid:cvmNetwork:effectQuality:prewarmOnly:sharedResources:", v278, v483->_msrColorPyramid, v483->_cvmNetwork, v483->effectQuality, objc_msgSend(v476, "prewarmOnly"), v482, v279, v280);
                              personSegmentation = v483->_personSegmentation;
                              v483->_personSegmentation = (PTEffectPersonSegmentation *)v281;

                              if (!v483->_personSegmentation)
                              {
                                _PTLogSystem();
                                v415 = objc_claimAutoreleasedReturnValue();
                                if (os_log_type_enabled(v415, OS_LOG_TYPE_ERROR))
                                  -[PTEffectPersonSegmentation initWithMetalContext:colorSize:msrColorPyramid:cvmNetwork:effectQuality:prewarmOnly:sharedResources:].cold.2(v415, v426, v427, v428, v429, v430, v431, v432);
                                goto LABEL_196;
                              }
                              objc_msgSend(v476, "colorSize");
                              +[PTEffectPersonSegmentation segmentationSizeForColorSize:](PTEffectPersonSegmentation, "segmentationSizeForColorSize:");
                              v265 = v483;
                              v283 = v483->_msrColorPyramid;
                              v486[0] = (unint64_t)v284;
                              v486[1] = (unint64_t)v285;
                              v486[2] = 1;
                              v286 = -[PTMSRResize addAdditionalOutput:](v283, "addAdditionalOutput:", v486);
                              v483->_personSegmentationInput = v286;
                              CVPixelBufferRetain(v286);
                            }
                            if ((v470 & 0x40) != 0)
                            {
                              v287 = -[PTBackgroundReplacement initWithMetalContext:effectDescriptor:sharedSDOFRenderRequest:renderPipeline:]([PTBackgroundReplacement alloc], "initWithMetalContext:effectDescriptor:sharedSDOFRenderRequest:renderPipeline:", v265->_metalContext, v265->_effectDescriptor, v265->_sdofRenderRequest, v265->_renderPipeline);
                              backgroundReplacement = v265->_backgroundReplacement;
                              v265->_backgroundReplacement = v287;

                            }
                            if ((v265->_availableEffectTypes & 0x10) == 0)
                              goto LABEL_131;
                            objc_msgSend(v482, "renderEffect");
                            v423 = (void *)objc_claimAutoreleasedReturnValue();

                            if (v423)
                            {
                              objc_msgSend(v482, "renderEffect");
                              v424 = objc_claimAutoreleasedReturnValue();
                              vfxEffect = v483->_vfxEffect;
                              v483->_vfxEffect = (PTVFXRenderEffect *)v424;

                            }
                            else
                            {
                              v440 = [PTVFXRenderEffect alloc];
                              v441 = v483->_metalContext;
                              v442 = v483->_colorConversion;
                              v443 = objc_msgSend(v476, "prewarmOnly");
                              humanDetections = v483->_humanDetections;
                              *(_QWORD *)&v490 = v485;
                              *((_QWORD *)&v490 + 1) = v484;
                              v491 = 1;
                              v445 = -[PTVFXRenderEffect initWithMetalContext:colorSize:colorConversion:prewarmOnly:humanDetections:asyncInitQueue:](v440, "initWithMetalContext:colorSize:colorConversion:prewarmOnly:humanDetections:asyncInitQueue:", v441, &v490, v442, v443, humanDetections, v480);
                              v446 = v483->_vfxEffect;
                              v483->_vfxEffect = (PTVFXRenderEffect *)v445;

                              if (!v483->_vfxEffect)
                              {
                                _PTLogSystem();
                                v415 = objc_claimAutoreleasedReturnValue();
                                if (os_log_type_enabled(v415, OS_LOG_TYPE_ERROR))
                                  -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.24(v415, v456, v457, v458, v459, v460, v461, v462);
                                goto LABEL_196;
                              }
                              objc_msgSend(v482, "setRenderEffect:");
                            }
                            *(_QWORD *)&v490 = v485;
                            *((_QWORD *)&v490 + 1) = v484;
                            v491 = 1;
                            -[PTEffectRenderer createVfxTextures:](v483, "createVfxTextures:", &v490);
                            v447 = -[PTDepthConverter initWithMetalContext:]([PTDepthConverter alloc], "initWithMetalContext:", v483->_metalContext);
                            depthConverter = v483->_depthConverter;
                            v483->_depthConverter = v447;

                            if (!v483->_depthConverter)
                            {
                              _PTLogSystem();
                              v415 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v415, OS_LOG_TYPE_ERROR))
                                -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.25(v415, v449, v450, v451, v452, v453, v454, v455);
                              goto LABEL_196;
                            }
                            if (v483->_vfxEffect && v483->_vfxRenderTarget && v483->_vfxDepthBuffer)
                            {
LABEL_131:
                              v289 = -[PTEffectDebugLayer initWithMetalContext:effectRelighting:renderState:util:colorConversion:msrColorPyramid:vfxRenderEffect:depthConverter:disparityFixedFocus:faceDisparityArray:focusDisparityRaw:focusDisparityModifiers:]([PTEffectDebugLayer alloc], "initWithMetalContext:effectRelighting:renderState:util:colorConversion:msrColorPyramid:vfxRenderEffect:depthConverter:disparityFixedFocus:faceDisparityArray:focusDisparityRaw:focusDisparityModifiers:", v483->_metalContext, v483->_effectRelighting, v483->_renderState, v483->_util, v483->_colorConversion, v483->_msrColorPyramid, v483->_vfxEffect, v483->_depthConverter, v483->_disparityCenteredUpscaledSDOF, v483->_faceDisparityArray, v483->_focusDisparityRaw, v483->_focusDisparityModifiers);
                              debugLayer = v483->_debugLayer;
                              v483->_debugLayer = v289;

                              v291 = v483->_debugLayer;
                              if (v291)
                              {
                                -[PTEffectDebugLayer setReactionProvider:](v291, "setReactionProvider:", v483->_reactionProvider);
                                kdebug_trace();
                                v28 = v483;
LABEL_197:
                                v15 = v476;
                                v17 = v477;
                                v16 = v478;
                                v30 = v481;
                                v31 = v482;
                                v259 = v474;
LABEL_198:

LABEL_199:
                                v29 = v479;

                                goto LABEL_62;
                              }
                              _PTLogSystem();
                              v415 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v415, OS_LOG_TYPE_ERROR))
                                -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.23(v415, v433, v434, v435, v436, v437, v438, v439);
                            }
                            else
                            {
                              _PTLogSystem();
                              v415 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v415, OS_LOG_TYPE_ERROR))
                                -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.26();
                            }
LABEL_196:

                            v28 = 0;
                            goto LABEL_197;
                          }
                          _PTLogSystem();
                          v104 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
                            -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.16(v104, v343, v344, v345, v346, v347, v348, v349);
                        }
                        else
                        {
                          _PTLogSystem();
                          v104 = objc_claimAutoreleasedReturnValue();
                          v16 = v478;
                          v61 = v468;
                          if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
                            -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.15(v104, v322, v323, v324, v325, v326, v327, v328);
                        }
LABEL_61:

                        v28 = 0;
                        v29 = v479;
                        goto LABEL_62;
                      }
                      _PTLogSystem();
                      v292 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v292, OS_LOG_TYPE_ERROR))
                        -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.12(v292, v378, v379, v380, v381, v382, v383, v384);
                    }
                  }
                  else
                  {
                    _PTLogSystem();
                    v292 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v292, OS_LOG_TYPE_ERROR))
                      -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.13(v292, v364, v365, v366, v367, v368, v369, v370);
                  }
                }
                else
                {
                  _PTLogSystem();
                  v292 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v292, OS_LOG_TYPE_ERROR))
                    -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.12(v292, v350, v351, v352, v353, v354, v355, v356);
                }
              }
              else
              {
                _PTLogSystem();
                v292 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v292, OS_LOG_TYPE_ERROR))
                  -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.11(v292, v329, v330, v331, v332, v333, v334, v335);
              }
              goto LABEL_165;
            }
            _PTLogSystem();
            v292 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v292, OS_LOG_TYPE_ERROR))
              -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.31(v292, v336, v337, v338, v339, v340, v341, v342);
          }
          else
          {
            _PTLogSystem();
            v292 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v292, OS_LOG_TYPE_ERROR))
              -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.30(v292, v300, v301, v302, v303, v304, v305, v306);
          }
        }
        else
        {
          _PTLogSystem();
          v292 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v292, OS_LOG_TYPE_ERROR))
            -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.10(v292, v293, v294, v295, v296, v297, v298, v299);
        }
LABEL_165:

        v28 = 0;
        v16 = v478;
LABEL_166:
        v29 = v479;
        v61 = v468;
        goto LABEL_62;
      }
      v467 = 0;
      v468 = v61;
      v81 = 0;
      v80 = 0;
    }
LABEL_84:
    if (!v483->_msrColorPyramid && (objc_msgSend(v476, "prewarmOnly") & 1) == 0)
    {
      v181 = [PTMSRResize alloc];
      v182 = v483->_metalContext;
      *(_QWORD *)&v498 = v485;
      *((_QWORD *)&v498 + 1) = v484;
      v81 = 1;
      *(_QWORD *)&v499 = 1;
      v490 = xmmword_1C9343930;
      v491 = 1;
      v183 = -[PTMSRResize initWithMetalContext:inputSize:targetSize:rotateTargetPixelBuffer:sRGB:sharedResources:](v181, "initWithMetalContext:inputSize:targetSize:rotateTargetPixelBuffer:sRGB:sharedResources:", v182, &v498, &v490, 0, 0, v482);
      v184 = v483->_msrColorPyramid;
      v483->_msrColorPyramid = (PTMSRResize *)v183;

      v467 = 320;
      v80 = 176;
    }
    goto LABEL_87;
  }
  v79 = -[PTEspressoGenericExecutor initWithMetalContext:]([PTEspressoGenericExecutor alloc], "initWithMetalContext:", *p_metalContext);
  if (v79)
  {
    v468 = v61;

    v467 = 320;
    v80 = 176;
    v81 = 1;
    goto LABEL_84;
  }
  _PTLogSystem();
  v134 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
    -[PTEffectRenderer initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:].cold.9(v134, v167, v168, v169, v170, v171, v172, v173);
LABEL_142:

  v28 = 0;
  v16 = v478;
  v29 = v479;
LABEL_62:

LABEL_63:
LABEL_64:

  return v28;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)lowResDisparitySizeFromEffectDescriptor
{
  unint64_t v5;
  double v6;
  double v7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  double v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;

  -[PTEffectDescriptor colorSize](self->_effectDescriptor, "colorSize");
  v5 = +[PTEffectUtil aspectRatio:](PTEffectUtil, "aspectRatio:");
  retstr->var1 = 0;
  retstr->var2 = 0;
  retstr->var0 = 0;
  -[PTEffectDescriptor colorSize](self->_effectDescriptor, "colorSize");
  v7 = v6;
  result = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)-[PTEffectDescriptor colorSize](self->_effectDescriptor, "colorSize");
  v10 = 288;
  if (v5 == 1)
    v10 = 320;
  v11 = 216;
  if (v5 == 1)
    v11 = 176;
  if (v7 <= v9)
    v12 = v11;
  else
    v12 = v10;
  if (v7 > v9)
    v10 = v11;
  retstr->var0 = v12;
  retstr->var1 = v10;
  retstr->var2 = 1;
  return result;
}

- (void)createVfxTextures:(id *)a3
{
  void *v5;
  MTLTexture *v6;
  MTLTexture *vfxRenderTarget;
  void *v8;
  void *v9;
  MTLTexture *v10;
  MTLTexture *vfxDepthBuffer;
  id v12;

  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", -[PTVFXRenderEffect rgbaOutputPixelFormat](self->_vfxEffect, "rgbaOutputPixelFormat"), a3->var0, a3->var1, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUsage:", 7);
  objc_msgSend(v12, "setStorageMode:", 0);
  -[PTMetalContext device](self->_metalContext, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (MTLTexture *)objc_msgSend(v5, "newTextureWithDescriptor:", v12);
  vfxRenderTarget = self->_vfxRenderTarget;
  self->_vfxRenderTarget = v6;

  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", -[PTVFXRenderEffect depthOutputPixelFormat](self->_vfxEffect, "depthOutputPixelFormat"), a3->var0, a3->var1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUsage:", 7);
  objc_msgSend(v8, "setStorageMode:", 0);
  -[PTMetalContext device](self->_metalContext, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (MTLTexture *)objc_msgSend(v9, "newTextureWithDescriptor:", v8);
  vfxDepthBuffer = self->_vfxDepthBuffer;
  self->_vfxDepthBuffer = v10;

}

- (void)dealloc
{
  __CVMetalTextureCache *textureCache;
  objc_super v4;

  textureCache = self->_textureCache;
  if (textureCache)
    CFRelease(textureCache);
  v4.receiver = self;
  v4.super_class = (Class)PTEffectRenderer;
  -[PTEffectRenderer dealloc](&v4, sel_dealloc);
}

- (id)copyTemporalState:(id)a3
{
  id v4;
  PTEffectTemporalState *v5;

  v4 = a3;
  v5 = -[PTEffectTemporalState initWithMetalContext:]([PTEffectTemporalState alloc], "initWithMetalContext:", self->_metalContext);
  -[PTEffectTemporalState saveState:cvmNetwork:msrColorPyramid:](v5, "saveState:cvmNetwork:msrColorPyramid:", v4, self->_cvmNetwork, self->_msrColorPyramid);

  return v5;
}

- (void)reset:(id)a3
{
  self->_frameIndex = 0;
  self->_networkFrameIndex = 0;
  -[PTEffectTemporalFilter reset](self->_temporalFilter, "reset", a3);
  -[PTCVMNetwork reset](self->_cvmNetwork, "reset");
  -[PTEffectRelighting reset](self->_effectRelighting, "reset");
  -[PTEffectPersonSegmentation reset](self->_personSegmentation, "reset");
}

- (int)render:(id)a3 waitUntilCompleted:(BOOL)a4 gpuCompleted:(id)a5
{
  _BOOL4 v6;
  id v8;
  int v9;
  NSObject *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _BOOL4 v14;
  _BOOL4 v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  unint64_t v21;
  int v22;
  char v23;
  unsigned int v24;
  _BOOL4 v25;
  int v26;
  _BOOL4 v27;
  uint64_t v28;
  double v29;
  double v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  _BOOL8 v34;
  void *v35;
  void *v36;
  uint64_t v37;
  PTTextureYUV **intermediateYUV;
  void *v39;
  _BOOL4 v40;
  unsigned int v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  PTEffectTemporalFilter *temporalFilter;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  float v68;
  PTEffectTemporalFilter *v69;
  void *v70;
  double v71;
  MTLTexture *diffuse;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  NSObject *v76;
  uint64_t v77;
  unsigned int v78;
  BOOL v79;
  int v80;
  _BOOL8 v81;
  int *v82;
  PTEffectUtil *effectUtil;
  uint64_t v84;
  float focusDisparityMax;
  void *v86;
  double v87;
  PTEffectUtil *v88;
  uint64_t v89;
  float focusDisparityUpdateCoefficientSDOF;
  float focusDisparityUpdateCoefficientStudioLight;
  _BOOL8 v92;
  _BOOL8 v93;
  uint64_t v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  int v103;
  void *v104;
  void *v106;
  PTBackgroundReplacement *backgroundReplacement;
  float v108;
  float v109;
  void *v110;
  void *v111;
  double v112;
  id v113;
  void *v114;
  NSObject *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  PTEffectRelighting *effectRelighting;
  void *v124;
  void *v125;
  MTLTexture *upscaledPersonSegmentation;
  PTEffectPersonSegmentation *personSegmentation;
  void *v128;
  MTLBuffer *focusDisparityModifiers;
  void *v130;
  MTLTexture *disparityCenteredUpscaledReactions;
  void *v132;
  PTGuidedFilter *guidedFilter;
  void *v134;
  void *v135;
  NSObject *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  void *v144;
  double v145;
  PTEffectUtil *v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  MTLTexture **p_disparityCenteredUpscaledWithScreenCaptureRect;
  MTLTexture *disparityCenteredUpscaledWithScreenCaptureRect;
  MTLTexture *disparityCenteredUpscaledSDOF;
  int v158;
  int v159;
  int v160;
  double v161;
  double v162;
  PTRenderPipeline *renderPipeline;
  void *v164;
  NSObject *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  PTBackgroundReplacement *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  NSObject *v178;
  int v179;
  void *v180;
  NSObject *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  int64_t debugType;
  void *v190;
  void *v191;
  uint64_t v192;
  void *v193;
  PTMetalContext *metalContext;
  double v195;
  NSObject *v196;
  uint64_t v198;
  unint64_t v199;
  _BOOL4 v200;
  unsigned int v201;
  _BOOL4 v202;
  BOOL v203;
  NSObject *v204;
  unint64_t v205;
  void *v206;
  void *v207;
  void *v208;
  void *context;
  id v210;
  _BOOL4 v211;
  uint64_t v212;
  void *v213;
  _BOOL4 v214;
  _BOOL4 v215;
  void *v216;
  unsigned int v217;
  void *v218;
  int v219;
  _QWORD v220[4];
  id v221;
  _QWORD v222[4];
  id v223;
  id v224;
  id buf[2];
  _OWORD v226[4];

  v6 = a4;
  v8 = a3;
  v210 = a5;
  v216 = (void *)objc_opt_new();
  if (-[PTMetalContext isCommandBufferCommitted](self->_metalContext, "isCommandBufferCommitted"))
  {
    v9 = 0;
  }
  else
  {
    _PTLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PTEffect render:].cold.1();

    v9 = -9;
  }
  objc_msgSend(v8, "frameTimeSeconds");
  v11 = self->_availableEffectTypes & objc_msgSend(v8, "effectType");
  v212 = objc_msgSend(v8, "inColorBuffer");
  v12 = objc_msgSend(v8, "outColorBuffer");
  v13 = -[PTBackgroundReplacement updateAndGetBackgroundState:frameIndex:](self->_backgroundReplacement, "updateAndGetBackgroundState:frameIndex:", v8, self->_frameIndex);
  v200 = v6;
  v14 = (v11 & 0x40) != 0 && objc_msgSend(v8, "inBackgroundReplacementBuffer") || v13 != 0;
  v15 = 0;
  v16 = v11 & (v13 != 4);
  if (v13 == 1)
    v16 = 0;
  v219 = v16;
  if ((v11 & 2) == 0 && (v16 & 1) == 0 && !v14)
    v15 = objc_msgSend(v8, "outColorBuffer") != 0;
  v199 = v13;
  v217 = v9;
  v17 = objc_msgSend(v8, "remappedAperture");
  v19 = v18;
  v20 = MEMORY[0x1CAA3ACDC](v17);
  if ((v11 & 0x20) != 0)
    -[PTEffectRenderer runGestureDetection:asyncWork:](self, "runGestureDetection:asyncWork:", v8, v216);
  v21 = v11 & 2;
  v22 = (v11 >> 3) & 1 | v14;
  v214 = (v11 & 0x10) != 0
      && -[PTVFXRenderEffect updateWithRenderRequest:lastFrameTime:](self->_vfxEffect, "updateWithRenderRequest:lastFrameTime:", v8, self->_lastFrameTime);
  v23 = v219;
  if ((v11 & 2) != 0)
    v23 = 1;
  if ((v23 & 1) != 0)
    v24 = 1;
  else
    v24 = v214 & ~(v22 & (v11 >> 2) | v14);
  v201 = v22 & (v11 >> 2) | v14;
  v202 = v15;
  v211 = v14;
  if (v14)
  {
    if ((v11 & 2) == 0)
    {
      if ((v199 & 0xFFFFFFFFFFFFFFFELL) != 2)
        LOBYTE(v24) = 0;
      if ((v24 & 1) == 0)
        goto LABEL_38;
      goto LABEL_34;
    }
    v25 = !self->_studiolightFromSegmentation;
    if (self->_studiolightFromSegmentation && ((v24 ^ 1) & 1) == 0)
    {
      if ((v199 & 0xFFFFFFFFFFFFFFFELL) != 2)
        goto LABEL_38;
LABEL_34:
      v203 = -[PTHumanDetections detectionsRawCount](self->_humanDetections, "detectionsRawCount") > 0;
      v26 = 1;
      v27 = 1;
      goto LABEL_39;
    }
  }
  else
  {
    v25 = v24;
  }
  if (v25)
    goto LABEL_34;
LABEL_38:
  v27 = 0;
  v203 = 0;
  v26 = v22;
LABEL_39:
  v28 = objc_msgSend(v8, "frameTimeSeconds");
  v30 = v29 - self->_lastFrameTime;
  if (v30 > 1.0)
    self->_frameIndex = 0;
  if (v22 && (v30 > 1.0 || !self->_renderSegmentationPreviousFrame))
  {
    _PTLogSystem();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1C9281000, v31, OS_LOG_TYPE_INFO, "Reset segmentation network", (uint8_t *)buf, 2u);
    }

    v28 = -[PTEffectPersonSegmentation reset](self->_personSegmentation, "reset");
  }
  self->_renderSegmentationPreviousFrame = v22;
  if (v27 && (v30 > 1.0 || !self->_runCVMNetworkPreviousFrame))
  {
    _PTLogSystem();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1C9281000, v32, OS_LOG_TYPE_INFO, "Reset network", (uint8_t *)buf, 2u);
    }

    -[PTCVMNetwork reset](self->_cvmNetwork, "reset");
    v28 = -[PTEffectTemporalFilter reset](self->_temporalFilter, "reset");
  }
  self->_runCVMNetworkPreviousFrame = v27;
  if ((v11 & 2) != 0 && (v30 > 1.0 || !self->_renderStudioLightPreviousFrame))
  {
    _PTLogSystem();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1C9281000, v33, OS_LOG_TYPE_INFO, "Reset studio light", (uint8_t *)buf, 2u);
    }

    v28 = -[PTEffectRelighting reset](self->_effectRelighting, "reset");
  }
  self->_renderStudioLightPreviousFrame = (v11 & 2) >> 1;
  PTDefaultsFlush(v28);
  PTDefaultsPublicGetDictionary();
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v208, "objectForKeyedSubscript:", CFSTR("PTEffectDebug"));
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v215 = v27;
  context = (void *)v20;
  v205 = v11;
  v34 = (int)objc_msgSend(v207, "intValue") > 0 || self->_debugType != 0;
  -[PTMetalContext device](self->_metalContext, "device");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[PTTexture createFromPixelbuffer:device:textureCache:read:write:](PTTexture, "createFromPixelbuffer:device:textureCache:read:write:", v212, v35, self->_textureCache, 1, 0);
  v218 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[PTMetalContext device](self->_metalContext, "device");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTTexture createFromPixelbuffer:device:textureCache:read:write:](PTTexture, "createFromPixelbuffer:device:textureCache:read:write:", v12, v36, self->_textureCache, v34, 1);
    v37 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v37 = 0;
  }
  intermediateYUV = self->_intermediateYUV;
  objc_msgSend(v218, "copyMetadataTo:", self->_intermediateYUV[0]);
  objc_msgSend(v218, "copyMetadataTo:", self->_intermediateYUV[1]);
  v39 = (void *)objc_opt_new();
  objc_msgSend(v39, "addObject:", v218);
  v40 = v215;
  if (v21)
    objc_msgSend(v39, "addObject:", intermediateYUV[objc_msgSend(v39, "count") & 1]);
  if (v219)
    objc_msgSend(v39, "addObject:", intermediateYUV[objc_msgSend(v39, "count") & 1]);
  if (v211)
    objc_msgSend(v39, "addObject:", intermediateYUV[objc_msgSend(v39, "count") & 1]);
  if (v37)
    objc_msgSend(v39, "replaceObjectAtIndex:withObject:", objc_msgSend(v39, "count") - 1, v37);
  if (v26)
  {
    v41 = -[PTMSRResize downsampleToQuarterSize:](self->_msrColorPyramid, "downsampleToQuarterSize:", v212) | v217;
    if (v41)
    {
      _PTLogSystem();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        -[PTEffect render:].cold.2();

    }
    v217 = -[PTMSRResize downsampleQuarterSizeToTargetSize:](self->_msrColorPyramid, "downsampleQuarterSizeToTargetSize:", v212) | v41;
    if (v217)
    {
      _PTLogSystem();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        -[PTEffect render:].cold.2();

    }
    else
    {
      v217 = 0;
    }
  }
  v213 = (void *)v37;
  if (v215)
  {
    -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v44)
    {
      _PTLogSystem();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        -[PTEffectRenderer render:waitUntilCompleted:gpuCompleted:].cold.5(v45, v46, v47, v48, v49, v50, v51, v52);

    }
    temporalFilter = self->_temporalFilter;
    -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTMSRResize targetRGBA](self->_msrColorPyramid, "targetRGBA");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTEffectTemporalFilter prepareFilter:opticalFlowRGB:frameIndex:](temporalFilter, "prepareFilter:opticalFlowRGB:frameIndex:", v54, v55, self->_networkFrameIndex);

    -[PTMetalContext commit](self->_metalContext, "commit");
    if (objc_msgSend(v8, "inExternalDisparityBuffer"))
    {
      v56 = objc_msgSend(v8, "inExternalDisparityBuffer");
      -[PTMetalContext device](self->_metalContext, "device");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      +[PTPixelBufferUtil createTextureFromPixelBuffer:device:textureCache:sRGB:](PTPixelBufferUtil, "createTextureFromPixelBuffer:device:textureCache:sRGB:", v56, v57, self->_textureCache, 0);
      v58 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[PTCVMNetwork executeNetwork:](self->_cvmNetwork, "executeNetwork:", self->_networkFrameIndex);
      -[PTCVMNetwork outDisparity](self->_cvmNetwork, "outDisparity");
      v58 = objc_claimAutoreleasedReturnValue();
    }
    -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v59)
    {
      _PTLogSystem();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        -[PTEffectRenderer render:waitUntilCompleted:gpuCompleted:].cold.5(v60, v61, v62, v63, v64, v65, v66, v67);

    }
    -[PTHumanDetections detectionsRawCount](self->_humanDetections, "detectionsRawCount");
    if (v21)
      -[PTNormalAndDiffuseEstimation estimateDiffuseFromDisparity:outDiffuse:](self->_diffuseEstimation, "estimateDiffuseFromDisparity:outDiffuse:", v58, self->_diffuse);
    if (-[PTCVMNetwork networkVersionID](self->_cvmNetwork, "networkVersionID") == 7
      && !-[PTCVMNetwork highResNetwork](self->_cvmNetwork, "highResNetwork"))
    {
      v68 = 1.5705;
    }
    else
    {
      v68 = 1.0;
    }
    v69 = self->_temporalFilter;
    -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      diffuse = self->_diffuse;
    else
      diffuse = 0;
    LODWORD(v198) = self->_networkFrameIndex;
    *(float *)&v71 = v68;
    -[PTEffectTemporalFilter filter:inDisparity:inNormal:inDiffuse:filterNormalSpatial:filterDiffuseSpatial:frameIndex:disparityScale:](v69, "filter:inDisparity:inNormal:inDiffuse:filterNormalSpatial:filterDiffuseSpatial:frameIndex:disparityScale:", v70, v58, 0, diffuse, 1, 1, v71, v198);

  }
  else
  {
    v58 = 0;
  }
  v206 = (void *)v58;
  if (!v22)
  {
    v76 = 0;
LABEL_110:
    v78 = v201;
    goto LABEL_111;
  }
  -[PTMetalContext commit](self->_metalContext, "commit");
  if (objc_msgSend(v8, "outPersonSegmentationMatteBuffer"))
  {
    v73 = objc_msgSend(v8, "outPersonSegmentationMatteBuffer");
    -[PTMetalContext device](self->_metalContext, "device");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTPixelBufferUtil createTextureFromPixelBuffer:device:](PTPixelBufferUtil, "createTextureFromPixelBuffer:device:", v73, v74);
    v75 = objc_claimAutoreleasedReturnValue();

    v76 = v75;
    LODWORD(v77) = v217;
  }
  else
  {
    upscaledPersonSegmentation = self->_upscaledPersonSegmentation;
    LODWORD(v77) = v217;
    if (!upscaledPersonSegmentation)
    {
      _PTLogSystem();
      v76 = objc_claimAutoreleasedReturnValue();
      v177 = v213;
      if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        -[PTEffectRenderer render:waitUntilCompleted:gpuCompleted:].cold.2();
      goto LABEL_172;
    }
    v76 = upscaledPersonSegmentation;
  }
  personSegmentation = self->_personSegmentation;
  -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v77) = -[PTEffectPersonSegmentation runPersonSegmentationToOutPersonSegmentationMatteBuffer:inRGBA:outUpscaledSegmentation:](personSegmentation, "runPersonSegmentationToOutPersonSegmentationMatteBuffer:inRGBA:outUpscaledSegmentation:", v128, self->_personSegmentationInput, v76) | v77;

  -[PTMetalContext commit](self->_metalContext, "commit");
  if (v8)
    objc_msgSend(v8, "transform");
  else
    memset(v226, 0, 48);
  v177 = v213;
  if (+[PTUtil getRotationDegreesFromAffineTransform:](PTUtil, "getRotationDegreesFromAffineTransform:", v226))
  {
    _PTLogSystem();
    v178 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v178, OS_LOG_TYPE_ERROR))
      -[PTEffectRenderer render:waitUntilCompleted:gpuCompleted:].cold.7();

LABEL_172:
    v179 = 0;
    goto LABEL_189;
  }
  -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v180 = (void *)objc_claimAutoreleasedReturnValue();

  v217 = v77;
  if (v180)
    goto LABEL_110;
  _PTLogSystem();
  v181 = objc_claimAutoreleasedReturnValue();
  v78 = v201;
  if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
    -[PTEffectRenderer render:waitUntilCompleted:gpuCompleted:].cold.5(v181, v182, v183, v184, v185, v186, v187, v188);

LABEL_111:
  v79 = v203;
  v204 = v76;
  v80 = v219 | v214 & ~v78;
  if (v79 || -[PTVFXRenderEffect emitNewReaction](self->_vfxEffect, "emitNewReaction"))
  {
    if (-[PTVFXRenderEffect emitNewReaction](self->_vfxEffect, "emitNewReaction"))
      v81 = -[PTHumanDetections detectionsRawCount](self->_humanDetections, "detectionsRawCount") == 0;
    else
      v81 = 0;
    v82 = -[PTHumanDetections faceDetectionsFilteredState:](self->_humanDetections, "faceDetectionsFilteredState:", v81);
    effectUtil = self->_effectUtil;
    v84 = -[PTHumanDetections faceDetectionsRaw](self->_humanDetections, "faceDetectionsRaw");
    focusDisparityMax = self->_focusDisparityMax;
    -[PTEffectTemporalFilter disparityFiltered](self->_temporalFilter, "disparityFiltered");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v87 = focusDisparityMax;
    -[PTEffectUtil sampleFaceRectsWithMaxFaceRects:faceRects:faceRectsState:focusDisparityMax:inDisparity:outFaceDistanceArray:](effectUtil, "sampleFaceRectsWithMaxFaceRects:faceRects:faceRectsState:focusDisparityMax:inDisparity:outFaceDistanceArray:", 4, v84, v82, v86, self->_faceDisparityArray, v87);

    v88 = self->_effectUtil;
    v89 = -[PTHumanDetections detectionsRawCount](self->_humanDetections, "detectionsRawCount");
    focusDisparityUpdateCoefficientSDOF = self->_focusDisparityUpdateCoefficientSDOF;
    focusDisparityUpdateCoefficientStudioLight = self->_focusDisparityUpdateCoefficientStudioLight;
    v92 = self->_networkFrameIndex == 0;
    v93 = -[PTVFXRenderEffect emitNewReaction](self->_vfxEffect, "emitNewReaction");
    v94 = objc_msgSend(v8, "focusOnAll");
    *(float *)&v95 = self->_disparityFocusOffsetSDOF.disparityOffsetFactor;
    *(float *)&v96 = self->_disparityFocusOffsetSDOF.offsetInMeters;
    *(float *)&v97 = self->_disparityFocusOffsetReactions.disparityOffsetFactor;
    *(float *)&v98 = self->_disparityFocusOffsetReactions.offsetInMeters;
    *(float *)&v99 = self->_disparityFocusOffsetStudioLight.disparityOffsetFactor;
    *(float *)&v100 = self->_disparityFocusOffsetStudioLight.offsetInMeters;
    *(float *)&v101 = focusDisparityUpdateCoefficientSDOF;
    *(float *)&v102 = focusDisparityUpdateCoefficientStudioLight;
    -[PTEffectUtil updateFocusObjectWithFaceRectCount:disparityFocusOffsetSDOF:disparityFocusOffsetReactions:disparityFocusOffsetStudioLight:exponentialMovingAverageSDOF:exponentialMovingAverageStudioLight:faceRectsState:isFirstFrame:emitNewReaction:focusOnAll:lastFocus:inFaceDisparityArray:outDisparityModifiers:outDisparityFocus:outStudioLightEffectModifier:outUseDisparityBufferForReactions:](v88, "updateFocusObjectWithFaceRectCount:disparityFocusOffsetSDOF:disparityFocusOffsetReactions:disparityFocusOffsetStudioLight:exponentialMovingAverageSDOF:exponentialMovingAverageStudioLight:faceRectsState:isFirstFrame:emitNewReaction:focusOnAll:lastFocus:inFaceDisparityArray:outDisparityModifiers:outDisparityFocus:outStudioLightEffectModifier:outUseDisparityBufferForReactions:", v89, v82, v92, v93, v94, self->_lastFocus, v95, v96, v97, v98, v99, v100, v101, v102,
      self->_faceDisparityArray,
      self->_focusDisparityModifiers,
      self->_focusDisparityRaw,
      self->_studioLightEffectModifier,
      self->_useDisparityBufferForReactions);
    v40 = v215;
  }
  v103 = v80 & v40;
  -[PTEffectTemporalFilter diffuseFiltered](self->_temporalFilter, "diffuseFiltered");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    if (self->_studiolightFromSegmentation && v211)
    {
      -[PTEffectRelighting approximateDiffuseFromSegmentation:](self->_effectRelighting, "approximateDiffuseFromSegmentation:", v204);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      backgroundReplacement = self->_backgroundReplacement;
      if (backgroundReplacement && (v199 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        -[PTBackgroundReplacement transitionTimeNormalized:](backgroundReplacement, "transitionTimeNormalized:", v8);
        if (v199 == 3)
          v109 = 1.0 - v108;
        else
          v109 = v108;
        -[PTMetalContext textureUtil](self->_metalContext, "textureUtil");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v112 = v109;
        objc_msgSend(v110, "mix:inTexX:inTexY:outTex:alpha:", v111, v104, v106, v106, v112);

      }
      v113 = v106;

      v104 = v113;
    }
    -[PTMetalContext commit](self->_metalContext, "commit");
    -[PTEffectRelighting estimateLightIntensity:inFaceRects:numberOfFaceRects:humanDetections:effectRenderRequest:asyncWork:](self->_effectRelighting, "estimateLightIntensity:inFaceRects:numberOfFaceRects:humanDetections:effectRenderRequest:asyncWork:", v218, -[PTHumanDetections faceDetectionsRaw](self->_humanDetections, "faceDetectionsRaw"), -[PTHumanDetections detectionsRawCount](self->_humanDetections, "detectionsRawCount"), self->_humanDetections, v8, v216);
    -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v114 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v114)
    {
      _PTLogSystem();
      v115 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
        -[PTEffectRenderer render:waitUntilCompleted:gpuCompleted:].cold.5(v115, v116, v117, v118, v119, v120, v121, v122);

    }
    -[PTHumanDetections detectionsRawCount](self->_humanDetections, "detectionsRawCount");
    effectRelighting = self->_effectRelighting;
    objc_msgSend(v39, "objectAtIndexedSubscript:", 0);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      -[PTEffectTemporalFilter disparityFiltered](self->_temporalFilter, "disparityFiltered");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v125 = 0;
    }
    focusDisparityModifiers = self->_focusDisparityModifiers;
    objc_msgSend(v39, "objectAtIndexedSubscript:", 1);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "relightStrengthStudioLight");
    -[PTEffectRelighting studioLightInYUV:inDiffuse:inDisparity:inFocusDisparityModifier:outYUV:relightStrength:studioLightFromSegmentationBlend:studioLightEffectModifier:](effectRelighting, "studioLightInYUV:inDiffuse:inDisparity:inFocusDisparityModifier:outYUV:relightStrength:studioLightFromSegmentationBlend:studioLightEffectModifier:", v124, v104, v125, focusDisparityModifiers, v130, self->_studioLightEffectModifier);

    v40 = v215;
    if (v215)

    objc_msgSend(v39, "removeObjectAtIndex:", 0);
  }
  LODWORD(v77) = v217;
  if (v103)
  {
    if (v214)
      disparityCenteredUpscaledReactions = self->_disparityCenteredUpscaledReactions;
    else
      disparityCenteredUpscaledReactions = 0;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", self->_disparityCenteredUpscaledSDOF, disparityCenteredUpscaledReactions, 0);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    guidedFilter = self->_guidedFilter;
    -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTEffectTemporalFilter disparityFiltered](self->_temporalFilter, "disparityFiltered");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = -[PTGuidedFilter guidedFilter:image:guideRGBACoefficients:guideRGBAUpscale:upscaledImageArray:sourceColorBitDepth:postModifierBuffer:](guidedFilter, "guidedFilter:image:guideRGBACoefficients:guideRGBAUpscale:upscaledImageArray:sourceColorBitDepth:postModifierBuffer:", v134, v135, self->_guideRGBACoefficients, self->_guideRGBAUpscale, v132, 8, self->_focusDisparityModifiers) | v217;

    v40 = v215;
    if ((_DWORD)v77)
    {
      _PTLogSystem();
      v136 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
        -[PTEffectRenderer render:waitUntilCompleted:gpuCompleted:].cold.4(v77, v136, v137, v138, v139, v140, v141, v142);

    }
  }
  if (v219)
  {
    objc_msgSend(v39, "objectAtIndexedSubscript:", 0);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTRenderRequest setSourceColor:](self->_sdofRenderRequest, "setSourceColor:", v143);

    objc_msgSend(v39, "objectAtIndexedSubscript:", 1);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTRenderRequest setDestinationColor:](self->_sdofRenderRequest, "setDestinationColor:", v144);

    LODWORD(v145) = v19;
    -[PTRenderRequest setFNumber:](self->_sdofRenderRequest, "setFNumber:", v145);
    if ((v205 & 4) != 0)
    {
      v146 = self->_effectUtil;
      objc_msgSend(v8, "inScreenCaptureRect");
      v148 = v147;
      v150 = v149;
      v152 = v151;
      v154 = v153;
      p_disparityCenteredUpscaledWithScreenCaptureRect = &self->_disparityCenteredUpscaledWithScreenCaptureRect;
      disparityCenteredUpscaledWithScreenCaptureRect = self->_disparityCenteredUpscaledWithScreenCaptureRect;
      disparityCenteredUpscaledSDOF = self->_disparityCenteredUpscaledSDOF;
      -[PTRenderRequest focalLenIn35mmFilm](self->_sdofRenderRequest, "focalLenIn35mmFilm");
      v159 = v158;
      -[PTRenderRequest fNumber](self->_sdofRenderRequest, "fNumber");
      LODWORD(v161) = v160;
      LODWORD(v162) = v159;
      -[PTEffectUtil updateDisparityWithScreenCaptureRect:inDisparity:outDisparity:focalLenIn35mmFilm:fNumber:](v146, "updateDisparityWithScreenCaptureRect:inDisparity:outDisparity:focalLenIn35mmFilm:fNumber:", disparityCenteredUpscaledSDOF, disparityCenteredUpscaledWithScreenCaptureRect, v148, v150, v152, v154, v162, v161);
    }
    else
    {
      p_disparityCenteredUpscaledWithScreenCaptureRect = &self->_disparityCenteredUpscaledSDOF;
    }
    -[PTRenderRequest setSourceDisparity:](self->_sdofRenderRequest, "setSourceDisparity:", *p_disparityCenteredUpscaledWithScreenCaptureRect);
    renderPipeline = self->_renderPipeline;
    -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = -[PTRenderPipeline encodeRenderTo:withRenderRequest:](renderPipeline, "encodeRenderTo:withRenderRequest:", v164, self->_sdofRenderRequest) | v77;

    if ((_DWORD)v77)
    {
      _PTLogSystem();
      v165 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v165, OS_LOG_TYPE_ERROR))
        -[PTEffectRenderer render:waitUntilCompleted:gpuCompleted:].cold.3(v77, v165, v166, v167, v168, v169, v170, v171);

    }
    objc_msgSend(v39, "removeObjectAtIndex:", 0);
  }
  if (v211)
  {
    v172 = self->_backgroundReplacement;
    -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectAtIndexedSubscript:", 0);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectAtIndexedSubscript:", 1);
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTBackgroundReplacement replaceBackground:inYUV:inSegmentation:effectRenderRequest:outYUV:frameIndex:](v172, "replaceBackground:inYUV:inSegmentation:effectRenderRequest:outYUV:frameIndex:", v173, v174, v204, v8, v175, self->_frameIndex);

    v40 = v215;
    objc_msgSend(v39, "removeObjectAtIndex:", 0);
  }
  objc_msgSend(v8, "setOutColorBufferWriteSkipped:", 0);
  if (!v202)
    goto LABEL_181;
  if (-[PTEffectDescriptor allowSkipOutColorBufferWrite](self->_effectDescriptor, "allowSkipOutColorBufferWrite"))
  {
    -[PTVFXRenderEffect activeReactions](self->_vfxEffect, "activeReactions");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v176, "count"))
    {

    }
    else
    {
      debugType = self->_debugType;

      if (!debugType)
      {
        objc_msgSend(v8, "setOutColorBufferWriteSkipped:", 1);
        goto LABEL_181;
      }
    }
  }
  -[PTEffectRenderer copyInYUV:toOutYUV:](self, "copyInYUV:toOutYUV:", v218, v213);
LABEL_181:
  if (!((v205 >> 2) & 1 | !v214))
  {
    -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v77) = -[PTEffectRenderer renderReaction:effectRenderRequest:](self, "renderReaction:effectRenderRequest:", v190, v8) | v77;

  }
  objc_initWeak(buf, self);
  -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v192 = MEMORY[0x1E0C809B0];
  v222[0] = MEMORY[0x1E0C809B0];
  v222[1] = 3221225472;
  v222[2] = __59__PTEffectRenderer_render_waitUntilCompleted_gpuCompleted___block_invoke;
  v222[3] = &unk_1E822A8B0;
  objc_copyWeak(&v224, buf);
  v223 = v216;
  objc_msgSend(v191, "addScheduledHandler:", v222);

  -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v220[0] = v192;
  v220[1] = 3221225472;
  v220[2] = __59__PTEffectRenderer_render_waitUntilCompleted_gpuCompleted___block_invoke_94;
  v220[3] = &unk_1E822A8D8;
  v221 = v210;
  objc_msgSend(v193, "addCompletedHandler:", v220);

  metalContext = self->_metalContext;
  if (v200)
    -[PTMetalContext commitAndWaitUntilCompleted](metalContext, "commitAndWaitUntilCompleted");
  else
    -[PTMetalContext commitAndWaitUntilScheduled](metalContext, "commitAndWaitUntilScheduled");
  objc_msgSend(v8, "setReactions:", 0);
  if (v40)
    ++self->_networkFrameIndex;
  objc_msgSend(v8, "frameTimeSeconds");
  self->_lastFrameTime = v195;

  objc_destroyWeak(&v224);
  objc_destroyWeak(buf);

  v179 = 1;
  v177 = v213;
  v76 = v204;
LABEL_189:

  objc_autoreleasePoolPop(context);
  if (v179)
  {
    if (!-[PTMetalContext isCommandBufferCommitted](self->_metalContext, "isCommandBufferCommitted"))
    {
      _PTLogSystem();
      v196 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v196, OS_LOG_TYPE_ERROR))
        -[PTEffect render:].cold.1();

      LODWORD(v77) = v77 | 0xFFFFFFF7;
    }
    ++self->_frameIndex;
    self->_lastEffectType = objc_msgSend(v8, "effectType");
  }
  else
  {
    LODWORD(v77) = -10;
  }

  return v77;
}

void __59__PTEffectRenderer_render_waitUntilCompleted_gpuCompleted___block_invoke(uint64_t a1)
{
  dispatch_queue_t *WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = *(id *)(a1 + 32);
    v4 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          dispatch_async(WeakRetained[3], *(dispatch_block_t *)(*((_QWORD *)&v8 + 1) + 8 * i));
        }
        v5 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }
  }
  else
  {
    _PTLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __59__PTEffectRenderer_render_waitUntilCompleted_gpuCompleted___block_invoke_cold_1();
  }

}

uint64_t __59__PTEffectRenderer_render_waitUntilCompleted_gpuCompleted___block_invoke_94(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)copyInYUV:(id)a3 toOutYUV:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  PTMSRResize *msrColorPyramid;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64x2_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "texLuma");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "iosurface");

  objc_msgSend(v6, "texLuma");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "iosurface");

  if (v9 && v11)
  {
    msrColorPyramid = self->_msrColorPyramid;
    objc_msgSend(v7, "texLuma");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "width");
    objc_msgSend(v7, "texLuma");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "height");
    v17.i64[0] = v14;
    v17.i64[1] = v16;
    -[PTMSRResize rotate:crop:rotationDegree:toDest:synchronous:](msrColorPyramid, "rotate:crop:rotationDegree:toDest:synchronous:", v9, 0, v11, 1, *(double *)vcvt_hight_f32_f64(0, vcvtq_f64_u64(v17)).i64);

  }
  else
  {
    -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      _PTLogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[PTEffectRenderer render:waitUntilCompleted:gpuCompleted:].cold.5(v19, v20, v21, v22, v23, v24, v25, v26);

    }
    -[PTMetalContext textureUtil](self->_metalContext, "textureUtil");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "texLuma");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "texLuma");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "copy:inTex:outTex:", v28, v29, v30);

    -[PTMetalContext textureUtil](self->_metalContext, "textureUtil");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "texChroma");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "texChroma");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "copy:inTex:outTex:", v32, v33, v34);

  }
}

- (int)runGestureDetection:(id)a3 asyncWork:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const __CFString *v17;
  PTEffectReactionProvider *v18;
  PTEffectReactionProvider *v19;
  PTEffectReactionProvider *reactionProvider;
  PTEffectReactionProvider *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  void *v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  PTEffectReactionProvider *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _OWORD v62[3];
  uint8_t v63[128];
  _BYTE buf[24];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "detectedObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DetectedObjectsInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;

    v8 = v11;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HumanHands"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ObjectsArray"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HumanFaces"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ObjectsArray"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || self->_reactionProvider)
  {
    if (self->_externalHandDetectionsAvailable && !v13)
    {
      _PTLogSystem();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[PTEffectRenderer runGestureDetection:asyncWork:].cold.2();

    }
  }
  else
  {
    self->_externalHandDetectionsAvailable = v13 != 0;
    _PTLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      if (self->_externalHandDetectionsAvailable)
        v17 = CFSTR("YES");
      else
        v17 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v17;
      _os_log_impl(&dword_1C9281000, v16, OS_LOG_TYPE_INFO, "External hand detections available: %@", buf, 0xCu);
    }

    v18 = [PTEffectReactionProvider alloc];
    -[PTEffectDescriptor colorSize](self->_effectDescriptor, "colorSize");
    v19 = -[PTEffectReactionProvider initWithFrameSize:sharedResources:asyncInitQueue:externalHandDetectionsEnabled:](v18, "initWithFrameSize:sharedResources:asyncInitQueue:externalHandDetectionsEnabled:", self->_sharedResources, self->_asyncInitQueue, self->_externalHandDetectionsAvailable);
    reactionProvider = self->_reactionProvider;
    self->_reactionProvider = v19;

    v21 = self->_reactionProvider;
    if (!v21)
    {
      _PTLogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[PTEffectRenderer runGestureDetection:asyncWork:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

      v21 = self->_reactionProvider;
    }
    -[PTEffectDebugLayer setReactionProvider:](self->_debugLayer, "setReactionProvider:", v21);
  }
  if (self->_reactionProvider)
  {
    v31 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v6, "reactions");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)objc_msgSend(v31, "initWithArray:", v32);

    objc_msgSend(v6, "frameTimeSeconds");
    v34 = (uint64_t)(v33 * 100000.0);
    if (v6)
      objc_msgSend(v6, "transform");
    else
      memset(v62, 0, sizeof(v62));
    v35 = +[PTUtil getRotationDegreesFromAffineTransform:](PTUtil, "getRotationDegreesFromAffineTransform:", v62);
    v36 = self->_reactionProvider;
    v37 = objc_msgSend(v6, "inColorBuffer");
    *(_QWORD *)buf = v34;
    *(_QWORD *)&buf[8] = 0x1000186A0;
    *(_QWORD *)&buf[16] = 0;
    -[PTEffectReactionProvider updateWithFrame:withTimeStamp:withRotationDegrees:withDetectedHands:withDetectedFaces:asyncWork:](v36, "updateWithFrame:withTimeStamp:withRotationDegrees:withDetectedHands:withDetectedFaces:asyncWork:", v37, buf, v35, v13, v15, v7);
    -[PTEffectReactionProvider latestReactions](self->_reactionProvider, "latestReactions");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v38 && objc_msgSend(v38, "count"))
    {
      v51 = v15;
      v52 = v13;
      v53 = v10;
      v54 = v8;
      v55 = v7;
      v56 = v6;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v50 = v39;
      v40 = v39;
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v59;
        do
        {
          v44 = 0;
          do
          {
            if (*(_QWORD *)v59 != v43)
              objc_enumerationMutation(v40);
            v45 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v44);
            _PTLogSystem();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              v47 = objc_msgSend(v45, "triggerID");
              objc_msgSend(v45, "emoji");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218242;
              *(_QWORD *)&buf[4] = v47;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v48;
              _os_log_debug_impl(&dword_1C9281000, v46, OS_LOG_TYPE_DEBUG, "PTEffect: Detected reaction with ID %li, type %@", buf, 0x16u);

            }
            ++v44;
          }
          while (v42 != v44);
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
        }
        while (v42);
      }

      objc_msgSend(v57, "addObjectsFromArray:", v40);
      v7 = v55;
      v10 = v53;
      v15 = v51;
      v13 = v52;
    }
    objc_msgSend(v6, "setReactions:", v57, v50, v51, v52, v53, v54, v55, v56);

  }
  return 0;
}

- (int)renderReaction:(id)a3 effectRenderRequest:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  MTLTexture *vfxRenderTarget;
  double v11;
  double v12;
  _BOOL8 v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  double Width;
  double v20;
  float v21;
  unint64_t v22;
  double Height;
  double v24;
  float v25;
  unint64_t v26;
  PTDepthConverter *depthConverter;
  void *v28;
  MTLTexture *vfxDepthBuffer;
  double v30;
  double v31;
  MTLTexture *disparityCenteredUpscaledReactions;
  MTLTexture *v33;
  MTLBuffer *useDisparityBufferForReactions;
  double v35;
  MTLTexture *v36;
  MTLTexture *v37;
  PTVFXRenderEffect *vfxEffect;
  void *v39;
  const void *v40;
  CFNumberRef v41;
  _QWORD valuePtr[3];

  v6 = a3;
  v7 = a4;
  v8 = (objc_msgSend(v7, "effectType") & 0x40) != 0 && objc_msgSend(v7, "inBackgroundReplacementBuffer") != 0;
  -[PTVFXRenderEffect activeReactions](self->_vfxEffect, "activeReactions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  vfxRenderTarget = (MTLTexture *)objc_msgSend(v9, "count");

  if (vfxRenderTarget)
  {
    -[PTVFXRenderEffect depthNearFar](self->_vfxEffect, "depthNearFar");
    v12 = v11;
    v13 = -[PTVFXRenderEffect reverseZ](self->_vfxEffect, "reverseZ");
    objc_msgSend(v7, "outColorROI");
    if (v14 <= 0.0 || (objc_msgSend(v7, "outColorROI"), v15 <= 0.0))
    {
      _PTLogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[PTEffectRenderer renderReaction:effectRenderRequest:].cold.1();
      LODWORD(vfxRenderTarget) = -10;
    }
    else
    {
      if (objc_msgSend(v7, "outPersonSegmentationMatteBuffer"))
      {
        v16 = objc_msgSend(v7, "outPersonSegmentationMatteBuffer");
        -[PTMetalContext device](self->_metalContext, "device");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[PTPixelBufferUtil createTextureFromPixelBuffer:device:textureCache:sRGB:](PTPixelBufferUtil, "createTextureFromPixelBuffer:device:textureCache:sRGB:", v16, v17, self->_textureCache, 0);
        v18 = objc_claimAutoreleasedReturnValue();

      }
      else if (v8)
      {
        v18 = self->_upscaledPersonSegmentation;
      }
      else
      {
        v18 = 0;
      }
      Width = (double)CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v7, "outColorBuffer"));
      objc_msgSend(v7, "outColorROI");
      v21 = v20 * Width;
      v22 = vcvtas_u32_f32(v21);
      Height = (double)CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v7, "outColorBuffer"));
      objc_msgSend(v7, "outColorROI");
      v25 = v24 * Height;
      v26 = vcvtas_u32_f32(v25);
      if (-[MTLTexture width](self->_vfxRenderTarget, "width") != v22
        || -[MTLTexture height](self->_vfxRenderTarget, "height") != v26)
      {
        valuePtr[0] = v22;
        valuePtr[1] = v26;
        valuePtr[2] = 1;
        -[PTEffectRenderer createVfxTextures:](self, "createVfxTextures:", valuePtr);
      }
      depthConverter = self->_depthConverter;
      if (v18)
      {
        objc_msgSend(v7, "inBilbyAlphaMaskTexture");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        vfxDepthBuffer = self->_vfxDepthBuffer;
        objc_msgSend(v7, "reactionsCombinedCropRect");
        LODWORD(v30) = 0.75;
        -[PTDepthConverter segmentationToDepth:inSegmentation:inAlphaMask:outDepth:depthNearFar:segmentationDepthNearFar:reverseZ:threshold:cropRect:](depthConverter, "segmentationToDepth:inSegmentation:inAlphaMask:outDepth:depthNearFar:segmentationDepthNearFar:reverseZ:threshold:cropRect:", v6, v18, v28, vfxDepthBuffer, v13, v12, 5.27765665e13, v30, v31);

      }
      else
      {
        disparityCenteredUpscaledReactions = self->_disparityCenteredUpscaledReactions;
        v33 = self->_vfxDepthBuffer;
        useDisparityBufferForReactions = self->_useDisparityBufferForReactions;
        objc_msgSend(v7, "reactionsCombinedCropRect");
        -[PTDepthConverter thresholdedDisparityToDepth:inBaseDisparity:outDepth:depthNearFar:segmentationDepthNearFar:disparityThresholdNearFar:reverseZ:useDisparityBuffer:cropRect:](depthConverter, "thresholdedDisparityToDepth:inBaseDisparity:outDepth:depthNearFar:segmentationDepthNearFar:disparityThresholdNearFar:reverseZ:useDisparityBuffer:cropRect:", v6, disparityCenteredUpscaledReactions, v33, v13, useDisparityBufferForReactions, v12, 5.27765665e13, -5.2386921e-11, v35);
      }
      v36 = self->_vfxDepthBuffer;
      vfxRenderTarget = self->_vfxRenderTarget;
      v37 = self->_disparityCenteredUpscaledReactions;
      vfxEffect = self->_vfxEffect;
      -[PTEffectTemporalFilter disparityFiltered](self->_temporalFilter, "disparityFiltered");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(vfxRenderTarget) = -[PTVFXRenderEffect renderWithBackgroundDimming:effectRGBA:inCenteredDisparity:inSegmentation:effectDepth:disparityFiltered:focusDisparityModifiers:renderRequest:debugType:](vfxEffect, "renderWithBackgroundDimming:effectRGBA:inCenteredDisparity:inSegmentation:effectDepth:disparityFiltered:focusDisparityModifiers:renderRequest:debugType:", v6, vfxRenderTarget, v37, v18, v36, v39, self->_focusDisparityModifiers, v7, self->_debugType);

      LODWORD(valuePtr[0]) = -[PTVFXRenderEffect maxReactionEffectComplexity](self->_vfxEffect, "maxReactionEffectComplexity");
      v40 = (const void *)objc_msgSend(v7, "outColorBuffer");
      v41 = CFNumberCreate(0, kCFNumberIntType, valuePtr);
      CMSetAttachment(v40, CFSTR("ReactionEffectComplexity"), v41, 1u);
    }

  }
  return (int)vfxRenderTarget;
}

+ (PTEffectPixelBufferDescriptor)segmentationMatteFormatForColorSize:(SEL)a3
{
  return +[PTEffectPersonSegmentation upscaledSegmentationMatteFormatForColorSize:](PTEffectPersonSegmentation, "upscaledSegmentationMatteFormatForColorSize:", a4.width, a4.height);
}

- (void)removeAllActiveReactions
{
  -[PTVFXRenderEffect removeAllActiveReactions](self->_vfxEffect, "removeAllActiveReactions");
}

+ (BOOL)useStudioLightFromSegmentation:(id)a3
{
  void *v3;
  char v4;

  FTGetChipIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("H13")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("H14"));

  return v4;
}

- (int64_t)effectQuality
{
  return self->effectQuality;
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_sharedResources, 0);
  objc_storeStrong((id *)&self->_humanDetections, 0);
  objc_storeStrong((id *)&self->_asyncInitQueue, 0);
  objc_storeStrong((id *)&self->_depthConverter, 0);
  objc_storeStrong((id *)&self->_vfxRenderTarget, 0);
  objc_storeStrong((id *)&self->_vfxDepthBuffer, 0);
  objc_storeStrong((id *)&self->_vfxEffect, 0);
  objc_storeStrong((id *)&self->_personSegmentation, 0);
  objc_storeStrong((id *)&self->_reactionProvider, 0);
  objc_storeStrong((id *)&self->_temporalFilter, 0);
  objc_storeStrong((id *)&self->_diffuseEstimation, 0);
  objc_storeStrong((id *)&self->_effectDescriptor, 0);
  objc_storeStrong((id *)&self->_effectUtil, 0);
  objc_storeStrong((id *)&self->_util, 0);
  objc_storeStrong((id *)&self->_debugLayer, 0);
  objc_storeStrong((id *)&self->_sdofRenderRequest, 0);
  objc_storeStrong((id *)&self->_colorConversion, 0);
  objc_storeStrong((id *)&self->_effectRelighting, 0);
  objc_storeStrong((id *)&self->_cvmNetwork, 0);
  objc_storeStrong((id *)&self->_guideRGBACoefficients, 0);
  objc_storeStrong((id *)&self->_guideRGBAUpscale, 0);
  objc_storeStrong((id *)&self->_guidedFilter, 0);
  objc_storeStrong((id *)&self->_useDisparityBufferForReactions, 0);
  objc_storeStrong((id *)&self->_studioLightEffectModifier, 0);
  objc_storeStrong((id *)&self->_focusDisparityModifiers, 0);
  objc_storeStrong((id *)&self->_msrColorPyramid, 0);
  objc_storeStrong((id *)&self->_focusDisparityRaw, 0);
  objc_storeStrong((id *)&self->_lastFocus, 0);
  objc_storeStrong((id *)&self->_faceDisparityArray, 0);
  for (i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_intermediateYUV[i + 1], 0);
  objc_storeStrong((id *)&self->_diffuse, 0);
  objc_storeStrong((id *)&self->_backgroundReplacement, 0);
  objc_storeStrong((id *)&self->_upscaledPersonSegmentation, 0);
  objc_storeStrong((id *)&self->_disparityCenteredUpscaledWithScreenCaptureRect, 0);
  objc_storeStrong((id *)&self->_disparityCenteredUpscaledReactions, 0);
  objc_storeStrong((id *)&self->_disparityCenteredUpscaledSDOF, 0);
  objc_storeStrong((id *)&self->_renderState, 0);
  objc_storeStrong((id *)&self->_renderPipeline, 0);
  objc_storeStrong((id *)&self->_asyncQueue, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.11(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.12(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.13(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.15(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.16(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.17(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.18(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.19(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.20(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.21(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.23(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.24(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.25(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:.cold.26()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "VFX init failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.27(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.29(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.30(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.31(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.32(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:(NSObject *)a1 metalContext:(uint64_t)a2 useHighResNetwork:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 humanDetections:(uint64_t)a5 prevTemporalState:(uint64_t)a6 asyncInitQueue:(uint64_t)a7 sharedResources:(uint64_t)a8 .cold.33(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:.cold.34()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "Invalid disparity size. Using 320 x 176", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)initWithDescriptor:(void *)a1 metalContext:(const char *)a2 useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:.cold.36(void *a1, const char *a2)
{
  float v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_11_1(a1, a2);
  OUTLINED_FUNCTION_9_1(v2);
  OUTLINED_FUNCTION_0_3(&dword_1C9281000, v3, v4, "defaults write com.apple.coremedia PTEffectFocusDisparityExponentialMovingAverageStudioLight %f", v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_1_1();
}

- (void)initWithDescriptor:(void *)a1 metalContext:(const char *)a2 useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:.cold.37(void *a1, const char *a2)
{
  float v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_11_1(a1, a2);
  OUTLINED_FUNCTION_9_1(v2);
  OUTLINED_FUNCTION_0_3(&dword_1C9281000, v3, v4, "defaults write com.apple.coremedia PTEffectFocusDisparityExponentialMovingAverage %f", v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_1_1();
}

- (void)initWithDescriptor:(void *)a1 metalContext:(const char *)a2 useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:.cold.38(void *a1, const char *a2)
{
  float v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_11_1(a1, a2);
  OUTLINED_FUNCTION_9_1(v2);
  OUTLINED_FUNCTION_0_3(&dword_1C9281000, v3, v4, "defaults write com.apple.coremedia PTEffectFocusDisparityMax %f", v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_1_1();
}

- (void)initWithDescriptor:metalContext:useHighResNetwork:faceAttributesNetwork:humanDetections:prevTemporalState:asyncInitQueue:sharedResources:.cold.39()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "Error allocating texture cache", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)render:waitUntilCompleted:gpuCompleted:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "Missing effectRenderRequest.outPersonSegmentationMatteBuffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)render:(uint64_t)a3 waitUntilCompleted:(uint64_t)a4 gpuCompleted:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_15(&dword_1C9281000, a2, a3, "Error executing render pipeline %i", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_12();
}

- (void)render:(uint64_t)a3 waitUntilCompleted:(uint64_t)a4 gpuCompleted:(uint64_t)a5 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_15(&dword_1C9281000, a2, a3, "Error guidedFilter %i", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_12();
}

- (void)render:(uint64_t)a3 waitUntilCompleted:(uint64_t)a4 gpuCompleted:(uint64_t)a5 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)render:waitUntilCompleted:gpuCompleted:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "Rotation is not supported for segmentation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void __59__PTEffectRenderer_render_waitUntilCompleted_gpuCompleted___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "Async task during destruction", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)runGestureDetection:(uint64_t)a3 asyncWork:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)runGestureDetection:asyncWork:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "External hand detections expected but not provided in effectRenderRequest.detectedObjects", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)renderReaction:effectRenderRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "Invalid outColorROI", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

@end
