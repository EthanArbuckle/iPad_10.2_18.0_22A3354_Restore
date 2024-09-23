@implementation PKSpendingSummaryView

- (PKSpendingSummaryView)initWithFrame:(CGRect)a3
{
  PKSpendingSummaryView *v3;
  PKSpendingSummaryView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKSpendingSummaryView;
  v3 = -[PKSpendingSummaryView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKSpendingSummaryView _createSubviews](v3, "_createSubviews");
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSpendingSummaryView setBackgroundColor:](v4, "setBackgroundColor:", v5);

  }
  return v4;
}

- (void)_createSubviews
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UILabel *v9;
  UILabel *totalAmount;
  UILabel *v11;
  void *v12;
  void *v13;
  UILabel *v14;
  UILabel *spendingLabel;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  void *v19;
  UILabel *v20;
  void *v21;
  UIImageView *v22;
  UIImageView *arrowImageView;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  UIImage *v32;
  UIImage *upArrow;
  UIImage *v34;
  UIImage *downArrow;
  UILabel *v36;
  UILabel *trendDescriptionLabel;
  PKSpendingSummaryChartView *v38;
  PKSpendingSummaryChartView *chartView;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0DC3990]);
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
  totalAmount = self->_totalAmount;
  self->_totalAmount = v9;

  -[UILabel setNumberOfLines:](self->_totalAmount, "setNumberOfLines:", 1);
  -[UILabel setTextColor:](self->_totalAmount, "setTextColor:", v3);
  v11 = self->_totalAmount;
  v12 = (void *)*MEMORY[0x1E0DC4918];
  PKFontForDesign((void *)*MEMORY[0x1E0DC13A8], (void *)*MEMORY[0x1E0DC4B50], (void *)*MEMORY[0x1E0DC4918], 2, 0, *MEMORY[0x1E0DC1420]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v11, "setFont:", v13);

  -[UILabel setAccessibilityIdentifier:](self->_totalAmount, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);
  -[PKSpendingSummaryView addSubview:](self, "addSubview:", self->_totalAmount);
  v14 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
  spendingLabel = self->_spendingLabel;
  self->_spendingLabel = v14;

  -[UILabel setNumberOfLines:](self->_spendingLabel, "setNumberOfLines:", 1);
  v16 = self->_spendingLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v16, "setTextColor:", v17);

  v18 = self->_spendingLabel;
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], v12, 0x8000, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v18, "setFont:", v19);

  v20 = self->_spendingLabel;
  PKLocalizedFeatureString();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v20, "setText:", v21);

  -[UILabel setAccessibilityIdentifier:](self->_spendingLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D680C8]);
  -[PKSpendingSummaryView addSubview:](self, "addSubview:", self->_spendingLabel);
  v22 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v5, v6, v7, v8);
  arrowImageView = self->_arrowImageView;
  self->_arrowImageView = v22;

  -[UIImageView setContentMode:](self->_arrowImageView, "setContentMode:", 4);
  -[PKSpendingSummaryView addSubview:](self, "addSubview:", self->_arrowImageView);
  v24 = (void *)MEMORY[0x1E0DC3888];
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)v12, *MEMORY[0x1E0DC1440]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "configurationWithFont:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "configurationWithPaletteColors:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "configurationByApplyingConfiguration:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("arrow.up.circle.fill"), v31);
  v32 = (UIImage *)objc_claimAutoreleasedReturnValue();
  upArrow = self->_upArrow;
  self->_upArrow = v32;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("arrow.down.circle.fill"), v31);
  v34 = (UIImage *)objc_claimAutoreleasedReturnValue();
  downArrow = self->_downArrow;
  self->_downArrow = v34;

  v36 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
  trendDescriptionLabel = self->_trendDescriptionLabel;
  self->_trendDescriptionLabel = v36;

  -[UILabel setNumberOfLines:](self->_trendDescriptionLabel, "setNumberOfLines:", 0);
  -[PKSpendingSummaryView addSubview:](self, "addSubview:", self->_trendDescriptionLabel);
  v38 = -[PKSpendingSummaryChartView initWithFrame:]([PKSpendingSummaryChartView alloc], "initWithFrame:", v5, v6, v7, v8);
  chartView = self->_chartView;
  self->_chartView = v38;

  -[PKSpendingSummaryChartView setShowLegendGraph:](self->_chartView, "setShowLegendGraph:", 1);
  -[PKSpendingSummaryChartView setShowPlaceholders:](self->_chartView, "setShowPlaceholders:", 0);
  -[PKSpendingSummaryChartView setShowLegendLabels:](self->_chartView, "setShowLegendLabels:", 1);
  -[PKSpendingSummaryView addSubview:](self, "addSubview:", self->_chartView);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKSpendingSummaryView;
  -[PKSpendingSummaryView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKSpendingSummaryView bounds](self, "bounds");
  -[PKSpendingSummaryView _layoutWithBounds:](self, "_layoutWithBounds:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  CGSize result;

  self->_isTemplateLayout = 1;
  -[PKSpendingSummaryView _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  CGRectEdge v8;
  double v9;
  CGFloat v10;
  UILabel *spendingLabel;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  UILabel *totalAmount;
  UIImageView *arrowImageView;
  double v19;
  CGFloat v20;
  double v21;
  UILabel *trendDescriptionLabel;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  CGRect v27;
  CGRect v28;
  CGRect remainder;
  CGRect slice;
  CGSize result;
  CGRect v32;

  width = a3.size.width;
  v5 = a3.origin.x + 12.0;
  v6 = a3.origin.y + 13.0;
  v7 = a3.size.height + -20.0;
  if (-[PKSpendingSummaryView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    v8 = CGRectMaxXEdge;
  else
    v8 = CGRectMinXEdge;
  memset(&slice, 0, sizeof(slice));
  remainder.origin.x = v5;
  remainder.origin.y = v6;
  remainder.size.width = width + -24.0;
  remainder.size.height = v7;
  -[UILabel sizeThatFits:](self->_spendingLabel, "sizeThatFits:", width + -24.0, v7);
  v10 = v9;
  v32.origin.x = v5;
  v32.origin.y = v6;
  v32.size.width = width + -24.0;
  v32.size.height = v7;
  CGRectDivide(v32, &slice, &remainder, v10, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    spendingLabel = self->_spendingLabel;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](spendingLabel, "setFrame:");
  }
  CGRectDivide(remainder, &slice, &remainder, 0.0, CGRectMinYEdge);
  v12 = v10 + 0.0;
  -[UILabel sizeThatFits:](self->_totalAmount, "sizeThatFits:", remainder.size.width, remainder.size.height);
  v14 = v13;
  v16 = v15;
  CGRectDivide(remainder, &slice, &remainder, v15, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    totalAmount = self->_totalAmount;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](totalAmount, "setFrame:");
    if ((-[UIImageView isHidden](self->_arrowImageView, "isHidden") & 1) == 0)
    {
      memset(&v28, 0, sizeof(v28));
      memset(&v27, 0, sizeof(v27));
      CGRectDivide(slice, &v28, &v27, v14 + 8.0, v8);
      arrowImageView = self->_arrowImageView;
      -[UIImageView intrinsicContentSize](arrowImageView, "intrinsicContentSize");
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UIImageView setFrame:](arrowImageView, "setFrame:");
    }
  }
  v19 = v12 + 13.0;
  if ((-[UILabel isHidden](self->_trendDescriptionLabel, "isHidden") & 1) == 0)
  {
    CGRectDivide(remainder, &slice, &remainder, 8.0, CGRectMinYEdge);
    -[UILabel sizeThatFits:](self->_trendDescriptionLabel, "sizeThatFits:", remainder.size.width, 3.40282347e38);
    v21 = v20;
    CGRectDivide(remainder, &slice, &remainder, v20, CGRectMinYEdge);
    v19 = v19 + v16 + 8.0 + v21;
    if (!self->_isTemplateLayout)
    {
      trendDescriptionLabel = self->_trendDescriptionLabel;
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      -[UILabel setFrame:](trendDescriptionLabel, "setFrame:");
    }
  }
  CGRectDivide(remainder, &slice, &remainder, 8.0, CGRectMinYEdge);
  -[PKSpendingSummaryChartView sizeThatFits:](self->_chartView, "sizeThatFits:", remainder.size.width, 3.40282347e38);
  v24 = v23;
  CGRectDivide(remainder, &slice, &remainder, v23, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    -[PKSpendingSummaryChartView setFrame:](self->_chartView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    -[PKSpendingSummaryChartView setFrame:](self->_chartViewToFadeOut, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  v25 = v19 + 8.0 + v24 + 7.0;
  v26 = width;
  result.height = v25;
  result.width = v26;
  return result;
}

- (BOOL)_needsLayoutWithSummary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  char v12;

  v4 = a3;
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSpendingSummary startDate](self->_summary, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!PKEqualObjects())
    goto LABEL_6;
  objc_msgSend(v4, "totalSpending");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSpendingSummary totalSpending](self->_summary, "totalSpending");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!PKEqualObjects()
    || (v9 = objc_msgSend(v4, "summaryType"), v9 != -[PKSpendingSummary summaryType](self->_summary, "summaryType"))
    || (objc_msgSend(v4, "isLoading") & 1) != 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  v12 = -[PKSpendingSummary isLoading](self->_summary, "isLoading");

  if ((v12 & 1) != 0)
  {
    LOBYTE(v10) = 0;
    goto LABEL_8;
  }
LABEL_7:
  v10 = PKEqualObjects() ^ 1;
LABEL_8:

  return v10;
}

