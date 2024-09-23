@implementation UIKBRenderFactory_Candidates

- (int64_t)lightHighQualityEnabledBlendForm
{
  return 2;
}

- (UIKBRenderFactory_Candidates)initWithRenderingContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIKBRenderFactory_Candidates;
  return -[UIKBRenderFactory initWithRenderingContext:skipLayoutSegments:](&v4, sel_initWithRenderingContext_skipLayoutSegments_, a3, 1);
}

- (id)traitsForHWRCellSize:(CGSize)a3 highlighted:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  int v23;
  __CFString **v24;
  __CFString *v25;
  void *v26;
  int v27;
  __CFString **v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  int64_t v33;
  void *v34;
  int v35;
  id *v36;
  __CFString **v37;
  __CFString **v38;
  id v39;
  void *v40;
  id *v41;
  id v42;
  void *v43;
  void *v44;
  _QWORD v46[3];
  _QWORD v47[4];

  v4 = a4;
  height = a3.height;
  width = a3.width;
  v47[3] = *MEMORY[0x1E0C80C00];
  +[UIKBRenderTraits emptyTraits](UIKBRenderTraits, "emptyTraits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), width, height, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), width, height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGeometry:", v9);

  -[UIKBRenderFactory translucentGapWidth](self, "translucentGapWidth");
  v11 = v10;
  objc_msgSend(v8, "geometry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "paddedFrame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19 - v11;
  objc_msgSend(v8, "geometry");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPaddedFrame:", v14, v16, v20, v18);

  if (-[UIKBRenderFactory assetIdiom](self, "assetIdiom") != 1
    && -[UIKBRenderFactory assetIdiom](self, "assetIdiom") != 24
    && -[UIKBRenderFactory assetIdiom](self, "assetIdiom") != 25
    && -[UIKBRenderFactory assetIdiom](self, "assetIdiom") != 26
    && -[UIKBRenderFactory assetIdiom](self, "assetIdiom") != 23)
  {
    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "whiteText");
    v24 = UIKBColorWhite_Alpha10;
    if (!v23)
      v24 = UIKBColorBlack_Alpha10;
    v25 = *v24;

    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "whiteText");
    v28 = UIKBColorWhite_Alpha0;
    if (!v27)
      v28 = UIKBColorClear;
    v29 = *v28;

    v47[0] = v25;
    v47[1] = v25;
    v47[2] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBGradient gradientWith3Colors:middleLocation:](UIKBGradient, "gradientWith3Colors:middleLocation:", v30, 0.5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", 0, 8, -v11, v11);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "setGradient:", v31);
    objc_msgSend(v8, "addRenderEffect:", v32);

  }
  if (v4)
  {
    v33 = +[UIKBRenderFactory _graphicsQuality](UIKBRenderFactory, "_graphicsQuality");
    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "lightKeyboard");
    v36 = (id *)UIKBColorHWRCellLightBackground;
    v37 = UIKBDarkLowQualityHWRCandidateCellHighlightedBackgroundGradientStart;
    if (v33 == 10)
    {
      v38 = UIKBDarkLowQualityHWRCandidateCellHighlightedBackgroundGradientEnd;
    }
    else
    {
      v37 = UIKBColorHWRCellDarkBackground;
      v38 = UIKBColorHWRCellDarkBackgroundClear;
    }
    if (!v35)
      v36 = (id *)v37;
    v39 = *v36;

    -[UIKBRenderFactory renderConfig](self, "renderConfig");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v40, "lightKeyboard"))
      v41 = (id *)UIKBColorHWRCellLightBackgroundClear;
    else
      v41 = (id *)v38;
    v42 = *v41;

    v46[0] = v39;
    v46[1] = v39;
    v46[2] = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 3);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBGradient gradientWith3Colors:middleLocation:](UIKBGradient, "gradientWith3Colors:middleLocation:", v43, 0.5);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundGradient:", v44);

  }
  return v8;
}

@end
