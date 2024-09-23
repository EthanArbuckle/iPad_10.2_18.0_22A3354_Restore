@implementation UIKBRenderFactoryHWR_Portrait

- (double)handwritingGradientStartLocation
{
  return 0.22;
}

- (UIEdgeInsets)handwritingAreaInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 5.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)symbolImageControlKeyFontSize
{
  return 19.0;
}

- (CGPoint)deleteGlyphOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.5;
  v3 = 2.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)spaceKeyTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)moreKeyTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.5;
  v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)spaceKeyFontSize
{
  return 16.0;
}

- (CGPoint)globeKeyTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = -0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (UIEdgeInsets)symbolFrameInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 1.0;
  v3 = 2.0;
  v4 = 3.0;
  v5 = 2.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)shouldUseRoundCornerForKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "displayType") == 3)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKBRenderFactoryHWR_Portrait;
    v5 = -[UIKBRenderFactory10Key_Round shouldUseRoundCornerForKey:](&v7, sel_shouldUseRoundCornerForKey_, v4);
  }

  return v5;
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  __CFString **v63;
  __CFString *v64;
  void *v65;
  int v66;
  __CFString **v67;
  __CFString *v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  __CFString **v73;
  __CFString *v74;
  void *v75;
  int v76;
  __CFString *v77;
  __CFString *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  void *v92;
  objc_super v94;
  _QWORD v95[3];
  _QWORD v96[2];
  _QWORD v97[4];
  _QWORD v98[3];
  _QWORD v99[4];

  v99[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v94.receiver = self;
  v94.super_class = (Class)UIKBRenderFactoryHWR_Portrait;
  -[UIKBRenderFactory10Key_Round _traitsForKey:onKeyplane:](&v94, sel__traitsForKey_onKeyplane_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "displayType");
  switch(v8)
  {
    case 12:
      objc_msgSend(v7, "geometry");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBRenderFactoryHWR_Portrait handwritingAreaInsets](self, "handwritingAreaInsets");
      objc_msgSend(v9, "applyInsets:");

      -[UIKBRenderFactory renderConfig](self, "renderConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "lightKeyboard");

      if (v11)
      {
        objc_msgSend(v6, "originalFrame");
        v13 = v12;
        objc_msgSend(v6, "frame");
        if (v13 <= 0.0 || (v15 = v14, v14 <= v13))
        {
          v95[0] = CFSTR("UIKBColorWhite_Alpha87");
          v95[1] = CFSTR("UIKBColorWhite_Alpha87");
          v95[2] = CFSTR("UIKBColorWhite_Alpha87_60");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 3);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKBRenderFactoryHWR_Portrait handwritingGradientStartLocation](self, "handwritingGradientStartLocation");
          +[UIKBGradient gradientWith3Colors:middleLocation:](UIKBGradient, "gradientWith3Colors:middleLocation:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setBackgroundGradient:", v19);
        }
        else
        {
          v97[0] = CFSTR("UIKBColorWhite_Alpha87");
          v97[1] = CFSTR("UIKBColorWhite_Alpha87");
          v97[2] = CFSTR("UIKBColorWhite_Alpha87_60");
          v97[3] = CFSTR("UIKBColorWhite_Alpha87_60");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 4);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)MEMORY[0x1E0CB37E8];
          -[UIKBRenderFactoryHWR_Portrait handwritingGradientStartLocation](self, "handwritingGradientStartLocation");
          objc_msgSend(v17, "numberWithDouble:", v13 * v18 / v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v96[0] = v19;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13 / v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v96[1] = v20;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIKBGradient gradientWithColors:middleLocations:](UIKBGradient, "gradientWithColors:middleLocations:", v16, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setBackgroundGradient:", v22);

        }
        objc_msgSend(v7, "geometry");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "paddedFrame");
        v85 = v84;
        v87 = v86 + 0.0;
        v89 = v88 + 0.5;
        v91 = v90 + -0.5;
        objc_msgSend(v7, "geometry");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "setPaddedFrame:", v87, v89, v85, v91);

        +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", CFSTR("UIKBColorBlack_Alpha20"), 1, -0.5, 0.5);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addRenderEffect:", v46);
        goto LABEL_29;
      }
      objc_msgSend(v7, "setBackgroundGradient:", 0);
      goto LABEL_30;
    case 13:
      objc_msgSend(v7, "symbolStyle");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setUsesSymbolImage:", 1);

      -[UIKBRenderFactoryHWR_Portrait symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
      v49 = v48;
      objc_msgSend(v7, "symbolStyle");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setFontSizeForSymbolImage:", v49);

      v51 = *(double *)off_1E167DC70;
      objc_msgSend(v7, "symbolStyle");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setFontWeightForSymbolImage:", v51);
      goto LABEL_29;
    case 14:
    case 15:
    case 16:
    case 17:
    case 19:
    case 20:
      goto LABEL_30;
    case 18:
      -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "symbolStyle");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setFontName:", v52);

      objc_msgSend(v7, "symbolStyle");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setFontSize:", 16.0);

      -[UIKBRenderFactoryHWR_Portrait moreKeyTextOffset](self, "moreKeyTextOffset");
      v56 = v55;
      v58 = v57;
      objc_msgSend(v7, "symbolStyle");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setTextOffset:", v56, v58);

      objc_msgSend(v7, "symbolStyle");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setKerning:", 0.0);
      goto LABEL_29;
    case 21:
      goto LABEL_8;
    default:
      if (v8 == 3)
      {
        if ((objc_msgSend(v6, "state") & 4) != 0)
        {
          -[UIKBRenderFactory renderConfig](self, "renderConfig");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend(v61, "lightKeyboard");
          v63 = UIKBColorHWRCellLightBackground;
          if (!v62)
            v63 = UIKBColorHWRCellDarkBackground;
          v64 = *v63;

          -[UIKBRenderFactory renderConfig](self, "renderConfig");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend(v65, "lightKeyboard");
          v67 = UIKBColorHWRCellLightBackgroundClear;
          if (!v66)
            v67 = UIKBColorHWRCellDarkBackgroundClear;
          v68 = *v67;

          v99[0] = v64;
          v99[1] = v64;
          v99[2] = v68;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 3);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIKBGradient gradientWith3Colors:middleLocation:](UIKBGradient, "gradientWith3Colors:middleLocation:", v69, 0.5);
          v70 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "setBackgroundGradient:", v70);
        }
        else
        {
          +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", CFSTR("UIKBColorClear"));
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setBackgroundGradient:", v60);

        }
        objc_msgSend(v7, "removeAllRenderEffects");
        -[UIKBRenderFactory renderConfig](self, "renderConfig");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v71, "whiteText");
        v73 = UIKBColorWhite_Alpha10;
        if (!v72)
          v73 = UIKBColorBlack_Alpha10;
        v74 = *v73;

        -[UIKBRenderFactory renderConfig](self, "renderConfig");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = objc_msgSend(v75, "whiteText");
        v77 = CFSTR("UIKBColorWhite_Alpha0");
        if (!v76)
          v77 = CFSTR("UIKBColorClear");
        v78 = v77;

        v98[0] = v74;
        v98[1] = v74;
        v98[2] = v78;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 3);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIKBGradient gradientWith3Colors:middleLocation:](UIKBGradient, "gradientWith3Colors:middleLocation:", v79, 0.5);
        v80 = (void *)objc_claimAutoreleasedReturnValue();

        +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", 0, 2, -0.5, 0.5);
        v81 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v81, "setGradient:", v80);
        objc_msgSend(v7, "addRenderEffect:", v81);
        objc_msgSend(v7, "symbolStyle");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "setTextOffset:", 0.5, 2.0);

      }
      else if (v8 == 25)
      {
LABEL_8:
        -[UIKBRenderFactoryHWR_Portrait spaceKeyFontSize](self, "spaceKeyFontSize");
        v24 = v23;
        objc_msgSend(v7, "symbolStyle");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setFontSize:", v24);

        -[UIKBRenderFactoryHWR_Portrait spaceKeyTextOffset](self, "spaceKeyTextOffset");
        v27 = v26;
        v29 = v28;
        objc_msgSend(v7, "symbolStyle");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setTextOffset:", v27, v29);

        if (-[UIKBRenderFactory10Key_Round useRoundCorner](self, "useRoundCorner"))
        {
          objc_msgSend(v7, "symbolStyle");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setKerning:", 0.0);

        }
        objc_msgSend(v6, "displayString");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "containsString:", CFSTR("Emoji"));

        if (v33)
        {
          objc_msgSend(v7, "symbolStyle");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setUsesSymbolImage:", 1);

          -[UIKBRenderFactory lightKeycapsFontName](self, "lightKeycapsFontName");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "symbolStyle");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setFontName:", v35);

          -[UIKBRenderFactoryHWR_Portrait symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
          v38 = v37;
          objc_msgSend(v7, "symbolStyle");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setFontSize:", v38);

          v40 = *(double *)off_1E167DC60;
          objc_msgSend(v7, "symbolStyle");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setFontWeight:", v40);

          -[UIKBRenderFactory10Key symbolImageControlKeyOffset](self, "symbolImageControlKeyOffset");
          v43 = v42;
          v45 = v44;
          objc_msgSend(v7, "symbolStyle");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "setTextOffset:", v43, v45);
LABEL_29:

        }
      }
LABEL_30:

      return v7;
  }
}

- (void)setupLayoutSegments
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UIKBRenderFactory10Key_Round controlKeyTraits](self, "controlKeyTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setKeyStates:", 3);
  objc_msgSend(v6, "addLayoutRect:asTriangle:", 0, 0.0, 0.75, 0.26, 0.25);
  objc_msgSend(v6, "addLayoutRect:asTriangle:", 0, 0.66, 0.75, 0.33, 0.25);
  -[UIKBRenderFactory addLayoutSegment:](self, "addLayoutSegment:", v6);
  -[UIKBRenderFactory10Key_Round activeControlKeyTraits](self, "activeControlKeyTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setKeyStates:", 4);
  objc_msgSend(v5, "addLayoutRect:asTriangle:", 0, 0.0, 0.75, 0.26, 0.25);
  objc_msgSend(v5, "addLayoutRect:asTriangle:", 0, 0.66, 0.75, 0.33, 0.25);
  -[UIKBRenderFactory addLayoutSegment:](self, "addLayoutSegment:", v5);

}

@end
