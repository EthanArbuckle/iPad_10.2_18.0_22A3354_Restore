@implementation UIColor

+ (id)_appKeyColorOrDefaultTint
{
  void *v0;
  void *v1;
  id v2;
  void *v3;

  objc_opt_self();
  +[UIColor _appKeyColor]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    v2 = v0;
  }
  else
  {
    +[UIColor systemBlueColor](UIColor, "systemBlueColor");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;

  return v3;
}

+ (id)_appKeyColor
{
  objc_opt_self();
  if (qword_1ECD7BBD0 != -1)
    dispatch_once(&qword_1ECD7BBD0, &__block_literal_global_1047_0);
  return (id)qword_1ECD7BBC8;
}

+ (UIColor)systemBlueColor
{
  if (qword_1ECD7BFC0 != -1)
    dispatch_once(&qword_1ECD7BFC0, &__block_literal_global_1470);
  return (UIColor *)(id)qword_1ECD7BFB8;
}

- (BOOL)_isDynamicTintColor
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedStyleString, 0);
  objc_storeStrong((id *)&self->_systemColorName, 0);
}

- (BOOL)_isDynamic
{
  return 0;
}

- (NSString)_systemColorName
{
  return self->_systemColorName;
}

- (UIColor)initWithWhite:(CGFloat)white alpha:(CGFloat)alpha
{

  return (UIColor *)objc_msgSend(objc_allocWithZone((Class)UIDeviceWhiteColor), "initWithWhite:alpha:", white, alpha);
}

+ (UIColor)tintColor
{
  if (qword_1ECD7BF10 != -1)
    dispatch_once(&qword_1ECD7BF10, &__block_literal_global_1153);
  return (UIColor *)(id)qword_1ECD7BF08;
}

+ (UIColor)lightGrayColor
{
  if (qword_1ECD7B978 != -1)
    dispatch_once(&qword_1ECD7B978, &__block_literal_global_963);
  return (UIColor *)(id)qword_1ECD7B970;
}

+ (UIColor)colorWithDynamicProvider:(void *)dynamicProvider
{
  void *v3;
  UIDynamicProviderColor *v4;

  v3 = dynamicProvider;
  v4 = -[UIDynamicProviderColor initWithProvider:]([UIDynamicProviderColor alloc], "initWithProvider:", v3);

  return (UIColor *)v4;
}

- (UIColor)initWithDynamicProvider:(void *)dynamicProvider
{
  void *v4;
  UIDynamicProviderColor *v5;

  v4 = dynamicProvider;
  v5 = -[UIDynamicProviderColor initWithProvider:]([UIDynamicProviderColor alloc], "initWithProvider:", v4);

  return &v5->super.super;
}

- (UIColor)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{

  return (UIColor *)objc_msgSend(objc_allocWithZone((Class)UIDeviceRGBColor), "initWithRed:green:blue:alpha:", red, green, blue, alpha);
}

+ (UIColor)allocWithZone:(_NSZone *)a3
{
  id v5;
  UIColor *v6;
  UIColor *v7;
  objc_super v9;

  objc_opt_self();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == a1)
  {
    UIColorPlaceholder();
    v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___UIColor;
    v6 = objc_msgSendSuper2(&v9, sel_allocWithZone_, a3);
  }
  v7 = v6;

  return v7;
}

+ (id)tableCellPlainBackgroundColor
{
  if (qword_1ECD7C310 != -1)
    dispatch_once(&qword_1ECD7C310, &__block_literal_global_1576);
  return (id)qword_1ECD7C308;
}

+ (id)tableCellGroupedBackgroundColor
{
  if (qword_1ECD7C330 != -1)
    dispatch_once(&qword_1ECD7C330, &__block_literal_global_1580);
  return (id)qword_1ECD7C328;
}

+ (UIColor)systemGray4Color
{
  if (qword_1ECD7C0B0 != -1)
    dispatch_once(&qword_1ECD7C0B0, &__block_literal_global_1501);
  return (UIColor *)(id)qword_1ECD7C0A8;
}

+ (id)tableCellPlainSelectedBackgroundColor
{
  return +[UIColor systemGray4Color](UIColor, "systemGray4Color");
}

+ (UIColor)colorWithCGColor:(CGColorRef)cgColor
{
  CFTypeID v4;
  CGColorSpace *ColorSpace;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!cgColor)
    goto LABEL_20;
  v4 = CFGetTypeID(cgColor);
  if (v4 != CGColorGetTypeID())
  {
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Passing argument that is not a CGColor to %s"), "+[UIColor colorWithCGColor:]");
      goto LABEL_5;
    }
    v7 = qword_1ECD7B930;
    if (!qword_1ECD7B930)
    {
      v7 = __UILogCategoryGetNode("Color", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&qword_1ECD7B930);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "+[UIColor colorWithCGColor:]";
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Passing argument that is not a CGColor to %s. This will cause an exception to be thrown in the future.", buf, 0xCu);
    }
LABEL_20:
    v6 = 0;
    return (UIColor *)v6;
  }
LABEL_5:
  ColorSpace = CGColorGetColorSpace(cgColor);
  if (qword_1ECD7C4C0 != -1)
    dispatch_once(&qword_1ECD7C4C0, &__block_literal_global_1675);
  if (ColorSpace != (CGColorSpace *)qword_1ECD7C4B8
    || (v6 = (void *)objc_msgSend(objc_allocWithZone((Class)UIDeviceRGBColor), "initWithCGColor:", cgColor)) == 0)
  {
    if (qword_1ECD7C4B0 != -1)
      dispatch_once(&qword_1ECD7C4B0, &__block_literal_global_1674);
    if ((ColorSpace != (CGColorSpace *)qword_1ECD7C4A8
       || (v6 = (void *)objc_msgSend(objc_allocWithZone((Class)UIDeviceWhiteColor), "initWithCGColor:", cgColor)) == 0)&& (CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelPattern|| (v6 = (void *)objc_msgSend(objc_allocWithZone((Class)UIPatternCGColor), "initWithCGColor:", cgColor)) == 0))
    {
      v6 = (void *)objc_msgSend(objc_allocWithZone((Class)UICGColor), "initWithCGColor:", cgColor);
    }
  }
  return (UIColor *)v6;
}

- (UIColor)initWithCGColor:(CGColorRef)cgColor
{
  CGColorSpace *ColorSpace;
  UIColor *result;

  if (!cgColor)
    return 0;
  ColorSpace = CGColorGetColorSpace(cgColor);
  if (qword_1ECD7C4C0 != -1)
    dispatch_once(&qword_1ECD7C4C0, &__block_literal_global_1675);
  if (ColorSpace != (CGColorSpace *)qword_1ECD7C4B8
    || (result = (UIColor *)objc_msgSend(objc_allocWithZone((Class)UIDeviceRGBColor), "initWithCGColor:", cgColor)) == 0)
  {
    if (qword_1ECD7C4B0 != -1)
      dispatch_once(&qword_1ECD7C4B0, &__block_literal_global_1674);
    if (ColorSpace != (CGColorSpace *)qword_1ECD7C4A8
      || (result = (UIColor *)objc_msgSend(objc_allocWithZone((Class)UIDeviceWhiteColor), "initWithCGColor:", cgColor)) == 0)
    {
      if (CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelPattern)
        return (UIColor *)objc_msgSend(objc_allocWithZone((Class)UICGColor), "initWithCGColor:", cgColor);
      result = (UIColor *)objc_msgSend(objc_allocWithZone((Class)UIPatternCGColor), "initWithCGColor:", cgColor);
      if (!result)
        return (UIColor *)objc_msgSend(objc_allocWithZone((Class)UICGColor), "initWithCGColor:", cgColor);
    }
  }
  return result;
}

+ (UIColor)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
  return (UIColor *)(id)objc_msgSend(objc_allocWithZone((Class)UIDeviceRGBColor), "initWithRed:green:blue:alpha:", red, green, blue, alpha);
}

+ (UIColor)colorWithWhite:(CGFloat)white alpha:(CGFloat)alpha
{
  return (UIColor *)(id)objc_msgSend(objc_allocWithZone((Class)UIDeviceWhiteColor), "initWithWhite:alpha:", white, alpha);
}

+ (UIColor)blackColor
{
  if (qword_1ECD7B958 != -1)
    dispatch_once(&qword_1ECD7B958, &__block_literal_global_958);
  return (UIColor *)(id)qword_1ECD7B950;
}

+ (UIColor)whiteColor
{
  if (qword_1ECD7B988 != -1)
    dispatch_once(&qword_1ECD7B988, &__block_literal_global_965);
  return (UIColor *)(id)qword_1ECD7B980;
}

+ (UIColor)clearColor
{
  if (qword_1ECD7B9A8 != -1)
    dispatch_once(&qword_1ECD7B9A8, &__block_literal_global_969);
  return (UIColor *)(id)qword_1ECD7B9A0;
}

+ (id)__halfTransparentBlackColor
{
  if (qword_1ECD7BB48 != -1)
    dispatch_once(&qword_1ECD7BB48, &__block_literal_global_1022);
  return (id)qword_1ECD7BB40;
}

+ (id)__halfTransparentWhiteColor
{
  if (qword_1ECD7BB58 != -1)
    dispatch_once(&qword_1ECD7BB58, &__block_literal_global_1023);
  return (id)qword_1ECD7BB50;
}

+ (UIColor)tertiaryLabelColor
{
  if (qword_1ECD7C040 != -1)
    dispatch_once(&qword_1ECD7C040, &__block_literal_global_1486);
  return (UIColor *)(id)qword_1ECD7C038;
}

+ (id)systemWhiteColor
{
  if (qword_1ECD7BC10 != -1)
    dispatch_once(&qword_1ECD7BC10, &__block_literal_global_1052);
  return (id)qword_1ECD7BC08;
}

+ (id)_pageControlIndicatorColor
{
  if (qword_1ECD7C200 != -1)
    dispatch_once(&qword_1ECD7C200, &__block_literal_global_1542);
  return (id)qword_1ECD7C1F8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)insertionPointColor
{
  if (qword_1ECD7BB90 != -1)
    dispatch_once(&qword_1ECD7BB90, &__block_literal_global_1039);
  return (id)qword_1ECD7BB88;
}

+ (id)selectionGrabberColor
{
  if (qword_1ECD7BBA0 != -1)
    dispatch_once(&qword_1ECD7BBA0, &__block_literal_global_1041);
  return (id)qword_1ECD7BB98;
}

+ (id)selectionHighlightColor
{
  if (qword_1ECD7BB80 != -1)
    dispatch_once(&qword_1ECD7BB80, &__block_literal_global_1037);
  return (id)qword_1ECD7BB78;
}

+ (void)initialize
{
  id v3;
  id v4;

  objc_opt_self();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
    v4 = UIColorPlaceholder();
}

+ (UIColor)systemGreenColor
{
  if (qword_1ECD7BF80 != -1)
    dispatch_once(&qword_1ECD7BF80, &__block_literal_global_1462);
  return (UIColor *)(id)qword_1ECD7BF78;
}

+ (id)_systemColorWithUnvalidatedName:(id)a3
{
  void *v4;

  v4 = _selectorForColorName(a3);
  if (v4)
  {
    objc_msgSend(a1, "performSelector:", v4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (UIColor)secondarySystemBackgroundColor
{
  if (qword_1ECD7C120 != -1)
    dispatch_once(&qword_1ECD7C120, &__block_literal_global_1515);
  return (UIColor *)(id)qword_1ECD7C118;
}

+ (id)_systemColorWithName:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  v6 = _selectorForColorName(v5);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIColor.m"), 1903, CFSTR("Invalid system color name: %@"), v5);

  }
  objc_msgSend(a1, "performSelector:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_systemColorSelectorTable
{
  if (qword_1ECD7B940 != -1)
    dispatch_once(&qword_1ECD7B940, &__block_literal_global_274);
  return (id)qword_1ECD7B938;
}

+ (id)systemBlackColor
{
  if (qword_1ECD7BC50 != -1)
    dispatch_once(&qword_1ECD7BC50, &__block_literal_global_1060);
  return (id)qword_1ECD7BC48;
}

+ (UIColor)systemOrangeColor
{
  if (qword_1ECD7BF60 != -1)
    dispatch_once(&qword_1ECD7BF60, &__block_literal_global_1458);
  return (UIColor *)(id)qword_1ECD7BF58;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (id)_disabledColorForColor:(uint64_t)a1
{
  id v2;
  void *v3;
  id v4;
  unint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v2 = a2;
  objc_opt_self();
  if (v2)
  {
    objc_getAssociatedObject(v2, &_MergedGlobals_21_5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = v3;
    }
    else
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __34__UIColor__disabledColorForColor___block_invoke;
      v11[3] = &unk_1E16B1DC8;
      v7 = v2;
      v12 = v7;
      +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject(v7, &_MergedGlobals_21_5, v8, (void *)1);
      v4 = v8;

    }
  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "Caller passed nil color for deriving a disabled color.", buf, 2u);
      }

    }
    else
    {
      v5 = qword_1ECD7B948;
      if (!qword_1ECD7B948)
      {
        v5 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v5, (unint64_t *)&qword_1ECD7B948);
      }
      v6 = *(NSObject **)(v5 + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Caller passed nil color for deriving a disabled color.", buf, 2u);
      }
    }
    v4 = 0;
  }

  return v4;
}

+ (UIColor)secondaryLabelColor
{
  if (qword_1ECD7C030 != -1)
    dispatch_once(&qword_1ECD7C030, &__block_literal_global_1484);
  return (UIColor *)(id)qword_1ECD7C028;
}

+ (UIColor)labelColor
{
  if (qword_1ECD7C020 != -1)
    dispatch_once(&qword_1ECD7C020, &__block_literal_global_1482);
  return (UIColor *)(id)qword_1ECD7C018;
}

+ (UIColor)opaqueSeparatorColor
{
  if (qword_1ECD7C100 != -1)
    dispatch_once(&qword_1ECD7C100, &__block_literal_global_1511);
  return (UIColor *)(id)qword_1ECD7C0F8;
}

+ (id)_splitViewBorderColor
{
  return +[UIColor opaqueSeparatorColor](UIColor, "opaqueSeparatorColor");
}

+ (UIColor)colorWithHue:(CGFloat)hue saturation:(CGFloat)saturation brightness:(CGFloat)brightness alpha:(CGFloat)alpha
{
  return (UIColor *)(id)objc_msgSend(objc_allocWithZone((Class)UIDeviceRGBColor), "initWithHue:saturation:brightness:alpha:", hue, saturation, brightness, alpha);
}

+ (id)_textFieldBorderColor
{
  if (qword_1ECD7C2E0 != -1)
    dispatch_once(&qword_1ECD7C2E0, &__block_literal_global_1570);
  return (id)qword_1ECD7C2D8;
}

+ (UIColor)tertiarySystemFillColor
{
  if (qword_1ECD7C1B0 != -1)
    dispatch_once(&qword_1ECD7C1B0, &__block_literal_global_1532);
  return (UIColor *)(id)qword_1ECD7C1A8;
}

+ (id)_systemChromeShadowColor
{
  if (qword_1ECD7C2B0 != -1)
    dispatch_once(&qword_1ECD7C2B0, &__block_literal_global_1564);
  return (id)qword_1ECD7C2A8;
}

+ (id)_textFieldBackgroundColor
{
  if (qword_1ECD7C2C0 != -1)
    dispatch_once(&qword_1ECD7C2C0, &__block_literal_global_1566);
  return (id)qword_1ECD7C2B8;
}

+ (id)_barStyleBlackHairlineShadowColor
{
  if (qword_1ECD7BE30 != -1)
    dispatch_once(&qword_1ECD7BE30, &__block_literal_global_1120);
  return (id)qword_1ECD7BE28;
}

+ (UIColor)separatorColor
{
  if (qword_1ECD7C0F0 != -1)
    dispatch_once(&qword_1ECD7C0F0, &__block_literal_global_1509);
  return (UIColor *)(id)qword_1ECD7C0E8;
}

+ (UIColor)systemGroupedBackgroundColor
{
  if (qword_1ECD7C140 != -1)
    dispatch_once(&qword_1ECD7C140, &__block_literal_global_1519);
  return (UIColor *)(id)qword_1ECD7C138;
}

+ (id)tableBackgroundColor
{
  if (qword_1ECD7C300 != -1)
    dispatch_once(&qword_1ECD7C300, &__block_literal_global_1574);
  return (id)qword_1ECD7C2F8;
}

+ (UIColor)colorNamed:(NSString *)name inBundle:(NSBundle *)bundle compatibleWithTraitCollection:(UITraitCollection *)traitCollection
{
  NSString *v7;
  NSBundle *v8;
  UITraitCollection *v9;
  void *v10;
  void *v11;

  v7 = name;
  v8 = bundle;
  v9 = traitCollection;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (NSBundle *)objc_claimAutoreleasedReturnValue();
  }
  +[_UIAssetManager assetManagerForBundle:](_UIAssetManager, "assetManagerForBundle:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "colorNamed:withTraitCollection:", v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v11;
}

+ (UIColor)placeholderTextColor
{
  if (qword_1ECD7C070 != -1)
    dispatch_once(&qword_1ECD7C070, &__block_literal_global_1492);
  return (UIColor *)(id)qword_1ECD7C068;
}

+ (id)classFallbacksForKeyedArchiver
{
  return &unk_1E1A93698;
}

+ (id)tableSeparatorLightColor
{
  if (qword_1ECD7C360 != -1)
    dispatch_once(&qword_1ECD7C360, &__block_literal_global_1586);
  return (id)qword_1ECD7C358;
}

+ (id)tableSeparatorDarkColor
{
  if (qword_1ECD7C350 != -1)
    dispatch_once(&qword_1ECD7C350, &__block_literal_global_1584);
  return (id)qword_1ECD7C348;
}

+ (id)_secondaryLabelColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
}

+ (id)_alertControllerDimmingViewColor
{
  if (qword_1ECD7C2A0 != -1)
    dispatch_once(&qword_1ECD7C2A0, &__block_literal_global_1562);
  return (id)qword_1ECD7C298;
}

+ (id)_dimmingViewColor
{
  return +[UIColor _alertControllerDimmingViewColor](UIColor, "_alertControllerDimmingViewColor");
}

+ (id)tableCellDefaultSelectionTintColor
{
  return +[UIColor tableCellPlainSelectedBackgroundColor](UIColor, "tableCellPlainSelectedBackgroundColor");
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  void *v6;
  CGColor *v7;
  size_t NumberOfComponents;
  double v9;
  const CGFloat *v10;
  CGFloat v11;
  CGColorSpaceRef v12;
  double v13;
  double v14;
  double v15;
  CGColorSpaceRef v16;
  double v17;
  const CGFloat *Components;
  CGFloat Alpha;
  CGColorSpaceRef ColorSpace;
  double v21;
  CGColorSpaceRef v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[UIColor _systemColorName](self, "_systemColorName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("UISystemColorName"));
  v7 = -[UIColor cgColor](self, "cgColor");
  NumberOfComponents = CGColorGetNumberOfComponents(v7);
  objc_msgSend(v5, "encodeInt:forKey:", NumberOfComponents, CFSTR("UIColorComponentCount"));
  if ((_DWORD)NumberOfComponents == 2)
  {
    v17 = 0.0;
    if (v7)
    {
      Components = CGColorGetComponents(v7);
      Alpha = CGColorGetAlpha(v7);
      ColorSpace = CGColorGetColorSpace(v7);
      v21 = 0.0;
      if (Components)
      {
        v22 = ColorSpace;
        v33 = 0uLL;
        if (qword_1ECD7C4B0 != -1)
          dispatch_once(&qword_1ECD7C4B0, &__block_literal_global_1674);
        if ((CGColorSpaceRef)qword_1ECD7C4A8 != v22)
        {
          if (qword_1ECD7C4E0 != -1)
            dispatch_once(&qword_1ECD7C4E0, &__block_literal_global_1677);
          if ((CGColorSpaceRef)qword_1ECD7C4D8 != v22)
          {
            UISCreateCachedColorTransform();
            if (!CGColorTransformConvertColorComponents())
            {
              CGColorTransformRelease();
              goto LABEL_32;
            }
            *((CGFloat *)&v33 + 1) = Alpha;
            CGColorTransformRelease();
            Components = (const CGFloat *)&v33;
          }
        }
        v17 = *Components;
        v21 = Components[1];
      }
    }
    else
    {
      v21 = 0.0;
    }
LABEL_32:
    _UIColorEncodeComponentForKey(v5, (uint64_t)CFSTR("UIWhite"), CFSTR("UIWhite-Double"), v17);
    _UIColorEncodeComponentForKey(v5, (uint64_t)CFSTR("UIAlpha"), CFSTR("UIAlpha-Double"), v21);
    v26 = v5;
    if (v21 == 1.0)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3g"), *(_QWORD *)&v17, v31);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3g %.3g"), *(_QWORD *)&v17, *(_QWORD *)&v21);
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v30 = (const char *)objc_msgSend(v27, "UTF8String");
    objc_msgSend(v26, "encodeBytes:length:forKey:", v30, strlen(v30), CFSTR("NSWhite"));
    v29 = 4;
    goto LABEL_38;
  }
  if ((_DWORD)NumberOfComponents == 4)
  {
    v9 = 0.0;
    if (v7)
    {
      v10 = CGColorGetComponents(v7);
      v11 = CGColorGetAlpha(v7);
      v12 = CGColorGetColorSpace(v7);
      v13 = 0.0;
      v14 = 0.0;
      v15 = 0.0;
      if (v10)
      {
        v16 = v12;
        v33 = 0u;
        v34 = 0u;
        if (qword_1ECD7C4C0 != -1)
          dispatch_once(&qword_1ECD7C4C0, &__block_literal_global_1675);
        if ((CGColorSpaceRef)qword_1ECD7C4B8 != v16)
        {
          if (qword_1ECD7C500 != -1)
            dispatch_once(&qword_1ECD7C500, &__block_literal_global_1679);
          if ((CGColorSpaceRef)qword_1ECD7C4F8 != v16)
          {
            UISCreateCachedColorTransform();
            if (!CGColorTransformConvertColorComponents())
            {
              CGColorTransformRelease();
              goto LABEL_29;
            }
            *((CGFloat *)&v34 + 1) = v11;
            CGColorTransformRelease();
            v10 = (const CGFloat *)&v33;
          }
        }
        v9 = *v10;
        v13 = v10[1];
        v14 = v10[2];
        v15 = v10[3];
      }
    }
    else
    {
      v13 = 0.0;
      v14 = 0.0;
      v15 = 0.0;
    }
LABEL_29:
    _UIColorEncodeComponentForKey(v5, (uint64_t)CFSTR("UIRed"), CFSTR("UIRed-Double"), v9);
    _UIColorEncodeComponentForKey(v5, (uint64_t)CFSTR("UIGreen"), CFSTR("UIGreen-Double"), v13);
    _UIColorEncodeComponentForKey(v5, (uint64_t)CFSTR("UIBlue"), CFSTR("UIBlue-Double"), v14);
    _UIColorEncodeComponentForKey(v5, (uint64_t)CFSTR("UIAlpha"), CFSTR("UIAlpha-Double"), v15);
    v25 = v5;
    if (v15 == 1.0)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3g %.3g %.3g"), *(_QWORD *)&v9, *(_QWORD *)&v13, *(_QWORD *)&v14, v32, v33, v34);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3g %.3g %.3g %.3g"), *(_QWORD *)&v9, *(_QWORD *)&v13, *(_QWORD *)&v14, *(_QWORD *)&v15, v33, v34);
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v28 = (const char *)objc_msgSend(v27, "UTF8String");
    objc_msgSend(v25, "encodeBytes:length:forKey:", v28, strlen(v28), CFSTR("NSRGB"));
    v29 = 2;
LABEL_38:
    objc_msgSend(v5, "encodeInteger:forKey:", v29, CFSTR("NSColorSpace"));

    goto LABEL_39;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIColor.m"), 2340, CFSTR("Only RGBA or White color spaces are supported in this situation."));

  v24 = v5;
LABEL_39:

}

- (CGColor)cgColor
{
  return -[UIColor CGColor](objc_retainAutorelease(self), "CGColor");
}

+ (UIColor)redColor
{
  if (qword_1ECD7B9B8 != -1)
    dispatch_once(&qword_1ECD7B9B8, &__block_literal_global_971);
  return (UIColor *)(id)qword_1ECD7B9B0;
}

