@implementation UIKBRenderFactory10Key

- (int64_t)assetIdiom
{
  return 0;
}

- (int64_t)lightHighQualityEnabledBlendForm
{
  return 2;
}

- (id)defaultKeyDividerColorName
{
  void *v3;
  __CFString *v4;
  __CFString *v5;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "lightKeyboard") & 1) != 0)
  {
    -[UIKBRenderFactory _controlKeyBackgroundColorName](self, "_controlKeyBackgroundColorName");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("UIKBColorClear");
  }
  v5 = v4;

  return v5;
}

- (id)controlKeyBackgroundColorName
{
  int64_t v3;
  void *v4;
  int v5;
  __CFString **v6;
  __CFString *v7;
  __CFString *v8;

  v3 = +[UIKBRenderFactory _graphicsQuality](UIKBRenderFactory, "_graphicsQuality");
  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "lightKeyboard");
  if (v3 == 10)
  {
    v6 = UIKBColorLightLowQualityBackdropTint;
    if (!v5)
      v6 = UIKBColorGray_Percent20;
  }
  else
  {
    if (!v5)
    {
      -[UIKBRenderFactory _controlKeyBackgroundColorName](self, "_controlKeyBackgroundColorName");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v6 = UIKBColorClear;
  }
  v7 = *v6;
LABEL_9:
  v8 = v7;

  return v8;
}

- (id)controlKeyForegroundColorName
{
  return 0;
}

- (id)controlKeyDividerColorName
{
  void *v2;
  int v3;
  __CFString **v4;
  __CFString *v5;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lightKeyboard");
  v4 = UIKBColor10KeyLightControlKeySeparator;
  if (!v3)
    v4 = UIKBColorClear;
  v5 = *v4;

  return v5;
}

- (id)displayContentsForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UIKBRenderFactory10Key;
  -[UIKBRenderFactory displayContentsForKey:](&v25, sel_displayContentsForKey_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "state") & 0x10) != 0)
  {
    v20 = v5;
    v6 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v4, "subtrees");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v4, "subtrees");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v13);
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14 == v15)
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
          else
            -[UIKBRenderFactory10Key displayContentsForKey:](self, "displayContentsForKey:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v16);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v11);
    }

    v5 = v20;
    objc_msgSend(v20, "setVariantDisplayContents:", v8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "flickDirection") + 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setHighlightedVariantsList:", v18);

    objc_msgSend(v20, "setDisplayString:", 0);
  }

  return v5;
}

- (UIEdgeInsets)topEdgeAdjustmentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (unint64_t)edgesAdjustedForTranslucentGapsForGeometry:(id)a3 key:(id)a4 onKeyplane:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double MaxY;
  _BOOL8 v24;
  _BOOL8 v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  unint64_t v31;
  CGRect v33;
  CGRect v34;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v9, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v9, "primaryKeylayoutWidthRatio");
  if (v19 > 0.0)
  {
    objc_msgSend(v9, "primaryKeylayoutOffset");
    v21 = v20;
    if (v20 <= 0.0)
    {
      objc_msgSend(v9, "primaryKeylayoutWidthRatio");
      v21 = v16 * v22;
      v20 = 0.0;
    }
    v16 = v16 - (v21 + 0.0);
    v14 = v14 + 0.0;
    v12 = v12 + v20;
  }
  objc_msgSend(v8, "frame");
  MaxY = CGRectGetMaxY(v33);
  v34.origin.x = v12;
  v34.origin.y = v14;
  v34.size.width = v16;
  v34.size.height = v18;
  v24 = MaxY < CGRectGetMaxY(v34) || -[UIKBRenderFactory10Key shouldShowBottomRowEdge](self, "shouldShowBottomRowEdge");
  if (-[UIKBRenderFactory10Key shouldShowTopRowEdge](self, "shouldShowTopRowEdge"))
    v25 = objc_msgSend(v8, "displayRowHint") == 1;
  else
    v25 = 0;
  -[UIKBRenderFactory10Key interkeyGapsCenterXOfKeyplaneFrame:](self, "interkeyGapsCenterXOfKeyplaneFrame:", v12, v14, v16, v18);
  v27 = v26;
  -[UIKBRenderFactory translucentGapWidth](self, "translucentGapWidth");
  v29 = v28;
  -[UIKBRenderFactory translucentGapWidth](self, "translucentGapWidth");
  v31 = objc_msgSend(v10, "adjustForTranslucentGapsInFrameWithSize_10Key:centerX:bottomEdge:topEdge:", v24, v25, v29, v30, v27);

  return v31;
}

- (CGPoint)abcKeyTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)capitalAbcSymbolSize
{
  return 16.0;
}

- (double)symbolImageControlKeyFontSize
{
  return 22.0;
}

- (CGPoint)globeKeyTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dictationKeyTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)longVowelSignKeyTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 8.0;
  v3 = 15.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)numberPadKeyPrimarySymbolSize
{
  return 22.0;
}

- (CGPoint)numberPadKeyPrimaryTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = -6.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)numberPadKeySecondaryTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 1.0;
  v3 = 13.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)numberPadVBarSecondaryTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 1.0;
  v3 = 13.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)symbolImageControlKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)keyCornerRadius
{
  return 5.0;
}

- (BOOL)shouldShowBottomRowEdge
{
  return 0;
}

- (BOOL)shouldShowTopRowEdge
{
  return 0;
}

- (BOOL)useRoundCorner
{
  return 0;
}

- (unint64_t)roundCornersForKey:(id)a3 onKeyplane:(id)a4
{
  return 0;
}

