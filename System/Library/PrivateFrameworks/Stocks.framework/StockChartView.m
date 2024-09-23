@implementation StockChartView

+ (CGGradient)LineBackgroundGradient
{
  CGGradient *result;
  CGColorSpace *DeviceRGB;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  const __CFArray *v8;

  result = (CGGradient *)LineBackgroundGradient_gradient;
  if (!LineBackgroundGradient_gradient)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v4 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.2);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v5, "CGColor");
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.2);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const __CFArray *)objc_msgSend(v4, "arrayWithObjects:", v6, objc_msgSend(v7, "CGColor"), 0);

    LineBackgroundGradient_gradient = (uint64_t)CGGradientCreateWithColors(DeviceRGB, v8, 0);
    CGColorSpaceRelease(DeviceRGB);
    return (CGGradient *)LineBackgroundGradient_gradient;
  }
  return result;
}

- (BOOL)isCurrentChart
{
  StockChartView *v2;
  void *v3;

  v2 = self;
  -[StockChartView chartViewDelegate](self, "chartViewDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "stockChartViewIsCurrentChartView:", v2);

  return (char)v2;
}

- (void)dealloc
{
  ChartUpdater *chartUpdater;
  objc_super v4;

  -[YQLRequest cancelAndInvalidate](self->_chartUpdater, "cancelAndInvalidate");
  -[ChartUpdater setDelegate:](self->_chartUpdater, "setDelegate:", 0);
  chartUpdater = self->_chartUpdater;
  self->_chartUpdater = 0;

  v4.receiver = self;
  v4.super_class = (Class)StockChartView;
  -[StockChartView dealloc](&v4, sel_dealloc);
}

- (StockChartView)initWithInitialDisplayMode:(id)a3 preferredChartInterval:(int64_t)a4 stockChartViewDelegate:(id)a5
{
  id v8;
  id v9;
  StockChartView *v10;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *graphViews;
  LoadingLabel *v14;
  LoadingLabel *loadingLabel;
  ChartUpdater *v16;
  ChartUpdater *chartUpdater;
  NSMutableArray *v18;
  NSMutableArray *axisViews;
  NSMutableArray *v20;
  NSMutableArray *xLabelViews;
  NSMutableArray *v22;
  NSMutableArray *yLabelViews;
  UIView *v24;
  UIView *xAxisKeyline;
  uint64_t v26;
  DashedLineView *previousCloseLine;
  DashedLineView *v28;
  void *v29;
  UILabel *v30;
  UILabel *previousCloseLabel;
  UILabel *v32;
  void *v33;
  void *v34;
  UILabel *v35;
  void *v36;
  UILabel *v37;
  void *v38;
  ChartHUDView *v39;
  ChartHUDView *HUDView;
  ChartTitleLabel *v41;
  ChartTitleLabel *titleView;
  ChartTitleLabel *v43;
  void *v44;
  double v45;
  ChartIntervalButtonRow *v46;
  ChartIntervalButtonRow *intervalButtonRow;
  void *v48;
  UIView *v49;
  UIView *chartTopKeyline;
  UIView *v51;
  void *v52;
  UIView *v53;
  UIView *chartBottomKeyline;
  UIView *v55;
  void *v56;
  objc_super v58;

  v8 = a3;
  v9 = a5;
  v58.receiver = self;
  v58.super_class = (Class)StockChartView;
  v10 = -[StockChartView initWithFrame:](&v58, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[StockChartView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    -[StockChartView setMultipleTouchEnabled:](v10, "setMultipleTouchEnabled:", 1);
    v12 = objc_opt_new();
    graphViews = v10->_graphViews;
    v10->_graphViews = (NSMutableDictionary *)v12;

    v14 = objc_alloc_init(LoadingLabel);
    loadingLabel = v10->_loadingLabel;
    v10->_loadingLabel = v14;

    -[StockChartView addSubview:](v10, "addSubview:", v10->_loadingLabel);
    v16 = objc_alloc_init(ChartUpdater);
    chartUpdater = v10->_chartUpdater;
    v10->_chartUpdater = v16;

    -[ChartUpdater setDelegate:](v10->_chartUpdater, "setDelegate:", v10);
    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    axisViews = v10->_axisViews;
    v10->_axisViews = v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    xLabelViews = v10->_xLabelViews;
    v10->_xLabelViews = v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    yLabelViews = v10->_yLabelViews;
    v10->_yLabelViews = v22;

    -[StockChartView createYLabelsForMode:](v10, "createYLabelsForMode:", v8);
    v24 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    xAxisKeyline = v10->_xAxisKeyline;
    v10->_xAxisKeyline = v24;

    -[UIView setHidden:](v10->_xAxisKeyline, "setHidden:", 1);
    -[StockChartView addSubview:](v10, "addSubview:", v10->_xAxisKeyline);
    v26 = objc_opt_new();
    previousCloseLine = v10->_previousCloseLine;
    v10->_previousCloseLine = (DashedLineView *)v26;

    v28 = v10->_previousCloseLine;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[DashedLineView setBackgroundColor:](v28, "setBackgroundColor:", v29);

    -[StockChartView addSubview:](v10, "addSubview:", v10->_previousCloseLine);
    v30 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    previousCloseLabel = v10->_previousCloseLabel;
    v10->_previousCloseLabel = v30;

    v32 = v10->_previousCloseLabel;
    +[StocksStyle sharedStyle](StocksStyle, "sharedStyle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "lightFontOfSize:", 12.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v32, "setFont:", v34);

    v35 = v10->_previousCloseLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v35, "setTextColor:", v36);

    v37 = v10->_previousCloseLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v37, "setBackgroundColor:", v38);

    -[UILabel setTextAlignment:](v10->_previousCloseLabel, "setTextAlignment:", 2);
    -[StockChartView addSubview:](v10, "addSubview:", v10->_previousCloseLabel);
    v39 = objc_alloc_init(ChartHUDView);
    HUDView = v10->_HUDView;
    v10->_HUDView = v39;

    -[ChartHUDView setChartView:](v10->_HUDView, "setChartView:", v10);
    -[ChartHUDView setOverlayHidden:](v10->_HUDView, "setOverlayHidden:", 1);
    -[StockChartView addSubview:](v10, "addSubview:", v10->_HUDView);
    v41 = objc_alloc_init(ChartTitleLabel);
    titleView = v10->_titleView;
    v10->_titleView = v41;

    v43 = v10->_titleView;
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[ChartTitleLabel setBackgroundColor:](v43, "setBackgroundColor:", v44);

    objc_msgSend(v8, "showsTitle");
    if (v45 != 0.0)
      -[StockChartView insertSubview:belowSubview:](v10, "insertSubview:belowSubview:", v10->_titleView, v10->_HUDView);
    v46 = -[ChartIntervalButtonRow initWithMaxChartInterval:chartIntervalButtonRowDelegate:]([ChartIntervalButtonRow alloc], "initWithMaxChartInterval:chartIntervalButtonRowDelegate:", 8, v10);
    intervalButtonRow = v10->_intervalButtonRow;
    v10->_intervalButtonRow = v46;

    -[StockChartView addSubview:](v10, "addSubview:", v10->_intervalButtonRow);
    -[StockChartView layer](v10, "layer");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setNeedsLayoutOnGeometryChange:", 0);

    v49 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    chartTopKeyline = v10->_chartTopKeyline;
    v10->_chartTopKeyline = v49;

    v51 = v10->_chartTopKeyline;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.8);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v51, "setBackgroundColor:", v52);

    -[StockChartView addSubview:](v10, "addSubview:", v10->_chartTopKeyline);
    v53 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    chartBottomKeyline = v10->_chartBottomKeyline;
    v10->_chartBottomKeyline = v53;

    v55 = v10->_chartBottomKeyline;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.8);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v55, "setBackgroundColor:", v56);

    -[StockChartView addSubview:](v10, "addSubview:", v10->_chartBottomKeyline);
    objc_msgSend(v8, "setBackgroundGradient:", objc_msgSend((id)objc_opt_class(), "LineBackgroundGradient"));
    -[StockChartView addDisplayMode:](v10, "addDisplayMode:", v8);
    -[StockChartView setCurrentDisplayMode:](v10, "setCurrentDisplayMode:", v8);
    v10->_preferredInterval = a4;
    v10->_selectedInterval = a4;
    objc_storeWeak((id *)&v10->_chartViewDelegate, v9);
    -[ChartIntervalButtonRow selectChartIntervalButtonForInterval:](v10->_intervalButtonRow, "selectChartIntervalButtonForInterval:", -[StockChartView maxSupportedIntervalFromDesiredInterval:](v10, "maxSupportedIntervalFromDesiredInterval:", a4));
  }

  return v10;
}

- (void)addDisplayMode:(id)a3
{
  id v4;
  NSMutableArray *displayModes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  StockGraphView *v8;
  StockGraphView *v9;
  void *v10;
  void *v11;
  double v12;
  BOOL v13;
  double v14;
  id v15;

  v4 = a3;
  displayModes = self->_displayModes;
  v15 = v4;
  if (!displayModes)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_displayModes;
    self->_displayModes = v6;

    v4 = v15;
    displayModes = self->_displayModes;
  }
  if ((-[NSMutableArray containsObject:](displayModes, "containsObject:", v4) & 1) == 0)
  {
    v8 = [StockGraphView alloc];
    v9 = -[StockGraphView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[StockGraphView setDisplayMode:](v9, "setDisplayMode:", v15);
    -[StockGraphView setChartViewDelegate:](v9, "setChartViewDelegate:", self);
    -[StockChartView chartData](self, "chartData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[StockGraphView loadStockChartData:](v9, "loadStockChartData:", v10);

    objc_msgSend(v15, "setBackgroundGradient:", objc_msgSend((id)objc_opt_class(), "LineBackgroundGradient"));
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    v13 = v12 == 1.0;
    v14 = 0.7;
    if (v13)
      v14 = 1.0;
    objc_msgSend(v15, "setLineWidth:", v14);

    -[NSMutableArray addObject:](self->_displayModes, "addObject:", v15);
    -[NSMutableDictionary setObject:forKey:](self->_graphViews, "setObject:forKey:", v9, v15);
    -[StockChartView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v9, self->_HUDView);
    -[StockChartView createYLabelsForMode:](self, "createYLabelsForMode:", v15);
    -[StockChartView _prepareYAxisLabelsAndPositionsForDisplayMode:](self, "_prepareYAxisLabelsAndPositionsForDisplayMode:", v15);

  }
}

- (void)setDrawsBottomLine:(BOOL)a3
{
  self->_drawsBottomLine = a3;
  -[UIView setHidden:](self->_chartBottomKeyline, "setHidden:", !a3);
}

- (id)graphViewForMode:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_graphViews, "objectForKey:", a3);
}

- (void)setCurrentDisplayMode:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_currentDisplayMode, a3);
  -[ChartIntervalButtonRow updateMaxChartInterval:](self->_intervalButtonRow, "updateMaxChartInterval:", objc_msgSend(v5, "maxInterval"));
  if (self->_chartData)
    -[StockChartView _prepareXAxisLabelsAndPositions](self, "_prepareXAxisLabelsAndPositions");
  -[StockChartView setNeedsLayout](self, "setNeedsLayout");

}

- (NSArray)alternateDisplayModes
{
  void *v3;
  void *v4;

  v3 = (void *)-[NSMutableArray mutableCopy](self->_displayModes, "mutableCopy");
  -[StockChartView currentDisplayMode](self, "currentDisplayMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", v4);

  return (NSArray *)v3;
}

- (void)enumerateGraphsAndDisplayModesUsingBlock:(id)a3
{
  void (**v5)(id, uint64_t, void *, unsigned __int8 *);
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, uint64_t, void *, unsigned __int8 *))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("StockChartView.m"), 249, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_displayModes;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
LABEL_5:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v6);
      v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
      v14 = 0;
      -[StockChartView graphViewForMode:](self, "graphViewForMode:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v11, v12, &v14);
      LODWORD(v11) = v14;

      if ((_DWORD)v11)
        break;
      if (v8 == ++v10)
      {
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          goto LABEL_5;
        break;
      }
    }
  }

}

