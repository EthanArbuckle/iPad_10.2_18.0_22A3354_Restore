@implementation UIKBRenderFactoryiPadHWR_Portrait

- (int64_t)assetIdiom
{
  return 1;
}

- (double)keyCornerRadius
{
  return 5.0;
}

- (double)deleteKeyFontSize
{
  return 18.0;
}

- (double)moreKeyFontSize
{
  return 17.0;
}

- (double)internationalKeyFontSize
{
  return 30.0;
}

- (double)dictationKeyFontSize
{
  return 28.0;
}

- (double)spaceKeyFontSize
{
  return 18.0;
}

- (double)dismissKeyFontSize
{
  return 37.0;
}

- (CGPoint)dismissKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 6.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)spaceReturnKeyTextOffset
{
  double v2;
  double v3;
  double v4;
  CGPoint result;

  -[UIKBRenderFactory scale](self, "scale");
  v2 = 1.5;
  if (v3 != 2.0)
    v2 = 1.0;
  v4 = 0.0;
  result.y = v2;
  result.x = v4;
  return result;
}

- (id)messagesWriteboardKeyImageName
{
  return CFSTR("messages_writeboard_portrait.png");
}

- (UIEdgeInsets)symbolFrameInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 7.0;
  v3 = 2.0;
  v4 = 7.0;
  v5 = 2.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)_anchorControlKeys
{
  return 0;
}

- (CGPoint)_controlKeyOffset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", 9.0);
  v4 = v3;
  -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", 8.0);
  v6 = v5;
  v7 = v4;
  result.y = v6;
  result.x = v7;
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
    v7.super_class = (Class)UIKBRenderFactoryiPadHWR_Portrait;
    v5 = -[UIKBRenderFactory10Key_Round shouldUseRoundCornerForKey:](&v7, sel_shouldUseRoundCornerForKey_, v4);
  }

  return v5;
}

- (BOOL)_displaysAsControlKeyStyle:(id)a3
{
  id v3;
  unsigned int v4;
  char v5;
  _BOOL4 v6;
  int v7;
  _BOOL4 v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "displayType");
  v5 = v4;
  v6 = v4 < 0x16;
  v7 = objc_msgSend(v3, "interactionType");

  if (v7 == 40 || v7 == 9)
    LOBYTE(v8) = 1;
  else
    return v6 & (0x242030u >> v5);
  return v8;
}

- (void)_customizeTraits:(id)a3 forPopupForKey:(id)a4 withRenderingContext:(id)a5 keycapsFontName:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  __CFString **v16;
  __CFString *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;

  v48 = a3;
  v10 = a4;
  v11 = a6;
  v12 = a5;
  objc_msgSend(v48, "removeAllRenderEffects");
  +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v11, 22.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v48, "setSymbolStyle:", v13);
  objc_msgSend(v12, "renderConfig");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "lightKeyboard");
  v16 = UIKBColorBlack;
  if (!v15)
    v16 = UIKBColorWhite;
  v17 = *v16;
  objc_msgSend(v48, "symbolStyle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTextColor:", v17);

  if (objc_msgSend(v10, "displayType") == 5)
  {
    objc_msgSend(v48, "geometry");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "paddedFrame");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    -[UIKBRenderFactory translucentGapWidth](self, "translucentGapWidth");
    v29 = v28 + v23;
    v30 = v27 - (v28 + 0.0);
    objc_msgSend(v48, "geometry");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setPaddedFrame:", v21 + 0.0, v29, v25, v30);

    objc_msgSend(v48, "geometry");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "paddedFrame");
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;
    objc_msgSend(v48, "geometry");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setDisplayFrame:", v34, v36, v38, v40);

LABEL_7:
    objc_msgSend(v48, "symbolStyle");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setUsesSymbolImage:", 1);

    -[UIKBRenderFactory10Key symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
    v44 = v43;
    objc_msgSend(v48, "symbolStyle");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setFontSizeForSymbolImage:", v44);

    goto LABEL_8;
  }
  if (objc_msgSend(v10, "displayType") == 13 || objc_msgSend(v10, "displayType") == 4)
    goto LABEL_7;