- (void)configureWithSummary:(id)a3 presentationStyle:(unint64_t)a4
{
  id v7;
  PKSpendingSummaryChartView *v8;
  PKSpendingSummaryChartView *v9;
  PKSpendingSummaryChartView *chartView;
  PKSpendingSummaryChartView *v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  void *v20;
  void *v21;
  UILabel *totalAmount;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  UILabel *trendDescriptionLabel;
  void *v29;
  UILabel *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  int *v37;
  unint64_t v38;
  int *v39;
  UILabel *v40;
  void *v41;
  void *v42;
  UILabel *v43;
  uint64_t v44;
  _QWORD v45[5];

  v7 = a3;
  if (-[PKSpendingSummaryView _needsLayoutWithSummary:](self, "_needsLayoutWithSummary:", v7))
  {
    if (a4 == 2)
    {
      objc_storeStrong((id *)&self->_chartViewToFadeOut, self->_chartView);
      v8 = [PKSpendingSummaryChartView alloc];
      v9 = -[PKSpendingSummaryChartView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      chartView = self->_chartView;
      self->_chartView = v9;

      -[PKSpendingSummaryChartView setShowLegendGraph:](self->_chartView, "setShowLegendGraph:", 1);
      -[PKSpendingSummaryChartView setShowPlaceholders:](self->_chartView, "setShowPlaceholders:", 0);
      -[PKSpendingSummaryChartView setShowLegendLabels:](self->_chartView, "setShowLegendLabels:", 1);
      v11 = self->_chartView;
      -[PKSpendingSummaryChartView frame](self->_chartViewToFadeOut, "frame");
      -[PKSpendingSummaryChartView setFrame:](v11, "setFrame:");
      -[PKSpendingSummaryView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_chartView, self->_chartViewToFadeOut);
      -[PKSpendingSummaryChartView layer](self->_chartView, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("opacity"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", 0.0, 1.0);
      v14 = (id)objc_msgSend(v12, "pkui_addAdditiveAnimation:", v13);
      LODWORD(v15) = 1.0;
      objc_msgSend(v12, "setOpacity:", v15);
      -[PKSpendingSummaryChartView layer](self->_chartViewToFadeOut, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("opacity"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", 1.0, 0.0);
      v18 = (id)objc_msgSend(v16, "pkui_addAdditiveAnimation:", v17);
      LODWORD(v19) = 0;
      objc_msgSend(v16, "setOpacity:", v19);
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __64__PKSpendingSummaryView_configureWithSummary_presentationStyle___block_invoke;
      v45[3] = &unk_1E3E62288;
      v45[4] = self;
      objc_msgSend(v17, "pkui_setCompletionHandler:", v45);

    }
    objc_storeStrong((id *)&self->_summary, a3);
    objc_msgSend(v7, "totalSpending");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      -[UILabel setText:](self->_totalAmount, "setText:", CFSTR("-"));
      -[UIImageView setHidden:](self->_arrowImageView, "setHidden:", 1);
      -[UILabel setHidden:](self->_trendDescriptionLabel, "setHidden:", 1);
LABEL_21:
      -[PKSpendingSummaryChartView configureWithSummary:presentationStyle:](self->_chartView, "configureWithSummary:presentationStyle:", v7, a4);
      -[PKSpendingSummaryView setNeedsLayout](self, "setNeedsLayout");
      goto LABEL_22;
    }
    objc_msgSend(v7, "totalSpending");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    totalAmount = self->_totalAmount;
    objc_msgSend(v21, "formattedStringValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](totalAmount, "setText:", v23);

    objc_msgSend(v7, "insights");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setHidden:](self->_arrowImageView, "setHidden:", 1);
    -[UILabel setHidden:](self->_trendDescriptionLabel, "setHidden:", 1);
    if (v24)
    {
      objc_msgSend(v24, "overallSpendingTrend");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "amount");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "pk_isZeroNumber");

      if ((v27 & 1) != 0)
      {
        trendDescriptionLabel = self->_trendDescriptionLabel;
        PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC4918], 0.0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](trendDescriptionLabel, "setFont:", v29);

        v30 = self->_trendDescriptionLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v31 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v38 = objc_msgSend(v25, "direction") - 2;
        if (v38 <= 3)
        {
          v39 = off_1E3E67340[v38];
          -[UIImageView setHidden:](self->_arrowImageView, "setHidden:", 0);
          -[UIImageView setImage:](self->_arrowImageView, "setImage:", *(Class *)((char *)&self->super.super.super.isa + *v39));
        }
        v40 = self->_trendDescriptionLabel;
        PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC4918], 2, 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v40, "setFont:", v41);

        v30 = self->_trendDescriptionLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v31 = objc_claimAutoreleasedReturnValue();
      }
      v42 = (void *)v31;
      -[UILabel setTextColor:](v30, "setTextColor:", v31);

      -[UILabel setHidden:](self->_trendDescriptionLabel, "setHidden:", 0);
      v43 = self->_trendDescriptionLabel;
      -[PKSpendingSummaryView _trendDescriptionForSummary:](self, "_trendDescriptionForSummary:", v7);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v43, "setText:", v33);
      goto LABEL_20;
    }
    objc_msgSend(v21, "amount");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "previousTotalSpending");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "amount");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      if ((objc_msgSend(v7, "isCurrentPeriod") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v25, "compare:", v34);

        if (v35 == 1)
        {
          v36 = objc_msgSend(v33, "compare:", v25);
          switch(v36)
          {
            case -1:
              v37 = &OBJC_IVAR___PKSpendingSummaryView__upArrow;
              goto LABEL_24;
            case 0:
              v44 = 1;
              goto LABEL_26;
            case 1:
              v37 = &OBJC_IVAR___PKSpendingSummaryView__downArrow;
LABEL_24:
              -[UIImageView setImage:](self->_arrowImageView, "setImage:", *(Class *)((char *)&self->super.super.super.isa + *v37));
              v44 = 0;
LABEL_26:
              -[UIImageView setHidden:](self->_arrowImageView, "setHidden:", v44);
              break;
          }
        }
      }
    }
