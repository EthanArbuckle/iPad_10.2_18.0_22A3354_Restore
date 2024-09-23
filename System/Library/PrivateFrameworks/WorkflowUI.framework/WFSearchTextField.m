@implementation WFSearchTextField

- (WFSearchTextField)initWithStyle:(unint64_t)a3
{
  WFSearchTextField *v4;
  WFSearchTextField *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  WFBackdropView *v9;
  UIView *backgroundView;
  UIView *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIView *v20;
  UIView *v21;
  UIView *v22;
  UIView *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  UIButton *clearButton;
  UIImageView *v30;
  UIImageView *clearButtonImageView;
  UIImageView *v32;
  UIImageView *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  UIButton *v39;
  void *v40;
  uint64_t v41;
  WFSearchTextField *v42;
  void *v43;
  UIButton *v44;
  void *v45;
  WFSearchTextField *v46;
  void *v47;
  UIButton *v48;
  void *v49;
  WFSearchTextField *v50;
  void *v51;
  UIButton *v52;
  void *v53;
  WFSearchTextField *v54;
  void *v55;
  uint64_t v56;
  NSHashTable *styledViews;
  void *v58;
  void *v59;
  void *v60;
  WFSearchTextField *v61;
  _QWORD v63[4];
  WFSearchTextField *v64;
  _QWORD v65[4];
  WFSearchTextField *v66;
  _QWORD v67[4];
  WFSearchTextField *v68;
  _QWORD v69[4];
  WFSearchTextField *v70;
  objc_super v71;
  void *v72;
  _QWORD v73[6];

  v73[4] = *MEMORY[0x24BDAC8D0];
  v71.receiver = self;
  v71.super_class = (Class)WFSearchTextField;
  v4 = -[WFSearchTextField initWithFrame:](&v71, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v5 = v4;
  if (v4)
  {
    -[WFSearchTextField setBorderStyle:](v4, "setBorderStyle:", 0);
    v5->_style = a3;
    v6 = (_QWORD *)MEMORY[0x24BDE5B00];
    v7 = (_QWORD *)MEMORY[0x24BDE5AF0];
    v8 = (_QWORD *)MEMORY[0x24BDE5B10];
    if (a3 == 1)
    {
      v9 = objc_alloc_init(WFBackdropView);
      backgroundView = v5->_backgroundView;
      v5->_backgroundView = &v9->super;

      v11 = v5->_backgroundView;
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v11, "setBackgroundColor:", v12);

      objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5B78]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setValue:forKey:", &unk_24E6318C8, *MEMORY[0x24BDE5B40]);
      v14 = *MEMORY[0x24BDE5AA8];
      objc_msgSend(v13, "setValue:forKey:", &unk_24E631968, *MEMORY[0x24BDE5AA8]);
      objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A10]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setValue:forKey:", &unk_24E631998, v14);
      objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE59D0]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setValue:forKey:", &unk_24E6319A8, v14);
      objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A78]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setValue:forKey:", &unk_24E6319B8, *MEMORY[0x24BDE5B18]);
      objc_msgSend(v17, "setValue:forKey:", MEMORY[0x24BDBD1C8], *v6);
      objc_msgSend(v17, "setValue:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDE5AF0]);
      objc_msgSend(v17, "setValue:forKey:", CFSTR("default"), *v8);
      objc_msgSend(v17, "setValue:forKey:", CFSTR("default"), *MEMORY[0x24BDE5AF8]);
      -[UIView layer](v5->_backgroundView, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v73[0] = v13;
      v73[1] = v15;
      v73[2] = v16;
      v73[3] = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFilters:", v19);

      v7 = (_QWORD *)MEMORY[0x24BDE5AF0];
    }
    else
    {
      v20 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
      v21 = v5->_backgroundView;
      v5->_backgroundView = v20;

      v22 = v5->_backgroundView;
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithDynamicProvider:", &__block_literal_global_9064);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v22, "setBackgroundColor:", v13);
    }

    -[UIView setUserInteractionEnabled:](v5->_backgroundView, "setUserInteractionEnabled:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setAutoresizingMask:](v5->_backgroundView, "setAutoresizingMask:", 18);
    v23 = v5->_backgroundView;
    -[WFSearchTextField bounds](v5, "bounds");
    -[UIView setFrame:](v23, "setFrame:");
    -[WFSearchTextField addSubview:](v5, "addSubview:", v5->_backgroundView);
    -[WFSearchTextField sendSubviewToBack:](v5, "sendSubviewToBack:", v5->_backgroundView);
    -[WFSearchTextField setReturnKeyType:](v5, "setReturnKeyType:", 6);
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "userInterfaceIdiom");

    -[WFSearchTextField setAutocorrectionType:](v5, "setAutocorrectionType:", (v25 & 0xFFFFFFFFFFFFFFFBLL) != 1);
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "userInterfaceIdiom");

    -[WFSearchTextField setSpellCheckingType:](v5, "setSpellCheckingType:", (v27 & 0xFFFFFFFFFFFFFFFBLL) != 1);
    -[WFSearchTextField setEnablesReturnKeyAutomatically:](v5, "setEnablesReturnKeyAutomatically:", 1);
    -[WFSearchTextField setMinimumFontSize:](v5, "setMinimumFontSize:", 10.0);
    -[WFSearchTextField updateVisualStyling](v5, "updateVisualStyling");
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 0);
    v28 = objc_claimAutoreleasedReturnValue();
    clearButton = v5->_clearButton;
    v5->_clearButton = (UIButton *)v28;

    -[UIButton setAlpha:](v5->_clearButton, "setAlpha:", 0.0);
    -[WFSearchTextField setRightView:](v5, "setRightView:", v5->_clearButton);
    -[WFSearchTextField setRightViewMode:](v5, "setRightViewMode:", 3);
    -[WFSearchTextField setClearButtonMode:](v5, "setClearButtonMode:", 0);
    v30 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    clearButtonImageView = v5->_clearButtonImageView;
    v5->_clearButtonImageView = v30;

    -[UIImageView setContentMode:](v5->_clearButtonImageView, "setContentMode:", 4);
    v32 = v5->_clearButtonImageView;
    -[UIButton bounds](v5->_clearButton, "bounds");
    -[UIImageView setFrame:](v32, "setFrame:");
    -[UIImageView setAutoresizingMask:](v5->_clearButtonImageView, "setAutoresizingMask:", 18);
    v33 = v5->_clearButtonImageView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray2Color");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v33, "setTintColor:", v34);

    -[UIImageView setUserInteractionEnabled:](v5->_clearButtonImageView, "setUserInteractionEnabled:", 0);
    -[UIButton addSubview:](v5->_clearButton, "addSubview:", v5->_clearButtonImageView);
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A78]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setName:", CFSTR("gaussianBlur"));
    objc_msgSend(v35, "setValue:forKey:", &unk_24E631978, *MEMORY[0x24BDE5B18]);
    v36 = MEMORY[0x24BDBD1C0];
    objc_msgSend(v35, "setValue:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDE5B00]);
    objc_msgSend(v35, "setValue:forKey:", v36, *v7);
    objc_msgSend(v35, "setValue:forKey:", CFSTR("default"), *v8);
    objc_msgSend(v35, "setValue:forKey:", CFSTR("default"), *MEMORY[0x24BDE5AF8]);
    -[UIImageView layer](v5->_clearButtonImageView, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v35;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v72, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setFilters:", v38);

    v39 = v5->_clearButton;
    v40 = (void *)MEMORY[0x24BEBD388];
    v41 = MEMORY[0x24BDAC760];
    v69[0] = MEMORY[0x24BDAC760];
    v69[1] = 3221225472;
    v69[2] = __35__WFSearchTextField_initWithStyle___block_invoke_2;
    v69[3] = &unk_24E604660;
    v42 = v5;
    v70 = v42;
    objc_msgSend(v40, "actionWithHandler:", v69);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton addAction:forControlEvents:](v39, "addAction:forControlEvents:", v43, 1);

    v44 = v5->_clearButton;
    v45 = (void *)MEMORY[0x24BEBD388];
    v67[0] = v41;
    v67[1] = 3221225472;
    v67[2] = __35__WFSearchTextField_initWithStyle___block_invoke_4;
    v67[3] = &unk_24E604660;
    v46 = v42;
    v68 = v46;
    objc_msgSend(v45, "actionWithHandler:", v67);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton addAction:forControlEvents:](v44, "addAction:forControlEvents:", v47, 16);

    v48 = v5->_clearButton;
    v49 = (void *)MEMORY[0x24BEBD388];
    v65[0] = v41;
    v65[1] = 3221225472;
    v65[2] = __35__WFSearchTextField_initWithStyle___block_invoke_6;
    v65[3] = &unk_24E604660;
    v50 = v46;
    v66 = v50;
    objc_msgSend(v49, "actionWithHandler:", v65);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton addAction:forControlEvents:](v48, "addAction:forControlEvents:", v51, 64);

    v52 = v5->_clearButton;
    v53 = (void *)MEMORY[0x24BEBD388];
    v63[0] = v41;
    v63[1] = 3221225472;
    v63[2] = __35__WFSearchTextField_initWithStyle___block_invoke_7;
    v63[3] = &unk_24E604660;
    v54 = v50;
    v64 = v54;
    objc_msgSend(v53, "actionWithHandler:", v63);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton addAction:forControlEvents:](v52, "addAction:forControlEvents:", v55, 352);

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v56 = objc_claimAutoreleasedReturnValue();
    styledViews = v54->_styledViews;
    v54->_styledViews = (NSHashTable *)v56;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "addObserver:selector:name:object:", v54, sel__didEndEditing_, *MEMORY[0x24BEBE870], v54);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "addObserver:selector:name:object:", v54, sel__didBeginEditing_, *MEMORY[0x24BEBE860], v54);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "addObserver:selector:name:object:", v54, sel__textDidChange_, *MEMORY[0x24BEBE868], v54);

    v54->_alignmentBehavior = 0;
    -[WFSearchTextField _updateTextAlignmentForEditing:animated:](v54, "_updateTextAlignmentForEditing:animated:", 0, 0);
    v61 = v54;

  }
  return v5;
}

