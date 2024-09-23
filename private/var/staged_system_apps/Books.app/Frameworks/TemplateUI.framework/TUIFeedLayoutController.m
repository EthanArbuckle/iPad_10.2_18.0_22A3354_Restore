@implementation TUIFeedLayoutController

- (TUIFeedLayoutController)initWithFeedId:(id)a3 environment:(id)a4 factory:(id)a5 manager:(id)a6 renderMode:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  TUIFeedLayoutController *v16;
  TUIFeedLayoutController *v17;
  dispatch_queue_attr_t v18;
  NSObject *v19;
  dispatch_queue_attr_t v20;
  NSObject *v21;
  TUIWorkQueueContext *v22;
  TUIWorkQueueContext *queueContext;
  dispatch_queue_t v24;
  OS_dispatch_queue *dataRequestsSync;
  NSMutableDictionary *v26;
  NSMutableDictionary *sections;
  TUITransactionCoordinator *v28;
  TUITransactionCoordinating *transactionCoordinator;
  TUIWPService *v30;
  TUIWPService *wpService;
  TUIStatsDatesCollector *v32;
  TUIStatsDatesCollector *datesCollector;
  void *v34;
  uint64_t v35;
  NSHashTable *layoutConditionsSuspendingUpdates;
  uint64_t v37;
  NSHashTable *layoutConditionsSuspendingLayout;
  TUIEnvironment *environmentPendingUpdate;
  unint64_t renderModelMode;
  TUIRenderUpdateCollectionController *v41;
  void *v42;
  TUIRenderUpdateCollectionController *v43;
  TUIRenderUpdateCollectionController *updateController;
  TUIRenderUpdateAuxiliaryController *v45;
  void *layerUpdateController;
  TUIRenderUpdateLayerController *v47;
  objc_super v49;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v49.receiver = self;
  v49.super_class = (Class)TUIFeedLayoutController;
  v16 = -[TUIFeedLayoutController init](&v49, "init");
  v17 = v16;
  if (v16)
  {
    v16->_feedId.uniqueIdentifier = a3.var0;
    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_USER_INITIATED, 0);
    v21 = objc_claimAutoreleasedReturnValue(v20);

    v17->_priority = 0.5;
    v22 = objc_alloc_init(TUIWorkQueueContext);
    queueContext = v17->_queueContext;
    v17->_queueContext = v22;

    v24 = dispatch_queue_create("TUIFeedLayoutController.dataRequestsSync", v21);
    dataRequestsSync = v17->_dataRequestsSync;
    v17->_dataRequestsSync = (OS_dispatch_queue *)v24;

    objc_storeStrong((id *)&v17->_environment, a4);
    objc_storeStrong((id *)&v17->_manager, a6);
    objc_storeStrong((id *)&v17->_templateFactory, a5);
    v26 = objc_opt_new(NSMutableDictionary);
    sections = v17->_sections;
    v17->_sections = v26;

    v28 = -[TUITransactionCoordinator initWithFeedId:layoutQueueContext:delegate:]([TUITransactionCoordinator alloc], "initWithFeedId:layoutQueueContext:delegate:", v17->_feedId.uniqueIdentifier, v17->_queueContext, v17);
    transactionCoordinator = v17->_transactionCoordinator;
    v17->_transactionCoordinator = (TUITransactionCoordinating *)v28;

    v17->_loadingFooterHeight = 60.0;
    v30 = objc_alloc_init(TUIWPService);
    wpService = v17->_wpService;
    v17->_wpService = v30;

    v32 = objc_alloc_init(TUIStatsDatesCollector);
    datesCollector = v17->_datesCollector;
    v17->_datesCollector = v32;

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[TUIStatsDatesCollector setCreationDate:](v17->_datesCollector, "setCreationDate:", v34);

    v17->_layoutState = 0;
    v17->_layoutConditionsLock._os_unfair_lock_opaque = 0;
    v35 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    layoutConditionsSuspendingUpdates = v17->_layoutConditionsSuspendingUpdates;
    v17->_layoutConditionsSuspendingUpdates = (NSHashTable *)v35;

    v37 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    layoutConditionsSuspendingLayout = v17->_layoutConditionsSuspendingLayout;
    v17->_layoutConditionsSuspendingLayout = (NSHashTable *)v37;

    v17->_renderModelMode = a7;
    v17->_environmentLock._os_unfair_lock_opaque = 0;
    environmentPendingUpdate = v17->_environmentPendingUpdate;
    v17->_environmentPendingUpdate = 0;

    *(_BYTE *)&v17->_flags = 1;
    renderModelMode = v17->_renderModelMode;
    if (renderModelMode == 1)
    {
      v47 = objc_alloc_init(TUIRenderUpdateLayerController);
      layerUpdateController = v17->_layerUpdateController;
      v17->_layerUpdateController = v47;
    }
    else
    {
      if (renderModelMode)
      {
LABEL_7:

        goto LABEL_8;
      }
      v41 = [TUIRenderUpdateCollectionController alloc];
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWorkQueueContext workQueue](v17->_queueContext, "workQueue"));
      v43 = -[TUIRenderUpdateCollectionController initWithLayoutQueue:renderModel:](v41, "initWithLayoutQueue:renderModel:", v42, 0);
      updateController = v17->_updateController;
      v17->_updateController = v43;

      v45 = objc_alloc_init(TUIRenderUpdateAuxiliaryController);
      layerUpdateController = v17->_auxiliaryUpdateController;
      v17->_auxiliaryUpdateController = v45;
    }

    goto LABEL_7;
  }
LABEL_8:

  return v17;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  char v5;
  char v6;
  char v7;
  char v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector(obj, "feedLayoutController:updateStats:") & 1;
    if ((objc_opt_respondsToSelector(obj, "feedLayoutController:willTransitionToLayoutState:") & 1) != 0)
      v5 = 2;
    else
      v5 = 0;
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFD | v5;
    if ((objc_opt_respondsToSelector(obj, "feedLayoutController:didTransitionToLayoutState:") & 1) != 0)
      v6 = 4;
    else
      v6 = 0;
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFB | v6;
    if ((objc_opt_respondsToSelector(obj, "feedLayoutControllerAllContentReady:") & 1) != 0)
      v7 = 8;
    else
      v7 = 0;
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xF7 | v7;
    if ((objc_opt_respondsToSelector(obj, "feedLayoutControllerInitialContentReady:") & 1) != 0)
      v8 = 16;
    else
      v8 = 0;
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xEF | v8;
  }

}

- (id)lq_createRenderModelForFeedEntry:(id)a3 section:(int64_t)a4
{
  id v6;
  _TUIFeedLayoutSection *v7;
  NSMutableDictionary *sections;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = -[_TUIFeedLayoutSection initWithFeedId:section:controller:entry:]([_TUIFeedLayoutSection alloc], "initWithFeedId:section:controller:entry:", self->_feedId.uniqueIdentifier, a4, self, v6);

  -[_TUIFeedLayoutSection setStatsMode:](v7, "setStatsMode:", self->_lq_statsMode);
  sections = self->_sections;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  -[NSMutableDictionary setObject:forKey:](sections, "setObject:forKey:", v7, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIFeedLayoutSection renderModel](v7, "renderModel"));
  return v10;
}

- (id)lq_loadFeedEntry:(id)a3 data:(id)a4 section:(int64_t)a5 transactionGroup:(id)a6
{
  NSMutableDictionary *sections;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  sections = self->_sections;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a5));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sections, "objectForKeyedSubscript:", v14));

  objc_msgSend(v15, "lq_loadOrUpdateEntry:data:controller:transactionGroup:", v13, v12, self, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "renderModel"));

  return v16;
}

