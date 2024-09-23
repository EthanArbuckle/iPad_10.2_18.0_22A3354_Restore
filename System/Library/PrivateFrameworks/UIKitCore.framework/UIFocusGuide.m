@implementation UIFocusGuide

- (BOOL)_uili_isFocusGuide
{
  return 1;
}

- (UIFocusGuide)init
{
  UIFocusGuide *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIFocusGuide;
  result = -[UILayoutGuide init](&v3, sel_init);
  if (result)
  {
    result->_enabled = 1;
    result->_automaticallyDisableWhenIntersectingFocus = 1;
    result->_automaticallyPreferOwningView = 1;
  }
  return result;
}

- (void)_setAutomaticallyPreferOwningView:(BOOL)a3
{
  self->_automaticallyPreferOwningView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredFocusEnvironments, 0);
}

- (UIFocusGuide)initWithCoder:(id)a3
{
  id v4;
  UIFocusGuide *v5;
  UIFocusGuide *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *preferredFocusEnvironments;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  _QWORD v28[3];

  v28[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)UIFocusGuide;
  v5 = -[UILayoutGuide init](&v26, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_enabled = 1;
    v5->_automaticallyDisableWhenIntersectingFocus = 1;
    v5->_automaticallyPreferOwningView = 1;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_UIFocusGuideEnabledKey")))
      v6->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_UIFocusGuideEnabledKey"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_UIFocusGuideDidSetPreferredFocusedViewKey")))
      v6->_didSetPreferredFocusedEnvironments = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_UIFocusGuideDidSetPreferredFocusedViewKey"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_UIFocusGuideAutomaticallyDisableWhenIntersectingFocusKey")))v6->_automaticallyDisableWhenIntersectingFocus = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_UIFocusGuideAutomaticallyDisableWhenIntersectingFocusKey"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_UIFocusGuideAutomaticallyPreferOwningViewKey")))
      v6->_automaticallyPreferOwningView = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_UIFocusGuideAutomaticallyPreferOwningViewKey"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_UIFocusGuidePreferredFocusedViewKey"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
    {
      v28[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
      v9 = objc_claimAutoreleasedReturnValue();
      preferredFocusEnvironments = v6->_preferredFocusEnvironments;
      v6->_preferredFocusEnvironments = (NSArray *)v9;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("_UIFocusGuidePreferredFocusEnvironmentsKey"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      preferredFocusEnvironments = v11;
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](preferredFocusEnvironments, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v23 != v15)
              objc_enumerationMutation(preferredFocusEnvironments);
            v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            _UIFocusEnvironmentSafeCast(v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
              objc_msgSend(v12, "addObject:", v17, (_QWORD)v22);
          }
          v14 = -[NSArray countByEnumeratingWithState:objects:count:](preferredFocusEnvironments, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v14);
      }

      v19 = objc_msgSend(v12, "copy");
      v20 = v6->_preferredFocusEnvironments;
      v6->_preferredFocusEnvironments = (NSArray *)v19;

    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", self->_enabled, CFSTR("_UIFocusGuideEnabledKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_didSetPreferredFocusedEnvironments, CFSTR("_UIFocusGuideDidSetPreferredFocusedViewKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_automaticallyDisableWhenIntersectingFocus, CFSTR("_UIFocusGuideAutomaticallyDisableWhenIntersectingFocusKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_automaticallyPreferOwningView, CFSTR("_UIFocusGuideAutomaticallyPreferOwningViewKey"));
  -[UIFocusGuide _encodablePreferredFocusEnvironments](self, "_encodablePreferredFocusEnvironments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    objc_msgSend(v5, "encodeConditionalObject:forKey:", v4, CFSTR("_UIFocusGuidePreferredFocusEnvironmentsKey"));

}

- (id)_encodablePreferredFocusEnvironments
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[UIFocusGuide preferredFocusEnvironments](self, "preferredFocusEnvironments", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EDDD5BA0))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (NSArray)preferredFocusEnvironments
{
  NSArray *preferredFocusEnvironments;
  NSArray *v4;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_preferredFocusEnvironments, "count"))
  {
    preferredFocusEnvironments = self->_preferredFocusEnvironments;
  }
  else
  {
    if (-[UIFocusGuide _automaticallyPreferOwningView](self, "_automaticallyPreferOwningView"))
    {
      if (!self->_didSetPreferredFocusedEnvironments)
      {
        -[UILayoutGuide owningView](self, "owningView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          -[UILayoutGuide owningView](self, "owningView");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8[0] = v7;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
          v4 = (NSArray *)objc_claimAutoreleasedReturnValue();

          return v4;
        }
      }
    }
    preferredFocusEnvironments = self->_preferredFocusEnvironments;
    if (!preferredFocusEnvironments)
      preferredFocusEnvironments = (NSArray *)MEMORY[0x1E0C9AA60];
  }
  v4 = preferredFocusEnvironments;
  return v4;
}

- (void)setPreferredFocusEnvironments:(NSArray *)preferredFocusEnvironments
{
  NSArray *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSArray *v8;

  v4 = preferredFocusEnvironments;
  if (!v4 || self->_preferredFocusEnvironments != v4)
  {
    v8 = v4;
    v5 = -[NSArray copy](v4, "copy");
    v6 = (void *)v5;
    if (v5)
      v7 = (void *)v5;
    else
      v7 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&self->_preferredFocusEnvironments, v7);

    v4 = v8;
  }
  self->_didSetPreferredFocusedEnvironments = 1;

}