- (void)modifyTraitsForDetachedInputSwitcher:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  __objc2_class **v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double x;
  double v27;
  double y;
  double v29;
  double width;
  double v31;
  double height;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  void *v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  _QWORD v53[2];
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v53[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "geometry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDetachedVariants:", 1);

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "lightKeyboard");

  if (v10)
  {
    if (-[UIKBRenderFactory10Key useRoundCorner](self, "useRoundCorner"))
    {
      +[UIKBShadowEffect effectWithColor:offset:insets:weight:](UIKBShadowEffect, "effectWithColor:offset:insets:weight:", CFSTR("UIKBColorBlack_Alpha35"), 0.0, 2.0, 1.0, 1.0, 0.0, 1.0, 4.5);
    }
    else
    {
      objc_msgSend(v6, "setBlendForm:", 0);
      +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", CFSTR("UIKBColorBlack_Alpha12"), 15, -0.25, 0.5);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addRenderEffect:", v11);

  }
  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBlurBlending:", objc_msgSend(v12, "lightKeyboard") ^ 1);

  if (objc_msgSend(v7, "displayType") == 13 || objc_msgSend(v7, "displayType") == 4)
    v13 = off_1E167A978;
  else
    v13 = off_1E167AF28;
  -[__objc2_class sharedInstance](*v13, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "popupRect");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_layout");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "convertRect:fromView:", v14, v16, v18, v20, v22);
  x = v25;
  y = v27;
  width = v29;
  height = v31;

  if (-[UIKBRenderFactory10Key useRoundCorner](self, "useRoundCorner"))
  {
    -[UIKBRenderFactory10Key keyCornerRadius](self, "keyCornerRadius");
    v34 = v33;
    -[UIKBRenderFactory10Key keyCornerRadius](self, "keyCornerRadius");
    v36 = v35;
    v54.origin.x = x;
    v54.origin.y = y;
    v54.size.width = width;
    v54.size.height = height;
    v55 = CGRectInset(v54, v34, v36);
    x = v55.origin.x;
    y = v55.origin.y;
    width = v55.size.width;
    height = v55.size.height;
  }
  objc_msgSend(v6, "geometry");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "displayFrame");
  v60.origin.x = x;
  v60.origin.y = y;
  v60.size.width = width;
  v60.size.height = height;
  v57 = CGRectUnion(v56, v60);
  v38 = v57.origin.x;
  v39 = v57.origin.y;
  v40 = v57.size.width;
  v41 = v57.size.height;

  v58.origin.x = v38;
  v58.origin.y = v39;
  v58.size.width = v40;
  v58.size.height = v41;
  v59 = CGRectInset(v58, -12.0, -6.0);
  v42 = v59.origin.x;
  v43 = v59.origin.y;
  v44 = v59.size.width;
  v45 = v59.size.height;
  objc_msgSend(v6, "geometry");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setDisplayFrame:", v42, v43, v44, v45);

  +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", x, y, width, height, x, y, width, height);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVariantGeometries:", v48);

  objc_msgSend(v6, "geometry");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setPopupBias:", 40);

  -[UIKBRenderFactory10Key keyCornerRadius](self, "keyCornerRadius");
  v51 = v50;
  objc_msgSend(v6, "geometry");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setRoundRectRadius:", v51);

}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  int v79;
  void *v80;
  const __CFString *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  double v86;
  double v87;
  void *v88;
  void *v89;
  int v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  char v97;
  void *v98;
  double v99;
  double v100;
  double v101;
  double v102;
  void *v103;
  double v104;
  double v105;
  void *v106;
  double v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  int v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  double v121;
  double v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  uint64_t v130;
  void *v131;
  void *v132;
  double MidX;
  void *v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  void *v143;
  uint64_t v144;
  void *v145;
  void *v146;
  int64_t v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  double v154;
  double v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  uint64_t v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  int64_t v170;
  void *v171;
  int v172;
  char v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  void *v184;
  char v185;
  id v186;
  void *v187;
  int v188;
  uint64_t v189;
  void *v190;
  void *v191;
  int v192;
  double v193;
  double v194;
  void *v195;
  double v196;
  void *v197;
  void *v199;
  int v200;
  void *v201;
  int v202;
  void *v203;
  void *v204;
  void *v205;
  double v206;
  double v207;
  void *v208;
  double v209;
  void *v210;
  double v211;
  double v212;
  double v213;
  double v214;
  void *v215;
  double v216;
  double v217;
  double v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  double v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  double v228;
  double v229;
  double v230;
  double v231;
  double v232;
  double v233;
  double v234;
  double v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  int v240;
  void *v241;
  double v242;
  void *v243;
  int v244;
  void *v245;
  void *v246;
  char v247;
  double v248;
  double v249;
  void *v250;
  void *v251;
  double v252;
  void *v253;
  int v254;
  void *v255;
  void *v256;
  double v257;
  void *v258;
  void *v259;
  int v260;
  void *v261;
  int v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  int v268;
  double v269;
  double v270;
  double v271;
  double v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  double v277;
  double v278;
  double v279;
  void *v280;
  void *v281;
  void *v282;
  char v283;
  unsigned int v284;
  void *v285;
  void *v286;
  unint64_t v287;
  void *v288;
  void *v289;
  void *v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  objc_super v295;
  _BYTE v296[128];
  _QWORD v297[3];
  CGRect v298;
  CGRect v299;
  CGRect v300;
  CGRect v301;
  CGRect v302;

  v297[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v295.receiver = self;
  v295.super_class = (Class)UIKBRenderFactory10Key;
  -[UIKBRenderFactory _traitsForKey:onKeyplane:](&v295, sel__traitsForKey_onKeyplane_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBlendForm:", -[UIKBRenderFactory enabledBlendForm](self, "enabledBlendForm"));
  objc_msgSend(v8, "geometry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "paddedFrame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v8, "geometry");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDisplayFrame:", v11, v13, v15, v17);

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUsesDarkAppearance:", objc_msgSend(v19, "lightKeyboard") ^ 1);

  if (objc_msgSend(v6, "clipCorners"))
  {
    v20 = objc_msgSend(v6, "clipCorners");
    objc_msgSend(v8, "geometry");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setRoundRectCorners:", v20);

    objc_msgSend(v8, "geometry");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setRoundRectRadius:", 10.0);

  }
  objc_msgSend(v8, "geometry");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory10Key topEdgeAdjustmentInsets](self, "topEdgeAdjustmentInsets");
  objc_msgSend(v23, "adjustToTopWithInsets:");

  if (-[UIKBRenderFactory10Key useRoundCorner](self, "useRoundCorner")
    && -[UIKBRenderFactory10Key roundCornersForKey:onKeyplane:](self, "roundCornersForKey:onKeyplane:", v6, v7) == -1)
  {
    v25 = 0;
  }
  else
  {
    objc_msgSend(v8, "geometry");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[UIKBRenderFactory10Key edgesAdjustedForTranslucentGapsForGeometry:key:onKeyplane:](self, "edgesAdjustedForTranslucentGapsForGeometry:key:onKeyplane:", v24, v6, v7);

  }
  v290 = v6;
  v26 = objc_msgSend(v6, "displayType");
  -[UIKBRenderFactory lightKeycapsFontName](self, "lightKeycapsFontName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v27, 22.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSymbolStyle:", v28);

  objc_msgSend(v8, "symbolStyle");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setKerning:", 2.0);

  objc_msgSend(v8, "symbolStyle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setMinFontSize:", 9.0);

  -[UIKBRenderFactory lightKeycapsFontName](self, "lightKeycapsFontName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v31, 12.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "setKerning:", 2.0);
  objc_msgSend(v32, "setMinFontSize:", 9.0);
  v297[0] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v297, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSecondarySymbolStyles:", v33);

  v287 = v25;
  v289 = v7;
  v284 = v26;
  switch(v26)
  {
    case 34:
      -[UIKBRenderFactory lightKeycapsFontName](self, "lightKeycapsFontName");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "symbolStyle");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setFontName:", v44);

      -[UIKBRenderFactory lightKeycapsFontName](self, "lightKeycapsFontName");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setFontName:", v46);

      objc_msgSend(v32, "setFontSize:", 14.0);
      -[UIKBRenderFactory10Key longVowelSignKeyTextOffset](self, "longVowelSignKeyTextOffset");
      objc_msgSend(v32, "setTextOffset:");
LABEL_27:
      v6 = v290;
      goto LABEL_36;
    case 31:
      objc_msgSend(v6, "name");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "containsString:", CFSTR("Facemark"));

      if ((v48 & 1) == 0)
      {
        objc_msgSend(v8, "symbolStyle");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setFontName:", CFSTR(".PhoneKeyCaps"));

        objc_msgSend(v32, "setFontName:", CFSTR(".PhoneKeyCaps"));
      }
      -[UIKBRenderFactory10Key displayContentsForKey:](self, "displayContentsForKey:", v6);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "displayString");
      v50 = objc_claimAutoreleasedReturnValue();
      if (v50)
      {
        v51 = (void *)v50;
        objc_msgSend(v34, "secondaryDisplayStrings");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "count");

        if (v53)
        {
          objc_msgSend(v8, "symbolStyle");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "setFontSize:", 14.0);

          objc_msgSend(v8, "symbolStyle");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "setTextOffset:", 0.0, 6.0);

          objc_msgSend(v8, "symbolStyle");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setKerning:", 0.0);

          objc_msgSend(v32, "setFontSize:", 22.0);
          objc_msgSend(v32, "setTextOffset:", 7.0, 3.0);
          objc_msgSend(v32, "setKerning:", -6.0);
        }
      }
      goto LABEL_35;
    case 20:
      objc_msgSend(v6, "displayString");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v34, "length") >= 2)
      {
        v35 = objc_msgSend(v34, "rangeOfString:", CFSTR("/"));
        if (v35 < objc_msgSend(v34, "length") - 1)
        {
          -[UIKBRenderFactory10Key numberPadKeyPrimarySymbolSize](self, "numberPadKeyPrimarySymbolSize");
          v37 = v36;
          objc_msgSend(v8, "symbolStyle");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setFontSize:", v37);

          -[UIKBRenderFactory10Key numberPadKeyPrimaryTextOffset](self, "numberPadKeyPrimaryTextOffset");
          v40 = v39;
          v42 = v41;
          objc_msgSend(v8, "symbolStyle");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setTextOffset:", v40, v42);

          if (objc_msgSend(v34, "rangeOfString:", CFSTR("|")) == 0x7FFFFFFFFFFFFFFFLL)
            -[UIKBRenderFactory10Key numberPadKeySecondaryTextOffset](self, "numberPadKeySecondaryTextOffset");
          else
            -[UIKBRenderFactory10Key numberPadVBarSecondaryTextOffset](self, "numberPadVBarSecondaryTextOffset");
          objc_msgSend(v32, "setTextOffset:");
        }
      }
      goto LABEL_35;
    case 25:
      -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "symbolStyle");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setFontName:", v57);

      objc_msgSend(v8, "symbolStyle");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setFontSize:", 16.0);

      v60 = objc_msgSend(v7, "visualStyling") & 0xFF0000;
      objc_msgSend(v8, "symbolStyle");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v61;
      if (v60 == 2228224)
        objc_msgSend(v61, "setKerning:", 0.0);
      else
        objc_msgSend(v61, "setTextOffset:", 1.0, 0.0);
      goto LABEL_26;
  }
  if (objc_msgSend(v6, "interactionType") == 24)
  {
    -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "symbolStyle");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setFontName:", v63);

    objc_msgSend(v8, "symbolStyle");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setFontSize:", 16.0);

    goto LABEL_36;
  }
  if (v26 > 4)
  {
    if (v26 == 5)
    {
      objc_msgSend(v8, "symbolStyle");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "setFontSize:", 37.0);
LABEL_143:

      objc_msgSend(v8, "symbolStyle");
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v224, "setUsesSymbolImage:", 1);
LABEL_144:

      goto LABEL_36;
    }
    if (v26 == 21)
      goto LABEL_128;
  }
  else
  {
    if (v26 == 3)
    {
      objc_msgSend(v8, "symbolStyle");
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v215, "setFontSize:", 15.0);

      -[UIKBRenderFactory scale](self, "scale");
      if (v216 == 2.0)
        v217 = 0.0;
      else
        v217 = *MEMORY[0x1E0C9D538];
      if (v216 == 2.0)
        v218 = -0.5;
      else
        v218 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      objc_msgSend(v8, "symbolStyle");
      v219 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v219, "setTextOffset:", v217, v218);

      objc_msgSend(v8, "symbolStyle");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "setKerning:", 0.0);
      goto LABEL_143;
    }
    if (v26 == 4)
    {
      objc_msgSend(v8, "symbolStyle");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setFontSize:", 19.0);

      -[UIKBRenderFactory10Key dictationKeyTextOffset](self, "dictationKeyTextOffset");
LABEL_32:
      v69 = v67;
      v70 = v68;
      objc_msgSend(v8, "symbolStyle");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v71;
      v73 = v69;
      v74 = v70;
LABEL_142:
      objc_msgSend(v71, "setTextOffset:", v73, v74);
      goto LABEL_143;
    }
  }
  objc_msgSend(v6, "name");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  v200 = objc_msgSend(v199, "containsString:", CFSTR("Syllable-Separator"));

  if (v200)
  {
LABEL_128:
    objc_msgSend(v6, "displayString");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    v202 = objc_msgSend(v201, "containsString:", CFSTR("Emoji"));

    if (v202)
    {
      objc_msgSend(v8, "symbolStyle");
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v203, "setUsesSymbolImage:", 1);

      -[UIKBRenderFactory lightKeycapsFontName](self, "lightKeycapsFontName");
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "symbolStyle");
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "setFontName:", v204);

      -[UIKBRenderFactory10Key symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
      v207 = v206;
      objc_msgSend(v8, "symbolStyle");
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v208, "setFontSize:", v207);

      v209 = *(double *)off_1E167DC60;
      objc_msgSend(v8, "symbolStyle");
      v210 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v210, "setFontWeight:", v209);

      -[UIKBRenderFactory10Key symbolImageControlKeyOffset](self, "symbolImageControlKeyOffset");
      v212 = v211;
      v214 = v213;
    }
    else
    {
      -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
      v220 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "symbolStyle");
      v221 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v221, "setFontName:", v220);

      objc_msgSend(v8, "symbolStyle");
      v222 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v222, "setFontSize:", 16.0);

      -[UIKBRenderFactory scale](self, "scale");
      v214 = 0.0;
      if (v223 == 2.0)
        v212 = 0.0;
      else
        v212 = 0.5;
    }
    objc_msgSend(v8, "symbolStyle");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v71;
    v73 = v212;
    v74 = v214;
    goto LABEL_142;
  }
  switch(v26)
  {
    case 13:
      objc_msgSend(v8, "symbolStyle");
      v237 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v237, "setFontSize:", 28.0);

      -[UIKBRenderFactory10Key globeKeyTextOffset](self, "globeKeyTextOffset");
      goto LABEL_32;
    case 35:
      objc_msgSend(v6, "frame");
      if (CGRectGetHeight(v302) <= 45.0)
      {
        objc_msgSend(v6, "name");
        v238 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v238, "hasPrefix:", CFSTR("TenKey-Chinese-Pinyin-")))
        {

LABEL_162:
          -[UIKBRenderFactory10Key capitalAbcSymbolSize](self, "capitalAbcSymbolSize");
          v249 = v248;
          objc_msgSend(v8, "symbolStyle");
          v250 = (void *)objc_claimAutoreleasedReturnValue();
          v251 = v250;
          v252 = v249;
          goto LABEL_167;
        }
        objc_msgSend(v6, "name");
        v245 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v245, "hasPrefix:", CFSTR("TenKey-Latin-")) & 1) != 0)
        {
          objc_msgSend(v6, "name");
          v246 = (void *)objc_claimAutoreleasedReturnValue();
          v247 = objc_msgSend(v246, "hasPrefix:", CFSTR("TenKey-Latin-Small-"));

          if ((v247 & 1) == 0)
            goto LABEL_162;
        }
        else
        {

        }
      }
      objc_msgSend(v8, "symbolStyle");
      v250 = (void *)objc_claimAutoreleasedReturnValue();
      v251 = v250;
      v252 = 16.0;