- (id)_infoForFinal:(BOOL)a3
{
  void *v3;
  const __CFString *v5;
  void *v6;

  if (a3)
  {
    v5 = CFSTR("TUIRenderInfoKeyIsFinal");
    v6 = &__kCFBooleanTrue;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)lq_updateRenderModelsWithTransactionGroup:(id)a3
{
  id v3;
  NSObject *v4;
  unint64_t uniqueIdentifier;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t frameSignpost;
  unint64_t v12;
  TUIStatsLiveResize *statsLiveResize;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t layoutNextSection;
  uint64_t v18;
  void *v19;
  void *v20;
  char *v21;
  unint64_t v22;
  void *v23;
  _BOOL4 v24;
  unint64_t layoutNumberOfSections;
  unint64_t v26;
  char v27;
  TUIFeedLayoutController *v28;
  NSMutableDictionary *sections;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  unsigned int v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  NSObject *v40;
  NSObject *v41;
  os_signpost_id_t v42;
  unint64_t v43;
  id v44;
  NSObject *v45;
  NSObject *v46;
  os_signpost_id_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double MaxY;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  TUIFeedViewState *layoutViewState;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  char *v62;
  unint64_t v63;
  NSMutableDictionary *v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  char *v73;
  double v74;
  double v75;
  double v76;
  char *v77;
  double v78;
  NSMutableDictionary *v79;
  void *v80;
  void *v81;
  void *v82;
  double v83;
  double v84;
  unint64_t v85;
  double v86;
  NSMutableDictionary *v87;
  void *v88;
  void *v89;
  void *v90;
  double v91;
  double v92;
  TUIEnvironment *prevEnvironment;
  TUIFeedLayoutController *v94;
  uint64_t v95;
  uint64_t v96;
  double v97;
  NSMutableArray *v98;
  TUIFeedLayoutController *v99;
  unint64_t v100;
  NSMutableDictionary *v101;
  void *v102;
  void *v103;
  double v104;
  double v105;
  void *v106;
  void *v107;
  NSMutableIndexSet *v108;
  void *v109;
  void *v110;
  id v111;
  void *v112;
  TUIFeedViewState *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  char *v119;
  NSMutableDictionary *v120;
  void *v121;
  void *v122;
  double v123;
  double v124;
  double v125;
  double v126;
  void *v127;
  char *v128;
  double v129;
  int v130;
  TUIFeedViewState *v131;
  unint64_t v132;
  double v133;
  TUIFeedLayoutController *v134;
  NSMutableDictionary *v135;
  uint64_t v136;
  void *v137;
  void *v138;
  double v139;
  void *v140;
  double v141;
  double v142;
  void *v143;
  void *v144;
  unsigned int v145;
  int v146;
  void *v147;
  NSMutableArray *v148;
  id v149;
  uint64_t v150;
  double v151;
  void *i;
  void *v153;
  id v154;
  NSMutableDictionary *v155;
  void *v156;
  void *v157;
  id v158;
  double v159;
  double v160;
  double v161;
  double v162;
  void *v163;
  void *v164;
  unsigned int v165;
  id v166;
  void *v167;
  id v168;
  double Height;
  id v170;
  void *v171;
  unint64_t v172;
  NSMutableDictionary *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  unsigned __int8 v178;
  NSUUID *v179;
  id v180;
  TUIFeedLayoutController *v181;
  NSMutableDictionary *v182;
  void *v183;
  TUIFeedLayoutController *v184;
  double v185;
  double v186;
  unint64_t v187;
  unint64_t v188;
  double v189;
  double v190;
  double v191;
  double v192;
  void *v193;
  void *v194;
  unsigned int v195;
  id v196;
  double v197;
  void *v198;
  uint64_t v199;
  void *v200;
  void *v201;
  unsigned int v202;
  NSUUID *layoutUntilEntryWithUUID;
  double v204;
  double v205;
  void *v206;
  void *v207;
  double v208;
  double v209;
  double v210;
  char *v211;
  _BOOL4 v213;
  NSMutableDictionary *v214;
  void *v215;
  void *v216;
  void *v217;
  double v218;
  double v219;
  int v220;
  unint64_t v221;
  BOOL v222;
  _BOOL4 v223;
  NSMutableDictionary *v224;
  void *v225;
  void *v226;
  void *v227;
  double v228;
  double v229;
  TUIMutableAnchorSet *v230;
  TUIFeedLayoutController *v231;
  unint64_t v232;
  NSMutableDictionary *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  double v239;
  double v240;
  TUILogicalScrollAnchor *v241;
  TUILogicalScrollAnchor *v242;
  TUILogicalScrollAnchor *v243;
  double v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  double v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  unsigned int v256;
  void *v257;
  id *p_currentHostingMap;
  void *v259;
  id v260;
  TUIRenderModelAuxiliary **p_currentAuxiliaryModel;
  __int128 v262;
  unint64_t v263;
  double v264;
  TUIFeedLayoutController *v265;
  NSMutableDictionary *v266;
  void *v267;
  void *v268;
  void *v269;
  _BOOL4 v270;
  void *v271;
  void *v272;
  _BOOL4 v273;
  void *v274;
  id v275;
  NSObject *v276;
  void *v277;
  TUIRenderModelTransform *v278;
  double v279;
  CGFloat v280;
  double v281;
  CGFloat v282;
  double MidX;
  double v284;
  double v285;
  unint64_t v286;
  char v287;
  void *v288;
  double v289;
  double v290;
  double v291;
  TUIContainerLayerConfig *v292;
  TUIRenderModelLayer *v293;
  TUIRenderModelLayer **p_currentLayerRenderModel;
  TUIAnchorSet *v295;
  TUIAnchorSet *anchorSet;
  void *v297;
  unsigned __int8 v298;
  TUIFeedViewState *v299;
  TUIFeedViewState *restoreViewState;
  id v301;
  NSObject *v302;
  unint64_t v303;
  id v304;
  NSObject *v305;
  NSObject *v306;
  os_signpost_id_t v307;
  unint64_t v308;
  id v309;
  NSObject *v310;
  NSObject *v311;
  os_signpost_id_t v312;
  unint64_t v313;
  id v314;
  TUIFeedViewState *v315;
  id v316;
  NSObject *v317;
  NSObject *v318;
  os_signpost_id_t v319;
  unint64_t v320;
  NSMutableDictionary *v321;
  NSMutableArray *v322;
  NSMutableDictionary *v323;
  NSMutableArray *v324;
  NSMutableArray *v325;
  TUIFeedLayoutController *v326;
  unint64_t v327;
  NSMutableDictionary *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  TUIStatsFeedPass *v333;
  TUIFeedLayoutController *v334;
  TUIStatsFeed *v335;
  TUIStatsFeed *v336;
  __int128 v337;
  void *v338;
  void *v339;
  _BOOL4 v340;
  char v341;
  char v342;
  TUIMutableAnchorSet *v343;
  TUIRenderModelAuxiliary *v344;
  id v345;
  void *v346;
  unint64_t layoutFlags;
  BOOL v348;
  id v349;
  _QWORD *v350;
  id v351;
  void *v352;
  void *v353;
  int v354;
  NSMutableArray *v355;
  NSMutableArray *v356;
  id v357;
  id v358;
  unint64_t obj;
  id obja;
  TUILayoutRenderModelCollector *objb;
  id v362;
  id v363;
  _QWORD v365[5];
  TUIStatsFeed *v366;
  _QWORD v367[5];
  NSMutableArray *v368;
  uint64_t v369;
  _QWORD v370[5];
  _QWORD v371[5];
  NSMutableArray *v372;
  TUIMutableAnchorSet *v373;
  id v374;
  TUIFeedViewState *v375;
  id v376;
  _BYTE *v377;
  uint64_t *v378;
  __int128 *v379;
  uint64_t *v380;
  unint64_t v381;
  unsigned __int8 v382;
  char v383;
  char v384;
  BOOL v385;
  __int128 v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  _QWORD v390[5];
  _QWORD v391[5];
  id v392;
  id v393;
  uint64_t *v394;
  uint64_t *v395;
  uint64_t v396;
  uint64_t *v397;
  uint64_t v398;
  char v399;
  uint64_t v400;
  uint64_t *v401;
  uint64_t v402;
  uint64_t (*v403)(uint64_t, uint64_t);
  void (*v404)(uint64_t);
  id v405;
  _QWORD v406[5];
  uint64_t v407;
  uint64_t *v408;
  uint64_t v409;
  uint64_t (*v410)(uint64_t, uint64_t);
  void (*v411)(uint64_t);
  id v412;
  _BYTE v413[12];
  __int16 v414;
  unint64_t v415;
  uint8_t v416[128];
  __int128 v417;
  uint64_t v418;
  const char *v419;
  uint64_t v420;
  double v421;
  _BYTE buf[24];
  uint64_t (*v423)(uint64_t, uint64_t);
  void (*v424)(uint64_t);
  TUIRenderModelCollection *v425;
  CGRect v426;
  CGRect v427;
  CGRect v428;
  CGRect v429;
  CGRect v430;
  CGRect v431;

  v362 = a3;
  kdebug_trace(725408464, 0, 0, 0, 0);
  v3 = TUILayoutLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uniqueIdentifier = self->_feedId.uniqueIdentifier;
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = uniqueIdentifier;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v362;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "[fid:%lu] Ariadne FeedLayoutStart group=%@", buf, 0x16u);
  }

  v339 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if (self->_inLiveResize)
    ++self->_liveResizeLayoutCount;
  v6 = TUIInstantiationLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  self->_frameSignpost = os_signpost_id_generate(v7);

  v8 = TUIInstantiationLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  frameSignpost = self->_frameSignpost;
  if (frameSignpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v12 = self->_feedId.uniqueIdentifier;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v12;
    _os_signpost_emit_with_name_impl(&dword_0, v10, OS_SIGNPOST_INTERVAL_BEGIN, frameSignpost, "Instantiation", "[fid:%lu] ", buf, 0xCu);
  }

  statsLiveResize = self->_statsLiveResize;
  if (statsLiveResize)
  {
    -[TUIStatsLiveResize beginFrame](statsLiveResize, "beginFrame");
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_sections, "enumerateKeysAndObjectsUsingBlock:", &stru_240A40);
  }
  -[TUIStatsTimingCollector startPhase:](self->_timingCollector, "startPhase:", 0);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v423 = sub_B9CA8;
  v424 = sub_B9CB8;
  v425 = self->_currentRenderModel;
  v407 = 0;
  v408 = &v407;
  v409 = 0x3032000000;
  v410 = sub_B9CA8;
  v411 = sub_B9CB8;
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "sections"));
  v15 = (void *)v14;
  v16 = &__NSArray0__struct;
  if (v14)
    v16 = (void *)v14;
  v412 = v16;

  layoutNextSection = self->_layoutNextSection;
  if (layoutNextSection < (unint64_t)objc_msgSend((id)v408[5], "count"))
  {
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v408[5], "subarrayWithRange:", 0, self->_layoutNextSection));
    v19 = (void *)v408[5];
    v408[5] = v18;

  }
  if (self->_layoutUntilEntryWithUUID)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedContent entries](self->_content, "entries"));
    v406[0] = _NSConcreteStackBlock;
    v406[1] = 3221225472;
    v406[2] = sub_B9CC0;
    v406[3] = &unk_240A68;
    v406[4] = self;
    v21 = (char *)objc_msgSend(v20, "indexOfObjectPassingTest:", v406);

    v22 = 0x7FFFFFFFFFFFFFFFLL;
    if (v21 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedContent entries](self->_content, "entries"));
      v24 = v21 + 1 == objc_msgSend(v23, "count");

      if (v24)
        v22 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v22 = (unint64_t)v21;
    }
  }
  else
  {
    v22 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v26 = self->_layoutNextSection;
  layoutNumberOfSections = self->_layoutNumberOfSections;
  v348 = v26 < layoutNumberOfSections;
  if (v26 >= layoutNumberOfSections)
  {
LABEL_35:
    v341 = 0;
  }
  else
  {
    v27 = 0;
    v28 = self;
    while (1)
    {
      sections = v28->_sections;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v26));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sections, "objectForKeyedSubscript:", v30));

      if ((objc_msgSend(v31, "needsInstantiation") & 1) == 0
        || (v26 > v22 ? (v32 = v22 != 0x7FFFFFFFFFFFFFFFLL) : (v32 = 0),
            v32
         || (v22 == 0x7FFFFFFFFFFFFFFFLL || v26 > v22)
         && (v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "entry")),
             v34 = -[TUIFeedLayoutController _lq_shouldInstantiateEntry:sectionIndex:transactionGroup:](self, "_lq_shouldInstantiateEntry:sectionIndex:transactionGroup:", v33, v26, v362), v33, !v34)))
      {
        v341 = 0;
        goto LABEL_38;
      }
      v35 = objc_autoreleasePoolPush();
      objc_msgSend(v31, "lq_instantiateWithController:transactionGroup:", self, v362);
      objc_autoreleasePoolPop(v35);
      if (v22 == v26)
        break;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "renderModel"));
      if (v36)
      {

        v37 = 1;
      }
      else
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "layerRenderModel"));
        v37 = v38 != 0;

        if (!(_DWORD)v37)
          goto LABEL_35;
      }
      v26 += v37;
      v28 = self;
      v27 = 1;
      if (v26 >= self->_layoutNumberOfSections)
        goto LABEL_35;
    }
    v341 = 1;
    v27 = 1;
