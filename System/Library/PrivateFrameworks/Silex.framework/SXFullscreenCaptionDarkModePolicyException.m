@implementation SXFullscreenCaptionDarkModePolicyException

- (int64_t)shouldApplyDarkModeToTextStyleBackgroundColorsForComponent:(id)a3 DOM:(id)a4
{
  void *v5;
  int64_t v6;

  objc_msgSend(a3, "classification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SXFullscreenCaptionDarkModePolicyException shouldApplyAutoDarkModeForComponentClassification:](self, "shouldApplyAutoDarkModeForComponentClassification:", v5);

  return v6;
}

- (int64_t)shouldApplyDarkModeToTextStyleForegroundColorsForComponent:(id)a3 DOM:(id)a4
{
  void *v5;
  int64_t v6;

  objc_msgSend(a3, "classification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SXFullscreenCaptionDarkModePolicyException shouldApplyAutoDarkModeForComponentClassification:](self, "shouldApplyAutoDarkModeForComponentClassification:", v5);

  return v6;
}

- (int64_t)shouldApplyAutoDarkModeForComponentClassification:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = 0;
  }
  else
  {
    objc_opt_class();
    v4 = (objc_opt_isKindOfClass() & 1) - 1;
  }

  return v4;
}

@end
