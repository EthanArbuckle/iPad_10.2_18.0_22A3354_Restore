@implementation PXPersonTableViewCell

- (PXPersonTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PXPersonTableViewCell *v4;
  PXPersonTableViewCell *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXPersonTableViewCell;
  v4 = -[PXPersonTableViewCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PXPersonTableViewCell setSeparatorInset:](v4, "setSeparatorInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGSize result;

  v11.receiver = self;
  v11.super_class = (Class)PXPersonTableViewCell;
  -[PXPersonTableViewCell sizeThatFits:](&v11, sel_sizeThatFits_, a3.width, a3.height);
  v4 = v3;
  v6 = v5;
  +[PXPersonTableViewCell avatarHeight](PXPersonTableViewCell, "avatarHeight");
  v8 = v7 + 16.0;
  if (v6 >= v8)
    v9 = v6;
  else
    v9 = v8;
  v10 = v4;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  int v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
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
  double MinX;
  double MaxX;
  double v32;
  double v33;
  void *v34;
  objc_super v35;
  CGRect v36;

  v35.receiver = self;
  v35.super_class = (Class)PXPersonTableViewCell;
  -[PXPersonTableViewCell layoutSubviews](&v35, sel_layoutSubviews);
  v3 = -[PXPersonTableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[PXPersonTableViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  +[PXPersonTableViewCell avatarHeight](PXPersonTableViewCell, "avatarHeight");
  v10 = v9;
  -[PXPersonTableViewCell imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;

  if (v3)
  {
    objc_msgSend(v4, "layoutMargins");
    v13 = v6 - v10 - v14;
  }
  v15 = (v8 - v10) * 0.5;
  -[PXPersonTableViewCell imageView](self, "imageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v13, v15, v10, v10);

  -[PXPersonTableViewCell textLabel](self, "textLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v26 = v13;
  v27 = v15;
  v28 = v10;
  v29 = v10;
  if (v3)
  {
    MinX = CGRectGetMinX(*(CGRect *)&v26);
    v36.origin.x = v19;
    v36.origin.y = v21;
    v36.size.width = v23;
    v36.size.height = v25;
    MaxX = MinX - CGRectGetWidth(v36);
    v32 = -16.0;
  }
  else
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v26);
    v32 = 16.0;
  }
  v33 = MaxX + v32;
  -[PXPersonTableViewCell textLabel](self, "textLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFrame:", v33, v21, v23, v25);

}

- (void)setPersonIcon:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PXPersonTableViewCell imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

  -[PXPersonTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (UIImage)personIcon
{
  void *v2;
  void *v3;

  -[PXPersonTableViewCell imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

+ (double)avatarHeight
{
  void *v2;
  NSString *v3;
  _BOOL4 IsAccessibilityCategory;
  double result;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  result = 48.0;
  if (IsAccessibilityCategory)
    return 64.0;
  return result;
}

@end