LABEL_38:

    v348 = v27;
  }
  v39 = TUIInstantiationLog();
  v40 = objc_claimAutoreleasedReturnValue(v39);
  v41 = v40;
  v42 = self->_frameSignpost;
  if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
  {
    v43 = self->_feedId.uniqueIdentifier;
    LODWORD(v417) = 134217984;
    *(_QWORD *)((char *)&v417 + 4) = v43;
    _os_signpost_emit_with_name_impl(&dword_0, v41, OS_SIGNPOST_INTERVAL_END, v42, "Instantiation", "[fid:%lu] ", (uint8_t *)&v417, 0xCu);
  }

  v44 = TUIInstantiationLog();
  v45 = objc_claimAutoreleasedReturnValue(v44);
  v46 = v45;
  v47 = self->_frameSignpost;
  if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
  {
    v48 = self->_feedId.uniqueIdentifier;
    LODWORD(v417) = 134217984;
    *(_QWORD *)((char *)&v417 + 4) = v48;
    _os_signpost_emit_with_name_impl(&dword_0, v46, OS_SIGNPOST_INTERVAL_BEGIN, v47, "Layout", "[fid:%lu] ", (uint8_t *)&v417, 0xCu);
  }

  v346 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v408[5], "lastObject"));
  *(_QWORD *)&v417 = 0;
  *((_QWORD *)&v417 + 1) = &v417;
  v418 = 0x3010000000;
  v420 = 0;
  v421 = 0.0;
  v419 = "";
  -[TUIEnvironment viewSize](self->_environment, "viewSize");
  v50 = v49;
  if (v346)
  {
    objc_msgSend(v346, "frame");
    MaxY = CGRectGetMaxY(v426);
  }
  else
  {
    MaxY = 0.0;
  }
  v420 = v50;
  v421 = MaxY;
  v400 = 0;
  v401 = &v400;
  v402 = 0x3032000000;
  v403 = sub_B9CA8;
  v404 = sub_B9CB8;
  v405 = 0;
  v396 = 0;
  v397 = &v396;
  v398 = 0x2020000000;
  v399 = 0;
  v52 = objc_opt_class(NSString);
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedContent currentStackName](self->_content, "currentStackName"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "value"));
  v55 = TUIDynamicCast(v52, v54);
  v345 = (id)objc_claimAutoreleasedReturnValue(v55);

  if (self->_environmentChanged && (layoutViewState = self->_layoutViewState) != 0 && self->_prevEnvironment)
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewState feedScrollAnchor](layoutViewState, "feedScrollAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "anchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "identifier"));

    if (v59)
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedContent entries](self->_content, "entries"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "valueForKey:", CFSTR("uuid")));
      v62 = (char *)objc_msgSend(v61, "indexOfObject:", v59);

      v63 = 0x7FFFFFFFFFFFFFFFLL;
      obj = 0x7FFFFFFFFFFFFFFFLL;
      if (v62 != (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        if ((unint64_t)v62 >= self->_layoutNextSection)
        {
          obj = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          v64 = self->_sections;
          v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v62));
          v66 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v64, "objectForKeyedSubscript:", v65));

          v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "renderModel"));
          objc_msgSend(v67, "size");
          v69 = v68;

          -[TUIEnvironment viewSize](self->_prevEnvironment, "viewSize");
          v71 = v70;
          v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "anchor"));
          v73 = (char *)objc_msgSend(v72, "position");

          if (v73 == (_BYTE *)&dword_0 + 1)
          {
            v74 = v71 - v69;
          }
          else
          {
            v74 = 0.0;
            if (v73 == (_BYTE *)&dword_0 + 2)
              v74 = (v71 - v69) * 0.5;
          }
          objc_msgSend(v57, "relativeDistance");
          v76 = v74 + v71 * 0.5 * v75;
          if (v62)
          {
            v63 = (unint64_t)v62;
            if (v76 > 0.0)
            {
              v77 = v62 - 1;
              v78 = v74 + v71 * 0.5 * v75;
              do
              {
                v79 = self->_sections;
                v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v77));
                v81 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v79, "objectForKeyedSubscript:", v80));
                v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "renderModel"));
                objc_msgSend(v82, "size");
                v84 = v83;

                v222 = v77-- != 0;
                if (!v222)
                  break;
                v78 = v78 - v84;
              }
              while (v78 > 0.0);
              v63 = (unint64_t)(v77 + 1);
            }
          }
          else
          {
            v63 = 0;
          }
          v85 = (unint64_t)(v62 + 1);
          if ((unint64_t)(v62 + 1) < self->_layoutNextSection)
          {
            v86 = v71 - (v69 + v76);
            while (v86 > 0.0 && v85 < self->_layoutNextSection)
            {
              v87 = self->_sections;
              v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v85));
              v89 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v87, "objectForKeyedSubscript:", v88));
              v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "renderModel"));
              objc_msgSend(v90, "size");
              v92 = v91;

              v86 = v86 - v92;
              ++v85;
            }
            v62 = (char *)(v85 - 1);
          }

          obj = (unint64_t)v62;
        }
      }
    }
    else
    {
      obj = 0x7FFFFFFFFFFFFFFFLL;
      v63 = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  else
  {
    obj = 0x7FFFFFFFFFFFFFFFLL;
    v63 = 0x7FFFFFFFFFFFFFFFLL;
  }
  prevEnvironment = self->_prevEnvironment;
  self->_prevEnvironment = 0;

  v94 = self;
  if (self->_environmentChanged)
  {
    -[TUIEnvironment viewSize](self->_environment, "viewSize");
    v95 = *((_QWORD *)&v417 + 1);
    *(_QWORD *)(*((_QWORD *)&v417 + 1) + 32) = v96;
    *(_QWORD *)(v95 + 40) = 0;
    -[TUIEnvironment viewSize](self->_environment, "viewSize");
    self->_loadingFooterMinY = v97 * 0.5;
    if (self->_currentRenderModel)
    {
      v98 = 0;
    }
    else
    {
      v98 = objc_opt_new(NSMutableArray);

    }
    v99 = self;
    if (self->_layoutNextSection)
    {
      v100 = 0;
      do
      {
        v101 = v99->_sections;
        v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v100));
        v103 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v101, "objectForKeyedSubscript:", v102));

        objc_msgSend(v103, "setEnvironmentNeedsUpdate:", 1);
        -[TUIEnvironment viewSize](self->_environment, "viewSize");
        v105 = v104;
        v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "renderModel"));
        objc_msgSend(v106, "size");
        objc_msgSend(v103, "lq_createEmptyRenderModelWithSize:", v105);

        v107 = (void *)v401[5];
        if (!v107)
        {
          v108 = objc_opt_new(NSMutableIndexSet);
          v109 = (void *)v401[5];
          v401[5] = (uint64_t)v108;

          v107 = (void *)v401[5];
        }
        objc_msgSend(v107, "addIndex:", v100);
        v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "renderModel"));
        -[NSMutableArray addObject:](v98, "addObject:", v110);

        ++v100;
        v99 = self;
      }
      while (v100 < self->_layoutNextSection);
    }
    if (v98)
    {
      v111 = -[NSMutableArray copy](v98, "copy");
      v112 = (void *)v408[5];
      v408[5] = (uint64_t)v111;

    }
    v94 = self;
  }
  v391[0] = _NSConcreteStackBlock;
  v391[1] = 3221225472;
  v391[2] = sub_B9D04;
  v391[3] = &unk_240A90;
  v391[4] = v94;
  v357 = v362;
  v392 = v357;
  v363 = v345;
  v393 = v363;
  v394 = &v396;
  v395 = &v400;
  v350 = objc_retainBlock(v391);
  layoutFlags = self->_layoutFlags;
  self->_layoutFlags = 0;
  v113 = self->_layoutViewState;
  if (!v113)
    goto LABEL_100;
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewState feedScrollAnchor](v113, "feedScrollAnchor"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "anchor"));
  v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "identifier"));

  if (!v116
    || (v117 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedContent entries](self->_content, "entries")),
        v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "valueForKey:", CFSTR("uuid"))),
        v119 = (char *)objc_msgSend(v118, "indexOfObject:", v116),
        v118,
        v117,
        v119 == (char *)0x7FFFFFFFFFFFFFFFLL)
    || (unint64_t)v119 >= self->_layoutNextSection)
  {
    v130 = 1;
    goto LABEL_97;
  }
  ((void (*)(_QWORD *, char *))v350[2])(v350, v119);
  v120 = self->_sections;
  v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v119));
  v353 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v120, "objectForKeyedSubscript:", v121));

  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v353, "renderModel"));
  objc_msgSend(v122, "size");
  v124 = v123;

  -[TUIEnvironment viewSize](self->_environment, "viewSize");
  v126 = v125;
  v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "anchor"));
  v128 = (char *)objc_msgSend(v127, "position");

  if (v128 == (_BYTE *)&dword_0 + 1)
  {
    v129 = v126 - v124;
  }
  else
  {
    v129 = 0.0;
    if (v128 == (_BYTE *)&dword_0 + 2)
      v129 = (v126 - v124) * 0.5;
  }
  objc_msgSend(v114, "relativeDistance");
  v205 = v204;
  v206 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v357, "options"));
  v207 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v206, "timingProvider"));

  v208 = v129 + v126 * 0.5 * v205;
  if (v207)
    v209 = v126 - (v124 + v208) + v126 * 0.5;
  else
    v209 = v126 - (v124 + v208);
  if (v119)
  {
    if (v207)
      v210 = v208 + v126 * 0.5;
    else
      v210 = v208;
    v211 = v119;
    do
    {
      v213 = v63 != 0x7FFFFFFFFFFFFFFFLL && v63 <= (unint64_t)v211 || v210 > 0.0;
      if (!v213)
        break;
      ((void (*)(_QWORD *, char *))v350[2])(v350, --v211);
      v214 = self->_sections;
      v215 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v211));
      v216 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v214, "objectForKeyedSubscript:", v215));
      v217 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v216, "renderModel"));
      objc_msgSend(v217, "size");
      v219 = v218;

      v210 = v210 - v219;
    }
    while (v211);
    v220 = !v213;
  }
  else
  {
    v220 = 0;
  }
  v221 = (unint64_t)(v119 + 1);
  if (v221 < self->_layoutNextSection)
  {
    do
    {
      v222 = obj != 0x7FFFFFFFFFFFFFFFLL && obj >= v221;
      v223 = v222 || v209 > 0.0;
      if (!v223)
        break;
      ((void (*)(_QWORD *, unint64_t))v350[2])(v350, v221);
      v224 = self->_sections;
      v225 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v221));
      v226 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v224, "objectForKeyedSubscript:", v225));
      v227 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v226, "renderModel"));
      objc_msgSend(v227, "size");
      v229 = v228;

      v209 = v209 - v229;
      ++v221;
    }
    while (v221 < self->_layoutNextSection);
    if ((v220 & 1) != 0)
      goto LABEL_187;
    v220 = !v223;
  }
  if (v220)
  {
LABEL_187:
    if (self->_inLiveResize)
    {
      self->_needsLayoutAfterLiveResize = 1;
    }
    else
    {
      v390[0] = _NSConcreteStackBlock;
      v390[1] = 3221225472;
      v390[2] = sub_B9E94;
      v390[3] = &unk_23D938;
      v390[4] = self;
      objc_msgSend(v357, "addCompletion:", v390);
    }
  }

  v130 = 0;
LABEL_97:
  if (!self->_needsLayoutAfterLiveResize)
  {
    v131 = self->_layoutViewState;
    self->_layoutViewState = 0;

  }
  layoutFlags |= 1uLL;
  if (!v130)
  {
    v354 = 0;
    v340 = 0;
    goto LABEL_116;
  }
LABEL_100:
  if (self->_layoutNumberOfSections)
  {
    v132 = 0;
    v133 = 0.0;
    v134 = self;
    while (1)
    {
      v135 = v134->_sections;
      v136 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v132));
      v137 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v135, "objectForKeyedSubscript:", v136));

      v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "renderModel"));
      LOBYTE(v136) = v138 == 0;

      if ((v136 & 1) != 0)
      {
        v146 = 0;
        goto LABEL_114;
      }
      if (!self->_layoutUntilEntryWithUUID && (*(_BYTE *)&self->_flags & 1) != 0)
      {
        -[TUIEnvironment viewSize](self->_environment, "viewSize");
        if (v133 > v139
          || v132 > -[TUIFeedContent initialContentReadyEntryIndex](self->_content, "initialContentReadyEntryIndex"))
        {
          break;
        }
      }
      ((void (*)(_QWORD *, unint64_t))v350[2])(v350, v132);
      v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "renderModel"));
      objc_msgSend(v140, "size");
      v142 = v141;

      v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "entry"));
      v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "stackNames"));
      v145 = objc_msgSend(v144, "containsObject:", v363);

      if (!v145)
        v142 = 0.0;

      v133 = v133 + v142;
      ++v132;
      v134 = self;
      if (v132 >= self->_layoutNumberOfSections)
        goto LABEL_110;
    }
    v146 = 1;
LABEL_114:

  }
  else
  {
LABEL_110:
    v146 = 0;
  }
  v340 = v146 != 0;
  v354 = 1;
LABEL_116:
  if (*((_BYTE *)v397 + 24))
  {
    v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v357, "date"));
    -[TUIStatsDatesCollector setDynamicUpdateDate:](self->_datesCollector, "setDynamicUpdateDate:", v147);

  }
  if (v401[5])
  {
    v148 = objc_opt_new(NSMutableArray);
    v388 = 0u;
    v389 = 0u;
    v386 = 0u;
    v387 = 0u;
    obja = (id)v408[5];
    v149 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v386, v416, 16);
    if (v149)
    {
      v150 = *(_QWORD *)v387;
      v151 = 0.0;
      do
      {
        for (i = 0; i != v149; i = (char *)i + 1)
        {
          if (*(_QWORD *)v387 != v150)
            objc_enumerationMutation(obja);
          v153 = *(void **)(*((_QWORD *)&v386 + 1) + 8 * (_QWORD)i);
          v154 = objc_msgSend(v153, "section");
          v155 = self->_sections;
          v156 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v154));
          v157 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v155, "objectForKeyedSubscript:", v156));

          if (objc_msgSend((id)v401[5], "containsIndex:", v154))
          {
            v158 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v157, "renderModel"));

          }
          else
          {
            v158 = v153;
          }
          objc_msgSend(v158, "size");
          v160 = v159;
          v162 = v161;
          v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v157, "entry"));
          v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v163, "stackNames"));
          v165 = objc_msgSend(v164, "containsObject:", v363);

          if (!v165)
            v162 = 0.0;
          v166 = objc_msgSend(v158, "section");
          v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "UUID"));
          v168 = objc_msgSend(v158, "copyWithSection:offset:size:uuid:", v166, v167, 0.0, v151, v160, v162);

          objc_msgSend(v168, "frame");
          Height = CGRectGetHeight(v427);
          -[NSMutableArray addObject:](v148, "addObject:", v168);

          v151 = v151 + Height;
        }
        v149 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v386, v416, 16);
      }
      while (v149);
    }
    else
    {
      v151 = 0.0;
    }

    *(double *)(*((_QWORD *)&v417 + 1) + 40) = v151;
    v170 = -[NSMutableArray copy](v148, "copy");
    v171 = (void *)v408[5];
    v408[5] = (uint64_t)v170;

  }
  if (!v354)
    goto LABEL_153;
  v172 = self->_layoutNextSection;
  if (!self->_layoutUntilEntryWithUUID || !v172)
  {
LABEL_140:
    if (v172 < self->_layoutNumberOfSections)
    {
      v180 = 0;
      v181 = self;
      while (1)
      {
        v182 = v181->_sections;
        v183 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
        v179 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v182, "objectForKeyedSubscript:", v183));

        v352 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID renderModel](v179, "renderModel"));
        if (!v352)
        {
          v352 = 0;
          goto LABEL_190;
        }
        v184 = self;
        if (!self->_layoutUntilEntryWithUUID && (*(_BYTE *)&self->_flags & 1) != 0)
        {
          v185 = *(double *)(*((_QWORD *)&v417 + 1) + 40);
          -[TUIEnvironment viewSize](self->_environment, "viewSize");
          if (v185 > v186)
            break;
          v187 = self->_layoutNextSection;
          v188 = -[TUIFeedContent initialContentReadyEntryIndex](self->_content, "initialContentReadyEntryIndex");
          v184 = self;
          if (v187 > v188)
            break;
        }
        ++v184->_layoutNextSection;
        objc_msgSend(v352, "size");
        v190 = v189;
        v192 = v191;
        v193 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID entry](v179, "entry"));
        v194 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v193, "stackNames"));
        v195 = objc_msgSend(v194, "containsObject:", v363);

        if (!v195)
          v192 = 0.0;
        v196 = objc_msgSend(v352, "section");
        v197 = *(double *)(*((_QWORD *)&v417 + 1) + 40);
        v198 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v352, "UUID"));
        v180 = objc_msgSend(v352, "copyWithSection:offset:size:uuid:", v196, v198, 0.0, v197, v190, v192);

        objc_msgSend(v180, "frame");
        *(CGFloat *)(*((_QWORD *)&v417 + 1) + 40) = CGRectGetHeight(v428) + *(double *)(*((_QWORD *)&v417 + 1) + 40);
        v199 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v408[5], "arrayByAddingObject:", v180));
        v200 = (void *)v408[5];
        v408[5] = v199;

        if (self->_layoutUntilEntryWithUUID)
        {
          v201 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v180, "UUID"));
          v202 = objc_msgSend(v201, "isEqual:", self->_layoutUntilEntryWithUUID);

          if (v202)
          {
            layoutUntilEntryWithUUID = self->_layoutUntilEntryWithUUID;
            self->_layoutUntilEntryWithUUID = 0;

            v341 = 1;
            v348 = 1;
            v352 = v180;
            goto LABEL_190;
          }
        }

        v181 = self;
        v348 = 1;
        if (self->_layoutNextSection >= self->_layoutNumberOfSections)
        {
          v352 = v180;
          goto LABEL_191;
        }
      }
      v340 = 1;
      goto LABEL_190;
    }