LABEL_167:
      objc_msgSend(v250, "setFontSize:", v252);

      objc_msgSend(v6, "name");
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v258, "hasPrefix:", CFSTR("TenKey-Chinese-Pinyin-")))
      {

      }
      else
      {
        objc_msgSend(v6, "name");
        v259 = (void *)objc_claimAutoreleasedReturnValue();
        v260 = objc_msgSend(v259, "hasPrefix:", CFSTR("TenKey-Latin-"));

        if (!v260)
          goto LABEL_36;
      }
      objc_msgSend(v8, "symbolStyle");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setFontName:", CFSTR("UIKBRenderFactorySystemFontName"));
LABEL_35:

      goto LABEL_36;
    case 23:
      objc_msgSend(v8, "symbolStyle");
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v225, "setFontSize:", 18.0);

      objc_msgSend(v8, "symbolStyle");
      v226 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v226, "setTextOffset:", 0.0, -1.0);

      objc_msgSend(v8, "symbolStyle");
      v227 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v227, "setUsesSymbolImage:", 1);

      if (objc_msgSend(v6, "state") == 8)
      {
        objc_msgSend(v8, "geometry");
        v224 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v224, "displayFrame");
        v229 = v228;
        v231 = v230 + 0.0;
        v233 = v232 + -0.5;
        v235 = v234 + 0.5;
        objc_msgSend(v8, "geometry");
        v236 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v236, "setDisplayFrame:", v231, v233, v229, v235);
