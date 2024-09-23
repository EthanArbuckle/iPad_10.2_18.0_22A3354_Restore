@implementation CRLShapeRepHelperDefault

- (CRLShapeRepHelperDefault)initWithShapeRep:(id)a3
{
  id v4;
  CRLShapeRepHelperDefault *v5;
  CRLShapeRepHelperDefault *v6;
  void *v7;
  void *v8;
  CGSize size;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLShapeRepHelperDefault;
  v5 = -[CRLShapeRepHelperDefault init](&v11, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_shapeRep, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shapeLayout"));
    objc_storeWeak((id *)&v6->_shapeLayout, v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shapeInfo"));
    objc_storeWeak((id *)&v6->_shapeInfo, v8);

    size = CGRectNull.size;
    v6->_committedPathImageUnscaledRect.origin = CGRectNull.origin;
    v6->_committedPathImageUnscaledRect.size = size;
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  CGContextRelease(self->_committedPathContext);
  CGImageRelease(self->_committedPathImage);
  v3.receiver = self;
  v3.super_class = (Class)CRLShapeRepHelperDefault;
  -[CRLShapeRepHelperDefault dealloc](&v3, "dealloc");
}

- (BOOL)drawsInOneStep
{
  CRLShapeLayout **p_shapeLayout;
  id WeakRetained;
  void *v5;
  unsigned int v6;
  _TtC8Freeform12CRLShapeItem **p_shapeInfo;
  id v8;
  void *v9;
  int v10;
  id v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  id v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;

  p_shapeLayout = &self->_shapeLayout;
  WeakRetained = objc_loadWeakRetained((id *)&self->_shapeLayout);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "fill"));

  if (v5)
    v6 = objc_msgSend(v5, "isClear") ^ 1;
  else
    v6 = 0;
  p_shapeInfo = &self->_shapeInfo;
  v8 = objc_loadWeakRetained((id *)&self->_shapeInfo);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stroke"));

  if ((objc_msgSend(v9, "shouldRender") & 1) == 0)
  {

    v9 = 0;
  }
  if (v9)
    v10 = v6 ^ 1;
  else
    v10 = 1;
  v11 = objc_loadWeakRetained((id *)p_shapeLayout);
  if (objc_msgSend(v11, "pathIsOpen"))
  {
    v12 = objc_loadWeakRetained((id *)p_shapeInfo);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "headLineEnd"));
    if (v13)
    {
      v14 = 0;
    }
    else
    {
      v15 = objc_loadWeakRetained((id *)p_shapeInfo);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tailLineEnd"));
      v14 = v16 == 0;

    }
  }
  else
  {
    v14 = 1;
  }

  if ((v10 & v14) == 1)
  {
    if (v6)
    {
      v17 = v5;
    }
    else
    {
      if (!v9)
      {
        v18 = 1;
        goto LABEL_23;
      }
      v17 = v9;
    }
    v18 = objc_msgSend(v17, "drawsInOneStep");
  }
  else
  {
    v18 = 0;
  }
LABEL_23:

  return v18;
}

- (BOOL)hasLegacyFreehandDrawingBrushStroke
{
  id WeakRetained;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->_shapeInfo);
  v4 = objc_msgSend(WeakRetained, "isFreehandDrawingShape");

  if (v4)
  {
    objc_opt_class(CRLBrushStroke, v5);
    v7 = v6;
    v8 = objc_loadWeakRetained((id *)&self->_shapeLayout);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stroke"));
    v10 = sub_100221D0C(v7, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "strokeName"));
      if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Pencil")) & 1) != 0)
      {
        LOBYTE(v4) = 1;
      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "strokeName"));
        LOBYTE(v4) = objc_msgSend(v13, "isEqualToString:", CFSTR("Crayon"));

      }
    }
    else
    {
      LOBYTE(v4) = 0;
    }

  }
  return v4;
}

