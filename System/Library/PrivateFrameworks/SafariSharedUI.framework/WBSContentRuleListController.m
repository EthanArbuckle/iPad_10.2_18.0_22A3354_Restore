@implementation WBSContentRuleListController

+ (void)determineContentRuleListStateForWebpagePreferences:(id)a3 wasLoadedWithContentBlockersEnabled:(BOOL)a4 wasLoadedWithAdvancedPrivacyProtectionsEnabled:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  void *v7;
  id v8;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (v6 == v5)
    {
      objc_msgSend(v8, "_setContentRuleListsEnabled:exceptions:", v6, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("com.apple.WebPrivacy.TrackingResourceRequestContentBlocker"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setContentRuleListsEnabled:exceptions:", v6, v7);

    }
  }

}

@end
