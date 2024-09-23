@implementation PXGDecorationDefaultBadgeDrawingHelper

- (PXGDecorationDefaultBadgeDrawingHelper)init
{
  PXGDecorationDefaultBadgeDrawingHelper *v2;
  NSDateComponentsFormatter *v3;
  NSDateComponentsFormatter *videoDurationFormatter;
  NSByteCountFormatter *v5;
  NSByteCountFormatter *byteCountFormatter;
  PXSelectionCountNumberFormatter *v7;
  PXSelectionCountNumberFormatter *selectionCountFormatter;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXGDecorationDefaultBadgeDrawingHelper;
  v2 = -[PXGDecorationDefaultBadgeDrawingHelper init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x1E0CB3570]);
    videoDurationFormatter = v2->_videoDurationFormatter;
    v2->_videoDurationFormatter = v3;

    -[NSDateComponentsFormatter setZeroFormattingBehavior:](v2->_videoDurationFormatter, "setZeroFormattingBehavior:", 0);
    -[NSDateComponentsFormatter setUnitsStyle:](v2->_videoDurationFormatter, "setUnitsStyle:", 0);
    v5 = (NSByteCountFormatter *)objc_alloc_init(MEMORY[0x1E0CB34E8]);
    byteCountFormatter = v2->_byteCountFormatter;
    v2->_byteCountFormatter = v5;

    -[NSByteCountFormatter setCountStyle:](v2->_byteCountFormatter, "setCountStyle:", 0);
    v7 = (PXSelectionCountNumberFormatter *)objc_alloc_init((Class)off_1E50B4A78);
    selectionCountFormatter = v2->_selectionCountFormatter;
    v2->_selectionCountFormatter = v7;

    -[PXSelectionCountNumberFormatter setSelectionNumberLimit:](v2->_selectionCountFormatter, "setSelectionNumberLimit:", 9999);
  }
  return v2;
}

- (PXGDecorationBadgeInfo)decorationSpriteInfoForDecoratedSpriteIndex:(SEL)a3 decorationType:(unsigned int)a4 decoratingLayout:(int64_t)a5 assetDecorationInfo:(id)a6 overallSelectionOrder:(PXGAssetDecorationInfo *)a7 isItemSelected:(int64_t)a8 isItemHighlighted:(BOOL)a9 isItemDragged:(BOOL)a10
{
  _BOOL4 v11;
  id v16;
  unint64_t var0;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  int64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  double var1;
  int64_t v31;
  void *v32;
  PXGDecorationBadgeInfo *result;
  id v34;

  v11 = a9;
  v16 = a6;
  *retstr = *(PXGDecorationBadgeInfo *)PXGDecorationBadgeInfoNull;
  switch(a5)
  {
    case 0:
      var0 = a7->var0;
      if ((a7->var0 & 1) != 0)
      {
        if ((var0 & 0x20) != 0)
          v18 = 2;
        else
          v18 = 1;
        goto LABEL_75;
      }
      if ((var0 & 0x80000000) != 0)
      {
        v18 = 3;
        goto LABEL_75;
      }
      goto LABEL_76;
    case 1:
      v34 = v16;
      v19 = objc_msgSend(v16, "selectionDecorationStyle");
      v20 = v19;
      if (v11 && _SelectionStyleUsesBadge(v19))
      {
        retstr->var0 = 9;
        retstr->var3 = a8;
        goto LABEL_20;
      }
      v29 = a7->var0;
      v16 = v34;
      if ((a7->var0 & 0x200000000) != 0)
      {
        v18 = 12;
        goto LABEL_75;
      }
      if (v20 == 4)
      {
        v18 = 10;
        goto LABEL_75;
      }
      if ((v29 & 0x1000000000) != 0)
      {
        v18 = 13;
        goto LABEL_75;
      }
      if ((v29 & 0x20) != 0)
      {
        v18 = 8;
        goto LABEL_75;
      }
      if ((v29 & 2) != 0)
      {
        if ((v29 & 0x10000000000) == 0)
        {
          v18 = 6;
          goto LABEL_75;
        }
        v31 = 26;
      }
      else
      {
        var1 = a7->var1;
        if (var1 != 0.0)
        {
          if ((v29 & 0x10000000000) == 0)
          {
            retstr->var0 = 11;
            retstr->var2 = var1;
            goto LABEL_76;
          }
          retstr->var0 = 25;
          retstr->var2 = var1;
LABEL_78:
          retstr->var4 = a7->var3;
          goto LABEL_76;
        }
        if ((v29 & 0x10000000000) == 0)
          goto LABEL_76;
        v31 = 24;
      }
      retstr->var0 = v31;
      goto LABEL_78;
    case 2:
      v34 = v16;
      v21 = objc_msgSend(v16, "selectionDecorationStyle");
      v22 = objc_msgSend(v34, "selectionDecorationOptions");
      if (a10)
      {
        v23 = 14;
        goto LABEL_19;
      }
      if (v11 && v21 == 1)
      {
        v23 = 15;
        goto LABEL_19;
      }
      if (v11 && v21 == 2)
      {
        v23 = 16;
        goto LABEL_19;
      }
      if (v11 && v21 == 3)
      {
        v23 = 17;
        goto LABEL_19;
      }
      if (!v11 && (v22 & 1) != 0)
      {
        v23 = 18;
        goto LABEL_19;
      }
      if (v21 == 5)
      {
        v23 = 19;
        goto LABEL_19;
      }
      v16 = v34;
      if (a11)
      {
        v18 = 17;
        goto LABEL_75;
      }
      objc_msgSend(v34, "solidColorOverlayDecorationSource");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v34;
      if (v32)
      {
        v18 = 20;
        goto LABEL_75;
      }
      goto LABEL_76;
    case 3:
      v34 = v16;
      v24 = objc_msgSend(v16, "selectionDecorationStyle");
      v25 = objc_msgSend(v34, "selectionDecorationOptions");
      if (!v11)
        goto LABEL_18;
      v26 = v25;
      if (!_SelectionStyleUsesBadge(v24) || (v26 & 2) == 0)
        goto LABEL_18;
      v23 = 0;
      goto LABEL_19;
    case 4:
      if ((a7->var0 & 0x2000000000) == 0)
        goto LABEL_76;
      v18 = 4;
      goto LABEL_75;
    case 5:
    case 6:
      goto LABEL_2;
    case 7:
      v34 = v16;
      objc_msgSend(v16, "tapbackDecorationSource");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
LABEL_18:
        v23 = 27;
LABEL_19:
        retstr->var0 = v23;
        goto LABEL_20;
      }
      if ((a7->var0 & 0x20000000) != 0)
      {
        v23 = 28;
        goto LABEL_19;
      }
      retstr->var0 = 0;
LABEL_20:
      v16 = v34;
LABEL_76:

      return result;
    case 8:
      v28 = a7->var0;
      if ((a7->var0 & 0x400000000000) != 0)
      {
        v18 = 29;
      }
      else if ((v28 & 0x800000000000) != 0)
      {
        v18 = 30;
      }
      else if ((v28 & 0x1000000000000) != 0)
      {
        v18 = 31;
      }
      else
      {
        if ((v28 & 0x200000000000) != 0)
        {
          retstr->var0 = 23;
          retstr->var5 = a7->var2;
          goto LABEL_76;
        }
        if ((v28 & 0x40) != 0)
        {
          v18 = 21;
        }
        else
        {
          if ((v28 & 0x20000000000) == 0)
          {
LABEL_2:
            retstr->var0 = 0;
            goto LABEL_76;
          }
          v18 = 22;
        }
      }
LABEL_75:
      retstr->var0 = v18;
      goto LABEL_76;
    default:
      goto LABEL_76;
  }
}

