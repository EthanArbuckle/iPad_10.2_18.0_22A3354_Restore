@implementation SPChartView

- (void)clearData
{
  StockChartData *chartData;

  chartData = self->_chartData;
  self->_chartData = 0;

  -[StockGraphView clearData](self->_graph, "clearData");
}

- (void)setBackgroundGradient:(CGGradient *)a3
{
  -[StockChartDisplayMode setBackgroundGradient:](self->_currentDisplayMode, "setBackgroundGradient:", a3);
}

- (void)setYAxisLabelCount:(unint64_t)a3
{
  -[StockChartDisplayMode setYAxisLabelCount:](self->_currentDisplayMode, "setYAxisLabelCount:", a3);
}

- (SPChartView)initWithStockChartDisplayMode:(id)a3
{
  id v5;
  SPChartView *v6;
  SPChartView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPChartView;
  v6 = -[SPChartView init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_currentDisplayMode, a3);
    -[StockGraphView setDisplayMode:](v7->_graph, "setDisplayMode:", v7->_currentDisplayMode);
  }

  return v7;
}

- (SPChartView)initWithFrame:(CGRect)a3
{
  SPChartView *v3;
  SPChartView *v4;
  StockGraphView *v5;
  uint64_t v6;
  StockGraphView *graph;
  uint64_t v8;
  StockChartDisplayMode *currentDisplayMode;
  void *v10;
  StockChartDisplayMode *v11;
  void *v12;
  NSMutableArray *v13;
  NSMutableArray *xAxisLabels;
  NSMutableArray *v15;
  NSMutableArray *yAxisLabels;
  ChartLabelInfoManager *v17;
  ChartLabelInfoManager *labelInfoManager;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SPChartView;
  v3 = -[SPChartView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_chartViewType = 0;
    v5 = [StockGraphView alloc];
    v6 = -[StockGraphView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    graph = v4->_graph;
    v4->_graph = (StockGraphView *)v6;

    -[StockGraphView setChartViewDelegate:](v4->_graph, "setChartViewDelegate:", v4);
    +[StockChartDisplayMode defaultDisplayMode](StockChartDisplayMode, "defaultDisplayMode");
    v8 = objc_claimAutoreleasedReturnValue();
    currentDisplayMode = v4->_currentDisplayMode;
    v4->_currentDisplayMode = (StockChartDisplayMode *)v8;

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[StockChartDisplayMode setLineColor:](v4->_currentDisplayMode, "setLineColor:", v10);

    -[StockChartDisplayMode setLineWidth:](v4->_currentDisplayMode, "setLineWidth:", 1.0);
    -[StockChartDisplayMode setShowsVolume:](v4->_currentDisplayMode, "setShowsVolume:", 0);
    -[StockChartDisplayMode setVolumeHeight:](v4->_currentDisplayMode, "setVolumeHeight:", 0.0);
    -[StockChartDisplayMode setHorizontalGridlineCount:](v4->_currentDisplayMode, "setHorizontalGridlineCount:", 3);
    -[StockChartDisplayMode setYAxisLabelCount:](v4->_currentDisplayMode, "setYAxisLabelCount:", 2);
    v11 = v4->_currentDisplayMode;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[StockChartDisplayMode setXAxisKeylineColor:](v11, "setXAxisKeylineColor:", v12);

    -[StockGraphView setDisplayMode:](v4->_graph, "setDisplayMode:", v4->_currentDisplayMode);
    v4->_selectedInterval = -1;
    -[SPChartView addSubview:](v4, "addSubview:", v4->_graph);
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    xAxisLabels = v4->_xAxisLabels;
    v4->_xAxisLabels = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    yAxisLabels = v4->_yAxisLabels;
    v4->_yAxisLabels = v15;

    v17 = objc_alloc_init(ChartLabelInfoManager);
    labelInfoManager = v4->_labelInfoManager;
    v4->_labelInfoManager = v17;

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPChartView setBackgroundColor:](v4, "setBackgroundColor:", v19);

    -[SPChartView setShowsHorizontalLines:](v4, "setShowsHorizontalLines:", 0);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  +[GraphRenderer clearSharedRenderer](GraphRenderer, "clearSharedRenderer");
  v3.receiver = self;
  v3.super_class = (Class)SPChartView;
  -[SPChartView dealloc](&v3, sel_dealloc);
}

- (void)stockGraphViewReadyForDisplay:(id)a3
{
  NSMutableArray *xAxisLabels;
  uint64_t v5;
  NSMutableArray *yAxisLabels;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  void *v10;
  id WeakRetained;
  _QWORD v12[5];
  _QWORD v13[5];
  CGSize v14;

  xAxisLabels = self->_xAxisLabels;
  v5 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __45__SPChartView_stockGraphViewReadyForDisplay___block_invoke;
  v13[3] = &unk_24D74B5F0;
  v13[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](xAxisLabels, "enumerateObjectsUsingBlock:", v13);
  yAxisLabels = self->_yAxisLabels;
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __45__SPChartView_stockGraphViewReadyForDisplay___block_invoke_2;
  v12[3] = &unk_24D74B5F0;
  v12[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](yAxisLabels, "enumerateObjectsUsingBlock:", v12);
  -[StockGraphView setNeedsDisplay](self->_graph, "setNeedsDisplay");
  -[SPChartView setNeedsDisplay](self, "setNeedsDisplay");
  -[SPChartView setNeedsLayout](self, "setNeedsLayout");
  -[SPChartView bounds](self, "bounds");
  v14.width = v7;
  v14.height = v8;
  UIGraphicsBeginImageContextWithOptions(v14, 0, 2.0);
  -[SPChartView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "renderInContext:", UIGraphicsGetCurrentContext());

  UIGraphicsGetImageFromCurrentImageContext();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "spChartView:hasChartImage:", self, v10);

}

