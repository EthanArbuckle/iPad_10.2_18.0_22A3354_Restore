@implementation PSSubtitleDisclosureTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (PSSubtitleDisclosureTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  PSSubtitleDisclosureTableCell *v9;
  PSSubtitleDisclosureTableCell *v10;
  void *v11;
  NSString *v12;
  _BOOL4 IsAccessibilityCategory;
  objc_super v15;
  objc_super v16;

  v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PSSubtitleDisclosureTableCell;
  v9 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v16, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v8);
  v10 = v9;
  if (v9)
  {
    -[PSSubtitleDisclosureTableCell _valueLabelForSpecifier:](v9, "_valueLabelForSpecifier:", v8);
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferredContentSizeCategory");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);

    if (IsAccessibilityCategory)
    {
      v15.receiver = v10;
      v15.super_class = (Class)PSSubtitleDisclosureTableCell;
      -[PSTableCell layoutSubviews](&v15, sel_layoutSubviews);
    }
  }

  return v10;
}

- (void)_valueLabelForSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  UILabel *valueLabel;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  UILabel *v11;
  id v12;
  UILabel *v13;
  UILabel *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UILabel *v19;
  id v20;

  if (a3)
  {
    objc_msgSend(a3, "propertyForKey:", CFSTR("cellSubtitleText"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSubtitleDisclosureTableCell detailTextLabel](self, "detailTextLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v4);

    -[PSTableCell value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    valueLabel = self->_valueLabel;
    v20 = v6;
    if (valueLabel)
    {
      -[UILabel text](valueLabel, "text");
      v8 = objc_claimAutoreleasedReturnValue();
      v6 = v20;
      v9 = (void *)v8;
    }
    else
    {
      v9 = 0;
    }
    if (v6 == v9 || (objc_msgSend(v6, "isEqualToString:", v9) & 1) != 0)
      goto LABEL_15;
    v10 = objc_msgSend(v20, "length");
    v11 = self->_valueLabel;
    if (v10)
    {
      if (!v11)
      {
        v12 = objc_alloc(MEMORY[0x1E0CEA700]);
        v13 = (UILabel *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v14 = self->_valueLabel;
        self->_valueLabel = v13;

        v15 = (void *)objc_opt_new();
        objc_msgSend(v15, "detailTextLabel");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "font");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](self->_valueLabel, "setFont:", v17);

        -[UILabel setNumberOfLines:](self->_valueLabel, "setNumberOfLines:", 0);
        -[UILabel setLineBreakMode:](self->_valueLabel, "setLineBreakMode:", 0);
        -[UILabel setEnabled:](self->_valueLabel, "setEnabled:", 0);
        -[PSSubtitleDisclosureTableCell contentView](self, "contentView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addSubview:", self->_valueLabel);

        v11 = self->_valueLabel;
      }
      -[UILabel setText:](v11, "setText:", v20);
    }
    else
    {
      if (!v11)
      {
LABEL_15:

        return;
      }
      -[UILabel removeFromSuperview](v11, "removeFromSuperview");
      v19 = self->_valueLabel;
      self->_valueLabel = 0;

    }
    -[PSSubtitleDisclosureTableCell setNeedsLayout](self, "setNeedsLayout");
    goto LABEL_15;
  }
}

- (double)contentAccessoryPadding
{
  return 10.0;
}

- (void)layoutSubviews
{
  UILabel *valueLabel;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  void *v16;
  NSString *v17;
  _BOOL4 IsAccessibilityCategory;
  void *v19;
  double v20;
  double MaxX;
  UILabel *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  double MaxY;
  double v57;
  float v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  CGFloat v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  double v77;
  objc_super v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;

  v78.receiver = self;
  v78.super_class = (Class)PSSubtitleDisclosureTableCell;
  -[PSTableCell layoutSubviews](&v78, sel_layoutSubviews);
  valueLabel = self->_valueLabel;
  if (valueLabel)
  {
    -[UILabel sizeToFit](valueLabel, "sizeToFit");
    -[PSSubtitleDisclosureTableCell layoutManager](self, "layoutManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentRectForCell:forState:", self, 0);
    v6 = v5;
    v8 = v7;

    -[UILabel frame](self->_valueLabel, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = -[PSSubtitleDisclosureTableCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    -[PSSubtitleDisclosureTableCell traitCollection](self, "traitCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "preferredContentSizeCategory");
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v17);

    if (IsAccessibilityCategory)
    {
      -[PSSubtitleDisclosureTableCell detailTextLabel](self, "detailTextLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "frame");
      MaxX = v20;
      if (v15)
        MaxX = CGRectGetMaxX(*(CGRect *)&v20);

      v25 = self->_valueLabel;
      -[PSSubtitleDisclosureTableCell textLabel](self, "textLabel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "frame");
      -[UILabel sizeThatFits:](v25, "sizeThatFits:", CGRectGetWidth(v79), 1.79769313e308);
      v28 = v27;
      v30 = v29;

      v31 = 0.0;
      if (v15)
        v31 = v28;
      v32 = MaxX - v31;
      -[PSSubtitleDisclosureTableCell textLabel](self, "textLabel");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "frame");
      v35 = v34;
      v37 = v36;
      v39 = v38;
      v41 = v40;

      v80.origin.x = v32;
      v80.origin.y = v10;
      v80.size.width = v28;
      v80.size.height = v30;
      v42 = v37 - CGRectGetHeight(v80) * 0.5;
      -[PSSubtitleDisclosureTableCell textLabel](self, "textLabel");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setFrame:", v35, v42, v39, v41);

      -[PSSubtitleDisclosureTableCell detailTextLabel](self, "detailTextLabel");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "frame");
      v46 = v45;
      v48 = v47;
      v50 = v49;
      v52 = v51;

      v81.origin.x = v32;
      v81.origin.y = v10;
      v81.size.width = v28;
      v81.size.height = v30;
      v53 = v48 - CGRectGetHeight(v81) * 0.5;
      -[PSSubtitleDisclosureTableCell detailTextLabel](self, "detailTextLabel");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setFrame:", v46, v53, v50, v52);

      -[PSSubtitleDisclosureTableCell detailTextLabel](self, "detailTextLabel");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "frame");
      MaxY = CGRectGetMaxY(v82);

      -[UILabel setFrame:](self->_valueLabel, "setFrame:", v32, MaxY, v28, v30);
    }
    else
    {
      if (v15)
        v57 = 0.0;
      else
        v57 = v6 - v12;
      v58 = (v8 - v14) * 0.5;
      v59 = floorf(v58);
      -[UILabel setFrame:](self->_valueLabel, "setFrame:", v57, v59, v12, v14);
      -[PSSubtitleDisclosureTableCell textLabel](self, "textLabel");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "frame");
      v62 = v61;
      v64 = v63;
      v66 = v65;
      v68 = v67;

      v77 = v64;
      if ((v15 & 1) != 0)
      {
        v83.origin.x = v57;
        v83.origin.y = v59;
        v83.size.width = v12;
        v83.size.height = v14;
        v59 = v64;
        v69 = CGRectGetMaxX(v83);
        v57 = v62;
        v12 = v66;
        v14 = v68;
      }
      else
      {
        v84.origin.x = v62;
        v84.origin.y = v64;
        v84.size.width = v66;
        v84.size.height = v68;
        v69 = CGRectGetMaxX(v84);
      }
      v85.origin.x = v57;
      v85.origin.y = v59;
      v85.size.width = v12;
      v85.size.height = v14;
      v70 = v69 - CGRectGetMinX(v85);
      -[PSSubtitleDisclosureTableCell contentAccessoryPadding](self, "contentAccessoryPadding");
      if (v70 + v71 > 0.0)
      {
        -[PSSubtitleDisclosureTableCell contentAccessoryPadding](self, "contentAccessoryPadding");
        v73 = v70 + v72;
        v74 = v66 - v73;
        if (!v15)
          v73 = -0.0;
        v75 = v62 + v73;
        -[PSSubtitleDisclosureTableCell textLabel](self, "textLabel");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "setFrame:", v75, v77, v74, v68);

      }
    }
  }
}

