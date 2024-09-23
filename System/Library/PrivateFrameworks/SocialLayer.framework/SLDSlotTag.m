@implementation SLDSlotTag

+ (unint64_t)cacheLimit
{
  return -1;
}

- (unint64_t)authenticationMessageContextForStyle:(id)a3
{
  return 0;
}

- (unint64_t)failGradeForStyle:(id)a3
{
  return 0;
}

- (unint64_t)hitTestInformationMaskForStyle:(id)a3
{
  return 0;
}

- (id)resolvedStyleForStyle:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  CGColorRef ConstantColor;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v15;

  v15 = (void *)MEMORY[0x1E0DC5C60];
  v3 = a3;
  v4 = objc_msgSend(v3, "accessibilityButtonShapes");
  v5 = objc_msgSend(v3, "accessibilityContrast");
  v6 = objc_msgSend(v3, "displayScale");
  v7 = objc_msgSend(v3, "layoutDirection");
  objc_msgSend(v3, "localization");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "preferredContentSizeCategory");
  ConstantColor = CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E0C9D8E8]);
  v11 = objc_msgSend(v3, "userInterfaceIdiom");
  v12 = objc_msgSend(v3, "userInterfaceStyle");

  objc_msgSend(v15, "slotStyleWithAccessibilityButtonShapes:accessibilityContrast:displayRange:displayScale:layoutDirection:legibilityWeight:localization:preferredContentSizeCategory:tintColor:userInterfaceIdiom:userInterfaceStyle:", v4, v5, 1, v6, v7, 0, v8, v9, ConstantColor, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)isValid
{
  return 1;
}

- (SLDSlotTag)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SLDSlotTag;
  return -[SLDSlotTag init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init((Class)objc_opt_class());
}

@end
