@implementation UIKBRenderFactoryiPadFudge

- (double)stringKeyFontSize:(unint64_t)a3
{
  double result;

  result = 18.5;
  if (a3 != 1)
    result = 19.0;
  if (a3 == 4)
    return 22.0;
  return result;
}

- (CGPoint)stringKeyOffset:(unint64_t)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = 2.0;
  if (a3 != 1)
    v3 = 1.0;
  v4 = 0.0;
  result.y = v3;
  result.x = v4;
  return result;
}

- (double)spaceKeyFontSize
{
  return 18.0;
}

- (double)moreKeyFontSize
{
  return 14.0;
}

- (double)deleteKeyFontSize
{
  return 17.0;
}

- (double)controlKeyFontSize
{
  return 17.0;
}

- (double)symbolImageControlKeyFontSize
{
  return 20.0;
}

- (CGPoint)symbolImageControlKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 17.0;
  v3 = 16.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)iPadFudgeControlKeyOffset
{
  _BOOL4 v2;
  double v3;
  double v4;
  CGPoint result;

  v2 = -[UIKBRenderFactory preferStringKeycapOverImage](self, "preferStringKeycapOverImage");
  v3 = 17.0;
  if (v2)
    v3 = 16.0;
  v4 = 13.5;
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)deleteKeyOffset:(unint64_t)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = 13.5;
  if (a3 != 1)
    v3 = 14.5;
  v4 = 16.5;
  result.y = v3;
  result.x = v4;
  return result;
}

- (CGPoint)internationalKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 17.0;
  v3 = 14.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)moreKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 16.0;
  v3 = 13.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dictationKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 17.0;
  v3 = 15.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dismissKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 17.0;
  v3 = 11.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)dualStringKeyBottomFontSize:(unint64_t)a3
{
  double result;

  result = 18.0;
  if (a3 == 1)
    result = 15.0;
  if (a3 == 4)
    return 20.0;
  return result;
}

- (CGPoint)dualStringKeyBottomTextOffset:(unint64_t)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = 12.0;
  if (a3 == 1)
    v3 = 9.0;
  if (a3 == 4)
    v3 = 13.0;
  v4 = 0.0;
  result.y = v3;
  result.x = v4;
  return result;
}

- (double)dualStringKeyTopFontSize:(unint64_t)a3
{
  double result;

  result = 17.0;
  if (a3 == 1)
    result = 16.0;
  if (a3 == 4)
    return 20.0;
  return result;
}

- (CGPoint)dualStringKeyTopTextOffset:(unint64_t)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = -9.0;
  if (a3 != 1)
    v3 = -13.0;
  v4 = 0.0;
  result.y = v3;
  result.x = v4;
  return result;
}

- (CGSize)defaultVariantGeometrySize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 63.0;
  v3 = 61.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)iPadFudgeLayout
{
  return 1;
}

- (id)messagesWriteboardKeyImageName
{
  return CFSTR("messages_writeboard_fudge_portrait.png");
}

- (CGPoint)dualStringKeyTopTextOffset:(id)a3 keyplane:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[UIKBRenderFactoryiPadFudge dualStringKeyTopTextOffset:](self, "dualStringKeyTopTextOffset:", -[UIKBRenderFactoryiPadFudge _isFullHeightKeyFor:onKeyplane:](self, "_isFullHeightKeyFor:onKeyplane:", a3, a4));
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)dualStringKeyBottomTextOffset:(id)a3 keyplane:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[UIKBRenderFactoryiPadFudge dualStringKeyBottomTextOffset:](self, "dualStringKeyBottomTextOffset:", -[UIKBRenderFactoryiPadFudge _isFullHeightKeyFor:onKeyplane:](self, "_isFullHeightKeyFor:onKeyplane:", a3, a4));
  result.y = v5;
  result.x = v4;
  return result;
}

- (BOOL)supportsInputTraits:(id)a3 forKeyplane:(id)a4
{
  void *v5;
  void *v6;
  char v7;

  if (objc_msgSend(a3, "keyboardType") == 12)
    return 0;
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferencesActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLForPreferenceKey:", CFSTR("GesturesEnabled"));

  return v7 ^ 1;
}

