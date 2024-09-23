@implementation BKDebugViewController

+ (id)serviceCenter
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "serviceCenter"));

  return v3;
}

+ (id)resolver
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "containerHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bridgedResolver"));

  return v4;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKDebugViewController;
  -[BKDebugViewController viewDidLoad](&v3, "viewDidLoad");
  -[BKDebugViewController setupNavigationBar](self, "setupNavigationBar");
  -[BKDebugViewController setupForTableView](self, "setupForTableView");
}

- (unint64_t)supportedInterfaceOrientations
{
  if (isPad(self, a2))
    return 30;
  else
    return 2;
}

- (void)setupNavigationBar
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDebugViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v3, "setTitle:", CFSTR("iBooks Debugging (Release Build)"));

  v4 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", CFSTR("Close"), 2, self, "_close:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKDebugViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v5, "setLeftBarButtonItem:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle internalExtrasBundle](NSBundle, "internalExtrasBundle"));
  if (v6)
  {
    v8 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", CFSTR("Tea"), 2, self, "_presentTeaDebugViewController:");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKDebugViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v7, "setRightBarButtonItem:", v8);

  }
}

- (void)setupForTableView
{
  BKDebugBoolDefaultSwitch *v3;
  UISwitch *enableChapterAnimationSwitch;
  BKDebugBoolDefaultSwitch *v5;
  UISwitch *enablePageTurnDebugging;
  void *v7;
  NSArray *lightLevelTitles;
  BKDebugBoolDefaultSwitch *v9;
  UISwitch *v10;
  UISwitch *nightModeSwitch;
  BKDebugBoolDefaultSwitch *v12;
  UISwitch *nightModeDelaySwitch;
  BKDebugBoolDefaultSwitch *v14;
  UISwitch *endOfBookDebugMenuSwitch;
  BKDebugBoolDefaultSwitch *v16;
  UISwitch *v17;
  UISwitch *oldFontStepsAndSpacingSwitch;
  BKDebugBoolDefaultSwitch *v19;
  UISwitch *reiLayoutGuidesSwitch;
  BKDebugBoolDefaultSwitch *v21;
  UISwitch *v22;
  UISwitch *curlAnimationSwitch;
  BKDebugBoolDefaultSwitch *v24;
  UISwitch *reiShowPaginatingWebViewSwitch;
  BKDebugBoolDefaultSwitch *v26;
  UISwitch *reiIgnoreCacheSwitch;
  BKDebugBoolDefaultSwitch *v28;
  UISwitch *alwaysParseEpubSwitch;
  BKDebugBoolDefaultSwitch *v30;
  UISwitch *reiLogContentSizeSwitch;
  BKDebugBoolDefaultSwitch *v32;
  UISwitch *reiAllowScrollMacOSSwitch;
  BKDebugBoolDefaultSwitch *v34;
  UISwitch *reiDisableAutoFontDownloadSwitch;
  BKDebugBoolDefaultSwitch *v36;
  UISwitch *reiUseNewTextStylingSwitch;
  BKDebugBoolDefaultSwitch *v38;
  UISwitch *reiContentSizeLogging;
  void *v40;
  void *v41;
  NSString *v42;
  NSString *bootUrl;
  void *v44;
  NSString *v45;
  NSString *coverCacheHashOrAdamID;
  BKDebugBoolDefaultSwitch *v47;
  UISwitch *v48;
  UISwitch *productPageSlowModeSwitch;
  BKDebugBoolDefaultSwitch *v50;
  UISwitch *v51;
  UISwitch *productPageSlideSwitch;
  void *v53;
  void *v54;
  BKDebugBoolDefaultSwitch *v55;
  void *v56;
  id v57;
  id v58;
  UISwitch *v59;
  UISwitch *localSignalCollectionEnabledSwitch;
  BKDebugBoolDefaultSwitch *v61;
  void *v62;
  id v63;
  UISwitch *v64;
  UISwitch *localSignalSyncEnabledSwitch;
  BKDebugBoolDefaultSwitch *v66;
  UISwitch *debugODPClusteringSwitch;
  objc_class *v68;
  Class isa;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  Class v76;
  void *v77;
  BKDebugBoolDefaultSwitch *v78;
  BKDebugBoolDefaultSwitch *v79;
  UISwitch *appAnalyticsDebugProcessorModeSwitch;
  BKDebugBoolDefaultSwitch *v81;
  BKDebugBoolDefaultSwitch *v82;
  UISwitch *webSetAcceleratedDrawingDisabledSwitch;
  BKDebugBoolDefaultSwitch *v84;
  BKDebugBoolDefaultSwitch *v85;
  UISwitch *webSetDrawBordersSwitch;
  BKDebugBoolDefaultSwitch *v87;
  UISwitch *uipBookViewFallback;
  BKDebugBoolDefaultSwitch *v89;
  UISwitch *slowModeSwitch;
  BKDebugBoolDefaultSwitch *v91;
  void *v92;
  BKDebugBoolDefaultSwitch *v93;
  UISwitch *layoutDebugSwitch;
  NSArray *sessionStartOffsets;
  BKDebugBoolDefaultSwitch *v96;
  UISwitch *booksUIDebugModifiersEnabledSwitch;
  BKDebugBoolDefaultSwitch *v98;
  UISwitch *bookAnalyticsOverlayImpressionsEnabledSwitch;
  BKDebugBoolDefaultSwitch *v100;
  UISwitch *booksUIShelfGridDebugUIEnabledSwitch;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  BKDebugBoolDefaultSwitch *v127;
  void *v128;
  BKDebugBoolDefaultSwitch *v129;
  void *v130;
  void *v131;
  void *v132;
  id v133;
  id v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  id v148;
  uint64_t v149;
  void *i;
  uint64_t v151;
  void *v152;
  BKDebugBoolDefaultSwitch *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  DebugViewControllerPriceTracking *v178;
  DebugViewControllerPriceTracking *priceTracking;
  DebugViewControllerRemoteConfig *v180;
  DebugViewControllerRemoteConfig *remoteConfig;
  BKDebugViewSection *v182;
  BKDebugViewSection *v183;
  BKDebugViewSection *v184;
  BKDebugViewSection *v185;
  BKDebugViewSection *v186;
  BKDebugViewSection *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  NSArray *v192;
  NSArray *sections;
  void *v194;
  id v195;
  id v196;
  id v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  id *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  id *v207;
  id *v208;
  id *v209;
  id *v210;
  id *v211;
  id *v212;
  id *v213;
  id *v214;
  id *v215;
  id *v216;
  id *v217;
  id *v218;
  id *v219;
  id *v220;
  id *v221;
  id *v222;
  id *v223;
  id *v224;
  id *v225;
  id *v226;
  id *v227;
  id *v228;
  id *v229;
  id *v230;
  id *v231;
  id *v232;
  id *v233;
  id *v234;
  void *v235;
  void *v236;
  BKDebugViewSection *v237;
  void *v238;
  void *v239;
  BKDebugViewSection *v240;
  void *v241;
  void *v242;
  id v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  BKDebugViewSection *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  BKDebugViewSection *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
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
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  BKDebugViewController *val;
  _QWORD v299[4];
  id v300;
  _QWORD v301[4];
  id v302;
  _QWORD v303[4];
  id v304;
  _QWORD v305[4];
  id v306;
  _QWORD v307[4];
  id v308;
  _QWORD v309[4];
  id v310;
  _QWORD v311[4];
  id v312;
  _QWORD v313[4];
  id v314;
  _QWORD v315[4];
  id v316;
  _QWORD v317[4];
  id v318;
  _QWORD v319[4];
  id v320;
  _QWORD v321[4];
  id v322;
  _QWORD v323[4];
  id v324;
  _QWORD v325[4];
  id v326;
  _QWORD v327[4];
  id v328;
  _QWORD v329[4];
  id v330;
  __int128 v331;
  __int128 v332;
  __int128 v333;
  __int128 v334;
  _QWORD v335[4];
  id v336;
  _QWORD v337[4];
  id v338;
  _QWORD v339[4];
  id v340;
  _QWORD v341[4];
  id v342;
  _QWORD v343[4];
  id v344;
  _QWORD v345[4];
  id v346;
  _QWORD v347[4];
  id v348;
  _QWORD v349[4];
  id v350;
  _QWORD v351[4];
  id v352;
  _QWORD v353[4];
  id v354;
  id location;
  _QWORD v356[4];
  id v357;
  id v358;
  _QWORD v359[4];
  id v360;
  _QWORD v361[4];
  id v362;
  _QWORD v363[5];
  _QWORD v364[11];
  _QWORD v365[10];
  _QWORD v366[6];
  void *v367;
  void *v368;
  _QWORD v369[2];
  _BYTE v370[128];
  _QWORD v371[19];
  _QWORD v372[19];
  void *v373;
  _QWORD v374[4];
  _QWORD v375[21];
  _QWORD v376[20];

  v3 = -[BKDebugBoolDefaultSwitch initWithDefaultsKey:]([BKDebugBoolDefaultSwitch alloc], "initWithDefaultsKey:", CFSTR("kREIChapterAnimationEnabled"));
  enableChapterAnimationSwitch = self->_enableChapterAnimationSwitch;
  self->_enableChapterAnimationSwitch = &v3->super;

  v5 = -[BKDebugBoolDefaultSwitch initWithDefaultsKey:action:]([BKDebugBoolDefaultSwitch alloc], "initWithDefaultsKey:action:", CFSTR("kPageTurnSnapshotDebug"), &stru_1008EA588);
  enablePageTurnDebugging = self->_enablePageTurnDebugging;
  val = self;
  self->_enablePageTurnDebugging = &v5->super;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  self->_currentLightLevel = (unint64_t)objc_msgSend(v7, "integerForKey:", kOverrideLightLevel);

  lightLevelTitles = self->_lightLevelTitles;
  self->_lightLevelTitles = (NSArray *)&off_10092F5E0;

  v9 = [BKDebugBoolDefaultSwitch alloc];
  v363[0] = _NSConcreteStackBlock;
  v363[1] = 3221225472;
  v363[2] = sub_1000DF82C;
  v363[3] = &unk_1008E77C8;
  v363[4] = self;
  v10 = -[BKDebugBoolDefaultSwitch initWithDefaultsKey:action:](v9, "initWithDefaultsKey:action:", kOverrideNightMode, v363);
  nightModeSwitch = self->_nightModeSwitch;
  self->_nightModeSwitch = v10;

  v12 = -[BKDebugBoolDefaultSwitch initWithDefaultsKey:]([BKDebugBoolDefaultSwitch alloc], "initWithDefaultsKey:", CFSTR("BCShouldOverrideNightModeDelay"));
  nightModeDelaySwitch = self->_nightModeDelaySwitch;
  self->_nightModeDelaySwitch = &v12->super;

  v14 = -[BKDebugBoolDefaultSwitch initWithDefaultsKey:]([BKDebugBoolDefaultSwitch alloc], "initWithDefaultsKey:", CFSTR("BKAllowEndOfBookDebugMenu"));
  endOfBookDebugMenuSwitch = self->_endOfBookDebugMenuSwitch;
  self->_endOfBookDebugMenuSwitch = &v14->super;

  v16 = [BKDebugBoolDefaultSwitch alloc];
  v17 = -[BKDebugBoolDefaultSwitch initWithDefaultsKey:](v16, "initWithDefaultsKey:", BKUseOldFontStepsAndSpacing);
  oldFontStepsAndSpacingSwitch = self->_oldFontStepsAndSpacingSwitch;
  self->_oldFontStepsAndSpacingSwitch = v17;

  v19 = -[BKDebugBoolDefaultSwitch initWithDefaultsKey:]([BKDebugBoolDefaultSwitch alloc], "initWithDefaultsKey:", CFSTR("kREILayoutGuides"));
  reiLayoutGuidesSwitch = self->_reiLayoutGuidesSwitch;
  self->_reiLayoutGuidesSwitch = &v19->super;

  v21 = [BKDebugBoolDefaultSwitch alloc];
  v22 = -[BKDebugBoolDefaultSwitch initWithDefaultsKey:](v21, "initWithDefaultsKey:", BKUseLegacyCurlAnimation);
  curlAnimationSwitch = self->_curlAnimationSwitch;
  self->_curlAnimationSwitch = v22;

  v24 = -[BKDebugBoolDefaultSwitch initWithDefaultsKey:]([BKDebugBoolDefaultSwitch alloc], "initWithDefaultsKey:", CFSTR("REI.ShowPaginatingWebView"));
  reiShowPaginatingWebViewSwitch = self->_reiShowPaginatingWebViewSwitch;
  self->_reiShowPaginatingWebViewSwitch = &v24->super;

  v26 = -[BKDebugBoolDefaultSwitch initWithDefaultsKey:]([BKDebugBoolDefaultSwitch alloc], "initWithDefaultsKey:", CFSTR("REI.IgnoreCache"));
  reiIgnoreCacheSwitch = self->_reiIgnoreCacheSwitch;
  self->_reiIgnoreCacheSwitch = &v26->super;

  v28 = -[BKDebugBoolDefaultSwitch initWithDefaultsKey:]([BKDebugBoolDefaultSwitch alloc], "initWithDefaultsKey:", CFSTR("_BEAlwaysFullParse"));
  alwaysParseEpubSwitch = self->_alwaysParseEpubSwitch;
  self->_alwaysParseEpubSwitch = &v28->super;

  v30 = -[BKDebugBoolDefaultSwitch initWithDefaultsKey:]([BKDebugBoolDefaultSwitch alloc], "initWithDefaultsKey:", CFSTR("REI.LogContentSize"));
  reiLogContentSizeSwitch = self->_reiLogContentSizeSwitch;
  self->_reiLogContentSizeSwitch = &v30->super;

  v32 = -[BKDebugBoolDefaultSwitch initWithDefaultsKey:]([BKDebugBoolDefaultSwitch alloc], "initWithDefaultsKey:", CFSTR("REI.AllowMacOSScroll"));
  reiAllowScrollMacOSSwitch = self->_reiAllowScrollMacOSSwitch;
  self->_reiAllowScrollMacOSSwitch = &v32->super;

  v34 = -[BKDebugBoolDefaultSwitch initWithDefaultsKey:]([BKDebugBoolDefaultSwitch alloc], "initWithDefaultsKey:", CFSTR("REI.DisableAutoFontDownload"));
  reiDisableAutoFontDownloadSwitch = self->_reiDisableAutoFontDownloadSwitch;
  self->_reiDisableAutoFontDownloadSwitch = &v34->super;

  v36 = -[BKDebugBoolDefaultSwitch initWithDefaultsKey:]([BKDebugBoolDefaultSwitch alloc], "initWithDefaultsKey:", CFSTR("REIUseOldTextStyling"));
  reiUseNewTextStylingSwitch = self->_reiUseNewTextStylingSwitch;
  self->_reiUseNewTextStylingSwitch = &v36->super;

  v38 = -[BKDebugBoolDefaultSwitch initWithDefaultsKey:]([BKDebugBoolDefaultSwitch alloc], "initWithDefaultsKey:", CFSTR("REI.LogContentSize"));
  reiContentSizeLogging = self->_reiContentSizeLogging;
  self->_reiContentSizeLogging = &v38->super;

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "environment"));
  v42 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "bootURL"));
  bootUrl = self->_bootUrl;
  self->_bootUrl = v42;

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v45 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "stringForKey:", kAllowsCoverCacheImagesLoggingUserDefaultsKey));
  coverCacheHashOrAdamID = self->_coverCacheHashOrAdamID;
  self->_coverCacheHashOrAdamID = v45;

  v47 = [BKDebugBoolDefaultSwitch alloc];
  v48 = -[BKDebugBoolDefaultSwitch initWithDefaultsKey:](v47, "initWithDefaultsKey:", BCCardStackTransitionAnimatorSlowModeEnabledUserDefaultsKey);
  productPageSlowModeSwitch = self->_productPageSlowModeSwitch;
  self->_productPageSlowModeSwitch = v48;

  v50 = [BKDebugBoolDefaultSwitch alloc];
  v51 = -[BKDebugBoolDefaultSwitch initWithDefaultsKey:](v50, "initWithDefaultsKey:", BCCardStackTransitionForceSlideAnimationUserDefaultsKey);
  productPageSlideSwitch = self->_productPageSlideSwitch;
  self->_productPageSlideSwitch = v51;

  v53 = (void *)objc_claimAutoreleasedReturnValue(+[BRCConfigurationManager sharedInstance](BRCConfigurationManager, "sharedInstance"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[BCRCDataContainer defaultContainer](BCRCDataContainer, "defaultContainer"));
  v291 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "configs"));

  v55 = [BKDebugBoolDefaultSwitch alloc];
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v291, "valueForKeyPath:", BRCBooksDefaultsKeyPersonalizationLocalSignalCollectionEnabled));
  v57 = objc_msgSend(v56, "BOOLValue");
  v361[0] = _NSConcreteStackBlock;
  v361[1] = 3221225472;
  v361[2] = sub_1000DF84C;
  v361[3] = &unk_1008E77C8;
  v58 = v53;
  v362 = v58;
  v59 = -[BKDebugBoolDefaultSwitch initWithInitialValue:synchronize:](v55, "initWithInitialValue:synchronize:", v57, v361);
  localSignalCollectionEnabledSwitch = self->_localSignalCollectionEnabledSwitch;
  self->_localSignalCollectionEnabledSwitch = v59;

  v61 = [BKDebugBoolDefaultSwitch alloc];
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v291, "valueForKeyPath:", BRCBooksDefaultsKeyPersonalizationLocalSignalSyncEnabled));
  v63 = objc_msgSend(v62, "BOOLValue");
  v359[0] = _NSConcreteStackBlock;
  v359[1] = 3221225472;
  v359[2] = sub_1000DF8F0;
  v359[3] = &unk_1008E77C8;
  v197 = v58;
  v360 = v197;
  v64 = -[BKDebugBoolDefaultSwitch initWithInitialValue:synchronize:](v61, "initWithInitialValue:synchronize:", v63, v359);
  localSignalSyncEnabledSwitch = self->_localSignalSyncEnabledSwitch;
  self->_localSignalSyncEnabledSwitch = v64;

  v66 = -[BKDebugBoolDefaultSwitch initWithDefaultsKey:]([BKDebugBoolDefaultSwitch alloc], "initWithDefaultsKey:", CFSTR("BKDebugODPClusteringEnabled"));
  debugODPClusteringSwitch = self->_debugODPClusteringSwitch;
  self->_debugODPClusteringSwitch = &v66->super;

  v68 = (objc_class *)objc_alloc_init((Class)UISwitch);
  self = (BKDebugViewController *)((char *)self + 392);
  isa = self->super.super.super.super.isa;
  self->super.super.super.super.isa = v68;

  v70 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", CFSTR("Toggle Fake Player"), 0, "books_internal_toggleFakePlayer:", 0));
  v71 = objc_opt_class(UIResponder);
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "targetForAction:withSender:", objc_msgSend(v70, "action"), v70));
  v74 = BUDynamicCast(v71, v73);
  v75 = (void *)objc_claimAutoreleasedReturnValue(v74);

  objc_msgSend(v75, "validateCommand:", v70);
  -[objc_class setOn:](self->super.super.super.super.isa, "setOn:", objc_msgSend(v70, "state") == (id)1);
  v76 = self->super.super.super.super.isa;
  v356[0] = _NSConcreteStackBlock;
  v356[1] = 3221225472;
  v356[2] = sub_1000DF994;
  v356[3] = &unk_1008EA5B0;
  v196 = v75;
  v357 = v196;
  v195 = v70;
  v358 = v195;
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v356));
  -[objc_class addAction:forControlEvents:](v76, "addAction:forControlEvents:", v77, 4096);

  v78 = [BKDebugBoolDefaultSwitch alloc];
  v79 = -[BKDebugBoolDefaultSwitch initWithDefaultsKey:](v78, "initWithDefaultsKey:", BAAppAnalyticsUseDebugProcessor);
  appAnalyticsDebugProcessorModeSwitch = val->_appAnalyticsDebugProcessorModeSwitch;
  val->_appAnalyticsDebugProcessorModeSwitch = &v79->super;

  objc_initWeak(&location, val);
  v81 = [BKDebugBoolDefaultSwitch alloc];
  v82 = -[BKDebugBoolDefaultSwitch initWithDefaultsKey:action:](v81, "initWithDefaultsKey:action:", BKDisableAccleratedWebRendering, &stru_1008EA5D0);
  webSetAcceleratedDrawingDisabledSwitch = val->_webSetAcceleratedDrawingDisabledSwitch;
  val->_webSetAcceleratedDrawingDisabledSwitch = &v82->super;

  v84 = [BKDebugBoolDefaultSwitch alloc];
  v85 = -[BKDebugBoolDefaultSwitch initWithDefaultsKey:](v84, "initWithDefaultsKey:", BKWebDrawBorders);
  webSetDrawBordersSwitch = val->_webSetDrawBordersSwitch;
  val->_webSetDrawBordersSwitch = &v85->super;

  v87 = -[BKDebugBoolDefaultSwitch initWithDefaultsKey:]([BKDebugBoolDefaultSwitch alloc], "initWithDefaultsKey:", CFSTR("BKBookOpenAnimatorRedViewFallbackEnabled"));
  uipBookViewFallback = val->_uipBookViewFallback;
  val->_uipBookViewFallback = &v87->super;

  v89 = -[BKDebugBoolDefaultSwitch initWithDefaultsKey:]([BKDebugBoolDefaultSwitch alloc], "initWithDefaultsKey:", CFSTR("BKBookOpenAnimatorSlowModeEnabled"));
  slowModeSwitch = val->_slowModeSwitch;
  val->_slowModeSwitch = &v89->super;

  v91 = [BKDebugBoolDefaultSwitch alloc];
  v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v93 = -[BKDebugBoolDefaultSwitch initWithInitialValue:synchronize:action:](v91, "initWithInitialValue:synchronize:action:", objc_msgSend(v92, "BOOLForKey:", CFSTR("BKLibraryBookshelfLayoutDebugEnabledUserDefaultsKey")), 0, &stru_1008EA5F0);
  layoutDebugSwitch = val->_layoutDebugSwitch;
  val->_layoutDebugSwitch = &v93->super;

  sessionStartOffsets = val->_sessionStartOffsets;
  val->_sessionStartOffsets = (NSArray *)&off_10092F5F8;

  v96 = -[BKDebugBoolDefaultSwitch initWithDefaultsKey:]([BKDebugBoolDefaultSwitch alloc], "initWithDefaultsKey:", CFSTR("BooksUIEnableDebugModifiers"));
  booksUIDebugModifiersEnabledSwitch = val->_booksUIDebugModifiersEnabledSwitch;
  val->_booksUIDebugModifiersEnabledSwitch = &v96->super;

  v98 = -[BKDebugBoolDefaultSwitch initWithDefaultsKey:]([BKDebugBoolDefaultSwitch alloc], "initWithDefaultsKey:", CFSTR("BookAnalyticsOverlayImpressions"));
  bookAnalyticsOverlayImpressionsEnabledSwitch = val->_bookAnalyticsOverlayImpressionsEnabledSwitch;
  val->_bookAnalyticsOverlayImpressionsEnabledSwitch = &v98->super;

  v100 = -[BKDebugBoolDefaultSwitch initWithDefaultsKey:]([BKDebugBoolDefaultSwitch alloc], "initWithDefaultsKey:", CFSTR("BooksUIShelfGridDebugUIEnabled"));
  booksUIShelfGridDebugUIEnabledSwitch = val->_booksUIShelfGridDebugUIEnabledSwitch;
  val->_booksUIShelfGridDebugUIEnabledSwitch = &v100->super;

  -[BKDebugViewController _loadDefaults](val, "_loadDefaults");
  v102 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "environment"));
  v204 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "appVersion"));

  v353[0] = _NSConcreteStackBlock;
  v353[1] = 3221225472;
  v353[2] = sub_1000DFA60;
  v353[3] = &unk_1008EA618;
  objc_copyWeak(&v354, &location);
  v292 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:action:](BKDebugViewEntry, "entryWithTitle:action:", CFSTR("REI: Edit Chrome"), v353));
  v376[0] = v292;
  v285 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_enableChapterAnimationSwitch));
  v280 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("REI: Use chapter scrubbing animation"), v285));
  v376[1] = v280;
  v275 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_enablePageTurnDebugging));
  v271 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("REI: Page Turn Debug Layers (Quits Immediately)"), v275));
  v376[2] = v271;
  v198 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_nightModeSwitch));
  v200 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Light Level: Override"), v198));
  v376[3] = v200;
  v351[0] = _NSConcreteStackBlock;
  v351[1] = 3221225472;
  v351[2] = sub_1000DFA8C;
  v351[3] = &unk_1008EA640;
  objc_copyWeak(&v352, &location);
  v104 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithDetailLineBreakMode:detailTextBlock:](BKDebugViewCellModel, "modelWithDetailLineBreakMode:detailTextBlock:", 4, v351));
  v349[0] = _NSConcreteStackBlock;
  v349[1] = 3221225472;
  v349[2] = sub_1000DFAFC;
  v349[3] = &unk_1008EA618;
  objc_copyWeak(&v350, &location);
  v267 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:action:](BKDebugViewEntry, "entryWithTitle:model:action:", CFSTR("Light Level: Set"), v104, v349));
  v376[4] = v267;
  v262 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Light Level: Delay %d sec before update"), 5));
  v257 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_nightModeDelaySwitch));
  v252 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", v262, v257));
  v376[5] = v252;
  v248 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_oldFontStepsAndSpacingSwitch));
  v244 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Use Old Font Sizes & Spacing"), v248));
  v376[6] = v244;
  v241 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_endOfBookDebugMenuSwitch));
  v238 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Allow End of Book Debug menu"), v241));
  v376[7] = v238;
  v235 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_reiLayoutGuidesSwitch));
  v233 = (id *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Show REI Layout guides"), v235));
  v376[8] = v233;
  v231 = (id *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_reiShowPaginatingWebViewSwitch));
  v229 = (id *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Show paginating web view"), v231));
  v376[9] = v229;
  v227 = (id *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_reiLogContentSizeSwitch));
  v225 = (id *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Log webView.scrollView.contentSize results (Log has #sizeResult:)"), v227));
  v376[10] = v225;
  v223 = (id *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_alwaysParseEpubSwitch));
  v221 = (id *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Always Paginate in REI Reader (Ignore pagination cache)"), v223));
  v376[11] = v221;
  v219 = (id *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_reiIgnoreCacheSwitch));
  v217 = (id *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Always Parse EPUBs"), v219));
  v376[12] = v217;
  v215 = (id *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_reiAllowScrollMacOSSwitch));
  v213 = (id *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Allow scroll mode on macOS"), v215));
  v376[13] = v213;
  v211 = (id *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_reiDisableAutoFontDownloadSwitch));
  v209 = (id *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Disable Auto Font Download"), v211));
  v376[14] = v209;
  v207 = (id *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_reiUseNewTextStylingSwitch));
  v205 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Use Old Text Styling (Must Reopen Book)"), v207));
  v376[15] = v205;
  v105 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_reiContentSizeLogging));
  v106 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Enable Content Size logging"), v105));
  v376[16] = v106;
  v107 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_curlAnimationSwitch));
  v108 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Use Legacy Page Curl animation"), v107));
  v376[17] = v108;
  v109 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_webSetDrawBordersSwitch));
  v110 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("WebKit Draw Borders"), v109));
  v376[18] = v110;
  v111 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_webSetAcceleratedDrawingDisabledSwitch));
  v112 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Disable WebKit Accelerated Drawing (Quits Immediately)"), v111));
  v376[19] = v112;
  v203 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v376, 20));

  v293 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryType:](BKDebugViewCellModel, "modelWithAccessoryType:", 1));
  v347[0] = _NSConcreteStackBlock;
  v347[1] = 3221225472;
  v347[2] = sub_1000DFB28;
  v347[3] = &unk_1008EA618;
  objc_copyWeak(&v348, &location);
  v113 = objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:action:](BKDebugViewEntry, "entryWithTitle:model:action:", CFSTR("Widgets Showroom"), v293, v347));
  v375[0] = v113;
  v286 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryType:](BKDebugViewCellModel, "modelWithAccessoryType:", 1));
  v201 = (void *)v113;
  v345[0] = _NSConcreteStackBlock;
  v345[1] = 3221225472;
  v345[2] = sub_1000DFB98;
  v345[3] = &unk_1008EA618;
  objc_copyWeak(&v346, &location);
  v199 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:action:](BKDebugViewEntry, "entryWithTitle:model:action:", CFSTR("Figaro Metrics"), v286, v345));
  v375[1] = v199;
  v343[0] = _NSConcreteStackBlock;
  v343[1] = 3221225472;
  v343[2] = sub_1000DFBFC;
  v343[3] = &unk_1008EA640;
  objc_copyWeak(&v344, &location);
  v281 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithDetailLineBreakMode:detailTextBlock:](BKDebugViewCellModel, "modelWithDetailLineBreakMode:detailTextBlock:", 5, v343));
  v276 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("JS App URL"), v281));
  v375[2] = v276;
  v272 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_hotReloadModeSwitch));
  v268 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Hot Reload Mode (Requires Debug Build)"), v272));
  v375[3] = v268;
  v263 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_launchWithBundleJSSwitch));
  v258 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Launch with bundle JS"), v263));
  v375[4] = v258;
  v253 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_allowUnsignedJetpackSwitch));
  v249 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Allow Unsigned Jetpack"), v253));
  v375[5] = v249;
  v245 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_loadBundledJetPackFromJSRootSwitch));
  v242 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Load Bundled JetPack from JSRoot"), v245));
  v375[6] = v242;
  v239 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_productPageSlowModeSwitch));
  v236 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Product Page: Slow Mode"), v239));
  v375[7] = v236;
  v234 = (id *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_productPageSlideSwitch));
  v232 = (id *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Product Page: Always Use Slide Animation"), v234));
  v375[8] = v232;
  v114 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_productPageSampleFeedbackShownSwitch));
  v202 = (id *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Product Page: Sample Feedback Shown"), v114));
  v375[9] = v202;
  v341[0] = _NSConcreteStackBlock;
  v341[1] = 3221225472;
  v341[2] = sub_1000DFC34;
  v341[3] = &unk_1008EA618;
  objc_copyWeak(&v342, &location);
  v230 = (id *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:action:](BKDebugViewEntry, "entryWithTitle:action:", CFSTR("Product Page: Remote Configuration"), v341));
  v375[10] = v230;
  v228 = (id *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_localSignalCollectionEnabledSwitch));
  v226 = (id *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Personalization: Local Signal Collection"), v228));
  v375[11] = v226;
  v224 = (id *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_localSignalSyncEnabledSwitch));
  v222 = (id *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Personalization: Local Signal Sync"), v224));
  v375[12] = v222;
  v220 = (id *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_dontShowDisabledSwitch));
  v218 = (id *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Personalization: Disable Don't Show"), v220));
  v375[13] = v218;
  v216 = (id *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryType:](BKDebugViewCellModel, "modelWithAccessoryType:", 0));
  v214 = (id *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:action:](BKDebugViewEntry, "entryWithTitle:model:action:", CFSTR("Personalization: Trigger Sync from Cloud"), v216, &stru_1008EA680));
  v375[14] = v214;
  v212 = (id *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryType:](BKDebugViewCellModel, "modelWithAccessoryType:", 0));
  v115 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:action:](BKDebugViewEntry, "entryWithTitle:model:action:", CFSTR("Personalization: Trigger Sync to Cloud"), v212, &stru_1008EA6A0));
  v375[15] = v115;
  v210 = (id *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryType:](BKDebugViewCellModel, "modelWithAccessoryType:", 1));
  v339[0] = _NSConcreteStackBlock;
  v339[1] = 3221225472;
  v339[2] = sub_1000DFD80;
  v339[3] = &unk_1008EA618;
  objc_copyWeak(&v340, &location);
  v208 = (id *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:action:](BKDebugViewEntry, "entryWithTitle:model:action:", CFSTR("Personalization: Stress Test Local Signals"), v210, v339));
  v375[16] = v208;
  v116 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_debugODPClusteringSwitch));
  v117 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Personalization: Debug ODP Clustering"), v116));
  v375[17] = v117;
  v118 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_booksUIDebugModifiersEnabledSwitch));
  v119 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("BooksUI: Debug Modifiers Enabled"), v118));
  v375[18] = v119;
  v120 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_booksUIShelfGridDebugUIEnabledSwitch));
  v121 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("BooksUI: Debug ShelfGrid UI Enabled"), v120));
  v375[19] = v121;
  v122 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_bookAnalyticsOverlayImpressionsEnabledSwitch));
  v123 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Book Analytics: Overlay Impressions Enabled"), v122));
  v375[20] = v123;
  v206 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v375, 21));

  v277 = objc_alloc((Class)NSMutableArray);
  v124 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryType:](BKDebugViewCellModel, "modelWithAccessoryType:", 1));
  v337[0] = _NSConcreteStackBlock;
  v337[1] = 3221225472;
  v337[2] = sub_1000DFDE4;
  v337[3] = &unk_1008EA618;
  objc_copyWeak(&v338, &location);
  v125 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:action:](BKDebugViewEntry, "entryWithTitle:model:action:", CFSTR("Book Messages Local Data"), v124, v337));
  v374[0] = v125;
  v294 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryType:](BKDebugViewCellModel, "modelWithAccessoryType:", 1));
  v287 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:action:](BKDebugViewEntry, "entryWithTitle:model:action:", CFSTR("Reset Local Storage"), v294, &stru_1008EA6C0));
  v374[1] = v287;
  v282 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryType:](BKDebugViewCellModel, "modelWithAccessoryType:", 1));
  v126 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:action:](BKDebugViewEntry, "entryWithTitle:model:action:", CFSTR("Kill Books"), v282, &stru_1008EA6E0));
  v374[2] = v126;
  v127 = [BKDebugBoolDefaultSwitch alloc];
  v128 = (void *)objc_claimAutoreleasedReturnValue(+[BKMessagesDebugProvider enabled](_TtC5Books23BKMessagesDebugProvider, "enabled"));
  v129 = -[BKDebugBoolDefaultSwitch initWithDefaultsKey:](v127, "initWithDefaultsKey:", v128);
  v130 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", v129));
  v131 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Enable Debug Messages Provider"), v130));
  v374[3] = v131;
  v132 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v374, 4));
  v133 = objc_msgSend(v277, "initWithArray:", v132);

  v134 = objc_alloc((Class)NSMutableArray);
  v135 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryType:](BKDebugViewCellModel, "modelWithAccessoryType:", 1));
  v335[0] = _NSConcreteStackBlock;
  v335[1] = 3221225472;
  v335[2] = sub_1000DFEEC;
  v335[3] = &unk_1008EA618;
  objc_copyWeak(&v336, &location);
  v136 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:action:](BKDebugViewEntry, "entryWithTitle:model:action:", CFSTR("Analytics Settings"), v135, v335));
  v373 = v136;
  v137 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v373, 1));
  v243 = objc_msgSend(v134, "initWithArray:", v137);

  v138 = (void *)objc_claimAutoreleasedReturnValue(+[BKMessagesDebugProvider signIntoItunes](_TtC5Books23BKMessagesDebugProvider, "signIntoItunes"));
  v371[0] = v138;
  v372[0] = CFSTR("Enable Sign into iTunes");
  v139 = (void *)objc_claimAutoreleasedReturnValue(+[BKMessagesDebugProvider signIntoItunesCatalyst](_TtC5Books23BKMessagesDebugProvider, "signIntoItunesCatalyst"));
  v371[1] = v139;
  v372[1] = CFSTR("Enable Sign into iTunes Catalyst");
  v295 = (void *)objc_claimAutoreleasedReturnValue(+[BKMessagesDebugProvider readSample](_TtC5Books23BKMessagesDebugProvider, "readSample"));
  v371[2] = v295;
  v372[2] = CFSTR("Enable Read a free sample");
  v288 = (void *)objc_claimAutoreleasedReturnValue(+[BKMessagesDebugProvider listenPreview](_TtC5Books23BKMessagesDebugProvider, "listenPreview"));
  v371[3] = v288;
  v372[3] = CFSTR("Enable Listen a free preview");
  v283 = (void *)objc_claimAutoreleasedReturnValue(+[BKMessagesDebugProvider addToWTR](_TtC5Books23BKMessagesDebugProvider, "addToWTR"));
  v371[4] = v283;
  v372[4] = CFSTR("Enable Add to WTR");
  v278 = (void *)objc_claimAutoreleasedReturnValue(+[BKMessagesDebugProvider listenOnCarplay](_TtC5Books23BKMessagesDebugProvider, "listenOnCarplay"));
  v371[5] = v278;
  v372[5] = CFSTR("Enable Listen on Carplay");
  v273 = (void *)objc_claimAutoreleasedReturnValue(+[BKMessagesDebugProvider appleWatchMessage](_TtC5Books23BKMessagesDebugProvider, "appleWatchMessage"));
  v371[6] = v273;
  v372[6] = CFSTR("Enable Apple Watch Message");
  v269 = (void *)objc_claimAutoreleasedReturnValue(+[BKMessagesDebugProvider supplementalContent](_TtC5Books23BKMessagesDebugProvider, "supplementalContent"));
  v371[7] = v269;
  v372[7] = CFSTR("Enable Sup Content Tip");
  v264 = (void *)objc_claimAutoreleasedReturnValue(+[BKMessagesDebugProvider enableCoaching](_TtC5Books23BKMessagesDebugProvider, "enableCoaching"));
  v371[8] = v264;
  v372[8] = CFSTR("Enable Reading Coaching Onboarding");
  v259 = (void *)objc_claimAutoreleasedReturnValue(+[BKMessagesDebugProvider wtrGenericNotification](_TtC5Books23BKMessagesDebugProvider, "wtrGenericNotification"));
  v371[9] = v259;
  v372[9] = CFSTR("Enable Generic Notification Below WTR");
  v254 = (void *)objc_claimAutoreleasedReturnValue(+[BKMessagesDebugProvider wtrPriceDropSettings](_TtC5Books23BKMessagesDebugProvider, "wtrPriceDropSettings"));
  v371[10] = v254;
  v372[10] = CFSTR("Enable Price Drop (TCC-disabled) Notification Below WTR");
  v250 = (void *)objc_claimAutoreleasedReturnValue(+[BKMessagesDebugProvider wtrPriceDropNotify](_TtC5Books23BKMessagesDebugProvider, "wtrPriceDropNotify"));
  v371[11] = v250;
  v372[11] = CFSTR("Enable Price Drop Notification Below WTR");
  v246 = (void *)objc_claimAutoreleasedReturnValue(+[BKMessagesDebugProvider sgIntro](_TtC5Books23BKMessagesDebugProvider, "sgIntro"));
  v371[12] = v246;
  v372[12] = CFSTR("Enable SG Product page tip");
  v140 = (void *)objc_claimAutoreleasedReturnValue(+[BKMessagesDebugProvider sgReportAConcern](_TtC5Books23BKMessagesDebugProvider, "sgReportAConcern"));
  v371[13] = v140;
  v372[13] = CFSTR("Enable SG Report a Concern");
  v141 = (void *)objc_claimAutoreleasedReturnValue(+[BKMessagesDebugProvider readerThemeMessage](_TtC5Books23BKMessagesDebugProvider, "readerThemeMessage"));
  v371[14] = v141;
  v372[14] = CFSTR("Enable Reading Theme Tip");
  v142 = (void *)objc_claimAutoreleasedReturnValue(+[BKMessagesDebugProvider easyNavigationMessage](_TtC5Books23BKMessagesDebugProvider, "easyNavigationMessage"));
  v371[15] = v142;
  v372[15] = CFSTR("Enable Easy Navigation Tip");
  v143 = (void *)objc_claimAutoreleasedReturnValue(+[BKMessagesDebugProvider lockingBookOrientationMessage](_TtC5Books23BKMessagesDebugProvider, "lockingBookOrientationMessage"));
  v371[16] = v143;
  v372[16] = CFSTR("Enable Locking Book Orientation Tip");
  v144 = (void *)objc_claimAutoreleasedReturnValue(+[BKMessagesDebugProvider bookmarkShortcutMessage](_TtC5Books23BKMessagesDebugProvider, "bookmarkShortcutMessage"));
  v371[17] = v144;
  v372[17] = CFSTR("Enable Bookmark Shortcut Tip");
  v145 = (void *)objc_claimAutoreleasedReturnValue(+[BKMessagesDebugProvider readingGoalMessage](_TtC5Books23BKMessagesDebugProvider, "readingGoalMessage"));
  v371[18] = v145;
  v372[18] = CFSTR("Enable Reading Goal Message");
  v146 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v372, v371, 19));

  v334 = 0u;
  v333 = 0u;
  v332 = 0u;
  v331 = 0u;
  v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "allKeys"));
  v148 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v331, v370, 16);
  if (v148)
  {
    v149 = *(_QWORD *)v332;
    do
    {
      for (i = 0; i != v148; i = (char *)i + 1)
      {
        if (*(_QWORD *)v332 != v149)
          objc_enumerationMutation(v147);
        v151 = *(_QWORD *)(*((_QWORD *)&v331 + 1) + 8 * (_QWORD)i);
        v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "objectForKeyedSubscript:", v151));
        v153 = -[BKDebugBoolDefaultSwitch initWithDefaultsKey:]([BKDebugBoolDefaultSwitch alloc], "initWithDefaultsKey:", v151);
        v154 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", v153));
        v155 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", v152, v154));
        objc_msgSend(v133, "addObject:", v155);

      }
      v148 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v331, v370, 16);
    }
    while (v148);
  }

  v156 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_uipBookViewFallback));
  v157 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("UIP: Book View Cover Fallback"), v156));
  v369[0] = v157;
  v158 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_slowModeSwitch));
  v159 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Slow Mode"), v158));
  v369[1] = v159;
  v284 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v369, 2));

  v160 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_layoutDebugSwitch));
  v161 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Layout Debugging"), v160));
  v368 = v161;
  v279 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v368, 1));

  v162 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:action:](BKDebugViewEntry, "entryWithTitle:action:", CFSTR("Clear ResourceLoader Cache"), &stru_1008EA700));
  v367 = v162;
  v274 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v367, 1));

  v329[0] = _NSConcreteStackBlock;
  v329[1] = 3221225472;
  v329[2] = sub_1000DFF9C;
  v329[3] = &unk_1008EA640;
  objc_copyWeak(&v330, &location);
  v163 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithDetailLineBreakMode:detailTextBlock:](BKDebugViewCellModel, "modelWithDetailLineBreakMode:detailTextBlock:", 0, v329));
  v327[0] = _NSConcreteStackBlock;
  v327[1] = 3221225472;
  v327[2] = sub_1000E0038;
  v327[3] = &unk_1008EA618;
  objc_copyWeak(&v328, &location);
  v164 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:action:](BKDebugViewEntry, "entryWithTitle:model:action:", CFSTR("Reading session start offset"), v163, v327));
  v366[0] = v164;
  v325[0] = _NSConcreteStackBlock;
  v325[1] = 3221225472;
  v325[2] = sub_1000E0064;
  v325[3] = &unk_1008EA618;
  objc_copyWeak(&v326, &location);
  v165 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:action:](BKDebugViewEntry, "entryWithTitle:action:", CFSTR("Add a 2-min session to a date"), v325));
  v366[1] = v165;
  v323[0] = _NSConcreteStackBlock;
  v323[1] = 3221225472;
  v323[2] = sub_1000E00B4;
  v323[3] = &unk_1008EA618;
  objc_copyWeak(&v324, &location);
  v166 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:action:](BKDebugViewEntry, "entryWithTitle:action:", CFSTR("Add a 30-min session to a date"), v323));
  v366[2] = v166;
  v321[0] = _NSConcreteStackBlock;
  v321[1] = 3221225472;
  v321[2] = sub_1000E0104;
  v321[3] = &unk_1008EA618;
  objc_copyWeak(&v322, &location);
  v167 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:action:](BKDebugViewEntry, "entryWithTitle:action:", CFSTR("Add a 60-min session to a date"), v321));
  v366[3] = v167;
  v319[0] = _NSConcreteStackBlock;
  v319[1] = 3221225472;
  v319[2] = sub_1000E0154;
  v319[3] = &unk_1008EA618;
  objc_copyWeak(&v320, &location);
  v168 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:action:](BKDebugViewEntry, "entryWithTitle:action:", CFSTR("Add a 360-min session to a date"), v319));
  v366[4] = v168;
  v317[0] = _NSConcreteStackBlock;
  v317[1] = 3221225472;
  v317[2] = sub_1000E01A4;
  v317[3] = &unk_1008EA618;
  objc_copyWeak(&v318, &location);
  v169 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:action:](BKDebugViewEntry, "entryWithTitle:action:", CFSTR("Clear today's reading time"), v317));
  v366[5] = v169;
  v270 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v366, 6));

  v315[0] = _NSConcreteStackBlock;
  v315[1] = 3221225472;
  v315[2] = sub_1000E01D0;
  v315[3] = &unk_1008EA618;
  objc_copyWeak(&v316, &location);
  v296 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:action:](BKDebugViewEntry, "entryWithTitle:action:", CFSTR("Clear AppStore review cache"), v315));
  v365[0] = v296;
  v255 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_fakePlayerSwitch));
  v265 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("Toggle Fake Player"), v255));
  v365[1] = v265;
  v313[0] = _NSConcreteStackBlock;
  v313[1] = 3221225472;
  v313[2] = sub_1000E01FC;
  v313[3] = &unk_1008EA618;
  objc_copyWeak(&v314, &location);
  v260 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:action:](BKDebugViewEntry, "entryWithTitle:action:", CFSTR("Move All Eligible Local Books to iCloud"), v313));
  v365[2] = v260;
  v311[0] = _NSConcreteStackBlock;
  v311[1] = 3221225472;
  v311[2] = sub_1000E0228;
  v311[3] = &unk_1008EA618;
  objc_copyWeak(&v312, &location);
  v289 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:action:](BKDebugViewEntry, "entryWithTitle:action:", CFSTR("Move All iCloud Books back to Local"), v311));
  v365[3] = v289;
  v170 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithAccessoryView:](BKDebugViewCellModel, "modelWithAccessoryView:", val->_appAnalyticsDebugProcessorModeSwitch));
  v171 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:](BKDebugViewEntry, "entryWithTitle:model:", CFSTR("AppAnalytics: Debug Processor"), v170));
  v365[4] = v171;
  v309[0] = _NSConcreteStackBlock;
  v309[1] = 3221225472;
  v309[2] = sub_1000E0254;
  v309[3] = &unk_1008EA618;
  objc_copyWeak(&v310, &location);
  v172 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:action:](BKDebugViewEntry, "entryWithTitle:action:", CFSTR("Delete app"), v309));
  v365[5] = v172;
  v307[0] = _NSConcreteStackBlock;
  v307[1] = 3221225472;
  v307[2] = sub_1000E0280;
  v307[3] = &unk_1008EA640;
  objc_copyWeak(&v308, &location);
  v173 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewCellModel modelWithDetailLineBreakMode:detailTextBlock:](BKDebugViewCellModel, "modelWithDetailLineBreakMode:detailTextBlock:", 3, v307));
  v305[0] = _NSConcreteStackBlock;
  v305[1] = 3221225472;
  v305[2] = sub_1000E02DC;
  v305[3] = &unk_1008EA618;
  objc_copyWeak(&v306, &location);
  v174 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:model:action:](BKDebugViewEntry, "entryWithTitle:model:action:", CFSTR("CoverCache: Dump particular cover cache images to disk"), v173, v305));
  v365[6] = v174;
  v303[0] = _NSConcreteStackBlock;
  v303[1] = 3221225472;
  v303[2] = sub_1000E0308;
  v303[3] = &unk_1008EA618;
  objc_copyWeak(&v304, &location);
  v175 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:action:](BKDebugViewEntry, "entryWithTitle:action:", CFSTR("Sim: Family Content Deletion"), v303));
  v365[7] = v175;
  v301[0] = _NSConcreteStackBlock;
  v301[1] = 3221225472;
  v301[2] = sub_1000E0368;
  v301[3] = &unk_1008EA618;
  objc_copyWeak(&v302, &location);
  v176 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:action:](BKDebugViewEntry, "entryWithTitle:action:", CFSTR("Sim: Managed Books Changed"), v301));
  v365[8] = v176;
  v299[0] = _NSConcreteStackBlock;
  v299[1] = 3221225472;
  v299[2] = sub_1000E03B8;
  v299[3] = &unk_1008EA618;
  objc_copyWeak(&v300, &location);
  v177 = (void *)objc_claimAutoreleasedReturnValue(+[BKDebugViewEntry entryWithTitle:action:](BKDebugViewEntry, "entryWithTitle:action:", CFSTR("Sim: Triggering Local Notification in 1 second"), v299));
  v365[9] = v177;
  v247 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v365, 10));

  v178 = -[DebugViewControllerPriceTracking initWithOwner:]([DebugViewControllerPriceTracking alloc], "initWithOwner:", val);
  priceTracking = val->_priceTracking;
  val->_priceTracking = v178;

  v180 = -[DebugViewControllerRemoteConfig initWithOwner:]([DebugViewControllerRemoteConfig alloc], "initWithOwner:", val);
  remoteConfig = val->_remoteConfig;
  val->_remoteConfig = v180;

  v297 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v290 = (void *)objc_claimAutoreleasedReturnValue(-[BKDebugViewController remoteConfig](val, "remoteConfig"));
  v266 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v290, "section"));
  v364[0] = v266;
  v261 = -[BKDebugViewSection initWithHeaderTitle:entries:footerTitle:]([BKDebugViewSection alloc], "initWithHeaderTitle:entries:footerTitle:", CFSTR("Reading Experience"), v203, 0);
  v364[1] = v261;
  v182 = [BKDebugViewSection alloc];
  v256 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Store: JS %@"), v204));
  v251 = -[BKDebugViewSection initWithHeaderTitle:entries:footerTitle:](v182, "initWithHeaderTitle:entries:footerTitle:", v256, v206, CFSTR("Note: You must enable \"Enable Remote Config Monitoring\" in Internal Settings for configuration to work"));
  v364[2] = v251;
  v240 = -[BKDebugViewSection initWithHeaderTitle:entries:footerTitle:]([BKDebugViewSection alloc], "initWithHeaderTitle:entries:footerTitle:", CFSTR("Book Messages"), v133, &stru_10091C438);
  v364[3] = v240;
  v237 = -[BKDebugViewSection initWithHeaderTitle:entries:footerTitle:]([BKDebugViewSection alloc], "initWithHeaderTitle:entries:footerTitle:", CFSTR("Open Book Animation"), v284, 0);
  v364[4] = v237;
  v183 = -[BKDebugViewSection initWithHeaderTitle:entries:footerTitle:]([BKDebugViewSection alloc], "initWithHeaderTitle:entries:footerTitle:", CFSTR("Bookshelf"), v279, 0);
  v364[5] = v183;
  v184 = -[BKDebugViewSection initWithHeaderTitle:entries:footerTitle:]([BKDebugViewSection alloc], "initWithHeaderTitle:entries:footerTitle:", CFSTR("TUIAnimation"), v274, 0);
  v364[6] = v184;
  v185 = -[BKDebugViewSection initWithHeaderTitle:entries:footerTitle:]([BKDebugViewSection alloc], "initWithHeaderTitle:entries:footerTitle:", CFSTR("Reading Goals"), v270, 0);
  v364[7] = v185;
  v186 = -[BKDebugViewSection initWithHeaderTitle:entries:footerTitle:]([BKDebugViewSection alloc], "initWithHeaderTitle:entries:footerTitle:", CFSTR("Miscellaneous"), v247, 0);
  v364[8] = v186;
  v187 = -[BKDebugViewSection initWithHeaderTitle:entries:footerTitle:]([BKDebugViewSection alloc], "initWithHeaderTitle:entries:footerTitle:", CFSTR("Analytics"), v243, 0);
  v364[9] = v187;
  v188 = (void *)objc_claimAutoreleasedReturnValue(-[BKDebugViewController yearInReviewSection](val, "yearInReviewSection"));
  v364[10] = v188;
  v189 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v364, 11));
  objc_msgSend(v297, "addObjectsFromArray:", v189);

  v190 = (void *)objc_claimAutoreleasedReturnValue(-[BKDebugViewController priceTracking](val, "priceTracking"));
  v191 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v190, "section"));

  if (v191)
    objc_msgSend(v297, "addObject:", v191);
  v192 = (NSArray *)objc_msgSend(v297, "copy");
  sections = val->_sections;
  val->_sections = v192;

  v194 = (void *)objc_claimAutoreleasedReturnValue(-[BKDebugViewController tableView](val, "tableView"));
  objc_msgSend(v194, "registerClass:forCellReuseIdentifier:", objc_opt_class(BKDebugCell), CFSTR("CellIdentifier"));

  objc_destroyWeak(&v300);
  objc_destroyWeak(&v302);
  objc_destroyWeak(&v304);
  objc_destroyWeak(&v306);
  objc_destroyWeak(&v308);
  objc_destroyWeak(&v310);
  objc_destroyWeak(&v312);
  objc_destroyWeak(&v314);
  objc_destroyWeak(&v316);

  objc_destroyWeak(&v318);
  objc_destroyWeak(&v320);
  objc_destroyWeak(&v322);
  objc_destroyWeak(&v324);
  objc_destroyWeak(&v326);
  objc_destroyWeak(&v328);
  objc_destroyWeak(&v330);

  objc_destroyWeak(&v336);
  objc_destroyWeak(&v338);

  objc_destroyWeak(&v340);
  objc_destroyWeak(&v342);
  objc_destroyWeak(&v344);
  objc_destroyWeak(&v346);
  objc_destroyWeak(&v348);

  objc_destroyWeak(&v350);
  objc_destroyWeak(&v352);
  objc_destroyWeak(&v354);

  objc_destroyWeak(&location);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDebugViewController sections](self, "sections", a3));
  v4 = objc_msgSend(v3, "count");

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKDebugViewController sections](self, "sections", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entries"));
  v8 = objc_msgSend(v7, "count");

  return (int64_t)v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKDebugViewController sections](self, "sections", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "headerTitle"));
  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKDebugViewController sections](self, "sections", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "footerTitle"));
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;
  uint64_t (**v5)(void);
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t (**v31)(void);

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("CellIdentifier"), v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKDebugViewController sections](self, "sections"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v8, "section")));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "entries"));
  v13 = objc_msgSend(v8, "row");

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textLabel"));
  objc_msgSend(v16, "setText:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "model"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "detailTextBlock"));
  if (v18)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "model"));
    v5 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "detailTextBlock"));
    v19 = v5[2]();
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  }
  else
  {
    v20 = 0;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "detailTextLabel"));
  objc_msgSend(v21, "setText:", v20);

  if (v18)
  {

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "model"));
  v23 = objc_msgSend(v22, "detailLineBreakMode");
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "detailTextLabel"));
  objc_msgSend(v24, "setLineBreakMode:", v23);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "model"));
  objc_msgSend(v9, "setAccessoryType:", objc_msgSend(v25, "accessoryType"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "model"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "accessoryView"));
  objc_msgSend(v9, "setAccessoryView:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "model"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "userInteractionEnabledBlock"));
  if (v29)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "model"));
    v31 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "userInteractionEnabledBlock"));
    objc_msgSend(v9, "setUserInteractionEnabled:", v31[2]());

  }
  else
  {
    objc_msgSend(v9, "setUserInteractionEnabled:", 1);
  }

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKDebugViewController sections](self, "sections"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v13, "section")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "entries"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v13, "row")));

  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "action"));
  v12 = (void *)v11;
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v13);

  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v13, 1);
}