- (BOOL)_isSimilarToColor:(id)a3 withinPercentage:(double)a4
{
  id v6;
  CGColor *v7;
  CGColorSpace *ColorSpace;
  double v9;
  const CGFloat *Components;
  CGFloat Alpha;
  CGColorSpaceRef v12;
  CGColorSpaceRef v13;
  double v14;
  int v15;
  double v16;
  double v17;
  int has_internal_diagnostics;
  size_t NumberOfComponents;
  size_t v20;
  const CGFloat *v21;
  const CGFloat *v22;
  size_t v23;
  const CGFloat *v24;
  CGFloat v25;
  CGColorSpaceRef v26;
  CGColorSpaceRef v27;
  NSObject *v29;
  unint64_t v30;
  NSObject *v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
    goto LABEL_41;
  if (a4 < 0.00000011920929)
  {
    LOBYTE(self) = -[UIColor isEqual:](self, "isEqual:", v6);
    goto LABEL_42;
  }
  v7 = -[UIColor CGColor](objc_retainAutorelease(self), "CGColor");
  self = (UIColor *)objc_msgSend(objc_retainAutorelease(v6), "CGColor");
  ColorSpace = CGColorGetColorSpace(v7);
  if (ColorSpace != CGColorGetColorSpace((CGColorRef)self))
  {
    v9 = 0.0;
    if (v7)
    {
      Components = CGColorGetComponents(v7);
      Alpha = CGColorGetAlpha(v7);
      v12 = CGColorGetColorSpace(v7);
      if (Components)
      {
        v13 = v12;
        v32 = 0u;
        v33 = 0u;
        if (qword_1ECD7C4C0 != -1)
          dispatch_once(&qword_1ECD7C4C0, &__block_literal_global_1675);
        if ((CGColorSpaceRef)qword_1ECD7C4B8 == v13)
          goto LABEL_15;
        if (qword_1ECD7C500 != -1)
          dispatch_once(&qword_1ECD7C500, &__block_literal_global_1679);
        if ((CGColorSpaceRef)qword_1ECD7C4F8 == v13)
        {
LABEL_15:
          v9 = *Components;
          v14 = Components[1];
          v15 = 1;
          v17 = Components[2];
          v16 = Components[3];
          if (!self)
            goto LABEL_42;
          goto LABEL_26;
        }
        UISCreateCachedColorTransform();
        if (CGColorTransformConvertColorComponents())
        {
          *((CGFloat *)&v33 + 1) = Alpha;
          CGColorTransformRelease();
          Components = (const CGFloat *)&v32;
          goto LABEL_15;
        }
        CGColorTransformRelease();
      }
    }
    v15 = 0;
    v14 = 0.0;
    v17 = 0.0;
    v16 = 0.0;
    if (!self)
      goto LABEL_42;
LABEL_26:
    v24 = CGColorGetComponents((CGColorRef)self);
    v25 = CGColorGetAlpha((CGColorRef)self);
    v26 = CGColorGetColorSpace((CGColorRef)self);
    if (v24)
    {
      v27 = v26;
      v32 = 0u;
      v33 = 0u;
      if (qword_1ECD7C4C0 != -1)
        dispatch_once(&qword_1ECD7C4C0, &__block_literal_global_1675);
      if ((CGColorSpaceRef)qword_1ECD7C4B8 != v27)
      {
        if (qword_1ECD7C500 != -1)
          dispatch_once(&qword_1ECD7C500, &__block_literal_global_1679);
        if ((CGColorSpaceRef)qword_1ECD7C4F8 != v27)
        {
          UISCreateCachedColorTransform();
          if (!CGColorTransformConvertColorComponents())
          {
            CGColorTransformRelease();
            goto LABEL_41;
          }
          *((CGFloat *)&v33 + 1) = v25;
          CGColorTransformRelease();
          v24 = (const CGFloat *)&v32;
        }
      }
      if (v15 && vabdd_f64(v9, *v24) <= a4 && vabdd_f64(v14, v24[1]) <= a4 && vabdd_f64(v17, v24[2]) <= a4)
      {
        LOBYTE(self) = vabdd_f64(v16, v24[3]) <= a4;
        goto LABEL_42;
      }
    }
LABEL_41:
    LOBYTE(self) = 0;
    goto LABEL_42;
  }
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  NumberOfComponents = CGColorGetNumberOfComponents(v7);
  v20 = CGColorGetNumberOfComponents((CGColorRef)self);
  if (has_internal_diagnostics)
  {
    if (NumberOfComponents != v20)
    {
      __UIFaultDebugAssertLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v32) = 0;
        _os_log_fault_impl(&dword_185066000, v29, OS_LOG_TYPE_FAULT, "Colors in the same space should have the same number of components", (uint8_t *)&v32, 2u);
      }

    }
  }
  else if (NumberOfComponents != v20)
  {
    v30 = qword_1ECD7BB60;
    if (!qword_1ECD7BB60)
    {
      v30 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v30, (unint64_t *)&qword_1ECD7BB60);
    }
    v31 = *(NSObject **)(v30 + 8);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v32) = 0;
      _os_log_impl(&dword_185066000, v31, OS_LOG_TYPE_ERROR, "Colors in the same space should have the same number of components", (uint8_t *)&v32, 2u);
    }
  }
  v21 = CGColorGetComponents(v7);
  v22 = CGColorGetComponents((CGColorRef)self);
  if (CGColorGetNumberOfComponents(v7))
  {
    v23 = 0;
    LOBYTE(self) = 1;
    do
    {
      LOBYTE(self) = self & (vabdd_f64(v21[v23], v22[v23]) <= a4);
      ++v23;
    }
    while (CGColorGetNumberOfComponents(v7) > v23);
  }
  else
  {
    LOBYTE(self) = 1;
  }
LABEL_42:

  return (char)self;
}

+ (UIColor)secondarySystemFillColor
{
  if (qword_1ECD7C1A0 != -1)
    dispatch_once(&qword_1ECD7C1A0, &__block_literal_global_1530);
  return (UIColor *)(id)qword_1ECD7C198;
}

+ (id)_tertiaryLabelColor
{
  return +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
}

+ (id)_disambiguated_due_to_CIImage_colorWithCGColor:(CGColor *)a3
{
  return +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", a3);
}

+ (UIColor)systemBackgroundColor
{
  if (qword_1ECD7C110 != -1)
    dispatch_once(&qword_1ECD7C110, &__block_literal_global_1513);
  return (UIColor *)(id)qword_1ECD7C108;
}

+ (UIColor)greenColor
{
  if (qword_1ECD7B9C8 != -1)
    dispatch_once(&qword_1ECD7B9C8, &__block_literal_global_974);
  return (UIColor *)(id)qword_1ECD7B9C0;
}

+ (id)_switchOffColor
{
  if (qword_1ECD7C1D0 != -1)
    dispatch_once(&qword_1ECD7C1D0, &__block_literal_global_1536);
  return (id)qword_1ECD7C1C8;
}

+ (id)_controlShadowColor
{
  if (qword_1ECD7C260 != -1)
    dispatch_once(&qword_1ECD7C260, &__block_literal_global_1554);
  return (id)qword_1ECD7C258;
}

- (id)styleString
{
  NSString *cachedStyleString;
  double v4;
  id v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  NSString *v10;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;

  cachedStyleString = self->_cachedStyleString;
  if (!cachedStyleString)
  {
    v16 = 0.0;
    v14 = 0.0;
    v15 = 0.0;
    v13 = 0.0;
    -[UIColor getRed:green:blue:alpha:](self, "getRed:green:blue:alpha:", &v16, &v15, &v14, &v13);
    v4 = v13;
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    v6 = &qword_18667B000;
    LODWORD(v6) = vcvtmd_s64_f64(v16 * 255.0);
    LODWORD(v7) = vcvtmd_s64_f64(v15 * 255.0);
    LODWORD(v8) = vcvtmd_s64_f64(v14 * 255.0);
    if (v4 == 1.0)
      v9 = (NSString *)objc_msgSend(v5, "initWithFormat:", CFSTR("rgb(%d,%d,%d)"), v6, v7, v8, v12);
    else
      v9 = (NSString *)objc_msgSend(v5, "initWithFormat:", CFSTR("rgba(%d,%d,%d,%f)"), v6, v7, v8, *(_QWORD *)&v13);
    v10 = self->_cachedStyleString;
    self->_cachedStyleString = v9;

    cachedStyleString = self->_cachedStyleString;
  }
  return cachedStyleString;
}

- (id)_colorBlendedWithColor:(id)a3 compositingFilter:(id)a4
{
  id v6;
  UIColor *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v15;
  double v16;
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
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;

  v6 = a4;
  if (a3)
  {
    v58 = 0.0;
    v59 = 0.0;
    v56 = 0.0;
    v57 = 0.0;
    objc_msgSend(a3, "getRed:green:blue:alpha:", &v59, &v58, &v57, &v56);
    if (fabs(v56) >= 2.22044605e-16)
    {
      v54 = 0.0;
      v55 = 0.0;
      v52 = 0.0;
      v53 = 0.0;
      -[UIColor getRed:green:blue:alpha:](self, "getRed:green:blue:alpha:", &v55, &v54, &v53, &v52);
      v7 = self;
      if (!v6
        || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CD2E70]) & 1) != 0
        || objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CD2ED8]))
      {
        v8 = 1.0;
        v9 = 1.0 - v56;
        v10 = v56 + (1.0 - v56) * v52;
        v11 = 1.0;
        v12 = 1.0;
        if (fabs(v10) >= 2.22044605e-16)
        {
          v12 = (v56 * v59 + v9 * (v52 * v55)) / v10;
          v11 = (v56 * v58 + v9 * (v52 * v54)) / v10;
          v8 = (v56 * v57 + v9 * (v52 * v53)) / v10;
        }
        goto LABEL_9;
      }
      if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CD2E58]))
      {
        v15 = v56;
        v16 = 1.0 - v56;
        v12 = v59 * v55 * v56 + v55 * (1.0 - v56);
        v17 = v53;
        v11 = (1.0 - v56) * v54 + v56 * (v58 * v54);
        v18 = v57 * v53;
LABEL_13:
        v19 = v15 * v18;
        v20 = v16 * v17;
LABEL_25:
        v8 = v20 + v19;
LABEL_9:
        +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v12, v11, v8);
        v13 = objc_claimAutoreleasedReturnValue();

        v7 = (UIColor *)v13;
        goto LABEL_10;
      }
      if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CD2EB0]))
      {
        v21 = v56;
        v22 = 1.0 - v56;
        v12 = v55 * (1.0 - v56) + v56 * (1.0 - (1.0 - v59) * (1.0 - v55));
        v11 = (1.0 - v56) * v54 + v56 * (1.0 - (1.0 - v58) * (1.0 - v54));
        v23 = v53;
        v24 = 1.0 - (1.0 - v57) * (1.0 - v53);
      }
      else
      {
        if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CD2E80]))
        {
          v25 = (v59 + v59) * v55;
          if (v55 >= 0.5)
            v25 = 1.0 - (1.0 - v59) * (1.0 - v55 + 1.0 - v55);
          v26 = 1.0 - v56;
          v12 = v25 * v56 + v55 * (1.0 - v56);
          v27 = (v58 + v58) * v54;
          if (v54 >= 0.5)
            v27 = 1.0 - (1.0 - v58) * (1.0 - v54 + 1.0 - v54);
          v11 = v26 * v54 + v56 * v27;
          v28 = 1.0 - (1.0 - v57) * (1.0 - v53 + 1.0 - v53);
          if (v53 < 0.5)
            v28 = (v57 + v57) * v53;
          v19 = v56 * v28;
          v20 = v26 * v53;
          goto LABEL_25;
        }
        if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CD2C28]))
        {
          v29 = v59;
          v15 = v56;
          if (v59 > v55)
            v29 = v55;
          v16 = 1.0 - v56;
          v12 = v56 * v29 + v55 * (1.0 - v56);
          v30 = v58;
          v17 = v53;
          if (v58 > v54)
            v30 = v54;
          v11 = v16 * v54 + v56 * v30;
          v18 = v57;
          if (v57 > v53)
            v18 = v53;
          goto LABEL_13;
        }
        if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CD2DD8]))
        {
          v31 = v59;
          v15 = v56;
          if (v59 < v55)
            v31 = v55;
          v16 = 1.0 - v56;
          v12 = v56 * v31 + v55 * (1.0 - v56);
          v32 = v58;
          v17 = v53;
          if (v58 < v54)
            v32 = v54;
          v11 = v16 * v54 + v56 * v32;
          v18 = v57;
          if (v57 < v53)
            v18 = v53;
          goto LABEL_13;
        }
        if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CD2BD0]))
        {
          v33 = 1.0;
          v34 = 1.0;
          if (fabs(v59) >= 2.22044605e-16)
            v34 = v55 / (1.0 - v59);
          v35 = v34 * v56;
          v36 = 1.0 - v56;
          if (fabs(v58) >= 2.22044605e-16)
            v33 = v54 / (1.0 - v58);
          v12 = v35 + v55 * (1.0 - v56);
          v11 = v36 * v54 + v56 * v33;
          v37 = 1.0;
          if (fabs(v57) >= 2.22044605e-16)
            v37 = v53 / (1.0 - v57);
          v19 = v56 * v37;
          v20 = v36 * v53;
          goto LABEL_25;
        }
        if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CD2BC0]))
        {
          v38 = v55 * v52;
          v39 = 0.0;
          v40 = 0.0;
          if (fabs(v59) >= 2.22044605e-16)
            v40 = 1.0 - (1.0 - v38) / v59;
          v41 = v40 * v56;
          v42 = 1.0 - v56;
          v43 = v38 * (1.0 - v56);
          v44 = v52 * v54;
          if (fabs(v58) >= 2.22044605e-16)
            v39 = 1.0 - (1.0 - v44) / v58;
          v12 = v41 + v43;
          v11 = v42 * v44 + v56 * v39;
          v45 = v52 * v53;
          v46 = 0.0;
          if (fabs(v57) >= 2.22044605e-16)
            v46 = 1.0 - (1.0 - v45) / v57;
          v8 = v42 * v45 + v56 * v46;
          goto LABEL_9;
        }
        if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CD2EA0]))
        {
          if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CD2E98]))
            goto LABEL_10;
          v47 = v56;
          v48 = v52;
          v49 = fmin(fmax(v56 + v52, 0.0), 1.0);
          v50 = UIColorBlendPlusDarker(v59, v55, v56, v52, v49);
          v51 = UIColorBlendPlusDarker(v58, v54, v47, v48, v49);
          v8 = UIColorBlendPlusDarker(v57, v53, v47, v48, v49);
          v12 = v50;
          v11 = v51;
          goto LABEL_9;
        }
        v21 = v56;
        v22 = 1.0 - v56;
        v12 = v55 * (1.0 - v56) + v56 * fmin(v59 + v55, 1.0);
        v23 = v53;
        v11 = (1.0 - v56) * v54 + v56 * fmin(v58 + v54, 1.0);
        v24 = fmin(v57 + v53, 1.0);
      }
      v19 = v21 * v24;
      v20 = v22 * v23;
      goto LABEL_25;
    }
  }
  v7 = self;
LABEL_10:

  return v7;
}

- (id)_colorBlendedWithColor:(id)a3
{
  return -[UIColor _colorBlendedWithColor:compositingFilter:](self, "_colorBlendedWithColor:compositingFilter:", a3, 0);
}

+ (UIColor)systemFillColor
{
  if (qword_1ECD7C190 != -1)
    dispatch_once(&qword_1ECD7C190, &__block_literal_global_1528);
  return (UIColor *)(id)qword_1ECD7C188;
}

+ (id)_switchOffImageColor
{
  if (qword_1ECD7C1E0 != -1)
    dispatch_once(&qword_1ECD7C1E0, &__block_literal_global_1538);
  return (id)qword_1ECD7C1D8;
}

id __34__UIColor__disabledColorForColor___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  double v8;
  double v9;

  v8 = 0.0;
  v9 = 0.0;
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "resolvedColorWithTraitCollection:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "getWhite:alpha:", &v9, &v8);

  v6 = objc_msgSend(v3, "userInterfaceStyle") == 2;
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v9, dbl_18667D6C0[v6] * v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (UIColor)quaternaryLabelColor
{
  if (qword_1ECD7C050 != -1)
    dispatch_once(&qword_1ECD7C050, &__block_literal_global_1488);
  return (UIColor *)(id)qword_1ECD7C048;
}

+ (id)_controlForegroundColor
{
  if (qword_1ECD7C240 != -1)
    dispatch_once(&qword_1ECD7C240, &__block_literal_global_1550);
  return (id)qword_1ECD7C238;
}

void __23__UIColor__appKeyColor__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;

  _UIKitAppKeyColorAssetName();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    v3 = v0;
    +[UIColor colorNamed:](UIColor, "colorNamed:", v0);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)qword_1ECD7BBC8;
    qword_1ECD7BBC8 = v1;

    v0 = v3;
  }

}

+ (UIColor)colorNamed:(NSString *)name
{
  return (UIColor *)objc_msgSend(a1, "colorNamed:inBundle:compatibleWithTraitCollection:", name, 0, 0);
}

+ (UIColor)secondarySystemGroupedBackgroundColor
{
  if (qword_1ECD7C150 != -1)
    dispatch_once(&qword_1ECD7C150, &__block_literal_global_1521);
  return (UIColor *)(id)qword_1ECD7C148;
}

+ (id)_labelColor
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

- (UIColor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIColor *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  double v28;
  double v29;
  double v30;
  UIColor *v31;
  double v32;
  double v33;
  UIColor *v34;
  double v35;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIDynamicModifiedBaseColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || !objc_msgSend(v5, "_isDynamic"))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIDynamicCatalogName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIDynamicCatalogUseNibBundle")))
      {
        UIResourceBundleForNIBBeingDecodedWithCoder(v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIDynamicCatalogBundleIdentifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIDynamicCatalogBundleLibraryName"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "_bundleWithIdentifier:andLibraryName:", v13, v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      +[UIColor colorNamed:inBundle:compatibleWithTraitCollection:](UIColor, "colorNamed:inBundle:compatibleWithTraitCollection:", v11, v12, 0);
      v15 = (UIColor *)objc_claimAutoreleasedReturnValue();

      if (v15)
        goto LABEL_31;
    }
    if (!initWithCoder__allowedClasses)
    {
      v16 = (void *)MEMORY[0x1E0C99E60];
      v17 = objc_opt_class();
      v18 = objc_opt_class();
      objc_msgSend(v16, "setWithObjects:", v17, v18, objc_opt_class(), 0);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)initWithCoder__allowedClasses;
      initWithCoder__allowedClasses = v19;

    }
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "count"))
    {
      v15 = (UIColor *)-[UIDynamicAppDefinedColor initWithColorsByTraitCollection:]((id *)[UIDynamicAppDefinedColor alloc], v21);
LABEL_30:

LABEL_31:
      goto LABEL_32;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UISystemColorName"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      v24 = _selectorForColorName(v22);
      if (v24)
      {
        v25 = v24;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          +[UIColor performSelector:](UIColor, "performSelector:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_29:
          self = v26;

          v15 = self;
          goto LABEL_30;
        }
      }
      else if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("UIColorComponentCount")) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C10], CFSTR("Unknown system color name: %@"), v23);
      }
    }
    v27 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("UIColorComponentCount"));
    if (v27 == 2)
    {
      v32 = _UIColorDecodeComponentForKey(v4, CFSTR("UIWhite"), CFSTR("UIWhite-Double"));
      v33 = _UIColorDecodeComponentForKey(v4, CFSTR("UIAlpha"), CFSTR("UIAlpha-Double"));
      v34 = self;
      v35 = v32;
    }
    else
    {
      if (v27 == 4)
      {
        v28 = _UIColorDecodeComponentForKey(v4, CFSTR("UIRed"), CFSTR("UIRed-Double"));
        v29 = _UIColorDecodeComponentForKey(v4, CFSTR("UIGreen"), CFSTR("UIGreen-Double"));
        v30 = _UIColorDecodeComponentForKey(v4, CFSTR("UIBlue"), CFSTR("UIBlue-Double"));
        v31 = -[UIColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", v28, v29, v30, _UIColorDecodeComponentForKey(v4, CFSTR("UIAlpha"), CFSTR("UIAlpha-Double")));
LABEL_28:
        v26 = v31;
        goto LABEL_29;
      }
      v35 = 1.0;
      v33 = 0.0;
      v34 = self;
    }
    v31 = -[UIColor initWithWhite:alpha:](v34, "initWithWhite:alpha:", v35, v33);
    goto LABEL_28;
  }
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("UIDynamicModifiedAlphaComponent"));
  v8 = v7;
  v9 = (void *)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIDynamicModifiedContrast"));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIDynamicModifiedProminence")))
    v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIDynamicModifiedProminence"));
  else
    v10 = -1;
  v15 = (UIColor *)-[UIDynamicModifiedColor initWithBaseColor:alphaComponent:contrast:prominence:]((id *)[UIDynamicModifiedColor alloc], v6, v9, (void *)v10, v8);
LABEL_32:

  return v15;
}

+ (UIColor)systemYellowColor
{
  if (qword_1ECD7BF70 != -1)
    dispatch_once(&qword_1ECD7BF70, &__block_literal_global_1460);
  return (UIColor *)(id)qword_1ECD7BF68;
}

+ (UIColor)systemPinkColor
{
  if (qword_1ECD7BFF0 != -1)
    dispatch_once(&qword_1ECD7BFF0, &__block_literal_global_1476);
  return (UIColor *)(id)qword_1ECD7BFE8;
}

+ (UIColor)systemRedColor
{
  if (qword_1ECD7BF50 != -1)
    dispatch_once(&qword_1ECD7BF50, &__block_literal_global_1455);
  return (UIColor *)(id)qword_1ECD7BF48;
}

+ (UIColor)systemGray5Color
{
  if (qword_1ECD7C0C0 != -1)
    dispatch_once(&qword_1ECD7C0C0, &__block_literal_global_1503);
  return (UIColor *)(id)qword_1ECD7C0B8;
}

void __21__UIColor_whiteColor__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 1.0);
  v1 = (void *)qword_1ECD7B980;
  qword_1ECD7B980 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7B980;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "whiteColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

void __21__UIColor_clearColor__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.0);
  v1 = (void *)qword_1ECD7B9A0;
  qword_1ECD7B9A0 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7B9A0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "clearColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

void __51__UIColor__InProgressSPI___systemChromeShadowColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  void *v2;
  UICachedDeviceWhiteColor *v3;
  void *v4;
  UICachedDeviceWhiteColor *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_systemChromeShadowColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v3 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.3);
  v10[0] = v3;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v5 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.15);
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  v8 = (void *)qword_1ECD7C2A8;
  qword_1ECD7C2A8 = (uint64_t)v7;

}

void __51__UIColor__InProgressSPI__secondarySystemFillColor__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  UICachedDeviceRGBColor *v2;
  void *v3;
  UICachedDeviceRGBColor *v4;
  void *v5;
  UICachedDeviceWhiteColor *v6;
  void *v7;
  UICachedDeviceWhiteColor *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  UICachedDeviceWhiteColor *v13;
  void *v14;
  UICachedDeviceWhiteColor *v15;
  void *v16;
  UICachedDeviceWhiteColor *v17;
  void *v18;
  UICachedDeviceRGBColor *v19;
  void *v20;
  UICachedDeviceRGBColor *v21;
  void *v22;
  UICachedDeviceRGBColor *v23;
  void *v24;
  UICachedDeviceRGBColor *v25;
  void *v26;
  void *v27;
  UIDynamicSystemColor *v28;
  _QWORD v29[12];
  _QWORD v30[14];

  v30[12] = *MEMORY[0x1E0C80C00];
  v28 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "secondarySystemFillColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v26;
  v25 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.470588235, 0.470588235, 0.501960784, 0.16);
  v30[0] = v25;
  _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v24;
  v23 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.470588235, 0.470588235, 0.501960784, 0.24);
  v30[1] = v23;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v22;
  v21 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.470588235, 0.470588235, 0.501960784, 0.32);
  v30[2] = v21;
  _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v20;
  v19 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.470588235, 0.470588235, 0.501960784, 0.4);
  v30[3] = v19;
  _UIThemeKeyFromTraitValues(2, 0, 0, 0, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v18;
  v17 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.16);
  v30[4] = v17;
  _UIThemeKeyFromTraitValues(2, 0, 1, 0, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v16;
  v15 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.16);
  v30[5] = v15;
  _UIThemeKeyFromTraitValues(2, 2, 0, 0, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[6] = v14;
  v13 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.16);
  v30[6] = v13;
  _UIThemeKeyFromTraitValues(2, 2, 1, 0, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[7] = v12;
  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.16);
  v30[7] = v0;
  _UIThemeKeyFromTraitValues(4, 2, 0, 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v29[8] = v1;
  v2 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.949019608, 0.956862745, 0.988235294, 0.2);
  v30[8] = v2;
  _UIThemeKeyFromTraitValues(4, 2, 1, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29[9] = v3;
  v4 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.949019608, 0.956862745, 0.988235294, 0.22);
  v30[9] = v4;
  _UIThemeKeyFromTraitValues(4, 1, 0, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[10] = v5;
  v6 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.2);
  v30[10] = v6;
  _UIThemeKeyFromTraitValues(4, 1, 1, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[11] = v7;
  v8 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.24);
  v30[11] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v28, v27, v9);
  v11 = (void *)qword_1ECD7C198;
  qword_1ECD7C198 = (uint64_t)v10;

}

void __47__UIColor__InProgressSPI__tableBackgroundColor__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  UICachedDeviceRGBColor *v2;
  void *v3;
  UICachedDeviceRGBColor *v4;
  void *v5;
  UICachedDeviceWhiteColor *v6;
  void *v7;
  UICachedDeviceWhiteColor *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  UICachedDeviceRGBColor *v13;
  void *v14;
  UICachedDeviceRGBColor *v15;
  void *v16;
  UICachedDeviceRGBColor *v17;
  void *v18;
  UICachedDeviceRGBColor *v19;
  void *v20;
  UICachedDeviceWhiteColor *v21;
  void *v22;
  UICachedDeviceWhiteColor *v23;
  void *v24;
  void *v25;
  UIDynamicSystemColor *v26;
  _QWORD v27[11];
  _QWORD v28[13];

  v28[11] = *MEMORY[0x1E0C80C00];
  v26 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tableBackgroundColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v24;
  v23 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 1.0);
  v28[0] = v23;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v22;
  v21 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 1.0);
  v28[1] = v21;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 1, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v20;
  v19 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.109803922, 0.109803922, 0.117647059, 1.0);
  v28[2] = v19;
  _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 1, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v18;
  v17 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.141176471, 0.141176471, 0.149019608, 1.0);
  v28[3] = v17;
  _UIThemeKeyFromTraitValues(3, 0, 0, 0, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v16;
  v15 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.949019608, 0.949019608, 0.949019608, 1.0);
  v28[4] = v15;
  _UIThemeKeyFromTraitValues(3, 2, 0, 0, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v14;
  v13 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.101960784, 0.101960784, 0.101960784, 1.0);
  v28[5] = v13;
  _UIThemeKeyFromTraitValues(3, 2, 0, 0, 0, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v12;
  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 1.0);
  v28[6] = v0;
  _UIThemeKeyFromTraitValues(4, 2, 0, 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v27[7] = v1;
  v2 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.949019608, 0.956862745, 0.988235294, 0.14);
  v28[7] = v2;
  _UIThemeKeyFromTraitValues(4, 2, 1, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27[8] = v3;
  v4 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.949019608, 0.956862745, 0.988235294, 0.14);
  v28[8] = v4;
  _UIThemeKeyFromTraitValues(4, 1, 0, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[9] = v5;
  v6 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.08);
  v28[9] = v6;
  _UIThemeKeyFromTraitValues(4, 1, 1, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[10] = v7;
  v8 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.08);
  v28[10] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v26, v25, v9);
  v11 = (void *)qword_1ECD7C2F8;
  qword_1ECD7C2F8 = (uint64_t)v10;

}