LABEL_8:
  -[UIKBRenderFactory defaultKeyBackgroundColorName](self, "defaultKeyBackgroundColorName");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setBackgroundGradient:", v47);

  -[UIKBRenderFactory10Key modifyTraitsForDetachedInputSwitcher:withKey:](self, "modifyTraitsForDetachedInputSwitcher:withKey:", v48, v10);
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double MidX;
  uint64_t v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  __CFString *v63;
  void *v64;
  int v65;
  __CFString **v66;
  void *v67;
  int v68;
  __CFString **v69;
  __CFString *v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  objc_super v76;
  _QWORD v77[4];
  CGRect v78;
  CGRect v79;

  v77[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v76.receiver = self;
  v76.super_class = (Class)UIKBRenderFactoryiPadHWR_Portrait;
  -[UIKBRenderFactory10Key_Round _traitsForKey:onKeyplane:](&v76, sel__traitsForKey_onKeyplane_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "displayType");
  if (v9 == 25 || (v10 = v9, v9 == 21))
  {
    -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "symbolStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFontName:", v11);

    -[UIKBRenderFactoryiPadHWR_Portrait spaceKeyFontSize](self, "spaceKeyFontSize");
    v14 = v13;
    objc_msgSend(v8, "symbolStyle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFontSize:", v14);

    -[UIKBRenderFactoryiPadHWR_Portrait spaceReturnKeyTextOffset](self, "spaceReturnKeyTextOffset");
    v17 = v16;
    v19 = v18;
    objc_msgSend(v8, "symbolStyle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTextOffset:", v17, v19);

    objc_msgSend(v8, "symbolStyle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v21, "usesSymbolImage");

    if ((_DWORD)v12)
    {
      -[UIKBRenderFactoryiPadHWR_Portrait lightKeycapsFontName](self, "lightKeycapsFontName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "symbolStyle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setFontName:", v22);

      v24 = *(double *)off_1E167DC60;
      objc_msgSend(v8, "symbolStyle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setFontWeight:", v24);

      -[UIKBRenderFactory10Key symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
      v27 = v26;
      objc_msgSend(v8, "symbolStyle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setFontSize:", v27);

      -[UIKBRenderFactory10Key symbolImageControlKeyOffset](self, "symbolImageControlKeyOffset");
      v30 = v29;
      v32 = v31;
      objc_msgSend(v8, "symbolStyle");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setTextOffset:", v30, v32);
LABEL_8:

    }
  }
  else
  {
    if ((v9 & 0xFFFFFFEF) == 2
      || (objc_msgSend(v6, "localizationKey"),
          v34 = (void *)objc_claimAutoreleasedReturnValue(),
          v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("UI-abc")),
          v34,
          v35))
    {
      -[UIKBRenderFactory lightTextFontName](self, "lightTextFontName");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "symbolStyle");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setFontName:", v36);

      -[UIKBRenderFactoryiPadHWR_Portrait moreKeyFontSize](self, "moreKeyFontSize");
      v39 = v38;
      objc_msgSend(v8, "symbolStyle");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setFontSize:", v39);

      -[UIKBRenderFactoryiPadHWR_Portrait spaceReturnKeyTextOffset](self, "spaceReturnKeyTextOffset");
      v42 = v41;
      v44 = v43;
      objc_msgSend(v8, "symbolStyle");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setTextOffset:", v42, v44);

      objc_msgSend(v8, "symbolStyle");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setUsesSymbolImage:", 1);
      goto LABEL_8;
    }
    if (v10 <= 11)
    {
      if (v10 == 3)
      {
        -[UIKBRenderFactoryiPadHWR_Portrait deleteKeyFontSize](self, "deleteKeyFontSize");
        v61 = v60;
        objc_msgSend(v8, "symbolStyle");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setFontSize:", v61);

        if ((objc_msgSend(v6, "state") & 4) != 0)
        {
          -[UIKBRenderFactory renderConfig](self, "renderConfig");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v64, "lightKeyboard");
          v66 = UIKBColorHWRCellLightBackground;
          if (!v65)
            v66 = UIKBColorHWRCellDarkBackground;
          v63 = *v66;

          -[UIKBRenderFactory renderConfig](self, "renderConfig");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = objc_msgSend(v67, "lightKeyboard");
          v69 = UIKBColorHWRCellLightBackgroundClear;
          if (!v68)
            v69 = UIKBColorHWRCellDarkBackgroundClear;
          v70 = *v69;

          v77[0] = v63;
          v77[1] = v63;
          v77[2] = v70;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 3);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIKBGradient gradientWith3Colors:middleLocation:](UIKBGradient, "gradientWith3Colors:middleLocation:", v71, 0.5);
          v72 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "setBackgroundGradient:", v72);
        }
        else
        {
          +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", CFSTR("UIKBColorClear"));
          v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setBackgroundGradient:", v63);
        }

        objc_msgSend(v8, "removeAllRenderEffects");
      }
      else if (v10 != 5)
      {
        goto LABEL_9;
      }
      objc_msgSend(v8, "symbolStyle");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "setUsesSymbolImage:", 1);

      -[UIKBRenderFactory10Key symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
      v75 = v74;
      objc_msgSend(v8, "symbolStyle");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setFontSizeForSymbolImage:", v75);
      goto LABEL_8;
    }
    if (v10 == 12)
    {
      objc_msgSend(v8, "setBackgroundGradient:", 0);
      goto LABEL_9;
    }
    if (v10 == 13)
    {
      objc_msgSend(v8, "symbolStyle");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setUsesSymbolImage:", 1);

      -[UIKBRenderFactory10Key symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
      v57 = v56;
      objc_msgSend(v8, "symbolStyle");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setFontSizeForSymbolImage:", v57);

      v59 = *(double *)off_1E167DC60;
      objc_msgSend(v8, "symbolStyle");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setFontWeightForSymbolImage:", v59);
      goto LABEL_8;
    }
  }
