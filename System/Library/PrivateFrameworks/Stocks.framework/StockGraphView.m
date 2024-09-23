@implementation StockGraphView

- (StockGraphView)initWithFrame:(CGRect)a3
{
  StockGraphView *v3;
  void *v4;
  LineGraphView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  LineGraphView *lineView;
  VolumeGraphView *v12;
  VolumeGraphView *volumeView;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)StockGraphView;
  v3 = -[StockGraphView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[StockGraphView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[StockGraphView setMultipleTouchEnabled:](v3, "setMultipleTouchEnabled:", 1);
    v3->_points = (CGPoint *)malloc_type_malloc(0x1E0uLL, 0x1000040451B5BE8uLL);
    v3->_values = (CGPoint *)malloc_type_malloc(0x1E0uLL, 0x1000040451B5BE8uLL);
    v3->_dataSize = 30;
    v5 = [LineGraphView alloc];
    v6 = *MEMORY[0x24BDBF090];
    v7 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v9 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v10 = -[LineGraphView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x24BDBF090], v7, v8, v9);
    lineView = v3->_lineView;
    v3->_lineView = (LineGraphView *)v10;

    -[StockGraphView addSubview:](v3, "addSubview:", v3->_lineView);
    v3->_volumeSize = 30;
    v3->_volumeBars = ($175F2685EF764341F5DD80B75CC65478 *)malloc_type_malloc(0x1E0uLL, 0x1000040451B5BE8uLL);
    v12 = -[VolumeGraphView initWithFrame:]([VolumeGraphView alloc], "initWithFrame:", v6, v7, v8, v9);
    volumeView = v3->_volumeView;
    v3->_volumeView = v12;

    -[StockGraphView addSubview:](v3, "addSubview:", v3->_volumeView);
    -[StockGraphView _layoutSubviews](v3, "_layoutSubviews");
  }
  return v3;
}

- (CGRect)_lineViewFrameForBoundsSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  CGRect result;

  height = a3.height;
  width = a3.width;
  v5 = *MEMORY[0x24BDBEFB0];
  v6 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  result.size.height = height;
  result.size.width = width;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)_volumeViewFrameForBoundsSize:(CGSize)a3
{
  double height;
  CGFloat width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  height = a3.height;
  width = a3.width;
  -[StockChartDisplayMode volumeHeight](self->_displayMode, "volumeHeight");
  v7 = height - v6;
  -[StockChartDisplayMode volumeHeight](self->_displayMode, "volumeHeight");
  v9 = v8;
  v10 = 0.0;
  v11 = v7;
  v12 = width;
  result.size.height = v9;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)_layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  LineGraphView *lineView;
  VolumeGraphView *volumeView;

  -[StockGraphView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  lineView = self->_lineView;
  -[StockGraphView _lineViewFrameForBoundsSize:](self, "_lineViewFrameForBoundsSize:", v3, v5);
  -[LineGraphView setFrame:](lineView, "setFrame:");
  volumeView = self->_volumeView;
  -[StockGraphView _volumeViewFrameForBoundsSize:](self, "_volumeViewFrameForBoundsSize:", v4, v6);
  -[VolumeGraphView setFrame:](volumeView, "setFrame:");
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)StockGraphView;
  -[StockGraphView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[StockGraphView _layoutSubviews](self, "_layoutSubviews");
}

- (void)setShowingSelectedLine:(BOOL)a3
{
  -[LineGraphView setShowingSelectedLine:](self->_lineView, "setShowingSelectedLine:", a3);
}

- (void)setShowingSelectedVolumeRegion:(BOOL)a3
{
  -[VolumeGraphView setShowingSelectedRegion:](self->_volumeView, "setShowingSelectedRegion:", a3);
}

- (void)setDottedLinePositionsWithLabelInfo:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSArray *dottedLinePositions;
  NSArray *v13;
  NSArray *dottedLinePositionsForStyleOnly;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "position", (_QWORD)v15);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  dottedLinePositions = self->_dottedLinePositions;
  self->_dottedLinePositions = v5;
  v13 = v5;

  dottedLinePositionsForStyleOnly = self->_dottedLinePositionsForStyleOnly;
  self->_dottedLinePositionsForStyleOnly = 0;

}

- (void)setEvenlySpacedDottedLinePositionsWithCount:(unint64_t)a3
{
  NSArray *v5;
  uint64_t v6;
  void *v7;
  NSArray *dottedLinePositionsForStyleOnly;
  NSArray *dottedLinePositions;
  NSArray *v10;

  v5 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", a3);
  if (a3)
  {
    v6 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)(unint64_t)++v6 / (double)(a3 + 1));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v5, "addObject:", v7);

    }
    while (a3 != v6);
  }
  dottedLinePositionsForStyleOnly = self->_dottedLinePositionsForStyleOnly;
  self->_dottedLinePositionsForStyleOnly = v5;
  v10 = v5;

  dottedLinePositions = self->_dottedLinePositions;
  self->_dottedLinePositions = 0;

}

