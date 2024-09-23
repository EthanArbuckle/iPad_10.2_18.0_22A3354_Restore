@implementation UIFocusContainerGuideMapEntry

void __59___UIFocusContainerGuideMapEntry_visualRepresentationColor__block_invoke()
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
  +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.6, 1.0, 1.0, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.61, 1.0, 1.0, 1.0, v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v1;
  +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.62, 1.0, 1.0, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v2;
  +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.63, 1.0, 1.0, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v3;
  +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.64, 1.0, 1.0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ECD7B760;
  qword_1ECD7B760 = v5;

}

@end
