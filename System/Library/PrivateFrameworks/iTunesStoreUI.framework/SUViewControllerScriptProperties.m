@implementation SUViewControllerScriptProperties

- (SUViewControllerScriptProperties)initWithCoder:(id)a3
{
  SUViewControllerScriptProperties *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  objc_super v16;
  _QWORD v17[6];

  v17[5] = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)SUViewControllerScriptProperties;
  v4 = -[SUViewControllerScriptProperties init](&v16, sel_init);
  if (v4)
  {
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("alwaysDispatchesScroll")))
    {
      v5 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("alwaysDispatchesScroll"));
    }
    else
    {
      v6 = (void *)objc_msgSend(MEMORY[0x24BEC8C48], "sharedCache");
      v7 = (void *)objc_msgSend((id)objc_msgSend(v6, "URLBagForContext:", objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0)), "valueForKey:", CFSTR("p2-client-options"));
      objc_opt_class();
      v8 = 0;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = (void *)objc_msgSend(v7, "objectForKey:", CFSTR("always-dispatch-scroll-events"));
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = objc_msgSend(v8, "BOOLValue");
      else
        v5 = (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) != 1;
    }
    v4->_alwaysDispatchesScrollEvents = v5;
    v9 = (void *)MEMORY[0x24BDBCF20];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    v17[3] = objc_opt_class();
    v17[4] = objc_opt_class();
    v10 = objc_msgSend(v9, "setWithArray:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 5));
    v4->_backgroundColor = (UIColor *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bgcolor"));
    v4->_contextDictionary = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v10, CFSTR("ctxdict"));
    v4->_doubleTapEnabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("doubletap"));
    v4->_embedded = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("embedded"));
    v4->_flashesScrollIndicators = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("flashscrollers"));
    v4->_inputViewObeysDOMFocus = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("inputViewObeysDOMFocus"));
    v4->_loadingIndicatorStyle = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("activitystyle"));
    v4->_loadingTextColor = (UIColor *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("loadtextcolor"));
    v4->_loadingTextShadowColor = (UIColor *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("loadtextscolor"));
    v4->_placeholderBackgroundGradient = (SUGradient *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placeholdergradient"));
    objc_msgSend(a3, "decodeUIEdgeInsetsForKey:", CFSTR("scrollinsets"));
    v4->_scrollContentInsets.top = v11;
    v4->_scrollContentInsets.left = v12;
    v4->_scrollContentInsets.bottom = v13;
    v4->_scrollContentInsets.right = v14;
    v4->_scrollingDisabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("scrollingdisabled"));
    v4->_shouldLoadProgressively = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("loadprogressively"));
    v4->_shouldShowFormAccessory = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("formaccessory"));
    v4->_showsBackgroundShadow = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("bgshadow"));
    v4->_showsHorizontalScrollIndicator = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("hscroller"));
    v4->_showsVerticalScrollIndicator = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("vscroller"));
    v4->_topExtensionColor = (UIColor *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("topcolor"));
    v4->_usesBlurredBackground = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("blurredbg"));
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUViewControllerScriptProperties;
  -[SUViewControllerScriptProperties dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  __int128 v6;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_BYTE *)(v5 + 8) = self->_alwaysDispatchesScrollEvents;
  *(_QWORD *)(v5 + 16) = self->_backgroundColor;
  *(_QWORD *)(v5 + 24) = -[NSDictionary copyWithZone:](self->_contextDictionary, "copyWithZone:", a3);
  *(_BYTE *)(v5 + 32) = self->_doubleTapEnabled;
  *(_BYTE *)(v5 + 33) = self->_embedded;
  *(_BYTE *)(v5 + 34) = self->_flashesScrollIndicators;
  *(_BYTE *)(v5 + 35) = self->_inputViewObeysDOMFocus;
  *(_QWORD *)(v5 + 40) = self->_loadingIndicatorStyle;
  *(_QWORD *)(v5 + 48) = self->_loadingTextColor;
  *(_QWORD *)(v5 + 56) = self->_loadingTextShadowColor;
  *(_QWORD *)(v5 + 64) = -[SUGradient copyWithZone:](self->_placeholderBackgroundGradient, "copyWithZone:", a3);
  v6 = *(_OWORD *)&self->_scrollContentInsets.bottom;
  *(_OWORD *)(v5 + 72) = *(_OWORD *)&self->_scrollContentInsets.top;
  *(_OWORD *)(v5 + 88) = v6;
  *(_BYTE *)(v5 + 104) = self->_scrollingDisabled;
  *(_BYTE *)(v5 + 105) = self->_shouldLoadProgressively;
  *(_BYTE *)(v5 + 106) = self->_shouldShowFormAccessory;
  *(_BYTE *)(v5 + 109) = self->_showsBackgroundShadow;
  *(_BYTE *)(v5 + 107) = self->_showsHorizontalScrollIndicator;
  *(_BYTE *)(v5 + 108) = self->_showsVerticalScrollIndicator;
  *(_QWORD *)(v5 + 112) = self->_topExtensionColor;
  *(_BYTE *)(v5 + 120) = self->_usesBlurredBackground;
  return (id)v5;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUViewControllerScriptProperties.m"), 159, 0);
  objc_msgSend(a3, "encodeBool:forKey:", self->_alwaysDispatchesScrollEvents, CFSTR("alwaysDispatchesScroll"));
  objc_msgSend(a3, "safeEncodeUIColor:forKey:", self->_backgroundColor, CFSTR("bgcolor"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_contextDictionary, CFSTR("ctxdict"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_doubleTapEnabled, CFSTR("doubletap"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_embedded, CFSTR("embedded"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_flashesScrollIndicators, CFSTR("flashscrollers"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_inputViewObeysDOMFocus, CFSTR("inputViewObeysDOMFocus"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_loadingIndicatorStyle, CFSTR("activitystyle"));
  objc_msgSend(a3, "safeEncodeUIColor:forKey:", self->_loadingTextColor, CFSTR("loadtextcolor"));
  objc_msgSend(a3, "safeEncodeUIColor:forKey:", self->_loadingTextShadowColor, CFSTR("loadtextscolor"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_placeholderBackgroundGradient, CFSTR("placeholdergradient"));
  objc_msgSend(a3, "encodeUIEdgeInsets:forKey:", CFSTR("scrollinsets"), self->_scrollContentInsets.top, self->_scrollContentInsets.left, self->_scrollContentInsets.bottom, self->_scrollContentInsets.right);
  objc_msgSend(a3, "encodeBool:forKey:", self->_scrollingDisabled, CFSTR("scrollingdisabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_shouldLoadProgressively, CFSTR("loadprogressively"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_shouldShowFormAccessory, CFSTR("formaccessory"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_showsBackgroundShadow, CFSTR("bgshadow"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_showsHorizontalScrollIndicator, CFSTR("hscroller"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_showsVerticalScrollIndicator, CFSTR("vscroller"));
  objc_msgSend(a3, "safeEncodeUIColor:forKey:", self->_topExtensionColor, CFSTR("topcolor"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_usesBlurredBackground, CFSTR("blurredbg"));
}

- (BOOL)alwaysDispatchesScrollEvents
{
  return self->_alwaysDispatchesScrollEvents;
}

- (void)setAlwaysDispatchesScrollEvents:(BOOL)a3
{
  self->_alwaysDispatchesScrollEvents = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSDictionary)contextDictionary
{
  return self->_contextDictionary;
}

- (void)setContextDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isDoubleTapEnabled
{
  return self->_doubleTapEnabled;
}

- (void)setDoubleTapEnabled:(BOOL)a3
{
  self->_doubleTapEnabled = a3;
}

- (BOOL)isEmbedded
{
  return self->_embedded;
}

- (void)setEmbedded:(BOOL)a3
{
  self->_embedded = a3;
}

- (BOOL)flashesScrollIndicators
{
  return self->_flashesScrollIndicators;
}

- (void)setFlashesScrollIndicators:(BOOL)a3
{
  self->_flashesScrollIndicators = a3;
}

- (BOOL)inputViewObeysDOMFocus
{
  return self->_inputViewObeysDOMFocus;
}

- (void)setInputViewObeysDOMFocus:(BOOL)a3
{
  self->_inputViewObeysDOMFocus = a3;
}

- (int64_t)loadingIndicatorStyle
{
  return self->_loadingIndicatorStyle;
}

- (void)setLoadingIndicatorStyle:(int64_t)a3
{
  self->_loadingIndicatorStyle = a3;
}

- (UIColor)loadingTextColor
{
  return self->_loadingTextColor;
}

- (void)setLoadingTextColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (UIColor)loadingTextShadowColor
{
  return self->_loadingTextShadowColor;
}

- (void)setLoadingTextShadowColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (SUGradient)placeholderBackgroundGradient
{
  return self->_placeholderBackgroundGradient;
}

- (void)setPlaceholderBackgroundGradient:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (UIEdgeInsets)scrollContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_scrollContentInsets.top;
  left = self->_scrollContentInsets.left;
  bottom = self->_scrollContentInsets.bottom;
  right = self->_scrollContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setScrollContentInsets:(UIEdgeInsets)a3
{
  self->_scrollContentInsets = a3;
}

- (BOOL)isScrollingDisabled
{
  return self->_scrollingDisabled;
}

- (void)setScrollingDisabled:(BOOL)a3
{
  self->_scrollingDisabled = a3;
}

- (BOOL)shouldLoadProgressively
{
  return self->_shouldLoadProgressively;
}

- (void)setShouldLoadProgressively:(BOOL)a3
{
  self->_shouldLoadProgressively = a3;
}

- (BOOL)shouldShowFormAccessory
{
  return self->_shouldShowFormAccessory;
}

- (void)setShouldShowFormAccessory:(BOOL)a3
{
  self->_shouldShowFormAccessory = a3;
}

- (BOOL)showsHorizontalScrollIndicator
{
  return self->_showsHorizontalScrollIndicator;
}

- (void)setShowsHorizontalScrollIndicator:(BOOL)a3
{
  self->_showsHorizontalScrollIndicator = a3;
}

- (BOOL)showsVerticalScrollIndicator
{
  return self->_showsVerticalScrollIndicator;
}

- (void)setShowsVerticalScrollIndicator:(BOOL)a3
{
  self->_showsVerticalScrollIndicator = a3;
}

- (BOOL)showsBackgroundShadow
{
  return self->_showsBackgroundShadow;
}

- (void)setShowsBackgroundShadow:(BOOL)a3
{
  self->_showsBackgroundShadow = a3;
}

- (UIColor)topExtensionColor
{
  return self->_topExtensionColor;
}

- (void)setTopExtensionColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (BOOL)usesBlurredBackground
{
  return self->_usesBlurredBackground;
}

- (void)setUsesBlurredBackground:(BOOL)a3
{
  self->_usesBlurredBackground = a3;
}

@end