LABEL_150:

        goto LABEL_144;
      }
      goto LABEL_36;
  }
  objc_msgSend(v6, "name");
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  v240 = objc_msgSend(v239, "hasPrefix:", CFSTR("Wubihua"));

  if (v240)
  {
    objc_msgSend(v8, "symbolStyle");
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    v224 = v241;
    v242 = 26.0;
LABEL_159:
    objc_msgSend(v241, "setFontSize:", v242);
    goto LABEL_144;
  }
  objc_msgSend(v6, "name");
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  v244 = objc_msgSend(v243, "hasSuffix:", CFSTR("Chinese-Facemark"));

  if (v244)
  {
    objc_msgSend(v8, "symbolStyle");
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    v224 = v241;
    v242 = 22.0;
    goto LABEL_159;
  }
  objc_msgSend(v6, "name");
  v253 = (void *)objc_claimAutoreleasedReturnValue();
  v254 = objc_msgSend(v253, "hasSuffix:", CFSTR("Comma-Full-Stop-Question-Mark-Exclamation-Mark"));

  if (v254)
  {
    objc_msgSend(v8, "symbolStyle");
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v255, "setFontSize:", 22.0);

    objc_msgSend(v8, "symbolStyle");
    v256 = (void *)objc_claimAutoreleasedReturnValue();
    v224 = v256;
    v257 = 1.0;
