@implementation MTBaseFeedManager

+ (id)_metadataUrl
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTConstants cachesDirectory](MTConstants, "cachesDirectory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("MTSubscriptionMeta.plist")));

  return v3;
}

+ (void)initialize
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___MTBaseFeedManager;
  objc_msgSendSuper2(&v5, "initialize");
  if (qword_1005674E8 != -1)
    dispatch_once(&qword_1005674E8, &stru_1004AA7C0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_metadataUrl"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:](NSDictionary, "dictionaryWithContentsOfURL:", v3));

  if (v4)
    objc_msgSend((id)qword_1005674F8, "addEntriesFromDictionary:", v4);

}

- (MTBaseFeedManager)init
{
  MTBaseFeedManager *v2;
  void *v3;
  MTExternalFeedDownloader *v4;
  id v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  id v9;
  dispatch_queue_t v10;
  void *v11;
  unsigned int v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  id v18;
  dispatch_queue_t v19;
  uint64_t v20;
  NSMutableArray *pendingFeedProcessingBlocks;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)MTBaseFeedManager;
  v2 = -[MTBaseFeedManager init](&v23, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[FeedManagerLocalConfiguration platformSpecificConfiguration](_TtC18PodcastsFoundation29FeedManagerLocalConfiguration, "platformSpecificConfiguration"));
    -[MTBaseFeedManager setConfiguration:](v2, "setConfiguration:", v3);

    v4 = -[MTExternalFeedDownloader initWithDelegate:]([MTExternalFeedDownloader alloc], "initWithDelegate:", v2);
    -[MTBaseFeedManager setExternalFeedDownloader:](v2, "setExternalFeedDownloader:", v4);

    v5 = objc_alloc_init((Class)_TtC18PodcastsFoundation21PodcastFeedDownloader);
    -[MTBaseFeedManager setStorePodcastDownloader:](v2, "setStorePodcastDownloader:", v5);

    v6 = (objc_class *)objc_opt_class(v2);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-feedProcessingQueue"), v8)));
    v10 = dispatch_queue_create((const char *)objc_msgSend(v9, "UTF8String"), 0);
    -[MTBaseFeedManager setFeedProcessingQueue:](v2, "setFeedProcessingQueue:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager configuration](v2, "configuration"));
    v12 = objc_msgSend(v11, "workQueueConcurrent");
    v13 = &_dispatch_queue_attr_concurrent;
    if (!v12)
      v13 = 0;
    v14 = v13;

    v15 = (objc_class *)objc_opt_class(v2);
    v16 = NSStringFromClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-worker"), v17)));
    v19 = dispatch_queue_create((const char *)objc_msgSend(v18, "UTF8String"), v14);

    -[MTBaseFeedManager setWorkQueue:](v2, "setWorkQueue:", v19);
    v20 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    pendingFeedProcessingBlocks = v2->_pendingFeedProcessingBlocks;
    v2->_pendingFeedProcessingBlocks = (NSMutableArray *)v20;

  }
  return v2;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void)setStorePodcastDownloader:(id)a3
{
  objc_storeStrong((id *)&self->_storePodcastDownloader, a3);
}

- (void)setFeedProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_feedProcessingQueue, a3);
}

- (void)setExternalFeedDownloader:(id)a3
{
  objc_storeStrong((id *)&self->_externalFeedDownloader, a3);
}

- (void)setDownloadManager:(id)a3
{
  objc_storeStrong((id *)&self->_downloadManager, a3);
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (_TtC18PodcastsFoundation29FeedManagerLocalConfiguration)configuration
{
  return self->_configuration;
}

- (id)sessionCompletionHandler
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager externalFeedDownloader](self, "externalFeedDownloader"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sessionCompletionHandler"));

  return v3;
}

- (void)setSessionCompletionHandler:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager externalFeedDownloader](self, "externalFeedDownloader"));
  objc_msgSend(v5, "setSessionCompletionHandler:", v4);

  -[MTBaseFeedManager _processNextPendingFeedIfPossible](self, "_processNextPendingFeedIfPossible");
}

- (id)importContext
{
  void *v2;
  unsigned int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager configuration](self, "configuration"));
  v3 = objc_msgSend(v2, "supportsBatchInsertion");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v5 = v4;
  if (v3)
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resetableImportContext"));
  else
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "importContext"));
  v7 = (void *)v6;

  return v7;
}

- (id)preProcessFeedHook:(id)a3 requestUrl:(id)a4 needsUpdate:(BOOL)a5
{
  return objc_msgSend(objc_alloc((Class)MTFeedUpdatePreProcessResult), "initWithShouldContinue:createdPodcastUUID:", 1, 0);
}

- (BOOL)processFeed:(id)a3 podcastUUID:(id)a4 requestUrl:(id)a5 useBackgroundFetch:(BOOL)a6 needsUpdate:(BOOL)a7 source:(int64_t)a8
{
  _BOOL4 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  MTBaseFeedManager *v26;
  id v27;
  id v28;
  _QWORD *v29;
  uint64_t *v30;
  int64_t v31;
  BOOL v32;
  BOOL v33;
  _QWORD v34[5];
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;

  v9 = a7;
  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MTProcessorManager sharedInstance](MTProcessorManager, "sharedInstance"));
  objc_msgSend(v17, "startProcessorsForFeedUpdates");

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager importContext](self, "importContext"));
  if (v15)
  {
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0;
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x3032000000;
    v34[3] = sub_1000467EC;
    v34[4] = sub_100046A6C;
    v35 = 0;
    v23[1] = 3221225472;
    v23[2] = sub_1000E59DC;
    v23[3] = &unk_1004AA7E8;
    v22 = v18;
    v23[0] = _NSConcreteStackBlock;
    v24 = v18;
    v19 = v15;
    v32 = v9;
    v29 = v34;
    v30 = &v36;
    v25 = v19;
    v26 = self;
    v27 = v14;
    v28 = v16;
    v31 = a8;
    v33 = v10;
    objc_msgSend(v24, "performBlockAndWaitWithSave:", v23);
    if (v9 && *((_BYTE *)v37 + 24))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateManager sharedInstance](MTFeedUpdateManager, "sharedInstance"));
      objc_msgSend(v20, "_updatePodcastWithUUID:userInitiated:useBackgroundFetch:source:", v19, 0, v10, 14);

    }
    _Block_object_dispose(v34, 8);

    _Block_object_dispose(&v36, 8);
    v18 = v22;
  }

  return 1;
}