- (void)resetLocale
{
  void *v3;

  -[ChartHUDView resetLocale](self->_HUDView, "resetLocale");
  +[ChartLabelInfoManager sharedLabelInfoManager](ChartLabelInfoManager, "sharedLabelInfoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetLocale");

  -[StockChartView _setMonthAndYearLabels](self, "_setMonthAndYearLabels");
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[Stock symbol](self->_stock, "symbol");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)StockChartView;
  -[StockChartView description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Ticker %@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)currentGraphView
{
  void *v3;
  void *v4;

  -[StockChartView currentDisplayMode](self, "currentDisplayMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockChartView graphViewForMode:](self, "graphViewForMode:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setStock:(id)a3
{
  Stock *v5;
  Stock *v6;

  v5 = (Stock *)a3;
  if (self->_stock != v5)
  {
    v6 = v5;
    -[StockChartView enumerateGraphsAndDisplayModesUsingBlock:](self, "enumerateGraphsAndDisplayModesUsingBlock:", &__block_literal_global_11);
    objc_storeStrong((id *)&self->_stock, a3);
    -[StockChartView clearData](self, "clearData");
    -[StockChartView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

uint64_t __27__StockChartView_setStock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "cancelRenderOperation");
}

- (BOOL)shouldShowLoadingStatus
{
  void *v2;
  char v3;

  -[StockChartView currentGraphView](self, "currentGraphView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRendered") ^ 1;

  return v3;
}

- (void)layoutGraphViews
{
  _QWORD v2[5];

  if (!self->_animating)
  {
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 3221225472;
    v2[2] = __34__StockChartView_layoutGraphViews__block_invoke;
    v2[3] = &unk_24D74C4D8;
    v2[4] = self;
    -[StockChartView enumerateGraphsAndDisplayModesUsingBlock:](self, "enumerateGraphsAndDisplayModesUsingBlock:", v2);
  }
}

void __34__StockChartView_layoutGraphViews__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "graphViewFrameForMode:", a2);
  objc_msgSend(v5, "setFrame:");

}

- (void)layoutPreviousClose
{
  float v3;
  float v4;
  int v5;
  void *v6;
  uint64_t v7;
  UILabel *previousCloseLabel;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  int v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double MaxY;
  double v34;
  double v35;
  double v36;
  double v37;
  DashedLineView *previousCloseLine;
  double MinX;
  double Width;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  CGFloat MaxX;
  double v50;
  void *v51;
  int v52;
  CGFloat x;
  CGFloat y;
  CGFloat v55;
  CGFloat height;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  NSMutableArray *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t i;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint64_t v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;

  v72 = *MEMORY[0x24BDAC8D0];
  -[StockChartData previousClosePrice](self->_chartData, "previousClosePrice");
  v4 = v3;
  v5 = 0;
  if (!self->_selectedInterval && v3 != 0.0)
  {
    if (-[StockChartView isLoading](self, "isLoading"))
    {
      v5 = 0;
    }
    else
    {
      -[StockChartView currentGraphView](self, "currentGraphView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "isRendered");

    }
  }
  v7 = v5 ^ 1u;
  -[DashedLineView setHidden:](self->_previousCloseLine, "setHidden:", v7);
  -[UILabel setHidden:](self->_previousCloseLabel, "setHidden:", v7);
  if ((v7 & 1) == 0)
  {
    previousCloseLabel = self->_previousCloseLabel;
    +[StockDataFormatter sharedDataFormatter](StockDataFormatter, "sharedDataFormatter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v10 = v4;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "formattedNumber:withPrecision:useGroupSeparator:", v11, -[StockChartData yAxisFractionDigits](self->_chartData, "yAxisFractionDigits"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](previousCloseLabel, "setText:", v12);

    -[UILabel sizeToFit](self->_previousCloseLabel, "sizeToFit");
    v13 = self->_previousCloseLabel;
    -[StockChartView currentDisplayMode](self, "currentDisplayMode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "showsPriceLabelForPreviousClose");
    v16 = 0.0;
    if (v15)
      v16 = 1.0;
    -[UILabel setAlpha:](v13, "setAlpha:", v16);

    -[StockChartView chartData](self, "chartData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(double *)(objc_msgSend(v17, "minValue") + 8);

    v19 = v4;
    if (v18 <= v4)
      v20 = v18;
    else
      v20 = v4;
    -[StockChartView chartData](self, "chartData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(double *)(objc_msgSend(v21, "maxValue") + 8);

    if (v22 <= v19)
      v23 = v19;
    else
      v23 = v22;
    -[StockChartView currentGraphView](self, "currentGraphView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "frame");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;

    v73.origin.x = v26;
    v73.origin.y = v28;
    v73.size.width = v30;
    v73.size.height = v32;
    MaxY = CGRectGetMaxY(v73);
    -[StockChartView lineGraphBottomPadding](self, "lineGraphBottomPadding");
    v35 = MaxY - v34;
    -[StockChartView lineGraphBottomPadding](self, "lineGraphBottomPadding");
    v37 = v35 - RoundToPixel((v19 - v20) / (v23 - v20) * (v32 - v36 + -18.0));
    previousCloseLine = self->_previousCloseLine;
    v74.origin.x = v26;
    v74.origin.y = v28;
    v74.size.width = v30;
    v74.size.height = v32;
    MinX = CGRectGetMinX(v74);
    v75.origin.x = v26;
    v75.origin.y = v28;
    v75.size.width = v30;
    v75.size.height = v32;
    Width = CGRectGetWidth(v75);
    -[DashedLineView setFrame:](previousCloseLine, "setFrame:", MinX, v37, Width, RoundToPixel(0.5));
    -[DashedLineView setNeedsDisplay](self->_previousCloseLine, "setNeedsDisplay");
    -[UILabel frame](self->_previousCloseLabel, "frame");
    v42 = v41;
    v44 = v43;
    v45 = v37 - v43 + -4.0;
    -[UILabel font](self->_previousCloseLabel, "font");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "descender");
    v48 = RoundToPixel(v45 - v47);

    v76.origin.x = v26;
    v76.origin.y = v28;
    v76.size.width = v30;
    v76.size.height = v32;
    MaxX = CGRectGetMaxX(v76);
    v50 = MaxX - v42;
    -[UILabel setFrame:](self->_previousCloseLabel, "setFrame:", MaxX - v42, v48, v42, v44);
    -[StockChartView currentDisplayMode](self, "currentDisplayMode");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "showsPriceLabelForPreviousClose");

    if (v52)
    {
      v77.origin.x = v50;
      v77.origin.y = v48;
      v77.size.width = v42;
      v77.size.height = v44;
      v78 = CGRectInset(v77, -4.0, -4.0);
      x = v78.origin.x;
      y = v78.origin.y;
      v55 = v78.size.width;
      height = v78.size.height;
      -[DashedLineView frame](self->_previousCloseLine, "frame");
      v80 = CGRectInset(v79, -4.0, -4.0);
      v57 = v80.origin.x;
      v58 = v80.origin.y;
      v59 = v80.size.width;
      v60 = v80.size.height;
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v61 = self->_yLabelViews;
      v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
      if (v62)
      {
        v63 = v62;
        v64 = *(_QWORD *)v68;
        do
        {
          for (i = 0; i != v63; ++i)
          {
            if (*(_QWORD *)v68 != v64)
              objc_enumerationMutation(v61);
            v66 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
            objc_msgSend(v66, "frame", (_QWORD)v67);
            v83.origin.x = x;
            v83.origin.y = y;
            v83.size.width = v55;
            v83.size.height = height;
            if (!CGRectIntersectsRect(v81, v83))
            {
              objc_msgSend(v66, "frame");
              v84.origin.x = v57;
              v84.origin.y = v58;
              v84.size.width = v59;
              v84.size.height = v60;
              if (!CGRectIntersectsRect(v82, v84))
                continue;
            }
            objc_msgSend(v66, "setHidden:", 1);
          }
          v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
        }
        while (v63);
      }

    }
  }
}

- (void)_layoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  _BOOL8 v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  void *v45;
  uint64_t v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double MinY;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double Width;
  double MaxY;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  +[StockManager sharedManager](StockManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stocksList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[StockChartView bounds](self, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[StockChartView currentDisplayMode](self, "currentDisplayMode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "showsTitle");
    v16 = v15;
    v17 = v15 == 0.0;

    -[StockChartView _layoutTopLabelsHidden:](self, "_layoutTopLabelsHidden:", v17);
    if (v16 != 0.0)
    {
      -[StockChartView currentDisplayMode](self, "currentDisplayMode");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "chartRenderingInsets");
      v20 = v19;
      v22 = v21;

      -[ChartTitleLabel prepareStringsWithStock:width:](self->_titleView, "prepareStringsWithStock:width:", self->_stock, v11 - (v20 + v22));
    }
    if (self->_chartData)
    {
      -[StockChartView layoutGraphViews](self, "layoutGraphViews");
      -[StockChartView _prepareXAxisLabelsAndPositions](self, "_prepareXAxisLabelsAndPositions");
    }
    -[StockChartView _layoutIntervalButtonRow](self, "_layoutIntervalButtonRow");
    -[ChartIntervalButtonRow setHidden:](self->_intervalButtonRow, "setHidden:", 0);
    if (-[StockChartView shouldShowLoadingStatus](self, "shouldShowLoadingStatus"))
    {
      -[StockChartView _setShowingLoadingStatus:](self, "_setShowingLoadingStatus:", 1);
    }
    else
    {
      -[StockChartView _setShowingLoadingStatus:](self, "_setShowingLoadingStatus:", 0);
      -[StockChartView currentGraphView](self, "currentGraphView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "frame");
      v25 = v24;
      v27 = v26;
      v29 = v28;
      v31 = v30;

      -[StockChartView _layoutVolumeSeparatorLineForGraphRect:](self, "_layoutVolumeSeparatorLineForGraphRect:", v25, v27, v29, v31);
      -[StockChartView _layoutYLabels](self, "_layoutYLabels");
      -[StockChartView _layoutAxesAndXLabels](self, "_layoutAxesAndXLabels");
      -[ChartHUDView setFrame:](self->_HUDView, "setFrame:", v7, v9, v11, v13);
      -[StockChartView currentGraphView](self, "currentGraphView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setHidden:", 0);

      -[UIView setHidden:](self->_xAxisKeyline, "setHidden:", 0);
      -[StockChartView chartViewDelegate](self, "chartViewDelegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_opt_respondsToSelector();

      if ((v34 & 1) != 0)
      {
        -[StockChartView chartViewDelegate](self, "chartViewDelegate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stockChartViewFinishedInitialLoad:", self);

      }
    }
    -[StockChartView layoutPreviousClose](self, "layoutPreviousClose");
    -[StockChartView currentDisplayMode](self, "currentDisplayMode");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[StockChartView graphViewFrameForMode:](self, "graphViewFrameForMode:", v36);
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;

    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "statusBarOrientation");

    -[StockChartView horizontalPadding](self, "horizontalPadding");
    v48 = v47;
    v68.origin.x = v38;
    v68.origin.y = v40;
    v68.size.width = v42;
    v68.size.height = v44;
    MaxY = CGRectGetMaxY(v68);
    v69.origin.x = v38;
    v69.origin.y = v40;
    v69.size.width = v42;
    v69.size.height = v44;
    Width = CGRectGetWidth(v69);
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "scale");
    v51 = 1.0 / v50;

    v70.origin.x = v38;
    v70.origin.y = v40;
    v70.size.width = v42;
    v70.size.height = v44;
    MinY = CGRectGetMinY(v70);
    v53 = MinY - RoundToPixel(0.5);
    v71.origin.x = v38;
    v71.origin.y = v40;
    v71.size.width = v42;
    v71.size.height = v44;
    v54 = CGRectGetWidth(v71);
    v55 = v54 + RoundToPixel(0.5);
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "scale");
    v58 = 1.0 / v57;

    v59 = 0.0;
    if (v46 == 3)
      v59 = v48;
    v60 = v38 - v59;
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "_referenceBounds");
    v63 = v62;

    v64 = -0.0;
    if (v63 == 812.0)
      v64 = v48;
    v65 = v55 + v64;
    -[UIView setFrame:](self->_chartBottomKeyline, "setFrame:", v60, MaxY, Width + v64, v51);
    -[UIView setHidden:](self->_chartBottomKeyline, "setHidden:", -[StockChartView drawsBottomLine](self, "drawsBottomLine") ^ 1);
    -[UIView setFrame:](self->_chartTopKeyline, "setFrame:", v60, v53, v65, v58);
    -[UIView setHidden:](self->_chartTopKeyline, "setHidden:", 0);
  }
  else
  {
    -[ChartIntervalButtonRow setHidden:](self->_intervalButtonRow, "setHidden:", 1);
    -[StockChartView _layoutTopLabelsHidden:](self, "_layoutTopLabelsHidden:", 1);
    -[StockChartView hideLabelsAxesAndGraphs](self, "hideLabelsAxesAndGraphs");
    -[StockChartView _setShowingLoadingStatus:](self, "_setShowingLoadingStatus:", 0);
  }
}

- (void)layoutSubviews
{
  void *v3;
  char v4;

  if (!self->_animating)
  {
    -[StockChartView controller](self, "controller");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isAnimatingRotation");

    if ((v4 & 1) == 0)
      -[StockChartView _layoutSubviews](self, "_layoutSubviews");
  }
}

- (double)horizontalPadding
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_referenceBounds");
  if (v4 == 812.0)
  {
    if (-[StockChartView isLandscape](self, "isLandscape"))
      v5 = 44.0;
    else
      v5 = 0.0;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (BOOL)isLandscape
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "statusBarOrientation");

  return (unint64_t)(v3 - 3) < 2;
}

- (void)layoutIfNeeded
{
  objc_super v3;

  if (-[StockChartView isCurrentChart](self, "isCurrentChart"))
  {
    if (!self->_animating)
    {
      v3.receiver = self;
      v3.super_class = (Class)StockChartView;
      -[StockChartView layoutIfNeeded](&v3, sel_layoutIfNeeded);
    }
  }
}

- (void)forceLayout
{
  -[StockChartView _layoutSubviews](self, "_layoutSubviews");
  -[ChartIntervalButtonRow setNeedsLayout](self->_intervalButtonRow, "setNeedsLayout");
}

- (void)setNeedsLayout
{
  objc_super v2;

  if (self->_animating)
  {
    self->_layoutPending = 1;
  }
  else
  {
    v2.receiver = self;
    v2.super_class = (Class)StockChartView;
    -[StockChartView setNeedsLayout](&v2, sel_setNeedsLayout);
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[StockChartView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)StockChartView;
  -[StockChartView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (width != v9 || height != v11)
    -[StockChartView renderGraphDataIfNeeded](self, "renderGraphDataIfNeeded");
}

- (double)lineGraphBottomPadding
{
  void *v2;
  double v3;
  double v4;

  -[StockChartView currentDisplayMode](self, "currentDisplayMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lineGraphBottomPadding");
  v4 = v3;

  return v4;
}

- (void)chartUpdater:(id)a3 didReceiveStockChartData:(id)a4
{
  void *v5;
  int64_t selectedInterval;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a4;
  -[StockChartView chartViewDelegate](self, "chartViewDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stockChartViewNeedsLoadingStatusUpdated:", self);

  selectedInterval = self->_selectedInterval;
  if (selectedInterval == objc_msgSend(v11, "chartInterval"))
  {
    -[Stock symbol](self->_stock, "symbol");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "symbol");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqualToString:", v9);

    if (v10)
      -[StockChartView setChartData:](self, "setChartData:", v11);
  }

}

- (void)chartUpdater:(id)a3 didFailWithError:(id)a4
{
  id v5;

  objc_storeStrong((id *)&self->_error, a4);
  -[StockChartView setNeedsLayout](self, "setNeedsLayout");
  -[StockChartView chartViewDelegate](self, "chartViewDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stockChartViewNeedsLoadingStatusUpdated:", self);

}

- (id)chartUpdater
{
  return self->_chartUpdater;
}

- (BOOL)isLoading
{
  return -[YQLRequest isLoading](self->_chartUpdater, "isLoading");
}

- (BOOL)hadError
{
  return self->_error != 0;
}

- (void)reloadData
{
  void *v3;

  if (self->_stock && !-[StockChartView isLoading](self, "isLoading"))
  {
    -[StockChartView clearData](self, "clearData");
    if (!-[ChartUpdater updateChartForStock:interval:](self->_chartUpdater, "updateChartForStock:interval:", self->_stock, self->_selectedInterval))
    {
      -[StockChartView chartViewDelegate](self, "chartViewDelegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stockChartViewNeedsLoadingStatusUpdated:", self);

    }
    -[StockChartView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)clearData
{
  StockChartData *chartData;

  chartData = self->_chartData;
  self->_chartData = 0;

  -[StockChartView setError:](self, "setError:", 0);
  -[StockChartView hideLabelsAxesAndGraphs](self, "hideLabelsAxesAndGraphs");
  -[StockChartView enumerateGraphsAndDisplayModesUsingBlock:](self, "enumerateGraphsAndDisplayModesUsingBlock:", &__block_literal_global_54);
  -[StockChartView updateHUDView](self, "updateHUDView");
  -[ChartUpdater cancel](self->_chartUpdater, "cancel");
}

uint64_t __27__StockChartView_clearData__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "clearData");
}

- (void)reloadDataIfStale
{
  double Current;
  double v4;

  if (-[ChartHUDView isTrackingTouches](self->_HUDView, "isTrackingTouches")
    || self->_chartData
    && ((objc_msgSend((id)*MEMORY[0x24BDF74F8], "isSuspended") & 1) == 0
     && !-[Stock marketIsOpen](self->_stock, "marketIsOpen")
     || (Current = CFAbsoluteTimeGetCurrent(),
         -[StockChartData expirationTime](self->_chartData, "expirationTime"),
         Current < v4)))
  {
    -[StockChartView setError:](self, "setError:", 0);
  }
  else
  {
    -[StockChartView reloadData](self, "reloadData");
  }
}

- (void)setChartData:(id)a3
{
  StockChartData *v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[4];
  StockChartData *v9;
  CGRect v10;

  v5 = (StockChartData *)a3;
  if (self->_chartData != v5)
  {
    objc_storeStrong((id *)&self->_chartData, a3);
    v6 = MEMORY[0x24BDAC760];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __31__StockChartView_setChartData___block_invoke;
    v8[3] = &unk_24D74C4D8;
    v9 = v5;
    -[StockChartView enumerateGraphsAndDisplayModesUsingBlock:](self, "enumerateGraphsAndDisplayModesUsingBlock:", v8);
    v7[0] = v6;
    v7[1] = 3221225472;
    v7[2] = __31__StockChartView_setChartData___block_invoke_2;
    v7[3] = &unk_24D74C4D8;
    v7[4] = self;
    -[StockChartView enumerateGraphsAndDisplayModesUsingBlock:](self, "enumerateGraphsAndDisplayModesUsingBlock:", v7);
    -[StockChartView bounds](self, "bounds");
    if (!CGRectEqualToRect(v10, *MEMORY[0x24BDBF090]))
    {
      -[StockChartView layoutSubviews](self, "layoutSubviews");
      -[StockChartView renderGraphDataIfNeeded](self, "renderGraphDataIfNeeded");
    }
    -[StockChartView updateHUDView](self, "updateHUDView");

  }
}

uint64_t __31__StockChartView_setChartData___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "loadStockChartData:", *(_QWORD *)(a1 + 32));
}

uint64_t __31__StockChartView_setChartData___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prepareYAxisLabelsAndPositionsForDisplayMode:", a2);
}