LABEL_173:
    objc_msgSend(v256, "setKerning:", v257);
    goto LABEL_144;
  }
  objc_msgSend(v6, "name");
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  v262 = objc_msgSend(v261, "hasSuffix:", CFSTR("Chinese-Full-Width-Half-Width-Swap"));

  if (v262)
  {
    objc_msgSend(v8, "symbolStyle");
    v263 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v263, "setFontSize:", 16.0);

    objc_msgSend(v8, "symbolStyle");
    v256 = (void *)objc_claimAutoreleasedReturnValue();
    v224 = v256;
    v257 = -1.0;
    goto LABEL_173;
  }
  if (v26 > 0x21)
    goto LABEL_193;
  if (((1 << v26) & 0x44C04) == 0)
  {
    if (v26 == 32)
    {
      objc_msgSend(v8, "symbolStyle");
      v280 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v280, "setFontSize:", 28.0);
LABEL_194:

      goto LABEL_27;
    }
    if (v26 == 33)
    {
      objc_msgSend(v8, "symbolStyle");
      v276 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v276, "setFontSize:", 28.0);

      -[UIKBRenderFactory scale](self, "scale");
      if (v277 == 2.0)
        v278 = -0.5;
      else
        v278 = *MEMORY[0x1E0C9D538];
      if (v277 == 2.0)
        v279 = 0.0;
      else
        v279 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      objc_msgSend(v8, "symbolStyle");
      v280 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v280, "setTextOffset:", v278, v279);
      goto LABEL_194;
    }
LABEL_193:
    -[UIKBRenderFactory10Key _preferredScriptFontForRendering:](self, "_preferredScriptFontForRendering:", (objc_msgSend(v7, "visualStyling") >> 16));
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "symbolStyle");
    v281 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v281, "setFontName:", v280);

    goto LABEL_194;
  }
  objc_msgSend(v8, "symbolStyle");
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v264, "setKerning:", 0.0);

  objc_msgSend(v8, "symbolStyle");
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v265, "setFontSize:", 16.0);

  objc_msgSend(v8, "symbolStyle");
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v266, "setUsesSymbolImage:", 1);

  objc_msgSend(v6, "displayString");
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  v268 = objc_msgSend(v267, "hasSuffix:", CFSTR("ABC"));

  if (v268)
  {
    -[UIKBRenderFactory10Key abcKeyTextOffset](self, "abcKeyTextOffset");
    v270 = v269;
    v272 = v271;
    objc_msgSend(v8, "symbolStyle");
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v273, "setTextOffset:", v270, v272);

  }
  objc_msgSend(v6, "name");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v62, "hasSuffix:", CFSTR("Symbol-Alternative-To-Symbol-Alternative-Width-Toggle-Keyplane-Switch-Key")))goto LABEL_26;
  objc_msgSend(v6, "name");
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v274, "hasSuffix:", CFSTR("Symbol-Alternative-Width-Toggle-To-Symbol-Alternative-Keyplane-Switch-Key")))goto LABEL_182;
  objc_msgSend(v6, "name");
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v275, "hasSuffix:", CFSTR("Symbol-To-Symbol-Width-Toggle-Keyplane-Switch-Key")))
  {

LABEL_182:
LABEL_26:

    goto LABEL_27;
  }
  objc_msgSend(v6, "name");
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  v283 = objc_msgSend(v282, "hasSuffix:", CFSTR("Symbol-Width-Toggle-To-Symbol-Keyplane-Switch-Key"));

  if ((v283 & 1) == 0)
  {
    -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "symbolStyle");
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v236, "setFontName:", v224);
    goto LABEL_150;
  }
LABEL_36:
  objc_msgSend(v6, "name");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v75, "hasSuffix:", CFSTR("At-Sign-Number-Sign-Solidus-Ampersand-Underline")) & 1) != 0)
  {
LABEL_39:

LABEL_40:
    objc_msgSend(v8, "setSecondarySymbolStyles:", 0);
    goto LABEL_41;
  }
  objc_msgSend(v6, "name");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v76, "hasSuffix:", CFSTR("Case-Swap")))
  {

    goto LABEL_39;
  }
  objc_msgSend(v6, "name");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend(v96, "hasSuffix:", CFSTR("Chinese-Digit-Symbols"));

  if ((v97 & 1) != 0)
    goto LABEL_40;