void __58__UIColor__UIInterfaceAPI__secondarySystemBackgroundColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  UICachedDeviceWhiteColor *v2;
  void *v3;
  UICachedDeviceWhiteColor *v4;
  void *v5;
  UICachedDeviceWhiteColor *v6;
  void *v7;
  UICachedDeviceWhiteColor *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  UICachedDeviceRGBColor *v13;
  void *v14;
  UICachedDeviceRGBColor *v15;
  void *v16;
  UICachedDeviceRGBColor *v17;
  void *v18;
  UICachedDeviceRGBColor *v19;
  void *v20;
  UICachedDeviceRGBColor *v21;
  void *v22;
  void *v23;
  UIDynamicSystemColor *v24;
  _QWORD v25[10];
  _QWORD v26[12];

  v26[10] = *MEMORY[0x1E0C80C00];
  v24 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "secondarySystemBackgroundColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v22;
  v21 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.949019608, 0.949019608, 0.968627451, 1.0);
  v26[0] = v21;
  _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v20;
  v19 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.921568627, 0.921568627, 0.941176471, 1.0);
  v26[1] = v19;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v18;
  v17 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.109803922, 0.109803922, 0.117647059, 1.0);
  v26[2] = v17;
  _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v16;
  v15 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.141176471, 0.141176471, 0.149019608, 1.0);
  v26[3] = v15;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v14;
  v13 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.17254902, 0.17254902, 0.180392157, 1.0);
  v26[4] = v13;
  _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v12;
  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.211764706, 0.211764706, 0.219607843, 1.0);
  v26[5] = v0;
  _UIThemeKeyFromTraitValues(4, 2, 0, 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v1;
  v2 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 1.0);
  v26[6] = v2;
  _UIThemeKeyFromTraitValues(4, 2, 1, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v3;
  v4 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 1.0);
  v26[7] = v4;
  _UIThemeKeyFromTraitValues(4, 1, 0, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v5;
  v6 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 1.0);
  v26[8] = v6;
  _UIThemeKeyFromTraitValues(4, 1, 1, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[9] = v7;
  v8 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 1.0);
  v26[9] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v24, v23, v9);
  v11 = (void *)qword_1ECD7C118;
  qword_1ECD7C118 = (uint64_t)v10;

}

void __58__UIColor__InProgressSPI__tableCellGroupedBackgroundColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;

  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tableCellGroupedBackgroundColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _colorsByThemeKeysecondarySystemGroupedBackgroundColor();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v4, v1);
  v3 = (void *)qword_1ECD7C328;
  qword_1ECD7C328 = (uint64_t)v2;

}

void __65__UIColor__UIInterfaceAPI__secondarySystemGroupedBackgroundColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;

  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "secondarySystemGroupedBackgroundColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _colorsByThemeKeysecondarySystemGroupedBackgroundColor();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v4, v1);
  v3 = (void *)qword_1ECD7C148;
  qword_1ECD7C148 = (uint64_t)v2;

}

void __56__UIColor__InProgressSPI__groupTableViewBackgroundColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;

  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "groupTableViewBackgroundColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _colorsByThemeKeysystemGroupedBackgroundColor();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v4, v1);
  v3 = (void *)qword_1ECD7C318;
  qword_1ECD7C318 = (uint64_t)v2;

}

void __56__UIColor__UIInterfaceAPI__systemGroupedBackgroundColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;

  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemGroupedBackgroundColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _colorsByThemeKeysystemGroupedBackgroundColor();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v4, v1);
  v3 = (void *)qword_1ECD7C138;
  qword_1ECD7C138 = (uint64_t)v2;

}

void __56__UIColor__InProgressSPI__tableCellPlainBackgroundColor__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  UICachedDeviceRGBColor *v2;
  void *v3;
  UICachedDeviceRGBColor *v4;
  void *v5;
  UICachedDeviceWhiteColor *v6;
  void *v7;
  UICachedDeviceWhiteColor *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  UICachedDeviceWhiteColor *v13;
  void *v14;
  UICachedDeviceRGBColor *v15;
  void *v16;
  UICachedDeviceRGBColor *v17;
  void *v18;
  UICachedDeviceWhiteColor *v19;
  void *v20;
  UICachedDeviceWhiteColor *v21;
  void *v22;
  void *v23;
  UIDynamicSystemColor *v24;
  _QWORD v25[10];
  _QWORD v26[12];

  v26[10] = *MEMORY[0x1E0C80C00];
  v24 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tableCellPlainBackgroundColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v22;
  v21 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 1.0);
  v26[0] = v21;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v20;
  v19 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 1.0);
  v26[1] = v19;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 1, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v18;
  v17 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.109803922, 0.109803922, 0.117647059, 1.0);
  v26[2] = v17;
  _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v16;
  v15 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.141176471, 0.141176471, 0.149019608, 1.0);
  v26[3] = v15;
  _UIThemeKeyFromTraitValues(3, 0, 0, 0, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v14;
  v13 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.07);
  v26[4] = v13;
  _UIThemeKeyFromTraitValues(3, 2, 0, 0, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v12;
  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.15);
  v26[5] = v0;
  _UIThemeKeyFromTraitValues(4, 2, 0, 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v1;
  v2 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.949019608, 0.956862745, 0.988235294, 0.14);
  v26[6] = v2;
  _UIThemeKeyFromTraitValues(4, 2, 1, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v3;
  v4 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.949019608, 0.956862745, 0.988235294, 0.14);
  v26[7] = v4;
  _UIThemeKeyFromTraitValues(4, 1, 0, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v5;
  v6 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.08);
  v26[8] = v6;
  _UIThemeKeyFromTraitValues(4, 1, 1, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[9] = v7;
  v8 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.08);
  v26[9] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v24, v23, v9);
  v11 = (void *)qword_1ECD7C308;
  qword_1ECD7C308 = (uint64_t)v10;

}

void __46__UIColor__InProgressSPI__tableSeparatorColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;

  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tableSeparatorColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _colorsByThemeKeyseparatorColor();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v4, v1);
  v3 = (void *)qword_1ECD7C338;
  qword_1ECD7C338 = (uint64_t)v2;

}

void __50__UIColor__InProgressSPI__tableSeparatorDarkColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;

  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tableSeparatorDarkColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _colorsByThemeKeyseparatorColor();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v4, v1);
  v3 = (void *)qword_1ECD7C348;
  qword_1ECD7C348 = (uint64_t)v2;

}

void __51__UIColor__InProgressSPI__tableSeparatorLightColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;

  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tableSeparatorLightColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _colorsByThemeKeyseparatorColor();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v4, v1);
  v3 = (void *)qword_1ECD7C358;
  qword_1ECD7C358 = (uint64_t)v2;

}

void __42__UIColor__UIInterfaceAPI__separatorColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;

  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "separatorColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _colorsByThemeKeyseparatorColor();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v4, v1);
  v3 = (void *)qword_1ECD7C0E8;
  qword_1ECD7C0E8 = (uint64_t)v2;

}

void __59__UIColor__InProgressSPI___alertControllerDimmingViewColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  void *v2;
  UICachedDeviceWhiteColor *v3;
  void *v4;
  UICachedDeviceWhiteColor *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_alertControllerDimmingViewColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v3 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.2);
  v10[0] = v3;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v5 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.48);
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  v8 = (void *)qword_1ECD7C298;
  qword_1ECD7C298 = (uint64_t)v7;

}

void __49__UIColor__UIInterfaceAPI__systemBackgroundColor__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  UICachedDeviceWhiteColor *v2;
  void *v3;
  UICachedDeviceRGBColor *v4;
  void *v5;
  UICachedDeviceRGBColor *v6;
  void *v7;
  UICachedDeviceWhiteColor *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  UIDynamicSystemColor *v14;
  _QWORD v15[5];
  _QWORD v16[6];

  v16[5] = *MEMORY[0x1E0C80C00];
  v14 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemBackgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v12;
  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 1.0);
  v16[0] = v0;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v1;
  v2 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 1.0);
  v16[1] = v2;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v3;
  v4 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.109803922, 0.109803922, 0.117647059, 1.0);
  v16[2] = v4;
  _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v5;
  v6 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.141176471, 0.141176471, 0.149019608, 1.0);
  v16[3] = v6;
  _UIThemeKeyFromTraitValues(4, 1, 0, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v7;
  v8 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 1.0);
  v16[4] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v14, v13, v9);
  v11 = (void *)qword_1ECD7C108;
  qword_1ECD7C108 = (uint64_t)v10;

}

void __50__UIColor__InProgressSPI__tertiarySystemFillColor__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  UICachedDeviceRGBColor *v2;
  void *v3;
  UICachedDeviceRGBColor *v4;
  void *v5;
  UICachedDeviceWhiteColor *v6;
  void *v7;
  UICachedDeviceWhiteColor *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  UICachedDeviceWhiteColor *v13;
  void *v14;
  UICachedDeviceWhiteColor *v15;
  void *v16;
  UICachedDeviceWhiteColor *v17;
  void *v18;
  UICachedDeviceRGBColor *v19;
  void *v20;
  UICachedDeviceRGBColor *v21;
  void *v22;
  UICachedDeviceRGBColor *v23;
  void *v24;
  UICachedDeviceRGBColor *v25;
  void *v26;
  void *v27;
  UIDynamicSystemColor *v28;
  _QWORD v29[12];
  _QWORD v30[14];

  v30[12] = *MEMORY[0x1E0C80C00];
  v28 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tertiarySystemFillColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v26;
  v25 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.462745098, 0.462745098, 0.501960784, 0.12);
  v30[0] = v25;
  _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v24;
  v23 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.462745098, 0.462745098, 0.501960784, 0.2);
  v30[1] = v23;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v22;
  v21 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.462745098, 0.462745098, 0.501960784, 0.24);
  v30[2] = v21;
  _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v20;
  v19 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.462745098, 0.462745098, 0.501960784, 0.32);
  v30[3] = v19;
  _UIThemeKeyFromTraitValues(2, 0, 0, 0, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v18;
  v17 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.12);
  v30[4] = v17;
  _UIThemeKeyFromTraitValues(2, 0, 1, 0, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v16;
  v15 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.12);
  v30[5] = v15;
  _UIThemeKeyFromTraitValues(2, 2, 0, 0, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[6] = v14;
  v13 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.12);
  v30[6] = v13;
  _UIThemeKeyFromTraitValues(2, 2, 1, 0, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[7] = v12;
  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.12);
  v30[7] = v0;
  _UIThemeKeyFromTraitValues(4, 2, 0, 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v29[8] = v1;
  v2 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.949019608, 0.956862745, 0.988235294, 0.14);
  v30[8] = v2;
  _UIThemeKeyFromTraitValues(4, 2, 1, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29[9] = v3;
  v4 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.949019608, 0.956862745, 0.988235294, 0.16);
  v30[9] = v4;
  _UIThemeKeyFromTraitValues(4, 1, 0, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[10] = v5;
  v6 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.08);
  v30[10] = v6;
  _UIThemeKeyFromTraitValues(4, 1, 1, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[11] = v7;
  v8 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.12);
  v30[11] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v28, v27, v9);
  v11 = (void *)qword_1ECD7C1A8;
  qword_1ECD7C1A8 = (uint64_t)v10;

}

void __48__UIColor__UIInterfaceAPI__placeholderTextColor__block_invoke()
{
  UIDynamicCatalogSystemColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = [UIDynamicCatalogSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "placeholderTextColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 17);
  v2 = (void *)qword_1ECD7C068;
  qword_1ECD7C068 = (uint64_t)v1;

}

void __43__UIColor__UIInterfaceAPI__systemPinkColor__block_invoke()
{
  UIDynamicCatalogSystemColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = [UIDynamicCatalogSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemPinkColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 10);
  v2 = (void *)qword_1ECD7BFE8;
  qword_1ECD7BFE8 = (uint64_t)v1;

}

void __45__UIColor__UIInterfaceAPI__systemYellowColor__block_invoke()
{
  UIDynamicCatalogSystemColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = [UIDynamicCatalogSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemYellowColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 2);
  v2 = (void *)qword_1ECD7BF68;
  qword_1ECD7BF68 = (uint64_t)v1;

}

void __44__UIColor__UIInterfaceAPI__systemGreenColor__block_invoke()
{
  UIDynamicCatalogSystemColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = [UIDynamicCatalogSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemGreenColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 3);
  v2 = (void *)qword_1ECD7BF78;
  qword_1ECD7BF78 = (uint64_t)v1;

}

void __45__UIColor__UIInterfaceAPI__systemOrangeColor__block_invoke()
{
  UIDynamicCatalogSystemColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = [UIDynamicCatalogSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemOrangeColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 1);
  v2 = (void *)qword_1ECD7BF58;
  qword_1ECD7BF58 = (uint64_t)v1;

}

void __48__UIColor__UIInterfaceAPI__quaternaryLabelColor__block_invoke()
{
  UIDynamicCatalogSystemColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = [UIDynamicCatalogSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "quaternaryLabelColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 18);
  v2 = (void *)qword_1ECD7C048;
  qword_1ECD7C048 = (uint64_t)v1;

}

void __43__UIColor__UIInterfaceAPI__systemGrayColor__block_invoke()
{
  UIDynamicCatalogSystemColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = [UIDynamicCatalogSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemGrayColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 13);
  v2 = (void *)qword_1ECD7BFF8;
  qword_1ECD7BFF8 = (uint64_t)v1;

}

void __42__UIColor__UIInterfaceAPI__systemRedColor__block_invoke()
{
  UIDynamicCatalogSystemColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = [UIDynamicCatalogSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemRedColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 0);
  v2 = (void *)qword_1ECD7BF48;
  qword_1ECD7BF48 = (uint64_t)v1;

}

void __46__UIColor__UIInterfaceAPI__tertiaryLabelColor__block_invoke()
{
  UIDynamicCatalogSystemColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = [UIDynamicCatalogSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tertiaryLabelColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 17);
  v2 = (void *)qword_1ECD7C038;
  qword_1ECD7C038 = (uint64_t)v1;

}

void __47__UIColor__UIInterfaceAPI__secondaryLabelColor__block_invoke()
{
  UIDynamicCatalogSystemColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = [UIDynamicCatalogSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "secondaryLabelColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 16);
  v2 = (void *)qword_1ECD7C028;
  qword_1ECD7C028 = (uint64_t)v1;

}

void __38__UIColor__UIInterfaceAPI__labelColor__block_invoke()
{
  UIDynamicCatalogSystemColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = [UIDynamicCatalogSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "labelColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 15);
  v2 = (void *)qword_1ECD7C018;
  qword_1ECD7C018 = (uint64_t)v1;

}

void __43__UIColor__UIInterfaceAPI__systemBlueColor__block_invoke()
{
  UIDynamicCatalogSystemColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = [UIDynamicCatalogSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemBlueColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 7);
  v2 = (void *)qword_1ECD7BFB8;
  qword_1ECD7BFB8 = (uint64_t)v1;

}

+ (id)_dynamicColorWithColorsByTraitCollection:(id)a3
{
  id v3;
  id *v4;

  v3 = a3;
  v4 = -[UIDynamicAppDefinedColor initWithColorsByTraitCollection:]((id *)[UIDynamicAppDefinedColor alloc], v3);

  return v4;
}

- (void)_setSystemColorName:(id)a3
{
  NSString *v6;
  NSString *systemColorName;
  void *v8;
  NSString *v9;
  NSString *v10;

  v6 = (NSString *)a3;
  systemColorName = self->_systemColorName;
  if (systemColorName)
  {
    v10 = v6;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIColor.m"), 2575, CFSTR("can only set the system color name of a color once, but attempting to change %@ from %@ to %@"), self, self->_systemColorName, v10);

    v6 = v10;
    systemColorName = self->_systemColorName;
  }
  if (systemColorName != v6)
  {
    v9 = v6;
    objc_storeStrong((id *)&self->_systemColorName, a3);
    v6 = v9;
  }

}

+ (id)_vibrantLightFillBurnColor
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.6, 1.0);
}

+ (UIColor)tertiarySystemBackgroundColor
{
  if (qword_1ECD7C130 != -1)
    dispatch_once(&qword_1ECD7C130, &__block_literal_global_1517);
  return (UIColor *)(id)qword_1ECD7C128;
}

+ (id)systemLightGrayColor
{
  if (qword_1ECD7BC30 != -1)
    dispatch_once(&qword_1ECD7BC30, &__block_literal_global_1056);
  return (id)qword_1ECD7BC28;
}

+ (UIColor)quaternarySystemFillColor
{
  if (qword_1ECD7C1C0 != -1)
    dispatch_once(&qword_1ECD7C1C0, &__block_literal_global_1534);
  return (UIColor *)(id)qword_1ECD7C1B8;
}

+ (UIColor)systemIndigoColor
{
  if (qword_1ECD7BFD0 != -1)
    dispatch_once(&qword_1ECD7BFD0, &__block_literal_global_1472);
  return (UIColor *)(id)qword_1ECD7BFC8;
}

+ (id)_carSystemFocusColor
{
  if (qword_1ECD7C450 != -1)
    dispatch_once(&qword_1ECD7C450, &__block_literal_global_1616);
  return (id)qword_1ECD7C448;
}

+ (id)_alternateSystemInteractionTintColor
{
  return +[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor");
}

+ (UIColor)grayColor
{
  if (qword_1ECD7B998 != -1)
    dispatch_once(&qword_1ECD7B998, &__block_literal_global_967);
  return (UIColor *)(id)qword_1ECD7B990;
}

- (UIColor)initWithHue:(CGFloat)hue saturation:(CGFloat)saturation brightness:(CGFloat)brightness alpha:(CGFloat)alpha
{

  return (UIColor *)objc_msgSend(objc_allocWithZone((Class)UIDeviceRGBColor), "initWithHue:saturation:brightness:alpha:", hue, saturation, brightness, alpha);
}

+ (UIColor)systemGray6Color
{
  if (qword_1ECD7C0D0 != -1)
    dispatch_once(&qword_1ECD7C0D0, &__block_literal_global_1505);
  return (UIColor *)(id)qword_1ECD7C0C8;
}

+ (UIColor)systemGray3Color
{
  if (qword_1ECD7C0A0 != -1)
    dispatch_once(&qword_1ECD7C0A0, &__block_literal_global_1499);
  return (UIColor *)(id)qword_1ECD7C098;
}

+ (UIColor)systemPurpleColor
{
  if (qword_1ECD7BFE0 != -1)
    dispatch_once(&qword_1ECD7BFE0, &__block_literal_global_1474);
  return (UIColor *)(id)qword_1ECD7BFD8;
}

+ (UIColor)tertiarySystemGroupedBackgroundColor
{
  if (qword_1ECD7C160 != -1)
    dispatch_once(&qword_1ECD7C160, &__block_literal_global_1523);
  return (UIColor *)(id)qword_1ECD7C158;
}

+ (UIColor)systemMintColor
{
  if (qword_1ECD7BFA0 != -1)
    dispatch_once(&qword_1ECD7BFA0, &__block_literal_global_1466);
  return (UIColor *)(id)qword_1ECD7BF98;
}

+ (UIColor)systemTealColor
{
  if (qword_1ECD7BF90 != -1)
    dispatch_once(&qword_1ECD7BF90, &__block_literal_global_1464);
  return (UIColor *)(id)qword_1ECD7BF88;
}

void __20__UIColor_tintColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ECD7BF08;
  qword_1ECD7BF08 = v0;

}

+ (UIColor)systemBrownColor
{
  if (qword_1ECD7C010 != -1)
    dispatch_once(&qword_1ECD7C010, &__block_literal_global_1480);
  return (UIColor *)(id)qword_1ECD7C008;
}

- (double)_luminance
{
  CGColor *v2;
  double v3;
  CGColor *v4;
  const CGFloat *Components;
  CGFloat Alpha;
  CGColorSpaceRef ColorSpace;
  CGColorSpaceRef v8;
  double v9;
  double v10;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = -[UIColor CGColor](objc_retainAutorelease(self), "CGColor");
  v3 = 0.0;
  if (v2)
  {
    v4 = v2;
    Components = CGColorGetComponents(v2);
    Alpha = CGColorGetAlpha(v4);
    ColorSpace = CGColorGetColorSpace(v4);
    if (Components)
    {
      v8 = ColorSpace;
      v12 = 0u;
      v13 = 0u;
      if (qword_1ECD7C4C0 != -1)
        dispatch_once(&qword_1ECD7C4C0, &__block_literal_global_1675);
      if ((CGColorSpaceRef)qword_1ECD7C4B8 != v8)
      {
        if (qword_1ECD7C500 != -1)
          dispatch_once(&qword_1ECD7C500, &__block_literal_global_1679);
        if ((CGColorSpaceRef)qword_1ECD7C4F8 != v8)
        {
          UISCreateCachedColorTransform();
          if (!CGColorTransformConvertColorComponents())
          {
            CGColorTransformRelease();
            return v3;
          }
          *((CGFloat *)&v13 + 1) = Alpha;
          CGColorTransformRelease();
          Components = (const CGFloat *)&v12;
        }
      }
      v9 = Components[3];
      +[UIColor _luminanceWithRed:green:blue:](UIColor, "_luminanceWithRed:green:blue:", *Components, Components[1], Components[2], v12, v13);
      return v9 * v10;
    }
  }
  return v3;
}

+ (double)_luminanceWithRed:(double)a3 green:(double)a4 blue:(double)a5
{
  return a3 * 0.2126 + a4 * 0.7152 + a5 * 0.0722;
}

+ (UIColor)systemCyanColor
{
  if (qword_1ECD7BFB0 != -1)
    dispatch_once(&qword_1ECD7BFB0, &__block_literal_global_1468);
  return (UIColor *)(id)qword_1ECD7BFA8;
}

+ (UIColor)systemGrayColor
{
  if (qword_1ECD7C000 != -1)
    dispatch_once(&qword_1ECD7C000, &__block_literal_global_1478);
  return (UIColor *)(id)qword_1ECD7BFF8;
}

+ (id)_systemGroupedBackgroundColor
{
  return +[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor");
}

+ (UIColor)blueColor
{
  if (qword_1ECD7B9D8 != -1)
    dispatch_once(&qword_1ECD7B9D8, &__block_literal_global_976);
  return (UIColor *)(id)qword_1ECD7B9D0;
}

+ (id)_barHairlineShadowColor
{
  if (qword_1ECD7BE20 != -1)
    dispatch_once(&qword_1ECD7BE20, &__block_literal_global_1118);
  return (id)qword_1ECD7BE18;
}

void __21__UIColor_blackColor__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 1.0);
  v1 = (void *)qword_1ECD7B950;
  qword_1ECD7B950 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7B950;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "blackColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)_windowBackgroundColor
{
  if (qword_1ECD7C400 != -1)
    dispatch_once(&qword_1ECD7C400, &__block_literal_global_1606);
  return (id)qword_1ECD7C3F8;
}

+ (UIColor)systemGray2Color
{
  if (qword_1ECD7C090 != -1)
    dispatch_once(&qword_1ECD7C090, &__block_literal_global_1497);
  return (UIColor *)(id)qword_1ECD7C088;
}

+ (id)_secondarySystemGroupedBackgroundColor
{
  return +[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor");
}

+ (id)_separatorColor
{
  return +[UIColor separatorColor](UIColor, "separatorColor");
}

+ (UIColor)linkColor
{
  if (qword_1ECD7C0E0 != -1)
    dispatch_once(&qword_1ECD7C0E0, &__block_literal_global_1507);
  return (UIColor *)(id)qword_1ECD7C0D8;
}

+ (id)systemLightMidGrayColor
{
  if (qword_1ECD7BC40 != -1)
    dispatch_once(&qword_1ECD7BC40, &__block_literal_global_1058);
  return (id)qword_1ECD7BC38;
}

+ (id)_quaternaryLabelColor
{
  return +[UIColor quaternaryLabelColor](UIColor, "quaternaryLabelColor");
}

+ (id)systemMidGrayColor
{
  if (qword_1ECD7BC00 != -1)
    dispatch_once(&qword_1ECD7BC00, &__block_literal_global_1050);
  return (id)qword_1ECD7BBF8;
}

void __38__UIColor___halfTransparentWhiteColor__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;

  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.5);
  v1 = (void *)qword_1ECD7BB50;
  qword_1ECD7BB50 = (uint64_t)v0;

}

void __34__UIColor_selectionHighlightColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.0, 0.33, 0.65, 0.2);
  v1 = (void *)qword_1ECD7BB78;
  qword_1ECD7BB78 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BB78;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "selectionHighlightColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

void __32__UIColor_selectionGrabberColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.078, 0.435, 0.882, 1.0);
  v1 = (void *)qword_1ECD7BB98;
  qword_1ECD7BB98 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BB98;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "selectionGrabberColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

void __30__UIColor_insertionPointColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.26, 0.42, 0.95, 1.0);
  v1 = (void *)qword_1ECD7BB88;
  qword_1ECD7BB88 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BB88;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "insertionPointColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (UIColor)colorWithPatternImage:(UIImage *)image
{
  UIImage *v3;
  void *v4;

  v3 = image;
  v4 = (void *)objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithPatternImage:", v3);

  return (UIColor *)v4;
}

- (UIColor)initWithPatternImage:(UIImage *)image
{
  UIImage *v4;
  UIDynamicPatternColor *v5;

  v4 = image;

  v5 = -[UIDynamicPatternColor initWithPatternImage:]([UIDynamicPatternColor alloc], "initWithPatternImage:", v4);
  return &v5->super.super;
}

void __38__UIColor___halfTransparentBlackColor__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;

  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.5);
  v1 = (void *)qword_1ECD7BB40;
  qword_1ECD7BB40 = (uint64_t)v0;

}

+ (id)systemMidGrayTintColor
{
  if (qword_1ECD7BD90 != -1)
    dispatch_once(&qword_1ECD7BD90, &__block_literal_global_1100);
  return (id)qword_1ECD7BD88;
}

+ (id)systemLightMidGrayTintColor
{
  if (qword_1ECD7BD80 != -1)
    dispatch_once(&qword_1ECD7BD80, &__block_literal_global_1098_0);
  return (id)qword_1ECD7BD78;
}

+ (id)systemGrayTintColor
{
  if (qword_1ECD7BDA0 != -1)
    dispatch_once(&qword_1ECD7BDA0, &__block_literal_global_1102);
  return (id)qword_1ECD7BD98;
}

+ (id)systemExtraLightGrayTintColor
{
  if (qword_1ECD7BD60 != -1)
    dispatch_once(&qword_1ECD7BD60, &__block_literal_global_1094);
  return (id)qword_1ECD7BD58;
}

+ (id)systemDarkYellowColor
{
  if (qword_1ECD7BCA0 != -1)
    dispatch_once(&qword_1ECD7BCA0, &__block_literal_global_1070);
  return (id)qword_1ECD7BC98;
}

