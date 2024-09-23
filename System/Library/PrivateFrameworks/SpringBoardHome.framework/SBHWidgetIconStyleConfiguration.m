@implementation SBHWidgetIconStyleConfiguration

- (SBHWidgetIconStyleConfiguration)initWithWidgetExtension:(id)a3 widgetDescriptor:(id)a4 imageAppearance:(id)a5 customDisplayConfiguration:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SBHWidgetIconStyleConfiguration *v15;
  uint64_t v16;
  SBHIconImageAppearance *imageAppearance;
  void *v18;
  uint64_t v19;
  NSString *widgetBundleIdentifier;
  uint64_t v21;
  SBHWidgetDisplayConfiguration *customDisplayConfiguration;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SBHWidgetIconStyleConfiguration;
  v15 = -[SBHWidgetIconStyleConfiguration init](&v24, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v13, "copy");
    imageAppearance = v15->_imageAppearance;
    v15->_imageAppearance = (SBHIconImageAppearance *)v16;

    objc_storeStrong((id *)&v15->_widgetDescriptor, a4);
    objc_storeStrong((id *)&v15->_widgetExtension, a3);
    objc_msgSend(v11, "identity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "extensionBundleIdentifier");
    v19 = objc_claimAutoreleasedReturnValue();
    widgetBundleIdentifier = v15->_widgetBundleIdentifier;
    v15->_widgetBundleIdentifier = (NSString *)v19;

    v21 = objc_msgSend(v14, "copy");
    customDisplayConfiguration = v15->_customDisplayConfiguration;
    v15->_customDisplayConfiguration = (SBHWidgetDisplayConfiguration *)v21;

  }
  return v15;
}

