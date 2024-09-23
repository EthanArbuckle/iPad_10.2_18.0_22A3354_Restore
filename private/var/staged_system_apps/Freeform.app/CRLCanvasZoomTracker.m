@implementation CRLCanvasZoomTracker

- (CRLCanvasZoomTracker)initWithCanvasLayer:(id)a3
{
  id v4;
  CRLCanvasZoomTracker *v5;
  CRLCanvasZoomTracker *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLCanvasZoomTracker;
  v5 = -[CRLCanvasZoomTracker init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_canvasLayer, v4);
    *(_WORD *)&v6->_fastPinchSnapsViewScale = 257;
    v6->_animateTransform = 1;
  }

  return v6;
}

- (void)zoomWithScale:(double)a3 velocity:(double)a4 locationInView:(CGPoint)a5 phase:(int64_t)a6
{
  CRLCanvasZoomTrackerDelegate **p_delegate;
  id WeakRetained;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CRLCanvasLayer **p_canvasLayer;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  CGAffineTransform *p_savedTransform;
  id v40;
  void *v41;
  __int128 v42;
  CGFloat v43;
  CGFloat v44;
  double v45;
  void *v46;
  unint64_t zoomVelocitySampleCount;
  double v48;
  id v49;
  double v50;
  double v51;
  id v52;
  double v53;
  double v54;
  id v55;
  double v56;
  double v57;
  double v58;
  double v59;
  id v60;
  double v61;
  double v62;
  BOOL *p_isShowingZoomHUD;
  id v64;
  unsigned int v65;
  id v66;
  void *v67;
  CRLCanvasZoomTracker *v68;
  uint64_t v69;
  id v70;
  unsigned int v71;
  double v72;
  id v73;
  double v74;
  double v75;
  double v76;
  BOOL v77;
  id v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  id v83;
  double v84;
  double v85;
  CGFloat v86;
  double v87;
  CGFloat v88;
  double v89;
  CGFloat v90;
  id v91;
  double v92;
  double v93;
  double v94;
  CGFloat v95;
  double v96;
  CGFloat v97;
  double v98;
  CGFloat v99;
  id v100;
  void *v101;
  void *v102;
  unsigned int v103;
  double v104;
  double v105;
  double v106;
  id v107;
  void *v108;
  id v109;
  void *v110;
  void *v111;
  double v112;
  double v113;
  double v114;
  double v115;
  id *v116;
  id v117;
  void *v118;
  void *v119;
  CGFloat v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  id v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  id v136;
  unsigned __int8 v137;
  double v138;
  id v139;
  double v140;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  float v147;
  float v148;
  int8x16_t v149;
  float64x2_t v150;
  int8x16_t v151;
  double v152;
  int8x16_t v153;
  double v154;
  double v155;
  float v156;
  float v157;
  int8x16_t v158;
  int8x16_t v159;
  id v160;
  id v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  CGFloat v171;
  CGFloat v172;
  CGFloat v173;
  double v174;
  double v175;
  double v176;
  id v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  double v190;
  double v191;
  CGFloat v192;
  double v193;
  double v194;
  CGFloat v195;
  void *v196;
  id v197;
  double v198;
  double v199;
  double v200;
  CGFloat v201;
  double v202;
  CGFloat v203;
  void *v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  void *v208;
  CGFloat v209;
  CGFloat v210;
  void *v211;
  double v212;
  void *v213;
  void *v214;
  void *v215;
  double v216;
  void *v217;
  void *v218;
  double v219;
  double v220;
  double v221;
  void *v222;
  double v223;
  double v224;
  double v225;
  void *v226;
  double v227;
  double v228;
  CGFloat v229;
  double v230;
  CGFloat v231;
  double v232;
  CGFloat v233;
  void *v234;
  double v235;
  double v236;
  CGFloat v237;
  CGFloat v238;
  void *v239;
  double v240;
  double v241;
  double v242;
  void *v243;
  double v244;
  double v245;
  CGFloat v246;
  void *v247;
  double v248;
  double v249;
  double v250;
  double v251;
  void *v252;
  id v253;
  double v254;
  double v255;
  double v256;
  double v257;
  double v258;
  double v259;
  double v260;
  double v261;
  double v262;
  double v263;
  double v264;
  double v265;
  double v266;
  double v267;
  double v268;
  double v269;
  void *v270;
  double v271;
  double v272;
  double v273;
  double v274;
  void *v275;
  double MaxX;
  double v277;
  double v278;
  double v279;
  double v280;
  double v281;
  void *v282;
  id v283;
  Swift::String v284;
  double v285;
  double v286;
  double v287;
  double v288;
  double v289;
  double v290;
  double v291;
  double v292;
  double v293;
  double v294;
  double v295;
  double v296;
  double v297;
  double v298;
  double v299;
  double v300;
  double v301;
  void *v302;
  void *v303;
  double v304;
  double v305;
  double v306;
  double v307;
  double v308;
  double v309;
  id v310;
  id v311;
  void *v312;
  id v313;
  void *v314;
  void *v315;
  void *v316;
  unsigned __int8 v317;
  double v318;
  double v319;
  double v320;
  unsigned int v321;
  id v322;
  void *v323;
  void *v324;
  unsigned __int8 v325;
  id v326;
  void *v327;
  void *v328;
  unsigned int v329;
  NSString *v330;
  id v331;
  NSString *v332;
  id v333;
  NSString *v334;
  id v335;
  NSString *v336;
  id v337;
  NSString *v338;
  id v339;
  NSString *v340;
  id v341;
  id v342;
  unsigned int v343;
  void *v344;
  void *v345;
  double v346;
  double v347;
  CGFloat v348;
  CGFloat v349;
  void *v350;
  double v351;
  double v352;
  double v353;
  void *v354;
  double v355;
  double v356;
  CGFloat v357;
  void *v358;
  double v359;
  CGFloat v360;
  CGFloat v361;
  CGFloat v362;
  void *v363;
  void *v364;
  double v365;
  double v366;
  double v367;
  double v368;
  double v369;
  CGFloat v370;
  double v371;
  CGFloat v372;
  double v373;
  void *v374;
  double v375;
  CGFloat v376;
  id v377;
  void *v378;
  double v379;
  char v380;
  BOOL v381;
  CFTimeInterval v382;
  id v383;
  void *v384;
  CRLDisplayLink *v385;
  CRLDisplayLink *v386;
  id v387;
  id v388;
  _QWORD *v389;
  CRLDisplayLink *v390;
  _QWORD *v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  _BOOL4 gestureIsFastPinch;
  id v397;
  void *v398;
  NSString *v399;
  id v400;
  NSString *v401;
  id v402;
  NSString *v403;
  id v404;
  NSString *v405;
  id v406;
  NSString *v407;
  id v408;
  NSString *v409;
  id v410;
  NSString *v411;
  id v412;
  NSString *v413;
  id v414;
  NSString *v415;
  id v416;
  NSString *v417;
  id v418;
  NSString *v419;
  id v420;
  NSString *v421;
  id v422;
  NSString *v423;
  id v424;
  NSString *v425;
  id v426;
  NSString *v427;
  id v428;
  NSString *v429;
  id v430;
  NSString *v431;
  id v432;
  NSString *v433;
  id v434;
  NSString *v435;
  id v436;
  NSString *v437;
  id v438;
  id v439;
  uint64_t v440;
  uint64_t v441;
  __int128 v442;
  NSString *v443;
  id v444;
  NSString *v445;
  id v446;
  NSString *v447;
  id v448;
  NSString *v449;
  id v450;
  double v451;
  double point;
  double point_8;
  double v454;
  double v455;
  double v456;
  CGFloat v457;
  CGFloat v458;
  CGFloat v459;
  double v460;
  CGFloat v461;
  double v462;
  CGFloat v463;
  double v464;
  CGFloat v465;
  double v466;
  CGFloat v467;
  double v468;
  double v469;
  double v470;
  double MaxY;
  double rect;
  double recta;
  double v474;
  double v475;
  double v476;
  CGFloat v477;
  double v478;
  double v479;
  double v480;
  double y;
  double v482;
  double x;
  double v484;
  unsigned __int8 v485;
  id *location;
  double v487;
  double width;
  double height;
  void *v490;
  __int128 v491;
  double ty;
  CGFloat tyb[2];
  double tya;
  double tx;
  CGFloat txc[2];
  CGFloat txa[2];
  double txb;
  _QWORD v499[4];
  CRLDisplayLink *v500;
  CRLCanvasZoomTracker *v501;
  double v502;
  double v503;
  double v504;
  _QWORD v505[5];
  id v506;
  CATransform3D v507;
  double v508;
  _QWORD v509[6];
  __int128 v510;
  __int128 v511;
  __int128 v512;
  CGAffineTransform v513;
  CATransform3D v514;
  CATransform3D b;
  CGAffineTransform v516;
  __int128 v517;
  __int128 v518;
  CGAffineTransform v519;
  CGAffineTransform v520;
  CATransform3D v521;
  CATransform3D v522;
  CGAffineTransform t2;
  CGAffineTransform v524;
  CGAffineTransform v525;
  CGAffineTransform v526;
  _OWORD v527[3];
  _OWORD v528[2];
  __int128 v529;
  CATransform3D t1;
  CATransform3D transform;
  Freeform::SyncEvent::FetchedRecordZoneChanges::Deletion v532;
  CGPoint v533;
  CGPoint v534;
  CGPoint v535;
  CGPoint v536;
  CGPoint v537;
  CGPoint v538;
  CGPoint v539;
  CGPoint v540;
  CGPoint v541;
  CGPoint v542;
  CGPoint v543;
  CGRect v544;
  CGRect v545;
  CGRect v546;
  CGRect v547;
  CGRect v548;
  CGRect v549;
  CGRect v550;
  CGRect v551;
  CGRect v552;
  CGRect v553;
  CGRect v554;
  CGRect v555;
  CGRect v556;
  CGRect v557;
  CGRect v558;
  CGRect v559;
  CGRect v560;
  CGRect v561;
  CGRect v562;
  CGRect v563;
  CGRect v564;
  CGRect v565;
  CGRect v566;
  CGRect v567;
  CGRect v568;
  CGRect v569;
  CGRect v570;

  ty = a5.x;
  tx = a5.y;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", WeakRetained);

  if (a6 == 2)
  {
    if (qword_10147E570 != -1)
      dispatch_once(&qword_10147E570, &stru_101238880);
    v12 = off_1013D9788;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEBUG))
      sub_100DFBA0C(v12, v13, v14, v15, v16, v17, v18, v19);

  }
  self->_gestureIsFastPinch = 0;
  p_canvasLayer = &self->_canvasLayer;
  v21 = objc_loadWeakRetained((id *)&self->_canvasLayer);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "controller"));

  v23 = objc_loadWeakRetained((id *)&self->_canvasLayer);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "canvasView"));
  v490 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "enclosingScrollView"));

  v485 = objc_msgSend(v22, "shouldCanvasScrollingSizeGrowToFitBoardContent");
  location = (id *)p_delegate;
  switch(a6)
  {
    case 0:
LABEL_18:
      p_savedTransform = &self->_savedTransform;
      v40 = objc_loadWeakRetained((id *)&self->_canvasLayer);
      v41 = v40;
      if (v40)
        objc_msgSend(v40, "affineTransform");
      else
        memset(&transform, 0, 48);
      v42 = *(_OWORD *)&transform.m13;
      *(_OWORD *)&p_savedTransform->a = *(_OWORD *)&transform.m11;
      *(_OWORD *)&self->_savedTransform.c = v42;
      *(_OWORD *)&self->_savedTransform.tx = *(_OWORD *)&transform.m21;

      objc_msgSend(v490, "contentOffset");
      self->_savedContentOffset.x = v43;
      self->_savedContentOffset.y = v44;
      self->_hasGestureOrigin = 0;
      self->_gestureOffset = CGPointZero;
      objc_msgSend(v22, "i_viewWillBeginZooming");
      self->_isZooming = 1;
      self->_zoomVelocitySampleCount = 0;
      self->_zoomVelocity = 0.0;
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      self->_zoomStartTime = v45;
      if (qword_10147E570 != -1)
        dispatch_once(&qword_10147E570, &stru_1012388C0);
      v46 = off_1013D9788;
      if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_DEBUG))
      {
        v439 = objc_loadWeakRetained((id *)&self->_canvasLayer);
        objc_msgSend(v439, "viewScale");
        v441 = v440;
        v442 = *(_OWORD *)&self->_savedTransform.c;
        *(_OWORD *)&transform.m11 = *(_OWORD *)&p_savedTransform->a;
        *(_OWORD *)&transform.m13 = v442;
        *(_OWORD *)&transform.m21 = *(_OWORD *)&self->_savedTransform.tx;
        v443 = NSStringFromCGAffineTransform((CGAffineTransform *)&transform);
        v444 = (id)objc_claimAutoreleasedReturnValue(v443);
        LODWORD(transform.m11) = 134218242;
        *(_QWORD *)((char *)&transform.m11 + 4) = v441;
        WORD2(transform.m12) = 2112;
        *(_QWORD *)((char *)&transform.m12 + 6) = v444;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v46, OS_LOG_TYPE_DEBUG, "Begin zoom. Initial view scale %f initial transform %@", (uint8_t *)&transform, 0x16u);

        p_delegate = (CRLCanvasZoomTrackerDelegate **)location;
      }

      break;
    case 1:
      if (self->_isZooming)
        break;
      goto LABEL_18;
    case 3:
      if (qword_10147E570 != -1)
        dispatch_once(&qword_10147E570, &stru_1012388A0);
      v25 = v490;
      v26 = off_1013D9788;
      if (os_log_type_enabled((os_log_t)off_1013D9788, OS_LOG_TYPE_DEBUG))
        sub_100DFB9D8(v26, v27, v28, v29, v30, v31, v32, v33);
      if (self->_isShowingZoomHUD)
      {
        v34 = objc_loadWeakRetained((id *)p_delegate);
        objc_msgSend(v34, "canvasZoomTrackerDidEndViewScaleFeedback:", self);

      }
      v35 = objc_loadWeakRetained((id *)&self->_canvasLayer);
      *(_OWORD *)txc = *(_OWORD *)&CGAffineTransformIdentity.c;
      v528[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      *(_OWORD *)tyb = v528[0];
      v528[1] = *(_OWORD *)txc;
      v529 = *(_OWORD *)&CGAffineTransformIdentity.tx;
      v491 = v529;
      objc_msgSend(v35, "setAffineTransform:", v528);

      v36 = objc_loadWeakRetained((id *)&self->_canvasLayer);
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "associatedBackgroundLayer"));
      v527[0] = *(_OWORD *)tyb;
      v527[1] = *(_OWORD *)txc;
      v527[2] = v491;
      objc_msgSend(v37, "setDynamicTransform:", v527);

      objc_msgSend(v22, "viewDidEndZooming");
      v38 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v38, "canvasZoomTrackerDidFinish:", self);

      goto LABEL_272;
  }
  zoomVelocitySampleCount = self->_zoomVelocitySampleCount;
  v48 = a4 + (double)zoomVelocitySampleCount++ * self->_zoomVelocity;
  self->_zoomVelocity = v48 / (double)zoomVelocitySampleCount;
  self->_zoomVelocitySampleCount = zoomVelocitySampleCount;
  v49 = objc_loadWeakRetained((id *)&self->_canvasLayer);
  objc_msgSend(v49, "viewScale");
  v51 = v50;

  v52 = objc_loadWeakRetained((id *)&self->_canvasLayer);
  objc_msgSend(v52, "minimumPinchViewScale");
  v54 = v53;

  v55 = objc_loadWeakRetained((id *)&self->_canvasLayer);
  objc_msgSend(v55, "maximumPinchViewScale");
  v57 = v56;

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v59 = v58 - self->_zoomStartTime;
  if (a6 == 2 && v59 < 0.2 && fabs(self->_zoomVelocity) > 0.5)
  {
    self->_gestureIsFastPinch = 1;
    v60 = objc_loadWeakRetained((id *)&self->_canvasLayer);
    objc_msgSend(v60, "viewScale");
    objc_msgSend(v22, "i_nextCanvasViewScaleDetentForProposedViewScale:greater:isFastPinch:", self->_zoomVelocity > 0.0, self->_gestureIsFastPinch);
    v62 = v61;

    p_isShowingZoomHUD = &self->_isShowingZoomHUD;
    if (self->_isShowingZoomHUD)
      goto LABEL_37;
    v64 = objc_loadWeakRetained((id *)&self->_canvasLayer);
    v65 = objc_msgSend(v64, "showsScaleFeedback");

    if (!v65)
      goto LABEL_37;
    v66 = objc_loadWeakRetained((id *)p_delegate);
    v67 = v66;
    v68 = self;
    v69 = 1;
  }
  else
  {
    v62 = v51 * a3;
    if (v59 <= 0.2)
      goto LABEL_37;
    p_isShowingZoomHUD = &self->_isShowingZoomHUD;
    if (self->_isShowingZoomHUD)
      goto LABEL_37;
    v70 = objc_loadWeakRetained((id *)&self->_canvasLayer);
    v71 = objc_msgSend(v70, "showsScaleFeedback");

    if (!v71)
      goto LABEL_37;
    v66 = objc_loadWeakRetained((id *)p_delegate);
    v67 = v66;
    v68 = self;
    v69 = 0;
  }
  objc_msgSend(v66, "canvasZoomTracker:willBeginViewScaleFeedbackWithZoomMethod:", v68, v69);

  *p_isShowingZoomHUD = 1;
