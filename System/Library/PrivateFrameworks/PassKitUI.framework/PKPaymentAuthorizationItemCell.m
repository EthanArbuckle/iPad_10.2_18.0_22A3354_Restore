@implementation PKPaymentAuthorizationItemCell

- (PKPaymentAuthorizationItemCell)initWithLayout:(id)a3 reuseIdentifier:(id)a4
{
  id v7;
  PKPaymentAuthorizationItemCell *v8;
  PKPaymentAuthorizationItemCell *v9;
  void *v10;
  NSMutableArray *v11;
  NSMutableArray *valueViews;
  NSMutableArray *v13;
  NSMutableArray *constraints;
  objc_super v16;

  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentAuthorizationItemCell;
  v8 = -[PKPaymentAuthorizationItemCell initWithStyle:reuseIdentifier:](&v16, sel_initWithStyle_reuseIdentifier_, 0, a4);
  v9 = v8;
  if (v8)
  {
    -[PKPaymentAuthorizationItemCell setSelectionStyle:](v8, "setSelectionStyle:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentAuthorizationItemCell setBackgroundColor:](v9, "setBackgroundColor:", v10);

    objc_storeStrong((id *)&v9->_layout, a3);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    valueViews = v9->_valueViews;
    v9->_valueViews = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    constraints = v9->_constraints;
    v9->_constraints = v13;

    v9->_constraintsDirty = 1;
    v9->_showsDisclosure = 1;
    v9->_showsSeparator = 1;
    -[PKPaymentAuthorizationItemCell _createSubviews](v9, "_createSubviews");
  }

  return v9;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKPaymentAuthorizationItemCell;
  -[PKPaymentAuthorizationItemCell dealloc](&v2, sel_dealloc);
}

- (void)prepareForReuse
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentAuthorizationItemCell;
  -[PKTableViewCell prepareForReuse](&v12, sel_prepareForReuse);
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_constraints);
  -[NSMutableArray removeAllObjects](self->_constraints, "removeAllObjects");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = self->_valueViews;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "removeFromSuperview", (_QWORD)v8);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_valueViews, "removeAllObjects");
  -[PKPaymentAuthorizationItemCell setShowsDisclosure:](self, "setShowsDisclosure:", 1);
  -[PKPaymentAuthorizationItemCell setShowsSeparator:](self, "setShowsSeparator:", 1);
}

- (void)_createSubviews
{
  UILabel *v3;
  UILabel *labelView;
  double v5;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  double v10;
  UIImageView *v11;
  UIImageView *labelImageView;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  UIImageView *v28;
  UIImageView *arrowView;
  void *v30;
  void *v31;
  void *v32;
  UIImageView *v33;
  UIImageView *alertView;
  UIView *v35;
  UIView *separatorView;
  UIView *v37;
  void *v38;
  id v39;

  -[PKPaymentAuthorizationItemCell contentView](self, "contentView");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  labelView = self->_labelView;
  self->_labelView = v3;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_labelView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setOpaque:](self->_labelView, "setOpaque:", 0);
  -[UILabel setNumberOfLines:](self->_labelView, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](self->_labelView, "setLineBreakMode:", 0);
  LODWORD(v5) = 1.0;
  -[UILabel _setHyphenationFactor:](self->_labelView, "_setHyphenationFactor:", v5);
  v6 = self->_labelView;
  PKConstrainedAuthorizationViewCellLabelSmallFont((void *)*MEMORY[0x1E0DC48D0], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v6, "setFont:", v7);

  v8 = self->_labelView;
  PKAuthorizationViewLabelColor();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v8, "setTextColor:", v9);

  LODWORD(v10) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_labelView, "setContentCompressionResistancePriority:forAxis:", 1, v10);
  objc_msgSend(v39, "addSubview:", self->_labelView);
  v11 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
  labelImageView = self->_labelImageView;
  self->_labelImageView = v11;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_labelImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setOpaque:](self->_labelImageView, "setOpaque:", 0);
  -[UIImageView setAccessibilityIgnoresInvertColors:](self->_labelImageView, "setAccessibilityIgnoresInvertColors:", 1);
  LODWORD(v13) = 1132068864;
  -[UIImageView setContentHuggingPriority:forAxis:](self->_labelImageView, "setContentHuggingPriority:forAxis:", 1, v13);
  LODWORD(v14) = 1132068864;
  -[UIImageView setContentHuggingPriority:forAxis:](self->_labelImageView, "setContentHuggingPriority:forAxis:", 0, v14);
  objc_msgSend(v39, "addSubview:", self->_labelImageView);
  UIImageGetTableNext();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_flatImageWithColor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "imageFlippedForRightToLeftLayoutDirection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  UIImageGetTableNextSelected();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_flatImageWithColor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "imageFlippedForRightToLeftLayoutDirection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_alloc(MEMORY[0x1E0DC3890]);
  v24 = *MEMORY[0x1E0C9D648];
  v25 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v26 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v27 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v28 = (UIImageView *)objc_msgSend(v23, "initWithFrame:", *MEMORY[0x1E0C9D648], v25, v26, v27);
  arrowView = self->_arrowView;
  self->_arrowView = v28;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_arrowView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setContentMode:](self->_arrowView, "setContentMode:", 4);
  -[UIImageView setImage:](self->_arrowView, "setImage:", v18);
  -[UIImageView setHighlightedImage:](self->_arrowView, "setHighlightedImage:", v22);
  objc_msgSend(v39, "addSubview:", self->_arrowView);
  PKUIImageNamed(CFSTR("Payment_AlertAccessory"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "pkui_osloErrorColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "_flatImageWithColor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v24, v25, v26, v27);
  alertView = self->_alertView;
  self->_alertView = v33;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_alertView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setContentMode:](self->_alertView, "setContentMode:", 4);
  -[UIImageView setImage:](self->_alertView, "setImage:", v32);
  objc_msgSend(v39, "addSubview:", self->_alertView);
  v35 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  separatorView = self->_separatorView;
  self->_separatorView = v35;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_separatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v37 = self->_separatorView;
  PKAuthorizationSeparatorColor();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v37, "setBackgroundColor:", v38);

  objc_msgSend(v39, "addSubview:", self->_separatorView);
}

