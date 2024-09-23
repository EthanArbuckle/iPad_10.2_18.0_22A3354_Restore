@implementation PKPassFieldView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UILabel *valueLabel;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGSize result;

  if (self->_needsRecalculation)
  {
    height = a3.height;
    width = a3.width;
    -[PKPassFieldView _labelAttributedStringForColorProfile:](self, "_labelAttributedStringForColorProfile:", self->_colorProfile);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PKPassFieldView _shouldDisplayLabel](self, "_shouldDisplayLabel"))
    {
      -[UILabel setAttributedText:](self->_labelLabel, "setAttributedText:", v6);
      -[UILabel sizeToFit](self->_labelLabel, "sizeToFit");
      -[UILabel frame](self->_labelLabel, "frame");
      v8 = v7;
      v10 = v9;
    }
    else
    {
      v8 = *MEMORY[0x1E0C9D820];
      v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      -[PKPassFieldTemplate setVerticalPadding:](self->_fieldTemplate, "setVerticalPadding:", 0.0);
    }
    valueLabel = self->_valueLabel;
    -[PKPassFieldView _valueAttributedStringForColorProfile:](self, "_valueAttributedStringForColorProfile:", self->_colorProfile);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](valueLabel, "setAttributedText:", v12);

    -[UILabel sizeToFit](self->_valueLabel, "sizeToFit");
    -[UILabel frame](self->_valueLabel, "frame");
    v14 = v13;
    v16 = v15;
    -[PKPassFieldTemplate verticalPadding](self->_fieldTemplate, "verticalPadding");
    v18 = height - v10 - v17;
    if (v14 > width && -[PKPassFieldTemplate valueCanWrap](self->_fieldTemplate, "valueCanWrap"))
    {
      -[UILabel attributedText](self->_valueLabel, "attributedText");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "boundingRectWithSize:options:context:", 1, 0, width, 3.40282347e38);

      PKSizeCeilToPixel();
      if (v21 > v18)
        -[PKPassFieldView _resizeMultiLineValueFontForAvailableSize:](self, "_resizeMultiLineValueFontForAvailableSize:", width, v18);
      v14 = v20;
      v16 = v21;
    }
    -[UILabel setFrame:](self->_labelLabel, "setFrame:", 0.0, 0.0, v8, v10);
    if (v16 >= v18)
      v22 = v18;
    else
      v22 = v16;
    -[UILabel setFrame:](self->_valueLabel, "setFrame:", 0.0, 0.0, v14, v22);
    if (v8 <= v14)
      v23 = v14;
    else
      v23 = v8;
    -[PKPassFieldTemplate verticalPadding](self->_fieldTemplate, "verticalPadding");
    self->_cachedSize.width = v23;
    self->_cachedSize.height = v10 + v16 + v24;
    self->_needsRecalculation = 0;

  }
  v25 = self->_cachedSize.width;
  v26 = self->_cachedSize.height;
  result.height = v26;
  result.width = v25;
  return result;
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
  double v10;
  _BOOL4 v11;
  _BOOL4 v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat rect;
  CGFloat recta;
  objc_super v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v53.receiver = self;
  v53.super_class = (Class)PKPassFieldView;
  -[PKPassFieldView layoutSubviews](&v53, sel_layoutSubviews);
  -[PKPassFieldView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[PKPassFieldTemplate valueSignificant](self->_fieldTemplate, "valueSignificant");
  v12 = -[PKPassFieldView _shouldDisplayLabel](self, "_shouldDisplayLabel");
  -[PKPassFieldTemplate verticalPadding](self->_fieldTemplate, "verticalPadding");
  v14 = v13;
  if (v11)
  {
    -[UILabel frame](self->_valueLabel, "frame");
    rect = fmax(v10, v25);
    PKSizeAlignedInRect();
    v26 = v8;
    v27 = v4;
    v28 = v14;
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    -[UILabel setFrame:](self->_valueLabel, "setFrame:");
    v56.origin.x = v30;
    v14 = v28;
    v4 = v27;
    v8 = v26;
    v56.origin.y = v32;
    v56.size.width = v34;
    v56.size.height = v36;
    v37 = v14 + CGRectGetMaxY(v56);
    v57.origin.x = v4;
    v57.origin.y = v6;
    v57.size.width = v26;
    v57.size.height = rect;
    v10 = CGRectGetMaxY(v57) - v37;
    v6 = v37;
    if (!v12)
    {
LABEL_3:
      if (v11)
        return;
      goto LABEL_4;
    }
  }
  else if (!v12)
  {
    goto LABEL_3;
  }
  -[UILabel frame](self->_labelLabel, "frame");
  v39 = fmax(v10, v38);
  PKSizeAlignedInRect();
  v41 = v40;
  recta = v8;
  v42 = v4;
  v43 = v14;
  v45 = v44;
  v47 = v46;
  v49 = v48;
  -[UILabel setFrame:](self->_labelLabel, "setFrame:");
  v58.origin.x = v41;
  v58.origin.y = v45;
  v58.size.width = v47;
  v58.size.height = v49;
  v50 = v43 + CGRectGetMaxY(v58);
  v4 = v42;
  v8 = recta;
  v59.origin.x = v4;
  v59.origin.y = v6;
  v59.size.width = recta;
  v59.size.height = v39;
  v10 = CGRectGetMaxY(v59) - v50;
  v6 = v50;
  if (v11)
    return;
LABEL_4:
  -[UILabel frame](self->_valueLabel, "frame");
  v16 = fmax(v10, v15);
  PKSizeAlignedInRect();
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[UILabel setFrame:](self->_valueLabel, "setFrame:");
  v54.origin.x = v18;
  v54.origin.y = v20;
  v54.size.width = v22;
  v54.size.height = v24;
  CGRectGetMaxY(v54);
  v55.origin.x = v4;
  v55.origin.y = v6;
  v55.size.width = v8;
  v55.size.height = v16;
  CGRectGetMaxY(v55);
}