LABEL_37:
  v72 = sub_1003C65EC(v62, v54, v57);
  if (-[CRLCanvasZoomTracker fastPinchSnapsViewScale](self, "fastPinchSnapsViewScale") && self->_gestureIsFastPinch
    || -[CRLCanvasZoomTracker slowPinchSnapsViewScale](self, "slowPinchSnapsViewScale"))
  {
    v73 = objc_loadWeakRetained((id *)&self->_canvasLayer);
    objc_msgSend(v73, "viewScale");
    objc_msgSend(v22, "i_viewScaleForProposedViewScale:originalViewScale:isFastPinch:", self->_gestureIsFastPinch, v72, v74);
    v76 = v75;

    v77 = v76 != v72 || self->_gestureIsFastPinch;
    self->_currentlySnappingViewScale = v77;
    v72 = v76;
  }
  else
  {
    self->_currentlySnappingViewScale = 0;
  }
  if (a6 == 2)
  {
    v78 = objc_loadWeakRetained((id *)&self->_canvasLayer);
    objc_msgSend(v78, "viewScale");
    objc_msgSend(v22, "i_canvasCenterOffsetForProposedViewScale:originalViewScale:", v72, v79);
    width = v80;
    height = v81;

    if (qword_10147E570 != -1)
      dispatch_once(&qword_10147E570, &stru_1012388E0);
    v82 = off_1013D9788;
    if (os_log_type_enabled((os_log_t)v82, OS_LOG_TYPE_DEBUG))
      sub_100DFB958(width, height);

    v62 = v72;
  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  v479 = v72;
  if (v62 >= v54)
  {
    if (v62 > v57)
      v62 = v57 + (1.0 - 3.0 / (v62 - v57 + 3.0)) * 0.8;
  }
  else
  {
    v62 = v54 + (1.0 - 3.0 / (v54 - v62 + 3.0)) * -0.8;
  }
  v83 = objc_loadWeakRetained((id *)&self->_canvasLayer);
  objc_msgSend(v83, "unscaledSize");
  v84 = sub_10005FDDC();
  v86 = v85;
  v88 = v87;
  v90 = v89;

  v91 = objc_loadWeakRetained((id *)&self->_canvasLayer);
  objc_msgSend(v91, "viewScale");
  v93 = sub_100060FD8(v84, v86, v88, v90, v92);
  v95 = v94;
  v97 = v96;
  v99 = v98;

  v100 = objc_loadWeakRetained((id *)&self->_canvasLayer);
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "controller"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "canvas"));
  v103 = objc_msgSend(v102, "isAnchoredAtRight");

  v104 = 0.0;
  if (v103)
    v104 = v97;
  v464 = v97;
  v105 = sub_100061400(v93 - v104, v95, v97, v99);
  v466 = v106;
  v468 = v105;
  v107 = objc_loadWeakRetained((id *)&self->_canvasLayer);
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "canvasView"));
  v109 = objc_loadWeakRetained((id *)&self->_canvasLayer);
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "canvasView"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "superview"));
  objc_msgSend(v108, "convertPoint:toView:", v111, ty, tx);
  v113 = v112;
  v115 = v114;

  v25 = v490;
  v116 = location;
  if (!self->_hasGestureOrigin)
  {
    memset(&transform, 0, 48);
    v117 = objc_loadWeakRetained((id *)&self->_canvasLayer);
    v118 = v117;
    if (v117)
      objc_msgSend(v117, "affineTransform");
    else
      memset(&v526, 0, sizeof(v526));
    CGAffineTransformInvert((CGAffineTransform *)&transform, &v526);

    self->_scaledZoomOrigin = (CGPoint)vaddq_f64(*(float64x2_t *)&transform.m21, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&transform.m13, tx), *(float64x2_t *)&transform.m11, ty));
    if (qword_10147E570 != -1)
      dispatch_once(&qword_10147E570, &stru_101238900);
    v119 = off_1013D9788;
    if (os_log_type_enabled((os_log_t)v119, OS_LOG_TYPE_DEBUG))
    {
      v445 = NSStringFromCGPoint(self->_scaledZoomOrigin);
      v446 = (id)objc_claimAutoreleasedReturnValue(v445);
      v543.x = ty;
      v543.y = tx;
      v447 = NSStringFromCGPoint(v543);
      v448 = (id)objc_claimAutoreleasedReturnValue(v447);
      *(_OWORD *)&t1.m11 = *(_OWORD *)&transform.m11;
      *(_OWORD *)&t1.m13 = *(_OWORD *)&transform.m13;
      *(_OWORD *)&t1.m21 = *(_OWORD *)&transform.m21;
      v449 = NSStringFromCGAffineTransform((CGAffineTransform *)&t1);
      v450 = (id)objc_claimAutoreleasedReturnValue(v449);
      LODWORD(t1.m11) = 138412802;
      *(_QWORD *)((char *)&t1.m11 + 4) = v446;
      WORD2(t1.m12) = 2112;
      *(_QWORD *)((char *)&t1.m12 + 6) = v448;
      HIWORD(t1.m13) = 2112;
      *(_QWORD *)&t1.m14 = v450;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v119, OS_LOG_TYPE_DEBUG, "mScaledZoomOrigin %@ transforms locationInView %@ by inverse canvas layer transform %@", (uint8_t *)&t1, 0x20u);

      v116 = location;
    }

    self->_gestureOrigin.x = v113;
    self->_gestureOrigin.y = v115;
    self->_hasGestureOrigin = 1;
  }
  y = self->_scaledZoomOrigin.y;
  x = self->_scaledZoomOrigin.x;
  if (a6 != 2)
  {
    self->_gestureOffset.x = sub_1000603B8(v113, v115, self->_gestureOrigin.x);
    self->_gestureOffset.y = v120;
  }
  objc_msgSend(v490, "bounds");
  v121 = sub_10005FDDC();
  rect = v122;
  v474 = v121;
  v124 = v123;
  v126 = v125;
  v480 = v62;
  if ((v485 & 1) == 0)
  {
    v127 = objc_loadWeakRetained((id *)&self->_canvasLayer);
    objc_msgSend(v127, "unscaledSize");
    v130 = sub_1000603DC(v128, v129, v62);
    v132 = v131;

    v133 = fmax((v130 - v124) * 0.5, 0.0);
    v134 = fmax((v132 - v126) * 0.5, 0.0);
    if (a6 == 2)
    {
      self->_gestureOffset.x = sub_1003C65EC(self->_gestureOffset.x, -v133, v133);
      v135 = sub_1003C65EC(self->_gestureOffset.y, -v134, v134);
    }
    else
    {
      v136 = objc_loadWeakRetained((id *)&self->_canvasLayer);
      v137 = objc_msgSend(v136, "isInfinite");

      if ((v137 & 1) != 0)
        goto LABEL_88;
      if (-[CRLCanvasZoomTracker alwaysUsesTranslationSprings](self, "alwaysUsesTranslationSprings"))
      {
        v138 = 0.8;
      }
      else
      {
        v139 = objc_loadWeakRetained((id *)&self->_canvasLayer);
        objc_msgSend(v139, "viewScale");
        if (v62 >= 1.0 || v140 < 1.0)
          v138 = 0.800000012;
        else
          v138 = 1.0;

      }
      v142 = self->_gestureOffset.x;
      v143 = 0.0;
      v144 = 0.0;
      if (v142 != 0.0)
      {
        v145 = fabs(v142);
        v144 = v145 * fmax((v145 - v133) / v145, 0.0);
      }
      v146 = sub_1003C65EC(v142, -v133, v133);
      v147 = v144;
      v148 = v138;
      *(double *)v149.i64 = powf(v147, v148);
      v150.f64[0] = NAN;
      v150.f64[1] = NAN;
      v151 = (int8x16_t)vnegq_f64(v150);
      v153.i64[0] = *(_QWORD *)&self->_gestureOffset.x;
      v152 = self->_gestureOffset.y;
      *(int8x16_t *)txa = v151;
      self->_gestureOffset.x = v146 + *(double *)vbslq_s8(v151, v149, v153).i64;
      if (v152 != 0.0)
      {
        v154 = fabs(v152);
        v143 = v154 * fmax((v154 - v134) / v154, 0.0);
      }
      v155 = sub_1003C65EC(v152, -v134, v134);
      v156 = v143;
      v157 = v138;
      *(double *)v158.i64 = powf(v156, v157);
      v159.i64[0] = *(_QWORD *)&self->_gestureOffset.y;
      v135 = v155 + *(double *)vbslq_s8(*(int8x16_t *)txa, v158, v159).i64;
    }
    self->_gestureOffset.y = v135;
  }
