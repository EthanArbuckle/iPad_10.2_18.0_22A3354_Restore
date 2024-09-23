@implementation UIButtonConfiguration

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (void)setImageReservation:(double)a3
{
  self->_imageReservation = a3;
}

- (void)setImageColorTransformer:(UIConfigurationColorTransformer)imageColorTransformer
{
  objc_setProperty_nonatomic_copy(self, a2, imageColorTransformer, 144);
}

- (void)setDefaultContentInsets
{
  *(_DWORD *)&self->_flags &= ~0x80u;
}

- (UIImageSymbolConfiguration)preferredSymbolConfigurationForImage
{
  return self->_preferredSymbolConfigurationForImage;
}

- (UIButtonConfigurationCornerStyle)cornerStyle
{
  return self->_cornerStyle;
}

- (UIBackgroundConfiguration)background
{
  return self->_background;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_indicatorColorTransformer, 0);
  objc_storeStrong(&self->_subtitleTextAttributesTransformer, 0);
  objc_storeStrong((id *)&self->_attributedSubtitle, 0);
  objc_storeStrong(&self->_titleTextAttributesTransformer, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong(&self->_activityIndicatorColorTransformer, 0);
  objc_storeStrong((id *)&self->_preferredSymbolConfigurationForImage, 0);
  objc_storeStrong(&self->_imageColorTransformer, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_baseBackgroundColor, 0);
  objc_storeStrong((id *)&self->_baseForegroundColor, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_resolvedActivityIndicatorColor, 0);
  objc_storeStrong((id *)&self->_resolvedIndicatorSymbolConfig, 0);
  objc_storeStrong((id *)&self->_resolvedIndicatorColor, 0);
  objc_storeStrong((id *)&self->_resolvedSymbolConfig, 0);
  objc_storeStrong((id *)&self->_resolvedImageColor, 0);
  objc_storeStrong((id *)&self->_resolvedSubtitle, 0);
  objc_storeStrong((id *)&self->_resolvedTitle, 0);
  objc_storeStrong((id *)&self->_behaviors, 0);
}

- (void)setContentInsets:(NSDirectionalEdgeInsets)contentInsets
{
  *(_DWORD *)&self->_flags |= 0x80u;
  self->_contentInsets = contentInsets;
}

- (void)_setSwiftBridgingBackground:(id)a3
{
  objc_storeStrong((id *)&self->_background, a3);
}

- (void)setTitleTextAttributesTransformer:(UIConfigurationTextAttributesTransformer)titleTextAttributesTransformer
{
  objc_setProperty_nonatomic_copy(self, a2, titleTextAttributesTransformer, 176);
}

- (void)setCornerStyle:(UIButtonConfigurationCornerStyle)cornerStyle
{
  self->_cornerStyle = cornerStyle;
}

- (BOOL)_hasMultilineTitle
{
  return (*((_BYTE *)&self->_flags + 1) & 0x30) == 0
      && -[NSAttributedString length](self->_attributedTitle, "length") != 0;
}

- (BOOL)_hasMultilineSubtitle
{
  return (*(_DWORD *)&self->_flags & 0x18000) == 0
      && -[NSAttributedString length](self->_attributedSubtitle, "length") != 0;
}

- (id)_resolvedTitle
{
  return self->_resolvedTitle;
}

- (id)_resolvedSubtitle
{
  return self->_resolvedSubtitle;
}

- (BOOL)showsActivityIndicator
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (id)_resolvedIndicator
{
  int v2;
  const __CFString *v3;
  void *v4;

  v2 = (*(_DWORD *)&self->_flags >> 22) & 3;
  if (v2 == 2)
  {
    v3 = CFSTR("chevron.up.chevron.down");
  }
  else
  {
    if (v2 != 3)
    {
      v4 = 0;
      return v4;
    }
    v3 = CFSTR("chevron.down");
  }
  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (id)_resolvedImage
{
  return self->_image;
}

- (NSDirectionalEdgeInsets)contentInsets
{
  void *v3;
  uint64_t v4;
  double trailing;
  double bottom;
  double leading;
  double top;
  unint64_t flags;
  uint64_t v10;
  NSDirectionalEdgeInsets result;

  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    top = self->_contentInsets.top;
    leading = self->_contentInsets.leading;
    bottom = self->_contentInsets.bottom;
    trailing = self->_contentInsets.trailing;
  }
  else
  {
    -[UIButtonConfiguration _hasTitle](self, "_hasTitle");
    -[UIButtonConfiguration _hasSubtitle](self, "_hasSubtitle");
    -[UIButtonConfiguration _hasImage](self, "_hasImage");
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    trailing = 0.0;
    bottom = 0.0;
    leading = 0.0;
    top = 0.0;
    if (v4 != 6)
    {
      flags = self->_flags;
      v10 = (flags >> 4) & 3;
      bottom = dbl_186679E50[v10];
      trailing = (double)((flags >> 8) & 7)
               + (double)((flags >> 8) & 7)
               + dbl_186679E30[v10];
      leading = trailing;
      top = bottom;
    }
  }
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (NSDirectionalRectEdge)imagePlacement
{
  return self->_imagePlacement;
}

- (double)_resolvedImageReservation
{
  return self->_resolvedImageReservation;
}

- (BOOL)_isRoundButton
{
  _BOOL4 v3;

  if (self->_cornerStyle == 4
    && (*(_DWORD *)&self->_flags & 0xC00000) == 0x400000
    && !-[NSAttributedString length](self->_attributedTitle, "length")
    && !-[NSAttributedString length](self->_attributedSubtitle, "length"))
  {
    if (self->_image)
      LOBYTE(v3) = 1;
    else
      return (*(_BYTE *)&self->_flags >> 6) & 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)_hasOversizedTitle
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 4) & 1;
}

- (BOOL)_hasOversizedSubtitle
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 5) & 1;
}

- (id)_resolvedSymbolConfiguration
{
  return self->_resolvedSymbolConfig;
}

- (id)_resolvedImageColor
{
  return self->_resolvedImageColor;
}

- (NSLineBreakMode)titleLineBreakMode
{
  return ((unint64_t)self->_flags >> 11) & 7;
}

- (CGFloat)imagePadding
{
  return self->_imagePadding;
}

- (void)setImage:(UIImage *)image
{
  objc_storeStrong((id *)&self->_image, image);
}

- (void)setPreferredSymbolConfigurationForImage:(UIImageSymbolConfiguration *)preferredSymbolConfigurationForImage
{
  objc_setProperty_nonatomic_copy(self, a2, preferredSymbolConfigurationForImage, 152);
}

- (void)setBaseForegroundColor:(UIColor *)baseForegroundColor
{
  objc_storeStrong((id *)&self->_baseForegroundColor, baseForegroundColor);
}

- (void)setTitle:(NSString *)title
{
  void *v4;
  NSString *v5;

  v5 = title;
  if (v5)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v5);
    -[UIButtonConfiguration setAttributedTitle:](self, "setAttributedTitle:", v4);

  }
  else
  {
    -[UIButtonConfiguration setAttributedTitle:](self, "setAttributedTitle:", 0);
  }

}

- (void)setAttributedTitle:(NSAttributedString *)attributedTitle
{
  NSAttributedString *v4;
  NSAttributedString *v5;
  NSAttributedString *v6;
  char v7;
  NSAttributedString *v8;
  NSAttributedString *resolvedTitle;
  NSAttributedString *v10;
  NSAttributedString *v11;
  NSAttributedString *v12;

  v4 = attributedTitle;
  v5 = self->_attributedTitle;
  v6 = v4;
  v12 = v6;
  if (v5 == v6)
  {

    resolvedTitle = v12;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSAttributedString isEqual:](v5, "isEqual:", v6);

      v8 = v12;
      if ((v7 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

      v8 = v12;
    }
    v10 = (NSAttributedString *)-[NSAttributedString copy](v8, "copy");
    v11 = self->_attributedTitle;
    self->_attributedTitle = v10;

    resolvedTitle = self->_resolvedTitle;
    self->_resolvedTitle = 0;
  }

  v8 = v12;
LABEL_10:

}

