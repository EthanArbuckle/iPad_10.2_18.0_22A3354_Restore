@implementation SBPIPContentViewLayoutSettings

+ (id)pipDefaults
{
  if (pipDefaults_sOnceToken != -1)
    dispatch_once(&pipDefaults_sOnceToken, &__block_literal_global_341);
  return (id)pipDefaults_sPIPDefaults;
}

void __45__SBPIPContentViewLayoutSettings_pipDefaults__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0DA9FC0]);
  v1 = (void *)pipDefaults_sPIPDefaults;
  pipDefaults_sPIPDefaults = (uint64_t)v0;

}

- (SBPIPContentViewLayoutSettings)initWithPlatformMetrics:(id)a3 contentSize:(CGSize)a4
{
  double height;
  double width;
  id v8;
  SBPIPContentViewLayoutSettings *v9;
  SBPIPContentViewLayoutSettings *v10;
  uint64_t v11;
  SBPIPDefaults *pipDefaults;
  SBPIPContentViewLayoutContext *v13;
  SBPIPContentViewLayoutContext *context;
  objc_super v16;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBPIPContentViewLayoutSettings;
  v9 = -[SBPIPContentViewLayoutSettings init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_platformMetrics, a3);
    +[SBPIPContentViewLayoutSettings pipDefaults](SBPIPContentViewLayoutSettings, "pipDefaults");
    v11 = objc_claimAutoreleasedReturnValue();
    pipDefaults = v10->_pipDefaults;
    v10->_pipDefaults = (SBPIPDefaults *)v11;

    v13 = -[SBPIPContentViewLayoutContext initWithPlatformMetrics:contentSize:defaults:]([SBPIPContentViewLayoutContext alloc], "initWithPlatformMetrics:contentSize:defaults:", v8, v10->_pipDefaults, width, height);
    context = v10->_context;
    v10->_context = v13;

  }
  return v10;
}

- (id)platformMetrics
{
  return self->_platformMetrics;
}

- (void)updatePlatformMetrics:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_platformMetrics, a3);
  v5 = a3;
  -[SBPIPContentViewLayoutContext updatePlatformMetrics:](self->_context, "updatePlatformMetrics:", v5);

}

- (void)setContentViewSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
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
  double v23;
  double v24;
  double v25;
  BOOL v26;
  double v27;
  double v28;
  double v29;
  BOOL v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;

  height = a3.height;
  if (a3.width >= a3.height)
    width = a3.width;
  else
    width = a3.height;
  if (a3.width == 0.0)
    v6 = 1.0;
  else
    v6 = a3.width;
  -[SBPIPContentViewLayoutContext currentSize](self->_context, "currentSize");
  if (v7 != width)
  {
    v8 = height / v6;
    -[SBPIPContentViewLayoutMetrics sizePolicy](self->_platformMetrics, "sizePolicy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sizePreferencesForAspectRatio:", v8);
    v40 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v40, "longSideDefaultSize");
    v39 = v10;
    objc_msgSend(v40, "longSideMinimumSize");
    v12 = v11;
    objc_msgSend(v40, "longSideMaximumSize");
    v14 = v13;
    v15 = v13 - v12;
    -[SBPIPContentViewLayoutContext minimumSizeSpanBetweenPreferredSizes](self->_context, "minimumSizeSpanBetweenPreferredSizes");
    v17 = v16;
    -[SBPIPContentViewLayoutContext maximumSizeSpanForPreferredSizeTuning](self->_context, "maximumSizeSpanForPreferredSizeTuning");
    v19 = v18;
    -[SBPIPContentViewLayoutContext currentSize](self->_context, "currentSize");
    v21 = v20;
    -[SBPIPContentViewLayoutContext maximumSizePreference](self->_context, "maximumSizePreference");
    v23 = v22;
    -[SBPIPContentViewLayoutContext minimumSizePreference](self->_context, "minimumSizePreference");
    v25 = (width - v24) / v15;
    v26 = v25 < v19;
    if (v25 >= v19)
      v27 = width;
    else
      v27 = v23;
    if (v26)
      v28 = width;
    else
      v28 = v24;
    v29 = (v23 - width) / v15;
    v30 = v29 < v19;
    if (v29 >= v19)
      v31 = v23;
    else
      v31 = width;
    if (v30)
      v32 = v24;
    else
      v32 = width;
    if (width < v21)
    {
      v27 = v31;
      v28 = v32;
    }
    if (v27 > v28 && vabdd_f64(v27, v28) / v15 >= v17)
    {
      v23 = v27;
      v27 = v28;
    }
    if (v27 >= v23 || vabdd_f64(v23, v27) / v15 < v17)
    {
      v23 = v27;
      v27 = v24;
    }
    -[SBPIPContentViewLayoutContext setMinimumSizePreference:](self->_context, "setMinimumSizePreference:", v27);
    -[SBPIPContentViewLayoutContext setMaximumSizePreference:](self->_context, "setMaximumSizePreference:", v23);
    -[SBPIPContentViewLayoutContext maximumSizePreference](self->_context, "maximumSizePreference");
    v34 = v33;
    -[SBPIPContentViewLayoutContext minimumSizePreference](self->_context, "minimumSizePreference");
    if (vabdd_f64(v34, v35) / v15 < v17)
      -[SBPIPContentViewLayoutContext setMaximumSizePreference:](self->_context, "setMaximumSizePreference:", v14);
    -[SBPIPContentViewLayoutContext maximumSizePreference](self->_context, "maximumSizePreference");
    v37 = v36;
    -[SBPIPContentViewLayoutContext minimumSizePreference](self->_context, "minimumSizePreference");
    if (vabdd_f64(v37, v38) / v15 < v17)
      -[SBPIPContentViewLayoutContext setMinimumSizePreference:](self->_context, "setMinimumSizePreference:", v39);
    -[SBPIPContentViewLayoutContext setCurrentSize:forAspectRatio:](self->_context, "setCurrentSize:forAspectRatio:", width, v8);

  }
}