- (id)cacheKeyForDecorationInfo:(PXGDecorationBadgeInfo *)a3 solidColorOverlay:(id)a4 debugDecoration:(id)a5 targetSize:(CGSize)a6 cornerRadius:(id)a7 screenScale:(double)a8 viewEnvironment:(id)a9 userInterfaceDirection:(unint64_t)a10
{
  int v10;
  double v11;
  void *v12;
  double v13;
  int v14;
  CGFloat height;
  CGFloat width;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD *v27;
  void *v28;
  uint64_t v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[3];
  _QWORD v47[2];
  _QWORD v48[4];

  v12 = *(void **)&a7.var0.var0.var0;
  v13 = v11;
  v14 = v10;
  height = a6.height;
  width = a6.width;
  v48[2] = *MEMORY[0x1E0C80C00];
  v19 = a4;
  v20 = a5;
  v21 = v12;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B18]), "initWithBytes:objCType:", a3, "{PXGDecorationBadgeInfo=qqdqqq}");
  v48[0] = v22;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  switch(a3->var0)
  {
    case 9:
      v45[0] = v21;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3->var3);
      v25 = objc_claimAutoreleasedReturnValue();
      v45[1] = v25;
      v26 = (void *)MEMORY[0x1E0C99D20];
      v27 = v45;
      goto LABEL_4;
    case 0xBLL:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", llround(a3->var2));
      v25 = objc_claimAutoreleasedReturnValue();
      v46[0] = v25;
      *(CGFloat *)v42 = width;
      *(CGFloat *)&v42[1] = height;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v42, "{CGSize=dd}");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v46[1] = v28;
      LODWORD(v30) = v14;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v46[2] = v31;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 3);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "arrayByAddingObjectsFromArray:", v32);
      v29 = objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    case 0xFLL:
    case 0x10:
      v47[0] = v21;
      *(CGFloat *)v43 = width;
      *(CGFloat *)&v43[1] = height;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v43, "{CGSize=dd}");
      v25 = objc_claimAutoreleasedReturnValue();
      v47[1] = v25;
      v26 = (void *)MEMORY[0x1E0C99D20];
      v27 = v47;
LABEL_4:
      objc_msgSend(v26, "arrayWithObjects:count:", v27, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "arrayByAddingObjectsFromArray:", v28);
      v29 = objc_claimAutoreleasedReturnValue();

LABEL_6:
      v24 = (void *)v25;
      goto LABEL_7;
    case 0x14:
      if (!v19)
        goto LABEL_8;
      objc_msgSend(v24, "arrayByAddingObject:", v19);
      v29 = objc_claimAutoreleasedReturnValue();
LABEL_7:

      v24 = (void *)v29;
LABEL_8:
      if (v20)
      {
        v44[0] = v20;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
        v35 = objc_claimAutoreleasedReturnValue();
        v44[1] = v35;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "arrayByAddingObject:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        *(CGFloat *)v41 = width;
        *(CGFloat *)&v41[1] = height;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v41, "{CGSize=dd}");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v35) = objc_msgSend(v37, "containsObject:", v38);

        if ((v35 & 1) != 0)
        {
          v24 = v37;
        }
        else
        {
          *(CGFloat *)v40 = width;
          *(CGFloat *)&v40[1] = height;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v40, "{CGSize=dd}");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "arrayByAddingObject:", v39);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      v33 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B5CD8), "initWithObjects:", v24);

      return v33;
    default:
      goto LABEL_8;
  }
}