- (float)_priceAtTime:(double)a3 dataPosition:(double *)a4
{
  int valueIndex;
  double v7;
  $87A9BE3275E22128A73FF46D0B92144E *v8;
  double var1;
  double var0;
  $87A9BE3275E22128A73FF46D0B92144E *v11;
  int v12;
  double *p_var0;
  double v14;
  int v15;
  $87A9BE3275E22128A73FF46D0B92144E *v16;
  double *v17;
  double v18;
  StockChartData *chartData;

  valueIndex = self->_valueIndex;
  if (valueIndex >= self->_valueCount)
  {
    chartData = self->_chartData;
    return *(double *)(-[StockChartData stockValues](chartData, "stockValues", a4, a3) + 24 * self->_valueCount - 16);
  }
  v7 = a3;
  if (valueIndex <= 0)
    self->_valueIndex = 1;
  v8 = -[StockChartData stockValues](self->_chartData, "stockValues") + 24 * self->_valueIndex;
  var0 = v8[-1].var0;
  var1 = v8[-1].var1;
  v11 = -[StockChartData stockValues](self->_chartData, "stockValues");
  v12 = self->_valueIndex;
  p_var0 = &v11[v12].var0;
  v14 = *p_var0;
  a3 = p_var0[1];
  if (*p_var0 < v7)
  {
    while (1)
    {
      v15 = v12 + 1;
      self->_valueIndex = v15;
      if (v15 == self->_valueCount)
        break;
      var1 = a3;
      var0 = v14;
      v16 = -[StockChartData stockValues](self->_chartData, "stockValues");
      v12 = self->_valueIndex;
      v17 = &v16[v12].var0;
      v14 = *v17;
      a3 = v17[1];
      if (*v17 >= v7)
        goto LABEL_7;
    }
    if (a4)
      *a4 = 1.0;
    chartData = self->_chartData;
    return *(double *)(-[StockChartData stockValues](chartData, "stockValues", a4, a3) + 24 * self->_valueCount - 16);
  }
LABEL_7:
  v18 = (v7 - var0) / (v14 - var0);
  if (a4)
    *a4 = (v18 + (double)v12) / (double)(self->_valueCount - 1);
  return a3 * v18 + var1 * (1.0 - v18);
}

- (double)_timeAtPosition:(double)a3
{
  int v4;
  double v5;
  float v6;
  int v7;
  $87A9BE3275E22128A73FF46D0B92144E *v8;
  double var0;
  uint64_t v10;
  double v11;
  double v12;
  double v13;

  v4 = self->_valueCount - 1;
  v5 = (double)v4 * a3;
  v6 = v5;
  v7 = vcvtms_s32_f32(v6);
  v8 = -[StockChartData stockValues](self->_chartData, "stockValues");
  if (v4 <= v7)
    return v8[self->_valueCount - 1].var0;
  var0 = v8[v7].var0;
  v10 = v7 + 1;
  if ((int)v10 >= self->_valueCount - 1)
    return var0;
  v11 = (double)-[StockChartData stockValues](self->_chartData, "stockValues")[24 * v10];
  v12 = v5 - (double)v7;
  v13 = round(v12);
  if (v11 - var0 > 43200.0)
    v12 = v13;
  return v11 * v12 + var0 * (1.0 - v12);
}

- (CGRect)_trueGraphPointsRegion
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGRect v15;

  -[StockGraphView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[StockChartDisplayMode lineWidth](self->_displayMode, "lineWidth");
  v8 = v6 - v7 - self->_graphInsets.bottom - self->_graphInsets.top;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  v11 = v8 + -1.0 / v10;

  -[StockChartDisplayMode lineWidth](self->_displayMode, "lineWidth");
  v13 = v12 * 0.5 + self->_graphInsets.bottom;
  -[StockChartDisplayMode lineWidth](self->_displayMode, "lineWidth");
  v15.size.width = v4 - v14 * 0.5;
  v15.origin.x = 0.0;
  v15.origin.y = v13;
  v15.size.height = v11;
  return CGRectIntegral(v15);
}

- (void)clearPaths
{
  NSMutableArray *v3;
  NSMutableArray *linePointCounts;

  self->_dataCount = 0;
  self->_volumeCount = 0;
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  linePointCounts = self->_linePointCounts;
  self->_linePointCounts = v3;

}

- (void)_finishCurrentLine
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  NSMutableArray *linePointCounts;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_linePointCounts;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "intValue", (_QWORD)v11);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  linePointCounts = self->_linePointCounts;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_dataCount - v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](linePointCounts, "addObject:", v10);

}