- (void)_close:(id)a3
{
  -[BKDebugViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_presentTeaDebugViewController:(id)a3
{
  id v4;
  id v5;
  void *v6;
  BKSceneProviderBridge *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = objc_msgSend((id)objc_opt_class(self), "resolver");
  v14 = (id)objc_claimAutoreleasedReturnValue(v4);
  v5 = objc_msgSend(v14, "resolveClass:name:", objc_opt_class(UIViewController), CFSTR("Debug"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_opt_new(BKSceneProviderBridge);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKDebugViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "windowScene"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "containerHost"));
  -[BKSceneProviderBridge registerWindowScene:containerHost:](v7, "registerWindowScene:containerHost:", v10, v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKDebugViewController navigationController](self, "navigationController"));
  objc_msgSend(v13, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)_presentLightLevelChangeAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSArray *obj;
  void *v20;
  _QWORD v21[5];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDebugViewController tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathForSelectedRow"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKDebugViewController sections](self, "sections"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section")));

  v18 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entries"));
  v20 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v9, 0, 1));

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_lightLevelTitles;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_1000E1980;
        v21[3] = &unk_1008E9760;
        v21[4] = self;
        v22 = v20;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 0, v21));
        objc_msgSend(v10, "addAction:", v16);

      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0));
  objc_msgSend(v10, "addAction:", v17);

  -[BKDebugViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
}