- (UILabel)labelLabel
{
  return self->_labelLabel;
}

- (PKPassFieldView)initWithField:(id)a3 fieldTemplate:(id)a4
{
  id v6;
  id v7;
  PKPassFieldView *v8;
  UILabel *v9;
  UILabel *labelLabel;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  UILabel *valueLabel;
  UILabel *v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKPassFieldView;
  v8 = -[PKPassFieldView init](&v18, sel_init);
  if (v8)
  {
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    labelLabel = v8->_labelLabel;
    v8->_labelLabel = v9;

    v11 = v8->_labelLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v11, "setBackgroundColor:", v12);

    -[UILabel setAccessibilityIdentifier:](v8->_labelLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67CC8]);
    -[PKPassFieldView addSubview:](v8, "addSubview:", v8->_labelLabel);
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    valueLabel = v8->_valueLabel;
    v8->_valueLabel = v13;

    v15 = v8->_valueLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v15, "setBackgroundColor:", v16);

    -[UILabel setAccessibilityIdentifier:](v8->_valueLabel, "setAccessibilityIdentifier:", *MEMORY[0x1E0D681B8]);
    -[PKPassFieldView addSubview:](v8, "addSubview:", v8->_valueLabel);
    -[PKPassFieldView setField:](v8, "setField:", v6);
    -[PKPassFieldView setFieldTemplate:](v8, "setFieldTemplate:", v7);
    -[PKPassFieldView invalidateCachedFieldSize](v8, "invalidateCachedFieldSize");
    -[PKPassFieldView setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67BE0]);
  }

  return v8;
}

- (void)setFieldTemplate:(id)a3
{
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  PKPassFieldTemplate *v8;

  v8 = (PKPassFieldTemplate *)a3;
  if (self->_fieldTemplate != v8)
    objc_storeStrong((id *)&self->_fieldTemplate, a3);
  -[UILabel setHidden:](self->_labelLabel, "setHidden:", -[PKPassFieldTemplate suppressesLabel](v8, "suppressesLabel"));
  v5 = -[PKPassFieldTemplate valueCanWrap](v8, "valueCanWrap");
  if (v5)
    v6 = 2;
  else
    v6 = 1;
  if (v5)
    v7 = 0;
  else
    v7 = 4;
  -[UILabel setNumberOfLines:](self->_valueLabel, "setNumberOfLines:", v6);
  -[UILabel setLineBreakMode:](self->_valueLabel, "setLineBreakMode:", v7);
  -[PKPassFieldView invalidateCachedFieldSize](self, "invalidateCachedFieldSize");

}

- (void)invalidateCachedFieldSize
{
  self->_needsRecalculation = 1;
}

