@implementation PKPayLaterFinancingPlanInstallmentCellView

- (PKPayLaterFinancingPlanInstallmentCellView)initWithFinancingPlan:(id)a3 installment:(id)a4 rowIndex:(int64_t)a5 paymentIntentController:(id)a6 presentingViewController:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PKPayLaterFinancingPlanInstallmentCellView *v17;
  PKPayLaterFinancingPlanInstallmentCellView *v18;
  uint64_t v19;
  NSCalendar *calendar;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  UILabel *v28;
  UILabel *primaryLabel;
  UILabel *v30;
  void *v31;
  void *v32;
  void *v33;
  UILabel *v34;
  NSString *v35;
  void *v36;
  UILabel *v37;
  void *v38;
  UILabel *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  UILabel *v45;
  UILabel *secondaryLabel;
  UILabel *v47;
  void *v48;
  void *v49;
  void *v50;
  UILabel *v51;
  void *v52;
  UILabel *v53;
  void *v54;
  UILabel *v55;
  void *v56;
  uint64_t v57;
  UIActivityIndicatorView *spinnerView;
  UIActivityIndicatorView *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  char v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  void *v75;
  char v76;
  uint64_t v77;
  void *v78;
  NSCalendar *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  int v86;
  UIButton *v87;
  UIButton *button;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  uint64_t v96;
  UIImageView *disclosureView;
  UIImageView *v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  id *p_installment;
  void *v108;
  uint64_t v109;
  void *v110;
  id v111;
  id v112;
  void *v113;
  void *v114;
  objc_super v115;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v115.receiver = self;
  v115.super_class = (Class)PKPayLaterFinancingPlanInstallmentCellView;
  v17 = -[PKPayLaterFinancingPlanInstallmentCellView initWithFrame:](&v115, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v18 = v17;
  if (!v17)
    goto LABEL_25;
  v111 = v16;
  v114 = v15;
  v112 = v14;
  objc_storeStrong((id *)&v17->_financingPlan, a3);
  objc_storeStrong((id *)&v18->_installment, a4);
  v18->_rowIndex = a5;
  objc_storeStrong((id *)&v18->_paymentIntentController, a6);
  objc_storeStrong((id *)&v18->_presentingViewController, a7);
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v19 = objc_claimAutoreleasedReturnValue();
  calendar = v18->_calendar;
  v18->_calendar = (NSCalendar *)v19;

  -[PKPayLaterFinancingPlan merchant](v18->_financingPlan, "merchant");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "displayName");
  v22 = objc_claimAutoreleasedReturnValue();

  -[PKPayLaterFinancingPlan scheduleSummary](v18->_financingPlan, "scheduleSummary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  p_installment = (id *)&v18->_installment;
  -[PKPayLaterInstallment installmentIdentifier](v18->_installment, "installmentIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "installmentNumberForInstallmentIdentifier:", v24) + 1;

  v113 = v23;
  objc_msgSend(v23, "installments");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = objc_msgSend(v26, "count");

  objc_msgSend((id)objc_opt_class(), "_numberFormatter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  primaryLabel = v18->_primaryLabel;
  v18->_primaryLabel = v28;

  v30 = v18->_primaryLabel;
  v31 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18->_rowIndex);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringWithFormat:", CFSTR("PKPayLaterFinancingPlanInstallmentCellView.primaryLabel.%@"), v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAccessibilityIdentifier:](v30, "setAccessibilityIdentifier:", v33);

  -[UILabel setNumberOfLines:](v18->_primaryLabel, "setNumberOfLines:", 0);
  v34 = v18->_primaryLabel;
  v35 = (NSString *)*MEMORY[0x1E0DC48D0];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], (void *)*MEMORY[0x1E0DC48D0], 0x8000, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v34, "setFont:", v36);

  v37 = v18->_primaryLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v37, "setTextColor:", v38);

  v39 = v18->_primaryLabel;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v25);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringFromNumber:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v109);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = v27;
  objc_msgSend(v27, "stringFromNumber:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = (void *)v22;
  PKLocalizedCocoonString(CFSTR("MERCHANT_INSTALLMENT_NUMBER_TITLE"), CFSTR("%1$@%2$@%3$@"), v22, v41, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v39, "setText:", v44);

  -[PKPayLaterFinancingPlanInstallmentCellView addSubview:](v18, "addSubview:", v18->_primaryLabel);
  v45 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  secondaryLabel = v18->_secondaryLabel;
  v18->_secondaryLabel = v45;

  v47 = v18->_secondaryLabel;
  v48 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18->_rowIndex);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "stringWithFormat:", CFSTR("PKPayLaterFinancingPlanInstallmentCellView.secondaryLabel.%@"), v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAccessibilityIdentifier:](v47, "setAccessibilityIdentifier:", v50);

  -[UILabel setNumberOfLines:](v18->_secondaryLabel, "setNumberOfLines:", 0);
  v51 = v18->_secondaryLabel;
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AD0], v35);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v51, "setFont:", v52);

  v53 = v18->_secondaryLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v53, "setTextColor:", v54);

  v55 = v18->_secondaryLabel;
  -[PKPayLaterFinancingPlanInstallmentCellView _secondaryLabelText](v18, "_secondaryLabelText");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v55, "setText:", v56);

  -[PKPayLaterFinancingPlanInstallmentCellView addSubview:](v18, "addSubview:", v18->_secondaryLabel);
  v57 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  spinnerView = v18->_spinnerView;
  v18->_spinnerView = (UIActivityIndicatorView *)v57;

  v59 = v18->_spinnerView;
  v60 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18->_rowIndex);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "stringWithFormat:", CFSTR("PKPayLaterFinancingPlanInstallmentCellView.spinnerView.%@"), v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityIndicatorView setAccessibilityIdentifier:](v59, "setAccessibilityIdentifier:", v62);

  -[UIActivityIndicatorView startAnimating](v18->_spinnerView, "startAnimating");
  -[UIActivityIndicatorView setHidden:](v18->_spinnerView, "setHidden:", 1);
  -[PKPayLaterFinancingPlanInstallmentCellView addSubview:](v18, "addSubview:", v18->_spinnerView);
  -[PKPayLaterFinancingPlanInstallmentCellView _updateTertiaryLabel](v18, "_updateTertiaryLabel");
  -[PKPayLaterFinancingPlan fundingSource](v18->_financingPlan, "fundingSource");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "autoPayment");

  v65 = -[PKPayLaterFinancingPlan state](v18->_financingPlan, "state");
  if (v65 != 1)
  {
    v66 = 0;
    v67 = 0;
    v68 = 0;
    if (v65 != 4)
      goto LABEL_20;
    v69 = objc_msgSend(*p_installment, "status");
    if (v69 != 1 && v69 != 4)
      goto LABEL_19;
LABEL_16:
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedCocoonString(CFSTR("PAY_NOW_BUTTON"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if ((v64 & 1) == 0)
  {
    objc_msgSend(v113, "nextDueInstallment");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "installmentIdentifier");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_installment, "installmentIdentifier");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v71;
    v74 = v72;
    if (v73 == v74)
    {

      goto LABEL_14;
    }
    v75 = v74;
    if (v73 && v74)
    {
      v76 = objc_msgSend(v73, "isEqualToString:", v74);

      if ((v76 & 1) == 0)
        goto LABEL_19;
LABEL_14:
      objc_msgSend(*p_installment, "dueDate");
      v77 = objc_claimAutoreleasedReturnValue();
      if (!v77)
        goto LABEL_17;
      v78 = (void *)v77;
      v79 = v18->_calendar;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCalendar components:fromDate:toDate:options:](v79, "components:fromDate:toDate:options:", 16, v80, v78, 0);
      v81 = (void *)objc_claimAutoreleasedReturnValue();

      v82 = objc_msgSend(v81, "day");
      v83 = *MEMORY[0x1E0D6AC00];

      if (v82 >= v83)
      {
LABEL_17:
        PKLocalizedCocoonString(CFSTR("PAY_EARLY_BUTTON"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemGroupedBackgroundColor");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
      goto LABEL_16;
    }

  }
LABEL_19:
  v66 = 0;
  v67 = 0;
  v68 = 0;
LABEL_20:
  v84 = (void *)MEMORY[0x1E0D67010];
  objc_msgSend(v114, "payLaterAccount");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v84, "canMakePaymentsWithAccountState:", objc_msgSend(v85, "state"));

  if (objc_msgSend(v66, "length") && v86)
  {
    v87 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
    button = v18->_button;
    v18->_button = v87;

    -[UIButton layer](v18->_button, "layer");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

    v90 = (void *)MEMORY[0x1E0DC3520];
    objc_msgSend(v66, "uppercaseString");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4AB8], 0, 32770, 0);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "pkui_plainConfigurationWithTitle:font:", v91, v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v93, "setBaseForegroundColor:", v67);
    -[UIButton setConfiguration:](v18->_button, "setConfiguration:", v93);
    -[UIButton setBackgroundColor:](v18->_button, "setBackgroundColor:", v68);
    -[UIButton addTarget:action:forControlEvents:](v18->_button, "addTarget:action:forControlEvents:", v18, sel__tappedButton, 64);
    -[UIButton setAccessibilityIdentifier:](v18->_button, "setAccessibilityIdentifier:", CFSTR("PKPayLaterFinancingPlanInstallmentCellView.button"));
    -[PKPayLaterFinancingPlanInstallmentCellView addSubview:](v18, "addSubview:", v18->_button);

  }
  else
  {
    v94 = objc_alloc(MEMORY[0x1E0DC3890]);
    PKUIChevronImage();
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v94, "initWithImage:", v95);
    disclosureView = v18->_disclosureView;
    v18->_disclosureView = (UIImageView *)v96;

    v98 = v18->_disclosureView;
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v98, "setTintColor:", v99);

    -[UIImageView setAccessibilityIdentifier:](v18->_disclosureView, "setAccessibilityIdentifier:", CFSTR("PKPayLaterFinancingPlanInstallmentCellView.disclosureView"));
    -[PKPayLaterFinancingPlanInstallmentCellView addSubview:](v18, "addSubview:", v18->_disclosureView);
  }
  v100 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[UILabel text](v18->_primaryLabel, "text");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "safelyAddObject:", v101);

  -[UILabel text](v18->_secondaryLabel, "text");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "safelyAddObject:", v102);

  -[PKIconTextLabel text](v18->_tertiaryLabel, "text");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "string");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "safelyAddObject:", v104);

  objc_msgSend(v100, "componentsJoinedByString:", CFSTR(","));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlanInstallmentCellView setAccessibilityLabel:](v18, "setAccessibilityLabel:", v105);
  -[PKPayLaterFinancingPlanInstallmentCellView setIsAccessibilityElement:](v18, "setIsAccessibilityElement:", 1);

  v16 = v111;
  v14 = v112;
  v15 = v114;