LABEL_153:
    v352 = 0;
    goto LABEL_191;
  }
  v173 = self->_sections;
  v174 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v172 - 1));
  v175 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v173, "objectForKeyedSubscript:", v174));
  v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v175, "renderModel"));
  v177 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176, "UUID"));
  v178 = objc_msgSend(v177, "isEqual:", self->_layoutUntilEntryWithUUID);

  if ((v178 & 1) == 0)
  {
    v172 = self->_layoutNextSection;
    goto LABEL_140;
  }
  v352 = 0;
  v179 = self->_layoutUntilEntryWithUUID;
  self->_layoutUntilEntryWithUUID = 0;
  v341 = 1;
LABEL_190:

LABEL_191:
  v351 = objc_alloc_init((Class)NSMutableArray);
  v349 = objc_alloc_init((Class)NSMutableArray);
  v230 = -[TUIAnchorSet initWithAxis:]([TUIMutableAnchorSet alloc], "initWithAxis:", 2);
  v355 = objc_opt_new(NSMutableArray);
  objb = objc_alloc_init(TUILayoutRenderModelCollector);
  v231 = self;
  if (self->_layoutNextSection)
  {
    v232 = 0;
    do
    {
      v233 = v231->_sections;
      v234 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v232));
      v235 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v233, "objectForKeyedSubscript:", v234));

      v236 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v235, "renderModel"));
      v237 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v236, "UUID"));

      objc_msgSend(v235, "lq_appendAnchorsToSet:", v230);
      v238 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v235, "renderModel"));
      objc_msgSend(v238, "size");
      v240 = v239;

      if (!v232)
      {
        v241 = -[TUILogicalScrollAnchor initWithPosition:identifier:]([TUILogicalScrollAnchor alloc], "initWithPosition:identifier:", 0, v237);
        -[TUIMutableAnchorSet appendLogicalScrollAnchor:withOffset:](v230, "appendLogicalScrollAnchor:withOffset:", v241, 0.0);

      }
      v242 = -[TUILogicalScrollAnchor initWithPosition:identifier:]([TUILogicalScrollAnchor alloc], "initWithPosition:identifier:", 2, v237);
      -[TUIMutableAnchorSet appendLogicalScrollAnchor:withOffset:](v230, "appendLogicalScrollAnchor:withOffset:", v242, v240 * 0.5);

      if (++v232 == self->_layoutNextSection)
      {
        v243 = -[TUILogicalScrollAnchor initWithPosition:identifier:]([TUILogicalScrollAnchor alloc], "initWithPosition:identifier:", 1, v237);
        -[TUIMutableAnchorSet appendLogicalScrollAnchor:withOffset:](v230, "appendLogicalScrollAnchor:withOffset:", v243, v240);

      }
      -[TUIMutableAnchorSet translationOffset](v230, "translationOffset");
      -[TUIMutableAnchorSet setTranslationOffset:](v230, "setTranslationOffset:", v240 + v244);
      objc_msgSend(v235, "lq_updateAuxiliaryLayoutWithTransactionGroup:", v357);
      v245 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v235, "auxRenderModel"));

      if (v245)
      {
        v246 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v235, "auxRenderModel"));
        objc_msgSend(v351, "addObject:", v246);

      }
      v247 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v235, "layoutController"));
      v248 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v247, "rootLayout"));
      v249 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v235, "renderModel"));
      objc_msgSend(v249, "offset");
      objc_msgSend(v248, "appendVisibleBoundsObservers:axis:offset:", v355, 2, v250);

      v251 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v235, "layoutController"));
      v252 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v251, "rootLayout"));
      v253 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v235, "entry"));
      v254 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v253, "uuid"));
      -[TUILayoutRenderModelCollector collectWithRoot:options:entryUUID:](objb, "collectWithRoot:options:entryUUID:", v252, 1, v254);

      v231 = self;
    }
    while (v232 < self->_layoutNextSection);
  }
  v255 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutRenderModelCollector hostingCollectorFinalizeMap](objb, "hostingCollectorFinalizeMap"));
  v256 = objc_msgSend(v255, "isEqualToMap:", v231->_currentHostingMap);
  v257 = v255;
  p_currentHostingMap = (id *)&v231->_currentHostingMap;
  if (v256)
  {
    v259 = v257;
    v260 = *p_currentHostingMap;

    v257 = v260;
  }
  v338 = v257;
  objc_storeStrong(p_currentHostingMap, v257);
  v344 = -[TUIRenderModelAuxiliary initWithModels:]([TUIRenderModelAuxiliary alloc], "initWithModels:", v351);
  p_currentAuxiliaryModel = &self->_currentAuxiliaryModel;
  if (!self->_currentAuxiliaryModel
    || objc_msgSend(v351, "count")
    && !-[TUIRenderModelAuxiliary isEqualToRenderModel:](v344, "isEqualToRenderModel:", *p_currentAuxiliaryModel))
  {
    objc_storeStrong((id *)p_currentAuxiliaryModel, v344);
  }
  if (self->_renderModelMode == 1)
  {
    if (self->_layoutNumberOfSections)
    {
      v263 = 0;
      v342 = 0;
      v264 = 0.0;
      *(_QWORD *)&v262 = 134218240;
      v337 = v262;
      v265 = self;
      while (1)
      {
        v266 = v265->_sections;
        v267 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v263, v337, v338, v339));
        v268 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v266, "objectForKeyedSubscript:", v267));

        v269 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v268, "layerRenderModel"));
        v270 = v269 == 0;

        if (v270)
          break;
        objc_msgSend(v268, "lq_updateLayerLayoutWithTransactionGroup:", v357);
        v271 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v268, "layerRenderModel"));
        v272 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v271, "identifier"));
        v273 = v272 == 0;

        if (v273)
        {
          v274 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v268, "layerRenderModel"));
          objc_msgSend(v274, "setIdentifier:", &off_253B68);

          v275 = TUILayoutLog();
          v276 = objc_claimAutoreleasedReturnValue(v275);
          if (os_log_type_enabled(v276, OS_LOG_TYPE_ERROR))
          {
            v286 = self->_feedId.uniqueIdentifier;
            *(_DWORD *)v413 = v337;
            *(_QWORD *)&v413[4] = v286;
            v414 = 2048;
            v415 = v263;
            _os_log_error_impl(&dword_0, v276, OS_LOG_TYPE_ERROR, "[fid:%lu] invalid layout for render model in section: %lu during layout for feed capture!! Check <template> for multiple root elements!!", v413, 0x16u);
          }

          v342 = 1;
        }
        v277 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v268, "layerRenderModel"));
        v278 = -[TUIRenderModelTransform initWithSubmodel:]([TUIRenderModelTransform alloc], "initWithSubmodel:", v277);
        objc_msgSend(v277, "size");
        v280 = v279;
        objc_msgSend(v277, "size");
        v282 = v281;
        v429.origin.x = 0.0;
        v429.origin.y = v264;
        v429.size.width = v280;
        v429.size.height = v282;
        MidX = CGRectGetMidX(v429);
        v430.origin.x = 0.0;
        v430.origin.y = v264;
        v430.size.width = v280;
        v430.size.height = v282;
        -[TUIRenderModelTransform setCenter:](v278, "setCenter:", MidX, CGRectGetMidY(v430));
        objc_msgSend(v277, "size");
        v285 = v284;
        objc_msgSend(v349, "addObject:", v278);

        v264 = v264 + v285;
        ++v263;
        v265 = self;
        if (v263 >= self->_layoutNumberOfSections)
          goto LABEL_219;
      }

    }
    else
    {
      v342 = 0;
    }
LABEL_219:
    v288 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v349, "lastObject"));
    -[TUIEnvironment viewSize](self->_environment, "viewSize");
    v290 = v289;
    if (v288)
    {
      objc_msgSend(v288, "frame");
      v291 = CGRectGetMaxY(v431);
    }
    else
    {
      v291 = 0.0;
    }
    v292 = -[TUIContainerLayerConfig initWithSize:]([TUIContainerLayerConfig alloc], "initWithSize:", v290, v291);
    v293 = -[TUIRenderModelLayer initWithSubmodels:config:erasableInsets:]([TUIRenderModelLayer alloc], "initWithSubmodels:config:erasableInsets:", v349, v292, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    -[TUIRenderModelLayer setSize:](v293, "setSize:", v290, v291);
    p_currentLayerRenderModel = &self->_currentLayerRenderModel;
    if (!self->_currentLayerRenderModel
      || objc_msgSend(v349, "count")
      && !-[TUIRenderModelLayer isEqualToRenderModel:](v293, "isEqualToRenderModel:", *p_currentLayerRenderModel))
    {
      objc_storeStrong((id *)p_currentLayerRenderModel, v293);
    }

    v287 = v342 & 1;
  }
  else
  {
    v287 = 0;
  }
  -[TUIEnvironment contentsScale](self->_environment, "contentsScale");
  -[TUIMutableAnchorSet finalizeWithContentsScale:](v230, "finalizeWithContentsScale:");
  v295 = (TUIAnchorSet *)-[TUIMutableAnchorSet copy](v230, "copy");
  anchorSet = self->_anchorSet;
  self->_anchorSet = v295;

  v297 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v357, "categories"));
  v298 = objc_msgSend(v297, "containsObject:", CFSTR("content-load"));

  v299 = self->_restoreViewState;
  restoreViewState = self->_restoreViewState;
  self->_restoreViewState = 0;

  kdebug_trace(725408464, 1, 0, 0, 0);
  v301 = TUILayoutLog();
  v302 = objc_claimAutoreleasedReturnValue(v301);
  if (os_log_type_enabled(v302, OS_LOG_TYPE_INFO))
  {
    v303 = self->_feedId.uniqueIdentifier;
    *(_DWORD *)v413 = 134218242;
    *(_QWORD *)&v413[4] = v303;
    v414 = 2112;
    v415 = (unint64_t)v357;
    _os_log_impl(&dword_0, v302, OS_LOG_TYPE_INFO, "[fid:%lu] Ariadne FeedLayoutEnd group=%@", v413, 0x16u);
  }

  v304 = TUIInstantiationLog();
  v305 = objc_claimAutoreleasedReturnValue(v304);
  v306 = v305;
  v307 = self->_frameSignpost;
  if (v307 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v305))
  {
    v308 = self->_feedId.uniqueIdentifier;
    *(_DWORD *)v413 = 134217984;
    *(_QWORD *)&v413[4] = v308;
    _os_signpost_emit_with_name_impl(&dword_0, v306, OS_SIGNPOST_INTERVAL_END, v307, "Layout", "[fid:%lu] ", v413, 0xCu);
  }

  v309 = TUIInstantiationLog();
  v310 = objc_claimAutoreleasedReturnValue(v309);
  v311 = v310;
  v312 = self->_frameSignpost;
  if (v312 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v310))
  {
    v313 = self->_feedId.uniqueIdentifier;
    *(_DWORD *)v413 = 134217984;
    *(_QWORD *)&v413[4] = v313;
    _os_signpost_emit_with_name_impl(&dword_0, v311, OS_SIGNPOST_INTERVAL_BEGIN, v312, "UpdateRenderModels", "[fid:%lu] ", v413, 0xCu);
  }

  v371[0] = _NSConcreteStackBlock;
  v371[1] = 3221225472;
  v371[2] = sub_B9E9C;
  v371[3] = &unk_240B48;
  v382 = v298;
  v371[4] = self;
  v377 = buf;
  v378 = &v407;
  v379 = &v417;
  v356 = v355;
  v372 = v356;
  v343 = v230;
  v373 = v343;
  v383 = v341;
  v314 = v357;
  v374 = v314;
  v315 = v299;
  v384 = v287;
  v385 = v348;
  v375 = v315;
  v380 = &v400;
  v381 = layoutFlags;
  v358 = v339;
  v376 = v358;
  objc_msgSend(v314, "computeFinalUpdatesWithBlock:", v371);
  -[TUIStatsTimingCollector endPhase:](self->_timingCollector, "endPhase:", 0);
  v316 = TUIInstantiationLog();
  v317 = objc_claimAutoreleasedReturnValue(v316);
  v318 = v317;
  v319 = self->_frameSignpost;
  if (v319 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v317))
  {
    v320 = self->_feedId.uniqueIdentifier;
    *(_DWORD *)v413 = 134217984;
    *(_QWORD *)&v413[4] = v320;
    _os_signpost_emit_with_name_impl(&dword_0, v318, OS_SIGNPOST_INTERVAL_END, v319, "UpdateRenderModels", "[fid:%lu] ", v413, 0xCu);
  }

  if (self->_statsLiveResize)
  {
    v321 = self->_sections;
    v370[0] = _NSConcreteStackBlock;
    v370[1] = 3221225472;
    v370[2] = sub_BA7D8;
    v370[3] = &unk_240B70;
    v370[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v321, "enumerateKeysAndObjectsUsingBlock:", v370);
    -[TUIStatsLiveResize endFrame](self->_statsLiveResize, "endFrame");
  }
  if (self->_statsCollector)
  {
    *(_QWORD *)v413 = 0;
    mach_timebase_info((mach_timebase_info_t)v413);
    v322 = objc_opt_new(NSMutableArray);
    v323 = self->_sections;
    v367[0] = _NSConcreteStackBlock;
    v367[1] = 3221225472;
    v367[2] = sub_BA850;
    v367[3] = &unk_240B98;
    v369 = *(_QWORD *)v413;
    v367[4] = self;
    v324 = v322;
    v368 = v324;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v323, "enumerateKeysAndObjectsUsingBlock:", v367);
    v325 = objc_opt_new(NSMutableArray);
    v326 = self;
    if (self->_layoutNextSection)
    {
      v327 = 0;
      do
      {
        v328 = v326->_sections;
        v329 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v327));
        v330 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v328, "objectForKeyedSubscript:", v329));
        v331 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v330, "entry"));
        v332 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v331, "uid"));
        -[NSMutableArray addObject:](v325, "addObject:", v332);

        ++v327;
        v326 = self;
      }
      while (v327 < self->_layoutNextSection);
    }
    -[TUIStatsTimingCollector finalizeWithTimebase:](v326->_timingCollector, "finalizeWithTimebase:", *(_QWORD *)v413);
    v333 = -[TUIStatsFeedPass initWithMode:timingCollector:passes:]([TUIStatsFeedPass alloc], "initWithMode:timingCollector:passes:", self->_lq_statsMode, self->_timingCollector, v324);
    -[TUIStatsCollector updateWithPass:currentEntriesUID:](self->_statsCollector, "updateWithPass:currentEntriesUID:", v333, v325);

  }
  v334 = self;
  -[TUIStatsTimingCollector reset](self->_timingCollector, "reset");
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_sections, "enumerateKeysAndObjectsUsingBlock:", &stru_240BB8);
  if ((self->_lq_statsMode & 0x10) != 0 && (*(_BYTE *)&self->_delegateFlags & 1) != 0)
  {
    v335 = -[TUIStatsFeed initWithDates:collector:]([TUIStatsFeed alloc], "initWithDates:collector:", self->_datesCollector, self->_statsCollector);
    v365[0] = _NSConcreteStackBlock;
    v365[1] = 3221225472;
    v365[2] = sub_BAA30;
    v365[3] = &unk_240BE0;
    v365[4] = self;
    v336 = v335;
    v366 = v336;
    objc_msgSend(v314, "appendUpdateBlock:", v365);

    v334 = self;
  }
  v334->_environmentChanged = 0;
  objc_storeStrong((id *)&v334->_previousStackName, v345);
  if (v340)
  {
    *(_BYTE *)&self->_flags &= ~1u;
    -[TUIFeedLayoutController layoutIfNeededWithTransaction:](self, "layoutIfNeededWithTransaction:", 0);
  }

  _Block_object_dispose(&v396, 8);
  _Block_object_dispose(&v400, 8);

  _Block_object_dispose(&v417, 8);
  _Block_object_dispose(&v407, 8);

  _Block_object_dispose(buf, 8);
}

