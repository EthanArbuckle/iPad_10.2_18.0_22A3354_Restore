@implementation PXTitleSubtitleCALayerPromise

- (id)_attributedStringForLabelWithText:(id)a3 spec:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char CanEncodeString;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length") && (objc_msgSend(v7, "isHidden") & 1) == 0)
  {
    objc_msgSend(v7, "textAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "capitalization");
    +[PXKitSettings sharedInstance](PXKitSettings, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "allowFontFallback") & 1) != 0
      && (objc_msgSend(v7, "fallbackTextAttributes"), (v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v13 = (void *)v12;
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      CanEncodeString = PXFontCanEncodeString();

      if ((CanEncodeString & 1) == 0)
      {
        objc_msgSend(v7, "fallbackTextAttributes");
        v16 = objc_claimAutoreleasedReturnValue();

        v10 = objc_msgSend(v7, "fallbackCapitalization");
        v9 = (void *)v16;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "px_stringByApplyingCapitalization:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v9)
    {
      objc_msgSend(v18, "addEntriesFromDictionary:", v9);
    }
    else
    {
      objc_msgSend(v7, "font");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0DC1138]);

    }
    objc_msgSend(v7, "textColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0DC1140]);

    v22 = *MEMORY[0x1E0DC1178];
    objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1178]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "mutableCopy");
    v25 = v24;
    if (v24)
      v26 = v24;
    else
      v26 = objc_alloc_init(MEMORY[0x1E0DC1288]);
    v27 = v26;

    objc_msgSend(v27, "setAlignment:", objc_msgSend(v7, "textAlignment"));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v27, v22);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v17, v19);

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v8, "size");
  v29 = v28;
  -[PXCALayerPromise bounds](self, "bounds");
  if (v29 > v30)
  {
    -[PXCALayerPromise bounds](self, "bounds");
    -[PXTitleSubtitleCALayerPromise _stringByReplacingNonbreakableWhitespaceToAllowLineWrapping:maxWidth:](self, "_stringByReplacingNonbreakableWhitespaceToAllowLineWrapping:maxWidth:", v8, v31);
    v32 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v32;
  }

  return v8;
}

- (id)createCustomLayer
{
  void *v3;
  int v4;
  CGPath *Mutable;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const CGPath *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  double v24;
  double v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  +[PXKitSettings sharedInstance](PXKitSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "defaultUseShapeLayerForText");

  if (v4)
  {
    Mutable = CGPathCreateMutable();
    -[PXTitleSubtitleCALayerPromise _linesToRenderWithContext:](self, "_linesToRenderWithContext:", 0);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v28;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v10);
        if (-[PXCALayerPromise shouldCancel](self, "shouldCancel", (_QWORD)v27))
          break;
        v12 = (const CGPath *)objc_msgSend(v11, "createPath");
        CGPathAddPath(Mutable, 0, v12);
        CGPathRelease(v12);
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          if (v8)
            goto LABEL_4;
          break;
        }
      }
    }

    -[PXTitleSubtitleCALayerPromise spec](self, "spec");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "titleLabelSpec");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "textColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textAttributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1198]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[PXCALayerPromise shouldCancel](self, "shouldCancel"))
    {
      v18 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
        objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
      objc_msgSend(MEMORY[0x1E0CD2840], "layer", (_QWORD)v27);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setDelegate:", self);
      objc_msgSend(v18, "setPath:", Mutable);
      objc_msgSend(v18, "setFillColor:", objc_msgSend(objc_retainAutorelease(v15), "CGColor"));
      -[PXCALayerPromise bounds](self, "bounds");
      objc_msgSend(v18, "setBounds:");
      if (v17)
      {
        -[PXTitleSubtitleCALayerPromise _textScaleFactor](self, "_textScaleFactor");
        v20 = v19;
        -[PXCALayerPromise contentsScale](self, "contentsScale");
        v22 = v20 / v21;
        objc_msgSend(v17, "shadowColor");
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v18, "setShadowColor:", objc_msgSend(v23, "CGColor"));

        LODWORD(v24) = 1.0;
        objc_msgSend(v18, "setShadowOpacity:", v24);
        objc_msgSend(v17, "shadowOffset");
        PXSizeScale();
        objc_msgSend(v18, "setShadowOffset:");
        objc_msgSend(v17, "shadowBlurRadius");
        objc_msgSend(v18, "setShadowRadius:", v22 * v25);
        objc_msgSend(v18, "setShadowPath:", Mutable);
      }
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
    }
    CGPathRelease(Mutable);

  }
  else
  {
    v18 = 0;
  }
  return v18;
}