- (unint64_t)_normalizedAccumulatedVolumeInDataRange:(CGPoint)a3
{
  unsigned int valueCount;
  double v4;
  double v5;
  double v6;
  unsigned int v8;
  double v9;
  double v11;
  unsigned int v12;
  double v13;

  valueCount = self->_valueCount;
  v4 = (double)(int)(valueCount - 1);
  v5 = a3.x * v4;
  v6 = a3.y * v4;
  if (a3.y * v4 <= a3.x * v4)
    return 0;
  v8 = vcvtmd_u64_f64(v5);
  if (v6 < (double)(v8 + 1))
    return (unint64_t)((v6 - v5)
                            * (double)(unint64_t)(-[StockChartData stockValues](self->_chartData, "stockValues")
                                                       + 24 * v8)[16]);
  v9 = 0.0;
  if (valueCount > v8)
  {
    v11 = floor(v6);
    v12 = vcvtpd_u64_f64(v5);
    do
    {
      v13 = (double)v8;
      if (v5 <= (double)v8)
      {
        if (v11 <= v13)
          return (unint64_t)(v9
                                  + (v6 - v13)
                                  * (double)(unint64_t)(-[StockChartData stockValues](self->_chartData, "stockValues")+ 24 * v8)[16]);
        v9 = v9
           + (double)(unint64_t)(-[StockChartData stockValues](self->_chartData, "stockValues") + 24 * v8++)[16];
      }
      else
      {
        v9 = v9
           + (v13 - v5 + 1.0)
           * (double)(unint64_t)(-[StockChartData stockValues](self->_chartData, "stockValues") + 24 * v8)[16];
        v8 = v12;
      }
    }
    while (v8 < self->_valueCount);
  }
  return (unint64_t)v9;
}

