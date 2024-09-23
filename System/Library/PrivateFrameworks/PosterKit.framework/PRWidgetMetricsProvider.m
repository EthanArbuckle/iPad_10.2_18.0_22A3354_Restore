@implementation PRWidgetMetricsProvider

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_42);
  return (id)sharedInstance_widgetMetricsProvider;
}

void __41__PRWidgetMetricsProvider_sharedInstance__block_invoke()
{
  PRWidgetMetricsProvider *v0;
  void *v1;

  v0 = objc_alloc_init(PRWidgetMetricsProvider);
  v1 = (void *)sharedInstance_widgetMetricsProvider;
  sharedInstance_widgetMetricsProvider = (uint64_t)v0;

}

- (id)lockScreenWidgetMetricsSpecifications
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0D100D0]);
  -[PRWidgetMetricsProvider _complicationCircularMetrics](self, "_complicationCircularMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMetrics:forFamily:", v4, 10);

  -[PRWidgetMetricsProvider _complicationRectangularMetrics](self, "_complicationRectangularMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMetrics:forFamily:", v5, 11);

  -[PRWidgetMetricsProvider _complicationInlineMetrics](self, "_complicationInlineMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMetrics:forFamily:", v6, 12);

  -[PRWidgetMetricsProvider _transparentMediumMetrics](self, "_transparentMediumMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMetrics:forFamily:", v7, 5);

  -[PRWidgetMetricsProvider _systemSmallMetrics](self, "_systemSmallMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMetrics:forFamily:", v8, 1);

  return v3;
}

