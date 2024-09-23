@implementation UIView(SBUISystemApertureStyling)

- (void)sbui_systemApertureApplyMinimumAndMaximumContentSizeCategoryForCustomLayoutMode:()SBUISystemApertureStyling
{
  void *v5;
  id v6;

  objc_msgSend(a1, "setMinimumContentSizeCategory:", *MEMORY[0x1E0CEB420]);
  objc_msgSend(a1, "traitCollection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sbui_preferredContentSizeCategoryAllowingTraitsForCustomLayoutMode:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setMaximumContentSizeCategory:", v5);

}

@end
