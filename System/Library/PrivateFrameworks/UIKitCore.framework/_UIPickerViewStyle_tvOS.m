@implementation _UIPickerViewStyle_tvOS

- (CGSize)defaultSizeForTraitCollection:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 480.0;
  v4 = 420.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)paddingBetweenWheels
{
  return 12.0;
}

- (double)paddingAroundWheels
{
  return 0.0;
}

- (double)labelSideOffset
{
  return 9.0;
}

- (void)configureMaskGradientLayer:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.0);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "CGColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.71);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "CGColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.8);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "CGColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v5;
  v11[1] = v7;
  v11[2] = v9;
  v11[3] = v9;
  v11[4] = v7;
  v11[5] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColors:", v10);

  objc_msgSend(v3, "setLocations:", &unk_1E1A933C8);
}

- (id)createCenterHighlightView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &__block_literal_global_201);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  objc_msgSend(v2, "_setContinuousCornerRadius:", 26.0);
  return v2;
}

- (double)horizontalPaddingForCenterHighlightView
{
  return 9.0;
}

- (double)verticalPaddingForCenterHighlightView
{
  return 16.0;
}

- (double)horizontalPaddingForContents
{
  return 9.0;
}

- (BOOL)highlightViewIsOverlay
{
  return 0;
}

@end