- (BOOL)_shouldDisplayLabel
{
  int v3;
  void *v4;
  void *v5;

  if (-[PKPassFieldTemplate suppressesLabel](self->_fieldTemplate, "suppressesLabel"))
  {
    LOBYTE(v3) = 0;
  }
  else if (-[PKPassFieldTemplate suppressesEmptyLabel](self->_fieldTemplate, "suppressesEmptyLabel"))
  {
    -[UILabel attributedText](self->_labelLabel, "attributedText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "isEqualToString:", CFSTR(" ")) ^ 1;

  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (void)setField:(id)a3
{
  UILabel *labelLabel;
  void *v6;
  UILabel *valueLabel;
  void *v8;
  PKPassField *v9;

  v9 = (PKPassField *)a3;
  if (self->_field != v9)
  {
    objc_storeStrong((id *)&self->_field, a3);
    labelLabel = self->_labelLabel;
    -[PKPassField label](v9, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](labelLabel, "setText:", v6);

    valueLabel = self->_valueLabel;
    -[PKPassField value](v9, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](valueLabel, "setText:", v8);

    -[PKPassFieldView invalidateCachedFieldSize](self, "invalidateCachedFieldSize");
  }

}

- (PKPassFieldTemplate)fieldTemplate
{
  return self->_fieldTemplate;
}

- (id)_labelAttributedStringForColorProfile:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPassField label](self->_field, "label");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = -[PKPassField textAlignment](self->_field, "textAlignment");
    if (v7 == 4)
      v7 = -[PKPassFieldTemplate textAlignment](self->_fieldTemplate, "textAlignment");
    objc_msgSend(MEMORY[0x1E0DC1288], "defaultParagraphStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "setAlignment:", v7);
    objc_msgSend(v9, "setLineBreakMode:", 4);
    -[PKPassFieldView _labelColorFromColorProfile:](self, "_labelColorFromColorProfile:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassField value](self->_field, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11 && -[PKPassFieldTemplate preferredSingleStyle](self->_fieldTemplate, "preferredSingleStyle") == 2)
    {
      -[PKPassFieldView _valueColorFromColorProfile:](self, "_valueColorFromColorProfile:", v4);
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v12;
    }
    v13 = *MEMORY[0x1E0DC1178];
    v21[0] = *MEMORY[0x1E0DC1140];
    v21[1] = v13;
    v22[0] = v10;
    v22[1] = v9;
    v21[2] = *MEMORY[0x1E0DC1138];
    -[PKPassFieldTemplate labelFont](self->_fieldTemplate, "labelFont");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = -[PKPassFieldTemplate labelCaseStyle](self->_fieldTemplate, "labelCaseStyle");
    if (v16 == 2)
    {
      objc_msgSend(v6, "pk_capitalizedStringForPreferredLocale");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v16 != 1 && (v16 || self->_background == 1))
        goto LABEL_15;
      objc_msgSend(v6, "pk_uppercaseStringForPreferredLocale");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v19 = (void *)v17;

    v6 = v19;
LABEL_15:
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v6, v15);

    goto LABEL_16;
  }
  v18 = 0;
LABEL_16:

  return v18;
}

- (id)_valueAttributedStringForColorProfile:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPassField value](self->_field, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[PKPassField textAlignment](self->_field, "textAlignment");
    if (v6 == 4)
      v6 = -[PKPassFieldTemplate textAlignment](self->_fieldTemplate, "textAlignment");
    if (-[PKPassFieldTemplate valueCanWrap](self->_fieldTemplate, "valueCanWrap"))
      v7 = 0;
    else
      v7 = 4;
    objc_msgSend(MEMORY[0x1E0DC1288], "defaultParagraphStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "setAlignment:", v6);
    objc_msgSend(v9, "setLineBreakMode:", v7);
    -[PKPassFieldView _valueColorFromColorProfile:](self, "_valueColorFromColorProfile:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassField label](self->_field, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11 && -[PKPassFieldTemplate preferredSingleStyle](self->_fieldTemplate, "preferredSingleStyle") == 1)
    {
      -[PKPassFieldView _labelColorFromColorProfile:](self, "_labelColorFromColorProfile:", v4);
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v12;
    }
    v13 = *MEMORY[0x1E0DC1178];
    v18[0] = *MEMORY[0x1E0DC1140];
    v18[1] = v13;
    v19[0] = v10;
    v19[1] = v9;
    v18[2] = *MEMORY[0x1E0DC1138];
    -[PKPassFieldTemplate valueFont](self->_fieldTemplate, "valueFont");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, v15);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (PKPassField)field
{
  return self->_field;
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setColorProfile:(id)a3 background:(int64_t)a4
{
  id v7;

  objc_storeStrong((id *)&self->_colorProfile, a3);
  v7 = a3;
  self->_background = a4;
  -[PKPassFieldView invalidateCachedFieldSize](self, "invalidateCachedFieldSize");
  -[PKPassFieldView updateVibrancyFiltersFromColorProfile:](self, "updateVibrancyFiltersFromColorProfile:", v7);

}

+ (id)newViewForField:(id)a3 fieldTemplate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id result;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(v6, "viewSubclass");
  if (!v7)
    v7 = (void *)objc_opt_class();
  result = (id)objc_msgSend(v7, "isSubclassOfClass:", objc_opt_class());
  if ((result & 1) != 0)
  {
    v9 = (void *)objc_msgSend(objc_alloc((Class)v7), "initWithField:fieldTemplate:", v5, v6);

    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassFieldView frame](self, "frame");
  objc_msgSend(v3, "appendFormat:", CFSTR("frame = (%g %g; %g %g); "), v4, v5, v6, v7);
  -[UILabel text](self->_labelLabel, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");
  v10 = (_QWORD *)MEMORY[0x1E0DC1138];
  if (v9)
  {
    -[UILabel attributedText](self->_labelLabel, "attributedText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "attribute:atIndex:effectiveRange:", *v10, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pointSize");
    v14 = v13;

    if ((unint64_t)objc_msgSend(v8, "length") >= 0x1A)
    {
      v15 = objc_msgSend(v8, "rangeOfComposedCharacterSequencesForRange:", 0, 25);
      objc_msgSend(v8, "substringWithRange:", v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringByAppendingString:", CFSTR("..."));
      v18 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v18;
    }
    objc_msgSend(v3, "appendFormat:", CFSTR("<label = '%@'; font-size: %g>; "), v8, v14);
  }
  -[UILabel text](self->_valueLabel, "text");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "length"))
  {
    -[UILabel attributedText](self->_valueLabel, "attributedText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "attribute:atIndex:effectiveRange:", *v10, 0, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "pointSize");
    v23 = v22;

    if ((unint64_t)objc_msgSend(v19, "length") >= 0x1A)
    {
      v24 = objc_msgSend(v19, "rangeOfComposedCharacterSequencesForRange:", 0, 25);
      objc_msgSend(v19, "substringWithRange:", v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringByAppendingString:", CFSTR("..."));
      v27 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v27;
    }
    objc_msgSend(v3, "appendFormat:", CFSTR("<value = '%@'; font-size: %g>"), v19, v23);
  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (void)setDiffView:(id)a3
{
  id v5;
  id *p_diffView;
  id v7;
  id v8;

  v5 = a3;
  p_diffView = (id *)&self->_diffView;
  v7 = *p_diffView;
  if (*p_diffView != v5)
  {
    v8 = v5;
    if (v7)
      objc_msgSend(v7, "removeFromSuperview");
    objc_storeStrong(p_diffView, a3);
    v5 = v8;
  }

}

- (void)presentDiff:(id)a3 inView:(id)a4 completion:(id)a5
{
  void (**v8)(_QWORD);
  PKPassField *field;
  id v10;
  void *v11;
  int v12;
  UILabel *valueLabel;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double x;
  double y;
  double width;
  double height;
  PKDiffView *v30;
  PKDiffView *v31;
  id v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v32 = a4;
  v8 = (void (**)(_QWORD))a5;
  field = self->_field;
  v10 = a3;
  -[PKPassField key](field, "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "getHunkForKey:oldValue:newValue:message:", v11, 0, 0, 0);

  if (v12)
  {
    valueLabel = self->_valueLabel;
    -[UILabel bounds](valueLabel, "bounds");
    -[UILabel textRectForBounds:limitedToNumberOfLines:](valueLabel, "textRectForBounds:limitedToNumberOfLines:", 0);
    -[PKPassFieldView convertRect:fromView:](self, "convertRect:fromView:", self->_valueLabel);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    -[UILabel frame](self->_labelLabel, "frame");
    v36.origin.x = v22;
    v36.origin.y = v23;
    v36.size.width = v24;
    v36.size.height = v25;
    v33.origin.x = v15;
    v33.origin.y = v17;
    v33.size.width = v19;
    v33.size.height = v21;
    v34 = CGRectUnion(v33, v36);
    v34.origin.x = v15;
    v34.size.width = v19;
    v35 = CGRectInset(v34, -15.0, -15.0);
    x = v35.origin.x;
    y = v35.origin.y;
    width = v35.size.width;
    height = v35.size.height;
    v30 = [PKDiffView alloc];
    objc_msgSend(v32, "convertRect:fromView:", self, x, y, width, height);
    v31 = -[PKDiffView initWithFrame:](v30, "initWithFrame:");
    objc_msgSend(v32, "addSubview:", v31);
    -[PKPassFieldView setDiffView:](self, "setDiffView:", v31);
    -[PKDiffView performStrokeWithCompletion:](v31, "performStrokeWithCompletion:", v8);

  }
  else
  {
    -[PKPassFieldView setDiffView:](self, "setDiffView:", 0);
    if (v8)
      v8[2](v8);
  }

}

- (CGSize)_resizeMultiLineValueFontForAvailableSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  PKPassFieldTemplate *fieldTemplate;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UILabel *valueLabel;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PKPassFieldTemplate valueFont](self->_fieldTemplate, "valueFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "xHeight");
  v8 = v7;
  -[PKPassFieldTemplate labelFont](self->_fieldTemplate, "labelFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "xHeight");
  v11 = v8 / v10;

  -[PKPassFieldTemplate valueFont](self->_fieldTemplate, "valueFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pointSize");
  v14 = v13;

  if (v11 <= 1.0)
  {
    v26 = height;
    v24 = width;
  }
  else
  {
    do
    {
      v14 = v14 + -1.0;
      fieldTemplate = self->_fieldTemplate;
      v16 = (void *)MEMORY[0x1E0DC1350];
      -[PKPassFieldTemplate valueFont](fieldTemplate, "valueFont");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fontDescriptor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "fontWithDescriptor:size:", v18, v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassFieldTemplate setValueFont:](fieldTemplate, "setValueFont:", v19);

      valueLabel = self->_valueLabel;
      -[PKPassFieldView _valueAttributedStringForColorProfile:](self, "_valueAttributedStringForColorProfile:", self->_colorProfile);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setAttributedText:](valueLabel, "setAttributedText:", v21);

      -[UILabel attributedText](self->_valueLabel, "attributedText");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "boundingRectWithSize:options:context:", 1, 0, width, 3.40282347e38);
      v24 = v23;
      v26 = v25;

      if (v26 < height)
        break;
      -[PKPassFieldTemplate valueFont](self->_fieldTemplate, "valueFont");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "xHeight");
      v29 = v28;
      -[PKPassFieldTemplate labelFont](self->_fieldTemplate, "labelFont");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "xHeight");
      v32 = v29 / v31;

    }
    while (v32 > 1.0);
  }
  if (v24 <= width)
    v33 = v24;
  else
    v33 = width;
  v34 = v26;
  result.height = v34;
  result.width = v33;
  return result;
}

- (id)_labelColorFromColorProfile:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (!objc_msgSend(v4, "supportsAutomaticLabelVibrancy")
    || (-[PKPassFieldTemplate automaticVibrantLabelColor](self->_fieldTemplate, "automaticVibrantLabelColor"),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v4, "labelColorOverStrip:", self->_background == 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_valueColorFromColorProfile:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (!objc_msgSend(v4, "supportsAutomaticForegroundVibrancy")
    || (-[PKPassFieldTemplate automaticVibrantValueColor](self->_fieldTemplate, "automaticVibrantValueColor"),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v4, "foregroundColorOverStrip:", self->_background == 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)updateVibrancyFiltersFromColorProfile:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[PKPassFieldTemplate automaticVibrantLabelBlendMode](self->_fieldTemplate, "automaticVibrantLabelBlendMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassFieldTemplate automaticVibrantValueBlendMode](self->_fieldTemplate, "automaticVibrantValueBlendMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v16, "supportsAutomaticLabelVibrancy");
  if (v6)
  {
    v7 = v4;
    -[PKPassField value](self->_field, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8 && -[PKPassFieldTemplate preferredSingleStyle](self->_fieldTemplate, "preferredSingleStyle") == 2)
    {
      v9 = v5;

      v7 = v9;
    }
    -[UILabel layer](self->_labelLabel, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCompositingFilter:", v7);

  }
  if (objc_msgSend(v16, "supportsAutomaticForegroundVibrancy"))
  {
    v11 = v5;
    -[PKPassField label](self->_field, "label");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12 && -[PKPassFieldTemplate preferredSingleStyle](self->_fieldTemplate, "preferredSingleStyle") == 1)
    {
      v13 = v4;

      v11 = v13;
    }
    -[UILabel layer](self->_valueLabel, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCompositingFilter:", v11);

    v6 = 1;
  }
  -[PKPassFieldView layer](self, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAllowsGroupBlending:", v6 ^ 1u);

}

- (PKPassColorProfile)colorProfile
{
  return self->_colorProfile;
}

- (void)setColorProfile:(id)a3
{
  objc_storeStrong((id *)&self->_colorProfile, a3);
}

- (PKDiffView)diffView
{
  return self->_diffView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_labelLabel, 0);
  objc_storeStrong((id *)&self->_diffView, 0);
  objc_storeStrong((id *)&self->_colorProfile, 0);
  objc_storeStrong((id *)&self->_fieldTemplate, 0);
  objc_storeStrong((id *)&self->_field, 0);
}

@end