- (void)_processGraphDataForWidth:(double)a3
{
  double v5;
  double v6;
  int64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  float v18;
  float v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  _BOOL4 v25;
  void *v26;
  unint64_t v27;
  int64_t v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  float v35;
  double v36;
  float v37;
  int64_t v38;
  double v39;
  double v40;
  double v41;
  $87A9BE3275E22128A73FF46D0B92144E *v42;
  double v43;
  _BOOL4 v45;
  double v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  double v51;
  $87A9BE3275E22128A73FF46D0B92144E *v52;
  int valueIndex;
  double *p_var0;
  double var1;
  double v56;
  double v57;
  void *v58;
  void *v59;
  unsigned int v60;
  $87A9BE3275E22128A73FF46D0B92144E *v61;
  double v62;
  float v63;
  void *v64;
  void *v65;
  unsigned int valueCount;
  double v67;
  double v68;
  float v69;
  double v70;
  double v71;
  double v72;
  double v73;
  $87A9BE3275E22128A73FF46D0B92144E *v74;
  int v75;
  double *v76;
  unsigned int dataCount;
  unsigned int dataSize;
  CGPoint *values;
  unsigned int v80;
  CGPoint *v81;
  double *p_x;
  double v84;
  float v85;
  unsigned int v86;
  uint64_t v87;
  void *v88;
  void *v89;
  double v90;
  void *v91;
  void *v92;
  double v93;
  int v94;
  double v95;
  unsigned int v96;
  unsigned int volumeSize;
  unsigned int v98;
  double v99;
  unint64_t v100;
  unsigned int volumeCount;
  double volumeBarWidth;
  double v103;
  double v104;
  double v105;
  $175F2685EF764341F5DD80B75CC65478 *v106;
  unint64_t maxVolume;
  BOOL v109;
  double v110;
  float v111;
  double v112;
  double v113;
  double v114;
  unsigned int v115;
  double var0;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  float v122;
  double v123;
  double v124;
  double v125;
  _BOOL4 v126;
  int v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134[2];

  if (!-[StockChartData stockValueCount](self->_chartData, "stockValueCount"))
    return;
  v5 = *(double *)-[StockChartData stockValues](self->_chartData, "stockValues");
  v6 = *(double *)(-[StockChartData stockValues](self->_chartData, "stockValues") + 24 * self->_valueCount - 24);
  v7 = -[StockChartData chartInterval](self->_chartData, "chartInterval");
  v130 = v6;
  if (v7)
  {
    v122 = 0.0;
    v117 = 1.0;
  }
  else
  {
    -[StockChartData marketCloseDate](self->_chartData, "marketCloseDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSince1970");
    v10 = v9;
    -[StockChartData marketOpenDate](self->_chartData, "marketOpenDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSince1970");
    v13 = v10 - v12;
    v6 = v130;
    v14 = a3 / (v13 / 60.0);

    -[StockChartData marketOpenDate](self->_chartData, "marketOpenDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSince1970");
    v17 = (v5 - v16) / 60.0;

    v18 = fmax(v17, 0.0);
    v117 = v14;
    v19 = v14 * v18;
    v122 = v19;
  }
  if (!-[StockChartData chartInterval](self->_chartData, "chartInterval")
    || (v20 = 0.0, -[StockChartData chartInterval](self->_chartData, "chartInterval") == 1))
  {
    -[StockChartData marketCloseDate](self->_chartData, "marketCloseDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "timeIntervalSince1970");
    v20 = (v22 - v6) / 60.0;

  }
  v23 = v122;
  v24 = (a3 - v122 - v20 * v117) / (double)(self->_valueCount - 1);
  v25 = v24 >= 2.0;
  -[StockChartData interestingIndexes](self->_chartData, "interestingIndexes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");

  if (!v27)
  {
    v127 = 0;
    v132 = fmax(v24, 2.0);
    v134[0] = 0.0;
LABEL_13:
    v133 = 1.0;
    goto LABEL_14;
  }
  v28 = -[StockChartData chartInterval](self->_chartData, "chartInterval");
  v132 = fmax(v24, 2.0);
  v134[0] = 0.0;
  if (v28 != 1)
  {
    v127 = 0;
    goto LABEL_13;
  }
  -[StockChartData interestingIndexes](self->_chartData, "interestingIndexes");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "lastObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "doubleValue");
  v133 = v31;

  v25 = 0;
  v127 = 1;
LABEL_14:
  self->_valueIndex = 0;
  -[StockGraphView clearPaths](self, "clearPaths");
  v126 = -[StockChartData hasVolume](self->_chartData, "hasVolume");
  self->_maxVolume = 0;
  v32 = 1.0;
  if (v25)
    v32 = 2.0;
  self->_volumeBarWidth = v32;
  v33 = (double)-[StockChartData minValue](self->_chartData, "minValue")[8];
  v34 = (double)-[StockChartData maxValue](self->_chartData, "maxValue")[8];
  -[StockChartData previousClosePrice](self->_chartData, "previousClosePrice");
  v36 = v34;
  v128 = v33;
  if (v35 != 0.0)
  {
    v37 = v35;
    v38 = -[StockChartData chartInterval](self->_chartData, "chartInterval");
    v39 = v37;
    if (v33 >= v37)
      v40 = v37;
    else
      v40 = v33;
    if (v34 >= v39)
      v39 = v34;
    if (v38)
      v36 = v34;
    else
      v36 = v39;
    if (v38)
      v41 = v33;
    else
      v41 = v40;
    v128 = v41;
  }
  v125 = v34;
  v113 = v33;
  v131 = *(double *)-[StockChartData minValue](self->_chartData, "minValue");
  v42 = -[StockChartData maxValue](self->_chartData, "maxValue");
  v43 = v130;
  v45 = v130 > 0.0 || v7 != 0;
  if (self->_valueIndex < self->_valueCount)
  {
    v43 = v23 / a3;
    if (v23 / a3 <= v133 && v45)
    {
      v46 = v5;
      v114 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      var0 = v42->var0;
      v112 = -v132;
      v123 = 1.0 / (double)v27;
      v124 = v36 - v128;
      v115 = v27 - 1;
      v47 = 0xFFFFFFFFLL;
      v129 = 2.0;
      v118 = 0.0;
      v119 = v130 + 1.0;
      v120 = NAN;
      v48 = v123;
      v49 = 0.0;
      while (v7)
      {
        v50 = v48;
        v51 = v125;
        if (v25)
        {
          v52 = -[StockChartData stockValues](self->_chartData, "stockValues");
          valueIndex = self->_valueIndex;
          p_var0 = &v52[valueIndex].var0;
          v49 = *p_var0;
          var1 = p_var0[1];
          self->_valueIndex = valueIndex + 1;
          v56 = v23;
          v57 = v131;
          goto LABEL_69;
        }
        -[StockGraphView _timeAtPosition:](self, "_timeAtPosition:", v134[0]);
        v68 = v67;
        -[StockGraphView _priceAtTime:dataPosition:](self, "_priceAtTime:dataPosition:", 0);
        v57 = v131;
        if (v131 > v49 && v131 < v68)
        {
          v70 = v23 + v112 * (1.0 - (v131 - v49) / (v131 - v49));
LABEL_59:
          v56 = v23 - v132;
          v49 = v57;
          v57 = v130 + 1.0;
          var1 = v113;
          v23 = v70;
          goto LABEL_69;
        }
        var1 = v69;
        if (var0 > v49 && var0 < v68)
        {
          v71 = v46;
          v72 = v23 + v112 * (1.0 - (var0 - v49) / (var0 - v49));
          v49 = var0;
          goto LABEL_63;
        }
        v49 = v68;
        v56 = v23;
LABEL_69:
        dataCount = self->_dataCount + 1;
        self->_dataCount = dataCount;
        dataSize = self->_dataSize;
        v131 = v57;
        if (dataSize >= dataCount)
        {
          values = self->_values;
        }
        else
        {
          self->_dataSize = 2 * dataSize;
          self->_points = (CGPoint *)malloc_type_realloc(self->_points, 32 * dataSize, 0x1000040451B5BE8uLL);
          values = (CGPoint *)malloc_type_realloc(self->_values, 16 * self->_dataSize, 0x1000040451B5BE8uLL);
          self->_values = values;
          dataCount = self->_dataCount;
        }
        v80 = dataCount - 1;
        v81 = &self->_points[v80];
        v81->x = v23;
        v81->y = (var1 - v128) / v124;
        p_x = &values[v80].x;
        *p_x = v49;
        p_x[1] = var1;
        v23 = v132 + v56;
        if (v56 / a3 >= v133 || (v132 + v56) / a3 <= v133)
          v84 = v23 / a3;
        else
          v84 = v133;
        if (v127)
        {
          v85 = v84 / v123;
          v86 = vcvtms_u32_f32(v85);
          if (v115 >= v86)
            v87 = v86;
          else
            v87 = v115;
          if ((_DWORD)v87 == (_DWORD)v47)
          {
            v87 = v47;
            v48 = v50;
          }
          else
          {
            v48 = v50;
            if ((_DWORD)v87)
            {
              -[StockChartData interestingIndexes](self->_chartData, "interestingIndexes");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "objectAtIndex:", (int)v87 - 1);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "doubleValue");
              v118 = v90;

            }
            else
            {
              v118 = 0.0;
            }
            v120 = 1.0;
            if (v27 - 1 == (int)v87)
            {
              v48 = v133 - v84;
            }
            else
            {
              -[StockChartData interestingIndexes](self->_chartData, "interestingIndexes");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "objectAtIndex:", (int)v87);
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "doubleValue");
              v120 = v93;

            }
          }
          v134[0] = fmin(v118 + (v120 - v118) * (v84 - (double)(int)v87 * v123) / v48, 1.0);
          v47 = v87;
        }
        else
        {
          if (v7)
            v134[0] = v84;
          v48 = v50;
        }
        v94 = v23 >= v129 || v25;
        if ((v126 & v94) != 1)
          goto LABEL_111;
        v121 = v46;
        v95 = a3;
        v96 = self->_volumeCount + 1;
        self->_volumeCount = v96;
        volumeSize = self->_volumeSize;
        if (volumeSize < v96)
        {
          v98 = 2 * volumeSize;
          self->_volumeSize = v98;
          self->_volumeBars = ($175F2685EF764341F5DD80B75CC65478 *)malloc_type_realloc(self->_volumeBars, 16 * v98, 0x1000040451B5BE8uLL);
        }
        v99 = v23 - v132;
        if (v25)
        {
          v100 = *(_QWORD *)(-[StockChartData stockValues](self->_chartData, "stockValues")
                           + 24 * self->_valueIndex
                           - 8);
          volumeCount = self->_volumeCount;
          if (volumeCount >= 2)
          {
            volumeBarWidth = v99 - self->_volumeBars[volumeCount - 2].var0 + -1.0;
            if (volumeBarWidth > 0.0)
            {
              if (self->_volumeBarWidth < volumeBarWidth)
                volumeBarWidth = self->_volumeBarWidth;
              self->_volumeBarWidth = volumeBarWidth;
            }
            goto LABEL_108;
          }
        }
        else
        {
          v103 = v48;
          v104 = v134[0];
          v105 = v129 + -1.0 + -0.5;
          v100 = -[StockGraphView _normalizedAccumulatedVolumeInDataRange:](self, "_normalizedAccumulatedVolumeInDataRange:", v114, v134[0]);
          v129 = v99 + 1.0 + 1.0;
          volumeCount = self->_volumeCount;
          v114 = v104;
          v48 = v103;
          v99 = v105;
        }
        a3 = v95;
LABEL_108:
        v46 = v121;
        v106 = &self->_volumeBars[volumeCount - 1];
        v106->var0 = v99;
        v106->var1 = v100;
        maxVolume = self->_maxVolume;
        if (maxVolume <= v100)
          maxVolume = v100;
        self->_maxVolume = maxVolume;
LABEL_111:
        v43 = v130;
        v109 = v49 < v130 || v7 != 0;
        if (self->_valueIndex < self->_valueCount)
        {
          v43 = v133;
          if (v84 <= v133 && v109)
            continue;
        }
        goto LABEL_130;
      }
      v51 = v125;
      v50 = v48;
      if (v49 == v119)
      {
        -[StockGraphView _finishCurrentLine](self, "_finishCurrentLine");
        -[StockChartData interestingIndexes](self->_chartData, "interestingIndexes");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "objectAtIndex:", (int)v47);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v59, "unsignedIntValue");

        v61 = -[StockChartData stockValues](self->_chartData, "stockValues") + 24 * v60;
        v62 = v61->var0;
        var1 = v61->var1;
        v23 = v122 + (v61->var0 - v46) / 60.0 * v117;
        v63 = v23;
        v122 = v63;
        v134[0] = v134[0] + 1.0 / (double)(self->_valueCount - 1);
        v46 = v62;
      }
      else
      {
        if (v25)
        {
          v74 = -[StockChartData stockValues](self->_chartData, "stockValues");
          v75 = self->_valueIndex;
          v76 = &v74[v75].var0;
          v62 = *v76;
          var1 = v76[1];
          v23 = v122 + (*v76 - v46) / 60.0 * v117;
          self->_valueIndex = v75 + 1;
        }
        else
        {
          v110 = v130;
          if (v130 >= v119)
            v110 = v119;
          if (v46 + (v23 - v122) / v117 * 60.0 >= v110)
            v62 = v110;
          else
            v62 = v46 + (v23 - v122) / v117 * 60.0;
          -[StockGraphView _priceAtTime:dataPosition:](self, "_priceAtTime:dataPosition:", v134, v62);
          var1 = v111;
        }
        if ((_DWORD)v47 != -1 && v119 != -1.0)
        {
LABEL_56:
          v57 = v131;
          if (v131 > v49 && v131 < v62)
          {
            v70 = v122 + (v131 - v46) / 60.0 * v117;
            goto LABEL_59;
          }
          v71 = v46;
          if (var0 <= v49 || (v49 = var0, var0 >= v62))
          {
            v49 = v62;
            v56 = v23;
          }
          else
          {
            v72 = v122 + (var0 - v46) / 60.0 * v117;
LABEL_63:
            v56 = v23 - v132;
            var0 = v130 + 1.0;
            var1 = v51;
            v23 = v72;
          }
          v46 = v71;
          goto LABEL_69;
        }
      }
      v47 = (v47 + 1);
      if (v27 <= (int)v47)
      {
        valueCount = self->_valueCount;
      }
      else
      {
        -[StockChartData interestingIndexes](self->_chartData, "interestingIndexes");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "objectAtIndex:", (int)v47);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        valueCount = objc_msgSend(v65, "unsignedIntValue");

      }
      v73 = *(double *)(-[StockChartData stockValues](self->_chartData, "stockValues") + 24 * valueCount - 24);
      if (v73 == v130)
        v73 = v73 + 1.0;
      v119 = v73;
      goto LABEL_56;
    }
  }