- (id)_linesToRenderWithContext:(CGContext *)a3
{
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  void *v14;
  int64_t v15;
  id v16;
  PXLabelTypesetter *v17;
  double v18;
  CGFloat v19;
  void *v20;
  double v21;
  double v22;
  PXLabelTypesetter *v23;
  id v24;
  void (**v25)(void *, void *, void *, double);
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  PXTitleSubtitleCALayerPromise *v34;
  NSArray *v35;
  CGFloat v36;
  CGFloat v37;
  uint64_t v38;
  void (**v39)(void *, void *);
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void (**v45)(void *, uint64_t);
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  double v56;
  double v57;
  id v58;
  uint64_t v59;
  CGFloat height;
  CGFloat width;
  CGFloat x;
  CGFloat y;
  uint64_t v64;
  uint64_t v65;
  uint64_t j;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  double v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  double v75;
  uint64_t v76;
  uint64_t k;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  CGFloat v85;
  uint64_t m;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  CGFloat v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t n;
  void *v96;
  double MaxX;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  void (**v104)(void *, uint64_t);
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  double v110;
  double v111;
  void *v112;
  double v113;
  double v114;
  double v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  double v119;
  uint64_t v120;
  uint64_t ii;
  void *v122;
  double v123;
  double v124;
  double MaxY;
  id v126;
  uint64_t v127;
  uint64_t v128;
  double v129;
  uint64_t v130;
  uint64_t jj;
  void *v132;
  double v133;
  double v134;
  double MinY;
  id v136;
  uint64_t v137;
  uint64_t v138;
  double v139;
  uint64_t v140;
  uint64_t kk;
  void *v142;
  double v143;
  double v144;
  BOOL v145;
  double v146;
  uint64_t v147;
  uint64_t v148;
  double v149;
  uint64_t v150;
  void *v151;
  double v152;
  CGFloat v153;
  CGFloat v154;
  CGFloat v155;
  CGFloat v156;
  void *v157;
  double v158;
  double v159;
  double v160;
  void *v161;
  int v162;
  NSArray *diagnosticsRenderedLines;
  NSArray *v164;
  id v165;
  double MidX;
  id v168;
  void (**v169)(void *, void *);
  void (**v170)(void *, uint64_t);
  void (**v171)(void *, void *, void *, double);
  PXLabelTypesetter *v172;
  void *v173;
  double v174;
  double v175;
  double v176;
  void *v177;
  id obj;
  PXTitleSubtitleCALayerPromise *v179;
  CGFloat MidY;
  uint64_t v181;
  double v182;
  _BOOL4 v183;
  double v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  _QWORD v204[4];
  id v205;
  id v206;
  id v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  _QWORD v231[4];
  id v232;
  id v233;
  id v234;
  PXTitleSubtitleCALayerPromise *v235;
  SEL v236;
  _QWORD v237[8];
  _QWORD aBlock[5];
  PXLabelTypesetter *v239;
  id v240;
  CGFloat v241;
  CGFloat v242;
  CGFloat v243;
  double v244;
  int64_t v245;
  _BYTE v246[128];
  _BYTE v247[128];
  _BYTE v248[128];
  _BYTE v249[128];
  _BYTE v250[128];
  _BYTE v251[128];
  _BYTE v252[128];
  _BYTE v253[128];
  _BYTE v254[128];
  uint64_t v255;
  CGRect v256;
  CGRect v257;
  CGRect v258;
  CGRect v259;
  CGRect v260;
  CGRect v261;
  CGRect v262;
  CGRect v263;
  CGRect v264;
  CGRect v265;
  CGRect v266;
  CGRect v267;
  CGRect v268;
  CGRect v269;
  CGRect v270;
  CGRect v271;
  CGRect v272;
  CGRect v273;

  v255 = *MEMORY[0x1E0C80C00];
  -[PXCALayerPromise bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[PXTitleSubtitleCALayerPromise spec](self, "spec");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v179 = self;
  v15 = -[PXTitleSubtitleCALayerPromise typesettingMode](self, "typesettingMode");
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = -[PXLabelTypesetter initWithContext:]([PXLabelTypesetter alloc], "initWithContext:", a3);
  if (v15 == 2)
  {
    PXSizeScale();
    v19 = v21;
    v18 = v22;
  }
  else
  {
    v18 = v13;
    v19 = v11;
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v179, CFSTR("PXTitleSubtitleCALayerPromise.m"), 163, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PXTitleSubtitleCALayerPromise__linesToRenderWithContext___block_invoke;
  aBlock[3] = &unk_1E5142848;
  aBlock[4] = v179;
  v23 = v17;
  v239 = v23;
  v241 = v7;
  v242 = v9;
  v243 = v19;
  v244 = v18;
  v245 = v15;
  v24 = v16;
  v240 = v24;
  v25 = (void (**)(void *, void *, void *, double))_Block_copy(aBlock);
  -[PXTitleSubtitleCALayerPromise titleText](v179, "titleText");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "titleLabelSpec");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2](v25, v26, v27, 0.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXTitleSubtitleCALayerPromise subtitleText](v179, "subtitleText");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "subtitleLabelSpec");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "distanceBetweenTitleBaselineAndSubtitleBaseline");
  ((void (*)(void (**)(void *, void *, void *, double), void *, void *))v25[2])(v25, v29, v30);
  v177 = (void *)objc_claimAutoreleasedReturnValue();

  v256.origin.x = v7;
  v256.origin.y = v9;
  v256.size.width = v11;
  v256.size.height = v13;
  MidY = CGRectGetMidY(v256);
  v31 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v32 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v175 = *MEMORY[0x1E0C9D628];
  v176 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v33 = 1.0;
  if (!objc_msgSend(v24, "count"))
  {
    v35 = 0;
    v34 = v179;
    goto LABEL_9;
  }
  v34 = v179;
  if (-[PXCALayerPromise shouldCancel](v179, "shouldCancel"))
  {
    v35 = 0;
LABEL_9:
    v37 = v175;
    v36 = v176;
    goto LABEL_100;
  }
  v171 = v25;
  v172 = v23;
  v173 = v24;
  v174 = v31;
  if (v15 == 2)
  {
    v38 = MEMORY[0x1E0C809B0];
    v237[0] = MEMORY[0x1E0C809B0];
    v237[1] = 3221225472;
    v237[2] = __59__PXTitleSubtitleCALayerPromise__linesToRenderWithContext___block_invoke_3;
    v237[3] = &__block_descriptor_64_e17_v16__0__NSArray_8l;
    *(CGFloat *)&v237[4] = v7;
    *(CGFloat *)&v237[5] = v9;
    *(CGFloat *)&v237[6] = v11;
    *(double *)&v237[7] = v13;
    v39 = (void (**)(void *, void *))_Block_copy(v237);
    v39[2](v39, v28);
    v169 = v39;
    v39[2](v39, v177);
    v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v231[0] = v38;
    v231[1] = 3221225472;
    v231[2] = __59__PXTitleSubtitleCALayerPromise__linesToRenderWithContext___block_invoke_4;
    v231[3] = &unk_1E5142890;
    v43 = v40;
    v232 = v43;
    v44 = v41;
    v233 = v44;
    v236 = a2;
    v168 = v42;
    v234 = v168;
    v235 = v179;
    v45 = (void (**)(void *, uint64_t))_Block_copy(v231);
    objc_msgSend(v14, "titleLabelSpec");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2](v45, objc_msgSend(v46, "textAlignment"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObjectsFromArray:", v28);

    objc_msgSend(v14, "subtitleLabelSpec");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2](v45, objc_msgSend(v48, "textAlignment"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObjectsFromArray:", v177);

    v229 = 0u;
    v230 = 0u;
    v227 = 0u;
    v228 = 0u;
    v50 = v43;
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v227, v254, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v228;
      do
      {
        for (i = 0; i != v52; ++i)
        {
          if (*(_QWORD *)v228 != v53)
            objc_enumerationMutation(v50);
          v55 = *(void **)(*((_QWORD *)&v227 + 1) + 8 * i);
          if (v55)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v227 + 1) + 8 * i), "transform");
            v56 = *(double *)&v224;
          }
          else
          {
            v225 = 0u;
            v226 = 0u;
            v56 = 0.0;
            v224 = 0u;
          }
          v57 = 1.0 - v56;
          v257.origin.x = v7;
          v257.origin.y = v9;
          v257.size.width = v11;
          v257.size.height = v13;
          objc_msgSend(v55, "translateHorizontallyBy:", v57 * CGRectGetMinX(v257));
        }
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v227, v254, 16);
      }
      while (v52);
    }

    v222 = 0u;
    v223 = 0u;
    v220 = 0u;
    v221 = 0u;
    v58 = v44;
    v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v220, v253, 16);
    v182 = v32;
    height = v32;
    x = v175;
    width = v176;
    y = v174;
    if (v59)
    {
      v64 = v59;
      v65 = *(_QWORD *)v221;
      height = v182;
      x = v175;
      width = v176;
      y = v174;
      do
      {
        for (j = 0; j != v64; ++j)
        {
          if (*(_QWORD *)v221 != v65)
            objc_enumerationMutation(v58);
          objc_msgSend(*(id *)(*((_QWORD *)&v220 + 1) + 8 * j), "imageBounds");
          v271.origin.x = v67;
          v271.origin.y = v68;
          v271.size.width = v69;
          v271.size.height = v70;
          v258.origin.x = x;
          v258.origin.y = y;
          v258.size.width = width;
          v258.size.height = height;
          v259 = CGRectUnion(v258, v271);
          x = v259.origin.x;
          y = v259.origin.y;
          width = v259.size.width;
          height = v259.size.height;
        }
        v64 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v220, v253, 16);
      }
      while (v64);
    }

    v260.origin.x = v7;
    v260.origin.y = v9;
    v260.size.width = v11;
    v260.size.height = v13;
    MidX = CGRectGetMidX(v260);
    v261.origin.x = x;
    v261.origin.y = y;
    v261.size.width = width;
    v261.size.height = height;
    v71 = CGRectGetMidX(v261);
    v216 = 0u;
    v217 = 0u;
    v218 = 0u;
    v219 = 0u;
    v72 = v58;
    v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v216, v252, 16);
    if (v73)
    {
      v74 = v73;
      v75 = MidX - v71;
      v76 = *(_QWORD *)v217;
      do
      {
        for (k = 0; k != v74; ++k)
        {
          if (*(_QWORD *)v217 != v76)
            objc_enumerationMutation(v72);
          objc_msgSend(*(id *)(*((_QWORD *)&v216 + 1) + 8 * k), "translateHorizontallyBy:", v75, *(_QWORD *)&MidX, v168);
        }
        v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v216, v252, 16);
      }
      while (v74);
    }

    v214 = 0u;
    v215 = 0u;
    v212 = 0u;
    v213 = 0u;
    v78 = v168;
    v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v212, v251, 16);
    if (v79)
    {
      v80 = v79;
      v81 = *(_QWORD *)v213;
      v82 = v182;
      v84 = v175;
      v83 = v176;
      v85 = v174;
      do
      {
        for (m = 0; m != v80; ++m)
        {
          if (*(_QWORD *)v213 != v81)
            objc_enumerationMutation(v78);
          objc_msgSend(*(id *)(*((_QWORD *)&v212 + 1) + 8 * m), "imageBounds", *(_QWORD *)&MidX);
          v272.origin.x = v87;
          v272.origin.y = v88;
          v272.size.width = v89;
          v272.size.height = v90;
          v262.origin.x = v84;
          v262.origin.y = v85;
          v262.size.width = v83;
          v262.size.height = v82;
          v263 = CGRectUnion(v262, v272);
          v84 = v263.origin.x;
          v85 = v263.origin.y;
          v83 = v263.size.width;
          v82 = v263.size.height;
        }
        v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v212, v251, 16);
      }
      while (v80);
    }

    v210 = 0u;
    v211 = 0u;
    v208 = 0u;
    v209 = 0u;
    v91 = v78;
    v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v208, v250, 16);
    v32 = v182;
    if (v92)
    {
      v93 = v92;
      v94 = *(_QWORD *)v209;
      do
      {
        for (n = 0; n != v93; ++n)
        {
          if (*(_QWORD *)v209 != v94)
            objc_enumerationMutation(v91);
          v96 = *(void **)(*((_QWORD *)&v208 + 1) + 8 * n);
          v264.origin.x = v7;
          v264.origin.y = v9;
          v264.size.width = v11;
          v264.size.height = v13;
          MaxX = CGRectGetMaxX(v264);
          objc_msgSend(v96, "imageBounds");
          objc_msgSend(v96, "translateHorizontallyBy:", MaxX - CGRectGetMaxX(v265));
        }
        v93 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v208, v250, 16);
      }
      while (v93);
    }

  }
  v98 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v99 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v100 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v204[0] = MEMORY[0x1E0C809B0];
  v204[1] = 3221225472;
  v204[2] = __59__PXTitleSubtitleCALayerPromise__linesToRenderWithContext___block_invoke_5;
  v204[3] = &unk_1E51428B8;
  v101 = v98;
  v205 = v101;
  v102 = v99;
  v206 = v102;
  v103 = v100;
  v207 = v103;
  v104 = (void (**)(void *, uint64_t))_Block_copy(v204);
  objc_msgSend(v14, "titleLabelSpec");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v104[2](v104, objc_msgSend(v105, "verticalAlignment"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "addObjectsFromArray:", v28);

  objc_msgSend(v14, "subtitleLabelSpec");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v170 = v104;
  v104[2](v104, objc_msgSend(v107, "verticalAlignment"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "addObjectsFromArray:", v177);

  objc_msgSend(v102, "firstObject");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "ascentPosition");
  v111 = v110;

  objc_msgSend(v102, "lastObject");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "descentPosition");
  v114 = v113;

  v266.origin.x = v7;
  v266.origin.y = v9;
  v266.size.width = v11;
  v266.size.height = v13;
  v115 = CGRectGetMidY(v266);
  v200 = 0u;
  v201 = 0u;
  v202 = 0u;
  v203 = 0u;
  v116 = v102;
  v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v200, v249, 16);
  if (v117)
  {
    v118 = v117;
    v119 = v115 + (v111 + v114) * -0.5;
    v120 = *(_QWORD *)v201;
    do
    {
      for (ii = 0; ii != v118; ++ii)
      {
        if (*(_QWORD *)v201 != v120)
          objc_enumerationMutation(v116);
        objc_msgSend(*(id *)(*((_QWORD *)&v200 + 1) + 8 * ii), "translateVerticallyBy:", v119, *(_QWORD *)&MidX);
      }
      v118 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v200, v249, 16);
    }
    while (v118);
  }

  objc_msgSend(v101, "firstObject");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "ascentPosition");
  v124 = v123;

  v267.origin.x = v7;
  v267.origin.y = v9;
  v267.size.width = v11;
  v267.size.height = v13;
  MaxY = CGRectGetMaxY(v267);
  v196 = 0u;
  v197 = 0u;
  v198 = 0u;
  v199 = 0u;
  v126 = v101;
  v127 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v196, v248, 16);
  if (v127)
  {
    v128 = v127;
    v129 = MaxY - v124;
    v130 = *(_QWORD *)v197;
    do
    {
      for (jj = 0; jj != v128; ++jj)
      {
        if (*(_QWORD *)v197 != v130)
          objc_enumerationMutation(v126);
        objc_msgSend(*(id *)(*((_QWORD *)&v196 + 1) + 8 * jj), "translateVerticallyBy:", v129, *(_QWORD *)&MidX);
      }
      v128 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v196, v248, 16);
    }
    while (v128);
  }

  objc_msgSend(v103, "lastObject");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "descentPosition");
  v134 = v133;

  v268.origin.x = v7;
  v268.origin.y = v9;
  v268.size.width = v11;
  v268.size.height = v13;
  MinY = CGRectGetMinY(v268);
  v192 = 0u;
  v193 = 0u;
  v194 = 0u;
  v195 = 0u;
  v136 = v103;
  v137 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v192, v247, 16);
  v37 = v175;
  v36 = v176;
  if (v137)
  {
    v138 = v137;
    v139 = MinY - v134;
    v140 = *(_QWORD *)v193;
    do
    {
      for (kk = 0; kk != v138; ++kk)
      {
        if (*(_QWORD *)v193 != v140)
          objc_enumerationMutation(v136);
        v142 = *(void **)(*((_QWORD *)&v192 + 1) + 8 * kk);
        if (v142)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v192 + 1) + 8 * kk), "transform");
          v143 = *(double *)&v189;
        }
        else
        {
          v190 = 0u;
          v191 = 0u;
          v143 = 0.0;
          v189 = 0u;
        }
        v144 = v139 * v143;
        if (objc_msgSend(v28, "containsObject:", v142, *(_QWORD *)&MidX))
          v145 = v143 < 1.0;
        else
          v145 = 0;
        if (v145)
        {
          objc_msgSend(v14, "distanceBetweenTitleBaselineAndSubtitleBaseline");
          v144 = v144 + (1.0 - v143) * v146;
        }
        objc_msgSend(v142, "translateVerticallyBy:", v144);
      }
      v138 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v192, v247, 16);
    }
    while (v138);
  }

  v34 = v179;
  v183 = -[PXTitleSubtitleCALayerPromise diagnosticsEnabled](v179, "diagnosticsEnabled");
  v185 = 0u;
  v186 = 0u;
  v187 = 0u;
  v188 = 0u;
  obj = v173;
  v147 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v185, v246, 16);
  if (v147)
  {
    v148 = v147;
    v35 = 0;
    v181 = *(_QWORD *)v186;
    v149 = 0.0;
    v31 = v174;
LABEL_82:
    v150 = 0;
    while (1)
    {
      if (*(_QWORD *)v186 != v181)
        objc_enumerationMutation(obj);
      v151 = *(void **)(*((_QWORD *)&v185 + 1) + 8 * v150);
      if (v151)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v185 + 1) + 8 * v150), "transform");
        v152 = v184;
      }
      else
      {
        v152 = 0.0;
        v184 = 0.0;
      }
      objc_msgSend(v151, "scaleVerticallyBy:", -1.0, *(_QWORD *)&MidX);
      objc_msgSend(v151, "translateVerticallyBy:", v13);
      objc_msgSend(v151, "contentBounds");
      v273.origin.x = v153;
      v273.origin.y = v154;
      v273.size.width = v155;
      v273.size.height = v156;
      v269.origin.x = v37;
      v269.origin.y = v31;
      v269.size.width = v36;
      v269.size.height = v32;
      v270 = CGRectUnion(v269, v273);
      v37 = v270.origin.x;
      v31 = v270.origin.y;
      v36 = v270.size.width;
      v32 = v270.size.height;
      if (v183)
      {
        if (!v35)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v35 = (NSArray *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v151, "string");
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v35, "addObject:", v157);

        v34 = v179;
      }
      v149 = v149 + v152;
      objc_msgSend(v151, "baselinePosition");
      v159 = v158;
      if (-[PXCALayerPromise shouldCancel](v34, "shouldCancel"))
        break;
      if (v148 == ++v150)
      {
        v148 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v185, v246, 16);
        if (v148)
          goto LABEL_82;
        break;
      }
    }
  }
  else
  {
    v35 = 0;
    v149 = 0.0;
    v31 = v174;
    v159 = MidY;
  }
  MidY = v159;

  v160 = (double)(unint64_t)objc_msgSend(obj, "count");
  +[PXKitSettings sharedInstance](PXKitSettings, "sharedInstance");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = objc_msgSend(v161, "simulateSlowTextTypesetting");

  if (v162)
    objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", 1.0);
  v33 = v149 / v160;

  v25 = v171;
  v23 = v172;
  v24 = v173;
