@implementation _UIStepperButtonVisualProvider

- (BOOL)_shouldDefaultToTemplatesForImageViewBackground:(BOOL)a3
{
  return !a3;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  CGFloat height;
  double width;
  double y;
  double x;
  void *v8;
  int v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect v32;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIButtonLegacyVisualProvider button](self, "button");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isLeft");

  v10 = 1.0;
  if (!v9)
    v10 = 0.5;
  v11 = x + v10;
  v12 = y + 0.0;
  v13 = width + -1.5;
  -[UIButtonLegacyVisualProvider button](self, "button");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButtonLegacyVisualProvider button](self, "button");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageForState:", objc_msgSend(v15, "state"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "size");
  v18 = v17;
  v20 = v19;
  v31.origin.x = v11;
  v31.origin.y = v12;
  v31.size.width = v13;
  v31.size.height = height;
  CGRectGetMidX(v31);
  v32.origin.x = v11;
  v32.origin.y = v12;
  v32.size.width = v13;
  v32.size.height = height;
  CGRectGetMidY(v32);
  -[UIButtonLegacyVisualProvider button](self, "button");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToViewScale(v21);
  v23 = v22;

  -[UIButtonLegacyVisualProvider button](self, "button");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToViewScale(v24);
  v26 = v25;

  v27 = v23;
  v28 = v26;
  v29 = v18;
  v30 = v20;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

@end
