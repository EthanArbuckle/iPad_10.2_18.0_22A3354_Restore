@implementation NCSchedulerViewCell

+ (id)reuseIdentifier
{
  return CFSTR("NCSchedulerViewCell");
}

+ (double)preferredHeightForText:(id)a3 width:(double)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  uint64_t v25;
  _QWORD v26[2];
  CGRect v27;

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "_font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_widthForHour:", 0);
  v9 = v8;
  objc_msgSend(a1, "_widthForHour:", 12);
  if (v9 >= v10)
    v10 = v9;
  v11 = fmax(a4 - v10 + -8.0 + -38.0, 0.0);
  v25 = *MEMORY[0x1E0DC1138];
  v26[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_drawingContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "boundingRectWithSize:options:attributes:context:", 1, v12, v13, v11, 0.0);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v27.origin.x = v15;
  v27.origin.y = v17;
  v27.size.width = v19;
  v27.size.height = v21;
  CGRectGetHeight(v27);

  _NCMainScreenScale();
  UICeilToScale();
  v23 = v22;

  return v23;
}

- (void)configureWithSymbolName:(id)a3 symbolColor:(id)a4 title:(id)a5 timeOfDay:(id)a6 delegate:(id)a7 top:(BOOL)a8 bottom:(BOOL)a9
{
  _BOOL4 v9;
  _BOOL8 v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NCSymbolButton *button;
  double v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  id v33;

  v9 = a8;
  v15 = a9;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v33 = v16;
  v21 = v17;
  button = self->_button;
  if (v33 && v21)
  {
    -[NCSymbolButton setSymbolNamed:color:pointSize:backgroundDiameter:](button, "setSymbolNamed:color:pointSize:backgroundDiameter:", v33, v21, 9.0, 17.0);
    v23 = 38.0;
  }
  else
  {
    -[NCSymbolButton clearSymbol](button, "clearSymbol");
    v23 = 16.0;
  }
  -[NSLayoutConstraint setConstant:](self->_labelLeadingConstraint, "setConstant:", v23);
  -[UILabel setText:](self->_label, "setText:", v18);
  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v19, "hour");
    v26 = objc_msgSend(v19, "minute");
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v27 = v18;
    v28 = v9;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dateBySettingHour:minute:second:ofDate:options:", v25, v26, 0, v29, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIDatePicker setDate:](self->_datePicker, "setDate:", v30);
    v9 = v28;
    v18 = v27;
    v15 = a9;
    -[UIDatePicker setHidden:](self->_datePicker, "setHidden:", 0);

  }
  else
  {
    -[UIDatePicker setHidden:](self->_datePicker, "setHidden:", 1);
  }
  if (v9)
    v31 = 16.0;
  else
    v31 = 0.0;
  -[NSLayoutConstraint setConstant:](self->_backgroundViewTopConstraint, "setConstant:", v31);
  if (v15)
    v32 = 16.0;
  else
    v32 = 0.0;
  -[NSLayoutConstraint setConstant:](self->_backgroundViewBottomConstraint, "setConstant:", v32);
  -[UIView setHidden:](self->_bottomLineView, "setHidden:", v15);
  -[NCSchedulerViewCell setDelegate:](self, "setDelegate:", v20);
  -[NCSchedulerViewCell setNeedsLayout](self, "setNeedsLayout");

}

