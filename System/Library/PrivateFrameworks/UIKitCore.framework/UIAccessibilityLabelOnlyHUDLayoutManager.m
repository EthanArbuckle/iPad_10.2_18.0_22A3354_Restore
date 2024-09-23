@implementation UIAccessibilityLabelOnlyHUDLayoutManager

- (CGSize)unscaledSizeForHUD:(id)a3 containingSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  objc_super v15;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  objc_msgSend(v7, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)&v9 = 155.0;
  *(double *)&v10 = 155.0;
  if (!-[UIAccessibilityLabelOnlyHUDLayoutManager labelContainsSingleCharacter:](self, "labelContainsSingleCharacter:", v8))
  {
    v15.receiver = self;
    v15.super_class = (Class)UIAccessibilityLabelOnlyHUDLayoutManager;
    -[UIAccessibilityHUDLayoutManager unscaledSizeForHUD:containingSize:](&v15, sel_unscaledSizeForHUD_containingSize_, v7, width, height);
    v9 = v11;
    v10 = v12;
  }

  v13 = *(double *)&v9;
  v14 = *(double *)&v10;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)minimumUnscaledSizeForHUD:(id)a3 preferredLabelSize:(CGSize)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = a4.width + 32.0;
  v5 = a4.height + 48.0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGRect)labelFrameForHUD:(id)a3 preferredSize:(CGSize)a4
{
  double height;
  double width;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
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
  CGRect result;

  height = a4.height;
  width = a4.width;
  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = a3;
  -[UIAccessibilityHUDLayoutManager layoutBoundsForHUD:](self, "layoutBoundsForHUD:", v9);
  v12 = v11 + v10 * 0.5;
  v15 = v14 + v13 * 0.5;
  objc_msgSend(v9, "window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "screen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scale");
  UIRectCenteredAboutPointScale(v7, v8, width, height, v12, v15, v18);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  v27 = v20;
  v28 = v22;
  v29 = v24;
  v30 = v26;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (id)labelFontForHUD:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIAccessibilityLabelOnlyHUDLayoutManager labelContainsSingleCharacter:](self, "labelContainsSingleCharacter:", v5))
  {
    objc_msgSend(off_1E167A828, "systemFontOfSize:", 84.0);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIAccessibilityLabelOnlyHUDLayoutManager;
    -[UIAccessibilityHUDLayoutManager labelFontForHUD:](&v9, sel_labelFontForHUD_, v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (BOOL)labelContainsSingleCharacter:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;

  v3 = a3;
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v3, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rangeOfComposedCharacterSequenceAtIndex:", 0);
    v7 = v6;
    objc_msgSend(v3, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7 == objc_msgSend(v8, "length");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
