@implementation UIStatusBarBatteryItemView

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  uint64_t v5;
  int v6;
  int v7;
  char v8;
  int capacity;
  BOOL v10;
  _BOOL4 v11;

  v5 = objc_msgSend(a3, "rawData");
  v6 = (int)(float)(ceilf((float)*(int *)(v5 + 2104) / 5.0) * 5.0);
  v7 = *(_DWORD *)(v5 + 2108);
  v8 = *(_BYTE *)(v5 + 2536);
  capacity = self->_capacity;
  v10 = capacity != v6;
  if (capacity != v6)
    self->_capacity = v6;
  v11 = v8 & 1;
  if (v7 != self->_state)
  {
    self->_state = v7;
    v10 = 1;
  }
  if (v11 != self->_batterySaverModeActive)
  {
    self->_batterySaverModeActive = v11;
    v10 = 1;
  }
  -[UIStatusBarBatteryItemView _updateAccessoryImage](self, "_updateAccessoryImage");
  return v10;
}

- (CGSize)_batteryOffsetWithBackground:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  int v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  objc_msgSend(a3, "size");
  v5 = v4;
  v7 = v6;
  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "usesVerticalLayout");

  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "height");
  v12 = v11;

  if (v9)
    v13 = v12;
  else
    v13 = v5;
  if (v9)
    v14 = v7;
  else
    v14 = v12;
  v15 = (v13 - v5) * 0.5;
  v16 = (v14 - v7) * 0.5;
  result.height = v16;
  result.width = v15;
  return result;
}

- (BOOL)_needsAccessoryImage
{
  return self->_state != 0;
}

- (id)_accessoryImage
{
  void *v2;
  void *v3;

  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:", CFSTR("BatteryChargingAccessory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_contentsImage
{
  _BOOL8 v3;
  _BOOL8 v4;
  uint64_t v5;
  void *v6;
  int capacity;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  _QWORD *ContextStack;
  CGContext *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  int v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;

  v3 = -[UIStatusBarBatteryItemView _needsAccessoryImage](self, "_needsAccessoryImage");
  v4 = v3;
  if (self->_batterySaverModeActive)
    v5 = v3 | 2;
  else
    v5 = v3;
  -[UIStatusBarBatteryItemView cachedImageSet](self, "cachedImageSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (capacity = self->_capacity, capacity == -[UIStatusBarBatteryItemView cachedCapacity](self, "cachedCapacity"))
    && v4 == -[UIStatusBarBatteryItemView cachedImageHasAccessoryImage](self, "cachedImageHasAccessoryImage")
    && v5 == -[UIStatusBarBatteryItemView cachedBatteryStyle](self, "cachedBatteryStyle"))
  {
    -[UIStatusBarBatteryItemView cachedImageSet](self, "cachedImageSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIStatusBarItemView imageWithShadowNamed:](self, "imageWithShadowNamed:", CFSTR("BatteryDrainingBG"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "size");
    v12 = v11;
    v14 = v13;
    -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "usesVerticalLayout");

    if (v16)
      v17 = v14;
    else
      v17 = v12;
    if ((v16 & 1) == 0 && v4)
    {
      -[UIStatusBarBatteryItemView _accessoryImage](self, "_accessoryImage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "size");
      v20 = v19;
      -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "batteryAccessoryMargin");
      v17 = v12 + v20 + v22;

    }
    v23 = ceil(v17);
    -[UIStatusBarItemView beginImageContextWithMinimumWidth:](self, "beginImageContextWithMinimumWidth:", v23);
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1)
      v25 = 0;
    else
      v25 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    CGContextSaveGState(v25);
    -[UIStatusBarBatteryItemView _batteryOffsetWithBackground:](self, "_batteryOffsetWithBackground:", v10);
    v27 = v26;
    v29 = v28;
    if (v4)
    {
      -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "usesVerticalLayout");

      if (v31)
      {
        -[UIStatusBarBatteryItemView _accessoryImage](self, "_accessoryImage");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "size");
        v34 = v33;
        -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "batteryAccessoryMargin");
        v27 = v27 + (v34 + v36) * -0.5;

      }
    }
    -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "scale");
    v39 = v38;

    CGContextTranslateCTM(v25, round(v27 * v39) / v39, round(v29 * v39) / v39);
    objc_msgSend(v10, "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "drawBatteryInsidesWithSize:capacity:style:", self->_capacity, v5, v12, v14);

    -[UIStatusBarItemView imageFromImageContextClippedToWidth:](self, "imageFromImageContextClippedToWidth:", v23);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    CGContextRestoreGState(v25);
    -[UIStatusBarItemView endImageContext](self, "endImageContext");
    objc_msgSend(v9, "shadowImage");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UILegibilityImageSet imageFromImage:withShadowImage:](_UILegibilityImageSet, "imageFromImage:withShadowImage:", v41, v42);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIStatusBarBatteryItemView setCachedImageSet:](self, "setCachedImageSet:", v8);
    -[UIStatusBarBatteryItemView setCachedCapacity:](self, "setCachedCapacity:", self->_capacity);
    -[UIStatusBarBatteryItemView setCachedImageHasAccessoryImage:](self, "setCachedImageHasAccessoryImage:", v4);
    -[UIStatusBarBatteryItemView setCachedBatteryStyle:](self, "setCachedBatteryStyle:", v5);

  }
  return v8;
}