- (double)_textFieldCornerRadius
{
  unint64_t v2;
  double result;

  v2 = -[WFSearchTextField style](self, "style");
  result = 9.0;
  if (v2 - 1 <= 3)
    return dbl_220336B70[v2 - 1];
  return result;
}

- (id)_textFieldTextStyle
{
  char *v2;

  v2 = -[WFSearchTextField style](self, "style");
  if ((unint64_t)(v2 - 1) <= 3)
    v2 = (char *)**((id **)&unk_24E603C68 + (_QWORD)(v2 - 1));
  return v2;
}

- (double)_textFieldVerticalMargin
{
  unint64_t v2;
  double result;

  v2 = -[WFSearchTextField style](self, "style");
  result = 0.0;
  if (v2 - 1 <= 3)
    return dbl_220336B90[v2 - 1];
  return result;
}

- (double)_textFieldAccessoryVerticalMargin
{
  unint64_t v2;
  double result;

  v2 = -[WFSearchTextField style](self, "style");
  result = 8.0;
  if (v2 - 1 <= 3)
    return dbl_220336BB0[v2 - 1];
  return result;
}

- (double)_textFieldAccessoryHorizontalMargin
{
  unint64_t v2;
  BOOL v3;
  double result;

  v2 = -[WFSearchTextField style](self, "style");
  v3 = v2 == 1 || v2 == 4;
  result = 6.0;
  if (v3)
    return 8.0;
  return result;
}