LABEL_130:
  -[StockGraphView _finishCurrentLine](self, "_finishCurrentLine", v43);
}

- (void)readyForDisplayFromChartData
{
  void *v3;
  id v4;

  -[StockChartData imageSetForDisplayMode:](self->_chartData, "imageSetForDisplayMode:", self->_displayMode);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[StockChartData dataSeriesDict](self->_chartData, "dataSeriesDict");

  -[LineGraphView setGraphImageSet:](self->_lineView, "setGraphImageSet:", v4);
  -[VolumeGraphView setGraphImageSet:](self->_volumeView, "setGraphImageSet:", v4);
  self->_isRendered = 1;
  -[StockGraphView chartViewDelegate](self, "chartViewDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stockGraphViewReadyForDisplay:", self);

}

- (BOOL)isRendering
{
  return self->_renderOperation != 0;
}

- (void)cancelRenderOperation
{
  GraphRenderOperation *renderOperation;

  -[GraphRenderOperation cancel](self->_renderOperation, "cancel");
  renderOperation = self->_renderOperation;
  self->_renderOperation = 0;

}

- (void)recomputePathsAndRenderIfNeededForSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  GraphRenderOperation *v7;
  GraphRenderOperation *renderOperation;
  double v9;
  double v10;
  id v11;

  height = a3.height;
  width = a3.width;
  -[StockGraphView cancelRenderOperation](self, "cancelRenderOperation");
  -[StockChartData imageSetForDisplayMode:](self->_chartData, "imageSetForDisplayMode:", self->_displayMode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[StockChartDisplayMode HUDEnabled](self->_displayMode, "HUDEnabled") && v6
    || (-[StockGraphView _processGraphDataForWidth:](self, "_processGraphDataForWidth:", width - self->_graphInsets.left - self->_graphInsets.right), v6))
  {
    -[StockGraphView readyForDisplayFromChartData](self, "readyForDisplayFromChartData");
  }
  else
  {
    v7 = objc_alloc_init(GraphRenderOperation);
    renderOperation = self->_renderOperation;
    self->_renderOperation = v7;

    -[GraphRenderOperation setDelegate:](self->_renderOperation, "setDelegate:", self);
    -[GraphRenderOperation setPoints:](self->_renderOperation, "setPoints:", self->_points);
    -[GraphRenderOperation setLinePointCounts:](self->_renderOperation, "setLinePointCounts:", self->_linePointCounts);
    -[GraphRenderOperation setDottedLinePositions:](self->_renderOperation, "setDottedLinePositions:", self->_dottedLinePositions);
    -[GraphRenderOperation setDottedLinePositionsForStyleOnly:](self->_renderOperation, "setDottedLinePositionsForStyleOnly:", self->_dottedLinePositionsForStyleOnly);
    -[GraphRenderOperation setVolumeBars:](self->_renderOperation, "setVolumeBars:", self->_volumeBars);
    -[GraphRenderOperation setVolumeCount:](self->_renderOperation, "setVolumeCount:", self->_volumeCount);
    -[GraphRenderOperation setVolumeBarWidth:](self->_renderOperation, "setVolumeBarWidth:", self->_volumeBarWidth);
    -[GraphRenderOperation setMaxVolume:](self->_renderOperation, "setMaxVolume:", self->_maxVolume);
    -[GraphRenderOperation setGraphInsets:](self->_renderOperation, "setGraphInsets:", self->_graphInsets.top, self->_graphInsets.left, self->_graphInsets.bottom, self->_graphInsets.right);
    -[GraphRenderOperation setDisplayMode:](self->_renderOperation, "setDisplayMode:", self->_displayMode);
    -[GraphRenderOperation setGraphSize:](self->_renderOperation, "setGraphSize:", width, height);
    -[StockGraphView _volumeViewFrameForBoundsSize:](self, "_volumeViewFrameForBoundsSize:", width, height);
    -[GraphRenderOperation setVolumeGraphSize:](self->_renderOperation, "setVolumeGraphSize:", v9, v10);
    +[GraphRenderer sharedRenderer](GraphRenderer, "sharedRenderer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "performRenderOperation:", self->_renderOperation);

  }
}