- (UIView)preferredFocusedView
{
  void *v2;
  void *v3;
  id v4;

  -[UIFocusGuide preferredFocusEnvironments](self, "preferredFocusEnvironments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && _IsKindOfUIView((uint64_t)v3))
    v4 = v3;
  else
    v4 = 0;

  return (UIView *)v4;
}

- (void)setPreferredFocusedView:(UIView *)preferredFocusedView
{
  UIView *v4;
  UIView *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = preferredFocusedView;
  v5 = v4;
  if (v4)
  {
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFocusGuide setPreferredFocusEnvironments:](self, "setPreferredFocusEnvironments:", v6);

  }
  else
  {
    -[UIFocusGuide setPreferredFocusEnvironments:](self, "setPreferredFocusEnvironments:", 0);
  }

}

- (id)_focusRegionFocusSystem
{
  void *v2;
  void *v3;

  -[UILayoutGuide owningView](self, "owningView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_focusSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)_focusRegionFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  -[UILayoutGuide owningView](self, "owningView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UILayoutGuide owningView](self, "owningView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide layoutFrame](self, "layoutFrame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[UILayoutGuide owningView](self, "owningView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "convertRect:toCoordinateSpace:", v14, v6, v8, v10, v12);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

  }
  else
  {
    v16 = *MEMORY[0x1E0C9D648];
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v23 = v16;
  v24 = v18;
  v25 = v20;
  v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (BOOL)_legacy_isEligibleForFocusInteraction
{
  void *v3;
  void *v4;
  char v5;

  if (!-[UIFocusGuide isEnabled](self, "isEnabled"))
    return 0;
  -[UILayoutGuide owningView](self, "owningView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIFocusGuide preferredFocusedView](self, "preferredFocusedView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[UIView _containsPreferredFocusableView](v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (UIFocusItemContainer)focusItemContainer
{
  return 0;
}

- (id)_childFocusRegionsInRect:(CGRect)a3 inCoordinateSpace:(id)a4
{
  return 0;
}

- (BOOL)_isPromiseFocusRegion
{
  return 0;
}

- (id)_fulfillPromisedFocusRegion
{
  return 0;
}

- (BOOL)_isTransparentFocusRegion
{
  return 0;
}

- (id)_focusRegionGuides
{
  return 0;
}

- (BOOL)_isEligibleForFocusInteraction
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[UIFocusGuide isEnabled](self, "isEnabled"))
    return 0;
  -[UILayoutGuide owningView](self, "owningView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIFocusGuide preferredFocusEnvironments](self, "preferredFocusEnvironments");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (id)_preferredFocusRegionCoordinateSpace
{
  void *v2;
  void *v3;
  void *v4;

  -[UILayoutGuide owningView](self, "owningView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coordinateSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_searchForFocusRegionsInContext:(id)a3
{
  id v4;
  _UIFocusGuideRegion *v5;
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
  _UIFocusGuideRegion *v16;

  v4 = a3;
  v5 = [_UIFocusGuideRegion alloc];
  -[UILayoutGuide layoutFrame](self, "layoutFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[UILayoutGuide owningView](self, "owningView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "coordinateSpace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[_UIFocusGuideRegion initWithFrame:coordinateSpace:](v5, "initWithFrame:coordinateSpace:", v15, v7, v9, v11, v13);

  -[_UIFocusGuideRegion setDelegate:](v16, "setDelegate:", self);
  -[_UIFocusGuideRegion _setIsUnoccludable:](v16, "_setIsUnoccludable:", -[UIFocusGuide _isUnoccludable](self, "_isUnoccludable"));
  -[UIFocusGuide _focusPriority](self, "_focusPriority");
  -[_UIFocusGuideRegion _setFocusPriority:](v16, "_setFocusPriority:");
  -[_UIFocusGuideRegion _setIgnoresSpeedBumpEdges:](v16, "_setIgnoresSpeedBumpEdges:", -[UIFocusGuide _ignoresSpeedBumpEdges](self, "_ignoresSpeedBumpEdges"));
  -[_UIFocusGuideRegion _setIsUnclippable:](v16, "_setIsUnclippable:", -[UIFocusGuide _isUnclippable](self, "_isUnclippable"));
  objc_msgSend(v4, "addRegion:", v16);

}

- (BOOL)_isUnoccludable
{
  return 0;
}

- (BOOL)_isUnclippable
{
  return 0;
}

- (float)_focusPriority
{
  return 500.0;
}

- (BOOL)_ignoresSpeedBumpEdges
{
  return 0;
}

- (void)focusGuideRegion:(id)a3 willParticipateAsDestinationRegionInFocusUpdate:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  objc_msgSend(v6, "_focusedGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(v6, "_setFocusedGuide:", self);

}

- (NSString)description
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)UIFocusGuide;
  -[UILayoutGuide description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIFocusGuide isEnabled](self, "isEnabled");
  v6 = CFSTR("NO");
  if (v5)
    v6 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, isEnabled: %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)enabled
{
  self->_enabled = enabled;
}

- (BOOL)_automaticallyPreferOwningView
{
  return self->_automaticallyPreferOwningView;
}

- (BOOL)_automaticallyDisableWhenIntersectingFocus
{
  return self->_automaticallyDisableWhenIntersectingFocus;
}

- (void)_setAutomaticallyDisableWhenIntersectingFocus:(BOOL)a3
{
  self->_automaticallyDisableWhenIntersectingFocus = a3;
}

@end