- (void)_lq_scheduleLayoutRemainder
{
  id v3;
  TUITransactionCoordinating *transactionCoordinator;
  _QWORD v5[5];

  v3 = +[TUITransaction noAnimationTransaction](TUITransaction, "noAnimationTransaction");
  transactionCoordinator = self->_transactionCoordinator;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_BAAE8;
  v5[3] = &unk_23E688;
  v5[4] = self;
  -[TUITransactionCoordinating scheduleLayoutUpdateWithTransaction:block:](transactionCoordinator, "scheduleLayoutUpdateWithTransaction:block:", v3, v5);

}

- (BOOL)_lq_shouldInstantiateEntry:(id)a3 sectionIndex:(unint64_t)a4 transactionGroup:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSMutableArray *v11;
  id v12;
  id v13;
  NSMutableArray *v14;
  uint64_t v15;
  char v16;
  void *i;
  id v18;
  NSMutableArray *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  NSMutableArray *v24;
  NSMutableArray *v25;
  os_unfair_lock_t lock;
  void *v28;
  _QWORD v29[4];
  NSMutableArray *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];

  v8 = a3;
  v9 = a5;
  os_unfair_lock_lock(&self->_layoutConditionsLock);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_layoutConditionsSuspendingLayout, "allObjects"));
  os_unfair_lock_unlock(&self->_layoutConditionsLock);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v11 = v10;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v12)
  {
    v13 = v12;
    lock = &self->_layoutConditionsLock;
    v28 = v9;
    v14 = 0;
    v15 = *(_QWORD *)v36;
    v16 = 1;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v15)
          objc_enumerationMutation(v11);
        v18 = *(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v18, "evaluateWithEntry:index:", v8, a4))
        {
          if (!v14)
            v14 = objc_opt_new(NSMutableArray);
          -[NSMutableArray addObject:](v14, "addObject:", v18);
        }
        else
        {
          v16 = 0;
        }

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v13);

    if (!v14)
    {
      v24 = 0;
      v9 = v28;
      goto LABEL_25;
    }
    os_unfair_lock_lock(lock);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v19 = v14;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(_QWORD *)v32 != v22)
            objc_enumerationMutation(v19);
          -[NSHashTable removeObject:](self->_layoutConditionsSuspendingLayout, "removeObject:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)j));
        }
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v21);
    }

    os_unfair_lock_unlock(lock);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_BADA8;
    v29[3] = &unk_23D938;
    v24 = v19;
    v30 = v24;
    v9 = v28;
    objc_msgSend(v28, "addCompletion:", v29);
    v25 = v30;
  }
  else
  {
    v24 = 0;
    v16 = 1;
    v25 = v11;
  }

LABEL_25:
  return v16 & 1;
}

- (BOOL)_lq_shouldSubmitRenderModelUpdate:(BOOL)a3 transactionGroup:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  unint64_t renderModelMode;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSMutableArray *v15;
  uint64_t v16;
  char v17;
  void *i;
  id v19;
  NSMutableArray *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  id v25;
  NSMutableArray *v26;
  char v27;
  id v28;
  NSObject *v29;
  unint64_t uniqueIdentifier;
  const __CFString *v31;
  unsigned int v33;
  void *v34;
  os_unfair_lock_t lock;
  _QWORD v36[4];
  NSMutableArray *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  unint64_t v47;
  __int16 v48;
  const __CFString *v49;
  __int16 v50;
  id v51;
  _BYTE v52[128];
  _BYTE v53[128];

  v6 = a4;
  os_unfair_lock_lock(&self->_layoutConditionsLock);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_layoutConditionsSuspendingUpdates, "allObjects"));
  lock = &self->_layoutConditionsLock;
  os_unfair_lock_unlock(&self->_layoutConditionsLock);
  if (a3)
    v8 = 1;
  else
    v8 = objc_msgSend(v6, "flags") & 1;
  renderModelMode = self->_renderModelMode;
  if (!renderModelMode)
  {
    v10 = 256;
    goto LABEL_8;
  }
  if (renderModelMode == 1)
  {
    v10 = 280;
LABEL_8:
    v11 = *(id *)((char *)&self->super.isa + v10);
    goto LABEL_10;
  }
  v11 = 0;
LABEL_10:
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (!v13)
  {

    v25 = v12;
    v15 = 0;
    v27 = 1;
    goto LABEL_41;
  }
  v14 = v13;
  v33 = v8;
  v34 = v6;
  v15 = 0;
  v16 = *(_QWORD *)v43;
  v17 = 1;
  do
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(_QWORD *)v43 != v16)
        objc_enumerationMutation(v12);
      v19 = *(id *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
      if (objc_msgSend(v19, "evaluateWithRenderModel:", v11))
      {
        if (!v15)
          v15 = objc_opt_new(NSMutableArray);
        -[NSMutableArray addObject:](v15, "addObject:", v19);
      }
      else
      {
        v17 = 0;
      }

    }
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  }
  while (v14);

  if (v15)
  {
    os_unfair_lock_lock(lock);
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v20 = v15;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    v8 = v33;
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(_QWORD *)v39 != v23)
            objc_enumerationMutation(v20);
          -[NSHashTable removeObject:](self->_layoutConditionsSuspendingUpdates, "removeObject:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)j));
        }
        v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
      }
      while (v22);
    }

    v25 = (id)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_layoutConditionsSuspendingUpdates, "allObjects"));
    os_unfair_lock_unlock(lock);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_BB244;
    v36[3] = &unk_23D938;
    v26 = v20;
    v37 = v26;
    v6 = v34;
    objc_msgSend(v34, "addCompletion:", v36);

    if ((v17 & 1) != 0)
    {
      v27 = 1;
      v15 = v26;
      goto LABEL_41;
    }
  }
  else
  {
    v25 = v12;
    v8 = v33;
    if ((v17 & 1) != 0)
    {
      v15 = 0;
      v27 = 1;
      v6 = v34;
      goto LABEL_41;
    }
    v6 = v34;
  }
  v28 = TUITransactionLog();
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    uniqueIdentifier = self->_feedId.uniqueIdentifier;
    v31 = CFSTR("NO");
    *(_DWORD *)buf = 134218498;
    if (v8)
      v31 = CFSTR("YES");
    v47 = uniqueIdentifier;
    v48 = 2112;
    v49 = v31;
    v50 = 2112;
    v51 = v25;
    _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "[fid:%lu] layout conditions not meet; forcing=%@; remaining conditions: %@",
      buf,
      0x20u);
  }

  v27 = 0;
LABEL_41:

  return v8 | v27;
}

- (void)setPriority:(float)a3
{
  float v4;
  id v5;
  NSObject *v6;
  unint64_t uniqueIdentifier;
  double priority;
  double v9;
  NSObject *dataRequestsSync;
  _QWORD v11[5];
  float v12;
  uint8_t buf[4];
  unint64_t v14;
  __int16 v15;
  double v16;
  __int16 v17;
  double v18;

  v4 = TUIPriorityClamp(a3);
  if (self->_priority != v4)
  {
    v5 = TUILayoutLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uniqueIdentifier = self->_feedId.uniqueIdentifier;
      priority = self->_priority;
      *(_DWORD *)buf = 134218496;
      v14 = uniqueIdentifier;
      v15 = 2048;
      v16 = priority;
      v17 = 2048;
      v18 = v4;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "[fid:%lu] changing priority %f -> %f", buf, 0x20u);
    }

    *(float *)&v9 = v4;
    -[TUIWorkQueueContext setPriority:](self->_queueContext, "setPriority:", v9);
    self->_priority = v4;
    dataRequestsSync = self->_dataRequestsSync;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_BB45C;
    v11[3] = &unk_240C28;
    v11[4] = self;
    v12 = v4;
    dispatch_sync(dataRequestsSync, v11);
  }
}

- (void)setStatsMode:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  unint64_t uniqueIdentifier;
  unint64_t statsMode;
  NSObject *v9;
  _QWORD v10[6];
  uint8_t buf[4];
  unint64_t v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  unint64_t v16;

  if (self->_statsMode != a3)
  {
    v5 = TUILayoutLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uniqueIdentifier = self->_feedId.uniqueIdentifier;
      statsMode = self->_statsMode;
      *(_DWORD *)buf = 134218496;
      v12 = uniqueIdentifier;
      v13 = 2048;
      v14 = statsMode;
      v15 = 2048;
      v16 = a3;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "[fid:%lu] changing stats mode %04lx -> %04lx", buf, 0x20u);
    }

    self->_statsMode = a3;
    v9 = objc_claimAutoreleasedReturnValue(-[TUIWorkQueueContext activeQueue](self->_queueContext, "activeQueue"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_BB5EC;
    v10[3] = &unk_23D9D8;
    v10[4] = self;
    v10[5] = a3;
    dispatch_async(v9, v10);

  }
}

- (void)setLayoutState:(unint64_t)a3
{
  char delegateFlags;
  id WeakRetained;
  id v7;

  if (self->_layoutState != a3)
  {
    delegateFlags = (char)self->_delegateFlags;
    if ((delegateFlags & 2) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "feedLayoutController:willTransitionToLayoutState:", self, a3);

      delegateFlags = (char)self->_delegateFlags;
    }
    self->_layoutState = a3;
    if ((delegateFlags & 4) != 0)
    {
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v7, "feedLayoutController:didTransitionToLayoutState:", self, a3);

    }
  }
}

- (unint64_t)layoutState
{
  return self->_layoutState;
}