uint64_t __45__SPChartView_stockGraphViewReadyForDisplay___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addSubview:", a2);
}

uint64_t __45__SPChartView_stockGraphViewReadyForDisplay___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addSubview:", a2);
}

- (void)setChartData:(id)a3
{
  StockChartData **p_chartData;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  StockChartData *v12;

  p_chartData = &self->_chartData;
  v12 = (StockChartData *)a3;
  if (*p_chartData != v12)
  {
    objc_storeStrong((id *)&self->_chartData, a3);
    if (*p_chartData)
    {
      LODWORD(v6) = 0;
      -[StockChartData setPreviousClosePrice:](*p_chartData, "setPreviousClosePrice:", v6);
      self->_selectedInterval = -[StockChartData chartInterval](v12, "chartInterval");
      -[StockGraphView loadStockChartData:](self->_graph, "loadStockChartData:", v12);
      -[StockGraphView bounds](self->_graph, "bounds");
      if (v7 != *MEMORY[0x24BDBF148] || v8 != *(double *)(MEMORY[0x24BDBF148] + 8))
      {
        v10 = v7;
        v11 = v8;
        -[SPChartView _prepareYAxisLabelsAndPositions](self, "_prepareYAxisLabelsAndPositions");
        -[SPChartView _prepareXAxisLabelsAndPositions](self, "_prepareXAxisLabelsAndPositions");
        -[StockGraphView recomputePathsAndRenderIfNeededForSize:](self->_graph, "recomputePathsAndRenderIfNeededForSize:", v10, v11);
      }
    }
  }

}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  unint64_t v12;
  double v13;
  double v14;
  StockChartData *chartData;
  StockGraphView *graph;
  double v17;
  double v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SPChartView frame](self, "frame");
  v21.origin.x = v8;
  v21.origin.y = v9;
  v21.size.width = v10;
  v21.size.height = v11;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  if (CGRectEqualToRect(v20, v21))
    goto LABEL_9;
  -[StockChartDisplayMode setChartSize:](self->_currentDisplayMode, "setChartSize:", width, height);
  -[StockGraphView setFrame:](self->_graph, "setFrame:", 0.0, 0.0, width, height);
  v12 = -[SPChartView chartViewType](self, "chartViewType");
  if (v12)
  {
    if (v12 != 1)
      goto LABEL_7;
    v13 = 22.0;
    v14 = 5.0;
  }
  else
  {
    v13 = 30.0;
    v14 = 20.0;
  }
  -[StockGraphView setGraphInsets:](self->_graph, "setGraphInsets:", v14, 0.0, v13, 0.0);
LABEL_7:
  chartData = self->_chartData;
  if (chartData)
  {
    -[StockChartData clearAllImageSets](chartData, "clearAllImageSets");
    graph = self->_graph;
    -[StockGraphView bounds](graph, "bounds");
    -[StockGraphView recomputePathsAndRenderIfNeededForSize:](graph, "recomputePathsAndRenderIfNeededForSize:", v17, v18);
    -[SPChartView _prepareYAxisLabelsAndPositions](self, "_prepareYAxisLabelsAndPositions");
    -[SPChartView _prepareXAxisLabelsAndPositions](self, "_prepareXAxisLabelsAndPositions");
  }
LABEL_9:
  v19.receiver = self;
  v19.super_class = (Class)SPChartView;
  -[SPChartView setFrame:](&v19, sel_setFrame_, x, y, width, height);
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
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
  void *v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  float v37;
  id v38;
  CGRect v39;

  if (self->_chartData && -[StockGraphView isRendered](self->_graph, "isRendered"))
  {
    -[StockChartData xAxisLabelInfoArrayForMode:](self->_chartData, "xAxisLabelInfoArrayForMode:", self->_currentDisplayMode);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    -[StockChartData yAxisLabelInfoArrayForMode:](self->_chartData, "yAxisLabelInfoArrayForMode:", self->_currentDisplayMode);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v38, "count");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NSMutableArray objectAtIndex:](self->_xAxisLabels, "objectAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPChartView frame](self, "frame");
        v10 = v9;
        objc_msgSend(v7, "frame");
        v12 = v11;
        v14 = v13;
        objc_msgSend(v8, "position");
        v16 = v15;
        -[StockGraphView frame](self->_graph, "frame");
        v18 = floor(v16 * v17 + 2.0);
        if (self->_selectedInterval)
        {
          if (self->_compactGraph)
            v19 = 5.5;
          else
            v19 = 6.5;
          v18 = v18 + v19;
        }
        objc_msgSend(v7, "font");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "ascender");
        v22 = RoundToPixelWatch(v10 + -1.0 - v21);

        objc_msgSend(v7, "setFrame:", v18, v22, v12, v14);
        if ((i & 1) != 0 && !self->_selectedInterval)
          objc_msgSend(v7, "setHidden:", 1);

      }
    }
    -[NSMutableArray firstObject](self->_xAxisLabels, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setHidden:", 1);
    v24 = objc_msgSend(v3, "count");
    if (v24)
    {
      v25 = v24;
      for (j = 0; j != v25; ++j)
      {
        -[NSMutableArray objectAtIndex:](self->_yAxisLabels, "objectAtIndex:", j);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectAtIndex:", j);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "frame");
        v30 = v29;
        v32 = v31;
        -[SPChartView bounds](self, "bounds");
        v33 = CGRectGetMaxX(v39) - v30;
        objc_msgSend(v28, "position");
        v35 = 1.0 - v34;
        -[SPChartView frame](self, "frame");
        v37 = v35 * (v36 - v32 + -10.0) + 0.0;
        objc_msgSend(v27, "setFrame:", v33, floorf(v37), v30, v32);

      }
    }

  }
}