LABEL_88:
  v470 = v124;
  v476 = v126;
  if (self->_isShowingZoomHUD)
  {
    v160 = objc_loadWeakRetained(v116);
    objc_msgSend(v160, "canvasZoomTracker:willUpdateViewScaleFeedbackWithScale:", self, v479);

  }
  v161 = objc_loadWeakRetained((id *)&self->_canvasLayer);
  objc_msgSend(v161, "bounds");
  v163 = v162;
  v165 = v164;
  v167 = v166;
  v169 = v168;

  v170 = sub_10005FDDC();
  v174 = sub_100061400(v170, v171, v172, v173);
  v176 = v175;
  v177 = objc_loadWeakRetained((id *)&self->_canvasLayer);
  objc_msgSend(v177, "anchorPoint");
  v179 = v178;
  v181 = v180;

  v544.origin.x = v163;
  v544.origin.y = v165;
  v544.size.width = v167;
  v544.size.height = v169;
  v182 = v179 * CGRectGetWidth(v544);
  v545.origin.x = v163;
  v545.origin.y = v165;
  v545.size.width = v167;
  v545.size.height = v169;
  v183 = v181 * CGRectGetHeight(v545);
  v487 = v174;
  txb = sub_1000603B8(v174, v176, v182);
  tya = v184;
  if (a6 == 2)
  {
    if (qword_10147E570 != -1)
      dispatch_once(&qword_10147E570, &stru_101238920);
    v185 = off_1013D9788;
    if (os_log_type_enabled((os_log_t)v185, OS_LOG_TYPE_DEBUG))
      sub_100DFB8D8(v163, v165, v167, v169);

    if (qword_10147E570 != -1)
      dispatch_once(&qword_10147E570, &stru_101238940);
    v186 = off_1013D9788;
    if (os_log_type_enabled((os_log_t)v186, OS_LOG_TYPE_DEBUG))
      sub_100DFB858(v174, v176);

    if (qword_10147E570 != -1)
      dispatch_once(&qword_10147E570, &stru_101238960);
    v187 = off_1013D9788;
    if (os_log_type_enabled((os_log_t)v187, OS_LOG_TYPE_DEBUG))
      sub_100DFB7D8(v182, v183);

    if (qword_10147E570 != -1)
      dispatch_once(&qword_10147E570, &stru_101238980);
    v188 = off_1013D9788;
    if (os_log_type_enabled((os_log_t)v188, OS_LOG_TYPE_DEBUG))
      sub_100DFB758(txb, tya);

  }
  if (qword_10147E570 != -1)
    dispatch_once(&qword_10147E570, &stru_1012389A0);
  v189 = off_1013D9788;
  if (os_log_type_enabled((os_log_t)v189, OS_LOG_TYPE_DEBUG))
  {
    v533.y = y;
    v533.x = x;
    v330 = NSStringFromCGPoint(v533);
    v331 = (id)objc_claimAutoreleasedReturnValue(v330);
    v555.origin.x = v163;
    v555.origin.y = v165;
    v555.size.width = v167;
    v555.size.height = v169;
    v332 = NSStringFromCGRect(v555);
    v333 = (id)objc_claimAutoreleasedReturnValue(v332);
    LODWORD(transform.m11) = 138412546;
    *(_QWORD *)((char *)&transform.m11 + 4) = v331;
    WORD2(transform.m12) = 2112;
    *(_QWORD *)((char *)&transform.m12 + 6) = v333;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v189, OS_LOG_TYPE_DEBUG, "zoomOriginInBounds %@ canvasLayerBounds %@", (uint8_t *)&transform, 0x16u);

  }
  v190 = sub_1000603B8(x, y, v163);
  v192 = v191;
  v193 = sub_1000603B8(v190, v191, v174);
  v195 = v194;
  if (qword_10147E570 != -1)
    dispatch_once(&qword_10147E570, &stru_1012389C0);
  v196 = off_1013D9788;
  if (os_log_type_enabled((os_log_t)v196, OS_LOG_TYPE_DEBUG))
  {
    v534.x = v190;
    v534.y = v192;
    v334 = NSStringFromCGPoint(v534);
    v335 = (id)objc_claimAutoreleasedReturnValue(v334);
    v535.x = v193;
    v535.y = v195;
    v336 = NSStringFromCGPoint(v535);
    v337 = (id)objc_claimAutoreleasedReturnValue(v336);
    LODWORD(transform.m11) = 138412546;
    *(_QWORD *)((char *)&transform.m11 + 4) = v335;
    WORD2(transform.m12) = 2112;
    *(_QWORD *)((char *)&transform.m12 + 6) = v337;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v196, OS_LOG_TYPE_DEBUG, "zoomOriginRelativeToFrameOrigin %@ zoomOriginRelativeToViewAnchor %@", (uint8_t *)&transform, 0x16u);

  }
  v197 = objc_loadWeakRetained((id *)&self->_canvasLayer);
  objc_msgSend(v197, "viewScale");
  v199 = v198;

  objc_msgSend(v490, "contentOffset");
  v201 = v200;
  v203 = v202;
  if (qword_10147E570 != -1)
    dispatch_once(&qword_10147E570, &stru_1012389E0);
  v204 = off_1013D9788;
  if (os_log_type_enabled((os_log_t)v204, OS_LOG_TYPE_DEBUG))
  {
    v338 = NSStringFromCGPoint(self->_gestureOffset);
    v339 = (id)objc_claimAutoreleasedReturnValue(v338);
    v536.x = v201;
    v536.y = v203;
    v340 = NSStringFromCGPoint(v536);
    v341 = (id)objc_claimAutoreleasedReturnValue(v340);
    LODWORD(transform.m11) = 138412546;
    *(_QWORD *)((char *)&transform.m11 + 4) = v339;
    WORD2(transform.m12) = 2112;
    *(_QWORD *)((char *)&transform.m12 + 6) = v341;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v204, OS_LOG_TYPE_DEBUG, "mGestureOffset %@, scaledContentOffset %@", (uint8_t *)&transform, 0x16u);

  }
  v205 = *(_OWORD *)&self->_savedTransform.c;
  *(_OWORD *)&v525.a = *(_OWORD *)&self->_savedTransform.a;
  *(_OWORD *)&v525.c = v205;
  v207 = *(_OWORD *)&self->_savedTransform.a;
  v206 = *(_OWORD *)&self->_savedTransform.c;
  *(_OWORD *)&v525.tx = *(_OWORD *)&self->_savedTransform.tx;
  *(_OWORD *)&transform.m11 = v207;
  *(_OWORD *)&transform.m13 = v206;
  *(_OWORD *)&transform.m21 = *(_OWORD *)&self->_savedTransform.tx;
  CGAffineTransformTranslate(&v525, (CGAffineTransform *)&transform, txb, tya);
  if (qword_10147E570 != -1)
    dispatch_once(&qword_10147E570, &stru_101238A00);
  v208 = off_1013D9788;
  if (os_log_type_enabled((os_log_t)v208, OS_LOG_TYPE_DEBUG))
    sub_100DFB6D8((__n128 *)&v525);

  v209 = self->_gestureOffset.x;
  v210 = self->_gestureOffset.y;
  *(_OWORD *)&t1.m11 = *(_OWORD *)&v525.a;
  *(_OWORD *)&t1.m13 = *(_OWORD *)&v525.c;
  *(_OWORD *)&t1.m21 = *(_OWORD *)&v525.tx;
  CGAffineTransformTranslate((CGAffineTransform *)&transform, (CGAffineTransform *)&t1, v209, v210);
  *(_OWORD *)&v525.a = *(_OWORD *)&transform.m11;
  *(_OWORD *)&v525.c = *(_OWORD *)&transform.m13;
  *(_OWORD *)&v525.tx = *(_OWORD *)&transform.m21;
  if (qword_10147E570 != -1)
    dispatch_once(&qword_10147E570, &stru_101238A20);
  v211 = off_1013D9788;
  if (os_log_type_enabled((os_log_t)v211, OS_LOG_TYPE_DEBUG))
    sub_100DFB658((__n128 *)&v525);

  *(_OWORD *)&t1.m11 = *(_OWORD *)&v525.a;
  *(_OWORD *)&t1.m13 = *(_OWORD *)&v525.c;
  *(_OWORD *)&t1.m21 = *(_OWORD *)&v525.tx;
  CGAffineTransformTranslate((CGAffineTransform *)&transform, (CGAffineTransform *)&t1, v193, v195);
  *(_OWORD *)&v525.a = *(_OWORD *)&transform.m11;
  *(_OWORD *)&v525.c = *(_OWORD *)&transform.m13;
  *(_OWORD *)&v525.tx = *(_OWORD *)&transform.m21;
  if (qword_10147E570 != -1)
    dispatch_once(&qword_10147E570, &stru_101238A40);
  v212 = v480 / v199;
  v213 = off_1013D9788;
  if (os_log_type_enabled((os_log_t)v213, OS_LOG_TYPE_DEBUG))
    sub_100DFB5D8((__n128 *)&v525);

  *(_OWORD *)&t1.m11 = *(_OWORD *)&v525.a;
  *(_OWORD *)&t1.m13 = *(_OWORD *)&v525.c;
  *(_OWORD *)&t1.m21 = *(_OWORD *)&v525.tx;
  CGAffineTransformScale((CGAffineTransform *)&transform, (CGAffineTransform *)&t1, v212, v212);
  *(_OWORD *)&v525.a = *(_OWORD *)&transform.m11;
  *(_OWORD *)&v525.c = *(_OWORD *)&transform.m13;
  *(_OWORD *)&v525.tx = *(_OWORD *)&transform.m21;
  if (qword_10147E570 != -1)
    dispatch_once(&qword_10147E570, &stru_101238A60);
  v214 = off_1013D9788;
  if (os_log_type_enabled((os_log_t)v214, OS_LOG_TYPE_DEBUG))
    sub_100DFB558((__n128 *)&v525);

  *(_OWORD *)&t1.m11 = *(_OWORD *)&v525.a;
  *(_OWORD *)&t1.m13 = *(_OWORD *)&v525.c;
  *(_OWORD *)&t1.m21 = *(_OWORD *)&v525.tx;
  CGAffineTransformTranslate((CGAffineTransform *)&transform, (CGAffineTransform *)&t1, -v193, -v195);
  *(_OWORD *)&v525.a = *(_OWORD *)&transform.m11;
  *(_OWORD *)&v525.c = *(_OWORD *)&transform.m13;
  *(_OWORD *)&v525.tx = *(_OWORD *)&transform.m21;
  if (qword_10147E570 != -1)
    dispatch_once(&qword_10147E570, &stru_101238A80);
  v215 = off_1013D9788;
  if (os_log_type_enabled((os_log_t)v215, OS_LOG_TYPE_DEBUG))
    sub_100DFB4D8((__n128 *)&v525);

  v216 = CGPointZero.y;
  memset(&v524, 0, sizeof(v524));
  CGAffineTransformMakeTranslation(&v524, width - CGPointZero.x, height - v216);
  *(_OWORD *)&t1.m11 = *(_OWORD *)&v525.a;
  *(_OWORD *)&t1.m13 = *(_OWORD *)&v525.c;
  *(_OWORD *)&t1.m21 = *(_OWORD *)&v525.tx;
  t2 = v524;
  CGAffineTransformConcat((CGAffineTransform *)&transform, (CGAffineTransform *)&t1, &t2);
  *(_OWORD *)&v525.a = *(_OWORD *)&transform.m11;
  *(_OWORD *)&v525.c = *(_OWORD *)&transform.m13;
  *(_OWORD *)&v525.tx = *(_OWORD *)&transform.m21;
  if (qword_10147E570 != -1)
    dispatch_once(&qword_10147E570, &stru_101238AA0);
  v217 = off_1013D9788;
  if (os_log_type_enabled((os_log_t)v217, OS_LOG_TYPE_DEBUG))
    sub_100DFB458((__n128 *)&v525);

  *(_OWORD *)&t1.m11 = *(_OWORD *)&v525.a;
  *(_OWORD *)&t1.m13 = *(_OWORD *)&v525.c;
  *(_OWORD *)&t1.m21 = *(_OWORD *)&v525.tx;
  CGAffineTransformTranslate((CGAffineTransform *)&transform, (CGAffineTransform *)&t1, -txb, -tya);
  *(_OWORD *)&v525.a = *(_OWORD *)&transform.m11;
  *(_OWORD *)&v525.c = *(_OWORD *)&transform.m13;
  *(_OWORD *)&v525.tx = *(_OWORD *)&transform.m21;
  if (qword_10147E570 != -1)
    dispatch_once(&qword_10147E570, &stru_101238AC0);
  v218 = off_1013D9788;
  if (os_log_type_enabled((os_log_t)v218, OS_LOG_TYPE_DEBUG))
    sub_100DFB3D8((__n128 *)&v525);

  if (a6 != 2)
  {
    memset(&transform, 0, sizeof(transform));
    *(_OWORD *)&t1.m11 = *(_OWORD *)&v525.a;
    *(_OWORD *)&t1.m13 = *(_OWORD *)&v525.c;
    *(_OWORD *)&t1.m21 = *(_OWORD *)&v525.tx;
    CATransform3DMakeAffineTransform(&transform, (CGAffineTransform *)&t1);
    transform.m33 = transform.m11;
    v522 = transform;
    v310 = objc_loadWeakRetained((id *)&self->_canvasLayer);
    v521 = v522;
    objc_msgSend(v310, "setTransform:", &v521);

    v520 = v525;
    v311 = objc_loadWeakRetained((id *)p_canvasLayer);
    v312 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v311, "associatedBackgroundLayer"));
    v519 = v520;
    objc_msgSend(v312, "setDynamicTransform:", &v519);

    objc_msgSend(v22, "i_viewIsZoomingAtPoint:", x, y);
    objc_msgSend(v22, "i_viewDidZoomToViewScale:notify:", 1, v479);
    goto LABEL_272;
  }
  v219 = sub_1000603B8(v468, v466, v163);
  v221 = v220;
  if (qword_10147E570 != -1)
    dispatch_once(&qword_10147E570, &stru_101238AE0);
  v222 = off_1013D9788;
  v478 = v201;
  if (os_log_type_enabled((os_log_t)v222, OS_LOG_TYPE_DEBUG))
  {
    v537.x = v219;
    v537.y = v221;
    v399 = NSStringFromCGPoint(v537);
    v400 = (id)objc_claimAutoreleasedReturnValue(v399);
    LODWORD(transform.m11) = 138412290;
    *(_QWORD *)((char *)&transform.m11 + 4) = v400;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v222, OS_LOG_TYPE_DEBUG, "boundsCenterRelativeToFrameOrigin %@", (uint8_t *)&transform, 0xCu);

  }
  v223 = sub_1000603B8(v219, v221, v174);
  v225 = v224;
  if (qword_10147E570 != -1)
    dispatch_once(&qword_10147E570, &stru_101238B00);
  v226 = off_1013D9788;
  v451 = v219;
  if (os_log_type_enabled((os_log_t)v226, OS_LOG_TYPE_DEBUG))
  {
    v538.x = v223;
    v538.y = v225;
    v401 = NSStringFromCGPoint(v538);
    v402 = (id)objc_claimAutoreleasedReturnValue(v401);
    LODWORD(transform.m11) = 138412290;
    *(_QWORD *)((char *)&transform.m11 + 4) = v402;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v226, OS_LOG_TYPE_DEBUG, "boundsCenterRelativeToViewCenter %@", (uint8_t *)&transform, 0xCu);

  }
  memset(&t2, 0, sizeof(t2));
  *(_OWORD *)&transform.m11 = *(_OWORD *)&v525.a;
  *(_OWORD *)&transform.m13 = *(_OWORD *)&v525.c;
  *(_OWORD *)&transform.m21 = *(_OWORD *)&v525.tx;
  sub_1000796D4(&transform, &t2, txb, tya);
  v227 = sub_10005FD98(v223, v225, v464);
  v229 = v228;
  v231 = v230;
  v233 = v232;
  if (qword_10147E570 != -1)
    dispatch_once(&qword_10147E570, &stru_101238B20);
  v234 = off_1013D9788;
  if (os_log_type_enabled((os_log_t)v234, OS_LOG_TYPE_DEBUG))
  {
    v560.origin.x = v227;
    v560.origin.y = v229;
    v560.size.width = v231;
    v560.size.height = v233;
    v403 = NSStringFromCGRect(v560);
    v404 = (id)objc_claimAutoreleasedReturnValue(v403);
    LODWORD(transform.m11) = 138412290;
    *(_QWORD *)((char *)&transform.m11 + 4) = v404;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v234, OS_LOG_TYPE_DEBUG, "transformedRect1 %@", (uint8_t *)&transform, 0xCu);

  }
  *(_OWORD *)&transform.m11 = *(_OWORD *)&t2.a;
  *(_OWORD *)&transform.m13 = *(_OWORD *)&t2.c;
  *(_OWORD *)&transform.m21 = *(_OWORD *)&t2.tx;
  v546.origin.x = v227;
  v546.origin.y = v229;
  v546.size.width = v231;
  v463 = v233;
  v546.size.height = v233;
  v547 = CGRectApplyAffineTransform(v546, (CGAffineTransform *)&transform);
  v235 = v547.origin.x;
  v236 = v547.origin.y;
  v237 = v547.size.width;
  v238 = v547.size.height;
  if (qword_10147E570 != -1)
    dispatch_once(&qword_10147E570, &stru_101238B40);
  v239 = off_1013D9788;
  if (os_log_type_enabled((os_log_t)v239, OS_LOG_TYPE_DEBUG))
  {
    v561.origin.x = v235;
    v561.origin.y = v236;
    v561.size.width = v237;
    v561.size.height = v238;
    v405 = NSStringFromCGRect(v561);
    v406 = (id)objc_claimAutoreleasedReturnValue(v405);
    LODWORD(transform.m11) = 138412290;
    *(_QWORD *)((char *)&transform.m11 + 4) = v406;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v239, OS_LOG_TYPE_DEBUG, "transformedRect2 %@", (uint8_t *)&transform, 0xCu);

  }
  v240 = sub_1000603D0(v235, v236, v487);
  v242 = v241;
  if (qword_10147E570 != -1)
    dispatch_once(&qword_10147E570, &stru_101238B60);
  v243 = off_1013D9788;
  if (os_log_type_enabled((os_log_t)v243, OS_LOG_TYPE_DEBUG))
  {
    v562.origin.x = v240;
    v562.origin.y = v242;
    v562.size.width = v237;
    v562.size.height = v238;
    v407 = NSStringFromCGRect(v562);
    v408 = (id)objc_claimAutoreleasedReturnValue(v407);
    LODWORD(transform.m11) = 138412290;
    *(_QWORD *)((char *)&transform.m11 + 4) = v408;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v243, OS_LOG_TYPE_DEBUG, "transformedRect3 %@", (uint8_t *)&transform, 0xCu);

  }
  v244 = sub_1000603B8(v240, v242, v478);
  v246 = v245;
  if (qword_10147E570 != -1)
    dispatch_once(&qword_10147E570, &stru_101238B80);
  v247 = off_1013D9788;
  if (os_log_type_enabled((os_log_t)v247, OS_LOG_TYPE_DEBUG))
  {
    v563.origin.x = v244;
    v563.origin.y = v246;
    v563.size.width = v237;
    v563.size.height = v238;
    v409 = NSStringFromCGRect(v563);
    v410 = (id)objc_claimAutoreleasedReturnValue(v409);
    LODWORD(transform.m11) = 138412290;
    *(_QWORD *)((char *)&transform.m11 + 4) = v410;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v247, OS_LOG_TYPE_DEBUG, "transformedRect4 %@", (uint8_t *)&transform, 0xCu);

  }
  v548.origin.x = v244;
  v548.origin.y = v246;
  v548.size.width = v237;
  v548.size.height = v238;
  v482 = -height;
  v484 = -width;
  v549 = CGRectOffset(v548, -width, -height);
  v248 = v549.origin.x;
  v249 = v549.origin.y;
  v250 = v549.size.width;
  v251 = v549.size.height;
  if (qword_10147E570 != -1)
    dispatch_once(&qword_10147E570, &stru_101238BA0);
  v252 = off_1013D9788;
  v454 = v221;
  v467 = v229;
  v469 = v227;
  v465 = v231;
  if (os_log_type_enabled((os_log_t)v252, OS_LOG_TYPE_DEBUG))
  {
    v564.origin.x = v248;
    v564.origin.y = v249;
    v564.size.width = v250;
    v564.size.height = v251;
    v411 = NSStringFromCGRect(v564);
    v412 = (id)objc_claimAutoreleasedReturnValue(v411);
    LODWORD(transform.m11) = 138412290;
    *(_QWORD *)((char *)&transform.m11 + 4) = v412;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v252, OS_LOG_TYPE_DEBUG, "transformedRect5 %@", (uint8_t *)&transform, 0xCu);

  }
  v253 = objc_loadWeakRetained((id *)&self->_canvasLayer);
  objc_msgSend(v253, "contentInset");
  v459 = v249;
  v461 = v248;
  v255 = v248 + v254;
  v257 = v249 + v256;
  v457 = v251;
  v458 = v250;
  v259 = v250 - (v254 + v258);
  v261 = v251 - (v256 + v260);

  objc_msgSend(v490, "adjustedContentInset");
  v263 = v262;
  v265 = v264;
  v268 = -v267 - v264;
  v269 = -v266 - v262;
  if (qword_10147E570 != -1)
    dispatch_once(&qword_10147E570, &stru_101238BC0);
  point_8 = v255 - v265;
  v455 = v257 - v263;
  v456 = v259 - v268;
  v270 = off_1013D9788;
  if (os_log_type_enabled((os_log_t)v270, OS_LOG_TYPE_DEBUG))
  {
    v565.origin.x = v255 - v265;
    v565.origin.y = v257 - v263;
    v565.size.width = v259 - v268;
    v565.size.height = v261 - v269;
    v413 = NSStringFromCGRect(v565);
    v414 = (id)objc_claimAutoreleasedReturnValue(v413);
    LODWORD(transform.m11) = 138412290;
    *(_QWORD *)((char *)&transform.m11 + 4) = v414;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v270, OS_LOG_TYPE_DEBUG, "transformedAndInsetRect %@", (uint8_t *)&transform, 0xCu);

  }
  if (qword_10147E570 != -1)
    dispatch_once(&qword_10147E570, &stru_101238BE0);
  v271 = v474 + width * 2.0;
  v272 = rect + height * 2.0;
  v273 = v470 + v484 * 2.0;
  v274 = v476 + v482 * 2.0;
  v275 = off_1013D9788;
  if (os_log_type_enabled((os_log_t)v275, OS_LOG_TYPE_DEBUG))
    sub_100DFB2EC(v456 >= v273, v261 - v269 >= v274, v275);
  recta = v261 - v269;

  v517 = *(_OWORD *)&t2.a;
  v518 = *(_OWORD *)&t2.c;
  v475 = t2.tx;
  v477 = t2.ty;
  v550.origin.x = v461;
  v550.origin.y = v459;
  v550.size.width = v458;
  v550.size.height = v457;
  point = CGRectGetMaxX(v550);
  v551.origin.x = v461;
  v551.origin.y = v459;
  v551.size.width = v458;
  v551.size.height = v457;
  MaxY = CGRectGetMaxY(v551);
  v552.origin.x = v271;
  v552.origin.y = v272;
  v552.size.width = v273;
  v552.size.height = v274;
  MaxX = CGRectGetMaxX(v552);
  objc_msgSend(v490, "adjustedContentInset");
  v278 = v277;
  v553.origin.x = v271;
  v553.origin.y = v272;
  v553.size.width = v273;
  v553.size.height = v274;
  v279 = CGRectGetMaxY(v553);
  objc_msgSend(v490, "adjustedContentInset");
  v281 = v280;
  if (qword_10147E570 != -1)
    dispatch_once(&qword_10147E570, &stru_101238C00);
  v462 = MaxX - v278;
  v282 = off_1013D9788;
  if (os_log_type_enabled((os_log_t)v282, OS_LOG_TYPE_DEBUG))
  {
    v539.x = point_8;
    v539.y = v455;
    v415 = NSStringFromCGPoint(v539);
    v416 = (id)objc_claimAutoreleasedReturnValue(v415);
    v540.x = point;
    v540.y = MaxY;
    v417 = NSStringFromCGPoint(v540);
    v418 = (id)objc_claimAutoreleasedReturnValue(v417);
    v541.x = MaxX - v278;
    v541.y = v279 - v281;
    v419 = NSStringFromCGPoint(v541);
    v420 = (id)objc_claimAutoreleasedReturnValue(v419);
    LODWORD(transform.m11) = 138412802;
    *(_QWORD *)((char *)&transform.m11 + 4) = v416;
    WORD2(transform.m12) = 2112;
    *(_QWORD *)((char *)&transform.m12 + 6) = v418;
    HIWORD(transform.m13) = 2112;
    *(_QWORD *)&transform.m14 = v420;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v282, OS_LOG_TYPE_DEBUG, "currentContentOffset %@ bottomRightPoint %@ svBottomRight %@", (uint8_t *)&transform, 0x20u);

  }
  v460 = v279 - v281;

  objc_msgSend(v490, "contentOffset");
  v283 = objc_msgSend(v22, "sizeOfScrollViewEnclosingCanvas");
  v532 = SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v283, v284);
  v286 = v285;
  v288 = v287;
  v290 = v289;
  v292 = v291;
  objc_msgSend(v490, "adjustedContentInset", v532.recordType._object);
  v297 = sub_100061400(v286 + v296, v288 + v293, v290 - (v296 + v294), v292 - (v293 + v295));
  v299 = sub_1000603D0(v297, v298, width);
  v301 = v300;
  if (qword_10147E570 != -1)
    dispatch_once(&qword_10147E570, &stru_101238C20);
  v302 = off_1013D9788;
  if (os_log_type_enabled((os_log_t)v302, OS_LOG_TYPE_DEBUG))
    sub_100DFB26C(v299, v301);

  if (qword_10147E570 != -1)
    dispatch_once(&qword_10147E570, &stru_101238C40);
  v303 = off_1013D9788;
  if (os_log_type_enabled((os_log_t)v303, OS_LOG_TYPE_DEBUG))
  {
    *(_OWORD *)&transform.m11 = v517;
    *(_OWORD *)&transform.m13 = v518;
    transform.m21 = v475;
    transform.m22 = v477;
    v421 = NSStringFromCGAffineTransform((CGAffineTransform *)&transform);
    v422 = (id)objc_claimAutoreleasedReturnValue(v421);
    LODWORD(transform.m11) = 138412290;
    *(_QWORD *)((char *)&transform.m11 + 4) = v422;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v303, OS_LOG_TYPE_DEBUG, "adjustedTransform before horizontal and vertical clamping %@", (uint8_t *)&transform, 0xCu);

  }
  if ((v485 & 1) == 0)
  {
    v313 = objc_loadWeakRetained((id *)&self->_canvasLayer);
    v314 = v313;
    if (v456 < v273)
    {
      v321 = objc_msgSend(v313, "horizontallyCenteredInScrollView", v456);

      if (v321)
      {
        v309 = v299 - v451;
        v318 = v454;
        v307 = v465;
        v319 = v477;
      }
      else
      {
        v326 = objc_loadWeakRetained((id *)&self->_canvasLayer);
        v327 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v326, "controller"));
        v328 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v327, "canvas"));
        v329 = objc_msgSend(v328, "isAnchoredAtRight");

        v318 = v454;
        v319 = v477;
        if (v329)
        {
          v554.origin.x = point_8;
          v554.origin.y = v455;
          v554.size.width = v456;
          v554.size.height = recta;
          v309 = v475 + v273 - CGRectGetMaxX(v554);
        }
        else
        {
          v309 = v475 - point_8;
        }
        v307 = v465;
      }