+ (id)systemDarkTealColor
{
  if (qword_1ECD7BCB0 != -1)
    dispatch_once(&qword_1ECD7BCB0, &__block_literal_global_1072);
  return (id)qword_1ECD7BCA8;
}

+ (id)systemDarkRedColor
{
  if (qword_1ECD7BC60 != -1)
    dispatch_once(&qword_1ECD7BC60, &__block_literal_global_1062);
  return (id)qword_1ECD7BC58;
}

+ (id)systemDarkPurpleColor
{
  if (qword_1ECD7BCD0 != -1)
    dispatch_once(&qword_1ECD7BCD0, &__block_literal_global_1076);
  return (id)qword_1ECD7BCC8;
}

+ (id)systemDarkPinkColor
{
  if (qword_1ECD7BCC0 != -1)
    dispatch_once(&qword_1ECD7BCC0, &__block_literal_global_1074);
  return (id)qword_1ECD7BCB8;
}

+ (id)systemDarkOrangeColor
{
  if (qword_1ECD7BC90 != -1)
    dispatch_once(&qword_1ECD7BC90, &__block_literal_global_1068);
  return (id)qword_1ECD7BC88;
}

+ (id)systemDarkMidGrayTintColor
{
  if (qword_1ECD7BDE0 != -1)
    dispatch_once(&qword_1ECD7BDE0, &__block_literal_global_1110);
  return (id)qword_1ECD7BDD8;
}

+ (id)systemDarkLightMidGrayTintColor
{
  if (qword_1ECD7BDD0 != -1)
    dispatch_once(&qword_1ECD7BDD0, &__block_literal_global_1108);
  return (id)qword_1ECD7BDC8;
}

+ (id)systemDarkLightMidGrayColor
{
  if (qword_1ECD7BD00 != -1)
    dispatch_once(&qword_1ECD7BD00, &__block_literal_global_1082);
  return (id)qword_1ECD7BCF8;
}

+ (id)systemDarkLightGrayTintColor
{
  if (qword_1ECD7BDC0 != -1)
    dispatch_once(&qword_1ECD7BDC0, &__block_literal_global_1106);
  return (id)qword_1ECD7BDB8;
}

+ (id)systemDarkLightGrayColor
{
  if (qword_1ECD7BCF0 != -1)
    dispatch_once(&qword_1ECD7BCF0, &__block_literal_global_1080);
  return (id)qword_1ECD7BCE8;
}

+ (id)systemDarkGreenColor
{
  if (qword_1ECD7BC70 != -1)
    dispatch_once(&qword_1ECD7BC70, &__block_literal_global_1064);
  return (id)qword_1ECD7BC68;
}

+ (id)systemDarkGrayColor
{
  if (qword_1ECD7BD20 != -1)
    dispatch_once(&qword_1ECD7BD20, &__block_literal_global_1086);
  return (id)qword_1ECD7BD18;
}

+ (id)systemDarkExtraLightGrayTintColor
{
  if (qword_1ECD7BDB0 != -1)
    dispatch_once(&qword_1ECD7BDB0, &__block_literal_global_1104);
  return (id)qword_1ECD7BDA8;
}

+ (id)systemDarkExtraLightGrayColor
{
  if (qword_1ECD7BCE0 != -1)
    dispatch_once(&qword_1ECD7BCE0, &__block_literal_global_1078);
  return (id)qword_1ECD7BCD8;
}

+ (id)systemDarkBlueColor
{
  if (qword_1ECD7BC80 != -1)
    dispatch_once(&qword_1ECD7BC80, &__block_literal_global_1066);
  return (id)qword_1ECD7BC78;
}

+ (id)externalSystemTealColor
{
  if (qword_1ECD7BD30 != -1)
    dispatch_once(&qword_1ECD7BD30, &__block_literal_global_1088);
  return (id)qword_1ECD7BD28;
}

+ (id)externalSystemRedColor
{
  if (qword_1ECD7BD40 != -1)
    dispatch_once(&qword_1ECD7BD40, &__block_literal_global_1090);
  return (id)qword_1ECD7BD38;
}

+ (id)externalSystemGreenColor
{
  if (qword_1ECD7BD50 != -1)
    dispatch_once(&qword_1ECD7BD50, &__block_literal_global_1092);
  return (id)qword_1ECD7BD48;
}

+ (id)systemLightGrayTintColor
{
  if (qword_1ECD7BD70 != -1)
    dispatch_once(&qword_1ECD7BD70, &__block_literal_global_1096_0);
  return (id)qword_1ECD7BD68;
}

+ (id)systemExtraLightGrayColor
{
  if (qword_1ECD7BC20 != -1)
    dispatch_once(&qword_1ECD7BC20, &__block_literal_global_1054_0);
  return (id)qword_1ECD7BC18;
}

+ (id)systemDarkMidGrayColor
{
  if (qword_1ECD7BD10 != -1)
    dispatch_once(&qword_1ECD7BD10, &__block_literal_global_1084);
  return (id)qword_1ECD7BD08;
}

+ (id)systemDarkGrayTintColor
{
  if (qword_1ECD7BDF0 != -1)
    dispatch_once(&qword_1ECD7BDF0, &__block_literal_global_1112);
  return (id)qword_1ECD7BDE8;
}

void __36__UIColor__systemColorSelectorTable__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3870], "pointerFunctionsWithOptions:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3870], "pointerFunctionsWithOptions:", 258);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyPointerFunctions:valuePointerFunctions:capacity:", v3, v0, 64);
  v2 = (void *)qword_1ECD7B938;
  qword_1ECD7B938 = v1;

  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tintColor"), sel_tintColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("blackColor"), sel_blackColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("darkGrayColor"), sel_darkGrayColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("lightGrayColor"), sel_lightGrayColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("whiteColor"), sel_whiteColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("grayColor"), sel_grayColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("clearColor"), sel_clearColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("redColor"), sel_redColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("greenColor"), sel_greenColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("blueColor"), sel_blueColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("cyanColor"), sel_cyanColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("yellowColor"), sel_yellowColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("magentaColor"), sel_magentaColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("orangeColor"), sel_orangeColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("purpleColor"), sel_purpleColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("brownColor"), sel_brownColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tableBackgroundColor"), sel_tableBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tableCellPlainBackgroundColor"), sel_tableCellPlainBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tableCellGroupedBackgroundColorLegacyWhite"), sel_tableCellGroupedBackgroundColorLegacyWhite);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tableCellBackgroundColor"), sel_tableCellBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tableCellbackgroundColorCarPlay"), sel_tableCellbackgroundColorCarPlay);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tablePlainHeaderFooterBackgroundColor"), sel_tablePlainHeaderFooterBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tablePlainHeaderFooterFloatingBackgroundColor"), sel_tablePlainHeaderFooterFloatingBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tableSelectionColor"), sel_tableSelectionColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tableSelectionGradientStartColor"), sel_tableSelectionGradientStartColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tableSelectionGradientEndColor"), sel_tableSelectionGradientEndColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tableShadowColor"), sel_tableShadowColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tableGroupedTopShadowColor"), sel_tableGroupedTopShadowColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("sectionListBorderColor"), sel_sectionListBorderColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("sectionHeaderBackgroundColor"), sel_sectionHeaderBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("sectionHeaderOpaqueBackgroundColor"), sel_sectionHeaderOpaqueBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("sectionHeaderBorderColor"), sel_sectionHeaderBorderColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tableCellValue1BlueColor"), sel_tableCellValue1BlueColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tableCellValue2BlueColor"), sel_tableCellValue2BlueColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tableCellGrayTextColor"), sel_tableCellGrayTextColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("textFieldAtomPurpleColor"), sel_textFieldAtomPurpleColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("infoTextOverPinStripeTextColor"), sel_infoTextOverPinStripeTextColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tableCellDefaultSelectionTintColor"), sel_tableCellDefaultSelectionTintColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tableCellPlainSelectedBackgroundColor"), sel_tableCellPlainSelectedBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tableCellGroupedSelectedBackgroundColor"), sel_tableCellGroupedSelectedBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tableCellHighlightedBackgroundColor"), sel_tableCellHighlightedBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tableCellFocusedBackgroundColor"), sel_tableCellFocusedBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tableCellDisabledBackgroundColor"), sel_tableCellDisabledBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("__halfTransparentBlackColor"), sel___halfTransparentBlackColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("__halfTransparentWhiteColor"), sel___halfTransparentWhiteColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_windowBackgroundColor"), sel__windowBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("pinStripeColor"), sel_pinStripeColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("selectionHighlightColor"), sel_selectionHighlightColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("insertionPointColor"), sel_insertionPointColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("selectionGrabberColor"), sel_selectionGrabberColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("lightTextColor"), sel_lightTextColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("darkTextColor"), sel_darkTextColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_markedTextBackgroundColor"), sel__markedTextBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemRedColor"), sel_systemRedColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemGreenColor"), sel_systemGreenColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemBlueColor"), sel_systemBlueColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemOrangeColor"), sel_systemOrangeColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemYellowColor"), sel_systemYellowColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemMintColor"), sel_systemMintColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemCyanColor"), sel_systemCyanColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemTealColor"), sel_systemTealColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemPinkColor"), sel_systemPinkColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemGrayColor"), sel_systemGrayColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemMidGrayColor"), sel_systemMidGrayColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemPurpleColor"), sel_systemPurpleColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemDarkRedColor"), sel_systemDarkRedColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemDarkGreenColor"), sel_systemDarkGreenColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemDarkBlueColor"), sel_systemDarkBlueColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemDarkOrangeColor"), sel_systemDarkOrangeColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemDarkYellowColor"), sel_systemDarkYellowColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemDarkTealColor"), sel_systemDarkTealColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemDarkPinkColor"), sel_systemDarkPinkColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemDarkPurpleColor"), sel_systemDarkPurpleColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemWhiteColor"), sel_systemWhiteColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemExtraLightGrayColor"), sel_systemExtraLightGrayColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemLightGrayColor"), sel_systemLightGrayColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemLightMidGrayColor"), sel_systemLightMidGrayColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemBlackColor"), sel_systemBlackColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemDarkExtraLightGrayColor"), sel_systemDarkExtraLightGrayColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemDarkLightGrayColor"), sel_systemDarkLightGrayColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemDarkLightMidGrayColor"), sel_systemDarkLightMidGrayColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemDarkMidGrayColor"), sel_systemDarkMidGrayColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemDarkGrayColor"), sel_systemDarkGrayColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemExtraLightGrayTintColor"), sel_systemExtraLightGrayTintColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemLightGrayTintColor"), sel_systemLightGrayTintColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemLightMidGrayTintColor"), sel_systemLightMidGrayTintColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemMidGrayTintColor"), sel_systemMidGrayTintColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemGrayTintColor"), sel_systemGrayTintColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemDarkExtraLightGrayTintColor"), sel_systemDarkExtraLightGrayTintColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemDarkLightGrayTintColor"), sel_systemDarkLightGrayTintColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemDarkLightMidGrayTintColor"), sel_systemDarkLightMidGrayTintColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemDarkMidGrayTintColor"), sel_systemDarkMidGrayTintColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemDarkGrayTintColor"), sel_systemDarkGrayTintColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("textGrammarIndicatorColor"), sel_textGrammarIndicatorColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("externalSystemTealColor"), sel_externalSystemTealColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("externalSystemRedColor"), sel_externalSystemRedColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("externalSystemGreenColor"), sel_externalSystemGreenColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_systemInteractionTintColor"), sel__systemInteractionTintColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_systemDestructiveTintColor"), sel__systemDestructiveTintColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_barHairlineShadowColor"), sel__barHairlineShadowColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_barStyleBlackHairlineShadowColor"), sel__barStyleBlackHairlineShadowColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_systemMidGrayTintColor"), sel__systemMidGrayTintColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_externalSystemWhiteColor"), sel__externalSystemWhiteColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_externalSystemMidGrayColor"), sel__externalSystemMidGrayColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_externalSystemGrayColor"), sel__externalSystemGrayColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_externalSystemDarkGrayColor"), sel__externalSystemDarkGrayColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_externalSystemExtraDarkGrayColor"), sel__externalSystemExtraDarkGrayColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_externalSystemSuperDarkGrayColor"), sel__externalSystemSuperDarkGrayColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_accessibilityButtonShapesBackgroundColorOnLight"), sel__accessibilityButtonShapesBackgroundColorOnLight);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_accessibilityButtonShapesBackgroundColorOnDark"), sel__accessibilityButtonShapesBackgroundColorOnDark);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_accessibilityButtonShapesDisabledBackgroundColorOnDark"), sel__accessibilityButtonShapesDisabledBackgroundColorOnDark);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_accessibilityButtonShapesNoBlendModeBackgroundColorOnLight"), sel__accessibilityButtonShapesNoBlendModeBackgroundColorOnLight);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_accessibilityButtonShapesNoBlendModeBackgroundColorOnDark"), sel__accessibilityButtonShapesNoBlendModeBackgroundColorOnDark);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_controlForegroundColor"), sel__controlForegroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_controlHighlightColor"), sel__controlHighlightColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_controlShadowColor"), sel__controlShadowColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_controlVibrantTopBackgroundColor"), sel__controlVibrantTopBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_controlVibrantBottomBackgroundColor"), sel__controlVibrantBottomBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_swiftColor"), sel__swiftColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_translucentPaperTextureColor"), sel__translucentPaperTextureColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_webContentBackgroundColor"), sel__webContentBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tableCellBlueTextColor"), sel_tableCellBlueTextColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tableCellGroupedBackgroundColor"), sel_tableCellGroupedBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tableGroupedSeparatorLightColor"), sel_tableGroupedSeparatorLightColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tableSeparatorDarkColor"), sel_tableSeparatorDarkColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tableSeparatorLightColor"), sel_tableSeparatorLightColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("groupTableViewBackgroundColor"), sel_groupTableViewBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("viewFlipsideBackgroundColor"), sel_viewFlipsideBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("underPageBackgroundColor"), sel_underPageBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("scrollViewTexturedBackgroundColor"), sel_scrollViewTexturedBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("noContentLightGradientBackgroundColor"), sel_noContentLightGradientBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("noContentDarkGradientBackgroundColor"), sel_noContentDarkGradientBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemIndigoColor"), sel_systemIndigoColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemBrownColor"), sel_systemBrownColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("labelColor"), sel_labelColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("secondaryLabelColor"), sel_secondaryLabelColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tertiaryLabelColor"), sel_tertiaryLabelColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("quaternaryLabelColor"), sel_quaternaryLabelColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("linkColor"), sel_linkColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("placeholderTextColor"), sel_placeholderTextColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("separatorColor"), sel_separatorColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("opaqueSeparatorColor"), sel_opaqueSeparatorColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemBackgroundColor"), sel_systemBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("secondarySystemBackgroundColor"), sel_secondarySystemBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tertiarySystemBackgroundColor"), sel_tertiarySystemBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemGroupedBackgroundColor"), sel_systemGroupedBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("secondarySystemGroupedBackgroundColor"), sel_secondarySystemGroupedBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tertiarySystemGroupedBackgroundColor"), sel_tertiarySystemGroupedBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemFillColor"), sel_systemFillColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("secondarySystemFillColor"), sel_secondarySystemFillColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tertiarySystemFillColor"), sel_tertiarySystemFillColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("quaternarySystemFillColor"), sel_quaternarySystemFillColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemGray2Color"), sel_systemGray2Color);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemGray3Color"), sel_systemGray3Color);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemGray4Color"), sel_systemGray4Color);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemGray5Color"), sel_systemGray5Color);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("systemGray6Color"), sel_systemGray6Color);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_dynamicTestColor"), sel__dynamicTestColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_textFieldBackgroundColor"), sel__textFieldBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_textFieldDisabledBackgroundColor"), sel__textFieldDisabledBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_textFieldBorderColor"), sel__textFieldBorderColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_textFieldDisabledBorderColor"), sel__textFieldDisabledBorderColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("tableSeparatorColor"), sel_tableSeparatorColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_plainTableHeaderFooterTextColor"), sel__plainTableHeaderFooterTextColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_groupTableHeaderFooterTextColor"), sel__groupTableHeaderFooterTextColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_swipedSidebarCellBackgroundColor"), sel__swipedSidebarCellBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_switchOffColor"), sel__switchOffColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_switchOffImageColor"), sel__switchOffImageColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_searchFieldDisabledBackgroundColor"), sel__searchFieldDisabledBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_pageControlIndicatorColor"), sel__pageControlIndicatorColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_pageControlPlatterIndicatorColor"), sel__pageControlPlatterIndicatorColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_searchFieldPlaceholderTextClearButtonColor"), sel__searchFieldPlaceholderTextClearButtonColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_searchBarBackgroundColor"), sel__searchBarBackgroundColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_alertControllerDimmingViewColor"), sel__alertControllerDimmingViewColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_systemChromeShadowColor"), sel__systemChromeShadowColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_splitViewBorderColor"), sel__splitViewBorderColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_systemBlueColor2"), sel__systemBlueColor2);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_monochromeCellImageTintColor"), sel__monochromeCellImageTintColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_carSystemPrimaryColor"), sel__carSystemPrimaryColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_carSystemSecondaryColor"), sel__carSystemSecondaryColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_carSystemTertiaryColor"), sel__carSystemTertiaryColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_carSystemQuaternaryColor"), sel__carSystemQuaternaryColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_carSystemFocusColor"), sel__carSystemFocusColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_carSystemFocusLabelColor"), sel__carSystemFocusLabelColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_carSystemFocusPrimaryColor"), sel__carSystemFocusPrimaryColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_carSystemFocusSecondaryColor"), sel__carSystemFocusSecondaryColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_tvLabelOpacityAColor"), sel__tvLabelOpacityAColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_tvLabelOpacityBColor"), sel__tvLabelOpacityBColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_tvLabelOpacityCColor"), sel__tvLabelOpacityCColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_tvInterfaceStyleLightContentColor"), sel__tvInterfaceStyleLightContentColor);
  NSMapInsert((NSMapTable *)qword_1ECD7B938, CFSTR("_tvInterfaceStyleDarkContentColor"), sel__tvInterfaceStyleDarkContentColor);

}

void __45__UIColor__UIInterfaceAPI__systemIndigoColor__block_invoke()
{
  UIDynamicCatalogSystemColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = [UIDynamicCatalogSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemIndigoColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 8);
  v2 = (void *)qword_1ECD7BFC8;
  qword_1ECD7BFC8 = (uint64_t)v1;

}

void __19__UIColor_redColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 1.0, 0.0, 0.0, 1.0);
  v1 = (void *)qword_1ECD7B9B0;
  qword_1ECD7B9B0 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7B9B0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "redColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)_systemBackgroundColor
{
  return +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
}

void __45__UIColor__UIInterfaceAPI__systemPurpleColor__block_invoke()
{
  UIDynamicCatalogSystemColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = [UIDynamicCatalogSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemPurpleColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 9);
  v2 = (void *)qword_1ECD7BFD8;
  qword_1ECD7BFD8 = (uint64_t)v1;

}

void __48__UIColor__UIInterfaceAPI__opaqueSeparatorColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  void *v2;
  UICachedDeviceRGBColor *v3;
  void *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "opaqueSeparatorColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v3 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.776470588, 0.776470588, 0.784313725, 1.0);
  v10[0] = v3;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.219607843, 0.219607843, 0.22745098, 1.0);
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  v8 = (void *)qword_1ECD7C0F8;
  qword_1ECD7C0F8 = (uint64_t)v7;

}

void __44__UIColor__UIInterfaceAPI__systemBrownColor__block_invoke()
{
  UIDynamicCatalogSystemColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = [UIDynamicCatalogSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemBrownColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 14);
  v2 = (void *)qword_1ECD7C008;
  qword_1ECD7C008 = (uint64_t)v1;

}

void __48__UIColor__InProgressSPI___textFieldBorderColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  void *v2;
  UICachedDeviceWhiteColor *v3;
  void *v4;
  UICachedDeviceWhiteColor *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_textFieldBorderColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v3 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.2);
  v10[0] = v3;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v5 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.2);
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  v8 = (void *)qword_1ECD7C2D8;
  qword_1ECD7C2D8 = (uint64_t)v7;

}

void __20__UIColor_grayColor__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.5, 1.0);
  v1 = (void *)qword_1ECD7B990;
  qword_1ECD7B990 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7B990;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "grayColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (UIColor)groupTableViewBackgroundColor
{
  if (qword_1ECD7C320 != -1)
    dispatch_once(&qword_1ECD7C320, &__block_literal_global_1578);
  return (UIColor *)(id)qword_1ECD7C318;
}

void __43__UIColor__UIInterfaceAPI__systemTealColor__block_invoke()
{
  UIDynamicCatalogSystemColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = [UIDynamicCatalogSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemTealColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 4);
  v2 = (void *)qword_1ECD7BF88;
  qword_1ECD7BF88 = (uint64_t)v1;

}

void __27__UIColor_systemWhiteColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemWhiteColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
    v0 = (void *)qword_1ECD7BC08;
    qword_1ECD7BC08 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BC08;
  qword_1ECD7BC08 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BC08, "_setSystemColorName:", v8);
}

+ (id)tableSeparatorColor
{
  if (qword_1ECD7C340 != -1)
    dispatch_once(&qword_1ECD7C340, &__block_literal_global_1582);
  return (id)qword_1ECD7C338;
}

void __44__UIColor__UIInterfaceAPI__systemGray4Color__block_invoke()
{
  void *v0;
  void *v1;
  UICachedDeviceRGBColor *v2;
  void *v3;
  UICachedDeviceRGBColor *v4;
  void *v5;
  UICachedDeviceRGBColor *v6;
  void *v7;
  UICachedDeviceRGBColor *v8;
  void *v9;
  id v10;
  void *v11;
  UIDynamicSystemColor *v12;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v12 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemGray4Color");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v1;
  v2 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.819607843, 0.819607843, 0.839215686, 1.0);
  v14[0] = v2;
  _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  v4 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.737254902, 0.737254902, 0.752941176, 1.0);
  v14[1] = v4;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  v6 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.22745098, 0.22745098, 0.235294118, 1.0);
  v14[2] = v6;
  _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v7;
  v8 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.266666667, 0.266666667, 0.274509804, 1.0);
  v14[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v12, v0, v9);
  v11 = (void *)qword_1ECD7C0A8;
  qword_1ECD7C0A8 = (uint64_t)v10;

}

void __25__UIColor_lightGrayColor__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.666666667, 1.0);
  v1 = (void *)qword_1ECD7B970;
  qword_1ECD7B970 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7B970;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "lightGrayColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

void __20__UIColor_blueColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.0, 0.0, 1.0, 1.0);
  v1 = (void *)qword_1ECD7B9D0;
  qword_1ECD7B9D0 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7B9D0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "blueColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)_tertiarySystemGroupedBackgroundColor
{
  return +[UIColor tertiarySystemGroupedBackgroundColor](UIColor, "tertiarySystemGroupedBackgroundColor");
}

+ (id)_tertiarySystemBackgroundColor
{
  return +[UIColor tertiarySystemBackgroundColor](UIColor, "tertiarySystemBackgroundColor");
}

void __46__UIColor__InProgressSPI___controlShadowColor__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.12);
  v1 = (void *)qword_1ECD7C258;
  qword_1ECD7C258 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7C258;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_controlShadowColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

void __43__UIColor__UIInterfaceAPI__systemMintColor__block_invoke()
{
  UIDynamicCatalogSystemColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = [UIDynamicCatalogSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemMintColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 5);
  v2 = (void *)qword_1ECD7BF98;
  qword_1ECD7BF98 = (uint64_t)v1;

}

void __43__UIColor__UIInterfaceAPI__systemCyanColor__block_invoke()
{
  UIDynamicCatalogSystemColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = [UIDynamicCatalogSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemCyanColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 6);
  v2 = (void *)qword_1ECD7BFA8;
  qword_1ECD7BFA8 = (uint64_t)v1;

}

void __47__UIColor__InProgressSPI___carSystemFocusColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  void *v2;
  UICachedDeviceRGBColor *v3;
  void *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_carSystemFocusColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v3 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.156862745, 0.615686275, 0.819607843, 1.0);
  v10[0] = v3;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.392156863, 0.823529412, 1.0, 1.0);
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  v8 = (void *)qword_1ECD7C448;
  qword_1ECD7C448 = (uint64_t)v7;

}

void __44__UIColor__barStyleBlackHairlineShadowColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.15);
  v1 = (void *)qword_1ECD7BE28;
  qword_1ECD7BE28 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BE28;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_barStyleBlackHairlineShadowColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

void __34__UIColor__barHairlineShadowColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.3);
  v1 = (void *)qword_1ECD7BE18;
  qword_1ECD7BE18 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BE18;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_barHairlineShadowColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

void __44__UIColor__UIInterfaceAPI__systemGray5Color__block_invoke()
{
  void *v0;
  void *v1;
  UICachedDeviceRGBColor *v2;
  void *v3;
  UICachedDeviceRGBColor *v4;
  void *v5;
  UICachedDeviceRGBColor *v6;
  void *v7;
  UICachedDeviceRGBColor *v8;
  void *v9;
  id v10;
  void *v11;
  UIDynamicSystemColor *v12;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v12 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemGray5Color");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v1;
  v2 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.898039216, 0.898039216, 0.917647059, 1.0);
  v14[0] = v2;
  _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  v4 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.847058824, 0.847058824, 0.862745098, 1.0);
  v14[1] = v4;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  v6 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.17254902, 0.17254902, 0.180392157, 1.0);
  v14[2] = v6;
  _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v7;
  v8 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.211764706, 0.211764706, 0.219607843, 1.0);
  v14[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v12, v0, v9);
  v11 = (void *)qword_1ECD7C0B8;
  qword_1ECD7C0B8 = (uint64_t)v10;

}

void __27__UIColor_systemBlackColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemBlackColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
    v0 = (void *)qword_1ECD7BC48;
    qword_1ECD7BC48 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BC48;
  qword_1ECD7BC48 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BC48, "_setSystemColorName:", v8);
}