- (SBHWidgetIconStyleConfiguration)initWithWidgetDataSource:(id)a3 gridSizeClass:(id)a4 widgetViewController:(id)a5 widgetExtensionProvider:(id)a6 imageAppearance:(id)a7 customDisplayConfiguration:(id)a8
{
  id v13;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  SBHWidgetIconStyleConfiguration *v27;
  void *v29;
  id v30;
  void *v31;

  v13 = a3;
  v15 = a3;
  v16 = a4;
  v30 = a5;
  v17 = a6;
  v18 = a8;
  v19 = a7;
  objc_opt_self();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = objc_opt_isKindOfClass();

  v31 = v16;
  v29 = v17;
  if ((a7 & 1) != 0)
  {
    v21 = v15;
    objc_msgSend(v21, "chsWidgetWithGridSizeClass:intent:", v16, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sbh_extensionForWidget:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sbh_descriptorForWidgetIdentifiable:", v21);
    v24 = v13;
    v25 = a5;
    v26 = objc_claimAutoreleasedReturnValue();

    v27 = -[SBHWidgetIconStyleConfiguration initWithWidgetExtension:widgetDescriptor:imageAppearance:customDisplayConfiguration:](self, "initWithWidgetExtension:widgetDescriptor:imageAppearance:customDisplayConfiguration:", v23, v26, v19, v18);
    v18 = (id)v26;
    a5 = v25;
    v13 = v24;
    v19 = (id)v23;
  }
  else
  {
    SBHContainerBundleIdentifierForDataSource(v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[SBHWidgetIconStyleConfiguration initWithContainingApplicationBundleIdentifier:imageAppearance:customDisplayConfiguration:](self, "initWithContainingApplicationBundleIdentifier:imageAppearance:customDisplayConfiguration:", v22, v19, v18);
  }

  if (v27)
  {
    objc_storeStrong((id *)&v27->_widgetDataSource, v13);
    objc_storeStrong((id *)&v27->_widgetViewController, a5);
  }

  return v27;
}

- (SBHWidgetIconStyleConfiguration)initWithContainingApplicationBundleIdentifier:(id)a3 imageAppearance:(id)a4 customDisplayConfiguration:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBHWidgetIconStyleConfiguration *v11;
  uint64_t v12;
  SBHIconImageAppearance *imageAppearance;
  uint64_t v14;
  NSString *containingApplicationBundleIdentifier;
  uint64_t v16;
  SBHWidgetDisplayConfiguration *customDisplayConfiguration;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SBHWidgetIconStyleConfiguration;
  v11 = -[SBHWidgetIconStyleConfiguration init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    imageAppearance = v11->_imageAppearance;
    v11->_imageAppearance = (SBHIconImageAppearance *)v12;

    v14 = objc_msgSend(v8, "copy");
    containingApplicationBundleIdentifier = v11->_containingApplicationBundleIdentifier;
    v11->_containingApplicationBundleIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    customDisplayConfiguration = v11->_customDisplayConfiguration;
    v11->_customDisplayConfiguration = (SBHWidgetDisplayConfiguration *)v16;

  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  SBHWidgetIconStyleConfiguration *v4;
  BOOL v5;

  v4 = (SBHWidgetIconStyleConfiguration *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[SBHWidgetIconStyleConfiguration isEqualToWidgetIconStyleConfiguration:](self, "isEqualToWidgetIconStyleConfiguration:", v4);
  }

  return v5;
}

- (BOOL)isEqualToWidgetIconStyleConfiguration:(id)a3
{
  SBHWidgetIconStyleConfiguration *v4;
  SBHWidgetIconStyleConfiguration *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
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
  int v26;
  void *v27;
  void *v28;
  int v29;
  _BOOL4 v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  char v40;

  v4 = (SBHWidgetIconStyleConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v40 = 1;
  }
  else
  {
    -[SBHWidgetIconStyleConfiguration containingApplicationBundleIdentifier](v4, "containingApplicationBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHWidgetIconStyleConfiguration containingApplicationBundleIdentifier](self, "containingApplicationBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = BSEqualStrings();

    if (!v8)
      goto LABEL_15;
    -[SBHWidgetIconStyleConfiguration widgetBundleIdentifier](v5, "widgetBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHWidgetIconStyleConfiguration widgetBundleIdentifier](self, "widgetBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = BSEqualStrings();

    if (!v11)
      goto LABEL_15;
    -[SBHWidgetIconStyleConfiguration widgetDescriptor](v5, "widgetDescriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHWidgetIconStyleConfiguration widgetDescriptor](self, "widgetDescriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = BSEqualObjects();

    if (!v14)
      goto LABEL_15;
    -[SBHWidgetIconStyleConfiguration widgetExtension](v5, "widgetExtension");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHWidgetIconStyleConfiguration widgetExtension](self, "widgetExtension");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = BSEqualObjects();

    if (!v17)
      goto LABEL_15;
    -[SBHWidgetIconStyleConfiguration imageAppearance](v5, "imageAppearance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHWidgetIconStyleConfiguration imageAppearance](self, "imageAppearance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = BSEqualObjects();

    if (!v20)
      goto LABEL_15;
    -[SBHWidgetIconStyleConfiguration appropriateWidgetRenderScheme](v5, "appropriateWidgetRenderScheme");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHWidgetIconStyleConfiguration appropriateWidgetRenderScheme](self, "appropriateWidgetRenderScheme");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = BSEqualObjects();

    if (!v23)
      goto LABEL_15;
    -[SBHWidgetIconStyleConfiguration appropriateWidgetTintParameters](v5, "appropriateWidgetTintParameters");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHWidgetIconStyleConfiguration appropriateWidgetTintParameters](self, "appropriateWidgetTintParameters");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = BSEqualObjects();

    if (!v26)
      goto LABEL_15;
    -[SBHWidgetIconStyleConfiguration appropriateColorFilter](v5, "appropriateColorFilter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHWidgetIconStyleConfiguration appropriateColorFilter](self, "appropriateColorFilter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = BSEqualObjects();

    if (!v29)
      goto LABEL_15;
    v30 = -[SBHWidgetIconStyleConfiguration isBackgroundRemovable](v5, "isBackgroundRemovable");
    if (v30 != -[SBHWidgetIconStyleConfiguration isBackgroundRemovable](self, "isBackgroundRemovable"))
      goto LABEL_15;
    v31 = -[SBHWidgetIconStyleConfiguration backgroundType](v5, "backgroundType");
    if (v31 != -[SBHWidgetIconStyleConfiguration backgroundType](self, "backgroundType"))
      goto LABEL_15;
    -[SBHWidgetIconStyleConfiguration widgetDataSource](v5, "widgetDataSource");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHWidgetIconStyleConfiguration widgetDataSource](self, "widgetDataSource");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = BSEqualObjects();

    if (!v34)
      goto LABEL_15;
    -[SBHWidgetIconStyleConfiguration widgetViewController](v5, "widgetViewController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHWidgetIconStyleConfiguration widgetViewController](self, "widgetViewController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = BSEqualObjects();

    if (v37)
    {
      -[SBHWidgetIconStyleConfiguration customDisplayConfiguration](v5, "customDisplayConfiguration");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHWidgetIconStyleConfiguration customDisplayConfiguration](self, "customDisplayConfiguration");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = BSEqualObjects();

    }
    else
    {
LABEL_15:
      v40 = 0;
    }
  }

  return v40;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = -[CHSWidgetDescriptor hash](self->_widgetDescriptor, "hash");
  v4 = -[SBLeafIconDataSource hash](self->_widgetDataSource, "hash") ^ v3;
  v5 = -[CHSWidgetExtension hash](self->_widgetExtension, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_containingApplicationBundleIdentifier, "hash");
  v7 = -[SBHIconImageAppearance hash](self->_imageAppearance, "hash");
  v8 = v7 ^ -[CHSWidgetRenderScheme hash](self->_appropriateWidgetRenderScheme, "hash");
  v9 = v6 ^ v8 ^ -[CHSWidgetTintParameters hash](self->_appropriateWidgetTintParameters, "hash");
  v10 = -[CAFilter hash](self->_appropriateColorFilter, "hash");
  v11 = v10 ^ -[UIViewController hash](self->_widgetViewController, "hash");
  return v9 ^ v11 ^ -[SBHWidgetDisplayConfiguration hash](self->_customDisplayConfiguration, "hash") ^ self->_isBackgroundRemovable ^ self->_backgroundType;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  unint64_t backgroundType;
  __CFString *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  if (!self->_didGenerate)
    -[SBHWidgetIconStyleConfiguration _generateParameters](self, "_generateParameters");
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendPointer:withName:", self->_widgetDescriptor, CFSTR("_widgetDescriptor"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_widgetDataSource, CFSTR("_widgetDataSource"), 1);
  v6 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_widgetExtension, CFSTR("_widgetExtension"), 1);
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_containingApplicationBundleIdentifier, CFSTR("_containingApplicationBundleIdentifier"), 1);
  v8 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_imageAppearance, CFSTR("_imageAppearance"), 1);
  v9 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_appropriateWidgetRenderScheme, CFSTR("_appropriateWidgetRenderScheme"), 1);
  v10 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_appropriateWidgetTintParameters, CFSTR("_appropriateWidgetTintParameters"), 1);
  v11 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_appropriateColorFilter, CFSTR("_appropriateColorFilter"), 1);
  v12 = (id)objc_msgSend(v3, "appendBool:withName:", self->_isBackgroundRemovable, CFSTR("_isBackgroundRemovable"));
  backgroundType = self->_backgroundType;
  if (backgroundType > 2)
    v14 = 0;
  else
    v14 = off_1E8D8D450[backgroundType];
  v15 = (id)objc_msgSend(v3, "appendObject:withName:", v14, CFSTR("_backgroundType"));
  v16 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_widgetViewController, CFSTR("_widgetViewController"), 1);
  v17 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_customDisplayConfiguration, CFSTR("_customDisplayConfiguration"), 1);
  v18 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBHWidgetIconStyleConfiguration _isCrystalLinked](self, "_isCrystalLinked"), CFSTR("isCrystalLinked"));
  v19 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBHWidgetIconStyleConfiguration _isDawnLinked](self, "_isDawnLinked"), CFSTR("isDawnLinked"));
  objc_msgSend(v3, "build");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)appropriateWidgetRenderScheme
{
  CHSWidgetRenderScheme *appropriateWidgetRenderScheme;
  CHSWidgetRenderScheme *v4;

  -[SBHWidgetIconStyleConfiguration _generateParameters](self, "_generateParameters");
  appropriateWidgetRenderScheme = self->_appropriateWidgetRenderScheme;
  if (appropriateWidgetRenderScheme)
    v4 = appropriateWidgetRenderScheme;
  else
    v4 = (CHSWidgetRenderScheme *)objc_opt_new();
  return v4;
}