- (id)lightKeycapsFontName
{
  if (-[UIKBRenderFactory boldTextEnabled](self, "boldTextEnabled"))
    return CFSTR(".PhoneKeyCaps");
  else
    return CFSTR(".KeycapsPadA-Keys");
}

- (unint64_t)_isFullHeightKeyFor:(id)a3 onKeyplane:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  unint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "dynamicLayout"))
  {
    objc_msgSend(v6, "subtreeWithType:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "rowSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subtrees");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    v11 = objc_msgSend(v5, "displayRowHint");

    if (v10 <= v11)
    {
      v19 = 4;
    }
    else
    {
      objc_msgSend(v7, "rowSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "subtrees");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndex:", (int)objc_msgSend(v5, "displayRowHint"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "properties");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", CFSTR("Height"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16 && (objc_msgSend(v16, "doubleValue"), v17 > 0.0) && (objc_msgSend(v16, "doubleValue"), v18 < 1.0))
        v19 = 1;
      else
        v19 = 4;

    }
  }
  else
  {
    objc_msgSend(v6, "frame");
    v21 = v20;

    v22 = v21 / 5.0;
    objc_msgSend(v5, "frame");
    v24 = 2;
    if (v23 > v22)
      v24 = 4;
    if (v23 < v22 * 0.8)
      v19 = 1;
    else
      v19 = v24;
  }

  return v19;
}

- (id)displayContentsForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UIKBRenderFactoryiPadFudge;
  -[UIKBRenderFactoryiPad displayContentsForKey:](&v16, sel_displayContentsForKey_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "displayType") == 23 || objc_msgSend(v4, "interactionType") == 14)
  {
    objc_msgSend(v4, "overrideDisplayString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "setDisplayString:", v6);
    }
    else
    {
      objc_msgSend(v4, "displayString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDisplayString:", v7);

    }
    if (-[UIKBRenderFactory preferStringKeycapOverImage](self, "preferStringKeycapOverImage")
      && objc_msgSend(v4, "state") == 8)
    {
      objc_msgSend(v5, "setDisplayString:", CFSTR("caps lock"));
    }
  }
  else if (objc_msgSend(v4, "displayType") == 7)
  {
    -[UIKBRenderFactory renderingContext](self, "renderingContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "shiftState") == 1)
    {
      objc_msgSend(v4, "secondaryRepresentedStrings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "representedString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

      if ((v12 & 1) == 0)
      {
        objc_msgSend(v5, "secondaryDisplayStrings");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndex:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setDisplayString:", v14);

        objc_msgSend(v5, "setSecondaryDisplayStrings:", 0);
      }
    }
    else
    {

    }
  }
  -[UIKBRenderFactory applyBoldTextForContent:withKey:](self, "applyBoldTextForContent:withKey:", v5, v4);
  if (-[UIKBRenderFactory preferStringKeycapOverImage](self, "preferStringKeycapOverImage"))
    objc_msgSend(v5, "setStringKeycapOverImage:", objc_msgSend(v5, "forceImageKeycap") ^ 1);

  return v5;
}

- (void)_customizeGeometry:(id)a3 forKey:(id)a4 contents:(id)a5
{
  id v8;
  id v9;
  objc_super v10;

  v8 = a3;
  v9 = a4;
  v10.receiver = self;
  v10.super_class = (Class)UIKBRenderFactoryiPadFudge;
  -[UIKBRenderFactoryiPad _customizeGeometry:forKey:contents:](&v10, sel__customizeGeometry_forKey_contents_, v8, v9, a5);
  if (objc_msgSend(v9, "displayType") == 23
    || objc_msgSend(v9, "displayType") == 3
    || objc_msgSend(v9, "displayType") == 21
    || objc_msgSend(v9, "displayType") == 18
    || objc_msgSend(v9, "displayType") == 5)
  {
    objc_msgSend(v9, "paddedFrame");
    objc_msgSend(v8, "setSymbolFrame:");
  }

}

- (double)_row4ControlSegmentWidthLeft
{
  return 0.35;
}

- (double)_row4ControlSegmentWidthRight
{
  void *v2;
  double v3;

  -[UIKBRenderFactory renderingContext](self, "renderingContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = dbl_186680230[objc_msgSend(v2, "keyboardType") == 126];

  return v3;
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  int v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  int v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  UIKBRenderFactoryiPadFudge *v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  void *v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  void *v87;
  void *v88;
  double v89;
  double v90;
  void *v91;
  uint64_t v92;
  void *v93;
  double v94;
  double v95;
  void *v96;
  double v97;
  double v98;
  void *v99;
  void *v101;
  double v102;
  double v103;
  void *v104;
  double v105;
  double v106;
  void *v107;
  void *v108;
  _BOOL8 v109;
  void *v110;
  double v111;
  double v112;
  void *v113;
  void *v114;
  double v115;
  double v116;
  objc_super v117;
  _QWORD v118[2];

  v118[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v117.receiver = self;
  v117.super_class = (Class)UIKBRenderFactoryiPadFudge;
  -[UIKBRenderFactoryiPad _traitsForKey:onKeyplane:](&v117, sel__traitsForKey_onKeyplane_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UIKBRenderFactoryiPadFudge _isFullHeightKeyFor:onKeyplane:](self, "_isFullHeightKeyFor:onKeyplane:", v6, v7);
  v10 = objc_msgSend(v6, "interactionType");
  if ((!objc_msgSend(v6, "displayType") || objc_msgSend(v6, "displayType") == 8)
    && v10 != 9)
  {
    -[UIKBRenderFactoryiPadFudge stringKeyFontSize:](self, "stringKeyFontSize:", v9);
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    v12 = v11;
    objc_msgSend(v8, "symbolStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFontSize:", v12);

    -[UIKBRenderFactory scale](self, "scale");
    if (v14 == 2.0)
      v15 = 0.0;
    else
      v15 = *MEMORY[0x1E0C9D538];
    if (v14 == 2.0)
      v16 = 0.5;
    else
      v16 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    goto LABEL_46;
  }
  if (objc_msgSend(v6, "displayType") == 7)
  {
    objc_msgSend(v8, "symbolStyle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");

    -[UIKBRenderFactoryiPadFudge dualStringKeyBottomFontSize:](self, "dualStringKeyBottomFontSize:", v9);
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    v20 = v19;
    objc_msgSend(v8, "symbolStyle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFontSize:", v20);

    -[UIKBRenderFactoryiPadFudge dualStringKeyBottomTextOffset:](self, "dualStringKeyBottomTextOffset:", v9);
    -[UIKBRenderFactory RivenPointFactor:](self, "RivenPointFactor:");
    v23 = v22;
    v25 = v24;
    objc_msgSend(v8, "symbolStyle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTextOffset:", v23, v25);

    -[UIKBRenderFactoryiPadFudge dualStringKeyTopFontSize:](self, "dualStringKeyTopFontSize:", v9);
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    objc_msgSend(v18, "setFontSize:");
    -[UIKBRenderFactoryiPadFudge dualStringKeyTopTextOffset:](self, "dualStringKeyTopTextOffset:", v9);
    -[UIKBRenderFactory RivenPointFactor:](self, "RivenPointFactor:");
    objc_msgSend(v18, "setTextOffset:");
    if (v18)
    {
      v118[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSecondarySymbolStyles:", v27);

    }
    else
    {
      objc_msgSend(v8, "setSecondarySymbolStyles:", 0);
    }
    if (objc_msgSend(v6, "displayTypeHint") == 10 && objc_msgSend(v6, "state") == 4)
    {
      objc_msgSend(v8, "symbolStyle");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "textOffset");
      v58 = v57;
      objc_msgSend(v8, "symbolStyle");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setTextOffset:", v58, 0.0);

      objc_msgSend(v18, "textOffset");
      objc_msgSend(v18, "setTextOffset:");
    }
    -[UIKBRenderFactory renderingContext](self, "renderingContext");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "shiftState");

    if (v61 != 4)
    {
      -[UIKBRenderFactory renderingContext](self, "renderingContext");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "shiftState");

      if (v63 == 1)
      {
        if (objc_msgSend(v6, "displayRowHint") == 1)
          v64 = 1;
        else
          v64 = 4;
        -[UIKBRenderFactoryiPadFudge stringKeyFontSize:](self, "stringKeyFontSize:", v64);
        -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
        v66 = v65;
        -[UIKBRenderFactoryiPadFudge stringKeyOffset:](self, "stringKeyOffset:", v64);
        -[UIKBRenderFactory RivenPointFactor:](self, "RivenPointFactor:");
        v68 = v67;
        v70 = v69;
        objc_msgSend(v8, "symbolStyle");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setFontSize:", v66);

        objc_msgSend(v8, "symbolStyle");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "setTextOffset:", v68, v70);

        objc_msgSend(v8, "setSecondarySymbolStyles:", 0);
      }
    }
    goto LABEL_47;
  }
  if (objc_msgSend(v6, "displayType") == 3)
  {
    objc_msgSend(v8, "symbolStyle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setUsesSymbolImage:", 1);

    -[UIKBRenderFactoryiPadFudge symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    v30 = v29;
    objc_msgSend(v8, "symbolStyle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFontSizeForSymbolImage:", v30);

    -[UIKBRenderFactoryiPadFudge deleteKeyFontSize](self, "deleteKeyFontSize");
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    v33 = v32;
    objc_msgSend(v8, "symbolStyle");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setFontSize:", v33);

    objc_msgSend(v8, "symbolStyle");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setAnchorCorner:", 8);

    -[UIKBRenderFactoryiPadFudge deleteKeyOffset:](self, "deleteKeyOffset:", v9);
LABEL_44:
    v55 = self;
LABEL_45:
    -[UIKBRenderFactory RivenPointFactor:](v55, "RivenPointFactor:", v36, v37);
    v15 = v94;
    v16 = v95;
LABEL_46:
    objc_msgSend(v8, "symbolStyle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTextOffset:", v15, v16);
LABEL_47:

    goto LABEL_48;
  }
  if (objc_msgSend(v6, "displayType") == 21)
  {
    -[UIKBRenderFactoryiPadFudge controlKeyFontSize](self, "controlKeyFontSize");
    v39 = v38;
    objc_msgSend(v8, "symbolStyle");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setAnchorCorner:", 8);

    -[UIKBRenderFactoryiPadFudge iPadFudgeControlKeyOffset](self, "iPadFudgeControlKeyOffset");
    v42 = v41;
    v44 = v43;
    objc_msgSend(v8, "symbolStyle");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "usesSymbolImage");

    if (v46)
    {
      -[UIKBRenderFactoryiPadFudge symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
      v48 = v47;
      objc_msgSend(v8, "symbolStyle");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setFontSizeForSymbolImage:", v48);

      -[UIKBRenderFactoryiPadFudge symbolImageControlKeyOffset](self, "symbolImageControlKeyOffset");
      v42 = v50;
      v44 = v51;
    }
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", v39);
    v53 = v52;
    objc_msgSend(v8, "symbolStyle");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setFontSize:", v53);

    v55 = self;
    v36 = v42;
    v37 = v44;
    goto LABEL_45;
  }
  if (objc_msgSend(v6, "displayType") == 23)
  {
    objc_msgSend(v8, "symbolStyle");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setUsesSymbolImage:", 1);

    -[UIKBRenderFactoryiPadFudge symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    v75 = v74;
    objc_msgSend(v8, "symbolStyle");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setFontSizeForSymbolImage:", v75);

    if (-[UIKBRenderFactoryiPad _onLeftSide:onKeyplane:](self, "_onLeftSide:onKeyplane:", v6, v7))
      v77 = 4;
    else
      v77 = 8;
    objc_msgSend(v8, "symbolStyle");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setAnchorCorner:", v77);

    goto LABEL_34;
  }
  if (v10 == 9)
  {
    objc_msgSend(v8, "symbolStyle");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setUsesSymbolImage:", 1);

    -[UIKBRenderFactoryiPadFudge symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    v81 = v80;
    objc_msgSend(v8, "symbolStyle");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setFontSizeForSymbolImage:", v81);

    objc_msgSend(v8, "symbolStyle");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setAnchorCorner:", 4);

    -[UIKBRenderFactoryiPadFudge internationalKeyOffset](self, "internationalKeyOffset");
    goto LABEL_44;
  }
  if (objc_msgSend(v6, "displayType") == 4)
  {
    objc_msgSend(v8, "symbolStyle");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setUsesSymbolImage:", 1);

    -[UIKBRenderFactoryiPadFudge symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    v86 = v85;
    objc_msgSend(v8, "symbolStyle");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setFontSizeForSymbolImage:", v86);

    objc_msgSend(v8, "symbolStyle");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setAnchorCorner:", 4);

    -[UIKBRenderFactoryiPadFudge dictationKeyOffset](self, "dictationKeyOffset");
    goto LABEL_44;
  }
  if (objc_msgSend(v6, "displayType") == 18)
  {
    -[UIKBRenderFactoryiPadFudge controlKeyFontSize](self, "controlKeyFontSize");
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    v90 = v89;
    objc_msgSend(v8, "symbolStyle");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setFontSize:", v90);

    if (-[UIKBRenderFactoryiPad _onLeftSide:onKeyplane:](self, "_onLeftSide:onKeyplane:", v6, v7))
      v92 = 4;
    else
      v92 = 8;
    objc_msgSend(v8, "symbolStyle");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setAnchorCorner:", v92);

    -[UIKBRenderFactoryiPadFudge moreKeyOffset](self, "moreKeyOffset");
    goto LABEL_44;
  }
  if (objc_msgSend(v6, "displayType") == 26
    || objc_msgSend(v6, "displayType") == 51
    || objc_msgSend(v6, "interactionType") == 17
    || objc_msgSend(v6, "interactionType") == 12)
  {
    objc_msgSend(v8, "symbolStyle");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "setUsesSymbolImage:", 1);

    -[UIKBRenderFactoryiPadFudge symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    v103 = v102;
    objc_msgSend(v8, "symbolStyle");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "setFontSizeForSymbolImage:", v103);

    -[UIKBRenderFactoryiPadFudge controlKeyFontSize](self, "controlKeyFontSize");
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    v106 = v105;
    objc_msgSend(v8, "symbolStyle");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "setFontSize:", v106);

    objc_msgSend(v8, "symbolStyle");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "setAnchorCorner:", 4);

LABEL_34:
    -[UIKBRenderFactoryiPadFudge iPadFudgeControlKeyOffset](self, "iPadFudgeControlKeyOffset");
    goto LABEL_44;
  }
  if (objc_msgSend(v6, "displayType") == 5 || objc_msgSend(v6, "displayType") == 53)
  {
    v109 = objc_msgSend(v6, "displayType") == 5;
    objc_msgSend(v8, "symbolStyle");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setUsesSymbolImage:", v109);

    -[UIKBRenderFactoryiPadFudge symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    v112 = v111;
    objc_msgSend(v8, "symbolStyle");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "setFontSizeForSymbolImage:", v112);

    objc_msgSend(v8, "symbolStyle");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "setAnchorCorner:", 8);

    -[UIKBRenderFactoryiPadFudge dismissKeyOffset](self, "dismissKeyOffset");
    goto LABEL_44;
  }
  if (objc_msgSend(v6, "displayType") == 27)
  {
    -[UIKBRenderFactoryiPadFudge deleteKeyFontSize](self, "deleteKeyFontSize");
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    v116 = v115;
    objc_msgSend(v8, "symbolStyle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFontSize:", v116);
    goto LABEL_47;
  }
LABEL_48:
  objc_msgSend(v8, "symbolStyle");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = 1.0;
  if ((objc_msgSend(v96, "usesSymbolImage") & 1) == 0)
  {
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", 100.0);
    v97 = v98 / 100.0;
  }
  objc_msgSend(v8, "symbolStyle");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setImageScale:", v97);

  return v8;
}

@end
