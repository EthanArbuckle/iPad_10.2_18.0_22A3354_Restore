@implementation PBFGenericDisplayContext

+ (id)mainScreen
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "displayContextForScreen:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_windowInterfaceOrientation");

  if (v7 <= 1)
    v8 = 1;
  else
    v8 = v7;
  objc_msgSend(v4, "displayContextWithUpdatedInterfaceOrientation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)mainScreenDisplayContextsForKnownOrientations
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;

  objc_msgSend(a1, "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v4 = PBFBSInterfaceOrientationDefaultForCurrentDeviceClass();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_windowInterfaceOrientation");

  if (v4)
  {
    objc_msgSend(v2, "displayContextWithUpdatedInterfaceOrientation:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  if (v7)
    v9 = v7 == v4;
  else
    v9 = 1;
  if (!v9)
  {
    objc_msgSend(v2, "displayContextWithUpdatedInterfaceOrientation:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

  }
  return v3;
}

+ (id)displayContextForScreen:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "displayConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "displayContextForDisplayConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)displayContextForScreen:(id)a3 traitCollection:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  unint64_t v22;
  void *v23;
  void *v25;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PBFDisplayContext.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("screen"));

    if (v9)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (!v8)
  {
LABEL_3:
    objc_msgSend(v7, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_4:
  v10 = PBFBSInterfaceOrientationDefaultForCurrentDeviceClass();
  v11 = objc_allocWithZone((Class)a1);
  objc_msgSend(v7, "_referenceBounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v7, "scale");
  v21 = v20;
  v22 = PBFUserInterfaceStyleFromUIUserInterfaceStyle(objc_msgSend(v9, "userInterfaceStyle"));
  v23 = (void *)objc_msgSend(v11, "initWithBounds:scale:interfaceOrientation:sigEventsCounter:userInterfaceStyle:accessibilityContrast:", v10, 0, v22, PBFAccessibilityContrastFromUIAccessibilityContrast(objc_msgSend(v9, "accessibilityContrast")), v13, v15, v17, v19, v21);

  return v23;
}

+ (id)displayContextForDisplayIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PBFDisplayContext.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayIdentity"));

  }
  if (displayContextForDisplayIdentifier__onceToken != -1)
    dispatch_once(&displayContextForDisplayIdentifier__onceToken, &__block_literal_global_32);
  objc_msgSend((id)displayContextForDisplayIdentifier__monitor, "configurationForIdentity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "displayContextForDisplayConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __63__PBFGenericDisplayContext_displayContextForDisplayIdentifier___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D23100]);
  v1 = (void *)displayContextForDisplayIdentifier__monitor;
  displayContextForDisplayIdentifier__monitor = (uint64_t)v0;

}

