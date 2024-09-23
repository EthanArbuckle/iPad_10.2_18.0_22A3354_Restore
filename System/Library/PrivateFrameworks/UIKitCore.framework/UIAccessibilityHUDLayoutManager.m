@implementation UIAccessibilityHUDLayoutManager

- (CGSize)unscaledSizeForHUD:(id)a3 containingSize:(CGSize)a4
{
  CGFloat v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v5 = a4.width + -32.0;
  v6 = a3;
  -[UIAccessibilityHUDLayoutManager preferredSizeForLabelInHUD:maximumWidth:](self, "preferredSizeForLabelInHUD:maximumWidth:", v6, v5);
  -[UIAccessibilityHUDLayoutManager minimumUnscaledSizeForHUD:preferredLabelSize:](self, "minimumUnscaledSizeForHUD:preferredLabelSize:", v6);
  UIRoundToViewScale(v6);
  v8 = v7;
  UIRoundToViewScale(v6);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)minimumUnscaledSizeForHUD:(id)a3 preferredLabelSize:(CGSize)a4
{
  double v4;
  BOOL v5;
  double v6;
  double v7;
  CGSize result;

  v4 = a4.width + 32.0;
  v5 = a4.width < 75.0;
  v6 = 107.0;
  if (!v5)
    v6 = v4;
  v7 = a4.height + 123.0 + 24.0;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGRect)layoutBoundsForHUD:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[UIAccessibilityHUDLayoutManager containerViewForHUD:](self, "containerViewForHUD:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)containerViewForHUD:(id)a3
{
  return (id)objc_msgSend(a3, "containerViewForLayout");
}

- (id)itemContainerViewForHUD:(id)a3
{
  return (id)objc_msgSend(a3, "itemContainerViewForLayout");
}

- (UIEdgeInsets)imageInsetsForHUD:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  objc_msgSend(a3, "imageInsetsForLayout");
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (CGSize)imageViewSizeForHUD:(id)a3 preferredSizeForLabel:(CGSize)a4
{
  double height;
  id v6;
  double v7;
  double v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  CGSize result;
  CGRect v26;

  height = a4.height;
  v6 = a3;
  -[UIAccessibilityHUDLayoutManager layoutBoundsForHUD:](self, "layoutBoundsForHUD:", v6);
  v7 = CGRectGetWidth(v26) + -32.0;
  if (height == 0.0)
    v8 = v7;
  else
    v8 = 80.0;
  objc_msgSend(v6, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "scaleImage");

  if (!v10)
    goto LABEL_12;
  objc_msgSend(v6, "item");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "image");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "size");
  v14 = v13;
  v16 = v15;

  *(double *)&v17 = 75.0;
  if (v14 >= 75.0 || (*(double *)&v18 = 75.0, v16 >= 75.0))
  {
    if (v14 > v7 || v16 > v8)
    {
      *(double *)&v17 = v7;
      *(double *)&v18 = v8;
      goto LABEL_13;
    }
LABEL_12:
    objc_msgSend(v6, "imageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sizeThatFits:", v7, v8);
    v17 = v21;
    v18 = v22;

  }
LABEL_13:

  v23 = *(double *)&v17;
  v24 = *(double *)&v18;
  result.height = v24;
  result.width = v23;
  return result;
}

- (CGRect)imageViewFrameForHUD:(id)a3 preferredSizeForLabel:(CGSize)a4
{
  double height;
  double width;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  CGFloat x;
  CGFloat y;
  CGFloat v14;
  CGFloat v15;
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
  double v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect result;

  height = a4.height;
  v35 = a4.height;
  width = a4.width;
  v33 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v34 = *MEMORY[0x1E0C9D648];
  v7 = a3;
  -[UIAccessibilityHUDLayoutManager imageViewSizeForHUD:preferredSizeForLabel:](self, "imageViewSizeForHUD:preferredSizeForLabel:", v7, width, height);
  v9 = v8;
  v11 = v10;
  -[UIAccessibilityHUDLayoutManager layoutBoundsForHUD:](self, "layoutBoundsForHUD:", v7);
  x = v36.origin.x;
  y = v36.origin.y;
  v14 = v36.size.width;
  v15 = v36.size.height;
  CGRectGetMinX(v36);
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = v14;
  v37.size.height = v15;
  CGRectGetWidth(v37);
  v38.origin.y = v33;
  v38.origin.x = v34;
  v16 = v9;
  v38.size.width = v9;
  v38.size.height = v11;
  CGRectGetWidth(v38);
  UIRoundToViewScale(v7);
  v18 = v17;
  -[UIAccessibilityHUDLayoutManager _imageCenterToTopForHUD:preferredSizeForLabel:](self, "_imageCenterToTopForHUD:preferredSizeForLabel:", v7, width, v35);
  UIRoundToViewScale(v7);
  v20 = v19;
  -[UIAccessibilityHUDLayoutManager imageInsetsForHUD:](self, "imageInsetsForHUD:", v7);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  v29 = v18 + v24;
  v30 = v20 + v22;
  v31 = v16 - (v24 + v28);
  v32 = v11 - (v22 + v26);
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (CGRect)labelFrameForHUD:(id)a3 preferredSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
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
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGRect v37;
  CGRect v38;
  CGRect result;

  height = a4.height;
  width = a4.width;
  v34 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v35 = *MEMORY[0x1E0C9D648];
  v7 = a3;
  -[UIAccessibilityHUDLayoutManager layoutBoundsForHUD:](self, "layoutBoundsForHUD:", v7);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = v8 + v12 * 0.5;
  v17 = v10 + v14 * 0.5;
  objc_msgSend(v7, "window");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "screen");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "scale");
  UIRectCenteredAboutPointScale(v35, v34, width, height, v16, v17, v20);
  v22 = v21;
  v24 = v23;
  v36 = v25;

  -[UIAccessibilityHUDLayoutManager _imageCenterToTopForHUD:preferredSizeForLabel:](self, "_imageCenterToTopForHUD:preferredSizeForLabel:", v7, width, height);
  v37.origin.x = v9;
  v37.origin.y = v11;
  v37.size.width = v13;
  v37.size.height = v15;
  CGRectGetHeight(v37);
  UIRoundToViewScale(v7);
  v27 = v26;
  v38.origin.x = v9;
  v38.origin.y = v11;
  v38.size.width = v13;
  v38.size.height = v15;
  CGRectGetHeight(v38);
  UIRoundToViewScale(v7);
  v29 = v28;

  if (v27 >= v29)
    v30 = v29;
  else
    v30 = v27;
  v31 = v22;
  v32 = v24;
  v33 = v36;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v30;
  result.origin.x = v31;
  return result;
}

