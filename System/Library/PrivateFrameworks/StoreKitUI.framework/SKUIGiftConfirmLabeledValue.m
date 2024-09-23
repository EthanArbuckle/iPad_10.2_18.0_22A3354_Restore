@implementation SKUIGiftConfirmLabeledValue

- (SKUIGiftConfirmLabeledValue)initWithGiftConfirmLabelStyle:(int64_t)a3
{
  SKUIGiftConfirmLabeledValue *v5;
  SKUIGiftDashView *v6;
  SKUIGiftDashView *dashView;
  SKUIGiftDashView *v8;
  void *v9;
  SKUIGiftDashView *v10;
  void *v11;
  void *v12;
  objc_super v14;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftConfirmLabeledValue initWithGiftConfirmLabelStyle:].cold.1();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIGiftConfirmLabeledValue;
  v5 = -[SKUIGiftConfirmLabeledValue init](&v14, sel_init);
  if (v5)
  {
    if (a3 == 2)
    {
      v6 = objc_alloc_init(SKUIGiftDashView);
      dashView = v5->_dashView;
      v5->_dashView = v6;

      v8 = v5->_dashView;
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIGiftDashView setBackgroundColor:](v8, "setBackgroundColor:", v9);

      v10 = v5->_dashView;
      objc_msgSend(MEMORY[0x1E0DC3658], "_labelColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "colorWithAlphaComponent:", 0.3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIGiftDashView setDashColor:](v10, "setDashColor:", v12);

      -[SKUIGiftDashView setDashSize:](v5->_dashView, "setDashSize:", 1.0, 1.0);
      -[SKUIGiftDashView setDashSpacing:](v5->_dashView, "setDashSpacing:", 4.0);
      -[SKUIGiftConfirmLabeledValue addSubview:](v5, "addSubview:", v5->_dashView);
    }
    v5->_style = a3;
  }
  return v5;
}

- (NSString)label
{
  return -[UILabel text](self->_labelLabel, "text");
}