- (BOOL)updatePodcastWithUuid:(id)a3 withFeed:(id)a4 originalFeedUrl:(id)a5 source:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  char v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  unsigned int v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  uint64_t v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  uint64_t v76;
  NSObject *v77;
  MTBaseFeedManager *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  NSObject *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  unint64_t v87;
  uint64_t v88;
  double v89;
  void *v90;
  uint64_t v91;
  void *v92;
  _UNKNOWN **v93;
  void *v94;
  unint64_t v95;
  _BOOL8 v96;
  uint64_t v97;
  NSObject *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  void *v109;
  NSObject *v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  NSObject *v115;
  void *v116;
  void *v117;
  unint64_t v118;
  void *v119;
  void *v120;
  id v121;
  unint64_t v122;
  int v124;
  uint64_t v125;
  NSObject *v126;
  void *v127;
  void *v128;
  unint64_t v129;
  void *v130;
  uint64_t v131;
  NSObject *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  NSObject *v141;
  unint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  uint64_t v146;
  char v147;
  void *v148;
  unsigned int v149;
  void *v150;
  void *v151;
  uint64_t v152;
  void *v153;
  void *v154;
  uint64_t v155;
  uint64_t v156;
  NSObject *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  int v162;
  void *v163;
  uint64_t v164;
  uint64_t v165;
  NSObject *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  uint64_t v171;
  NSObject *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  unsigned int v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  uint64_t v189;
  void *v190;
  double v191;
  double v192;
  void *v193;
  double v194;
  double v195;
  void *v196;
  uint64_t v197;
  void *v198;
  double v199;
  double v200;
  void *v201;
  double v202;
  double v203;
  void *v204;
  uint64_t v205;
  void *v206;
  double v207;
  double v208;
  void *v209;
  double v210;
  double v211;
  void *v212;
  void *v213;
  id v214;
  id v215;
  void *v216;
  double v217;
  double v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  double v230;
  void *v231;
  void *v232;
  void *v233;
  uint64_t v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  uint64_t v241;
  NSObject *v242;
  void *v243;
  void *v244;
  id v245;
  double v246;
  double v247;
  uint64_t v248;
  uint64_t v249;
  NSObject *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  _UNKNOWN **v255;
  void *v256;
  void *v257;
  uint64_t v258;
  void *v259;
  NSObject *v260;
  uint64_t v261;
  unint64_t v262;
  void *v263;
  uint64_t v264;
  uint64_t v265;
  NSObject *v266;
  unint64_t v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  id v277;
  id v278;
  uint64_t v279;
  NSObject *v280;
  void *v281;
  void *v282;
  char *v283;
  unint64_t v284;
  uint64_t v285;
  char *v286;
  char *v287;
  char *v288;
  void *v289;
  uint64_t v290;
  NSObject *v291;
  uint64_t v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  double v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  id v304;
  void *v305;
  uint64_t v306;
  NSObject *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  id v314;
  void *v315;
  id v316;
  uint64_t v317;
  void *v318;
  unsigned __int8 v319;
  uint64_t v320;
  uint64_t v321;
  NSObject *v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  double v327;
  BOOL v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  uint64_t v339;
  uint64_t v340;
  NSObject *v341;
  void *v342;
  void *v344;
  void *v345;
  id v346;
  id v347;
  char v348;
  id v349;
  id v351;
  void *v352;
  void *v353;
  void *v354;
  NSObject *v355;
  uint64_t v356;
  id v357;
  void *v358;
  void *v359;
  unsigned int v360;
  void *v361;
  void *v362;
  uint64_t v363;
  void *context;
  void *contexta;
  id v366;
  id v367;
  uint64_t v368;
  unint64_t v369;
  void *v370;
  void *v371;
  MTBaseFeedManager *v372;
  void *v373;
  unint64_t v374;
  unint64_t obja;
  id obj;
  void *v377;
  void *v378;
  void *v379;
  unint64_t v380;
  uint64_t v381;
  id v382;
  __int128 v383;
  __int128 v384;
  __int128 v385;
  __int128 v386;
  id v387;
  double v388;
  double v389;
  _QWORD v390[5];
  id v391;
  _QWORD v392[5];
  _QWORD v393[5];
  _BYTE v394[128];
  void *v395;
  uint8_t buf[4];
  id v397;
  __int16 v398;
  void *v399;
  __int16 v400;
  double v401;
  __int16 v402;
  double v403;
  __int16 v404;
  id v405;
  __int16 v406;
  void *v407;
  __int16 v408;
  void *v409;
  __int16 v410;
  void *v411;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v358 = v11;
  if (!v10)
  {
    v23 = v9;
    v24 = _MTLogCategoryFeedUpdate(v11);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v397 = v9;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%{public}@ failed to update because feed was nil", buf, 0xCu);
    }
    goto LABEL_184;
  }
  v12 = os_transaction_create("add image to disk store");
  v353 = objc_autoreleasePoolPush();
  v372 = self;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager importContext](self, "importContext"));
  v357 = v9;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "podcastForUuid:", v9));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "podcastStoreId"));
  v16 = objc_msgSend(v15, "longLongValue");

  if (+[MTStoreIdentifier isNotEmpty:](MTStoreIdentifier, "isNotEmpty:", v16))
    objc_msgSend(v14, "setStoreCollectionId:", v16);
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "updatedFeedURL"));
  v354 = (void *)v17;
  v355 = v12;
  v347 = v16;
  if (+[MTDBUtil isSupportedUrlString:](MTDBUtil, "isSupportedUrlString:", v17)
    && (v18 = (void *)v17,
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentFeedURL")),
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "absoluteString")),
        LOBYTE(v18) = objc_msgSend(v18, "isEqualToString:", v20),
        v20,
        v19,
        (v18 & 1) == 0))
  {
    v26 = _MTLogCategoryFeedUpdate(v21);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentFeedURL"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "absoluteString"));
      *(_DWORD *)buf = 138543874;
      v397 = v357;
      v398 = 2112;
      v399 = v354;
      v400 = 2112;
      v401 = *(double *)&v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ Found different updatedFeedURL %@ from %@", buf, 0x20u);

    }
    objc_msgSend(v14, "setUpdatedFeedURL:", v354);
    v22 = 1;
  }
  else
  {
    v22 = 0;
  }
  v348 = v22;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "resolvedFeedURL"));
  if (objc_msgSend(v30, "length"))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentFeedURL"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "absoluteString"));
    v33 = objc_msgSend(v30, "isEqualToString:", v32);

    if ((v33 & 1) == 0)
    {
      v35 = _MTLogCategoryFeedUpdate(v34);
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentFeedURL"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "absoluteString"));
        *(_DWORD *)buf = 138543874;
        v397 = v357;
        v398 = 2112;
        v399 = v30;
        v400 = 2112;
        v401 = *(double *)&v38;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ Found different feedURL %@ from %@", buf, 0x20u);

      }
      objc_msgSend(v14, "setUpdatedFeedURL:", v30);
      v348 = 1;
    }
  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "stringByStrippingHTML"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "stringByRemovingNewlineCharacters"));
  objc_msgSend(v14, "setTitle:", v41);

  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "author"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "stringByStrippingHTML"));
  objc_msgSend(v14, "setAuthor:", v43);

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "provider"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "stringByStrippingHTML"));
  objc_msgSend(v14, "setProvider:", v45);

  objc_msgSend(v14, "setIsExplicit:", objc_msgSend(v10, "isExplicit"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "feedDescription"));
  objc_msgSend(v14, "setItemDescription:", v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "showType"));
  objc_msgSend(v14, "setShowTypeInFeed:", v47);

  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "category"));
  objc_msgSend(v14, "setCategory:", v48);

  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "webpageURL"));
  objc_msgSend(v14, "setWebpageURL:", v49);

  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "shareURL"));
  objc_msgSend(v14, "setStoreCleanURL:", v50);

  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "artworkPrimaryColor"));
  objc_msgSend(v14, "setArtworkPrimaryColor:", v51);

  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "showSpecificUpsellCopy"));
  objc_msgSend(v14, "setShowSpecificUpsellCopy:", v52);

  objc_msgSend(v14, "setOfferTypes:", objc_msgSend(v10, "offerTypesAsFlagBits"));
  v53 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayType"));
  if (v53)
  {
    v54 = (void *)v53;
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayType"));
    v56 = objc_msgSend(v55, "isNotEmpty");

    if (v56)
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayType"));
      objc_msgSend(v14, "setDisplayType:", v57);

    }
  }
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "channelItem"));

  if (v58)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "channelItem"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[MTChannel createOrFindChannelFromFeedChannelItem:personalizedRequest:context:](MTChannel, "createOrFindChannelFromFeedChannelItem:personalizedRequest:context:", v59, 0, v13));

    objc_msgSend(v14, "setChannel:", v60);
    v360 = objc_msgSend(v60, "subscriptionActive");

  }
  else
  {
    v360 = 0;
  }
  v356 = kMTEpisodeEntityName;
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uuid"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForAllEpisodesIncludingHiddenOnPodcastUuid:](MTEpisode, "predicateForAllEpisodesIncludingHiddenOnPodcastUuid:", v62));
  objc_msgSend(v61, "setPredicate:", v63);

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager _sortDescriptorsForLocalEpisodes](v372, "_sortDescriptorsForLocalEpisodes"));
  objc_msgSend(v61, "setSortDescriptors:", v64);

  objc_msgSend(v61, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v61, "setFetchBatchSize:", 200);
  v391 = 0;
  v352 = v61;
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "executeFetchRequest:error:", v61, &v391));
  v66 = v391;
  v349 = v10;
  v351 = v66;
  if (v66)
  {
    v67 = v66;
    v68 = _MTLogCategoryFeedUpdate(v66);
    v69 = objc_claimAutoreleasedReturnValue(v68);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uuid"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
      *(_DWORD *)buf = 138543874;
      v397 = v70;
      v398 = 2112;
      v399 = v71;
      v400 = 2112;
      v401 = *(double *)&v351;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "%{public}@ - %@ failed to fetch db episodes - %@", buf, 0x20u);

      v67 = v351;
    }

    v346 = 0;
    v367 = 0;
    v363 = 0;
    v72 = v67;
    v23 = v357;
    v25 = v355;
    goto LABEL_183;
  }
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "items"));
  v390[0] = _NSConcreteStackBlock;
  v390[1] = 3221225472;
  v390[2] = sub_1000E8538;
  v390[3] = &unk_1004AA810;
  v390[4] = v372;
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "sortedArrayWithOptions:usingComparator:", 16, v390));

  v346 = objc_msgSend(v74, "count");
  v388 = 0.0;
  v389 = 0.0;
  v362 = v74;
  v75 = objc_msgSend((id)objc_opt_class(v372), "standardDeviationForEpisodes:standardDeviation:average:", v74, &v389, &v388);
  v76 = _MTLogCategoryFeedUpdate(v75);
  v77 = objc_claimAutoreleasedReturnValue(v76);
  v78 = v372;
  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
  {
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uuid"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
    *(_DWORD *)buf = 138544130;
    v397 = v79;
    v398 = 2112;
    v399 = v80;
    v400 = 2048;
    v401 = v389;
    v402 = 2048;
    v403 = v388;
    _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Standard Deviation: %f, average: %f", buf, 0x2Au);

  }
  objc_msgSend(v14, "setUpdateStdDev:", v389);
  v81 = _MTLogCategoryFeedUpdate(objc_msgSend(v14, "setUpdateAvg:", v388));
  v82 = objc_claimAutoreleasedReturnValue(v81);
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
  {
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uuid"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
    v85 = objc_msgSend(v362, "count");
    *(_DWORD *)buf = 138543874;
    v397 = v83;
    v398 = 2112;
    v399 = v84;
    v400 = 2048;
    v401 = *(double *)&v85;
    _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ number of items: %lu", buf, 0x20u);

  }
  v370 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v371 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v345 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v86 = v362;
  v377 = v13;
  v378 = v14;
  v344 = v30;
  v373 = v65;
  if (objc_msgSend(v362, "count"))
  {
    v363 = 0;
    v359 = 0;
    v381 = 0;
    v87 = 0;
    v88 = 0;
    v89 = 0.0;
    while (1)
    {
      v368 = v88;
      v379 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "objectAtIndex:", v88));
      v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "enclosureURL"));

      if (!v90)
      {
        v125 = _MTLogCategoryFeedUpdate(v91);
        v126 = objc_claimAutoreleasedReturnValue(v125);
        if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
        {
          v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uuid"));
          v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
          v129 = v87;
          v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "title"));
          *(_DWORD *)buf = 138543874;
          v397 = v127;
          v398 = 2112;
          v399 = v128;
          v400 = 2112;
          v401 = *(double *)&v130;
          _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_ERROR, "%{public}@ - %@ feed item without an enclosure: %@", buf, 0x20u);

          v86 = v362;
          v87 = v129;
        }

        goto LABEL_125;
      }
      context = objc_autoreleasePoolPush();
      v92 = 0;
      if (v87 >= (unint64_t)objc_msgSend(v65, "count"))
      {
        v124 = 0;
        v93 = CPInterfaceController_ptr;
      }
      else
      {
        ++v87;
        v93 = CPInterfaceController_ptr;
        while (1)
        {
          v94 = v92;
          v95 = v87 - 1;
          v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectAtIndex:", v87 - 1));

          v96 = -[MTBaseFeedManager _localEpisode:isEqualToServerEpisode:](v78, "_localEpisode:isEqualToServerEpisode:", v92, v379);
          if (v96)
          {
            v124 = 0;
            goto LABEL_59;
          }
          v97 = _MTLogCategoryFeedUpdate(v96);
          v98 = objc_claimAutoreleasedReturnValue(v97);
          if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
          {
            v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uuid"));
            v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
            obja = v87 - 1;
            v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "guid"));
            v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "guid"));
            v103 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "resolvedEnclosureUrl"));
            v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "enclosureURL"));
            v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "title"));
            v374 = v87;
            v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "title"));
            *(_DWORD *)buf = 138545154;
            v397 = v99;
            v398 = 2112;
            v399 = v100;
            v400 = 2112;
            v401 = *(double *)&v101;
            v402 = 2112;
            v403 = *(double *)&v102;
            v404 = 2112;
            v405 = v103;
            v406 = 2112;
            v407 = v104;
            v408 = 2112;
            v409 = v105;
            v410 = 2112;
            v411 = v106;
            _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_INFO, "%{public}@ - %@ did not find match for episode %@ - %@ | %@ - %@ | %@ - %@", buf, 0x52u);

            v87 = v374;
            v93 = CPInterfaceController_ptr;

            v14 = v378;
            v95 = obja;

            v78 = v372;
            v13 = v377;
          }

          if (-[MTBaseFeedManager _compareServerEpisode:toLocalEpisode:](v78, "_compareServerEpisode:toLocalEpisode:", v379, v92) == -1)break;
          v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "uuid"));

          if (v107)
          {
            v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "uuid"));
            objc_msgSend(v370, "addObject:", v109);

            v110 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v92, "storeTrackId")));
            objc_msgSend(v371, "addObject:", v110);
          }
          else
          {
            v111 = _MTLogCategoryFeedUpdate(v108);
            v110 = objc_claimAutoreleasedReturnValue(v111);
            if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
            {
              v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "title"));
              *(_DWORD *)buf = 138412290;
              v397 = v112;
              _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_ERROR, "NULL UUID for localEpisode no longer in server feed, title %@", buf, 0xCu);

            }
          }

          v114 = _MTLogCategoryFeedUpdate(v113);
          v115 = objc_claimAutoreleasedReturnValue(v114);
          if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
          {
            v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uuid"));
            v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
            v118 = v87;
            v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "uuid"));
            v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "title"));
            *(_DWORD *)buf = 138544130;
            v397 = v116;
            v398 = 2112;
            v399 = v117;
            v400 = 2114;
            v401 = *(double *)&v119;
            v402 = 2112;
            v403 = *(double *)&v120;
            _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ marking episode for deletion %{public}@ - %@", buf, 0x2Au);

            v87 = v118;
            v93 = CPInterfaceController_ptr;

          }
          v65 = v373;
          if (200 * (v87 / 0xC8) == v87)
            objc_msgSend(v13, "saveInCurrentBlock");
          v121 = objc_msgSend(v373, "count");
          v122 = v87 + 1;
          if (v87++ >= (unint64_t)v121)
          {
            v124 = 0;
            v87 = v122 - 1;
            goto LABEL_59;
          }
        }
        v131 = _MTLogCategoryFeedUpdate(-1);
        v132 = objc_claimAutoreleasedReturnValue(v131);
        if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
        {
          v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uuid"));
          v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
          v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "episodeStoreId"));
          v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "title"));
          *(_DWORD *)buf = 138544130;
          v397 = v133;
          v398 = 2112;
          v399 = v134;
          v400 = 2114;
          v401 = *(double *)&v135;
          v402 = 2112;
          v403 = *(double *)&v136;
          _os_log_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ should add new episode from server %{public}@ - %@", buf, 0x2Au);

          v93 = CPInterfaceController_ptr;
        }

        v124 = 1;
        v87 = v95;
      }
