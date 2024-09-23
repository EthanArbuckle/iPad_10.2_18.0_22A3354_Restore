@implementation UIFocusableRegionMapEntry

void __55___UIFocusableRegionMapEntry_visualRepresentationColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.53, 1.0, 1.0, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.54, 1.0, 1.0, 1.0, v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v1;
  +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.55, 1.0, 1.0, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v2;
  +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.56, 1.0, 1.0, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v3;
  +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.57, 1.0, 1.0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ECD7B740;
  qword_1ECD7B740 = v5;

}

void __55___UIFocusableRegionMapEntry_visualRepresentationColor__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.75, 1.0, 1.0, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.76, 1.0, 1.0, 1.0, v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v1;
  +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.77, 1.0, 1.0, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v2;
  +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.78, 1.0, 1.0, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v3;
  +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.79, 1.0, 1.0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ECD7B750;
  qword_1ECD7B750 = v5;

}

@end