- (id)_resolvedIndicatorSymbolConfiguration
{
  return self->_resolvedIndicatorSymbolConfig;
}

- (id)_resolvedIndicatorColor
{
  return self->_resolvedIndicatorColor;
}

- (BOOL)_hasSymbolImage
{
  UIImage *image;

  image = self->_image;
  if (image)
    LOBYTE(image) = -[UIImage isSymbolImage](image, "isSymbolImage");
  return (char)image;
}

- (void)setImagePadding:(CGFloat)imagePadding
{
  self->_imagePadding = imagePadding;
}

- (void)setTitlePadding:(CGFloat)titlePadding
{
  self->_titlePadding = titlePadding;
}

- (void)setTitleLineBreakMode:(NSLineBreakMode)titleLineBreakMode
{
  self->_flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&self->_flags & 0xFFFFC7FF | ((titleLineBreakMode & 7) << 11));
}

- (void)setImagePlacement:(NSDirectionalRectEdge)imagePlacement
{
  self->_imagePlacement = imagePlacement;
}

+ (UIButtonConfiguration)plainButtonConfiguration
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  +[_UIButtonConfigurationStyleBehaviors plainBehaviors:]((uint64_t)_UIButtonConfigurationStyleBehaviors, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "_initWithBehaviors:", v3);

  return (UIButtonConfiguration *)v4;
}

- (id)_initWithBehaviors:(id)a3
{
  _QWORD *v5;
  UIButtonConfiguration *v6;
  UIButtonConfiguration *v7;
  uint64_t v8;
  UIBackgroundConfiguration *background;
  int64_t v10;
  void *v11;
  int v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIButtonConfiguration;
  v6 = -[UIButtonConfiguration init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_behaviors, a3);
    +[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration");
    v8 = objc_claimAutoreleasedReturnValue();
    background = v7->_background;
    v7->_background = (UIBackgroundConfiguration *)v8;

    -[UIBackgroundConfiguration _setCornerRadius:](v7->_background, "_setCornerRadius:", 5.95);
    if (v5)
      v10 = v5[8];
    else
      v10 = 0;
    v7->_cornerStyle = v10;
    +[UIColor clearColor](UIColor, "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBackgroundConfiguration setStrokeColor:](v7->_background, "setStrokeColor:", v11);

    -[UIBackgroundConfiguration setStrokeWidth:](v7->_background, "setStrokeWidth:", 1.0);
    v7->_imagePlacement = 2;
    v7->_titlePadding = 1.0;
    if (v5)
      v12 = (v5[6] != -1) << 17;
    else
      v12 = 0x20000;
    v7->_flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&v7->_flags & 0xFFFDFFFF | v12);
  }

  return v7;
}

- (void)setButtonSize:(UIButtonConfigurationSize)buttonSize
{
  unint64_t flags;
  NSAttributedString *resolvedTitle;
  NSAttributedString *resolvedSubtitle;
  UIBackgroundConfiguration *background;
  double v9;

  flags = self->_flags;
  if (((flags >> 4) & 3) != buttonSize)
  {
    self->_flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(flags & 0xFFFFFFCF | (16 * (buttonSize & 3)));
    resolvedTitle = self->_resolvedTitle;
    self->_resolvedTitle = 0;

    resolvedSubtitle = self->_resolvedSubtitle;
    self->_resolvedSubtitle = 0;

    background = self->_background;
    if (!background || (*(_WORD *)&background->_configurationFlags & 2) == 0)
    {
      if ((unint64_t)(buttonSize - 1) > 2)
        v9 = 5.95;
      else
        v9 = dbl_186679E18[buttonSize - 1];
      -[UIBackgroundConfiguration _setCornerRadius:](background, "_setCornerRadius:", v9);
    }
  }
}

- (void)setTitleAlignment:(UIButtonConfigurationTitleAlignment)titleAlignment
{
  self->_flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&self->_flags & 0xFCFFFFFF | ((titleAlignment & 3) << 24));
}

- (void)setMacIdiomStyle:(UIButtonConfigurationMacIdiomStyle)macIdiomStyle
{
  self->_flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&self->_flags & 0xFFFFFFF0 | macIdiomStyle & 0xF);
}

- (void)_setAlwaysApplyTitleAlignment:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&self->_flags & 0xFBFFFFFF | v3);
}

- (UIButtonConfiguration)updatedConfigurationForButton:(UIButton *)button
{
  UIButton *v4;
  void *v5;

  v4 = button;
  v5 = (void *)-[UIButtonConfiguration copy](self, "copy");
  objc_msgSend(v5, "_resolveValuesWithButton:", v4);

  return (UIButtonConfiguration *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  _UIButtonConfigurationCopy(v4, self, 1, 1);
  return v4;
}

- (int64_t)_resolvedTitleAlignment
{
  _BOOL4 v3;
  _BOOL4 v4;
  UIImage *image;
  $79A7E1F5F387068245F5C9CFF36D1F58 flags;
  int v7;
  unint64_t imagePlacement;
  int v9;

  v3 = -[UIButtonConfiguration _hasTitle](self, "_hasTitle");
  v4 = -[UIButtonConfiguration _hasSubtitle](self, "_hasSubtitle");
  if (v3 || v4)
  {
    flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x3000000) != 0)
    {
      if (v3 && v4)
        v7 = HIBYTE(*(unsigned int *)&flags) & 3;
      else
        v7 = 0;
      if ((*(_DWORD *)&flags & 0x4000000) != 0)
        LODWORD(image) = HIBYTE(*(unsigned int *)&flags) & 3;
      else
        LODWORD(image) = v7;
    }
    else if ((*(_DWORD *)&flags & 0x4000000) != 0 || (LODWORD(image) = v3 && v4) != 0)
    {
      image = self->_image;
      if (image)
      {
        imagePlacement = self->_imagePlacement;
        if (imagePlacement == 8)
          v9 = 3;
        else
          v9 = 2;
        if (imagePlacement == 2)
          LODWORD(image) = 1;
        else
          LODWORD(image) = v9;
      }
    }
  }
  else
  {
    LODWORD(image) = 0;
  }
  return image;
}

