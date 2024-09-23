@implementation VUIDebugCollectionViewDefaultsCell

- (VUIDebugCollectionViewDefaultsCell)initWithFrame:(CGRect)a3
{
  VUIDebugCollectionViewDefaultsCell *v3;
  VUITextLayout *v4;
  void *v5;
  VUITextLayout *titleLayout;
  VUITextLayout *v7;
  uint64_t v8;
  VUILabel *titleLabel;
  void *v10;
  VUITextLayout *v11;
  void *v12;
  VUITextLayout *subtitleLayout;
  VUITextLayout *v14;
  uint64_t v15;
  VUILabel *subtitleLabel;
  void *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  UISwitch *defaultsSwitch;
  void *v25;
  uint64_t v26;
  UITextField *textField;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  VUISeparatorView *v32;
  VUISeparatorView *separatorView;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)VUIDebugCollectionViewDefaultsCell;
  v3 = -[VUIDebugCollectionViewDefaultsCell initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(VUITextLayout);
    -[VUITextLayout setNumberOfLines:](v4, "setNumberOfLines:", 1);
    -[VUITextLayout setNumberOfLinesAXSmall:](v4, "setNumberOfLinesAXSmall:", 1);
    -[VUITextLayout setNumberOfLinesAXLarge:](v4, "setNumberOfLinesAXLarge:", 1);
    -[VUITextLayout setTextStyle:](v4, "setTextStyle:", 3);
    -[VUITextLayout setMaximumContentSizeCategory:](v4, "setMaximumContentSizeCategory:", 3);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setColor:](v4, "setColor:", v5);

    titleLayout = v3->_titleLayout;
    v3->_titleLayout = v4;
    v7 = v4;

    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", &stru_1E9FF3598, v7, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (VUILabel *)v8;

    -[VUIDebugCollectionViewDefaultsCell contentView](v3, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v3->_titleLabel);

    v11 = objc_alloc_init(VUITextLayout);
    -[VUITextLayout setNumberOfLines:](v11, "setNumberOfLines:", 1);
    -[VUITextLayout setNumberOfLinesAXSmall:](v11, "setNumberOfLinesAXSmall:", 1);
    -[VUITextLayout setNumberOfLinesAXLarge:](v11, "setNumberOfLinesAXLarge:", 1);
    -[VUITextLayout setTextStyle:](v11, "setTextStyle:", 13);
    -[VUITextLayout setMaximumContentSizeCategory:](v11, "setMaximumContentSizeCategory:", 3);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setColor:](v11, "setColor:", v12);

    subtitleLayout = v3->_subtitleLayout;
    v3->_subtitleLayout = v11;
    v14 = v11;

    +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", &stru_1E9FF3598, v14, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (VUILabel *)v15;

    -[VUIDebugCollectionViewDefaultsCell contentView](v3, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v3->_subtitleLabel);

    v18 = objc_alloc(MEMORY[0x1E0DC3D18]);
    v19 = *MEMORY[0x1E0C9D648];
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v23 = objc_msgSend(v18, "initWithFrame:", *MEMORY[0x1E0C9D648], v20, v21, v22);
    defaultsSwitch = v3->_defaultsSwitch;
    v3->_defaultsSwitch = (UISwitch *)v23;

    -[UISwitch sendActionsForControlEvents:](v3->_defaultsSwitch, "sendActionsForControlEvents:", 64);
    -[UISwitch addTarget:action:forControlEvents:](v3->_defaultsSwitch, "addTarget:action:forControlEvents:", v3, sel__defaultsSwitchPressed_, 64);
    -[VUIDebugCollectionViewDefaultsCell contentView](v3, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v3->_defaultsSwitch);

    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3DB8]), "initWithFrame:", v19, v20, v21, v22);
    textField = v3->_textField;
    v3->_textField = (UITextField *)v26;

    -[UITextField setKeyboardType:](v3->_textField, "setKeyboardType:", 2);
    -[UITextField setReturnKeyType:](v3->_textField, "setReturnKeyType:", 1);
    -[UITextField setEnablesReturnKeyAutomatically:](v3->_textField, "setEnablesReturnKeyAutomatically:", 1);
    -[UITextField setClearsOnBeginEditing:](v3->_textField, "setClearsOnBeginEditing:", 1);
    -[UITextField setAdjustsFontSizeToFitWidth:](v3->_textField, "setAdjustsFontSizeToFitWidth:", 1);
    -[UITextField setBorderStyle:](v3->_textField, "setBorderStyle:", 3);
    -[UITextField setDelegate:](v3->_textField, "setDelegate:", v3);
    -[VUIDebugCollectionViewDefaultsCell contentView](v3, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", v3->_textField);

    -[VUIDebugCollectionViewDefaultsCell contentView](v3, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setBackgroundColor:", v30);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemLightGrayColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIListCollectionViewCell setHighlightedBackgroundColor:](v3, "setHighlightedBackgroundColor:", v31);

    v32 = objc_alloc_init(VUISeparatorView);
    separatorView = v3->_separatorView;
    v3->_separatorView = v32;

    -[VUIDebugCollectionViewDefaultsCell addSubview:](v3, "addSubview:", v3->_separatorView);
  }
  return v3;
}