- (id)appropriateWidgetTintParameters
{
  -[SBHWidgetIconStyleConfiguration _generateParameters](self, "_generateParameters");
  return self->_appropriateWidgetTintParameters;
}

- (id)appropriateColorFilter
{
  -[SBHWidgetIconStyleConfiguration _generateParameters](self, "_generateParameters");
  return self->_appropriateColorFilter;
}

- (BOOL)isBackgroundRemovable
{
  -[SBHWidgetIconStyleConfiguration _generateParameters](self, "_generateParameters");
  return self->_isBackgroundRemovable;
}

- (int64_t)backgroundType
{
  -[SBHWidgetIconStyleConfiguration _generateParameters](self, "_generateParameters");
  return self->_backgroundType;
}

- (BOOL)isAccented
{
  void *v2;
  BOOL v3;

  -[SBHWidgetIconStyleConfiguration imageAppearance](self, "imageAppearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "appearanceType") == 2;

  return v3;
}

- (void)_generateParameters
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  CHSWidgetRenderScheme *v14;
  CHSWidgetRenderScheme *appropriateWidgetRenderScheme;
  void *v16;
  CHSWidgetTintParameters *v17;
  CHSWidgetTintParameters *appropriateWidgetTintParameters;
  CAFilter *v19;
  CAFilter *v20;
  int v21;
  BOOL v22;
  void *v23;
  NSString *v24;
  CAFilter *appropriateColorFilter;
  int v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  CAFilter *v32;
  CAFilter *v33;
  BOOL v34;
  CAFilter *v35;
  CAFilter *v36;
  CHSWidgetRenderScheme *v37;
  CHSWidgetRenderScheme *v38;
  CHSWidgetTintParameters *v39;
  CHSWidgetTintParameters *v40;
  char v41;
  void *v42;
  int64_t v43;
  _BOOL8 v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  id v48;

  if (!self->_didGenerate)
  {
    -[SBHWidgetIconStyleConfiguration widgetExtension](self, "widgetExtension");
    v48 = (id)objc_claimAutoreleasedReturnValue();
    -[SBHWidgetIconStyleConfiguration imageAppearance](self, "imageAppearance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHWidgetIconStyleConfiguration customDisplayConfiguration](self, "customDisplayConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "appearanceType") == 2)
    {
      objc_msgSend(v3, "tintColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    v6 = -[SBHWidgetIconStyleConfiguration _isCrystalLinked](self, "_isCrystalLinked");
    v7 = -[SBHWidgetIconStyleConfiguration _isDawnLinked](self, "_isDawnLinked");
    v8 = -[SBHWidgetIconStyleConfiguration isAccented](self, "isAccented");
    -[SBHWidgetIconStyleConfiguration widgetDataSource](self, "widgetDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHWidgetIconStyleConfiguration widgetViewController](self, "widgetViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v11 = +[SBHWidgetStackViewController _shouldDrawSystemBackgroundMaterialForWidget:widgetViewController:](SBHWidgetStackViewController, "_shouldDrawSystemBackgroundMaterialForWidget:widgetViewController:", v9, v10);
      if (v4)
      {
LABEL_7:
        self->_backgroundType = 0;
        objc_msgSend(v4, "renderScheme");
        v12 = v5;
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (CHSWidgetRenderScheme *)objc_msgSend(v13, "copy");
        appropriateWidgetRenderScheme = self->_appropriateWidgetRenderScheme;
        self->_appropriateWidgetRenderScheme = v14;

        objc_msgSend(v4, "tintParameters");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (CHSWidgetTintParameters *)objc_msgSend(v16, "copy");
        appropriateWidgetTintParameters = self->_appropriateWidgetTintParameters;
        self->_appropriateWidgetTintParameters = v17;

        v5 = v12;
        goto LABEL_8;
      }
    }
    else
    {
      v11 = 0;
      if (v4)
        goto LABEL_7;
    }
    if (v48)
    {
      v47 = v6;
      v44 = v11;
      -[SBHWidgetIconStyleConfiguration widgetDescriptor](self, "widgetDescriptor");
      v20 = (CAFilter *)objc_claimAutoreleasedReturnValue();
      v19 = v20;
      if (v20)
        v21 = -[CAFilter isBackgroundRemovable](v20, "isBackgroundRemovable");
      else
        v21 = 0;
      self->_isBackgroundRemovable = v21;
      appropriateColorFilter = self->_appropriateColorFilter;
      self->_appropriateColorFilter = 0;

      v45 = (void *)objc_opt_new();
      v46 = v5;
      v41 = v21;
      if (v47)
      {
        v26 = v21;
        if (v19)
          v26 = -[CAFilter supportsAccentedContent](v19, "supportsAccentedContent");
        if (v8)
        {
          v27 = objc_alloc_init(MEMORY[0x1E0D100E0]);
          if (v26)
          {
            objc_msgSend(v46, "BSColor");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "BSColor");
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v27, "setPrimaryTintColor:", v28);
            objc_msgSend(v27, "setSecondaryTintColor:", v42);
            objc_msgSend(v27, "setFilterStyle:", 0);
            objc_msgSend(v27, "setFraction:", 1.0);

            v43 = 2;
            v30 = 2;
          }
          else
          {
            objc_msgSend((id)objc_opt_class(), "_buildColorMatrixFilterForColor:", v46);
            v36 = (CAFilter *)objc_claimAutoreleasedReturnValue();
            v30 = 0;
            v28 = self->_appropriateColorFilter;
            self->_appropriateColorFilter = v36;
            v43 = v44;
          }

        }
        else
        {
          v27 = 0;
          v30 = 0;
          v43 = v44;
        }
        objc_msgSend(v45, "setRenderingMode:", v30);
      }
      else
      {
        v31 = 2;
        if ((v7 & v21 & v8) != 0)
          v30 = 2;
        else
          v30 = 0;
        if ((v7 & v21 & v8) == 0)
          v31 = v44;
        v43 = v31;
        if (v8)
        {
          objc_msgSend((id)objc_opt_class(), "_buildColorMatrixFilterForColor:", v46);
          v32 = (CAFilter *)objc_claimAutoreleasedReturnValue();
          v33 = self->_appropriateColorFilter;
          self->_appropriateColorFilter = v32;
        }
        else
        {
          v33 = self->_appropriateColorFilter;
          self->_appropriateColorFilter = 0;
        }

        v27 = 0;
      }
      objc_msgSend(v45, "setBackgroundViewPolicy:", v30);
      self->_backgroundType = v43;
      if (v30 == 2)
        self->_isBackgroundRemovable = (v47 && ~v44) & v41 & v8;
      v37 = (CHSWidgetRenderScheme *)objc_msgSend(v45, "copy");
      v38 = self->_appropriateWidgetRenderScheme;
      self->_appropriateWidgetRenderScheme = v37;

      v39 = (CHSWidgetTintParameters *)objc_msgSend(v27, "copy");
      v40 = self->_appropriateWidgetTintParameters;
      self->_appropriateWidgetTintParameters = v39;

      v5 = v46;
      goto LABEL_45;
    }
    if (v11 || !v6 || !v8)
    {
      v22 = 0;
      self->_backgroundType = v11;
    }
    else
    {
      self->_backgroundType = 2;
      v22 = 1;
    }
    self->_isBackgroundRemovable = v22;
    if (v5)
    {
      v23 = v5;
      v24 = self->_containingApplicationBundleIdentifier;
      if (-[NSString isEqualToString:](v24, "isEqualToString:", CFSTR("com.apple.DocumentsApp")))
      {

        v5 = v23;
      }
      else
      {
        v34 = -[NSString isEqualToString:](v24, "isEqualToString:", CFSTR("com.apple.shortcuts"));

        v5 = v23;
        if (!v34)
        {
          objc_msgSend((id)objc_opt_class(), "_buildColorMatrixFilterForColor:", v23);
          v35 = (CAFilter *)objc_claimAutoreleasedReturnValue();
          v19 = self->_appropriateColorFilter;
          self->_appropriateColorFilter = v35;
          goto LABEL_45;
        }
      }
    }
LABEL_8:
    v19 = self->_appropriateColorFilter;
    self->_appropriateColorFilter = 0;
LABEL_45:

    self->_didGenerate = 1;
  }
}

