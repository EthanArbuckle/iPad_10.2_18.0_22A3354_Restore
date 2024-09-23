@implementation UIFocusContainerGuide

- (UIFocusContainerGuide)init
{
  UIFocusContainerGuide *v2;
  UIFocusContainerGuide *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIFocusContainerGuide;
  v2 = -[UIFocusGuide init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[UIFocusGuide _setAutomaticallyPreferOwningView:](v2, "_setAutomaticallyPreferOwningView:", 0);
  return v3;
}

- (BOOL)_isEligibleForFocusInteraction
{
  void *v3;
  BOOL v4;

  if (!-[UIFocusGuide isEnabled](self, "isEnabled"))
    return 0;
  -[UILayoutGuide owningView](self, "owningView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)_searchForFocusRegionsInContext:(id)a3
{
  id v4;
  _UIFocusContainerGuideRegion *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _UIFocusContainerGuideRegion *v19;

  v4 = a3;
  v5 = [_UIFocusContainerGuideRegion alloc];
  -[UILayoutGuide layoutFrame](self, "layoutFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[UILayoutGuide owningView](self, "owningView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "coordinateSpace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[_UIFocusGuideRegion initWithFrame:coordinateSpace:](v5, "initWithFrame:coordinateSpace:", v15, v7, v9, v11, v13);

  -[_UIFocusGuideRegion setDelegate:](v19, "setDelegate:", self);
  -[UILayoutGuide owningView](self, "owningView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide owningView](self, "owningView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  _UIFocusRegionContainerFromEnvironmentAndContainer((uint64_t)v16, (uint64_t)v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusContainerGuideRegion setContentFocusRegionContainer:](v19, "setContentFocusRegionContainer:", v18);

  objc_msgSend(v4, "addRegion:", v19);
}

@end
