@implementation SBDeviceApplicationSceneStatusBarStateProvider_Base

- (void)enumerateObserversWithBlock:(id)a3
{
  unint64_t v3;
  void (**v5)(id, void *, unint64_t);
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  unsigned int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *, unint64_t))a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = (void *)-[NSMutableArray copy](self->_observers, "copy", 0);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v12, "observer");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "flags");
          if (v13)
          {
            v3 = v3 & 0xFFFFFFFF00000000 | v14;
            v5[2](v5, v13, v3);
          }
          else
          {
            objc_msgSend(v6, "addObject:", v12);
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    -[NSMutableArray removeObjectsInArray:](self->_observers, "removeObjectsInArray:", v6);
  }

}

- (int64_t)statusBarStyleForPartWithIdentifier:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  if (-[SBDeviceApplicationSceneStatusBarStateProvider_Base _statusBarAppearsOutsideOfAJailedApp](self, "_statusBarAppearsOutsideOfAJailedApp"))
  {
    v5 = 1;
  }
  else
  {
    v5 = -[SBDeviceApplicationSceneStatusBarStateProvider_Base _statusBarStyleForPartWithIdentifier:suppressingInherited:](self, "_statusBarStyleForPartWithIdentifier:suppressingInherited:", v4, 0);
  }

  return v5;
}

- (id)statusBarPartStyles
{
  void *v3;

  if (-[SBDeviceApplicationSceneStatusBarStateProvider_Base _statusBarAppearsOutsideOfAJailedApp](self, "_statusBarAppearsOutsideOfAJailedApp"))
  {
    v3 = 0;
  }
  else
  {
    -[SBDeviceApplicationSceneStatusBarStateProvider_Base _statusBarPartStyles](self, "_statusBarPartStyles");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int64_t)defaultStatusBarStyle
{
  if (-[SBDeviceApplicationSceneStatusBarStateProvider_Base _statusBarAppearsOutsideOfAJailedApp](self, "_statusBarAppearsOutsideOfAJailedApp"))
  {
    return 1;
  }
  else
  {
    return -[SBDeviceApplicationSceneStatusBarStateProvider_Base _defaultStatusBarStyle](self, "_defaultStatusBarStyle");
  }
}

- (int64_t)statusBarStyle
{
  if (-[SBDeviceApplicationSceneStatusBarStateProvider_Base _statusBarAppearsOutsideOfAJailedApp](self, "_statusBarAppearsOutsideOfAJailedApp"))
  {
    return 1;
  }
  else
  {
    return -[SBDeviceApplicationSceneStatusBarStateProvider_Base _statusBarStyle](self, "_statusBarStyle");
  }
}

- (int64_t)statusBarOrientation
{
  void *v4;
  uint64_t v5;

  if (-[SBDeviceApplicationSceneStatusBarStateProvider_Base _statusBarAppearsOutsideOfAJailedApp](self, "_statusBarAppearsOutsideOfAJailedApp"))
  {
    if (__sb__runningInSpringBoard())
    {
      if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
        return 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "userInterfaceIdiom");

      if (!v5)
        return 1;
    }
  }
  return -[SBDeviceApplicationSceneStatusBarStateProvider_Base _statusBarOrientationGivenFallbackOrientation:](self, "_statusBarOrientationGivenFallbackOrientation:", -[SBDeviceApplicationSceneStatusBarStateProvider_Base _fallbackInterfaceOrientation](self, "_fallbackInterfaceOrientation"));
}

- (BOOL)statusBarHidden
{
  return !-[SBDeviceApplicationSceneStatusBarStateProvider_Base _statusBarAppearsOutsideOfAJailedApp](self, "_statusBarAppearsOutsideOfAJailedApp")&& -[SBDeviceApplicationSceneStatusBarStateProvider_Base _statusBarHiddenGivenFallbackOrientation:](self, "_statusBarHiddenGivenFallbackOrientation:", -[SBDeviceApplicationSceneStatusBarStateProvider_Base _fallbackInterfaceOrientation](self, "_fallbackInterfaceOrientation"));
}

- (double)statusBarAlpha
{
  double result;

  if (-[SBDeviceApplicationSceneStatusBarStateProvider_Base _statusBarAppearsOutsideOfAJailedApp](self, "_statusBarAppearsOutsideOfAJailedApp"))
  {
    return 1.0;
  }
  -[SBDeviceApplicationSceneStatusBarStateProvider_Base _statusBarAlpha](self, "_statusBarAlpha");
  return result;
}

- (void)addStatusBarObserver:(id)a3
{
  id v4;
  NSMutableArray *observers;
  id v6;
  _SBDeviceApplicationSceneStatusBarStateProviderObserverRecord *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    v9[1] = 3221225472;
    v9[2] = __76__SBDeviceApplicationSceneStatusBarStateProvider_Base_addStatusBarObserver___block_invoke;
    v9[3] = &unk_1E8EA81E0;
    v8 = v4;
    v9[0] = MEMORY[0x1E0C809B0];
    v6 = v4;
    v10 = v6;
    if ((-[NSMutableArray bs_containsObjectPassingTest:](observers, "bs_containsObjectPassingTest:", v9) & 1) == 0)
    {
      v7 = -[_SBDeviceApplicationSceneStatusBarStateProviderObserverRecord initWithObserver:andFlags:]([_SBDeviceApplicationSceneStatusBarStateProviderObserverRecord alloc], "initWithObserver:andFlags:", v6, _SBDeviceApplicationSceneStatusBarStateObserverFlagsForObserver(v6));
      -[NSMutableArray addObject:](self->_observers, "addObject:", v7);

    }
    v4 = v8;
  }

}

