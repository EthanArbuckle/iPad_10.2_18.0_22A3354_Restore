@implementation _UIStatusBarVisualProvider_Phone

+ (Class)visualProviderSubclassForScreen:(id)a3 visualProviderInfo:(id)a4
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v11;

  v4 = a3;
  objc_msgSend(v4, "_exclusionArea");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "rect");
  }
  else
  {
    if (_UIInternalPreferencesRevisionOnce != -1)
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
    v6 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar >= 1)
    {
      v11 = _UIInternalPreference_LegacyPhonesStatusBarUsesiPadLayout;
      if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_LegacyPhonesStatusBarUsesiPadLayout)
      {
        while (v6 >= v11)
        {
          _UIInternalPreferenceSync(v6, &_UIInternalPreference_LegacyPhonesStatusBarUsesiPadLayout, (uint64_t)CFSTR("LegacyPhonesStatusBarUsesiPadLayout"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
          v11 = _UIInternalPreference_LegacyPhonesStatusBarUsesiPadLayout;
          if (v6 == _UIInternalPreference_LegacyPhonesStatusBarUsesiPadLayout)
            goto LABEL_6;
        }
        if (byte_1EDDA82E4)
        {
          objc_opt_class();
          v8 = objc_claimAutoreleasedReturnValue();
          goto LABEL_7;
        }
      }
    }
  }
LABEL_6:
  v7 = (void *)objc_opt_class();
  _UIStatusBarGetVisualProviderSubclassForScreenWithVisualProviderInfo(v7, v4, 0);
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v9 = (void *)v8;

  return (Class)v9;
}

- (_UIStatusBarVisualProvider_Phone)init
{
  _UIStatusBarVisualProvider_Phone *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarVisualProvider_Phone;
  v2 = -[_UIStatusBarVisualProvider_iOS init](&v6, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[_UIStatusBarVisualProvider_Phone setPillRegionCoordinator:](v2, "setPillRegionCoordinator:", v3);

    -[_UIStatusBarVisualProvider_Phone pillRegionCoordinator](v2, "pillRegionCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setVisualProvider:", v2);

  }
  return v2;
}

- (id)willUpdateWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIStatusBarVisualProvider_Phone;
  v4 = a3;
  -[_UIStatusBarVisualProvider_iOS willUpdateWithData:](&v8, sel_willUpdateWithData_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarVisualProvider_Phone pillRegionCoordinator](self, "pillRegionCoordinator", v8.receiver, v8.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateDataForBackgroundActivity:", v4);

  return v5;
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
  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarPillBackgroundActivityItem, "defaultDisplayIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[_UIStatusBarVisualProvider_Phone pillRegionCoordinator](self, "pillRegionCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "animationForBackgroundActivityIcon");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v10 = (void *)v12;

    goto LABEL_7;
  }
  +[_UIStatusBarBackgroundActivityItem backgroundDisplayIdentifier](_UIStatusBarPillBackgroundActivityItem, "backgroundDisplayIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v6)
  {
    -[_UIStatusBarVisualProvider_Phone pillRegionCoordinator](self, "pillRegionCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "animationForBackgroundActivityPill");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v14.receiver = self;
  v14.super_class = (Class)_UIStatusBarVisualProvider_Phone;
  -[_UIStatusBarVisualProvider_iOS additionAnimationForDisplayItemWithIdentifier:itemAnimation:](&v14, sel_additionAnimationForDisplayItemWithIdentifier_itemAnimation_, v6, v7);
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
  +[_UIStatusBarItem defaultDisplayIdentifier](_UIStatusBarPillBackgroundActivityItem, "defaultDisplayIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[_UIStatusBarVisualProvider_Phone pillRegionCoordinator](self, "pillRegionCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "animationForBackgroundActivityIcon");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v10 = (void *)v12;

    goto LABEL_7;
  }
  +[_UIStatusBarBackgroundActivityItem backgroundDisplayIdentifier](_UIStatusBarPillBackgroundActivityItem, "backgroundDisplayIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v6)
  {
    -[_UIStatusBarVisualProvider_Phone pillRegionCoordinator](self, "pillRegionCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "animationForBackgroundActivityPill");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v14.receiver = self;
  v14.super_class = (Class)_UIStatusBarVisualProvider_Phone;
  -[_UIStatusBarVisualProvider_iOS removalAnimationForDisplayItemWithIdentifier:itemAnimation:](&v14, sel_removalAnimationForDisplayItemWithIdentifier_itemAnimation_, v6, v7);
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
  -[_UIStatusBarVisualProvider_Phone pillRegionCoordinator](self, "pillRegionCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "handledUpdateOfActionable:highlighted:initialPress:", v8, v6, v5);

  if ((v10 & 1) == 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIStatusBarVisualProvider_Phone;
    -[_UIStatusBarVisualProvider_iOS actionable:highlighted:initialPress:](&v11, sel_actionable_highlighted_initialPress_, v8, v6, v5);
  }

}

- (_UIStatusBarVisualProvider_PillRegionCoordinator)pillRegionCoordinator
{
  return self->_pillRegionCoordinator;
}

- (void)setPillRegionCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_pillRegionCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pillRegionCoordinator, 0);
}

@end
