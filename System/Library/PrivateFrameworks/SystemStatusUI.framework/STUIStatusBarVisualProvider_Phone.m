@implementation STUIStatusBarVisualProvider_Phone

- (STUIStatusBarVisualProvider_Phone)init
{
  STUIStatusBarVisualProvider_Phone *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarVisualProvider_Phone;
  v2 = -[STUIStatusBarVisualProvider_iOS init](&v6, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[STUIStatusBarVisualProvider_Phone setPillRegionCoordinator:](v2, "setPillRegionCoordinator:", v3);

    -[STUIStatusBarVisualProvider_Phone pillRegionCoordinator](v2, "pillRegionCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setVisualProvider:", v2);

  }
  return v2;
}

- (void)setPillRegionCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_pillRegionCoordinator, a3);
}

- (id)willUpdateWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STUIStatusBarVisualProvider_Phone;
  v4 = a3;
  -[STUIStatusBarVisualProvider_iOS willUpdateWithData:](&v8, sel_willUpdateWithData_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarVisualProvider_Phone pillRegionCoordinator](self, "pillRegionCoordinator", v8.receiver, v8.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateDataForBackgroundActivity:", v4);

  return v5;
}

- (STUIStatusBarVisualProvider_PillRegionCoordinator)pillRegionCoordinator
{
  return self->_pillRegionCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pillRegionCoordinator, 0);
}

+ (Class)visualProviderSubclassForScreen:(id)a3 visualProviderInfo:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "_exclusionArea");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "rect");
LABEL_5:
    v10 = (void *)objc_opt_class();
    STUIStatusBarGetVisualProviderSubclassForScreenWithVisualProviderInfo(v10, v4, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "visualProviderSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "legacyPhoneUsesiPadLayout");

  if (!v8)
    goto LABEL_5;
  objc_opt_class();
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v11 = (void *)v9;

  return (Class)v11;
}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarPillBackgroundActivityItem, "defaultDisplayIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[STUIStatusBarVisualProvider_Phone pillRegionCoordinator](self, "pillRegionCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "animationForBackgroundActivityIcon");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v10 = (void *)v12;

    goto LABEL_7;
  }
  +[STUIStatusBarBackgroundActivityItem backgroundDisplayIdentifier](STUIStatusBarPillBackgroundActivityItem, "backgroundDisplayIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v6)
  {
    -[STUIStatusBarVisualProvider_Phone pillRegionCoordinator](self, "pillRegionCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "animationForBackgroundActivityPill");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v14.receiver = self;
  v14.super_class = (Class)STUIStatusBarVisualProvider_Phone;
  -[STUIStatusBarVisualProvider_iOS additionAnimationForDisplayItemWithIdentifier:itemAnimation:](&v14, sel_additionAnimationForDisplayItemWithIdentifier_itemAnimation_, v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v10;
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  +[STUIStatusBarItem defaultDisplayIdentifier](STUIStatusBarPillBackgroundActivityItem, "defaultDisplayIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[STUIStatusBarVisualProvider_Phone pillRegionCoordinator](self, "pillRegionCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "animationForBackgroundActivityIcon");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v10 = (void *)v12;

    goto LABEL_7;
  }
  +[STUIStatusBarBackgroundActivityItem backgroundDisplayIdentifier](STUIStatusBarPillBackgroundActivityItem, "backgroundDisplayIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v6)
  {
    -[STUIStatusBarVisualProvider_Phone pillRegionCoordinator](self, "pillRegionCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "animationForBackgroundActivityPill");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v14.receiver = self;
  v14.super_class = (Class)STUIStatusBarVisualProvider_Phone;
  -[STUIStatusBarVisualProvider_iOS removalAnimationForDisplayItemWithIdentifier:itemAnimation:](&v14, sel_removalAnimationForDisplayItemWithIdentifier_itemAnimation_, v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v10;
}

- (void)actionable:(id)a3 highlighted:(BOOL)a4 initialPress:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  char v10;
  objc_super v11;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  -[STUIStatusBarVisualProvider_Phone pillRegionCoordinator](self, "pillRegionCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "handledUpdateOfActionable:highlighted:initialPress:", v8, v6, v5);

  if ((v10 & 1) == 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)STUIStatusBarVisualProvider_Phone;
    -[STUIStatusBarVisualProvider_iOS actionable:highlighted:initialPress:](&v11, sel_actionable_highlighted_initialPress_, v8, v6, v5);
  }

}

@end
