@implementation TSDCanvasZoomTracker

- (TSDCanvasZoomTracker)initWithCanvasLayer:(id)a3
{
  TSDCanvasZoomTracker *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDCanvasZoomTracker;
  result = -[TSDCanvasZoomTracker init](&v5, sel_init);
  if (result)
  {
    result->mCanvasLayer = (TSDCanvasLayer *)a3;
    *(_WORD *)&result->mSnapsViewScale = 257;
  }
  return result;
}

- (void)zoomWithScale:(double)a3 velocity:(double)a4 locationInView:(CGPoint)a5 phase:(int)a6
{
  TSDCanvasZoomTrackerDelegate **p_mDelegate;
  TSDInteractiveCanvasController *v11;
  TSKScrollView *v12;
  CGPoint *v13;
  TSDCanvasLayer *v14;
  __int128 v15;
  TSDCanvasLayer *mCanvasLayer;
  __int128 v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  unint64_t mZoomVelocitySampleCount;
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
  double v32;
  double v33;
  int v34;
  double v35;
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
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double y;
  TSDCanvasLayer *v60;
  CGPoint v61;
  CGFloat v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  CGFloat v72;
  CGFloat v73;
  double v74;
  double v75;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  float v83;
  int8x16_t v84;
  float64x2_t v85;
  int8x16_t v86;
  double v87;
  int8x16_t v88;
  double v89;
  double v90;
  double v91;
  float v92;
  int8x16_t v93;
  int8x16_t v94;
  double v95;
  double v96;
  double v97;
  CGFloat v98;
  CGFloat v99;
  CGFloat v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  CGFloat v106;
  double v107;
  CGFloat v108;
  double v109;
  CGFloat v110;
  CGFloat v111;
  __int128 v112;
  CGFloat tx;
  CGFloat ty;
  __int128 v115;
  double v116;
  double v117;
  double v118;
  CGFloat v119;
  CGFloat v120;
  double v121;
  double v122;
  double v123;
  CGFloat v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  CGFloat v133;
  double v134;
  double v135;
  double v136;
  CGFloat v137;
  double v138;
  double v139;
  double v140;
  double v141;
  uint64_t v142;
  double v143;
  double v144;
  CGFloat v145;
  double v146;
  CGFloat v147;
  double v148;
  CGFloat v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  TSDCanvasLayer *v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  CGFloat v174;
  CGFloat v175;
  CGFloat v176;
  CGFloat v177;
  CGFloat v178;
  CGFloat v179;
  double v180;
  double v181;
  double v182;
  CGFloat v183;
  CGFloat v184;
  CGFloat v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  TSDCanvasLayer *v197;
  char v198;
  double v199;
  id Weak;
  double v201;
  double MaxX;
  double MaxY;
  double v204;
  double v205;
  double v206;
  double v207;
  CGFloat v208;
  double v209;
  CGFloat v210;
  CGFloat height;
  CGFloat width;
  CGFloat v213;
  CGFloat v214;
  double v215;
  double v216;
  double v217;
  double v218;
  double v219;
  double v220;
  double v221;
  double v222;
  double v223;
  double dy;
  double v225;
  double v226;
  int8x16_t v227;
  double v228;
  double dx;
  double dxa;
  double v231;
  double x;
  double v233;
  _QWORD v234[5];
  _QWORD v235[8];
  _QWORD v236[6];
  __int128 v237;
  __int128 v238;
  double v239;
  double v240;
  double v241;
  CGAffineTransform v242;
  _OWORD v243[2];
  CGFloat v244;
  CGFloat v245;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v248;
  __int128 v249;
  __int128 v250;
  CGAffineTransform v251;
  CGAffineTransform v252;
  _OWORD v253[3];
  CGRect v254;
  CGRect v255;
  CGRect v256;
  CGRect v257;
  CGRect v258;
  CGRect v259;
  CGRect v260;
  CGRect v261;
  CGRect v262;
  CGRect v263;
  CGRect v264;

  dx = a5.y;
  x = a5.x;
  p_mDelegate = &self->mDelegate;
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", objc_loadWeak((id *)&self->mDelegate), sel_canvasZoomTrackerDidEndViewScaleFeedback_, self);
  v11 = -[TSDCanvasLayer controller](self->mCanvasLayer, "controller");
  v12 = -[TSDCanvasView enclosingScrollView](-[TSDCanvasLayer canvasView](self->mCanvasLayer, "canvasView"), "enclosingScrollView");
  v13 = (CGPoint *)MEMORY[0x24BDBEFB0];
  switch(a6)
  {
    case 0:
LABEL_8:
      mCanvasLayer = self->mCanvasLayer;
      if (mCanvasLayer)
        -[TSDCanvasLayer affineTransform](mCanvasLayer, "affineTransform");
      else
        memset(&v252, 0, sizeof(v252));
      v17 = *(_OWORD *)&v252.c;
      *(_OWORD *)&self->mSavedTransform.a = *(_OWORD *)&v252.a;
      *(_OWORD *)&self->mSavedTransform.c = v17;
      *(_OWORD *)&self->mSavedTransform.tx = *(_OWORD *)&v252.tx;
      -[TSKScrollView contentOffset](v12, "contentOffset");
      self->mSavedContentOffset.x = v18;
      self->mSavedContentOffset.y = v19;
      self->mHasGestureOrigin = 0;
      self->mGestureOffset = *v13;
      -[TSDInteractiveCanvasController i_viewWillBeginZooming](v11, "i_viewWillBeginZooming");
      self->mIsZooming = 1;
      self->mZoomVelocitySampleCount = 0;
      self->mZoomVelocity = 0.0;
      objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
      self->mZoomStartTime = v20;
      break;
    case 1:
      if (self->mIsZooming)
        break;
      goto LABEL_8;
    case 3:
      if (self->mIsShowingZoomHUD)
        objc_msgSend(objc_loadWeak((id *)p_mDelegate), "canvasZoomTrackerDidEndViewScaleFeedback:", self);
      v14 = self->mCanvasLayer;
      v15 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      v253[0] = *MEMORY[0x24BDBD8B8];
      v253[1] = v15;
      v253[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
      -[TSDCanvasLayer setAffineTransform:](v14, "setAffineTransform:", v253);
      -[TSDInteractiveCanvasController viewDidEndZooming](v11, "viewDidEndZooming");
      objc_msgSend(objc_loadWeak((id *)p_mDelegate), "canvasZoomTrackerDidFinish:", self);
      return;
  }
  mZoomVelocitySampleCount = self->mZoomVelocitySampleCount;
  v22 = a4 + (double)mZoomVelocitySampleCount++ * self->mZoomVelocity;
  self->mZoomVelocity = v22 / (double)mZoomVelocitySampleCount;
  self->mZoomVelocitySampleCount = mZoomVelocitySampleCount;
  -[TSDCanvasLayer viewScale](self->mCanvasLayer, "viewScale");
  v24 = v23;
  -[TSDCanvasLayer minimumPinchViewScale](self->mCanvasLayer, "minimumPinchViewScale");
  v26 = v25;
  -[TSDCanvasLayer maximumPinchViewScale](self->mCanvasLayer, "maximumPinchViewScale");
  v28 = v27;
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v30 = v29 - self->mZoomStartTime;
  v31 = 0.2;
  if (a6 == 2 && v30 < 0.2 && fabs(self->mZoomVelocity) > 0.5)
  {
    -[TSDCanvasLayer viewScale](self->mCanvasLayer, "viewScale");
    -[TSDInteractiveCanvasController i_nextCanvasViewScaleDetentForProposedViewScale:greater:](v11, "i_nextCanvasViewScaleDetentForProposedViewScale:greater:", self->mZoomVelocity > 0.0);
    v33 = v32;
    if (self->mIsShowingZoomHUD)
    {
      v34 = 1;
    }
    else
    {
      v34 = 1;
      if (-[TSDCanvasLayer showsScaleFeedback](self->mCanvasLayer, "showsScaleFeedback"))
      {
        objc_msgSend(objc_loadWeak((id *)p_mDelegate), "canvasZoomTracker:willBeginViewScaleFeedbackWithFastPinch:", self, 1);
        self->mIsShowingZoomHUD = 1;
      }
    }
  }
  else
  {
    if (v30 > 0.2
      && !self->mIsShowingZoomHUD
      && -[TSDCanvasLayer showsScaleFeedback](self->mCanvasLayer, "showsScaleFeedback"))
    {
      objc_msgSend(objc_loadWeak((id *)p_mDelegate), "canvasZoomTracker:willBeginViewScaleFeedbackWithFastPinch:", self, 0);
      self->mIsShowingZoomHUD = 1;
    }
    v33 = v24 * a3;
    if (a6 == 2)
    {
      -[TSDInteractiveCanvasController i_adjustViewScale:](v11, "i_adjustViewScale:", v24 * a3, v31);
      v33 = v35;
    }
    v34 = 0;
  }
  TSUClamp();
  v37 = v36;
  if (-[TSDCanvasZoomTracker snapsViewScale](self, "snapsViewScale"))
  {
    -[TSDCanvasLayer viewScale](self->mCanvasLayer, "viewScale");
    -[TSDInteractiveCanvasController i_viewScaleForProposedViewScale:originalViewScale:](v11, "i_viewScaleForProposedViewScale:originalViewScale:", v37, v38);
    v37 = v39;
  }
  if (a6 == 2)
  {
    -[TSDCanvasLayer viewScale](self->mCanvasLayer, "viewScale");
    -[TSDInteractiveCanvasController i_canvasCenterOffsetForProposedViewScale:originalViewScale:](v11, "i_canvasCenterOffsetForProposedViewScale:originalViewScale:", v37, v40);
    v231 = v41;
    v43 = v42;
    v33 = v37;
  }
  else
  {
    v43 = *(double *)(MEMORY[0x24BDBF148] + 8);
    v231 = *MEMORY[0x24BDBF148];
  }
  if (v33 >= v26)
  {
    if (v33 > v28)
      v33 = v28 + (1.0 - 3.0 / (v33 - v28 + 3.0)) * 0.8;
  }
  else
  {
    v33 = v26 + (1.0 - 3.0 / (v26 - v33 + 3.0)) * -0.8;
  }
  -[TSDCanvasLayer unscaledSize](self->mCanvasLayer, "unscaledSize");
  v45 = v44;
  v47 = v46;
  -[TSDCanvasLayer viewScale](self->mCanvasLayer, "viewScale");
  TSDMultiplySizeScalar(v45, v47, v48);
  v49 = TSDRectWithSize();
  dy = v50;
  v53 = TSDCenterOfRect(v49, v51, v50, v52);
  v219 = v54;
  v221 = v53;
  -[TSDCanvasView convertPoint:toView:](-[TSDCanvasLayer canvasView](self->mCanvasLayer, "canvasView"), "convertPoint:toView:", -[TSDCanvasView superview](-[TSDCanvasLayer canvasView](self->mCanvasLayer, "canvasView"), "superview"), x, dx);
  v56 = v55;
  v58 = v57;
  if (self->mHasGestureOrigin)
  {
    y = self->mZoomOrigin.y;
    dxa = self->mZoomOrigin.x;
  }
  else
  {
    memset(&v252, 0, sizeof(v252));
    v60 = self->mCanvasLayer;
    if (v60)
      -[TSDCanvasLayer affineTransform](v60, "affineTransform");
    else
      memset(&v251, 0, sizeof(v251));
    CGAffineTransformInvert(&v252, &v251);
    v61 = (CGPoint)vaddq_f64(*(float64x2_t *)&v252.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v252.c, dx), *(float64x2_t *)&v252.a, x));
    self->mZoomOrigin = v61;
    self->mGestureOrigin.x = v56;
    self->mGestureOrigin.y = v58;
    self->mHasGestureOrigin = 1;
    y = v61.y;
    dxa = v61.x;
  }
  v233 = v43;
  if (a6 != 2)
  {
    self->mGestureOffset.x = TSDSubtractPoints(v56, v58, self->mGestureOrigin.x);
    self->mGestureOffset.y = v62;
  }
  -[TSDCanvasLayer unscaledSize](self->mCanvasLayer, "unscaledSize");
  v65 = TSDMultiplySizeScalar(v63, v64, v33);
  v67 = v66;
  -[TSKScrollView bounds](v12, "bounds");
  v69 = fmax((v65 - v68) * 0.5, 0.0);
  v71 = fmax((v67 - v70) * 0.5, 0.0);
  v228 = v33;
  if (a6 == 2)
  {
    TSUClamp();
    self->mGestureOffset.x = v72;
    TSUClamp();
    self->mGestureOffset.y = v73;
  }
  else if (!-[TSDCanvasLayer isInfinite](self->mCanvasLayer, "isInfinite"))
  {
    if (-[TSDCanvasZoomTracker alwaysUsesTranslationSprings](self, "alwaysUsesTranslationSprings"))
    {
      v74 = 0.8;
    }
    else
    {
      -[TSDCanvasLayer viewScale](self->mCanvasLayer, "viewScale");
      if (v33 >= 1.0 || v75 < 1.0)
        v74 = 0.800000012;
      else
        v74 = 1.0;
    }
    v77 = self->mGestureOffset.x;
    v78 = 0.0;
    v79 = 0.0;
    if (v77 != 0.0)
    {
      v80 = fabs(v77);
      v79 = v80 * fmax((v80 - v69) / v80, 0.0);
    }
    TSUClamp();
    v82 = v81;
    *(float *)&v81 = v79;
    v83 = v74;
    *(double *)v84.i64 = powf(*(float *)&v81, v83);
    v85.f64[0] = NAN;
    v85.f64[1] = NAN;
    v86 = (int8x16_t)vnegq_f64(v85);
    v88.i64[0] = *(_QWORD *)&self->mGestureOffset.x;
    v87 = self->mGestureOffset.y;
    v227 = v86;
    self->mGestureOffset.x = v82 + *(double *)vbslq_s8(v86, v84, v88).i64;
    if (v87 != 0.0)
    {
      v89 = fabs(v87);
      v78 = v89 * fmax((v89 - v71) / v89, 0.0);
    }
    TSUClamp();
    v91 = v90;
    *(float *)&v90 = v78;
    v92 = v74;
    *(double *)v93.i64 = powf(*(float *)&v90, v92);
    v94.i64[0] = *(_QWORD *)&self->mGestureOffset.y;
    self->mGestureOffset.y = v91 + *(double *)vbslq_s8(v227, v93, v94).i64;
    v33 = v228;
  }
  if (self->mIsShowingZoomHUD)
    objc_msgSend(objc_loadWeak((id *)p_mDelegate), "canvasZoomTracker:willUpdateViewScaleFeedbackWithScale:", self, v37);
  v226 = v37;
  -[TSDCanvasLayer bounds](self->mCanvasLayer, "bounds");
  v96 = v95;
  v97 = TSDRectWithSize();
  v101 = TSDCenterOfRect(v97, v98, v99, v100);
  v217 = v96;
  v102 = TSDSubtractPoints(dxa, y, v96);
  v104 = TSDSubtractPoints(v102, v103, v101);
  v106 = v105;
  -[TSDCanvasLayer viewScale](self->mCanvasLayer, "viewScale");
  v108 = v33 / v107;
  -[TSKScrollView contentOffset](v12, "contentOffset");
  v225 = v109;
  v110 = self->mGestureOffset.x;
  v111 = self->mGestureOffset.y;
  v112 = *(_OWORD *)&self->mSavedTransform.c;
  *(_OWORD *)&v248.a = *(_OWORD *)&self->mSavedTransform.a;
  *(_OWORD *)&v248.c = v112;
  *(_OWORD *)&v248.tx = *(_OWORD *)&self->mSavedTransform.tx;
  CGAffineTransformTranslate(&v252, &v248, v110, v111);
  v249 = *(_OWORD *)&v252.a;
  v250 = *(_OWORD *)&v252.c;
  v248 = v252;
  CGAffineTransformTranslate(&v252, &v248, v104, v106);
  v249 = *(_OWORD *)&v252.a;
  v250 = *(_OWORD *)&v252.c;
  v248 = v252;
  CGAffineTransformScale(&v252, &v248, v108, v108);
  v249 = *(_OWORD *)&v252.a;
  v250 = *(_OWORD *)&v252.c;
  v248 = v252;
  CGAffineTransformTranslate(&v252, &v248, -v104, -v106);
  v249 = *(_OWORD *)&v252.a;
  v250 = *(_OWORD *)&v252.c;
  tx = v252.tx;
  ty = v252.ty;
  v215 = v13->x;
  v216 = v13->y;
  memset(&v252, 0, sizeof(v252));
  CGAffineTransformMakeTranslation(&v252, v231 - v215, v233 - v216);
  *(_OWORD *)&t1.a = v249;
  *(_OWORD *)&t1.c = v250;
  t1.tx = tx;
  t1.ty = ty;
  t2 = v252;
  CGAffineTransformConcat(&v248, &t1, &t2);
  v249 = *(_OWORD *)&v248.a;
  v250 = *(_OWORD *)&v248.c;
  v115 = *(_OWORD *)&v248.tx;
  if (a6 != 2)
  {
    v243[0] = v249;
    v243[1] = v250;
    v161 = self->mCanvasLayer;
    v244 = v248.tx;
    v245 = v248.ty;
    -[TSDCanvasLayer setAffineTransform:](v161, "setAffineTransform:", v243);
    -[TSDInteractiveCanvasController i_viewIsZoomingAtPoint:](v11, "i_viewIsZoomingAtPoint:", dxa, y);
    -[TSDInteractiveCanvasController i_viewDidZoomToViewScale:](v11, "i_viewDidZoomToViewScale:", v37);
    return;
  }
  v204 = TSDSubtractPoints(v221, v219, v217);
  v205 = v116;
  v117 = TSDSubtractPoints(v204, v116, v101);
  v254.origin.x = TSDRectWithCenterAndSize(v117, v118, dy);
  *(_OWORD *)&v248.a = v249;
  *(_OWORD *)&v248.c = v250;
  *(_OWORD *)&v248.tx = v115;
  v213 = v254.origin.y;
  v214 = v254.origin.x;
  height = v254.size.height;
  width = v254.size.width;
  v255 = CGRectApplyAffineTransform(v254, &v248);
  v119 = v255.size.width;
  v120 = v255.size.height;
  v218 = v101;
  v121 = TSDAddPoints(v255.origin.x, v255.origin.y, v101);
  v256.origin.x = TSDSubtractPoints(v121, v122, v225);
  v256.size.width = v119;
  v256.size.height = v120;
  v257 = CGRectOffset(v256, -v231, -v233);
  v123 = v257.origin.x;
  v124 = v257.origin.y;
  v125 = v257.size.width;
  v126 = v257.size.height;
  -[TSDCanvasLayer contentInset](self->mCanvasLayer, "contentInset");
  v222 = v127;
  v223 = v125 - (v127 + v128);
  v209 = v129;
  v220 = v129 + v130;
  -[TSKScrollView bounds](v12, "bounds");
  v131 = TSDRectWithSize() + v231 * 2.0;
  v133 = v132 + v233 * 2.0;
  v135 = v134 - v231 * 2.0;
  v137 = v136 - v233 * 2.0;
  v258.origin.x = v123;
  v258.origin.y = v124;
  v258.size.width = v125;
  v258.size.height = v126;
  MaxX = CGRectGetMaxX(v258);
  v259.origin.x = v123;
  v210 = v124;
  v259.origin.y = v124;
  v259.size.width = v125;
  v259.size.height = v126;
  MaxY = CGRectGetMaxY(v259);
  v260.origin.x = v131;
  v260.origin.y = v133;
  v260.size.width = v135;
  v260.size.height = v137;
  v201 = CGRectGetMaxX(v260);
  v261.origin.x = v131;
  v206 = v133;
  v261.origin.y = v133;
  v261.size.width = v135;
  v208 = v137;
  v261.size.height = v137;
  v207 = CGRectGetMaxY(v261);
  -[TSKScrollView contentOffset](v12, "contentOffset");
  v139 = v138;
  v141 = v140;
  v142 = -[TSDInteractiveCanvasController sizeOfScrollViewEnclosingCanvas](v11, "sizeOfScrollViewEnclosingCanvas");
  v145 = TSDRectWithOriginAndSize(v142, v139, v141, v143, v144);
  v147 = v146;
  v149 = v148;
  v151 = v150;
  if (-[TSDCanvasLayer verticallyCenteredInScrollView](self->mCanvasLayer, "verticallyCenteredInScrollView")
    && -[TSDCanvasLayer avoidKeyboardWhenVerticallyCenteredInScrollView](self->mCanvasLayer, "avoidKeyboardWhenVerticallyCenteredInScrollView"))
  {
    objc_msgSend(+[TSKKeyboardMonitor sharedKeyboardMonitor](TSKKeyboardMonitor, "sharedKeyboardMonitor"), "keyboardHeightInView:", v12);
    v151 = v151 - v152;
    v207 = v207 - v152;
  }
  v153 = v123 + v222;
  v154 = v126 - v220;
  v155 = TSDCenterOfRect(v145, v147, v149, v151);
  v157 = TSDAddPoints(v155, v156, v231);
  v159 = v158;
  if (v223 >= v135)
  {
    if (v153 <= v131)
    {
      v163 = v226;
      if (MaxX >= v201)
      {
        v168 = v231;
        v164 = v233;
        v162 = *(double *)&v115;
        goto LABEL_77;
      }
      v162 = *(double *)&v115 + v201 - MaxX;
    }
    else
    {
      v162 = *(double *)&v115 + v131 - v153;
      v163 = v226;
    }
    v168 = v231;
    v164 = v233;
LABEL_77:
    v166 = v209;
    v165 = v210;
    v167 = v208;
    v160 = v162 - v168;
    goto LABEL_78;
  }
  if (-[TSDCanvasLayer horizontallyCenteredInScrollView](self->mCanvasLayer, "horizontallyCenteredInScrollView", v223))
    v160 = v157 - v204;
  else
    v160 = *(double *)&v115 + v215 - v153;
  v163 = v226;
  v164 = v233;
  v166 = v209;
  v165 = v210;
  v167 = v208;
