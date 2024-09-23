@implementation SPUISearchFirstTimeViewController

+ (BOOL)needsDisplay
{
  return (unint64_t)objc_msgSend(a1, "viewCount") < 3;
}

+ (int64_t)viewCount
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.spotlightui"));
  if (objc_msgSend(v2, "integerForKey:", CFSTR("SPUISearchFirstTimeLastOSVersionUsed")) <= 15)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "operatingSystemVersion");
      v5 = v10;
    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(v2, "setInteger:forKey:", v5, CFSTR("SPUISearchFirstTimeLastOSVersionUsed"));

    objc_msgSend(v2, "setInteger:forKey:", 0, CFSTR("SPUISearchFirstTimeShowCount"));
  }
  v6 = objc_msgSend(v2, "integerForKey:", CFSTR("SPUISearchFirstTimeShowCount"));
  SPLogForSPLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  if (os_log_type_enabled(v7, v8))
  {
    *(_DWORD *)buf = 138412546;
    v12 = v2;
    v13 = 2048;
    v14 = v6;
    _os_log_impl(&dword_22E078000, v7, v8, "[FTE] count from new prefs (%@) is: %ld", buf, 0x16u);
  }

  return v6;
}

+ (void)updateViewCountToCount:(int64_t)a3
{
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  int v7;
  void *v8;
  __int16 v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.spotlightui"));
  objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("SPUISearchFirstTimeShowCount"));
  SPLogForSPLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  if (os_log_type_enabled(v5, v6))
  {
    v7 = 138412546;
    v8 = v4;
    v9 = 2048;
    v10 = a3;
    _os_log_impl(&dword_22E078000, v5, v6, "[FTE] updating view count in %@ to: %ld", (uint8_t *)&v7, 0x16u);
  }

  notify_post("com.apple.spotlightui.prefschanged");
}

+ (void)dismissForever
{
  objc_msgSend(a1, "updateViewCountToCount:", 3);
}

- (SPUISearchFirstTimeViewController)initWithDomains:(id)a3 explanationText:(id)a4 learnMoreText:(id)a5 continueButtonTitle:(id)a6
{
  SPUISearchFirstTimeViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SPUISearchFirstTimeViewController;
  v6 = -[SearchUIFirstTimeExperienceViewController initWithDomains:explanationText:learnMoreText:continueButtonTitle:](&v16, sel_initWithDomains_explanationText_learnMoreText_continueButtonTitle_, a3, a4, a5, a6);
  if (v6)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setAlwaysBounceVertical:", 1);
    objc_msgSend(v7, "setDelaysContentTouches:", 0);
    objc_msgSend(v7, "setKeyboardDismissMode:", 1);
    -[SPUISearchFirstTimeViewController view](v6, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    -[SPUISearchFirstTimeViewController view](v6, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUISearchFirstTimeViewController setContentView:](v6, "setContentView:", v9);

    v10 = (void *)MEMORY[0x24BE85220];
    -[SPUISearchFirstTimeViewController view](v6, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constrainViewHeightContainer:", v11);

    v12 = (void *)MEMORY[0x24BE85220];
    -[SPUISearchFirstTimeViewController view](v6, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v12, "alignView:toView:withAttribute:", v7, v13, 9);

    -[SPUISearchFirstTimeViewController setView:](v6, "setView:", v7);
  }
  return v6;
}

- (void)updateViewCount
{
  objc_msgSend((id)objc_opt_class(), "incrementViewCount");
}

+ (void)incrementViewCount
{
  _hasBeenDisplayed = 1;
  objc_msgSend(a1, "updateViewCountToCount:", objc_msgSend(a1, "viewCount") + 1);
}

- (double)idealContentHeight
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[SPUISearchFirstTimeViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

  -[SPUISearchFirstTimeViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  -[SPUISearchFirstTimeViewController contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;

  return v7;
}

+ (BOOL)hasBeenDisplayed
{
  return _hasBeenDisplayed;
}

+ (BOOL)useZKWFTE
{
  int v2;

  v2 = _os_feature_enabled_impl();
  if (v2)
    LOBYTE(v2) = objc_msgSend(MEMORY[0x24BEB4BC0], "isPhone");
  return v2;
}

- (UIView)contentView
{
  return (UIView *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setContentView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1016);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