- (CGRect)graphViewFrameForMode:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "showsTitle");
  if (v5 == 0.0)
    v6 = 0.0;
  else
    v6 = 37.0;
  objc_msgSend(v4, "chartSize");
  objc_msgSend(v4, "chartRenderingInsets");
  v8 = v7;
  v10 = v9;
  v40 = v11;
  v13 = v12;
  -[StockChartView horizontalPadding](self, "horizontalPadding");
  v15 = v14;
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "statusBarOrientation");

  -[StockChartView bounds](self, "bounds");
  v19 = v18;
  v39 = v20;
  objc_msgSend(v4, "intervalRowHeight");
  v22 = v8 + v6 + v21;
  v23 = -0.0;
  if (v17 == 3)
    v23 = v15;
  v24 = v10 + v23;
  v25 = v10 + v13;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_referenceBounds");
  v27 = 0.0;
  if (v28 == 812.0)
    v27 = v15;
  v29 = v25 + v27;

  objc_msgSend(v4, "intervalRowHeight");
  v31 = v30;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "scale");
  v34 = v39 - (v8 + v40 + v6 + v31 + 1.0 / v33);

  v35 = v24;
  v36 = v22;
  v37 = v19 - v29;
  v38 = v34;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (CGRect)lineGraphFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  char v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  -[StockChartView currentDisplayMode](self, "currentDisplayMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockChartView graphViewFrameForMode:](self, "graphViewFrameForMode:", v3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[StockChartView lineGraphBottomPadding](self, "lineGraphBottomPadding");
  v13 = v12;
  -[StockChartView currentDisplayMode](self, "currentDisplayMode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "graphOverlapsYAxisLabels");

  if ((v15 & 1) == 0)
  {
    -[StockChartView currentDisplayMode](self, "currentDisplayMode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[StockChartView widestYLabelWidthForMode:](self, "widestYLabelWidthForMode:", v16);
    v18 = v17 + 4.0;
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "scale");
    v9 = v9 - (v18 + 1.0 / v20);

  }
  v21 = v11 - (v13 + 18.0);
  v22 = v7 + 18.0;
  v23 = v5;
  v24 = v9;
  result.size.height = v21;
  result.size.width = v24;
  result.origin.y = v22;
  result.origin.x = v23;
  return result;
}

- (void)renderGraphDataIfNeededForMode:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v15 = a3;
  -[StockChartView graphViewForMode:](self, "graphViewForMode:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockChartView chartData](self, "chartData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_msgSend(v4, "isRendered") & 1) == 0)
  {
    v6 = objc_msgSend(v4, "isRendering");

    if ((v6 & 1) == 0)
    {
      v7 = 0.0;
      if ((objc_msgSend(v15, "graphOverlapsYAxisLabels") & 1) == 0)
      {
        -[StockChartView widestYLabelWidthForMode:](self, "widestYLabelWidthForMode:", v15);
        v9 = v8 + 4.0;
        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "scale");
        v7 = FloorToPixel(v9 + 1.0 / v11);

      }
      objc_msgSend(v15, "lineGraphBottomPadding");
      objc_msgSend(v4, "setGraphInsets:", 18.0, 0.0, v12, v7);
      -[StockChartView graphViewFrameForMode:](self, "graphViewFrameForMode:", v15);
      objc_msgSend(v4, "recomputePathsAndRenderIfNeededForSize:", v13, v14);
    }
  }
  else
  {

  }
}

- (void)renderGraphDataIfNeeded
{
  void *v3;
  _QWORD v4[5];

  -[StockChartView currentDisplayMode](self, "currentDisplayMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockChartView renderGraphDataIfNeededForMode:](self, "renderGraphDataIfNeededForMode:", v3);

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__StockChartView_renderGraphDataIfNeeded__block_invoke;
  v4[3] = &unk_24D74C4D8;
  v4[4] = self;
  -[StockChartView enumerateGraphsAndDisplayModesUsingBlock:](self, "enumerateGraphsAndDisplayModesUsingBlock:", v4);
}

void __41__StockChartView_renderGraphDataIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "currentDisplayMode");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v3 != v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "renderGraphDataIfNeededForMode:", v5);
    v4 = v5;
  }

}

- (void)stockGraphViewReadyForDisplay:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[StockChartView currentGraphView](self, "currentGraphView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    -[StockChartView hideOtherGraphViews](self, "hideOtherGraphViews");
    objc_msgSend(v5, "setAlpha:", 1.0);
    -[StockChartView setLabelsAndAxesAlpha:](self, "setLabelsAndAxesAlpha:", 1.0);
    -[StockChartView setNeedsLayout](self, "setNeedsLayout");
  }
  -[StockChartView updateHUDView](self, "updateHUDView");

}

- (void)hideOtherGraphViews
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[StockChartView currentDisplayMode](self, "currentDisplayMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_displayModes;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        if (v3 != *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8))
        {
          -[StockChartView graphViewForMode:](self, "graphViewForMode:", (_QWORD)v10);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setAlpha:", 0.0);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (id)HUDView
{
  return self->_HUDView;
}

- (void)setShowingHUD:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  ChartHUDView *HUDView;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  UIView *chartTopKeyline;
  double v15;
  void *v16;
  _QWORD v17[5];
  BOOL v18;

  v3 = a3;
  if (-[ChartHUDView isOverlayHidden](self->_HUDView, "isOverlayHidden") == a3)
  {
    -[StockChartView currentDisplayMode](self, "currentDisplayMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[StockChartView currentGraphView](self, "currentGraphView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ChartHUDView setGraphView:](self->_HUDView, "setGraphView:", v6);
    HUDView = self->_HUDView;
    objc_msgSend(v6, "frame");
    v9 = v8;
    objc_msgSend(v5, "gutterHeight");
    v11 = v9 - v10;
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scale");
    -[ChartHUDView setBarHeight:](HUDView, "setBarHeight:", v11 + 1.0 / v13 * -2.0);

    -[ChartHUDView setOverlayHidden:](self->_HUDView, "setOverlayHidden:", !v3);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __32__StockChartView_setShowingHUD___block_invoke;
    v17[3] = &unk_24D74B798;
    v17[4] = self;
    v18 = v3;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v17, 0.100000001);
    chartTopKeyline = self->_chartTopKeyline;
    v15 = 0.2;
    if (!v3)
      v15 = 0.8;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](chartTopKeyline, "setBackgroundColor:", v16);

  }
}

uint64_t __32__StockChartView_setShowingHUD___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 432);
  v3 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v3 = 1.0;
  objc_msgSend(v2, "setAlpha:", v3);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "setLabelsHidden:", *(unsigned __int8 *)(a1 + 40));
}

- (void)updateHUDView
{
  ChartHUDView *HUDView;
  void *v4;
  id v5;

  HUDView = self->_HUDView;
  if (self->_chartData)
  {
    -[StockChartView currentDisplayMode](self, "currentDisplayMode");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "HUDEnabled"))
    {
      -[StockChartView currentGraphView](self, "currentGraphView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[ChartHUDView setEnabled:](HUDView, "setEnabled:", objc_msgSend(v4, "isRendered"));

    }
    else
    {
      -[ChartHUDView setEnabled:](HUDView, "setEnabled:", 0);
    }

  }
  else
  {
    -[ChartHUDView setEnabled:](self->_HUDView, "setEnabled:", 0);
  }
}