- (id)labelFontForHUD:(id)a3
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleTitle1"));
}

- (CGSize)preferredSizeForLabelInHUD:(id)a3 maximumWidth:(double)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  objc_msgSend(a3, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", a4, 3.40282347e38);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviewsOfHUD:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double x;
  double y;
  double width;
  double height;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  id v22;
  CGRect v23;
  CGRect v24;

  v22 = a3;
  -[UIAccessibilityHUDLayoutManager itemContainerViewForHUD:](self, "itemContainerViewForHUD:", v22);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAccessibilityHUDLayoutManager layoutBoundsForHUD:](self, "layoutBoundsForHUD:", v22);
  -[UIAccessibilityHUDLayoutManager preferredSizeForLabelInHUD:maximumWidth:](self, "preferredSizeForLabelInHUD:maximumWidth:", v22, CGRectGetWidth(v23) + -32.0);
  v8 = v7;
  v10 = v9;
  -[UIAccessibilityHUDLayoutManager imageViewFrameForHUD:preferredSizeForLabel:](self, "imageViewFrameForHUD:preferredSizeForLabel:", v22);
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  if (CGRectIsEmpty(v24)
    || (objc_msgSend(v5, "image"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v15, !v15))
  {
    objc_msgSend(v5, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      objc_msgSend(v5, "removeFromSuperview");
  }
  else
  {
    objc_msgSend(v5, "superview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      objc_msgSend(v4, "addSubview:", v5);
    objc_msgSend(v5, "setFrame:", x, y, width, height);
  }
  objc_msgSend(v6, "text");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");

  objc_msgSend(v6, "superview");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    if (!v20)
      objc_msgSend(v4, "addSubview:", v6);
    LODWORD(v21) = 0.75;
    objc_msgSend(v6, "_setHyphenationFactor:", v21);
    -[UIAccessibilityHUDLayoutManager labelFrameForHUD:preferredSize:](self, "labelFrameForHUD:preferredSize:", v22, v8, v10);
    objc_msgSend(v6, "setFrame:");
  }
  else if (v20)
  {
    objc_msgSend(v6, "removeFromSuperview");
  }

}

- (unint64_t)_actualNumberOfLinesForLabelInHUD:(id)a3 preferredSize:(CGSize)a4
{
  double height;
  void *v5;
  void *v6;
  double v7;
  double v8;

  height = a4.height;
  objc_msgSend(a3, "titleLabel", a4.width);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_bodyLeading");
  v8 = v7;

  return vcvtad_u64_f64(height / v8);
}

- (double)_imageCenterToTopForHUD:(id)a3 preferredSizeForLabel:(CGSize)a4
{
  double height;
  double width;
  id v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v17;
  double v18;
  double MidY;
  CGRect v21;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  -[UIAccessibilityHUDLayoutManager layoutBoundsForHUD:](self, "layoutBoundsForHUD:", v7);
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    MidY = CGRectGetMidY(*(CGRect *)&v8);
  }
  else
  {
    v17 = dbl_186678140[-[UIAccessibilityHUDLayoutManager _actualNumberOfLinesForLabelInHUD:preferredSize:](self, "_actualNumberOfLinesForLabelInHUD:preferredSize:", v7, width, height) > 1];
    v21.origin.x = v12;
    v21.origin.y = v13;
    v21.size.width = v14;
    v21.size.height = v15;
    v18 = CGRectGetMaxY(v21) + -24.0 - height + -16.0 + -37.0;
    if (v17 >= v18)
      MidY = v18;
    else
      MidY = v17;
  }

  return MidY;
}

@end