LABEL_100:
  diagnosticsRenderedLines = v34->_diagnosticsRenderedLines;
  v34->_diagnosticsRenderedLines = v35;
  v164 = v35;

  v34->_layerContentBounds.origin.x = v37;
  v34->_layerContentBounds.origin.y = v31;
  v34->_layerContentBounds.size.width = v36;
  v34->_layerContentBounds.size.height = v32;
  v34->_layerLastBaseline = MidY;
  v34->__textScaleFactor = v33;
  v165 = v24;

  return v165;
}

id __59__PXTitleSubtitleCALayerPromise__linesToRenderWithContext___block_invoke_5(id *a1, uint64_t a2)
{
  id *v2;

  if (a2)
  {
    if (a2 == 1)
    {
      v2 = a1 + 6;
    }
    else
    {
      if (a2 != 2)
        return 0;
      v2 = a1 + 4;
    }
  }
  else
  {
    v2 = a1 + 5;
  }
  return *v2;
}

id __59__PXTitleSubtitleCALayerPromise__linesToRenderWithContext___block_invoke(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldCancel") & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    v10 = objc_msgSend(v7, "length");
    v9 = 0;
    if (v8 && v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "_attributedStringForLabelWithText:spec:", v7, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 40);
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __59__PXTitleSubtitleCALayerPromise__linesToRenderWithContext___block_invoke_2;
      v37[3] = &unk_1E5142820;
      v13 = v11;
      v38 = v13;
      v14 = *(_OWORD *)(a1 + 72);
      v40 = *(_OWORD *)(a1 + 56);
      v41 = v14;
      v42 = *(_QWORD *)(a1 + 88);
      v39 = v8;
      objc_msgSend(v12, "performChanges:", v37);
      objc_msgSend(*(id *)(a1 + 40), "lines");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(*(id *)(a1 + 48), "count"))
      {
        objc_msgSend(*(id *)(a1 + 48), "lastObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "baselinePosition");
        v18 = v17;
        v32 = v16;
        objc_msgSend(v16, "baselinePosition");
        v20 = v19;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v21 = v9;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
        if (v22)
        {
          v23 = v22;
          v24 = v18 - a4 - v20;
          v25 = *(_QWORD *)v34;
          do
          {
            v26 = 0;
            do
            {
              if (*(_QWORD *)v34 != v25)
                objc_enumerationMutation(v21);
              objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v26++), "translateVerticallyBy:", v24);
            }
            while (v23 != v26);
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
          }
          while (v23);
        }

        objc_msgSend(v13, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], 0, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = *(void **)(a1 + 40);
        v43 = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "arrayByAddingObjectsFromArray:", v21);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "shiftLinesVerticallyToAvoidOverlap:referenceFont:", v30, v27);

      }
      objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v9);

    }
  }

  return v9;
}

