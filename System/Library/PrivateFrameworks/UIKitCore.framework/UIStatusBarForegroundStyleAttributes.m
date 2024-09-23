@implementation UIStatusBarForegroundStyleAttributes

- (UIStatusBarForegroundStyleAttributes)initWithHeight:(double)a3 legibilityStyle:(int64_t)a4 tintColor:(id)a5 hasBusyBackground:(BOOL)a6 idiom:(int64_t)a7
{
  id v13;
  UIStatusBarForegroundStyleAttributes *v14;
  UIStatusBarForegroundStyleAttributes *v15;
  void *v16;
  objc_super v18;

  v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)UIStatusBarForegroundStyleAttributes;
  v14 = -[UIStatusBarForegroundStyleAttributes init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_height = a3;
    v14->_legibilityStyle = a4;
    v14->_idiom = a7;
    objc_storeStrong((id *)&v14->_tintColor, a5);
    if (v13)
    {
      +[UIColor blackColor](UIColor, "blackColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v15->_isTintColorBlack = objc_msgSend(v13, "isEqual:", v16);

    }
    else
    {
      v15->_isTintColorBlack = 1;
    }
    v15->_hasBusyBackground = a6;
  }

  return v15;
}

- (UIStatusBarForegroundStyleAttributes)initWithHeight:(double)a3 legibilityStyle:(int64_t)a4 tintColor:(id)a5 hasBusyBackground:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  UIStatusBarForegroundStyleAttributes *v11;

  v6 = a6;
  v10 = a5;
  v11 = -[UIStatusBarForegroundStyleAttributes initWithHeight:legibilityStyle:tintColor:hasBusyBackground:idiom:](self, "initWithHeight:legibilityStyle:tintColor:hasBusyBackground:idiom:", a4, v10, v6, _UIDeviceNativeUserInterfaceIdiom(), a3);

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_alloc_init((Class)objc_opt_class());
  *((_BYTE *)v4 + 56) = self->_canShowBreadcrumbs;
  objc_storeStrong((id *)v4 + 8, self->_tintColor);
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_height;
  *((_QWORD *)v4 + 2) = self->_legibilityStyle;
  *((_QWORD *)v4 + 3) = self->_idiom;
  v5 = -[NSMutableDictionary mutableCopy](self->_cachedFonts, "mutableCopy");
  v6 = (void *)*((_QWORD *)v4 + 4);
  *((_QWORD *)v4 + 4) = v5;

  *((_BYTE *)v4 + 40) = self->_isTintColorBlack;
  *((_BYTE *)v4 + 41) = self->_hasBusyBackground;
  v7 = -[NSString copy](self->_cachedUniqueIdentifier, "copy");
  v8 = (void *)*((_QWORD *)v4 + 6);
  *((_QWORD *)v4 + 6) = v7;

  return v4;
}

- (id)generateUniqueIdentifier
{
  void *v3;
  objc_class *v4;
  void *v5;
  double height;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  height = self->_height;
  -[UIStatusBarForegroundStyleAttributes scale](self, "scale");
  v8 = v7;
  -[UIColor styleString](self->_tintColor, "styleString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@_%.2f%.2f_%@"), v5, *(_QWORD *)&height, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)uniqueIdentifier
{
  NSString *cachedUniqueIdentifier;
  NSString *v4;
  NSString *v5;

  cachedUniqueIdentifier = self->_cachedUniqueIdentifier;
  if (!cachedUniqueIdentifier)
  {
    -[UIStatusBarForegroundStyleAttributes generateUniqueIdentifier](self, "generateUniqueIdentifier");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cachedUniqueIdentifier;
    self->_cachedUniqueIdentifier = v4;

    cachedUniqueIdentifier = self->_cachedUniqueIdentifier;
  }
  return cachedUniqueIdentifier;
}

- (double)height
{
  return self->_height;
}

- (int64_t)legibilityStyle
{
  return self->_legibilityStyle;
}

- (int64_t)activityIndicatorStyleWithSyncActivity:(BOOL)a3
{
  if (a3)
    return 7;
  else
    return 6;
}

- (double)batteryAccessoryMargin
{
  return 3.0;
}

- (double)_roundDimension:(double)a3
{
  double v4;
  double v5;
  double result;

  -[UIStatusBarForegroundStyleAttributes scale](self, "scale");
  v5 = round(v4 * a3) / v4;
  result = 1.0 / v4;
  if (result < v5)
    return v5;
  return result;
}

