@implementation PKSpendingSummaryChartView

- (PKSpendingSummaryChartView)initWithFrame:(CGRect)a3
{
  PKSpendingSummaryChartView *v3;
  NSString *v4;
  NSString *v5;
  uint64_t v6;
  UIFont *fontForLabels;
  uint64_t v8;
  UIFont *fontForValues;
  NSMutableArray *v10;
  NSMutableArray *legendLabels;
  NSMutableArray *v12;
  NSMutableArray *bars;
  NSMutableArray *v14;
  NSMutableArray *horizontalAxis;
  NSMutableArray *v16;
  NSMutableArray *valueLabels;
  uint64_t v18;
  NSCalendar *currentCalendar;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PKSpendingSummaryChartView;
  v3 = -[PKSpendingSummaryChartView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSString *)*MEMORY[0x1E0DC4AA0];
    v5 = (NSString *)*MEMORY[0x1E0DC4918];
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AA0], (NSString *)*MEMORY[0x1E0DC4918]);
    v6 = objc_claimAutoreleasedReturnValue();
    fontForLabels = v3->_fontForLabels;
    v3->_fontForLabels = (UIFont *)v6;

    PKFontForDefaultDesign(v4, v5);
    v8 = objc_claimAutoreleasedReturnValue();
    fontForValues = v3->_fontForValues;
    v3->_fontForValues = (UIFont *)v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    legendLabels = v3->_legendLabels;
    v3->_legendLabels = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    bars = v3->_bars;
    v3->_bars = v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    horizontalAxis = v3->_horizontalAxis;
    v3->_horizontalAxis = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    valueLabels = v3->_valueLabels;
    v3->_valueLabels = v16;

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v18 = objc_claimAutoreleasedReturnValue();
    currentCalendar = v3->_currentCalendar;
    v3->_currentCalendar = (NSCalendar *)v18;

    v3->_isCompactUI = PKUIGetMinScreenWidthType() == 0;
  }
  return v3;
}

- (void)configureWithSummary:(id)a3 presentationStyle:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  id v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _BOOL4 isCompactUI;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  PKSegmentedBarView *v28;
  void *v29;
  void *v30;
  float v31;
  double v32;
  double groupsMaxAmount;
  float v34;
  void *v35;
  void *v36;
  void *v37;
  float v38;
  unint64_t v39;
  unint64_t v40;
  double chartMaxAmount;
  unint64_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSDecimalNumber *v53;
  void *v54;
  void *v55;
  unint64_t i;
  void *v57;
  void *v58;
  unint64_t j;
  void *v60;
  void *v61;
  char v62;
  unint64_t v63;
  id v64;
  id v65;
  uint64_t v66;
  NSString *v67;
  void *v68;
  id v69;

  v69 = a3;
  objc_storeStrong((id *)&self->_summary, a3);
  self->_chartMaxAmount = 0.0;
  self->_groupsMaxAmount = 0.0;
  self->_presentationStyle = a4;
  objc_msgSend(v69, "totalSpending");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currency");
  v67 = (NSString *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v69, "summaryType");
  switch(v8)
  {
    case 2:
      v65 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      objc_msgSend(v65, "setLocalizedDateFormatFromTemplate:", CFSTR("MMM"));
      v64 = 0;
LABEL_10:
      v11 = 4;
LABEL_11:
      objc_msgSend(v69, "spendingsPerCalendarUnit", v11);
      goto LABEL_13;
    case 1:
      v64 = objc_alloc_init(MEMORY[0x1E0CB3590]);
      objc_msgSend(v64, "setDateTemplate:", CFSTR("d"));
      v65 = 0;
      goto LABEL_10;
    case 0:
      v9 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      v65 = v9;
      if (self->_isCompactUI || self->_prioritizeLegendPlacement)
        v10 = CFSTR("EEEEE");
      else
        v10 = CFSTR("EEE");
      objc_msgSend(v9, "setLocalizedDateFormatFromTemplate:", v10);
      v64 = 0;
      v11 = 3;
      goto LABEL_11;
  }
  v64 = 0;
  v65 = 0;
  objc_msgSend(v69, "spendingsPerCalendarUnit", 0);