- (void)_layoutIntervalButtonRow
{
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double MaxY;
  double v12;
  double v13;
  _BOOL4 v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;

  -[StockChartView bounds](self, "bounds");
  v4 = v3;
  v5 = *MEMORY[0x24BDBF090];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_referenceBounds");
  v8 = v7;

  -[StockChartView currentDisplayMode](self, "currentDisplayMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "showsTitle");
  if (v10 == 0.0)
  {
    MaxY = 0.0;
  }
  else
  {
    -[ChartTitleLabel frame](self->_titleView, "frame");
    MaxY = CGRectGetMaxY(v18);
  }

  -[StockChartView horizontalPadding](self, "horizontalPadding");
  v13 = v12;
  v14 = -[StockChartView isLandscape](self, "isLandscape");
  if (v14)
    v15 = v4 + v13 * -2.0;
  else
    v15 = v4;
  if (v14)
    v16 = v13;
  else
    v16 = v5;
  v17 = 26.0;
  if (v8 == 667.0)
    v17 = 33.0;
  -[ChartIntervalButtonRow setFrame:](self->_intervalButtonRow, "setFrame:", v16, MaxY, v15, v17);
}

- (void)_layoutVolumeSeparatorLineForGraphRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double MaxY;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  UIView *xAxisKeyline;
  void *v30;
  id v31;
  CGRect v32;
  CGRect v33;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "statusBarOrientation");

  -[StockChartView horizontalPadding](self, "horizontalPadding");
  v11 = v10;
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  MaxY = CGRectGetMaxY(v32);
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  v13 = CGRectGetWidth(v33);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scale");
  v16 = v15;

  -[StockChartView currentDisplayMode](self, "currentDisplayMode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "gutterHeight");
  v19 = v18;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "scale");
  v22 = v21;

  v23 = 0.0;
  if (v9 == 3)
    v23 = v11;
  v24 = x - v23;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_referenceBounds");
  v27 = v26;

  v28 = -0.0;
  if (v27 == 812.0)
    v28 = v11;
  -[UIView setFrame:](self->_xAxisKeyline, "setFrame:", v24, MaxY - (v19 + 1.0 / v22), v13 + v28, 1.0 / v16);
  xAxisKeyline = self->_xAxisKeyline;
  -[StockChartView currentDisplayMode](self, "currentDisplayMode");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "xAxisKeylineColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](xAxisKeyline, "setBackgroundColor:", v30);

}

- (void)createYLabelsForMode:(id)a3
{
  void *v4;
  unint64_t v5;
  id v6;
  void *v7;
  unint64_t v8;
  id v9;

  v9 = a3;
  +[ChartLabelInfoManager chartLabelFont](ChartLabelInfoManager, "chartLabelFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSMutableArray count](self->_yLabelViews, "count");
  if (v5 < objc_msgSend(v9, "yAxisLabelCount"))
  {
    do
    {
      v6 = objc_alloc_init(MEMORY[0x24BDF6B68]);
      objc_msgSend(v6, "setFont:", v4);
      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBackgroundColor:", v7);

      objc_msgSend(v6, "setTextAlignment:", 2);
      -[NSMutableArray addObject:](self->_yLabelViews, "addObject:", v6);
      -[StockChartView addSubview:](self, "addSubview:", v6);

      v8 = -[NSMutableArray count](self->_yLabelViews, "count");
    }
    while (v8 < objc_msgSend(v9, "yAxisLabelCount"));
  }

}

- (void)_setMonthAndYearLabels
{
  unsigned int v3;
  unsigned int v4;
  $87A9BE3275E22128A73FF46D0B92144E *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  float v12;
  float v13;
  float v14;
  unint64_t v15;
  float v16;
  float v17;
  unint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  unsigned int v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  float v34;
  double *p_var0;
  void *v36;
  void *v37;
  uint64_t v38;
  ChartLabelInfo *v39;
  id v40;
  double v42;
  uint64_t v43;
  double v44;
  double v45;
  uint64_t v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  id v52;
  void *v53;
  uint64_t v54;
  ChartLabelInfo *v55;
  void *v56;
  double v57;
  void *v58;
  int v59;
  double v60;
  float v61;
  double v62;
  uint64_t v63;
  double v64;
  void *v65;
  uint64_t v66;
  char v67;
  int v68;
  double v69;
  CGFloat v70;
  int v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  CGFloat v80;
  double v81;
  double v82;
  float v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  uint64_t v90;
  uint64_t v91;
  void *v93;
  int v94;
  double v95;
  double v96;
  double v97;
  double v98;
  _BOOL4 v99;
  _BOOL4 v100;
  int v101;
  void *v102;
  uint64_t v103;
  void *v104;
  StockChartData *chartData;
  void *v106;
  StockChartData *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  double v115;
  double v116;
  uint64_t v117;
  double v118;
  double v119;
  double v120;
  uint64_t v121;
  uint64_t v122;
  double v123;
  StockChartView *v124;
  double v125;
  double v126;
  void *v127;
  void *v128;
  unint64_t v129;
  uint64_t v130;
  double rect;
  uint64_t v132;
  void *v133;
  CGFloat v134;
  CGFloat v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;

  v3 = -[StockChartData stockValueCount](self->_chartData, "stockValueCount");
  if (!v3)
    return;
  v4 = v3;
  v5 = -[StockChartData stockValues](self->_chartData, "stockValues");
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = (void *)objc_msgSend(v6, "copy");

  -[StockChartData marketTimeZone](self->_chartData, "marketTimeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "setTimeZone:", v7);

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", v5->var0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", v5[v4 - 1].var0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "compare:", v8) == -1)
    goto LABEL_99;
  objc_msgSend(v133, "components:fromDate:toDate:options:", 8, v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "month");
  v113 = v8;
  v132 = v11;
  if (objc_msgSend(v10, "month") >= 25)
  {
    v12 = (double)objc_msgSend(v10, "month") / 24.0;
    v13 = floorf(v12);
    v14 = 6.0;
LABEL_9:
    v17 = v13 * v14;
    if (v17 > 12.0)
      v17 = 12.0;
    v15 = (unint64_t)v17;
    goto LABEL_12;
  }
  if (v11 >= 7)
  {
    v16 = (double)objc_msgSend(v10, "month") / 12.0;
    v13 = ceilf(v16);
    v14 = 3.0;
    goto LABEL_9;
  }
  v15 = 1;
LABEL_12:
  v124 = self;
  v111 = v10;
  v18 = objc_msgSend(v10, "month");
  v19 = v15 == 1 || v15 == 12;
  v129 = v15;
  if (v19)
    v20 = v18 / v15 + 1;
  else
    v20 = v18 / v15;
  v21 = 2;
  if (v19)
    v21 = 3;
  v110 = v21;
  v22 = v20 + 1;
  +[ChartLabelInfoManager sharedLabelInfoManager](ChartLabelInfoManager, "sharedLabelInfoManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v20 + 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = v23;
  objc_msgSend(v23, "labelInfoForYAxis");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = v24;
  objc_msgSend(v24, "addObject:", v25);

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v22);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v9;
  objc_msgSend(v133, "components:fromDate:", 8, v9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v4 - 1;
  if ((int)(v4 - 1) >= 0)
  {
    v28 = 0;
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = v27 + 1;
    v34 = (float)v27;
    p_var0 = &v5[v27].var0;
    while (1)
    {
      v36 = v32;
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", *p_var0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "components:fromDate:", 8);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = objc_msgSend(v32, "month");
      if (v38 != objc_msgSend(v26, "month"))
        break;
LABEL_27:

      p_var0 -= 3;
      v30 = v37;
      if (v33-- <= 1)
        goto LABEL_34;
    }
    if (v129 != ++v29)
    {
      if (v28)
        goto LABEL_26;
      if (objc_msgSend(v26, "month") != 1 && (objc_msgSend(v26, "month") - 1) % v129)
      {
        v28 = 0;
        goto LABEL_26;
      }
    }
    objc_msgSend(v127, "setObject:atIndexedSubscript:", v30, (int)v28);
    v39 = objc_alloc_init(ChartLabelInfo);

    -[ChartLabelInfo setPosition:](v39, "setPosition:", (float)((float)(int)v33 / v34));
    objc_msgSend(v128, "addObject:", v39);
    v29 = 0;
    ++v28;
    v31 = v39;
LABEL_26:
    v40 = v32;

    v26 = v40;
    goto LABEL_27;
  }
  v32 = 0;
  v31 = 0;
  v37 = 0;
  v28 = 0;
LABEL_34:

  -[StockChartView lineGraphFrame](v124, "lineGraphFrame");
  v122 = v43;
  v123 = v42;
  v45 = v44;
  v121 = v46;
  rect = v44;
  v109 = v37;
  if ((unint64_t)objc_msgSend(v128, "count") < 2)
  {
    v120 = 0.0;
  }
  else
  {
    objc_msgSend(v128, "objectAtIndexedSubscript:", objc_msgSend(v128, "count") - 2);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "position");
    v49 = v48;
    objc_msgSend(v128, "objectAtIndexedSubscript:", objc_msgSend(v128, "count") - 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "position");
    v120 = v45 * (v49 - v51);

    if (v129 == 12 || v129 == 1)
    {
      v52 = v37;
      if (v129 == 12)
      {
        objc_msgSend(v133, "components:fromDate:", -1, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setMonth:", 1);
        objc_msgSend(v133, "dateFromComponents:", v53);
        v54 = objc_claimAutoreleasedReturnValue();

        v52 = (id)v54;
      }
      objc_msgSend(v127, "setObject:atIndexedSubscript:", v52, (int)v28);
      v55 = objc_alloc_init(ChartLabelInfo);

      objc_msgSend(v128, "objectAtIndexedSubscript:", objc_msgSend(v128, "count") - 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "position");
      -[ChartLabelInfo setPosition:](v55, "setPosition:", v57 - v120 / rect);

      objc_msgSend(v128, "addObject:", v55);
      ++v28;

      v31 = v55;
    }
  }
  -[StockChartView currentDisplayMode](v124, "currentDisplayMode");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "usesDetailedAxisLabels");
  v60 = 0.015;
  if (v59)
    v60 = 0.0199999996;
  v61 = round(rect * v60);

  v115 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v116 = *MEMORY[0x24BDBF070];
  v118 = *(double *)(MEMORY[0x24BDBF070] + 24);
  v119 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v62 = v61;
  v125 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v126 = *MEMORY[0x24BDBF148];
  v130 = v28;
  v63 = 2;
  v64 = 0.5;
  while (2)
  {
    objc_msgSend(v114, "monthLabelInfoArrayForLabelLength:", v63);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if ((int)v130 < 1)
    {
      v69 = v116;
      v70 = v118;
      v134 = v119;
      v135 = v115;
      goto LABEL_94;
    }
    v117 = v63;
    v66 = 0;
    v67 = 0;
    v68 = 0;
    v69 = v116;
    v70 = v118;
    v134 = v119;
    v135 = v115;
    while (1)
    {
      v71 = v68;
      v72 = v31;
      objc_msgSend(v127, "objectAtIndexedSubscript:", v66);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "components:fromDate:", 8, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v66 + 1;
      objc_msgSend(v128, "objectAtIndex:", v66 + 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v132 < 7)
        goto LABEL_49;
      if (objc_msgSend(v74, "month") == 1)
      {
        objc_msgSend(v133, "timeZone");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setStringToYearWithDate:timeZone:", v73, v76);
        v68 = 1;
      }
      else
      {
LABEL_49:
        objc_msgSend(v65, "objectAtIndex:", (objc_msgSend(v74, "month") - 1) % (unint64_t)objc_msgSend(v65, "count"));
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "retainStringAndSizeFromLabelInfo:", v76);
        v68 = 0;
      }

      objc_msgSend(v31, "size");
      v78 = v77;
      v80 = v79;
      if (v129 == 1 || v129 == 12)
      {
        v81 = v120;
        if (!v66)
        {
          objc_msgSend(v31, "position", v120);
          v81 = rect * (1.0 - v82);
        }
        v83 = v81 * v64;
        objc_msgSend(v31, "position");
        v84 = v123;
        v85 = rect;
        v87 = v123 + rect * v86 + v83 - v78 * v64;
      }
      else
      {
        objc_msgSend(v31, "position");
        v84 = v123;
        v85 = rect;
        v87 = v123 + rect * v88;
      }
      v89 = v84;
      v91 = v121;
      v90 = v122;
      if (v78 + v87 > CGRectGetMaxX(*(CGRect *)(&v85 - 2)) || v87 + v78 * v64 < v62)
      {
        objc_msgSend(v31, "setString:", &stru_24D74CF50);
        objc_msgSend(v31, "setSize:", v126, v125);
        v80 = v118;
        v78 = v119;
      }
      -[StockChartView currentDisplayMode](v124, "currentDisplayMode");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = objc_msgSend(v93, "usesDetailedAxisLabels");
      v95 = 6.0;
      if (v94)
        v95 = 10.0;
      v96 = 4.0;
      if ((v71 & (v68 ^ 1)) == 0)
        v96 = 0.0;
      v97 = v96 + v95;

      v98 = fmax(round(v87), 0.0);
      v136.origin.x = v69;
      v136.size.width = v134;
      v136.origin.y = v135;
      v136.size.height = v70;
      if (CGRectIsEmpty(v136))
      {
        v99 = 0;
      }
      else
      {
        v137.origin.y = 0.0;
        v137.origin.x = v98;
        v137.size.width = v78;
        v137.size.height = v80;
        v99 = v97 + CGRectGetMaxX(v137) > v69;
      }
      v100 = v66 == 1 && v99;
      v67 |= v100;
      v101 = v99 ^ v100;
      v64 = 0.5;
      if (v98 >= v62)
        break;
      if ((v101 & 1) != 0)
      {
        v101 = 1;
LABEL_78:
        v98 = v62;
        if (v101 && v132 <= 6)
        {
          objc_msgSend(v31, "setString:", &stru_24D74CF50);
          objc_msgSend(v31, "setSize:", v126, v125);
          v98 = v62;
          goto LABEL_82;
        }
        break;
      }
      v138.origin.x = v69;
      v138.size.width = v134;
      v138.origin.y = v135;
      v138.size.height = v70;
      if (!CGRectIsNull(v138))
      {
        v139.origin.y = 0.0;
        v139.origin.x = v62;
        v139.size.width = v78;
        v139.size.height = v80;
        v101 = v97 + CGRectGetMaxX(v139) > v69;
        goto LABEL_78;
      }
      v134 = v78;
      v135 = 0.0;
      v70 = v80;
      v69 = v62;
LABEL_86:

      v66 = v75;
      if (v130 == v75)
      {
        v63 = v117;
        if ((v67 & 1) == 0)
          goto LABEL_94;
        goto LABEL_91;
      }
    }
    if (!v101)
      goto LABEL_85;
LABEL_82:
    objc_msgSend(v31, "string");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = objc_msgSend(v102, "length");

    if (!v103)
    {
LABEL_85:
      v134 = v78;
      v135 = 0.0;
      v70 = v80;
      v69 = v98;
      goto LABEL_86;
    }
    v63 = v117;
    if (!v117)
    {
      objc_msgSend(v31, "setString:", &stru_24D74CF50);
      objc_msgSend(v31, "setSize:", v126, v125);
      goto LABEL_86;
    }

    v69 = v116;
    v70 = v118;
    v134 = v119;
    v135 = v115;
    if ((v67 & 1) == 0)
    {
      v135 = v115;
      v134 = v119;
      v70 = v118;
      v69 = v116;
      goto LABEL_95;
    }
LABEL_91:
    v140.origin.x = v69;
    v140.size.width = v134;
    v140.origin.y = v135;
    v140.size.height = v70;
    if (!CGRectIsNull(v140) && (unint64_t)objc_msgSend(v128, "count") >= 2)
    {
      objc_msgSend(v128, "objectAtIndexedSubscript:", 1);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "setString:", &stru_24D74CF50);
      objc_msgSend(v104, "setSize:", v126, v125);

    }