LABEL_78:
  v169 = v165 + v166;
  if (v154 >= v167)
  {
    if (v169 <= v206)
    {
      v172 = v218;
      v173 = v225;
      if (MaxY >= v207)
        v171 = *((double *)&v115 + 1);
      else
        v171 = *((double *)&v115 + 1) + v207 - MaxY;
    }
    else
    {
      v171 = *((double *)&v115 + 1) + v206 - v169;
      v172 = v218;
      v173 = v225;
    }
    v175 = v213;
    v174 = v214;
    v177 = height;
    v176 = width;
    v170 = v171 - v164;
  }
  else
  {
    if (-[TSDCanvasLayer verticallyCenteredInScrollView](self->mCanvasLayer, "verticallyCenteredInScrollView"))
      v170 = v159 - v205;
    else
      v170 = *((double *)&v115 + 1) + v216 - v169;
    v172 = v218;
    v173 = v225;
    v175 = v213;
    v174 = v214;
    v177 = height;
    v176 = width;
  }
  *(_OWORD *)&v248.a = v249;
  *(_OWORD *)&v248.c = v250;
  v248.tx = v160;
  v248.ty = v170;
  v262 = CGRectApplyAffineTransform(*(CGRect *)&v174, &v248);
  v178 = v262.size.width;
  v179 = v262.size.height;
  v180 = TSDAddPoints(v262.origin.x, v262.origin.y, v172);
  v263.origin.x = TSDSubtractPoints(v180, v181, v173);
  v263.size.width = v178;
  v263.size.height = v179;
  v264 = CGRectOffset(v263, -v231, -v233);
  v182 = v264.origin.x;
  v183 = v264.origin.y;
  v184 = v264.size.width;
  v185 = v264.size.height;
  -[TSDCanvas contentsScale](-[TSDInteractiveCanvasController canvas](v11, "canvas"), "contentsScale");
  v187 = -TSDRoundedRectForScale(v182, v183, v184, v185, v186);
  v189 = -v188;
  -[TSDInteractiveCanvasController clampedUnscaledContentOffset:forViewScale:](v11, "clampedUnscaledContentOffset:forViewScale:", TSDMultiplyPointScalar(v187, -v188, 1.0 / v228));
  v192 = TSDMultiplyPointScalar(v190, v191, v228);
  v194 = v193;
  if (-[TSDCanvasZoomTracker animateTransform](self, "animateTransform"))
  {
    v195 = v160 + v187 - v192;
    v196 = v170 + v189 - v194;
    v197 = self->mCanvasLayer;
    if (v197)
      -[TSDCanvasLayer affineTransform](v197, "affineTransform");
    else
      memset(&v242, 0, sizeof(v242));
    v199 = v228;
    *(_OWORD *)&v248.a = v249;
    *(_OWORD *)&v248.c = v250;
    v248.tx = v195;
    v248.ty = v196;
    if (CGAffineTransformEqualToTransform(&v248, &v242))
    {
      v198 = 0;
    }
    else
    {
      objc_msgSend(objc_loadWeak((id *)p_mDelegate), "canvasZoomTrackerWillBeginFinalZoomAnimation:", self);
      v236[0] = MEMORY[0x24BDAC760];
      v236[1] = 3221225472;
      v236[2] = __68__TSDCanvasZoomTracker_zoomWithScale_velocity_locationInView_phase___block_invoke;
      v236[3] = &unk_24D82CDD8;
      v237 = v249;
      v238 = v250;
      v239 = v195;
      v240 = v196;
      v236[4] = self;
      v236[5] = v11;
      v241 = v163;
      v235[0] = MEMORY[0x24BDAC760];
      v235[1] = 3221225472;
      v235[2] = __68__TSDCanvasZoomTracker_zoomWithScale_velocity_locationInView_phase___block_invoke_2;
      v235[3] = &unk_24D82A5A0;
      v235[4] = self;
      *(double *)&v235[5] = v228;
      *(double *)&v235[6] = v192;
      *(double *)&v235[7] = v194;
      v234[0] = MEMORY[0x24BDAC760];
      v234[1] = 3221225472;
      v234[2] = __68__TSDCanvasZoomTracker_zoomWithScale_velocity_locationInView_phase___block_invoke_3;
      v234[3] = &unk_24D82C658;
      v234[4] = v235;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 0x20000, v236, v234, 0.200000003, 0.0);
      v198 = 1;
    }
  }
  else
  {
    v198 = 0;
    v199 = v228;
  }
  if (self->mIsShowingZoomHUD)
  {
    Weak = objc_loadWeak((id *)p_mDelegate);
    if (v34)
      objc_msgSend(Weak, "performSelector:withObject:afterDelay:", sel_canvasZoomTrackerDidEndViewScaleFeedback_, self, 0.5);
    else
      objc_msgSend(Weak, "canvasZoomTrackerDidEndViewScaleFeedback:", self);
    self->mIsShowingZoomHUD = 0;
  }
  if ((v198 & 1) == 0)
    -[TSDCanvasZoomTracker p_finishZoomWithFinalScaleFactor:contentOffset:](self, "p_finishZoomWithFinalScaleFactor:contentOffset:", v199, v192, v194);
}