LABEL_13:
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v12;
  if (objc_msgSend(v12, "count"))
  {
    v13 = 0;
    v14 = *MEMORY[0x1E0C9D648];
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      objc_msgSend(v12, "objectAtIndex:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSMutableArray count](self->_legendLabels, "count") <= v13
        || (-[NSMutableArray objectAtIndex:](self->_legendLabels, "objectAtIndex:", v13),
            (v19 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v14, v15, v16, v17);
        objc_msgSend(v19, "setNumberOfLines:", 1);
        objc_msgSend(v19, "setAdjustsFontSizeToFitWidth:", 1);
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setTextColor:", v20);

        -[NSMutableArray addObject:](self->_legendLabels, "addObject:", v19);
        -[PKSpendingSummaryChartView addSubview:](self, "addSubview:", v19);
      }
      objc_msgSend(v19, "setFont:", self->_fontForLabels);
      objc_msgSend(v19, "setHidden:", 0);
      objc_msgSend(v18, "startDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v69, "summaryType");
      if (!v22 || v22 == 2)
      {
        objc_msgSend(v65, "stringFromDate:", v21);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "pk_uppercaseFirstStringForPreferredLocale");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setText:", v27);

      }
      else
      {
        if (v22 != 1)
          goto LABEL_27;
        isCompactUI = self->_isCompactUI;
        v24 = v21;
        if (!self->_isCompactUI)
        {
          objc_msgSend(v18, "endDate");
          v66 = objc_claimAutoreleasedReturnValue();
          v24 = (void *)v66;
        }
        objc_msgSend(v64, "stringFromDate:toDate:", v21, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setText:", v25);

        v26 = (void *)v66;
        if (isCompactUI)
          goto LABEL_27;
      }

LABEL_27:
      if (-[NSMutableArray count](self->_bars, "count") <= v13
        || (-[NSMutableArray objectAtIndex:](self->_bars, "objectAtIndex:", v13),
            (v28 = (PKSegmentedBarView *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        v28 = -[PKSegmentedBarView initWithFrame:]([PKSegmentedBarView alloc], "initWithFrame:", v14, v15, v16, v17);
        -[PKSpendingSummaryChartView _configureBarView:smallContext:](self, "_configureBarView:smallContext:", v28, self->_showPlaceholders);
        -[PKSegmentedBarView setShowPlaceholder:](v28, "setShowPlaceholder:", self->_showPlaceholders);
        -[PKSegmentedBarView setBlurDisabled:](v28, "setBlurDisabled:", self->_blurDisabled);
        -[NSMutableArray addObject:](self->_bars, "addObject:", v28);
        -[PKSpendingSummaryChartView addSubview:](self, "addSubview:", v28);
      }
      -[PKSegmentedBarView setHidden:](v28, "setHidden:", 0);
      objc_msgSend(v18, "totalSpending");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "amount");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "floatValue");
      v32 = v31;

      if (self->_groupsMaxAmount < v32)
        self->_groupsMaxAmount = v32;

      ++v13;
      v12 = v68;
    }
    while (v13 < objc_msgSend(v68, "count"));
  }
  groupsMaxAmount = self->_groupsMaxAmount;
  if (groupsMaxAmount > 0.0)
  {
    v34 = groupsMaxAmount;
    self->_chartMaxAmount = (double)(10 * ((uint64_t)(llroundf(v34) + 10) / 10));
LABEL_37:
    v39 = v63;
    goto LABEL_38;
  }
  objc_msgSend(v69, "previousMaxAmount");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(v69, "previousMaxAmount");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "amount");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "floatValue");
    self->_chartMaxAmount = (double)(10 * ((uint64_t)(llroundf(v38) + 10) / 10));

    goto LABEL_37;
  }
  v62 = objc_msgSend(v69, "isLoading");
  v39 = v63;
  if ((v62 & 1) == 0)
    self->_chartMaxAmount = 10.0;