- (void)setLabel:(id)a3
{
  id v4;
  UILabel *labelLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  id v15;

  v15 = a3;
  -[SKUIGiftConfirmLabeledValue label](self, "label");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v15 && (objc_msgSend(v15, "isEqualToString:", v4) & 1) == 0)
  {
    labelLabel = self->_labelLabel;
    if (v15)
    {
      if (!labelLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v7 = self->_labelLabel;
        self->_labelLabel = v6;

        v8 = self->_labelLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_labelLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 13.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        v12 = self->_labelLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "_labelColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v12, "setTextColor:", v13);

        -[UILabel setTextAlignment:](self->_labelLabel, "setTextAlignment:", 4);
        -[SKUIGiftConfirmLabeledValue addSubview:](self, "addSubview:", self->_labelLabel);
        labelLabel = self->_labelLabel;
      }
      -[UILabel setText:](labelLabel, "setText:");
      -[UILabel sizeToFit](self->_labelLabel, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](labelLabel, "removeFromSuperview");
      v14 = self->_labelLabel;
      self->_labelLabel = 0;

    }
    -[SKUIGiftConfirmLabeledValue setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)subtitleLabel
{
  return -[UILabel text](self->_subtitleLabel, "text");
}

- (void)setSubtitleLabel:(id)a3
{
  id v4;
  UILabel *subtitleLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  id v15;

  v15 = a3;
  -[SKUIGiftConfirmLabeledValue subtitleLabel](self, "subtitleLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v15 && (objc_msgSend(v15, "isEqualToString:", v4) & 1) == 0)
  {
    subtitleLabel = self->_subtitleLabel;
    if (v15)
    {
      if (!subtitleLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v7 = self->_subtitleLabel;
        self->_subtitleLabel = v6;

        v8 = self->_subtitleLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

        v10 = self->_subtitleLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 13.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v10, "setFont:", v11);

        v12 = self->_subtitleLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "_secondaryLabelColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v12, "setTextColor:", v13);

        -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", 4);
        -[SKUIGiftConfirmLabeledValue addSubview:](self, "addSubview:", self->_subtitleLabel);
        subtitleLabel = self->_subtitleLabel;
      }
      -[UILabel setText:](subtitleLabel, "setText:");
      -[UILabel sizeToFit](self->_subtitleLabel, "sizeToFit");
    }
    else
    {
      -[UILabel removeFromSuperview](subtitleLabel, "removeFromSuperview");
      v14 = self->_subtitleLabel;
      self->_subtitleLabel = 0;

    }
    -[SKUIGiftConfirmLabeledValue setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setValue:(id)a3
{
  id v4;
  UILabel *valueLabel;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  int64_t style;
  UILabel *v15;
  uint64_t v16;
  UILabel *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  -[SKUIGiftConfirmLabeledValue label](self, "label");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v20 && (objc_msgSend(v20, "isEqualToString:", v4) & 1) == 0)
  {
    valueLabel = self->_valueLabel;
    if (!v20)
    {
      -[UILabel removeFromSuperview](valueLabel, "removeFromSuperview");
      v17 = self->_valueLabel;
      self->_valueLabel = 0;

LABEL_17:
      -[SKUIGiftConfirmLabeledValue setNeedsLayout](self, "setNeedsLayout");
      goto LABEL_18;
    }
    if (valueLabel)
    {
LABEL_16:
      -[UILabel setText:](valueLabel, "setText:");
      goto LABEL_17;
    }
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v7 = self->_valueLabel;
    self->_valueLabel = v6;

    v8 = self->_valueLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

    v10 = self->_valueLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 13.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10, "setFont:", v11);

    v12 = self->_valueLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "_secondaryLabelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    -[UILabel setTextAlignment:](self->_valueLabel, "setTextAlignment:", 4);
    style = self->_style;
    if (style)
    {
      if (style == 1)
      {
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "userInterfaceIdiom");

        v15 = self->_valueLabel;
        if (v19 == 1)
          v16 = 7;
        else
          v16 = 6;
      }
      else
      {
        if (style != 2)
        {
LABEL_15:
          -[SKUIGiftConfirmLabeledValue addSubview:](self, "addSubview:", self->_valueLabel);
          valueLabel = self->_valueLabel;
          goto LABEL_16;
        }
        v15 = self->_valueLabel;
        v16 = 1;
      }
    }
    else
    {
      v15 = self->_valueLabel;
      v16 = 2;
    }
    -[UILabel setNumberOfLines:](v15, "setNumberOfLines:", v16);
    goto LABEL_15;
  }
LABEL_18:

}

- (NSString)value
{
  return -[UILabel text](self->_valueLabel, "text");
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UILabel *labelLabel;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  UILabel *v22;
  double v23;
  UILabel *subtitleLabel;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  UILabel *v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  UILabel *valueLabel;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  int64_t style;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  UILabel *v57;
  double v58;
  double v59;
  double v60;
  SKUIGiftDashView *dashView;
  double v62;
  UILabel *v63;
  UILabel *v64;
  UILabel *v65;
  double v66;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  UILabel *v71;
  double v72;
  double v73;
  double v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceLayoutDirection");

  -[SKUIGiftConfirmLabeledValue bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  labelLabel = self->_labelLabel;
  v14 = v7;
  v15 = v5;
  if (labelLabel)
  {
    -[UILabel frame](labelLabel, "frame");
    v19 = v16;
    v20 = v17;
    v21 = v18;
    v22 = self->_labelLabel;
    if (v4)
      +[SKUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SKUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v6, v16, v17, v18, v6, v8, v10, v12);
    else
      v23 = v6;
    -[UILabel setFrame:](v22, "setFrame:", v23);
    v75.origin.x = v6;
    v75.origin.y = v19;
    v75.size.width = v20;
    v75.size.height = v21;
    v15 = CGRectGetMaxX(v75) + 5.0;
    v76.origin.x = v6;
    v76.origin.y = v19;
    v76.size.width = v20;
    v76.size.height = v21;
    v14 = CGRectGetMaxY(v76) + 3.0;
  }
  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel)
  {
    v73 = v14;
    -[UILabel frame](subtitleLabel, "frame");
    v28 = v25;
    v29 = v26;
    v30 = v27;
    v31 = self->_subtitleLabel;
    v74 = v6;
    if (v4)
    {
      v32 = v10;
      v33 = v15;
      v34 = v6;
      v35 = v8;
      v36 = v8;
      v37 = v32;
      +[SKUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SKUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v15, v25, v26, v27, v34, v36);
      v15 = v38;
    }
    else
    {
      v35 = v8;
      v37 = v10;
      v33 = v15;
    }
    -[UILabel setFrame:](v31, "setFrame:", v15);
    v77.origin.x = v33;
    v77.origin.y = v28;
    v77.size.width = v29;
    v77.size.height = v30;
    v15 = CGRectGetMaxX(v77) + 5.0;
    v10 = v37;
    v8 = v35;
    v14 = v73;
    v6 = v74;
  }
  valueLabel = self->_valueLabel;
  if (valueLabel)
  {
    -[UILabel frame](valueLabel, "frame");
    v44 = v43;
    style = self->_style;
    if (style)
    {
      if (style == 1)
      {
        -[UILabel sizeThatFits:](self->_valueLabel, "sizeThatFits:", v10 - v6, v12 - v14);
        v53 = v55;
        v42 = v56;
        v44 = v14;
        v15 = v6;
      }
      else if (style == 2)
      {
        v46 = v6;
        v47 = v8;
        v48 = v12;
        v49 = v10;
        v50 = v10 + -5.0 - v15;
        -[UILabel sizeThatFits:](self->_valueLabel, "sizeThatFits:", v50, v48);
        v42 = v52;
        if (v51 >= v50)
          v53 = v50;
        else
          v53 = v51;
        v10 = v49;
        v12 = v48;
        v8 = v47;
        v6 = v46;
        v15 = v10 - v53;
      }
      else
      {
        v53 = v41;
        v15 = v40;
      }
    }
    else
    {
      v53 = v10 - v15;
      -[UILabel sizeThatFits:](self->_valueLabel, "sizeThatFits:", v10 - v15, v12);
      v42 = v54;
    }
    v57 = self->_valueLabel;
    if (v4)
    {
      +[SKUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SKUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v15, v44, v53, v42, v6, v8, v10, v12);
      v15 = v58;
      v44 = v59;
      v53 = v60;
    }
    -[UILabel setFrame:](v57, "setFrame:", v15, v44, v53, v42);
  }
  dashView = self->_dashView;
  if (dashView)
  {
    -[SKUIGiftDashView frame](dashView, "frame");
    v62 = v12 + -1.0;
    if (v4)
    {
      v63 = self->_valueLabel;
      if (v63)
      {
        -[UILabel frame](v63, "frame");
        v6 = CGRectGetMaxX(v78) + 2.0;
      }
      v64 = self->_subtitleLabel;
      if (v64 || (v64 = self->_labelLabel) != 0)
      {
        -[UILabel frame](v64, "frame");
        v10 = v79.origin.x + -2.0 - v6;
        v62 = CGRectGetMaxY(v79) + -1.0 + -3.0;
      }
    }
    else
    {
      v65 = self->_subtitleLabel;
      if (v65 || (v65 = self->_labelLabel) != 0)
      {
        -[UILabel frame](v65, "frame");
        v66 = v10;
        x = v80.origin.x;
        y = v80.origin.y;
        width = v80.size.width;
        height = v80.size.height;
        v6 = CGRectGetMaxX(v80) + 2.0;
        v81.origin.x = x;
        v10 = v66;
        v81.origin.y = y;
        v81.size.width = width;
        v81.size.height = height;
        v62 = CGRectGetMaxY(v81) + -1.0 + -3.0;
      }
      v71 = self->_valueLabel;
      if (v71)
      {
        -[UILabel frame](v71, "frame");
        v10 = v72 + -2.0 - v6;
      }
    }
    -[SKUIGiftDashView setFrame:](self->_dashView, "setFrame:", v6, v62, v10, 1.0);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  UILabel *labelLabel;
  double v6;
  double v7;
  double height;
  double v9;
  UILabel *valueLabel;
  double v11;
  int64_t style;
  double v13;
  double v14;
  CGSize result;

  width = a3.width;
  labelLabel = self->_labelLabel;
  if (!labelLabel)
  {
    height = a3.height;
    goto LABEL_5;
  }
  -[UILabel frame](labelLabel, "frame", a3.width, a3.height);
  height = v7;
  if ((self->_style | 2) != 2)
  {
LABEL_5:
    v9 = width;
    goto LABEL_6;
  }
  v9 = width - (v6 + 5.0);
LABEL_6:
  valueLabel = self->_valueLabel;
  if (valueLabel)
  {
    -[UILabel sizeThatFits:](valueLabel, "sizeThatFits:", v9, 1.79769313e308);
    style = self->_style;
    switch(style)
    {
      case 2:
        goto LABEL_10;
      case 1:
        height = height + v11 + 3.0;
        break;
      case 0:
LABEL_10:
        if (height < v11)
          height = v11;
        break;
    }
  }
  v13 = width;
  v14 = height;
  result.height = v14;
  result.width = v13;
  return result;
}

- (int64_t)giftConfirmLabelStyle
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_labelLabel, 0);
  objc_storeStrong((id *)&self->_dashView, 0);
}

- (void)initWithGiftConfirmLabelStyle:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIGiftConfirmLabeledValue initWithGiftConfirmLabelStyle:]";
}

@end