- (void)drawWithDecorationInfo:(PXGDecorationBadgeInfo *)a3 solidColorOverlay:(id)a4 debugDecoration:(id)a5 cornerRadius:(id)a6 context:(CGContext *)a7 viewport:(CGRect)a8 screenScale:(double)a9 viewEnvironment:(id)a10 userInterfaceDirection:(unint64_t)a11
{
  double v11;
  double v12;
  double v13;
  void *v14;
  CGContext *v15;
  CGFloat v18;
  float v20;
  id v23;
  id v24;
  PXGDecorationBadgeInfo *v25;
  id v26;
  id v27;
  int64_t var1;
  uint64_t *v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  __CFString *v35;
  int64_t var0;
  __CFString *v37;
  uint64_t v38;
  CGContext *v39;
  void *v40;
  __CFString *v41;
  void *v42;
  double v43;
  uint64_t var3;
  void *v45;
  void *v46;
  id v47;
  double v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  __CFString *v53;
  CGImageRef v54;
  uint64_t v55;
  double v56;
  __CFString *v57;
  int64_t v58;
  CGFloat v59;
  id v60;
  __CFString *v61;
  int64_t v62;
  id v63;
  __CFString *v64;
  int64_t v65;
  id v66;
  __CFString *v67;
  __CFString *v68;
  int64_t v69;
  id v70;
  int64_t v71;
  id v72;
  int64_t v73;
  void *v74;
  __CFString *v75;
  id v76;
  char v77;
  id v78;
  void (**v79)(void *, uint64_t, double, double);
  double v80;
  double v81;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v86;
  double v87;
  CGFloat v88;
  double v89;
  double v90;
  id v91;
  uint64_t v92;
  double v93;
  double v94;
  CGFloat v95;
  double v96;
  double v97;
  double v98;
  uint64_t v99;
  double v100;
  void *v101;
  void *v102;
  double v103;
  void *v104;
  void *v105;
  id v106;
  CGImageRef v107;
  id v108;
  __CFString *v109;
  void *v110;
  void *v111;
  void *v112;
  double v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  id v118;
  id v119;
  void *v120;
  id v121;
  void *v122;
  int64_t v123;
  uint64_t v124;
  char v125;
  int64_t v126;
  void *v127;
  id v128;
  char v129;
  id v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  NSObject *v141;
  id v142;
  void *v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  id v155;
  id v156;
  id v157;
  __CFString *v158;
  __CFString *v159;
  id v160;
  void *v161;
  CGImage *v162;
  id v163;
  NSObject *v164;
  double v165;
  CGFloat v166;
  double v167;
  CGFloat v168;
  double v169;
  CGFloat v170;
  double v171;
  CGFloat v172;
  void *v173;
  void *v174;
  id v175;
  const CGPath *v176;
  double v177;
  double v178;
  double v179;
  double v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  id v185;
  void *v186;
  __CFString *v187;
  __CFString *v188;
  id v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  id v194;
  id v195;
  void *v196;
  double v197;
  double v198;
  void *v199;
  void *v200;
  void *v201;
  const __CFString *v202;
  SEL v203;
  PXGDecorationDefaultBadgeDrawingHelper *v204;
  uint64_t v205;
  double v206;
  double v207;
  double v208;
  double v209;
  double v210;
  double v211;
  CGImage *image;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  PXGDecorationBadgeInfo *v219;
  id v220;
  void *v221;
  CGFloat v222;
  double v223;
  double v224;
  double v225;
  CGFloat v226;
  double rect;
  void *v228;
  double v229;
  char v230;
  double v231;
  _QWORD v232[10];
  _QWORD aBlock[5];
  uint8_t buf[4];
  __CFString *v235;
  uint64_t v236;
  _QWORD v237[3];
  CGRect v238;
  CGRect v239;
  CGRect v240;
  CGRect v241;
  CGRect v242;
  CGRect v243;
  CGRect v244;
  CGRect v245;
  CGRect v246;
  CGRect v247;
  CGRect v248;
  CGRect v249;

  v14 = *(void **)&a6.var0.var1[2];
  v15 = *(CGContext **)&a6.var0.var0.var0;
  v226 = v13;
  v18 = v12;
  v222 = v11;
  v20 = *(float *)&a8.size.width;
  v237[1] = *MEMORY[0x1E0C80C00];
  v23 = a4;
  v24 = a5;
  v25 = a3;
  v26 = v24;
  v27 = v14;
  var1 = a3->var1;
  if (_PXGDecorationDefaultPadding_onceToken == -1)
  {
    if (var1)
    {
LABEL_3:
      if (var1 != 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGSize _PXGDecorationDefaultPadding(PXGDecorationSizeClass)");
        v200 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v199, "handleFailureInFunction:file:lineNumber:description:", v200, CFSTR("PXGDecorationDefaultBadgeDrawingHelper.m"), 83, CFSTR("Code which should be unreachable has been reached"));

        goto LABEL_195;
      }
      v29 = &_PXGDecorationDefaultPadding_miniPadding;
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&_PXGDecorationDefaultPadding_onceToken, &__block_literal_global_53973);
    if (var1)
      goto LABEL_3;
  }
  v29 = &_PXGDecorationDefaultPadding_regularPadding;
LABEL_7:
  v224 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v225 = *MEMORY[0x1E0C9D820];
  v209 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v210 = *MEMORY[0x1E0C9D648];
  v207 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v208 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v30 = *(double *)v29;
  -[PXGDecorationDefaultBadgeDrawingHelper videoDurationFormatter](self, "videoDurationFormatter");
  v31 = objc_claimAutoreleasedReturnValue();
  -[PXGDecorationDefaultBadgeDrawingHelper byteCountFormatter](self, "byteCountFormatter");
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGDecorationDefaultBadgeDrawingHelper selectionCountFormatter](self, "selectionCountFormatter");
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __180__PXGDecorationDefaultBadgeDrawingHelper_drawWithDecorationInfo_solidColorOverlay_debugDecoration_cornerRadius_context_viewport_screenScale_viewEnvironment_userInterfaceDirection___block_invoke;
  aBlock[3] = &__block_descriptor_40_e58_v64__0_CGRect__CGPoint_dd__CGSize_dd__8d40d48__CGColor__56l;
  aBlock[4] = v15;
  v214 = v27;
  v215 = _Block_copy(aBlock);
  v35 = 0;
  v219 = v25;
  var0 = v25->var0;
  rect = v18;
  v223 = a9;
  v213 = (void *)v31;
  switch(var0)
  {
    case 1:
      v35 = CFSTR("PXBadgeGradientLeft");
      v57 = CFSTR("PXBadgeGradientLeft");
      goto LABEL_26;
    case 2:
LABEL_26:
      v58 = v219->var1;
      if (v58 == 1)
      {
        v206 = 0.0;
        +[PXBadgeHelper favoriteBadgeImageMini](PXBadgeHelper, "favoriteBadgeImageMini");
        v128 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        image = CGImageRetain((CGImageRef)objc_msgSend(v128, "CGImage"));

        v55 = 0;
        v228 = 0;
        v220 = 0;
        v221 = 0;
        v42 = 0;
        v129 = 6;
        goto LABEL_121;
      }
      v206 = 0.0;
      v59 = v226;
      if (v58)
        goto LABEL_81;
      +[PXBadgeHelper favoriteBadgeImage](PXBadgeHelper, "favoriteBadgeImage", 0.0);
      v60 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      image = CGImageRetain((CGImageRef)objc_msgSend(v60, "CGImage"));

      v55 = 0;
      v228 = 0;
      v220 = 0;
      v221 = 0;
      goto LABEL_82;
    case 3:
      v206 = 0.0;
      v35 = CFSTR("PXBadgeGradientLeft");
      v61 = CFSTR("PXBadgeGradientLeft");
      v62 = v219->var1;
      if (v62 == 1)
      {
        +[PXBadgeHelper contentSyndicationBadgeImageMini](PXBadgeHelper, "contentSyndicationBadgeImageMini");
        v155 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        image = CGImageRetain((CGImageRef)objc_msgSend(v155, "CGImage"));

        v55 = 0;
        v220 = 0;
        v221 = 0;
        v42 = 0;
        v228 = 0;
        v230 = 6;
        v56 = v224;
        v211 = v225;
        v35 = CFSTR("PXBadgeGradientLeft");
        goto LABEL_122;
      }
      v59 = v226;
      if (!v62)
      {
        +[PXBadgeHelper contentSyndicationBadgeImage](PXBadgeHelper, "contentSyndicationBadgeImage");
        v63 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        image = CGImageRetain((CGImageRef)objc_msgSend(v63, "CGImage"));

        v55 = 0;
        v220 = 0;
        v221 = 0;
        v42 = 0;
        v228 = 0;
        v230 = 6;
        v56 = v224;
        v211 = v225;
        v35 = CFSTR("PXBadgeGradientLeft");
        goto LABEL_127;
      }
LABEL_81:
      v55 = 0;
      v228 = 0;
      v220 = 0;
      v221 = 0;
      image = 0;
LABEL_82:
      v42 = 0;
      v125 = 6;
      goto LABEL_126;
    case 4:
      v206 = 0.0;
      v35 = CFSTR("PXBadgeGradientTopRight");
      v64 = CFSTR("PXBadgeGradientTopRight");
      v65 = v219->var1;
      if (v65 == 1)
      {
        +[PXBadgeHelper sharedLibraryBadgeImageMini](PXBadgeHelper, "sharedLibraryBadgeImageMini");
        v156 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        image = CGImageRetain((CGImageRef)objc_msgSend(v156, "CGImage"));

        v55 = 0;
        v220 = 0;
        v221 = 0;
        v42 = 0;
        v228 = 0;
        v230 = 9;
        v56 = v224;
        v211 = v225;
        v35 = CFSTR("PXBadgeGradientTopRight");
        goto LABEL_122;
      }
      v59 = v226;
      if (!v65)
      {
        +[PXBadgeHelper sharedLibraryBadgeImage](PXBadgeHelper, "sharedLibraryBadgeImage");
        v66 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        image = CGImageRetain((CGImageRef)objc_msgSend(v66, "CGImage"));

        v55 = 0;
        v220 = 0;
        v221 = 0;
        v42 = 0;
        v228 = 0;
        v230 = 9;
        v56 = v224;
        v211 = v225;
        v35 = CFSTR("PXBadgeGradientTopRight");
        goto LABEL_127;
      }
      v55 = 0;
      v228 = 0;
      v220 = 0;
      v221 = 0;
      image = 0;
      v42 = 0;
      v125 = 9;
      goto LABEL_126;
    case 5:
      if (v219->var5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v219->var5);
        v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v67 = CFSTR("STACK");
      }
      v48 = v222;
      v39 = a7;
      v55 = 2;
      PXAttributedStringForBadgeText();
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v228, "size");
      v133 = (v132 - v131) * 0.5;
      if (v131 >= v132)
        v133 = -0.0;
      v134 = v30 + v133;
      PXSizeScale();
      if (v136 > v135 + *(double *)&a10 * 3.0)
        v134 = v134 + 3.0;
      PXSizeScale();
      PXSizeAdd();
      v230 = 9;
      v211 = v134;
      PXSizeScale();
      PXEdgesFlippedVertically();
      v59 = v226;
      a9 = v223;
      PXRectWithSizeAlignedToRectEdgesWithPadding();
      PXRectGetCenter();
      PXRectWithCenterAndSize();
      v209 = v138;
      v210 = v137;
      v207 = v140;
      v208 = v139;
      v206 = 0.0;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:");
      v221 = (void *)objc_claimAutoreleasedReturnValue();

      v220 = 0;
      image = 0;
      v35 = 0;
      v42 = 0;
      v56 = v30;
      goto LABEL_114;
    case 6:
      v35 = CFSTR("PXBadgeGradientRight");
      v68 = CFSTR("PXBadgeGradientRight");
      goto LABEL_38;
    case 7:
LABEL_38:
      v69 = v219->var1;
      if (v69 == 1)
      {
        v206 = 0.0;
        +[PXBadgeHelper panoramaBadgeImageMini](PXBadgeHelper, "panoramaBadgeImageMini");
        v130 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        image = CGImageRetain((CGImageRef)objc_msgSend(v130, "CGImage"));

        v55 = 0;
        v228 = 0;
        v220 = 0;
        v221 = 0;
        goto LABEL_120;
      }
      v206 = 0.0;
      v59 = v226;
      if (v69)
      {
        v55 = 0;
        v228 = 0;
        v220 = 0;
        v221 = 0;
        image = 0;
      }
      else
      {
        +[PXBadgeHelper panoramaBadgeImage](PXBadgeHelper, "panoramaBadgeImage", 0.0);
        v70 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        image = CGImageRetain((CGImageRef)objc_msgSend(v70, "CGImage"));

        v55 = 0;
        v228 = 0;
        v220 = 0;
        v221 = 0;
      }
      goto LABEL_125;
    case 8:
      v71 = v219->var1;
      if (v71 == 1)
      {
        v206 = 0.0;
        +[PXBadgeHelper cloudBadgeImageMini](PXBadgeHelper, "cloudBadgeImageMini");
        v157 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        image = CGImageRetain((CGImageRef)objc_msgSend(v157, "CGImage"));

        v55 = 0;
        v228 = 0;
        v220 = 0;
        v221 = 0;
        v35 = 0;
LABEL_120:
        v42 = 0;
        v129 = 12;
LABEL_121:
        v230 = v129;
        v56 = v224;
        v211 = v225;
LABEL_122:
        v59 = v226;
        goto LABEL_127;
      }
      v206 = 0.0;
      v59 = v226;
      if (v71)
      {
        v55 = 0;
        v228 = 0;
        v220 = 0;
        v221 = 0;
        image = 0;
      }
      else
      {
        +[PXBadgeHelper cloudBadgeImage](PXBadgeHelper, "cloudBadgeImage", 0.0);
        v72 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        image = CGImageRetain((CGImageRef)objc_msgSend(v72, "CGImage"));

        v55 = 0;
        v228 = 0;
        v220 = 0;
        v221 = 0;
      }
      v35 = 0;