- (double)_defaultTextFieldHeight
{
  unint64_t v2;

  v2 = -[WFSearchTextField style](self, "style");
  if (v2 - 1 > 3)
    return 36.0;
  else
    return dbl_220336BD0[v2 - 1];
}

- (double)_textFieldHorizontalEdgeMargin
{
  unint64_t v2;
  double result;

  v2 = -[WFSearchTextField style](self, "style");
  result = 8.0;
  if (v2 - 1 <= 3)
    return dbl_220336BF0[v2 - 1];
  return result;
}

- (CGSize)_textFieldAccessorySizeFromBounds:(CGRect)a3
{
  double height;
  double v4;
  double v5;
  double v6;
  CGSize result;

  height = a3.size.height;
  -[WFSearchTextField _textFieldAccessoryVerticalMargin](self, "_textFieldAccessoryVerticalMargin", a3.origin.x, a3.origin.y, a3.size.width);
  v5 = fmax(height + v4 * -2.0, 0.0);
  v6 = v5;
  result.height = v6;
  result.width = v5;
  return result;
}

- (double)_calculateHeightWithFont
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  -[WFSearchTextField traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = v4;

  -[WFSearchTextField font](self, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSearchTextField _textFieldVerticalMargin](self, "_textFieldVerticalMargin");
  v8 = v7;
  objc_msgSend(v6, "lineHeight");
  v10 = v9 + v8 * 2.0;
  objc_msgSend(v6, "descender");
  v12 = v10 + v11;
  -[WFSearchTextField _defaultTextFieldHeight](self, "_defaultTextFieldHeight");
  if (v12 >= v13)
  {
    v15 = ceil(v5 * v12) / v5;
  }
  else
  {
    -[WFSearchTextField _defaultTextFieldHeight](self, "_defaultTextFieldHeight");
    v15 = v14;
  }

  return v15;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGSize result;

  -[WFSearchTextField _calculateHeightWithFont](self, "_calculateHeightWithFont");
  v4 = v3;
  v7.receiver = self;
  v7.super_class = (Class)WFSearchTextField;
  -[UISearchTextField intrinsicContentSize](&v7, sel_intrinsicContentSize);
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  objc_super v14;
  CGSize result;

  width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)WFSearchTextField;
  -[WFSearchTextField sizeThatFits:](&v14, sel_sizeThatFits_, a3.width, a3.height);
  v6 = v5;
  v8 = v7;
  -[WFSearchTextField _calculateHeightWithFont](self, "_calculateHeightWithFont");
  v10 = v9;
  if (width < v6 || v9 < v8)
  {
    v12 = fmax(width / v6, v9 / v8);
    width = ceil(v6 * v12);
    v10 = ceil(v8 * v12);
  }
  v13 = width;
  result.height = v10;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFSearchTextField;
  -[UISearchTextField layoutSubviews](&v3, sel_layoutSubviews);
  -[WFSearchTextField updateVisualStyling](self, "updateVisualStyling");
}

- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged
{
  return 1;
}

- (void)_didEndEditing:(id)a3
{
  -[WFSearchTextField _updateTextAlignmentForEditing:animated:](self, "_updateTextAlignmentForEditing:animated:", 0, 1);
  -[WFSearchTextField updateClearButtonVisibility](self, "updateClearButtonVisibility");
}

- (void)_didBeginEditing:(id)a3
{
  -[WFSearchTextField _updateTextAlignmentForEditing:animated:](self, "_updateTextAlignmentForEditing:animated:", 1, 1);
  -[WFSearchTextField updateClearButtonVisibility](self, "updateClearButtonVisibility");
}

- (void)updateClearButtonVisibility
{
  _BOOL4 v3;
  double v4;
  UIImageView *clearButtonImageView;
  double v6;
  __int128 v7;
  _QWORD v8[5];
  BOOL v9;
  CGAffineTransform v10;

  v3 = -[WFSearchTextField _hasSearchText](self, "_hasSearchText");
  -[UIButton alpha](self->_clearButton, "alpha");
  if (((v3 ^ (v4 != 1.0)) & 1) == 0)
  {
    clearButtonImageView = self->_clearButtonImageView;
    if (v3)
    {
      CGAffineTransformMakeScale(&v10, 0.8, 0.8);
      v6 = 0.25;
    }
    else
    {
      v7 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      *(_OWORD *)&v10.a = *MEMORY[0x24BDBD8B8];
      *(_OWORD *)&v10.c = v7;
      *(_OWORD *)&v10.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
      v6 = 0.15;
    }
    -[UIImageView setTransform:](clearButtonImageView, "setTransform:", &v10);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __48__WFSearchTextField_updateClearButtonVisibility__block_invoke;
    v8[3] = &unk_24E604718;
    v8[4] = self;
    v9 = v3;
    objc_msgSend(MEMORY[0x24BEBDB00], "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 1, v8, 0, 1.0, v6, 0.0, 0.0, 0.0, 0.0);
  }
}

- (void)setAlignmentBehavior:(int64_t)a3
{
  -[WFSearchTextField setAlignmentBehavior:animated:](self, "setAlignmentBehavior:animated:", a3, 0);
}

- (void)setAlignmentBehavior:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_alignmentBehavior != a3)
  {
    self->_alignmentBehavior = a3;
    -[WFSearchTextField _updateTextAlignmentForEditing:animated:](self, "_updateTextAlignmentForEditing:animated:", -[WFSearchTextField isEditing](self, "isEditing"), a4);
  }
}