LABEL_59:
      v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "episodeStoreId"));
      v138 = (uint64_t)objc_msgSend(v137, "longLongValue");

      v140 = _MTLogCategoryFeedUpdate(v139);
      v141 = objc_claimAutoreleasedReturnValue(v140);
      v142 = v87;
      if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
      {
        v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uuid"));
        v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
        v145 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v138));
        *(_DWORD *)buf = 138543874;
        v397 = v143;
        v398 = 2112;
        v399 = v144;
        v400 = 2112;
        v401 = *(double *)&v145;
        _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ serverEpisode %@", buf, 0x20u);

        v87 = v142;
        v93 = CPInterfaceController_ptr;

      }
      if (!v92)
        break;
      if (v138 > 0)
        v147 = v124;
      else
        v147 = 0;
      if ((v147 & 1) != 0)
        goto LABEL_68;
LABEL_73:
      v151 = v92;
      if (v92)
        goto LABEL_74;
LABEL_77:
      v78 = v372;
LABEL_78:
      v163 = v151;
      v151 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager _insertNewEpisodeForServerEpisode:podcast:ctx:](v78, "_insertNewEpisodeForServerEpisode:podcast:ctx:", v379, v14, v13));

      v165 = _MTLogCategoryFeedUpdate(v164);
      v166 = objc_claimAutoreleasedReturnValue(v165);
      if (os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT))
      {
        v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uuid"));
        v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
        v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "uuid"));
        v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "title"));
        *(_DWORD *)buf = 138544130;
        v397 = v167;
        v398 = 2112;
        v399 = v168;
        v400 = 2114;
        v401 = *(double *)&v169;
        v402 = 2112;
        v403 = *(double *)&v170;
        _os_log_impl((void *)&_mh_execute_header, v166, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ adding new episode %{public}@ - %@", buf, 0x2Au);

        v78 = v372;
        v87 = v142;

      }
      ++v363;
      if (!v151)
        goto LABEL_119;
      v162 = 1;