- (void)_emulateCurrentLightLevelChange:(int64_t)a3
{
  void *v5;
  unsigned int v6;
  int64_t v7;
  dispatch_time_t v8;
  _QWORD v9[6];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("BCShouldOverrideNightModeDelay"));

  if (v6)
    v7 = 5000000000;
  else
    v7 = 0;
  v8 = dispatch_time(0, v7);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000E1B78;
  v9[3] = &unk_1008E8CC8;
  v9[4] = self;
  v9[5] = a3;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v9);
}

- (void)_presentProductPageAlsoAvailableAsAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, CFSTR("Select product page treatment type"), 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("None"), 0, &stru_1008EA808));
  objc_msgSend(v7, "addAction:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Type 1"), 0, &stru_1008EA828));
  objc_msgSend(v7, "addAction:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Type 2"), 0, &stru_1008EA848));
  objc_msgSend(v7, "addAction:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Cancel"), 2, 0));
  objc_msgSend(v7, "addAction:", v6);

  -[BKDebugViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

- (void)_presentCoverCacheDumpingAdamIDCoversAlert
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id location;
  _QWORD v14[4];
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDebugViewController tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathForSelectedRow"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Dump particular cover cache images in the next app launch"), CFSTR("See BICCacheStates logging for dumped image file path.\n\n Just enter hash (sideload) or adamID (store) you want its covers dumped, and restart Books.app and use it like you normally do. Below text field will be reset when Books.app relaunched.\n\n"), 1));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000E2020;
  v14[3] = &unk_1008EA870;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKDebugViewController coverCacheHashOrAdamID](self, "coverCacheHashOrAdamID"));
  v15 = v6;
  objc_msgSend(v5, "addTextFieldWithConfigurationHandler:", v14);
  objc_initWeak(&location, v5);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000E2070;
  v10[3] = &unk_1008EA898;
  objc_copyWeak(&v12, &location);
  v10[4] = self;
  v7 = v4;
  v11 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("OK"), 0, v10));
  objc_msgSend(v5, "addAction:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0));
  objc_msgSend(v5, "addAction:", v9);

  -[BKDebugViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)_moveEligibleLocalBooksToUbiquity
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = objc_opt_class(BKAppDelegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = BUDynamicCast(v2, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ubiquitousDocumentsController"));
  objc_msgSend(v6, "makeAllEligibleLocalBooksUbiquitousWithCompletion:", &stru_1008EA8D8);

}

- (void)_moveUbiquityBooksBackToLocal
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = objc_opt_class(BKAppDelegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = BUDynamicCast(v2, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ubiquitousDocumentsController"));
  objc_msgSend(v6, "makeAllUbiquitousBooksLocalWithCompletion:", &stru_1008EA8F8);

}

- (void)_handleAppRemoval
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  dispatch_semaphore_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  BKDebugViewController *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  BKDebugViewController *v22;
  NSObject *v23;

  v3 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithServiceName:", CFSTR("com.apple.iBooks.appremoval"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___LSAppRemovalServiceProtocol));
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  objc_msgSend(v3, "resume");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("XPC App Removal Service"), &stru_10091C438, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0));
  objc_msgSend(v5, "addAction:", v6);
  v7 = dispatch_semaphore_create(0);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000E24BC;
  v20[3] = &unk_1008E9DA0;
  v8 = v5;
  v21 = v8;
  v22 = self;
  v9 = v7;
  v23 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v20));
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_1000E2600;
  v16 = &unk_1008E9DA0;
  v17 = v8;
  v18 = self;
  v19 = v9;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "removeAppWithReply:", &v13);
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(v3, "invalidate", v13, v14, v15, v16);

}