void __59__PXTitleSubtitleCALayerPromise__linesToRenderWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setAttributedString:", v3);
  objc_msgSend(v4, "setBounds:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(v4, "setTypesettingMode:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v4, "setMaximumNumberOfLines:", objc_msgSend(*(id *)(a1 + 40), "numberOfLines"));
  objc_msgSend(v4, "setAdjustsFontSizeToFitWidth:", objc_msgSend(*(id *)(a1 + 40), "adjustsFontSizeToFitWidth"));
  objc_msgSend(*(id *)(a1 + 40), "minimumScaleFactor");
  objc_msgSend(v4, "setMinimumScaleFactor:");
  objc_msgSend(v4, "setAllowTruncation:", objc_msgSend(*(id *)(a1 + 40), "allowTruncation"));
  objc_msgSend(*(id *)(a1 + 40), "minimumTruncatedScaleFactor");
  objc_msgSend(v4, "setMinimumTruncatedScaleFactor:");

}

- (PXTitleSubtitleLabelSpec)spec
{
  return self->_spec;
}

- (int64_t)typesettingMode
{
  return self->_typesettingMode;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (BOOL)diagnosticsEnabled
{
  return self->_diagnosticsEnabled;
}

- (void)setSpec:(id)a3
{
  PXTitleSubtitleLabelSpec *v5;
  PXTitleSubtitleLabelSpec *v6;

  v5 = (PXTitleSubtitleLabelSpec *)a3;
  if (self->_spec != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    -[PXCALayerPromise invalidateLayer](self, "invalidateLayer");
    v5 = v6;
  }

}

- (void)setSubtitleText:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *subtitleText;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_subtitleText;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      subtitleText = self->_subtitleText;
      self->_subtitleText = v6;

      -[PXCALayerPromise invalidateLayer](self, "invalidateLayer");
    }
  }

}