LABEL_216:
      if (recta < v274)
      {
        v342 = objc_loadWeakRetained((id *)&self->_canvasLayer);
        v343 = objc_msgSend(v342, "verticallyCenteredInScrollView");

        v305 = v469;
        if (v343)
          v308 = v301 - v318;
        else
          v308 = v319 - v455;
        v304 = v467;
        v306 = v463;
      }
      else
      {
        v305 = v469;
        if (v455 >= v272)
        {
          v319 = v272 - v455 + v319;
          v304 = v467;
        }
        else
        {
          v304 = v467;
          if (MaxY < v460)
            v319 = v319 + v460 - MaxY;
        }
        v306 = v463;
        v308 = v319 - height;
      }
      goto LABEL_226;
    }
    v315 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v313, "controller", v456));
    v316 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v315, "canvas"));
    v317 = objc_msgSend(v316, "isAnchoredAtRight");

    if ((v317 & 1) != 0)
    {
      v318 = v454;
      v307 = v465;
      v320 = v475;
      v319 = v477;
    }
    else
    {
      v307 = v465;
      v320 = v475;
      if (point_8 >= v271)
      {
        v320 = v271 - point_8 + v475;
      }
      else if (point < v462)
      {
        v322 = objc_loadWeakRetained((id *)&self->_canvasLayer);
        v323 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v322, "controller"));
        v324 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v323, "canvas"));
        v325 = objc_msgSend(v324, "isAnchoredAtRight");

        v318 = v454;
        v319 = v477;
        if ((v325 & 1) == 0)
          v320 = v475 + v462 - point;
        goto LABEL_213;
      }
      v318 = v454;
      v319 = v477;
    }