- (void)collectStatsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[TUIWorkQueueContext activeQueue](self->_queueContext, "activeQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_BB824;
    v6[3] = &unk_23E580;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

- (void)statRecordInitialResourcesRenderedDate
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = objc_claimAutoreleasedReturnValue(-[TUIWorkQueueContext activeQueue](self->_queueContext, "activeQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_BB91C;
  v6[3] = &unk_23D7D0;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

- (void)statRecordResourcesStartLoadingDate
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = objc_claimAutoreleasedReturnValue(-[TUIWorkQueueContext activeQueue](self->_queueContext, "activeQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_BBA0C;
  v6[3] = &unk_23D7D0;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

- (void)statRecordResourcesLoadedDate
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = objc_claimAutoreleasedReturnValue(-[TUIWorkQueueContext activeQueue](self->_queueContext, "activeQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_BBAFC;
  v6[3] = &unk_23D7D0;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

- (void)statRecordViewWillAppear
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = objc_claimAutoreleasedReturnValue(-[TUIWorkQueueContext activeQueue](self->_queueContext, "activeQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_BBBEC;
  v6[3] = &unk_23D7D0;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

- (void)_cancelDataRequests
{
  NSObject *dataRequestsSync;
  _QWORD block[5];

  dataRequestsSync = self->_dataRequestsSync;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_BBC90;
  block[3] = &unk_23D938;
  block[4] = self;
  dispatch_sync(dataRequestsSync, block);
}

- (void)updateWithContent:(id)a3 layoutUpToEntry:(id)a4 environment:(id)a5 transaction:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  unint64_t uniqueIdentifier;
  id WeakRetained;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  TUITransactionCoordinating *transactionCoordinator;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  unint64_t v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = a4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uuid"));

  if (!v12)
    v12 = (id)objc_claimAutoreleasedReturnValue(+[TUITransaction currentOrImplicitTransaction](TUITransaction, "currentOrImplicitTransaction"));
  -[TUIFeedLayoutController _cancelDataRequests](self, "_cancelDataRequests");
  v16 = TUITransactionLog();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uniqueIdentifier = self->_feedId.uniqueIdentifier;
    WeakRetained = objc_loadWeakRetained((id *)&self->_lastEnvironmentTransactionToken);
    v20 = objc_loadWeakRetained((id *)&self->_lastContentTransactionToken);
    *(_DWORD *)buf = 134218754;
    v36 = uniqueIdentifier;
    v37 = 2112;
    v38 = v12;
    v39 = 2112;
    v40 = WeakRetained;
    v41 = 2112;
    v42 = v20;
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "[fid:%lu] FeedLayoutController: updateWithContent:layoutUpToEntry:environment:transaction: - tx=%@, lastEnvironmentToken=%@, lastContentToken=%@", buf, 0x2Au);

  }
  v21 = objc_loadWeakRetained((id *)&self->_lastEnvironmentTransactionToken);
  objc_msgSend(v12, "dependentOn:", v21);

  v22 = objc_loadWeakRetained((id *)&self->_lastContentTransactionToken);
  objc_msgSend(v12, "dependentOn:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dependencyToken"));
  objc_storeWeak((id *)&self->_lastEnvironmentTransactionToken, v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dependencyToken"));
  objc_storeWeak((id *)&self->_lastContentTransactionToken, v24);

  transactionCoordinator = self->_transactionCoordinator;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_BBF70;
  v30[3] = &unk_240CB0;
  v30[4] = self;
  v31 = v11;
  v32 = v15;
  v33 = v10;
  v34 = v14;
  v26 = v14;
  v27 = v10;
  v28 = v15;
  v29 = v11;
  -[TUITransactionCoordinating scheduleLayoutUpdateWithTransaction:block:](transactionCoordinator, "scheduleLayoutUpdateWithTransaction:block:", v12, v30);

}

- (void)layoutIfNeededWithTransaction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!v4)
    v4 = (id)objc_claimAutoreleasedReturnValue(+[TUITransaction currentOrImplicitTransaction](TUITransaction, "currentOrImplicitTransaction"));
  v5 = v4;
  -[TUITransactionCoordinating scheduleLayoutUpdateWithTransaction:block:](self->_transactionCoordinator, "scheduleLayoutUpdateWithTransaction:block:", v4, &stru_240CD0);

}

- (void)updateWithContent:(id)a3 transaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  unint64_t uniqueIdentifier;
  id WeakRetained;
  id v13;
  id v14;
  void *v15;
  TUITransactionCoordinating *transactionCoordinator;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  unint64_t v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if (!v7)
    v7 = (id)objc_claimAutoreleasedReturnValue(+[TUITransaction currentOrImplicitTransaction](TUITransaction, "currentOrImplicitTransaction"));
  -[TUIFeedLayoutController _cancelDataRequests](self, "_cancelDataRequests");
  v9 = TUITransactionLog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uniqueIdentifier = self->_feedId.uniqueIdentifier;
    WeakRetained = objc_loadWeakRetained((id *)&self->_lastEnvironmentTransactionToken);
    v13 = objc_loadWeakRetained((id *)&self->_lastContentTransactionToken);
    *(_DWORD *)buf = 134218754;
    v23 = uniqueIdentifier;
    v24 = 2112;
    v25 = v7;
    v26 = 2112;
    v27 = WeakRetained;
    v28 = 2112;
    v29 = v13;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "[fid:%lu] FeedLayoutController: updateWithContent: - tx=%@, lastEnvironmentToken=%@, lastContentToken=%@", buf, 0x2Au);

  }
  v14 = objc_loadWeakRetained((id *)&self->_lastContentTransactionToken);
  objc_msgSend(v7, "dependentOn:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dependencyToken"));
  objc_storeWeak((id *)&self->_lastContentTransactionToken, v15);

  transactionCoordinator = self->_transactionCoordinator;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_BC244;
  v19[3] = &unk_240CF8;
  v19[4] = self;
  v20 = v6;
  v21 = v8;
  v17 = v8;
  v18 = v6;
  -[TUITransactionCoordinating scheduleLayoutUpdateWithTransaction:block:](transactionCoordinator, "scheduleLayoutUpdateWithTransaction:block:", v7, v19);

}

- (void)lq_updateContent:(id)a3 contentUpdateDate:(id)a4 transaction:(id)a5 transactionGroup:(id)a6
{
  NSObject *v11;
  id v12;
  NSObject *v13;
  unint64_t uniqueIdentifier;
  NSUUID *layoutUntilEntryWithUUID;
  id v16;
  uint64_t v17;
  char v18;
  void *i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  id v26;
  float priority;
  id v28;
  double v29;
  void *v30;
  NSArray *v31;
  NSArray *dataRequests;
  void *v33;
  unint64_t layoutNumberOfSections;
  unint64_t *p_layoutNextSection;
  id v36;
  id v37;
  id v38;
  id v39;
  id obj;
  NSMutableArray *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  _QWORD *v47;
  __int128 *p_buf;
  id v49;
  id v50[3];
  _QWORD v51[4];
  id from;
  id location;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 buf;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  _BYTE v63[128];

  v37 = a3;
  v39 = a4;
  v38 = a5;
  v36 = a6;
  v11 = objc_claimAutoreleasedReturnValue(-[TUIWorkQueueContext workQueue](self->_queueContext, "workQueue"));
  dispatch_assert_queue_V2(v11);

  v12 = TUILayoutLog();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uniqueIdentifier = self->_feedId.uniqueIdentifier;
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = uniqueIdentifier;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "[fid:%lu] lq_updateContent", (uint8_t *)&buf, 0xCu);
  }

  -[TUIStatsDatesCollector setContentUpdateDate:](self->_datesCollector, "setContentUpdateDate:", v39);
  -[TUIStatsDatesCollector setInitialContentReadyDate:](self->_datesCollector, "setInitialContentReadyDate:", 0);
  -[TUIStatsDatesCollector setDynamicUpdateDate:](self->_datesCollector, "setDynamicUpdateDate:", 0);
  -[TUIStatsDatesCollector setResourcesLoadedDate:](self->_datesCollector, "setResourcesLoadedDate:", 0);
  objc_storeStrong((id *)&self->_content, a3);
  v43 = (void *)(self->_layoutGenerationId + 1);
  self->_layoutGenerationId = (unint64_t)v43;
  p_layoutNextSection = &self->_layoutNextSection;
  *(_OWORD *)&self->_layoutNextSection = xmmword_22F370;
  v41 = objc_opt_new(NSMutableArray);
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "tx"));
  layoutUntilEntryWithUUID = self->_layoutUntilEntryWithUUID;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[TUIFeedContent entries](self->_content, "entries"));
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
  if (v16)
  {
    v17 = 0;
    v18 = layoutUntilEntryWithUUID != 0;
    v42 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v55 != v42)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v59 = 0x3032000000;
        v60 = sub_B9CA8;
        v61 = sub_B9CB8;
        if ((v18 & 1) != 0)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "options"));
          v62 = (id)objc_claimAutoreleasedReturnValue(+[TUITransaction transactionWithOptions:](TUITransaction, "transactionWithOptions:", v21));

        }
        else
        {
          v62 = (id)objc_claimAutoreleasedReturnValue(+[TUITransaction currentOrImplicitTransaction](TUITransaction, "currentOrImplicitTransaction"));
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "tx", p_layoutNextSection));
        objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "addCategory:", CFSTR("content-load"));
        objc_msgSend(v22, "addCompletionDeferral");
        objc_msgSend(v22, "addSubTransactionCompletionDeferral");
        if ((v18 & 1) != 0)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWorkQueueContext activeCallbackQueue](self->_queueContext, "activeCallbackQueue"));
          objc_msgSend(v44, "addSubTransaction:completionQueue:", v22, v23);

          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "uuid"));
          v25 = objc_msgSend(v24, "isEqual:", self->_layoutUntilEntryWithUUID);

          v18 = v25 ^ 1;
        }
        else
        {
          v18 = 0;
        }
        v26 = -[TUIFeedLayoutController lq_createRenderModelForFeedEntry:section:](self, "lq_createRenderModelForFeedEntry:section:", v20, (char *)i + v17);
        objc_initWeak(&location, self);
        objc_initWeak(&from, v20);
        v51[0] = 0;
        v51[1] = v51;
        v51[2] = 0x2020000000;
        v51[3] = -1;
        priority = self->_priority;
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        v45[2] = sub_BC7FC;
        v45[3] = &unk_240D48;
        objc_copyWeak(&v49, &location);
        objc_copyWeak(v50, &from);
        v47 = v51;
        p_buf = &buf;
        v50[1] = (char *)i + v17;
        v50[2] = v43;
        v28 = v22;
        v46 = v28;
        *(float *)&v29 = priority;
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "requestDataWithPriority:block:", v45, v29));
        if (v30)
          -[NSMutableArray addObject:](v41, "addObject:", v30);

        objc_destroyWeak(v50);
        objc_destroyWeak(&v49);
        _Block_object_dispose(v51, 8);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);

        _Block_object_dispose(&buf, 8);
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
      v17 += (uint64_t)i;
    }
    while (v16);
  }

  v31 = (NSArray *)-[NSMutableArray copy](v41, "copy");
  dataRequests = self->_dataRequests;
  self->_dataRequests = v31;

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "entries"));
  self->_layoutNumberOfSections = (unint64_t)objc_msgSend(v33, "count");

  if (!self->_layoutUntilEntryWithUUID)
  {
    layoutNumberOfSections = self->_layoutNumberOfSections;
    if (layoutNumberOfSections != 0x7FFFFFFFFFFFFFFFLL && *p_layoutNextSection < layoutNumberOfSections)
      -[TUIFeedLayoutController setLayoutState:](self, "setLayoutState:", 1);
  }

}

- (void)updateDatesCollectorWithBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[TUIWorkQueueContext workQueue](self->_queueContext, "workQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_BCD44;
  v7[3] = &unk_23E5A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)updateWithEnvironment:(id)a3 state:(id)a4 withTransaction:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  unint64_t uniqueIdentifier;
  id WeakRetained;
  id v18;
  void *v19;
  id v20;
  TUITransactionCoordinating *transactionCoordinator;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint8_t buf[4];
  unint64_t v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  v12 = TUIInstantiationLog();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TUIFeedLayoutController.updateWithEnvironment", (const char *)&unk_23007A, buf, 2u);
  }

  os_unfair_lock_lock(&self->_environmentLock);
  objc_storeStrong((id *)&self->_environmentPendingUpdate, a3);
  os_unfair_lock_unlock(&self->_environmentLock);
  if (!v10)
    v10 = (id)objc_claimAutoreleasedReturnValue(+[TUITransaction currentOrImplicitTransaction](TUITransaction, "currentOrImplicitTransaction"));
  v14 = TUITransactionLog();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uniqueIdentifier = self->_feedId.uniqueIdentifier;
    WeakRetained = objc_loadWeakRetained((id *)&self->_lastEnvironmentTransactionToken);
    *(_DWORD *)buf = 134218498;
    v28 = uniqueIdentifier;
    v29 = 2112;
    v30 = v10;
    v31 = 2112;
    v32 = WeakRetained;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "[fid:%lu] FeedLayoutController: updateWithEnvironment:state:withTransaction: - tx=%@, lastEnvironmentToken=%@", buf, 0x20u);

  }
  v18 = objc_loadWeakRetained((id *)&self->_lastEnvironmentTransactionToken);
  objc_msgSend(v10, "dependentOn:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dependencyToken"));
  objc_storeWeak((id *)&self->_lastEnvironmentTransactionToken, v19);

  v20 = objc_msgSend(v11, "copy");
  transactionCoordinator = self->_transactionCoordinator;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_BCFAC;
  v24[3] = &unk_240CF8;
  v24[4] = self;
  v25 = v9;
  v26 = v20;
  v22 = v20;
  v23 = v9;
  -[TUITransactionCoordinating scheduleLayoutUpdateWithTransaction:block:](transactionCoordinator, "scheduleLayoutUpdateWithTransaction:block:", v10, v24);

}

