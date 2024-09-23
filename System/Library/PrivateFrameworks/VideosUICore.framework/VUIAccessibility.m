@implementation VUIAccessibility

void __34__VUIAccessibility_sharedInstance__block_invoke()
{
  VUIAccessibility *v0;
  void *v1;

  v0 = objc_alloc_init(VUIAccessibility);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (VUIAccessibility)init
{
  VUIAccessibility *v2;
  VUIAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIAccessibility;
  v2 = -[VUIAccessibility init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[VUIAccessibility _addObserverToAccessibilityNotifications](v2, "_addObserverToAccessibilityNotifications");
  return v3;
}

- (void)_addObserverToAccessibilityNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__didChangeAccessibilityVoiceOverStatus, *MEMORY[0x1E0CEB1A0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__didChangeAccessibilityReduceMotionStatus, *MEMORY[0x1E0CEB090], 0);

}

+ (BOOL)isAXSmallEnabled:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  +[VUICoreUtilities uiContentSizeCategoryFor:](VUICoreUtilities, "uiContentSizeCategoryFor:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3 || objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0CEB440]))
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredContentSizeCategory");
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  v8 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v4, (UIContentSizeCategory)*MEMORY[0x1E0CEB3F8]) == NSOrderedDescending
    && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v4, (UIContentSizeCategory)*MEMORY[0x1E0CEB3D0]) == NSOrderedAscending;

  return v8;
}

+ (BOOL)isAXLargeEnabled:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  +[VUICoreUtilities uiContentSizeCategoryFor:](VUICoreUtilities, "uiContentSizeCategoryFor:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3 || objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0CEB440]))
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredContentSizeCategory");
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  v8 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v4, (UIContentSizeCategory)*MEMORY[0x1E0CEB3D8]) == NSOrderedDescending;

  return v8;
}

+ (BOOL)isFeatureEnabled:(int64_t)a3
{
  BOOL v3;
  int v5;
  void *v6;
  void *v7;

  switch(a3)
  {
    case 0:
      return UIAccessibilityIsVoiceOverRunning();
    case 1:
      return UIAccessibilityIsReduceMotionEnabled();
    case 2:
      return UIAccessibilityIsSwitchControlRunning();
    case 3:
      v5 = _AXSFullKeyboardAccessEnabled();
      return v5 != 0;
    case 4:
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredContentSizeCategory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v7 != 0;

      return v3;
    case 5:
      return UIAccessibilityIsVideoAutoplayEnabled();
    case 6:
      v5 = _AXSEnhanceBackgroundContrastEnabled();
      return v5 != 0;
    default:
      return v3;
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_0);
  return (id)sharedInstance_sharedInstance;
}

+ (id)makeAccessibilityIdentifierString:(id)a3 additionalString:(id)a4
{
  id v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = (__CFString *)a4;
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Accessibility:: no additionalString for %@. Using Default"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@"), v8);

    v7 = CFSTR("Default");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@.%@"), CFSTR("UIA.TV."), v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)contentSizeCategoryIsAccessibility:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL IsAccessibilityCategory;

  +[VUICoreUtilities uiContentSizeCategoryFor:](VUICoreUtilities, "uiContentSizeCategoryFor:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3 || objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0CEB440]))
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredContentSizeCategory");
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v4);

  return IsAccessibilityCategory;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIAccessibility;
  -[VUIAccessibility dealloc](&v4, sel_dealloc);
}

- (void)_didChangeAccessibilityVoiceOverStatus
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("VUIAccessibilityVoiceOverStatusDidChangeNotification"), 0);

}

- (void)_didChangeAccessibilityReduceMotionStatus
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("VUIAccessibilityReduceMotionStatusDidChangeNotification"), 0);

}

@end