LABEL_213:
    v309 = v320 - width;
    goto LABEL_216;
  }
  v304 = v467;
  v305 = v469;
  v306 = v463;
  v307 = v465;
  v309 = v475;
  v308 = v477;
LABEL_226:
  if (qword_10147E570 != -1)
    dispatch_once(&qword_10147E570, &stru_101238C60);
  v344 = off_1013D9788;
  if (os_log_type_enabled((os_log_t)v344, OS_LOG_TYPE_DEBUG))
  {
    *(_OWORD *)&transform.m11 = v517;
    *(_OWORD *)&transform.m13 = v518;
    transform.m21 = v309;
    transform.m22 = v308;
    v423 = NSStringFromCGAffineTransform((CGAffineTransform *)&transform);
    v424 = (id)objc_claimAutoreleasedReturnValue(v423);
    LODWORD(transform.m11) = 138412290;
    *(_QWORD *)((char *)&transform.m11 + 4) = v424;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v344, OS_LOG_TYPE_DEBUG, "adjustedTransform after horizontal and vertical clamping %@", (uint8_t *)&transform, 0xCu);

  }
  if (qword_10147E570 != -1)
    dispatch_once(&qword_10147E570, &stru_101238C80);
  v345 = off_1013D9788;
  if (os_log_type_enabled((os_log_t)v345, OS_LOG_TYPE_DEBUG))
    sub_100DFB1EC(v305, v304, v307, v306);

  *(_OWORD *)&transform.m11 = v517;
  *(_OWORD *)&transform.m13 = v518;
  transform.m21 = v309;
  transform.m22 = v308;
  v556.origin.x = v305;
  v556.origin.y = v304;
  v556.size.width = v307;
  v556.size.height = v306;
  v557 = CGRectApplyAffineTransform(v556, (CGAffineTransform *)&transform);
  v346 = v557.origin.x;
  v347 = v557.origin.y;
  v348 = v557.size.width;
  v349 = v557.size.height;
  if (qword_10147E570 != -1)
    dispatch_once(&qword_10147E570, &stru_101238CA0);
  v350 = off_1013D9788;
  if (os_log_type_enabled((os_log_t)v350, OS_LOG_TYPE_DEBUG))
  {
    v566.origin.x = v346;
    v566.origin.y = v347;
    v566.size.width = v348;
    v566.size.height = v349;
    v425 = NSStringFromCGRect(v566);
    v426 = (id)objc_claimAutoreleasedReturnValue(v425);
    LODWORD(transform.m11) = 138412290;
    *(_QWORD *)((char *)&transform.m11 + 4) = v426;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v350, OS_LOG_TYPE_DEBUG, "finalBounds adjusted by transform %@", (uint8_t *)&transform, 0xCu);

  }
  v351 = sub_1000603D0(v346, v347, v487);
  v353 = v352;
  if (qword_10147E570 != -1)
    dispatch_once(&qword_10147E570, &stru_101238CC0);
  v354 = off_1013D9788;
  if (os_log_type_enabled((os_log_t)v354, OS_LOG_TYPE_DEBUG))
  {
    v567.origin.x = v351;
    v567.origin.y = v353;
    v567.size.width = v348;
    v567.size.height = v349;
    v427 = NSStringFromCGRect(v567);
    v428 = (id)objc_claimAutoreleasedReturnValue(v427);
    LODWORD(transform.m11) = 138412290;
    *(_QWORD *)((char *)&transform.m11 + 4) = v428;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v354, OS_LOG_TYPE_DEBUG, "finalBounds taking into account viewCenterInSuperlayer %@", (uint8_t *)&transform, 0xCu);

  }
  v355 = sub_1000603B8(v351, v353, v478);
  v357 = v356;
  if (qword_10147E570 != -1)
    dispatch_once(&qword_10147E570, &stru_101238CE0);
  v358 = off_1013D9788;
  if (os_log_type_enabled((os_log_t)v358, OS_LOG_TYPE_DEBUG))
  {
    v568.origin.x = v355;
    v568.origin.y = v357;
    v568.size.width = v348;
    v568.size.height = v349;
    v429 = NSStringFromCGRect(v568);
    v430 = (id)objc_claimAutoreleasedReturnValue(v429);
    LODWORD(transform.m11) = 138412290;
    *(_QWORD *)((char *)&transform.m11 + 4) = v430;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v358, OS_LOG_TYPE_DEBUG, "finalBounds taking into account scaledContentOffset %@", (uint8_t *)&transform, 0xCu);

  }
  v558.origin.x = v355;
  v558.origin.y = v357;
  v558.size.width = v348;
  v558.size.height = v349;
  v559 = CGRectOffset(v558, v484, v482);
  v359 = v559.origin.x;
  v360 = v559.origin.y;
  v361 = v559.size.width;
  v362 = v559.size.height;
  if (qword_10147E570 != -1)
    dispatch_once(&qword_10147E570, &stru_101238D00);
  v363 = off_1013D9788;
  if (os_log_type_enabled((os_log_t)v363, OS_LOG_TYPE_DEBUG))
  {
    v569.origin.x = v359;
    v569.origin.y = v360;
    v569.size.width = v361;
    v569.size.height = v362;
    v431 = NSStringFromCGRect(v569);
    v432 = (id)objc_claimAutoreleasedReturnValue(v431);
    LODWORD(transform.m11) = 138412290;
    *(_QWORD *)((char *)&transform.m11 + 4) = v432;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v363, OS_LOG_TYPE_DEBUG, "finalBounds taking into account canvasCenterOffset %@", (uint8_t *)&transform, 0xCu);

  }
  v364 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "canvas"));
  objc_msgSend(v364, "contentsScale");
  v366 = sub_100063150(v359, v360, v361, v362, v365);
  v368 = v367;
  v370 = v369;
  v372 = v371;

  if (qword_10147E570 != -1)
    dispatch_once(&qword_10147E570, &stru_101238D20);
  v373 = -v366;
  v374 = off_1013D9788;
  if (os_log_type_enabled((os_log_t)v374, OS_LOG_TYPE_DEBUG))
  {
    v542.x = -v366;
    v542.y = -v368;
    v433 = NSStringFromCGPoint(v542);
    v434 = (id)objc_claimAutoreleasedReturnValue(v433);
    v570.origin.x = v366;
    v570.origin.y = v368;
    v570.size.width = v370;
    v570.size.height = v372;
    v435 = NSStringFromCGRect(v570);
    v436 = (id)objc_claimAutoreleasedReturnValue(v435);
    *(_OWORD *)&transform.m11 = v517;
    *(_OWORD *)&transform.m13 = v518;
    transform.m21 = v309;
    transform.m22 = v308;
    v437 = NSStringFromCGAffineTransform((CGAffineTransform *)&transform);
    v438 = (id)objc_claimAutoreleasedReturnValue(v437);
    LODWORD(transform.m11) = 138413058;
    *(_QWORD *)((char *)&transform.m11 + 4) = v434;
    WORD2(transform.m12) = 2112;
    *(_QWORD *)((char *)&transform.m12 + 6) = v436;
    HIWORD(transform.m13) = 2048;
    transform.m14 = v479;
    LOWORD(transform.m21) = 2112;
    *(_QWORD *)((char *)&transform.m21 + 2) = v438;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v374, OS_LOG_TYPE_DEBUG, "final content offset %@ finalBounds %@ view scale %f transform %@", (uint8_t *)&transform, 0x2Au);

  }
  memset(&v516, 0, sizeof(v516));
  v375 = sub_1000603DC(txb, tya, -1.0);
  *(_OWORD *)&transform.m11 = v517;
  *(_OWORD *)&transform.m13 = v518;
  transform.m21 = v309;
  transform.m22 = v308;
  sub_1000796D4(&transform, &v516, v375, v376);
  memset(&transform, 0, sizeof(transform));
  *(_OWORD *)&t1.m11 = *(_OWORD *)&v516.a;
  *(_OWORD *)&t1.m13 = *(_OWORD *)&v516.c;
  *(_OWORD *)&t1.m21 = *(_OWORD *)&v516.tx;
  CATransform3DMakeAffineTransform(&transform, (CGAffineTransform *)&t1);
  transform.m33 = transform.m11;
  if (-[CRLCanvasZoomTracker animateTransform](self, "animateTransform"))
  {
    v377 = objc_loadWeakRetained((id *)&self->_canvasLayer);
    v378 = v377;
    v25 = v490;
    v379 = v480;
    if (v377)
      objc_msgSend(v377, "transform");
    else
      memset(&b, 0, sizeof(b));
    t1 = transform;
    v381 = CATransform3DEqualToTransform(&t1, &b);

    if (v381)
    {
      v380 = 0;
    }
    else
    {
      v382 = CACurrentMediaTime();
      memset(&t1, 0, 48);
      v383 = objc_loadWeakRetained((id *)&self->_canvasLayer);
      v384 = v383;
      if (v383)
        objc_msgSend(v383, "transform");
      else
        memset(&v514, 0, sizeof(v514));
      CATransform3DGetAffineTransform((CGAffineTransform *)&t1, &v514);

      v385 = [CRLDisplayLink alloc];
      v509[0] = _NSConcreteStackBlock;
      v509[1] = 3221225472;
      v509[2] = sub_10010FF4C;
      v509[3] = &unk_101238D48;
      *(CFTimeInterval *)&v509[5] = v382;
      v510 = *(_OWORD *)&t1.m11;
      v511 = *(_OWORD *)&t1.m13;
      v512 = *(_OWORD *)&t1.m21;
      v513 = v516;
      v509[4] = self;
      v386 = -[CRLDisplayLink initWithHandler:](v385, "initWithHandler:", v509);
      -[CRLDisplayLink setPaused:](v386, "setPaused:", 0);
      v387 = objc_loadWeakRetained(location);
      objc_msgSend(v387, "canvasZoomTrackerWillBeginFinalZoomAnimation:", self);

      v507 = transform;
      v505[0] = _NSConcreteStackBlock;
      v505[1] = 3221225472;
      v505[2] = sub_10011004C;
      v505[3] = &unk_101238D70;
      v505[4] = self;
      v388 = v22;
      v506 = v388;
      v508 = v479;
      v389 = objc_retainBlock(v505);
      v499[0] = _NSConcreteStackBlock;
      v499[1] = 3221225472;
      v499[2] = sub_1001100BC;
      v499[3] = &unk_101238D98;
      v390 = v386;
      v500 = v390;
      v501 = self;
      v502 = v480;
      v503 = v373;
      v504 = -v368;
      v391 = objc_retainBlock(v499);
      objc_msgSend(v388, "beginAnimations:", &stru_1012A72B0);
      v392 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut));
      v393 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v388, "i_currentAnimation"));
      objc_msgSend(v393, "setTimingFunction:", v392);

      v394 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v388, "i_currentAnimation"));
      objc_msgSend(v394, "setDuration:", 0.2);

      v395 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v388, "i_currentAnimation"));
      objc_msgSend(v395, "setCompletionBlock:", v391);

      ((void (*)(_QWORD *))v389[2])(v389);
      objc_msgSend(v388, "commitAnimations");

      v380 = 1;
      v25 = v490;
    }
  }
  else
  {
    v380 = 0;
    v25 = v490;
    v379 = v480;
  }
  if (self->_isShowingZoomHUD)
  {
    gestureIsFastPinch = self->_gestureIsFastPinch;
    v397 = objc_loadWeakRetained(location);
    v398 = v397;
    if (gestureIsFastPinch)
      objc_msgSend(v397, "performSelector:withObject:afterDelay:", "canvasZoomTrackerDidEndViewScaleFeedback:", self, 0.5);
    else
      objc_msgSend(v397, "canvasZoomTrackerDidEndViewScaleFeedback:", self);

    self->_isShowingZoomHUD = 0;
  }
  if ((v380 & 1) == 0)
    -[CRLCanvasZoomTracker p_finishZoomWithFinalScaleFactor:contentOffset:](self, "p_finishZoomWithFinalScaleFactor:contentOffset:", v379, v373, -v368);