+ (id)_buildColorMatrixFilterForColor:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  _OWORD v9[10];
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (void *)MEMORY[0x1E0CD2780];
  v4 = *MEMORY[0x1E0CD2BF0];
  v5 = a3;
  objc_msgSend(v3, "filterWithType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = 0;
  v10 = 0;
  objc_msgSend(v5, "getRed:green:blue:alpha:", &v12, &v11, &v10, 0);

  CAColorMatrixMakeMultiplyColor();
  memset(v9, 0, sizeof(v9));
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v7, *MEMORY[0x1E0CD2D20]);

  objc_msgSend(v6, "setName:", CFSTR("widgetIconStyleConfigurationColorFilter"));
  return v6;
}

- (BOOL)_isCrystalLinked
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SBHWidgetIconStyleConfiguration widgetExtension](self, "widgetExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "isLinkedOnOrAfter:", 1);
  }
  else
  {
    -[SBHWidgetIconStyleConfiguration bundleRecord](self, "bundleRecord");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[SBHWidgetIconStyleConfiguration bundleRecord](self, "bundleRecord");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "SDKVersion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D016F8]), "initWithString:", v8);
      v5 = objc_msgSend(v9, "majorBuildNumber") == 18;

    }
    else
    {
      v5 = 1;
    }
  }

  return v5;
}