LABEL_94:
    if (v63)
    {
LABEL_95:
      v141.origin.x = v69;
      v141.size.width = v134;
      v141.origin.y = v135;
      v141.size.height = v70;
      if (CGRectIsNull(v141))
      {

        --v63;
        continue;
      }
    }
    break;
  }
  chartData = v124->_chartData;
  -[StockChartView currentDisplayMode](v124, "currentDisplayMode");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockChartData setXAxisLabelInfoArray:forDisplayMode:](chartData, "setXAxisLabelInfoArray:forDisplayMode:", v128, v106);

  v107 = v124->_chartData;
  -[StockChartView currentDisplayMode](v124, "currentDisplayMode");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockChartData setLabelPlacement:forDisplayMode:](v107, "setLabelPlacement:forDisplayMode:", v110, v108);

  v9 = v112;
  v8 = v113;
LABEL_99:

}

- (void)_setDayLabelsWithInterval:(unsigned int)a3 realTimePositions:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned int v12;
  $87A9BE3275E22128A73FF46D0B92144E *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double *p_var0;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v27;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  double v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  float v38;
  void *v39;
  double v40;
  void *v41;
  char v42;
  void *v43;
  StockChartData *chartData;
  void *v45;
  StockChartData *v46;
  void *v47;
  void *v48;
  $87A9BE3275E22128A73FF46D0B92144E *v49;
  long double var0;
  void *v51;
  long double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  float v63;
  float v64;
  float v65;
  double v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t i;
  void *v73;
  double v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  unsigned int v79;
  _BOOL4 v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  unsigned int v87;
  void *v88;
  void *v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  uint64_t v95;

  v80 = a4;
  v95 = *MEMORY[0x24BDAC8D0];
  -[StockChartData marketTimeZone](self->_chartData, "marketTimeZone");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v77, "secondsFromGMT");
  v79 = a3;
  v7 = 2;
  if (a3 == 1)
    v7 = 3;
  v76 = v7;
  +[ChartLabelInfoManager sharedLabelInfoManager](ChartLabelInfoManager, "sharedLabelInfoManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = objc_claimAutoreleasedReturnValue();
  v81 = v8;
  v82 = (void *)v9;
  if (self->_selectedInterval == 1
    && (v10 = (void *)v9,
        objc_msgSend(v8, "labelInfoForYAxis"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "addObject:", v11),
        v11,
        self->_selectedInterval == 1))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v86 = 0;
  }
  v12 = -[StockChartData stockValueCount](self->_chartData, "stockValueCount");
  v13 = -[StockChartData stockValues](self->_chartData, "stockValues");
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");

  objc_msgSend(v15, "setTimeZone:", v77);
  if (v12)
  {
    v87 = 0;
    v84 = 0;
    v85 = 0;
    v16 = 0;
    v83 = 0;
    v17 = v12 - 1;
    v18 = (double)v6;
    p_var0 = &v13[v17].var0;
    v20 = 0xFFFFFFFFLL;
    v78 = v15;
    while (1)
    {
      v21 = (void *)v16;
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", *p_var0);
      v16 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "components:fromDate:", 24, v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (int)((*p_var0 + v18) / 86400.0);
      if ((_DWORD)v20 == (_DWORD)v23)
      {
        v23 = v20;
      }
      else
      {
        v88 = (void *)v16;
        v24 = v15;
        if ((_DWORD)v20 == -1)
          v25 = 0;
        else
          v25 = v20 - v23;
        if (v25 >= 1 && v86 != 0)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v17);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "addObject:", v27);

        }
        if (v25 > (uint64_t)v87 || v87 == v25)
        {
          if (v84)
          {
            -[StockChartView currentDisplayMode](self, "currentDisplayMode");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v29, "usesDetailedAxisLabels"))
              goto LABEL_28;
            v30 = objc_msgSend(v22, "month");

            if (v30 != v84)
            {
              objc_msgSend(v82, "lastObject");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "setStringToMonthAndDayWithDate:timeZone:", v85, v77);
LABEL_28:

            }
          }
          objc_msgSend(v81, "labelInfoWithUnsignedInteger:", objc_msgSend(v22, "day"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)objc_msgSend(v31, "copy");

          v33 = -1.0;
          if (v80)
            v33 = (float)((float)v17
                        / (float)(-[StockChartData stockValueCount](self->_chartData, "stockValueCount", -1.0) - 1));
          objc_msgSend(v32, "setPosition:", v33);
          objc_msgSend(v82, "addObject:", v32);
          v84 = objc_msgSend(v22, "month");
          v16 = (uint64_t)v88;
          v34 = v88;

          v83 = v32;
          v85 = v34;
          v87 = v79;
          v15 = v78;
          goto LABEL_32;
        }
        v87 -= v25;
        v15 = v24;
        v16 = (uint64_t)v88;
      }
LABEL_32:

      p_var0 -= 3;
      v17 = (v17 - 1);
      v20 = v23;
      if ((_DWORD)v17 == -1)
        goto LABEL_35;
    }
  }
  v83 = 0;
  v16 = 0;
  v85 = 0;
LABEL_35:
  v89 = (void *)v16;
  v35 = objc_msgSend(v82, "count");
  if (v35)
  {
    v36 = 0;
    v37 = v35 - 1;
    v38 = (float)(unint64_t)(v35 - 1);
    do
    {
      objc_msgSend(v82, "objectAtIndexedSubscript:", v36);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "position");
      if (v40 == -1.0)
        objc_msgSend(v39, "setPosition:", (float)((float)v37 / v38));

      ++v36;
      --v37;
    }
    while (v37 != -1);
  }
  -[StockChartView currentDisplayMode](self, "currentDisplayMode");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "usesDetailedAxisLabels");

  if ((v42 & 1) != 0)
  {
    objc_msgSend(v82, "lastObject");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setStringToMonthAndDayWithDate:timeZone:", v85, v77);

  }
  chartData = self->_chartData;
  -[StockChartView currentDisplayMode](self, "currentDisplayMode");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockChartData setXAxisLabelInfoArray:forDisplayMode:](chartData, "setXAxisLabelInfoArray:forDisplayMode:", v82, v45);

  v46 = self->_chartData;
  -[StockChartView currentDisplayMode](self, "currentDisplayMode");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockChartData setLabelPlacement:forDisplayMode:](v46, "setLabelPlacement:forDisplayMode:", v76, v47);

  if (v86 && -[StockChartData stockValueCount](self->_chartData, "stockValueCount") >= 6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v86, "count"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (v48 && self->_selectedInterval == 1)
    {
      v49 = -[StockChartData stockValues](self->_chartData, "stockValues");
      var0 = v49[-[StockChartData stockValueCount](self->_chartData, "stockValueCount") - 1].var0;
      -[StockChartData marketCloseDate](self->_chartData, "marketCloseDate");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "timeIntervalSince1970");
      v53 = fmod(v52, 86400.0);
      v54 = (v53 - fmod(var0, 86400.0)) / 60.0;

      v55 = 1.0;
      if (v54 > 20.0)
      {
        objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = (void *)objc_msgSend(v56, "copy");

        -[StockChartData marketTimeZone](self->_chartData, "marketTimeZone");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setTimeZone:", v58);

        -[StockChartData marketOpenDate](self->_chartData, "marketOpenDate");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "components:fromDate:", 96, v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        -[StockChartData marketCloseDate](self->_chartData, "marketCloseDate");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "components:fromDate:", 96, v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        v63 = (float)objc_msgSend(v62, "hour");
        v64 = (float)objc_msgSend(v62, "minute") + (float)(v63 * 60.0);
        v65 = (float)objc_msgSend(v60, "hour");
        v66 = v54 / (float)(v64 - (float)((float)objc_msgSend(v60, "minute") + (float)(v65 * 60.0)));
        v55 = 1.0 - v66 / (double)(unint64_t)(objc_msgSend(v86, "count") + 1);

      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v55);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "addObject:", v67);

    }
  }
  else
  {
    v48 = 0;
  }
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v68 = v86;
  v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v90, v94, 16);
  if (v69)
  {
    v70 = v69;
    v71 = *(_QWORD *)v91;
    do
    {
      for (i = 0; i != v70; ++i)
      {
        if (*(_QWORD *)v91 != v71)
          objc_enumerationMutation(v68);
        v73 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * i), "doubleValue");
        objc_msgSend(v73, "numberWithDouble:", v74 / ((double)-[StockChartData stockValueCount](self->_chartData, "stockValueCount") + -1.0));
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "insertObject:atIndex:", v75, 0);

      }
      v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v90, v94, 16);
    }
    while (v70);
  }

  -[StockChartData setInterestingIndexes:](self->_chartData, "setInterestingIndexes:", v48);
}