- (void)setTypesettingMode:(int64_t)a3
{
  if (self->_typesettingMode != a3)
  {
    self->_typesettingMode = a3;
    -[PXCALayerPromise invalidateLayer](self, "invalidateLayer");
  }
}

- (void)setTitleText:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *titleText;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_titleText;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      titleText = self->_titleText;
      self->_titleText = v6;

      -[PXCALayerPromise invalidateLayer](self, "invalidateLayer");
    }
  }

}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXTitleSubtitleCALayerPromise;
  -[PXCALayerPromise performChanges:](&v3, sel_performChanges_, a3);
}

- (double)layerLastBaseline
{
  return self->_layerLastBaseline;
}

- (void)drawLayerContentInContext:(CGContext *)a3
{
  PXTitleSubtitleCALayerPromise *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  void (**v25)(void *, void *, double);
  uint64_t v26;
  void (**v27)(void *, void *, double);
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  PXTitleSubtitleCALayerPromise *v45;
  id obj;
  _QWORD v47[6];
  _QWORD aBlock[9];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;
  CGRect v55;
  CGRect v56;

  v4 = self;
  v54 = *MEMORY[0x1E0C80C00];
  -[PXTitleSubtitleCALayerPromise _linesToRenderWithContext:](self, "_linesToRenderWithContext:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXKitSettings sharedInstance](PXKitSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "drawTypographicGuidelines");

  v51 = 0u;
  v52 = 0u;
  v50 = 0u;
  v49 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v50;
    v45 = v4;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v50 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v11);
      if (-[PXCALayerPromise shouldCancel](v4, "shouldCancel"))
        break;
      objc_msgSend(v12, "draw");
      if ((_DWORD)v7)
      {
        objc_msgSend(v12, "imageBounds");
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v20 = v19;
        objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
        v21 = v7;
        v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CGContextSetStrokeColorWithColor(a3, (CGColorRef)objc_msgSend(v22, "CGColor"));

        v55.origin.x = v14;
        v55.origin.y = v16;
        v55.size.width = v18;
        v55.size.height = v20;
        CGContextStrokeRect(a3, v55);
        objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CGContextSetFillColorWithColor(a3, (CGColorRef)objc_msgSend(v23, "CGColor"));

        objc_msgSend(v12, "textPosition");
        PXRectWithCenterAndSize();
        CGContextFillEllipseInRect(a3, v56);
        v24 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __59__PXTitleSubtitleCALayerPromise_drawLayerContentInContext___block_invoke;
        aBlock[3] = &__block_descriptor_72_e20_v24__0d8__UIColor_16l;
        aBlock[4] = a3;
        *(CGFloat *)&aBlock[5] = v14;
        *(CGFloat *)&aBlock[6] = v16;
        *(CGFloat *)&aBlock[7] = v18;
        *(CGFloat *)&aBlock[8] = v20;
        v25 = (void (**)(void *, void *, double))_Block_copy(aBlock);
        v47[0] = v24;
        v47[1] = 3221225472;
        v47[2] = __59__PXTitleSubtitleCALayerPromise_drawLayerContentInContext___block_invoke_2;
        v47[3] = &unk_1E51427F8;
        v47[4] = v12;
        v47[5] = a3;
        v26 = v10;
        v27 = (void (**)(void *, void *, double))_Block_copy(v47);
        objc_msgSend(v12, "baselinePosition");
        v29 = v28;
        objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v25[2](v25, v30, v29);

        objc_msgSend(v12, "ascentPosition");
        v32 = v31;
        objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v25[2](v25, v33, v32);

        objc_msgSend(v12, "descentPosition");
        v35 = v34;
        objc_msgSend(MEMORY[0x1E0DC3658], "yellowColor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v25[2](v25, v36, v35);

        objc_msgSend(v12, "textPosition");
        v38 = v37;
        objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v27[2](v27, v39, v38);

        objc_msgSend(v12, "textPosition");
        v41 = v40;
        objc_msgSend(v12, "width");
        v43 = v41 + v42;
        objc_msgSend(MEMORY[0x1E0DC3658], "cyanColor");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v27[2](v27, v44, v43);

        v10 = v26;
        v7 = v21;
        v4 = v45;
      }
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (PXTitleSubtitleCALayerPromise)init
{
  PXTitleSubtitleCALayerPromise *result;
  CGSize v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXTitleSubtitleCALayerPromise;
  result = -[PXCALayerPromise init](&v4, sel_init);
  if (result)
  {
    v3 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    result->_layerContentBounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    result->_layerContentBounds.size = v3;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticsRenderedLines, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

- (id)_stringByReplacingNonbreakableWhitespaceToAllowLineWrapping:(id)a3 maxWidth:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v23;

  v5 = a3;
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB3500], "px_breakableWhitespaceCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0CB3900]);
  objc_msgSend(v5, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithString:", v9);

  objc_msgSend(v10, "setCharactersToBeSkipped:", 0);
  v11 = objc_msgSend(v10, "scanLocation");
  v23 = 0;
  v12 = objc_msgSend(v10, "scanUpToCharactersFromSet:intoString:", v7, &v23);
  v13 = v23;
  v14 = v13;
  if (v12)
  {
    do
    {
      v15 = objc_msgSend(v14, "length");
      objc_msgSend(v5, "attributedSubstringFromRange:", v11, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "size");
      if (v17 > a4)
      {
        objc_msgSend(v16, "px_stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
        v18 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "replaceCharactersInRange:withAttributedString:", v11, v15, v18);
        v16 = (void *)v18;
      }
      objc_msgSend(v7, "invertedSet");
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scanUpToCharactersFromSet:intoString:", v19, 0);

      v11 = objc_msgSend(v10, "scanLocation");
      v23 = v14;
      LOBYTE(v19) = objc_msgSend(v10, "scanUpToCharactersFromSet:intoString:", v7, &v23);
      v20 = v23;

      v14 = v20;
    }
    while ((v19 & 1) != 0);
  }
  else
  {
    v20 = v13;
  }
  v21 = (void *)objc_msgSend(v6, "copy");

  return v21;
}

- (CGRect)layerContentBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_layerContentBounds.origin.x;
  y = self->_layerContentBounds.origin.y;
  width = self->_layerContentBounds.size.width;
  height = self->_layerContentBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)_textScaleFactor
{
  return self->__textScaleFactor;
}

- (void)setDiagnosticsEnabled:(BOOL)a3
{
  self->_diagnosticsEnabled = a3;
}

- (NSArray)diagnosticsRenderedLines
{
  return self->_diagnosticsRenderedLines;
}

void __59__PXTitleSubtitleCALayerPromise__linesToRenderWithContext___block_invoke_3(CGRect *a1, void *a2)
{
  id v3;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v11), "imageBounds");
        v37.origin.x = v12;
        v37.origin.y = v13;
        v37.size.width = v14;
        v37.size.height = v15;
        v34.origin.x = x;
        v34.origin.y = y;
        v34.size.width = width;
        v34.size.height = height;
        v35 = CGRectUnion(v34, v37);
        x = v35.origin.x;
        y = v35.origin.y;
        width = v35.size.width;
        height = v35.size.height;
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v9);
  }
  v16 = CGRectGetWidth(a1[1]) + -2.0;
  v36.origin.x = x;
  v36.origin.y = y;
  v36.size.width = width;
  v36.size.height = height;
  v17 = v16 / CGRectGetWidth(v36);
  if (v17 < 1.0)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v18 = v3;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v24;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v24 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v22++), "scaleBy:", v17, (_QWORD)v23);
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v20);
    }

  }
}

