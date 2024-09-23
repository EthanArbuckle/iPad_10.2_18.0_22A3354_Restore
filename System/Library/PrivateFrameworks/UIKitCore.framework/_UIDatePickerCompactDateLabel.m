@implementation _UIDatePickerCompactDateLabel

- (_UIDatePickerCompactDateLabel)initWithFrame:(CGRect)a3
{
  _UIDatePickerCompactDateLabel *v3;
  _UIDatePickerCompactDateLabel *v4;
  void *v5;
  uint64_t v6;
  _UIDatePickerStyle *visualStyle;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  UITapGestureRecognizer *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  UIPointerInteraction *v29;
  UITapGestureRecognizer *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
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
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  id location;
  objc_super v61;
  _QWORD v62[10];

  v62[8] = *MEMORY[0x1E0C80C00];
  v61.receiver = self;
  v61.super_class = (Class)_UIDatePickerCompactDateLabel;
  v3 = -[UIView initWithFrame:](&v61, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView traitCollection](v3, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIDatePicker _styleForIdiom:](UIDatePicker, "_styleForIdiom:", objc_msgSend(v5, "userInterfaceIdiom"));
    v6 = objc_claimAutoreleasedReturnValue();
    visualStyle = v4->_visualStyle;
    v4->_visualStyle = (_UIDatePickerStyle *)v6;

    v4->_enabled = 1;
    -[_UIDatePickerStyle compactLabelCornerRadius](v4->_visualStyle, "compactLabelCornerRadius");
    -[UIView _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:");
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v9);

    objc_msgSend(v8, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v8, "setUserInteractionEnabled:", 0);
    LODWORD(v10) = 1144733696;
    objc_msgSend(v8, "setContentCompressionResistancePriority:forAxis:", 0, v10);
    LODWORD(v11) = 1144766464;
    objc_msgSend(v8, "setContentHuggingPriority:forAxis:", 0, v11);
    objc_storeStrong((id *)&v4->_textLabel, v8);
    -[_UIDatePickerStyle compactLabelBackgroundButtonConfiguration](v4->_visualStyle, "compactLabelBackgroundButtonConfiguration");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v4);
    v12 = MEMORY[0x1E0C809B0];
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __47___UIDatePickerCompactDateLabel_initWithFrame___block_invoke;
    v58[3] = &unk_1E16B58D0;
    objc_copyWeak(&v59, &location);
    +[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v58);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v52, v13);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v53, "setConfigurationUpdateHandler:", &__block_literal_global_121);
    objc_msgSend(v53, "setPreferredBehavioralStyle:", 1);
    objc_msgSend(v53, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_storeStrong((id *)&v4->_backgroundView, v53);
    v56[0] = v12;
    v56[1] = 3221225472;
    v56[2] = __47___UIDatePickerCompactDateLabel_initWithFrame___block_invoke_3;
    v56[3] = &unk_1E16B58D0;
    objc_copyWeak(&v57, &location);
    +[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v56);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addAction:forControlEvents:", v14, 17);

    v54[0] = v12;
    v54[1] = 3221225472;
    v54[2] = __47___UIDatePickerCompactDateLabel_initWithFrame___block_invoke_4;
    v54[3] = &unk_1E16B58D0;
    objc_copyWeak(&v55, &location);
    +[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v54);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addAction:forControlEvents:", v15, 480);

    -[UIView addSubview:](v4, "addSubview:", v53);
    objc_msgSend(v53, "addSubview:", v8);
    v16 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", v4, sel_activateLabel);
    -[UITapGestureRecognizer setAllowedPressTypes:](v16, "setAllowedPressTypes:", &unk_1E1A930C8);
    -[UIView addGestureRecognizer:](v4, "addGestureRecognizer:", v16);
    v31 = v16;
    -[_UIDatePickerStyle compactLabelBackgroundPadding](v4->_visualStyle, "compactLabelBackgroundPadding");
    v18 = v17;
    v20 = v19;
    v32 = (void *)MEMORY[0x1E0D156E0];
    -[UIView leadingAnchor](v4, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:constant:", v50, -v18);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v49;
    -[UIView trailingAnchor](v4, "trailingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, v18);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = v46;
    -[UIView topAnchor](v4, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, -v20);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v62[2] = v43;
    -[UIView bottomAnchor](v4, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:constant:", v41, v20);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v62[3] = v40;
    objc_msgSend(v53, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentLayoutGuide");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, -v18);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v62[4] = v36;
    objc_msgSend(v53, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentLayoutGuide");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v62[5] = v21;
    objc_msgSend(v53, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, -v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v62[6] = v24;
    objc_msgSend(v53, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, v20);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v62[7] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "activateConstraints:", v28);

    v29 = -[UIPointerInteraction initWithDelegate:]([UIPointerInteraction alloc], "initWithDelegate:", v4);
    -[UIView addInteraction:](v4, "addInteraction:", v29);

    objc_destroyWeak(&v55);
    objc_destroyWeak(&v57);

    objc_destroyWeak(&v59);
    objc_destroyWeak(&location);

  }
  return v4;
}

- (void)activateLabel
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  BOOL v14;

  -[_UIDatePickerCompactDateLabel overlayPresentation](self, "overlayPresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "activeMode") == 2)
  {
    objc_msgSend(v3, "dismissPresentationAnimated:", 1);
  }
  else
  {
    v4 = -[_UIDatePickerCompactDateLabel tapInteractionControlledExternally](self, "tapInteractionControlledExternally");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __46___UIDatePickerCompactDateLabel_activateLabel__block_invoke;
    v13[3] = &unk_1E16B7F38;
    v13[4] = self;
    v14 = v4;
    v5 = _Block_copy(v13);
    -[_UIDatePickerStyle compactLabelTextColorForEditingState:](self->_visualStyle, "compactLabelTextColorForEditingState:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerCompactDateLabel textLabel](self, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v6);

    -[_UIDatePickerCompactDateLabel backgroundView](self, "backgroundView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSelected:", 1);

    if (v4)
    {
      objc_msgSend(v3, "activateEmptyPresentationWithMode:onDismiss:", 2, v5);
    }
    else
    {
      -[_UIDatePickerCompactDateLabel delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "compactDateLabelDidBeginEditing:", self);

      -[_UIDatePickerCompactDateLabel delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "createDatePickerForCompactDateLabel:", self);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "sourceView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bounds](self, "bounds");
      objc_msgSend(v12, "convertRect:fromView:", self);
      objc_msgSend(v3, "setSourceRect:");

      objc_msgSend(v3, "presentDatePicker:onDismiss:", v11, v5);
    }

  }
}

- (void)setHighlightedForTouch:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  void *v5;
  _BOOL4 v6;
  double v7;
  id v8;
  _QWORD v9[4];
  id v10;
  double v11;

  if (self->_highlightedForTouch != a3)
  {
    v3 = a3;
    self->_highlightedForTouch = a3;
    -[_UIDatePickerCompactDateLabel textLabel](self, "textLabel");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceStyle") == 2;

    v7 = dbl_186679260[v6];
    if (!v3)
      v7 = 1.0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = ___UIDateLabelAnimateHighlight_block_invoke;
    v9[3] = &unk_1E16B1888;
    v10 = v4;
    v11 = v7;
    v8 = v4;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327684, v9, 0, 0.47, 0.0);

  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  const __CFString *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v6 = a5;
  if (objc_msgSend(a4, "_pointerType") == 1)
    v7 = CFSTR("datePicker.date.all.pencil");
  else
    v7 = CFSTR("datePicker.date.all");
  objc_msgSend(v6, "rect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  return +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v7, v9, v11, v13, v15);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  int v6;
  UITargetedPreview *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  UITargetedPreview *v20;
  void *v21;
  void *v22;
  double x;
  double y;
  double width;
  double height;
  void *v27;
  double v28;
  double v29;
  UITargetedPreview *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  objc_msgSend(a4, "identifier", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", CFSTR("datePicker.date.all.pencil"));

  if (v6)
  {
    v7 = (UITargetedPreview *)objc_opt_new();
    -[_UIDatePickerCompactDateLabel backgroundView](self, "backgroundView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[UIView layer](self, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cornerRadius");
    +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v10, v12, v14, v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITargetedPreview setShadowPath:](v7, "setShadowPath:", v19);

    v20 = -[UITargetedPreview initWithView:parameters:]([UITargetedPreview alloc], "initWithView:parameters:", self, v7);
    +[UIPointerEffect effectWithPreview:](UIPointerLiftEffect, "effectWithPreview:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerCompactDateLabel backgroundView](self, "backgroundView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "frame");
    v38 = CGRectInset(v37, 5.0, 5.0);
    x = v38.origin.x;
    y = v38.origin.y;
    width = v38.size.width;
    height = v38.size.height;

    -[UIView layer](self, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "cornerRadius");
    v29 = v28;

  }
  else
  {
    v30 = [UITargetedPreview alloc];
    -[_UIDatePickerCompactDateLabel textLabel](self, "textLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[UITargetedPreview initWithView:](v30, "initWithView:", v31);

    +[UIPointerEffect effectWithPreview:](UIPointerHighlightEffect, "effectWithPreview:", v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDatePickerCompactDateLabel backgroundView](self, "backgroundView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "frame");
    v40 = CGRectInset(v39, 2.0, 2.0);
    x = v40.origin.x;
    y = v40.origin.y;
    width = v40.size.width;
    height = v40.size.height;

    -[UIView layer](self, "layer");
    v20 = (UITargetedPreview *)objc_claimAutoreleasedReturnValue();
    -[UITargetedPreview cornerRadius](v20, "cornerRadius");
    v29 = v33 + -2.0;
  }

  +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", x, y, width, height, v29);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v21, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_enabled != a3)
  {
    v3 = a3;
    self->_enabled = a3;
    -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
    -[_UIDatePickerCompactDateLabel backgroundView](self, "backgroundView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", v3);

  }
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_UIDatePickerCompactDateLabel textLabel](self, "textLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdjustsFontSizeToFitWidth:", v3);

}

- (BOOL)adjustsFontSizeToFitWidth
{
  void *v2;
  char v3;

  -[_UIDatePickerCompactDateLabel textLabel](self, "textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "adjustsFontSizeToFitWidth");

  return v3;
}

- (double)minimumScaleFactor
{
  void *v2;
  double v3;
  double v4;

  -[_UIDatePickerCompactDateLabel textLabel](self, "textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimumScaleFactor");
  v4 = v3;

  return v4;
}

- (void)setMinimumScaleFactor:(double)a3
{
  id v4;

  -[_UIDatePickerCompactDateLabel textLabel](self, "textLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinimumScaleFactor:", a3);

}

- (NSArray)titles
{
  void *v2;
  void *v3;

  -[_UIDatePickerCompactDateLabel textLabel](self, "textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setTitles:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIDatePickerCompactDateLabel textLabel](self, "textLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitles:", v4);

}

- (int64_t)textAlignment
{
  void *v2;
  int64_t v3;

  -[_UIDatePickerCompactDateLabel textLabel](self, "textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "textAlignment");

  return v3;
}

- (void)setTextAlignment:(int64_t)a3
{
  id v4;

  -[_UIDatePickerCompactDateLabel textLabel](self, "textLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextAlignment:", a3);

}

- (NSDictionary)overrideAttributes
{
  void *v2;
  void *v3;

  -[_UIDatePickerCompactDateLabel textLabel](self, "textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overrideAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setOverrideAttributes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIDatePickerCompactDateLabel textLabel](self, "textLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOverrideAttributes:", v4);

}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)tapInteractionControlledExternally
{
  return self->_tapInteractionControlledExternally;
}

- (void)setTapInteractionControlledExternally:(BOOL)a3
{
  self->_tapInteractionControlledExternally = a3;
}

- (_UIDatePickerCompactDateLabelDelegate)delegate
{
  return (_UIDatePickerCompactDateLabelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UIDatePickerOverlayPresentation)overlayPresentation
{
  return (_UIDatePickerOverlayPresentation *)objc_loadWeakRetained((id *)&self->_overlayPresentation);
}

- (void)setOverlayPresentation:(id)a3
{
  objc_storeWeak((id *)&self->_overlayPresentation, a3);
}

- (UIButton)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (_UIDatePickerStyle)visualStyle
{
  return self->_visualStyle;
}

- (void)setVisualStyle:(id)a3
{
  objc_storeStrong((id *)&self->_visualStyle, a3);
}

- (_UIDatePickerLinkedLabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (BOOL)highlightedForTouch
{
  return self->_highlightedForTouch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_overlayPresentation);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
