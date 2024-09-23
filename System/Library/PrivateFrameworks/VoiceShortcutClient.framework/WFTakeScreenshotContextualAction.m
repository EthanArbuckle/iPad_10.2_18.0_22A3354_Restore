@implementation WFTakeScreenshotContextualAction

- (WFTakeScreenshotContextualAction)init
{
  void *v3;
  WFTakeScreenshotContextualAction *v4;
  WFTakeScreenshotContextualAction *v5;
  WFTakeScreenshotContextualAction *v6;
  uint64_t v8;

  WFLocalizedString(CFSTR("Take Screenshot"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = 0;
  v4 = -[WFContextualAction initWithIdentifier:wfActionIdentifier:type:correspondingSystemActionType:associatedAppBundleIdentifier:resultFileOperation:alternate:filteringBehavior:parameters:displayFormatString:title:subtitleFormatString:icon:](self, "initWithIdentifier:wfActionIdentifier:type:correspondingSystemActionType:associatedAppBundleIdentifier:resultFileOperation:alternate:filteringBehavior:parameters:displayFormatString:title:subtitleFormatString:icon:", CFSTR("is.workflow.actions.takescreenshot"), CFSTR("is.workflow.actions.takescreenshot"), 0, 0, CFSTR("com.apple.Preferences"), 1, v8, 0, 0, v3, v3, 0, 0);
  v5 = v4;
  if (v4)
    v6 = v4;

  return v5;
}

@end