- (BOOL)_hasSearchText
{
  void *v3;
  BOOL v4;
  void *v5;

  -[UISearchTextField text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = 1;
  }
  else
  {
    -[UISearchTextField tokens](self, "tokens");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") != 0;

  }
  return v4;
}

- (int64_t)_derivedTextAlignment
{
  return -[WFSearchTextField _derivedTextAlignmentIfEditing:](self, "_derivedTextAlignmentIfEditing:", -[WFSearchTextField isEditing](self, "isEditing"));
}

- (int64_t)_derivedTextAlignmentIfEditing:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v6;

  v3 = a3;
  if (-[WFSearchTextField _hasSearchText](self, "_hasSearchText") && !v3)
    return 4;
  if (v3)
    v6 = 4;
  else
    v6 = 1;
  if (self->_alignmentBehavior)
    return 4;
  else
    return v6;
}

- (void)_updateTextAlignmentForEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  int64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[6];

  v4 = a4;
  v6 = -[WFSearchTextField _derivedTextAlignmentIfEditing:](self, "_derivedTextAlignmentIfEditing:", a3);
  if (v6 != -[WFSearchTextField textAlignment](self, "textAlignment"))
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __61__WFSearchTextField__updateTextAlignmentForEditing_animated___block_invoke;
    v9[3] = &unk_24E603C28;
    v9[4] = self;
    v9[5] = v6;
    v7 = _Block_copy(v9);
    v8 = v7;
    if (v4)
      objc_msgSend(MEMORY[0x24BEBDB00], "_animateUsingDefaultTimingWithOptions:animations:completion:", 6, v7, 0);
    else
      (*((void (**)(void *))v7 + 2))(v7);

  }
}

- (void)setText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFSearchTextField;
  -[UISearchTextField setText:](&v4, sel_setText_, a3);
  -[WFSearchTextField updateClearButtonVisibility](self, "updateClearButtonVisibility");
}

- (void)setTokens:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFSearchTextField;
  -[UISearchTextField setTokens:](&v4, sel_setTokens_, a3);
  -[WFSearchTextField updateClearButtonVisibility](self, "updateClearButtonVisibility");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  _BOOL4 IsAccessibilityCategory;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFSearchTextField;
  -[WFSearchTextField traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);
  -[NSHashTable removeAllObjects](self->_styledViews, "removeAllObjects");
  -[WFSearchTextField updateVisualStyling](self, "updateVisualStyling");
  if (v4)
  {
    objc_msgSend(v4, "preferredContentSizeCategory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSearchTextField traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 != v7)
    {
      -[WFSearchTextField traitCollection](self, "traitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "preferredContentSizeCategory");
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v9);

      if (IsAccessibilityCategory)
        -[WFSearchTextField invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    }
  }

}

- (void)updateVisualStyling
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  UIImageView *clearButtonImageView;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;

  -[WFSearchTextField traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BEBDAB0];
  v36 = v3;
  objc_msgSend(v3, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WFUIContentSizeCategoryClip(v5, (void *)*MEMORY[0x24BEBE0D0], (void *)*MEMORY[0x24BEBE060]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollectionWithPreferredContentSizeCategory:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BEBB520];
  -[WFSearchTextField _textFieldTextStyle](self, "_textFieldTextStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredFontForTextStyle:compatibleWithTraitCollection:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithFont:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WFSearchTextField _derivedTextAlignment](self, "_derivedTextAlignment") == 1)
  {
    self->_alwaysHideLeadingView = 0;
  }
  else
  {
    objc_msgSend(v7, "preferredContentSizeCategory");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    self->_alwaysHideLeadingView = UIContentSizeCategoryIsAccessibilityCategory(v12);

  }
  -[WFSearchTextField setFont:](self, "setFont:", v10);
  clearButtonImageView = self->_clearButtonImageView;
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("xmark.circle.fill"), v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](clearButtonImageView, "setImage:", v14);

  if (updateVisualStyling_onceToken != -1)
    dispatch_once(&updateVisualStyling_onceToken, &__block_literal_global_85);
  v15 = objc_msgSend(v36, "userInterfaceStyle");
  if (v15 == 2)
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSearchTextField setTintColor:](self, "setTintColor:", v16);

  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSearchTextField setTextColor:](self, "setTextColor:", v17);

  -[WFSearchTextField _placeholderLabel](self, "_placeholderLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 == 2)
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.46, 1.0);
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTextColor:", v19);

  -[WFSearchTextField leftView](self, "leftView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
  }
  else
  {
    v21 = 0;
  }
  v22 = v21;

  -[WFSearchTextField rightView](self, "rightView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;
  }
  else
  {
    v24 = 0;
  }
  v25 = v24;

  v26 = &updateVisualStyling_darkModeMagnifyingGlass;
  if (v15 != 2)
    v26 = &updateVisualStyling_lightModeMagnifyingGlass;
  objc_storeStrong((id *)&self->_magnifyingGlassImage, (id)*v26);
  if (objc_msgSend((id)*MEMORY[0x24BEBDF78], "userInterfaceLayoutDirection") == 1)
    v27 = v25;
  else
    v27 = v22;
  objc_msgSend(v27, "setImage:", self->_magnifyingGlassImage);
  -[UIView layer](self->_backgroundView, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setCornerCurve:", *MEMORY[0x24BDE58E8]);

  -[UIView layer](self->_backgroundView, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSearchTextField _textFieldCornerRadius](self, "_textFieldCornerRadius");
  objc_msgSend(v29, "setCornerRadius:");

  -[WFSearchTextField updateStyleForLeftView](self, "updateStyleForLeftView");
  -[WFSearchTextField updateStyleForRightView](self, "updateStyleForRightView");
  -[WFSearchTextField updateStyleForClearButton](self, "updateStyleForClearButton");
  -[WFSearchTextField updateStyleForPlaceholderView](self, "updateStyleForPlaceholderView");
  if (-[WFSearchTextField style](self, "style") != 1)
  {
    -[WFSearchTextField traitCollection](self, "traitCollection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "userInterfaceStyle");
    v32 = (id *)MEMORY[0x24BDE5BD8];
    if (v31 != 2)
      v32 = (id *)MEMORY[0x24BDE5BD0];
    v33 = *v32;

    -[UIView layer](self->_backgroundView, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setCompositingFilter:", v33);

  }
  -[WFSearchTextField layer](self, "layer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setAllowsGroupBlending:", 0);

}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
  -[WFSearchTextField updateVisualStyling](self, "updateVisualStyling");
}

- (void)setFont:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFSearchTextField;
  -[WFSearchTextField font](&v8, sel_font);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)WFSearchTextField;
    -[WFSearchTextField setFont:](&v7, sel_setFont_, v4);
    -[WFSearchTextField invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }

}