- (void)drawInContext:(CGContext *)a3 withContent:(BOOL)a4 strokeDrawOptions:(unint64_t)a5 withOpacity:(BOOL)a6 usingPathOverride:(id)a7 patternOffsetsBySubpathOverride:(id)a8 transparencyLayersBySubpath:(id)a9
{
  _BOOL4 v10;
  id v14;
  id *v15;
  id v16;
  CRLShapeRep **p_shapeRep;
  id WeakRetained;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CRLShapeLayout **p_shapeLayout;
  id v25;
  void *v26;
  id v27;
  void *v28;
  CRLShapeRepHelperDefault *v29;
  id *v30;
  _BOOL4 v31;
  id v32;
  id v33;
  CGContext *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  CGImage *v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  id v61;
  void *v62;
  double v63;
  uint64_t v64;
  id v65;
  CGContext *v66;
  id v67;
  unsigned int v68;
  id v69;
  void *v70;
  void *v71;
  double v72;
  objc_class *v73;
  objc_class *v74;
  id v75;
  id v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  id *v86;
  id v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  id v91;
  CRLShapeRep **v92;
  _BOOL4 v93;
  CGContext *v94;
  void *v95;
  unsigned int v96;
  double v97;
  double v98;
  double v99;
  double v100;
  id v101;
  id *v102;
  id v103;
  void *v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  void *v110;
  uint64_t v111;
  objc_class *v112;
  id v113;
  void *v114;
  id v115;
  BOOL v116;
  id v117;
  double x;
  CGFloat y;
  double width;
  double height;
  id v122;
  id v123;
  double v124;
  unsigned int v125;
  char v126;
  void *v127;
  double v128;
  _BOOL4 v129;
  id v130;
  void *v131;
  double v132;
  _BOOL4 v133;
  void *v134;
  CGFloat v135;
  uint64_t v136;
  void *v137;
  double v138;
  uint64_t v139;
  uint64_t v140;
  id v141;
  id v142;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  id v151;
  void *v152;
  void *v153;
  id v154;
  id v155;
  uint64_t v156;
  id v157;
  void *v158;
  id v159;
  id v160;
  void *v161;
  uint64_t v162;
  uint64_t v163;
  CGContext *v164;
  id v165;
  void *v166;
  id v167;
  void *v168;
  _BOOL4 v169;
  id v170;
  unsigned int v171;
  id v172;
  id *v173;
  id v174;
  unint64_t v175;
  unint64_t v176;
  id v177;
  CGFloat v178;
  CGFloat v179;
  CGFloat v180;
  CGFloat v181;
  double v182;
  double v183;
  double v184;
  id v185;
  id v186;
  id v187;
  uint64_t v188;
  uint64_t v189;
  CRLShapeRep **v190;
  id v191;
  CGContext *committedPathContext;
  id v193;
  void *v194;
  id v195;
  void *v196;
  uint64_t v197;
  id v198;
  void *v199;
  id *v200;
  uint64_t v201;
  id v202;
  CRLBrushStrokeLayoutOptions *v203;
  id v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  id v209;
  double v210;
  double v211;
  id v212;
  double v213;
  double v214;
  id v215;
  void *v216;
  id v217;
  id v218;
  id v219;
  uint64_t v220;
  uint64_t v221;
  CRLShapeRep **v222;
  id v223;
  id v224;
  uint64_t v225;
  id v226;
  void *v227;
  id v228;
  void *v229;
  void *v230;
  id *v231;
  id v232;
  id v233;
  double v234;
  id v235;
  void *v236;
  id v237;
  id v238;
  id v239;
  id v240;
  id *p_shapeInfo;
  id *v242;
  unsigned int v243;
  id *v244;
  id *v245;
  unsigned int v246;
  _BOOL4 v247;
  void *v248;
  void *v249;
  id v250;
  unint64_t v251;
  void *v252;
  void *v253;
  void *v254;
  unsigned int v255;
  id *location;
  id *locationa;
  id v258;
  _BOOL4 v259;
  double v260;
  int v261;
  id v262;
  void *v263;
  CRLShapeRepHelperDefault *v264;
  double v265;
  CGAffineTransform v266;
  CGAffineTransform v267;
  _OWORD v268[3];
  id v269;
  id v270;
  CGPoint v271;
  CGPoint v272;
  CGAffineTransform v273;
  CGAffineTransform v274;
  CGAffineTransform transform;
  void *v276;
  CGRect v277;
  CGRect v278;
  CGRect v279;
  CGRect v280;

  v10 = a6;
  v259 = a4;
  v14 = a7;
  v15 = (id *)a8;
  v16 = a9;
  p_shapeRep = &self->_shapeRep;
  WeakRetained = objc_loadWeakRetained((id *)&self->_shapeRep);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvas"));

  v263 = v19;
  v255 = objc_msgSend(v19, "shouldSuppressBackgrounds");
  v264 = self;
  if (v255 != sub_100411EAC((uint64_t)a3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256D10);
    v20 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
      sub_100E297F0();

    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256D30);
    v21 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
      sub_100E296B4();

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRepHelperDefault drawInContext:withContent:strokeDrawOptions:withOpacity:usingPathOverride:patternOffsetsBySubpathOverride:transparencyLayersBySubpath:]"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRepHelperDefault.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 109, 0, "Canvas and CGContext disagree about whether we are suppressing backgrounds");

    p_shapeRep = &self->_shapeRep;
  }
  p_shapeLayout = &self->_shapeLayout;
  v25 = objc_loadWeakRetained((id *)p_shapeLayout);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "path"));
  if (!objc_msgSend(v26, "containsElementsOtherThanMoveAndClose"))
  {

    goto LABEL_161;
  }
  location = (id *)p_shapeLayout;

  if ((a5 & 3) != 0 || (a5 & 4) != 0 || v259)
  {
    CGContextSaveGState(a3);
    v27 = objc_loadWeakRetained((id *)p_shapeRep);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "freehandDrawingDynamicFillErasingDelegate"));

    v29 = v264;
    v251 = a5;
    if (v28)
    {
      v30 = v15;
      v31 = v10;
      v32 = v14;
      v33 = objc_loadWeakRetained((id *)p_shapeRep);
      v34 = a3;
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "freehandDrawingDynamicFillErasingDelegate"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "maskImageForErasing"));

      a3 = v34;
      if (v36)
      {
        v37 = objc_loadWeakRetained(location);
        v38 = v37;
        if (v37)
          objc_msgSend(v37, "transformInRoot");
        else
          memset(&v274, 0, sizeof(v274));
        CGAffineTransformInvert(&transform, &v274);
        CGContextConcatCTM(v34, &transform);

        v39 = objc_loadWeakRetained((id *)p_shapeRep);
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "freehandDrawingDynamicFillErasingDelegate"));
        objc_msgSend(v40, "unscaledRectForMaskImageForErasing");
        v42 = v41;
        v44 = v43;
        v46 = v45;
        v48 = v47;
        v49 = (CGImage *)objc_msgSend(v36, "CGImage");
        v277.origin.x = v42;
        v277.origin.y = v44;
        v277.size.width = v46;
        v277.size.height = v48;
        CGContextClipToMask(v34, v277, v49);

        v50 = objc_loadWeakRetained(location);
        v51 = v50;
        if (v50)
          objc_msgSend(v50, "transformInRoot");
        else
          memset(&v273, 0, sizeof(v273));
        v29 = v264;
        a3 = v34;
        CGContextConcatCTM(v34, &v273);

      }
      v14 = v32;
      v10 = v31;
      v15 = v30;
      a5 = v251;
    }
    if (v10)
    {
      v52 = objc_loadWeakRetained((id *)p_shapeRep);
      v246 = objc_msgSend(v52, "i_beginApplyOpacity:forDrawingInOneStep:", a3, -[CRLShapeRepHelperDefault drawsInOneStep](v29, "drawsInOneStep"));

    }
    else
    {
      v246 = 0;
    }
    v53 = objc_loadWeakRetained(location);
    objc_msgSend(v53, "pathBounds");
    v55 = v54;
    v57 = v56;

    CGContextTranslateCTM(a3, -v55, -v57);
    objc_msgSend(v263, "viewScale");
    v59 = v58;
    v60 = sub_1004121D0((uint64_t)a3);
    v271 = CGPointZero;
    v272 = v271;
    v61 = objc_loadWeakRetained(location);
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "stroke"));

    if ((objc_msgSend(v62, "shouldRender") & 1) == 0)
    {

      v62 = 0;
    }
    v63 = v59 * v60;
    v258 = v14;
    v249 = v62;
    if (v14)
    {
      v250 = objc_msgSend(v14, "copy");
      v65 = objc_msgSend(v62, "copy");
    }
    else
    {
      v66 = a3;
      v67 = objc_loadWeakRetained((id *)&v264->_shapeInfo);
      v68 = objc_msgSend(v67, "isFreehandDrawingShape");

      v69 = objc_loadWeakRetained(location);
      v70 = v69;
      if (v68)
      {
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "path"));
        v250 = objc_msgSend(v71, "copy");

        v65 = objc_msgSend(v62, "copy");
      }
      else
      {
        v269 = 0;
        v270 = 0;
        objc_msgSend(v69, "aliasPathForScale:adjustedStroke:adjustedPath:startDelta:endDelta:", &v270, &v269, &v272, &v271, v59 * v60);
        v65 = v270;
        v250 = v269;

      }
      a3 = v66;
    }
    *(_QWORD *)&v72 = objc_opt_class(CRLStroke, v64).n128_u64[0];
    v74 = v73;
    v248 = v65;
    v75 = objc_msgSend(v65, "mutableCopy", v72);
    v76 = sub_1002223BC(v74, v75);
    v77 = (void *)objc_claimAutoreleasedReturnValue(v76);

    objc_opt_class(CRLStroke, v78);
    v252 = v77;
    v85 = sub_10022209C(v77, v79, 1, v80, v81, v82, v83, v84, (uint64_t)&OBJC_PROTOCOL___CRLMutableStroke);
    v253 = (void *)objc_claimAutoreleasedReturnValue(v85);
    v262 = v16;
    if (v253)
    {
      v86 = v15;
      v87 = objc_loadWeakRetained((id *)&v264->_shapeInfo);
      v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "pathSource"));
      objc_opt_class(CRLScalarPathSource, v89);
      if ((objc_opt_isKindOfClass(v88, v90) & 1) != 0)
      {
        v91 = objc_loadWeakRetained((id *)&v264->_shapeInfo);
        v92 = p_shapeRep;
        v93 = v10;
        v94 = a3;
        v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "pathSource"));
        v96 = objc_msgSend(v95, "isCurveContinuous");

        a3 = v94;
        v10 = v93;
        p_shapeRep = v92;

        v15 = v86;
        v16 = v262;
        a5 = v251;
        if (v96)
        {
          objc_msgSend(v253, "width");
          v98 = v97;
          objc_msgSend(v263, "viewScale");
          if (v98 * v99 < 1.1)
          {
            objc_msgSend(v253, "width");
            objc_msgSend(v253, "setWidth:", v100 + 0.1);
          }
        }
      }
      else
      {

        v15 = v86;
        a5 = v251;
      }
    }
    v101 = objc_loadWeakRetained(location);
    if (objc_msgSend(v101, "pathIsOpen"))
    {
      v102 = v15;
      v103 = objc_loadWeakRetained((id *)&v264->_shapeInfo);
      v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "headLineEnd"));
      if (v104)
      {
        v247 = 1;
      }
      else
      {
        v105 = objc_loadWeakRetained((id *)&v264->_shapeInfo);
        v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "tailLineEnd"));
        v247 = v106 != 0;

      }
      v15 = v102;
      a5 = v251;
    }
    else
    {
      v247 = 0;
    }
    v107 = v249;

    v14 = v258;
    v108 = v253;
    if (v259)
    {
      v109 = objc_loadWeakRetained(location);
      v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "fill"));

      if (v110 && ((objc_msgSend(v110, "isClear") | v255) & 1) == 0)
      {
        if (objc_msgSend(v110, "fillType") == (id)1
          && (objc_opt_class(CRLGradientFill, v111),
              v113 = sub_1002223BC(v112, v110),
              v114 = (void *)objc_claimAutoreleasedReturnValue(v113),
              v115 = objc_msgSend(v114, "gradientType"),
              v114,
              v116 = v115 == (id)1,
              v108 = v253,
              v116))
        {
          v117 = objc_loadWeakRetained((id *)p_shapeRep);
          objc_msgSend(v117, "boundsForStandardKnobs");
          v279 = CGRectOffset(v278, v55, v57);
          x = v279.origin.x;
          v260 = v63;
          y = v279.origin.y;
          width = v279.size.width;
          height = v279.size.height;

          v122 = objc_msgSend(objc_retainAutorelease(v250), "CGPath");
          v123 = objc_msgSend(v263, "isDrawingIntoPDF");
          v124 = y;
          v63 = v260;
          objc_msgSend(v110, "paintPath:naturalBounds:inContext:isPDF:", v122, a3, v123, x, v124, width, height);
        }
        else
        {
          objc_msgSend(v110, "paintPath:inContext:", objc_msgSend(objc_retainAutorelease(v250), "CGPath"), a3);
        }
      }

      v16 = v262;
    }
    if (!v108)
      goto LABEL_158;
    v125 = objc_msgSend(v108, "shouldRender");
    if ((a5 & 7) == 0 || !v125)
      goto LABEL_158;
    v126 = !v247;
    if ((a5 & 1) == 0)
      v126 = 1;
    if ((v126 & 1) != 0)
    {
      v129 = 0;
    }
    else
    {
      v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "color"));
      objc_msgSend(v127, "alphaComponent");
      v129 = (a5 & 8) == 0 && v128 < 1.0;

    }
    v130 = objc_loadWeakRetained((id *)p_shapeRep);
    if (objc_msgSend(v130, "i_isCurrentlyBeingFreehandDrawn"))
    {
      v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v253, "color"));
      objc_msgSend(v131, "alphaComponent");
      v133 = v132 < 1.0;

    }
    else
    {
      v133 = 0;
    }

    v261 = v133 || v129;
    if (v133 || v129)
    {
      CGContextSaveGState(a3);
      v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v253, "color"));
      objc_msgSend(v134, "alphaComponent");
      CGContextSetAlpha(a3, v135);

      CGContextBeginTransparencyLayer(a3, 0);
      v107 = v249;
      if (v252 == v249)
      {
        *(_QWORD *)&v138 = objc_opt_class(CRLStroke, v136).n128_u64[0];
        v140 = v139;
        v141 = objc_msgSend(v249, "mutableCopy", v138);
        v142 = sub_100221D0C(v140, v141);
        v143 = (void *)objc_claimAutoreleasedReturnValue(v142);

        objc_opt_class(CRLStroke, v144);
        v252 = v143;
        v151 = sub_10022209C(v143, v145, 1, v146, v147, v148, v149, v150, (uint64_t)&OBJC_PROTOCOL___CRLMutableStroke);
        v137 = (void *)objc_claimAutoreleasedReturnValue(v151);

        if (!v137)
        {
          v108 = 0;
          goto LABEL_80;
        }
        v253 = v137;
      }
      else
      {
        v137 = v253;
      }
      v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "color"));
      v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "colorWithAlphaComponent:", 1.0));
      objc_msgSend(v137, "setColor:", v153);

    }
    else
    {
      v107 = v249;
    }
    v108 = v253;