LABEL_20:

    goto LABEL_21;
  }
LABEL_22:

}

void __64__PKSpendingSummaryView_configureWithSummary_presentationStyle___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 472);
  *(_QWORD *)(v2 + 472) = 0;

}

- (void)setVisible:(BOOL)a3
{
  _BOOL8 v3;

  if (((!self->_visible ^ a3) & 1) == 0)
  {
    v3 = a3;
    self->_visible = a3;
    -[PKSpendingSummaryChartView setVisible:](self->_chartView, "setVisible:");
    -[PKSpendingSummaryChartView setVisible:](self->_chartViewToFadeOut, "setVisible:", v3);
  }
}

- (id)_trendDescriptionForSummary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  __CFString *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  __CFString *v11;
  void *v12;
  BOOL v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v19;

  v3 = a3;
  objc_msgSend(v3, "insights");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overallSpendingTrend");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v3, "summaryType");
    if (v6 > 2)
      v7 = 0;
    else
      v7 = off_1E3E67360[v6];
    v9 = objc_msgSend(v3, "isCurrentPeriod");
    switch(objc_msgSend(v5, "direction"))
    {
      case 0:
        -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", CFSTR("_THIS"));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        PKLocalizedFeatureString();
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        PKLocalizedFeatureString();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_33;
      case 1:
      case 2:
      case 3:
        if (v9)
          v10 = CFSTR("_LAST");
        else
          v10 = CFSTR("_PREVIOUS");
        if (v9)
          v11 = CFSTR("ACCOUNT_INSIGHT_TREND_STEADY_CURRENT_PERIOD");
        else
          v11 = CFSTR("ACCOUNT_INSIGHT_TREND_STEADY_PREVIOUS_PERIOD");
        -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v10);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v3, "isFamilySummary"))
        {
          -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", CFSTR("_FAMILY"));
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        PKLocalizedFeatureString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedFeatureString();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_32;
      case 4:
        v13 = v9 == 0;
        if (v9)
          v14 = CFSTR("_LAST");
        else
          v14 = CFSTR("_PREVIOUS");
        v15 = CFSTR("ACCOUNT_INSIGHT_TREND_INCREASING_PREVIOUS_PERIOD");
        v16 = CFSTR("ACCOUNT_INSIGHT_TREND_INCREASING_CURRENT_PERIOD");
        goto LABEL_26;
      case 5:
        v13 = v9 == 0;
        if (v9)
          v14 = CFSTR("_LAST");
        else
          v14 = CFSTR("_PREVIOUS");
        v15 = CFSTR("ACCOUNT_INSIGHT_TREND_DECREASING_PREVIOUS_PERIOD");
        v16 = CFSTR("ACCOUNT_INSIGHT_TREND_DECREASING_CURRENT_PERIOD");
LABEL_26:
        if (v13)
          v11 = (__CFString *)v15;
        else
          v11 = (__CFString *)v16;
        -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v14);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v3, "isFamilySummary"))
        {
          -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", CFSTR("_FAMILY"));
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        PKLocalizedFeatureString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "change");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "formattedStringValue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedFeatureString();
        v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_32:
LABEL_33:

        break;
      default:
        v8 = 0;
        break;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_chartViewToFadeOut, 0);
  objc_storeStrong((id *)&self->_chartView, 0);
  objc_storeStrong((id *)&self->_trendDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_arrowImageView, 0);
  objc_storeStrong((id *)&self->_downArrow, 0);
  objc_storeStrong((id *)&self->_upArrow, 0);
  objc_storeStrong((id *)&self->_spendingLabel, 0);
  objc_storeStrong((id *)&self->_totalAmount, 0);
}

@end
