@implementation OBSetupAssistantAppearanceController

- (OBSetupAssistantAppearanceController)init
{

  return 0;
}

- (BOOL)scrollViewContentIsUnderTray
{
  return 0;
}

- (void)_scrollViewDidLayoutSubviews:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OBSetupAssistantAppearanceController;
  -[OBWelcomeController _scrollViewDidLayoutSubviews:](&v4, sel__scrollViewDidLayoutSubviews_, a3);
  -[OBSetupAssistantAppearanceController updateContentViewForScrollViewLayoutChange](self, "updateContentViewForScrollViewLayoutChange");
}

@end