- (void)_resolveValuesWithButton:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  UIImage *image;
  UIImageSymbolConfiguration *preferredSymbolConfigurationForImage;
  unsigned int v15;
  uint64_t v16;
  _BOOL4 v17;
  _BOOL4 v18;
  _BOOL4 v19;
  $79A7E1F5F387068245F5C9CFF36D1F58 flags;
  $79A7E1F5F387068245F5C9CFF36D1F58 v21;
  int v22;
  unsigned int v23;
  uint64_t v24;
  __CFString *v25;
  unint64_t v26;
  __CFString *v27;
  __CFString *v28;
  id v29;
  void *v30;
  int64_t v31;
  int64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSAttributedString *v39;
  NSAttributedString *resolvedTitle;
  void *v41;
  NSAttributedString *v42;
  NSAttributedString *resolvedSubtitle;
  void *v44;
  NSUInteger v45;
  __CFString *v46;
  UIImageSymbolConfiguration *v47;
  UIImageSymbolConfiguration *v48;
  void *resolvedSymbolConfig;
  UIImageSymbolConfiguration **p_resolvedSymbolConfig;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  UIImageSymbolConfiguration *v55;
  UIImageSymbolConfiguration *v56;
  uint64_t v57;
  void *v58;
  BOOL v59;
  UIImageSymbolConfiguration *v60;
  UIImageSymbolConfiguration *v61;
  void *v62;
  uint64_t v63;
  UIImageSymbolConfiguration *v64;
  void *v65;
  double v66;
  $79A7E1F5F387068245F5C9CFF36D1F58 v67;
  void (**imageColorTransformer)(id, void *);
  UIColor *v69;
  double v70;
  void *resolvedImageColor;
  void (**activityIndicatorColorTransformer)(id, void *);
  UIColor *v73;
  UIColor *resolvedActivityIndicatorColor;
  UIColor *v75;
  __CFString *v76;
  __CFString *v77;
  void (**indicatorColorTransformer)(id, void *);
  UIColor *v79;
  UIColor *resolvedIndicatorColor;
  UIImageSymbolConfiguration *v81;
  void *resolvedIndicatorSymbolConfig;
  __CFString *v83;
  UIImageSymbolConfiguration *v84;
  UIImageSymbolConfiguration *v85;
  UIImageSymbolConfiguration *v86;
  UIImageSymbolConfiguration *v87;
  UIBackgroundConfiguration *background;
  void *v89;
  const char *v90;
  void *v91;
  UIBackgroundConfiguration *v92;
  UIBackgroundConfiguration *v93;
  void *v94;
  unint64_t v95;
  NSObject *v96;
  unint64_t v97;
  NSObject *v98;
  NSObject *v99;
  NSObject *v100;
  _BOOL4 v101;
  uint64_t v102;
  _BOOL4 v103;
  _BOOL4 v104;
  uint64_t v105;
  void *v106;
  void *v107;
  __CFString *v108;
  __CFString *v109;
  __CFString *v110;
  __CFString *v111;
  void *v112;
  id v113;
  id v114;
  id v115;
  id v116;
  uint8_t buf[4];
  UIButtonConfiguration *v118;
  __int16 v119;
  void *v120;
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _UIButtonStatesFromButton(v4);
  v102 = objc_msgSend(v4, "role");
  objc_msgSend(v4, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredContentSizeCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  buf[0] = 0;
  v9 = _UIContentSizeCategoryFromStringInternal(v8, buf);

  if (v9 >= 65543)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v99 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        v118 = (UIButtonConfiguration *)v9;
        _os_log_fault_impl(&dword_185066000, v99, OS_LOG_TYPE_FAULT, "Unexpectedly large contentSizeCategory %lu while updating button configuration. The button this configuration is applied to will likely look wrong.", buf, 0xCu);
      }

    }
    else
    {
      v95 = _MergedGlobals_988;
      if (!_MergedGlobals_988)
      {
        v95 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v95, (unint64_t *)&_MergedGlobals_988);
      }
      v96 = *(NSObject **)(v95 + 8);
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v118 = (UIButtonConfiguration *)v9;
        _os_log_impl(&dword_185066000, v96, OS_LOG_TYPE_ERROR, "Unexpectedly large contentSizeCategory %lu while updating button configuration. The button this configuration is applied to will likely look wrong.", buf, 0xCu);
      }
    }
  }
  v10 = (((_WORD)v9 << 8) + 256) & 0x700;
  if (v9 < 0x10000)
    v10 = 0;
  self->_flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&self->_flags & 0xFFFFF8FF | v10);
  -[_UIButtonConfigurationStyleBehaviors behaviorForState:](self->_behaviors, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "_wantsAccessibilityUnderline") & 1) == 0)
  {
    -[_UIButtonConfigurationStyleBehaviors effectiveBehaviorWithoutButtonShapes](v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  image = self->_image;
  if (image && -[UIImage isSymbolImage](image, "isSymbolImage"))
  {
    preferredSymbolConfigurationForImage = self->_preferredSymbolConfigurationForImage;
    if (preferredSymbolConfigurationForImage)
      LODWORD(preferredSymbolConfigurationForImage) = (*(_BYTE *)&preferredSymbolConfigurationForImage->_configFlags & 1) != 0
                                                   || preferredSymbolConfigurationForImage->_textStyle != 0;
    v15 = preferredSymbolConfigurationForImage ^ 1;
  }
  else
  {
    v15 = 0;
  }
  -[_UIButtonConfigurationStyleBehaviors effectiveForegroundColorFromBaseColor:baseBackgroundColor:state:traitCollection:]((uint64_t)v11, self->_baseForegroundColor, self->_baseBackgroundColor, v5, v6);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = -[UIButtonConfiguration _hasTitle](self, "_hasTitle");
  v18 = -[UIButtonConfiguration _hasSubtitle](self, "_hasSubtitle");
  v19 = -[UIButtonConfiguration _hasImage](self, "_hasImage");
  flags = self->_flags;
  v105 = v5;
  v107 = (void *)v16;
  v103 = v19;
  if (((*(unsigned int *)&flags >> 18) & 3) == 0)
  {
    if (_UIButtonCanInferIndicator()
      && objc_msgSend(v4, "_menuEnabled")
      && objc_msgSend(v4, "showsMenuAsPrimaryAction"))
    {
      v22 = objc_msgSend(v4, "changesSelectionAsPrimaryAction");
      v23 = *(_DWORD *)&self->_flags & 0xFF3FFFFF;
      if (v22)
      {
        v21 = ($79A7E1F5F387068245F5C9CFF36D1F58)(v23 | 0x800000);
        goto LABEL_23;
      }
    }
    else
    {
      v23 = *(_DWORD *)&self->_flags & 0xFF3FFFFF;
    }
    v21 = ($79A7E1F5F387068245F5C9CFF36D1F58)(v23 | 0x400000);
    goto LABEL_23;
  }
  v21 = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&flags & 0xFF3FFFFF | (((*(unsigned int *)&flags >> 18) & 3) << 22));
LABEL_23:
  self->_flags = v21;
  v24 = v17 | v18;
  v101 = v18;
  v104 = v17;
  if (!v17 && !v18 && (*(_BYTE *)&v21 & 0x40) == 0)
  {
    v25 = 0;
    v108 = 0;
    v109 = 0;
    v112 = 0;
    v106 = 0;
    goto LABEL_30;
  }
  v115 = 0;
  v116 = 0;
  v114 = 0;
  _getDefaultTitleAndSubtitleFontStylesForButtonSize((*(unsigned int *)&v21 >> 4) & 3, &v116, &v115, &v114, v6);
  v25 = (__CFString *)v116;
  v109 = (__CFString *)v115;
  v108 = (__CFString *)v114;
  if (v17 || (*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    if (v102 == 1)
      v28 = v108;
    else
      v28 = v25;
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:compatibleWithTraitCollection:", v28, v6);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
LABEL_29:
      v106 = 0;
      if (!(_DWORD)v24)
        goto LABEL_30;
      goto LABEL_37;
    }
  }
  else
  {
    v112 = 0;
    if (!v18)
      goto LABEL_29;
  }
  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:compatibleWithTraitCollection:", v109, v6);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  if (!(_DWORD)v24)
  {
LABEL_30:
    if (v15)
    {
      v26 = ((unint64_t)self->_flags >> 4) & 3;
      v113 = 0;
      _getDefaultTitleAndSubtitleFontStylesForButtonSize(v26, &v113, 0, 0, v6);
      v27 = (__CFString *)v113;
    }
    else
    {
      v27 = 0;
    }
    goto LABEL_62;
  }
LABEL_37:
  v110 = v25;
  v29 = v107;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v100 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v118 = self;
        v119 = 2112;
        v120 = v11;
        _os_log_fault_impl(&dword_185066000, v100, OS_LOG_TYPE_FAULT, "textColor is nil resolving configuration (%@) effectiveBehavior (%@)", buf, 0x16u);
      }

    }
    else
    {
      v97 = qword_1ECD7D2A0;
      if (!qword_1ECD7D2A0)
      {
        v97 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v97, (unint64_t *)&qword_1ECD7D2A0);
      }
      v98 = *(NSObject **)(v97 + 8);
      if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v118 = self;
        v119 = 2112;
        v120 = v11;
        _os_log_impl(&dword_185066000, v98, OS_LOG_TYPE_ERROR, "textColor is nil resolving configuration (%@) effectiveBehavior (%@)", buf, 0x16u);
      }
    }
  }
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, *(_QWORD *)off_1E1678D98);
  v31 = -[UIButtonConfiguration _resolvedTitleAlignment](self, "_resolvedTitleAlignment");
  if (v31)
  {
    v32 = v31;
    v33 = (void *)objc_opt_new();
    v34 = objc_msgSend(v6, "layoutDirection");
    v35 = 1;
    v36 = 4;
    if (v32 == 1)
      v36 = 2 * (v34 == 1);
    if (v32 != 2)
      v35 = v36;
    if (v32 == 3)
      v37 = 2 * (v34 != 1);
    else
      v37 = v35;
    objc_msgSend(v33, "setAlignment:", v37);
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v33, *(_QWORD *)off_1E1678F98);

  }
  +[UILabel _tooBigChars]();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSAttributedString length](self->_attributedTitle, "length"))
  {
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v112, *(_QWORD *)off_1E1678D90);
    _UIButtonUpdateStringAttributes(self->_attributedTitle, v30, self->_titleTextAttributesTransformer, v6);
    v39 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    resolvedTitle = self->_resolvedTitle;
    self->_resolvedTitle = v39;

    -[NSAttributedString string](self->_resolvedTitle, "string");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    self->_flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&self->_flags & 0xFFEFFFFF | ((objc_msgSend(v41, "rangeOfCharacterFromSet:", v38) != 0x7FFFFFFFFFFFFFFFLL) << 20));

  }
  else
  {
    *(_DWORD *)&self->_flags &= ~0x100000u;
  }
  if (-[NSAttributedString length](self->_attributedSubtitle, "length"))
  {
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v106, *(_QWORD *)off_1E1678D90);
    _UIButtonUpdateStringAttributes(self->_attributedSubtitle, v30, self->_subtitleTextAttributesTransformer, v6);
    v42 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    resolvedSubtitle = self->_resolvedSubtitle;
    self->_resolvedSubtitle = v42;

    -[NSAttributedString string](self->_resolvedSubtitle, "string");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    self->_flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&self->_flags & 0xFFDFFFFF | ((objc_msgSend(v44, "rangeOfCharacterFromSet:", v38) != 0x7FFFFFFFFFFFFFFFLL) << 21));

  }
  else
  {
    *(_DWORD *)&self->_flags &= ~0x200000u;
  }
  if (v15)
  {
    v45 = -[NSAttributedString length](self->_attributedTitle, "length");
    v46 = v110;
    if (v102 == 1)
      v46 = v108;
    if (!v45)
      v46 = v109;
    v27 = v46;
  }
  else
  {
    v27 = 0;
  }

  v25 = v110;