LABEL_272:

}

- (void)p_finishZoomWithFinalScaleFactor:(double)a3 contentOffset:(CGPoint)a4
{
  double y;
  double x;
  CRLCanvasLayer **p_canvasLayer;
  id WeakRetained;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  id v23;
  void *v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat width;
  CGFloat height;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  unsigned int v34;
  id v35;
  id v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
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
  double v61;
  double v62;
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
  double MinX;
  CGFloat MaxX;
  double v76;
  double MinY;
  CGFloat MaxY;
  id v79;
  double v80;
  __int128 v81;
  double v82;
  __int128 v83;
  double v84;
  __int128 v85;
  double v86;
  _OWORD v87[3];
  CATransform3D v88;
  CGAffineTransform v89;
  CGAffineTransform v90;
  _OWORD v91[3];
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;

  y = a4.y;
  x = a4.x;
  p_canvasLayer = &self->_canvasLayer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_canvasLayer);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "associatedBackgroundLayer"));
  v83 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v85 = *(_OWORD *)&CGAffineTransformIdentity.a;
  v91[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v91[1] = v83;
  v81 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v91[2] = v81;
  objc_msgSend(v10, "setDynamicTransform:", v91);

  v11 = objc_loadWeakRetained((id *)p_canvasLayer);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvasView"));

  v13 = objc_loadWeakRetained((id *)p_canvasLayer);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "controller"));

  objc_msgSend(v14, "visibleUnscaledRect");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = objc_loadWeakRetained((id *)p_canvasLayer);
  v24 = v23;
  if (v23)
    objc_msgSend(v23, "transform");
  else
    memset(&v88, 0, sizeof(v88));
  CATransform3DGetAffineTransform(&v89, &v88);
  CGAffineTransformInvert(&v90, &v89);
  v92.origin.x = v16;
  v92.origin.y = v18;
  v92.size.width = v20;
  v92.size.height = v22;
  v93 = CGRectApplyAffineTransform(v92, &v90);
  v25 = v93.origin.x;
  v26 = v93.origin.y;
  width = v93.size.width;
  height = v93.size.height;

  v29 = objc_loadWeakRetained((id *)p_canvasLayer);
  v87[0] = v85;
  v87[1] = v83;
  v87[2] = v81;
  objc_msgSend(v29, "setAffineTransform:", v87);

  v30 = objc_loadWeakRetained((id *)p_canvasLayer);
  objc_msgSend(v30, "setViewScale:", a3);

  v31 = objc_loadWeakRetained((id *)p_canvasLayer);
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "controller"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "canvas"));
  v34 = objc_msgSend(v33, "isAnchoredAtRight");

  v35 = objc_loadWeakRetained((id *)p_canvasLayer);
  v36 = v35;
  if (v34)
  {
    objc_msgSend(v35, "contentInset");
    v38 = y - v37;

    v36 = objc_loadWeakRetained((id *)p_canvasLayer);
    objc_msgSend(v36, "contentInset");
    v40 = x - v39;
  }
  else
  {
    objc_msgSend(v35, "bounds");
    v40 = sub_1000603B8(x, y, v41);
    v38 = v42;
  }

  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "enclosingScrollView"));
  v86 = v38;
  v84 = v40;
  if (objc_msgSend(v14, "shouldCanvasScrollingSizeGrowToFitBoardContent"))
  {
    objc_msgSend(v43, "convertPoint:toView:", v12, v40, v38);
    v45 = v44;
    v47 = v46;
    objc_msgSend(v43, "adjustedContentInset");
    objc_msgSend(v14, "convertBoundsToUnscaledPoint:", sub_1000603D0(v45, v47, v48));
    v80 = v50;
    v82 = v49;
    self->_visibleUnscaledBoundsAtEndOfZoom.origin.x = v49;
    self->_visibleUnscaledBoundsAtEndOfZoom.origin.y = v50;
    self->_visibleUnscaledBoundsAtEndOfZoom.size.width = width;
    self->_visibleUnscaledBoundsAtEndOfZoom.size.height = height;
  }
  else
  {
    v80 = v26;
    v82 = v25;
  }
  objc_msgSend(v43, "adjustedContentInset");
  v52 = v51;
  v54 = v53;
  v56 = -v55;
  v58 = -v57;
  objc_msgSend(v43, "contentSize");
  v60 = v59;
  v62 = v61;
  v63 = sub_10005FDDC() - v54;
  v65 = v64 - v52;
  v67 = v66 - (v58 - v54);
  v69 = v68 - (v56 - v52);
  objc_msgSend(v43, "scrollableAreaBounds");
  if (v70 <= v60)
    v72 = v70;
  else
    v72 = v60;
  if (v71 <= v62)
    v73 = v71;
  else
    v73 = v62;
  v94.origin.x = v63;
  v94.origin.y = v65;
  v94.size.width = v67;
  v94.size.height = v69;
  MinX = CGRectGetMinX(v94);
  v95.origin.x = v63;
  v95.origin.y = v65;
  v95.size.width = v67;
  v95.size.height = v69;
  MaxX = CGRectGetMaxX(v95);
  v76 = sub_1003C65EC(v84, MinX, MaxX - v72);
  v96.origin.x = v63;
  v96.origin.y = v65;
  v96.size.width = v67;
  v96.size.height = v69;
  MinY = CGRectGetMinY(v96);
  v97.origin.x = v63;
  v97.origin.y = v65;
  v97.size.width = v67;
  v97.size.height = v69;
  MaxY = CGRectGetMaxY(v97);
  objc_msgSend(v43, "setContentOffset:", v76, sub_1003C65EC(v86, MinY, MaxY - v73));
  objc_msgSend(v14, "viewDidEndZooming");
  if (objc_msgSend(v14, "shouldCanvasScrollingSizeGrowToFitBoardContent"))
    objc_msgSend(v14, "setContentOffset:scrollOptions:", 0, v82, v80);
  objc_msgSend(v14, "i_recordUserViewScale");
  self->_isZooming = 0;
  v79 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v79, "canvasZoomTrackerDidFinish:", self);

}