- (void)setMinimumSizeSpanBetweenPreferredSizes:(double)a3
{
  -[SBPIPContentViewLayoutContext setMinimumSizeSpanBetweenPreferredSizes:](self->_context, "setMinimumSizeSpanBetweenPreferredSizes:", a3);
}

- (void)setMaximumSizeSpanForPreferredSizeTuning:(double)a3
{
  -[SBPIPContentViewLayoutContext setMaximumSizeSpanForPreferredSizeTuning:](self->_context, "setMaximumSizeSpanForPreferredSizeTuning:", a3);
}

- (CGSize)defaultContentViewSizeForAspectRatio:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  int v11;
  SBPIPContentViewLayoutContext *context;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  +[SBPIPSettingsDomain rootSettings](SBPIPSettingsDomain, "rootSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interactionSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "alwaysStartAtSmallestSize");

  if (v8)
  {
    -[SBPIPContentViewLayoutSettings minimumPossibleContentViewSizeForAspectRatio:](self, "minimumPossibleContentViewSizeForAspectRatio:", width, height);
  }
  else
  {
    v11 = -[SBPIPDefaults initiallyUsesMinimumPreferredContentSize](self->_pipDefaults, "initiallyUsesMinimumPreferredContentSize");
    context = self->_context;
    if (v11)
      -[SBPIPContentViewLayoutContext minimumSizePreference](context, "minimumSizePreference");
    else
      -[SBPIPContentViewLayoutContext currentSize](context, "currentSize");
    -[SBPIPContentViewLayoutSettings _contentViewSizeForAspectRatio:currentSize:](self, "_contentViewSizeForAspectRatio:currentSize:", width, height, v13);
  }
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)_contentViewSizeForAspectRatio:(CGSize)a3 currentSize:(double)a4
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _BOOL4 v19;
  double v20;
  _BOOL4 v21;
  double v22;
  double v23;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SBPIPContentViewLayoutSettings minimumPossibleContentViewSizeForAspectRatio:](self, "minimumPossibleContentViewSizeForAspectRatio:");
  v9 = v8;
  v11 = v10;
  -[SBPIPContentViewLayoutSettings maximumPossibleContentViewSizeForAspectRatio:](self, "maximumPossibleContentViewSizeForAspectRatio:", width, height);
  if (width == 0.0 || height == 0.0)
  {
    v22 = a4;
  }
  else
  {
    v14 = v12;
    v15 = v13;
    UIRoundToScale();
    v17 = v16;
    UIRoundToScale();
    v19 = v18 < v11;
    if (v17 < v9)
      v19 = 1;
    if (v19)
    {
      v18 = v11;
      v20 = v9;
    }
    else
    {
      v20 = v17;
    }
    v21 = v18 > v15;
    if (v20 > v14)
      v21 = 1;
    if (v21)
      v22 = v15;
    else
      v22 = v18;
    if (v21)
      a4 = v14;
    else
      a4 = v20;
  }
  v23 = a4;
  result.height = v22;
  result.width = v23;
  return result;
}