- (id)_smallCapsFontFrom:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDF7778];
  v20[0] = *MEMORY[0x24BDF7780];
  v20[1] = v3;
  v21[0] = &unk_24D75EFB0;
  v21[1] = &unk_24D75EFC8;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDF7748];
  v17 = v6;
  v18 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "fontDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fontDescriptorByAddingAttributes:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(v5, "pointSize");
  v14 = v13;

  objc_msgSend(v12, "fontWithDescriptor:size:", v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)_prepareXAxisLabelsForLabelInfoArray:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = 432;
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_xAxisLabels, "enumerateObjectsUsingBlock:", &__block_literal_global);
  -[NSMutableArray removeAllObjects](self->_xAxisLabels, "removeAllObjects");
  -[SPChartView labelFont](self, "labelFont");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    v9 = *MEMORY[0x24BDBF090];
    v10 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v11 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v12 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v13 = 0x24BDF6000uLL;
    do
    {
      v14 = 0;
      v31 = v7;
      do
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v14);
        v16 = (void *)objc_msgSend(objc_alloc(*(Class *)(v13 + 2920)), "initWithFrame:", v9, v10, v11, v12);
        objc_msgSend(v15, "string");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setText:", v17);

        objc_msgSend(v16, "setTextAlignment:", 2);
        v18 = -[SPChartView chartViewType](self, "chartViewType");
        if (v18 == 1)
        {
          v21 = v8;
          v22 = v5;
          v23 = v13;
          -[StockChartData dataSeriesDict](self->_chartData, "dataSeriesDict");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
            objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
          else
            objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.301960784, 1.0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setTextColor:", v25);

          objc_msgSend(v16, "setFont:", v30);
          -[SPChartView chartData](self, "chartData");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "dataSeriesDict");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "count");

          v13 = v23;
          v5 = v22;
          v8 = v21;
          v7 = v31;
          if (!v28)
            objc_msgSend(v16, "setText:", &stru_24D74CF50);
        }
        else if (!v18)
        {
          objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setTextColor:", v19);

          objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 8.0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setFont:", v20);

        }
        objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setBackgroundColor:", v29);

        objc_msgSend(v16, "sizeToFit");
        objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v5), "addObject:", v16);

        ++v14;
      }
      while (v7 != v14);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v7);
  }

}

uint64_t __52__SPChartView__prepareXAxisLabelsForLabelInfoArray___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperview");
}

- (void)_prepareXAxisLabelsAndPositions
{
  uint64_t v2;
  uint64_t v3;

  switch(self->_selectedInterval)
  {
    case 0:
      -[SPChartView _setHourLabels](self, "_setHourLabels");
      break;
    case 1:
      v2 = 1;
      v3 = 0;
      goto LABEL_5;
    case 2:
      v2 = 7;
      v3 = 1;
LABEL_5:
      -[SPChartView _setDayLabelsWithInterval:realTimePositions:](self, "_setDayLabelsWithInterval:realTimePositions:", v2, v3);
      break;
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
      -[SPChartView _setMonthAndYearLabels](self, "_setMonthAndYearLabels");
      break;
    default:
      return;
  }
}