- (BOOL)canReload
{
  return 1;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSSubtitleDisclosureTableCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v5, sel_refreshCellContentsWithSpecifier_, v4);
  -[PSSubtitleDisclosureTableCell _valueLabelForSpecifier:](self, "_valueLabelForSpecifier:", v4, v5.receiver, v5.super_class);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  UILabel *valueLabel;
  void *v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGSize result;
  CGRect v19;

  height = a3.height;
  width = a3.width;
  v17.receiver = self;
  v17.super_class = (Class)PSSubtitleDisclosureTableCell;
  -[PSSubtitleDisclosureTableCell sizeThatFits:](&v17, sel_sizeThatFits_);
  v7 = v6;
  v9 = v8;
  -[PSSubtitleDisclosureTableCell traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredContentSizeCategory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v11))
  {
    valueLabel = self->_valueLabel;

    if (valueLabel)
    {
      -[PSSubtitleDisclosureTableCell textLabel](self, "textLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "frame");
      CGRectGetMinX(v19);

      -[UILabel sizeThatFits:](self->_valueLabel, "sizeThatFits:", width, height);
      v9 = v9 + v14;
    }
  }
  else
  {

  }
  v15 = v7;
  v16 = v9;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabel, 0);
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_valueLabel, a3);
}

@end
