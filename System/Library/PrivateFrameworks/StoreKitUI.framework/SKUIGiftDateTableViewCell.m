@implementation SKUIGiftDateTableViewCell

- (SKUIGiftDateTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  SKUIGiftDateTableViewCell *v7;
  UIView *v8;
  UIView *bottomBorderView;
  UIView *v10;
  void *v11;
  void *v12;
  UIDatePicker *v13;
  UIDatePicker *datePicker;
  UIDatePicker *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  UIView *v19;
  UIView *topBorderView;
  UIView *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftDateTableViewCell initWithStyle:reuseIdentifier:].cold.1();
  }
  v26.receiver = self;
  v26.super_class = (Class)SKUIGiftDateTableViewCell;
  v7 = -[SKUIGiftDateTableViewCell initWithStyle:reuseIdentifier:](&v26, sel_initWithStyle_reuseIdentifier_, a3, v6);
  if (v7)
  {
    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    bottomBorderView = v7->_bottomBorderView;
    v7->_bottomBorderView = v8;

    v10 = v7->_bottomBorderView;
    objc_msgSend(MEMORY[0x1E0DC3658], "tableSeparatorColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    -[SKUIGiftDateTableViewCell contentView](v7, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v7->_bottomBorderView);

    v13 = (UIDatePicker *)objc_alloc_init(MEMORY[0x1E0DC36F0]);
    datePicker = v7->_datePicker;
    v7->_datePicker = v13;

    -[UIDatePicker setDatePickerMode:](v7->_datePicker, "setDatePickerMode:", 1);
    -[UIDatePicker setPreferredDatePickerStyle:](v7->_datePicker, "setPreferredDatePickerStyle:", 2);
    v15 = v7->_datePicker;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDatePicker setTintColor:](v15, "setTintColor:", v16);

    v17 = *MEMORY[0x1E0DC4920];
    -[UIDatePicker setMaximumContentSizeCategory:](v7->_datePicker, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC4920]);
    -[UIDatePicker setMinimumContentSizeCategory:](v7->_datePicker, "setMinimumContentSizeCategory:", v17);
    -[UIDatePicker addTarget:action:forControlEvents:](v7->_datePicker, "addTarget:action:forControlEvents:", v7, sel__datePickerDateDidChange, 4096);
    -[UIDatePicker addTarget:action:forControlEvents:](v7->_datePicker, "addTarget:action:forControlEvents:", v7, sel__datePickerEditingDidBegin, 0x10000);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDatePicker setMinimumDate:](v7->_datePicker, "setMinimumDate:", v18);
    -[UIDatePicker setDate:](v7->_datePicker, "setDate:", v18);
    v19 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    topBorderView = v7->_topBorderView;
    v7->_topBorderView = v19;

    v21 = v7->_topBorderView;
    objc_msgSend(MEMORY[0x1E0DC3658], "tableSeparatorColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v21, "setBackgroundColor:", v22);

    -[SKUIGiftDateTableViewCell contentView](v7, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v7->_topBorderView);

    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_leftToRight = objc_msgSend(v24, "userInterfaceLayoutDirection") == 0;

  }
  return v7;
}

- (NSDate)date
{
  return -[UIDatePicker date](self->_datePicker, "date");
}

- (NSString)label
{
  return -[UILabel text](self->_labelLabel, "text");
}

- (NSString)placeholder
{
  return -[UILabel text](self->_placeholderLabel, "text");
}