LABEL_41:
  objc_msgSend(v8, "secondarySymbolStyles");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "firstObject");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  v79 = objc_msgSend(v6, "state") & 0xC;
  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v80, "whiteText"))
    v81 = CFSTR("UIKBColorWhite");
  else
    v81 = CFSTR("UIKBColorBlack");
  objc_msgSend(v8, "symbolStyle");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setTextColor:", v81);

  objc_msgSend(v8, "symbolStyle");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "textColor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v286 = v78;
  objc_msgSend(v78, "setTextColor:", v84);

  if (v79)
    -[UIKBRenderFactory10Key controlKeyBackgroundColorName](self, "controlKeyBackgroundColorName");
  else
    -[UIKBRenderFactory defaultKeyBackgroundColorName](self, "defaultKeyBackgroundColorName");
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v285);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundGradient:", v85);

  objc_msgSend(v8, "setControlOpacities:", v79 != 0);
  if (+[UIKBRenderFactory _graphicsQuality](UIKBRenderFactory, "_graphicsQuality") != 10)
    objc_msgSend(v8, "setBlurBlending:", v79 != 0);
  -[UIKBRenderFactory translucentGapWidth](self, "translucentGapWidth");
  v87 = v86;
  -[UIKBRenderFactory10Key defaultKeyDividerColorName](self, "defaultKeyDividerColorName");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend(v89, "lightKeyboard");

  v91 = v287;
  if (v90)
  {
    if (objc_msgSend((id)objc_opt_class(), "_isActiveKeyplaneSwitchKey:", v6))
    {
      -[UIKBRenderFactory renderConfig](self, "renderConfig");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "activatedKeyplaneSwitchControlKeyBackgroundName");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBackgroundGradient:", v94);

      -[UIKBRenderFactory10Key controlKeyDividerColorName](self, "controlKeyDividerColorName");
      v95 = objc_claimAutoreleasedReturnValue();

      -[UIKBRenderFactory suppressLayoutSegments](self, "suppressLayoutSegments");
      v88 = (void *)v95;
    }
    else if (v79)
    {
      v91 = 15;
    }
  }
  if (objc_msgSend((id)objc_opt_class(), "_isActiveKeyplaneSwitchKey:", v6))
    objc_msgSend(v8, "setBlurBlending:", 0);
  if (objc_msgSend(v6, "state") == 1)
  {
    objc_msgSend(v8, "symbolStyle");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "setTextOpacity:", 0.35);

  }
  if (v91 && (objc_msgSend(v6, "state") & 0x10) == 0)
  {
    v99 = 0.0;
    if ((v91 & 1) != 0)
      v100 = -v87;
    else
      v100 = 0.0;
    if ((v91 & 4) != 0)
      v101 = -v87;
    else
      v101 = 0.0;
    if ((v91 & 8) != 0)
      v102 = -v87;
    else
      v102 = 0.0;
    if ((v91 & 2) != 0)
    {
      objc_msgSend(v8, "geometry");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "frame");
      v105 = v104;
      objc_msgSend(v8, "geometry");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "paddedFrame");
      v99 = v105 - v107;

    }
    +[UIKBEdgeEffect effectWithColor:edges:insets:weight:](UIKBEdgeEffect, "effectWithColor:edges:insets:weight:", v88, v91, v100, v99, v101, v102, v87);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addRenderEffect:", v108);

  }
  if (-[UIKBRenderFactory useBlueThemingForKey:](self, "useBlueThemingForKey:", v6))
  {
    if (objc_msgSend(v6, "state") == 2)
    {
      -[UIKBRenderFactory suppressLayoutSegments](self, "suppressLayoutSegments");
      +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", CFSTR("UIKBColorKeyBlueKeyBackground"));
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBackgroundGradient:", v109);

      -[UIKBRenderFactory10Key controlKeyDividerColorName](self, "controlKeyDividerColorName");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", v110, 15, -v87, v87);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addRenderEffect:", v111);

      -[UIKBRenderFactory renderConfig](self, "renderConfig");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v110) = objc_msgSend(v112, "lightKeyboard");

      if ((_DWORD)v110)
      {
        objc_msgSend(v8, "symbolStyle");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "setTextColor:", CFSTR("UIKBColorWhite"));

      }
    }
  }
  v288 = v88;
  if (v284 <= 0xD && ((1 << v284) & 0x2030) != 0)
  {
    objc_msgSend(v6, "state");
    v114 = 1;
  }
  else
  {
    if (objc_msgSend(v6, "state") == 16)
    {
      objc_msgSend(v8, "symbolStyle");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      v149 = (void *)objc_msgSend(v148, "copy");
      +[UIKBRenderTraits traitsWithSymbolStyle:](UIKBRenderTraits, "traitsWithSymbolStyle:", v149);
      v117 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "symbolStyle");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v150, "textColor");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "symbolStyle");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "setTextColor:", v151);

      objc_msgSend(v117, "symbolStyle");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "setFontSize:", 26.0);

      v154 = *MEMORY[0x1E0C9D538];
      v155 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      objc_msgSend(v117, "symbolStyle");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "setTextOffset:", v154, v155);

      objc_msgSend(v8, "setVariantTraits:", v117);
      objc_msgSend(v117, "symbolStyle");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      v158 = (void *)objc_msgSend(v157, "copy");
      +[UIKBRenderTraits traitsWithSymbolStyle:](UIKBRenderTraits, "traitsWithSymbolStyle:", v158);
      v131 = (void *)objc_claimAutoreleasedReturnValue();

      +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", CFSTR("UIKBColorKeyBlueKeyBackground"));
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "setLayeredForegroundGradient:", v159);

      objc_msgSend(v131, "symbolStyle");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v160, "setTextColor:", CFSTR("UIKBColorWhite"));

      objc_msgSend(v8, "setHighlightedVariantTraits:", v131);
      objc_msgSend(v8, "geometry");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v161, "setRoundRectCorners:", 0);

      objc_msgSend(v8, "geometry");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBRenderFactory10Key populateFlickGuide:forKey:from:](self, "populateFlickGuide:forKey:from:", v8, v6, v162);

      v163 = objc_msgSend(v6, "flickDirection");
      objc_msgSend(v8, "geometry");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v164, "setFlickDirection:", v163);

      +[UIKBShadowEffect effectWithColor:offset:insets:weight:](UIKBShadowEffect, "effectWithColor:offset:insets:weight:", CFSTR("UIKBColorBlack_Alpha40"), 0.0, 4.0, 1.0, 1.0, 1.0, 1.0, 15.0);
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addRenderEffect:", v165);

      -[UIKBRenderFactory renderConfig](self, "renderConfig");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v164) = objc_msgSend(v166, "lightKeyboard");

      if ((_DWORD)v164)
      {
        +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", CFSTR("UIKBColorLightBackdropTint"));
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setLayeredBackgroundGradient:", v167);

      }
      +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", CFSTR("UIKBColorBlack_Alpha20"), 15, 0.0, v87);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addRenderEffect:", v168);

      objc_msgSend(v8, "setBlurBlending:", 1);
      -[UIKBRenderFactory renderConfig](self, "renderConfig");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v169, "animatedBackground"))
        v170 = -[UIKBRenderFactory enabledBlendForm](self, "enabledBlendForm");
      else
        v170 = 0;
      objc_msgSend(v8, "setBlendForm:", v170);
      v114 = 0;
      goto LABEL_95;
    }
    v114 = 0;
  }
  if (objc_msgSend(v6, "state") == 20)
  {
    objc_msgSend(v8, "symbolStyle");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = (void *)objc_msgSend(v115, "copy");
    +[UIKBRenderTraits traitsWithSymbolStyle:](UIKBRenderTraits, "traitsWithSymbolStyle:", v116);
    v117 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKBRenderFactory defaultKeyBackgroundColorName](self, "defaultKeyBackgroundColorName");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v118);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "setBackgroundGradient:", v119);

    objc_msgSend(v117, "symbolStyle");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "setFontSize:", 30.0);

    v121 = *MEMORY[0x1E0C9D538];
    v122 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v117, "symbolStyle");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "setTextOffset:", v121, v122);

    objc_msgSend(v8, "symbolStyle");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "textColor");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "symbolStyle");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "setTextColor:", v125);

    +[UIKBShadowEffect effectWithColor:offset:insets:weight:](UIKBShadowEffect, "effectWithColor:offset:insets:weight:", CFSTR("UIKBColorBlack_Alpha40"), 0.0, 4.0, 1.0, 1.0, 1.0, 1.0, 15.0);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "addRenderEffect:", v127);

    +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", CFSTR("UIKBColorBlack_Alpha15"), 15, -v87, v87);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "addRenderEffect:", v128);

    objc_msgSend(v8, "geometry");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = objc_msgSend(v6, "flickDirection");
    -[UIKBRenderFactory scale](self, "scale");
    v131 = (void *)objc_msgSend(v129, "copyForFlickDirection:scale:", v130);

    objc_msgSend(v8, "geometry");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "paddedFrame");
    MidX = CGRectGetMidX(v298);
    objc_msgSend(v8, "geometry");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "paddedFrame");
    objc_msgSend(v131, "setPopupSource:", MidX, CGRectGetMidY(v299));

    objc_msgSend(v131, "displayFrame");
    v301 = CGRectInset(v300, -20.0, -20.0);
    objc_msgSend(v131, "setDisplayFrame:", v301.origin.x, v301.origin.y, v301.size.width, v301.size.height);
    objc_msgSend(v131, "setFlickDirection:", objc_msgSend(v6, "flickDirection"));
    objc_msgSend(v131, "setRoundRectCorners:", -1);
    objc_msgSend(v117, "setGeometry:", v131);
    objc_msgSend(v8, "setVariantTraits:", v117);
    objc_msgSend(v131, "displayFrame");
    v136 = v135;
    v138 = v137;
    v140 = v139;
    v142 = v141;
    objc_msgSend(v8, "geometry");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "setDisplayFrame:", v136, v138, v140, v142);

    v144 = objc_msgSend(v6, "flickDirection");
    objc_msgSend(v8, "geometry");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "setFlickDirection:", v144);

    objc_msgSend(v117, "setBlurBlending:", 1);
    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v146, "animatedBackground"))
      v147 = -[UIKBRenderFactory enabledBlendForm](self, "enabledBlendForm");
    else
      v147 = 0;
    objc_msgSend(v8, "setBlendForm:", v147);

    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    v172 = objc_msgSend(v171, "lightKeyboard");

    if (!v172)
      goto LABEL_96;
    +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", CFSTR("UIKBColorLightBackdropTint"));
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLayeredBackgroundGradient:", v169);
LABEL_95:

