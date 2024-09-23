@implementation PXDiagnosticsController

- (void)_updateGestureRecognizer
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  -[PXDiagnosticsController _gestureRecognizer](self, "_gestureRecognizer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[PXDiagnosticsSettings sharedInstance](PXDiagnosticsSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "enableContextualGesture");

  if (v4)
  {
    -[PXDiagnosticsController _window](self, "_window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    if (!v10)
    {
      v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleGestureRecognizer_);
      objc_msgSend(v11, "setNumberOfTouchesRequired:", 4);
      objc_msgSend(v11, "setNumberOfTapsRequired:", 2);
      objc_msgSend(v11, "setCancelsTouchesInView:", 0);
      objc_msgSend(v11, "setDelaysTouchesBegan:", 0);
      objc_msgSend(v11, "setDelaysTouchesEnded:", 0);
      objc_msgSend(v11, "setDelegate:", self);
      v6 = v11;
    }
    v12 = v6;
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 != v5)
    {
      objc_msgSend(v12, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeGestureRecognizer:", v12);

      objc_msgSend(v5, "addGestureRecognizer:", v12);
    }
  }
  else
  {
    objc_msgSend(v10, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeGestureRecognizer:", v10);

    v5 = v10;
    v12 = 0;
  }

  -[PXDiagnosticsController _setGestureRecognizer:](self, "_setGestureRecognizer:", v12);
}

- (void)setupOnInternalDevicesWithWindow:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (PFOSVariantHasInternalUI() && !self->__window)
  {
    objc_storeStrong((id *)&self->__window, a3);
    objc_setAssociatedObject(self->__window, (const void *)AssociatedObjectKeyDiagnosticsController, self, 0);
    -[PXDiagnosticsController _loadDiagnosticsServicesClasses](self, "_loadDiagnosticsServicesClasses");
    +[PXDiagnosticsSettings sharedInstance](PXDiagnosticsSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addKeyObserver:", self);

    -[PXDiagnosticsController _updateGestureRecognizer](self, "_updateGestureRecognizer");
  }

}

- (UIWindow)_window
{
  return self->__window;
}

- (void)_setGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->__gestureRecognizer, a3);
}

- (void)_loadDiagnosticsServicesClasses
{
  NSArray *v3;
  NSArray *diagnosticsServicesClasses;

  if (!self->__diagnosticsServicesClasses)
  {
    PXDiagnosticsServiceRegisteredClasses();
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    diagnosticsServicesClasses = self->__diagnosticsServicesClasses;
    self->__diagnosticsServicesClasses = v3;

  }
}

- (UITapGestureRecognizer)_gestureRecognizer
{
  return self->__gestureRecognizer;
}

+ (id)sharedController
{
  if (sharedController_onceToken_215150 != -1)
    dispatch_once(&sharedController_onceToken_215150, &__block_literal_global_215151);
  return (id)sharedController_sharedController_215152;
}

uint64_t __43__PXDiagnosticsController_sharedController__block_invoke()
{
  PXDiagnosticsController *v0;
  void *v1;
  uint64_t result;
  int out_token;

  v0 = objc_alloc_init(PXDiagnosticsController);
  v1 = (void *)sharedController_sharedController_215152;
  sharedController_sharedController_215152 = (uint64_t)v0;

  result = PFOSVariantHasInternalUI();
  if ((_DWORD)result)
  {
    out_token = 0;
    return notify_register_dispatch("ShowContextualDiagnostics", &out_token, MEMORY[0x1E0C80D38], &__block_literal_global_3_215154);
  }
  return result;
}

- (id)currentItemProviders
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;

  -[PXDiagnosticsController _window](self, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  PXRectGetCenter();
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "rootViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDiagnosticsController _itemProvidersFromPoint:inCoordinateSpace:viewController:](self, "_itemProvidersFromPoint:inCoordinateSpace:viewController:", v3, v8, v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)servicesWithItemProviders:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PXDiagnosticsController _diagnosticsServicesClasses](self, "_diagnosticsServicesClasses", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(objc_alloc(*(Class *)(*((_QWORD *)&v13 + 1) + 8 * v10)), "initWithItemProviders:", v4);
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)consoleDescriptionForServices:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "canProvideConsoleDescription"))
        {
          if (objc_msgSend(v4, "length"))
            objc_msgSend(v4, "appendFormat:", CFSTR("\n"));
          objc_msgSend(v10, "title");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "consoleDescription");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendFormat:", CFSTR("%@:\n%@\n"), v11, v12, (_QWORD)v14);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)presentContextualViewControllerForServices:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id obj;
  _QWORD v27[6];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", &__block_literal_global_11_215131);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectsAtIndexes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") == 1
    && (objc_msgSend(v5, "firstObject"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "canProvideContextualViewController"),
        v6,
        v7))
  {
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDiagnosticsController _executeService:](self, "_executeService:", v8);

  }
  else if (objc_msgSend(v5, "count"))
  {
    v24 = v3;
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Diagnostics"), 0, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v23 = v5;
    obj = v5;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v29;
      v13 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v15, "title", v23);
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v16;
          v18 = &stru_1E5149688;
          if (v16)
            v18 = (__CFString *)v16;
          v19 = v18;

          v27[0] = v13;
          v27[1] = 3221225472;
          v27[2] = __70__PXDiagnosticsController_presentContextualViewControllerForServices___block_invoke_2;
          v27[3] = &unk_1E51458F8;
          v27[4] = self;
          v27[5] = v15;
          objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v19, 0, v27);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "addAction:", v20);
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v11);
    }

    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v21);

    -[PXDiagnosticsController _topMostPresentedViewController](self, "_topMostPresentedViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "presentViewController:animated:completion:", v9, 1, 0);

    v5 = v23;
    v3 = v24;
  }

}