- (NSString)coverCacheHashOrAdamID
{
  return self->_coverCacheHashOrAdamID;
}

- (void)setCoverCacheHashOrAdamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (DebugViewControllerPriceTracking)priceTracking
{
  return self->_priceTracking;
}

- (DebugViewControllerRemoteConfig)remoteConfig
{
  return self->_remoteConfig;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)currentREIMode
{
  return self->_currentREIMode;
}

- (void)setCurrentREIMode:(unint64_t)a3
{
  self->_currentREIMode = a3;
}

- (UISwitch)enableChapterAnimationSwitch
{
  return self->_enableChapterAnimationSwitch;
}

- (void)setEnableChapterAnimationSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_enableChapterAnimationSwitch, a3);
}

- (UISwitch)disableREI
{
  return self->_disableREI;
}

- (void)setDisableREI:(id)a3
{
  objc_storeStrong((id *)&self->_disableREI, a3);
}

- (UISwitch)enablePageTurnDebugging
{
  return self->_enablePageTurnDebugging;
}

- (void)setEnablePageTurnDebugging:(id)a3
{
  objc_storeStrong((id *)&self->_enablePageTurnDebugging, a3);
}

- (NSDictionary)reiModes
{
  return self->_reiModes;
}

- (void)setReiModes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)currentLightLevel
{
  return self->_currentLightLevel;
}

