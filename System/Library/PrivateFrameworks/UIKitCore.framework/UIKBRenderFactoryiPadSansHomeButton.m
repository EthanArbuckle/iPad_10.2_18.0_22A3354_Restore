@implementation UIKBRenderFactoryiPadSansHomeButton

- (BOOL)iPadSansHomeButtonLayout
{
  return 1;
}

- (CGPoint)iPadFudgeControlKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 10.0;
  v3 = 9.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)symbolImageControlKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 10.0;
  v3 = 9.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)controlKeyFontSize
{
  return 15.0;
}

- (double)keyCornerRadius
{
  return 5.0;
}

- (double)stringKeyFontSize
{
  double result;

  -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", 22.0);
  return result;
}

- (double)symbolImageControlKeyFontSize
{
  return 23.0;
}

- (double)dualStringKeyBottomFontSize
{
  return 20.0;
}

- (CGPoint)dualStringKeyBottomTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 9.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)dualStringKeyTopFontSize
{
  return 20.0;
}

- (CGPoint)dualStringKeyTopTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = -9.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)_displaysAsControlKeyStyle:(id)a3
{
  id v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  unsigned int v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "displayType");
  v5 = (v4 < 0x34) & (0x8000004A42038uLL >> v4);
  v6 = objc_msgSend(v3, "interactionType");

  v7 = (0x80000109 >> (v6 - 9)) | v5;
  if ((v6 - 9) > 0x1F)
    LOBYTE(v7) = v5;
  return v7 & 1;
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  objc_super v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v49.receiver = self;
  v49.super_class = (Class)UIKBRenderFactoryiPadSansHomeButton;
  -[UIKBRenderFactoryiPad _traitsForKey:onKeyplane:](&v49, sel__traitsForKey_onKeyplane_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIKBRenderFactoryiPadSansHomeButton _displaysAsControlKeyStyle:](self, "_displaysAsControlKeyStyle:", v6))
  {
    -[UIKBRenderFactoryiPadSansHomeButton iPadFudgeControlKeyOffset](self, "iPadFudgeControlKeyOffset");
    v10 = v9;
    v12 = v11;
    -[UIKBRenderFactoryiPadSansHomeButton controlKeyFontSize](self, "controlKeyFontSize");
    v14 = v13;
    objc_msgSend(v8, "symbolStyle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "usesSymbolImage");

    if (v16)
    {
      -[UIKBRenderFactoryiPadSansHomeButton symbolImageControlKeyOffset](self, "symbolImageControlKeyOffset");
      v10 = v17;
      v12 = v18;
      -[UIKBRenderFactoryiPadSansHomeButton symbolImageControlKeyFontSize](self, "symbolImageControlKeyFontSize");
      -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
      v20 = v19;
      objc_msgSend(v8, "symbolStyle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFontSizeForSymbolImage:", v20);

      v22 = *(double *)off_1E167DC60;
      objc_msgSend(v8, "symbolStyle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setFontWeightForSymbolImage:", v22);

    }
    -[UIKBRenderFactory RivenPointFactor:](self, "RivenPointFactor:", v10, v12);
    v25 = v24;
    v27 = v26;
    objc_msgSend(v8, "symbolStyle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTextOffset:", v25, v27);

    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", v14);
    v30 = v29;
    objc_msgSend(v8, "symbolStyle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFontSize:", v30);

    if (-[UIKBRenderFactoryiPad _onLeftSide:onKeyplane:](self, "_onLeftSide:onKeyplane:", v6, v7))
      v32 = 4;
    else
      v32 = 8;
    objc_msgSend(v8, "symbolStyle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setAnchorCorner:", v32);
LABEL_14:

    goto LABEL_15;
  }
  if (objc_msgSend(v6, "displayType") == 7)
  {
    objc_msgSend(v8, "symbolStyle");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v34, "copy");

    -[UIKBRenderFactoryiPadSansHomeButton dualStringKeyBottomFontSize](self, "dualStringKeyBottomFontSize");
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    v36 = v35;
    objc_msgSend(v8, "symbolStyle");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setFontSize:", v36);

    -[UIKBRenderFactoryiPadSansHomeButton dualStringKeyBottomTextOffset](self, "dualStringKeyBottomTextOffset");
    -[UIKBRenderFactory RivenPointFactor:](self, "RivenPointFactor:");
    v39 = v38;
    v41 = v40;
    objc_msgSend(v8, "symbolStyle");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setTextOffset:", v39, v41);

    objc_msgSend(v33, "setFontWeight:", *(double *)off_1E167DC50);
    -[UIKBRenderFactoryiPadSansHomeButton dualStringKeyTopFontSize](self, "dualStringKeyTopFontSize");
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
    objc_msgSend(v33, "setFontSize:");
    -[UIKBRenderFactoryiPadSansHomeButton dualStringKeyTopTextOffset](self, "dualStringKeyTopTextOffset");
    -[UIKBRenderFactory RivenPointFactor:](self, "RivenPointFactor:");
    objc_msgSend(v33, "setTextOffset:");
    if (objc_msgSend(v6, "displayTypeHint") == 10 && objc_msgSend(v6, "state") == 4)
    {
      objc_msgSend(v8, "symbolStyle");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "textOffset");
      v45 = v44;
      objc_msgSend(v8, "symbolStyle");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setTextOffset:", v45, 3.0);

      objc_msgSend(v33, "textOffset");
      objc_msgSend(v33, "setTextOffset:");
    }
    if (v33)
    {
      v50[0] = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSecondarySymbolStyles:", v47);

    }
    goto LABEL_14;
  }
LABEL_15:

  return v8;
}

- (void)_customizeGeometry:(id)a3 forKey:(id)a4 contents:(id)a5
{
  id v8;
  id v9;
  objc_super v10;

  v8 = a3;
  v9 = a4;
  v10.receiver = self;
  v10.super_class = (Class)UIKBRenderFactoryiPadSansHomeButton;
  -[UIKBRenderFactoryiPad _customizeGeometry:forKey:contents:](&v10, sel__customizeGeometry_forKey_contents_, v8, v9, a5);
  if (-[UIKBRenderFactoryiPadSansHomeButton _displaysAsControlKeyStyle:](self, "_displaysAsControlKeyStyle:", v9))
  {
    objc_msgSend(v9, "paddedFrame");
    objc_msgSend(v8, "setSymbolFrame:");
  }

}

- (id)displayContentsForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIKBRenderFactoryiPadSansHomeButton;
  -[UIKBRenderFactoryiPad displayContentsForKey:](&v9, sel_displayContentsForKey_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIKBRenderFactory preferStringKeycapOverImage](self, "preferStringKeycapOverImage"))
    objc_msgSend(v5, "setStringKeycapOverImage:", objc_msgSend(v5, "forceImageKeycap") ^ 1);
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

  return v5;
}

@end