- (CRLCanvasZoomTrackerDelegate)delegate
{
  return (CRLCanvasZoomTrackerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)alwaysUsesTranslationSprings
{
  return self->_alwaysUsesTranslationSprings;
}

- (void)setAlwaysUsesTranslationSprings:(BOOL)a3
{
  self->_alwaysUsesTranslationSprings = a3;
}

- (BOOL)fastPinchSnapsViewScale
{
  return self->_fastPinchSnapsViewScale;
}

- (void)setFastPinchSnapsViewScale:(BOOL)a3
{
  self->_fastPinchSnapsViewScale = a3;
}

- (BOOL)slowPinchSnapsViewScale
{
  return self->_slowPinchSnapsViewScale;
}

- (void)setSlowPinchSnapsViewScale:(BOOL)a3
{
  self->_slowPinchSnapsViewScale = a3;
}

- (BOOL)animateTransform
{
  return self->_animateTransform;
}

- (void)setAnimateTransform:(BOOL)a3
{
  self->_animateTransform = a3;
}

- (BOOL)currentlySnappingViewScale
{
  return self->_currentlySnappingViewScale;
}

- (BOOL)gestureIsFastPinch
{
  return self->_gestureIsFastPinch;
}

- (CGRect)visibleUnscaledBoundsAtEndOfZoom
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleUnscaledBoundsAtEndOfZoom.origin.x;
  y = self->_visibleUnscaledBoundsAtEndOfZoom.origin.y;
  width = self->_visibleUnscaledBoundsAtEndOfZoom.size.width;
  height = self->_visibleUnscaledBoundsAtEndOfZoom.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_canvasLayer);
}

@end