- (void)_setHourLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *j;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  float v14;
  float v15;
  uint64_t v16;
  float v17;
  double v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  StockChartData *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BOOL8 v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  float v39;
  float v40;
  uint64_t v41;
  uint64_t i;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  unint64_t v47;
  void *v48;
  StockChartData *chartData;
  void *v50;
  StockChartData *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  StockChartView *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  -[StockChartData marketTimeZone](self->_chartData, "marketTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v5);

  -[StockChartData marketOpenDate](self->_chartData, "marketOpenDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockChartData marketCloseDate](self->_chartData, "marketCloseDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:toDate:options:", 96, v6, v7, 0);
  j = (void *)objc_claimAutoreleasedReturnValue();

  -[StockChartData marketOpenDate](self->_chartData, "marketOpenDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", 96, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[StockChartData marketCloseDate](self->_chartData, "marketCloseDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", 96, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v10, "minute");
  if (v13)
    v14 = 1.0 - (float)((float)v13 / 60.0);
  else
    v14 = 0.0;
  v15 = (float)objc_msgSend(v12, "minute") / 60.0;
  v16 = objc_msgSend(j, "hour");
  v17 = ceilf(v14);
  *(float *)&v18 = v15 + v14;
  v19 = (uint64_t)(float)(v17 + (float)v16) - ((float)(v15 + v14) >= 1.0);
  +[ChartLabelInfoManager sharedLabelInfoManager](ChartLabelInfoManager, "sharedLabelInfoManager", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19 <= 1)
    v21 = 1;
  else
    v21 = v19;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(v19 - 25) > 0xFFFFFFFFFFFFFFE7)
  {
    v55 = j;
    v56 = self;
    v54 = v12;
    v26 = objc_msgSend(v12, "hour");
    v27 = -v26;
    v53 = v19;
    do
    {
      v28 = (v26 & ~(v26 >> 63)) + v27;
      v29 = v28 != 0;
      v30 = ((unint64_t)(v28 - v29) * (unsigned __int128)0xAAAAAAAAAAAAAAABLL) >> 64;
      v31 = (v28 - v29) / 0x18uLL;
      if ((v26 & ~(v26 >> 63)) + v27)
        v32 = v31 + 1;
      else
        v32 = v30 >> 4;
      if ((objc_msgSend(v20, "use24hrTime", v53) & 1) != 0)
      {
        v33 = v26 + 24 * v32;
      }
      else if (v26 + 24 * (v29 + (v30 >> 4)) - 12 * ((v26 + 24 * (v29 + (v30 >> 4))) / 0xC))
      {
        v33 = v26 + 24 * (v29 + (v30 >> 4)) - 12 * ((v26 + 24 * (v29 + (v30 >> 4))) / 0xC);
      }
      else
      {
        v33 = 12;
      }
      objc_msgSend(v20, "labelInfoWithUnsignedInteger:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v34, "copy");
      objc_msgSend(v22, "addObject:", v35);

      --v26;
      ++v27;
      --v19;
    }
    while (v19);
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v36 = v22;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    v12 = v54;
    if (v37)
    {
      v38 = v37;
      v39 = 1.0 / (float)(v15 + (float)(v14 + (float)((float)v53 - v17)));
      v40 = 1.0 - (float)(v39 * v15);
      v41 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v58 != v41)
            objc_enumerationMutation(v36);
          objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "setPosition:", v40);
          v40 = v40 - v39;
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      }
      while (v38);
    }

    if (v53 < 13)
    {
      LODWORD(v46) = 0;
      j = v55;
    }
    else
    {
      v43 = objc_alloc_init(MEMORY[0x24BDD1698]);
      objc_msgSend(v36, "objectAtIndex:", 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "string");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "integerValue") & 1;

      v47 = v46 ^ 1;
      for (j = v55; objc_msgSend(v36, "count") > v47; v47 += 2)
        objc_msgSend(v43, "addIndex:", v47);
      objc_msgSend(v36, "removeObjectsAtIndexes:", v43);

    }
    if (v15 > 0.0 || (_DWORD)v46)
    {
      objc_msgSend(v20, "labelInfoForYAxis");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "insertObject:atIndex:", v48, 0);

    }
    chartData = v56->_chartData;
    -[StockChartView currentDisplayMode](v56, "currentDisplayMode");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[StockChartData setXAxisLabelInfoArray:forDisplayMode:](chartData, "setXAxisLabelInfoArray:forDisplayMode:", v36, v50);

    v51 = v56->_chartData;
    -[StockChartView currentDisplayMode](v56, "currentDisplayMode");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[StockChartData setLabelPlacement:forDisplayMode:](v51, "setLabelPlacement:forDisplayMode:", 2, v52);

  }
  else
  {
    objc_msgSend(v20, "labelInfoForYAxis");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v23);

    v24 = self->_chartData;
    -[StockChartView currentDisplayMode](self, "currentDisplayMode");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[StockChartData setXAxisLabelInfoArray:forDisplayMode:](v24, "setXAxisLabelInfoArray:forDisplayMode:", v22, v25);

  }
}

- (void)_prepareXAxisLabelsAndPositions
{
  StockChartData *chartData;
  void *v4;
  void *v5;
  uint64_t v6;
  StockChartView *v7;
  uint64_t v8;
  uint64_t v9;

  if (-[StockChartData stockValueCount](self->_chartData, "stockValueCount"))
  {
    chartData = self->_chartData;
    -[StockChartView currentDisplayMode](self, "currentDisplayMode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[StockChartData xAxisLabelInfoArrayForMode:](chartData, "xAxisLabelInfoArrayForMode:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
    {
      switch(self->_selectedInterval)
      {
        case 0:
          -[StockChartView _setHourLabels](self, "_setHourLabels");
          break;
        case 1:
          v7 = self;
          v8 = 1;
          v9 = 0;
          goto LABEL_9;
        case 2:
          v7 = self;
          v8 = 7;
          v9 = 1;
LABEL_9:
          -[StockChartView _setDayLabelsWithInterval:realTimePositions:](v7, "_setDayLabelsWithInterval:realTimePositions:", v8, v9);
          break;
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
          -[StockChartView _setMonthAndYearLabels](self, "_setMonthAndYearLabels");
          break;
        default:
          return;
      }
    }
  }
}

- (double)_evennessOfValue:(double)a3 inRange:(double)a4
{
  double result;
  float v7;
  double v8;
  float v9;
  double v10;
  double v11;
  double v12;

  result = 1.0;
  if (a3 == 0.0)
    return result;
  v7 = 0.0;
  if (fmod(a3, 10.0) == 0.0)
  {
    do
    {
      v7 = v7 + 1.0;
      a3 = a3 / 10.0;
    }
    while (fmod(a3, 10.0) == 0.0);
  }
  else
  {
    do
    {
      do
      {
        v7 = v7 + -1.0;
        a3 = a3 * 10.0;
        v8 = fmod(a3, 10.0);
      }
      while (v8 < 0.0);
    }
    while (v8 > 0.0);
    v7 = v7 + 1.0;
    a3 = a3 / 10.0;
  }
  if (fabs(fmod(a3, 25.0)) < 0.001)
  {
    v9 = 1.0;
LABEL_14:
    v7 = v7 + v9;
    goto LABEL_15;
  }
  if (fabs(fmod(a3, 5.0)) < 0.001)
  {
    v7 = v7 + 0.9;
    goto LABEL_15;
  }
  if (fabs(fmod(a3, 2.0)) < 0.001)
  {
    v9 = 0.25;
    goto LABEL_14;
  }
LABEL_15:
  v10 = floor(log10(a4));
  v11 = v7;
  if (v10 >= v7)
    return 1.0 / (vabdd_f64(v10, v11) + 1.0);
  v12 = v11 - v10;
  if (v12 > 0.8)
    v12 = 0.8;
  return v12 * 0.5 + 0.85;
}

- (void)_prepareYAxisLabelsAndPositionsForDisplayMode:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  StockChartData *chartData;
  float v8;
  float v9;
  float v10;
  float v11;
  int64_t v12;
  float v13;
  float v14;
  float v15;
  int v16;
  int v17;
  double v18;
  int v19;
  float v20;
  _BOOL4 v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  void *v25;
  unsigned int v26;
  void *v27;
  ChartLabelInfo *v28;
  float v29;
  int v30;
  double v31;
  uint64_t v32;
  double v33;
  float v34;
  void *v35;
  ChartLabelInfo *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  double v42;
  id v43;

  v43 = a3;
  -[StockChartView graphViewForMode:](self, "graphViewForMode:", v43);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockChartData yAxisLabelInfoArrayForMode:](self->_chartData, "yAxisLabelInfoArrayForMode:", v43);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[StockChartData stockValueCount](self->_chartData, "stockValueCount"))
  {
LABEL_4:
    if (self->_chartData && objc_msgSend(v43, "horizontalGridlineCount"))
    {
      v6 = objc_msgSend(v43, "horizontalGridlineCount");
      if (v6 == objc_msgSend(v43, "yAxisLabelCount"))
        objc_msgSend(v4, "setDottedLinePositionsWithLabelInfo:", v5);
      else
        objc_msgSend(v4, "setEvenlySpacedDottedLinePositionsWithCount:", objc_msgSend(v43, "horizontalGridlineCount"));
    }
    goto LABEL_51;
  }
  if (self->_chartData)
  {
    if (objc_msgSend(v5, "count"))
      goto LABEL_4;
    chartData = self->_chartData;
  }
  else
  {
    chartData = 0;
  }
  v8 = (double)-[StockChartData minValue](chartData, "minValue")[8];
  v9 = (double)-[StockChartData maxValue](self->_chartData, "maxValue")[8];
  -[StockChartData previousClosePrice](self->_chartData, "previousClosePrice");
  if (v10 != 0.0)
  {
    v11 = v10;
    v12 = -[StockChartData chartInterval](self->_chartData, "chartInterval");
    v13 = v11 <= v8 ? v11 : v8;
    v14 = v11 <= v9 ? v9 : v11;
    if (!v12)
    {
      v9 = v14;
      v8 = v13;
    }
  }
  v15 = v9 - v8;
  v16 = objc_msgSend(v43, "yAxisLabelCount");
  v17 = v16 - 1;
  v18 = (float)(v9 - v8) / (double)(v16 - 1);
  v19 = objc_msgSend(v43, "usesDetailedAxisLabels");
  v20 = 1.0;
  if (v19)
    v20 = 1.5;
  v21 = v18 < (float)(v20 + v20) || v9 < (float)(v20 * 100.0);
  if (v21)
  {
    if (v18 >= 0.0199999996)
      v22 = 2;
    else
      v22 = 3;
    v23 = -[Stock pricePrecision](self->_stock, "pricePrecision");
    if (v22 <= v23)
      v24 = v23;
    else
      v24 = v22;
  }
  else
  {
    v24 = 0;
  }
  -[StockChartData setYAxisFractionDigits:](self->_chartData, "setYAxisFractionDigits:", v24);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v42 = v15 / (double)v17;
    v40 = v5;
    v41 = v4;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = (float)v17;
    v30 = -v16;
    v31 = 0.0;
    do
    {
      if ((objc_msgSend(v43, "usesDetailedAxisLabels", v40, v41) & 1) != 0)
      {
        v34 = v8;
        if (v26)
        {
          v33 = v8 + v31 * v42;
          *(float *)&v33 = v33;
          if (v30 + v26 == -1)
            v34 = v9;
          else
            v34 = *(float *)&v33;
        }
      }
      else
      {
        v34 = v8 + (float)(v15 * (float)((float)v26 / v29));
      }
      if (v21)
      {
        *(float *)&v33 = v34;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v33);
      }
      else
      {
        LODWORD(v32) = llroundf(v34);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v32);
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = objc_alloc_init(ChartLabelInfo);
      -[ChartLabelInfo setPosition:](v36, "setPosition:", (float)((float)(v34 - v8) / v15));
      +[StockDataFormatter sharedDataFormatter](StockDataFormatter, "sharedDataFormatter");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "formattedNumber:withPrecision:useGroupSeparator:", v35, -[StockChartData yAxisFractionDigits](self->_chartData, "yAxisFractionDigits"), 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[ChartLabelInfo setString:](v36, "setString:", v38);

      objc_msgSend(v25, "addObject:", v36);
      v31 = v31 + 1.0;
      ++v26;
      v27 = v35;
      v28 = v36;
    }
    while (v30 + v26);

    v5 = v40;
    v4 = v41;
  }
  if (objc_msgSend(v43, "horizontalGridlineCount"))
  {
    v39 = objc_msgSend(v43, "horizontalGridlineCount");
    if (v39 == objc_msgSend(v43, "yAxisLabelCount"))
      objc_msgSend(v4, "setDottedLinePositionsWithLabelInfo:", v25);
    else
      objc_msgSend(v4, "setEvenlySpacedDottedLinePositionsWithCount:", objc_msgSend(v43, "horizontalGridlineCount"));
  }
  -[StockChartData setYAxisLabelInfoArray:forDisplayMode:](self->_chartData, "setYAxisLabelInfoArray:forDisplayMode:", v25, v43);

LABEL_51:
}