LABEL_38:
  v40 = 0;
  chartMaxAmount = self->_chartMaxAmount;
  if (chartMaxAmount <= 50.0)
    v42 = 3;
  else
    v42 = v39;
  self->_axisCount = 2 * v42 - 1;
  v43 = chartMaxAmount / (double)(v42 - 1);
  v44 = *MEMORY[0x1E0C9D648];
  v45 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v46 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v47 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v48 = 0.0;
  do
  {
    if (-[NSMutableArray count](self->_horizontalAxis, "count") <= v40
      || (-[NSMutableArray objectAtIndex:](self->_horizontalAxis, "objectAtIndex:", v40),
          (v49 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v44, v45, v46, v47);
      -[NSMutableArray addObject:](self->_horizontalAxis, "addObject:", v49);
      -[PKSpendingSummaryChartView addSubview:](self, "addSubview:", v49);
    }
    objc_msgSend(v49, "setHidden:", 0);
    if ((v40 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setBackgroundColor:", v51);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGray3Color");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setBackgroundColor:", v50);

      if (-[NSMutableArray count](self->_valueLabels, "count") <= v40 >> 1
        || (-[NSMutableArray objectAtIndex:](self->_valueLabels, "objectAtIndex:", v40 >> 1),
            (v51 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v44, v45, v46, v47);
        objc_msgSend(v51, "setNumberOfLines:", 1);
        objc_msgSend(v51, "setAdjustsFontSizeToFitWidth:", 1);
        objc_msgSend(v51, "setMinimumScaleFactor:", 0.5);
        objc_msgSend(v51, "setBaselineAdjustment:", 1);
        objc_msgSend(v51, "setFont:", self->_fontForValues);
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setTextColor:", v52);

        -[NSMutableArray addObject:](self->_valueLabels, "addObject:", v51);
        -[PKSpendingSummaryChartView addSubview:](self, "addSubview:", v51);
      }
      objc_msgSend(v51, "setHidden:", self->_chartMaxAmount <= 0.0);
      if (v67)
      {
        v53 = (NSDecimalNumber *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3598]), "initWithDouble:", round(v48));
        PKCurrencyAmountCreate(v53, v67);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "minimalFormattedStringValue");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setText:", v55);

      }
      else
      {
        objc_msgSend(v51, "setText:", 0);
      }
      if ((v40 >> 1) + 2 == v42)
        v48 = self->_chartMaxAmount;
      else
        v48 = v43 + v48;
    }

    ++v40;
  }
  while (v40 < self->_axisCount);
  for (i = objc_msgSend(v68, "count"); i < -[NSMutableArray count](self->_legendLabels, "count"); ++i)
  {
    -[NSMutableArray objectAtIndex:](self->_legendLabels, "objectAtIndex:", i);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setHidden:", 1);

    -[NSMutableArray objectAtIndex:](self->_bars, "objectAtIndex:", i);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setHidden:", 1);

  }
  for (j = self->_axisCount; j < -[NSMutableArray count](self->_horizontalAxis, "count"); ++j)
  {
    -[NSMutableArray objectAtIndex:](self->_horizontalAxis, "objectAtIndex:", j);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setHidden:", 1);

  }
  while (v42 < -[NSMutableArray count](self->_valueLabels, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_valueLabels, "objectAtIndex:", v42);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setHidden:", 1);

    ++v42;
  }
  -[PKSpendingSummaryChartView setNeedsLayout](self, "setNeedsLayout");

}