- (void)_handleGestureRecognizer:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "state") == 3)
  {
    -[PXDiagnosticsController _topMostPresentedViewController](self, "_topMostPresentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationInView:", v5);
    -[PXDiagnosticsController _presentContextualViewControllerFromPoint:inCoordinateSpace:](self, "_presentContextualViewControllerFromPoint:inCoordinateSpace:", v5);

  }
}

- (void)presentContextualDiagnostics
{
  id v3;

  -[PXDiagnosticsController _window](self, "_window");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  PXRectGetCenter();
  -[PXDiagnosticsController _presentContextualViewControllerFromPoint:inCoordinateSpace:](self, "_presentContextualViewControllerFromPoint:inCoordinateSpace:", v3);

}

- (void)_presentContextualViewControllerFromPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PXDiagnosticsController _topMostPresentedViewController](self, "_topMostPresentedViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PXDiagnosticsController _itemProvidersFromPoint:inCoordinateSpace:viewController:](self, "_itemProvidersFromPoint:inCoordinateSpace:viewController:", v7, v10, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXDiagnosticsController servicesWithItemProviders:](self, "servicesWithItemProviders:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDiagnosticsController presentContextualViewControllerForServices:](self, "presentContextualViewControllerForServices:", v9);

}

- (id)_itemProvidersFromPoint:(CGPoint)a3 inCoordinateSpace:(id)a4 viewController:(id)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  y = a3.y;
  x = a3.x;
  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  objc_msgSend(v8, "px_diagnosticsItemProvidersForPoint:inCoordinateSpace:", a4, x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXDiagnosticsItemProvider providerWithItem:identifier:](PXDiagnosticsItemProvider, "providerWithItem:identifier:", v8, CFSTR("PXDiagnosticsItemIdentifierViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_currentRootViewController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PXDiagnosticsController _window](self, "_window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = v3;
  v6 = v4;

  return v6;
}

- (id)_topMostPresentedViewController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PXDiagnosticsController _currentRootViewController](self, "_currentRootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    do
    {
      objc_msgSend(v2, "presentedViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "presentedViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v2 = v4;
    }
    while (v5);
  }
  else
  {
    v4 = v2;
  }
  return v4;
}

- (void)_executeService:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "contextualViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PXDiagnosticsController _topMostPresentedViewController](self, "_topMostPresentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);
    else
      objc_msgSend(v5, "px_presentViewControllerInNavigationController:animated:dimissButtonLocation:completion:", v4, 1, 0, 0);

  }
  if (objc_msgSend(v6, "canPerformAction"))
    objc_msgSend(v6, "performAction");

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[PXDiagnosticsController _gestureRecognizer](self, "_gestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return v6 == v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v4;
  char isKindOfClass;

  v4 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSArray)_diagnosticsServicesClasses
{
  return self->__diagnosticsServicesClasses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__gestureRecognizer, 0);
  objc_storeStrong((id *)&self->__diagnosticsServicesClasses, 0);
  objc_storeStrong((id *)&self->__window, 0);
}

uint64_t __70__PXDiagnosticsController_presentContextualViewControllerForServices___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_executeService:", *(_QWORD *)(a1 + 40));
}

uint64_t __70__PXDiagnosticsController_presentContextualViewControllerForServices___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "canProvideContextualViewController") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "canPerformAction");

  return v3;
}

+ (void)_presentContextualDiagnostics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_firstKeyWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(v3, (const void *)AssociatedObjectKeyDiagnosticsController);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_6:
    +[PXDiagnosticsController sharedController](PXDiagnosticsController, "sharedController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v6 = v4;

  v5 = v6;
  if (!v6)
    goto LABEL_6;
LABEL_7:
  v7 = v5;
  objc_msgSend(v5, "presentContextualDiagnostics");

}

uint64_t __43__PXDiagnosticsController_sharedController__block_invoke_2()
{
  return +[PXDiagnosticsController _presentContextualDiagnostics](PXDiagnosticsController, "_presentContextualDiagnostics");
}

@end