+ (id)displayContextForDisplayConfiguration:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  unint64_t v22;
  void *v23;
  void *v25;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PBFDisplayContext.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

  }
  v6 = (void *)MEMORY[0x1E0DC3BF8];
  objc_msgSend(v5, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_screenWithFBSDisplayIdentity:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = PBFBSInterfaceOrientationDefaultForCurrentDeviceClass();
  objc_msgSend(v8, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_allocWithZone((Class)a1);
  objc_msgSend(v5, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v5, "scale");
  v21 = v20;
  v22 = PBFUserInterfaceStyleFromUIUserInterfaceStyle(objc_msgSend(v10, "userInterfaceStyle"));
  v23 = (void *)objc_msgSend(v11, "initWithBounds:scale:interfaceOrientation:sigEventsCounter:userInterfaceStyle:accessibilityContrast:", v9, 0, v22, PBFAccessibilityContrastFromUIAccessibilityContrast(objc_msgSend(v10, "accessibilityContrast")), v13, v15, v17, v19, v21);

  return v23;
}

+ (id)displayContextForPersistenceIdentifier:(id)a3
{
  id v4;
  void *v5;
  double x;
  double y;
  double width;
  double height;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t i;
  void *v18;
  NSString *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;
  CGRect v38;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (displayContextForPersistenceIdentifier__onceToken != -1)
    dispatch_once(&displayContextForPersistenceIdentifier__onceToken, &__block_literal_global_14_0);
  v29 = v4;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("]-"), a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  x = *MEMORY[0x1E0C9D648];
  y = *(double *)(MEMORY[0x1E0C9D648] + 8);
  width = *(double *)(MEMORY[0x1E0C9D648] + 16);
  height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = PBFBSInterfaceOrientationDefaultForCurrentDeviceClass();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v33;
    v30 = 0;
    v31 = -1;
    v16 = 0.0;
    while (1)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (objc_msgSend(v18, "hasPrefix:", CFSTR("b")))
        {
          objc_msgSend(v18, "substringFromIndex:", 1);
          v19 = (NSString *)objc_claimAutoreleasedReturnValue();
          v38 = CGRectFromString(v19);
          x = v38.origin.x;
          y = v38.origin.y;
          width = v38.size.width;
          height = v38.size.height;
        }
        else
        {
          if (objc_msgSend(v18, "hasPrefix:", CFSTR("s")))
          {
            v20 = (void *)displayContextForPersistenceIdentifier__numberFormatter;
            objc_msgSend(v18, "substringFromIndex:", 1);
            v19 = (NSString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "numberFromString:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "doubleValue");
            v16 = v22;
          }
          else if (objc_msgSend(v18, "hasPrefix:", CFSTR("o")))
          {
            v23 = (void *)displayContextForPersistenceIdentifier__numberFormatter;
            objc_msgSend(v18, "substringFromIndex:", 1);
            v19 = (NSString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "numberFromString:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v21, "unsignedIntegerValue");
          }
          else if (objc_msgSend(v18, "hasPrefix:", CFSTR("ui")))
          {
            v24 = (void *)displayContextForPersistenceIdentifier__numberFormatter;
            objc_msgSend(v18, "substringFromIndex:", 2);
            v19 = (NSString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "numberFromString:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v21, "unsignedIntegerValue");
          }
          else if (objc_msgSend(v18, "hasPrefix:", CFSTR("ax")))
          {
            v25 = (void *)displayContextForPersistenceIdentifier__numberFormatter;
            objc_msgSend(v18, "substringFromIndex:", 2);
            v19 = (NSString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "numberFromString:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v21, "unsignedIntegerValue");
          }
          else
          {
            if (!objc_msgSend(v18, "hasPrefix:", CFSTR("s")))
              continue;
            v26 = (void *)displayContextForPersistenceIdentifier__numberFormatter;
            objc_msgSend(v18, "substringFromIndex:", 1);
            v19 = (NSString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "numberFromString:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v21, "unsignedIntegerValue");
          }

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (!v13)
        goto LABEL_26;
    }
  }
  v14 = 0;
  v16 = 0.0;
  v30 = 0;
  v31 = -1;
LABEL_26:

  v27 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBounds:scale:interfaceOrientation:sigEventsCounter:userInterfaceStyle:accessibilityContrast:", v10, v30, v14, v31, x, y, width, height, v16);
  return v27;
}

void __67__PBFGenericDisplayContext_displayContextForPersistenceIdentifier___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)displayContextForPersistenceIdentifier__numberFormatter;
  displayContextForPersistenceIdentifier__numberFormatter = (uint64_t)v0;

  v2 = (void *)displayContextForPersistenceIdentifier__numberFormatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

}

+ (id)genericDisplayContextWithDisplayContext:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v7 = v4;
  }
  else
  {
    v8 = objc_alloc((Class)a1);
    objc_msgSend(v4, "pbf_referenceBounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(v4, "pbf_scale");
    v7 = (id)objc_msgSend(v8, "initWithBounds:scale:interfaceOrientation:sigEventsCounter:userInterfaceStyle:accessibilityContrast:", objc_msgSend(v4, "pbf_interfaceOrientation"), objc_msgSend(v4, "pbf_significantEventsCounter"), objc_msgSend(v4, "pbf_userInterfaceStyle"), objc_msgSend(v4, "pbf_accessibilityContrast"), v10, v12, v14, v16, v17);
  }
  v18 = v7;

  return v18;
}

- (PBFGenericDisplayContext)initWithBounds:(CGRect)a3 scale:(double)a4 interfaceOrientation:(int64_t)a5 sigEventsCounter:(unint64_t)a6 userInterfaceStyle:(int64_t)a7 accessibilityContrast:(int64_t)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  PBFGenericDisplayContext *result;
  void *v20;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("!CGRectIsEmpty(bounds)"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFGenericDisplayContext initWithBounds:scale:interfaceOrientation:sigEventsCounter:userInterfaceStyle:accessibilityContrast:].cold.1(a2);
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAB034CLL);
  }
  if (a4 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("scale > 0"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFGenericDisplayContext initWithBounds:scale:interfaceOrientation:sigEventsCounter:userInterfaceStyle:accessibilityContrast:].cold.2(a2);
    goto LABEL_11;
  }
  v21.receiver = self;
  v21.super_class = (Class)PBFGenericDisplayContext;
  result = -[PBFGenericDisplayContext init](&v21, sel_init);
  if (result)
  {
    result->_referenceBounds.origin.x = x;
    result->_referenceBounds.origin.y = y;
    result->_referenceBounds.size.width = width;
    result->_referenceBounds.size.height = height;
    result->_scale = a4;
    result->_significantEventsCounter = a6;
    result->_userInterfaceStyle = a7;
    result->_accessibilityContrast = a8;
    result->_cachedHash = 0x7FFFFFFFFFFFFFFFLL;
    result->_interfaceOrientation = a5;
  }
  return result;
}