LABEL_62:
  v111 = v25;
  v47 = self->_preferredSymbolConfigurationForImage;
  if (v47)
  {
    v48 = v47;
    p_resolvedSymbolConfig = &self->_resolvedSymbolConfig;
    resolvedSymbolConfig = self->_resolvedSymbolConfig;
    self->_resolvedSymbolConfig = v48;
  }
  else
  {
    +[UIImageSymbolConfiguration unspecifiedConfiguration](UIImageSymbolConfiguration, "unspecifiedConfiguration");
    resolvedSymbolConfig = (void *)objc_claimAutoreleasedReturnValue();
    p_resolvedSymbolConfig = &self->_resolvedSymbolConfig;
    objc_storeStrong((id *)&self->_resolvedSymbolConfig, resolvedSymbolConfig);
  }

  if (objc_msgSend(v6, "userInterfaceIdiom") != 6)
  {
    v59 = -[UIImageSymbolConfiguration _hasSpecifiedScale](self->_preferredSymbolConfigurationForImage, "_hasSpecifiedScale");
    if (v15)
    {
      v60 = *p_resolvedSymbolConfig;
      if (v59)
        +[UIImageSymbolConfiguration configurationWithTextStyle:](UIImageSymbolConfiguration, "configurationWithTextStyle:", v27);
      else
        +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", v27, 3);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageConfiguration configurationByApplyingConfiguration:](v60, "configurationByApplyingConfiguration:", v62);
      v63 = objc_claimAutoreleasedReturnValue();
      v57 = v105;
      v58 = v107;
    }
    else
    {
      v57 = v105;
      v58 = v107;
      if (v59)
        goto LABEL_77;
      v61 = *p_resolvedSymbolConfig;
      +[UIImageSymbolConfiguration configurationWithScale:](UIImageSymbolConfiguration, "configurationWithScale:", 3);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageConfiguration configurationByApplyingConfiguration:](v61, "configurationByApplyingConfiguration:", v62);
      v63 = objc_claimAutoreleasedReturnValue();
    }
    v64 = *p_resolvedSymbolConfig;
    *p_resolvedSymbolConfig = (UIImageSymbolConfiguration *)v63;

LABEL_77:
    if (*p_resolvedSymbolConfig)
    {
      +[UIFontMetrics defaultMetrics](UIFontMetrics, "defaultMetrics");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "scaledValueForValue:compatibleWithTraitCollection:", v6, self->_imageReservation);
      self->_resolvedImageReservation = v66;

    }
    else if (self->_image)
    {
      self->_resolvedImageReservation = self->_imageReservation;
    }
    else
    {
      self->_resolvedImageReservation = 0.0;
    }
    goto LABEL_82;
  }
  if (v15)
  {
    -[UIButtonConfiguration symbolStyleForSize:hasText:](self, "symbolStyleForSize:hasText:", ((unint64_t)self->_flags >> 4) & 3, v24);
    v51 = objc_claimAutoreleasedReturnValue();

    +[UIImageSymbolConfiguration configurationWithTextStyle:](UIImageSymbolConfiguration, "configurationWithTextStyle:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImageSymbolConfiguration configurationWithWeight:](UIImageSymbolConfiguration, "configurationWithWeight:", 5);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageConfiguration configurationByApplyingConfiguration:](self->_resolvedSymbolConfig, "configurationByApplyingConfiguration:", v52);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "configurationByApplyingConfiguration:", v53);
    v55 = (UIImageSymbolConfiguration *)objc_claimAutoreleasedReturnValue();
    v56 = self->_resolvedSymbolConfig;
    self->_resolvedSymbolConfig = v55;

    v27 = (__CFString *)v51;
  }
  v57 = v105;
  v58 = v107;
LABEL_82:
  v67 = self->_flags;
  if ((*(_BYTE *)&v67 & 0x40) != 0)
  {
    objc_msgSend(v112, "lineHeight");
    self->_resolvedActivityIndicatorSize = v70;
    -[_UIButtonConfigurationStyleBehaviors effectiveActivityIndicatorColorFromEffectiveColor:state:]((uint64_t)self->_behaviors, v58, v57);
    resolvedImageColor = (void *)objc_claimAutoreleasedReturnValue();
    activityIndicatorColorTransformer = (void (**)(id, void *))self->_activityIndicatorColorTransformer;
    if (activityIndicatorColorTransformer)
    {
      activityIndicatorColorTransformer[2](activityIndicatorColorTransformer, resolvedImageColor);
      v73 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v73 = resolvedImageColor;
    }
    resolvedActivityIndicatorColor = self->_resolvedActivityIndicatorColor;
    self->_resolvedActivityIndicatorColor = v73;

  }
  else
  {
    if (!v103)
      goto LABEL_93;
    imageColorTransformer = (void (**)(id, void *))self->_imageColorTransformer;
    if (imageColorTransformer)
    {
      imageColorTransformer[2](imageColorTransformer, v58);
      v69 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v69 = v58;
    }
    resolvedImageColor = self->_resolvedImageColor;
    self->_resolvedImageColor = v69;
  }

  v67 = self->_flags;
LABEL_93:
  if ((*(_DWORD *)&v67 & 0xC00000) != 0x400000)
  {
    indicatorColorTransformer = (void (**)(id, void *))self->_indicatorColorTransformer;
    if (indicatorColorTransformer)
    {
      indicatorColorTransformer[2](indicatorColorTransformer, v58);
      v79 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v79 = v58;
    }
    resolvedIndicatorColor = self->_resolvedIndicatorColor;
    self->_resolvedIndicatorColor = v79;

    v76 = CFSTR("UICTFontTextStyleBody");
    if (v104)
    {
      v77 = v111;
      +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", v111, 1);
      v81 = (UIImageSymbolConfiguration *)objc_claimAutoreleasedReturnValue();
      resolvedIndicatorSymbolConfig = self->_resolvedIndicatorSymbolConfig;
      self->_resolvedIndicatorSymbolConfig = v81;
LABEL_107:

      goto LABEL_108;
    }
    if (v101)
    {
      v83 = v109;
    }
    else
    {
      v84 = *p_resolvedSymbolConfig;
      if (v84)
      {
        +[UIImageSymbolConfiguration configurationWithScale:](UIImageSymbolConfiguration, "configurationWithScale:", 1);
        resolvedIndicatorSymbolConfig = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageConfiguration configurationByApplyingConfiguration:](v84, "configurationByApplyingConfiguration:", resolvedIndicatorSymbolConfig);
        v85 = (UIImageSymbolConfiguration *)objc_claimAutoreleasedReturnValue();
        v86 = self->_resolvedIndicatorSymbolConfig;
        self->_resolvedIndicatorSymbolConfig = v85;

LABEL_106:
        v77 = v111;
        goto LABEL_107;
      }
      v83 = v76;
    }
    +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", v83, 1);
    v87 = (UIImageSymbolConfiguration *)objc_claimAutoreleasedReturnValue();
    resolvedIndicatorSymbolConfig = self->_resolvedIndicatorSymbolConfig;
    self->_resolvedIndicatorSymbolConfig = v87;
    goto LABEL_106;
  }
  v75 = self->_resolvedIndicatorColor;
  self->_resolvedIndicatorColor = 0;

  v76 = (__CFString *)self->_resolvedIndicatorSymbolConfig;
  self->_resolvedIndicatorSymbolConfig = 0;
  v77 = v111;