LABEL_125:
      v42 = 0;
      v125 = 12;
      goto LABEL_126;
    case 9:
    case 10:
      if (var0 != 9 || (var3 = v219->var3, var3 == 0x7FFFFFFFFFFFFFFFLL) || var3 < 0)
      {
        v123 = v219->var1;
        v59 = v226;
        if (v123 == 1)
        {
          v206 = 0.0;
          +[PXBadgeHelper mediumSymbolConfiguration](PXBadgeHelper, "mediumSymbolConfiguration");
          v124 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v206 = 0.0;
          if (v123)
          {
            v186 = 0;
            goto LABEL_180;
          }
          +[PXBadgeHelper largeSymbolConfiguration](PXBadgeHelper, "largeSymbolConfiguration", 0.0);
          v124 = objc_claimAutoreleasedReturnValue();
        }
        v186 = (void *)v124;
LABEL_180:
        v48 = v222;
        v187 = CFSTR("circle");
        if (var0 == 9)
          v187 = CFSTR("checkmark.circle");
        v188 = v187;
        v189 = v26;
        if (var0 == 9)
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", objc_msgSend(v27, "checkmarkColor"));
          v190 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v190 = 0;
        }
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v188);
        v191 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v191, "imageWithSymbolConfiguration:", v186);
        v192 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
        v193 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v192, "px_tintedCircularImageWithColor:backgroundColor:", v193, v190);
        v194 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        image = CGImageRetain((CGImageRef)objc_msgSend(v194, "CGImage"));

        v55 = 0;
        v220 = 0;
        v221 = 0;
        v35 = 0;
        v42 = 0;
        v228 = 0;
        v230 = 12;
        v56 = v224;
        v211 = v225;
        v26 = v189;
        goto LABEL_71;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", var3 + 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v216, "stringFromNumber:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = v46;
      if (_PXSelectCountAttributedString_onceToken != -1)
        dispatch_once(&_PXSelectCountAttributedString_onceToken, &__block_literal_global_82_53984);
      v39 = a7;
      v48 = v222;
      if (!a7)
      {
        v49 = 2;
        goto LABEL_103;
      }
      if (a7 == (CGContext *)1)
      {
        v49 = 0;
LABEL_103:
        objc_msgSend((id)_PXSelectCountAttributedString_paragraphStyle, "setAlignment:", v49);
      }
      v142 = objc_alloc(MEMORY[0x1E0CB3498]);
      v143 = (void *)objc_msgSend(v142, "initWithString:attributes:", v47, _PXSelectCountAttributedString_attributes);

      v228 = v143;
      objc_msgSend(v143, "size");
      v56 = 8.0;
      if (v144 >= v145)
        v146 = 8.0;
      else
        v146 = (v145 - v144) * 0.5 + 8.0;
      PXSizeScale();
      if (v148 <= v147 + *(double *)&a10 * 3.0)
      {
        v150 = v146;
      }
      else
      {
        if (var3 >= objc_msgSend(v216, "selectionNumberLimit", 6.0))
          v149 = 4.0;
        else
          v149 = 6.0;
        v150 = v146 + v149 * 0.5;
      }
      PXSizeScale();
      PXSizeAdd();
      v230 = 12;
      v211 = v150;
      PXSizeScale();
      PXEdgesFlippedVertically();
      a9 = v223;
      v59 = v226;
      PXRectWithSizeAlignedToRectEdgesWithPadding();
      PXRectGetCenter();
      PXRectWithCenterAndSize();
      v209 = v152;
      v210 = v151;
      v207 = v154;
      v208 = v153;
      objc_msgSend(v27, "tintColor");
      v221 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v220 = (id)objc_claimAutoreleasedReturnValue();

      image = 0;
      v35 = 0;
      v42 = 0;
      v206 = 1.5;
      v55 = 1;
LABEL_114:
      if (!v26)
      {
LABEL_129:
        v116 = 0;
        v114 = v42;
        goto LABEL_130;
      }
LABEL_72:
      objc_msgSend(v26, "objectForKeyedSubscript:", PXGDebugDecorationBackgroundColorKey);
      v114 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "objectForKeyedSubscript:", PXGDebugDecorationAttributedTextKey);
      v115 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "objectForKeyedSubscript:", PXGDebugDecorationBottomEdgeColorKey);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      if (v115)
      {
        v55 = 2;
        v228 = (void *)v115;
      }
      else
      {
        objc_msgSend(v26, "objectForKeyedSubscript:", PXGDebugDecorationTextKey);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        if (v117)
        {
          v118 = objc_alloc(MEMORY[0x1E0CB3498]);
          v236 = *MEMORY[0x1E0DC1140];
          objc_msgSend(MEMORY[0x1E0DC3658], "orangeColor");
          v119 = v23;
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          v237[0] = v120;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v237, &v236, 1);
          v121 = v26;
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          v228 = (void *)objc_msgSend(v118, "initWithString:attributes:", v117, v122);

          v26 = v121;
          v23 = v119;
          v39 = a7;
        }
        else
        {
          v228 = 0;
        }

        v55 = 2;
      }
LABEL_130:
      if (v39 != (CGContext *)1)
        goto LABEL_144;
      v230 = PXEdgesFlippedHorizontally();
      if ((-[__CFString isEqualToString:](v35, "isEqualToString:", CFSTR("PXBadgeGradientRight")) & 1) != 0)
      {
        v158 = CFSTR("PXBadgeGradientLeft");
      }
      else if ((-[__CFString isEqualToString:](v35, "isEqualToString:", CFSTR("PXBadgeGradientLeft")) & 1) != 0)
      {
        v158 = CFSTR("PXBadgeGradientRight");
      }
      else if ((-[__CFString isEqualToString:](v35, "isEqualToString:", CFSTR("PXBadgeGradientTopRight")) & 1) != 0)
      {
        v158 = CFSTR("PXBadgeGradientTopLeft");
      }
      else if ((-[__CFString isEqualToString:](v35, "isEqualToString:", CFSTR("PXBadgeGradientTopLeft")) & 1) != 0)
      {
        v158 = CFSTR("PXBadgeGradientTopRight");
      }
      else if ((-[__CFString isEqualToString:](v35, "isEqualToString:", CFSTR("PXBadgeGradientRightTall")) & 1) != 0)
      {
        v158 = CFSTR("PXBadgeGradientLeftTall");
      }
      else
      {
        if (!-[__CFString isEqualToString:](v35, "isEqualToString:", CFSTR("PXBadgeGradientLeftTall")))
          goto LABEL_144;
        v158 = CFSTR("PXBadgeGradientRightTall");
      }
      v159 = v158;

      v35 = v159;
