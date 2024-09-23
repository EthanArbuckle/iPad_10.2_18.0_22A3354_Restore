@implementation UIStatusBarBluetoothBatteryItemView

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  double v5;
  int v6;
  int capacity;

  v5 = (double)*(int *)(objc_msgSend(a3, "rawData") + 2264);
  if (v5 > 100.0)
    v5 = 100.0;
  v6 = (int)fmax(v5, 0.0);
  capacity = self->_capacity;
  if (capacity != v6)
    self->_capacity = v6;
  return capacity != v6;
}

- (double)_normalizedCapacity
{
  return (double)self->_capacity / 100.0;
}

- (id)contentsImage
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  _QWORD *ContextStack;
  CGContext *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  -[UIStatusBarItemView imageWithShadowNamed:](self, "imageWithShadowNamed:", CFSTR("HeadsetBatteryBG"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBarBluetoothBatteryItemView _normalizedCapacity](self, "_normalizedCapacity");
  v5 = v4;
  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bluetoothBatteryImageNameWithCapacity:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cachedImageNamed:inTempGroup:", v7, CFSTR("TempGroupBTBattery"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(v3, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "size");
    v12 = v11;
    v14 = v13;
    -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "usesVerticalLayout"))
      v16 = v14;
    else
      v16 = v12;

    -[UIStatusBarItemView beginImageContextWithMinimumWidth:](self, "beginImageContextWithMinimumWidth:", v16);
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1)
      v18 = 0;
    else
      v18 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    CGContextSaveGState(v18);
    -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "scale");
    v21 = v20;

    -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "height");
    v24 = (v23 - v14) * 0.5;

    CGContextTranslateCTM(v18, 0.0, round(v21 * v24) / v21);
    objc_msgSend(v10, "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "drawBluetoothBatteryInsidesWithSize:capacity:", v12, v14, v5);

    -[UIStatusBarItemView imageFromImageContextClippedToWidth:](self, "imageFromImageContextClippedToWidth:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CGContextRestoreGState(v18);
    -[UIStatusBarItemView endImageContext](self, "endImageContext");
    -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "cacheImage:named:inTempGroup:", v9, v7, CFSTR("TempGroupBTBattery"));

  }
  objc_msgSend(v3, "shadowImage");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UILegibilityImageSet imageFromImage:withShadowImage:](_UILegibilityImageSet, "imageFromImage:withShadowImage:", v9, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (double)extraLeftPadding
{
  void *v2;
  double v3;
  double v4;

  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bluetoothBatteryExtraPadding");
  v4 = v3;

  return v4;
}

- (UIEdgeInsets)_accessibilityHUDBatteryInsidesInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 2.0;
  v3 = 1.0;
  v4 = 1.0;
  v5 = 1.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)accessibilityHUDRepresentation
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _QWORD *ContextStack;
  CGContext *v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  __int128 v36;
  double v37;
  double v38;
  double v39;
  UIImage *v40;
  UIImage *accessibilityCachedHUDImage;
  UIAccessibilityHUDItem *v42;
  CGAffineTransform v44;
  CGAffineTransform v45;
  CGRect v46;
  CGRect v47;

  if (self->_capacity != self->_accessibilityCachedHUDCapacity || !self->_accessibilityCachedHUDImage)
  {
    -[UIStatusBarBluetoothBatteryItemView _normalizedCapacity](self, "_normalizedCapacity");
    v4 = v3;
    +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("AXHUD_HeadsetBatteryBG.png"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("AXHUD_HeadsetBatteryInsides.png"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bluetoothBatteryColorForCapacity:usingTintColor:", 0, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "_flatImageWithColor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "size");
    v11 = v10;
    objc_msgSend(v5, "size");
    v13 = 75.0 / v12;
    v14 = v11 * (75.0 / v12);
    v15 = v12 * (75.0 / v12);
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scale");
    _UIGraphicsBeginImageContextWithOptions(0, 0, v14, v15, v17);

    v18 = *MEMORY[0x1E0C9D538];
    v19 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v5, "size");
    v21 = v20;
    v23 = v22;
    objc_msgSend(v5, "drawInRect:", v18, v19, v13 * v20, v13 * v22);
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1)
      v25 = 0;
    else
      v25 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    -[UIStatusBarBluetoothBatteryItemView _accessibilityHUDBatteryInsidesInsets](self, "_accessibilityHUDBatteryInsidesInsets");
    v27 = v18 + v26;
    v29 = v19 + v28;
    v31 = v21 - (v26 + v30);
    v33 = v23 - (v28 + v32);
    v34 = v4 * v33;
    v35 = v29 + v33 - v34;
    v36 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v44.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v44.c = v36;
    *(_OWORD *)&v44.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    CGAffineTransformScale(&v45, &v44, v13, v13);
    v46.origin.x = v27;
    v46.origin.y = v35;
    v46.size.width = v31;
    v46.size.height = v34;
    v47 = CGRectApplyAffineTransform(v46, &v45);
    CGContextClipToRect(v25, v47);
    objc_msgSend(v9, "size");
    v38 = v13 * v37;
    objc_msgSend(v9, "size");
    objc_msgSend(v9, "drawInRect:", 0.0, 0.0, v38, v13 * v39);
    _UIGraphicsGetImageFromCurrentImageContext(0);
    v40 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    self->_accessibilityCachedHUDCapacity = self->_capacity;
    accessibilityCachedHUDImage = self->_accessibilityCachedHUDImage;
    self->_accessibilityCachedHUDImage = v40;

  }
  v42 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:", 0, self->_accessibilityCachedHUDImage, 0.0, 0.0, 0.0, 0.0);
  -[UIAccessibilityHUDItem setFlattenImage:](v42, "setFlattenImage:", 0);
  return v42;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityCachedHUDImage, 0);
}

@end