- (void)setChecked:(BOOL)a3
{
  UIImageView *checkmarkView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIImageView *v9;
  UIImageView *v10;
  UILabel *labelLabel;
  void *v12;

  if (self->_checked != a3)
  {
    self->_checked = a3;
    checkmarkView = self->_checkmarkView;
    if (a3)
    {
      if (checkmarkView)
      {
LABEL_7:
        labelLabel = self->_labelLabel;
        -[SKUIGiftDateTableViewCell _labelColor](self, "_labelColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](labelLabel, "setTextColor:", v12);

        -[SKUIGiftDateTableViewCell setNeedsLayout](self, "setNeedsLayout");
        return;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", CFSTR("GiftCheckmark"), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIGiftDateTableViewCell tintColor](self, "tintColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_flatImageWithColor:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:highlightedImage:", v8, 0);
      v10 = self->_checkmarkView;
      self->_checkmarkView = v9;

      -[SKUIGiftDateTableViewCell addSubview:](self, "addSubview:", self->_checkmarkView);
    }
    else
    {
      -[UIImageView removeFromSuperview](checkmarkView, "removeFromSuperview");
      v5 = self->_checkmarkView;
      self->_checkmarkView = 0;
    }

    goto LABEL_7;
  }
}

- (void)setDate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[SKUIGiftDateTableViewCell date](self, "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  v6 = v4;
  if (v4 != v10)
  {
    v7 = objc_msgSend(v4, "isEqualToDate:", v10);
    v5 = v10;
    if ((v7 & 1) == 0)
    {
      if (v10)
      {
        -[SKUIGiftDateTableViewCell contentView](self, "contentView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addSubview:", self->_datePicker);

        -[UIDatePicker setDate:](self->_datePicker, "setDate:", v10);
        -[UIDatePicker sizeToFit](self->_datePicker, "sizeToFit");
      }
      else
      {
        -[UIDatePicker removeFromSuperview](self->_datePicker, "removeFromSuperview");
      }
      -[SKUIGiftDateTableViewCell setNeedsLayout](self, "setNeedsLayout");
      v5 = v10;
    }
  }
  -[SKUIGiftDateTableViewCell _labelForDate:](self, "_labelForDate:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIGiftDateTableViewCell setLabel:](self, "setLabel:", v9);

}

- (void)setLabel:(id)a3
{
  id v4;
  UILabel *labelLabel;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  id v10;

  v10 = a3;
  -[SKUIGiftDateTableViewCell label](self, "label");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v10 && (objc_msgSend(v4, "isEqualToString:", v10) & 1) == 0)
  {
    labelLabel = self->_labelLabel;
    if (v10)
    {
      if (!labelLabel)
      {
        v6 = -[SKUIGiftDateTableViewCell _newLabel](self, "_newLabel");
        v7 = self->_labelLabel;
        self->_labelLabel = v6;

        -[SKUIGiftDateTableViewCell contentView](self, "contentView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addSubview:", self->_labelLabel);

        labelLabel = self->_labelLabel;
      }
      -[UILabel setText:](labelLabel, "setText:");
      -[UILabel sizeToFit](self->_labelLabel, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](labelLabel, "removeFromSuperview");
      v9 = self->_labelLabel;
      self->_labelLabel = 0;

    }
    -[SKUIGiftDateTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setPlaceholder:(id)a3
{
  id v4;
  UILabel *placeholderLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  void *v14;
  UILabel *v15;
  id v16;

  v16 = a3;
  -[SKUIGiftDateTableViewCell label](self, "label");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v16 && (objc_msgSend(v4, "isEqualToString:", v16) & 1) == 0)
  {
    placeholderLabel = self->_placeholderLabel;
    if (v16)
    {
      if (!placeholderLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v7 = self->_placeholderLabel;
        self->_placeholderLabel = v6;

        v8 = self->_placeholderLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_placeholderLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        -[UILabel setNumberOfLines:](self->_placeholderLabel, "setNumberOfLines:", 2);
        v12 = self->_placeholderLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "_placeholderTextColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v12, "setTextColor:", v13);

        -[SKUIGiftDateTableViewCell contentView](self, "contentView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addSubview:", self->_placeholderLabel);

        placeholderLabel = self->_placeholderLabel;
      }
      -[UILabel setText:](placeholderLabel, "setText:");
      -[UILabel sizeToFit](self->_placeholderLabel, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](placeholderLabel, "removeFromSuperview");
      v15 = self->_placeholderLabel;
      self->_placeholderLabel = 0;

    }
    -[SKUIGiftDateTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIImageView *checkmarkView;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float v17;
  double v18;
  BOOL v19;
  UIImageView *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  UILabel *labelLabel;
  double width;
  double height;
  double v28;
  double MaxX;
  float v30;
  double v31;
  BOOL v32;
  UILabel *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  UIDatePicker *datePicker;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  float v45;
  double v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  UILabel *placeholderLabel;
  double v54;
  double v55;
  double v56;
  double v57;
  _BOOL4 v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  objc_super v68;
  CGRect v69;

  v68.receiver = self;
  v68.super_class = (Class)SKUIGiftDateTableViewCell;
  -[SKUIGiftDateTableViewCell layoutSubviews](&v68, sel_layoutSubviews);
  -[SKUIGiftDateTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v66 = v4;
  v67 = v5;
  v7 = v6;
  v9 = v8;

  v10 = v7 + -15.0;
  checkmarkView = self->_checkmarkView;
  if (checkmarkView)
  {
    -[UIImageView frame](checkmarkView, "frame");
    v13 = v12;
    v15 = v14;
    v16 = v10 - v12;
    v17 = (v9 - v14) * 0.5;
    v18 = floorf(v17);
    -[UIImageView setFrame:](self->_checkmarkView, "setFrame:", v10 - v12, v18);
    v19 = -[SKUIGiftDateTableViewCell leftToRight](self, "leftToRight");
    v20 = self->_checkmarkView;
    if (v19)
    {
      v21 = v16;
    }
    else
    {
      +[SKUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SKUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v16, v18, v13, v15, v66, v67, v7, v9);
      v18 = v22;
      v13 = v23;
      v15 = v24;
    }
    v10 = v16 + -7.0;
    -[UIImageView setFrame:](v20, "setFrame:", v21, v18, v13, v15, *(_QWORD *)&v66, *(_QWORD *)&v67);
  }
  labelLabel = self->_labelLabel;
  if (labelLabel)
  {
    -[UILabel frame](labelLabel, "frame");
    width = v69.size.width;
    height = v69.size.height;
    v28 = 15.0;
    v69.origin.x = 15.0;
    MaxX = CGRectGetMaxX(v69);
    v30 = (v9 - height) * 0.5;
    v31 = floorf(v30);
    -[UILabel setFrame:](self->_labelLabel, "setFrame:", 15.0, v31, width, height);
    v32 = -[SKUIGiftDateTableViewCell leftToRight](self, "leftToRight");
    v33 = self->_labelLabel;
    if (!v32)
    {
      +[SKUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SKUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", 15.0, v31, width, height, v66, v67, v7, v9);
      v28 = v34;
      v31 = v35;
      width = v36;
      height = v37;
    }
    v38 = MaxX + 7.0;
    -[UILabel setFrame:](v33, "setFrame:", v28, v31, width, height, *(_QWORD *)&v66, *(_QWORD *)&v67);
  }
  else
  {
    v38 = 15.0;
  }
  datePicker = self->_datePicker;
  if (datePicker)
  {
    -[UIDatePicker frame](datePicker, "frame");
    v41 = v40;
    v43 = v42;
    v44 = v10 - v40;
    v45 = (v9 - v42) * 0.5;
    v46 = floorf(v45);
    -[UILabel setHidden:](self->_placeholderLabel, "setHidden:", 1);
    v47 = -[SKUIGiftDateTableViewCell leftToRight](self, "leftToRight");
    v48 = self->_datePicker;
    if (v47)
    {
      v49 = self->_datePicker;
      v50 = v44;
      v51 = v46;
      v52 = v41;
LABEL_17:
      v59 = v43;
LABEL_21:
      objc_msgSend(v49, "setFrame:", v50, v51, v52, v59, *(_QWORD *)&v66, *(_QWORD *)&v67);
      goto LABEL_22;
    }
    v60 = v44;
    v61 = v46;
    v62 = v41;
    goto LABEL_20;
  }
  placeholderLabel = self->_placeholderLabel;
  if (placeholderLabel)
  {
    -[UILabel frame](placeholderLabel, "frame");
    -[UILabel sizeThatFits:](self->_placeholderLabel, "sizeThatFits:", v10 - v38, 1.79769313e308);
    v55 = v54;
    v43 = v56;
    *(float *)&v54 = (v9 - v56) * 0.5;
    v57 = floorf(*(float *)&v54);
    -[UILabel setHidden:](self->_placeholderLabel, "setHidden:", 0);
    -[UILabel setFrame:](self->_placeholderLabel, "setFrame:", v38, v57, v55, v43);
    v58 = -[SKUIGiftDateTableViewCell leftToRight](self, "leftToRight");
    v48 = self->_placeholderLabel;
    if (v58)
    {
      v49 = self->_placeholderLabel;
      v50 = v38;
      v51 = v57;
      v52 = v55;
      goto LABEL_17;
    }
    v60 = v38;
    v61 = v57;
    v62 = v55;
LABEL_20:
    +[SKUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SKUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v60, v61, v62, v43, v66, v67, v7, v9, *(_QWORD *)&v66, *(_QWORD *)&v67);
    v49 = v48;
    goto LABEL_21;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen", *(_QWORD *)&v66, *(_QWORD *)&v67);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "scale");
  v65 = 1.0 / v64;

  -[UIView setFrame:](self->_topBorderView, "setFrame:", 0.0, 0.0, v7, v65);
  -[UIView setFrame:](self->_bottomBorderView, "setFrame:", 0.0, v9 - v65, v7, v65);
}

- (void)_datePickerDateDidChange
{
  void *v3;
  id WeakRetained;
  id v5;

  -[UIDatePicker date](self->_datePicker, "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUIGiftDateTableViewCell _labelForDate:](self, "_labelForDate:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIGiftDateTableViewCell setLabel:](self, "setLabel:", v3);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "giftDateTableViewCell:didChangeDate:", self, v5);

}

- (void)_datePickerEditingDidBegin
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __55__SKUIGiftDateTableViewCell__datePickerEditingDidBegin__block_invoke;
  v2[3] = &unk_1E739FD38;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
}

void __55__SKUIGiftDateTableViewCell__datePickerEditingDidBegin__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "window");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endEditing:", 1);

}

- (id)_labelColor
{
  if (self->_checked)
    -[SKUIGiftDateTableViewCell tintColor](self, "tintColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "_labelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_labelForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;

  v4 = a3;
  -[SKUIGiftDateTableViewCell giftConfiguration](self, "giftConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDatePicker calendar](self->_datePicker, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v7, "isDateInToday:", v4);

  if (!(_DWORD)v5)
  {
    if (v6)
    {
      v8 = CFSTR("GIFTING_FIELD_LABEL_OTHER_DATE");
      goto LABEL_6;
    }
    v10 = CFSTR("GIFTING_FIELD_LABEL_OTHER_DATE");
LABEL_9:
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", v10, 0, CFSTR("Gifting"));
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (!v6)
  {
    v10 = CFSTR("GIFTING_FIELD_LABEL_TODAY");
    goto LABEL_9;
  }
  v8 = CFSTR("GIFTING_FIELD_LABEL_TODAY");
LABEL_6:
  objc_msgSend(v6, "localizedStringForKey:inTable:", v8, CFSTR("Gifting"));
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v11 = (void *)v9;

  return v11;
}

- (id)_newLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v5);

  -[SKUIGiftDateTableViewCell _labelColor](self, "_labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v6);

  return v3;
}

- (BOOL)isChecked
{
  return self->_checked;
}

- (SKUIGiftDateTableViewCellDelegate)delegate
{
  return (SKUIGiftDateTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SKUIGiftConfiguration)giftConfiguration
{
  return self->_giftConfiguration;
}

- (void)setGiftConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_giftConfiguration, a3);
}

- (BOOL)leftToRight
{
  return self->_leftToRight;
}

- (void)setLeftToRight:(BOOL)a3
{
  self->_leftToRight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_giftConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_topBorderView, 0);
  objc_storeStrong((id *)&self->_placeholderLabel, 0);
  objc_storeStrong((id *)&self->_labelLabel, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_bottomBorderView, 0);
}

- (void)initWithStyle:reuseIdentifier:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIGiftDateTableViewCell initWithStyle:reuseIdentifier:]";
}

@end
