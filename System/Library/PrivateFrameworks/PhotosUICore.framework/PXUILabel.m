@implementation PXUILabel

- (PXUILabel)initWithCoder:(id)a3
{
  PXUILabel *v3;
  PXUILabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXUILabel;
  v3 = -[PXUILabel initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[PXUILabel _commonPXMemoriesLabelInitialization](v3, "_commonPXMemoriesLabelInitialization");
  return v4;
}

- (PXUILabel)initWithFrame:(CGRect)a3
{
  PXUILabel *v3;
  PXUILabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXUILabel;
  v3 = -[PXUILabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PXUILabel _commonPXMemoriesLabelInitialization](v3, "_commonPXMemoriesLabelInitialization");
  return v4;
}

- (void)setText:(id)a3
{
  NSString *v4;
  NSString *text;

  if (self->_text != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    text = self->_text;
    self->_text = v4;

    -[PXUILabel _configureLabel](self, "_configureLabel");
  }
}

- (void)setSpec:(id)a3
{
  PXLabelSpec *v5;
  PXLabelSpec *v6;

  v5 = (PXLabelSpec *)a3;
  if (self->_spec != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    -[PXUILabel _configureLabel](self, "_configureLabel");
    v5 = v6;
  }

}

- (void)_commonPXMemoriesLabelInitialization
{
  UIVisualEffectView *visualEffectView;
  PXUILabel *v4;
  PXUILabel *v5;
  id obj;

  -[PXUILabel setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  obj = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(obj, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(obj, "setMinimumScaleFactor:", 0.5);
  objc_msgSend(obj, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_storeStrong((id *)&self->_label, obj);
  visualEffectView = self->_visualEffectView;
  if (visualEffectView)
  {
    -[UIVisualEffectView contentView](visualEffectView, "contentView");
    v4 = (PXUILabel *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self;
  }
  v5 = v4;
  -[PXUILabel addSubview:](v4, "addSubview:", obj);
  -[PXUILabel setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (void)_configureLabel
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  int64_t v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  id v23;

  -[PXUILabel spec](self, "spec");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  -[PXUILabel _configuredText](self, "_configuredText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    -[UILabel text](self->_label, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqualToString:", v5);

    if ((v6 & 1) == 0)
      -[UILabel setText:](self->_label, "setText:", v4);
    objc_msgSend(v23, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel font](self->_label, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if ((v9 & 1) == 0)
      -[UILabel setFont:](self->_label, "setFont:", v7);
    v10 = objc_msgSend(v23, "verticalAlignment");
    if (v10 != self->_verticalAlignment)
    {
      self->_verticalAlignment = v10;
      -[PXUILabel setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    }
    objc_msgSend(v23, "contentInsets");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
    {
      self->_contentInsets.top = v12;
      self->_contentInsets.left = v14;
      self->_contentInsets.bottom = v16;
      self->_contentInsets.right = v18;
      -[PXUILabel setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    }
    v19 = objc_msgSend(v23, "numberOfLines");
    if (v19 != -[UILabel numberOfLines](self->_label, "numberOfLines"))
      -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", v19);
    -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", objc_msgSend(v23, "textAlignment"));
    objc_msgSend(v23, "textColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel textColor](self->_label, "textColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if ((v22 & 1) == 0)
      -[UILabel setTextColor:](self->_label, "setTextColor:", v20);

  }
  else
  {
    -[UILabel setText:](self->_label, "setText:", 0);
  }

}

- (void)updateConstraints
{
  int64_t verticalAlignment;
  id v4;
  UILabel *v5;
  double v6;
  double v7;
  double top;
  double left;
  double bottom;
  double right;
  void *visualEffectView;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSArray *v30;
  NSArray *labelLayoutConstraints;
  id v32;
  objc_super v33;
  _QWORD v34[5];
  _QWORD v35[7];

  v35[5] = *MEMORY[0x1E0C80C00];
  verticalAlignment = self->_verticalAlignment;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = self->_label;
  LODWORD(v6) = 1132068864;
  -[UILabel setContentCompressionResistancePriority:forAxis:](v5, "setContentCompressionResistancePriority:forAxis:", 1, v6);
  LODWORD(v7) = 1132068864;
  -[UILabel setContentCompressionResistancePriority:forAxis:](v5, "setContentCompressionResistancePriority:forAxis:", 0, v7);
  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  visualEffectView = self->_visualEffectView;
  if (!visualEffectView)
    visualEffectView = self;
  v32 = visualEffectView;
  v34[0] = CFSTR("leftInset");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", left);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v13;
  v34[1] = CFSTR("topInset");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", top);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v14;
  v34[2] = CFSTR("rightInset");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", right);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v15;
  v34[3] = CFSTR("bottomInset");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", bottom);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = CFSTR("marginPriority");
  v35[3] = v16;
  v35[4] = &unk_1E53F1228;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (verticalAlignment)
  {
    if (verticalAlignment == 1)
    {
      v18 = v32;
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 11, 0, v32, 4, 1.0, -self->_contentInsets.bottom);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v26);

    }
    else
    {
      v18 = v32;
      if (verticalAlignment != 2)
        goto LABEL_10;
      v19 = (void *)MEMORY[0x1E0CB3718];
      _NSDictionaryOfVariableBindings(CFSTR("label"), v5, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(topInset@marginPriority)-[label(label@marginPriority)]-(>=bottomInset@marginPriority)-|"), 2048, v17, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObjectsFromArray:", v21);

    }
    LODWORD(v22) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v5, "setContentHuggingPriority:forAxis:", 1, v22);
  }
  else
  {
    v23 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("label"), v5, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(topInset@marginPriority)-[label(label@marginPriority)]-(bottomInset@marginPriority)-|"), 2048, v17, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v25);

    v18 = v32;
  }
LABEL_10:
  v27 = (void *)MEMORY[0x1E0CB3718];
  _NSDictionaryOfVariableBindings(CFSTR("label"), v5, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(leftInset@marginPriority)-[label(label@marginPriority)]-(rightInset@marginPriority)-|"), 0, v17, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v29);

  if (self->_labelLayoutConstraints)
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v4);
  v30 = (NSArray *)objc_msgSend(v4, "copy");
  labelLayoutConstraints = self->_labelLayoutConstraints;
  self->_labelLayoutConstraints = v30;

  v33.receiver = self;
  v33.super_class = (Class)PXUILabel;
  -[PXUILabel updateConstraints](&v33, sel_updateConstraints);

}

- (id)_configuredText
{
  void *v3;
  void *v4;
  void *v5;

  -[PXUILabel text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUILabel spec](self, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_stringByApplyingCapitalization:", objc_msgSend(v4, "capitalization"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)text
{
  return self->_text;
}

- (PXLabelSpec)spec
{
  return self->_spec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_labelLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