LABEL_82:
      v171 = _MTLogCategoryFeedUpdate(v146);
      v172 = objc_claimAutoreleasedReturnValue(v171);
      if (os_log_type_enabled(v172, OS_LOG_TYPE_DEFAULT))
      {
        v173 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v378, "uuid"));
        v174 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v378, "title"));
        v175 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "uuid"));
        v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "title"));
        *(_DWORD *)buf = 138544130;
        v397 = v173;
        v398 = 2112;
        v399 = v174;
        v400 = 2114;
        v401 = *(double *)&v175;
        v402 = 2112;
        v403 = *(double *)&v176;
        _os_log_impl((void *)&_mh_execute_header, v172, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ updating episode %{public}@ - %@", buf, 0x2Au);

        v78 = v372;
      }

      objc_msgSend(v151, "setFeedDeleted:", 0);
      v177 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "guid"));
      objc_msgSend(v151, "setGuid:", v177);

      if (+[MTStoreIdentifier isNotEmpty:](MTStoreIdentifier, "isNotEmpty:", v138))
        objc_msgSend(v151, "setStoreTrackId:", v138);
      v178 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "title"));
      v179 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v178, "stringByStrippingHTML"));

      objc_msgSend(v151, "setTitle:", v179);
      v180 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "itunesTitle"));
      objc_msgSend(v151, "setItunesTitle:", v180);

      v181 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager configuration](v78, "configuration"));
      v182 = objc_msgSend(v181, "usesCleanEpisodeTitles");

      if (v182)
      {
        v183 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v378, "title"));
        v184 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v179, "cleanedTitleStringWithPrefix:", v183));
        objc_msgSend(v151, "setCleanedTitle:", v184);

      }
      v185 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "itemDescription"));
      objc_msgSend(v151, "setItemDescription:", v185);

      v186 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "itemSummary"));
      objc_msgSend(v151, "setItunesSubtitle:", v186);

      v187 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "author"));
      objc_msgSend(v151, "setAuthor:", v187);

      objc_msgSend(v151, "setByteSize:", objc_msgSend(v379, "byteSize"));
      v188 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "uti"));
      objc_msgSend(v151, "setUti:", v188);

      v189 = objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "pubDate"));
      if (v189)
      {
        v190 = (void *)v189;
        objc_msgSend(v151, "pubDate");
        v192 = v191;
        v193 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "pubDate"));
        objc_msgSend(v193, "timeIntervalSinceReferenceDate");
        v195 = v194;

        if (v192 != v195)
        {
          v196 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "pubDate"));
          objc_msgSend(v196, "timeIntervalSinceReferenceDate");
          objc_msgSend(v151, "setPubDate:");

        }
      }
      v197 = objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "firstTimeAvailableAsFree"));
      if (v197)
      {
        v198 = (void *)v197;
        objc_msgSend(v151, "firstTimeAvailableAsFree");
        v200 = v199;
        v201 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "firstTimeAvailableAsFree"));
        objc_msgSend(v201, "timeIntervalSinceReferenceDate");
        v203 = v202;

        if (v200 != v203)
        {
          v204 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "firstTimeAvailableAsFree"));
          objc_msgSend(v204, "timeIntervalSinceReferenceDate");
          objc_msgSend(v151, "setFirstTimeAvailableAsFree:");

        }
      }
      v205 = objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "firstTimeAvailableAsPaid"));
      if (v205)
      {
        v206 = (void *)v205;
        objc_msgSend(v151, "firstTimeAvailableAsPaid");
        v208 = v207;
        v209 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "firstTimeAvailableAsPaid"));
        objc_msgSend(v209, "timeIntervalSinceReferenceDate");
        v211 = v210;

        if (v208 != v211)
        {
          v212 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "firstTimeAvailableAsPaid"));
          objc_msgSend(v212, "timeIntervalSinceReferenceDate");
          objc_msgSend(v151, "setFirstTimeAvailableAsPaid:");

        }
      }
      if (objc_msgSend(v379, "trackNum"))
        objc_msgSend(v151, "setTrackNum:", objc_msgSend(v379, "trackNum"));
      objc_msgSend(v151, "setExplicit:", objc_msgSend(v379, "isExplicit"));
      objc_msgSend(v151, "setEpisodeLevel:", v381);
      v213 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "episodeType"));
      objc_msgSend(v151, "setEpisodeType:", v213);

      v214 = objc_msgSend(v151, "episodeNumber");
      if (v214 != objc_msgSend(v379, "episodeNumber"))
        objc_msgSend(v151, "setEpisodeNumber:", objc_msgSend(v379, "episodeNumber"));
      v215 = objc_msgSend(v151, "seasonNumber");
      if (v215 != objc_msgSend(v379, "seasonNumber"))
        objc_msgSend(v151, "setSeasonNumber:", objc_msgSend(v379, "seasonNumber"));
      v216 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "webpageURL"));
      objc_msgSend(v151, "setWebpageURL:", v216);

      objc_msgSend(v151, "setIsHidden:", 0);
      objc_msgSend(v379, "entitledDuration");
      if (v217 > 0.0)
      {
        objc_msgSend(v379, "entitledDuration");
        objc_msgSend(v151, "setEntitledDuration:");
      }
      objc_msgSend(v379, "duration");
      if (v218 > 0.0)
      {
        objc_msgSend(v379, "duration");
        objc_msgSend(v151, "setFreeDuration:");
      }
      v219 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "entitledEnclosureURL"));
      objc_msgSend(v151, "setEntitledEnclosureURL:", v219);

      v220 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "resolvedEnclosureUrl"));
      objc_msgSend(v151, "setFreeEnclosureURL:", v220);

      v221 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "priceType"));
      objc_msgSend(v151, "setFreePriceType:", v221);

      v222 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "entitledPriceType"));
      objc_msgSend(v151, "setEntitledPriceType:", v222);

      v223 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "entitledTranscriptIdentifier"));
      objc_msgSend(v151, "setEntitledTranscriptIdentifier:", v223);

      v224 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "freeTranscriptIdentifier"));
      objc_msgSend(v151, "setFreeTranscriptIdentifier:", v224);

      v225 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "transcriptIdentifier"));
      v226 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "entitledTranscriptSnippet"));
      objc_msgSend(v151, "setEntitledTranscriptSnippet:", v226);

      v227 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "freeTranscriptSnippet"));
      objc_msgSend(v151, "setFreeTranscriptSnippet:", v227);

      v228 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "entitledTranscriptProvider"));
      objc_msgSend(v151, "setEntitledTranscriptProvider:", v228);

      v229 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "freeTranscriptProvider"));
      objc_msgSend(v151, "setFreeTranscriptProvider:", v229);

      if (v360)
      {
        objc_msgSend(v379, "entitledDuration");
        if (v230 > 0.0)
        {
          objc_msgSend(v379, "entitledDuration");
          objc_msgSend(v151, "setDuration:");
        }
        v231 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "entitledEnclosureURL"));

        if (v231)
        {
          v232 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "entitledEnclosureURL"));
          objc_msgSend(v151, "setEnclosureURL:", v232);

        }
        v233 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "entitledPriceType"));
        objc_msgSend(v151, "setPriceType:", v233);

        v234 = objc_claimAutoreleasedReturnValue(objc_msgSend(v379, "entitledTranscriptIdentifier"));
      }
      else
      {
        objc_msgSend(v151, "freeDuration");
        objc_msgSend(v151, "setDuration:");
        v235 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "freeEnclosureURL"));
        objc_msgSend(v151, "setEnclosureURL:", v235);

        v236 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "freePriceType"));
        objc_msgSend(v151, "setPriceType:", v236);

        v234 = objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "freeTranscriptIdentifier"));
      }
      v237 = (void *)v234;
      objc_msgSend(v151, "setTranscriptIdentifier:", v234);

      v238 = (void *)objc_claimAutoreleasedReturnValue(+[PFTranscriptProviderBridge shared](PFTranscriptProviderBridge, "shared"));
      v239 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "transcriptIdentifier"));
      v240 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "assetURL"));
      objc_msgSend(v238, "updateTTMLIDFrom:toNewID:hasDownloadedContent:forEpisodeAdamID:", v225, v239, v240 != 0, objc_msgSend(v151, "storeTrackId"));

      v78 = v372;
      v87 = v142;
      if (v162)
      {
        v241 = _MTLogCategoryFeedUpdate(objc_msgSend(v151, "updateEntitlementState"));
        v242 = objc_claimAutoreleasedReturnValue(v241);
        if (os_log_type_enabled(v242, OS_LOG_TYPE_DEFAULT))
        {
          v243 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "uuid"));
          v244 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "title"));
          v245 = objc_msgSend(v151, "entitlementState");
          *(_DWORD *)buf = 138543874;
          v397 = v243;
          v398 = 2112;
          v399 = v244;
          v400 = 2048;
          v401 = *(double *)&v245;
          _os_log_impl((void *)&_mh_execute_header, v242, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ set entitlement state for inserted episode to %lld from updatePodcastWithUuid", buf, 0x20u);

          v87 = v142;
        }

      }
      ++v381;

      v14 = v378;
LABEL_119:
      v86 = v362;
      objc_msgSend(v151, "resolveAvailabilityDate");
      objc_msgSend(v151, "firstTimeAvailable");
      v65 = v373;
      if (v246 > v89 && objc_msgSend(v151, "isMedia"))
      {
        objc_msgSend(v151, "firstTimeAvailable");
        v89 = v247;
        v248 = objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "uuid"));

        v359 = (void *)v248;
        v86 = v362;
      }
      if (__ROR8__(0x8F5C28F5C28F5C29 * v87, 3) <= 0x147AE147AE147AEuLL)
        objc_msgSend(v13, "saveInCurrentBlock");

      objc_autoreleasePoolPop(context);
LABEL_125:
      v88 = v368 + 1;

      if (v368 + 1 >= (unint64_t)objc_msgSend(v86, "count"))
        goto LABEL_131;
    }
    if (v138 < 1)
    {
      v151 = 0;
      goto LABEL_77;
    }
LABEL_68:
    v148 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v138));
    v149 = objc_msgSend(v371, "containsObject:", v148);

    if (v149)
    {
      v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93[113], "predicateForEpisodeStoreTrackId:", v138));
      v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectInEntity:predicate:", v356, v150));

      if (!v151)
      {
        v249 = _MTLogCategoryFeedUpdate(v152);
        v250 = objc_claimAutoreleasedReturnValue(v249);
        v78 = v372;
        if (os_log_type_enabled(v250, OS_LOG_TYPE_ERROR))
        {
          v251 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uuid"));
          v252 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
          v253 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "uuid"));
          v254 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "title"));
          *(_DWORD *)buf = 138544130;
          v397 = v251;
          v398 = 2112;
          v399 = v252;
          v400 = 2114;
          v401 = *(double *)&v253;
          v402 = 2112;
          v403 = *(double *)&v254;
          _os_log_impl((void *)&_mh_execute_header, v250, OS_LOG_TYPE_ERROR, "%{public}@ - %@ failed to update feed-deleted episode %{public}@ - %@", buf, 0x2Au);

          v87 = v142;
        }

        v151 = 0;
        goto LABEL_78;
      }
      v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "uuid"));
      objc_msgSend(v370, "removeObject:", v153);

      v154 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v138));
      objc_msgSend(v371, "removeObject:", v154);

      v156 = _MTLogCategoryFeedUpdate(v155);
      v157 = objc_claimAutoreleasedReturnValue(v156);
      if (os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT))
      {
        v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uuid"));
        v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
        v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "uuid"));
        v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v151, "title"));
        *(_DWORD *)buf = 138544130;
        v397 = v158;
        v398 = 2112;
        v399 = v159;
        v400 = 2114;
        v401 = *(double *)&v160;
        v402 = 2112;
        v403 = *(double *)&v161;
        _os_log_impl((void *)&_mh_execute_header, v157, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ updating feed-deleted episode %{public}@ - %@", buf, 0x2Au);

        v87 = v142;
      }
      ++v363;

      v124 = 0;
LABEL_74:
      if (!v124)
      {
        v162 = 0;
        v78 = v372;
        goto LABEL_82;
      }
      goto LABEL_77;
    }
    goto LABEL_73;
  }
  v87 = 0;
  v381 = 0;
  v359 = 0;
  v363 = 0;
  v89 = 0.0;