- (void)updateHostingGeometryMap:(id)a3 withTransaction:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  unint64_t uniqueIdentifier;
  id WeakRetained;
  id v12;
  void *v13;
  TUITransactionCoordinating *transactionCoordinator;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  unint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = TUITransactionLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uniqueIdentifier = self->_feedId.uniqueIdentifier;
    WeakRetained = objc_loadWeakRetained((id *)&self->_lastEnvironmentTransactionToken);
    *(_DWORD *)buf = 134218498;
    v19 = uniqueIdentifier;
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = WeakRetained;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "[fid:%lu] FeedLayoutController: updateHostingGeometryMap:withTransaction - tx=%@, lastEnvironmentTx=%@", buf, 0x20u);

  }
  if (!v7)
    v7 = (id)objc_claimAutoreleasedReturnValue(+[TUITransaction currentOrImplicitTransaction](TUITransaction, "currentOrImplicitTransaction"));
  v12 = objc_loadWeakRetained((id *)&self->_lastEnvironmentTransactionToken);
  objc_msgSend(v7, "dependentOn:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dependencyToken"));
  objc_storeWeak((id *)&self->_lastEnvironmentTransactionToken, v13);

  transactionCoordinator = self->_transactionCoordinator;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_BD208;
  v16[3] = &unk_240D70;
  v16[4] = self;
  v17 = v6;
  v15 = v6;
  -[TUITransactionCoordinating scheduleLayoutUpdateWithTransaction:block:](transactionCoordinator, "scheduleLayoutUpdateWithTransaction:block:", v7, v16);

}

- (BOOL)lq_updateHostingGeometryMap:(id)a3
{
  TUIHostingGeometryMap *v5;
  _TUIHostingGeometryMapUpdate *v6;
  TUIHostingGeometryMap *hostingGeometryMap;
  void *v8;
  void *v9;
  _TUIHostingGeometryMapUpdate *v10;
  char v11;
  unint64_t v12;
  NSMutableDictionary *sections;
  void *v14;
  void *v15;
  BOOL v16;

  v5 = (TUIHostingGeometryMap *)a3;
  if (self->_hostingGeometryMap == v5)
  {
    v16 = 0;
  }
  else
  {
    v6 = [_TUIHostingGeometryMapUpdate alloc];
    hostingGeometryMap = self->_hostingGeometryMap;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIManager viewRegistry](self->_manager, "viewRegistry"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hostedViewFactoryTypesWithGeometryReuse"));
    v10 = -[_TUIHostingGeometryMapUpdate initWithFrom:to:reuseTypes:](v6, "initWithFrom:to:reuseTypes:", hostingGeometryMap, v5, v9);

    objc_storeStrong((id *)&self->_hostingGeometryMap, a3);
    if (self->_layoutNumberOfSections)
    {
      v11 = 0;
      v12 = 0;
      do
      {
        sections = self->_sections;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v12));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sections, "objectForKeyedSubscript:", v14));

        if (objc_msgSend(v15, "lq_updateHostingGeometryMap:", v10))
          v11 = 1;

        ++v12;
      }
      while (v12 < self->_layoutNumberOfSections);
      v16 = v11 & 1;
    }
    else
    {
      v16 = 0;
    }

  }
  return v16;
}

- (void)transactionCoordinator:(id)a3 applyUpdatesFromTransactionGroup:(id)a4
{
  TUIFeedLayoutControllerDelegate **p_delegate;
  id v6;
  id WeakRetained;
  id v8;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v8 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "feedLayoutController:applyUpdatesFromTransactionGroup:", self, v6);
  else
    objc_msgSend(v6, "applyUpdates");

}

- (void)transactionCoordinator:(id)a3 updateWithTransactionGroup:(id)a4
{
  id v5;
  NSObject *v6;
  TUIRenderModelCollection *currentRenderModel;
  TUIHostingMap *currentHostingMap;
  void *v9;
  void *v10;
  TUIFeedCaptureController *captureController;
  TUIFeedCaptureController *v12;
  _QWORD v13[5];
  id v14;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(-[TUIWorkQueueContext workQueue](self->_queueContext, "workQueue"));
  dispatch_assert_queue_V2(v6);

  if (self->_suspended)
  {
    currentRenderModel = self->_currentRenderModel;
    self->_currentRenderModel = 0;

    currentHostingMap = self->_currentHostingMap;
    self->_currentHostingMap = 0;

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_BD4E0;
    v13[3] = &unk_23D7D0;
    v13[4] = self;
    v14 = v5;
    objc_msgSend(v14, "computeFinalUpdatesWithBlock:", v13);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection _currentTraitCollection](UITraitCollection, "_currentTraitCollection"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEnvironment traitCollection](self->_environment, "traitCollection"));
    +[UITraitCollection _setCurrentTraitCollection:](UITraitCollection, "_setCurrentTraitCollection:", v10);

    -[TUIFeedLayoutController lq_updateRenderModelsWithTransactionGroup:](self, "lq_updateRenderModelsWithTransactionGroup:", v5);
    +[UITraitCollection _setCurrentTraitCollection:](UITraitCollection, "_setCurrentTraitCollection:", v9);
    captureController = self->_captureController;
    if (captureController)
    {
      -[TUIFeedCaptureController endCapture](captureController, "endCapture");
      v12 = self->_captureController;
      self->_captureController = 0;

    }
  }

}

- (void)transactionCoordinator:(id)a3 willBeginUpdateWithTransactionGroup:(id)a4
{
  -[TUIStatsTimingCollector startPhase:](self->_timingCollector, "startPhase:", 0, a4);
}

- (void)transactionCoordinator:(id)a3 didEndUpdateWithTransactionGroup:(id)a4
{
  -[TUIStatsTimingCollector endPhase:](self->_timingCollector, "endPhase:", 0, a4);
}

- (void)transactionCoordinator:(id)a3 timeoutForSynchronousTransactionGroup:(id)a4
{
  id v5;
  TUIRenderModelCollection *v6;

  if (!self->_renderModelMode)
  {
    v5 = a4;
    v6 = -[TUIRenderModelCollection initWithContent:sections:size:insets:visibleBoundsObservers:info:anchorSet:layoutDirection:matchingUUID:matchingUID:]([TUIRenderModelCollection alloc], "initWithContent:sections:size:insets:visibleBoundsObservers:info:anchorSet:layoutDirection:matchingUUID:matchingUID:", self->_content, 0, 0, 0, 0, -[TUIEnvironment layoutDirection](self->_environment, "layoutDirection"), CGSizeZero.width, CGSizeZero.height, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, 0, 0);
    -[TUIRenderUpdateCollectionController updateWithHostingMap:transactionGroup:](self->_updateController, "updateWithHostingMap:transactionGroup:", 0, v5);
    -[TUIRenderUpdateCollectionController updateWithRenderModel:viewState:flags:transactionGroup:](self->_updateController, "updateWithRenderModel:viewState:flags:transactionGroup:", v6, 0, 0, v5);

  }
}

- (id)instantiateContext:(id)a3 serviceConformingToProtocol:(id)a4
{
  TUIWPService *v5;

  if (protocol_isEqual((Protocol *)a4, (Protocol *)&OBJC_PROTOCOL___TUIWPService))
    v5 = self->_wpService;
  else
    v5 = 0;
  return v5;
}

- (void)lq_updateAXModelTreeWithTransactionGroup:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSMutableArray *v11;
  unint64_t v12;
  NSMutableDictionary *sections;
  void *v14;
  void *v15;
  void *v16;
  TUIAXModel *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  NSMutableArray *v23;
  NSMutableDictionary *v24;
  void *v25;
  NSMutableDictionary *v26;
  _QWORD v27[4];
  NSMutableArray *v28;
  TUIFeedLayoutController *v29;
  NSMutableDictionary *v30;
  id v31;
  id location;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[TUIWorkQueueContext workQueue](self->_queueContext, "workQueue"));
  dispatch_assert_queue_V2(v5);

  if (-[TUIEnvironment accessibilityElementsNeeded](self->_environment, "accessibilityElementsNeeded"))
  {
    v25 = v4;
    v6 = objc_opt_class(NSString);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedContent currentStackName](self->_content, "currentStackName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value"));
    v9 = TUIDynamicCast(v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    v11 = objc_opt_new(NSMutableArray);
    v26 = objc_opt_new(NSMutableDictionary);
    if (-[NSMutableDictionary count](self->_sections, "count"))
    {
      v12 = 0;
      do
      {
        sections = self->_sections;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v12));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](sections, "objectForKey:", v14));

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "axModelTree"));
        if (v16)
        {
          -[NSMutableArray addObject:](v11, "addObject:", v16);
        }
        else
        {
          v17 = objc_opt_new(TUIAXModel);
          -[NSMutableArray addObject:](v11, "addObject:", v17);

        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "entry"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stackNames"));
        v20 = objc_msgSend(v19, "containsObject:", v10);

        if ((v20 & 1) == 0)
          objc_msgSend(v16, "setHidden:", 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "renderModel"));
        if (v21)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v12));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v21, v22);

        }
        ++v12;
      }
      while (v12 < (unint64_t)-[NSMutableDictionary count](self->_sections, "count"));
    }
    objc_initWeak(&location, self);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_BD934;
    v27[3] = &unk_240D98;
    objc_copyWeak(&v31, &location);
    v23 = v11;
    v28 = v23;
    v29 = self;
    v24 = v26;
    v30 = v24;
    v4 = v25;
    objc_msgSend(v25, "appendUpdateBlock:", v27);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);

  }
}

- (void)suspendAndTeardownWithTransaction:(id)a3
{
  id v4;
  TUITransactionCoordinating *transactionCoordinator;
  _QWORD v6[5];

  v4 = a3;
  if (!v4)
    v4 = (id)objc_claimAutoreleasedReturnValue(+[TUITransaction currentOrImplicitTransaction](TUITransaction, "currentOrImplicitTransaction"));
  transactionCoordinator = self->_transactionCoordinator;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_BDA14;
  v6[3] = &unk_23E688;
  v6[4] = self;
  -[TUITransactionCoordinating scheduleLayoutUpdateWithTransaction:block:](transactionCoordinator, "scheduleLayoutUpdateWithTransaction:block:", v4, v6);

}

- (void)resumeAndRebuildWithEnvironment:(id)a3 state:(id)a4 transaction:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  unint64_t uniqueIdentifier;
  id WeakRetained;
  id v18;
  void *v19;
  TUITransactionCoordinating *transactionCoordinator;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  uint8_t buf[4];
  unint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    v10 = v9;
    v11 = a4;
  }
  else
  {
    v12 = a4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[TUITransaction currentOrImplicitTransaction](TUITransaction, "currentOrImplicitTransaction"));
  }
  v13 = objc_msgSend(a4, "copy");

  v14 = TUITransactionLog();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uniqueIdentifier = self->_feedId.uniqueIdentifier;
    WeakRetained = objc_loadWeakRetained((id *)&self->_lastEnvironmentTransactionToken);
    *(_DWORD *)buf = 134218498;
    v27 = uniqueIdentifier;
    v28 = 2112;
    v29 = v10;
    v30 = 2112;
    v31 = WeakRetained;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "[fid:%lu] FeedLayoutController: resumeAndRebuildWithEnvironment - tx=%@, lastEnvironmentToken=%@", buf, 0x20u);

  }
  v18 = objc_loadWeakRetained((id *)&self->_lastEnvironmentTransactionToken);
  objc_msgSend(v10, "dependentOn:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dependencyToken"));
  objc_storeWeak((id *)&self->_lastEnvironmentTransactionToken, v19);

  transactionCoordinator = self->_transactionCoordinator;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_BDC98;
  v23[3] = &unk_240CF8;
  v23[4] = self;
  v24 = v8;
  v25 = v13;
  v21 = v13;
  v22 = v8;
  -[TUITransactionCoordinating scheduleLayoutUpdateWithTransaction:block:](transactionCoordinator, "scheduleLayoutUpdateWithTransaction:block:", v10, v23);

}