LABEL_25:

  return v18;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPayLaterFinancingPlanInstallmentCellView;
  -[PKPayLaterFinancingPlanInstallmentCellView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKPayLaterFinancingPlanInstallmentCellView bounds](self, "bounds");
  -[PKPayLaterFinancingPlanInstallmentCellView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKPayLaterFinancingPlanInstallmentCellView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
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
  CGRectEdge v9;
  UIImageView *disclosureView;
  double v11;
  double v12;
  double v13;
  UIButton *button;
  double v15;
  double v16;
  double v17;
  double v18;
  UILabel *primaryLabel;
  double v20;
  double v21;
  UILabel *secondaryLabel;
  double v23;
  double v24;
  PKIconTextLabel *tertiaryLabel;
  double v26;
  double v27;
  double v28;
  double *v29;
  CGPoint v30;
  CGSize v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  void *v48;
  double v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  void *v54;
  double v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v75;
  CGSize v76;
  CGPoint v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect slice;
  CGRect remainder;
  CGRect v84;
  CGSize result;
  CGRect v86;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  remainder = a3;
  if (-[PKPayLaterFinancingPlanInstallmentCellView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))v9 = CGRectMinXEdge;
  else
    v9 = CGRectMaxXEdge;
  disclosureView = self->_disclosureView;
  if (disclosureView)
  {
    -[UIImageView sizeThatFits:](disclosureView, "sizeThatFits:", width, 3.40282347e38);
    v12 = v11;
    v75 = v13;
  }
  else
  {
    v12 = *MEMORY[0x1E0C9D820];
    v75 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  -[UIActivityIndicatorView sizeThatFits:](self->_spinnerView, "sizeThatFits:", width, 3.40282347e38);
  button = self->_button;
  if (button)
  {
    -[UIButton sizeThatFits:](button, "sizeThatFits:", width - v12, 3.40282347e38);
    v16 = v15;
    v73 = v17;
  }
  else
  {
    v16 = *MEMORY[0x1E0C9D820];
    v73 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v18 = width - v12 - v16;
  primaryLabel = self->_primaryLabel;
  if (primaryLabel)
  {
    -[UILabel sizeThatFits:](primaryLabel, "sizeThatFits:", v18, 3.40282347e38);
    v68 = v21;
    v69 = v20;
  }
  else
  {
    v68 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v69 = *MEMORY[0x1E0C9D820];
  }
  secondaryLabel = self->_secondaryLabel;
  if (secondaryLabel)
  {
    -[UILabel sizeThatFits:](secondaryLabel, "sizeThatFits:", v18, 3.40282347e38);
    v70 = v23;
    v72 = v24;
  }
  else
  {
    v70 = *MEMORY[0x1E0C9D820];
    v72 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  tertiaryLabel = self->_tertiaryLabel;
  if (tertiaryLabel)
  {
    -[PKIconTextLabel sizeThatFits:](tertiaryLabel, "sizeThatFits:", v18, 3.40282347e38);
    v27 = v26;
    v71 = v28;
  }
  else
  {
    v27 = *MEMORY[0x1E0C9D820];
    v71 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v29 = (double *)MEMORY[0x1E0C9D648];
  memset(&v84, 0, sizeof(v84));
  v30 = (CGPoint)*MEMORY[0x1E0C9D648];
  v31 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  slice.origin = v30;
  slice.size = v31;
  v76 = v31;
  v77 = v30;
  if (v12 > 0.0)
  {
    v86.origin.x = x;
    v86.origin.y = y;
    v86.size.width = width;
    v86.size.height = height;
    CGRectDivide(v86, &slice, &remainder, v12, v9);
    CGRectDivide(remainder, &v84, &remainder, 11.0, v9);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    slice.origin.x = v32;
    slice.origin.y = v33;
    slice.size.width = v34;
    slice.size.height = v35;
    v31 = v76;
    v30 = v77;
  }
  v81.origin = v30;
  v81.size = v31;
  if (v16 <= 0.0)
  {
    v67 = *v29;
    v39 = v29[1];
    v42 = v29[2];
    v66 = v29[3];
    v43 = v73;
  }
  else
  {
    PKRectCenteredYInRect();
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v66 = v37;
    v67 = v36;
    v39 = v38;
    v41 = v40;
    CGRectDivide(remainder, &v81, &remainder, v16, v9);
    PKContentAlignmentMake();
    v42 = v41;
    v43 = v73;
    PKSizeAlignedInRect();
    v81.origin.x = v44;
    v81.origin.y = v45;
    v81.size.width = v46;
    v81.size.height = v47;
    CGRectDivide(remainder, &v84, &remainder, 10.0, v9);
    -[UIButton layer](self->_button, "layer");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setCornerRadius:", v81.size.height * 0.5);

    v31 = v76;
    v30 = v77;
  }
  v49 = fmax(v68, v75);
  v80.origin = v30;
  v80.size = v31;
  if (v69 > 0.0)
  {
    CGRectDivide(remainder, &v80, &remainder, v49, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v80.origin.x = v50;
    v80.origin.y = v51;
    v80.size.width = v52;
    v80.size.height = v53;
    v31 = v76;
    v30 = v77;
    if (v12 > 0.0)
    {
      -[UILabel font](self->_primaryLabel, "font");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "ascender");
      objc_msgSend(v54, "capHeight");
      PKFloatRoundToPixel();
      slice.origin.y = v55 + slice.origin.y;

      v31 = v76;
      v30 = v77;
    }
  }
  v79.origin = v30;
  v79.size = v31;
  if (v70 > 0.0)
  {
    CGRectDivide(remainder, &v79, &remainder, v72, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v79.origin.x = v56;
    v79.origin.y = v57;
    v79.size.width = v58;
    v79.size.height = v59;
    v31 = v76;
    v30 = v77;
  }
  v78.origin = v30;
  v78.size = v31;
  if (v27 > 0.0)
  {
    CGRectDivide(remainder, &v78, &remainder, v71, CGRectMinYEdge);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    v78.origin.x = v60;
    v78.origin.y = v61;
    v78.size.width = v62;
    v78.size.height = v63;
  }
  if (!a4)
  {
    -[UILabel setFrame:](self->_primaryLabel, "setFrame:", v80.origin.x, v80.origin.y, v80.size.width, v80.size.height);
    -[UILabel setFrame:](self->_secondaryLabel, "setFrame:", v79.origin.x, v79.origin.y, v79.size.width, v79.size.height);
    -[PKIconTextLabel setFrame:](self->_tertiaryLabel, "setFrame:", v78.origin.x, v78.origin.y, v78.size.width, v78.size.height);
    -[UIButton setFrame:](self->_button, "setFrame:", v81.origin.x, v81.origin.y, v81.size.width, v81.size.height);
    -[UIImageView setFrame:](self->_disclosureView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    -[UIActivityIndicatorView setFrame:](self->_spinnerView, "setFrame:", v67, v39, v42, v66);
  }
  v64 = fmax(v49 + v72 + v71, v43);
  v65 = width;
  result.height = v64;
  result.width = v65;
  return result;
}

- (void)_tappedButton
{
  void *v3;
  PKPayLaterFinancingPlan **p_financingPlan;
  void *v5;
  uint64_t v6;
  void *v7;
  PKPayLaterMakePaymentViewController *v8;
  PKNavigationController *v9;
  PKNavigationController *v10;
  _QWORD v11[5];
  PKNavigationController *v12;
  id v13;
  id location;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D66A58];
  v15[0] = *MEMORY[0x1E0D68BD0];
  p_financingPlan = &self->_financingPlan;
  -[PKPayLaterFinancingPlan productType](self->_financingPlan, "productType");
  PKPayLaterAccountProductTypeToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = *MEMORY[0x1E0D68858];
  v6 = *MEMORY[0x1E0D68860];
  v16[0] = v5;
  v16[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subject:sendEvent:", *MEMORY[0x1E0D69918], v7);

  v8 = -[PKPayLaterMakePaymentViewController initWithFinancingPlan:paymentIntentController:]([PKPayLaterMakePaymentViewController alloc], "initWithFinancingPlan:paymentIntentController:", *p_financingPlan, self->_paymentIntentController);
  v9 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v8);
  -[UIActivityIndicatorView setHidden:](self->_spinnerView, "setHidden:", 0);
  -[UIButton setHidden:](self->_button, "setHidden:", 1);
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__PKPayLaterFinancingPlanInstallmentCellView__tappedButton__block_invoke;
  v11[3] = &unk_1E3E63548;
  objc_copyWeak(&v13, &location);
  v11[4] = self;
  v10 = v9;
  v12 = v10;
  -[PKPayLaterMakePaymentViewController preflightWithCompletion:](v8, "preflightWithCompletion:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __59__PKPayLaterFinancingPlanInstallmentCellView__tappedButton__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id *WeakRetained;
  void (**v6)(_QWORD);
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v4 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __59__PKPayLaterFinancingPlanInstallmentCellView__tappedButton__block_invoke_2;
    v12 = &unk_1E3E61310;
    objc_copyWeak(&v13, &location);
    v6 = (void (**)(_QWORD))_Block_copy(&v9);
    if (v4)
    {
      PKAccountDisplayableError();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = PKAlertForDisplayableErrorWithHandlers(v7, 0, 0, 0);

      if (v8)
        objc_msgSend(WeakRetained[55], "presentViewController:animated:completion:", v8, 1, v6, v9, v10, v11, v12);
      else
        v6[2](v6);

    }
    else
    {
      objc_msgSend(WeakRetained[55], "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, v6, v9, v10, v11, v12);
    }

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __59__PKPayLaterFinancingPlanInstallmentCellView__tappedButton__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[62], "setHidden:", 1);
    objc_msgSend(v2[63], "setHidden:", 0);
    WeakRetained = v2;
  }

}

- (id)_secondaryLabelText
{
  _BOOL4 v3;
  PKPayLaterInstallment *installment;
  void *v5;
  void *v6;

  v3 = -[PKPayLaterFinancingPlanInstallmentCellView _isInstallmentPaid](self, "_isInstallmentPaid");
  installment = self->_installment;
  if (v3)
    -[PKPayLaterInstallment totalAmount](installment, "totalAmount");
  else
    -[PKPayLaterInstallment currentBalance](installment, "currentBalance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formattedStringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_updateTertiaryLabel
{
  NSCalendar *calendar;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  PKIconTextLabel *v23;
  PKIconTextLabel *tertiaryLabel;
  PKIconTextLabel *v25;
  void *v26;
  void *v27;
  void *v28;
  PKIconTextLabel *v29;
  void *v30;
  PKIconTextLabel *v31;
  void *v32;
  id v33;

  -[PKPayLaterInstallment dueDate](self->_installment, "dueDate");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  calendar = self->_calendar;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKDateIgnoringTime();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKDateIgnoringTime();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar components:fromDate:toDate:options:](calendar, "components:fromDate:toDate:options:", 16, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "day");
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlan fundingSource](self->_financingPlan, "fundingSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "autoPayment");

  if (-[PKPayLaterInstallment status](self->_installment, "status") == 4)
  {
    PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAYMENT_PAST_DUE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v13;
    if (!v12)
      goto LABEL_20;
    goto LABEL_19;
  }
  if (!-[PKPayLaterFinancingPlanInstallmentCellView _isInstallmentPaid](self, "_isInstallmentPaid"))
  {
    if (v8 > 0x1E)
    {
      if (!v11)
        goto LABEL_20;
      PKLocalizedCocoonString(CFSTR("AUTO_PAY"));
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v11)
        PKLocalizedCocoonString(CFSTR("INSTALLMENT_DUE_DATE_TIMER_AUTO_PAY"), CFSTR("%lu"), v8);
      else
        PKLocalizedCocoonString(CFSTR("INSTALLMENT_DUE_DATE_TIMER_DEFAULT"), CFSTR("%lu"), v8);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v22;
    if (!v22)
      goto LABEL_20;
LABEL_19:
    v23 = objc_alloc_init(PKIconTextLabel);
    tertiaryLabel = self->_tertiaryLabel;
    self->_tertiaryLabel = v23;

    v25 = self->_tertiaryLabel;
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_rowIndex);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("PKPayLaterFinancingPlanInstallmentCellView.tertiaryLabel.%@"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKIconTextLabel setAccessibilityIdentifier:](v25, "setAccessibilityIdentifier:", v28);

    v29 = self->_tertiaryLabel;
    objc_msgSend(v12, "pk_attributedString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKIconTextLabel setText:](v29, "setText:", v30);

    -[PKIconTextLabel setIcon:](self->_tertiaryLabel, "setIcon:", 0);
    v31 = self->_tertiaryLabel;
    -[PKPayLaterFinancingPlanInstallmentCellView _tertiaryFont](self, "_tertiaryFont");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKIconTextLabel setTextFont:](v31, "setTextFont:", v32);

    -[PKIconTextLabel setTextColor:](self->_tertiaryLabel, "setTextColor:", v9);
    -[PKPayLaterFinancingPlanInstallmentCellView addSubview:](self, "addSubview:", self->_tertiaryLabel);

    goto LABEL_20;
  }
  -[PKPayLaterInstallment payoffDate](self->_installment, "payoffDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_11;
  -[PKPayLaterInstallment dueDate](self->_installment, "dueDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PKDateIgnoringTime();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  PKDateIgnoringTime();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "compare:", v17);

  if (v18)
  {
    +[PKPayLaterFinancingPlanPaymentScheduleComposer shortDateFormatter](PKPayLaterFinancingPlanPaymentScheduleComposer, "shortDateFormatter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringFromDate:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAID_DATE"), CFSTR("%@"), v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_11:
    PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v21 = objc_claimAutoreleasedReturnValue();

  v9 = (void *)v21;
  if (v12)
    goto LABEL_19;
LABEL_20:

}

- (id)_tertiaryFont
{
  return PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], (NSString *)*MEMORY[0x1E0DC48D0]);
}

- (BOOL)_isInstallmentPaid
{
  return -[PKPayLaterInstallment status](self->_installment, "status") == 3;
}

+ (id)_numberFormatter
{
  if (qword_1EE4F9110 != -1)
    dispatch_once(&qword_1EE4F9110, &__block_literal_global_72);
  return (id)_MergedGlobals_5_4;
}

uint64_t __62__PKPayLaterFinancingPlanInstallmentCellView__numberFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)_MergedGlobals_5_4;
  _MergedGlobals_5_4 = (uint64_t)v0;

  return objc_msgSend((id)_MergedGlobals_5_4, "setNumberStyle:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_paymentIntentController, 0);
  objc_storeStrong((id *)&self->_installment, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end
