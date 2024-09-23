@implementation AllBackdropViews

void ___AllBackdropViews_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7B6B8;
  qword_1ECD7B6B8 = v0;

  _MergedGlobals_69 = _AXSEnhanceBackgroundContrastEnabled() != 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", objc_opt_class(), sel_adjustGraphicsQualityForAccessibilityIfNeeded_, CFSTR("UIApplicationDidBecomeActiveNotification"), 0);
  objc_msgSend(v2, "addObserver:selector:name:object:", objc_opt_class(), sel_adjustGraphicsQualityForAccessibilityIfNeeded_, CFSTR("UIAccessibilityReduceTransparencyStatusDidChangeNotification"), 0);

}

@end