LABEL_131:
  objc_msgSend(v13, "saveInCurrentBlock");
  v255 = CPInterfaceController_ptr;
  if (v87 < (unint64_t)objc_msgSend(v65, "count"))
  {
    do
    {
      v256 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectAtIndex:", v87));
      v257 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256, "uuid"));

      if (v257)
      {
        v259 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256, "uuid"));
        objc_msgSend(v370, "addObject:", v259);

        v260 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v256, "storeTrackId")));
        objc_msgSend(v371, "addObject:", v260);
      }
      else
      {
        v261 = _MTLogCategoryFeedUpdate(v258);
        v260 = objc_claimAutoreleasedReturnValue(v261);
        if (os_log_type_enabled(v260, OS_LOG_TYPE_ERROR))
        {
          v262 = v87;
          v263 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256, "title"));
          *(_DWORD *)buf = 138412290;
          v397 = v263;
          _os_log_impl((void *)&_mh_execute_header, v260, OS_LOG_TYPE_ERROR, "NULL UUID for feedDeletedEpisode removed from the feed, title %@", buf, 0xCu);

          v87 = v262;
        }
      }

      v265 = _MTLogCategoryFeedUpdate(v264);
      v266 = objc_claimAutoreleasedReturnValue(v265);
      if (os_log_type_enabled(v266, OS_LOG_TYPE_DEFAULT))
      {
        v267 = v87;
        v268 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uuid"));
        v269 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
        v270 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256, "uuid"));
        v271 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v256, "title"));
        *(_DWORD *)buf = 138544130;
        v397 = v268;
        v398 = 2112;
        v399 = v269;
        v400 = 2114;
        v401 = *(double *)&v270;
        v402 = 2112;
        v403 = *(double *)&v271;
        _os_log_impl((void *)&_mh_execute_header, v266, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ marking episode for deletion from tail end %{public}@ - %@", buf, 0x2Au);

        v14 = v378;
        v255 = CPInterfaceController_ptr;

        v87 = v267;
      }

      ++v87;
      v65 = v373;
    }
    while (v87 < (unint64_t)objc_msgSend(v373, "count"));
  }
  v272 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v255[206], "fetchRequestWithEntityName:", v356));
  v273 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeUuids:](MTEpisode, "predicateForEpisodeUuids:", v370));
  objc_msgSend(v272, "setPredicate:", v273);

  v274 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodePubDate, 0));
  v395 = v274;
  v275 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v395, 1));
  objc_msgSend(v272, "setSortDescriptors:", v275);

  objc_msgSend(v272, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v272, "setFetchBatchSize:", 200);
  v387 = 0;
  v13 = v377;
  contexta = v272;
  v276 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v377, "executeFetchRequest:error:", v272, &v387));
  v277 = v387;
  v278 = v277;
  if (v277)
  {
    v279 = _MTLogCategoryFeedUpdate(v277);
    v280 = objc_claimAutoreleasedReturnValue(v279);
    if (os_log_type_enabled(v280, OS_LOG_TYPE_ERROR))
    {
      v281 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uuid"));
      v282 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
      *(_DWORD *)buf = 138543874;
      v397 = v281;
      v398 = 2112;
      v399 = v282;
      v400 = 2112;
      v401 = *(double *)&v278;
      _os_log_impl((void *)&_mh_execute_header, v280, OS_LOG_TYPE_ERROR, "%{public}@ - %@ failed to fetch episodes to delete - %@", buf, 0x20u);

    }
  }
  v361 = v278;
  v367 = objc_msgSend(v276, "count");
  v383 = 0u;
  v384 = 0u;
  v385 = 0u;
  v386 = 0u;
  obj = v276;
  v283 = (char *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v383, v394, 16);
  v366 = v283;
  if (v283)
  {
    v284 = 0;
    v285 = *(_QWORD *)v384;
    v286 = v283;
    do
    {
      v287 = 0;
      v380 = ~v284;
      v369 = v284;
      v288 = (char *)(v284 + 1);
      do
      {
        if (*(_QWORD *)v384 != v285)
          objc_enumerationMutation(obj);
        v289 = *(void **)(*((_QWORD *)&v383 + 1) + 8 * (_QWORD)v287);
        v290 = _MTLogCategoryFeedUpdate(v283);
        v291 = objc_claimAutoreleasedReturnValue(v290);
        if (os_log_type_enabled(v291, OS_LOG_TYPE_DEFAULT))
        {
          v292 = v285;
          v293 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v378, "uuid"));
          v294 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v378, "title"));
          v295 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v289, "uuid"));
          v296 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v289, "title"));
          *(_DWORD *)buf = 138544130;
          v397 = v293;
          v398 = 2112;
          v399 = v294;
          v400 = 2114;
          v401 = *(double *)&v295;
          v402 = 2112;
          v403 = *(double *)&v296;
          _os_log_impl((void *)&_mh_execute_header, v291, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ deleting episode removed from feed %{public}@ - %@", buf, 0x2Au);

          v13 = v377;
          v285 = v292;
        }

        objc_msgSend(v289, "setFeedDeleted:", 1);
        v283 = (char *)objc_msgSend(v289, "setEpisodeLevel:", &v287[v381]);
        if ((char *)(v380 + 200 * ((unint64_t)v288 / 0xC8)) == v287)
          v283 = (char *)objc_msgSend(v13, "saveInCurrentBlock");
        ++v287;
        ++v288;
      }
      while (v286 != v287);
      v284 = (unint64_t)&v286[v369];
      v283 = (char *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v383, v394, 16);
      v286 = v283;
      v381 += (uint64_t)v287;
    }
    while (v283);
  }

  objc_msgSend(v13, "saveInCurrentBlock");
  v10 = v349;
  v14 = v378;
  if (v359 && !-[MTBaseFeedManager isSubscribingWithFeedUrl:](v372, "isSubscribingWithFeedUrl:", v358))
  {
    v297 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "episodeForUuid:", v359));
    objc_msgSend(v297, "metadataTimestamp");
    if (fabs(v298) <= 2.22044605e-16 && objc_msgSend(v378, "subscribed"))
    {
      -[MTBaseFeedManager markEpisodeAsFirstSeen:](v372, "markEpisodeAsFirstSeen:", v297);
      objc_msgSend(v297, "setPlayState:manually:source:", 2, 0, 6);
      objc_msgSend(v297, "setMetadataTimestamp:", 0.0);
      objc_msgSend(v297, "setMetadataFirstSyncEligible:", 1);
    }

  }
  if (objc_msgSend(v345, "count"))
  {
    v299 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v378, "uuid"));
    v300 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v378, "managedObjectContext"));
    v301 = (void *)objc_claimAutoreleasedReturnValue(+[MTRecencyUtil upNextForPodcastUuid:ctx:](MTRecencyUtil, "upNextForPodcastUuid:ctx:", v299, v300));
    v302 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v301, "episodeUuid"));

    v303 = v359;
    if (v302)
      v303 = v302;
    v304 = v303;
    if (objc_msgSend(v345, "containsObject:", v304))
    {
      v305 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "episodeForUuid:", v302));
      v306 = _MTLogCategoryFeedUpdate(v305);
      v307 = objc_claimAutoreleasedReturnValue(v306);
      if (os_log_type_enabled(v307, OS_LOG_TYPE_DEFAULT))
      {
        v308 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v378, "uuid"));
        v309 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v378, "title"));
        v310 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v305, "uuid"));
        v311 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v305, "title"));
        *(_DWORD *)buf = 138544130;
        v397 = v308;
        v398 = 2112;
        v399 = v309;
        v400 = 2114;
        v401 = *(double *)&v310;
        v402 = 2112;
        v403 = *(double *)&v311;
        _os_log_impl((void *)&_mh_execute_header, v307, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Found new smart play episode from episod entitlement changed %{public}@ - %@", buf, 0x2Au);

        v14 = v378;
        v10 = v349;
      }

      -[MTBaseFeedManager markEpisodeAsFirstSeen:](v372, "markEpisodeAsFirstSeen:", v305);
      objc_msgSend(v305, "setSentNotification:", 0);

    }
  }
  v312 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageURL"));
  if (objc_msgSend(v312, "length"))
    v313 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageURL"));
  else
    v313 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "globalImageURL"));
  v65 = v373;
  v314 = v313;

  if (objc_msgSend((id)objc_opt_class(v372), "_fetchSmallestPicturePossible"))
  {
    v315 = (void *)objc_claimAutoreleasedReturnValue(+[MTResizedArtworkURLProvider sharedInstance](MTResizedArtworkURLProvider, "sharedInstance"));
    v316 = objc_msgSend(v315, "resizedArtworkURLString:withDimension:", v314, objc_msgSend((id)objc_opt_class(v372), "_maxArtworkSize"));
    v317 = objc_claimAutoreleasedReturnValue(v316);

    v314 = (id)v317;
  }
  if (v314)
  {
    v318 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageURL"));
    v319 = objc_msgSend(v318, "isEqualToString:", v314);

    if ((v319 & 1) == 0)
    {
      v321 = _MTLogCategoryFeedUpdate(v320);
      v322 = objc_claimAutoreleasedReturnValue(v321);
      if (os_log_type_enabled(v322, OS_LOG_TYPE_DEFAULT))
      {
        v323 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uuid"));
        v324 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
        *(_DWORD *)buf = 138543874;
        v397 = v323;
        v398 = 2112;
        v399 = v324;
        v400 = 2112;
        v401 = *(double *)&v314;
        _os_log_impl((void *)&_mh_execute_header, v322, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ artwork url did change %@", buf, 0x20u);

      }
      objc_msgSend(v14, "setNeedsArtworkUpdate:", 1);
    }
  }
  objc_msgSend(v14, "setImageURL:", v314);
  v325 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uberBackgroundImageURL"));
  objc_msgSend(v14, "setUberBackgroundImageURL:", v325);
  v326 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uberBackgroundJoeColor"));
  objc_msgSend(v14, "setUberBackgroundJoeColor:", v326);

  objc_msgSend(v14, "feedChangedDate");
  if (v89 > v327)
    objc_msgSend(v14, "setFeedChangedDate:", v89);
  v23 = v357;
  v25 = v355;
  if (v366)
    objc_msgSend(v14, "markPlaylistsForUpdate");
  objc_msgSend(v13, "saveInCurrentBlock");

  v30 = v344;
  v67 = 0;
  v72 = v361;
LABEL_183:

  objc_autoreleasePoolPop(v353);
  if (v67)
  {
LABEL_184:
    v328 = 0;
    goto LABEL_188;
  }
  v382 = +[MTFeedUpdateMetricsDataKey newEpisodeCount](MTFeedUpdateMetricsDataKey, "newEpisodeCount");
  v392[0] = v382;
  v329 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v363));
  v393[0] = v329;
  v330 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey deletedEpisodeCount](MTFeedUpdateMetricsDataKey, "deletedEpisodeCount"));
  v392[1] = v330;
  v331 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v367));
  v393[1] = v331;
  v332 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey totalEpisodeCount](MTFeedUpdateMetricsDataKey, "totalEpisodeCount"));
  v392[2] = v332;
  v333 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v346));
  v393[2] = v333;
  v334 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey podcastStoreId](MTFeedUpdateMetricsDataKey, "podcastStoreId"));
  v392[3] = v334;
  v335 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v347));
  v393[3] = v335;
  v336 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey source](MTFeedUpdateMetricsDataKey, "source"));
  v392[4] = v336;
  v337 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a6));
  v393[4] = v337;
  v338 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v393, v392, 5));

  v340 = _MTLogCategoryFeedUpdate(v339);
  v341 = objc_claimAutoreleasedReturnValue(v340);
  if (os_log_type_enabled(v341, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v397 = v357;
    v398 = 2112;
    v399 = v338;
    _os_log_impl((void *)&_mh_execute_header, v341, OS_LOG_TYPE_DEFAULT, "%{public}@ - processed feed and found new episodes: %@", buf, 0x16u);
  }

  v342 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsAction parser](MTFeedUpdateMetricsAction, "parser"));
  +[IMMetrics recordUserAction:dataSource:withData:](IMMetrics, "recordUserAction:dataSource:withData:", v342, 0, v338);

  v23 = v357;
  v10 = v349;
  v25 = v355;
  v328 = v348;