id __59__PXTitleSubtitleCALayerPromise__linesToRenderWithContext___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id *v2;
  id v3;
  void *v6;

  switch(a2)
  {
    case 0:
      v2 = (id *)(a1 + 32);
      goto LABEL_6;
    case 1:
      v2 = (id *)(a1 + 40);
      goto LABEL_6;
    case 2:
      v2 = (id *)(a1 + 48);
LABEL_6:
      v3 = *v2;
      break;
    case 3:
    case 4:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), CFSTR("PXTitleSubtitleCALayerPromise.m"), 264, CFSTR("Code which should be unreachable has been reached"));

      abort();
    default:
      v3 = 0;
      break;
  }
  return v3;
}

void __59__PXTitleSubtitleCALayerPromise_drawLayerContentInContext___block_invoke(uint64_t a1, id a2, CGFloat a3)
{
  CGContext *v5;
  CGFloat MinX;
  CGContext *v7;
  CGFloat MaxX;

  CGContextSetStrokeColorWithColor(*(CGContextRef *)(a1 + 32), (CGColorRef)objc_msgSend(objc_retainAutorelease(a2), "CGColor"));
  CGContextBeginPath(*(CGContextRef *)(a1 + 32));
  v5 = *(CGContext **)(a1 + 32);
  MinX = CGRectGetMinX(*(CGRect *)(a1 + 40));
  CGContextMoveToPoint(v5, MinX, a3);
  v7 = *(CGContext **)(a1 + 32);
  MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 40));
  CGContextAddLineToPoint(v7, MaxX, a3);
  CGContextStrokePath(*(CGContextRef *)(a1 + 32));
}

void __59__PXTitleSubtitleCALayerPromise_drawLayerContentInContext___block_invoke_2(uint64_t a1, id a2, CGFloat a3)
{
  CGContext *v5;
  double v6;
  CGContext *v7;
  double v8;

  CGContextSetStrokeColorWithColor(*(CGContextRef *)(a1 + 40), (CGColorRef)objc_msgSend(objc_retainAutorelease(a2), "CGColor"));
  CGContextBeginPath(*(CGContextRef *)(a1 + 40));
  v5 = *(CGContext **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "ascentPosition");
  CGContextMoveToPoint(v5, a3, v6 + 10.0);
  v7 = *(CGContext **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "descentPosition");
  CGContextAddLineToPoint(v7, a3, v8 + -10.0);
  CGContextStrokePath(*(CGContextRef *)(a1 + 40));
}

@end
