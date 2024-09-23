@implementation PKEditPassesTableViewCell

- (PKEditPassesTableViewCell)initWithReuseIdentifier:(id)a3 showImage:(BOOL)a4
{
  PKEditPassesTableViewCell *v5;
  PKEditPassesTableViewCell *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKEditPassesTableViewCell;
  v5 = -[PKEditPassesTableViewCell initWithStyle:reuseIdentifier:](&v15, sel_initWithStyle_reuseIdentifier_, 3, a3);
  v6 = v5;
  if (v5)
  {
    -[PKEditPassesTableViewCell textLabel](v5, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v8);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v9);

    -[PKEditPassesTableViewCell detailTextLabel](v6, "detailTextLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v12);

    v6->_showImage = a4;
    -[PKEditPassesTableViewCell imageView](v6, "imageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentMode:", 1);
    objc_msgSend(v13, "setClipsToBounds:", 1);
    objc_msgSend(v13, "setHidden:", !v6->_showImage);
    objc_msgSend((id)objc_opt_class(), "separatorInset");
    -[PKEditPassesTableViewCell setSeparatorInset:](v6, "setSeparatorInset:");

  }
  return v6;
}

- (void)layoutSubviews
{
  int v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double MaxX;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat rect;
  objc_super v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  v53.receiver = self;
  v53.super_class = (Class)PKEditPassesTableViewCell;
  -[PKEditPassesTableViewCell layoutSubviews](&v53, sel_layoutSubviews);
  v3 = -[PKEditPassesTableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (!self->_showImage)
    return;
  v4 = v3;
  -[PKEditPassesTableViewCell textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKEditPassesTableViewCell detailTextLabel](self, "detailTextLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKEditPassesTableViewCell imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKEditPassesTableViewCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutMargins");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v8, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  rect = v19;
  v20 = v10 + v12;
  objc_msgSend(v7, "image");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
    objc_msgSend(v21, "pkui_alignmentSize");
  else
    +[PKEditPassesTableViewCell imageSizeNeeded](PKEditPassesTableViewCell, "imageSizeNeeded");
  v25 = v23;
  v26 = v24;
  v27 = v10 + v14;
  v28 = v16 + 0.0;
  v29 = v18 - v20;
  if (!+[PKEditPassesTableViewCell needsFullPassImage](PKEditPassesTableViewCell, "needsFullPassImage")
    && -[PKPass style](self->_pass, "style") != 6)
  {
    v54.origin.x = v10 + v14;
    v54.origin.y = v28;
    v54.size.width = v29;
    v54.size.height = rect;
    v33 = CGRectGetMaxY(v54) - v26;
    v30 = v25;
    goto LABEL_11;
  }
  v30 = v25;
  if (!v22)
  {
    v33 = v28 + 8.0;
LABEL_11:
    v31 = v26;
    goto LABEL_12;
  }
  v31 = v26;
  PKFloatCeilToPixel();
  v33 = v28 + v32;
LABEL_12:
  v34 = v27;
  if (v4)
  {
    v55.origin.x = v27;
    v55.origin.y = v28;
    v55.size.width = v29;
    v55.size.height = rect;
    v34 = CGRectGetMaxX(v55) - v30;
  }
  v50 = v28;
  v51 = v29;
  objc_msgSend(v7, "frameForAlignmentRect:", v34, v33, v30, v31);
  objc_msgSend(v7, "setFrame:");
  objc_msgSend(v5, "frame");
  v36 = v35;
  v38 = v37;
  objc_msgSend(v6, "frame");
  v40 = v39;
  v41 = v30;
  v43 = v42;
  if ((v4 & 1) != 0)
  {
    MaxX = v34 + -12.0;
  }
  else
  {
    v45 = v34;
    v46 = v33;
    v47 = v31;
    v48 = CGRectGetMaxX(*(CGRect *)(&v41 - 2)) + 12.0;
    v56.origin.x = v27;
    v56.origin.y = v50;
    v56.size.width = v51;
    v56.size.height = rect;
    MaxX = CGRectGetMaxX(v56);
    v27 = v48;
  }
  v49 = MaxX - v27;
  objc_msgSend(v5, "setFrame:", v27, v36, MaxX - v27, v38);
  objc_msgSend(v6, "setFrame:", v27, v40, v49, v43);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKEditPassesTableViewCell;
  -[PKEditPassesTableViewCell prepareForReuse](&v6, sel_prepareForReuse);
  -[PKEditPassesTableViewCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[PKEditPassesTableViewCell detailTextLabel](self, "detailTextLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", 0);

  -[PKEditPassesTableViewCell setPass:](self, "setPass:", 0);
  -[PKEditPassesTableViewCell imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", 0);
  objc_msgSend(v5, "setHidden:", !self->_showImage);

}

- (void)setImage:(id)a3 forPass:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  if (self->_showImage)
  {
    v11 = v6;
    v7 = a4;
    -[PKEditPassesTableViewCell imageView](self, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPass uniqueID](self->_pass, "uniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v7) = objc_msgSend(v9, "isEqualToString:", v10);
    if ((_DWORD)v7)
    {
      objc_msgSend(v8, "setImage:", v11);
      objc_msgSend(v8, "setAccessibilityIgnoresInvertColors:", 1);
      -[PKEditPassesTableViewCell setNeedsLayout](self, "setNeedsLayout");
    }

    v6 = v11;
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGSize result;

  v6.receiver = self;
  v6.super_class = (Class)PKEditPassesTableViewCell;
  -[PKEditPassesTableViewCell sizeThatFits:](&v6, sel_sizeThatFits_, a3.width, a3.height);
  v5 = fmax(v4, 64.0);
  result.height = v5;
  result.width = v3;
  return result;
}

+ (CGSize)imageSizeNeeded
{
  double v3;
  double v4;
  int v5;
  double v6;
  double v7;
  CGSize result;

  +[PKEditPassesTableViewCell height](PKEditPassesTableViewCell, "height");
  v4 = v3;
  v5 = objc_msgSend(a1, "needsFullPassImage");
  v6 = v4 + -8.0;
  v7 = 80.0;
  if (v5)
    v7 = 36.0;
  result.height = v6;
  result.width = v7;
  return result;
}

+ (double)height
{
  return 64.0;
}

+ (BOOL)needsFullPassImage
{
  return PKUIGetMinScreenWidthType() == 0;
}

+ (UIEdgeInsets)separatorInset
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v2 = PKUIGetMinScreenWidthType();
  v3 = 44.0;
  if (v2)
    v3 = 45.0;
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v3;
  result.top = v4;
  return result;
}

- (PKPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);
}

- (BOOL)showImage
{
  return self->_showImage;
}

- (void)setShowImage:(BOOL)a3
{
  self->_showImage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