- (SBDeviceApplicationSceneStatusBarStateProvider_Base)init
{
  SBDeviceApplicationSceneStatusBarStateProvider_Base *v2;
  uint64_t v3;
  NSMutableArray *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBDeviceApplicationSceneStatusBarStateProvider_Base;
  v2 = -[SBDeviceApplicationSceneStatusBarStateProvider_Base init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)removeStatusBarObserver:(id)a3
{
  id v4;
  NSMutableArray *observers;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  observers = self->_observers;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__SBDeviceApplicationSceneStatusBarStateProvider_Base_removeStatusBarObserver___block_invoke;
  v8[3] = &unk_1E8EA81E0;
  v7 = v4;
  v9 = v7;
  -[NSMutableArray bs_firstObjectPassingTest:](observers, "bs_firstObjectPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[NSMutableArray removeObject:](self->_observers, "removeObject:", v6);

}

- (id)_observerRecords
{
  return self->_observers;
}

- (BOOL)SB_conformsToSBApplicationSceneStatusBarDescribing
{
  return 1;
}

- (NSSet)backgroundActivitiesToSuppress
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneStatusBarStateProvider_Base.m"), 142, CFSTR("subclasses must override!"));

  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (CGRect)statusBarAvoidanceFrame
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneStatusBarStateProvider_Base.m"), 148, CFSTR("subclasses must override!"));

  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (BOOL)sceneWantsDeviceOrientationEventsEnabled
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneStatusBarStateProvider_Base.m"), 154, CFSTR("subclasses must override!"));

  return 0;
}

- (_UIStatusBarData)overlayStatusBarData
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneStatusBarStateProvider_Base.m"), 159, CFSTR("subclasses must override!"));

  return 0;
}

- (SBDeviceApplicationSceneStatusBarBreadcrumbProvider)breadcrumbProvider
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneStatusBarStateProvider_Base.m"), 164, CFSTR("subclasses must override!"));

  return 0;
}

- (NSString)statusBarSceneIdentifier
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneStatusBarStateProvider_Base.m"), 169, CFSTR("subclasses must override!"));

  return 0;
}

- (SBDeviceApplicationSceneHandle)classicApplicationSceneHandleIfExists
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneStatusBarStateProvider_Base.m"), 174, CFSTR("subclasses must override!"));

  return 0;
}

- (FBScene)sceneToHandleStatusBarTapIfExists
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneStatusBarStateProvider_Base.m"), 179, CFSTR("subclasses must override!"));

  return 0;
}

- (int64_t)_statusBarStyle
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneStatusBarStateProvider_Base.m"), 186, CFSTR("subclasses must override!"));

  return 4;
}

- (int64_t)_defaultStatusBarStyle
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneStatusBarStateProvider_Base.m"), 191, CFSTR("subclasses must override!"));

  return 4;
}

- (id)_statusBarPartStyles
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneStatusBarStateProvider_Base.m"), 196, CFSTR("subclasses must override!"));

  return 0;
}

- (int64_t)_statusBarStyleForPartWithIdentifier:(id)a3 suppressingInherited:(BOOL)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneStatusBarStateProvider_Base.m"), 201, CFSTR("subclasses must override!"));

  return 4;
}

- (double)_statusBarAlpha
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneStatusBarStateProvider_Base.m"), 206, CFSTR("subclasses must override!"));

  return 0.0;
}

- (BOOL)_statusBarHiddenGivenFallbackOrientation:(int64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneStatusBarStateProvider_Base.m"), 211, CFSTR("subclasses must override!"));

  return 0;
}

- (int64_t)_statusBarOrientationGivenFallbackOrientation:(int64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneStatusBarStateProvider_Base.m"), 216, CFSTR("subclasses must override!"));

  return 0;
}

- (BOOL)_suppressInheritedPartStyles
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneStatusBarStateProvider_Base.m"), 221, CFSTR("subclasses must override!"));

  return 0;
}

- (BOOL)_statusBarAppearsOutsideOfAJailedApp
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneStatusBarStateProvider_Base.m"), 226, CFSTR("subclasses must override!"));

  return 0;
}

- (int64_t)_fallbackInterfaceOrientation
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceApplicationSceneStatusBarStateProvider_Base.m"), 231, CFSTR("subclasses must override!"));

  return 0;
}

- (id)_allObservers
{
  void *v2;
  void *v3;

  -[SBDeviceApplicationSceneStatusBarStateProvider_Base _observerRecords](self, "_observerRecords");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_map:", &__block_literal_global_93);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)description
{
  return (NSString *)-[SBDeviceApplicationSceneStatusBarStateProvider_Base descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBDeviceApplicationSceneStatusBarStateProvider_Base succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBDeviceApplicationSceneStatusBarStateProvider_Base descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[SBDeviceApplicationSceneStatusBarStateProvider_Base succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __93__SBDeviceApplicationSceneStatusBarStateProvider_Base_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E8E9E820;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v10);

  v7 = v11;
  v8 = v6;

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
