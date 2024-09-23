@implementation UIAccessibilityCustomViewHUDLayoutManager

- (void)layoutSubviewsOfHUD:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  objc_msgSend(v13, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  objc_msgSend(v13, "containerViewForLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "customView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v6)
    objc_msgSend(v6, "addSubview:", v7);
  -[UIAccessibilityHUDLayoutManager layoutBoundsForHUD:](self, "layoutBoundsForHUD:", v13);
  objc_msgSend(v7, "setBounds:");
  objc_msgSend(v7, "sizeToFit");
  objc_msgSend(v6, "bounds");
  objc_msgSend(v7, "setCenter:", v10 + v9 * 0.5, v12 + v11 * 0.5);

}

- (CGSize)minimumUnscaledSizeForHUD:(id)a3 preferredLabelSize:(CGSize)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = 220.0;
  v5 = 220.0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)preferredSizeForLabelInHUD:(id)a3 maximumWidth:(double)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = *MEMORY[0x1E0C9D820];
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

@end