- (void)_setMonthAndYearLabels
{
  SPChartView *v2;
  unsigned int v3;
  unsigned int v4;
  double *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  unint64_t v17;
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
  int v28;
  void *v29;
  ChartLabelInfo *v30;
  void *v31;
  uint64_t v32;
  float v33;
  double *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  ChartLabelInfo *v38;
  id v39;
  id v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  id v51;
  void *v52;
  uint64_t v53;
  ChartLabelInfo *v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  int v59;
  void *v60;
  uint64_t v61;
  int v62;
  double v63;
  double v64;
  double v65;
  float v66;
  double v67;
  int v68;
  ChartLabelInfo *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  CGFloat v77;
  CGFloat v78;
  double v79;
  double v80;
  double v81;
  double v82;
  float v83;
  CGFloat v84;
  double v85;
  double v86;
  double v87;
  CGFloat MaxX;
  double v89;
  double v90;
  void *v92;
  double v93;
  double v94;
  double v95;
  BOOL v96;
  void *v97;
  uint64_t v98;
  StockChartData *chartData;
  void *v100;
  StockChartData *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  uint64_t v114;
  double v115;
  CGFloat v116;
  CGFloat v117;
  SPChartView *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  CGFloat v122;
  unint64_t v123;
  int rect;
  CGFloat recta;
  void *v126;
  double v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;

  v2 = self;
  v3 = -[StockChartData stockValueCount](self->_chartData, "stockValueCount");
  if (!v3)
    return;
  v4 = v3;
  v5 = -[StockChartData stockValues](v2->_chartData, "stockValues");
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = (void *)objc_msgSend(v6, "copy");

  -[StockChartData marketTimeZone](v2->_chartData, "marketTimeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "setTimeZone:", v7);

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", *v5);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", v5[3 * v4 - 3]);
  v9 = objc_claimAutoreleasedReturnValue();
  v106 = (void *)v8;
  objc_msgSend(v126, "components:fromDate:toDate:options:", 8, v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "month");
  v119 = v11;
  if (objc_msgSend(v10, "month") >= 25)
  {
    v12 = (double)objc_msgSend(v10, "month") / 24.0;
    v13 = floorf(v12);
    v14 = 6.0;
LABEL_7:
    v16 = v13 * v14;
    if (v16 > 12.0)
      v16 = 12.0;
    v17 = (unint64_t)v16;
    goto LABEL_11;
  }
  if (v11 >= 7)
  {
    v15 = (double)objc_msgSend(v10, "month") / 12.0;
    v13 = ceilf(v15);
    v14 = 3.0;
    goto LABEL_7;
  }
  v17 = 1;
LABEL_11:
  v104 = v10;
  v18 = objc_msgSend(v10, "month");
  v19 = v17 == 1 || v17 == 12;
  v123 = v17;
  if (v19)
    v20 = v18 / v17 + 1;
  else
    v20 = v18 / v17;
  v21 = 2;
  if (v19)
    v21 = 3;
  v22 = v20 + 1;
  +[ChartLabelInfoManager sharedLabelInfoManager](ChartLabelInfoManager, "sharedLabelInfoManager", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v20 + 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = v23;
  objc_msgSend(v23, "labelInfoForYAxis");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObject:", v25);

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v22);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = (void *)v9;
  objc_msgSend(v126, "components:fromDate:", 8, v9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v4 - 1;
  v121 = v24;
  v118 = v2;
  if ((int)(v4 - 1) < 0)
  {
    v31 = 0;
    v30 = 0;
    v40 = 0;
    rect = 0;
    goto LABEL_33;
  }
  rect = 0;
  v28 = 0;
  v29 = 0;
  v30 = 0;
  v31 = 0;
  v32 = v27 + 1;
  v33 = (float)v27;
  v34 = &v5[3 * v27];
  do
  {
    v35 = v31;
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", *v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v126, "components:fromDate:", 8, v36);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = objc_msgSend(v31, "month");
    if (v37 == objc_msgSend(v26, "month"))
      goto LABEL_26;
    if (v123 != ++v28)
    {
      if (rect)
        goto LABEL_25;
      if (objc_msgSend(v26, "month") != 1 && (objc_msgSend(v26, "month") - 1) % v123)
      {
        rect = 0;
        goto LABEL_25;
      }
    }
    objc_msgSend(v120, "setObject:atIndexedSubscript:", v29, rect);
    v38 = objc_alloc_init(ChartLabelInfo);

    -[ChartLabelInfo setPosition:](v38, "setPosition:", (float)((float)(int)v32 / v33));
    objc_msgSend(v121, "addObject:", v38);
    v28 = 0;
    ++rect;
    v30 = v38;
LABEL_25:
    v39 = v31;

    v26 = v39;
LABEL_26:
    v40 = v36;

    v34 -= 3;
    v29 = v40;
    v96 = v32-- <= 1;
  }
  while (!v96);

  v2 = v118;
  v24 = v121;
LABEL_33:

  -[SPChartView lineGraphFrame](v2, "lineGraphFrame");
  v115 = v41;
  v116 = v42;
  v117 = v43;
  v45 = v44;
  v110 = 0.0;
  if ((unint64_t)objc_msgSend(v24, "count") < 2)
    goto LABEL_41;
  objc_msgSend(v24, "objectAtIndexedSubscript:", objc_msgSend(v24, "count") - 2);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "position");
  v48 = v47;
  objc_msgSend(v24, "objectAtIndexedSubscript:", objc_msgSend(v24, "count") - 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "position");
  v110 = v45 * (v48 - v50);

  if (v123 == 12 || v123 == 1)
  {
    v51 = v40;
    if (v123 == 12)
    {
      objc_msgSend(v126, "components:fromDate:", -1, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setMonth:", 1);
      objc_msgSend(v126, "dateFromComponents:", v52);
      v53 = objc_claimAutoreleasedReturnValue();

      v51 = (id)v53;
    }
    objc_msgSend(v120, "setObject:atIndexedSubscript:", v51, rect);
    v54 = objc_alloc_init(ChartLabelInfo);

    objc_msgSend(v24, "objectAtIndexedSubscript:", objc_msgSend(v24, "count") - 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "position");
    -[ChartLabelInfo setPosition:](v54, "setPosition:", v56 - v110 / v45);

    -[ChartLabelInfo position](v54, "position");
    if (v57 > 0.0)
    {
      objc_msgSend(v24, "addObject:", v54);
      ++rect;
    }

  }
  else
  {
LABEL_41:
    v54 = v30;
  }
  -[SPChartView currentDisplayMode](v2, "currentDisplayMode");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "usesDetailedAxisLabels");

  objc_msgSend(v107, "monthLabelInfoArrayForLabelLength:", 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (rect >= 1)
  {
    v61 = 0;
    v62 = 0;
    v64 = *MEMORY[0x24BDBF070];
    v63 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v65 = 0.015;
    if (v59)
      v65 = 0.0199999996;
    v66 = floor(v45 * v65);
    v127 = v66;
    v111 = *(double *)(MEMORY[0x24BDBF148] + 8);
    v112 = *MEMORY[0x24BDBF148];
    v114 = rect;
    v108 = *(double *)(MEMORY[0x24BDBF070] + 24);
    v109 = *(double *)(MEMORY[0x24BDBF070] + 16);
    recta = v109;
    v67 = v108;
    v113 = v45;
    while (1)
    {
      v68 = v62;
      v69 = v54;
      objc_msgSend(v120, "objectAtIndexedSubscript:", v61);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "components:fromDate:", 8, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v61 + 1;
      objc_msgSend(v121, "objectAtIndex:", v61 + 1);
      v54 = (ChartLabelInfo *)objc_claimAutoreleasedReturnValue();

      if (v119 >= 7 && objc_msgSend(v71, "month") == 1)
      {
        objc_msgSend(v126, "timeZone");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[ChartLabelInfo setStringToYearWithDate:timeZone:](v54, "setStringToYearWithDate:timeZone:", v70, v73);
        v62 = 1;
      }
      else
      {
        objc_msgSend(v60, "objectAtIndex:", (objc_msgSend(v71, "month") - 1) % (unint64_t)objc_msgSend(v60, "count"));
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[ChartLabelInfo retainStringAndSizeFromLabelInfo:](v54, "retainStringAndSizeFromLabelInfo:", v73);
        v62 = 0;
      }

      -[ChartLabelInfo size](v54, "size");
      v75 = v74;
      v77 = v76;
      v122 = v67;
      if (v123 == 1 || v123 == 12)
      {
        v78 = v63;
        v79 = v64;
        v80 = v110;
        if (!v61)
        {
          -[ChartLabelInfo position](v54, "position", v110);
          v80 = v45 * (1.0 - v81);
        }
        v82 = 0.5;
        v83 = v80 * 0.5;
        -[ChartLabelInfo position](v54, "position");
        v84 = v115;
        v86 = v115 + v45 * v85 + v83 - v75 * 0.5;
      }
      else
      {
        v78 = v63;
        v79 = v64;
        -[ChartLabelInfo position](v54, "position");
        v84 = v115;
        v86 = v115 + v45 * v87;
        v82 = 0.5;
      }
      v128.origin.x = v84;
      v128.size.height = v116;
      v128.origin.y = v117;
      v128.size.width = v45;
      MaxX = CGRectGetMaxX(v128);
      v89 = v86 + v75 * v82;
      v96 = v75 + v86 <= MaxX;
      v90 = v127;
      if (!v96 || v89 < v127)
      {
        -[ChartLabelInfo setString:](v54, "setString:", &stru_24D74CF50, v127, v89);
        -[ChartLabelInfo setSize:](v54, "setSize:", v112, v111);
        v77 = v108;
        v75 = v109;
      }
      -[SPChartView currentDisplayMode](v118, "currentDisplayMode", v90, v89);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = 0.0;
      if (objc_msgSend(v92, "usesDetailedAxisLabels"))
        v93 = 10.0;
      else
        v93 = 0.0;
      if ((v68 & (v62 ^ 1)) != 0)
        v94 = 4.0;
      else
        v94 = 0.0;

      v64 = fmax(floor(v86), 0.0);
      if (v64 >= v127)
        goto LABEL_71;
      v129.origin.x = v79;
      v129.origin.y = v78;
      v129.size.width = recta;
      v129.size.height = v122;
      if (CGRectIsNull(v129))
        break;
      v130.origin.y = 0.0;
      v130.origin.x = v127;
      v130.size.width = v75;
      v130.size.height = v77;
      v95 = v94 + v93 + CGRectGetMaxX(v130);
      v96 = v95 > v79 && v119 <= 6;
      if (v96)
      {
        -[ChartLabelInfo setString:](v54, "setString:", &stru_24D74CF50);
        -[ChartLabelInfo setSize:](v54, "setSize:", v112, v111);
        v45 = v113;
LABEL_81:
        -[ChartLabelInfo string](v54, "string");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = objc_msgSend(v97, "length");

        v64 = v127;
        if (v98)
        {
          -[ChartLabelInfo setString:](v54, "setString:", &stru_24D74CF50);
          -[ChartLabelInfo setSize:](v54, "setSize:", v112, v111);
          v77 = v122;
          v75 = recta;
          v63 = v78;
          v64 = v79;
        }
        goto LABEL_72;
      }
      v45 = v113;
      if (v95 > v79)
        goto LABEL_81;
      v64 = v127;
LABEL_72:

      v61 = v72;
      v67 = v77;
      recta = v75;
      if (v114 == v72)
        goto LABEL_83;
    }
    v64 = v127;
LABEL_71:
    v45 = v113;
    goto LABEL_72;
  }
LABEL_83:
  -[SPChartView _prepareXAxisLabelsForLabelInfoArray:](v118, "_prepareXAxisLabelsForLabelInfoArray:", v121);
  chartData = v118->_chartData;
  -[SPChartView currentDisplayMode](v118, "currentDisplayMode");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockChartData setXAxisLabelInfoArray:forDisplayMode:](chartData, "setXAxisLabelInfoArray:forDisplayMode:", v121, v100);

  v101 = v118->_chartData;
  -[SPChartView currentDisplayMode](v118, "currentDisplayMode");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockChartData setLabelPlacement:forDisplayMode:](v101, "setLabelPlacement:forDisplayMode:", v103, v102);

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
            -[SPChartView currentDisplayMode](self, "currentDisplayMode");
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
  -[SPChartView currentDisplayMode](self, "currentDisplayMode");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "usesDetailedAxisLabels");

  if ((v42 & 1) != 0)
  {
    objc_msgSend(v82, "lastObject");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setStringToMonthAndDayWithDate:timeZone:", v85, v77);

  }
  -[SPChartView _prepareXAxisLabelsForLabelInfoArray:](self, "_prepareXAxisLabelsForLabelInfoArray:", v82);
  chartData = self->_chartData;
  -[SPChartView currentDisplayMode](self, "currentDisplayMode");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockChartData setXAxisLabelInfoArray:forDisplayMode:](chartData, "setXAxisLabelInfoArray:forDisplayMode:", v82, v45);

  v46 = self->_chartData;
  -[SPChartView currentDisplayMode](self, "currentDisplayMode");
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
  void *v8;
  void *v9;
  void *j;
  void *v11;
  void *v12;
  uint64_t v13;
  float v14;
  float v15;
  float v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _BOOL8 v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  float v37;
  float v38;
  uint64_t v39;
  uint64_t i;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  unint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
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
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[StockChartData marketOpenDate](self->_chartData, "marketOpenDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", 96, v9);
  j = (void *)objc_claimAutoreleasedReturnValue();

  -[StockChartData marketCloseDate](self->_chartData, "marketCloseDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", 96, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(j, "minute");
  if (v13)
    v14 = 1.0 - (float)((float)v13 / 60.0);
  else
    v14 = 0.0;
  v15 = (float)objc_msgSend(v12, "minute") / 60.0;
  v16 = ceilf(v14);
  v17 = (uint64_t)(float)(v16 + (float)objc_msgSend(v8, "hour")) - ((float)(v15 + v14) >= 1.0);
  if (v17 <= 1)
    v19 = 1;
  else
    v19 = v17;
  *(float *)&v18 = v15 + v14;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v19, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(v17 - 25) > 0xFFFFFFFFFFFFFFE7)
  {
    v48 = j;
    v49 = v4;
    v22 = objc_msgSend(v12, "hour");
    v23 = -v22;
    v47 = v17;
    v24 = v17;
    do
    {
      v25 = v20;
      v26 = (v22 & ~(v22 >> 63)) + v23;
      v27 = v26 != 0;
      v28 = ((unint64_t)(v26 - v27) * (unsigned __int128)0xAAAAAAAAAAAAAAABLL) >> 64;
      v29 = (v26 - v27) / 0x18uLL;
      if ((v22 & ~(v22 >> 63)) + v23)
        v30 = v29 + 1;
      else
        v30 = v28 >> 4;
      if (-[ChartLabelInfoManager use24hrTime](self->_labelInfoManager, "use24hrTime", v47))
      {
        v31 = v22 + 24 * v30;
      }
      else if (v22 + 24 * (v27 + (v28 >> 4)) - 12 * ((v22 + 24 * (v27 + (v28 >> 4))) / 0xC))
      {
        v31 = v22 + 24 * (v27 + (v28 >> 4)) - 12 * ((v22 + 24 * (v27 + (v28 >> 4))) / 0xC);
      }
      else
      {
        v31 = 12;
      }
      -[ChartLabelInfoManager labelInfoWithUnsignedInteger:](self->_labelInfoManager, "labelInfoWithUnsignedInteger:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v32, "copy");
      v20 = v25;
      objc_msgSend(v25, "addObject:", v33);

      --v22;
      ++v23;
      --v24;
    }
    while (v24);
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v34 = v25;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    if (v35)
    {
      v36 = v35;
      v37 = 1.0 / (float)(v15 + (float)(v14 + (float)((float)v47 - v16)));
      v38 = 1.0 - (float)(v37 * v15);
      v39 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v51 != v39)
            objc_enumerationMutation(v34);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "setPosition:", v38);
          v38 = v38 - v37;
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
      }
      while (v36);
    }

    if (v47 < 13)
    {
      LODWORD(v44) = 0;
      j = v48;
    }
    else
    {
      v41 = objc_alloc_init(MEMORY[0x24BDD1698]);
      objc_msgSend(v34, "objectAtIndex:", 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "string");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "integerValue") & 1;

      v45 = v44 ^ 1;
      for (j = v48; objc_msgSend(v34, "count") > v45; v45 += 2)
        objc_msgSend(v41, "addIndex:", v45);
      objc_msgSend(v34, "removeObjectsAtIndexes:", v41);

    }
    if (v15 > 0.0 || (_DWORD)v44)
    {
      -[ChartLabelInfoManager labelInfoForYAxis](self->_labelInfoManager, "labelInfoForYAxis");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "insertObject:atIndex:", v46, 0);

    }
    -[SPChartView _prepareXAxisLabelsForLabelInfoArray:](self, "_prepareXAxisLabelsForLabelInfoArray:", v34);
    -[StockChartData setXAxisLabelInfoArray:forDisplayMode:](self->_chartData, "setXAxisLabelInfoArray:forDisplayMode:", v34, self->_currentDisplayMode);
    v4 = v49;
  }
  else
  {
    -[ChartLabelInfoManager labelInfoForYAxis](self->_labelInfoManager, "labelInfoForYAxis");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v21);

    -[SPChartView _prepareXAxisLabelsForLabelInfoArray:](self, "_prepareXAxisLabelsForLabelInfoArray:", v20);
    -[StockChartData setXAxisLabelInfoArray:forDisplayMode:](self->_chartData, "setXAxisLabelInfoArray:forDisplayMode:", v20, self->_currentDisplayMode);
  }

}