LABEL_144:
      if (v114)
      {
        CGContextSetFillColorWithColor(v15, (CGColorRef)objc_msgSend(objc_retainAutorelease(v114), "CGColor"));
        v244.origin.x = a9;
        v244.origin.y = v48;
        v244.size.width = v18;
        v244.size.height = v59;
        CGContextFillRect(v15, v244);
      }
      if (v116)
      {
        CGContextSetFillColorWithColor(v15, (CGColorRef)objc_msgSend(objc_retainAutorelease(v116), "CGColor"));
        v245.origin.x = a9;
        v245.origin.y = v48;
        v245.size.width = v18;
        v245.size.height = v59;
        v246 = CGRectInset(v245, *(double *)&a10 * 3.0, *(double *)&a10 * 3.0);
        CGRectGetWidth(v246);
        a9 = v223;
        v59 = v226;
        PXRectWithSizeAlignedToRectEdges();
        CGContextFillRect(v15, v247);
      }
      if (v35)
      {
        v160 = v26;
        objc_msgSend(MEMORY[0x1E0CB34D0], "px_bundle");
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        v162 = PXGCGImageForImageNamedInBundle(v35, v161, 0, 0, 0, 0);

        if (!v162)
        {
          v163 = v23;
          PXAssertGetLog();
          v164 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v235 = v35;
            _os_log_error_impl(&dword_1A6789000, v164, OS_LOG_TYPE_ERROR, "missing background decoration image %@", buf, 0xCu);
          }

          v23 = v163;
        }
        CGImageGetWidth(v162);
        CGImageGetHeight(v162);
        PXEdgesFlippedVertically();
        a9 = v223;
        PXRectWithSizeAlignedToRectEdgesWithPadding();
        v166 = v165;
        v168 = v167;
        v170 = v169;
        v172 = v171;
        CGContextSaveGState(v15);
        CGContextSetAlpha(v15, 0.400000006);
        v248.origin.x = v166;
        v248.origin.y = v168;
        v48 = v222;
        v248.size.width = v170;
        v18 = rect;
        v248.size.height = v172;
        v59 = v226;
        CGContextDrawImage(v15, v248, v162);
        CGContextRestoreGState(v15);
        v26 = v160;
      }
      if (image)
      {
        CGImageGetWidth(image);
        CGImageGetHeight(image);
        PXSizeScale();
        PXEdgesFlippedVertically();
        a9 = v223;
        v18 = rect;
        PXRectWithSizeAlignedToRectEdgesWithPadding();
        CGContextDrawImage(v15, v249, image);
        CGImageRelease(image);
      }
      v173 = v221;
      v174 = v228;
      if (v221)
      {
        CGContextSaveGState(v15);
        CGContextSetFillColorWithColor(v15, (CGColorRef)objc_msgSend(objc_retainAutorelease(v221), "CGColor"));
        objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", v210, v209, v208, v207, fmin(v208, v207) * 0.5);
        v175 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v176 = (const CGPath *)objc_msgSend(v175, "CGPath");

        CGPathRetain(v176);
        CGContextAddPath(v15, v176);
        CGContextFillPath(v15);
        if (v220)
        {
          CGContextSetStrokeColorWithColor(v15, (CGColorRef)objc_msgSend(objc_retainAutorelease(v220), "CGColor"));
          CGContextSetLineWidth(v15, v206 * *(double *)&a10);
          CGContextAddPath(v15, v176);
          CGContextStrokePath(v15);
        }
        CGPathRelease(v176);
        CGContextRestoreGState(v15);
        v173 = v221;
        v174 = v228;
      }
      if (v174)
      {
        v177 = *((double *)off_1E50B8020 + 3);
        if (v55 == 2)
          v178 = v56;
        else
          v178 = *(double *)off_1E50B8020;
        if (v55 == 1)
        {
          v178 = *(double *)off_1E50B8020;
          v179 = v56;
        }
        else
        {
          v179 = *((double *)off_1E50B8020 + 2);
        }
        if ((v230 & 2) != 0)
          v180 = v211;
        else
          v180 = *((double *)off_1E50B8020 + 1);
        if ((v230 & 8) != 0)
          v177 = v211;
        PXGDrawAttributedString(v174, 1, 0, v55, v15, v225, v224, v178, v180, v179, v177, v33, v34, a9, v48, v18, v59, *(CGFloat *)&a10);
      }

      return;
    case 11:
    case 24:
    case 25:
    case 26:
      v37 = CFSTR("PXBadgeGradientRight");
      v38 = v219->var0;
      if (v219->var0 > 24)
      {
        if (v38 == 26)
        {
          objc_msgSend(v217, "stringFromByteCount:", v219->var4);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v126 = v219->var1;
          v39 = a7;
          if (v126 == 1)
          {
            +[PXBadgeHelper panoramaBadgeImageMini](PXBadgeHelper, "panoramaBadgeImageMini");
            v127 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v126)
              goto LABEL_87;
            +[PXBadgeHelper panoramaBadgeImage](PXBadgeHelper, "panoramaBadgeImage");
            v127 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v195 = objc_retainAutorelease(v127);
          v54 = CGImageRetain((CGImageRef)objc_msgSend(v195, "CGImage"));

          goto LABEL_188;
        }
        v39 = a7;
        if (v38 != 25)
          goto LABEL_197;
        v50 = (void *)MEMORY[0x1E0CB3940];
        PXLocalizedVideoDuration();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v217, "stringFromByteCount:", v219->var4);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "stringWithFormat:", CFSTR("%@\n%@"), v51, v52);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = CFSTR("PXBadgeGradientRightTall");
        v53 = CFSTR("PXBadgeGradientRightTall");

        v54 = 0;
      }
      else
      {
        if (v38 != 11)
        {
          v39 = a7;
          if (v38 == 24)
          {
            objc_msgSend(v217, "stringFromByteCount:", v219->var4);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_87:
            v54 = 0;
LABEL_188:
            v35 = CFSTR("PXBadgeGradientRight");
            goto LABEL_189;
          }
LABEL_197:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v201 = (void *)objc_claimAutoreleasedReturnValue();
          v199 = v201;
          v202 = CFSTR("Code which should be unreachable has been reached");
          v203 = a2;
          v204 = self;
          v205 = 708;
LABEL_198:
          objc_msgSend(v201, "handleFailureInMethod:object:file:lineNumber:description:", v203, v204, CFSTR("PXGDecorationDefaultBadgeDrawingHelper.m"), v205, v202);
LABEL_195:

          abort();
        }
        PXLocalizedVideoDuration();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = 0;
        v35 = CFSTR("PXBadgeGradientRight");
        v39 = a7;
      }
LABEL_189:
      PXAttributedStringForBadgeText();
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      v206 = 0.0;
      PXFloatFloorToPixel();
      v198 = v197;
      image = v54;
      if (v54)
      {
        objc_msgSend(v196, "size");
        PXSizeAdd();
      }
      v228 = v196;
      v211 = v30 + v198;

      v220 = 0;
      v221 = 0;
      v42 = 0;
      v230 = 12;
      v55 = 1;
      v56 = v30;