LABEL_108:

  background = self->_background;
  if ((!background || (*(_WORD *)&background->_configurationFlags & 0x10) == 0)
    && (-[_UIButtonConfigurationStyleBehaviors effectiveBackgroundColorFromBaseColor:state:traitCollection:]((uint64_t)v11, self->_baseBackgroundColor, v57, v6), v89 = (void *)objc_claimAutoreleasedReturnValue(), -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)self->_background, v89), v89, (background = self->_background) == 0)|| (*(_WORD *)&background->_configurationFlags & 0x40) == 0)
  {
    -[_UIButtonConfigurationStyleBehaviors effectiveBackgroundVisualEffectFromBaseColor:state:traitCollection:]((uint64_t)v11, self->_baseBackgroundColor, v57, v6);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = self->_background;
    if (v92)
      objc_setProperty_nonatomic_copy(v92, v90, v91, 56);

  }
  if (objc_msgSend(v6, "userInterfaceIdiom") == 6)
  {
    v93 = self->_background;
    if (!v93 || (*(_WORD *)&v93->_configurationFlags & 0x80) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UIVisualEffectViewCaptureGroupName(%p)"), v4);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIBackgroundConfiguration __setVisualEffectGroupName:](self->_background, "__setVisualEffectGroupName:", v94);

    }
  }
  self->_resolvedIdiom = objc_msgSend(v6, "userInterfaceIdiom");

}

- (BOOL)_hasTitle
{
  return -[NSAttributedString length](self->_attributedTitle, "length") != 0;
}

- (BOOL)_hasSubtitle
{
  return -[NSAttributedString length](self->_attributedSubtitle, "length") != 0;
}

- (BOOL)_hasImage
{
  return self->_image != 0;
}

- (void)setSubtitleLineBreakMode:(NSLineBreakMode)subtitleLineBreakMode
{
  self->_flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&self->_flags & 0xFFFE3FFF | ((subtitleLineBreakMode & 7) << 14));
}

- (void)setBaseBackgroundColor:(UIColor *)baseBackgroundColor
{
  objc_storeStrong((id *)&self->_baseBackgroundColor, baseBackgroundColor);
}

- (void)setIndicatorColorTransformer:(UIConfigurationColorTransformer)indicatorColorTransformer
{
  objc_setProperty_nonatomic_copy(self, a2, indicatorColorTransformer, 200);
}

- (void)setIndicator:(UIButtonConfigurationIndicator)indicator
{
  self->_flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&self->_flags & 0xFFF3FFFF | ((indicator & 3) << 18));
}

