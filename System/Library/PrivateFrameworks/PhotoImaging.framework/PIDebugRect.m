@implementation PIDebugRect

- (PIDebugRect)init
{
  uint64_t *v3;
  os_log_t *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  os_log_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  os_log_t v18;
  void *specific;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  objc_class *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (uint64_t *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    goto LABEL_15;
  while (1)
  {
    v4 = (os_log_t *)MEMORY[0x1E0D52380];
    v5 = (void *)*MEMORY[0x1E0D52380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52380], OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = v5;
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Initializer not available: -[%@ %@], use designated initializer instead."), v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v11;
      _os_log_error_impl(&dword_1A6382000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      v12 = *v3;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
      {
        if (v12 != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_7365);
LABEL_7:
        v13 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
        {
          v14 = (void *)MEMORY[0x1E0CB3978];
          v15 = v13;
          objc_msgSend(v14, "callStackSymbols");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v26 = v17;
          _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_7365);
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]))
    {
      goto LABEL_7;
    }
    v18 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      v20 = (void *)MEMORY[0x1E0CB3978];
      v21 = specific;
      v15 = v18;
      objc_msgSend(v20, "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = specific;
      v27 = 2114;
      v28 = v23;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_7365);
  }
}

- (PIDebugRect)initWithRect:(CGRect)a3 color:(id)a4 label:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CIColor *v11;
  id v12;
  PIDebugRect *v13;
  CIColor *color;
  CIColor *v15;
  uint64_t v16;
  NSString *label;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = (CIColor *)a4;
  v19.receiver = self;
  v19.super_class = (Class)PIDebugRect;
  v12 = a5;
  v13 = -[PIDebugRect init](&v19, sel_init);
  v13->_geometry.origin.x = x;
  v13->_geometry.origin.y = y;
  v13->_geometry.size.width = width;
  v13->_geometry.size.height = height;
  color = v13->_color;
  v13->_color = v11;
  v15 = v11;

  v16 = objc_msgSend(v12, "copy", v19.receiver, v19.super_class);
  label = v13->_label;
  v13->_label = (NSString *)v16;

  return v13;
}

- (CGRect)geometry
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_geometry.origin.x;
  y = self->_geometry.origin.y;
  width = self->_geometry.size.width;
  height = self->_geometry.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CIColor)color
{
  return self->_color;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

+ (CIColor)visibleColor
{
  return (CIColor *)objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:", 0.4, 0.4, 1.0);
}

+ (CIColor)inactiveColor
{
  return (CIColor *)objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:", 0.0, 0.0, 0.5);
}

+ (CIColor)paddedColor
{
  return (CIColor *)objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:", 0.5, 0.5, 0.5);
}

+ (CIColor)faceColor
{
  return (CIColor *)objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:", 1.0, 0.4, 0.4);
}

+ (CIColor)inflatedFaceColor
{
  return (CIColor *)objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:", 0.5, 0.0, 0.0);
}

+ (CIColor)datetimeColor
{
  return (CIColor *)objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:", 0.9, 0.9, 0.9);
}

+ (CIColor)datetimeSubcolor
{
  return (CIColor *)objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:", 0.4, 0.4, 0.4);
}

+ (CIColor)saliencyPreferredColor
{
  return (CIColor *)objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:", 0.2, 0.9, 0.9);
}

+ (CIColor)saliencyAcceptableColor
{
  return (CIColor *)objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:", 0.9, 0.9, 0.2);
}

+ (CIColor)gazeAreaRectColor
{
  return (CIColor *)objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:", 0.3, 0.2, 0.7);
}

+ (CIColor)smartCropColor
{
  return (CIColor *)objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:", 0.8, 0.3, 0.1);
}

+ (CIColor)v2CropColor
{
  return (CIColor *)objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:", 0.3, 0.8, 0.4);
}

+ (CIColor)faceUnionColor
{
  return (CIColor *)objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:", 0.1, 0.9, 0.2);
}

+ (CIColor)labelColor
{
  return (CIColor *)objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:", 1.0, 1.0, 1.0);
}

+ (CIColor)metadataColor
{
  return (CIColor *)objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:", 1.0, 1.0, 1.0);
}

+ (CIColor)settlingEffectColor
{
  return (CIColor *)objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:", 0.0, 1.0, 0.5);
}

+ (id)debugRectWithRect:(CGRect)a3 color:(id)a4 label:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  id v11;
  PIDebugRect *v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a5;
  v11 = a4;
  v12 = -[PIDebugRect initWithRect:color:label:]([PIDebugRect alloc], "initWithRect:color:label:", v11, v10, x, y, width, height);

  return v12;
}

@end