- (CGRect)pbf_frame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int IsLandscape;
  _BOOL4 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[PBFGenericDisplayContext pbf_referenceBounds](self, "pbf_referenceBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PBFGenericDisplayContext pbf_interfaceOrientation](self, "pbf_interfaceOrientation");
  IsLandscape = BSInterfaceOrientationIsLandscape();
  v12 = v8 < v10;
  if ((IsLandscape & v12) != 0)
    v13 = v8;
  else
    v13 = v10;
  if ((IsLandscape & v12) != 0)
    v14 = v10;
  else
    v14 = v8;
  v15 = v4;
  v16 = v6;
  result.size.height = v13;
  result.size.width = v14;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (unint64_t)hash
{
  unint64_t result;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  result = self->_cachedHash;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0D01788], "builder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "appendInteger:", self->_interfaceOrientation);
    v6 = (id)objc_msgSend(v4, "appendInteger:", self->_userInterfaceStyle);
    v7 = (id)objc_msgSend(v4, "appendInteger:", self->_accessibilityContrast);
    v8 = (id)objc_msgSend(v4, "appendCGRect:", self->_referenceBounds.origin.x, self->_referenceBounds.origin.y, self->_referenceBounds.size.width, self->_referenceBounds.size.height);
    v9 = (id)objc_msgSend(v4, "appendDouble:", self->_scale);
    self->_cachedHash = objc_msgSend(v4, "hash");

    return self->_cachedHash;
  }
  return result;
}

- (NSString)pbf_displayContextPersistenceIdentifier
{
  NSString *pbf_displayContextPersistenceIdentifier;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  pbf_displayContextPersistenceIdentifier = self->_pbf_displayContextPersistenceIdentifier;
  if (!pbf_displayContextPersistenceIdentifier)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromCGRect(self->_referenceBounds);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("b[%@]-s[%f]-o[%lu]-ui[%lu]-ax[%lu]-s[%lu]"), v5, *(_QWORD *)&self->_scale, self->_interfaceOrientation, self->_userInterfaceStyle, self->_accessibilityContrast, self->_significantEventsCounter);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_pbf_displayContextPersistenceIdentifier;
    self->_pbf_displayContextPersistenceIdentifier = v6;

    pbf_displayContextPersistenceIdentifier = self->_pbf_displayContextPersistenceIdentifier;
  }
  return pbf_displayContextPersistenceIdentifier;
}

- (PBFGenericDisplayContext)displayContextWithUpdatedSignificantEventsCounter:(unint64_t)a3
{
  PBFGenericDisplayContext *v3;

  if (self->_significantEventsCounter == a3)
    v3 = self;
  else
    v3 = (PBFGenericDisplayContext *)objc_msgSend(objc_allocWithZone((Class)objc_opt_class()), "initWithBounds:scale:interfaceOrientation:sigEventsCounter:userInterfaceStyle:accessibilityContrast:", self->_interfaceOrientation, a3, self->_userInterfaceStyle, self->_accessibilityContrast, self->_referenceBounds.origin.x, self->_referenceBounds.origin.y, self->_referenceBounds.size.width, self->_referenceBounds.size.height, self->_scale);
  return v3;
}

- (PBFGenericDisplayContext)displayContextWithUpdatedUserInterfaceStyle:(int64_t)a3
{
  PBFGenericDisplayContext *v3;

  if (self->_userInterfaceStyle == a3)
    v3 = self;
  else
    v3 = (PBFGenericDisplayContext *)objc_msgSend(objc_allocWithZone((Class)objc_opt_class()), "initWithBounds:scale:interfaceOrientation:sigEventsCounter:userInterfaceStyle:accessibilityContrast:", self->_interfaceOrientation, self->_significantEventsCounter, a3, self->_accessibilityContrast, self->_referenceBounds.origin.x, self->_referenceBounds.origin.y, self->_referenceBounds.size.width, self->_referenceBounds.size.height, self->_scale);
  return v3;
}

- (PBFGenericDisplayContext)displayContextWithUpdatedAccessibilityContrast:(int64_t)a3
{
  PBFGenericDisplayContext *v3;

  if (self->_accessibilityContrast == a3)
    v3 = self;
  else
    v3 = (PBFGenericDisplayContext *)objc_msgSend(objc_allocWithZone((Class)objc_opt_class()), "initWithBounds:scale:interfaceOrientation:sigEventsCounter:userInterfaceStyle:accessibilityContrast:", self->_interfaceOrientation, self->_significantEventsCounter, self->_userInterfaceStyle, a3, self->_referenceBounds.origin.x, self->_referenceBounds.origin.y, self->_referenceBounds.size.width, self->_referenceBounds.size.height, self->_scale);
  return v3;
}