LABEL_9:
  if (-[UIKBRenderFactoryiPadHWR_Portrait _anchorControlKeys](self, "_anchorControlKeys")
    && -[UIKBRenderFactoryiPadHWR_Portrait _displaysAsControlKeyStyle:](self, "_displaysAsControlKeyStyle:", v6))
  {
    objc_msgSend(v6, "frame");
    MidX = CGRectGetMidX(v78);
    objc_msgSend(v7, "frame");
    if (MidX >= CGRectGetMidX(v79))
      v47 = 8;
    else
      v47 = 4;
    objc_msgSend(v8, "symbolStyle");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setAnchorCorner:", v47);

    -[UIKBRenderFactoryiPadHWR_Portrait _controlKeyOffset](self, "_controlKeyOffset");
    v50 = v49;
    v52 = v51;
    objc_msgSend(v8, "symbolStyle");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setTextOffset:", v50, v52);

  }
  return v8;
}

- (double)controlColumnWidthFactor
{
  return 0.27;
}

- (void)setupLayoutSegments
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[UIKBRenderFactoryiPadHWR_Portrait controlColumnWidthFactor](self, "controlColumnWidthFactor");
  v4 = v3;
  -[UIKBRenderFactory10Key_Round controlKeyTraits](self, "controlKeyTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setKeyStates:", 3);
  objc_msgSend(v8, "addLayoutRect:asTriangle:", 0, 0.0, 0.75, v4, 0.25);
  objc_msgSend(v8, "addLayoutRect:asTriangle:", 0, 1.0 - v4, 0.75, v4, 0.25);
  -[UIKBRenderFactory addLayoutSegment:](self, "addLayoutSegment:", v8);
  -[UIKBRenderFactory10Key_Round activeControlKeyTraits](self, "activeControlKeyTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setKeyStates:", 4);
  objc_msgSend(v7, "addLayoutRect:asTriangle:", 0, 0.0, 0.75, v4, 0.25);
  objc_msgSend(v7, "addLayoutRect:asTriangle:", 0, 1.0 - v4, 0.75, v4, 0.25);
  -[UIKBRenderFactory addLayoutSegment:](self, "addLayoutSegment:", v7);

}

@end
