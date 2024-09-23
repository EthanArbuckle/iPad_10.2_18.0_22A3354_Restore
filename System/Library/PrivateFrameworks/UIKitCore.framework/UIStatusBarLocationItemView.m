@implementation UIStatusBarLocationItemView

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  int v5;
  BOOL result;

  v5 = (*(unsigned __int8 *)(objc_msgSend(a3, "rawData") + 2529) >> 3) & 3;
  result = self->_iconType != v5;
  self->_iconType = v5;
  return result;
}

- (id)_imageName
{
  if (self->_iconType == 1)
    return CFSTR("Geofence");
  else
    return CFSTR("Location");
}

- (id)contentsImage
{
  void *v3;
  void *v4;

  -[UIStatusBarLocationItemView _imageName](self, "_imageName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBarItemView imageWithShadowNamed:](self, "imageWithShadowNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityHUDRepresentation
{
  UIAccessibilityHUDItem *v3;
  void *v4;
  void *v5;
  void *v6;
  UIAccessibilityHUDItem *v7;

  v3 = [UIAccessibilityHUDItem alloc];
  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBarLocationItemView _imageName](self, "_imageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityHUDImageNamed:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:scaleImage:](v3, "initWithTitle:image:imageInsets:scaleImage:", 0, v6, 1, 0.0, 0.0, 0.0, 0.0);

  return v7;
}

@end
