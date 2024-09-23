@implementation PKPayLaterFinancingPlanCellView

- (PKPayLaterFinancingPlanCellView)initWithFinancingPlan:(id)a3 context:(unint64_t)a4 rowIndex:(int64_t)a5
{
  id v9;
  PKPayLaterFinancingPlanCellView *v10;
  PKPayLaterFinancingPlanCellView *v11;
  id *p_financingPlan;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  UILabel *v36;
  UILabel *primaryLabel;
  UILabel *v38;
  void *v39;
  void *v40;
  void *v41;
  UILabel *v42;
  NSString *v43;
  void *v44;
  UILabel *v45;
  void *v46;
  UILabel *v47;
  UILabel *secondaryLabel;
  UILabel *v49;
  void *v50;
  void *v51;
  void *v52;
  UILabel *v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t v57;
  UIImageView *disclosureView;
  UIImageView *v59;
  void *v60;
  void *v61;
  void *v62;
  UIImageView *v63;
  void *v64;
  uint64_t v65;
  UIActivityIndicatorView *spinner;
  UIActivityIndicatorView *v67;
  void *v68;
  void *v69;
  void *v70;
  unint64_t v71;
  UILabel *v72;
  _QWORD *p_tertiaryLabel;
  UILabel *tertiaryLabel;
  UILabel *v75;
  void *v76;
  void *v77;
  void *v78;
  UILabel *v79;
  void *v80;
  PKProgressBar *v81;
  PKProgressBar *progressBar;
  PKProgressBar *v83;
  void *v84;
  void *v85;
  void *v86;
  PKProgressBar *v87;
  void *v88;
  PKProgressBar *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  NSString *v97;
  unint64_t v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  objc_super v106;

  v9 = a3;
  v106.receiver = self;
  v106.super_class = (Class)PKPayLaterFinancingPlanCellView;
  v10 = -[PKPayLaterFinancingPlanCellView initWithFrame:](&v106, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v11 = v10;
  if (v10)
  {
    p_financingPlan = (id *)&v10->_financingPlan;
    objc_storeStrong((id *)&v10->_financingPlan, a3);
    v11->_context = a4;
    v11->_rowIndex = a5;
    objc_msgSend(*p_financingPlan, "planSummary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentBalance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_financingPlan, "merchant");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "displayName");
    v16 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "progress");
    v18 = v17;
    if (qword_1EE4F95E8 != -1)
      dispatch_once(&qword_1EE4F95E8, &__block_literal_global_248);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "planSummary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "totalAmount");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v100 = v13;
    v104 = (void *)v16;
    v98 = a4;
    if (a4)
    {
      v21 = 0;
      v22 = 0;
    }
    else
    {
      v23 = objc_msgSend(*p_financingPlan, "state");
      v21 = 0;
      v22 = 0;
      switch(v23)
      {
        case 1:
          objc_msgSend(v14, "formattedStringValue");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedCocoonString(CFSTR("FINANCING_PLAN_TOTAL_REMAINING"), CFSTR("%@"), v24);
          v25 = objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        case 2:
        case 3:
          PKLocalizedCocoonString(CFSTR("INSTALLMENT_PENDING"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            objc_msgSend(v20, "formattedStringValue");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            PKLocalizedCocoonString(CFSTR("INSTALLMENT_TOTAL_AMOUNT"), CFSTR("%@"), v24);
            v25 = objc_claimAutoreleasedReturnValue();
LABEL_29:

            v21 = v22;
            v22 = (void *)v25;
          }
          else
          {
            v21 = 0;
          }
          break;
        case 4:
          PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAYMENT_PAST_DUE"));
          v25 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
          v22 = 0;
          v24 = v105;
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        case 5:
          if (v20)
          {
            objc_msgSend(v20, "formattedStringValue");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            PKLocalizedCocoonString(CFSTR("INSTALLMENT_TOTAL_AMOUNT"), CFSTR("%@"), v26);
            v25 = objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v25 = 0;
          }
          objc_msgSend(*p_financingPlan, "planSummary");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "cancellationDate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            objc_msgSend((id)_MergedGlobals_5_10, "stringFromDate:", v24);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            PKLocalizedCocoonString(CFSTR("INSTALLMENT_CANCELED_DATE"), CFSTR("%@"), v34);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            PKLocalizedCocoonString(CFSTR("INSTALLMENT_CANCELED"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_29;
        case 6:
          objc_msgSend(*p_financingPlan, "scheduleSummary");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "lastPayment");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "postedDate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            objc_msgSend((id)_MergedGlobals_5_10, "stringFromDate:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAID_DATE"), CFSTR("%@"), v29);
            v25 = objc_claimAutoreleasedReturnValue();

          }
          else
          {
            PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAID"));
            v25 = objc_claimAutoreleasedReturnValue();
          }
          if (v20)
          {
            objc_msgSend(v20, "formattedStringValue");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            PKLocalizedCocoonString(CFSTR("INSTALLMENT_TOTAL_AMOUNT"), CFSTR("%@"), v35);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v22 = 0;
          }

          goto LABEL_29;
        case 7:
          break;
        case 8:
          objc_msgSend(v9, "planSummary");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "totalAmount");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          PKLocalizedCocoonString(CFSTR("INSTALLMENT_PENDING_CANCELLATION"));
          v25 = objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            objc_msgSend(v24, "formattedStringValue");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            PKLocalizedCocoonString(CFSTR("INSTALLMENT_TOTAL_AMOUNT"), CFSTR("%@"), v31);
            v32 = objc_claimAutoreleasedReturnValue();

            v22 = (void *)v25;
            v25 = v32;
          }
          else
          {
LABEL_17:
            v22 = 0;
          }
          goto LABEL_29;
        default:
          v22 = 0;
          break;
      }
    }
    v103 = v21;
    v99 = v14;
    v101 = v9;
    v36 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    primaryLabel = v11->_primaryLabel;
    v11->_primaryLabel = v36;

    v38 = v11->_primaryLabel;
    v39 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11->_rowIndex);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringWithFormat:", CFSTR("PKPayLaterFinancingPlanCellView.primaryLabel.%@"), v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAccessibilityIdentifier:](v38, "setAccessibilityIdentifier:", v41);

    -[UILabel setNumberOfLines:](v11->_primaryLabel, "setNumberOfLines:", 0);
    v42 = v11->_primaryLabel;
    v43 = (NSString *)*MEMORY[0x1E0DC48D0];
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC48D0], 32770, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v42, "setFont:", v44);

    v45 = v11->_primaryLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v45, "setTextColor:", v46);

    -[UILabel setText:](v11->_primaryLabel, "setText:", v104);
    -[PKPayLaterFinancingPlanCellView addSubview:](v11, "addSubview:", v11->_primaryLabel);
    v47 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    secondaryLabel = v11->_secondaryLabel;
    v11->_secondaryLabel = v47;

    v49 = v11->_secondaryLabel;
    v50 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11->_rowIndex);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "stringWithFormat:", CFSTR("PKPayLaterFinancingPlanCellView.secondaryLabel.%@"), v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAccessibilityIdentifier:](v49, "setAccessibilityIdentifier:", v52);

    -[UILabel setNumberOfLines:](v11->_secondaryLabel, "setNumberOfLines:", 0);
    v53 = v11->_secondaryLabel;
    v97 = (NSString *)*MEMORY[0x1E0DC4AB8];
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AB8], v43);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v53, "setFont:", v54);

    -[UILabel setTextColor:](v11->_secondaryLabel, "setTextColor:", v105);
    -[UILabel setText:](v11->_secondaryLabel, "setText:", v22);
    -[PKPayLaterFinancingPlanCellView addSubview:](v11, "addSubview:", v11->_secondaryLabel);
    v55 = objc_alloc(MEMORY[0x1E0DC3890]);
    PKUIChevronImage();
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "initWithImage:", v56);
    disclosureView = v11->_disclosureView;
    v11->_disclosureView = (UIImageView *)v57;

    v59 = v11->_disclosureView;
    v60 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11->_rowIndex);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "stringWithFormat:", CFSTR("PKPayLaterFinancingPlanCellView.disclosureView.%@"), v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setAccessibilityIdentifier:](v59, "setAccessibilityIdentifier:", v62);

    v63 = v11->_disclosureView;
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v63, "setTintColor:", v64);

    -[PKPayLaterFinancingPlanCellView addSubview:](v11, "addSubview:", v11->_disclosureView);
    -[UIImageView setHidden:](v11->_disclosureView, "setHidden:", 0);
    v65 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    spinner = v11->_spinner;
    v11->_spinner = (UIActivityIndicatorView *)v65;

    v67 = v11->_spinner;
    v68 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11->_rowIndex);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "stringWithFormat:", CFSTR("PKPayLaterFinancingPlanCellView.spinner.%@"), v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView setAccessibilityIdentifier:](v67, "setAccessibilityIdentifier:", v70);

    -[UIActivityIndicatorView startAnimating](v11->_spinner, "startAnimating");
    -[PKPayLaterFinancingPlanCellView addSubview:](v11, "addSubview:", v11->_spinner);
    -[UIActivityIndicatorView setHidden:](v11->_spinner, "setHidden:", 1);
    if (v98)
      goto LABEL_37;
    v71 = -[PKPayLaterFinancingPlan state](v11->_financingPlan, "state");
    if (v71 > 8)
      goto LABEL_37;
    if (((1 << v71) & 0x1ED) != 0)
    {
      if (!objc_msgSend(v103, "length"))
      {
LABEL_37:
        v91 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[UILabel text](v11->_primaryLabel, "text");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "safelyAddObject:", v92);

        -[UILabel text](v11->_secondaryLabel, "text");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "safelyAddObject:", v93);

        -[UILabel text](v11->_tertiaryLabel, "text");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "safelyAddObject:", v94);

        objc_msgSend(v91, "componentsJoinedByString:", CFSTR(","));
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPayLaterFinancingPlanCellView setAccessibilityLabel:](v11, "setAccessibilityLabel:", v95);
        -[PKPayLaterFinancingPlanCellView setIsAccessibilityElement:](v11, "setIsAccessibilityElement:", 1);

        v9 = v101;
        goto LABEL_38;
      }
      v72 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      p_tertiaryLabel = &v11->_tertiaryLabel;
      tertiaryLabel = v11->_tertiaryLabel;
      v11->_tertiaryLabel = v72;

      v75 = v11->_tertiaryLabel;
      v76 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11->_rowIndex);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "stringWithFormat:", CFSTR("PKPayLaterFinancingPlanCellView.tertiaryLabel.%@"), v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setAccessibilityIdentifier:](v75, "setAccessibilityIdentifier:", v78);

      -[UILabel setNumberOfLines:](v11->_tertiaryLabel, "setNumberOfLines:", 0);
      v79 = v11->_tertiaryLabel;
      PKFontForDefaultDesign(v97, v43);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v79, "setFont:", v80);

      -[UILabel setTextColor:](v11->_tertiaryLabel, "setTextColor:", v102);
      -[UILabel setText:](v11->_tertiaryLabel, "setText:", v103);
    }
    else
    {
      v81 = objc_alloc_init(PKProgressBar);
      p_tertiaryLabel = &v11->_progressBar;
      progressBar = v11->_progressBar;
      v11->_progressBar = v81;

      v83 = v11->_progressBar;
      v84 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11->_rowIndex);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "stringWithFormat:", CFSTR("PKPayLaterFinancingPlanCellView.progressBar.%@"), v85, v97, v43);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKProgressBar setAccessibilityIdentifier:](v83, "setAccessibilityIdentifier:", v86);

      v87 = v11->_progressBar;
      PKPayLaterUIProgressBarStartColor();
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKProgressBar setGradientStartColor:](v87, "setGradientStartColor:", v88);

      v89 = v11->_progressBar;
      PKPayLaterUIProgressBarEndColor();
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKProgressBar setGradientEndColor:](v89, "setGradientEndColor:", v90);

      -[PKProgressBar setProgress:](v11->_progressBar, "setProgress:", v18);
    }
    -[PKPayLaterFinancingPlanCellView addSubview:](v11, "addSubview:", *p_tertiaryLabel);
    goto LABEL_37;
  }