- (void)setReturnKeyType:(int64_t)a3
{
  void *v5;
  objc_super v6;

  if (-[WFSearchTextField returnKeyType](self, "returnKeyType") != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)WFSearchTextField;
    -[WFSearchTextField setReturnKeyType:](&v6, sel_setReturnKeyType_, a3);
    objc_msgSend(MEMORY[0x24BEBD6E0], "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "takeTextInputTraitsFromDelegate");
    objc_msgSend(v5, "updateReturnKey:", 1);

  }
}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  int64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[WFSearchTextField _derivedTextAlignment](self, "_derivedTextAlignment");
  -[WFSearchTextField _calculatePlaceholderRectForBounds:alignment:isRTL:](self, "_calculatePlaceholderRectForBounds:alignment:isRTL:", v8, objc_msgSend((id)*MEMORY[0x24BEBDF78], "userInterfaceLayoutDirection") == 1, x, y, width, height);
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  int64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[WFSearchTextField _derivedTextAlignment](self, "_derivedTextAlignment");
  -[WFSearchTextField _calculateTextRectForBounds:alignment:isRTL:](self, "_calculateTextRectForBounds:alignment:isRTL:", v8, objc_msgSend((id)*MEMORY[0x24BEBDF78], "userInterfaceLayoutDirection") == 1, x, y, width, height);
  -[WFSearchTextField _adjustedTextOrEditingRect:forBounds:](self, "_adjustedTextOrEditingRect:forBounds:");
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  int64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[WFSearchTextField _derivedTextAlignment](self, "_derivedTextAlignment");
  -[WFSearchTextField _calculateEditingRectForBounds:alignment:isRTL:](self, "_calculateEditingRectForBounds:alignment:isRTL:", v8, objc_msgSend((id)*MEMORY[0x24BEBDF78], "userInterfaceLayoutDirection") == 1, x, y, width, height);
  -[WFSearchTextField _adjustedTextOrEditingRect:forBounds:](self, "_adjustedTextOrEditingRect:forBounds:");
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (BOOL)resignFirstResponder
{
  BOOL v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFSearchTextField;
  v3 = -[UISearchTextField resignFirstResponder](&v6, sel_resignFirstResponder);
  if (!-[WFSearchTextField _hasSearchText](self, "_hasSearchText"))
  {
    -[WFSearchTextField textFieldDelegate](self, "textFieldDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textFieldDidResignFirstResponder");

  }
  return v3;
}