- (CGSize)currentContentViewSizeForAspectRatio:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SBPIPContentViewLayoutContext currentSize](self->_context, "currentSize");
  -[SBPIPContentViewLayoutSettings _contentViewSizeForAspectRatio:currentSize:](self, "_contentViewSizeForAspectRatio:currentSize:", width, height, v6);
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)minimumPossibleContentViewSizeForAspectRatio:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SBPIPContentViewLayoutMetrics sizePolicy](self->_platformMetrics, "sizePolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = 1.0;
  if (width != 0.0)
    v8 = width;
  objc_msgSend(v6, "sizePreferencesForAspectRatio:", height / v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "longSideMinimumSize");
  -[SBPIPContentViewLayoutSettings _minimumContentViewSizeForAspectRatio:minimumReferenceSize:](self, "_minimumContentViewSizeForAspectRatio:minimumReferenceSize:", width, height, v10);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)maximumPossibleContentViewSizeForAspectRatio:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SBPIPContentViewLayoutMetrics sizePolicy](self->_platformMetrics, "sizePolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = 1.0;
  if (width != 0.0)
    v8 = width;
  objc_msgSend(v6, "sizePreferencesForAspectRatio:", height / v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "longSideMaximumSize");
  -[SBPIPContentViewLayoutSettings _maximumContentViewSizeForAspectRatio:maximumReferenceSize:](self, "_maximumContentViewSizeForAspectRatio:maximumReferenceSize:", width, height, v10);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)minimumPreferredContentViewSizeForAspectRatio:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SBPIPContentViewLayoutContext minimumSizePreference](self->_context, "minimumSizePreference");
  -[SBPIPContentViewLayoutSettings _minimumContentViewSizeForAspectRatio:minimumReferenceSize:](self, "_minimumContentViewSizeForAspectRatio:minimumReferenceSize:", width, height, v6);
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)maximumPreferredContentViewSizeForAspectRatio:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SBPIPContentViewLayoutContext maximumSizePreference](self->_context, "maximumSizePreference");
  -[SBPIPContentViewLayoutSettings _maximumContentViewSizeForAspectRatio:maximumReferenceSize:](self, "_maximumContentViewSizeForAspectRatio:maximumReferenceSize:", width, height, v6);
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)_minimumContentViewSizeForAspectRatio:(CGSize)a3 minimumReferenceSize:(double)a4
{
  double v4;
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  v4 = a4;
  if (a3.width == 0.0 || (height = a3.height, a3.height == 0.0))
  {
    v10 = a4;
  }
  else
  {
    width = a3.width;
    UIRoundToScale();
    v4 = v8;
    UIRoundToScale();
    v10 = v9;
    -[SBPIPContentViewLayoutMetrics sizePolicy](self->_platformMetrics, "sizePolicy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sizePreferencesForAspectRatio:", height / width);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "shortSideMinimumSize");
    v14 = v13;
    if (v4 >= v10)
    {
      if (v10 < v13)
      {
        UIRoundToScale();
        v4 = v16;
        v10 = v14;
      }
    }
    else if (v4 < v13)
    {
      UIRoundToScale();
      v10 = v15;
      v4 = v14;
    }

  }
  v17 = v4;
  v18 = v10;
  result.height = v18;
  result.width = v17;
  return result;
}

- (CGSize)_maximumContentViewSizeForAspectRatio:(CGSize)a3 maximumReferenceSize:(double)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v4 = a4;
  if (a3.width == 0.0 || a3.height == 0.0)
  {
    v7 = a4;
  }
  else
  {
    UIRoundToScale();
    v4 = v5;
    UIRoundToScale();
    v7 = v6;
  }
  v8 = v4;
  result.height = v7;
  result.width = v8;
  return result;
}

- (CGSize)minimumStashedTabSize
{
  double v2;
  double v3;
  CGSize result;

  -[SBPIPContentViewLayoutMetrics minimumStashedTabSize](self->_platformMetrics, "minimumStashedTabSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setContentViewPosition:(unint64_t)a3
{
  SBPIPDefaults *pipDefaults;
  id v5;

  pipDefaults = self->_pipDefaults;
  -[SBPIPContentViewLayoutMetrics contentTypeIdentifier](self->_platformMetrics, "contentTypeIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBPIPDefaults setLastKnownCornerPosition:contentType:](pipDefaults, "setLastKnownCornerPosition:contentType:", a3, v5);

}

- (unint64_t)currentContentViewPosition
{
  SBPIPDefaults *pipDefaults;
  void *v4;
  unint64_t v5;

  pipDefaults = self->_pipDefaults;
  -[SBPIPContentViewLayoutMetrics contentTypeIdentifier](self->_platformMetrics, "contentTypeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBPIPDefaults lastKnownCornerPositionForContentType:](pipDefaults, "lastKnownCornerPositionForContentType:", v4);

  if (-[SBPIPContentViewLayoutMetrics prefersDefaultPosition](self->_platformMetrics, "prefersDefaultPosition"))
    return -[SBPIPContentViewLayoutMetrics defaultPosition](self->_platformMetrics, "defaultPosition");
  else
    return v5;
}

- (double)contentViewPadding
{
  double result;

  -[SBPIPContentViewLayoutMetrics padding](self->_platformMetrics, "padding");
  return result;
}

- (double)contentViewPaddingWhileStashed
{
  double result;

  -[SBPIPContentViewLayoutMetrics paddingWhileStashed](self->_platformMetrics, "paddingWhileStashed");
  return result;
}

- (double)defaultCornerRadius
{
  double result;

  -[SBPIPContentViewLayoutMetrics defaultCornerRadius](self->_platformMetrics, "defaultCornerRadius");
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipDefaults, 0);
  objc_storeStrong((id *)&self->_platformMetrics, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