- (void)graphRenderOperationDidFinish:(id)a3
{
  StockChartData *chartData;
  void *v5;
  GraphRenderOperation *renderOperation;

  if (self->_renderOperation == a3)
  {
    chartData = self->_chartData;
    objc_msgSend(a3, "graphImageSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[StockChartData setImageSet:forDisplayMode:](chartData, "setImageSet:forDisplayMode:", v5, self->_displayMode);

    -[StockGraphView readyForDisplayFromChartData](self, "readyForDisplayFromChartData");
    renderOperation = self->_renderOperation;
    self->_renderOperation = 0;

  }
}

- (void)resizeSelectedLineClipViewWithLeftX:(double)a3 rightX:(double)a4
{
  -[LineGraphView resizeSelectedLineClipViewWithLeftX:rightX:](self->_lineView, "resizeSelectedLineClipViewWithLeftX:rightX:", a3, a4);
}

- (void)resizeSelectedVolumeClipViewWithLeftX:(double)a3 rightX:(double)a4
{
  -[VolumeGraphView resizeSelectedVolumeClipViewWithLeftX:rightX:](self->_volumeView, "resizeSelectedVolumeClipViewWithLeftX:rightX:", a3, a4);
}

- (void)clearData
{
  StockChartData *chartData;

  -[StockGraphView cancelRenderOperation](self, "cancelRenderOperation");
  -[StockGraphView clearPaths](self, "clearPaths");
  chartData = self->_chartData;
  self->_chartData = 0;

  self->_valueIndex = 0;
  self->_valueCount = 0;
  self->_isRendered = 0;
}

- (void)loadStockChartData:(id)a3
{
  StockChartData *v4;
  StockChartData *chartData;
  StockChartData *v6;
  int v7;

  v4 = (StockChartData *)a3;
  -[StockGraphView clearData](self, "clearData");
  chartData = self->_chartData;
  self->_chartData = v4;
  v6 = v4;

  v7 = -[StockChartData stockValueCount](self->_chartData, "stockValueCount");
  self->_valueCount = v7;
}

- (CGPoint)rightmostPlottedPoint
{
  CGPoint *v2;
  double x;
  double y;
  CGPoint result;

  v2 = &self->_points[self->_dataCount - 1];
  x = v2->x;
  y = v2->y;
  result.y = y;
  result.x = x;
  return result;
}

- ($87A9BE3275E22128A73FF46D0B92144E)plottedPointNearestToPoint:(SEL)a3
{
  int var2_high;
  $87A9BE3275E22128A73FF46D0B92144E *v7;
  double x;
  double var0;
  double v10;
  int v11;
  double *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float64x2_t v22;
  float32x2_t v23;
  float64x2_t v24;
  float64x2_t v30;
  float64x2_t v31;
  float64_t v33;
  float64_t v34;

  retstr->var0 = 0.0;
  retstr->var1 = 0.0;
  retstr->var2 = 0;
  var2_high = HIDWORD(self[20].var2);
  if (var2_high)
  {
    v7 = self;
    x = a4->x;
    var0 = self[19].var0;
    if (a4->x < **(double **)&var0)
      x = **(double **)&var0;
    v10 = *(double *)(*(_QWORD *)&var0 + 16 * (var2_high - 1));
    if (x >= v10)
      x = *(double *)(*(_QWORD *)&var0 + 16 * (var2_high - 1));
    v11 = (int)((x - **(double **)&var0) / (v10 - **(double **)&var0));
    v12 = (double *)(*(_QWORD *)&var0 + 16 * v11 + 16);
    do
    {
      v13 = *(v12 - 2);
      v12 -= 2;
      --v11;
    }
    while (v13 > x);
    do
    {
      v14 = *v12;
      v12 += 2;
      v15 = v14;
      ++v11;
    }
    while (v14 < x);
    if (v11 >= 1
      && (x - *(double *)(*(_QWORD *)&var0 + 16 * (v11 - 1)))
       / (v15 - *(double *)(*(_QWORD *)&var0 + 16 * (v11 - 1))) <= 0.5)
    {
      --v11;
    }
    -[$87A9BE3275E22128A73FF46D0B92144E bounds](self, "bounds");
    v33 = v17;
    v34 = v16;
    -[$87A9BE3275E22128A73FF46D0B92144E _trueGraphPointsRegion](v7, "_trueGraphPointsRegion");
    v19 = v18;
    v20 = 1.0 - *(double *)(*(_QWORD *)&v7[19].var0 + 16 * v11 + 8);
    self = ($87A9BE3275E22128A73FF46D0B92144E *)objc_msgSend(*(id *)&v7[23].var0, "lineWidth");
    v22.f64[0] = *(float64_t *)(*(_QWORD *)&v7[19].var0 + 16 * v11);
    v22.f64[1] = v21 * 0.5 + v20 * v19 + v7[23].var1;
    v23 = vrndm_f32(vcvt_f32_f64(v22));
    v24.f64[0] = v34;
    v24.f64[1] = v33;
    __asm { FMOV            V1.2D, #-1.0 }
    v30 = vaddq_f64(v24, _Q1);
    v31 = vcvtq_f64_f32(v23);
    *(float64x2_t *)a4 = vmaxnmq_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v30, v31), (int8x16_t)v31, (int8x16_t)v30), (float64x2_t)0);
    *(_OWORD *)&retstr->var0 = *(_OWORD *)(*(_QWORD *)&v7[19].var1 + 16 * v11);
    retstr->var2 = 0;
  }
  else
  {
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&retstr->var0 = _Q0;
  }
  return self;
}