- (CGRect)leftViewRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[WFSearchTextField _frameForLeftViewWithinBounds:alignment:](self, "_frameForLeftViewWithinBounds:alignment:", -[WFSearchTextField _derivedTextAlignment](self, "_derivedTextAlignment"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)rightViewRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v13;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[WFSearchTextField traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayScale");

  -[WFSearchTextField _textFieldAccessorySizeFromBounds:](self, "_textFieldAccessorySizeFromBounds:", x, y, width, height);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  CGRectGetMaxX(v13);
  -[WFSearchTextField _textFieldHorizontalEdgeMargin](self, "_textFieldHorizontalEdgeMargin");
  -[WFSearchTextField _textFieldAccessorySizeFromBounds:](self, "_textFieldAccessorySizeFromBounds:", x, y, width, height);
  UIRectCenteredYInRectScale();
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (void)updateStyleForPlaceholderView
{
  void *v3;
  void *v4;
  uint64_t v5;
  id *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[WFSearchTextField _placeholderView](self, "_placeholderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSearchTextField traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");
  v6 = (id *)MEMORY[0x24BDE5BD8];
  if (v5 != 2)
    v6 = (id *)MEMORY[0x24BDE5BD0];
  v7 = *v6;

  objc_msgSend(v3, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCompositingFilter:", v7);

  v11 = v3;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v11;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  objc_msgSend(v10, "setAdjustsFontSizeToFitWidth:", 1);
}

- (void)updateStyleForLeftView
{
  void *v3;
  uint64_t v4;
  id *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  -[WFSearchTextField leftView](self, "leftView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[NSHashTable containsObject:](self->_styledViews, "containsObject:"))
  {
    objc_msgSend(v9, "setContentMode:", 1);
    -[NSHashTable addObject:](self->_styledViews, "addObject:", v9);
  }
  -[WFSearchTextField traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");
  v5 = (id *)MEMORY[0x24BDE5BD8];
  if (v4 != 2)
    v5 = (id *)MEMORY[0x24BDE5BD0];
  v6 = *v5;

  objc_msgSend(v9, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCompositingFilter:", v6);

  if (objc_msgSend((id)*MEMORY[0x24BEBDF78], "userInterfaceLayoutDirection") != 1)
  {
    if (self->_alwaysHideLeadingView)
      v8 = 0;
    else
      v8 = 3;
    -[WFSearchTextField setLeftViewMode:](self, "setLeftViewMode:", v8);
  }

}

- (void)updateStyleForRightView
{
  void *v3;
  uint64_t v4;
  id *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  -[WFSearchTextField rightView](self, "rightView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[NSHashTable containsObject:](self->_styledViews, "containsObject:"))
  {
    objc_msgSend(v9, "setContentMode:", 1);
    -[NSHashTable addObject:](self->_styledViews, "addObject:", v9);
  }
  -[WFSearchTextField traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");
  v5 = (id *)MEMORY[0x24BDE5BD8];
  if (v4 != 2)
    v5 = (id *)MEMORY[0x24BDE5BD0];
  v6 = *v5;

  objc_msgSend(v9, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCompositingFilter:", v6);

  if (objc_msgSend((id)*MEMORY[0x24BEBDF78], "userInterfaceLayoutDirection") == 1)
  {
    if (self->_alwaysHideLeadingView)
      v8 = 0;
    else
      v8 = 3;
    -[WFSearchTextField setRightViewMode:](self, "setRightViewMode:", v8);
  }

}

- (void)updateStyleForClearButton
{
  void *v3;
  uint64_t v4;
  id *v5;
  id v6;
  void *v7;
  id v8;

  -[WFSearchTextField _clearButton](self, "_clearButton");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[NSHashTable containsObject:](self->_styledViews, "containsObject:"))
  {
    objc_msgSend(v8, "setContentMode:", 1);
    -[NSHashTable addObject:](self->_styledViews, "addObject:", v8);
  }
  -[WFSearchTextField traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");
  v5 = (id *)MEMORY[0x24BDE5BD8];
  if (v4 != 2)
    v5 = (id *)MEMORY[0x24BDE5BD0];
  v6 = *v5;

  objc_msgSend(v8, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCompositingFilter:", v6);

}

- (void)_setContinuousCornerRadius:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFSearchTextField;
  -[WFSearchTextField _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", a3);
  -[UIVisualEffectView _setContinuousCornerRadius:](self->_blurView, "_setContinuousCornerRadius:", a3);
}

- (CGRect)_frameForLeftViewWithinBounds:(CGRect)a3 alignment:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[WFSearchTextField traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayScale");
  v12 = v11;

  -[WFSearchTextField _textFieldAccessorySizeFromBounds:](self, "_textFieldAccessorySizeFromBounds:", x, y, width, height);
  UIRectCenteredYInRectScale();
  if (a4 == 1)
  {
    -[WFSearchTextField _calculatePlaceholderRectForBounds:alignment:isRTL:](self, "_calculatePlaceholderRectForBounds:alignment:isRTL:", 1, 0, x, y, width, height, v12);
    CGRectGetMinX(v17);
    -[WFSearchTextField _textFieldAccessoryHorizontalMargin](self, "_textFieldAccessoryHorizontalMargin");
    -[WFSearchTextField _textFieldAccessorySizeFromBounds:](self, "_textFieldAccessorySizeFromBounds:", x, y, width, height);
  }
  else
  {
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    CGRectGetMinX(v18);
    -[WFSearchTextField _textFieldHorizontalEdgeMargin](self, "_textFieldHorizontalEdgeMargin", v12);
  }
  UIRectCenteredYInRectScale();
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_frameForRightViewWithinBounds:(CGRect)a3 alignment:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[WFSearchTextField traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayScale");
  v12 = v11;

  -[WFSearchTextField _textFieldAccessorySizeFromBounds:](self, "_textFieldAccessorySizeFromBounds:", x, y, width, height);
  UIRectCenteredYInRectScale();
  if (a4 == 1)
  {
    -[WFSearchTextField _calculatePlaceholderRectForBounds:alignment:isRTL:](self, "_calculatePlaceholderRectForBounds:alignment:isRTL:", 1, 1, x, y, width, height, v12);
    CGRectGetMaxX(v17);
    -[WFSearchTextField _textFieldAccessoryHorizontalMargin](self, "_textFieldAccessoryHorizontalMargin");
  }
  else
  {
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    CGRectGetMaxX(v18);
    -[WFSearchTextField _textFieldHorizontalEdgeMargin](self, "_textFieldHorizontalEdgeMargin", v12);
    -[WFSearchTextField _textFieldAccessorySizeFromBounds:](self, "_textFieldAccessorySizeFromBounds:", x, y, width, height);
  }
  UIRectCenteredYInRectScale();
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_calculateEditingRectForBounds:(CGRect)a3 alignment:(int64_t)a4 isRTL:(BOOL)a5
{
  double height;
  double width;
  double y;
  double x;
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
  double v21;
  double v22;
  double v23;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[WFSearchTextField _textFieldHorizontalEdgeMargin](self, "_textFieldHorizontalEdgeMargin", a4, a5);
  v11 = v10;
  v12 = 0.0;
  if (!self->_alwaysHideLeadingView)
  {
    -[WFSearchTextField _textFieldAccessorySizeFromBounds:](self, "_textFieldAccessorySizeFromBounds:", x, y, width, height);
    v14 = v13;
    -[WFSearchTextField _textFieldAccessoryHorizontalMargin](self, "_textFieldAccessoryHorizontalMargin");
    v12 = v14 + v15;
  }
  v16 = v11 + v12;
  -[WFSearchTextField _textFieldVerticalMargin](self, "_textFieldVerticalMargin");
  v18 = v17;
  -[WFSearchTextField _textFieldVerticalMargin](self, "_textFieldVerticalMargin");
  v19 = y + v18;
  v20 = width - (v16 + v16);
  v22 = height - (v18 + v21) + 10.0;
  v23 = x + v16;
  result.size.height = v22;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v23;
  return result;
}

- (CGRect)_calculateTextRectForBounds:(CGRect)a3 alignment:(int64_t)a4 isRTL:(BOOL)a5
{
  double height;
  double width;
  double y;
  double x;
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
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4 == 1)
  {
    -[WFSearchTextField _frameForPlaceholderRectForBounds:alignment:isRTL:willOverflow:](self, "_frameForPlaceholderRectForBounds:alignment:isRTL:willOverflow:", 1, a5, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  else
  {
    -[WFSearchTextField _textFieldHorizontalEdgeMargin](self, "_textFieldHorizontalEdgeMargin", a4, a5);
    v15 = v14;
    v16 = 0.0;
    if (!self->_alwaysHideLeadingView)
    {
      -[WFSearchTextField _textFieldAccessorySizeFromBounds:](self, "_textFieldAccessorySizeFromBounds:", x, y, width, height);
      v18 = v17;
      -[WFSearchTextField _textFieldAccessoryHorizontalMargin](self, "_textFieldAccessoryHorizontalMargin");
      v16 = v18 + v19;
    }
    v20 = v15 + v16;
    -[WFSearchTextField _textFieldVerticalMargin](self, "_textFieldVerticalMargin");
    v22 = v21;
    -[WFSearchTextField _textFieldVerticalMargin](self, "_textFieldVerticalMargin");
    v24 = v23;
    v10 = x + v20;
    v11 = y + v22;
    v12 = width - (v20 + v20);
    v13 = height - (v22 + v24) + 10.0;
  }
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGRect)_calculatePlaceholderRectForBounds:(CGRect)a3 alignment:(int64_t)a4 isRTL:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double MinX;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  double MaxX;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  CGRect result;

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[WFSearchTextField traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayScale");
  v48 = v13;

  -[WFSearchTextField _frameForPlaceholderRectForBounds:alignment:isRTL:willOverflow:](self, "_frameForPlaceholderRectForBounds:alignment:isRTL:willOverflow:", a4, v5, 0, x, y, width, height);
  v16 = v15;
  v18 = v17;
  if (a4 == 1)
  {
    -[WFSearchTextField _textFieldAccessoryHorizontalMargin](self, "_textFieldAccessoryHorizontalMargin");
    v20 = v19;
    -[WFSearchTextField _textFieldAccessorySizeFromBounds:](self, "_textFieldAccessorySizeFromBounds:", x, y, width, height);
    v22 = v20 + v21;
    v47 = v48;
    UIRectCenteredXInRectScale();
    v49 = v24;
    v26 = v25;
    v28 = v27;
    v29 = -2.0;
    if (v5)
      v29 = 2.0;
    v30 = v29 + v23;
    v31 = -0.0;
    if (!v5)
      v31 = v22;
    MinX = v31 + v30;
    -[WFSearchTextField _textFieldAccessoryHorizontalMargin](self, "_textFieldAccessoryHorizontalMargin", v47);
    v34 = v33;
    -[WFSearchTextField _textFieldAccessorySizeFromBounds:](self, "_textFieldAccessorySizeFromBounds:", x, y, width, height);
    v36 = v34 + v35;
    v18 = v28;
    v16 = v26 - v36;
  }
  else
  {
    v49 = v14;
    -[WFSearchTextField _calculateTextRectForBounds:alignment:isRTL:](self, "_calculateTextRectForBounds:alignment:isRTL:", a4, v5, x, y, width, height);
    if (v5)
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&v37);
      -[WFSearchTextField _textFieldAccessoryHorizontalMargin](self, "_textFieldAccessoryHorizontalMargin");
      MinX = MaxX - (v16 + v42);
    }
    else
    {
      MinX = CGRectGetMinX(*(CGRect *)&v37);
    }
  }
  v43 = v49;
  v44 = MinX;
  v45 = v16;
  v46 = v18;
  result.size.height = v46;
  result.size.width = v45;
  result.origin.y = v43;
  result.origin.x = v44;
  return result;
}

- (CGRect)_frameForPlaceholderRectForBounds:(CGRect)a3 alignment:(int64_t)a4 isRTL:(BOOL)a5 willOverflow:(BOOL *)a6
{
  double height;
  double width;
  double y;
  double x;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  _QWORD v30[2];
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v30[1] = *MEMORY[0x24BDAC8D0];
  -[WFSearchTextField traitCollection](self, "traitCollection", a4, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayScale");
  v14 = v13;

  -[WFSearchTextField _textFieldAccessoryHorizontalMargin](self, "_textFieldAccessoryHorizontalMargin");
  v16 = v15;
  -[WFSearchTextField _textFieldAccessorySizeFromBounds:](self, "_textFieldAccessorySizeFromBounds:", x, y, width, height);
  v18 = width - (v17 + v17 + v16 * 2.0);
  -[WFSearchTextField placeholder](self, "placeholder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = *MEMORY[0x24BEBB360];
  -[WFSearchTextField font](self, "font");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "boundingRectWithSize:options:attributes:context:", 0, v21, 0, width, height);
  v23 = v22;

  v24 = ceil(v14 * v23) / v14;
  if (a6)
    *a6 = v24 > v18;
  UIRectCenteredIntegralRectScale();
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)_adjustedTextOrEditingRect:(CGRect)a3 forBounds:(CGRect)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
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
  double v20;
  uint64_t v21;
  CGRect result;

  -[WFSearchTextField traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  v7 = v6;

  -[WFSearchTextField bounds](self, "bounds");
  -[WFSearchTextField _padding](self, "_padding");
  -[WFSearchTextField font](self, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lineHeight");

  v21 = v7;
  UIRectCenteredYInRectScale();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  if (-[WFSearchTextField textAlignment](self, "textAlignment", v21) == 1)
  {
    if (objc_msgSend((id)*MEMORY[0x24BEBDF78], "userInterfaceLayoutDirection") == 1)
      v10 = v10 + -7.0;
    else
      v10 = v10 + 7.0;
  }
  v17 = v16 + 6.0;
  v18 = v12 + -3.0;
  v19 = v10;
  v20 = v14;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v18;
  result.origin.x = v19;
  return result;
}

- (unint64_t)style
{
  return self->_style;
}

- (WFSearchTextFieldDelegate)textFieldDelegate
{
  return (WFSearchTextFieldDelegate *)objc_loadWeakRetained((id *)&self->_textFieldDelegate);
}

- (void)setTextFieldDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_textFieldDelegate, a3);
}

- (int64_t)alignmentBehavior
{
  return self->_alignmentBehavior;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textFieldDelegate);
  objc_storeStrong((id *)&self->_clearButtonImageView, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_cancelButtonImage, 0);
  objc_storeStrong((id *)&self->_magnifyingGlassImage, 0);
  objc_storeStrong((id *)&self->_styledViews, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

void __40__WFSearchTextField_updateVisualStyling__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithWeight:", 4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", CFSTR("magnifyingglass"), v8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.46, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageWithTintColor:renderingMode:", v1, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)updateVisualStyling_darkModeMagnifyingGlass;
  updateVisualStyling_darkModeMagnifyingGlass = v2;

  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", CFSTR("magnifyingglass"), v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithTintColor:renderingMode:", v5, 1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)updateVisualStyling_lightModeMagnifyingGlass;
  updateVisualStyling_lightModeMagnifyingGlass = v6;

}

uint64_t __61__WFSearchTextField__updateTextAlignmentForEditing_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 32), "setTextAlignment:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __48__WFSearchTextField_updateClearButtonVisibility__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  double v5;
  void *v6;
  __int128 v7;
  CGAffineTransform v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1264), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 40))
    v3 = 0.0;
  else
    v3 = 1.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKeyPath:", v4, CFSTR("filters.gaussianBlur.inputRadius"));

  if (*(_BYTE *)(a1 + 40))
    v5 = 1.0;
  else
    v5 = 0.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1256), "setAlpha:", v5);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 1264);
  if (*(_BYTE *)(a1 + 40))
  {
    v7 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v9.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v9.c = v7;
    *(_OWORD *)&v9.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v9, 0.87, 0.87);
  }
  return objc_msgSend(v6, "setTransform:", &v9);
}

void __35__WFSearchTextField_initWithStyle___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = (void *)MEMORY[0x24BEBDB00];
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __35__WFSearchTextField_initWithStyle___block_invoke_3;
  v2[3] = &unk_24E604D88;
  v3 = *(id *)(a1 + 32);
  objc_msgSend(v1, "animateWithDuration:animations:completion:", v2, 0, 0.0);

}