- (id)systemMetricsForWidget:(id)a3
{
  uint64_t v4;
  void *v5;

  v4 = objc_msgSend(a3, "family");
  if (v4 > 10)
  {
    if (v4 == 11)
    {
      -[PRWidgetMetricsProvider _complicationRectangularMetrics](self, "_complicationRectangularMetrics");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    if (v4 == 12)
    {
      -[PRWidgetMetricsProvider _complicationInlineMetrics](self, "_complicationInlineMetrics");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
LABEL_8:
    -[PRWidgetMetricsProvider _transparentMediumMetrics](self, "_transparentMediumMetrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  if (v4 == 1)
  {
    -[PRWidgetMetricsProvider _systemSmallMetrics](self, "_systemSmallMetrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  if (v4 != 10)
    goto LABEL_8;
  -[PRWidgetMetricsProvider _complicationCircularMetrics](self, "_complicationCircularMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (CHSEdgeInsets)_edgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  CHSEdgeInsets result;

  objc_msgSend(MEMORY[0x1E0D1BC88], "complicationEdgeInset");
  CHSEdgeInsetsMake();
  result.var3 = v5;
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (double)_scaleFactor
{
  void *v2;
  uint64_t v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  v4 = 1.0;
  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nativeScale");
    v4 = v7 / v9;

  }
  return v4;
}

- (CGSize)_sizeForItemWithGridWidth:(int64_t)a3 height:(int64_t)a4
{
  double v7;
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
  double v19;
  double v20;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0D1BC88], "complicationEdgeInset");
  v8 = v7 + v7;
  objc_msgSend(MEMORY[0x1E0D1BC88], "interComplicationSpacing");
  v10 = v9 * (double)(a3 - 1);
  objc_msgSend(MEMORY[0x1E0D1BC88], "gridUnitSize");
  v12 = v8 + v10 + v11 * (double)a3;
  objc_msgSend(MEMORY[0x1E0D1BC88], "interComplicationSpacing");
  v14 = v13 * (double)(a4 - 1);
  objc_msgSend(MEMORY[0x1E0D1BC88], "gridUnitSize");
  v16 = v8 + v14 + v15 * (double)a4;
  -[PRWidgetMetricsProvider _scaleFactor](self, "_scaleFactor");
  v18 = 1.0 / v17;
  v19 = v12 * (1.0 / v17);
  v20 = v16 * v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (id)_complicationCircularMetrics
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  -[PRWidgetMetricsProvider _sizeForItemWithGridWidth:height:](self, "_sizeForItemWithGridWidth:height:", 1, 1);
  v4 = v3;
  v6 = v5;
  -[PRWidgetMetricsProvider _scaleFactor](self, "_scaleFactor");
  v8 = v4 * 0.5 * (1.0 / v7);
  v9 = objc_alloc(MEMORY[0x1E0D101F0]);
  -[PRWidgetMetricsProvider _scaleFactor](self, "_scaleFactor");
  v11 = v10;
  v12 = -[PRWidgetMetricsProvider _complicationFontStyle](self, "_complicationFontStyle");
  -[PRWidgetMetricsProvider _edgeInsets](self, "_edgeInsets");
  return (id)objc_msgSend(v9, "initWithSize:cornerRadius:scaleFactor:fontStyle:safeAreaInsets:layoutInsets:contentMargins:supportsDynamicText:", v12, 2, v4, v6, v8, v11, v13, v14, v15, v16, *MEMORY[0x1E0D0FEC0], *(_QWORD *)(MEMORY[0x1E0D0FEC0] + 8), *(_QWORD *)(MEMORY[0x1E0D0FEC0] + 16), *(_QWORD *)(MEMORY[0x1E0D0FEC0] + 24));
}

- (id)_complicationRectangularMetrics
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = objc_alloc(MEMORY[0x1E0D101F0]);
  -[PRWidgetMetricsProvider _sizeForItemWithGridWidth:height:](self, "_sizeForItemWithGridWidth:height:", 2, 1);
  v5 = v4;
  v7 = v6;
  -[PRWidgetMetricsProvider _scaleFactor](self, "_scaleFactor");
  v9 = v8;
  v10 = -[PRWidgetMetricsProvider _complicationFontStyle](self, "_complicationFontStyle");
  -[PRWidgetMetricsProvider _edgeInsets](self, "_edgeInsets");
  return (id)objc_msgSend(v3, "initWithSize:cornerRadius:scaleFactor:fontStyle:safeAreaInsets:layoutInsets:contentMargins:supportsDynamicText:", v10, 2, v5, v7, 0.0, v9, v11, v12, v13, v14, *MEMORY[0x1E0D0FEC0], *(_QWORD *)(MEMORY[0x1E0D0FEC0] + 8), *(_QWORD *)(MEMORY[0x1E0D0FEC0] + 16), *(_QWORD *)(MEMORY[0x1E0D0FEC0] + 24));
}

- (id)_complicationInlineMetrics
{
  double v2;
  double v3;

  +[PREditorElementLayoutController frameForElements:](PREditorElementLayoutController, "frameForElements:", 4);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D101F0]), "initWithSize:cornerRadius:", v2, v3, 0.0);
}

- (id)_systemSmallMetrics
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = objc_alloc(MEMORY[0x1E0D101F0]);
  -[PRWidgetMetricsProvider _sizeForItemWithGridWidth:height:](self, "_sizeForItemWithGridWidth:height:", 2, 2);
  v5 = v4;
  v7 = v6;
  -[PRWidgetMetricsProvider _scaleFactor](self, "_scaleFactor");
  v9 = v8;
  -[PRWidgetMetricsProvider _edgeInsets](self, "_edgeInsets");
  return (id)objc_msgSend(v3, "initWithSize:cornerRadius:scaleFactor:fontStyle:safeAreaInsets:layoutInsets:contentMargins:supportsDynamicText:", 0, 2, v5, v7, 0.0, v9, v10, v11, v12, v13, *MEMORY[0x1E0D0FEC0], *(_QWORD *)(MEMORY[0x1E0D0FEC0] + 8), *(_QWORD *)(MEMORY[0x1E0D0FEC0] + 16), *(_QWORD *)(MEMORY[0x1E0D0FEC0] + 24));
}

- (id)_transparentMediumMetrics
{
  id v3;

  v3 = objc_alloc(MEMORY[0x1E0D101F0]);
  -[PRWidgetMetricsProvider _insetScreenWidth](self, "_insetScreenWidth");
  return (id)objc_msgSend(v3, "initWithSize:cornerRadius:");
}

- (double)_insetScreenWidth
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_referenceBounds");
  v4 = v3 + -16.0;

  return v4;
}

- (int64_t)_complicationFontStyle
{
  void *v2;
  uint64_t v3;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  _BOOL4 v10;
  int v11;
  int64_t v12;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 7;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_referenceBounds");
  v7 = v6;

  if (v7 == 375.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nativeScale");
    v10 = v9 == 2.0;

  }
  else
  {
    v10 = 0;
  }
  v11 = v7 < 375.0 || v10;
  v12 = 7;
  if (v7 > 394.0)
    v12 = 8;
  if (v11)
    return 6;
  else
    return v12;
}

@end