- (void)layoutSubviews
{
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  uint64_t v9;
  CGFloat v10;
  double v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  char *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  unint64_t presentationStyle;
  char *v25;
  double v26;
  double v27;
  uint64_t v28;
  BOOL v29;
  void *v30;
  _BOOL8 v31;
  void *v33;
  PKSpendingSummaryChartBarConfiguration *v34;
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
  double v45;
  unint64_t v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double y;
  double x;
  uint64_t v57;
  uint64_t v58;
  double width;
  double height;
  double v61;
  double v62;
  double v63;
  void *v64;
  _QWORD v65[6];
  id v66[2];
  BOOL v67;
  id location;
  _QWORD v69[4];
  CGRect remainder;
  CGRect slice;
  objc_super v72;

  v72.receiver = self;
  v72.super_class = (Class)PKSpendingSummaryChartView;
  -[PKSpendingSummaryChartView layoutSubviews](&v72, sel_layoutSubviews);
  -[PKSpendingSummaryChartView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  memset(&slice, 0, sizeof(slice));
  remainder.origin.x = v7;
  remainder.origin.y = v8;
  remainder.size.width = v3;
  remainder.size.height = v5;
  v9 = MEMORY[0x1E0C9D648];
  if (self->_showLegendGraph)
  {
    PKFloatRoundToPixel();
    CGRectDivide(remainder, &slice, &remainder, v10, CGRectMaxXEdge);
    x = slice.origin.x;
    width = slice.size.width;
    if (self->_isCompactUI)
      v11 = 2.0;
    else
      v11 = 7.0;
    CGRectDivide(remainder, &slice, &remainder, v11, CGRectMaxXEdge);
    if (self->_showLegendGraph)
      CGRectDivide(remainder, &slice, &remainder, 8.0, CGRectMinYEdge);
  }
  else
  {
    x = *MEMORY[0x1E0C9D648];
    width = 0.0;
  }
  if (self->_showLegendLabels)
  {
    -[NSMutableArray firstObject](self->_legendLabels, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sizeThatFits:", v4, v6);
    v14 = v13;

    CGRectDivide(remainder, &slice, &remainder, v14, CGRectMaxYEdge);
    height = slice.size.height;
    v61 = slice.size.width;
    CGRectDivide(remainder, &slice, &remainder, 7.0, CGRectMaxYEdge);
  }
  else
  {
    height = *(double *)(v9 + 24);
    v61 = *(double *)(v9 + 16);
  }
  v15 = remainder.size.height;
  v62 = remainder.size.width;
  v63 = remainder.origin.x;
  y = remainder.origin.y;
  CGRectGetMaxY(remainder);
  v58 = -[PKSpendingSummary summaryType](self->_summary, "summaryType");
  -[PKSpendingSummary spendingsPerCalendarUnit](self->_summary, "spendingsPerCalendarUnit");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (char *)objc_msgSend(v64, "count");
  if (self->_prioritizeLegendPlacement && self->_showLegendLabels)
  {
    -[NSMutableArray firstObject](self->_legendLabels, "firstObject", 0.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sizeThatFits:", v61, height);

    -[NSMutableArray lastObject](self->_legendLabels, "lastObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sizeThatFits:", v61, height);

  }
  if (self->_showLegendGraph)
    v19 = 5.0;
  else
    v19 = 0.0;
  PKFloatRoundToPixel();
  v21 = v20;
  PKFloatRoundToPixel();
  v23 = v22;
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x2020000000;
  v69[3] = 0;
  objc_initWeak(&location, self);
  presentationStyle = self->_presentationStyle;
  v57 = -[PKSpendingSummary summaryType](self->_summary, "summaryType");
  if (v16)
  {
    v25 = 0;
    v26 = v21 / (double)(unint64_t)(v16 - 1);
    v27 = v23 + v19;
    v28 = (presentationStyle < 4) & (0xCu >> (presentationStyle & 0xF));
    v29 = presentationStyle == 1;
    do
    {
      if (self->_showLegendLabels)
      {
        -[NSMutableArray objectAtIndex:](self->_legendLabels, "objectAtIndex:", v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "sizeThatFits:", v61, height);
        PKFloatRoundToPixel();
        objc_msgSend(v30, "setFrame:");
        v31 = v25 & 1;
        if ((v25 & 1) != 0 && v58 != 2)
          v31 = self->_prioritizeLegendPlacement && v57 == 1;
        objc_msgSend(v30, "setHidden:", v31);

      }
      objc_msgSend(v64, "objectAtIndex:", v25);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[PKSpendingSummaryChartBarConfiguration initWithSummary:]([PKSpendingSummaryChartBarConfiguration alloc], "initWithSummary:", v33);
      -[NSMutableArray objectAtIndex:](self->_bars, "objectAtIndex:", v25);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0.0;
      if (self->_chartMaxAmount > 0.0)
      {
        -[PKSpendingSummaryChartBarConfiguration totalValue](v34, "totalValue");
        if (v37 > 0.0)
        {
          PKFloatRoundToPixel();
          v36 = v38;
        }
        objc_msgSend(v35, "minimumLength");
        v36 = fmax(fmin(v36, v15), v39);
      }
      PKFloatRoundToPixel();
      objc_msgSend(v35, "setFrame:");
      objc_msgSend(v35, "layer");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v41) = 0;
      objc_msgSend(v40, "setOpacity:", v41);

      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = __44__PKSpendingSummaryChartView_layoutSubviews__block_invoke;
      v65[3] = &unk_1E3E766A0;
      objc_copyWeak(v66, &location);
      v66[1] = v16;
      v67 = v29;
      v65[4] = self;
      v65[5] = v69;
      objc_msgSend(v35, "configureWithBarConfiguration:axis:maximumLength:barLength:synchronous:completion:", v34, 1, v28, v65, v15, v36);
      -[PKSpendingSummaryChartView bringSubviewToFront:](self, "bringSubviewToFront:", v35);
      v27 = v26 + v27;
      objc_destroyWeak(v66);

      ++v25;
    }
    while (v16 != v25);
  }
  PKFloatRoundToPixel();
  v43 = v42;
  v44 = PKUIPixelLength();
  if (self->_showLegendGraph && self->_axisCount)
  {
    v45 = v44;
    v46 = 0;
    v47 = y + v15;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_horizontalAxis, "objectAtIndex:", v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setFrame:", v63, v47 - v45, v62, v45);
      if ((v46 & 1) == 0 && self->_chartMaxAmount > 0.0)
      {
        -[NSMutableArray objectAtIndex:](self->_valueLabels, "objectAtIndex:", v46 >> 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "sizeThatFits:", width, 1.79769313e308);
        v51 = v50;
        v53 = v52;
        PKFloatRoundToPixel();
        objc_msgSend(v49, "setFrame:", x + 2.0, v54, fmin(width, v51), v53);

      }
      v47 = v47 - v43;

      ++v46;
    }
    while (v46 < self->_axisCount);
  }
  objc_destroyWeak(&location);
  _Block_object_dispose(v69, 8);

}

void __44__PKSpendingSummaryChartView_layoutSubviews__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  double v7;
  float v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == *(_QWORD *)(a1 + 56))
    {
      if (*(_BYTE *)(a1 + 64) && *(_BYTE *)(*(_QWORD *)(a1 + 32) + 518))
        v3 = (void *)objc_msgSend(MEMORY[0x1E0D6C038], "createDefaultFactory");
      else
        v3 = 0;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __44__PKSpendingSummaryChartView_layoutSubviews__block_invoke_2;
      v11[3] = &unk_1E3E6AB68;
      v11[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "setAnimationDelayHandler:", v11);
      if (*(_QWORD *)(a1 + 56))
      {
        v4 = 0;
        do
        {
          objc_msgSend(WeakRetained[55], "objectAtIndex:", v4);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "layer");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "opacity");
          if (*(float *)&v7 != 1.0)
          {
            v8 = *(float *)&v7;
            LODWORD(v7) = 1.0;
            objc_msgSend(v6, "setOpacity:", v7);
            if (v3)
            {
              objc_msgSend(v3, "springAnimationForView:withKeyPath:", v5, CFSTR("opacity"));
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v8, 1.0);
              v10 = (id)objc_msgSend(v6, "pkui_addAdditiveAnimation:", v9);

            }
          }

          ++v4;
        }
        while (v4 < *(_QWORD *)(a1 + 56));
      }

    }
  }

}