void __35__WFSearchTextField_initWithStyle___block_invoke_4(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = (void *)MEMORY[0x24BEBDB00];
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __35__WFSearchTextField_initWithStyle___block_invoke_5;
  v2[3] = &unk_24E604D88;
  v3 = *(id *)(a1 + 32);
  objc_msgSend(v1, "animateWithDuration:animations:completion:", v2, 0, 0.25);

}

void __35__WFSearchTextField_initWithStyle___block_invoke_6(uint64_t a1)
{
  id v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "isFirstResponder") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "becomeFirstResponder");
  objc_msgSend(*(id *)(a1 + 32), "setTokens:", MEMORY[0x24BDBD1A8]);
  objc_msgSend(*(id *)(a1 + 32), "setText:", &stru_24E605650);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", *MEMORY[0x24BEBE868], *(_QWORD *)(a1 + 32));

}

void __35__WFSearchTextField_initWithStyle___block_invoke_7(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = (void *)MEMORY[0x24BEBDB00];
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __35__WFSearchTextField_initWithStyle___block_invoke_8;
  v2[3] = &unk_24E604D88;
  v3 = *(id *)(a1 + 32);
  objc_msgSend(v1, "animateWithDuration:animations:completion:", v2, 0, 0.25);

}

uint64_t __35__WFSearchTextField_initWithStyle___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1264), "setAlpha:", 1.0);
}

uint64_t __35__WFSearchTextField_initWithStyle___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1264), "setAlpha:", 0.5);
}

uint64_t __35__WFSearchTextField_initWithStyle___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1264), "setAlpha:", 0.5);
}

id __35__WFSearchTextField_initWithStyle___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.363, 0.363, 0.402, 0.24);
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.075);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