- (CGRect)volumeBarRectNearestToPoint:(CGPoint)a3
{
  unsigned int volumeCount;
  $175F2685EF764341F5DD80B75CC65478 *volumeBars;
  double var0;
  int v7;
  double *p_var0;
  double v9;
  double v10;
  double v11;
  $175F2685EF764341F5DD80B75CC65478 *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double volumeBarWidth;
  double v23;
  double v24;
  CGRect result;

  volumeCount = self->_volumeCount;
  if (volumeCount)
  {
    volumeBars = self->_volumeBars;
    if (a3.x < volumeBars->var0)
      a3.x = volumeBars->var0;
    var0 = volumeBars[volumeCount - 1].var0;
    if (a3.x >= var0)
      a3.x = volumeBars[volumeCount - 1].var0;
    v7 = (int)((a3.x - volumeBars->var0) / (var0 - volumeBars->var0));
    p_var0 = &volumeBars[v7 + 1].var0;
    do
    {
      v9 = *(p_var0 - 2);
      p_var0 -= 2;
      --v7;
    }
    while (v9 > a3.x);
    do
    {
      v10 = *p_var0;
      p_var0 += 2;
      v11 = v10;
      ++v7;
    }
    while (v10 < a3.x);
    if (v7 >= 1 && (a3.x - volumeBars[v7 - 1].var0) / (v11 - volumeBars[v7 - 1].var0) <= 0.5)
      --v7;
    v12 = &volumeBars[v7];
    v13 = v12->var0;
    v14 = (double)v12->var1 / (double)self->_maxVolume;
    -[StockChartDisplayMode volumeHeight](self->_displayMode, "volumeHeight");
    *(float *)&v15 = v14 * v15;
    v16 = ceilf(*(float *)&v15);
    v17 = round(v13 + self->_volumeBarWidth * -0.5);
    -[StockGraphView frame](self, "frame");
    v19 = v18 - v16;
    v21 = v20 - v17;
    volumeBarWidth = self->_volumeBarWidth;
    if (v21 < volumeBarWidth)
      volumeBarWidth = v21;
  }
  else
  {
    v17 = *MEMORY[0x24BDBF090];
    v19 = *(double *)(MEMORY[0x24BDBF090] + 8);
    volumeBarWidth = *(double *)(MEMORY[0x24BDBF090] + 16);
    v16 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  v23 = v17;
  v24 = v16;
  result.size.height = v24;
  result.size.width = volumeBarWidth;
  result.origin.y = v19;
  result.origin.x = v23;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_points);
  free(self->_values);
  free(self->_volumeBars);
  v3.receiver = self;
  v3.super_class = (Class)StockGraphView;
  -[StockGraphView dealloc](&v3, sel_dealloc);
}