- (NCSchedulerViewCell)initWithFrame:(CGRect)a3
{
  NCSchedulerViewCell *v3;
  NCSchedulerViewCell *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  UIView *topCornersView;
  void *v15;
  uint64_t v16;
  UIView *backgroundView;
  void *v18;
  uint64_t v19;
  UIView *bottomCornersView;
  void *v21;
  uint64_t v22;
  UIView *bottomLineView;
  void *v24;
  uint64_t v25;
  NCSymbolButton *button;
  void *v27;
  uint64_t v28;
  UILabel *label;
  UILabel *v30;
  void *v31;
  UILabel *v32;
  void *v33;
  UILabel *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  UIDatePicker *datePicker;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  NSLayoutConstraint *backgroundViewTopConstraint;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  NSLayoutConstraint *backgroundViewBottomConstraint;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  NSLayoutConstraint *labelLeadingConstraint;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  uint64_t v135;
  NSLayoutConstraint *labelTrailingConstraint;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v146;
  void *v147;
  objc_super v148;

  v148.receiver = self;
  v148.super_class = (Class)NCSchedulerViewCell;
  v3 = -[NCSchedulerViewCell initWithFrame:](&v148, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[NCSchedulerViewCell traitCollection](v3, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "userInterfaceStyle") == 2)
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGray6Color");
    v6 = objc_claimAutoreleasedReturnValue();

    -[NCSchedulerViewCell traitCollection](v4, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "userInterfaceStyle") == 2)
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGray3Color");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
    v146 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v9 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v13 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], v10, v11, v12);
    topCornersView = v4->_topCornersView;
    v4->_topCornersView = (UIView *)v13;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_topCornersView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView _setContinuousCornerRadius:](v4->_topCornersView, "_setContinuousCornerRadius:", 16.0);
    -[UIView setBackgroundColor:](v4->_topCornersView, "setBackgroundColor:", v6);
    -[NCSchedulerViewCell contentView](v4, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v4->_topCornersView);

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v9, v10, v11, v12);
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = (UIView *)v16;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setBackgroundColor:](v4->_backgroundView, "setBackgroundColor:", v6);
    -[NCSchedulerViewCell contentView](v4, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v4->_backgroundView);

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v9, v10, v11, v12);
    bottomCornersView = v4->_bottomCornersView;
    v4->_bottomCornersView = (UIView *)v19;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_bottomCornersView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView _setContinuousCornerRadius:](v4->_bottomCornersView, "_setContinuousCornerRadius:", 16.0);
    -[UIView setBackgroundColor:](v4->_bottomCornersView, "setBackgroundColor:", v6);
    -[NCSchedulerViewCell contentView](v4, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", v4->_bottomCornersView);

    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v9, v10, v11, v12);
    bottomLineView = v4->_bottomLineView;
    v4->_bottomLineView = (UIView *)v22;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_bottomLineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setBackgroundColor:](v4->_bottomLineView, "setBackgroundColor:", v146);
    -[NCSchedulerViewCell contentView](v4, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v4->_bottomLineView);

    +[NCSymbolButton button](NCSymbolButton, "button");
    v25 = objc_claimAutoreleasedReturnValue();
    button = v4->_button;
    v4->_button = (NCSymbolButton *)v25;

    -[NCSymbolButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[NCSymbolButton addTarget:action:forControlEvents:](v4->_button, "addTarget:action:forControlEvents:", v4, sel__buttonPressed_, 64);
    -[NCSchedulerViewCell contentView](v4, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSubview:", v4->_button);

    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v9, v10, v11, v12);
    label = v4->_label;
    v4->_label = (UILabel *)v28;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v30 = v4->_label;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setHighlightedTextColor:](v30, "setHighlightedTextColor:", v31);

    v32 = v4->_label;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v32, "setTextColor:", v33);

    -[UILabel setNumberOfLines:](v4->_label, "setNumberOfLines:", 0);
    v34 = v4->_label;
    objc_msgSend((id)objc_opt_class(), "_font");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v34, "setFont:", v35);

    -[UILabel setMinimumScaleFactor:](v4->_label, "setMinimumScaleFactor:", 0.5);
    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_label, "setAdjustsFontSizeToFitWidth:", 1);
    -[NCSchedulerViewCell contentView](v4, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addSubview:", v4->_label);

    v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC36F0]), "initWithFrame:", v9, v10, v11, v12);
    datePicker = v4->_datePicker;
    v4->_datePicker = (UIDatePicker *)v37;

    -[UIDatePicker setTranslatesAutoresizingMaskIntoConstraints:](v4->_datePicker, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIDatePicker setDatePickerMode:](v4->_datePicker, "setDatePickerMode:", 0);
    -[UIDatePicker setPreferredDatePickerStyle:](v4->_datePicker, "setPreferredDatePickerStyle:", 3);
    -[UIDatePicker setClipsToBounds:](v4->_datePicker, "setClipsToBounds:", 1);
    -[UIDatePicker addTarget:action:forControlEvents:](v4->_datePicker, "addTarget:action:forControlEvents:", v4, sel__timeChanged_, 0x40000);
    -[NCSchedulerViewCell contentView](v4, "contentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addSubview:", v4->_datePicker);

    v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[UIView topAnchor](v4->_topCornersView, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCSchedulerViewCell contentView](v4, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "topAnchor");
    v147 = (void *)v6;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v44);

    -[UIView heightAnchor](v4->_topCornersView, "heightAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToConstant:", 32.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v46);

    -[UIView leadingAnchor](v4->_topCornersView, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCSchedulerViewCell contentView](v4, "contentView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v50);

    -[NCSchedulerViewCell contentView](v4, "contentView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "trailingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v4->_topCornersView, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v54);

    -[UIView topAnchor](v4->_backgroundView, "topAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCSchedulerViewCell contentView](v4, "contentView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "topAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", v57);
    v58 = objc_claimAutoreleasedReturnValue();
    backgroundViewTopConstraint = v4->_backgroundViewTopConstraint;
    v4->_backgroundViewTopConstraint = (NSLayoutConstraint *)v58;

    objc_msgSend(v40, "addObject:", v4->_backgroundViewTopConstraint);
    -[NCSchedulerViewCell contentView](v4, "contentView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "bottomAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v4->_backgroundView, "bottomAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v62);
    v63 = objc_claimAutoreleasedReturnValue();
    backgroundViewBottomConstraint = v4->_backgroundViewBottomConstraint;
    v4->_backgroundViewBottomConstraint = (NSLayoutConstraint *)v63;

    objc_msgSend(v40, "addObject:", v4->_backgroundViewBottomConstraint);
    -[UIView leadingAnchor](v4->_backgroundView, "leadingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCSchedulerViewCell contentView](v4, "contentView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "leadingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:", v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v68);

    -[NCSchedulerViewCell contentView](v4, "contentView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "trailingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v4->_backgroundView, "trailingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v72);

    -[NCSchedulerViewCell contentView](v4, "contentView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "bottomAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v4->_bottomCornersView, "bottomAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:", v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v76);

    -[UIView heightAnchor](v4->_bottomCornersView, "heightAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToConstant:", 32.0);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v78);

    -[UIView leadingAnchor](v4->_bottomCornersView, "leadingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCSchedulerViewCell contentView](v4, "contentView");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "leadingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "constraintEqualToAnchor:", v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v82);

    -[NCSchedulerViewCell contentView](v4, "contentView");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "trailingAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v4->_bottomCornersView, "trailingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:", v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v86);

    -[NCSchedulerViewCell contentView](v4, "contentView");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "bottomAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v4->_bottomLineView, "bottomAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "constraintEqualToAnchor:", v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v90);

    -[UIView heightAnchor](v4->_bottomLineView, "heightAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "constraintEqualToConstant:", 0.5);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v92);

    -[UIView leadingAnchor](v4->_bottomLineView, "leadingAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCSchedulerViewCell contentView](v4, "contentView");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "leadingAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:constant:", v95, 16.0);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v96);

    -[NCSchedulerViewCell contentView](v4, "contentView");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "trailingAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v4->_bottomLineView, "trailingAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "constraintEqualToAnchor:", v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v100);

    -[NCSymbolButton topAnchor](v4->_button, "topAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCSchedulerViewCell contentView](v4, "contentView");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "topAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "constraintEqualToAnchor:", v103);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v104);

    -[NCSymbolButton bottomAnchor](v4->_button, "bottomAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCSchedulerViewCell contentView](v4, "contentView");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "bottomAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "constraintEqualToAnchor:", v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v108);

    -[NCSymbolButton widthAnchor](v4->_button, "widthAnchor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "constraintEqualToConstant:", 44.0);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v110);

    -[NCSymbolButton leadingAnchor](v4->_button, "leadingAnchor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCSchedulerViewCell contentView](v4, "contentView");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "leadingAnchor");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "constraintEqualToAnchor:constant:", v113, -3.0);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v114);

    -[UILabel leadingAnchor](v4->_label, "leadingAnchor");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCSchedulerViewCell contentView](v4, "contentView");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "leadingAnchor");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "constraintEqualToAnchor:", v117);
    v118 = objc_claimAutoreleasedReturnValue();
    labelLeadingConstraint = v4->_labelLeadingConstraint;
    v4->_labelLeadingConstraint = (NSLayoutConstraint *)v118;

    objc_msgSend(v40, "addObject:", v4->_labelLeadingConstraint);
    -[UILabel centerYAnchor](v4->_label, "centerYAnchor");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCSchedulerViewCell contentView](v4, "contentView");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "centerYAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "constraintEqualToAnchor:", v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v123);

    -[UILabel topAnchor](v4->_label, "topAnchor");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCSchedulerViewCell contentView](v4, "contentView");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "topAnchor");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "constraintGreaterThanOrEqualToAnchor:constant:", v126, 8.0);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v127);

    -[NCSchedulerViewCell contentView](v4, "contentView");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "bottomAnchor");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v4->_label, "bottomAnchor");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "constraintGreaterThanOrEqualToAnchor:constant:", v130, 8.0);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v131);

    -[NCSchedulerViewCell contentView](v4, "contentView");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "trailingAnchor");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v4->_label, "trailingAnchor");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "constraintEqualToAnchor:constant:", v134, 0.0);
    v135 = objc_claimAutoreleasedReturnValue();
    labelTrailingConstraint = v4->_labelTrailingConstraint;
    v4->_labelTrailingConstraint = (NSLayoutConstraint *)v135;

    objc_msgSend(v40, "addObject:", v4->_labelTrailingConstraint);
    -[UIDatePicker centerYAnchor](v4->_datePicker, "centerYAnchor");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCSchedulerViewCell contentView](v4, "contentView");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "centerYAnchor");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "constraintEqualToAnchor:", v139);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v140);

    -[NCSchedulerViewCell contentView](v4, "contentView");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "trailingAnchor");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDatePicker trailingAnchor](v4->_datePicker, "trailingAnchor");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "constraintEqualToAnchor:constant:", v143, 0.0);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v144);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v40);
  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCSchedulerViewCell;
  -[NCSchedulerViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[NCSymbolButton clearSymbol](self->_button, "clearSymbol");
  -[UILabel setText:](self->_label, "setText:", 0);
  -[NCSchedulerViewCell setDelegate:](self, "setDelegate:", 0);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCSchedulerViewCell;
  -[NCSchedulerViewCell layoutSubviews](&v6, sel_layoutSubviews);
  -[UIDatePicker layoutIfNeeded](self->_datePicker, "layoutIfNeeded");
  v3 = 0.0;
  if ((-[UIDatePicker isHidden](self->_datePicker, "isHidden") & 1) == 0)
  {
    -[UIDatePicker frame](self->_datePicker, "frame");
    v3 = v4 + 8.0;
  }
  -[NSLayoutConstraint constant](self->_labelTrailingConstraint, "constant");
  if (v3 != v5)
    -[NSLayoutConstraint setConstant:](self->_labelTrailingConstraint, "setConstant:", v3);
}