- (void)setCurrentLightLevel:(unint64_t)a3
{
  self->_currentLightLevel = a3;
}

- (NSArray)lightLevelTitles
{
  return self->_lightLevelTitles;
}

- (void)setLightLevelTitles:(id)a3
{
  objc_storeStrong((id *)&self->_lightLevelTitles, a3);
}

- (UISwitch)nightModeSwitch
{
  return self->_nightModeSwitch;
}

- (void)setNightModeSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_nightModeSwitch, a3);
}

- (UISwitch)nightModeDelaySwitch
{
  return self->_nightModeDelaySwitch;
}

- (void)setNightModeDelaySwitch:(id)a3
{
  objc_storeStrong((id *)&self->_nightModeDelaySwitch, a3);
}

- (UISwitch)endOfBookDebugMenuSwitch
{
  return self->_endOfBookDebugMenuSwitch;
}

- (void)setEndOfBookDebugMenuSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_endOfBookDebugMenuSwitch, a3);
}

- (UISwitch)oldFontStepsAndSpacingSwitch
{
  return self->_oldFontStepsAndSpacingSwitch;
}

- (void)setOldFontStepsAndSpacingSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_oldFontStepsAndSpacingSwitch, a3);
}

- (UISwitch)reiLayoutGuidesSwitch
{
  return self->_reiLayoutGuidesSwitch;
}