LABEL_38:

  return v11;
}

uint64_t __74__PKPayLaterFinancingPlanCellView_initWithFinancingPlan_context_rowIndex___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_5_10;
  _MergedGlobals_5_10 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_5_10;
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCalendar:", v3);

  return objc_msgSend((id)_MergedGlobals_5_10, "setLocalizedDateFormatFromTemplate:", CFSTR("MMM d, yyyy"));
}

- (void)setShowSpinner:(BOOL)a3
{
  if (self->_showSpinner != a3)
  {
    self->_showSpinner = a3;
    -[UIActivityIndicatorView setHidden:](self->_spinner, "setHidden:", !a3);
    -[UIImageView setHidden:](self->_disclosureView, "setHidden:", self->_showSpinner);
    -[PKPayLaterFinancingPlanCellView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPayLaterFinancingPlanCellView;
  -[PKPayLaterFinancingPlanCellView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKPayLaterFinancingPlanCellView bounds](self, "bounds");
  -[PKPayLaterFinancingPlanCellView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKPayLaterFinancingPlanCellView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  CGFloat height;
  double width;
  CGFloat y;
  CGFloat x;
  CGRectEdge v10;
  UILabel *primaryLabel;
  double v12;
  double v13;
  double v14;
  UILabel *secondaryLabel;
  double v16;
  double v17;
  double v18;
  double v19;
  UILabel *tertiaryLabel;
  double v21;
  double v22;
  UIImageView *disclosureView;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  void *v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  double v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  CGSize v68;
  CGPoint v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect slice;
  CGRect remainder;
  CGRect v76;
  CGSize result;
  CGRect v78;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  remainder = a3;
  if (-[PKPayLaterFinancingPlanCellView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))v10 = CGRectMinXEdge;
  else
    v10 = CGRectMaxXEdge;
  primaryLabel = self->_primaryLabel;
  if (primaryLabel)
  {
    -[UILabel sizeThatFits:](primaryLabel, "sizeThatFits:", width, 1.79769313e308);
    v67 = v12;
    v14 = v13;
  }
  else
  {
    v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v67 = *MEMORY[0x1E0C9D820];
  }
  secondaryLabel = self->_secondaryLabel;
  if (secondaryLabel)
  {
    -[UILabel sizeThatFits:](secondaryLabel, "sizeThatFits:", width, 1.79769313e308);
    v17 = v16;
    v19 = v18;
  }
  else
  {
    v17 = *MEMORY[0x1E0C9D820];
    v19 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  tertiaryLabel = self->_tertiaryLabel;
  v21 = width;
  if (tertiaryLabel)
  {
    -[UILabel sizeThatFits:](tertiaryLabel, "sizeThatFits:", width, 1.79769313e308);
    v64 = v22;
  }
  else
  {
    v64 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  disclosureView = self->_disclosureView;
  v24 = v19;
  v66 = v17;
  if (disclosureView)
  {
    -[UIImageView sizeThatFits:](disclosureView, "sizeThatFits:", v21, 1.79769313e308);
    v26 = v25;
    v28 = v27;
  }
  else
  {
    v26 = *MEMORY[0x1E0C9D820];
    v28 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v29 = fmax(v14, v28);
  v30 = v24 + v29;
  if (self->_progressBar)
  {
    if (v29 > 0.0)
      v30 = v30 + 5.0;
    v31 = v30 + 10.0;
    if (v24 > 0.0)
      v31 = v31 + 5.0;
  }
  else
  {
    v32 = -0.0;
    if (self->_tertiaryLabel)
      v32 = v64;
    v31 = v30 + v32;
  }
  v65 = v31;
  memset(&v76, 0, sizeof(v76));
  v68 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v69 = (CGPoint)*MEMORY[0x1E0C9D648];
  slice.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  slice.size = v68;
  if (v26 > 0.0)
  {
    v78.origin.x = x;
    v78.origin.y = y;
    v78.size.width = v21;
    v78.size.height = height;
    CGRectDivide(v78, &slice, &remainder, v26, v10);
    CGRectDivide(remainder, &v76, &remainder, 11.0, v10);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    slice.origin.x = v33;
    slice.origin.y = v34;
    slice.size.width = v35;
    slice.size.height = v36;
  }
  v73.origin = v69;
  v73.size = v68;
  if (v67 > 0.0)
  {
    CGRectDivide(remainder, &v73, &remainder, v29, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v73.origin.x = v37;
    v73.origin.y = v38;
    v73.size.width = v39;
    v73.size.height = v40;
    if (v26 > 0.0)
    {
      -[UILabel font](self->_primaryLabel, "font");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "ascender");
      objc_msgSend(v41, "capHeight");
      PKFloatRoundToPixel();
      slice.origin.y = v42 + slice.origin.y;

    }
  }
  v72.origin = v69;
  v72.size = v68;
  v71.origin = v69;
  v71.size = v68;
  if (self->_progressBar)
  {
    v43 = remainder.origin.x;
    v44 = remainder.origin.y;
    v45 = remainder.size.width;
    v46 = remainder.size.height;
    if (v29 > 0.0)
    {
      CGRectDivide(*(CGRect *)&v43, &v76, &remainder, 5.0, CGRectMinYEdge);
      v43 = remainder.origin.x;
      v44 = remainder.origin.y;
      v45 = remainder.size.width;
      v46 = remainder.size.height;
    }
    v47 = v65;
    v48 = v66;
    v49 = v24;
    CGRectDivide(*(CGRect *)&v43, &v72, &remainder, 10.0, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v72.origin.x = v50;
    v72.origin.y = v51;
    v72.size.width = v52;
    v72.size.height = v53;
    if (v24 > 0.0)
      CGRectDivide(remainder, &v76, &remainder, 5.0, CGRectMinYEdge);
  }
  else
  {
    v47 = v65;
    v48 = v66;
    v49 = v24;
    if (self->_tertiaryLabel)
    {
      CGRectDivide(remainder, &v71, &remainder, v64, CGRectMinYEdge);
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      v71.origin.x = v54;
      v71.origin.y = v55;
      v71.size.width = v56;
      v71.size.height = v57;
    }
  }
  v70.origin = v69;
  v70.size = v68;
  if (v48 > 0.0)
  {
    CGRectDivide(remainder, &v70, &remainder, v49, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v70.origin.x = v58;
    v70.origin.y = v59;
    v70.size.width = v60;
    v70.size.height = v61;
  }
  if (!a4)
  {
    -[UILabel setFrame:](self->_primaryLabel, "setFrame:", v73.origin.x, v73.origin.y, v73.size.width, v73.size.height);
    -[UILabel setFrame:](self->_secondaryLabel, "setFrame:", v70.origin.x, v70.origin.y, v70.size.width, v70.size.height);
    -[UILabel setFrame:](self->_tertiaryLabel, "setFrame:", v71.origin.x, v71.origin.y, v71.size.width, v71.size.height);
    -[PKProgressBar setFrame:](self->_progressBar, "setFrame:", v72.origin.x, v72.origin.y, v72.size.width, v72.size.height);
    -[UIImageView setFrame:](self->_disclosureView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  v62 = v21;
  v63 = v47;
  result.height = v63;
  result.width = v62;
  return result;
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressBar, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end