LABEL_188:

  return v328;
}

- (void)markEpisodeAsFirstSeen:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "unsuppressAutomaticDownloadsIfNeeded");
  objc_msgSend(v3, "setIsNew:", 1);

}

- (id)_insertNewEpisodeForServerEpisode:(id)a3 podcast:(id)a4 ctx:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unsigned __int8 v18;
  char v19;
  double v20;
  id v21;
  id v22;
  char *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v8 && (objc_msgSend(v8, "isDeleted") & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SyncControllerFactory resolvedSyncController](_TtC8Podcasts21SyncControllerFactory, "resolvedSyncController"));
    objc_msgSend(v11, "setUppSyncDirtyFlag:", 1);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode insertNewEpisodeInManagedObjectContext:canSendNotifications:](MTEpisode, "insertNewEpisodeInManagedObjectContext:canSendNotifications:", v9, +[PFNotificationSettings canSendNotification](PFNotificationSettings, "canSendNotification")));
    objc_msgSend(v10, "setPodcast:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "guid"));
    objc_msgSend(v10, "setGuid:", v12);

    objc_msgSend(v10, "setImportSource:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pubDate"));
    objc_msgSend(v13, "timeIntervalSinceReferenceDate");
    v15 = v14;
    objc_msgSend(v8, "addedDate");
    v17 = v16;

    v18 = objc_msgSend(v8, "importing");
    if (v15 < v17)
      v19 = 1;
    else
      v19 = v18;
    if ((v19 & 1) == 0 && (objc_msgSend(v8, "subscribed") & 1) != 0)
      goto LABEL_24;
    objc_msgSend(v10, "metadataTimestamp");
    if (v20 == 0.0)
    {
      objc_msgSend(v10, "setPlayState:manually:source:", 0, 1, 6);
      objc_msgSend(v10, "setBackCatalog:", 1);
      objc_msgSend(v10, "setMetadataTimestamp:", 0.0);
      objc_msgSend(v10, "setMetadataFirstSyncEligible:", 0);
    }
    else
    {
      objc_msgSend(v10, "setIsNew:", 0);
    }
    v21 = objc_msgSend(v10, "suppressAutomaticDownloadsIfNeeded");
    if ((v19 & 1) == 0)
    {
LABEL_24:
      v22 = objc_msgSend(v8, "isDark");
      v23 = (char *)objc_msgSend(v8, "darkCount") + 1;
      objc_msgSend(v8, "setDarkCount:", v23);
      objc_msgSend(v8, "setDarkCountLocal:", v23);
      objc_msgSend(v8, "markPlaylistsForUpdate");
      v21 = objc_msgSend(v8, "isDark");
      if ((_DWORD)v22 != (_DWORD)v21)
      {
        v24 = objc_msgSend(v8, "isDark");
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "latestExitFromDarkDownloads"));
        if (v25)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[PFAnalyticsEvent darkDownloadsChangeWithWasDark:isDark:reason:previousExit:](PFAnalyticsEvent, "darkDownloadsChangeWithWasDark:isDark:reason:previousExit:", v22, v24, 2, v25));
        }
        else
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[PFAnalyticsEvent darkDownloadsChangeWithWasDark:isDark:reason:previousExit:](PFAnalyticsEvent, "darkDownloadsChangeWithWasDark:isDark:reason:previousExit:", v22, v24, 2, v27));

        }
        v28 = (void *)objc_opt_new(PFCoreAnalyticsChannel);
        objc_msgSend(v28, "sendEvent:", v26);

      }
    }
    v29 = _MTLogCategoryFeedUpdate(v21);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uuid"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uuid"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));
      v36 = 138544130;
      v37 = v31;
      v38 = 2112;
      v39 = v32;
      v40 = 2114;
      v41 = v33;
      v42 = 2112;
      v43 = v34;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ new episode %{public}@ - %@", (uint8_t *)&v36, 0x2Au);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_localEpisode:(id)a3 isEqualToServerEpisode:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  unsigned __int8 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v5 = a3;
  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "guid"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "guid"));
    if (v9)
    {
      v10 = (void *)v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "guid"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "guid"));
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if ((v13 & 1) != 0)
      {
        v14 = 1;
        goto LABEL_21;
      }
    }
    else
    {

    }
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resolvedEnclosureUrl"));
  if (v15
    && (v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "enclosureURL"))) != 0
    && (v17 = (void *)v16,
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "enclosureURL")),
        v19 = objc_msgSend(v15, "isEqualToString:", v18),
        v18,
        v17,
        (v19 & 1) != 0))
  {
    v14 = 1;
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByStrippingHTML"));

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
      if (v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
        if (objc_msgSend(v21, "isEqualToString:", v23))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pubDate"));
          objc_msgSend(v5, "pubDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
          v14 = objc_msgSend(v24, "isEqualToDate:", v25);

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
LABEL_21:

  return v14;
}

- (int64_t)_compareServerEpisode:(id)a3 toServerEpisode:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pubDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pubDate"));
  v9 = v8;
  if (v7 && v8)
  {
    v10 = (int64_t)objc_msgSend(v8, "compare:", v7);
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "guid"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "guid"));
    v13 = (void *)v12;
    if (v11 | v12)
      v14 = -1;
    else
      v14 = 0;
    if (v12)
      v10 = 1;
    else
      v10 = v14;
    if (v11 && v12)
      v10 = (int64_t)objc_msgSend((id)v12, "compare:", v11);

  }
  return v10;
}

- (id)_sortDescriptorsForLocalEpisodes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodePubDate, 0));
  v6[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodeGuid, 0));
  v6[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2));

  return v4;
}

- (int64_t)_compareServerEpisode:(id)a3 toLocalEpisode:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pubDate"));
  objc_msgSend(v6, "pubDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  v9 = v8;
  if (v7 && v8)
  {
    v10 = (int64_t)objc_msgSend(v8, "compare:", v7);
  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "guid"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "guid"));
    v13 = (void *)v12;
    if (v11 | v12)
      v14 = -1;
    else
      v14 = 0;
    if (v12)
      v10 = 1;
    else
      v10 = v14;
    if (v11 && v12)
      v10 = (int64_t)objc_msgSend((id)v12, "compare:", v11);

  }
  return v10;
}

