@implementation SBSApplicationMultiwindowService

- (void)triggerShowAllWindowsForApplicationBundleIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSAbstractApplicationService client](self, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "triggerShowAllWindowsForApplicationBundleIdentifier:", v4);

}

- (void)requestShelfPresentationForSceneWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSAbstractApplicationService client](self, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestShelfPresentationForSceneWithIdentifier:", v4);

}

@end