- (StockGraphViewContainer)chartViewDelegate
{
  return (StockGraphViewContainer *)objc_loadWeakRetained((id *)&self->_chartViewDelegate);
}

- (void)setChartViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_chartViewDelegate, a3);
}

- (BOOL)isRendered
{
  return self->_isRendered;
}

- (UIEdgeInsets)graphInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_graphInsets.top;
  left = self->_graphInsets.left;
  bottom = self->_graphInsets.bottom;
  right = self->_graphInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setGraphInsets:(UIEdgeInsets)a3
{
  self->_graphInsets = a3;
}

- (StockChartDisplayMode)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(id)a3
{
  objc_storeStrong((id *)&self->_displayMode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMode, 0);
  objc_storeStrong((id *)&self->_renderOperation, 0);
  objc_storeStrong((id *)&self->_dottedLinePositionsForStyleOnly, 0);
  objc_storeStrong((id *)&self->_dottedLinePositions, 0);
  objc_storeStrong((id *)&self->_linePointCounts, 0);
  objc_storeStrong((id *)&self->_chartData, 0);
  objc_destroyWeak((id *)&self->_chartViewDelegate);
  objc_storeStrong((id *)&self->_volumeView, 0);
  objc_storeStrong((id *)&self->_lineView, 0);
}

@end