void __44__UIColor__UIInterfaceAPI__systemGray3Color__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;

  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemGray3Color");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _colorsByThemeKeysystemGray3Color();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v4, v1);
  v3 = (void *)qword_1ECD7C098;
  qword_1ECD7C098 = (uint64_t)v2;

}

void __49__UIColor__InProgressSPI___windowBackgroundColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  void *v2;
  UICachedDeviceWhiteColor *v3;
  void *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_windowBackgroundColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v3 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 1.0);
  v12[0] = v3;
  _UIThemeKeyFromTraitValues(3, 0, 0, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.949019608, 0.949019608, 0.949019608, 1.0);
  v12[1] = v5;
  _UIThemeKeyFromTraitValues(3, 2, 0, 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.101960784, 0.101960784, 0.101960784, 1.0);
  v12[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v8);
  v10 = (void *)qword_1ECD7C3F8;
  qword_1ECD7C3F8 = (uint64_t)v9;

}

void __29__UIColor_systemMidGrayColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemMidGrayColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.780392157, 0.780392157, 0.8, 1.0);
    v0 = (void *)qword_1ECD7BBF8;
    qword_1ECD7BBF8 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BBF8;
  qword_1ECD7BBF8 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BBF8, "_setSystemColorName:", v8);
}

void __37__UIColor__UIInterfaceAPI__linkColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  void *v2;
  UICachedDeviceRGBColor *v3;
  void *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "linkColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v3 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.0, 0.478431373, 1.0, 1.0);
  v10[0] = v3;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.0352941176, 0.517647059, 1.0, 1.0);
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  v8 = (void *)qword_1ECD7C0D8;
  qword_1ECD7C0D8 = (uint64_t)v7;

}

void __21__UIColor_greenColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.0, 1.0, 0.0, 1.0);
  v1 = (void *)qword_1ECD7B9C0;
  qword_1ECD7B9C0 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7B9C0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "greenColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

void __34__UIColor_systemLightMidGrayColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemLightMidGrayColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.819607843, 0.819607843, 0.839215686, 1.0);
    v0 = (void *)qword_1ECD7BC38;
    qword_1ECD7BC38 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BC38;
  qword_1ECD7BC38 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BC38, "_setSystemColorName:", v8);
}

void __47__UIColor__InProgressSPI___switchOffImageColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  void *v2;
  UICachedDeviceWhiteColor *v3;
  void *v4;
  UICachedDeviceWhiteColor *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_switchOffImageColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v3 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.7, 1.0);
  v10[0] = v3;
  _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v5 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 1.0);
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  v8 = (void *)qword_1ECD7C1D8;
  qword_1ECD7C1D8 = (uint64_t)v7;

}

void __57__UIColor__UIInterfaceAPI__tertiarySystemBackgroundColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  UICachedDeviceWhiteColor *v2;
  void *v3;
  UICachedDeviceWhiteColor *v4;
  void *v5;
  UICachedDeviceWhiteColor *v6;
  void *v7;
  UICachedDeviceWhiteColor *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  UICachedDeviceRGBColor *v13;
  void *v14;
  UICachedDeviceRGBColor *v15;
  void *v16;
  UICachedDeviceRGBColor *v17;
  void *v18;
  UICachedDeviceWhiteColor *v19;
  void *v20;
  UICachedDeviceWhiteColor *v21;
  void *v22;
  void *v23;
  UIDynamicSystemColor *v24;
  _QWORD v25[10];
  _QWORD v26[12];

  v26[10] = *MEMORY[0x1E0C80C00];
  v24 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tertiarySystemBackgroundColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v22;
  v21 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 1.0);
  v26[0] = v21;
  _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v20;
  v19 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 1.0);
  v26[1] = v19;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v18;
  v17 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.17254902, 0.17254902, 0.180392157, 1.0);
  v26[2] = v17;
  _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v16;
  v15 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.211764706, 0.211764706, 0.219607843, 1.0);
  v26[3] = v15;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v14;
  v13 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.22745098, 0.22745098, 0.235294118, 1.0);
  v26[4] = v13;
  _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v12;
  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.266666667, 0.266666667, 0.274509804, 1.0);
  v26[5] = v0;
  _UIThemeKeyFromTraitValues(4, 2, 0, 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v1;
  v2 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 1.0);
  v26[6] = v2;
  _UIThemeKeyFromTraitValues(4, 2, 1, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v3;
  v4 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 1.0);
  v26[7] = v4;
  _UIThemeKeyFromTraitValues(4, 1, 0, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v5;
  v6 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 1.0);
  v26[8] = v6;
  _UIThemeKeyFromTraitValues(4, 1, 1, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[9] = v7;
  v8 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 1.0);
  v26[9] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v24, v23, v9);
  v11 = (void *)qword_1ECD7C128;
  qword_1ECD7C128 = (uint64_t)v10;

}

void __44__UIColor__UIInterfaceAPI__systemGray6Color__block_invoke()
{
  void *v0;
  void *v1;
  UICachedDeviceRGBColor *v2;
  void *v3;
  UICachedDeviceRGBColor *v4;
  void *v5;
  UICachedDeviceRGBColor *v6;
  void *v7;
  UICachedDeviceRGBColor *v8;
  void *v9;
  id v10;
  void *v11;
  UIDynamicSystemColor *v12;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v12 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemGray6Color");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v1;
  v2 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.949019608, 0.949019608, 0.968627451, 1.0);
  v14[0] = v2;
  _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  v4 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.921568627, 0.921568627, 0.941176471, 1.0);
  v14[1] = v4;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  v6 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.109803922, 0.109803922, 0.117647059, 1.0);
  v14[2] = v6;
  _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v7;
  v8 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.141176471, 0.141176471, 0.149019608, 1.0);
  v14[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v12, v0, v9);
  v11 = (void *)qword_1ECD7C0C8;
  qword_1ECD7C0C8 = (uint64_t)v10;

}

void __42__UIColor__InProgressSPI__systemFillColor__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  UICachedDeviceRGBColor *v2;
  void *v3;
  UICachedDeviceRGBColor *v4;
  void *v5;
  UICachedDeviceWhiteColor *v6;
  void *v7;
  UICachedDeviceWhiteColor *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  UICachedDeviceWhiteColor *v13;
  void *v14;
  UICachedDeviceWhiteColor *v15;
  void *v16;
  UICachedDeviceWhiteColor *v17;
  void *v18;
  UICachedDeviceRGBColor *v19;
  void *v20;
  UICachedDeviceRGBColor *v21;
  void *v22;
  UICachedDeviceRGBColor *v23;
  void *v24;
  UICachedDeviceRGBColor *v25;
  void *v26;
  void *v27;
  UIDynamicSystemColor *v28;
  _QWORD v29[12];
  _QWORD v30[14];

  v30[12] = *MEMORY[0x1E0C80C00];
  v28 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemFillColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v26;
  v25 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.470588235, 0.470588235, 0.501960784, 0.2);
  v30[0] = v25;
  _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v24;
  v23 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.470588235, 0.470588235, 0.501960784, 0.28);
  v30[1] = v23;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v22;
  v21 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.470588235, 0.470588235, 0.501960784, 0.36);
  v30[2] = v21;
  _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v20;
  v19 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.470588235, 0.470588235, 0.501960784, 0.44);
  v30[3] = v19;
  _UIThemeKeyFromTraitValues(2, 0, 0, 0, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v18;
  v17 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.2);
  v30[4] = v17;
  _UIThemeKeyFromTraitValues(2, 0, 1, 0, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v16;
  v15 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.2);
  v30[5] = v15;
  _UIThemeKeyFromTraitValues(2, 2, 0, 0, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[6] = v14;
  v13 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.2);
  v30[6] = v13;
  _UIThemeKeyFromTraitValues(2, 2, 1, 0, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[7] = v12;
  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.2);
  v30[7] = v0;
  _UIThemeKeyFromTraitValues(4, 2, 0, 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v29[8] = v1;
  v2 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.949019608, 0.956862745, 0.988235294, 0.56);
  v30[8] = v2;
  _UIThemeKeyFromTraitValues(4, 2, 1, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29[9] = v3;
  v4 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.949019608, 0.956862745, 0.988235294, 0.58);
  v30[9] = v4;
  _UIThemeKeyFromTraitValues(4, 1, 0, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[10] = v5;
  v6 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.56);
  v30[10] = v6;
  _UIThemeKeyFromTraitValues(4, 1, 1, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[11] = v7;
  v8 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.58);
  v30[11] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v28, v27, v9);
  v11 = (void *)qword_1ECD7C188;
  qword_1ECD7C188 = (uint64_t)v10;

}

void __31__UIColor_systemLightGrayColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemLightGrayColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.898039216, 0.898039216, 0.917647059, 1.0);
    v0 = (void *)qword_1ECD7BC28;
    qword_1ECD7BC28 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BC28;
  qword_1ECD7BC28 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BC28, "_setSystemColorName:", v8);
}

+ (id)tableCellBlueTextColor
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)tableCellBlueTextColor_tableCellBlueTextColor;
  if (!tableCellBlueTextColor_tableCellBlueTextColor)
  {
    +[UIColor systemBlueColor](UIColor, "systemBlueColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor _systemColorForColor:withName:]((uint64_t)a1, v4, CFSTR("tableCellBlueTextColor"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)tableCellBlueTextColor_tableCellBlueTextColor;
    tableCellBlueTextColor_tableCellBlueTextColor = v5;

    v3 = (void *)tableCellBlueTextColor_tableCellBlueTextColor;
  }
  return v3;
}

+ (id)_systemColorForColor:(void *)a3 withName:
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  v6 = objc_alloc((Class)objc_opt_class());
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "CGColor");

  v9 = (void *)objc_msgSend(v6, "initWithCGColor:", v8);
  objc_msgSend(v9, "_setSystemColorName:", v4);

  return v9;
}

void __42__UIColor__InProgressSPI___switchOffColor__block_invoke()
{
  void *v0;
  void *v1;
  UICachedDeviceRGBColor *v2;
  void *v3;
  UICachedDeviceRGBColor *v4;
  void *v5;
  UICachedDeviceRGBColor *v6;
  void *v7;
  UICachedDeviceRGBColor *v8;
  void *v9;
  id v10;
  void *v11;
  UIDynamicSystemColor *v12;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v12 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_switchOffColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v1;
  v2 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.470588235, 0.470588235, 0.501960784, 0.16);
  v14[0] = v2;
  _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  v4 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.470588235, 0.470588235, 0.501960784, 0.78);
  v14[1] = v4;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  v6 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.470588235, 0.470588235, 0.501960784, 0.32);
  v14[2] = v6;
  _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v7;
  v8 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.470588235, 0.470588235, 0.501960784, 0.9);
  v14[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v12, v0, v9);
  v11 = (void *)qword_1ECD7C1C8;
  qword_1ECD7C1C8 = (uint64_t)v10;

}

void __53__UIColor__InProgressSPI___pageControlIndicatorColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  void *v2;
  UICachedDeviceWhiteColor *v3;
  void *v4;
  UICachedDeviceWhiteColor *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_pageControlIndicatorColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v3 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.45);
  v10[0] = v3;
  _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v5 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.55);
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  v8 = (void *)qword_1ECD7C1F8;
  qword_1ECD7C1F8 = (uint64_t)v7;

}

void __64__UIColor__UIInterfaceAPI__tertiarySystemGroupedBackgroundColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  UICachedDeviceWhiteColor *v2;
  void *v3;
  UICachedDeviceWhiteColor *v4;
  void *v5;
  UICachedDeviceWhiteColor *v6;
  void *v7;
  UICachedDeviceWhiteColor *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  UICachedDeviceRGBColor *v13;
  void *v14;
  UICachedDeviceRGBColor *v15;
  void *v16;
  UICachedDeviceRGBColor *v17;
  void *v18;
  UICachedDeviceRGBColor *v19;
  void *v20;
  UICachedDeviceRGBColor *v21;
  void *v22;
  void *v23;
  UIDynamicSystemColor *v24;
  _QWORD v25[10];
  _QWORD v26[12];

  v26[10] = *MEMORY[0x1E0C80C00];
  v24 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tertiarySystemGroupedBackgroundColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v22;
  v21 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.949019608, 0.949019608, 0.968627451, 1.0);
  v26[0] = v21;
  _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v20;
  v19 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.921568627, 0.921568627, 0.941176471, 1.0);
  v26[1] = v19;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v18;
  v17 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.17254902, 0.17254902, 0.180392157, 1.0);
  v26[2] = v17;
  _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v16;
  v15 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.211764706, 0.211764706, 0.219607843, 1.0);
  v26[3] = v15;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v14;
  v13 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.22745098, 0.22745098, 0.235294118, 1.0);
  v26[4] = v13;
  _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v12;
  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.266666667, 0.266666667, 0.274509804, 1.0);
  v26[5] = v0;
  _UIThemeKeyFromTraitValues(4, 2, 0, 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v1;
  v2 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 1.0);
  v26[6] = v2;
  _UIThemeKeyFromTraitValues(4, 2, 1, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v3;
  v4 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 1.0);
  v26[7] = v4;
  _UIThemeKeyFromTraitValues(4, 1, 0, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v5;
  v6 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 1.0);
  v26[8] = v6;
  _UIThemeKeyFromTraitValues(4, 1, 1, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[9] = v7;
  v8 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 1.0);
  v26[9] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v24, v23, v9);
  v11 = (void *)qword_1ECD7C158;
  qword_1ECD7C158 = (uint64_t)v10;

}

void __52__UIColor__InProgressSPI__quaternarySystemFillColor__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  UICachedDeviceRGBColor *v2;
  void *v3;
  UICachedDeviceRGBColor *v4;
  void *v5;
  UICachedDeviceWhiteColor *v6;
  void *v7;
  UICachedDeviceWhiteColor *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  UICachedDeviceWhiteColor *v13;
  void *v14;
  UICachedDeviceWhiteColor *v15;
  void *v16;
  UICachedDeviceWhiteColor *v17;
  void *v18;
  UICachedDeviceRGBColor *v19;
  void *v20;
  UICachedDeviceRGBColor *v21;
  void *v22;
  UICachedDeviceRGBColor *v23;
  void *v24;
  UICachedDeviceRGBColor *v25;
  void *v26;
  void *v27;
  UIDynamicSystemColor *v28;
  _QWORD v29[12];
  _QWORD v30[14];

  v30[12] = *MEMORY[0x1E0C80C00];
  v28 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "quaternarySystemFillColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v26;
  v25 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.454901961, 0.454901961, 0.501960784, 0.08);
  v30[0] = v25;
  _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v24;
  v23 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.454901961, 0.454901961, 0.501960784, 0.16);
  v30[1] = v23;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v22;
  v21 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.462745098, 0.462745098, 0.501960784, 0.18);
  v30[2] = v21;
  _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v20;
  v19 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.462745098, 0.462745098, 0.501960784, 0.26);
  v30[3] = v19;
  _UIThemeKeyFromTraitValues(2, 0, 0, 0, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v18;
  v17 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.08);
  v30[4] = v17;
  _UIThemeKeyFromTraitValues(2, 0, 1, 0, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v16;
  v15 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.08);
  v30[5] = v15;
  _UIThemeKeyFromTraitValues(2, 2, 0, 0, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[6] = v14;
  v13 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.08);
  v30[6] = v13;
  _UIThemeKeyFromTraitValues(2, 2, 1, 0, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[7] = v12;
  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.08);
  v30[7] = v0;
  _UIThemeKeyFromTraitValues(4, 2, 0, 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v29[8] = v1;
  v2 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.949019608, 0.956862745, 0.988235294, 0.1);
  v30[8] = v2;
  _UIThemeKeyFromTraitValues(4, 2, 1, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29[9] = v3;
  v4 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.949019608, 0.956862745, 0.988235294, 0.12);
  v30[9] = v4;
  _UIThemeKeyFromTraitValues(4, 1, 0, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[10] = v5;
  v6 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.05);
  v30[10] = v6;
  _UIThemeKeyFromTraitValues(4, 1, 1, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[11] = v7;
  v8 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.08);
  v30[11] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v28, v27, v9);
  v11 = (void *)qword_1ECD7C1B8;
  qword_1ECD7C1B8 = (uint64_t)v10;

}

void __40__UIColor_systemDarkExtraLightGrayColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemDarkExtraLightGrayColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.835294118, 0.835294118, 0.858823529, 1.0);
    v0 = (void *)qword_1ECD7BCD8;
    qword_1ECD7BCD8 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BCD8;
  qword_1ECD7BCD8 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BCD8, "_setSystemColorName:", v8);
}

void __38__UIColor_systemDarkLightMidGrayColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemDarkLightMidGrayColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.639215686, 0.639215686, 0.658823529, 1.0);
    v0 = (void *)qword_1ECD7BCF8;
    qword_1ECD7BCF8 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BCF8;
  qword_1ECD7BCF8 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BCF8, "_setSystemColorName:", v8);
}

void __37__UIColor_systemDarkMidGrayTintColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemDarkMidGrayTintColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0980392157, 0.46);
    v0 = (void *)qword_1ECD7BDD8;
    qword_1ECD7BDD8 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BDD8;
  qword_1ECD7BDD8 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BDD8, "_setSystemColorName:", v8);
}

void __36__UIColor_systemExtraLightGrayColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemExtraLightGrayColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.937254902, 0.937254902, 0.956862745, 1.0);
    v0 = (void *)qword_1ECD7BC18;
    qword_1ECD7BC18 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BC18;
  qword_1ECD7BC18 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BC18, "_setSystemColorName:", v8);
}

void __35__UIColor_systemDarkLightGrayColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemDarkLightGrayColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.737254902, 0.737254902, 0.760784314, 1.0);
    v0 = (void *)qword_1ECD7BCE8;
    qword_1ECD7BCE8 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BCE8;
  qword_1ECD7BCE8 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BCE8, "_setSystemColorName:", v8);
}

void __33__UIColor_systemMidGrayTintColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemMidGrayTintColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0980392157, 0.22);
    v0 = (void *)qword_1ECD7BD88;
    qword_1ECD7BD88 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BD88;
  qword_1ECD7BD88 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BD88, "_setSystemColorName:", v8);
}

void __33__UIColor_systemDarkMidGrayColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemDarkMidGrayColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.545098039, 0.545098039, 0.560784314, 1.0);
    v0 = (void *)qword_1ECD7BD08;
    qword_1ECD7BD08 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BD08;
  qword_1ECD7BD08 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BD08, "_setSystemColorName:", v8);
}

void __33__UIColor_externalSystemRedColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "externalSystemRedColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 1.0, 0.231372549, 0.188235294, 1.0);
    v0 = (void *)qword_1ECD7BD38;
    qword_1ECD7BD38 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BD38;
  qword_1ECD7BD38 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BD38, "_setSystemColorName:", v8);
}

void __31__UIColor_systemDarkGreenColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemDarkGreenColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.0, 0.490196078, 0.105882353, 1.0);
    v0 = (void *)qword_1ECD7BC68;
    qword_1ECD7BC68 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BC68;
  qword_1ECD7BC68 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BC68, "_setSystemColorName:", v8);
}

void __30__UIColor_systemDarkGrayColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemDarkGrayColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.388235294, 0.388235294, 0.4, 1.0);
    v0 = (void *)qword_1ECD7BD18;
    qword_1ECD7BD18 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BD18;
  qword_1ECD7BD18 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BD18, "_setSystemColorName:", v8);
}

void __30__UIColor_systemDarkBlueColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemDarkBlueColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.0, 0.250980392, 0.866666667, 1.0);
    v0 = (void *)qword_1ECD7BC78;
    qword_1ECD7BC78 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BC78;
  qword_1ECD7BC78 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BC78, "_setSystemColorName:", v8);
}

void __44__UIColor_systemDarkExtraLightGrayTintColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemDarkExtraLightGrayTintColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.00784313725, 0.00784313725, 0.121568627, 0.17);
    v0 = (void *)qword_1ECD7BDA8;
    qword_1ECD7BDA8 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BDA8;
  qword_1ECD7BDA8 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BDA8, "_setSystemColorName:", v8);
}

void __42__UIColor_systemDarkLightMidGrayTintColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemDarkLightMidGrayTintColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.0392156863, 0.0392156863, 0.160784314, 0.38);
    v0 = (void *)qword_1ECD7BDC8;
    qword_1ECD7BDC8 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BDC8;
  qword_1ECD7BDC8 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BDC8, "_setSystemColorName:", v8);
}

void __40__UIColor_systemExtraLightGrayTintColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemExtraLightGrayTintColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.0392156863, 0.0392156863, 0.470588235, 0.05);
    v0 = (void *)qword_1ECD7BD58;
    qword_1ECD7BD58 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BD58;
  qword_1ECD7BD58 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BD58, "_setSystemColorName:", v8);
}

void __39__UIColor_systemDarkLightGrayTintColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemDarkLightGrayTintColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.0352941176, 0.0352941176, 0.129411765, 0.27);
    v0 = (void *)qword_1ECD7BDB8;
    qword_1ECD7BDB8 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BDB8;
  qword_1ECD7BDB8 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BDB8, "_setSystemColorName:", v8);
}

void __38__UIColor_systemLightMidGrayTintColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemLightMidGrayTintColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.0980392157, 0.0980392157, 0.392156863, 0.18);
    v0 = (void *)qword_1ECD7BD78;
    qword_1ECD7BD78 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BD78;
  qword_1ECD7BD78 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BD78, "_setSystemColorName:", v8);
}

void __35__UIColor_systemLightGrayTintColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemLightGrayTintColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.0980392157, 0.0980392157, 0.392156863, 0.07);
    v0 = (void *)qword_1ECD7BD68;
    qword_1ECD7BD68 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BD68;
  qword_1ECD7BD68 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BD68, "_setSystemColorName:", v8);
}

void __35__UIColor_externalSystemGreenColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "externalSystemGreenColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.298039216, 0.850980392, 0.392156863, 1.0);
    v0 = (void *)qword_1ECD7BD48;
    qword_1ECD7BD48 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BD48;
  qword_1ECD7BD48 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BD48, "_setSystemColorName:", v8);
}

void __34__UIColor_systemDarkGrayTintColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemDarkGrayTintColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.0156862745, 0.0156862745, 0.0588235294, 0.62);
    v0 = (void *)qword_1ECD7BDE8;
    qword_1ECD7BDE8 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BDE8;
  qword_1ECD7BDE8 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BDE8, "_setSystemColorName:", v8);
}

void __34__UIColor_externalSystemTealColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "externalSystemTealColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.352941176, 0.784313725, 0.980392157, 1.0);
    v0 = (void *)qword_1ECD7BD28;
    qword_1ECD7BD28 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BD28;
  qword_1ECD7BD28 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BD28, "_setSystemColorName:", v8);
}

void __32__UIColor_systemDarkYellowColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemDarkYellowColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.576470588, 0.415686275, 0.211764706, 1.0);
    v0 = (void *)qword_1ECD7BC98;
    qword_1ECD7BC98 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BC98;
  qword_1ECD7BC98 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BC98, "_setSystemColorName:", v8);
}

void __32__UIColor_systemDarkPurpleColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemDarkPurpleColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.274509804, 0.266666667, 0.670588235, 1.0);
    v0 = (void *)qword_1ECD7BCC8;
    qword_1ECD7BCC8 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BCC8;
  qword_1ECD7BCC8 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BCC8, "_setSystemColorName:", v8);
}

void __32__UIColor_systemDarkOrangeColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemDarkOrangeColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.937254902, 0.337254902, 0.00784313725, 1.0);
    v0 = (void *)qword_1ECD7BC88;
    qword_1ECD7BC88 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BC88;
  qword_1ECD7BC88 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BC88, "_setSystemColorName:", v8);
}

void __30__UIColor_systemGrayTintColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemGrayTintColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.0156862745, 0.0156862745, 0.0588235294, 0.45);
    v0 = (void *)qword_1ECD7BD98;
    qword_1ECD7BD98 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BD98;
  qword_1ECD7BD98 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BD98, "_setSystemColorName:", v8);
}

void __30__UIColor_systemDarkTealColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemDarkTealColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.00392156863, 0.568627451, 0.823529412, 1.0);
    v0 = (void *)qword_1ECD7BCA8;
    qword_1ECD7BCA8 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BCA8;
  qword_1ECD7BCA8 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BCA8, "_setSystemColorName:", v8);
}

void __30__UIColor_systemDarkPinkColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemDarkPinkColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.854901961, 0.0588235294, 0.278431373, 1.0);
    v0 = (void *)qword_1ECD7BCB8;
    qword_1ECD7BCB8 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BCB8;
  qword_1ECD7BCB8 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BCB8, "_setSystemColorName:", v8);
}

void __29__UIColor_systemDarkRedColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  double *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemDarkRedColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    goto LABEL_7;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1 || !objc_msgSend(v1, "length") || (v3 = __colorValuesFromString(v2)) == 0)
  {

LABEL_7:
    v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.878431373, 0.0235294118, 0.105882353, 1.0);
    v0 = (void *)qword_1ECD7BC58;
    qword_1ECD7BC58 = (uint64_t)v7;
    goto LABEL_8;
  }
  v4 = (double *)v3;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", *v4, v4[1], v4[2], 1.0);
  v6 = (void *)qword_1ECD7BC58;
  qword_1ECD7BC58 = (uint64_t)v5;

  free(v4);
LABEL_8:

  objc_msgSend((id)qword_1ECD7BC58, "_setSystemColorName:", v8);
}

void __44__UIColor__UIInterfaceAPI__systemGray2Color__block_invoke()
{
  void *v0;
  void *v1;
  UICachedDeviceRGBColor *v2;
  void *v3;
  UICachedDeviceRGBColor *v4;
  void *v5;
  UICachedDeviceRGBColor *v6;
  void *v7;
  UICachedDeviceRGBColor *v8;
  void *v9;
  id v10;
  void *v11;
  UIDynamicSystemColor *v12;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v12 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemGray2Color");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v1;
  v2 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.682352941, 0.682352941, 0.698039216, 1.0);
  v14[0] = v2;
  _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  v4 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.556862745, 0.556862745, 0.576470588, 1.0);
  v14[1] = v4;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  v6 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.388235294, 0.388235294, 0.4, 1.0);
  v14[2] = v6;
  _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v7;
  v8 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.48627451, 0.48627451, 0.501960784, 1.0);
  v14[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v12, v0, v9);
  v11 = (void *)qword_1ECD7C088;
  qword_1ECD7C088 = (uint64_t)v10;

}