- (void)configureCellWithDefaults:(id)a3
{
  VUIDebugViewDefaults *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  UITextField *textField;
  void *v18;
  VUIDebugViewDefaults *defaults;

  v4 = (VUIDebugViewDefaults *)a3;
  -[VUIDebugViewDefaults title](v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDebugCollectionViewDefaultsCell titleLayout](self, "titleLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDebugCollectionViewDefaultsCell titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v5, v6, v7);

  -[VUIDebugCollectionViewDefaultsCell subtitleLabel](self, "subtitleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDebugViewDefaults subtitle](v4, "subtitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", objc_msgSend(v10, "length") == 0);

  -[VUIDebugViewDefaults subtitle](v4, "subtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    -[VUIDebugViewDefaults subtitle](v4, "subtitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDebugCollectionViewDefaultsCell subtitleLayout](self, "subtitleLayout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDebugCollectionViewDefaultsCell subtitleLabel](self, "subtitleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", v13, v14, v15);

  }
  if (-[VUIDebugViewDefaults integerValueType](v4, "integerValueType"))
  {
    textField = self->_textField;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), -[VUIDebugViewDefaults defaultIntegerValue](v4, "defaultIntegerValue"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setText:](textField, "setText:", v18);

  }
  else
  {
    -[UISwitch setOn:animated:](self->_defaultsSwitch, "setOn:animated:", -[VUIDebugViewDefaults defaultBoolValue](v4, "defaultBoolValue"), 0);
  }
  defaults = self->_defaults;
  self->_defaults = v4;

}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat Width;
  CGFloat *v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double Height;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  VUISeparatorView *separatorView;
  CGFloat v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  -[VUIDebugCollectionViewDefaultsCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_padding");
  v12 = v11;
  v14 = v13;
  v51.origin.x = v4;
  v51.origin.y = v6;
  v51.size.width = v8;
  v51.size.height = v10;
  Width = CGRectGetWidth(v51);
  v16 = (CGFloat *)MEMORY[0x1E0C9D648];
  v47 = v14;
  v17 = Width - v12 - v14;
  v18 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v52.origin.x = v4;
  v52.origin.y = v6;
  v52.size.width = v8;
  v52.size.height = v10;
  v44 = v17;
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v17, CGRectGetHeight(v52));
  v20 = v19;
  v22 = v21;
  v48 = v4;
  v49 = v10;
  v53.origin.x = v4;
  v50 = v8;
  v53.origin.y = v6;
  v53.size.width = v8;
  v53.size.height = v10;
  Height = CGRectGetHeight(v53);
  v54.origin.x = v12;
  v54.origin.y = v18;
  v54.size.width = v20;
  v54.size.height = v22;
  v24 = (Height - CGRectGetHeight(v54)) * 0.5;
  -[VUILabel setFrame:](self->_titleLabel, "setFrame:", v12, v24, v20, v22);
  if ((-[VUILabel isHidden](self->_subtitleLabel, "isHidden") & 1) == 0)
  {
    v55.origin.x = v4;
    v55.origin.y = v6;
    v55.size.width = v8;
    v55.size.height = v49;
    -[VUILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v44, CGRectGetHeight(v55));
    v43 = v26;
    v45 = v25;
    v56.origin.x = v4;
    v56.origin.y = v6;
    v56.size.width = v8;
    v56.size.height = v49;
    v27 = CGRectGetHeight(v56);
    v57.origin.x = v12;
    v57.origin.y = v24;
    v57.size.width = v20;
    v57.size.height = v22;
    v28 = CGRectGetHeight(v57);
    v58.origin.x = v12;
    v58.origin.y = v18;
    v58.size.width = v45;
    v58.size.height = v43;
    v29 = (v27 - (v28 + CGRectGetHeight(v58))) * 0.5;
    -[VUILabel setFrame:](self->_titleLabel, "setFrame:", v12, v29, v20, v22);
    v59.origin.x = v12;
    v59.origin.y = v29;
    v59.size.width = v20;
    v59.size.height = v22;
    -[VUILabel setFrame:](self->_subtitleLabel, "setFrame:", v12, v29 + CGRectGetHeight(v59), v45, v43);
  }
  v30 = *v16;
  -[UISwitch sizeToFit](self->_defaultsSwitch, "sizeToFit", *(_QWORD *)&v43);
  -[UISwitch bounds](self->_defaultsSwitch, "bounds");
  v32 = v31;
  v34 = v33;
  v60.origin.x = v4;
  v60.origin.y = v6;
  v60.size.width = v50;
  v60.size.height = v49;
  v35 = CGRectGetHeight(v60);
  v61.origin.x = v30;
  v46 = v30;
  v61.origin.y = v18;
  v61.size.width = v32;
  v61.size.height = v34;
  v36 = (v35 - CGRectGetHeight(v61)) * 0.5;
  v62.origin.x = v4;
  v62.origin.y = v6;
  v62.size.width = v50;
  v62.size.height = v49;
  v37 = CGRectGetWidth(v62) - v47;
  v63.origin.x = v30;
  v63.origin.y = v36;
  v63.size.width = v32;
  v63.size.height = v34;
  -[UISwitch setFrame:](self->_defaultsSwitch, "setFrame:", v37 - CGRectGetWidth(v63), v36, v32, v34);
  v64.origin.x = v48;
  v64.origin.y = v6;
  v64.size.width = v50;
  v64.size.height = v49;
  v38 = CGRectGetWidth(v64) - v47;
  v65.origin.x = v46;
  v65.origin.y = v18;
  v65.size.width = v32;
  v65.size.height = v34;
  v39 = v38 - CGRectGetWidth(v65);
  v66.origin.x = v48;
  v66.origin.y = v6;
  v66.size.width = v50;
  v66.size.height = v49;
  v40 = CGRectGetHeight(v66);
  v67.origin.x = v39;
  v67.origin.y = v18;
  v67.size.width = v32;
  v67.size.height = v34;
  -[UITextField setFrame:](self->_textField, "setFrame:", v39, (v40 - CGRectGetHeight(v67)) * 0.5, v32, v34);
  -[UISwitch setHidden:](self->_defaultsSwitch, "setHidden:", -[VUIDebugViewDefaults integerValueType](self->_defaults, "integerValueType"));
  -[UITextField setHidden:](self->_textField, "setHidden:", -[VUIDebugViewDefaults integerValueType](self->_defaults, "integerValueType") ^ 1);
  separatorView = self->_separatorView;
  -[VUIDebugCollectionViewDefaultsCell bounds](self, "bounds");
  v42 = CGRectGetHeight(v68) + -1.0;
  v69.origin.x = v48;
  v69.origin.y = v6;
  v69.size.width = v50;
  v69.size.height = v49;
  -[VUISeparatorView setFrame:](separatorView, "setFrame:", 0.0, v42, CGRectGetWidth(v69), 1.0);
}

- (void)_defaultsSwitchPressed:(id)a3
{
  -[VUIDebugViewDefaults toggleDefaultBoolValue](self->_defaults, "toggleDefaultBoolValue", a3);
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;

  objc_msgSend(a3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[VUIDebugViewDefaults setDefaultIntegerValue:](self->_defaults, "setDefaultIntegerValue:", objc_msgSend(v4, "integerValue"));

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
  return 1;
}

- (VUITextLayout)titleLayout
{
  return self->_titleLayout;
}

- (void)setTitleLayout:(id)a3
{
  objc_storeStrong((id *)&self->_titleLayout, a3);
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (VUITextLayout)subtitleLayout
{
  return self->_subtitleLayout;
}

- (void)setSubtitleLayout:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLayout, a3);
}

- (VUILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UISwitch)defaultsSwitch
{
  return self->_defaultsSwitch;
}

- (void)setDefaultsSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsSwitch, a3);
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
  objc_storeStrong((id *)&self->_textField, a3);
}

- (VUIDebugViewDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (VUISeparatorView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_defaultsSwitch, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLayout, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleLayout, 0);
}

@end