LABEL_96:
    -[UIKBRenderFactory suppressLayoutSegments](self, "suppressLayoutSegments");

  }
  v173 = objc_msgSend(v6, "state");
  if (v114 && (v173 & 0x10) != 0)
  {
    -[UIKBRenderFactory renderingContext](self, "renderingContext");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderFactory lightKeycapsFontName](self, "lightKeycapsFontName");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderFactory _customizeTraits:forPopupForKey:withRenderingContext:keycapsFontName:](self, "_customizeTraits:forPopupForKey:withRenderingContext:keycapsFontName:", v8, v6, v174, v175);

    -[UIKBRenderFactory suppressLayoutSegments](self, "suppressLayoutSegments");
  }
  v177 = v288;
  v176 = v289;
  if ((objc_msgSend((id)objc_opt_class(), "_isActiveKeyplaneSwitchKey:", v6) & 1) == 0)
  {
    v293 = 0u;
    v294 = 0u;
    v291 = 0u;
    v292 = 0u;
    objc_msgSend(v289, "subtrees");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    v179 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v291, v296, 16);
    if (v179)
    {
      v180 = v179;
      v181 = *(_QWORD *)v292;
LABEL_103:
      v182 = 0;
      while (1)
      {
        if (*(_QWORD *)v292 != v181)
          objc_enumerationMutation(v178);
        v183 = *(void **)(*((_QWORD *)&v291 + 1) + 8 * v182);
        objc_msgSend(v183, "name");
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        v185 = objc_msgSend(v184, "_containsSubstring:", CFSTR("Assist"));

        if ((v185 & 1) != 0)
          break;
        if (v180 == ++v182)
        {
          v180 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v291, v296, 16);
          if (v180)
            goto LABEL_103;
          v186 = 0;
          v176 = v289;
          v6 = v290;
          v177 = v288;
          goto LABEL_120;
        }
      }
      v186 = v183;

      if (!v186)
      {
        v176 = v289;
        v6 = v290;
        v177 = v288;
        goto LABEL_121;
      }
      objc_msgSend(v186, "keys");
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v290;
      v188 = objc_msgSend(v187, "containsObject:", v290);

      v177 = v288;
      v176 = v289;
      if (!v188)
        goto LABEL_121;
      if ((objc_msgSend(v290, "state") & 3) != 0)
      {
        -[UIKBRenderFactory10Key controlKeyTraits](self, "controlKeyTraits");
        v189 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if ((objc_msgSend(v290, "state") & 4) == 0)
        {
LABEL_119:
          objc_msgSend(v8, "symbolStyle");
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v178, "setUsesSymbolImage:", 1);
          goto LABEL_120;
        }
        -[UIKBRenderFactory10Key activeControlKeyTraits](self, "activeControlKeyTraits");
        v189 = objc_claimAutoreleasedReturnValue();
      }
      v190 = (void *)v189;
      objc_msgSend(v8, "overlayWithTraits:", v189);

      goto LABEL_119;
    }
    v186 = 0;
LABEL_120:

LABEL_121:
  }
  objc_msgSend(v8, "symbolStyle");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v192 = objc_msgSend(v191, "usesSymbolImage");

  if (v192)
  {
    -[UIKBRenderFactory10Key symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
    v194 = v193;
    objc_msgSend(v8, "symbolStyle");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v195, "setFontSizeForSymbolImage:", v194);

    v196 = *(double *)off_1E167DC60;
    objc_msgSend(v8, "symbolStyle");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v197, "setFontWeightForSymbolImage:", v196);

  }
  return v8;
}

- (id)controlKeyTraits
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[UIKBRenderFactory translucentGapWidth](self, "translucentGapWidth");
  v4 = v3;
  +[UIKBRenderTraits traitsWithSymbolStyle:](UIKBRenderTraits, "traitsWithSymbolStyle:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setControlOpacities:", 1);
  -[UIKBRenderFactory10Key controlKeyBackgroundColorName](self, "controlKeyBackgroundColorName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundGradient:", v7);

  -[UIKBRenderFactory10Key controlKeyDividerColorName](self, "controlKeyDividerColorName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", v8, 15, -v4, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addRenderEffect:", v9);

  return v5;
}

- (id)activeControlKeyTraits
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[UIKBRenderFactory translucentGapWidth](self, "translucentGapWidth");
  v4 = v3;
  +[UIKBRenderTraits traitsWithSymbolStyle:](UIKBRenderTraits, "traitsWithSymbolStyle:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setControlOpacities:", 0);
  -[UIKBRenderFactory defaultKeyBackgroundColorName](self, "defaultKeyBackgroundColorName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundGradient:", v7);

  -[UIKBRenderFactory10Key controlKeyDividerColorName](self, "controlKeyDividerColorName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", v8, 15, -v4, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addRenderEffect:", v9);

  return v5;
}