- (BOOL)isEqual:(id)a3
{
  UIButtonConfiguration *v4;
  UIButtonConfiguration *v5;
  UIButtonConfiguration *v6;
  $79A7E1F5F387068245F5C9CFF36D1F58 flags;
  $79A7E1F5F387068245F5C9CFF36D1F58 v8;
  int v9;
  char v10;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;

  v4 = (UIButtonConfiguration *)a3;
  if (v4 == self)
  {
    v10 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
    goto LABEL_10;
  }
  v5 = v4;
  v6 = v5;
  if (self->_behaviors != v5->_behaviors)
    goto LABEL_6;
  if (self->_cornerStyle != v5->_cornerStyle)
    goto LABEL_6;
  flags = self->_flags;
  v8 = v5->_flags;
  v9 = *(_DWORD *)&v8 ^ *(_DWORD *)&flags;
  if (((*(_DWORD *)&v8 ^ *(_DWORD *)&flags) & 0x7F) != 0)
    goto LABEL_6;
  if ((*(_DWORD *)&flags & *(_DWORD *)&v8 & 0x80) != 0)
  {
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_contentInsets.top, *(float64x2_t *)&v5->_contentInsets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_contentInsets.bottom, *(float64x2_t *)&v5->_contentInsets.bottom))), 0xFuLL))) & 1) == 0)goto LABEL_6;
  }
  else if ((v9 & 0x780) != 0)
  {
    goto LABEL_6;
  }
  if ((v9 & 0xDF800) == 0
    && self->_imagePlacement == v5->_imagePlacement
    && self->_imagePadding == v5->_imagePadding
    && self->_imageReservation == v5->_imageReservation)
  {
    v10 = 0;
    if ((v9 & 0x7000000) != 0 || self->_titlePadding != v5->_titlePadding)
      goto LABEL_7;
    if (UIEqual(self->_background, v5->_background))
    {
      if (UIEqual(self->_baseForegroundColor, v6->_baseForegroundColor))
      {
        if (UIEqual(self->_baseBackgroundColor, v6->_baseBackgroundColor))
        {
          if (UIEqual(self->_image, v6->_image))
          {
            v12 = _Block_copy(self->_imageColorTransformer);
            v13 = _Block_copy(v6->_imageColorTransformer);
            v14 = UIEqual(v12, v13);

            if (v14)
            {
              if (UIEqual(self->_preferredSymbolConfigurationForImage, v6->_preferredSymbolConfigurationForImage))
              {
                v15 = _Block_copy(self->_indicatorColorTransformer);
                v16 = _Block_copy(v6->_indicatorColorTransformer);
                v17 = UIEqual(v15, v16);

                if (v17)
                {
                  v18 = _Block_copy(self->_activityIndicatorColorTransformer);
                  v19 = _Block_copy(v6->_activityIndicatorColorTransformer);
                  v20 = UIEqual(v18, v19);

                  if (v20)
                  {
                    if (UIEqual(self->_attributedTitle, v6->_attributedTitle))
                    {
                      v21 = _Block_copy(self->_titleTextAttributesTransformer);
                      v22 = _Block_copy(v6->_titleTextAttributesTransformer);
                      v23 = UIEqual(v21, v22);

                      if (v23)
                      {
                        if (UIEqual(self->_attributedSubtitle, v6->_attributedSubtitle))
                        {
                          v24 = _Block_copy(self->_subtitleTextAttributesTransformer);
                          v25 = _Block_copy(v6->_subtitleTextAttributesTransformer);
                          v10 = UIEqual(v24, v25);

                          goto LABEL_7;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_6:
  v10 = 0;
LABEL_7:

LABEL_10:
  return v10;
}

- (UIImage)image
{
  return self->_image;
}

+ (UIButtonConfiguration)borderlessButtonConfiguration
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  +[_UIButtonConfigurationStyleBehaviors plainBehaviors:]((uint64_t)_UIButtonConfigurationStyleBehaviors, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "_initWithBehaviors:", v3);

  return (UIButtonConfiguration *)v4;
}

+ (UIButtonConfiguration)grayButtonConfiguration
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  +[_UIButtonConfigurationStyleBehaviors grayBehaviors]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "_initWithBehaviors:", v3);

  return (UIButtonConfiguration *)v4;
}

+ (UIButtonConfiguration)filledButtonConfiguration
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  +[_UIButtonConfigurationStyleBehaviors fillBehaviors]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "_initWithBehaviors:", v3);

  return (UIButtonConfiguration *)v4;
}

+ (UIButtonConfiguration)tintedButtonConfiguration
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  +[_UIButtonConfigurationStyleBehaviors tintBehaviors]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "_initWithBehaviors:", v3);

  return (UIButtonConfiguration *)v4;
}

- (void)setBackground:(UIBackgroundConfiguration *)background
{
  objc_storeStrong((id *)&self->_background, background);
}

+ (UIButtonConfiguration)borderedButtonConfiguration
{
  void *v3;
  uint64_t v4;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 6)
    objc_msgSend(a1, "filledButtonConfiguration");
  else
    objc_msgSend(a1, "grayButtonConfiguration");
  return (UIButtonConfiguration *)(id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIButtonConfiguration)initWithCoder:(id)a3
{
  id v4;
  UIButtonConfiguration *v5;
  uint64_t v6;
  _UIButtonConfigurationStyleBehaviors *behaviors;
  uint64_t v8;
  UIBackgroundConfiguration *background;
  uint64_t v10;
  UIColor *baseBackgroundColor;
  uint64_t v12;
  UIColor *baseForegroundColor;
  uint64_t v14;
  UIImage *image;
  uint64_t v16;
  UIImageSymbolConfiguration *preferredSymbolConfigurationForImage;
  int v18;
  uint64_t v19;
  NSAttributedString *attributedTitle;
  uint64_t v21;
  NSAttributedString *attributedSubtitle;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  float v27;
  float v28;
  int v29;
  _UIButtonConfigurationStyleBehaviors *v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)UIButtonConfiguration;
  v5 = -[UIButtonConfiguration init](&v32, sel_init);
  if (v5)
  {
    +[_UIButtonConfigurationStyleBehaviors behaviorForStyle:]((uint64_t)_UIButtonConfigurationStyleBehaviors, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIButtonConfigurationButtonStyle")));
    v6 = objc_claimAutoreleasedReturnValue();
    behaviors = v5->_behaviors;
    v5->_behaviors = (_UIButtonConfigurationStyleBehaviors *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIButtonConfigurationBackground"));
    v8 = objc_claimAutoreleasedReturnValue();
    background = v5->_background;
    v5->_background = (UIBackgroundConfiguration *)v8;

    v5->_cornerStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIButtonConfigurationCornerStyle"));
    v5->_flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&v5->_flags & 0xFFFFFFCF | (16
                                                                                          * (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIButtonConfigurationButtonSize")) & 3)));
    v5->_flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&v5->_flags & 0xFFFFFFF0 | objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIButtonConfigurationMacIdiomStyle")) & 0xF);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIButtonConfigurationBaseBackgroundColor"));
    v10 = objc_claimAutoreleasedReturnValue();
    baseBackgroundColor = v5->_baseBackgroundColor;
    v5->_baseBackgroundColor = (UIColor *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIButtonConfigurationBaseForegroundColor"));
    v12 = objc_claimAutoreleasedReturnValue();
    baseForegroundColor = v5->_baseForegroundColor;
    v5->_baseForegroundColor = (UIColor *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIButtonConfigurationImage"));
    v14 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (UIImage *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIButtonConfigurationPreferredSymbolConfigurationForImage"));
    v16 = objc_claimAutoreleasedReturnValue();
    preferredSymbolConfigurationForImage = v5->_preferredSymbolConfigurationForImage;
    v5->_preferredSymbolConfigurationForImage = (UIImageSymbolConfiguration *)v16;

    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIButtonConfigurationShowsActivityIndicator")))
      v18 = 64;
    else
      v18 = 0;
    v5->_flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&v5->_flags & 0xFFFFFFBF | v18);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIButtonConfigurationTitle"));
    v19 = objc_claimAutoreleasedReturnValue();
    attributedTitle = v5->_attributedTitle;
    v5->_attributedTitle = (NSAttributedString *)v19;

    v5->_flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&v5->_flags & 0xFFFFC7FF | ((objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIButtonConfigurationTitleLineBreakMode")) & 7) << 11));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIButtonConfigurationSubtitle"));
    v21 = objc_claimAutoreleasedReturnValue();
    attributedSubtitle = v5->_attributedSubtitle;
    v5->_attributedSubtitle = (NSAttributedString *)v21;

    v5->_flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&v5->_flags & 0xFFFE3FFF | ((objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIButtonConfigurationSubtitleLineBreakMode")) & 7) << 14));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIButtonConfigurationContentInset")))
    {
      objc_msgSend(v4, "decodeDirectionalEdgeInsetsForKey:", CFSTR("UIButtonConfigurationContentInset"));
      v5->_contentInsets.top = v23;
      v5->_contentInsets.leading = v24;
      v5->_contentInsets.bottom = v25;
      v5->_contentInsets.trailing = v26;
      *(_DWORD *)&v5->_flags |= 0x80u;
    }
    v5->_imagePlacement = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIButtonConfigurationImagePlacement"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UIButtonConfigurationImagePadding"));
    v5->_imagePadding = v27;
    v5->_flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&v5->_flags & 0xFFF3FFFF | ((objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIButtonConfigurationIndicator")) & 3) << 18));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("UIButtonConfigurationTitlePadding"));
    v5->_titlePadding = v28;
    v5->_flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&v5->_flags & 0xFCFFFFFF | ((objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIButtonConfigurationTitleAlignment")) & 3) << 24));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIButtonConfigurationAutomaticallyUpdateForSelection")))
    {
      if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIButtonConfigurationAutomaticallyUpdateForSelection")))v29 = 0x20000;
      else
        v29 = 0;
    }
    else
    {
      v30 = v5->_behaviors;
      if (v30)
        v29 = (v30->_selectionStyle != -1) << 17;
      else
        v29 = 0x20000;
    }
    v5->_flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&v5->_flags & 0xFFFDFFFF | v29);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _UIButtonConfigurationStyleBehaviors *behaviors;
  int64_t style;
  unint64_t v6;
  unint64_t v7;
  unint64_t flags;
  uint64_t v9;
  double imagePadding;
  double titlePadding;
  $79A7E1F5F387068245F5C9CFF36D1F58 v12;
  _UIButtonConfigurationStyleBehaviors *v13;
  id v14;

  v14 = a3;
  behaviors = self->_behaviors;
  if (behaviors)
    style = behaviors->_style;
  else
    style = 0;
  objc_msgSend(v14, "encodeInteger:forKey:", style, CFSTR("UIButtonConfigurationButtonStyle"));
  objc_msgSend(v14, "encodeObject:forKey:", self->_background, CFSTR("UIButtonConfigurationBackground"));
  objc_msgSend(v14, "encodeInteger:forKey:", self->_cornerStyle, CFSTR("UIButtonConfigurationCornerStyle"));
  objc_msgSend(v14, "encodeInteger:forKey:", ((unint64_t)self->_flags >> 4) & 3, CFSTR("UIButtonConfigurationButtonSize"));
  objc_msgSend(v14, "encodeInteger:forKey:", *(_DWORD *)&self->_flags & 0xFLL, CFSTR("UIButtonConfigurationMacIdiomStyle"));
  objc_msgSend(v14, "encodeObject:forKey:", self->_baseBackgroundColor, CFSTR("UIButtonConfigurationBaseBackgroundColor"));
  objc_msgSend(v14, "encodeObject:forKey:", self->_baseForegroundColor, CFSTR("UIButtonConfigurationBaseForegroundColor"));
  objc_msgSend(v14, "encodeObject:forKey:", self->_image, CFSTR("UIButtonConfigurationImage"));
  v6 = ((unint64_t)self->_flags >> 18) & 3;
  if ((_DWORD)v6)
    objc_msgSend(v14, "encodeInteger:forKey:", v6, CFSTR("UIButtonConfigurationIndicator"));
  objc_msgSend(v14, "encodeObject:forKey:", self->_preferredSymbolConfigurationForImage, CFSTR("UIButtonConfigurationPreferredSymbolConfigurationForImage"));
  objc_msgSend(v14, "encodeBool:forKey:", (*(_DWORD *)&self->_flags >> 6) & 1, CFSTR("UIButtonConfigurationShowsActivityIndicator"));
  objc_msgSend(v14, "encodeObject:forKey:", self->_attributedTitle, CFSTR("UIButtonConfigurationTitle"));
  v7 = ((unint64_t)self->_flags >> 11) & 7;
  if ((_DWORD)v7)
    objc_msgSend(v14, "encodeInteger:forKey:", v7, CFSTR("UIButtonConfigurationTitleLineBreakMode"));
  objc_msgSend(v14, "encodeObject:forKey:", self->_attributedSubtitle, CFSTR("UIButtonConfigurationSubtitle"));
  flags = self->_flags;
  v9 = (flags >> 14) & 7;
  if ((_DWORD)v9)
  {
    objc_msgSend(v14, "encodeInteger:forKey:", v9, CFSTR("UIButtonConfigurationSubtitleLineBreakMode"));
    LODWORD(flags) = self->_flags;
  }
  if ((flags & 0x80) != 0)
    objc_msgSend(v14, "encodeDirectionalEdgeInsets:forKey:", CFSTR("UIButtonConfigurationContentInset"), self->_contentInsets.top, self->_contentInsets.leading, self->_contentInsets.bottom, self->_contentInsets.trailing);
  objc_msgSend(v14, "encodeInteger:forKey:", self->_imagePlacement, CFSTR("UIButtonConfigurationImagePlacement"));
  imagePadding = self->_imagePadding;
  *(float *)&imagePadding = imagePadding;
  objc_msgSend(v14, "encodeFloat:forKey:", CFSTR("UIButtonConfigurationImagePadding"), imagePadding);
  titlePadding = self->_titlePadding;
  *(float *)&titlePadding = titlePadding;
  objc_msgSend(v14, "encodeFloat:forKey:", CFSTR("UIButtonConfigurationTitlePadding"), titlePadding);
  objc_msgSend(v14, "encodeInteger:forKey:", *((_BYTE *)&self->_flags + 3) & 3, CFSTR("UIButtonConfigurationTitleAlignment"));
  v12 = self->_flags;
  v13 = self->_behaviors;
  if (!v13)
  {
    if ((*(_DWORD *)&v12 & 0x20000) != 0)
      goto LABEL_14;
    goto LABEL_13;
  }
  if (((*(unsigned int *)&v12 >> 17) & 1) == (v13->_selectionStyle == -1))
LABEL_13:
    objc_msgSend(v14, "encodeBool:forKey:");
LABEL_14:

}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _UIButtonConfigurationStyleBehaviors *behaviors;

  v3 = -[UIImage hash](self->_image, "hash");
  v4 = -[NSAttributedString hash](self->_attributedTitle, "hash");
  v5 = -[NSAttributedString hash](self->_attributedSubtitle, "hash");
  behaviors = self->_behaviors;
  if (behaviors)
    behaviors = (_UIButtonConfigurationStyleBehaviors *)behaviors->_style;
  return (unint64_t)behaviors + 256 * (v4 ^ v3 ^ v5);
}

- (NSString)description
{
  void *v3;
  void *v4;
  _UIButtonConfigurationStyleBehaviors *behaviors;
  _UIButtonConfigurationStyleBehaviors *v6;
  $79A7E1F5F387068245F5C9CFF36D1F58 flags;
  unint64_t v8;
  NSAttributedString *attributedTitle;
  void *v10;
  NSAttributedString *attributedSubtitle;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  UIImage *image;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  _UIButtonConfigurationStyleBehaviors *v21;
  const __CFString *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)UIButtonConfiguration;
  -[UIButtonConfiguration description](&v24, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  behaviors = self->_behaviors;
  if (behaviors)
    behaviors = (_UIButtonConfigurationStyleBehaviors *)behaviors->_styleDescription;
  v6 = behaviors;
  objc_msgSend(v4, "appendFormat:", CFSTR(" baseStyle=%@"), v6);

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0xFu) <= 3)
  {
    objc_msgSend(v4, "appendString:", off_1E16BCA00[*(_BYTE *)&flags & 0xF]);
    flags = self->_flags;
  }
  objc_msgSend(v4, "appendString:", off_1E16BCA20[(*(unsigned int *)&flags >> 4) & 3]);
  v8 = self->_cornerStyle + 1;
  if (v8 <= 5)
    objc_msgSend(v4, "appendString:", off_1E16BCAB8[v8]);
  if (self->_baseBackgroundColor)
    objc_msgSend(v4, "appendFormat:", CFSTR(" baseBackgroundColor=%@"), self->_baseBackgroundColor);
  if (self->_baseForegroundColor)
    objc_msgSend(v4, "appendFormat:", CFSTR(" baseForegroundColor=%@"), self->_baseForegroundColor);
  if (-[NSAttributedString length](self->_attributedTitle, "length"))
  {
    attributedTitle = self->_attributedTitle;
    -[NSAttributedString string](attributedTitle, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" title=<%p>:'%@'"), attributedTitle, v10);

    if (self->_titleTextAttributesTransformer)
      objc_msgSend(v4, "appendString:", CFSTR(" hasTitleTextAttributesTransformer"));
  }
  if (-[NSAttributedString length](self->_attributedSubtitle, "length"))
  {
    attributedSubtitle = self->_attributedSubtitle;
    -[NSAttributedString string](attributedSubtitle, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" subTitle=<%p>:'%@'"), attributedSubtitle, v12);

    if (self->_subtitleTextAttributesTransformer)
      objc_msgSend(v4, "appendString:", CFSTR(" hasSubtitleTextAttributesTransformer"));
  }
  if (self->_image)
  {
    if ((*(_DWORD *)&self->_flags & 0x40) != 0)
      v13 = CFSTR("[hidden]");
    else
      v13 = &stru_1E16EDF20;
    v14 = objc_opt_class();
    image = self->_image;
    -[UIImage _identityDescription](image, "_identityDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" image%@=<%@:%p %@>"), v13, v14, image, v16);

    if (self->_preferredSymbolConfigurationForImage)
      objc_msgSend(v4, "appendFormat:", CFSTR(" preferredSymbolConfigurationForImage=%@"), self->_preferredSymbolConfigurationForImage);
    if (self->_imageColorTransformer)
      objc_msgSend(v4, "appendString:", CFSTR(" hasImageColorTransformer"));
  }
  v17 = self->_flags;
  v18 = ((v17 >> 18) & 3) - 1;
  if (v18 <= 2)
  {
    objc_msgSend(v4, "appendString:", off_1E16BCA40[v18]);
    LODWORD(v17) = self->_flags;
  }
  if ((v17 & 0x40) != 0)
  {
    objc_msgSend(v4, "appendString:", CFSTR(" showsActivityIndicator"));
    if (self->_activityIndicatorColorTransformer)
      objc_msgSend(v4, "appendString:", CFSTR(" hasActivityIndicatorColorTransformer"));
  }
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    NSStringFromDirectionalEdgeInsets(self->_contentInsets);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" contentInsets=%@"), v19);

  }
  else
  {
    objc_msgSend(v4, "appendString:", CFSTR(" contentInsets=default"));
  }
  v20 = self->_imagePlacement - 1;
  if (v20 <= 7 && ((0x8Bu >> v20) & 1) != 0)
    objc_msgSend(v4, "appendString:", off_1E16BCA58[v20]);
  objc_msgSend(v4, "appendFormat:", CFSTR(" imagePadding=%.*g titlePadding=%.*g"), 17, *(_QWORD *)&self->_imagePadding, 17, *(_QWORD *)&self->_titlePadding);
  objc_msgSend(v4, "appendString:", off_1E16BCA98[*((_BYTE *)&self->_flags + 3) & 3]);
  if ((*((_BYTE *)&self->_flags + 2) & 2) != 0)
  {
    v21 = self->_behaviors;
    v22 = CFSTR(" automaticallyUpdateForSelection");
    if (v21 && v21->_selectionStyle == -1)
      v22 = CFSTR(" (automaticallyUpdateForSelection)");
    objc_msgSend(v4, "appendString:", v22);
  }
  objc_msgSend(v4, "appendFormat:", CFSTR(" background=%@"), self->_background);
  return (NSString *)v4;
}