- (UIEdgeInsets)edgeInsetsForBatteryInsides
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  -[UIStatusBarForegroundStyleAttributes scale](self, "scale");
  if (v2 <= 2.5)
    v3 = 4.5;
  else
    v3 = 4.33333333;
  v4 = 2.0;
  v5 = 2.0;
  v6 = 2.0;
  result.right = v3;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (id)_batteryColorForCapacity:(int)a3 lowCapacity:(int)a4 style:(unint64_t)a5 usingTintColor:(BOOL)a6
{
  _BOOL4 v6;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v6 = a6;
  if ((a5 & 2) != 0)
  {
    +[UIColor systemYellowColor](UIColor, "systemYellowColor", *(_QWORD *)&a3, *(_QWORD *)&a4);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v8 = (void *)v9;
    if (v9 && !self->_hasBusyBackground)
      return v8;
    goto LABEL_10;
  }
  if (a3 <= a4)
  {
    +[UIColor systemRedColor](UIColor, "systemRedColor");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if ((a5 & 1) != 0)
  {
    +[UIColor systemGreenColor](UIColor, "systemGreenColor");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v8 = 0;
LABEL_10:
  if (v6)
  {
    -[UIStatusBarForegroundStyleAttributes tintColor](self, "tintColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "colorWithAlphaComponent:", 1.0);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = v10;
  }
  else
  {
    +[UIColor blackColor](UIColor, "blackColor");
    v11 = objc_claimAutoreleasedReturnValue();
  }

  v8 = (void *)v11;
  return v8;
}

- (id)batteryColorForCapacity:(int)a3 style:(unint64_t)a4 usingTintColor:(BOOL)a5
{
  return -[UIStatusBarForegroundStyleAttributes _batteryColorForCapacity:lowCapacity:style:usingTintColor:](self, "_batteryColorForCapacity:lowCapacity:style:usingTintColor:", *(_QWORD *)&a3, +[UIStatusBar lowBatteryLevel](UIStatusBar, "lowBatteryLevel"), a4, a5);
}

- (void)drawBatteryInsidesWithSize:(CGSize)a3 capacity:(int)a4 style:(unint64_t)a5
{
  -[UIStatusBarForegroundStyleAttributes drawBatteryInsidesWithSize:capacity:style:usingTintColor:](self, "drawBatteryInsidesWithSize:capacity:style:usingTintColor:", *(_QWORD *)&a4, a5, 1, a3.width, a3.height);
}

- (void)drawBatteryInsidesWithSize:(CGSize)a3 capacity:(int)a4 style:(unint64_t)a5 usingTintColor:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v8;
  double height;
  double width;
  _QWORD *ContextStack;
  CGContext *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  const CGPath *v27;
  const CGPath *v28;
  double v29;
  CGFloat v30;
  id v31;
  id v32;
  CGRect v33;
  CGRect v34;

  v6 = a6;
  v8 = *(_QWORD *)&a4;
  height = a3.height;
  width = a3.width;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v13 = 0;
  else
    v13 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  CGContextSaveGState(v13);
  -[UIStatusBarForegroundStyleAttributes batteryColorForCapacity:style:usingTintColor:](self, "batteryColorForCapacity:style:usingTintColor:", v8, a5, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v31 = v14;
    -[UIStatusBarForegroundStyleAttributes tintColor](self, "tintColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "alphaComponent");
    objc_msgSend(v31, "colorWithAlphaComponent:");
    v16 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v16;
  }
  v32 = v14;
  objc_msgSend(v14, "setFill");
  -[UIStatusBarForegroundStyleAttributes edgeInsetsForBatteryInsides](self, "edgeInsetsForBatteryInsides");
  v18 = v17 + 0.0;
  v20 = v19 + 0.0;
  v22 = width - (v17 + v21);
  v24 = height - (v19 + v23);
  -[UIStatusBarForegroundStyleAttributes scale](self, "scale");
  if (v25 <= 2.5)
    v26 = 1.0;
  else
    v26 = 1.33333333;
  v33.origin.x = v18;
  v33.origin.y = v20;
  v33.size.width = v22;
  v33.size.height = v24;
  v27 = CGPathCreateWithRoundedRect(v33, v26, v26, 0);
  if (v27)
  {
    v28 = v27;
    CGContextAddPath(v13, v27);
    CGContextClip(v13);
    CGPathRelease(v28);
  }
  v29 = (double)(int)v8 / 100.0 * v22;
  if (v29 < 1.0)
    v29 = 1.0;
  -[UIStatusBarForegroundStyleAttributes _roundDimension:](self, "_roundDimension:", v29);
  v34.size.width = v30;
  v34.origin.x = v18;
  v34.origin.y = v20;
  v34.size.height = v24;
  UIRectFillUsingBlendMode(v34, kCGBlendModeNormal);
  CGContextRestoreGState(v13);

}

- (UIEdgeInsets)edgeInsetsForBluetoothBatteryInsides
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[UIStatusBarForegroundStyleAttributes scale](self, "scale");
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

- (id)bluetoothBatteryImageNameWithCapacity:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;

  -[UIStatusBarForegroundStyleAttributes imageNamed:](self, "imageNamed:", CFSTR("HeadsetBatteryBG"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v6;
  -[UIStatusBarForegroundStyleAttributes edgeInsetsForBluetoothBatteryInsides](self, "edgeInsetsForBluetoothBatteryInsides");
  -[UIStatusBarForegroundStyleAttributes _roundDimension:](self, "_roundDimension:", (v7 - (v8 + v9)) * a3);
  v11 = v10;
  -[UIStatusBarForegroundStyleAttributes scale](self, "scale");
  LODWORD(v13) = vcvtpd_s64_f64(v11 * v12);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Battery_%u_%u"), v13, self->_hasBusyBackground);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)bluetoothBatteryColorForCapacity:(double)a3 usingTintColor:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  if (a3 <= 0.266666667)
  {
    +[UIColor systemRedColor](UIColor, "systemRedColor", a4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
    {
      v5 = 0;
LABEL_8:
      -[UIStatusBarForegroundStyleAttributes tintColor](self, "tintColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "colorWithAlphaComponent:", 1.0);
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v8;
      return v5;
    }
    +[UIColor blackColor](UIColor, "blackColor");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v6;
  if (!v6 || self->_hasBusyBackground)
    goto LABEL_8;
  return v5;
}

- (void)drawBluetoothBatteryInsidesWithSize:(CGSize)a3 capacity:(double)a4
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  CGFloat v18;
  id v19;

  height = a3.height;
  width = a3.width;
  -[UIStatusBarForegroundStyleAttributes bluetoothBatteryColorForCapacity:usingTintColor:](self, "bluetoothBatteryColorForCapacity:usingTintColor:", 1, a4);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "set");
  v8 = *MEMORY[0x1E0C9D538];
  v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[UIStatusBarForegroundStyleAttributes edgeInsetsForBluetoothBatteryInsides](self, "edgeInsetsForBluetoothBatteryInsides");
  v11 = v8 + v10;
  v13 = v9 + v12;
  v15 = width - (v10 + v14);
  v17 = height - (v12 + v16);
  -[UIStatusBarForegroundStyleAttributes _roundDimension:](self, "_roundDimension:", v17 * a4);
  UIRectFillUsingOperation(1, v11, v13 + v17 - v18, v15, v18);

}

- (void)_drawText:(id)a3 inRect:(CGRect)a4 withFont:(id)a5 lineBreakMode:(int64_t)a6 letterSpacing:(double)a7 textAlignment:(int64_t)a8
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  id v16;
  id v17;
  CGRect v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (a7 != 0.0 || a8 == 0)
  {
    v16 = a5;
    v17 = a3;
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    objc_msgSend(v17, "drawAtPoint:forWidth:withFont:lineBreakMode:letterSpacing:", v16, a6, x, y, CGRectGetWidth(v19), a7);
  }
  else
  {
    objc_msgSend(a3, "drawInRect:withFont:lineBreakMode:alignment:lineSpacing:", a5, a6, a8, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  }

}

- (double)textOffsetForStyle:(int64_t)a3
{
  return 2.0;
}

- (void)drawText:(id)a3 forWidth:(double)a4 lineBreakMode:(int64_t)a5 letterSpacing:(double)a6 textAlignment:(int64_t)a7 style:(int64_t)a8 textSize:(CGSize)a9 textHeight:(double)a10
{
  double height;
  double width;
  id v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  int64_t v29;
  double v30;
  int64_t v31;

  height = a9.height;
  width = a9.width;
  v19 = a3;
  -[UIStatusBarForegroundStyleAttributes textFontForStyle:](self, "textFontForStyle:", a8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBarForegroundStyleAttributes textOffsetForStyle:](self, "textOffsetForStyle:", a8);
  v22 = floor((height - a10) * 0.5) + v21 + -1.0;
  if (!a7)
    width = a4;
  -[UIStatusBarForegroundStyleAttributes textColorForStyle:](self, "textColorForStyle:", a8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __126__UIStatusBarForegroundStyleAttributes_drawText_forWidth_lineBreakMode_letterSpacing_textAlignment_style_textSize_textHeight___block_invoke;
  v26[3] = &unk_1E16DFCB8;
  v26[4] = self;
  v27 = v19;
  v28 = v20;
  v29 = a5;
  v30 = a6;
  v31 = a7;
  v24 = v20;
  v25 = v19;
  -[UIStatusBarForegroundStyleAttributes drawTextInRect:withColor:withBlock:](self, "drawTextInRect:withColor:withBlock:", v23, v26, 0.0, v22, width, height);

}

uint64_t __126__UIStatusBarForegroundStyleAttributes_drawText_forWidth_lineBreakMode_letterSpacing_textAlignment_style_textSize_textHeight___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  objc_msgSend(a2, "set");
  return objc_msgSend(*(id *)(a1 + 32), "_drawText:inRect:withFont:lineBreakMode:letterSpacing:textAlignment:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), a3, a4, a5, a6, *(double *)(a1 + 64));
}

- (void)drawTextInRect:(CGRect)a3 withColor:(id)a4 withBlock:(id)a5
{
  (*((void (**)(id, id, CGPoint, __n128, CGSize, __n128))a5 + 2))(a5, a4, a3.origin, *(__n128 *)&a3.origin.y, a3.size, *(__n128 *)&a3.size.height);
}

- (double)scale
{
  void *v2;
  double v3;
  double v4;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  return v4;
}

- (double)standardPadding
{
  return 6.0;
}

- (double)middlePadding
{
  return 6.0;
}

- (double)leftEdgePadding
{
  return 6.0;
}

- (double)rightEdgePadding
{
  uint64_t v2;
  double result;

  v2 = _UIDeviceNativeUserInterfaceIdiom();
  result = 6.0;
  if (v2 == 1)
    return 5.0;
  return result;
}

- (double)shadowPadding
{
  return 0.0;
}

- (id)_cachedImageNamed:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__170;
  v16 = __Block_byref_object_dispose__170;
  v17 = 0;
  _cacheAccessQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__UIStatusBarForegroundStyleAttributes__cachedImageNamed___block_invoke;
  block[3] = &unk_1E16B9698;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __58__UIStatusBarForegroundStyleAttributes__cachedImageNamed___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)a1[4];
  v3 = a1[5];
  objc_msgSend(v2, "uniqueIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cacheQueue_cachedImageNamed:inTempGroup:groupFullName:", v3, 0, v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)_cacheQueue_cachedImageNamed:(id)a3 inTempGroup:(id)a4 groupFullName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "stringByAppendingString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[UIStatusBarForegroundStyleAttributes expandedNameForImageName:](self, "expandedNameForImageName:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIStatusBarForegroundStyleAttributes tintColor](self, "tintColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "styleString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingString:", v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v16;
    }
    objc_msgSend(v10, "stringByAppendingString:", v9);
    v17 = objc_claimAutoreleasedReturnValue();

    v11 = v12;
    v10 = (id)v17;
  }
  +[UIStatusBarCache sharedInstance](UIStatusBarCache, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBarForegroundStyleAttributes scale](self, "scale");
  objc_msgSend(v18, "imageNamed:forGroup:withScale:", v11, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)cachedImageNamed:(id)a3 inTempGroup:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__170;
  v21 = __Block_byref_object_dispose__170;
  v22 = 0;
  _cacheAccessQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__UIStatusBarForegroundStyleAttributes_cachedImageNamed_inTempGroup___block_invoke;
  v13[3] = &unk_1E16C1A30;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, v13);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __69__UIStatusBarForegroundStyleAttributes_cachedImageNamed_inTempGroup___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  objc_msgSend(v2, "uniqueIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cacheQueue_cachedImageNamed:inTempGroup:groupFullName:", v3, v4, v8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)_cacheImage:(id)a3 named:(id)a4
{
  -[UIStatusBarForegroundStyleAttributes cacheImage:named:inTempGroup:](self, "cacheImage:named:inTempGroup:", a3, a4, 0);
}

- (void)_cacheQueue_cacheImage:(id)a3 named:(id)a4 inTempGroup:(id)a5 groupFullName:(id)a6 tintColor:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = a3;
  objc_msgSend(v23, "stringByAppendingString:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[UIStatusBarForegroundStyleAttributes expandedNameForImageName:](self, "expandedNameForImageName:", v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "styleString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringByAppendingString:", v18);
      v19 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v19;
    }
    objc_msgSend(v13, "stringByAppendingString:", v12);
    v20 = objc_claimAutoreleasedReturnValue();

    +[UIStatusBarCache sharedInstance](UIStatusBarCache, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeImagesInGroup:", v20);

    v13 = (id)v20;
    v16 = v17;
  }
  +[UIStatusBarCache sharedInstance](UIStatusBarCache, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "cacheImage:named:forGroup:", v15, v16, v13);

}

- (void)cacheImage:(id)a3 named:(id)a4 inTempGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  _cacheAccessQueue();
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__UIStatusBarForegroundStyleAttributes_cacheImage_named_inTempGroup___block_invoke;
  v15[3] = &unk_1E16B51E8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __69__UIStatusBarForegroundStyleAttributes_cacheImage_named_inTempGroup___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "uniqueIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cacheQueue_cacheImage:named:inTempGroup:groupFullName:tintColor:", v3, v4, v5, v7, v6);

}