- (PBFGenericDisplayContext)displayContextWithUpdatedInterfaceOrientation:(int64_t)a3
{
  PBFGenericDisplayContext *v3;

  if (self->_interfaceOrientation == a3)
    v3 = self;
  else
    v3 = (PBFGenericDisplayContext *)objc_msgSend(objc_allocWithZone((Class)objc_opt_class()), "initWithBounds:scale:interfaceOrientation:sigEventsCounter:userInterfaceStyle:accessibilityContrast:", a3, self->_significantEventsCounter, self->_userInterfaceStyle, self->_accessibilityContrast, self->_referenceBounds.origin.x, self->_referenceBounds.origin.y, self->_referenceBounds.size.width, self->_referenceBounds.size.height, self->_scale);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PBFGenericDisplayContext *v4;
  void *v5;
  BOOL v6;
  char v7;

  v4 = (PBFGenericDisplayContext *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

    }
    else
    {
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) == 0)
      {
        v6 = 0;
        goto LABEL_8;
      }
    }
    v6 = -[PBFGenericDisplayContext isEqualToDisplayContext:](self, "isEqualToDisplayContext:", v4);
  }
LABEL_8:

  return v6;
}

- (BOOL)isEqualToDisplayContext:(id)a3
{
  PBFGenericDisplayContext *v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  BOOL v8;

  v4 = (PBFGenericDisplayContext *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    -[PBFGenericDisplayContext pbf_scale](self, "pbf_scale");
    -[PBFGenericDisplayContext pbf_scale](v4, "pbf_scale");
    if (BSFloatEqualToFloat()
      && (-[PBFGenericDisplayContext pbf_referenceBounds](self, "pbf_referenceBounds"),
          -[PBFGenericDisplayContext pbf_referenceBounds](v4, "pbf_referenceBounds"),
          BSRectEqualToRect())
      && (v5 = -[PBFGenericDisplayContext pbf_accessibilityContrast](self, "pbf_accessibilityContrast"),
          v5 == -[PBFGenericDisplayContext pbf_accessibilityContrast](v4, "pbf_accessibilityContrast"))
      && (v6 = -[PBFGenericDisplayContext pbf_userInterfaceStyle](self, "pbf_userInterfaceStyle"),
          v6 == -[PBFGenericDisplayContext pbf_userInterfaceStyle](v4, "pbf_userInterfaceStyle")))
    {
      v7 = -[PBFGenericDisplayContext pbf_interfaceOrientation](self, "pbf_interfaceOrientation");
      v8 = v7 == -[PBFGenericDisplayContext pbf_interfaceOrientation](v4, "pbf_interfaceOrientation");
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)geometryIsEqualTo:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  -[PBFGenericDisplayContext pbf_scale](self, "pbf_scale");
  objc_msgSend(v4, "pbf_scale");
  if (BSFloatEqualToFloat())
  {
    -[PBFGenericDisplayContext pbf_referenceBounds](self, "pbf_referenceBounds");
    objc_msgSend(v4, "pbf_referenceBounds");
    v5 = BSRectEqualToRect();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BSInterfaceOrientationToString(self->_interfaceOrientation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("interfaceOrientation"));

  NSStringFromPBFUserInterfaceStyle(self->_userInterfaceStyle);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("userInterfaceStyle"));

  -[PBFGenericDisplayContext pbf_referenceBounds](self, "pbf_referenceBounds");
  v6 = (id)objc_msgSend(v3, "appendRect:withName:", CFSTR("bounds"));
  -[PBFGenericDisplayContext pbf_frame](self, "pbf_frame");
  v7 = (id)objc_msgSend(v3, "appendRect:withName:", CFSTR("frame"));
  -[PBFGenericDisplayContext pbf_scale](self, "pbf_scale");
  v8 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("scale"));
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (CGRect)pbf_referenceBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_referenceBounds.origin.x;
  y = self->_referenceBounds.origin.y;
  width = self->_referenceBounds.size.width;
  height = self->_referenceBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)pbf_interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (double)pbf_scale
{
  return self->_scale;
}

- (unint64_t)pbf_significantEventsCounter
{
  return self->_significantEventsCounter;
}

- (int64_t)pbf_userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (int64_t)pbf_accessibilityContrast
{
  return self->_accessibilityContrast;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pbf_displayContextPersistenceIdentifier, 0);
}

- (void)initWithBounds:(const char *)a1 scale:interfaceOrientation:sigEventsCounter:userInterfaceStyle:accessibilityContrast:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithBounds:(const char *)a1 scale:interfaceOrientation:sigEventsCounter:userInterfaceStyle:accessibilityContrast:.cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