- (BOOL)_isDawnLinked
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SBHWidgetIconStyleConfiguration widgetExtension](self, "widgetExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "isLinkedOnOrAfter:", 0);
  }
  else
  {
    -[SBHWidgetIconStyleConfiguration bundleRecord](self, "bundleRecord");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[SBHWidgetIconStyleConfiguration bundleRecord](self, "bundleRecord");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "SDKVersion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D016F8]), "initWithString:", v8);
      v5 = objc_msgSend(v9, "majorBuildNumber") == 17;

    }
    else
    {
      v5 = 1;
    }
  }

  return v5;
}

- (id)bundleRecord
{
  LSBundleRecord *bundleRecord;
  void *v4;
  LSBundleRecord *v5;
  void *v6;
  id v7;
  LSBundleRecord *v8;
  LSBundleRecord *v9;

  bundleRecord = self->_bundleRecord;
  if (!bundleRecord)
  {
    -[SBHWidgetIconStyleConfiguration widgetExtension](self, "widgetExtension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (LSBundleRecord *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5848]), "initWithBundleIdentifier:error:", self->_widgetBundleIdentifier, 0);
      v6 = self->_bundleRecord;
      self->_bundleRecord = v5;
    }
    else
    {
      v7 = objc_alloc(MEMORY[0x1E0CA5870]);
      -[SBHWidgetIconStyleConfiguration containingApplicationBundleIdentifier](self, "containingApplicationBundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (LSBundleRecord *)objc_msgSend(v7, "initWithBundleIdentifier:allowPlaceholder:error:", v6, 0, 0);
      v9 = self->_bundleRecord;
      self->_bundleRecord = v8;

    }
    bundleRecord = self->_bundleRecord;
  }
  return bundleRecord;
}

- (NSString)containingApplicationBundleIdentifier
{
  return self->_containingApplicationBundleIdentifier;
}

- (NSString)widgetBundleIdentifier
{
  return self->_widgetBundleIdentifier;
}

- (CHSWidgetExtension)widgetExtension
{
  return self->_widgetExtension;
}

- (CHSWidgetDescriptor)widgetDescriptor
{
  return self->_widgetDescriptor;
}

- (void)setWidgetDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_widgetDescriptor, a3);
}

- (SBHIconImageAppearance)imageAppearance
{
  return self->_imageAppearance;
}

- (SBHWidgetDisplayConfiguration)customDisplayConfiguration
{
  return self->_customDisplayConfiguration;
}

- (SBLeafIconDataSource)widgetDataSource
{
  return self->_widgetDataSource;
}

- (UIViewController)widgetViewController
{
  return self->_widgetViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetViewController, 0);
  objc_storeStrong((id *)&self->_widgetDataSource, 0);
  objc_storeStrong((id *)&self->_customDisplayConfiguration, 0);
  objc_storeStrong((id *)&self->_imageAppearance, 0);
  objc_storeStrong((id *)&self->_widgetDescriptor, 0);
  objc_storeStrong((id *)&self->_widgetExtension, 0);
  objc_storeStrong((id *)&self->_widgetBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_containingApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleRecord, 0);
  objc_storeStrong((id *)&self->_appropriateColorFilter, 0);
  objc_storeStrong((id *)&self->_appropriateWidgetTintParameters, 0);
  objc_storeStrong((id *)&self->_appropriateWidgetRenderScheme, 0);
}

@end