LABEL_192:
      v59 = v226;
      v48 = v222;
      if (!v26)
        goto LABEL_129;
      goto LABEL_72;
    case 12:
      v73 = v219->var1;
      if (v73 == 1)
      {
        v206 = 0.0;
        +[PXBadgeHelper mediumSymbolConfiguration](PXBadgeHelper, "mediumSymbolConfiguration");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v226;
      }
      else
      {
        v206 = 0.0;
        v59 = v226;
        if (v73)
        {
          v74 = 0;
        }
        else
        {
          +[PXBadgeHelper largeSymbolConfiguration](PXBadgeHelper, "largeSymbolConfiguration", 0.0);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      v48 = v222;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.56, 0.77, 1.0, 1.0);
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle"));
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v182, "imageWithSymbolConfiguration:", v74);
      v183 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v183, "px_tintedCircularImageWithColor:backgroundColor:", v184, v181);
      v185 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      image = CGImageRetain((CGImageRef)objc_msgSend(v185, "CGImage"));

      v55 = 0;
      v220 = 0;
      v221 = 0;
      v35 = 0;
      v42 = 0;
      v228 = 0;
      v230 = 12;
      v56 = v224;
      v211 = v225;
      goto LABEL_71;
    case 13:
      v206 = 0.0;
      v35 = CFSTR("PXBadgeGradientRight");
      v75 = CFSTR("PXBadgeGradientRight");
      +[PXBadgeHelper ocrAssetBadgeImage](PXBadgeHelper, "ocrAssetBadgeImage");
      v76 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      image = CGImageRetain((CGImageRef)objc_msgSend(v76, "CGImage"));

      v55 = 0;
      v228 = 0;
      v220 = 0;
      v221 = 0;
      v42 = 0;
      v77 = 12;
      goto LABEL_64;
    case 14:
      v206 = 0.0;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:");
      v78 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_68;
    case 15:
      v206 = 0.0;
      v232[0] = v32;
      v232[1] = 3221225472;
      v232[2] = __180__PXGDecorationDefaultBadgeDrawingHelper_drawWithDecorationInfo_solidColorOverlay_debugDecoration_cornerRadius_context_viewport_screenScale_viewEnvironment_userInterfaceDirection___block_invoke_20;
      v232[3] = &__block_descriptor_80_e24_v32__0d8__CGColor__16d24l;
      v48 = v222;
      *(double *)&v232[4] = a9;
      *(CGFloat *)&v232[5] = v222;
      *(CGFloat *)&v232[6] = v18;
      *(CGFloat *)&v232[7] = v226;
      v232[8] = a10;
      v232[9] = v15;
      v79 = (void (**)(void *, uint64_t, double, double))_Block_copy(v232);
      if (v20 <= 0.0)
      {
        v79[2](v79, objc_msgSend(v27, "focusRingColor"), 3.0, 0.0);
        objc_msgSend(v27, "backgroundColor");
        v91 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v79[2](v79, objc_msgSend(v91, "CGColor"), 1.0, 3.0);
      }
      else
      {
        v80 = *(double *)&a10 * 3.0;
        v81 = v20 * *(double *)&a10;
        v238.origin.x = v223;
        v238.origin.y = v222;
        v238.size.width = v18;
        v238.size.height = v226;
        v239 = CGRectInset(v238, *(double *)&a10 * 3.0 * 0.5, *(double *)&a10 * 3.0 * 0.5);
        x = v239.origin.x;
        y = v239.origin.y;
        width = v239.size.width;
        height = v239.size.height;
        (*((void (**)(void *, uint64_t, CGFloat, CGFloat, CGFloat, CGFloat, double, double))v215 + 2))(v215, objc_msgSend(v27, "focusRingColor"), v239.origin.x, v239.origin.y, v239.size.width, v239.size.height, *(double *)&a10 * 3.0, v81);
        if (v81 - *(double *)&a10 * 3.0 >= 0.0)
          v86 = v81 - v80;
        else
          v86 = 0.0;
        v240.origin.x = x;
        v240.origin.y = y;
        v240.size.width = width;
        v240.size.height = height;
        v241 = CGRectInset(v240, (v80 + *(double *)&a10) * 0.5, (v80 + *(double *)&a10) * 0.5);
        v87 = v241.origin.x;
        v88 = v241.origin.y;
        v89 = v241.size.width;
        v90 = v241.size.height;
        objc_msgSend(v27, "backgroundColor");
        v91 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v92 = objc_msgSend(v91, "CGColor");
        v93 = v88;
        v94 = v86;
        v48 = v222;
        a9 = v223;
        (*((void (**)(void *, uint64_t, double, double, double, double, double, double))v215 + 2))(v215, v92, v87, v93, v89, v90, *(double *)&a10, v94);
      }

      v55 = 0;
      v228 = 0;
      v230 = 0;
      v220 = 0;
      v221 = 0;
      image = 0;
      v35 = 0;
      v42 = 0;
      v56 = v224;
      v211 = v225;
      v59 = v226;
      goto LABEL_128;
    case 16:
      v206 = 0.0;
      v95 = *(double *)&a10 * 3.0 * 0.5;
      v48 = v222;
      v242.origin.x = v223;
      v242.origin.y = v222;
      v242.size.width = v18;
      v242.size.height = v226;
      v243 = CGRectInset(v242, v95, v95);
      v229 = v243.size.height;
      v231 = v243.origin.x;
      v96 = v243.origin.y;
      v97 = v243.size.width;
      v243.origin.x = v20;
      v59 = v226;
      v98 = v95 + (v243.origin.x + 1.0) * *(double *)&a10;
      v99 = objc_msgSend(v27, "focusRingColor");
      v100 = v98;
      a9 = v223;
      (*((void (**)(void *, uint64_t, double, double, double, double, double, double))v215 + 2))(v215, v99, v231, v96, v97, v229, *(double *)&a10 * 3.0, v100);
      v55 = 0;
      v228 = 0;
      v230 = 0;
      v220 = 0;
      v221 = 0;
      image = 0;
      v35 = 0;
      v42 = 0;
      v56 = v224;
      v211 = v225;
      goto LABEL_71;
    case 17:
      v206 = 0.0;
      objc_msgSend(v27, "backgroundColor");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = v101;
      v103 = 0.25;
      goto LABEL_58;
    case 18:
      v104 = (void *)MEMORY[0x1E0DC3658];
      objc_msgSend(off_1E50B5CD0, "sharedInstance");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "keyboardUnselectedDimmingFactor");
      v206 = 0.0;
      objc_msgSend(v104, "colorWithWhite:alpha:");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_69;
    case 19:
      v206 = 0.0;
      objc_msgSend(v27, "backgroundColor");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = v101;
      v103 = 0.400000006;
LABEL_58:
      objc_msgSend(v101, "colorWithAlphaComponent:", v103);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_69;
    case 20:
      v206 = 0.0;
      v78 = v23;
      goto LABEL_68;
    case 21:
      v206 = 0.0;
      +[PXBadgeHelper livePhotoBadgeShadowedImage](PXBadgeHelper, "livePhotoBadgeShadowedImage");
      v106 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v107 = CGImageRetain((CGImageRef)objc_msgSend(v106, "CGImage"));

      if (!v107)
      {
        PXAssertGetLog();
        v141 = objc_claimAutoreleasedReturnValue();
        v59 = v226;
        if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1A6789000, v141, OS_LOG_TYPE_ERROR, "missing decoration image PXGDecorationSpriteTypeLivePhoto", buf, 2u);
        }

        v55 = 0;
        v228 = 0;
        v220 = 0;
        v221 = 0;
        image = 0;
        v35 = 0;
        v42 = 0;
        v125 = 3;
