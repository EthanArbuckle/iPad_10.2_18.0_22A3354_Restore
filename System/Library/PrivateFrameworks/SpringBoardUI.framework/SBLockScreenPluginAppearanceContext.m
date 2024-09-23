@implementation SBLockScreenPluginAppearanceContext

- (SBLockScreenPluginAppearanceContext)initWithAppearance:(id)a3
{
  id v4;
  SBLockScreenPluginAppearanceContext *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBLockScreenPluginAppearanceContext;
  v5 = -[SBLockScreenPluginAppearanceContext init](&v9, sel_init);
  if (v5)
  {
    -[SBLockScreenPluginAppearanceContext setHidden:](v5, "setHidden:", objc_msgSend(v4, "isHidden"));
    -[SBLockScreenPluginAppearanceContext setRestrictedCapabilities:](v5, "setRestrictedCapabilities:", objc_msgSend(v4, "restrictedCapabilities"));
    -[SBLockScreenPluginAppearanceContext setBackgroundStyle:](v5, "setBackgroundStyle:", objc_msgSend(v4, "backgroundStyle"));
    -[SBLockScreenPluginAppearanceContext setPresentationStyle:](v5, "setPresentationStyle:", objc_msgSend(v4, "presentationStyle"));
    -[SBLockScreenPluginAppearanceContext setNotificationBehavior:](v5, "setNotificationBehavior:", objc_msgSend(v4, "notificationBehavior"));
    objc_msgSend(v4, "legibilitySettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLockScreenPluginAppearanceContext setLegibilitySettings:](v5, "setLegibilitySettings:", v6);

    objc_msgSend(v4, "elementOverrides");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLockScreenPluginAppearanceContext setElementOverrides:](v5, "setElementOverrides:", v7);

    objc_msgSend(v4, "presentationRegion");
    -[SBLockScreenPluginAppearanceContext setPresentationRegion:](v5, "setPresentationRegion:");
  }

  return v5;
}

- (NSString)description
{
  return (NSString *)-[SBLockScreenPluginAppearanceContext descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBLockScreenPluginAppearanceContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  CGRect v14;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBLockScreenPluginAppearanceContext isHidden](self, "isHidden"), CFSTR("hidden"));
  NSStringFromLockScreenPluginBackgroundStyle(-[SBLockScreenPluginAppearanceContext backgroundStyle](self, "backgroundStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v5, CFSTR("backgroundStyle"), 1);

  NSStringFromLockScreenPluginPresentationStyle(-[SBLockScreenPluginAppearanceContext presentationStyle](self, "presentationStyle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v7, CFSTR("presentationStyle"), 1);

  NSStringFromLockScreenPluginNotificationBehavior(-[SBLockScreenPluginAppearanceContext notificationBehavior](self, "notificationBehavior"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v9, CFSTR("notificationBehavior"), 1);

  -[SBLockScreenPluginAppearanceContext presentationRegion](self, "presentationRegion");
  NSStringFromCGRect(v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendObject:withName:", v11, CFSTR("presentationRegion"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBLockScreenPluginAppearanceContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBLockScreenPluginAppearanceContext *v11;

  v4 = a3;
  -[SBLockScreenPluginAppearanceContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __77__SBLockScreenPluginAppearanceContext_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_24D4D06C0;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __77__SBLockScreenPluginAppearanceContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  CGRect v12;

  v2 = *(void **)(a1 + 32);
  NSStringFromLockScreenCapabilities(objc_msgSend(*(id *)(a1 + 40), "restrictedCapabilities"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:skipIfEmpty:", v3, CFSTR("restrictions"), 1);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "legibilitySettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v5, CFSTR("legibilitySettings"), 1);

  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "elementOverrides");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendArraySection:withName:skipIfEmpty:", v8, CFSTR("elementOverrides"), 1);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "presentationRegion");
  NSStringFromCGRect(v12);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "appendObject:withName:", v11, CFSTR("presentationRegion"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SBLockScreenPluginAppearanceContext initWithAppearance:]([SBLockScreenPluginMutableAppearanceContext alloc], "initWithAppearance:", self);
}

- (BOOL)isHidden
{
  return self->hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->hidden = a3;
}

- (unint64_t)restrictedCapabilities
{
  return self->restrictedCapabilities;
}

- (void)setRestrictedCapabilities:(unint64_t)a3
{
  self->restrictedCapabilities = a3;
}

- (int64_t)backgroundStyle
{
  return self->backgroundStyle;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  self->backgroundStyle = a3;
}

- (int64_t)presentationStyle
{
  return self->presentationStyle;
}

- (void)setPresentationStyle:(int64_t)a3
{
  self->presentationStyle = a3;
}

- (int64_t)notificationBehavior
{
  return self->notificationBehavior;
}

- (void)setNotificationBehavior:(int64_t)a3
{
  self->notificationBehavior = a3;
}

- (SBLockScreenLegibilitySettings)legibilitySettings
{
  return self->legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->legibilitySettings, a3);
}

- (NSArray)elementOverrides
{
  return self->elementOverrides;
}

- (void)setElementOverrides:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (CGRect)presentationRegion
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->presentationRegion.origin.x;
  y = self->presentationRegion.origin.y;
  width = self->presentationRegion.size.width;
  height = self->presentationRegion.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPresentationRegion:(CGRect)a3
{
  self->presentationRegion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->elementOverrides, 0);
  objc_storeStrong((id *)&self->legibilitySettings, 0);
}

@end