+ (BOOL)isUpdatingPodcastUuid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainOrPrivateContext"));

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000E8ECC;
    v10[3] = &unk_1004AA838;
    v7 = v6;
    v11 = v7;
    v12 = v4;
    v13 = &v15;
    v14 = a1;
    objc_msgSend(v7, "performBlockAndWait:", v10);
    v8 = *((_BYTE *)v16 + 24) != 0;

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isUpdatingFeedUrl:(id)a3
{
  id v3;
  id v4;
  unsigned __int8 v5;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = (id)qword_1005674F0;
    objc_sync_enter(v4);
    v5 = objc_msgSend((id)qword_1005674F0, "containsObject:", v3);
    objc_sync_exit(v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (unint64_t)updatingCount
{
  id v2;
  id v3;

  v2 = (id)qword_1005674F0;
  objc_sync_enter(v2);
  v3 = objc_msgSend((id)qword_1005674F0, "count");
  objc_sync_exit(v2);

  return (unint64_t)v3;
}

- (void)preprocessFeedWithDataHashingBlock:(id)a3 feedCreationBlock:(id)a4 url:(id)a5 useBackgroundFetch:(BOOL)a6 source:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23[2];
  BOOL v24;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000E9200;
  v19[3] = &unk_1004AA860;
  objc_copyWeak(v23, &location);
  v15 = v12;
  v21 = v15;
  v16 = v14;
  v20 = v16;
  v17 = v13;
  v24 = a6;
  v22 = v17;
  v23[1] = (id)a7;
  v18 = objc_retainBlock(v19);
  -[MTBaseFeedManager _addPendingFeedProcessingBlock:](self, "_addPendingFeedProcessingBlock:", v18);

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

}

- (void)didDownloadFeedWithError:(id)a3 data:(id)a4 task:(id)a5 requestedUrl:(id)a6 useBackgroundFetch:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (v12)
  {
    v15 = a6;
    v16 = _MTLogCategoryFeedUpdate(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedDescription"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userInfo"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", NSUnderlyingErrorKey));
      *(_DWORD *)buf = 138412546;
      v28 = v18;
      v29 = 2112;
      v30 = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@: Underlying error %@", buf, 0x16u);

    }
    -[MTBaseFeedManager feedDownloadedWithError:task:requestedUrl:](self, "feedDownloadedWithError:task:requestedUrl:", v12, v14, v15);
    v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "absoluteString"));

    -[MTBaseFeedManager _didFinishUpdatingFeedUrl:withError:](self, "_didFinishUpdatingFeedUrl:withError:", v21, v12);
  }
  else
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000E9924;
    v25[3] = &unk_1004AA888;
    v26 = v13;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000E992C;
    v23[3] = &unk_1004AA8B0;
    v24 = v26;
    v22 = a6;
    -[MTBaseFeedManager preprocessFeedWithDataHashingBlock:feedCreationBlock:url:useBackgroundFetch:source:](self, "preprocessFeedWithDataHashingBlock:feedCreationBlock:url:useBackgroundFetch:source:", v25, v23, v22, v7, 17);

    v21 = v26;
  }

}

- (void)didRestoreFeedUrlTask:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v3 = (id)qword_1005674F0;
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "absoluteString"));
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = (void *)qword_1005674F0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "absoluteString"));
    objc_msgSend(v6, "addObject:", v7);

  }
  objc_sync_exit(v3);

}

- (BOOL)allowEpisodesRequestTo404AndDeleteEpisodesWithFeedUrl:(id)a3
{
  return 0;
}

- (BOOL)abortUpdatesIfNetworkUnreachable:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unsigned __int8 v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
  v6 = objc_msgSend(v5, "isReachable");

  if ((v6 & 1) == 0)
  {
    if (v3)
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1004AA8D0);
    objc_msgSend((id)objc_opt_class(self), "didFinishUpdatingAllFeeds:", 0);
  }
  return v6 ^ 1;
}

- (BOOL)_shouldDownloadPodcastWithIdentifierFromStore:(int64_t)a3
{
  return +[MTStoreIdentifier isNotEmpty:](MTStoreIdentifier, "isNotEmpty:", a3);
}

- (void)_startDownloadForFeedUrl:(id)a3 cloudSyncFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 triggerBy:(id)a6 userInitiated:(BOOL)a7 useBackgroundFetch:(BOOL)a8 source:(int64_t)a9
{
  _BOOL4 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  _BOOL4 v21;
  uint64_t v22;
  NSObject *v23;
  _BOOL4 v24;
  id v25;
  void *v26;
  int v27;
  int64_t v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;

  v9 = a8;
  v10 = a7;
  v14 = a3;
  v15 = a6;
  v16 = _MTLogCategoryFeedUpdate(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v27 = 138412290;
    v28 = (int64_t)v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Running on downloads queue %@", (uint8_t *)&v27, 0xCu);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager configuration](self, "configuration"));
  v19 = (void *)(objc_msgSend(v18, "useBackgroundFetchForFeedDownloads") | v9);

  v20 = -[MTBaseFeedManager _shouldDownloadPodcastWithIdentifierFromStore:](self, "_shouldDownloadPodcastWithIdentifierFromStore:", a5);
  v21 = v20;
  v22 = _MTLogCategoryFeedUpdate(v20);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (v24)
    {
      v27 = 134218498;
      v28 = a5;
      v29 = 2112;
      v30 = v14;
      v31 = 2048;
      v32 = v19;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Downloading from Media API with storeID %lld for feedURL %@ localBackgroundFetch %ld", (uint8_t *)&v27, 0x20u);
    }

    -[MTBaseFeedManager startDownloadForPodcastStoreId:triggerBy:feedUrl:useBackgroundFetch:source:](self, "startDownloadForPodcastStoreId:triggerBy:feedUrl:useBackgroundFetch:source:", a5, v15, v14, v19, a9);
  }
  else
  {
    if (v24)
    {
      v27 = 138412546;
      v28 = (int64_t)v14;
      v29 = 2048;
      v30 = v19;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Downloading directly from feedURL %@ localBackgroundFetch %ld", (uint8_t *)&v27, 0x16u);
    }

    v25 = objc_msgSend(objc_alloc((Class)_TtC18PodcastsFoundation22DownloadableURLOptions), "initWithUrl:nonAppInitiated:", v14, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager externalFeedDownloader](self, "externalFeedDownloader"));
    objc_msgSend(v26, "startDownloadTaskForFeedURL:userInitiated:useBackgroundFetch:", v25, v10, v19);

  }
}

- (void)startDownloadForFeedUrl:(id)a3 cloudSyncFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 triggerBy:(id)a6 userInitiated:(BOOL)a7 useBackgroundFetch:(BOOL)a8 source:(int64_t)a9
{
  id v15;
  id v16;
  id v17;
  _QWORD *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  int64_t v26;
  int64_t v27;
  BOOL v28;
  BOOL v29;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  if (v15)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000E9FA0;
    v22[3] = &unk_1004AA8F8;
    v22[4] = self;
    v23 = v15;
    v26 = a5;
    v24 = v16;
    v28 = a7;
    v29 = a8;
    v25 = v17;
    v27 = a9;
    v18 = objc_retainBlock(v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager configuration](self, "configuration"));
    if (objc_msgSend(v19, "useBackgroundFetchForFeedDownloads"))
    {
      v20 = -[MTBaseFeedManager _shouldDownloadPodcastWithIdentifierFromStore:](self, "_shouldDownloadPodcastWithIdentifierFromStore:", a5);

      if ((v20 & 1) == 0)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager externalFeedDownloader](self, "externalFeedDownloader"));
        objc_msgSend(v21, "restoreBackgroundDownloadTasksWithCompletion:", v18);

LABEL_7:
        goto LABEL_8;
      }
    }
    else
    {

    }
    ((void (*)(_QWORD *))v18[2])(v18);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)startDownloadForPodcastStoreId:(int64_t)a3 triggerBy:(id)a4 feedUrl:(id)a5 useBackgroundFetch:(BOOL)a6 source:(int64_t)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  id v18;
  _QWORD v19[5];
  id v20;
  int64_t v21;
  BOOL v22;

  v8 = a6;
  v12 = a5;
  v13 = a4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager storePodcastDownloader](self, "storePodcastDownloader"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a3));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "absoluteString"));
  v17 = -[MTBaseFeedManager allowEpisodesRequestTo404AndDeleteEpisodesWithFeedUrl:](self, "allowEpisodesRequestTo404AndDeleteEpisodesWithFeedUrl:", v16);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000EA374;
  v19[3] = &unk_1004AA920;
  v19[4] = self;
  v20 = v12;
  v22 = v8;
  v21 = a7;
  v18 = v12;
  objc_msgSend(v14, "downloadPodcast:triggerBy:allowEpisodesTo404:isImplicitActionRequest:completion:", v15, v13, v17, v8, v19);

}

+ (void)purgeSubscriptionMetadata
{
  id v3;
  void *v4;

  v3 = (id)qword_1005674F8;
  objc_sync_enter(v3);
  v4 = (void *)qword_1005674F8;
  qword_1005674F8 = 0;

  objc_sync_exit(v3);
  objc_msgSend(a1, "saveSubscriptionMetadata");
}

+ (void)removeMetadataForPodcastUuid:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  if (v3)
  {
    v5 = v3;
    v4 = (id)qword_1005674F8;
    objc_sync_enter(v4);
    objc_msgSend((id)qword_1005674F8, "removeObjectForKey:", v5);
    objc_sync_exit(v4);

    v3 = v5;
  }

}

+ (void)saveSubscriptionMetadata
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;

  v3 = (id)qword_1005674F8;
  objc_sync_enter(v3);
  v4 = (void *)qword_1005674F8;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_metadataUrl"));
  v10 = 0;
  objc_msgSend(v4, "writeToURL:error:", v5, &v10);
  v6 = v10;

  if (v6)
  {
    v8 = _MTLogCategoryFeedUpdate(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v12 = a1;
      v13 = 2112;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@ failed to save hash cache due to %@", buf, 0x16u);
    }

  }
  objc_sync_exit(v3);

}