double __44__PKSpendingSummaryChartView_layoutSubviews__block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "indexOfObject:", a2);
  return 0.0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  PKFloatRoundToPixel();
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)setShowLegendLabels:(BOOL)a3
{
  if (((!self->_showLegendLabels ^ a3) & 1) == 0)
  {
    self->_showLegendLabels = a3;
    -[PKSpendingSummaryChartView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowLegendGraph:(BOOL)a3
{
  if (((!self->_showLegendGraph ^ a3) & 1) == 0)
  {
    self->_showLegendGraph = a3;
    -[PKSpendingSummaryChartView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowPlaceholders:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (((!self->_showPlaceholders ^ a3) & 1) == 0)
  {
    v3 = a3;
    self->_showPlaceholders = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_bars;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          -[PKSpendingSummaryChartView _configureBarView:smallContext:](self, "_configureBarView:smallContext:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), v3, (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    -[PKSpendingSummaryChartView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPrioritizeLegendPlacementUI:(BOOL)a3
{
  if (((!self->_prioritizeLegendPlacement ^ a3) & 1) == 0)
  {
    self->_prioritizeLegendPlacement = a3;
    -[PKSpendingSummaryChartView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBlurDisabled:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (((!self->_blurDisabled ^ a3) & 1) == 0)
  {
    v3 = a3;
    self->_blurDisabled = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_bars;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setBlurDisabled:", v3, (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    -[PKSpendingSummaryChartView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_configureBarView:(id)a3 smallContext:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "setShowPlaceholder:", v4);
  objc_msgSend(v5, "setUseSmallCornerRadius:", v4);
  objc_msgSend(v5, "setRoundBaselineCorners:", v4);

}

- (BOOL)showLegendGraph
{
  return self->_showLegendGraph;
}

- (BOOL)showPlaceholders
{
  return self->_showPlaceholders;
}

- (BOOL)showLegendLabels
{
  return self->_showLegendLabels;
}

- (BOOL)prioritizeLegendPlacement
{
  return self->_prioritizeLegendPlacement;
}

- (void)setPrioritizeLegendPlacement:(BOOL)a3
{
  self->_prioritizeLegendPlacement = a3;
}

- (BOOL)isBlurDisabled
{
  return self->_blurDisabled;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_fontForValues, 0);
  objc_storeStrong((id *)&self->_fontForLabels, 0);
  objc_storeStrong((id *)&self->_bars, 0);
  objc_storeStrong((id *)&self->_horizontalAxis, 0);
  objc_storeStrong((id *)&self->_legendLabels, 0);
  objc_storeStrong((id *)&self->_valueLabels, 0);
}

@end