- (void)setReiLayoutGuidesSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_reiLayoutGuidesSwitch, a3);
}

- (UISwitch)reiShowPaginatingWebViewSwitch
{
  return self->_reiShowPaginatingWebViewSwitch;
}

- (void)setReiShowPaginatingWebViewSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_reiShowPaginatingWebViewSwitch, a3);
}

- (UISwitch)reiIgnoreCacheSwitch
{
  return self->_reiIgnoreCacheSwitch;
}

- (void)setReiIgnoreCacheSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_reiIgnoreCacheSwitch, a3);
}

- (UISwitch)alwaysParseEpubSwitch
{
  return self->_alwaysParseEpubSwitch;
}

- (void)setAlwaysParseEpubSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_alwaysParseEpubSwitch, a3);
}

- (UISwitch)reiLogContentSizeSwitch
{
  return self->_reiLogContentSizeSwitch;
}

- (void)setReiLogContentSizeSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_reiLogContentSizeSwitch, a3);
}

- (UISwitch)reiAllowScrollMacOSSwitch
{
  return self->_reiAllowScrollMacOSSwitch;
}

- (void)setReiAllowScrollMacOSSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_reiAllowScrollMacOSSwitch, a3);
}

- (UISwitch)reiDisableAutoFontDownloadSwitch
{
  return self->_reiDisableAutoFontDownloadSwitch;
}

- (void)setReiDisableAutoFontDownloadSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_reiDisableAutoFontDownloadSwitch, a3);
}

- (UISwitch)reiEnableCellularFontDownloadSwitch
{
  return self->_reiEnableCellularFontDownloadSwitch;
}

- (void)setReiEnableCellularFontDownloadSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_reiEnableCellularFontDownloadSwitch, a3);
}

- (UISwitch)reiUseNewTextStylingSwitch
{
  return self->_reiUseNewTextStylingSwitch;
}

- (void)setReiUseNewTextStylingSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_reiUseNewTextStylingSwitch, a3);
}

- (UISwitch)reiContentSizeLogging
{
  return self->_reiContentSizeLogging;
}

- (void)setReiContentSizeLogging:(id)a3
{
  objc_storeStrong((id *)&self->_reiContentSizeLogging, a3);
}

- (UISwitch)curlAnimationSwitch
{
  return self->_curlAnimationSwitch;
}

- (void)setCurlAnimationSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_curlAnimationSwitch, a3);
}

- (UISwitch)webSetDrawBordersSwitch
{
  return self->_webSetDrawBordersSwitch;
}

- (void)setWebSetDrawBordersSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_webSetDrawBordersSwitch, a3);
}

- (UISwitch)webSetAcceleratedDrawingDisabledSwitch
{
  return self->_webSetAcceleratedDrawingDisabledSwitch;
}

- (void)setWebSetAcceleratedDrawingDisabledSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_webSetAcceleratedDrawingDisabledSwitch, a3);
}

- (NSString)bootUrl
{
  return self->_bootUrl;
}

- (void)setBootUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (UISwitch)hotReloadModeSwitch
{
  return self->_hotReloadModeSwitch;
}

- (void)setHotReloadModeSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_hotReloadModeSwitch, a3);
}

- (UISwitch)launchWithBundleJSSwitch
{
  return self->_launchWithBundleJSSwitch;
}

- (void)setLaunchWithBundleJSSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_launchWithBundleJSSwitch, a3);
}

- (UISwitch)productPageSlowModeSwitch
{
  return self->_productPageSlowModeSwitch;
}

- (void)setProductPageSlowModeSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_productPageSlowModeSwitch, a3);
}

- (UISwitch)productPageSlideSwitch
{
  return self->_productPageSlideSwitch;
}

- (void)setProductPageSlideSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_productPageSlideSwitch, a3);
}

- (UISwitch)productPageSampleFeedbackShownSwitch
{
  return self->_productPageSampleFeedbackShownSwitch;
}

- (void)setProductPageSampleFeedbackShownSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_productPageSampleFeedbackShownSwitch, a3);
}

- (UISwitch)localSignalCollectionEnabledSwitch
{
  return self->_localSignalCollectionEnabledSwitch;
}

- (void)setLocalSignalCollectionEnabledSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_localSignalCollectionEnabledSwitch, a3);
}

- (UISwitch)localSignalSyncEnabledSwitch
{
  return self->_localSignalSyncEnabledSwitch;
}

- (void)setLocalSignalSyncEnabledSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_localSignalSyncEnabledSwitch, a3);
}

- (UISwitch)debugODPClusteringSwitch
{
  return self->_debugODPClusteringSwitch;
}

- (void)setDebugODPClusteringSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_debugODPClusteringSwitch, a3);
}

- (UISwitch)booksUIDebugModifiersEnabledSwitch
{
  return self->_booksUIDebugModifiersEnabledSwitch;
}