- (id)_createValueView
{
  id v3;
  double v4;
  double v5;
  double v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v4) = 1132068864;
  objc_msgSend(v3, "setContentCompressionResistancePriority:forAxis:", 0, v4);
  LODWORD(v5) = 1148846080;
  objc_msgSend(v3, "setContentCompressionResistancePriority:forAxis:", 1, v5);
  LODWORD(v6) = 1148846080;
  objc_msgSend(v3, "setContentHuggingPriority:forAxis:", 1, v6);
  objc_msgSend(v3, "setNumberOfLines:", 0);
  objc_msgSend(v3, "setOpaque:", 0);
  -[NSMutableArray addObject:](self->_valueViews, "addObject:", v3);
  -[PKPaymentAuthorizationItemCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v3);

  return v3;
}

- (id)_applyStylingToValueString:(id)a3 defaultColor:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t, uint64_t);
  void *v16;
  id v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  v7 = objc_msgSend(v6, "length");
  v18[0] = *MEMORY[0x1E0DC1138];
  PKConstrainedAuthorizationViewCellLabelSmallFont((void *)*MEMORY[0x1E0DC48D0], 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = *MEMORY[0x1E0DC1140];
  v19[0] = v8;
  v19[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAttributes:range:", v9, 0, v7);

  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __74__PKPaymentAuthorizationItemCell__applyStylingToValueString_defaultColor___block_invoke;
  v16 = &unk_1E3E66260;
  v17 = v6;
  v10 = v6;
  objc_msgSend(v10, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, &v13);
  v11 = (void *)objc_msgSend(v10, "copy", v13, v14, v15, v16);

  return v11;
}

void __74__PKPaymentAuthorizationItemCell__applyStylingToValueString_defaultColor___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  float v25;
  uint64_t v26;
  _BOOL4 v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0D6ACC8];
  v8 = a2;
  objc_msgSend(v8, "PKNumberForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "PKNumberForKey:", *MEMORY[0x1E0D6ACE8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D6ACD8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "PKDictionaryForKey:", *MEMORY[0x1E0D6ACD0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "BOOLValue"))
  {
    v13 = *(void **)(a1 + 32);
    v41 = *MEMORY[0x1E0DC1138];
    PKConstrainedAuthorizationViewCellLabelSmallFont((void *)*MEMORY[0x1E0DC48D0], 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAttributes:range:", v15, a3, a4);

  }
  if (objc_msgSend(v10, "BOOLValue"))
  {
    v16 = *(void **)(a1 + 32);
    v39 = *MEMORY[0x1E0DC1140];
    PKAuthorizationViewLabelColor();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAttributes:range:", v18, a3, a4);

  }
  if (!v12)
  {
    if (!v11)
      goto LABEL_22;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_22;
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v11);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
      goto LABEL_22;
    goto LABEL_17;
  }
  v19 = v11;
  v20 = a3;
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D6ACF0]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D6ACE0]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
LABEL_15:
    v23 = 0;
    goto LABEL_16;
  }
  objc_opt_class();
  v23 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0 && v22)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(v21, "floatValue");
      objc_msgSend(v24, "imageWithData:scale:", v22, v25);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_16:

  a3 = v20;
  v11 = v19;
  if (!v23)
    goto LABEL_22;