- (void)_layoutYLabels
{
  StockChartData *chartData;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double y;
  double MaxX;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double MaxY;
  void *v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  _BOOL4 v56;
  double v57;
  double v58;
  double v59;
  uint64_t v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  CGFloat v70;
  CGFloat v71;
  float v72;
  double v73;
  uint64_t v74;
  double height;
  id v76;
  double v77;
  double v78;
  float v79;
  double v80;
  double v81;
  CGFloat v82;
  double v83;
  CGFloat rect2;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;

  chartData = self->_chartData;
  -[StockChartView currentDisplayMode](self, "currentDisplayMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockChartData yAxisLabelInfoArrayForMode:](chartData, "yAxisLabelInfoArrayForMode:", v4);
  v76 = (id)objc_claimAutoreleasedReturnValue();

  v74 = objc_msgSend(v76, "count");
  if (v74)
  {
    -[StockChartView currentGraphView](self, "currentGraphView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    -[StockChartView lineGraphFrame](self, "lineGraphFrame");
    y = v85.origin.y;
    height = v85.size.height;
    MaxX = CGRectGetMaxX(v85);
    -[StockChartView currentDisplayMode](self, "currentDisplayMode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "graphOverlapsYAxisLabels") & 1) != 0)
    {
      v17 = MaxX + -4.0;
    }
    else
    {
      v86.origin.x = v7;
      v86.origin.y = v9;
      v86.size.width = v11;
      v86.size.height = v13;
      v17 = CGRectGetMaxX(v86);
    }
    v81 = v17;

    +[ChartLabelInfoManager chartLabelFont](ChartLabelInfoManager, "chartLabelFont");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "leading");
    v20 = v19;

    -[StockChartView currentDisplayMode](self, "currentDisplayMode");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "yAxisLabelCount");

    v23 = ceil(v20);
    v24 = v22 == 2 ? 0.0 : v23;
    v25 = -[NSMutableArray count](self->_yLabelViews, "count");
    if (v25)
    {
      v26 = v25;
      v71 = v7;
      v27 = 0;
      v28 = 0;
      v29 = 0;
      v30 = 0;
      v73 = y - v24;
      v31 = *(double *)(MEMORY[0x24BDBF090] + 16);
      rect2 = *(double *)(MEMORY[0x24BDBF090] + 24);
      v32 = v9;
      v34 = *MEMORY[0x24BDBF090];
      v33 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v79 = (float)(v25 - v74);
      v72 = (float)(unint64_t)(v25 - 1);
      v69 = v32 + 15.0;
      v70 = v32;
      v77 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      v78 = *MEMORY[0x24BDBEFB0];
      v80 = v11;
      while (1)
      {
        v35 = v13;
        v36 = (double)v30;
        v37 = roundf((float)((float)(unint64_t)(v29 + 1) / v79) * (float)(unint64_t)(v74 - 1 + v29));
        -[NSMutableArray objectAtIndex:](self->_yLabelViews, "objectAtIndex:", v30);
        v38 = objc_claimAutoreleasedReturnValue();

        v39 = v37 == (double)v30 ? v29 + 1 : v29;
        v27 = (void *)v38;
        v82 = v31;
        if (v37 == v36)
          break;
        objc_msgSend(v76, "objectAtIndex:", v30 - v29);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v40, "size");
        v31 = v41;
        v43 = v42;
        v83 = v81 - v41;
        if (v74 == 2)
        {
          if (v30 == v29)
          {
            v87.origin.y = v70;
            v87.origin.x = v71;
            v87.size.width = v11;
            v13 = v35;
            v87.size.height = v35;
            MaxY = CGRectGetMaxY(v87);
            -[StockChartView currentDisplayMode](self, "currentDisplayMode");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "gutterHeight");
            v47 = MaxY - v46;
            objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "scale");
            v50 = v47 + -1.0 / v49 + -4.0;
            objc_msgSend(v27, "font");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "ascender");
            v53 = RoundToPixel(v50 - v52);

          }
          else
          {
            objc_msgSend(v27, "font");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "ascender");
            v53 = RoundToPixel(v69 - v57);
            v13 = v35;
          }
          v55 = v83;

          goto LABEL_26;
        }
        if (!v40)
          goto LABEL_20;
        objc_msgSend(v40, "position");
LABEL_21:
        v53 = RoundToPixel(v73 + height * (1.0 - v54));
        if (v37 == v36)
        {
          v56 = 1;
          v28 = v40;
          v13 = v35;
          v55 = v83;
          goto LABEL_27;
        }
        v13 = v35;
        v55 = v83;
LABEL_26:
        v88.origin.x = v55;
        v88.origin.y = v53;
        v88.size.width = v31;
        v88.size.height = v43;
        v89.origin.x = v34;
        v89.origin.y = v33;
        v89.size.width = v82;
        v89.size.height = rect2;
        v56 = CGRectIntersectsRect(v88, v89);
        v28 = v40;
LABEL_27:
        objc_msgSend(v27, "bounds");
        v59 = v58;
        if (!v56 || v31 > v58)
        {
          v60 = objc_msgSend(MEMORY[0x24BDF6F90], "areAnimationsEnabled");
          objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationsEnabled:", 0);
          objc_msgSend(v27, "center");
          objc_msgSend(v27, "setCenter:", v61 + (v31 - v59) * 0.5);
          objc_msgSend(v27, "setBounds:", 0.0, 0.0, v31, v43);
          objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationsEnabled:", v60);
        }
        objc_msgSend(v27, "bounds");
        v31 = v62;
        v64 = v63;
        -[StockChartView currentDisplayMode](self, "currentDisplayMode");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "axisLabelsColor");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setTextColor:", v66);

        rect2 = v64;
        objc_msgSend(v27, "setFrame:", v55, v53, v31, v64);
        objc_msgSend(v27, "setAlpha:", (double)!v56);
        if (!v56)
        {
          objc_msgSend(v28, "string");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setText:", v67);

        }
        objc_msgSend(v27, "setHidden:", 0);
        objc_msgSend(v27, "superview");
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v68)
          -[StockChartView addSubview:](self, "addSubview:", v27);
        if (v56)
          v34 = v78;
        else
          v34 = v55;
        if (v56)
          v33 = v77;
        else
          v33 = v53;
        ++v30;
        v29 = v39;
        v11 = v80;
        if (v26 == v30)
        {

          goto LABEL_42;
        }
      }

      v83 = v81 - v31;
      v43 = rect2;
LABEL_20:
      v40 = 0;
      v54 = (float)((float)v30 / v72);
      goto LABEL_21;
    }
  }
LABEL_42:

}

- (void)_layoutAxesAndXLabels
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  StockChartData *chartData;
  void *v12;
  StockChartData *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  float v44;
  double v45;
  float v46;
  double MaxY;
  uint64_t v48;
  unsigned int v49;
  void *v50;
  unint64_t v51;
  double v52;
  void *v53;
  double v54;
  float v55;
  float v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  float v71;
  BOOL v72;
  uint64_t v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  float v81;
  CGFloat MinX;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  double v87;
  void *v88;
  uint64_t v89;
  void *v90;
  double v91;
  double v92;
  void *v93;
  double v94;
  uint64_t v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  CGFloat v99;
  double rect;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;

  v116 = *MEMORY[0x24BDAC8D0];
  -[StockChartView currentGraphView](self, "currentGraphView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  rect = v4;

  -[StockChartView lineGraphFrame](self, "lineGraphFrame");
  v6 = v5;
  v98 = v8;
  v99 = v7;
  v10 = v9;
  chartData = self->_chartData;
  -[StockChartView currentDisplayMode](self, "currentDisplayMode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = -[StockChartData labelPlacementForDisplayMode:](chartData, "labelPlacementForDisplayMode:", v12);

  v13 = self->_chartData;
  -[StockChartView currentDisplayMode](self, "currentDisplayMode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockChartData xAxisLabelInfoArrayForMode:](v13, "xAxisLabelInfoArrayForMode:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "count");
  -[StockChartView currentGraphView](self, "currentGraphView");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  while (-[NSMutableArray count](self->_axisViews, "count") < v16)
  {
    v17 = objc_alloc_init(MEMORY[0x24BDF6F90]);
    -[NSMutableArray addObject:](self->_axisViews, "addObject:", v17);

  }
  if (-[NSMutableArray count](self->_axisViews, "count") > v16)
  {
    -[NSMutableArray subarrayWithRange:](self->_axisViews, "subarrayWithRange:", v16, -[NSMutableArray count](self->_axisViews, "count") - v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    v112 = 0u;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v109, v115, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v110;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v110 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * i), "setHidden:", 1);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v109, v115, 16);
      }
      while (v20);
    }
    -[NSMutableArray removeObjectsInArray:](self->_axisViews, "removeObjectsInArray:", v18);

  }
  if (v16)
  {
    +[ChartLabelInfoManager chartLabelFont](ChartLabelInfoManager, "chartLabelFont");
    v23 = objc_claimAutoreleasedReturnValue();
    while (-[NSMutableArray count](self->_xLabelViews, "count") < v16)
    {
      v24 = objc_alloc_init(MEMORY[0x24BDF6B68]);
      objc_msgSend(v24, "setFont:", v23);
      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setBackgroundColor:", v25);

      -[NSMutableArray addObject:](self->_xLabelViews, "addObject:", v24);
    }
    if (-[NSMutableArray count](self->_xLabelViews, "count") > v16)
    {
      -[NSMutableArray subarrayWithRange:](self->_xLabelViews, "subarrayWithRange:", v16, -[NSMutableArray count](self->_xLabelViews, "count") - v16);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = 0u;
      v106 = 0u;
      v107 = 0u;
      v108 = 0u;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v105, v114, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v106;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v106 != v29)
              objc_enumerationMutation(v26);
            objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * j), "setHidden:", 1);
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v105, v114, 16);
        }
        while (v28);
      }
      -[NSMutableArray removeObjectsInArray:](self->_xLabelViews, "removeObjectsInArray:", v26);

    }
    v89 = v23;
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v31 = self->_xLabelViews;
    v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v101, v113, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v102;
      do
      {
        for (k = 0; k != v33; ++k)
        {
          if (*(_QWORD *)v102 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * k);
          -[StockChartView currentDisplayMode](self, "currentDisplayMode", v89);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "axisLabelsColor");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setTextColor:", v38);

        }
        v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v101, v113, 16);
      }
      while (v33);
    }

    if (v16 <= 1)
    {
      v45 = 0.0;
    }
    else
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", v16 - 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "position");
      v41 = v40;
      objc_msgSend(v15, "objectAtIndexedSubscript:", v16 - 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "position");
      v44 = v10 * (v41 - v43);

      v45 = v44;
    }
    v46 = round(v10 * 0.015);
    -[UIView frame](self->_xAxisKeyline, "frame", v89);
    MaxY = CGRectGetMaxY(v117);
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v91 = v6 + v45;
    v92 = v45;
    v94 = v46;
    v51 = 0x24BDF6000uLL;
    v52 = 0.0;
    v96 = v10;
    v97 = v6;
    do
    {
      v53 = v50;
      objc_msgSend(v15, "objectAtIndex:", v48);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v50, "position");
      v55 = v54;
      v56 = round(v6 + v10 * v55);
      -[NSMutableArray objectAtIndex:](self->_xLabelViews, "objectAtIndex:", v48);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "font");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "ascender");
      v60 = RoundToPixel(v59);

      v61 = v56;
      objc_msgSend(*(id *)(v51 + 3384), "mainScreen");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "scale");
      v64 = v63;

      if (v49)
      {
        objc_msgSend(*(id *)(v51 + 3384), "mainScreen");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "scale");
        v61 = v61 + -1.0 / v66 * 0.5;

      }
      v67 = MaxY;
      v68 = MaxY + v60 - rect;
      v69 = 1.0 / v64;
      -[NSMutableArray objectAtIndex:](self->_axisViews, "objectAtIndex:", v48);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = 1.0 - v55;
      if ((float)(1.0 - v55) > v55)
        v71 = v55;
      v72 = v71 >= 0.02 || v49 == 0;
      v73 = !v72;
      if (v72)
      {
        objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.2);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "setBackgroundColor:", v74);

        objc_msgSend(v70, "setFrame:", v61, rect, 1.0 / v64, v68);
        objc_msgSend(v70, "superview");
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v75)
          -[StockChartView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v70, v93);
      }
      objc_msgSend(v70, "setHidden:", v73);
      objc_msgSend(v50, "size");
      v77 = v76;
      v79 = v78;
      switch(v95)
      {
        case 3:
          if (v49 == 1)
          {
            v120.size.width = v96;
            v120.origin.x = v97;
            v120.size.height = v98;
            v120.origin.y = v99;
            v80 = CGRectGetMaxX(v120) - v61;
          }
          else
          {
            v80 = v91 - v61;
            if (v16 - 1 != v48)
              v80 = v92;
          }
          v81 = v80 * 0.5;
          v121.origin.x = v61;
          v121.origin.y = rect;
          v121.size.width = v69;
          v121.size.height = v68;
          MinX = CGRectGetMinX(v121);
          v52 = RoundToPixel(MinX + v81 - v77 * 0.5);
          break;
        case 2:
          v119.origin.x = v61;
          v119.origin.y = rect;
          v119.size.width = v69;
          v119.size.height = v68;
          v52 = CGRectGetMaxX(v119) + 2.0;
          break;
        case 1:
          v118.origin.x = v61;
          v118.origin.y = rect;
          v118.size.width = v69;
          v118.size.height = v68;
          v52 = CGRectGetMidX(v118) + v77 * -0.5;
          break;
      }
      if (v52 <= v94)
        v52 = v94;
      objc_msgSend(v50, "string");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setText:", v83);

      objc_msgSend(v50, "accessibilityLabel");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setAccessibilityLabel:", v84);

      MaxY = v67;
      objc_msgSend(v57, "setFrame:", v52, v67, v77, v79);
      objc_msgSend(v50, "string");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v85, "length");
      v87 = 0.0;
      if (v86)
        v87 = 1.0;
      objc_msgSend(v57, "setAlpha:", v87);

      objc_msgSend(v57, "superview");
      v88 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v88)
        -[StockChartView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v57, v93);
      v10 = v96;
      v6 = v97;
      v122.origin.x = v97;
      v122.size.height = v98;
      v122.origin.y = v99;
      v122.size.width = v96;
      objc_msgSend(v57, "setHidden:", v52 > CGRectGetMaxX(v122));

      v48 = ++v49;
      v51 = 0x24BDF6000;
    }
    while (v16 > v49);

  }
}