- (void)_prepareYAxisLabelsAndPositions
{
  float v3;
  float v4;
  float v5;
  unint64_t v6;
  double v7;
  _BOOL4 v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  double v13;
  unint64_t v14;
  void *v15;
  ChartLabelInfo *v16;
  ChartLabelInfo *v17;
  void *v18;
  float v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  v3 = 0.0;
  v4 = 0.0;
  if (-[StockChartData minValue](self->_chartData, "minValue"))
    v4 = (double)-[StockChartData minValue](self->_chartData, "minValue")[8];
  if (-[StockChartData maxValue](self->_chartData, "maxValue"))
    v3 = (double)-[StockChartData maxValue](self->_chartData, "maxValue")[8];
  v5 = v3 - v4;
  v6 = -[StockChartDisplayMode yAxisLabelCount](self->_currentDisplayMode, "yAxisLabelCount");
  v7 = (float)(v3 - v4) / (double)(v6 - 1);
  v8 = v7 >= 2.0 && v3 >= 100.0;
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    if (v7 >= 0.0199999996)
      v10 = 2;
    else
      v10 = 3;
    v11 = -[Stock pricePrecision](self->_stock, "pricePrecision");
    if (v10 <= v11)
      v9 = v11;
    else
      v9 = v10;
  }
  -[StockChartData setYAxisFractionDigits:](self->_chartData, "setYAxisFractionDigits:", v9);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v6);
  v37 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    LODWORD(v14) = 0;
    v15 = 0;
    v16 = 0;
    while (1)
    {
      v17 = v16;
      v18 = v15;
      *(float *)&v13 = (float)v14 / (float)(v6 - 1);
      v19 = v4 + (float)(v5 * *(float *)&v13);
      if ((_DWORD)v14)
      {
        if (!v8)
          goto LABEL_24;
        LODWORD(v12) = vcvtps_s32_f32(v19);
      }
      else
      {
        if (!v8)
        {
LABEL_24:
          *(float *)&v13 = v4 + (float)(v5 * *(float *)&v13);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
          v20 = objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        }
        LODWORD(v12) = vcvtms_s32_f32(v19);
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v12);
      v20 = objc_claimAutoreleasedReturnValue();
LABEL_25:
      v15 = (void *)v20;

      v16 = objc_alloc_init(ChartLabelInfo);
      -[ChartLabelInfo setPosition:](v16, "setPosition:", (float)((float)(v19 - v4) / v5));
      +[StockDataFormatter sharedDataFormatter](StockDataFormatter, "sharedDataFormatter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "formattedNumber:withPrecision:useGroupSeparator:", v15, -[StockChartData yAxisFractionDigits](self->_chartData, "yAxisFractionDigits"), 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[ChartLabelInfo setString:](v16, "setString:", v22);

      objc_msgSend(v37, "addObject:", v16);
      v14 = (v14 + 1);
      if (v6 <= v14)
      {

        break;
      }
    }
  }
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_yAxisLabels, "enumerateObjectsUsingBlock:", &__block_literal_global_35);
  -[NSMutableArray removeAllObjects](self->_yAxisLabels, "removeAllObjects");
  v23 = objc_msgSend(v37, "count");
  if (v23)
  {
    v24 = v23;
    v25 = 0;
    v26 = *MEMORY[0x24BDBF090];
    v27 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v28 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v29 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v30 = *MEMORY[0x24BDF77D8];
    do
    {
      objc_msgSend(v37, "objectAtIndex:", v25);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v26, v27, v28, v29);
      objc_msgSend(v31, "string");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setText:", v33);

      objc_msgSend(v32, "setTextAlignment:", 1);
      objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setTextColor:", v34);

      objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", v30);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setFont:", v35);

      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setBackgroundColor:", v36);

      objc_msgSend(v32, "sizeToFit");
      -[NSMutableArray addObject:](self->_yAxisLabels, "addObject:", v32);

      ++v25;
    }
    while (v24 != v25);
  }
  -[StockChartData setYAxisLabelInfoArray:forDisplayMode:](self->_chartData, "setYAxisLabelInfoArray:forDisplayMode:", v37, self->_currentDisplayMode);

}