- (UIButtonConfigurationSize)buttonSize
{
  return ((unint64_t)self->_flags >> 4) & 3;
}

- (UIButtonConfigurationMacIdiomStyle)macIdiomStyle
{
  return *(_DWORD *)&self->_flags & 0xFLL;
}

- (int64_t)_resolvedMacIdiomStyle
{
  $79A7E1F5F387068245F5C9CFF36D1F58 flags;
  int64_t result;
  _UIButtonConfigurationStyleBehaviors *behaviors;

  flags = self->_flags;
  result = *(_BYTE *)&flags & 0xF;
  if ((*(_BYTE *)&flags & 0xF) == 0)
  {
    behaviors = self->_behaviors;
    if (behaviors)
      return behaviors->_automaticMacIdiomStyle;
    else
      return 0;
  }
  return result;
}

- (void)setShowsActivityIndicator:(BOOL)showsActivityIndicator
{
  int v3;

  if (showsActivityIndicator)
    v3 = 64;
  else
    v3 = 0;
  self->_flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (NSString)title
{
  return -[NSAttributedString string](self->_attributedTitle, "string");
}

- (NSString)subtitle
{
  return -[NSAttributedString string](self->_attributedSubtitle, "string");
}

- (void)setSubtitle:(NSString *)subtitle
{
  void *v4;
  NSString *v5;

  v5 = subtitle;
  if (v5)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v5);
    -[UIButtonConfiguration setAttributedSubtitle:](self, "setAttributedSubtitle:", v4);

  }
  else
  {
    -[UIButtonConfiguration setAttributedSubtitle:](self, "setAttributedSubtitle:", 0);
  }

}