LABEL_80:
    v154 = objc_loadWeakRetained((id *)p_shapeRep);
    if (objc_msgSend(v154, "isBeingResized"))
    {
      if ((uint64_t)objc_msgSend(v250, "elementCount") <= 20)
      {
        v155 = objc_loadWeakRetained((id *)&v264->_shapeInfo);
        v243 = objc_msgSend(v155, "isFreehandDrawingShape");

      }
      else
      {
        v243 = 1;
      }
    }
    else
    {
      v243 = 0;
    }

    if ((a5 & 1) != 0)
    {
      v157 = objc_loadWeakRetained((id *)p_shapeRep);
      v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v157, "i_strokeForRenderingIncludingPlaybackFromStroke:", v252));

      v254 = v108;
      if ((a5 & 8) != 0)
      {
        v159 = objc_loadWeakRetained((id *)p_shapeRep);
        v252 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "i_brushStrokeFromStroke:", v158));

      }
      else
      {
        v252 = v158;
      }
      CGContextSaveGState(a3);
      v160 = objc_loadWeakRetained((id *)&v264->_shapeInfo);
      v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "pathSource"));
      objc_opt_class(CRLScalarPathSource, v162);
      p_shapeInfo = (id *)&v264->_shapeInfo;
      if ((objc_opt_isKindOfClass(v161, v163) & 1) != 0)
      {
        v244 = v15;
        v164 = a3;
        v165 = objc_loadWeakRetained((id *)&v264->_shapeInfo);
        v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v165, "pathSource"));
        if (objc_msgSend(v166, "isCurveContinuous"))
        {
          v167 = objc_loadWeakRetained(location);
          v168 = v167;
          if (v167)
            objc_msgSend(v167, "transformInRoot");
          else
            memset(v268, 0, sizeof(v268));
          v169 = sub_100079384((double *)v268);

          a3 = v164;
          v15 = v244;
          if (v169)
          {
            CGAffineTransformMakeRotation(&v267, 0.000001);
            CGContextConcatCTM(v164, &v267);
          }
        }
        else
        {

          a3 = v164;
          v15 = v244;
        }
      }
      else
      {

      }
      v170 = objc_loadWeakRetained((id *)p_shapeRep);
      v171 = objc_msgSend(v170, "i_isCurrentlyBeingFreehandDrawn");

      v108 = v254;
      if (v171)
      {
        v172 = objc_loadWeakRetained((id *)p_shapeRep);
        v173 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v172, "interactiveCanvasController"));

        v174 = objc_loadWeakRetained((id *)p_shapeRep);
        objc_msgSend(v174, "i_uncommittedFreehandDrawingPointRange");
        v176 = v175;

        v107 = v249;
        v242 = v173;
        if (v176 >= 5)
        {
          if (!v264->_committedPathContext)
          {
            v177 = objc_loadWeakRetained((id *)p_shapeRep);
            objc_msgSend(v177, "i_scaledFrameForFreehandCommittedPathImage");
            objc_msgSend(v173, "convertBoundsToUnscaledRect:");
            v264->_committedPathImageUnscaledRect.origin.x = v178;
            v264->_committedPathImageUnscaledRect.origin.y = v179;
            v264->_committedPathImageUnscaledRect.size.width = v180;
            v264->_committedPathImageUnscaledRect.size.height = v181;

            v182 = sub_1000603DC(v264->_committedPathImageUnscaledRect.size.width, v264->_committedPathImageUnscaledRect.size.height, v63);
            v184 = v183;
            v185 = objc_loadWeakRetained((id *)p_shapeRep);
            v264->_committedPathContext = sub_10040FA64((char)objc_msgSend(v185, "i_bitmapContextOptionsForContextDestinedToDrawIntoCALayerContextForDrawingStroke:", v252), v182, v184);

          }
          v186 = objc_loadWeakRetained((id *)p_shapeRep);
          v187 = objc_msgSend(v186, "i_commitAvailableFreehandDrawingPointsIfPossible");
          v189 = v188;

          v108 = v254;
          if (v189)
          {
            v190 = p_shapeRep;
            v191 = objc_msgSend(v250, "copyWithPointsInRange:", v187, v189);
            CGContextSaveGState(v264->_committedPathContext);
            CGContextScaleCTM(v264->_committedPathContext, v63, v63);
            CGContextTranslateCTM(v264->_committedPathContext, -v264->_committedPathImageUnscaledRect.origin.x, -v264->_committedPathImageUnscaledRect.origin.y);
            committedPathContext = v264->_committedPathContext;
            v193 = objc_loadWeakRetained(location);
            v194 = v193;
            if (v193)
              objc_msgSend(v193, "transformInRoot");
            else
              memset(&v266, 0, sizeof(v266));
            CGContextConcatCTM(committedPathContext, &v266);

            CGContextTranslateCTM(v264->_committedPathContext, -v55, -v57);
            v217 = objc_retainAutorelease(v191);
            objc_msgSend(v252, "paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:", objc_msgSend(v217, "CGPath"), 0, v264->_committedPathContext, v243, (a5 >> 3) & 1, (a5 >> 4) & 1);
            CGContextRestoreGState(v264->_committedPathContext);
            CGImageRelease(v264->_committedPathImage);
            v264->_committedPathImage = CGBitmapContextCreateImage(v264->_committedPathContext);

            p_shapeRep = v190;
            v107 = v249;
            v108 = v254;
          }
        }
        if (v264->_committedPathImage)
        {
          CGContextSaveGState(a3);
          CGContextTranslateCTM(a3, v55, v57);
          v218 = objc_loadWeakRetained((id *)p_shapeRep);
          objc_msgSend(v218, "convertNaturalRectFromUnscaledCanvas:", v264->_committedPathImageUnscaledRect.origin.x, v264->_committedPathImageUnscaledRect.origin.y, v264->_committedPathImageUnscaledRect.size.width, v264->_committedPathImageUnscaledRect.size.height);
          CGContextDrawImage(a3, v280, v264->_committedPathImage);

          CGContextRestoreGState(a3);
        }
        v219 = objc_loadWeakRetained((id *)p_shapeRep);
        objc_msgSend(v219, "i_uncommittedFreehandDrawingPointRange");
        v221 = v220;

        if (v221)
        {
          v222 = p_shapeRep;
          v223 = objc_loadWeakRetained((id *)p_shapeRep);
          v224 = objc_msgSend(v223, "i_uncommittedFreehandDrawingPointRange");
          v226 = objc_msgSend(v250, "copyWithPointsInRange:", v224, v225);

          p_shapeRep = v222;
          v227 = v226;
          v108 = v254;
          v250 = objc_retainAutorelease(v227);
          objc_msgSend(v252, "paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:", objc_msgSend(v250, "CGPath"), 0, a3, v243, (a5 >> 3) & 1, (a5 >> 4) & 1);
        }
        v16 = v262;
        v14 = v258;
      }
      else
      {
        v195 = objc_loadWeakRetained(location);
        v196 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v195, "dynamicPatternOffsetsBySubpath"));

        if (v196)
        {
          v198 = objc_loadWeakRetained(location);
          v199 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v198, "dynamicPatternOffsetsBySubpath"));

        }
        else
        {
          v199 = 0;
        }
        v107 = v249;
        if (v15)
        {
          v200 = v15;

          v242 = v200;
        }
        else
        {
          v242 = (id *)v199;
        }
        v245 = (id *)p_shapeRep;
        objc_opt_class(CRLBrushStroke, v197);
        v202 = sub_100221D0C(v201, v252);
        locationa = (id *)objc_claimAutoreleasedReturnValue(v202);
        if (locationa)
        {
          v203 = objc_alloc_init(CRLBrushStrokeLayoutOptions);
          v204 = objc_loadWeakRetained(v245);
          objc_msgSend(v204, "strokeEnd");
          -[CRLBrushStrokeLayoutOptions setStrokeEnd:](v203, "setStrokeEnd:");

          if (-[CRLShapeRepHelperDefault hasLegacyFreehandDrawingBrushStroke](v264, "hasLegacyFreehandDrawingBrushStroke"))
          {
            -[CRLBrushStrokeLayoutOptions setTransparencyLayersBySubpath:](v203, "setTransparencyLayersBySubpath:", v262);
            if (v242)
            {
              -[CRLBrushStrokeLayoutOptions setPatternOffsetsBySubpath:](v203, "setPatternOffsetsBySubpath:");
            }
            else
            {
              v228 = objc_loadWeakRetained(p_shapeInfo);
              objc_msgSend(v228, "strokePatternOffsetDistance");
              v229 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
              v276 = v229;
              v230 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v276, 1));
              -[CRLBrushStrokeLayoutOptions setPatternOffsetsBySubpath:](v203, "setPatternOffsetsBySubpath:", v230);

              v108 = v254;
            }
          }
          v250 = objc_retainAutorelease(v250);
          v231 = locationa;
          objc_msgSend(locationa, "paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:withLayoutOptions:", objc_msgSend(v250, "CGPath"), 0, a3, v243, (a5 >> 3) & 1, (a5 >> 4) & 1, v203);

          p_shapeRep = (CRLShapeRep **)v245;
          v14 = v258;
        }
        else
        {
          if (v262)
          {
            +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101256D50);
            v205 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)v205, OS_LOG_TYPE_ERROR))
              sub_100E29744();

            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101256D70);
            v108 = v254;
            v206 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)v206, OS_LOG_TYPE_ERROR))
              sub_100E296B4();

            v207 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRepHelperDefault drawInContext:withContent:strokeDrawOptions:withOpacity:usingPathOverride:patternOffsetsBySubpathOverride:transparencyLayersBySubpath:]"));
            v208 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRepHelperDefault.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v207, v208, 339, 0, "expected nil value for '%{public}s'", "transparencyLayersBySubpath", p_shapeInfo);

            v107 = v249;
          }
          p_shapeRep = (CRLShapeRep **)v245;
          v209 = objc_loadWeakRetained(v245);
          objc_msgSend(v209, "strokeEnd");
          v211 = v210;

          if (v211 >= 1.0)
          {
            v14 = v258;
            v216 = v250;
          }
          else
          {
            v212 = objc_loadWeakRetained(v245);
            objc_msgSend(v212, "strokeEnd");
            v214 = v213;

            v14 = v258;
            if (v214 >= 0.0001)
            {
              v265 = 0.0;
              v232 = objc_loadWeakRetained(v245);
              objc_msgSend(v232, "strokeEnd");
              v233 = objc_msgSend(v250, "elementPercentage:forOverallPercentage:", &v265);

              v215 = objc_msgSend(v250, "copyFromSegment:t:toSegment:t:", 0, v233, 0.0, v265);
              v108 = v254;
            }
            else
            {
              v215 = (id)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));

            }
            v216 = v215;
          }
          v250 = objc_retainAutorelease(v216);
          objc_msgSend(v252, "paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:", objc_msgSend(v250, "CGPath"), 0, a3, v243, (a5 >> 3) & 1, (a5 >> 4) & 1);
          v231 = 0;
        }

        v16 = v262;
      }

      CGContextRestoreGState(a3);
    }
    else
    {
      v16 = v262;
    }
    if (v247)
    {
      if ((v255 & 1) != 0)
      {
        *(_QWORD *)&v234 = objc_opt_class(v108, v156).n128_u64[0];
        v236 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v235, "colorOnSuppressedBackgrounds", v234));
      }
      else
      {
        v236 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "color"));
      }
      v237 = v236;

      CGContextSetStrokeColorWithColor(a3, (CGColorRef)objc_msgSend(v237, "CGColor"));
      CGContextSetFillColorWithColor(a3, (CGColorRef)objc_msgSend(v237, "CGColor"));
      if ((a5 & 2) != 0 && v252)
      {
        v238 = objc_loadWeakRetained((id *)p_shapeRep);
        objc_msgSend(v238, "i_drawLineEndForHead:withDelta:andStroke:inContext:useFastDrawing:", 1, v108, a3, v243, v271);

      }
      if ((a5 & 4) != 0 && v252)
      {
        v239 = objc_loadWeakRetained((id *)p_shapeRep);
        objc_msgSend(v239, "i_drawLineEndForHead:withDelta:andStroke:inContext:useFastDrawing:", 0, v108, a3, v243, v272);

      }
      v16 = v262;
    }
    if (v261)
    {
      CGContextEndTransparencyLayer(a3);
      CGContextRestoreGState(a3);
    }
LABEL_158:
    if (v10)
    {
      v240 = objc_loadWeakRetained((id *)p_shapeRep);
      objc_msgSend(v240, "i_endApplyOpacity:appliedTransparencyLayer:", a3, v246);

    }
    CGContextRestoreGState(a3);

  }
LABEL_161:

}

- (void)dynamicOperationDidEnd
{
  CGContext *committedPathContext;
  CGImage *committedPathImage;
  CGSize size;

  committedPathContext = self->_committedPathContext;
  if (committedPathContext)
  {
    CFRelease(committedPathContext);
    self->_committedPathContext = 0;
  }
  committedPathImage = self->_committedPathImage;
  if (committedPathImage)
  {
    CFRelease(committedPathImage);
    self->_committedPathImage = 0;
  }
  size = CGRectNull.size;
  self->_committedPathImageUnscaledRect.origin = CGRectNull.origin;
  self->_committedPathImageUnscaledRect.size = size;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_shapeInfo);
  objc_destroyWeak((id *)&self->_shapeLayout);
  objc_destroyWeak((id *)&self->_shapeRep);
}

@end
