@implementation UIAccessibilityImageOnlyHUDLayoutManager

- (CGSize)minimumUnscaledSizeForHUD:(id)a3 preferredLabelSize:(CGSize)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = 107.0;
  v5 = 139.0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGRect)imageViewFrameForHUD:(id)a3 preferredSizeForLabel:(CGSize)a4
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
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
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
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGRect result;

  height = a4.height;
  width = a4.width;
  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = a3;
  -[UIAccessibilityHUDLayoutManager imageViewSizeForHUD:preferredSizeForLabel:](self, "imageViewSizeForHUD:preferredSizeForLabel:", v9, width, height);
  v11 = v10;
  v13 = v12;
  -[UIAccessibilityHUDLayoutManager layoutBoundsForHUD:](self, "layoutBoundsForHUD:", v9);
  v16 = v15 + v14 * 0.5;
  v19 = v18 + v17 * 0.5;
  objc_msgSend(v9, "window");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "screen");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "scale");
  UIRectCenteredAboutPointScale(v7, v8, v11, v13, v16, v19, v22);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;

  -[UIAccessibilityHUDLayoutManager imageInsetsForHUD:](self, "imageInsetsForHUD:", v9);
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;

  v39 = v24 + v34;
  v40 = v26 + v32;
  v41 = v28 - (v34 + v38);
  v42 = v30 - (v32 + v36);
  result.size.height = v42;
  result.size.width = v41;
  result.origin.y = v40;
  result.origin.x = v39;
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