- (id)shiftedControlKeyTraits
{
  void *v3;
  void *v4;
  int v5;
  __CFString **v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  -[UIKBRenderFactory10Key controlKeyTraits](self, "controlKeyTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "lightKeyboard");
  v6 = UIKBColorBlack;
  if (!v5)
    v6 = UIKBColorWhite;
  v7 = *v6;

  +[UIKBTextStyle styleWithTextColor:](UIKBTextStyle, "styleWithTextColor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setSymbolStyle:", v8);
  -[UIKBRenderFactory defaultKeyBackgroundColorName](self, "defaultKeyBackgroundColorName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundGradient:", v10);

  return v3;
}

- (id)shiftedWhiteControlKeyTraits
{
  void *v3;
  void *v4;
  int v5;
  __CFString **v6;
  __CFString *v7;
  void *v8;
  void *v9;
  int v10;
  __CFString **v11;
  __CFString *v12;
  void *v13;

  -[UIKBRenderFactory10Key controlKeyTraits](self, "controlKeyTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "lightKeyboard");
  v6 = UIKBColorBlack;
  if (!v5)
    v6 = UIKBColorWhite;
  v7 = *v6;

  +[UIKBTextStyle styleWithTextColor:](UIKBTextStyle, "styleWithTextColor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setSymbolStyle:", v8);
  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "lightKeyboard");
  v11 = UIKBColor10KeyWhiteShiftedBackground;
  if (!v10)
    v11 = UIKBColorKeyGrayKeyDarkBackground;
  v12 = *v11;

  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setBackgroundGradient:", v13);
  return v3;
}

- (void)setupColumnLayoutSegmentsWithControlWidth:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[UIKBRenderFactory10Key controlKeyTraits](self, "controlKeyTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:", v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setKeyStates:", 3);
  objc_msgSend(v12, "addLayoutRect:asTriangle:", 0, 0.0, 0.0, a3, 1.0);
  objc_msgSend(v12, "addLayoutRect:asTriangle:", 0, 1.0 - a3, 0.0, a3, 1.0);
  -[UIKBRenderFactory addLayoutSegment:](self, "addLayoutSegment:", v12);
  -[UIKBRenderFactory10Key activeControlKeyTraits](self, "activeControlKeyTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setKeyStates:", 4);
  objc_msgSend(v7, "addLayoutRect:asTriangle:", 0, 0.0, 0.0, a3, 1.0);
  objc_msgSend(v7, "addLayoutRect:asTriangle:", 0, 1.0 - a3, 0.0, a3, 1.0);
  -[UIKBRenderFactory addLayoutSegment:](self, "addLayoutSegment:", v7);
  -[UIKBRenderFactory10Key shiftedControlKeyTraits](self, "shiftedControlKeyTraits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setKeyStates:", 108);
  objc_msgSend(v9, "setRequireAllMatches:", 1);
  objc_msgSend(v9, "addLayoutRect:asTriangle:", 0, 0.0, 0.0, a3, 1.0);
  objc_msgSend(v9, "addLayoutRect:asTriangle:", 0, 1.0 - a3, 0.0, a3, 1.0);
  objc_msgSend(v9, "addRelativeLayoutRectFromEdge:ofCachedKey:", 10, CFSTR("Shift-Key"));
  -[UIKBRenderFactory addLayoutSegment:](self, "addLayoutSegment:", v9);
  -[UIKBRenderFactory10Key shiftedWhiteControlKeyTraits](self, "shiftedWhiteControlKeyTraits");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setKeyStates:", 108);
  objc_msgSend(v11, "setRequireAllMatches:", 1);
  objc_msgSend(v11, "addLayoutRect:asTriangle:", 0, a3, 0.0, 1.0 - a3 - a3, 1.0);
  objc_msgSend(v11, "addRelativeLayoutRectFromEdge:ofCachedKey:", 10, CFSTR("Shift-Key"));
  -[UIKBRenderFactory addLayoutSegment:](self, "addLayoutSegment:", v11);

}

+ (BOOL)_isActiveKeyplaneSwitchKey:(id)a3
{
  id v3;
  int v4;
  BOOL v6;

  v3 = a3;
  if ((objc_msgSend(v3, "state") & 0xC) != 0)
  {
    v4 = objc_msgSend(v3, "displayType");
    v6 = v4 == 14 || v4 == 11;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)populateFlickGuide:(id)a3 forKey:(id)a4 from:(id)a5
{
  id v8;
  id v9;
  double v10;
  CGFloat x;
  double v12;
  CGFloat y;
  double v14;
  CGFloat width;
  double v16;
  CGFloat height;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  id v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v35 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "displayFrame");
  x = v10;
  y = v12;
  width = v14;
  height = v16;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v9, "copy");
  -[UIKBRenderFactory scale](self, "scale");
  objc_msgSend(v19, "makeIntegralWithScale:");
  objc_msgSend(v18, "addObject:", v19);
  v20 = 0;
  do
  {
    objc_msgSend(v8, "subtrees");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v20 + 1;
    objc_msgSend(v21, "objectAtIndex:", v20 + 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23 == v24)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIKBRenderFactory scale](self, "scale");
      v25 = (void *)objc_msgSend(v19, "copyForPopupDirection:scale:", v20);
      objc_msgSend(v25, "displayFrame");
      v40.origin.x = v26;
      v40.origin.y = v27;
      v40.size.width = v28;
      v40.size.height = v29;
      v36.origin.x = x;
      v36.origin.y = y;
      v36.size.width = width;
      v36.size.height = height;
      v37 = CGRectUnion(v36, v40);
      x = v37.origin.x;
      y = v37.origin.y;
      width = v37.size.width;
      height = v37.size.height;
    }
    objc_msgSend(v18, "addObject:", v25);

    v20 = v22;
  }
  while (v22 != 4);
  objc_msgSend(v35, "setVariantGeometries:", v18);
  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  v39 = CGRectInset(v38, -20.0, -20.0);
  v30 = v39.origin.x;
  v31 = v39.origin.y;
  v32 = v39.size.width;
  v33 = v39.size.height;
  objc_msgSend(v35, "geometry");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setDisplayFrame:", v30, v31, v32, v33);

}

@end