- (id)uncachedImageNamed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  -[UIStatusBarForegroundStyleAttributes expandedNameForImageName:](self, "expandedNameForImageName:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR(".png"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__UIStatusBarForegroundStyleAttributes_uncachedImageNamed___block_invoke;
  v9[3] = &unk_1E16CB068;
  v9[4] = self;
  +[UITraitCollection traitCollectionWithTraits:](UITraitCollection, "traitCollectionWithTraits:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage _kitImageNamed:withTrait:](UIImage, "_kitImageNamed:withTrait:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __59__UIStatusBarForegroundStyleAttributes_uncachedImageNamed___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "scale");
  objc_msgSend(v4, "setDisplayScale:");
  objc_msgSend(v4, "setUserInterfaceIdiom:", objc_msgSend(*(id *)(a1 + 32), "idiom"));

}

- (id)untintedImageNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;

  v4 = a3;
  if (v4)
  {
    -[UIStatusBarForegroundStyleAttributes expandedNameForImageName:](self, "expandedNameForImageName:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStatusBarForegroundStyleAttributes _cachedImageNamed:](self, "_cachedImageNamed:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      -[UIStatusBarForegroundStyleAttributes uncachedImageNamed:](self, "uncachedImageNamed:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "size");
      v9 = v8;
      v11 = v10;
      -[UIStatusBarForegroundStyleAttributes scale](self, "scale");
      _UIGraphicsBeginImageContextWithOptions(0, 0, v9, v11, v12);
      objc_msgSend(v7, "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
      _UIGraphicsGetImageFromCurrentImageContext(0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      UIGraphicsEndImageContext();
      -[UIStatusBarForegroundStyleAttributes _cacheImage:named:](self, "_cacheImage:named:", v6, v5);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)imageNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  -[UIStatusBarForegroundStyleAttributes tintColor](self, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[UIStatusBarForegroundStyleAttributes expandedNameForImageName:](self, "expandedNameForImageName:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "styleString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIStatusBarForegroundStyleAttributes _cachedImageNamed:](self, "_cachedImageNamed:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      goto LABEL_8;
  }
  else
  {
    v8 = 0;
  }
  -[UIStatusBarForegroundStyleAttributes untintedImageNamed:](self, "untintedImageNamed:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v10;
  if (v5 && v10)
  {
    objc_msgSend(v10, "_flatImageWithColor:", v5);
    v11 = objc_claimAutoreleasedReturnValue();

    -[UIStatusBarForegroundStyleAttributes _cacheImage:named:](self, "_cacheImage:named:", v11, v8);
    v9 = (void *)v11;
  }
LABEL_8:

  return v9;
}

- (id)accessibilityHUDImageNamed:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(CFSTR("Black_"), "stringByAppendingString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR(".png"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)imageNamed:(id)a3 withLegibilityStyle:(int64_t)a4 legibilityStrength:(double)a5
{
  _BOOL4 isTintColorBlack;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  isTintColorBlack = self->_isTintColorBlack;
  v9 = a3;
  if (isTintColorBlack)
    -[UIStatusBarForegroundStyleAttributes untintedImageNamed:](self, "untintedImageNamed:", v9);
  else
    -[UIStatusBarForegroundStyleAttributes imageNamed:](self, "imageNamed:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBarForegroundStyleAttributes expandedNameForImageName:](self, "expandedNameForImageName:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIStatusBarForegroundStyleAttributes shadowImageForImage:withIdentifier:forStyle:withStrength:](self, "shadowImageForImage:withIdentifier:forStyle:withStrength:", v10, v11, a4, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[_UILegibilityImageSet imageFromImage:withShadowImage:](_UILegibilityImageSet, "imageFromImage:withShadowImage:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)shadowImageForImage:(id)a3 withIdentifier:(id)a4 forStyle:(int64_t)a5 withStrength:(double)a6
{
  return -[UIStatusBarForegroundStyleAttributes shadowImageForImage:withIdentifier:forStyle:withStrength:inTempGroup:](self, "shadowImageForImage:withIdentifier:forStyle:withStrength:inTempGroup:", a3, a4, a5, 0, a6);
}

- (id)shadowImageForImage:(id)a3 withIdentifier:(id)a4 forStyle:(int64_t)a5 withStrength:(double)a6 inTempGroup:(id)a7
{
  return -[UIStatusBarForegroundStyleAttributes shadowImageForImage:withIdentifier:forStyle:withStrength:inTempGroup:shouldCache:](self, "shadowImageForImage:withIdentifier:forStyle:withStrength:inTempGroup:shouldCache:", a3, a4, a5, a7, 1, a6);
}

- (id)shadowImageForImage:(id)a3 withIdentifier:(id)a4 forStyle:(int64_t)a5 withStrength:(double)a6 inTempGroup:(id)a7 shouldCache:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _UILegibilitySettings *v18;
  BOOL v19;

  v8 = a8;
  v14 = a3;
  v15 = a7;
  v16 = 0;
  if (v14 && a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("shadow_%@_%d_%.2f"), a4, a5, *(_QWORD *)&a6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8
      || (-[UIStatusBarForegroundStyleAttributes cachedImageNamed:inTempGroup:](self, "cachedImageNamed:inTempGroup:", v17, v15), (v16 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v18 = -[_UILegibilitySettings initWithStyle:]([_UILegibilitySettings alloc], "initWithStyle:", a5);
      objc_msgSend(v14, "_imageForLegibilitySettings:strength:", v18, a6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        v19 = !v8;
      else
        v19 = 1;
      if (!v19)
        -[UIStatusBarForegroundStyleAttributes cacheImage:named:inTempGroup:](self, "cacheImage:named:inTempGroup:", v16, v17, v15);

    }
  }

  return v16;
}

- (id)imageIdWithText:(id)a3 forWidth:(double)a4 lineBreakMode:(int64_t)a5 letterSpacing:(double)a6 style:(int64_t)a7
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;

  v12 = (void *)MEMORY[0x1E0CB3940];
  -[UIStatusBarForegroundStyleAttributes expandedNameForImageName:](self, "expandedNameForImageName:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBarForegroundStyleAttributes textColorForStyle:](self, "textColorForStyle:", a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "styleString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[UIStatusBarForegroundStyleAttributes idiom](self, "idiom");
  -[UIStatusBarForegroundStyleAttributes scale](self, "scale");
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@_%d_%.2f_%d_%@_%ld-%.2f"), v13, a5, *(_QWORD *)&a6, a7, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 != 1.79769313e308)
  {
    objc_msgSend(v18, "stringByAppendingFormat:", CFSTR("_%.2f"), *(_QWORD *)&a4);
    v19 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v19;
  }
  return v18;
}

- (id)imageWithText:(id)a3 ofItemType:(int)a4 forWidth:(double)a5 lineBreakMode:(int64_t)a6 letterSpacing:(double)a7 textAlignment:(int64_t)a8 style:(int64_t)a9 withLegibilityStyle:(int64_t)a10 legibilityStrength:(double)a11
{
  uint64_t v12;

  LOBYTE(v12) = 1;
  return -[UIStatusBarForegroundStyleAttributes imageWithText:ofItemType:forWidth:lineBreakMode:letterSpacing:textAlignment:style:withLegibilityStyle:legibilityStrength:shouldCache:](self, "imageWithText:ofItemType:forWidth:lineBreakMode:letterSpacing:textAlignment:style:withLegibilityStyle:legibilityStrength:shouldCache:", a3, *(_QWORD *)&a4, a6, a8, a9, a10, a5, a7, a11, v12);
}

- (id)imageWithText:(id)a3 ofItemType:(int)a4 forWidth:(double)a5 lineBreakMode:(int64_t)a6 letterSpacing:(double)a7 textAlignment:(int64_t)a8 style:(int64_t)a9 withLegibilityStyle:(int64_t)a10 legibilityStrength:(double)a11 shouldCache:(BOOL)a12
{
  uint64_t v19;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  void *v32;
  double v33;
  double v34;
  _QWORD *ContextStack;
  CGContext *v36;
  CGImageRef Image;
  CGImage *v38;
  double v39;
  CGFloat v40;
  CGImageRef v41;
  CGImageRef v42;
  void *v43;
  void *v44;
  uint64_t v45;
  UIStatusBarForegroundStyleAttributes *v46;
  void *v47;
  void *v48;
  int64_t v50;
  uint64_t v51;
  CGRect v52;

  v19 = *(_QWORD *)&a4;
  v21 = a3;
  if (objc_msgSend(v21, "length"))
  {
    v50 = a10;
    -[UIStatusBarForegroundStyleAttributes imageIdWithText:forWidth:lineBreakMode:letterSpacing:style:](self, "imageIdWithText:forWidth:lineBreakMode:letterSpacing:style:", v21, a6, a9, a5, a7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TempText%d"), v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TempTextShadow%d"), v19);
    v51 = objc_claimAutoreleasedReturnValue();
    if (!a12
      || (-[UIStatusBarForegroundStyleAttributes cachedImageNamed:inTempGroup:](self, "cachedImageNamed:inTempGroup:", v22, v23), (v24 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[UIStatusBarForegroundStyleAttributes textFontForStyle:](self, "textFontForStyle:", a9);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sizeWithFont:forWidth:lineBreakMode:letterSpacing:", v25, a6, a5, a7);
      v27 = v26;
      v29 = v28;
      if (-[UIStatusBarForegroundStyleAttributes usesVerticalLayout](self, "usesVerticalLayout"))
      {
        -[UIStatusBarForegroundStyleAttributes height](self, "height");
        v27 = v30;
        v31 = v29;
      }
      else
      {
        -[UIStatusBarForegroundStyleAttributes height](self, "height");
        v31 = v33;
      }
      -[UIStatusBarForegroundStyleAttributes scale](self, "scale");
      _UIGraphicsBeginImageContextWithOptions(0, 0, v27, v31, v34);
      ContextStack = GetContextStack(0);
      if (*(int *)ContextStack < 1)
        v36 = 0;
      else
        v36 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
      -[UIStatusBarForegroundStyleAttributes drawText:forWidth:lineBreakMode:letterSpacing:textAlignment:style:textSize:textHeight:](self, "drawText:forWidth:lineBreakMode:letterSpacing:textAlignment:style:textSize:textHeight:", v21, a6, a8, a9, a5, a7, v27, v31, v29);
      Image = CGBitmapContextCreateImage(v36);
      if (Image)
      {
        v38 = Image;
        -[UIStatusBarForegroundStyleAttributes scale](self, "scale");
        v40 = v27 * v39;
        v52.size.height = (double)CGImageGetHeight(v38);
        v52.origin.x = 0.0;
        v52.origin.y = 0.0;
        v52.size.width = v40;
        v41 = CGImageCreateWithImageInRect(v38, v52);
        if (v41)
        {
          v42 = v41;
          -[UIStatusBarForegroundStyleAttributes scale](self, "scale");
          +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v42, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          CFRelease(v42);
        }
        else
        {
          v24 = 0;
        }
        CFRelease(v38);
      }
      else
      {
        v24 = 0;
      }
      UIGraphicsEndImageContext();
      if (a12)
        -[UIStatusBarForegroundStyleAttributes cacheImage:named:inTempGroup:](self, "cacheImage:named:inTempGroup:", v24, v22, v23);

    }
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByTrimmingCharactersInSet:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "length");

    if (v45)
    {
      v46 = self;
      v47 = (void *)v51;
      -[UIStatusBarForegroundStyleAttributes shadowImageForImage:withIdentifier:forStyle:withStrength:inTempGroup:shouldCache:](v46, "shadowImageForImage:withIdentifier:forStyle:withStrength:inTempGroup:shouldCache:", v24, v22, v50, v51, a12, a11);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = 0;
      v47 = (void *)v51;
    }

  }
  else
  {
    v32 = 0;
    v24 = 0;
  }
  +[_UILegibilityImageSet imageFromImage:withShadowImage:](_UILegibilityImageSet, "imageFromImage:withShadowImage:", v24, v32);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  return v48;
}

- (id)cachedImageWithText:(id)a3 forWidth:(double)a4 lineBreakMode:(int64_t)a5 letterSpacing:(double)a6 textAlignment:(int64_t)a7 style:(int64_t)a8 itemType:(int)a9
{
  uint64_t v9;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v9 = *(_QWORD *)&a9;
  v15 = a3;
  if (objc_msgSend(v15, "length"))
  {
    -[UIStatusBarForegroundStyleAttributes imageIdWithText:forWidth:lineBreakMode:letterSpacing:style:](self, "imageIdWithText:forWidth:lineBreakMode:letterSpacing:style:", v15, a5, a8, a4, a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStatusBarForegroundStyleAttributes _cachedImageNamed:](self, "_cachedImageNamed:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TempText%d"), v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIStatusBarForegroundStyleAttributes cachedImageNamed:inTempGroup:](self, "cachedImageNamed:inTempGroup:", v16, v18);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)expandedNameForImageName:(id)a3
{
  return (id)objc_msgSend(CFSTR("Black_"), "stringByAppendingString:", a3);
}

- (id)textFontForStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  NSMutableDictionary *cachedFonts;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedFonts, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[UIStatusBarForegroundStyleAttributes makeTextFontForStyle:](self, "makeTextFontForStyle:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      cachedFonts = self->_cachedFonts;
      if (!cachedFonts)
      {
        v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v9 = self->_cachedFonts;
        self->_cachedFonts = v8;

        cachedFonts = self->_cachedFonts;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](cachedFonts, "setObject:forKeyedSubscript:", v6, v5);
    }
  }

  return v6;
}

- (BOOL)_shouldUseBoldFontForStyle:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  double v6;

  if (a3 > 2)
    return 1;
  -[UIStatusBarForegroundStyleAttributes scale](self, "scale", v3, v4);
  return v6 < 1.5;
}

- (id)makeTextFontForStyle:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;

  if (-[UIStatusBarForegroundStyleAttributes idiom](self, "idiom") == 1)
  {
    objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", 12.0, *(double *)off_1E167DC68);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 12.0;
    if (a3 == 2)
    {
      -[UIStatusBarForegroundStyleAttributes scale](self, "scale");
      if (v7 >= 1.5)
        v6 = 12.0;
      else
        v6 = 13.0;
    }
    if (-[UIStatusBarForegroundStyleAttributes _shouldUseBoldFontForStyle:](self, "_shouldUseBoldFontForStyle:", a3))
      objc_msgSend(off_1E167A828, "_opticalBoldSystemFontOfSize:", v6);
    else
      objc_msgSend(off_1E167A828, "_opticalSystemFontOfSize:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (double)baselineOffsetForStyle:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  -[UIStatusBarForegroundStyleAttributes textFontForStyle:](self, "textFontForStyle:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("A"), "sizeWithFont:forWidth:lineBreakMode:letterSpacing:", v5, 2, 1.79769313e308, 0.0);
  v7 = v6;
  -[UIStatusBarForegroundStyleAttributes height](self, "height");
  v9 = v8;
  -[UIStatusBarForegroundStyleAttributes textOffsetForStyle:](self, "textOffsetForStyle:", a3);
  v11 = v7 + v10 + -1.0 + floor((v9 - v7) * 0.5);
  objc_msgSend(v5, "descender");
  v13 = v12 + v11;

  return v13;
}

- (double)bluetoothBatteryExtraPadding
{
  double v2;

  -[UIStatusBarForegroundStyleAttributes standardPadding](self, "standardPadding");
  return 1.0 - v2;
}

- (id)textForNetworkType:(int)a3
{
  void *v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;

  v3 = 0;
  switch(a3)
  {
    case 1:
      v4 = CFSTR("E");
      goto LABEL_8;
    case 2:
      v4 = CFSTR("3G");
      goto LABEL_8;
    case 3:
      v4 = CFSTR("4G");
      goto LABEL_8;
    case 7:
      _UIKitBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("1x[statusBarDataNetwork]"), CFSTR("1x"), CFSTR("Localizable"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      return v3;
    case 8:
      v4 = CFSTR("5GE");
      v6 = CFSTR("5G   ");
      goto LABEL_9;
    case 9:
      v4 = CFSTR("LTE-A");
      goto LABEL_8;
    case 10:
      v4 = CFSTR("LTE+");
LABEL_8:
      v6 = v4;
LABEL_9:
      _UINSLocalizedStringWithDefaultValue(v4, v6);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v3;
  }
  return v3;
}

- (double)sizeForMoonMaskVisible:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double result;
  double v7;
  BOOL v8;

  v3 = a3;
  -[UIStatusBarForegroundStyleAttributes scale](self, "scale");
  if (v5 <= 2.5)
  {
    -[UIStatusBarForegroundStyleAttributes scale](self, "scale");
    v8 = v7 <= 1.5;
    result = 8.0;
    if (!v8)
      result = 7.5;
  }
  else
  {
    result = 7.66666667;
  }
  if (!v3)
    return 11.0;
  return result;
}

- (CGPoint)positionForMoonMaskInBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIStatusBarForegroundStyleAttributes scale](self, "scale");
  if (v8 <= 2.5)
  {
    -[UIStatusBarForegroundStyleAttributes scale](self, "scale");
    if (v10 <= 1.5)
      v9 = 2.0;
    else
      v9 = 1.5;
  }
  else
  {
    v9 = 1.66666667;
  }
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v11 = v9 + CGRectGetMaxX(v14);
  v12 = 4.0;
  result.y = v12;
  result.x = v11;
  return result;
}

- (BOOL)usesVerticalLayout
{
  return 0;
}

- (int64_t)idiom
{
  return self->_idiom;
}

- (BOOL)supportsShowingBuildVersion
{
  return 1;
}

- (BOOL)canShowBreadcrumbs
{
  return self->_canShowBreadcrumbs;
}

- (void)setCanShowBreadcrumbs:(BOOL)a3
{
  self->_canShowBreadcrumbs = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_cachedUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedFonts, 0);
}

@end