uint64_t __46__SPChartView__prepareYAxisLabelsAndPositions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperview");
}

- (void)drawRect:(CGRect)a3
{
  double height;
  CGFloat width;
  double v6;
  double v7;
  double v8;
  CGContext *CurrentContext;
  id v10;
  double v11;
  double v12;
  CGFloat v13;
  unint64_t v14;
  id v15;
  id v16;
  CGColor *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  id v27;

  if (!self->_chartData)
    return;
  height = a3.size.height;
  width = a3.size.width;
  if (!-[StockGraphView isRendered](self->_graph, "isRendered", a3.origin.x, a3.origin.y))
    return;
  -[StockChartData xAxisLabelInfoArrayForMode:](self->_chartData, "xAxisLabelInfoArrayForMode:", self->_currentDisplayMode);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v6 = RoundToPixelWatch(2.5);
  v7 = RoundToPixelWatch(0.5);
  v8 = RoundToPixelWatch(0.5) * 0.5;
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v10, "CGColor"));

  CGContextSetLineJoin(CurrentContext, kCGLineJoinMiter);
  CGContextSetLineCap(CurrentContext, kCGLineCapSquare);
  v11 = 10.0;
  if (!self->_compactGraph)
    v11 = 11.0;
  v12 = RoundToPixelWatch(height - v11);
  if (-[SPChartView showsHorizontalLines](self, "showsHorizontalLines"))
  {
    v13 = v8 + v12;
    CGContextBeginPath(CurrentContext);
    CGContextSetLineWidth(CurrentContext, v7);
    CGContextMoveToPoint(CurrentContext, 0.0, v8);
    CGContextAddLineToPoint(CurrentContext, width, v8);
    CGContextMoveToPoint(CurrentContext, 0.0, v13);
    CGContextAddLineToPoint(CurrentContext, width, v13);
    CGContextStrokePath(CurrentContext);
  }
  v14 = -[SPChartView chartViewType](self, "chartViewType");
  if (v14 == 1)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.3, 0.3, 0.3, 1.0);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = (CGColor *)objc_msgSend(v15, "CGColor");
  }
  else
  {
    if (v14)
    {
      v17 = 0;
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "colorWithAlphaComponent:", 0.5);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = (CGColor *)objc_msgSend(v16, "CGColor");

  }