- (BOOL)isSubscribingWithFeedUrl:(id)a3
{
  return 0;
}

- (void)_addPendingFeedProcessingBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager feedProcessingQueue](self, "feedProcessingQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EA814;
  v7[3] = &unk_1004A63C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_processNextPendingFeedIfPossible
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager feedProcessingQueue](self, "feedProcessingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EA8D0;
  block[3] = &unk_1004A6200;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_queue_processNextPendingFeedIfPossible
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  int v20;
  id v21;

  v3 = objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager feedProcessingQueue](self, "feedProcessingQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager externalFeedDownloader](self, "externalFeedDownloader"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sessionCompletionHandler"));

  if (v5)
  {
    v7 = _MTLogCategoryFeedUpdate(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      v9 = "Postponing feed update because we're waiting to call the session completion handler";
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v20, 2u);
    }
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager pendingFeedProcessingBlocks](self, "pendingFeedProcessingBlocks"));
    v11 = objc_msgSend(v10, "count");

    if (!v11)
    {
      v19 = _MTLogCategoryFeedUpdate(v12);
      v8 = objc_claimAutoreleasedReturnValue(v19);
      if (!os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      LOWORD(v20) = 0;
      v9 = "There are no pending feed updates. Doing nothing.";
      goto LABEL_4;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager pendingFeedProcessingBlocks](self, "pendingFeedProcessingBlocks"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager pendingFeedProcessingBlocks](self, "pendingFeedProcessingBlocks"));
    objc_msgSend(v14, "removeObjectAtIndex:", 0);

    v15 = (*(uint64_t (**)(uint64_t))(v8 + 16))(v8);
    v16 = _MTLogCategoryFeedUpdate(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseFeedManager pendingFeedProcessingBlocks](self, "pendingFeedProcessingBlocks"));
      v20 = 134217984;
      v21 = objc_msgSend(v18, "count");
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Done processing feed. %lu remaining.", (uint8_t *)&v20, 0xCu);

    }
    -[MTBaseFeedManager _queue_processNextPendingFeedIfPossible](self, "_queue_processNextPendingFeedIfPossible");
  }
LABEL_11:

}

+ (BOOL)_fetchSmallestPicturePossible
{
  return 0;
}

+ (unint64_t)_maxArtworkSize
{
  return 3000;
}

+ (void)didStartUpdatingFeedUrl:(id)a3 cloudSyncUrl:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  id v14;
  const __CFString *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (id)qword_1005674F0;
  objc_sync_enter(v8);
  objc_msgSend((id)qword_1005674F0, "addObject:", v6);
  objc_sync_exit(v8);

  v15 = CFSTR("MTBaseFeedManagerFeedUrlKey");
  v16 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  objc_msgSend(a1, "postNotificationName:userInfo:", CFSTR("MTBaseFeedManagerDidStartUpdatingFeed"), v9);

  v11 = _MTLogCategoryFeedUpdate(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "didStartUpdatingFeedUrl: %@", (uint8_t *)&v13, 0xCu);
  }

}

- (void)_didFinishUpdatingFeedUrl:(id)a3 withError:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(self), "didFinishUpdatingFeedUrl:withError:", v7, v6);

}

+ (void)didFinishUpdatingFeedUrl:(id)a3 withError:(id)a4
{
  __CFString *v6;
  id v7;
  id v8;
  id v9;
  _BOOL4 v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  uint8_t buf[4];
  __CFString *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  unsigned int v26;

  v6 = (__CFString *)a3;
  v7 = a4;
  v8 = (id)qword_1005674F0;
  objc_sync_enter(v8);
  if (v6)
  {
    v9 = objc_msgSend((id)qword_1005674F0, "containsObject:", v6);
    if ((_DWORD)v9)
    {
      objc_msgSend((id)qword_1005674F0, "removeObject:", v6);
      v9 = objc_msgSend((id)qword_1005674F0, "count");
      v10 = v9 == 0;
      if (!v7)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](IMLogger, "sharedLogger"));
    objc_msgSend(v13, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Feed/MTBaseFeedManager.m", 1368, CFSTR("Feed update finished without a feedURL, likely failed."));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsAction finishedWithoutURL](MTFeedUpdateMetricsAction, "finishedWithoutURL"));
    +[IMMetrics recordUserAction:](IMMetrics, "recordUserAction:", v14);

  }
  v10 = 0;
  if (!v7)
  {
LABEL_4:
    v11 = _MTLogCategoryFeedUpdate(v9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v22 = v6;
      v23 = 1024;
      LODWORD(v24) = objc_msgSend((id)qword_1005674F0, "count");
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "didFinishUpdatingFeedUrl: %@, remaining count = %d", buf, 0x12u);
    }
    goto LABEL_10;
  }
LABEL_8:
  v15 = _MTLogCategoryFeedUpdate(v9);
  v12 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedDescription"));
    *(_DWORD *)buf = 138412802;
    v22 = v6;
    v23 = 2112;
    v24 = v16;
    v25 = 1024;
    v26 = objc_msgSend((id)qword_1005674F0, "count");
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "didFinishUpdatingFeedUrl: %@, with error: %@, remaining count = %d", buf, 0x1Cu);

  }
LABEL_10:

  objc_sync_exit(v8);
  if (v6)
    v17 = v6;
  else
    v17 = &stru_1004C6D40;
  v19 = CFSTR("MTBaseFeedManagerFeedUrlKey");
  v20 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
  objc_msgSend(a1, "postNotificationName:userInfo:", CFSTR("MTBaseFeedManagerDidEndUpdatingFeed"), v18);

  if (v10)
    objc_msgSend(a1, "didFinishUpdatingAllFeeds:", 1);

}

+ (void)didFinishUpdatingAllFeeds:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = a3;
  if (!objc_msgSend(a1, "updatingCount"))
  {
    v5 = objc_msgSend(a1, "postNotificationName:userInfo:", CFSTR("MTBaseFeedManagerDidEndUpdatingAllFeeds"), 0);
    if (v3)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTNotificationManager sharedInstance](MTNotificationManager, "sharedInstance"));
      objc_msgSend(v6, "processNotificationsWithReason:", CFSTR("Feed Update"));

    }
    v7 = _MTLogCategoryFeedUpdate(v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "didFinishUpdatingAllFeeds", v9, 2u);
    }

  }
}

+ (void)postNotificationName:(id)a3 userInfo:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EB088;
  v7[3] = &unk_1004A6640;
  v8 = a3;
  v9 = a4;
  v5 = v9;
  v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

}

+ (void)standardDeviationForEpisodes:(id)a3 standardDeviation:(double *)a4 average:(double *)a5
{
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  void *v24;
  double v25;
  uint64_t v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  id v33;

  v33 = a3;
  *a4 = 0.0;
  *a5 = 0.0;
  v7 = objc_opt_new(NSMutableArray);
  v8 = objc_msgSend(v33, "count");
  if ((uint64_t)v8 - 1 >= 1)
  {
    v9 = v8;
    v10 = 1;
    do
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectAtIndex:", v10 - 1));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pubDate"));
      objc_msgSend(v12, "timeIntervalSinceReferenceDate");
      v14 = v13;

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectAtIndex:", v10));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pubDate"));
      objc_msgSend(v16, "timeIntervalSinceReferenceDate");
      v18 = v17;

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", vabdd_f64(v14, v18)));
      -[NSMutableArray addObject:](v7, "addObject:", v19);

      ++v10;
    }
    while (v9 != (id)v10);
    v20 = (uint64_t)-[NSMutableArray count](v7, "count");
    v21 = v20;
    if (v20 < 1)
    {
      if (v20)
        *a5 = 0.0 / (double)v20;
    }
    else
    {
      v22 = 0;
      v23 = 0.0;
      do
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v7, "objectAtIndex:", v22));
        objc_msgSend(v24, "doubleValue");
        v23 = v23 + v25;

        ++v22;
      }
      while (v21 != v22);
      *a5 = v23 / (double)v21;
      if (v21 >= 1)
      {
        v26 = 0;
        v27 = 0.0;
        do
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v7, "objectAtIndex:", v26));
          objc_msgSend(v28, "doubleValue");
          v30 = v29 - *a5;
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v7, "objectAtIndex:", v26));
          objc_msgSend(v31, "doubleValue");
          v27 = v27 + v30 * (v32 - *a5);

          ++v26;
        }
        while (v21 != v26);
        if (v21 > 1)
          *a4 = sqrt(v27 / (double)(v21 - 1));
      }
    }
  }

}

- (MTLegacyDownloadManagerProtocol)downloadManager
{
  return self->_downloadManager;
}

- (MTExternalFeedDownloader)externalFeedDownloader
{
  return self->_externalFeedDownloader;
}

- (_TtC18PodcastsFoundation21PodcastFeedDownloader)storePodcastDownloader
{
  return self->_storePodcastDownloader;
}

- (NSMutableArray)pendingFeedProcessingBlocks
{
  return self->_pendingFeedProcessingBlocks;
}

- (void)setPendingFeedProcessingBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_pendingFeedProcessingBlocks, a3);
}

- (OS_dispatch_queue)feedProcessingQueue
{
  return self->_feedProcessingQueue;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_feedProcessingQueue, 0);
  objc_storeStrong((id *)&self->_pendingFeedProcessingBlocks, 0);
  objc_storeStrong((id *)&self->_storePodcastDownloader, 0);
  objc_storeStrong((id *)&self->_externalFeedDownloader, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);
}

@end