void __52__UIColor__InProgressSPI___textFieldBackgroundColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  void *v2;
  UICachedDeviceWhiteColor *v3;
  void *v4;
  UICachedDeviceWhiteColor *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_textFieldBackgroundColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v3 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 1.0);
  v10[0] = v3;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v5 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 1.0);
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  v8 = (void *)qword_1ECD7C2B8;
  qword_1ECD7C2B8 = (uint64_t)v7;

}

- (double)_colorDifferenceFromColor:(id)a3
{
  id v4;
  CGColor *v5;
  double v6;
  CGColor *v7;
  const CGFloat *Components;
  CGFloat Alpha;
  CGColorSpaceRef ColorSpace;
  CGColorSpaceRef v11;
  double v12;
  double v13;
  int v14;
  double v15;
  double v16;
  id v17;
  CGColor *v18;
  CGColor *v19;
  const CGFloat *v20;
  CGFloat v21;
  CGColorSpaceRef v22;
  CGColorSpaceRef v23;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[UIColor CGColor](objc_retainAutorelease(self), "CGColor");
  v6 = 0.0;
  if (!v5)
    goto LABEL_13;
  v7 = v5;
  Components = CGColorGetComponents(v5);
  Alpha = CGColorGetAlpha(v7);
  ColorSpace = CGColorGetColorSpace(v7);
  if (!Components)
    goto LABEL_13;
  v11 = ColorSpace;
  v25 = 0u;
  v26 = 0u;
  if (qword_1ECD7C4C0 != -1)
    dispatch_once(&qword_1ECD7C4C0, &__block_literal_global_1675);
  if ((CGColorSpaceRef)qword_1ECD7C4B8 == v11)
    goto LABEL_11;
  if (qword_1ECD7C500 != -1)
    dispatch_once(&qword_1ECD7C500, &__block_literal_global_1679);
  if ((CGColorSpaceRef)qword_1ECD7C4F8 == v11)
    goto LABEL_11;
  UISCreateCachedColorTransform();
  if (!CGColorTransformConvertColorComponents())
  {
    CGColorTransformRelease();
LABEL_13:
    v14 = 0;
    v12 = 0.0;
    v13 = 0.0;
    v15 = 0.0;
    v16 = 0.0;
    goto LABEL_14;
  }
  *((CGFloat *)&v26 + 1) = Alpha;
  CGColorTransformRelease();
  Components = (const CGFloat *)&v25;
LABEL_11:
  v12 = *Components;
  v13 = Components[1];
  v14 = 1;
  v15 = Components[2];
  v16 = Components[3];
LABEL_14:
  v17 = objc_retainAutorelease(v4);
  v18 = (CGColor *)objc_msgSend(v17, "CGColor");
  if (v18)
  {
    v19 = v18;
    v20 = CGColorGetComponents(v18);
    v21 = CGColorGetAlpha(v19);
    v22 = CGColorGetColorSpace(v19);
    if (v20)
    {
      v23 = v22;
      v25 = 0u;
      v26 = 0u;
      if (qword_1ECD7C4C0 != -1)
        dispatch_once(&qword_1ECD7C4C0, &__block_literal_global_1675);
      if ((CGColorSpaceRef)qword_1ECD7C4B8 != v23)
      {
        if (qword_1ECD7C500 != -1)
          dispatch_once(&qword_1ECD7C500, &__block_literal_global_1679);
        if ((CGColorSpaceRef)qword_1ECD7C4F8 != v23)
        {
          UISCreateCachedColorTransform();
          if (!CGColorTransformConvertColorComponents())
          {
            CGColorTransformRelease();
            goto LABEL_27;
          }
          *((CGFloat *)&v26 + 1) = v21;
          CGColorTransformRelease();
          v20 = (const CGFloat *)&v25;
        }
      }
      if (v14)
        v6 = vabdd_f64(v15 * v16, v20[2] * v20[3])
           + vabdd_f64(v12 * v16, *v20 * v20[3])
           + vabdd_f64(v13 * v16, v20[1] * v20[3]);
    }
  }
LABEL_27:

  return v6;
}

void __50__UIColor__InProgressSPI___controlForegroundColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  void *v2;
  UICachedDeviceWhiteColor *v3;
  void *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  UICachedDeviceRGBColor *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_controlForegroundColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v3 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 1.0);
  v12[0] = v3;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.921568627, 0.921568627, 0.960784314, 0.3);
  v12[1] = v5;
  _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  v7 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.921568627, 0.921568627, 0.960784314, 0.38);
  v12[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v8);
  v10 = (void *)qword_1ECD7C238;
  qword_1ECD7C238 = (uint64_t)v9;

}

void __24__UIColor_darkTextColor__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 1.0);
  v1 = (void *)qword_1ECD7BBB8;
  qword_1ECD7BBB8 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BBB8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "darkTextColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

void __24__UIColor_darkGrayColor__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.333333333, 1.0);
  v1 = (void *)qword_1ECD7B960;
  qword_1ECD7B960 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7B960;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "darkGrayColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (UIColor)darkTextColor
{
  if (qword_1ECD7BBC0 != -1)
    dispatch_once(&qword_1ECD7BBC0, &__block_literal_global_1045_0);
  return (UIColor *)(id)qword_1ECD7BBB8;
}

+ (UIColor)darkGrayColor
{
  if (qword_1ECD7B968 != -1)
    dispatch_once(&qword_1ECD7B968, &__block_literal_global_961);
  return (UIColor *)(id)qword_1ECD7B960;
}

- (NSString)accessibilityName
{
  return AXNameFromColor(-[UIColor CGColor](self, "CGColor"));
}

- (NSString)_accessibilityNameWithLuma
{
  uint64_t (*v3)(UIColor *, uint64_t);
  NSString *result;
  void *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v3 = (uint64_t (*)(UIColor *, uint64_t))off_1ECD7C878;
  v10 = off_1ECD7C878;
  if (!off_1ECD7C878)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __getAXColorStringForColorSymbolLoc_block_invoke;
    v6[3] = &unk_1E16B14C0;
    v6[4] = &v7;
    __getAXColorStringForColorSymbolLoc_block_invoke(v6);
    v3 = (uint64_t (*)(UIColor *, uint64_t))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (v3)
    return (NSString *)v3(self, 1);
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  result = (NSString *)objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *_AXColorStringForColor(UIColor *, NSUInteger)"), CFSTR("UIAccessibility.m"), 64, CFSTR("%s"), dlerror());
  __break(1u);
  return result;
}

- (id)_inverseColor
{
  _BOOL4 v2;
  void *v3;
  double v5;
  double v6;
  double v7;

  v7 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v2 = -[UIColor getRed:green:blue:alpha:](self, "getRed:green:blue:alpha:", &v7, &v6, &v5, 0);
  v3 = 0;
  if (v2)
  {
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0 - v7, 1.0 - v6, 1.0 - v5, 1.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (double)_distanceFrom:(id)a3
{
  id v4;
  _BOOL4 v5;
  int v6;
  double result;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v12 = 0.0;
  v13 = 0.0;
  v10 = 0.0;
  v11 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  v4 = a3;
  v5 = -[UIColor getRed:green:blue:alpha:](self, "getRed:green:blue:alpha:", &v13, &v12, &v11, 0);
  v6 = objc_msgSend(v4, "getRed:green:blue:alpha:", &v10, &v9, &v8, 0);

  result = 1.79769313e308;
  if (v5)
  {
    if (v6)
      return sqrt((v10 - v13) * (v10 - v13) + (v9 - v12) * (v9 - v12) + (v8 - v11) * (v8 - v11));
  }
  return result;
}

+ (id)_disambiguated_due_to_CIImage_colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", a3, a4, a5, a6);
}

+ (UIColor)colorWithCIColor:(CIColor *)ciColor
{
  CIColor *v3;
  void *v4;

  v3 = ciColor;
  v4 = (void *)objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithCIColor:", v3);

  return (UIColor *)v4;
}

+ (UIColor)colorWithDisplayP3Red:(CGFloat)displayP3Red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
  return (UIColor *)(id)objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithDisplayP3Red:green:blue:alpha:", displayP3Red, green, blue, alpha);
}

+ (id)_composedColorFromSourceColor:(void *)a3 destinationColor:(void *)a4 tintColor:(void *)a5 alpha:
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v16;
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
  double v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_self();
  if (!v9)
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v26 = 0.0;
  v27 = 0.0;
  v24 = 0.0;
  v25 = 0.0;
  v22 = 0.0;
  v23 = 0.0;
  v20 = 0.0;
  v21 = 0.0;
  objc_msgSend(v8, "getRed:green:blue:alpha:", &v27, &v26, &v25, &v24);
  objc_msgSend(v9, "getRed:green:blue:alpha:", &v23, &v22, &v21, &v20);
  v11 = v27 * v20 + v23 * (1.0 - v24);
  v12 = v20 * v26 + (1.0 - v24) * v22;
  v13 = v20 * v25 + (1.0 - v24) * v21;
  if (v10)
  {
    v18 = 0.0;
    v19 = 0.0;
    v16 = 0.0;
    v17 = 0.0;
    objc_msgSend(v10, "getRed:green:blue:alpha:", &v19, &v18, &v17, &v16);
    v11 = v19 + v11 * (1.0 - v16);
    v12 = v18 + v12 * (1.0 - v16);
    v13 = v17 + v13 * (1.0 - v16);
  }
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v11, v12, v13, a1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_accessibilityDarkenedColorForColor:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  UIColor *v12;
  UIColor *v13;
  id v14;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v3 = a3;
  if (!objc_msgSend(v3, "_isDynamic"))
  {
    v5 = v3;
    objc_opt_self();
    objc_msgSend(v5, "_systemColorName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6
      && (unint64_t)objc_msgSend(v6, "length") >= 8
      && objc_msgSend(v6, "hasPrefix:", CFSTR("system")))
    {
      objc_msgSend(v6, "substringFromIndex:", 6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("systemDark"), "stringByAppendingString:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = _selectorForColorName(v8);
      if (v9)
      {
        +[UIColor performSelector:](UIColor, "performSelector:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }

      if (v10)
      {
        v14 = v10;
        v4 = v14;
        goto LABEL_15;
      }
    }
    else
    {

    }
    v21 = 0.0;
    v22 = 0.0;
    v19 = 0.0;
    v20 = 0.0;
    objc_msgSend(v5, "getRed:green:blue:alpha:", &v22, &v21, &v20, &v19);
    if (fabs(v22 + -1.0) <= 0.001)
    {
      v11 = v20;
      if (fabs(v21 + -1.0) <= 0.001 && fabs(v20 + -1.0) <= 0.001)
      {
        v13 = (UIColor *)v5;
        goto LABEL_14;
      }
    }
    else
    {
      v11 = v20;
    }
    v17 = 0.0;
    v18 = 0.0;
    v16 = 0.0;
    _NXRGBToHSB(&v18, &v17, &v16, v22, v21, v11);
    v12 = [UIColor alloc];
    v13 = -[UIColor initWithHue:saturation:brightness:alpha:](v12, "initWithHue:saturation:brightness:alpha:", v18, v17, v16 * 0.8, v19);
LABEL_14:
    v4 = v13;
    v14 = 0;
LABEL_15:

    goto LABEL_16;
  }
  objc_msgSend(v3, "_highContrastDynamicColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v4;
}

+ (id)_accessibilityLightenedColorForColor:(id)a3
{
  id v3;
  UIColor *v4;
  double v5;
  double v6;
  double v7;
  UIColor *v8;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v3 = a3;
  if (objc_msgSend(v3, "_isDynamic"))
  {
    objc_msgSend(v3, "_highContrastDynamicColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0.0;
    v14 = 0.0;
    v15 = 0.0;
    v13 = 0.0;
    objc_msgSend(v3, "getRed:green:blue:alpha:", &v16, &v15, &v14, &v13);

    v11 = 0.0;
    v12 = 0.0;
    v10 = 0.0;
    _NXRGBToHSB(&v12, &v11, &v10, v16, v15, v14);
    if (v10 == 0.0)
    {
      v5 = 1.25;
    }
    else
    {
      v5 = fmax(1.0 / v10, 1.0);
      if (v5 > 1.25)
        v5 = 1.25;
    }
    v6 = v10 * v5;
    v7 = v11 * (v5 + -1.25 + 1.0);
    v8 = [UIColor alloc];
    v4 = -[UIColor initWithHue:saturation:brightness:alpha:](v8, "initWithHue:saturation:brightness:alpha:", v12, v7, v6, v13);
  }
  return v4;
}

+ (id)_dynamicCatalogColorForNibEncodingWithName:(id)a3 genericColor:(id)a4
{
  id v6;
  id v7;
  UIDynamicCatalogColor *v8;
  id v9;
  id v10;
  void *v11;
  id *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v6 = a4;
  v7 = a3;
  v8 = [UIDynamicCatalogColor alloc];
  v9 = v7;
  v10 = v6;
  v11 = v10;
  if (!v8)
    goto LABEL_6;
  if (v9)
  {
    if (v10)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel__initForNibEncodingWithName_genericColor_, v8, CFSTR("UIColor.m"), 4786, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name != nil"));

    if (v11)
      goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel__initForNibEncodingWithName_genericColor_, v8, CFSTR("UIColor.m"), 4787, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("genericColor != nil"));

LABEL_4:
  v16.receiver = v8;
  v16.super_class = (Class)UIDynamicCatalogColor;
  v12 = objc_msgSendSuper2(&v16, sel_init);
  v8 = (UIDynamicCatalogColor *)v12;
  if (v12)
  {
    objc_storeStrong(v12 + 3, a3);
    objc_storeStrong((id *)&v8->_genericColor, a4);
  }
LABEL_6:

  return v8;
}

- (UIColor)initWithCIColor:(CIColor *)ciColor
{
  CIColor *v4;
  UIColor *v5;

  v4 = ciColor;

  v5 = (UIColor *)objc_msgSend(objc_allocWithZone((Class)UICIColor), "initWithCIColor:", v4);
  return v5;
}

- (UIColor)initWithDisplayP3Red:(CGFloat)displayP3Red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{

  return (UIColor *)objc_msgSend(objc_allocWithZone((Class)UIDisplayP3Color), "initWithDisplayP3Red:green:blue:alpha:", displayP3Red, green, blue, alpha);
}

+ (UIColor)cyanColor
{
  if (qword_1ECD7B9E8 != -1)
    dispatch_once(&qword_1ECD7B9E8, &__block_literal_global_978);
  return (UIColor *)(id)qword_1ECD7B9E0;
}

void __20__UIColor_cyanColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.0, 1.0, 1.0, 1.0);
  v1 = (void *)qword_1ECD7B9E0;
  qword_1ECD7B9E0 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7B9E0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "cyanColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (UIColor)yellowColor
{
  if (qword_1ECD7B9F8 != -1)
    dispatch_once(&qword_1ECD7B9F8, &__block_literal_global_980_0);
  return (UIColor *)(id)qword_1ECD7B9F0;
}

void __22__UIColor_yellowColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 1.0, 1.0, 0.0, 1.0);
  v1 = (void *)qword_1ECD7B9F0;
  qword_1ECD7B9F0 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7B9F0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "yellowColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (UIColor)magentaColor
{
  if (qword_1ECD7BA08 != -1)
    dispatch_once(&qword_1ECD7BA08, &__block_literal_global_982);
  return (UIColor *)(id)qword_1ECD7BA00;
}

void __23__UIColor_magentaColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 1.0, 0.0, 1.0, 1.0);
  v1 = (void *)qword_1ECD7BA00;
  qword_1ECD7BA00 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BA00;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "magentaColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (UIColor)orangeColor
{
  if (qword_1ECD7BA18 != -1)
    dispatch_once(&qword_1ECD7BA18, &__block_literal_global_984);
  return (UIColor *)(id)qword_1ECD7BA10;
}

void __22__UIColor_orangeColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 1.0, 0.5, 0.0, 1.0);
  v1 = (void *)qword_1ECD7BA10;
  qword_1ECD7BA10 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BA10;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "orangeColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (UIColor)purpleColor
{
  if (qword_1ECD7BA28 != -1)
    dispatch_once(&qword_1ECD7BA28, &__block_literal_global_986);
  return (UIColor *)(id)qword_1ECD7BA20;
}

void __22__UIColor_purpleColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.5, 0.0, 0.5, 1.0);
  v1 = (void *)qword_1ECD7BA20;
  qword_1ECD7BA20 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BA20;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "purpleColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (UIColor)brownColor
{
  if (qword_1ECD7BA38 != -1)
    dispatch_once(&qword_1ECD7BA38, &__block_literal_global_988);
  return (UIColor *)(id)qword_1ECD7BA30;
}

void __21__UIColor_brownColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.6, 0.4, 0.2, 1.0);
  v1 = (void *)qword_1ECD7BA30;
  qword_1ECD7BA30 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BA30;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "brownColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)tableCellGroupedBackgroundColorLegacyWhite
{
  if (qword_1ECD7BA48 != -1)
    dispatch_once(&qword_1ECD7BA48, &__block_literal_global_990);
  return (id)qword_1ECD7BA40;
}

void __53__UIColor_tableCellGroupedBackgroundColorLegacyWhite__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
  v1 = (void *)qword_1ECD7BA40;
  qword_1ECD7BA40 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BA40;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tableCellGroupedBackgroundColorLegacyWhite");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)tableCellBackgroundColor
{
  if (qword_1ECD7BA58 != -1)
    dispatch_once(&qword_1ECD7BA58, &__block_literal_global_992);
  return (id)qword_1ECD7BA50;
}

void __35__UIColor_tableCellBackgroundColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
  v1 = (void *)qword_1ECD7BA50;
  qword_1ECD7BA50 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BA50;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tableCellBackgroundColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)tableCellbackgroundColorCarPlay
{
  if (qword_1ECD7BA68 != -1)
    dispatch_once(&qword_1ECD7BA68, &__block_literal_global_994);
  return (id)qword_1ECD7BA60;
}

void __42__UIColor_tableCellbackgroundColorCarPlay__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
  v1 = (void *)qword_1ECD7BA60;
  qword_1ECD7BA60 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BA60;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tableCellbackgroundColorCarPlay");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)tableSelectionGradientStartColor
{
  if (qword_1ECD7BA78 != -1)
    dispatch_once(&qword_1ECD7BA78, &__block_literal_global_996);
  return (id)qword_1ECD7BA70;
}

void __43__UIColor_tableSelectionGradientStartColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.02, 0.55, 0.96, 1.0);
  v1 = (void *)qword_1ECD7BA70;
  qword_1ECD7BA70 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BA70;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tableSelectionGradientStartColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)tableSelectionGradientEndColor
{
  if (qword_1ECD7BA88 != -1)
    dispatch_once(&qword_1ECD7BA88, &__block_literal_global_998);
  return (id)qword_1ECD7BA80;
}

void __41__UIColor_tableSelectionGradientEndColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.04, 0.37, 0.91, 1.0);
  v1 = (void *)qword_1ECD7BA80;
  qword_1ECD7BA80 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BA80;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tableSelectionGradientEndColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)tableShadowColor
{
  if (qword_1ECD7BA98 != -1)
    dispatch_once(&qword_1ECD7BA98, &__block_literal_global_1000);
  return (id)qword_1ECD7BA90;
}

void __27__UIColor_tableShadowColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.91);
  v1 = (void *)qword_1ECD7BA90;
  qword_1ECD7BA90 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BA90;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tableShadowColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)tableGroupedTopShadowColor
{
  if (qword_1ECD7BAA8 != -1)
    dispatch_once(&qword_1ECD7BAA8, &__block_literal_global_1002);
  return (id)qword_1ECD7BAA0;
}

void __37__UIColor_tableGroupedTopShadowColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.08);
  v1 = (void *)qword_1ECD7BAA0;
  qword_1ECD7BAA0 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BAA0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tableGroupedTopShadowColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)sectionListBorderColor
{
  if (qword_1ECD7BAB8 != -1)
    dispatch_once(&qword_1ECD7BAB8, &__block_literal_global_1004);
  return (id)qword_1ECD7BAB0;
}

void __33__UIColor_sectionListBorderColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.52, 0.56, 0.58, 0.8);
  v1 = (void *)qword_1ECD7BAB0;
  qword_1ECD7BAB0 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BAB0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "sectionListBorderColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)sectionHeaderBackgroundColor
{
  if (qword_1ECD7BAC8 != -1)
    dispatch_once(&qword_1ECD7BAC8, &__block_literal_global_1006);
  return (id)qword_1ECD7BAC0;
}

void __39__UIColor_sectionHeaderBackgroundColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.9, 0.93, 0.99, 0.8);
  v1 = (void *)qword_1ECD7BAC0;
  qword_1ECD7BAC0 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BAC0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "sectionHeaderBackgroundColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)sectionHeaderOpaqueBackgroundColor
{
  if (qword_1ECD7BAD8 != -1)
    dispatch_once(&qword_1ECD7BAD8, &__block_literal_global_1008);
  return (id)qword_1ECD7BAD0;
}

void __45__UIColor_sectionHeaderOpaqueBackgroundColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.92, 0.94, 0.99, 1.0);
  v1 = (void *)qword_1ECD7BAD0;
  qword_1ECD7BAD0 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BAD0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "sectionHeaderOpaqueBackgroundColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)sectionHeaderBorderColor
{
  if (qword_1ECD7BAE8 != -1)
    dispatch_once(&qword_1ECD7BAE8, &__block_literal_global_1010);
  return (id)qword_1ECD7BAE0;
}

void __35__UIColor_sectionHeaderBorderColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.85, 0.87, 0.91, 1.0);
  v1 = (void *)qword_1ECD7BAE0;
  qword_1ECD7BAE0 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BAE0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "sectionHeaderBorderColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)tableCellValue1BlueColor
{
  if (qword_1ECD7BAF8 != -1)
    dispatch_once(&qword_1ECD7BAF8, &__block_literal_global_1012_0);
  return (id)qword_1ECD7BAF0;
}

void __35__UIColor_tableCellValue1BlueColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.22, 0.33, 0.53, 1.0);
  v1 = (void *)qword_1ECD7BAF0;
  qword_1ECD7BAF0 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BAF0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tableCellValue1BlueColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)tableCellValue2BlueColor
{
  if (qword_1ECD7BB08 != -1)
    dispatch_once(&qword_1ECD7BB08, &__block_literal_global_1014);
  return (id)qword_1ECD7BB00;
}

void __35__UIColor_tableCellValue2BlueColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.32, 0.4, 0.57, 1.0);
  v1 = (void *)qword_1ECD7BB00;
  qword_1ECD7BB00 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BB00;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tableCellValue2BlueColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)tableCellGrayTextColor
{
  if (qword_1ECD7BB18 != -1)
    dispatch_once(&qword_1ECD7BB18, &__block_literal_global_1016);
  return (id)qword_1ECD7BB10;
}

void __33__UIColor_tableCellGrayTextColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.5, 0.5, 0.5, 1.0);
  v1 = (void *)qword_1ECD7BB10;
  qword_1ECD7BB10 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BB10;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tableCellGrayTextColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)textFieldAtomPurpleColor
{
  if (qword_1ECD7BB28 != -1)
    dispatch_once(&qword_1ECD7BB28, &__block_literal_global_1018);
  return (id)qword_1ECD7BB20;
}

void __35__UIColor_textFieldAtomPurpleColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.41, 0.0, 0.74, 1.0);
  v1 = (void *)qword_1ECD7BB20;
  qword_1ECD7BB20 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BB20;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "textFieldAtomPurpleColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)infoTextOverPinStripeTextColor
{
  if (qword_1ECD7BB38 != -1)
    dispatch_once(&qword_1ECD7BB38, &__block_literal_global_1020);
  return (id)qword_1ECD7BB30;
}

void __41__UIColor_infoTextOverPinStripeTextColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.3, 0.34, 0.42, 1.0);
  v1 = (void *)qword_1ECD7BB30;
  qword_1ECD7BB30 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BB30;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "infoTextOverPinStripeTextColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)textFieldAtomBlueColor
{
  return +[UIColor systemBlueColor](UIColor, "systemBlueColor");
}

- (UIColor)colorWithAlphaComponent:(CGFloat)alpha
{
  return 0;
}

- (CGColorRef)CGColor
{
  raiseWithColorSpaceError(self, a2);
  return 0;
}

- (CIColor)CIColor
{
  raiseWithColorSpaceError(self, a2);
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  raiseWithColorSpaceError(self, a2);
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  raiseWithColorSpaceError(self, a2);
  return 0;
}

- (unint64_t)hash
{
  raiseWithColorSpaceError(self, a2);
  return 0;
}

- (BOOL)getWhite:(CGFloat *)white alpha:(CGFloat *)alpha
{
  return 0;
}

- (BOOL)getHue:(CGFloat *)hue saturation:(CGFloat *)saturation brightness:(CGFloat *)brightness alpha:(CGFloat *)alpha
{
  return 0;
}

- (BOOL)getRed:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue alpha:(CGFloat *)alpha
{
  return 0;
}

- (id)colorSpaceName
{
  return CFSTR("UIUnknownColorSpace");
}

- (double)alphaComponent
{
  return 0.0;
}

- (BOOL)isPatternColor
{
  return 0;
}

- (BOOL)_isDeepColor
{
  return 0;
}

- (BOOL)_isOpaque
{
  double v3;

  v3 = 0.0;
  -[UIColor getRed:green:blue:alpha:](self, "getRed:green:blue:alpha:", 0, 0, 0, &v3);
  return v3 == 1.0;
}

