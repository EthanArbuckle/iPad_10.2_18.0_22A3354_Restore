@implementation UIKBRenderFactory_CarLinear

- (double)carKeyRadius
{
  double v2;

  -[UIKBRenderFactory_Car carScale](self, "carScale");
  return 8.0 / v2;
}

- (double)defaultKeyFontSize
{
  double v2;

  -[UIKBRenderFactory_Car carScale](self, "carScale");
  return 32.0 / v2;
}

- (double)letterLineFontSize
{
  double v2;

  -[UIKBRenderFactory_Car carScale](self, "carScale");
  return 18.0 / v2;
}

- (double)activeLetterFontSize
{
  double v2;

  -[UIKBRenderFactory_Car carScale](self, "carScale");
  return 40.0 / v2;
}

- (id)lightTextFontName
{
  return CFSTR("UIKBRenderFactorySystemFontName");
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
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
  void *v33;
  double MidX;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  uint64_t v40;
  BOOL v41;
  uint64_t v42;
  double MaxX;
  double v44;
  double v45;
  void *v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  uint64_t i;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  double v74;
  UIKBRenderFactory_CarLinear *v75;
  id v76;
  objc_super v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;

  v6 = a3;
  v7 = a4;
  v77.receiver = self;
  v77.super_class = (Class)UIKBRenderFactory_CarLinear;
  -[UIKBRenderFactory_Car _traitsForKey:onKeyplane:](&v77, sel__traitsForKey_onKeyplane_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "geometry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRoundRectCorners:", -1);

  -[UIKBRenderFactory_CarLinear carKeyRadius](self, "carKeyRadius");
  v11 = v10;
  objc_msgSend(v8, "geometry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRoundRectRadius:", v11);

  if ((objc_msgSend(v6, "state") & 0xC) != 0)
    -[UIKBRenderFactory_Car highlightedKeyColor](self, "highlightedKeyColor");
  else
    -[UIKBRenderFactory_Car activeKeyColor](self, "activeKeyColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "symbolStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextColor:", v13);

  if (objc_msgSend(v6, "interactionType") == 9)
  {
    objc_msgSend(v8, "geometry");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = 5;
LABEL_9:
    objc_msgSend(v15, "setRoundRectCorners:", v17);

    goto LABEL_10;
  }
  if (objc_msgSend(v6, "interactionType") == 15)
  {
    objc_msgSend(v7, "firstCachedKeyWithName:", CFSTR("International-Key"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "visible");

    if (v19)
    {
      objc_msgSend(v8, "geometry");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = 10;
      goto LABEL_9;
    }
  }
LABEL_10:
  if (objc_msgSend(v6, "displayType") == 38)
  {
    -[UIKBRenderFactory_Car enabledKeyColor](self, "enabledKeyColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundGradient:", v21);

    objc_msgSend(v8, "geometry");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "paddedFrame");
    v74 = v23;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    -[UIKBRenderFactory_CarLinear carKeyRadius](self, "carKeyRadius");
    v31 = v27 - v30;
    v32 = floor(v31 * 0.095);
    objc_msgSend(v8, "geometry");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "paddedFrame");
    MidX = CGRectGetMidX(v78);
    objc_msgSend(v7, "frame");
    v35 = CGRectGetMidX(v79);

    v36 = 0.0;
    if (MidX < v35)
    {
      -[UIKBRenderFactory_CarLinear carKeyRadius](self, "carKeyRadius");
      v36 = v37;
    }
    v76 = v7;
    v38 = v32 * 0.2;
    objc_msgSend(v6, "subtrees");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "count");

    v75 = self;
    v41 = (objc_msgSend(v6, "selectedVariantIndex") & 0x8000000000000000) == 0
       && objc_msgSend(v6, "selectedVariantIndex") < v40;
    v42 = objc_msgSend(v6, "selectedVariantIndex");
    v80.origin.x = v74;
    v80.origin.y = v25;
    v80.size.width = v31;
    v80.size.height = v29;
    MaxX = CGRectGetMaxX(v80);
    v44 = v32;
    if (v41)
      v45 = v38 + v38 - v32 + -2.0;
    else
      v45 = -0.0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v40);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40 >= 1)
    {
      v47 = 0;
      v48 = v74 + v36;
      v49 = (v45 + MaxX - (v74 + v36) - v38) / (double)v40;
      v50 = -0.0;
      if (v42)
        v50 = v38;
      v51 = v48 + v50;
      do
      {
        if (v47 == objc_msgSend(v6, "selectedVariantIndex"))
          v52 = v44;
        else
          v52 = v49;
        +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", v51, v25, v52, v29, v51, v25, v52, v29);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "symbolFrame");
        objc_msgSend(v53, "setSymbolFrame:", v54 + -2.0, v56 + 0.0, v55 + 4.0);
        objc_msgSend(v46, "addObject:", v53);
        v57 = -0.0;
        if (!(v47 | v42))
          v57 = v38;
        v51 = v52 + v51 + v57;

        ++v47;
      }
      while (v40 != v47);
    }
    objc_msgSend(v8, "setVariantGeometries:", v46);
    if (v40)
    {
      for (i = 0; i != v40; ++i)
      {
        objc_msgSend(v6, "subtrees");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "objectAtIndex:", i);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "variantGeometries");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "objectAtIndex:", i);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "similarShape");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "setShape:", v63);

      }
    }
    -[UIKBRenderFactory_CarLinear lightTextFontName](v75, "lightTextFontName");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderFactory_CarLinear letterLineFontSize](v75, "letterLineFontSize");
    +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKBRenderFactory_Car activeKeyColor](v75, "activeKeyColor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setTextColor:", v66);

    +[UIKBRenderTraits traitsWithSymbolStyle:](UIKBRenderTraits, "traitsWithSymbolStyle:", v65);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setVariantTraits:", v67);

    -[UIKBRenderFactory_CarLinear activeLetterFontSize](v75, "activeLetterFontSize");
    +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", 0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderFactory_Car highlightedKeyColor](v75, "highlightedKeyColor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setTextColor:", v69);

    objc_msgSend(v68, "setTextOffset:", 0.0, 2.0);
    +[UIKBRenderTraits traitsWithSymbolStyle:](UIKBRenderTraits, "traitsWithSymbolStyle:", v68);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRenderFactory_Car activeKeyColor](v75, "activeKeyColor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setLayeredForegroundGradient:", v72);

    objc_msgSend(v8, "setHighlightedVariantTraits:", v70);
    v7 = v76;
  }

  return v8;
}

- (void)setupLayoutSegments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  +[UIKBRenderGeometry geometryWithShape:](UIKBRenderGeometry, "geometryWithShape:", 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRoundRectCorners:", 5);
  +[UIKBRenderTraits traitsWithGeometry:](UIKBRenderTraits, "traitsWithGeometry:", v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addLayoutRect:asTriangle:", 0, 0.0, 0.0, 0.5, 0.5);
  -[UIKBRenderFactory addLayoutSegment:](self, "addLayoutSegment:", v4);
  +[UIKBRenderGeometry geometryWithShape:](UIKBRenderGeometry, "geometryWithShape:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRoundRectCorners:", 10);
  +[UIKBRenderTraits traitsWithGeometry:](UIKBRenderTraits, "traitsWithGeometry:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addLayoutRect:asTriangle:", 0, 0.5, 0.0, 0.5, 0.5);
  -[UIKBRenderFactory addLayoutSegment:](self, "addLayoutSegment:", v7);

}

@end