+ (id)_drawingContext
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)_drawingContext___drawingContext;
  if (!_drawingContext___drawingContext)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0DC12A0]);
    v4 = (void *)_drawingContext___drawingContext;
    _drawingContext___drawingContext = (uint64_t)v3;

    objc_msgSend((id)_drawingContext___drawingContext, "setWantsNumberOfLineFragments:", 1);
    v2 = (void *)_drawingContext___drawingContext;
  }
  return v2;
}

+ (double)_widthForHour:(unint64_t)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double Width;
  double v17;
  uint64_t v19;
  _QWORD v20[2];
  CGRect v21;

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v4, "setHour:", a3);
  objc_msgSend(v4, "setMinute:", 0);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v7 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateFormatFromTemplate:options:locale:", CFSTR("j"), 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = CFSTR("jmm");
  if (objc_msgSend(v9, "rangeOfString:", CFSTR("a")) != 0x7FFFFFFFFFFFFFFFLL && !objc_msgSend(v4, "minute"))
    v10 = CFSTR("j");
  objc_msgSend(v6, "setLocalizedDateFormatFromTemplate:", v10);
  objc_msgSend(v5, "dateFromComponents:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_drawingContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "boundingRectWithSize:options:attributes:context:", 1, v14, v15, 0.0, 0.0);
  Width = CGRectGetWidth(v21);

  if (Width <= 0.0)
    v17 = 0.0;
  else
    v17 = Width * 1.25;

  return v17;
}

- (void)_timeChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[NCSchedulerViewCell delegate](self, "delegate", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDatePicker date](self->_datePicker, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "components:fromDate:", 96, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "schedulerCell:didChangeTime:", self, v6);
  }

}

- (void)_buttonPressed:(id)a3
{
  id v4;

  -[NCSchedulerViewCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "schedulerCellButtonPressed:", self);

}

- (double)_buttonSymbolSize
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pointSize");
  v4 = v3;

  return v4;
}

+ (id)_font
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

- (NCSchedulerViewCellDelegate)delegate
{
  return (NCSchedulerViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bottomLineView, 0);
  objc_storeStrong((id *)&self->_bottomCornersView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_topCornersView, 0);
  objc_storeStrong((id *)&self->_labelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_labelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