- (id)_debugName
{
  void *v3;

  -[UIColor _systemColorName](self, "_systemColorName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_getAssociatedObject(self, &_debugName_key);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_setDebugName:(id)a3
{
  objc_setAssociatedObject(self, &_debugName_key, a3, (void *)3);
}

- (id)_debugCatalogBundleIdentifier
{
  return objc_getAssociatedObject(self, &_debugCatalogBundleIdentifier_key);
}

- (void)_setDebugCatalogBundleIdentifier:(id)a3
{
  objc_setAssociatedObject(self, &_debugCatalogBundleIdentifier_key, a3, (void *)3);
}

- (double)_luminanceDifferenceFromColor:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  -[UIColor _luminance](self, "_luminance");
  v6 = v5;
  objc_msgSend(v4, "_luminance");
  v8 = v7;

  return vabdd_f64(v6, v8);
}

- (id)_colorBlendedWithColors:(id)a3
{
  id v4;
  UIColor *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  UIColor *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      v10 = v5;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        -[UIColor _colorBlendedWithColor:](v10, "_colorBlendedWithColor:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        v5 = (UIColor *)objc_claimAutoreleasedReturnValue();

        ++v9;
        v10 = v5;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v5;
}

+ (id)pinStripeColor
{
  if (qword_1ECD7BB70 != -1)
    dispatch_once(&qword_1ECD7BB70, &__block_literal_global_1032);
  return (id)qword_1ECD7BB68;
}

void __25__UIColor_pinStripeColor__block_invoke()
{
  UICachedPatternCGColor *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  _UIImageWithName(CFSTR("UIPinstripe.png"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[UIColor initWithPatternImage:]([UICachedPatternCGColor alloc], "initWithPatternImage:", v4);
  v1 = (void *)qword_1ECD7BB68;
  qword_1ECD7BB68 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BB68;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "pinStripeColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (UIColor)lightTextColor
{
  if (qword_1ECD7BBB0 != -1)
    dispatch_once(&qword_1ECD7BBB0, &__block_literal_global_1043);
  return (UIColor *)(id)qword_1ECD7BBA8;
}

void __25__UIColor_lightTextColor__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.6);
  v1 = (void *)qword_1ECD7BBA8;
  qword_1ECD7BBA8 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BBA8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "lightTextColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)keyboardFocusIndicatorColor
{
  objc_opt_self();
  return +[UIColor _appKeyColorOrDefaultTint]();
}

+ (id)tableGroupedSeparatorLightColor
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)tableGroupedSeparatorLightColor_tableGroupedSeparatorLightColor;
  if (!tableGroupedSeparatorLightColor_tableGroupedSeparatorLightColor)
  {
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.783921569, 0.780392157, 0.8, 1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor _systemColorForColor:withName:]((uint64_t)a1, v4, CFSTR("tableGroupedSeparatorLightColor"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)tableGroupedSeparatorLightColor_tableGroupedSeparatorLightColor;
    tableGroupedSeparatorLightColor_tableGroupedSeparatorLightColor = v5;

    v3 = (void *)tableGroupedSeparatorLightColor_tableGroupedSeparatorLightColor;
  }
  return v3;
}

+ (UIColor)viewFlipsideBackgroundColor
{
  if (qword_1ECD7BBE0 != -1)
    dispatch_once(&qword_1ECD7BBE0, &__block_literal_global_1048);
  return (UIColor *)(id)qword_1ECD7BBD8;
}

void __38__UIColor_viewFlipsideBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  if (!qword_1ECD7BBD8)
  {
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.121568627, 0.129411765, 0.141176471, 1.0);
    v0 = objc_claimAutoreleasedReturnValue();
    v1 = (void *)qword_1ECD7BBD8;
    qword_1ECD7BBD8 = v0;

    objc_msgSend((id)qword_1ECD7BBD8, "_setSystemColorName:", CFSTR("viewFlipsideBackgroundColor"));
  }
}

+ (UIColor)underPageBackgroundColor
{
  if (qword_1ECD7BBF0 != -1)
    dispatch_once(&qword_1ECD7BBF0, &__block_literal_global_1049);
  return (UIColor *)(id)qword_1ECD7BBE8;
}

void __35__UIColor_underPageBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  if (!qword_1ECD7BBE8)
  {
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.709803922, 0.717647059, 0.741176471, 1.0);
    v0 = objc_claimAutoreleasedReturnValue();
    v1 = (void *)qword_1ECD7BBE8;
    qword_1ECD7BBE8 = v0;

    objc_msgSend((id)qword_1ECD7BBE8, "_setSystemColorName:", CFSTR("underPageBackgroundColor"));
  }
}

+ (UIColor)scrollViewTexturedBackgroundColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)scrollViewTexturedBackgroundColor_scrollViewTexturedBackgroundColor;
  if (!scrollViewTexturedBackgroundColor_scrollViewTexturedBackgroundColor)
  {
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.435294118, 0.443137255, 0.474509804, 1.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)scrollViewTexturedBackgroundColor_scrollViewTexturedBackgroundColor;
    scrollViewTexturedBackgroundColor_scrollViewTexturedBackgroundColor = v3;

    objc_msgSend((id)scrollViewTexturedBackgroundColor_scrollViewTexturedBackgroundColor, "_setSystemColorName:", CFSTR("scrollViewTexturedBackgroundColor"));
    v2 = (void *)scrollViewTexturedBackgroundColor_scrollViewTexturedBackgroundColor;
  }
  return (UIColor *)v2;
}

+ (id)_systemInteractionTintColor
{
  if (qword_1ECD7BE00 != -1)
    dispatch_once(&qword_1ECD7BE00, &__block_literal_global_1114);
  return (id)qword_1ECD7BDF8;
}

void __38__UIColor__systemInteractionTintColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.0, 0.478431373, 1.0, 1.0);
  v1 = (void *)qword_1ECD7BDF8;
  qword_1ECD7BDF8 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BDF8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_systemInteractionTintColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)_systemDestructiveTintColor
{
  if (qword_1ECD7BE10 != -1)
    dispatch_once(&qword_1ECD7BE10, &__block_literal_global_1116);
  return (id)qword_1ECD7BE08;
}

void __38__UIColor__systemDestructiveTintColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 1.0, 0.231372549, 0.188235294, 1.0);
  v1 = (void *)qword_1ECD7BE08;
  qword_1ECD7BE08 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BE08;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_systemDestructiveTintColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)_systemMidGrayTintColor
{
  if (qword_1ECD7BE40 != -1)
    dispatch_once(&qword_1ECD7BE40, &__block_literal_global_1122);
  return (id)qword_1ECD7BE38;
}

void __34__UIColor__systemMidGrayTintColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0980392157, 0.22);
  v1 = (void *)qword_1ECD7BE38;
  qword_1ECD7BE38 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BE38;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_systemMidGrayTintColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)_externalSystemWhiteColor
{
  if (qword_1ECD7BE50 != -1)
    dispatch_once(&qword_1ECD7BE50, &__block_literal_global_1124);
  return (id)qword_1ECD7BE48;
}

void __36__UIColor__externalSystemWhiteColor__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 1.0);
  v1 = (void *)qword_1ECD7BE48;
  qword_1ECD7BE48 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BE48;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_externalSystemWhiteColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)_externalSystemMidGrayColor
{
  if (qword_1ECD7BE60 != -1)
    dispatch_once(&qword_1ECD7BE60, &__block_literal_global_1126);
  return (id)qword_1ECD7BE58;
}

void __38__UIColor__externalSystemMidGrayColor__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.780392157, 1.0);
  v1 = (void *)qword_1ECD7BE58;
  qword_1ECD7BE58 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BE58;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_externalSystemMidGrayColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)_externalSystemGrayColor
{
  if (qword_1ECD7BE70 != -1)
    dispatch_once(&qword_1ECD7BE70, &__block_literal_global_1128);
  return (id)qword_1ECD7BE68;
}

void __35__UIColor__externalSystemGrayColor__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.4, 1.0);
  v1 = (void *)qword_1ECD7BE68;
  qword_1ECD7BE68 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BE68;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_externalSystemGrayColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)_externalSystemDarkGrayColor
{
  if (qword_1ECD7BE80 != -1)
    dispatch_once(&qword_1ECD7BE80, &__block_literal_global_1130);
  return (id)qword_1ECD7BE78;
}

void __39__UIColor__externalSystemDarkGrayColor__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.250980392, 1.0);
  v1 = (void *)qword_1ECD7BE78;
  qword_1ECD7BE78 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BE78;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_externalSystemDarkGrayColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)_externalSystemExtraDarkGrayColor
{
  if (qword_1ECD7BE90 != -1)
    dispatch_once(&qword_1ECD7BE90, &__block_literal_global_1132);
  return (id)qword_1ECD7BE88;
}

void __44__UIColor__externalSystemExtraDarkGrayColor__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.2, 1.0);
  v1 = (void *)qword_1ECD7BE88;
  qword_1ECD7BE88 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BE88;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_externalSystemExtraDarkGrayColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)_externalSystemSuperDarkGrayColor
{
  if (qword_1ECD7BEA0 != -1)
    dispatch_once(&qword_1ECD7BEA0, &__block_literal_global_1134);
  return (id)qword_1ECD7BE98;
}

void __44__UIColor__externalSystemSuperDarkGrayColor__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.137254902, 1.0);
  v1 = (void *)qword_1ECD7BE98;
  qword_1ECD7BE98 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BE98;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_externalSystemSuperDarkGrayColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)_accessibilityButtonShapesBackgroundColorOnLight
{
  if (qword_1ECD7BEB0 != -1)
    dispatch_once(&qword_1ECD7BEB0, &__block_literal_global_1136);
  return (id)qword_1ECD7BEA8;
}

void __59__UIColor__accessibilityButtonShapesBackgroundColorOnLight__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.2, 0.95);
  v1 = (void *)qword_1ECD7BEA8;
  qword_1ECD7BEA8 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BEA8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_accessibilityButtonShapesBackgroundColorOnLight");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)_accessibilityButtonShapesBackgroundColorOnDark
{
  if (qword_1ECD7BEC0 != -1)
    dispatch_once(&qword_1ECD7BEC0, &__block_literal_global_1138);
  return (id)qword_1ECD7BEB8;
}

void __58__UIColor__accessibilityButtonShapesBackgroundColorOnDark__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.6, 0.95);
  v1 = (void *)qword_1ECD7BEB8;
  qword_1ECD7BEB8 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BEB8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_accessibilityButtonShapesBackgroundColorOnDark");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)_accessibilityButtonShapesDisabledBackgroundColorOnDark
{
  if (qword_1ECD7BED0 != -1)
    dispatch_once(&qword_1ECD7BED0, &__block_literal_global_1140);
  return (id)qword_1ECD7BEC8;
}

void __66__UIColor__accessibilityButtonShapesDisabledBackgroundColorOnDark__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.5, 0.95);
  v1 = (void *)qword_1ECD7BEC8;
  qword_1ECD7BEC8 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BEC8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_accessibilityButtonShapesDisabledBackgroundColorOnDark");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)_accessibilityButtonShapesNoBlendModeBackgroundColorOnLight
{
  if (qword_1ECD7BEE0 != -1)
    dispatch_once(&qword_1ECD7BEE0, &__block_literal_global_1142);
  return (id)qword_1ECD7BED8;
}

void __70__UIColor__accessibilityButtonShapesNoBlendModeBackgroundColorOnLight__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.1);
  v1 = (void *)qword_1ECD7BED8;
  qword_1ECD7BED8 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BED8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_accessibilityButtonShapesNoBlendModeBackgroundColorOnLight");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)_accessibilityButtonShapesNoBlendModeBackgroundColorOnDark
{
  if (qword_1ECD7BEF0 != -1)
    dispatch_once(&qword_1ECD7BEF0, &__block_literal_global_1144);
  return (id)qword_1ECD7BEE8;
}

void __69__UIColor__accessibilityButtonShapesNoBlendModeBackgroundColorOnDark__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.25);
  v1 = (void *)qword_1ECD7BEE8;
  qword_1ECD7BEE8 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BEE8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_accessibilityButtonShapesNoBlendModeBackgroundColorOnDark");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)noContentLightGradientBackgroundColor
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)noContentLightGradientBackgroundColor_noContentLightGradientBackgroundColor;
  if (!noContentLightGradientBackgroundColor_noContentLightGradientBackgroundColor)
  {
    _UIImageWithName(CFSTR("UIStockImageNoContentLightGradientBackgroundColor.png"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor colorWithPatternImage:](UIColor, "colorWithPatternImage:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)noContentLightGradientBackgroundColor_noContentLightGradientBackgroundColor;
    noContentLightGradientBackgroundColor_noContentLightGradientBackgroundColor = v4;

    objc_msgSend((id)noContentLightGradientBackgroundColor_noContentLightGradientBackgroundColor, "_setSystemColorName:", CFSTR("noContentLightGradientBackgroundColor"));
    v2 = (void *)noContentLightGradientBackgroundColor_noContentLightGradientBackgroundColor;
  }
  return v2;
}

+ (id)noContentDarkGradientBackgroundColor
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v2 = (void *)noContentDarkGradientBackgroundColor_noContentDarkGradientBackgroundColor;
  if (!noContentDarkGradientBackgroundColor_noContentDarkGradientBackgroundColor)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    v5 = v4;
    v6 = -[UIGradient initVerticalWithValues:]([UIGradient alloc], "initVerticalWithValues:", &__kNoContentDarkBackgroundGradientValues);
    _UIGraphicsBeginImageContextWithOptions(1, 0, 20.0, 1024.0, v5);
    objc_msgSend(v6, "fillRect:", 0.0, 0.0, 20.0, 1024.0);
    _UIGraphicsGetImageFromCurrentImageContext(0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIColor colorWithPatternImage:](UIColor, "colorWithPatternImage:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)noContentDarkGradientBackgroundColor_noContentDarkGradientBackgroundColor;
    noContentDarkGradientBackgroundColor_noContentDarkGradientBackgroundColor = v8;

    objc_msgSend((id)noContentDarkGradientBackgroundColor_noContentDarkGradientBackgroundColor, "_setSystemColorName:", CFSTR("noContentDarkGradientBackgroundColor"));
    v2 = (void *)noContentDarkGradientBackgroundColor_noContentDarkGradientBackgroundColor;
  }
  return v2;
}

+ (id)_translucentPaperTextureColor
{
  if (qword_1ECD7BF00 != -1)
    dispatch_once(&qword_1ECD7BF00, &__block_literal_global_1149);
  return (id)qword_1ECD7BEF8;
}

void __40__UIColor__translucentPaperTextureColor__block_invoke()
{
  UICachedPatternCGColor *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  _UIImageWithName(CFSTR("UIStockImagePaperTexture.png"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[UIColor initWithPatternImage:]([UICachedPatternCGColor alloc], "initWithPatternImage:", v4);
  v1 = (void *)qword_1ECD7BEF8;
  qword_1ECD7BEF8 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BEF8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_translucentPaperTextureColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)_grayColorForFontSize:(double)a3
{
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, dbl_18667D6D0[a3 < 40.0]);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_externalBarBackgroundColor
{
  return +[UIColor tableBackgroundColor](UIColor, "tableBackgroundColor");
}

+ (id)_systemSelectedColor
{
  return +[UIColor systemGreenColor](UIColor, "systemGreenColor");
}

+ (id)_vibrantLightDividerBurnColor
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.250980392, 1.0);
}

+ (id)_vibrantLightDividerDarkeningColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.31372549, 0.05);
}

+ (id)_vibrantLightFillDarkeningColor
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.04);
}

+ (id)_vibrantDarkFillDodgeColor
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.639215686, 1.0);
}

+ (id)_vibrantLightSectionDelimiterDividerBurnColor
{
  return +[UIColor _vibrantLightDividerBurnColor](UIColor, "_vibrantLightDividerBurnColor");
}

+ (id)_vibrantLightSectionDelimiterDividerDarkeningColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.235294118, 0.15);
}

+ (id)_webContentBackgroundColor
{
  if (qword_1ECD7BF20 != -1)
    dispatch_once(&qword_1ECD7BF20, &__block_literal_global_1155);
  return (id)qword_1ECD7BF18;
}

void __37__UIColor__webContentBackgroundColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.741176471, 0.741176471, 0.760784314, 1.0);
  v1 = (void *)qword_1ECD7BF18;
  qword_1ECD7BF18 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7BF18;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_webContentBackgroundColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (NSArray)_apiColorNames
{
  return (NSArray *)&unk_1E1A936B0;
}

- (id)_resolvedMaterialWithTraitCollection:(id)a3
{
  return 0;
}

- (id)_resolvedBackgroundColorWithTraitCollection:(void *)a1
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v3 = a2;
  if (a1)
  {
    v4 = a1;
    if (objc_msgSend(v3, "accessibilityContrast") != 1 || objc_msgSend(v3, "userInterfaceStyle") != 2)
      goto LABEL_9;
    +[UIColor systemGray2Color](UIColor, "systemGray2Color");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    +[UIColor systemGray3Color](UIColor, "systemGray3Color");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5 != v4)
    {

      +[UIColor systemGray4Color](UIColor, "systemGray4Color");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v7 == v4)
        goto LABEL_13;

      +[UIColor systemGray5Color](UIColor, "systemGray5Color");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v10;
      if (v9 != v4)
      {

        +[UIColor systemGray6Color](UIColor, "systemGray6Color");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v11;
        if (v7 != v4)
        {

          if (v9 == v4)
          {
            +[UIColor systemBlackColor](UIColor, "systemBlackColor");
            v12 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_10;
          }
LABEL_9:
          v12 = v4;
LABEL_10:
          v7 = v12;
          goto LABEL_11;
        }
LABEL_13:
        v7 = v9;
      }
    }
LABEL_11:

    objc_opt_self();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "traitCollectionByReplacingNSIntegerValue:forTrait:", 1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "resolvedColorWithTraitCollection:", v14);
    a1 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return a1;
}

+ (id)_monochromeCellImageTintColor
{
  if (qword_1ECD7C060 != -1)
    dispatch_once(&qword_1ECD7C060, &__block_literal_global_1490);
  return (id)qword_1ECD7C058;
}

void __57__UIColor__UIInterfaceAPI___monochromeCellImageTintColor__block_invoke()
{
  UIDynamicCatalogSystemColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = [UIDynamicCatalogSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_monochromeCellImageTintColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[UIDynamicCatalogSystemColor initWithName:coreUIColorName:](v0, v3, 16);
  v2 = (void *)qword_1ECD7C058;
  qword_1ECD7C058 = (uint64_t)v1;

}

+ (id)_systemBlueColor2
{
  if (qword_1ECD7C080 != -1)
    dispatch_once(&qword_1ECD7C080, &__block_literal_global_1494);
  return (id)qword_1ECD7C078;
}

void __45__UIColor__UIInterfaceAPI___systemBlueColor2__block_invoke()
{
  void *v0;
  void *v1;
  UICachedDeviceRGBColor *v2;
  void *v3;
  UICachedDeviceRGBColor *v4;
  void *v5;
  UICachedDeviceRGBColor *v6;
  void *v7;
  UICachedDeviceRGBColor *v8;
  void *v9;
  id v10;
  void *v11;
  UIDynamicSystemColor *v12;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v12 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_systemBlueColor2");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v1;
  v2 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.0, 0.478431373, 1.0, 1.0);
  v14[0] = v2;
  _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  v4 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.0, 0.250980392, 0.866666667, 1.0);
  v14[1] = v4;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  v6 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.274509804, 0.576470588, 1.0, 1.0);
  v14[2] = v6;
  _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v7;
  v8 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.274509804, 0.576470588, 1.0, 1.0);
  v14[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v12, v0, v9);
  v11 = (void *)qword_1ECD7C078;
  qword_1ECD7C078 = (uint64_t)v10;

}

+ (id)textGrammarIndicatorColor
{
  if (qword_1ECD7C170 != -1)
    dispatch_once(&qword_1ECD7C170, &__block_literal_global_1525);
  return (id)qword_1ECD7C168;
}

void __53__UIColor__UIInterfaceAPI__textGrammarIndicatorColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  void *v2;
  UICachedDeviceRGBColor *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "textGrammarIndicatorColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v2;
  v3 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 1.0, 0.694117647, 0.674509804, 1.0);
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v4);
  v6 = (void *)qword_1ECD7C168;
  qword_1ECD7C168 = (uint64_t)v5;

}

+ (id)_dynamicTestColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__UIColor__InProgressSPI___dynamicTestColor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  if (qword_1ECD7C180 != -1)
    dispatch_once(&qword_1ECD7C180, block);
  return (id)qword_1ECD7C178;
}

void __44__UIColor__InProgressSPI___dynamicTestColor__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIDynamicSystemColor *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v43[18];
  _QWORD v44[20];

  v44[18] = *MEMORY[0x1E0C80C00];
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v41;
  +[UIColor blueColor](UIColor, "blueColor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v40;
  _UIThemeKeyFromTraitValues(-1, 1, 0, 0, 0, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v39;
  +[UIColor greenColor](UIColor, "greenColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v38;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v37;
  +[UIColor cyanColor](UIColor, "cyanColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v36;
  _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v35;
  +[UIColor redColor](UIColor, "redColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v34;
  _UIThemeKeyFromTraitValues(-1, 1, 1, 0, 0, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v33;
  +[UIColor magentaColor](UIColor, "magentaColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v44[4] = v32;
  _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v43[5] = v31;
  +[UIColor yellowColor](UIColor, "yellowColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v44[5] = v30;
  _UIThemeKeyFromTraitValues(-1, 0, 0, 1, 0, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v43[6] = v29;
  +[UIColor colorWithDisplayP3Red:green:blue:alpha:](UIColor, "colorWithDisplayP3Red:green:blue:alpha:", 0.0, 0.0, 1.0, 1.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v44[6] = v28;
  _UIThemeKeyFromTraitValues(-1, 1, 0, 1, 0, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v43[7] = v27;
  +[UIColor colorWithDisplayP3Red:green:blue:alpha:](UIColor, "colorWithDisplayP3Red:green:blue:alpha:", 0.0, 1.0, 0.0, 1.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v44[7] = v26;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 1, 0, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v43[8] = v25;
  +[UIColor colorWithDisplayP3Red:green:blue:alpha:](UIColor, "colorWithDisplayP3Red:green:blue:alpha:", 0.0, 1.0, 1.0, 1.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v44[8] = v24;
  _UIThemeKeyFromTraitValues(-1, 0, 1, 1, 0, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v43[9] = v23;
  +[UIColor colorWithDisplayP3Red:green:blue:alpha:](UIColor, "colorWithDisplayP3Red:green:blue:alpha:", 1.0, 0.0, 0.0, 1.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v44[9] = v22;
  _UIThemeKeyFromTraitValues(-1, 1, 1, 1, 0, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v43[10] = v21;
  +[UIColor colorWithDisplayP3Red:green:blue:alpha:](UIColor, "colorWithDisplayP3Red:green:blue:alpha:", 1.0, 0.0, 1.0, 1.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v44[10] = v20;
  _UIThemeKeyFromTraitValues(-1, 2, 1, 1, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v43[11] = v19;
  +[UIColor colorWithDisplayP3Red:green:blue:alpha:](UIColor, "colorWithDisplayP3Red:green:blue:alpha:", 1.0, 1.0, 0.0, 1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v44[11] = v18;
  _UIThemeKeyFromTraitValues(3, 0, 0, 0, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v43[12] = v17;
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.5, 0.5, 0.9, 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v44[12] = v16;
  _UIThemeKeyFromTraitValues(3, 1, 0, 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v43[13] = v1;
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.5, 0.9, 0.5, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v44[13] = v2;
  _UIThemeKeyFromTraitValues(3, 2, 0, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v43[14] = v3;
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.5, 0.9, 0.9, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v44[14] = v4;
  _UIThemeKeyFromTraitValues(3, 0, 1, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v43[15] = v5;
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.9, 0.5, 0.5, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v44[15] = v6;
  _UIThemeKeyFromTraitValues(3, 1, 1, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v43[16] = v7;
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.9, 0.5, 0.9, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v44[16] = v8;
  _UIThemeKeyFromTraitValues(3, 2, 1, 0, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v43[17] = v9;
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.9, 0.9, 0.5, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v44[17] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [UIDynamicSystemColor alloc];
  NSStringFromSelector(*(SEL *)(a1 + 32));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v11, v12, v15);
  v14 = (void *)qword_1ECD7C178;
  qword_1ECD7C178 = (uint64_t)v13;

}

+ (id)_searchFieldDisabledBackgroundColor
{
  if (qword_1ECD7C1F0 != -1)
    dispatch_once(&qword_1ECD7C1F0, &__block_literal_global_1540);
  return (id)qword_1ECD7C1E8;
}

void __62__UIColor__InProgressSPI___searchFieldDisabledBackgroundColor__block_invoke()
{
  void *v0;
  void *v1;
  UICachedDeviceRGBColor *v2;
  void *v3;
  UICachedDeviceRGBColor *v4;
  void *v5;
  UICachedDeviceRGBColor *v6;
  void *v7;
  UICachedDeviceRGBColor *v8;
  void *v9;
  id v10;
  void *v11;
  UIDynamicSystemColor *v12;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v12 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_searchFieldDisabledBackgroundColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v1;
  v2 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.462745098, 0.462745098, 0.501960784, 0.06);
  v14[0] = v2;
  _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  v4 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.462745098, 0.462745098, 0.501960784, 0.14);
  v14[1] = v4;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  v6 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.462745098, 0.462745098, 0.501960784, 0.12);
  v14[2] = v6;
  _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v7;
  v8 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.462745098, 0.462745098, 0.501960784, 0.2);
  v14[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v12, v0, v9);
  v11 = (void *)qword_1ECD7C1E8;
  qword_1ECD7C1E8 = (uint64_t)v10;

}

+ (id)_pageControlPlatterIndicatorColor
{
  if (qword_1ECD7C210 != -1)
    dispatch_once(&qword_1ECD7C210, &__block_literal_global_1544);
  return (id)qword_1ECD7C208;
}

void __60__UIColor__InProgressSPI___pageControlPlatterIndicatorColor__block_invoke()
{
  void *v0;
  void *v1;
  UICachedDeviceWhiteColor *v2;
  void *v3;
  UICachedDeviceWhiteColor *v4;
  void *v5;
  UICachedDeviceWhiteColor *v6;
  void *v7;
  UICachedDeviceWhiteColor *v8;
  void *v9;
  id v10;
  void *v11;
  UIDynamicSystemColor *v12;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v12 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_pageControlPlatterIndicatorColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v1;
  v2 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.25);
  v14[0] = v2;
  _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  v4 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.45);
  v14[1] = v4;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  v6 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.25);
  v14[2] = v6;
  _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v7;
  v8 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.45);
  v14[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v12, v0, v9);
  v11 = (void *)qword_1ECD7C208;
  qword_1ECD7C208 = (uint64_t)v10;

}

+ (id)_searchFieldPlaceholderTextClearButtonColor
{
  if (qword_1ECD7C220 != -1)
    dispatch_once(&qword_1ECD7C220, &__block_literal_global_1546);
  return (id)qword_1ECD7C218;
}

void __70__UIColor__InProgressSPI___searchFieldPlaceholderTextClearButtonColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  void *v2;
  UICachedDeviceWhiteColor *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_searchFieldPlaceholderTextClearButtonColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v2;
  v3 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.47, 1.0);
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v4);
  v6 = (void *)qword_1ECD7C218;
  qword_1ECD7C218 = (uint64_t)v5;

}

+ (id)_searchBarBackgroundColor
{
  if (qword_1ECD7C230 != -1)
    dispatch_once(&qword_1ECD7C230, &__block_literal_global_1548);
  return (id)qword_1ECD7C228;
}

void __52__UIColor__InProgressSPI___searchBarBackgroundColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;

  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_searchBarBackgroundColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _colorsByThemeKeysystemGray3Color();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v4, v1);
  v3 = (void *)qword_1ECD7C228;
  qword_1ECD7C228 = (uint64_t)v2;

}

+ (id)_controlHighlightColor
{
  if (qword_1ECD7C250 != -1)
    dispatch_once(&qword_1ECD7C250, &__block_literal_global_1552);
  return (id)qword_1ECD7C248;
}

void __49__UIColor__InProgressSPI___controlHighlightColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  void *v2;
  UICachedDeviceRGBColor *v3;
  void *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_controlHighlightColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v3 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.780392157, 0.780392157, 0.8, 1.0);
  v10[0] = v3;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.266666667, 0.266666667, 0.274509804, 1.0);
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  v8 = (void *)qword_1ECD7C248;
  qword_1ECD7C248 = (uint64_t)v7;

}

+ (id)_controlVibrantTopBackgroundColor
{
  if (qword_1ECD7C270 != -1)
    dispatch_once(&qword_1ECD7C270, &__block_literal_global_1556);
  return (id)qword_1ECD7C268;
}

void __60__UIColor__InProgressSPI___controlVibrantTopBackgroundColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  void *v2;
  UICachedDeviceRGBColor *v3;
  void *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_controlVibrantTopBackgroundColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v3 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.0, 0.0274509804, 0.0980392157, 0.05);
  v10[0] = v3;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.980392157, 0.97254902, 1.0, 0.15);
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  v8 = (void *)qword_1ECD7C268;
  qword_1ECD7C268 = (uint64_t)v7;

}

+ (id)_controlVibrantBottomBackgroundColor
{
  if (qword_1ECD7C280 != -1)
    dispatch_once(&qword_1ECD7C280, &__block_literal_global_1558);
  return (id)qword_1ECD7C278;
}

void __63__UIColor__InProgressSPI___controlVibrantBottomBackgroundColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  void *v2;
  UICachedDeviceRGBColor *v3;
  void *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_controlVibrantBottomBackgroundColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v3 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.0, 0.0274509804, 0.0980392157, 0.72);
  v10[0] = v3;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.980392157, 0.97254902, 1.0, 0.05);
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  v8 = (void *)qword_1ECD7C278;
  qword_1ECD7C278 = (uint64_t)v7;

}

+ (id)_swiftColor
{
  if (qword_1ECD7C290 != -1)
    dispatch_once(&qword_1ECD7C290, &__block_literal_global_1560);
  return (id)qword_1ECD7C288;
}

void __38__UIColor__InProgressSPI___swiftColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  void *v2;
  UICachedDeviceRGBColor *v3;
  void *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_swiftColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v3 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.992156863, 0.407843137, 0.133333333, 1.0);
  v10[0] = v3;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 1.0, 0.458823529, 0.203921569, 1.0);
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  v8 = (void *)qword_1ECD7C288;
  qword_1ECD7C288 = (uint64_t)v7;

}

