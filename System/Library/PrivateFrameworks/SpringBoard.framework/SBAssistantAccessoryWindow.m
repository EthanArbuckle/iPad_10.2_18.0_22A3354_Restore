@implementation SBAssistantAccessoryWindow

+ (id)defaultLayoutStrategy
{
  return +[SBWindowDefaultLayoutStrategy noClipStrategy](SBWindowDefaultLayoutStrategy, "noClipStrategy");
}

- (SBAssistantAccessoryWindow)initWithWindowScene:(id)a3 rootViewController:(id)a4 layoutStrategy:(id)a5 role:(id)a6 debugName:(id)a7
{
  SBAssistantAccessoryWindow *v7;
  SBAssistantAccessoryWindow *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBAssistantAccessoryWindow;
  v7 = -[SBWindow initWithWindowScene:rootViewController:layoutStrategy:role:debugName:](&v10, sel_initWithWindowScene_rootViewController_layoutStrategy_role_debugName_, a3, a4, a5, a6, a7);
  v8 = v7;
  if (v7)
  {
    -[SBAssistantAccessoryWindow setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", CFSTR("siri-effects-window"));
    -[SBAssistantAccessoryWindow setOpaque:](v8, "setOpaque:", 0);
    -[SBAssistantAccessoryWindow setWindowLevel:](v8, "setWindowLevel:", *MEMORY[0x1E0CEBBD0] + 25.0 + -0.5);
    -[SBAssistantAccessoryWindow bs_setHitTestingDisabled:](v8, "bs_setHitTestingDisabled:", 1);
  }
  return v8;
}

@end