- (NSLineBreakMode)subtitleLineBreakMode
{
  return ((unint64_t)self->_flags >> 14) & 7;
}

- (void)setAttributedSubtitle:(NSAttributedString *)attributedSubtitle
{
  NSAttributedString *v4;
  NSAttributedString *v5;
  NSAttributedString *v6;
  char v7;
  NSAttributedString *v8;
  NSAttributedString *resolvedSubtitle;
  NSAttributedString *v10;
  NSAttributedString *v11;
  NSAttributedString *v12;

  v4 = attributedSubtitle;
  v5 = self->_attributedSubtitle;
  v6 = v4;
  v12 = v6;
  if (v5 == v6)
  {

    resolvedSubtitle = v12;
  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSAttributedString isEqual:](v5, "isEqual:", v6);

      v8 = v12;
      if ((v7 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

      v8 = v12;
    }
    v10 = (NSAttributedString *)-[NSAttributedString copy](v8, "copy");
    v11 = self->_attributedSubtitle;
    self->_attributedSubtitle = v10;

    resolvedSubtitle = self->_resolvedSubtitle;
    self->_resolvedSubtitle = 0;
  }

  v8 = v12;
LABEL_10:

}

- (UIButtonConfigurationIndicator)indicator
{
  return ((unint64_t)self->_flags >> 18) & 3;
}

- (void)_dci_setIndicator:(int64_t)a3
{
  if (a3 == 3)
    a3 = 1;
  -[UIButtonConfiguration setIndicator:](self, "setIndicator:", a3);
}

- (UIButtonConfigurationTitleAlignment)titleAlignment
{
  return (unint64_t)(*((_BYTE *)&self->_flags + 3) & 3);
}

- (BOOL)automaticallyUpdateForSelection
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 1) & 1;
}

- (void)setAutomaticallyUpdateForSelection:(BOOL)automaticallyUpdateForSelection
{
  $79A7E1F5F387068245F5C9CFF36D1F58 flags;
  int v4;

  flags = self->_flags;
  if (((((*(_DWORD *)&flags & 0x20000) == 0) ^ automaticallyUpdateForSelection) & 1) == 0)
  {
    if (automaticallyUpdateForSelection)
      v4 = 0x20000;
    else
      v4 = 0;
    self->_flags = ($79A7E1F5F387068245F5C9CFF36D1F58)(*(_DWORD *)&flags & 0xFFFDFFFF | v4);
  }
}

- (void)_copyValuesFromConfiguration:(id)a3
{
  _UIButtonConfigurationCopy(self, a3, 0, 0);
}

- (BOOL)_alwaysApplyTitleAlignment
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 2) & 1;
}

- (id)symbolStyleForSize:(int64_t)a3 hasText:(BOOL)a4
{
  id *v4;

  v4 = (id *)&UIFontTextStyleFootnote;
  switch(a3)
  {
    case 1:
      v4 = (id *)&UIFontTextStyleCallout;
      break;
    case 2:
      return *v4;
    case 3:
      v4 = (id *)&UIFontTextStyleTitle1;
      if (a4)
        v4 = (id *)&UIFontTextStyleTitle2;
      break;
    default:
      v4 = (id *)&UIFontTextStyleTitle3;
      break;
  }
  return *v4;
}

- (double)_resolvedIndicatorPadding
{
  double result;

  result = 4.0;
  if ((*((_BYTE *)&self->_flags + 2) & 0x80) == 0)
    return 0.0;
  return result;
}

- (double)_resolvedActivityIndicatorSize
{
  return self->_resolvedActivityIndicatorSize;
}

- (id)_resolvedActivityIndicatorColor
{
  return self->_resolvedActivityIndicatorColor;
}

- (BOOL)_hasObscuringBackground
{
  return _UIBackgroundConfigurationIsObscuring(self->_background);
}

- (BOOL)_honorsTintInMacIdiom
{
  _UIButtonConfigurationStyleBehaviors *behaviors;

  behaviors = self->_behaviors;
  return behaviors && (behaviors->_style & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (UIColor)baseForegroundColor
{
  return self->_baseForegroundColor;
}

- (UIColor)baseBackgroundColor
{
  return self->_baseBackgroundColor;
}

- (UIConfigurationColorTransformer)imageColorTransformer
{
  return self->_imageColorTransformer;
}

- (UIConfigurationColorTransformer)activityIndicatorColorTransformer
{
  return self->_activityIndicatorColorTransformer;
}

- (void)setActivityIndicatorColorTransformer:(UIConfigurationColorTransformer)activityIndicatorColorTransformer
{
  objc_setProperty_nonatomic_copy(self, a2, activityIndicatorColorTransformer, 160);
}

- (UIConfigurationTextAttributesTransformer)titleTextAttributesTransformer
{
  return self->_titleTextAttributesTransformer;
}

- (NSAttributedString)attributedSubtitle
{
  return self->_attributedSubtitle;
}

- (UIConfigurationTextAttributesTransformer)subtitleTextAttributesTransformer
{
  return self->_subtitleTextAttributesTransformer;
}

- (void)setSubtitleTextAttributesTransformer:(UIConfigurationTextAttributesTransformer)subtitleTextAttributesTransformer
{
  objc_setProperty_nonatomic_copy(self, a2, subtitleTextAttributesTransformer, 192);
}

- (UIConfigurationColorTransformer)indicatorColorTransformer
{
  return self->_indicatorColorTransformer;
}

- (CGFloat)titlePadding
{
  return self->_titlePadding;
}

- (double)imageReservation
{
  return self->_imageReservation;
}

- (id)_spiValue
{
  return 0;
}

id __67___UIButtonConfiguration__baseAttributesTransformerForTransformer___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)off_1E1678D98;
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D98);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, v5);

  return v3;
}

@end