+ (id)_fillColor
{
  return +[UIColor systemFillColor](UIColor, "systemFillColor");
}

+ (id)_secondaryFillColor
{
  return +[UIColor secondarySystemFillColor](UIColor, "secondarySystemFillColor");
}

+ (id)_tertiaryFillColor
{
  return +[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor");
}

+ (id)_quaternaryFillColor
{
  return +[UIColor quaternarySystemFillColor](UIColor, "quaternarySystemFillColor");
}

+ (id)_systemGray2Color
{
  return +[UIColor systemGray2Color](UIColor, "systemGray2Color");
}

+ (id)_systemGray3Color
{
  return +[UIColor systemGray3Color](UIColor, "systemGray3Color");
}

+ (id)_systemGray4Color
{
  return +[UIColor systemGray4Color](UIColor, "systemGray4Color");
}

+ (id)_systemGray5Color
{
  return +[UIColor systemGray5Color](UIColor, "systemGray5Color");
}

+ (id)_systemGray6Color
{
  return +[UIColor systemGray6Color](UIColor, "systemGray6Color");
}

+ (id)_linkColor
{
  return +[UIColor linkColor](UIColor, "linkColor");
}

+ (id)_placeholderTextColor
{
  return +[UIColor placeholderTextColor](UIColor, "placeholderTextColor");
}

+ (id)_opaqueSeparatorColor
{
  return +[UIColor opaqueSeparatorColor](UIColor, "opaqueSeparatorColor");
}

+ (id)_secondarySystemBackgroundColor
{
  return +[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor");
}

+ (id)_contentBackgroundColor
{
  return +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
}

+ (id)_systemBackgroundSectionColor
{
  return +[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor");
}

+ (id)_systemBackgroundSectionCellColor
{
  return +[UIColor tertiarySystemBackgroundColor](UIColor, "tertiarySystemBackgroundColor");
}

+ (id)_systemGroupBackgroundColor
{
  return +[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor");
}

+ (id)_systemGroupBackgroundCellColor
{
  return +[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor");
}

+ (id)_textFieldDisabledBackgroundColor
{
  if (qword_1ECD7C2D0 != -1)
    dispatch_once(&qword_1ECD7C2D0, &__block_literal_global_1568);
  return (id)qword_1ECD7C2C8;
}

void __60__UIColor__InProgressSPI___textFieldDisabledBackgroundColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  void *v2;
  UICachedDeviceWhiteColor *v3;
  void *v4;
  UICachedDeviceWhiteColor *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_textFieldDisabledBackgroundColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v3 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.980392157, 1.0);
  v10[0] = v3;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v5 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0196078431, 1.0);
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  v8 = (void *)qword_1ECD7C2C8;
  qword_1ECD7C2C8 = (uint64_t)v7;

}

+ (id)_textFieldDisabledBorderColor
{
  if (qword_1ECD7C2F0 != -1)
    dispatch_once(&qword_1ECD7C2F0, &__block_literal_global_1572);
  return (id)qword_1ECD7C2E8;
}

void __56__UIColor__InProgressSPI___textFieldDisabledBorderColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  void *v2;
  UICachedDeviceWhiteColor *v3;
  void *v4;
  UICachedDeviceWhiteColor *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_textFieldDisabledBorderColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v3 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.17);
  v10[0] = v3;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v5 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.17);
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  v8 = (void *)qword_1ECD7C2E8;
  qword_1ECD7C2E8 = (uint64_t)v7;

}

+ (id)_markedTextBackgroundColor
{
  return +[UIColor _secondaryFillColor](UIColor, "_secondaryFillColor");
}

+ (id)tableSelectionColor
{
  if (qword_1ECD7C370 != -1)
    dispatch_once(&qword_1ECD7C370, &__block_literal_global_1588);
  return (id)qword_1ECD7C368;
}

void __46__UIColor__InProgressSPI__tableSelectionColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.16, 0.43, 0.83, 1.0);
  v1 = (void *)qword_1ECD7C368;
  qword_1ECD7C368 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7C368;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tableSelectionColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)tableCellGroupedSelectedBackgroundColor
{
  return +[UIColor tableCellPlainSelectedBackgroundColor](UIColor, "tableCellPlainSelectedBackgroundColor");
}

+ (id)tableCellHighlightedBackgroundColor
{
  if (qword_1ECD7C380 != -1)
    dispatch_once(&qword_1ECD7C380, &__block_literal_global_1590);
  return (id)qword_1ECD7C378;
}

void __62__UIColor__InProgressSPI__tableCellHighlightedBackgroundColor__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.8);
  v1 = (void *)qword_1ECD7C378;
  qword_1ECD7C378 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7C378;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tableCellHighlightedBackgroundColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)tableCellFocusedBackgroundColor
{
  if (qword_1ECD7C390 != -1)
    dispatch_once(&qword_1ECD7C390, &__block_literal_global_1592);
  return (id)qword_1ECD7C388;
}

void __58__UIColor__InProgressSPI__tableCellFocusedBackgroundColor__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.9);
  v1 = (void *)qword_1ECD7C388;
  qword_1ECD7C388 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7C388;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tableCellFocusedBackgroundColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)tableCellDisabledBackgroundColor
{
  if (qword_1ECD7C3A0 != -1)
    dispatch_once(&qword_1ECD7C3A0, &__block_literal_global_1594);
  return (id)qword_1ECD7C398;
}

void __59__UIColor__InProgressSPI__tableCellDisabledBackgroundColor__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.5);
  v1 = (void *)qword_1ECD7C398;
  qword_1ECD7C398 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7C398;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tableCellDisabledBackgroundColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)tablePlainHeaderFooterBackgroundColor
{
  if (qword_1ECD7C3B0 != -1)
    dispatch_once(&qword_1ECD7C3B0, &__block_literal_global_1596);
  return (id)qword_1ECD7C3A8;
}

void __64__UIColor__InProgressSPI__tablePlainHeaderFooterBackgroundColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;

  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tablePlainHeaderFooterBackgroundColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _colorsByThemeKeytablePlainHeaderFooterBackgroundColor();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v4, v1);
  v3 = (void *)qword_1ECD7C3A8;
  qword_1ECD7C3A8 = (uint64_t)v2;

}

+ (id)tablePlainHeaderFooterFloatingBackgroundColor
{
  if (qword_1ECD7C3C0 != -1)
    dispatch_once(&qword_1ECD7C3C0, &__block_literal_global_1598);
  return (id)qword_1ECD7C3B8;
}

void __72__UIColor__InProgressSPI__tablePlainHeaderFooterFloatingBackgroundColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;

  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tablePlainHeaderFooterFloatingBackgroundColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _colorsByThemeKeytablePlainHeaderFooterBackgroundColor();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v4, v1);
  v3 = (void *)qword_1ECD7C3B8;
  qword_1ECD7C3B8 = (uint64_t)v2;

}

+ (id)_plainTableHeaderFooterTextColor
{
  if (qword_1ECD7C3D0 != -1)
    dispatch_once(&qword_1ECD7C3D0, &__block_literal_global_1600);
  return (id)qword_1ECD7C3C8;
}

void __59__UIColor__InProgressSPI___plainTableHeaderFooterTextColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  void *v2;
  UICachedDeviceRGBColor *v3;
  void *v4;
  UICachedDeviceRGBColor *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_plainTableHeaderFooterTextColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v3 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.137254902, 0.137254902, 0.137254902, 1.0);
  v10[0] = v3;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v5 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.862745098, 0.862745098, 0.862745098, 1.0);
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  v8 = (void *)qword_1ECD7C3C8;
  qword_1ECD7C3C8 = (uint64_t)v7;

}

+ (id)_groupTableHeaderFooterTextColor
{
  if (qword_1ECD7C3E0 != -1)
    dispatch_once(&qword_1ECD7C3E0, &__block_literal_global_1602);
  return (id)qword_1ECD7C3D8;
}

void __59__UIColor__InProgressSPI___groupTableHeaderFooterTextColor__block_invoke()
{
  void *v0;
  void *v1;
  UICachedDeviceRGBColor *v2;
  void *v3;
  UICachedDeviceRGBColor *v4;
  void *v5;
  UICachedDeviceRGBColor *v6;
  void *v7;
  UICachedDeviceRGBColor *v8;
  void *v9;
  id v10;
  void *v11;
  UIDynamicSystemColor *v12;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v12 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_groupTableHeaderFooterTextColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v1;
  v2 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.42745098, 0.42745098, 0.447058824, 1.0);
  v14[0] = v2;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  v4 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.556862745, 0.556862745, 0.576470588, 1.0);
  v14[1] = v4;
  _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  v6 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.290196078, 0.290196078, 0.301960784, 1.0);
  v14[2] = v6;
  _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v7;
  v8 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.694117647, 0.694117647, 0.721568627, 1.0);
  v14[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v12, v0, v9);
  v11 = (void *)qword_1ECD7C3D8;
  qword_1ECD7C3D8 = (uint64_t)v10;

}

+ (id)_sidebarBackgroundColor
{
  return +[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor");
}

+ (id)_swipedSidebarCellBackgroundColor
{
  if (qword_1ECD7C3F0 != -1)
    dispatch_once(&qword_1ECD7C3F0, &__block_literal_global_1604);
  return (id)qword_1ECD7C3E8;
}

void __60__UIColor__InProgressSPI___swipedSidebarCellBackgroundColor__block_invoke()
{
  UICachedDeviceRGBColor *v0;
  void *v1;
  UICachedDeviceRGBColor *v2;
  void *v3;
  UICachedDeviceRGBColor *v4;
  void *v5;
  UICachedDeviceRGBColor *v6;
  void *v7;
  UICachedDeviceRGBColor *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  UICachedDeviceRGBColor *v13;
  void *v14;
  void *v15;
  UIDynamicSystemColor *v16;
  _QWORD v17[6];
  _QWORD v18[7];

  v18[6] = *MEMORY[0x1E0C80C00];
  v16 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_swipedSidebarCellBackgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v14;
  v13 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.898039216, 0.898039216, 0.917647059, 1.0);
  v18[0] = v13;
  _UIThemeKeyFromTraitValues(-1, 0, 1, 0, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v12;
  v0 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.847058824, 0.847058824, 0.862745098, 1.0);
  v18[1] = v0;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v1;
  v2 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.17254902, 0.17254902, 0.180392157, 1.0);
  v18[2] = v2;
  _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v3;
  v4 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.211764706, 0.211764706, 0.219607843, 1.0);
  v18[3] = v4;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v5;
  v6 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.22745098, 0.22745098, 0.235294118, 1.0);
  v18[4] = v6;
  _UIThemeKeyFromTraitValues(-1, 2, 1, 0, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v7;
  v8 = -[UIDeviceRGBColor initWithRed:green:blue:alpha:]([UICachedDeviceRGBColor alloc], "initWithRed:green:blue:alpha:", 0.266666667, 0.266666667, 0.274509804, 1.0);
  v18[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v16, v15, v9);
  v11 = (void *)qword_1ECD7C3E8;
  qword_1ECD7C3E8 = (uint64_t)v10;

}

+ (id)_carSystemPrimaryColor
{
  if (qword_1ECD7C410 != -1)
    dispatch_once(&qword_1ECD7C410, &__block_literal_global_1608);
  return (id)qword_1ECD7C408;
}

void __49__UIColor__InProgressSPI___carSystemPrimaryColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  void *v2;
  UICachedDeviceWhiteColor *v3;
  void *v4;
  UICachedDeviceWhiteColor *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_carSystemPrimaryColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v3 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.75);
  v10[0] = v3;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v5 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.75);
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  v8 = (void *)qword_1ECD7C408;
  qword_1ECD7C408 = (uint64_t)v7;

}

+ (id)_carSystemSecondaryColor
{
  if (qword_1ECD7C420 != -1)
    dispatch_once(&qword_1ECD7C420, &__block_literal_global_1610);
  return (id)qword_1ECD7C418;
}

void __51__UIColor__InProgressSPI___carSystemSecondaryColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  void *v2;
  UICachedDeviceWhiteColor *v3;
  void *v4;
  UICachedDeviceWhiteColor *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_carSystemSecondaryColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v3 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.55);
  v10[0] = v3;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v5 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.55);
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  v8 = (void *)qword_1ECD7C418;
  qword_1ECD7C418 = (uint64_t)v7;

}

+ (id)_carSystemTertiaryColor
{
  if (qword_1ECD7C430 != -1)
    dispatch_once(&qword_1ECD7C430, &__block_literal_global_1612);
  return (id)qword_1ECD7C428;
}

void __50__UIColor__InProgressSPI___carSystemTertiaryColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  void *v2;
  UICachedDeviceWhiteColor *v3;
  void *v4;
  UICachedDeviceWhiteColor *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_carSystemTertiaryColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v3 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.3);
  v10[0] = v3;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v5 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.3);
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  v8 = (void *)qword_1ECD7C428;
  qword_1ECD7C428 = (uint64_t)v7;

}

+ (id)_carSystemQuaternaryColor
{
  if (qword_1ECD7C440 != -1)
    dispatch_once(&qword_1ECD7C440, &__block_literal_global_1614_0);
  return (id)qword_1ECD7C438;
}

void __52__UIColor__InProgressSPI___carSystemQuaternaryColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  void *v2;
  UICachedDeviceWhiteColor *v3;
  void *v4;
  UICachedDeviceWhiteColor *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_carSystemQuaternaryColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v3 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.07);
  v10[0] = v3;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v5 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.15);
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  v8 = (void *)qword_1ECD7C438;
  qword_1ECD7C438 = (uint64_t)v7;

}

+ (id)_carSystemFocusLabelColor
{
  if (qword_1ECD7C460 != -1)
    dispatch_once(&qword_1ECD7C460, &__block_literal_global_1618);
  return (id)qword_1ECD7C458;
}

void __52__UIColor__InProgressSPI___carSystemFocusLabelColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  void *v2;
  UICachedDeviceWhiteColor *v3;
  void *v4;
  UICachedDeviceWhiteColor *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_carSystemFocusLabelColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v3 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 1.0);
  v10[0] = v3;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v5 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 1.0);
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  v8 = (void *)qword_1ECD7C458;
  qword_1ECD7C458 = (uint64_t)v7;

}

+ (id)_carSystemFocusPrimaryColor
{
  if (qword_1ECD7C470 != -1)
    dispatch_once(&qword_1ECD7C470, &__block_literal_global_1620);
  return (id)qword_1ECD7C468;
}

void __54__UIColor__InProgressSPI___carSystemFocusPrimaryColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  void *v2;
  UICachedDeviceWhiteColor *v3;
  void *v4;
  UICachedDeviceWhiteColor *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_carSystemFocusPrimaryColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v3 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.75);
  v10[0] = v3;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v5 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.75);
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  v8 = (void *)qword_1ECD7C468;
  qword_1ECD7C468 = (uint64_t)v7;

}

+ (id)_carSystemFocusSecondaryColor
{
  if (qword_1ECD7C480 != -1)
    dispatch_once(&qword_1ECD7C480, &__block_literal_global_1622);
  return (id)qword_1ECD7C478;
}

void __56__UIColor__InProgressSPI___carSystemFocusSecondaryColor__block_invoke()
{
  UIDynamicSystemColor *v0;
  void *v1;
  void *v2;
  UICachedDeviceWhiteColor *v3;
  void *v4;
  UICachedDeviceWhiteColor *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v0 = [UIDynamicSystemColor alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_carSystemFocusSecondaryColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIThemeKeyFromTraitValues(-1, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v3 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.55);
  v10[0] = v3;
  _UIThemeKeyFromTraitValues(-1, 2, 0, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v5 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.55);
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[UIDynamicSystemColor initWithName:colorsByThemeKey:](v0, v1, v6);
  v8 = (void *)qword_1ECD7C478;
  qword_1ECD7C478 = (uint64_t)v7;

}

+ (id)_focusedCarSystemColor:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;

  v3 = a3;
  +[UIColor _labelColor](UIColor, "_labelColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v3)
  {
    +[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UIColor _carSystemPrimaryColor](UIColor, "_carSystemPrimaryColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 == v3)
    {
      +[UIColor _carSystemFocusPrimaryColor](UIColor, "_carSystemFocusPrimaryColor");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[UIColor _carSystemSecondaryColor](UIColor, "_carSystemSecondaryColor");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (v6 == v3)
      {
        +[UIColor _carSystemFocusSecondaryColor](UIColor, "_carSystemFocusSecondaryColor");
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = v3;
      }
    }
  }
  v8 = v7;

  return v8;
}

+ (id)_unfocusedCarSystemColor:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;

  v3 = a3;
  +[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v3)
  {
    +[UIColor _labelColor](UIColor, "_labelColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UIColor _carSystemFocusPrimaryColor](UIColor, "_carSystemFocusPrimaryColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 == v3)
    {
      +[UIColor _carSystemPrimaryColor](UIColor, "_carSystemPrimaryColor");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[UIColor _carSystemFocusSecondaryColor](UIColor, "_carSystemFocusSecondaryColor");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (v6 == v3)
      {
        +[UIColor _carSystemSecondaryColor](UIColor, "_carSystemSecondaryColor");
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = v3;
      }
    }
  }
  v8 = v7;

  return v8;
}

+ (id)_tvLabelOpacityAColor
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

+ (id)_tvLabelOpacityBColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
}

+ (id)_tvLabelOpacityCColor
{
  return +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
}

+ (id)_tvInterfaceStyleLightContentColor
{
  if (qword_1ECD7C490 != -1)
    dispatch_once(&qword_1ECD7C490, &__block_literal_global_1624_0);
  return (id)qword_1ECD7C488;
}

void __61__UIColor__InProgressSPI___tvInterfaceStyleLightContentColor__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 0.0, 0.4);
  v1 = (void *)qword_1ECD7C488;
  qword_1ECD7C488 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7C488;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_tvInterfaceStyleLightContentColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)_tvInterfaceStyleDarkContentColor
{
  if (qword_1ECD7C4A0 != -1)
    dispatch_once(&qword_1ECD7C4A0, &__block_literal_global_1626);
  return (id)qword_1ECD7C498;
}

void __60__UIColor__InProgressSPI___tvInterfaceStyleDarkContentColor__block_invoke()
{
  UICachedDeviceWhiteColor *v0;
  void *v1;
  void *v2;
  id v3;

  v0 = -[UIDeviceWhiteColor initWithWhite:alpha:]([UICachedDeviceWhiteColor alloc], "initWithWhite:alpha:", 1.0, 0.3);
  v1 = (void *)qword_1ECD7C498;
  qword_1ECD7C498 = (uint64_t)v0;

  v2 = (void *)qword_1ECD7C498;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_tvInterfaceStyleDarkContentColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSystemColorName:", v3);

}

+ (id)_tvAppKeyColorOrDefaultTint
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  if (dyld_program_sdk_at_least())
  {
    +[UIColor _appKeyColor]();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      v4 = v2;
    }
    else
    {
      +[UIColor whiteColor](UIColor, "whiteColor");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;

  }
  else
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (UIColor)colorWithProminence:(int64_t)a3
{
  UIDynamicProviderColor *v6;
  UIDynamicProviderColor *v7;
  id *v8;
  _QWORD v9[5];

  if (-[UIColor prominence](self, "prominence") == a3)
    return self;
  v6 = [UIDynamicProviderColor alloc];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__UIColor_ProminenceSupport__colorWithProminence___block_invoke;
  v9[3] = &unk_1E16B1DC8;
  v9[4] = self;
  v7 = -[UIDynamicProviderColor initWithProvider:](v6, "initWithProvider:", v9);
  v8 = -[UIDynamicModifiedColor initWithBaseColor:alphaComponent:contrast:prominence:]((id *)[UIDynamicModifiedColor alloc], v7, (void *)0xFFFFFFFFFFFFFFFFLL, (void *)a3, 1.79769313e308);

  return (UIColor *)v8;
}

id __50__UIColor_ProminenceSupport__colorWithProminence___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (int64_t)prominence
{
  return 0;
}

+ (id)candidateRowBackgroundColor
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.99, 1.0);
}

+ (id)candidateRowHighlightedColor
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.991, 1.0);
}

+ (id)lineSeparatorColor
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.9, 1.0);
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.uikit.color");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithIdentifier:allowUndeclared:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithIdentifier:allowUndeclared:", CFSTR("com.apple.uikit.color"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "conformsToType:", v9))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v6, 0);
    objc_msgSend(v10, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "finishDecoding");

  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  return v12;
}

- (UIColor)initWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  UIColor *v10;
  void *v11;
  UIColor *v12;

  v8 = a4;
  v9 = a3;
  v10 = -[UIColor init](self, "init");
  objc_msgSend((id)objc_opt_class(), "objectWithItemProviderData:typeIdentifier:error:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v11;
  return v12;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.uikit.color");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)writableTypeIdentifiersForItemProvider
{
  return +[UIColor writableTypeIdentifiersForItemProvider](UIColor, "writableTypeIdentifiersForItemProvider");
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  void *v7;

  v6 = (void (**)(id, void *, _QWORD))a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.uikit.color")))
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v7, 0);

  }
  else
  {
    v6[2](v6, 0, 0);
  }

  return 0;
}

+ (id)_convertColorPickerColor:(id)a3 fromUserInterfaceStyle:(int64_t)a4 to:(int64_t)a5
{
  id v7;
  void *v8;
  CGColor *ConvertedToSRGB;
  CGColorRef SRGB;
  const CGFloat *Components;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  _OWORD v17[2];
  __int128 v18;
  double v19[3];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (a5 && a4 && a4 != a5)
  {
    v17[0] = xmmword_186684428;
    v17[1] = unk_186684438;
    ConvertedToSRGB = DKUCGColorCreateConvertedToSRGB(objc_msgSend(objc_retainAutorelease(v7), "CGColor"));
    DKUColorGetRGBAComponents(ConvertedToSRGB, v17);
    v15 = xmmword_186684428;
    v16 = unk_186684438;
    v18 = xmmword_186684428;
    *(_OWORD *)v19 = unk_186684438;
    DKUConvertsRGBToHSL((uint64_t)v17, (uint64_t)&v18);
    v19[0] = 1.0 - v19[0];
    DKUConvertHSLToSRGB((uint64_t)&v18, (uint64_t)&v15);
    SRGB = CGColorCreateSRGB(*(CGFloat *)&v15, *((CGFloat *)&v15 + 1), *(CGFloat *)&v16, *((CGFloat *)&v16 + 1));
    CFAutorelease(SRGB);
    CGColorRelease(ConvertedToSRGB);
    Components = CGColorGetComponents(SRGB);
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", *Components, Components[1], Components[2], Components[3]);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v7;
  }
  v13 = v12;

  return v13;
}

@end