LABEL_14:
  CGContextSetStrokeColorWithColor(CurrentContext, v17);
  CGContextBeginPath(CurrentContext);
  CGContextSetLineWidth(CurrentContext, v6);
  v18 = objc_msgSend(v27, "count");
  if (v18)
  {
    v19 = v18;
    for (i = 0; i != v19; ++i)
    {
      -[NSMutableArray objectAtIndex:](self->_xAxisLabels, "objectAtIndex:", i);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndex:", i);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "isHidden") & 1) == 0)
      {
        objc_msgSend(v22, "position");
        v24 = v23;
        -[StockGraphView frame](self->_graph, "frame");
        v26 = v8 + RoundToPixelWatch(v24 * v25);
        CGContextMoveToPoint(CurrentContext, v26, 0.0);
        CGContextAddLineToPoint(CurrentContext, v26, height);
      }

    }
  }
  CGContextStrokePath(CurrentContext);

}

- (CGRect)graphViewFrameForMode:(id)a3
{
  id v3;
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
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v3 = a3;
  objc_msgSend(v3, "showsTitle");
  if (v4 == 0.0)
    v5 = 0.0;
  else
    v5 = 37.0;
  objc_msgSend(v3, "chartSize");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v3, "intervalRowHeight");
  v11 = v10 + v5;
  objc_msgSend(v3, "intervalRowHeight");
  v13 = v12;

  v14 = v9 - (v5 + v13 + 0.5);
  v15 = 16.0;
  v16 = v11;
  v17 = v7 + -32.0;
  result.size.height = v14;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)lineGraphFrame
{
  unint64_t v3;
  void *v4;
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
  void *v15;
  char v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  v3 = -[SPChartView chartViewType](self, "chartViewType");
  -[SPChartView currentDisplayMode](self, "currentDisplayMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPChartView graphViewFrameForMode:](self, "graphViewFrameForMode:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[SPChartView lineGraphBottomPadding](self, "lineGraphBottomPadding");
  v14 = v13;
  -[SPChartView currentDisplayMode](self, "currentDisplayMode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "graphOverlapsYAxisLabels");

  if ((v16 & 1) == 0)
  {
    -[SPChartView currentDisplayMode](self, "currentDisplayMode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPChartView widestYLabelWidthForMode:](self, "widestYLabelWidthForMode:", v17);
    v10 = v10 - (v18 + 4.0 + 0.5);

  }
  v19 = 0.0;
  if (v3 == 1)
    v19 = 5.0;
  if (!v3)
    v19 = 18.0;
  v20 = v12 - (v19 + v14);
  v21 = v19 + v8;
  v22 = v6;
  v23 = v10;
  result.size.height = v20;
  result.size.width = v23;
  result.origin.y = v21;
  result.origin.x = v22;
  return result;
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

- (double)lineGraphBottomPadding
{
  void *v2;
  double v3;
  double v4;

  -[SPChartView currentDisplayMode](self, "currentDisplayMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lineGraphBottomPadding");
  v4 = v3;

  return v4;
}

- (UIFont)labelFont
{
  void *v3;
  double v4;

  v3 = -[SPChartView chartViewType](self, "chartViewType");
  if (v3 == (void *)1)
  {
    if (-[SPChartView isCompactGraph](self, "isCompactGraph"))
      v4 = 18.0;
    else
      v4 = 20.0;
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", v4, *MEMORY[0x24BDF7880]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 10.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIFont *)v3;
}

- (unint64_t)chartViewType
{
  return self->_chartViewType;
}

- (void)setChartViewType:(unint64_t)a3
{
  self->_chartViewType = a3;
}

- (BOOL)isCompactGraph
{
  return self->_compactGraph;
}

- (void)setCompactGraph:(BOOL)a3
{
  self->_compactGraph = a3;
}

- (BOOL)showsHorizontalLines
{
  return self->_showsHorizontalLines;
}

- (void)setShowsHorizontalLines:(BOOL)a3
{
  self->_showsHorizontalLines = a3;
}

- (StockChartData)chartData
{
  return self->_chartData;
}

- (Stock)stock
{
  return self->_stock;
}

- (void)setStock:(id)a3
{
  objc_storeStrong((id *)&self->_stock, a3);
}

- (SPChartViewDelegate)delegate
{
  return (SPChartViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (StockChartDisplayMode)currentDisplayMode
{
  return self->_currentDisplayMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDisplayMode, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stock, 0);
  objc_storeStrong((id *)&self->_chartData, 0);
  objc_storeStrong((id *)&self->_labelInfoManager, 0);
  objc_storeStrong((id *)&self->_yAxisLabels, 0);
  objc_storeStrong((id *)&self->_xAxisLabels, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

@end