LABEL_126:
        v230 = v125;
        v56 = v224;
        v211 = v225;
LABEL_127:
        v48 = v222;
LABEL_128:
        v39 = a7;
        if (v26)
          goto LABEL_72;
        goto LABEL_129;
      }
      image = v107;
      v55 = 0;
      v228 = 0;
      v220 = 0;
      v221 = 0;
      v35 = 0;
      v42 = 0;
LABEL_63:
      v77 = 3;
LABEL_64:
      v230 = v77;
      v56 = v224;
      v211 = v225;
LABEL_70:
      v59 = v226;
      v48 = v222;
LABEL_71:
      v39 = a7;
      if (!v26)
        goto LABEL_129;
      goto LABEL_72;
    case 22:
      v206 = 0.0;
      +[PXBadgeHelper(iOS) spatialBadgeImage](PXBadgeHelper, "spatialBadgeImage");
      v108 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      image = CGImageRetain((CGImageRef)objc_msgSend(v108, "CGImage"));

      v55 = 0;
      v228 = 0;
      v220 = 0;
      v221 = 0;
      v35 = 0;
      v42 = 0;
      goto LABEL_63;
    case 23:
      v35 = CFSTR("PXBadgeGradientTopLeft");
      v109 = CFSTR("PXBadgeGradientTopLeft");
      -[PXGDecorationDefaultBadgeDrawingHelper assetIndexFormatter](self, "assetIndexFormatter");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v219->var5);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "stringFromNumber:", v111);
      v112 = (void *)objc_claimAutoreleasedReturnValue();

      PXAttributedStringForBadgeText();
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      v206 = 0.0;
      PXFloatFloorToPixel();
      v211 = v30 + v113;

      v39 = a7;
      v220 = 0;
      v221 = 0;
      image = 0;
      v42 = 0;
      goto LABEL_66;
    case 27:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      v199 = v201;
      v202 = CFSTR("Custom view decorations require presentationType == PXGPresentationTypeView");
      v203 = a2;
      v204 = self;
      v205 = 754;
      goto LABEL_198;
    case 28:
      v206 = 0.0;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
      v78 = (id)objc_claimAutoreleasedReturnValue();
LABEL_68:
      v42 = v78;
LABEL_69:
      v55 = 0;
      v228 = 0;
      v230 = 0;
      v220 = 0;
      v221 = 0;
      image = 0;
      v35 = 0;
      v56 = v224;
      v211 = v225;
      goto LABEL_70;
    case 29:
    case 30:
    case 31:
      v39 = a7;
      PXAttributedStringForBadgeText();
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("PXBadgeGradientTopLeft");
      v41 = CFSTR("PXBadgeGradientTopLeft");
      v206 = 0.0;
      PXFloatFloorToPixel();
      v220 = 0;
      v221 = 0;
      image = 0;
      v42 = 0;
      v211 = v30 + v43;
LABEL_66:
      v230 = 3;
      v55 = 2;
      v56 = v30;
      goto LABEL_192;
    default:
      v206 = 0.0;
      v55 = 0;
      v228 = 0;
      v230 = 0;
      v56 = v224;
      v211 = v225;
      v220 = 0;
      v221 = 0;
      image = 0;
      v42 = 0;
      goto LABEL_70;
  }
}

- (NSNumberFormatter)assetIndexFormatter
{
  NSNumberFormatter *assetIndexFormatter;
  NSNumberFormatter *v4;
  NSNumberFormatter *v5;
  void *v6;

  assetIndexFormatter = self->_assetIndexFormatter;
  if (!assetIndexFormatter)
  {
    v4 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v5 = self->_assetIndexFormatter;
    self->_assetIndexFormatter = v4;

    -[NSNumberFormatter setNumberStyle:](self->_assetIndexFormatter, "setNumberStyle:", 1);
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter setLocale:](self->_assetIndexFormatter, "setLocale:", v6);

    assetIndexFormatter = self->_assetIndexFormatter;
  }
  return assetIndexFormatter;
}

- (NSDateComponentsFormatter)videoDurationFormatter
{
  return self->_videoDurationFormatter;
}

- (NSByteCountFormatter)byteCountFormatter
{
  return self->_byteCountFormatter;
}

- (PXSelectionCountNumberFormatter)selectionCountFormatter
{
  return self->_selectionCountFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionCountFormatter, 0);
  objc_storeStrong((id *)&self->_byteCountFormatter, 0);
  objc_storeStrong((id *)&self->_videoDurationFormatter, 0);
  objc_storeStrong((id *)&self->_assetIndexFormatter, 0);
}

void __180__PXGDecorationDefaultBadgeDrawingHelper_drawWithDecorationInfo_solidColorOverlay_debugDecoration_cornerRadius_context_viewport_screenScale_viewEnvironment_userInterfaceDirection___block_invoke(uint64_t a1, CGColor *a2, double a3, double a4, double a5, double a6, CGFloat a7, CGFloat a8)
{
  const CGPath *v11;

  v11 = CGPathCreateWithRoundedRect(*(CGRect *)&a3, a8, a8, 0);
  CGContextAddPath(*(CGContextRef *)(a1 + 32), v11);
  CGContextSetStrokeColorWithColor(*(CGContextRef *)(a1 + 32), a2);
  CGContextSetLineWidth(*(CGContextRef *)(a1 + 32), a7);
  CGContextStrokePath(*(CGContextRef *)(a1 + 32));
  CGPathRelease(v11);
}

void __180__PXGDecorationDefaultBadgeDrawingHelper_drawWithDecorationInfo_solidColorOverlay_debugDecoration_cornerRadius_context_viewport_screenScale_viewEnvironment_userInterfaceDirection___block_invoke_20(uint64_t a1, CGColor *a2, double a3, double a4)
{
  CGFloat v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect v12;
  CGRect v13;

  v7 = (a4 + a3 * 0.5) * *(double *)(a1 + 64);
  v12 = CGRectInset(*(CGRect *)(a1 + 32), v7, v7);
  x = v12.origin.x;
  y = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  CGContextSetStrokeColorWithColor(*(CGContextRef *)(a1 + 72), a2);
  CGContextSetLineWidth(*(CGContextRef *)(a1 + 72), *(double *)(a1 + 64) * a3);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  CGContextStrokeRect(*(CGContextRef *)(a1 + 72), v13);
}

@end