LABEL_17:
  v36 = v11;
  v26 = a3;
  v27 = UIAccessibilityDarkerSystemColorsEnabled();
  if (v27)
  {
    objc_msgSend(v23, "imageWithRenderingMode:", 2);
    v28 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v28;
  }
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC12B0]), "initWithData:ofType:", 0, 0);
  objc_msgSend(v29, "setImage:", v23);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withAttributedString:", v26, a4, v30);
  if (v27)
  {
    v31 = *(void **)(a1 + 32);
    v37 = *MEMORY[0x1E0DC1140];
    PKAuthorizationViewLabelColor();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = a4;
    v35 = (void *)v33;
    objc_msgSend(v31, "addAttributes:range:", v33, v26, v34);

  }
  v11 = v36;
LABEL_22:

}

- (NSAttributedString)label
{
  return -[UILabel attributedText](self->_labelView, "attributedText");
}

- (void)setLabel:(id)a3
{
  -[UILabel setAttributedText:](self->_labelView, "setAttributedText:", a3);
  -[UILabel setHidden:](self->_labelView, "setHidden:", 0);
  -[UIImageView setImage:](self->_labelImageView, "setImage:", 0);
  -[UIImageView setHidden:](self->_labelImageView, "setHidden:", 1);
  self->_constraintsDirty = 1;
  -[PKPaymentAuthorizationItemCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (UIImage)labelImage
{
  return -[UIImageView image](self->_labelImageView, "image");
}

- (void)setLabelImage:(id)a3
{
  -[UIImageView setImage:](self->_labelImageView, "setImage:", a3);
  -[UIImageView setHidden:](self->_labelImageView, "setHidden:", 0);
  -[UIImageView sizeToFit](self->_labelImageView, "sizeToFit");
  -[UILabel setText:](self->_labelView, "setText:", 0);
  -[UILabel setHidden:](self->_labelView, "setHidden:", 1);
  self->_constraintsDirty = 1;
  -[PKPaymentAuthorizationItemCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setAccessibilityLabel:(id)a3
{
  UIImageView *labelImageView;
  id v5;

  labelImageView = self->_labelImageView;
  v5 = a3;
  -[UIImageView setAccessibilityLabel:](labelImageView, "setAccessibilityLabel:", v5);
  -[UILabel setAccessibilityLabel:](self->_labelView, "setAccessibilityLabel:", v5);

}

- (void)setShowsDisclosure:(BOOL)a3
{
  if (((!self->_showsDisclosure ^ a3) & 1) == 0)
  {
    self->_showsDisclosure = a3;
    -[UIImageView setHidden:](self->_arrowView, "setHidden:", !a3);
    self->_constraintsDirty = 1;
    -[PKPaymentAuthorizationItemCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setShowsSeparator:(BOOL)a3
{
  if (((!self->_showsSeparator ^ a3) & 1) == 0)
  {
    self->_showsSeparator = a3;
    -[UIView setHidden:](self->_separatorView, "setHidden:", !a3);
    self->_constraintsDirty = 1;
    -[PKPaymentAuthorizationItemCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (id)colorForValueType:(unint64_t)a3
{
  void *v3;

  if (a3 == 2)
  {
    PKAuthorizationViewLabelColor();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    PKAuthorizationViewPlaceholderValueLabelColor();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    PKAuthorizationViewValueLabelColor();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)addValue:(id)a3
{
  return -[PKPaymentAuthorizationItemCell addValue:type:](self, "addValue:type:", a3, 0);
}

- (id)addValue:(id)a3 type:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;

  v6 = a3;
  -[PKPaymentAuthorizationItemCell _createValueView](self, "_createValueView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationItemCell colorForValueType:](self, "colorForValueType:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationItemCell _applyStylingToValueString:defaultColor:](self, "_applyStylingToValueString:defaultColor:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAttributedText:", v9);
  v10 = 1;
  if (a4 != 1)
    v10 = !self->_showsDisclosure;
  -[UIImageView setHidden:](self->_arrowView, "setHidden:", v10);
  -[UIImageView setHidden:](self->_alertView, "setHidden:", a4 != 1);
  self->_constraintsDirty = 1;
  -[PKPaymentAuthorizationItemCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  return v7;
}

- (void)setCentered:(BOOL)a3
{
  if (((!self->_centered ^ a3) & 1) == 0)
  {
    self->_centered = a3;
    self->_constraintsDirty = 1;
    -[PKPaymentAuthorizationItemCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)updateConstraints
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  NSMutableArray *constraints;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableArray *v24;
  void *v25;
  void *v26;
  NSMutableArray *v27;
  void *v28;
  void *v29;
  NSMutableArray *v30;
  void *v31;
  void *v32;
  void *v33;
  NSMutableArray *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  BOOL v39;
  void *v40;
  uint64_t v41;
  BOOL v42;
  BOOL centered;
  double v45;
  double v46;
  UILabel *labelView;
  uint64_t v48;
  NSMutableArray *v49;
  void *v50;
  void *v51;
  NSMutableArray *v52;
  void *v53;
  void *v54;
  NSMutableArray *v55;
  void *v56;
  void *v57;
  void *v58;
  UILabel *v59;
  UILabel *v60;
  NSMutableArray *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSMutableArray *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  NSMutableArray *v78;
  void *v79;
  NSMutableArray *v80;
  void *v81;
  NSMutableArray *v82;
  void *v83;
  void *v84;
  NSMutableArray *v85;
  void *v86;
  void *v87;
  NSMutableArray *v88;
  uint64_t v89;
  void *v90;
  uint64_t i;
  void *v92;
  void *v93;
  NSMutableArray *v94;
  void *v95;
  void *v96;
  NSMutableArray *v97;
  void *v98;
  void *v99;
  NSMutableArray *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  double v106;
  double v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  double v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  double v116;
  void *v117;
  NSMutableArray *v118;
  void *v119;
  void *v120;
  double v121;
  int v122;
  UILabel *v123;
  void *v124;
  uint64_t v125;
  id v126;
  void *v127;
  void *v128;
  void *v129;
  objc_super v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  objc_super v135;
  _BYTE v136[128];
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  if (!self->_constraintsDirty)
  {
    v135.receiver = self;
    v135.super_class = (Class)PKPaymentAuthorizationItemCell;
    -[PKPaymentAuthorizationItemCell updateConstraints](&v135, sel_updateConstraints);
    return;
  }
  self->_constraintsDirty = 0;
  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_constraints);
  -[NSMutableArray removeAllObjects](self->_constraints, "removeAllObjects");
  v122 = -[PKPaymentAuthorizationItemCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[PKPaymentAuthorizationItemCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationLayout contentHorizontalMargin](self->_layout, "contentHorizontalMargin");
  v5 = v4;
  PKConstrainedAuthorizationViewCellLabelSmallFont((void *)*MEMORY[0x1E0DC48D0], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_bodyLeading");

  objc_msgSend(v3, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -v5;
  objc_msgSend(v3, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  constraints = self->_constraints;
  -[UIView heightAnchor](self->_separatorView, "heightAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToConstant:", PKUIPixelLength());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](constraints, "addObject:", v12);

  v13 = self->_constraints;
  -[UIView bottomAnchor](self->_separatorView, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v13, "addObject:", v16);

  v17 = self->_constraints;
  -[UIView leadingAnchor](self->_separatorView, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = v7;
  objc_msgSend(v7, "constraintEqualToAnchor:constant:", v18, -v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v17, "addObject:", v19);

  v20 = self->_constraints;
  -[UIView trailingAnchor](self->_separatorView, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v9, 0.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v20, "addObject:", v22);

  -[UIImageView centerYAnchor](self->_arrowView, "centerYAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = self->_constraints;
  -[UIImageView trailingAnchor](self->_arrowView, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = v9;
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v9, -v5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v24, "addObject:", v26);

  v27 = self->_constraints;
  v124 = v3;
  objc_msgSend(v3, "centerYAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v27, "addObject:", v29);

  v30 = self->_constraints;
  -[UIImageView centerXAnchor](self->_alertView, "centerXAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView centerXAnchor](self->_arrowView, "centerXAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v30, "addObject:", v33);

  v34 = self->_constraints;
  -[UIImageView centerYAnchor](self->_alertView, "centerYAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v23);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v34, "addObject:", v36);

  if (!-[UIImageView isHidden](self->_arrowView, "isHidden")
    || (-[UIImageView isHidden](self->_alertView, "isHidden") & 1) == 0)
  {
    -[UIImageView leadingAnchor](self->_arrowView, "leadingAnchor");
    v37 = objc_claimAutoreleasedReturnValue();

    v129 = (void *)v37;
  }

  v125 = -[NSMutableArray count](self->_valueViews, "count");
  -[UILabel attributedText](self->_labelView, "attributedText");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = 1;
  }
  else
  {
    -[UIImageView image](self->_labelImageView, "image");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v40 != 0;

  }
  if (!v125)
  {
    v42 = 0;
LABEL_16:
    centered = self->_centered;
    goto LABEL_17;
  }
  v41 = -[NSMutableArray indexOfObjectPassingTest:](self->_valueViews, "indexOfObjectPassingTest:", &__block_literal_global_216);
  v42 = v41 != 0x7FFFFFFFFFFFFFFFLL;
  if (v41 == 0x7FFFFFFFFFFFFFFFLL || !v39)
    goto LABEL_16;
  centered = 0;
  v42 = 1;
LABEL_17:
  objc_msgSend(v124, "topAnchor");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationLayout valueLeftMargin](self->_layout, "valueLeftMargin");
  v46 = v45;
  labelView = self->_labelView;
  if (centered)
  {
    -[UILabel setTextAlignment:](labelView, "setTextAlignment:", 1);
    CreateViewXCenteringConstraints(self->_constraints, self->_labelView, v128, v129, -v5, -v5);
  }
  else
  {
    if (v122)
      v48 = 0;
    else
      v48 = 2;
    -[UILabel setTextAlignment:](labelView, "setTextAlignment:", v48);
    v49 = self->_constraints;
    -[UILabel leadingAnchor](self->_labelView, "leadingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "constraintEqualToAnchor:constant:", v50, -v5);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v49, "addObject:", v51);

    v52 = self->_constraints;
    -[UILabel trailingAnchor](self->_labelView, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:constant:", v128, v46 - v5);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v52, "addObject:", v54);

  }
  v55 = self->_constraints;
  -[UILabel firstBaselineAnchor](self->_labelView, "firstBaselineAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  PKFloatCeilToPixel();
  objc_msgSend(v56, "constraintEqualToAnchor:constant:", v127);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v55, "addObject:", v57);

  -[UILabel lastBaselineAnchor](self->_labelView, "lastBaselineAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "addObject:", v58);

  if (v42)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_valueViews, "objectAtIndexedSubscript:", 0);
    v59 = (UILabel *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v59 = self->_labelView;
  }
  v60 = v59;
  v61 = self->_constraints;
  -[UIImageView topAnchor](self->_labelImageView, "topAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel firstBaselineAnchor](v60, "firstBaselineAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = v60;
  -[UILabel font](v60, "font");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "capHeight");
  PKFloatCeilToPixel();
  objc_msgSend(v62, "constraintEqualToAnchor:constant:", v63);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v61, "addObject:", v65);

  v66 = self->_constraints;
  if (centered)
  {
    CreateViewXCenteringConstraints(self->_constraints, self->_labelImageView, v128, v129, -v5, -v5);
  }
  else
  {
    -[UIImageView trailingAnchor](self->_labelImageView, "trailingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](self->_labelView, "trailingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v66, "addObject:", v69);

  }
  -[UIImageView image](self->_labelImageView, "image");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "size");
  if (v70 && (v73 = v71, v71 > 0.0) && (v74 = v72, v72 > 0.0) && (v75 = v46 - v5 - v5, v75 > 0.0))
  {
    -[UIImageView widthAnchor](self->_labelImageView, "widthAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView heightAnchor](self->_labelImageView, "heightAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = self->_constraints;
    objc_msgSend(v76, "constraintEqualToAnchor:multiplier:", v77, v73 / v74);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v78, "addObject:", v79);

    v80 = self->_constraints;
    objc_msgSend(v76, "constraintLessThanOrEqualToConstant:", v75);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v80, "addObject:", v81);

    v82 = self->_constraints;
    objc_msgSend(v77, "constraintLessThanOrEqualToConstant:", 40.0);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v82, "addObject:", v83);

    -[UIImageView bottomAnchor](self->_labelImageView, "bottomAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "addObject:", v84);

  }
  else
  {
    v85 = self->_constraints;
    -[UIImageView widthAnchor](self->_labelImageView, "widthAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "constraintEqualToConstant:", 0.0);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v85, "addObject:", v87);

    v88 = self->_constraints;
    -[UIImageView heightAnchor](self->_labelImageView, "heightAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToConstant:", 0.0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v88, "addObject:", v77);
  }

  -[UILabel topAnchor](self->_labelView, "topAnchor");
  v89 = objc_claimAutoreleasedReturnValue();
  v90 = (void *)v89;
  if (v125)
  {
    for (i = 0; i != v125; ++i)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_valueViews, "objectAtIndexedSubscript:", i);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = v92;
      if (centered)
      {
        objc_msgSend(v92, "setTextAlignment:", 1);
        CreateViewXCenteringConstraints(self->_constraints, v93, v128, v129, v8, v8);
      }
      else
      {
        objc_msgSend(v92, "setTextAlignment:", 4);
        v94 = self->_constraints;
        objc_msgSend(v93, "leadingAnchor");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "constraintEqualToAnchor:constant:", v95, -v46);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v94, "addObject:", v96);

        v97 = self->_constraints;
        objc_msgSend(v93, "trailingAnchor");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "constraintLessThanOrEqualToAnchor:constant:", v129, v8);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v97, "addObject:", v99);

      }
      v100 = self->_constraints;
      objc_msgSend(v93, "topAnchor");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "constraintEqualToAnchor:", v90);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v100, "addObject:", v102);

      objc_msgSend(v93, "bottomAnchor");
      v103 = (void *)objc_claimAutoreleasedReturnValue();

      if (v125 - 1 == i)
      {
        objc_msgSend(v93, "lastBaselineAnchor");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "addObject:", v104);

      }
      v90 = v103;
    }
  }
  else
  {
    v103 = (void *)v89;
  }

  if (-[UIView isHidden](self->_separatorView, "isHidden"))
    objc_msgSend(v124, "bottomAnchor");
  else
    -[UIView topAnchor](self->_separatorView, "topAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  PKFloatCeilToPixel();
  v107 = v106;
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  v134 = 0u;
  v108 = v126;
  v109 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v131, v136, 16);
  if (v109)
  {
    v110 = v109;
    v111 = 0;
    v112 = -v107;
    v113 = *(_QWORD *)v132;
    do
    {
      v114 = 0;
      v115 = v111;
      do
      {
        if (*(_QWORD *)v132 != v113)
          objc_enumerationMutation(v108);
        objc_msgSend(*(id *)(*((_QWORD *)&v131 + 1) + 8 * v114), "constraintLessThanOrEqualToAnchor:constant:", v105, v112);
        v111 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v116) = 1148829696;
        objc_msgSend(v111, "setPriority:", v116);
        -[NSMutableArray addObject:](self->_constraints, "addObject:", v111);
        ++v114;
        v115 = v111;
      }
      while (v110 != v114);
      v110 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v131, v136, 16);
    }
    while (v110);

  }
  objc_msgSend(v124, "heightAnchor");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = self->_constraints;
  objc_msgSend(v117, "constraintGreaterThanOrEqualToConstant:", 44.0);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v118, "addObject:", v119);

  objc_msgSend(v117, "constraintEqualToConstant:", 0.0);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v121) = 1148813312;
  objc_msgSend(v120, "setPriority:", v121);
  -[NSMutableArray addObject:](self->_constraints, "addObject:", v120);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_constraints);
  v130.receiver = self;
  v130.super_class = (Class)PKPaymentAuthorizationItemCell;
  -[PKPaymentAuthorizationItemCell updateConstraints](&v130, sel_updateConstraints);

}

BOOL __51__PKPaymentAuthorizationItemCell_updateConstraints__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "attributedText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (BOOL)showsDisclosure
{
  return self->_showsDisclosure;
}

- (BOOL)showsSeparator
{
  return self->_showsSeparator;
}

- (BOOL)isCentered
{
  return self->_centered;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_labelImageView, 0);
  objc_storeStrong((id *)&self->_alertView, 0);
  objc_storeStrong((id *)&self->_arrowView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_valueViews, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