- (void)suspendUpdatesUntilMeetingLayoutCondition:(id)a3
{
  id v4;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = _NSConcreteStackBlock;
    v6 = 3221225472;
    v7 = sub_BDE64;
    v8 = &unk_23DD48;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v4, "onInvalidate:", &v5);
    os_unfair_lock_lock(&self->_layoutConditionsLock);
    -[NSHashTable addObject:](self->_layoutConditionsSuspendingUpdates, "addObject:", v4, v5, v6, v7, v8);
    os_unfair_lock_unlock(&self->_layoutConditionsLock);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

- (void)suspendLayoutsUntilMeetingLayoutCondition:(id)a3
{
  id v4;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = _NSConcreteStackBlock;
    v6 = 3221225472;
    v7 = sub_BDF74;
    v8 = &unk_23DD48;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v4, "onInvalidate:", &v5);
    os_unfair_lock_lock(&self->_layoutConditionsLock);
    -[NSHashTable addObject:](self->_layoutConditionsSuspendingLayout, "addObject:", v4, v5, v6, v7, v8);
    os_unfair_lock_unlock(&self->_layoutConditionsLock);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

- (void)_updateAfterLayoutConditionSuspendingUpdatesInvalidated
{
  id v3;

  v3 = +[TUITransaction implicitTransaction](TUITransaction, "implicitTransaction");
  -[TUITransactionCoordinating scheduleLayoutUpdateWithTransaction:block:](self->_transactionCoordinator, "scheduleLayoutUpdateWithTransaction:block:", v3, &stru_240DB8);

}

- (void)beginLiveResize
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[TUIWorkQueueContext activeQueue](self->_queueContext, "activeQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_BE064;
  block[3] = &unk_23D938;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)endLiveResize
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[TUIWorkQueueContext activeQueue](self->_queueContext, "activeQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_BE228;
  block[3] = &unk_23D938;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)debugDumpEnvironmentContainerStructure
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_sections, "enumerateKeysAndObjectsUsingBlock:", &stru_240DD8);
}

- (void)captureWithController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  TUITransactionCoordinating *transactionCoordinator;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = +[TUITransaction implicitTransaction](TUITransaction, "implicitTransaction");
  transactionCoordinator = self->_transactionCoordinator;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_BE424;
  v12[3] = &unk_240E00;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[TUITransactionCoordinating scheduleLayoutUpdateWithTransaction:block:](transactionCoordinator, "scheduleLayoutUpdateWithTransaction:block:", v8, v12);

}

- (void)dumpModelTreeForEntry:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[TUIWorkQueueContext activeQueue](self->_queueContext, "activeQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_BE604;
  block[3] = &unk_240E50;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)dumpLayoutTreeForEntry:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[TUIWorkQueueContext activeQueue](self->_queueContext, "activeQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_BE89C;
  block[3] = &unk_240E50;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- ($61A80719B04F7407D3E47539F1B23CAA)feedId
{
  return ($61A80719B04F7407D3E47539F1B23CAA)self->_feedId.uniqueIdentifier;
}

- (TUIFeedLayoutControllerDelegate)delegate
{
  return (TUIFeedLayoutControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (TUIFeedContent)content
{
  return self->_content;
}

- (TUIEnvironment)environment
{
  return self->_environment;
}

- (TUITransactionCoordinating)transactionCoordinator
{
  return self->_transactionCoordinator;
}

- (TUIAnchorSet)anchorSet
{
  return self->_anchorSet;
}

- (TUIRenderUpdateCollectionController)updateController
{
  return self->_updateController;
}

- (TUIRenderUpdateAuxiliaryController)auxiliaryUpdateController
{
  return self->_auxiliaryUpdateController;
}

- (TUIRenderUpdateLayerController)layerUpdateController
{
  return self->_layerUpdateController;
}

- (TUIActionHandlerDelegate)actionHandlerDelegate
{
  return (TUIActionHandlerDelegate *)objc_loadWeakRetained((id *)&self->_actionHandlerDelegate);
}

- (void)setActionHandlerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionHandlerDelegate, a3);
}

- (float)priority
{
  return self->_priority;
}

- (unint64_t)statsMode
{
  return self->_statsMode;
}

- (double)loadingFooterHeight
{
  return self->_loadingFooterHeight;
}

- (double)loadingFooterMinY
{
  return self->_loadingFooterMinY;
}

- (void)setLoadingFooterMinY:(double)a3
{
  self->_loadingFooterMinY = a3;
}

- (NSArray)dataRequests
{
  return self->_dataRequests;
}

- (void)setDataRequests:(id)a3
{
  objc_storeStrong((id *)&self->_dataRequests, a3);
}

- (OS_dispatch_queue)dataRequestsSync
{
  return self->_dataRequestsSync;
}

- (void)setDataRequestsSync:(id)a3
{
  objc_storeStrong((id *)&self->_dataRequestsSync, a3);
}

- (TUIWPService)wpService
{
  return self->_wpService;
}

- (void)setWpService:(id)a3
{
  objc_storeStrong((id *)&self->_wpService, a3);
}

- (TUIStatsDatesCollector)datesCollector
{
  return self->_datesCollector;
}

- (void)setDatesCollector:(id)a3
{
  objc_storeStrong((id *)&self->_datesCollector, a3);
}

- (TUIStatsCollector)statsCollector
{
  return self->_statsCollector;
}

- (void)setStatsCollector:(id)a3
{
  objc_storeStrong((id *)&self->_statsCollector, a3);
}

- (TUITransactionDependencyToken)lastEnvironmentTransactionToken
{
  return (TUITransactionDependencyToken *)objc_loadWeakRetained((id *)&self->_lastEnvironmentTransactionToken);
}

- (void)setLastEnvironmentTransactionToken:(id)a3
{
  objc_storeWeak((id *)&self->_lastEnvironmentTransactionToken, a3);
}

- (TUITransactionDependencyToken)lastContentTransactionToken
{
  return (TUITransactionDependencyToken *)objc_loadWeakRetained((id *)&self->_lastContentTransactionToken);
}

- (void)setLastContentTransactionToken:(id)a3
{
  objc_storeWeak((id *)&self->_lastContentTransactionToken, a3);
}

- (NSString)previousStackName
{
  return self->_previousStackName;
}

- (void)setPreviousStackName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (TUIFeedCaptureController)captureController
{
  return self->_captureController;
}

- (OS_dispatch_queue)sync
{
  return self->_sync;
}

- (void)setSync:(id)a3
{
  objc_storeStrong((id *)&self->_sync, a3);
}

- (TUIWorkQueueContext)queueContext
{
  return self->_queueContext;
}

- (void)setQueueContext:(id)a3
{
  objc_storeStrong((id *)&self->_queueContext, a3);
}

- (unint64_t)lq_statsMode
{
  return self->_lq_statsMode;
}

- (void)setLq_statsMode:(unint64_t)a3
{
  self->_lq_statsMode = a3;
}

- (TUIRenderModelCollection)currentRenderModel
{
  return self->_currentRenderModel;
}

- (void)setCurrentRenderModel:(id)a3
{
  objc_storeStrong((id *)&self->_currentRenderModel, a3);
}

- (TUIHostingMap)currentHostingMap
{
  return self->_currentHostingMap;
}

- (void)setCurrentHostingMap:(id)a3
{
  objc_storeStrong((id *)&self->_currentHostingMap, a3);
}

- (TUIRenderModelAuxiliary)currentAuxiliaryModel
{
  return self->_currentAuxiliaryModel;
}

- (void)setCurrentAuxiliaryModel:(id)a3
{
  objc_storeStrong((id *)&self->_currentAuxiliaryModel, a3);
}

- (TUIRenderModelLayer)currentLayerRenderModel
{
  return self->_currentLayerRenderModel;
}

- (void)setCurrentLayerRenderModel:(id)a3
{
  objc_storeStrong((id *)&self->_currentLayerRenderModel, a3);
}

- (unint64_t)layoutGenerationId
{
  return self->_layoutGenerationId;
}

- (void)setLayoutGenerationId:(unint64_t)a3
{
  self->_layoutGenerationId = a3;
}

- (unint64_t)layoutNextSection
{
  return self->_layoutNextSection;
}

- (void)setLayoutNextSection:(unint64_t)a3
{
  self->_layoutNextSection = a3;
}

- (unint64_t)layoutNumberOfSections
{
  return self->_layoutNumberOfSections;
}

- (void)setLayoutNumberOfSections:(unint64_t)a3
{
  self->_layoutNumberOfSections = a3;
}

- (unint64_t)layoutFlags
{
  return self->_layoutFlags;
}

- (void)setLayoutFlags:(unint64_t)a3
{
  self->_layoutFlags = a3;
}

- (NSMutableDictionary)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (TUITemplateFactory)templateFactory
{
  return self->_templateFactory;
}

- (void)setTemplateFactory:(id)a3
{
  objc_storeStrong((id *)&self->_templateFactory, a3);
}

- (TUIManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (BOOL)environmentChanged
{
  return self->_environmentChanged;
}

- (void)setEnvironmentChanged:(BOOL)a3
{
  self->_environmentChanged = a3;
}

- (unint64_t)renderModelMode
{
  return self->_renderModelMode;
}

- (TUIFeedViewState)layoutViewState
{
  return self->_layoutViewState;
}

- (void)setLayoutViewState:(id)a3
{
  objc_storeStrong((id *)&self->_layoutViewState, a3);
}

- (TUIFeedViewState)restoreViewState
{
  return self->_restoreViewState;
}

- (void)setRestoreViewState:(id)a3
{
  objc_storeStrong((id *)&self->_restoreViewState, a3);
}

- (NSUUID)layoutUntilEntryWithUUID
{
  return self->_layoutUntilEntryWithUUID;
}

- (void)setLayoutUntilEntryWithUUID:(id)a3
{
  objc_storeStrong((id *)&self->_layoutUntilEntryWithUUID, a3);
}

- (TUIStatsTimingCollector)timingCollector
{
  return self->_timingCollector;
}

- (TUIEnvironment)prevEnvironment
{
  return self->_prevEnvironment;
}

- (TUIHostingGeometryMap)hostingGeometryMap
{
  return self->_hostingGeometryMap;
}

- (BOOL)suspended
{
  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (os_unfair_lock_s)layoutConditionsLock
{
  return self->_layoutConditionsLock;
}

- (NSHashTable)layoutConditionsSuspendingUpdates
{
  return self->_layoutConditionsSuspendingUpdates;
}

- (NSHashTable)layoutConditionsSuspendingLayout
{
  return self->_layoutConditionsSuspendingLayout;
}

- (BOOL)inLiveResize
{
  return self->_inLiveResize;
}

- (unint64_t)liveResizeLayoutCount
{
  return self->_liveResizeLayoutCount;
}

- (BOOL)needsLayoutAfterLiveResize
{
  return self->_needsLayoutAfterLiveResize;
}

- (unint64_t)liveResizeSignpost
{
  return self->_liveResizeSignpost;
}

- (unint64_t)frameSignpost
{
  return self->_frameSignpost;
}

- (TUIStatsLiveResize)statsLiveResize
{
  return self->_statsLiveResize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statsLiveResize, 0);
  objc_storeStrong((id *)&self->_layoutConditionsSuspendingLayout, 0);
  objc_storeStrong((id *)&self->_layoutConditionsSuspendingUpdates, 0);
  objc_storeStrong((id *)&self->_hostingGeometryMap, 0);
  objc_storeStrong((id *)&self->_prevEnvironment, 0);
  objc_storeStrong((id *)&self->_timingCollector, 0);
  objc_storeStrong((id *)&self->_layoutUntilEntryWithUUID, 0);
  objc_storeStrong((id *)&self->_restoreViewState, 0);
  objc_storeStrong((id *)&self->_layoutViewState, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_templateFactory, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_currentLayerRenderModel, 0);
  objc_storeStrong((id *)&self->_currentAuxiliaryModel, 0);
  objc_storeStrong((id *)&self->_currentHostingMap, 0);
  objc_storeStrong((id *)&self->_currentRenderModel, 0);
  objc_storeStrong((id *)&self->_queueContext, 0);
  objc_storeStrong((id *)&self->_sync, 0);
  objc_storeStrong((id *)&self->_captureController, 0);
  objc_storeStrong((id *)&self->_previousStackName, 0);
  objc_destroyWeak((id *)&self->_lastContentTransactionToken);
  objc_destroyWeak((id *)&self->_lastEnvironmentTransactionToken);
  objc_storeStrong((id *)&self->_statsCollector, 0);
  objc_storeStrong((id *)&self->_datesCollector, 0);
  objc_storeStrong((id *)&self->_wpService, 0);
  objc_storeStrong((id *)&self->_dataRequestsSync, 0);
  objc_storeStrong((id *)&self->_dataRequests, 0);
  objc_destroyWeak((id *)&self->_actionHandlerDelegate);
  objc_storeStrong((id *)&self->_layerUpdateController, 0);
  objc_storeStrong((id *)&self->_auxiliaryUpdateController, 0);
  objc_storeStrong((id *)&self->_updateController, 0);
  objc_storeStrong((id *)&self->_anchorSet, 0);
  objc_storeStrong((id *)&self->_transactionCoordinator, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_environmentPendingUpdate, 0);
}

@end