uint64_t __68__TSDCanvasZoomTracker_zoomWithScale_velocity_locationInView_phase___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(_OWORD *)(a1 + 64);
  v5[0] = *(_OWORD *)(a1 + 48);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 80);
  objc_msgSend(v2, "setAffineTransform:", v5);
  return objc_msgSend(*(id *)(a1 + 40), "i_viewDidZoomToViewScale:", *(double *)(a1 + 96));
}

uint64_t __68__TSDCanvasZoomTracker_zoomWithScale_velocity_locationInView_phase___block_invoke_2(uint64_t a1)
{
  objc_msgSend(objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 16)), "canvasZoomTrackerDidEndFinalZoomAnimation:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 32), "p_finishZoomWithFinalScaleFactor:contentOffset:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

uint64_t __68__TSDCanvasZoomTracker_zoomWithScale_velocity_locationInView_phase___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)p_finishZoomWithFinalScaleFactor:(double)a3 contentOffset:(CGPoint)a4
{
  double y;
  double x;
  TSDInteractiveCanvasController *v8;
  TSDCanvasLayer *mCanvasLayer;
  __int128 v10;
  double v11;
  double v12;
  double v13;
  _OWORD v14[3];

  y = a4.y;
  x = a4.x;
  v8 = -[TSDCanvasLayer controller](self->mCanvasLayer, "controller");
  -[TSDCanvasLayer setViewScale:](self->mCanvasLayer, "setViewScale:", a3);
  mCanvasLayer = self->mCanvasLayer;
  v10 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v14[0] = *MEMORY[0x24BDBD8B8];
  v14[1] = v10;
  v14[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  -[TSDCanvasLayer setAffineTransform:](mCanvasLayer, "setAffineTransform:", v14);
  -[TSDCanvasLayer bounds](self->mCanvasLayer, "bounds");
  v12 = TSDSubtractPoints(x, y, v11);
  -[TSKScrollView setContentOffset:](-[TSDCanvasView enclosingScrollView](-[TSDCanvasLayer canvasView](self->mCanvasLayer, "canvasView"), "enclosingScrollView"), "setContentOffset:", v12, v13);
  -[TSDInteractiveCanvasController viewDidEndZooming](v8, "viewDidEndZooming");
  -[TSDInteractiveCanvasController i_recordUserViewScale](v8, "i_recordUserViewScale");
  self->mIsZooming = 0;
  objc_msgSend(objc_loadWeak((id *)&self->mDelegate), "canvasZoomTrackerDidFinish:", self);
}

- (TSDCanvasZoomTrackerDelegate)delegate
{
  return (TSDCanvasZoomTrackerDelegate *)objc_loadWeak((id *)&self->mDelegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->mDelegate, a3);
}

- (BOOL)alwaysUsesTranslationSprings
{
  return self->mAlwaysUsesTranslationSprings;
}

- (void)setAlwaysUsesTranslationSprings:(BOOL)a3
{
  self->mAlwaysUsesTranslationSprings = a3;
}

- (BOOL)snapsViewScale
{
  return self->mSnapsViewScale;
}

- (void)setSnapsViewScale:(BOOL)a3
{
  self->mSnapsViewScale = a3;
}

- (BOOL)animateTransform
{
  return self->mAnimateTransform;
}

- (void)setAnimateTransform:(BOOL)a3
{
  self->mAnimateTransform = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mDelegate);
}

@end