- (void)_layoutTopLabelsHidden:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  CGRect v14;

  v3 = a3;
  -[StockChartView bounds](self, "bounds");
  v6 = v5;
  -[StockChartView horizontalPadding](self, "horizontalPadding");
  v8 = v7;
  v9 = -[StockChartView isLandscape](self, "isLandscape");
  v10 = 0.0;
  v11 = v6 + v8 * -2.0;
  if (v9)
    v10 = v8 + 0.0;
  else
    v11 = v6;
  v12 = 1.0;
  if (!v3)
    v12 = 37.0;
  v13 = 0;
  v14 = CGRectIntegral(*(CGRect *)&v10);
  -[ChartTitleLabel setFrame:](self->_titleView, "setFrame:", v14.origin.x, v14.origin.y, v14.size.width, v14.size.height);
  -[ChartTitleLabel setAlpha:](self->_titleView, "setAlpha:", (double)!v3);
}

- (double)widestYLabelWidthForMode:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  double v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[StockChartData yAxisLabelInfoArrayForMode:](self->_chartData, "yAxisLabelInfoArrayForMode:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "size");
        if (v9 > v7)
          v7 = v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (void)hideLabelsAxesAndGraphs
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[UIView setHidden:](self->_xAxisKeyline, "setHidden:", 1);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = self->_axisViews;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v27;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v7++), "setHidden:", 1);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v5);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = self->_xLabelViews;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v12++), "setHidden:", 1);
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    }
    while (v10);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = self->_yLabelViews;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v17++), "setHidden:", 1, (_QWORD)v18);
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
    }
    while (v15);
  }

  -[StockChartView enumerateGraphsAndDisplayModesUsingBlock:](self, "enumerateGraphsAndDisplayModesUsingBlock:", &__block_literal_global_62);
  -[ChartHUDView setOverlayHidden:](self->_HUDView, "setOverlayHidden:", 1);
}

uint64_t __41__StockChartView_hideLabelsAxesAndGraphs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setHidden:", 1);
}

- (void)_setShowingLoadingStatus:(BOOL)a3
{
  if (a3)
  {
    -[StockChartView hideLabelsAxesAndGraphs](self, "hideLabelsAxesAndGraphs");
    -[StockChartView layoutLoadingStatus](self, "layoutLoadingStatus");
    -[LoadingLabel setHidden:](self->_loadingLabel, "setHidden:", 0);
    -[LoadingLabel setAlpha:](self->_loadingLabel, "setAlpha:", 1.0);
  }
  else
  {
    -[LoadingLabel setHidden:](self->_loadingLabel, "setHidden:", 1);
  }
}

- (void)layoutLoadingStatus
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  -[StockChartView error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "code");

  if (v4)
  {
    if (v4 == 2 && self->_selectedInterval <= 1uLL)
    {
      +[StocksBundles getBundle:](StocksBundles, "getBundle:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("No Chart Available");
    }
    else
    {
      +[StocksBundles getBundle:](StocksBundles, "getBundle:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("Error Retrieving Chart");
    }
  }
  else
  {
    +[StocksBundles getBundle:](StocksBundles, "getBundle:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("RETRIEVING_CHART");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24D74CF50, CFSTR("Localizable"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[LoadingLabel setText:showingActivity:](self->_loadingLabel, "setText:showingActivity:", v14, v4 == 0);
  -[StockChartView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  -[LoadingLabel frame](self->_loadingLabel, "frame");
  -[LoadingLabel setFrame:](self->_loadingLabel, "setFrame:", round((v9 - v12) * 0.5), round((v11 - v13) * 0.5));

}

- (void)setLabelsAndAxesAlpha:(double)a3
{
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = self->_axisViews;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v9++), "setAlpha:", a3);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = self->_xLabelViews;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v14++), "setAlpha:", a3);
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = self->_yLabelViews;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v19++), "setAlpha:", a3, (_QWORD)v20);
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

}

- (void)prepareForTransitionToDisplayMode:(id)a3
{
  void *v4;
  void *v5;
  ChartTitleLabel *titleView;
  double v7;
  Stock *stock;
  double v9;
  ChartTitleLabel *v10;
  Stock *v11;
  double v12;
  id v13;

  v13 = a3;
  self->_animating = 1;
  -[StockChartView graphViewForMode:](self, "graphViewForMode:", v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockChartView currentGraphView](self, "currentGraphView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "showsTitle");
  titleView = self->_titleView;
  if (v7 == 0.0)
  {
    v9 = 0.0;
    v10 = self->_titleView;
    v11 = 0;
  }
  else
  {
    stock = self->_stock;
    objc_msgSend(v13, "chartSize");
    v10 = titleView;
    v11 = stock;
  }
  -[ChartTitleLabel prepareStringsWithStock:width:](v10, "prepareStringsWithStock:width:", v11, v9);
  if ((objc_msgSend(v4, "isRendered") & 1) != 0)
  {
    objc_msgSend(v5, "frame");
    objc_msgSend(v4, "setFrame:");
    objc_msgSend(v4, "setAlpha:", 0.0);
  }
  else
  {
    -[StockChartView layoutLoadingStatus](self, "layoutLoadingStatus");
  }
  objc_msgSend(v13, "showsTitle");
  if (v12 == 0.0)
    -[StockChartView setShowingHUD:](self, "setShowingHUD:", 0);
  else
    -[StockChartView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_titleView, self->_HUDView);

}

- (void)animateTransitionToDisplayMode:(id)a3
{
  void *v4;
  void *v5;
  int64_t preferredInterval;
  void *v7;
  uint64_t v8;
  char v9;
  LoadingLabel *loadingLabel;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  v19 = a3;
  -[StockChartView currentGraphView](self, "currentGraphView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockChartView graphViewForMode:](self, "graphViewForMode:", v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockChartView setCurrentDisplayMode:](self, "setCurrentDisplayMode:", v19);
  preferredInterval = self->_preferredInterval;
  if (preferredInterval == self->_selectedInterval)
  {
    -[StockChartView currentDisplayMode](self, "currentDisplayMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "maxInterval");

    if (preferredInterval <= v8)
      goto LABEL_5;
    preferredInterval = self->_preferredInterval;
  }
  -[StockChartView setSelectedInterval:](self, "setSelectedInterval:", -[StockChartView maxSupportedIntervalFromDesiredInterval:](self, "maxSupportedIntervalFromDesiredInterval:", preferredInterval));
  -[StockChartView updateChartViewForSelectedInterval](self, "updateChartViewForSelectedInterval");
  -[ChartIntervalButtonRow selectChartIntervalButtonForInterval:](self->_intervalButtonRow, "selectChartIntervalButtonForInterval:", -[StockChartView selectedInterval](self, "selectedInterval"));
LABEL_5:
  objc_msgSend(v4, "setAlpha:", 0.0);
  v9 = objc_msgSend(v5, "isRendered");
  loadingLabel = self->_loadingLabel;
  if ((v9 & 1) != 0)
  {
    -[LoadingLabel setAlpha:](loadingLabel, "setAlpha:", 0.0);
    objc_msgSend(v5, "setAlpha:", 1.0);
  }
  else
  {
    -[LoadingLabel setAlpha:](loadingLabel, "setAlpha:", 1.0);
    -[StockChartView setLabelsAndAxesAlpha:](self, "setLabelsAndAxesAlpha:", 0.0);
  }
  -[StockChartView graphViewFrameForMode:](self, "graphViewFrameForMode:", v19);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v5, "setFrame:", v12, v14, v16, v18);
  -[StockChartView forceLayout](self, "forceLayout");

}

- (void)didTransitionToDisplayMode:(id)a3
{
  double v4;
  void *v5;
  char v6;
  void *v7;

  objc_msgSend(a3, "showsTitle");
  if (v4 == 0.0)
    -[ChartTitleLabel removeFromSuperview](self->_titleView, "removeFromSuperview");
  -[StockChartView currentGraphView](self, "currentGraphView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRendered");

  if ((v6 & 1) != 0)
  {
    -[LoadingLabel setAlpha:](self->_loadingLabel, "setAlpha:", 0.0);
    -[StockChartView currentGraphView](self, "currentGraphView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 1.0);

    -[StockChartView setLabelsAndAxesAlpha:](self, "setLabelsAndAxesAlpha:", 1.0);
  }
  else
  {
    -[StockChartView hideLabelsAxesAndGraphs](self, "hideLabelsAxesAndGraphs");
  }
  self->_animating = 0;
  if (self->_layoutPending)
  {
    -[StockChartView setNeedsLayout](self, "setNeedsLayout");
    self->_layoutPending = 0;
  }
  -[ChartTitleLabel prepareStringsForDeferredStockIfNeeded](self->_titleView, "prepareStringsForDeferredStockIfNeeded");
  -[StockChartView hideOtherGraphViews](self, "hideOtherGraphViews");
  -[StockChartView updateHUDView](self, "updateHUDView");
}

- (int64_t)maxSupportedIntervalFromDesiredInterval:(int64_t)a3
{
  void *v4;
  uint64_t v5;

  -[StockChartView currentDisplayMode](self, "currentDisplayMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "maxInterval");

  if (v5 >= a3)
    return a3;
  else
    return v5;
}

- (void)updateChartViewForSelectedInterval
{
  -[StockChartView setShowingHUD:](self, "setShowingHUD:", 0);
  -[StockChartView reloadData](self, "reloadData");
}

- (void)chartIntervalButtonRow:(id)a3 didSelectChartInterval:(int64_t)a4
{
  int64_t v6;
  int64_t v7;
  id v8;

  v6 = -[StockChartView selectedInterval](self, "selectedInterval", a3);
  v7 = -[StockChartView maxSupportedIntervalFromDesiredInterval:](self, "maxSupportedIntervalFromDesiredInterval:", a4);
  if (v7 != v6)
  {
    self->_preferredInterval = v7;
    -[StockChartView setSelectedInterval:](self, "setSelectedInterval:", v7);
    -[StockChartView updateChartViewForSelectedInterval](self, "updateChartViewForSelectedInterval");
    -[StockChartView chartViewDelegate](self, "chartViewDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stockChartView:chartIntervalDidChange:", self, a4);

  }
}

- (StocksViewController)controller
{
  return (StocksViewController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (Stock)stock
{
  return self->_stock;
}

- (StockChartData)chartData
{
  return self->_chartData;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (StockChartDisplayMode)currentDisplayMode
{
  return self->_currentDisplayMode;
}

- (BOOL)drawsBottomLine
{
  return self->_drawsBottomLine;
}

- (int64_t)selectedInterval
{
  return self->_selectedInterval;
}

- (void)setSelectedInterval:(int64_t)a3
{
  self->_selectedInterval = a3;
}

- (StockChartViewDelegate)chartViewDelegate
{
  return (StockChartViewDelegate *)objc_loadWeakRetained((id *)&self->_chartViewDelegate);
}

- (void)setChartViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_chartViewDelegate, a3);
}

- (int64_t)preferredInterval
{
  return self->_preferredInterval;
}

- (void)setPreferredInterval:(int64_t)a3
{
  self->_preferredInterval = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chartViewDelegate);
  objc_storeStrong((id *)&self->_currentDisplayMode, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_chartData, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_graphViews, 0);
  objc_storeStrong((id *)&self->_displayModes, 0);
  objc_storeStrong((id *)&self->_xAxisKeyline, 0);
  objc_storeStrong((id *)&self->_chartBottomKeyline, 0);
  objc_storeStrong((id *)&self->_chartTopKeyline, 0);
  objc_storeStrong((id *)&self->_HUDView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_previousCloseLabel, 0);
  objc_storeStrong((id *)&self->_previousCloseLine, 0);
  objc_storeStrong((id *)&self->_yLabelViews, 0);
  objc_storeStrong((id *)&self->_xLabelViews, 0);
  objc_storeStrong((id *)&self->_axisViews, 0);
  objc_storeStrong((id *)&self->_stock, 0);
  objc_storeStrong((id *)&self->_intervalButtonRow, 0);
  objc_storeStrong((id *)&self->_chartUpdater, 0);
  objc_storeStrong((id *)&self->_loadingLabel, 0);
}

@end