- (void)setBooksUIDebugModifiersEnabledSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_booksUIDebugModifiersEnabledSwitch, a3);
}

- (UISwitch)bookAnalyticsOverlayImpressionsEnabledSwitch
{
  return self->_bookAnalyticsOverlayImpressionsEnabledSwitch;
}

- (void)setBookAnalyticsOverlayImpressionsEnabledSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_bookAnalyticsOverlayImpressionsEnabledSwitch, a3);
}

- (UISwitch)allowUnsignedJetpackSwitch
{
  return self->_allowUnsignedJetpackSwitch;
}

- (void)setAllowUnsignedJetpackSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_allowUnsignedJetpackSwitch, a3);
}

- (UISwitch)loadBundledJetPackFromJSRootSwitch
{
  return self->_loadBundledJetPackFromJSRootSwitch;
}

- (void)setLoadBundledJetPackFromJSRootSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_loadBundledJetPackFromJSRootSwitch, a3);
}

- (UISwitch)booksUIShelfGridDebugUIEnabledSwitch
{
  return self->_booksUIShelfGridDebugUIEnabledSwitch;
}

- (void)setBooksUIShelfGridDebugUIEnabledSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_booksUIShelfGridDebugUIEnabledSwitch, a3);
}

- (UISwitch)uipBookViewFallback
{
  return self->_uipBookViewFallback;
}

- (void)setUipBookViewFallback:(id)a3
{
  objc_storeStrong((id *)&self->_uipBookViewFallback, a3);
}

- (UISwitch)slowModeSwitch
{
  return self->_slowModeSwitch;
}

- (void)setSlowModeSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_slowModeSwitch, a3);
}

- (UISwitch)layoutDebugSwitch
{
  return self->_layoutDebugSwitch;
}

- (void)setLayoutDebugSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_layoutDebugSwitch, a3);
}

- (NSArray)sessionStartOffsets
{
  return self->_sessionStartOffsets;
}

- (void)setSessionStartOffsets:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStartOffsets, a3);
}

- (int64_t)readingSessionCurrentStartOffset
{
  return self->_readingSessionCurrentStartOffset;
}

- (void)setReadingSessionCurrentStartOffset:(int64_t)a3
{
  self->_readingSessionCurrentStartOffset = a3;
}

- (NSArray)miscSectionEntries
{
  return self->_miscSectionEntries;
}

- (void)setMiscSectionEntries:(id)a3
{
  objc_storeStrong((id *)&self->_miscSectionEntries, a3);
}

- (UISwitch)fakePlayerSwitch
{
  return self->_fakePlayerSwitch;
}

- (void)setFakePlayerSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_fakePlayerSwitch, a3);
}

- (UISwitch)appAnalyticsDebugProcessorModeSwitch
{
  return self->_appAnalyticsDebugProcessorModeSwitch;
}

- (void)setAppAnalyticsDebugProcessorModeSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_appAnalyticsDebugProcessorModeSwitch, a3);
}

- (UISwitch)dontShowDisabledSwitch
{
  return self->_dontShowDisabledSwitch;
}

- (void)setDontShowDisabledSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_dontShowDisabledSwitch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dontShowDisabledSwitch, 0);
  objc_storeStrong((id *)&self->_appAnalyticsDebugProcessorModeSwitch, 0);
  objc_storeStrong((id *)&self->_fakePlayerSwitch, 0);
  objc_storeStrong((id *)&self->_miscSectionEntries, 0);
  objc_storeStrong((id *)&self->_sessionStartOffsets, 0);
  objc_storeStrong((id *)&self->_layoutDebugSwitch, 0);
  objc_storeStrong((id *)&self->_slowModeSwitch, 0);
  objc_storeStrong((id *)&self->_uipBookViewFallback, 0);
  objc_storeStrong((id *)&self->_booksUIShelfGridDebugUIEnabledSwitch, 0);
  objc_storeStrong((id *)&self->_loadBundledJetPackFromJSRootSwitch, 0);
  objc_storeStrong((id *)&self->_allowUnsignedJetpackSwitch, 0);
  objc_storeStrong((id *)&self->_bookAnalyticsOverlayImpressionsEnabledSwitch, 0);
  objc_storeStrong((id *)&self->_booksUIDebugModifiersEnabledSwitch, 0);
  objc_storeStrong((id *)&self->_debugODPClusteringSwitch, 0);
  objc_storeStrong((id *)&self->_localSignalSyncEnabledSwitch, 0);
  objc_storeStrong((id *)&self->_localSignalCollectionEnabledSwitch, 0);
  objc_storeStrong((id *)&self->_productPageSampleFeedbackShownSwitch, 0);
  objc_storeStrong((id *)&self->_productPageSlideSwitch, 0);
  objc_storeStrong((id *)&self->_productPageSlowModeSwitch, 0);
  objc_storeStrong((id *)&self->_launchWithBundleJSSwitch, 0);
  objc_storeStrong((id *)&self->_hotReloadModeSwitch, 0);
  objc_storeStrong((id *)&self->_bootUrl, 0);
  objc_storeStrong((id *)&self->_webSetAcceleratedDrawingDisabledSwitch, 0);
  objc_storeStrong((id *)&self->_webSetDrawBordersSwitch, 0);
  objc_storeStrong((id *)&self->_curlAnimationSwitch, 0);
  objc_storeStrong((id *)&self->_reiContentSizeLogging, 0);
  objc_storeStrong((id *)&self->_reiUseNewTextStylingSwitch, 0);
  objc_storeStrong((id *)&self->_reiEnableCellularFontDownloadSwitch, 0);
  objc_storeStrong((id *)&self->_reiDisableAutoFontDownloadSwitch, 0);
  objc_storeStrong((id *)&self->_reiAllowScrollMacOSSwitch, 0);
  objc_storeStrong((id *)&self->_reiLogContentSizeSwitch, 0);
  objc_storeStrong((id *)&self->_alwaysParseEpubSwitch, 0);
  objc_storeStrong((id *)&self->_reiIgnoreCacheSwitch, 0);
  objc_storeStrong((id *)&self->_reiShowPaginatingWebViewSwitch, 0);
  objc_storeStrong((id *)&self->_reiLayoutGuidesSwitch, 0);
  objc_storeStrong((id *)&self->_oldFontStepsAndSpacingSwitch, 0);
  objc_storeStrong((id *)&self->_endOfBookDebugMenuSwitch, 0);
  objc_storeStrong((id *)&self->_nightModeDelaySwitch, 0);
  objc_storeStrong((id *)&self->_nightModeSwitch, 0);
  objc_storeStrong((id *)&self->_lightLevelTitles, 0);
  objc_storeStrong((id *)&self->_reiModes, 0);
  objc_storeStrong((id *)&self->_enablePageTurnDebugging, 0);
  objc_storeStrong((id *)&self->_disableREI, 0);
  objc_storeStrong((id *)&self->_enableChapterAnimationSwitch, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_remoteConfig, 0);
  objc_storeStrong((id *)&self->_priceTracking, 0);
  objc_storeStrong((id *)&self->_coverCacheHashOrAdamID, 0);
}

- (void)_loadDefaults
{
  BKDebugViewController *v2;

  v2 = self;
  sub_1005A4308();

}

- (void)_presentSessionStartOffsetChangeAlert
{
  BKDebugViewController *v2;

  v2 = self;
  sub_1005A4974();

}

- (void)_presentREIChromeEditingMenu
{
  BKDebugViewController *v2;
  id v3;
  void *v4;
  _BYTE v5[320];

  v2 = self;
  sub_10055A3C4((uint64_t)v5);
  v3 = objc_allocWithZone((Class)sub_10004CFD4(&qword_1009ED948));
  v4 = (void *)UIHostingController.init(rootView:)(v5);
  -[BKDebugViewController presentViewController:animated:completion:](v2, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)_presentAddReadingSessionPickerFromIndexPath:(id)a3 duration:(double)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  BKDebugViewController *v11;
  uint64_t v12;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = self;
  sub_1005A5310(a4);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)_presentWantToReadSamplesBehaviorAlert
{
  BKDebugViewController *v2;

  v2 = self;
  sub_1005A593C();

}

- (BKDebugViewSection)yearInReviewSection
{
  BKDebugViewController *v2;
  uint64_t v3;
  id v4;
  NSString v5;
  Class isa;
  id v7;

  v2 = self;
  v3 = sub_1005A6610();
  v4 = objc_allocWithZone((Class)BKDebugViewSection);
  v5 = String._bridgeToObjectiveC()();
  sub_100009E04(0, (unint64_t *)&qword_1009D57C8, off_1008E51E0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  v7 = objc_msgSend(v4, "initWithHeaderTitle:entries:footerTitle:", v5, isa, 0, swift_bridgeObjectRelease(v3).n128_f64[0]);

  return (BKDebugViewSection *)v7;
}

- (uint64_t)_clearTodaysReadingTime
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v14;
  Class isa;
  _OWORD v16[2];

  v0 = type metadata accessor for ReadingHistory.Notification.ClearToday(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_10004CFD4(&qword_1009ED930);
  __chkstk_darwin(v4);
  v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Notification(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  ReadingHistory.Notification.ClearToday.init()(v9);
  v12 = sub_100008DB0(&qword_1009ED938, (uint64_t (*)(uint64_t))&type metadata accessor for ReadingHistory.Notification.ClearToday, (uint64_t)&protocol conformance descriptor for ReadingHistory.Notification.ClearToday);
  memset(v16, 0, sizeof(v16));
  Notificationable.toNotification(object:)(v16, v0, v12);
  sub_100010960((uint64_t)v16, (uint64_t *)&unk_1009D04E0);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    return sub_100010960((uint64_t)v6, &qword_1009ED930);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v11, v6, v7);
  v14 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  isa = Notification._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v14, "postNotification:", isa);

  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

@end