- (id)contentsImage
{
  void *v3;
  uint64_t v4;

  -[UIStatusBarBatteryItemView _contentsImage](self, "_contentsImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIStatusBarItemView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    objc_msgSend(v3, "imageSetWithOrientation:", 4);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (double)extraRightPadding
{
  void *v3;
  int v4;
  double result;
  objc_super v6;

  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "usesVerticalLayout");

  result = -1.0;
  if (v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)UIStatusBarBatteryItemView;
    -[UIStatusBarItemView extraRightPadding](&v6, sel_extraRightPadding, -1.0);
  }
  return result;
}

- (void)_updateAccessoryImage
{
  _BOOL4 v3;
  UIView *accessoryView;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  uint64_t v15;
  _UILegibilityView *v16;
  UIView *v17;
  double MinX;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  UIImageView *v26;
  UIView *v27;
  double MaxX;
  double v29;
  double MidY;
  void *v31;
  int v32;
  double MidX;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v3 = -[UIStatusBarBatteryItemView _needsAccessoryImage](self, "_needsAccessoryImage");
  accessoryView = self->_accessoryView;
  if (v3)
  {
    if (accessoryView)
    {
LABEL_14:
      v22 = 0;
      goto LABEL_15;
    }
    -[UIStatusBarBatteryItemView _accessoryImage](self, "_accessoryImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bounds](self, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "legibilityStyle");

    if (v15)
    {
      v16 = -[_UILegibilityView initWithStyle:image:]([_UILegibilityView alloc], "initWithStyle:image:", v15, v5);
      v17 = self->_accessoryView;
      self->_accessoryView = &v16->super;

      if (-[UIStatusBarItemView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
      {
        v40.origin.x = v7;
        v40.origin.y = v9;
        v40.size.width = v11;
        v40.size.height = v13;
        MinX = CGRectGetMinX(v40);
        objc_msgSend(v5, "size");
        v20 = MinX + v19 * 0.5;
        v21 = 44;
LABEL_11:
        v42.origin.x = v7;
        v42.origin.y = v9;
        v42.size.width = v11;
        v42.size.height = v13;
        MidY = CGRectGetMidY(v42);
        -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "usesVerticalLayout");

        if (v32)
        {
          v43.origin.x = v7;
          v43.origin.y = v9;
          v43.size.width = v11;
          v43.size.height = v13;
          MidX = CGRectGetMidX(v43);
          -[UIStatusBarItemView imageWithShadowNamed:](self, "imageWithShadowNamed:", CFSTR("BatteryDrainingBG"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "image");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "size");
          v37 = MidX + v36 * 0.5;
          -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "batteryAccessoryMargin");
          v20 = v37 + v39 * 0.5;

        }
        -[UIView setCenter:](self->_accessoryView, "setCenter:", v20, MidY);
        -[UIView setAutoresizingMask:](self->_accessoryView, "setAutoresizingMask:", v21);
        -[UIView addSubview:](self, "addSubview:", self->_accessoryView);

        accessoryView = self->_accessoryView;
        goto LABEL_14;
      }
    }
    else
    {
      v23 = v5;
      if (-[UIStatusBarItemView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
      {
        v24 = objc_retainAutorelease(v23);
        v25 = objc_msgSend(v24, "CGImage");
        objc_msgSend(v24, "scale");
        +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v25, 4);
        v23 = (id)objc_claimAutoreleasedReturnValue();

      }
      v26 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v23);
      v27 = self->_accessoryView;
      self->_accessoryView = &v26->super;

      -[UIStatusBarItemView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    }
    v41.origin.x = v7;
    v41.origin.y = v9;
    v41.size.width = v11;
    v41.size.height = v13;
    MaxX = CGRectGetMaxX(v41);
    objc_msgSend(v5, "size");
    v20 = MaxX + v29 * -0.5;
    v21 = 41;
    goto LABEL_11;
  }
  v22 = 1;
LABEL_15:
  -[UIView setHidden:](accessoryView, "setHidden:", v22);
}

- (double)legibilityStrength
{
  return 0.15;
}

- (id)accessibilityHUDRepresentation
{
  _BOOL4 v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  int v12;
  void *v13;
  double v14;
  void *v15;
  UIAccessibilityHUDItem *v16;
  void *v17;
  UIAccessibilityHUDItem *v18;

  v3 = -[UIStatusBarBatteryItemView _needsAccessoryImage](self, "_needsAccessoryImage");
  v4 = v3;
  if (self->_batterySaverModeActive)
    v5 = v3 | 2;
  else
    v5 = v3;
  if (-[UIStatusBarBatteryItemView cachedAXHUDCapacity](self, "cachedAXHUDCapacity") != self->_capacity
    || -[UIStatusBarBatteryItemView cachedAXHUDStyle](self, "cachedAXHUDStyle") != v5
    || (-[UIStatusBarBatteryItemView cachedAXHUDImage](self, "cachedAXHUDImage"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "batteryColorForCapacity:style:usingTintColor:", self->_capacity, v5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "userInterfaceStyle") == 2)
      +[UIColor whiteColor](UIColor, "whiteColor");
    else
      +[UIColor blackColor](UIColor, "blackColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (float)((float)self->_capacity / 100.0);
    v12 = -[UIStatusBarItemView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    -[UIView _screen](self, "_screen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");
    UIStatusBarCreateHUDBatteryImage(v8, v10, v4, v12, 0, v11, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStatusBarBatteryItemView setCachedAXHUDImage:](self, "setCachedAXHUDImage:", v15);

    -[UIStatusBarBatteryItemView setCachedAXHUDCapacity:](self, "setCachedAXHUDCapacity:", self->_capacity);
    -[UIStatusBarBatteryItemView setCachedAXHUDStyle:](self, "setCachedAXHUDStyle:", v5);

  }
  v16 = [UIAccessibilityHUDItem alloc];
  -[UIStatusBarBatteryItemView cachedAXHUDImage](self, "cachedAXHUDImage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:scaleImage:](v16, "initWithTitle:image:imageInsets:scaleImage:", 0, v17, 0, 0.0, 0.0, 0.0, 0.0);

  -[UIAccessibilityHUDItem setFlattenImage:](v18, "setFlattenImage:", 0);
  return v18;
}

- (_UILegibilityImageSet)cachedImageSet
{
  return self->_cachedImageSet;
}

- (void)setCachedImageSet:(id)a3
{
  objc_storeStrong((id *)&self->_cachedImageSet, a3);
}

- (int)cachedCapacity
{
  return self->_cachedCapacity;
}

- (void)setCachedCapacity:(int)a3
{
  self->_cachedCapacity = a3;
}

- (BOOL)cachedImageHasAccessoryImage
{
  return self->_cachedImageHasAccessoryImage;
}

- (void)setCachedImageHasAccessoryImage:(BOOL)a3
{
  self->_cachedImageHasAccessoryImage = a3;
}

- (unint64_t)cachedBatteryStyle
{
  return self->_cachedBatteryStyle;
}

- (void)setCachedBatteryStyle:(unint64_t)a3
{
  self->_cachedBatteryStyle = a3;
}

- (int)cachedAXHUDCapacity
{
  return self->_cachedAXHUDCapacity;
}

- (void)setCachedAXHUDCapacity:(int)a3
{
  self->_cachedAXHUDCapacity = a3;
}

- (unint64_t)cachedAXHUDStyle
{
  return self->_cachedAXHUDStyle;
}

- (void)setCachedAXHUDStyle:(unint64_t)a3
{
  self->_cachedAXHUDStyle = a3;
}

- (UIImage)cachedAXHUDImage
{
  return self->_cachedAXHUDImage;
}

- (void)setCachedAXHUDImage:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAXHUDImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAXHUDImage, 0);
  objc_storeStrong((id *)&self->_cachedImageSet, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
}

@end
