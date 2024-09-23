@implementation CACSceneManager

- (CACSceneManager)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  __int128 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CACSceneManager;
  v2 = -[CACSceneManager init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    v4 = (void *)*((_QWORD *)v2 + 20);
    *((_QWORD *)v2 + 20) = v3;

    v5 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
    *(_OWORD *)(v2 + 168) = *MEMORY[0x24BDBF090];
    *(_OWORD *)(v2 + 184) = v5;
  }
  return (CACSceneManager *)v2;
}

- (unsigned)displayID
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[CACSceneManager scene](self, "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_integerDisplayID");

  return v4;
}

- (BOOL)isMainDisplayScene
{
  unsigned int v2;
  void *v3;

  v2 = -[CACSceneManager displayID](self, "displayID");
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v2 == objc_msgSend(v3, "_integerDisplayID");

  return v2;
}

- (BOOL)isCarPlayScene
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[CACSceneManager scene](self, "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "role");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEBEC10]);

  return v5;
}

- (id)screen
{
  void *v3;
  void *v4;
  void *v5;

  -[CACSceneManager scene](self, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CACSceneManager scene](self, "scene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)registerPresentationManager:(id)a3
{
  NSMutableArray *v4;
  id v5;

  v5 = a3;
  v4 = self->_registeredPresentationManagers;
  objc_sync_enter(v4);
  -[NSMutableArray addObject:](self->_registeredPresentationManagers, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)showBannerViewWithText:(id)a3 type:(int64_t)a4
{
  id v6;
  void *v7;
  CACBannerViewPresenter *v8;
  void *v9;
  CACBannerViewPresenter *v10;
  id v11;

  v6 = a3;
  -[CACSceneManager bannerViewPresenter](self, "bannerViewPresenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = [CACBannerViewPresenter alloc];
    -[CACContainerViewController viewAboveContainedViews](self->_overlayContainerViewController, "viewAboveContainedViews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CACBannerViewPresenter initWithContainingView:](v8, "initWithContainingView:", v9);
    -[CACSceneManager setBannerViewPresenter:](self, "setBannerViewPresenter:", v10);

  }
  -[CACSceneManager bannerViewPresenter](self, "bannerViewPresenter");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentBannerViewWithText:type:avoidingSystemAperature:", v6, a4, self->_systemAperatureRect.origin.x, self->_systemAperatureRect.origin.y, self->_systemAperatureRect.size.width, self->_systemAperatureRect.size.height);

}

- (id)_containerViewControllerForViewController:(id)a3
{
  int v4;
  uint64_t v5;

  v4 = objc_msgSend(a3, "isOverlay");
  v5 = 32;
  if (v4)
    v5 = 40;
  return *(id *)((char *)&self->super.isa + v5);
}

- (void)_installViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[CACSceneManager _containerViewControllerForViewController:](self, "_containerViewControllerForViewController:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "installViewController:animated:completion:", v9, v5, v8);

}

- (void)_uninstallViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[CACSceneManager _containerViewControllerForViewController:](self, "_containerViewControllerForViewController:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uninstallViewController:animated:completion:", v9, v5, v8);

}

- (void)hideAnyOverlayAnimated:(BOOL)a3 includeInteractiveOverlays:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSMutableArray *v7;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  const __CFString *v22;
  uint64_t v23;

  v4 = a4;
  v5 = a3;
  v23 = *MEMORY[0x24BDAC8D0];
  v7 = self->_registeredPresentationManagers;
  objc_sync_enter(v7);
  v8 = (void *)-[NSMutableArray copy](self->_registeredPresentationManagers, "copy");
  objc_sync_exit(v7);

  CACLogGeneral();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = CFSTR("excluding");
    if (v4)
      v10 = CFSTR("including");
    *(_DWORD *)buf = 138412290;
    v22 = v10;
    _os_log_impl(&dword_229A40000, v9, OS_LOG_TYPE_INFO, "Hiding all overlays %@ interactive", buf, 0xCu);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v15, "isShowing", (_QWORD)v16)
          && objc_msgSend(v15, "isOverlay")
          && (v4 || (objc_msgSend(v15, "isPhysiciallyInteractiveOverlay") & 1) == 0))
        {
          if (v5)
            objc_msgSend(v15, "hide");
          else
            objc_msgSend(v15, "hideWithoutAnimation");
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

- (void)hideAnyPresentationAnimated:(BOOL)a3 includingOutOfProcessPresentations:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSMutableArray *v7;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  const __CFString *v22;
  uint64_t v23;

  v4 = a4;
  v5 = a3;
  v23 = *MEMORY[0x24BDAC8D0];
  v7 = self->_registeredPresentationManagers;
  objc_sync_enter(v7);
  v8 = (void *)-[NSMutableArray copy](self->_registeredPresentationManagers, "copy");
  objc_sync_exit(v7);

  CACLogGeneral();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = CFSTR("excluding");
    if (v4)
      v10 = CFSTR("including");
    *(_DWORD *)buf = 138412290;
    v22 = v10;
    _os_log_impl(&dword_229A40000, v9, OS_LOG_TYPE_INFO, "Hiding all presentations %@ out of process", buf, 0xCu);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v15, "isOverlay", (_QWORD)v16) & 1) == 0
          && (v4 || (objc_msgSend(v15, "isOutOfProcess") & 1) == 0))
        {
          if (v5)
            objc_msgSend(v15, "hide");
          else
            objc_msgSend(v15, "hideWithoutAnimation");
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

- (void)hideDictationRecognizerModeOverlayNow
{
  NSMutableArray *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = self->_registeredPresentationManagers;
  objc_sync_enter(v3);
  v4 = (void *)-[NSMutableArray copy](self->_registeredPresentationManagers, "copy");
  objc_sync_exit(v3);

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "isShowing", (_QWORD)v10))
          objc_msgSend(v9, "hideWithoutAnimation");
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (BOOL)isDisplayingAnyContentView
{
  NSMutableArray *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = self->_registeredPresentationManagers;
  objc_sync_enter(v3);
  v4 = (void *)-[NSMutableArray copy](self->_registeredPresentationManagers, "copy");
  objc_sync_exit(v3);

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isShowing", (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)isDisplayingAnyPresentation
{
  NSMutableArray *v3;
  void *v4;
  id v5;
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

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = self->_registeredPresentationManagers;
  objc_sync_enter(v3);
  v4 = (void *)-[NSMutableArray copy](self->_registeredPresentationManagers, "copy");
  objc_sync_exit(v3);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isShowing", (_QWORD)v11) && (objc_msgSend(v9, "isOverlay") & 1) == 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

- (BOOL)isDisplayingCorrections
{
  NSMutableArray *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  BOOL v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = self->_registeredPresentationManagers;
  objc_sync_enter(v3);
  v4 = (void *)-[NSMutableArray copy](self->_registeredPresentationManagers, "copy");
  objc_sync_exit(v3);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "isShowing", (_QWORD)v14))
        {
          if ((objc_msgSend(v9, "isOverlay") & 1) == 0)
          {
            -[CACSceneManager correctionPresentationManager](self, "correctionPresentationManager");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v9 == v10;

            if (v11)
            {
              v12 = 1;
              goto LABEL_13;
            }
          }
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (BOOL)isDisplayingAnyInteractiveContentInProcess
{
  NSMutableArray *v3;
  void *v4;
  id v5;
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

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = self->_registeredPresentationManagers;
  objc_sync_enter(v3);
  v4 = (void *)-[NSMutableArray copy](self->_registeredPresentationManagers, "copy");
  objc_sync_exit(v3);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isShowing", (_QWORD)v11)
          && (objc_msgSend(v9, "isOverlay") & 1) == 0
          && (objc_msgSend(v9, "isOutOfProcess") & 1) == 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_13;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_13:

  return v6;
}

- (BOOL)isDisplayingAnyOutOfProcessPresentation
{
  NSMutableArray *v3;
  void *v4;
  id v5;
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

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = self->_registeredPresentationManagers;
  objc_sync_enter(v3);
  v4 = (void *)-[NSMutableArray copy](self->_registeredPresentationManagers, "copy");
  objc_sync_exit(v3);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isShowing", (_QWORD)v11) && (objc_msgSend(v9, "isOutOfProcess") & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

- (BOOL)isDisplayingAnyOverlay
{
  NSMutableArray *v3;
  void *v4;
  id v5;
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

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = self->_registeredPresentationManagers;
  objc_sync_enter(v3);
  v4 = (void *)-[NSMutableArray copy](self->_registeredPresentationManagers, "copy");
  objc_sync_exit(v3);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isShowing", (_QWORD)v11) && (objc_msgSend(v9, "isOverlay") & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

- (void)redrawGridIfExists
{
  -[CACLabeledGridOverlayManager setNeedsToBeRedrawn:](self->_labeledGridOverlayManager, "setNeedsToBeRedrawn:", 1);
}

- (CACLabeledElementsOverlayManager)labeledElementsOverlayManager
{
  CACLabeledElementsOverlayManager *labeledElementsOverlayManager;
  CACLabeledElementsOverlayManager *v4;
  CACLabeledElementsOverlayManager *v5;

  labeledElementsOverlayManager = self->_labeledElementsOverlayManager;
  if (!labeledElementsOverlayManager)
  {
    v4 = objc_alloc_init(CACLabeledElementsOverlayManager);
    v5 = self->_labeledElementsOverlayManager;
    self->_labeledElementsOverlayManager = v4;

    -[CACLabeledElementsOverlayManager setDelegate:](self->_labeledElementsOverlayManager, "setDelegate:", self);
    -[CACSceneManager registerPresentationManager:](self, "registerPresentationManager:", self->_labeledElementsOverlayManager);
    labeledElementsOverlayManager = self->_labeledElementsOverlayManager;
  }
  return labeledElementsOverlayManager;
}

- (CACLabeledGridOverlayManager)labeledGridOverlayManager
{
  CACLabeledGridOverlayManager *labeledGridOverlayManager;
  CACLabeledGridOverlayManager *v4;
  CACLabeledGridOverlayManager *v5;

  labeledGridOverlayManager = self->_labeledGridOverlayManager;
  if (!labeledGridOverlayManager)
  {
    v4 = objc_alloc_init(CACLabeledGridOverlayManager);
    v5 = self->_labeledGridOverlayManager;
    self->_labeledGridOverlayManager = v4;

    -[CACLabeledGridOverlayManager setDelegate:](self->_labeledGridOverlayManager, "setDelegate:", self);
    -[CACSceneManager registerPresentationManager:](self, "registerPresentationManager:", self->_labeledGridOverlayManager);
    -[CACSceneManager updateGridLayoutFromPreferences](self, "updateGridLayoutFromPreferences");
    labeledGridOverlayManager = self->_labeledGridOverlayManager;
  }
  return labeledGridOverlayManager;
}

- (CACElementNamesOverlayManager)elementNamesOverlayManager
{
  CACElementNamesOverlayManager *elementNamesOverlayManager;
  CACElementNamesOverlayManager *v4;
  CACElementNamesOverlayManager *v5;

  elementNamesOverlayManager = self->_elementNamesOverlayManager;
  if (!elementNamesOverlayManager)
  {
    v4 = objc_alloc_init(CACElementNamesOverlayManager);
    v5 = self->_elementNamesOverlayManager;
    self->_elementNamesOverlayManager = v4;

    -[CACElementNamesOverlayManager setDelegate:](self->_elementNamesOverlayManager, "setDelegate:", self);
    -[CACSceneManager registerPresentationManager:](self, "registerPresentationManager:", self->_elementNamesOverlayManager);
    elementNamesOverlayManager = self->_elementNamesOverlayManager;
  }
  return elementNamesOverlayManager;
}

- (CACEditingModeOverlayManager)editingModeOverlayManager
{
  CACEditingModeOverlayManager *editingModeOverlayManager;
  CACEditingModeOverlayManager *v4;
  CACEditingModeOverlayManager *v5;

  editingModeOverlayManager = self->_editingModeOverlayManager;
  if (!editingModeOverlayManager)
  {
    v4 = objc_alloc_init(CACEditingModeOverlayManager);
    v5 = self->_editingModeOverlayManager;
    self->_editingModeOverlayManager = v4;

    -[CACEditingModeOverlayManager setDelegate:](self->_editingModeOverlayManager, "setDelegate:", self);
    -[CACSceneManager registerPresentationManager:](self, "registerPresentationManager:", self->_editingModeOverlayManager);
    editingModeOverlayManager = self->_editingModeOverlayManager;
  }
  return editingModeOverlayManager;
}

- (CACEditingModeOverlayManager)linesEditingModeOverlayManager
{
  CACEditingModeOverlayManager *linesEditingModeOverlayManager;
  CACEditingModeOverlayManager *v4;
  CACEditingModeOverlayManager *v5;

  linesEditingModeOverlayManager = self->_linesEditingModeOverlayManager;
  if (!linesEditingModeOverlayManager)
  {
    v4 = objc_alloc_init(CACEditingModeOverlayManager);
    v5 = self->_linesEditingModeOverlayManager;
    self->_linesEditingModeOverlayManager = v4;

    -[CACEditingModeOverlayManager setDelegate:](self->_linesEditingModeOverlayManager, "setDelegate:", self);
    -[CACSceneManager registerPresentationManager:](self, "registerPresentationManager:", self->_linesEditingModeOverlayManager);
    linesEditingModeOverlayManager = self->_linesEditingModeOverlayManager;
  }
  return linesEditingModeOverlayManager;
}

- (CACGestureLivePreviewOverlayManager)gestureLivePreviewPresentationOverlayManager
{
  CACGestureLivePreviewOverlayManager *gestureLivePreviewOverlayManager;
  CACGestureLivePreviewOverlayManager *v4;
  CACGestureLivePreviewOverlayManager *v5;

  gestureLivePreviewOverlayManager = self->_gestureLivePreviewOverlayManager;
  if (!gestureLivePreviewOverlayManager)
  {
    v4 = objc_alloc_init(CACGestureLivePreviewOverlayManager);
    v5 = self->_gestureLivePreviewOverlayManager;
    self->_gestureLivePreviewOverlayManager = v4;

    -[CACSimpleContentViewManager setContentViewManagerDelegate:](self->_gestureLivePreviewOverlayManager, "setContentViewManagerDelegate:", self);
    -[CACSceneManager registerPresentationManager:](self, "registerPresentationManager:", self->_gestureLivePreviewOverlayManager);
    gestureLivePreviewOverlayManager = self->_gestureLivePreviewOverlayManager;
  }
  return gestureLivePreviewOverlayManager;
}

- (CACElementActionsPresentationManager)elementActionsPresentationManager
{
  CACElementActionsPresentationManager *elementActionsPresentationManager;
  CACElementActionsPresentationManager *v4;
  CACElementActionsPresentationManager *v5;

  elementActionsPresentationManager = self->_elementActionsPresentationManager;
  if (!elementActionsPresentationManager)
  {
    v4 = objc_alloc_init(CACElementActionsPresentationManager);
    v5 = self->_elementActionsPresentationManager;
    self->_elementActionsPresentationManager = v4;

    -[CACSimpleContentViewManager setContentViewManagerDelegate:](self->_elementActionsPresentationManager, "setContentViewManagerDelegate:", self);
    -[CACSceneManager registerPresentationManager:](self, "registerPresentationManager:", self->_elementActionsPresentationManager);
    elementActionsPresentationManager = self->_elementActionsPresentationManager;
  }
  return elementActionsPresentationManager;
}

- (CACCorrectionPresentationManager)correctionPresentationManager
{
  CACCorrectionPresentationManager *correctionPresentationManager;
  CACCorrectionPresentationManager *v4;
  CACCorrectionPresentationManager *v5;

  correctionPresentationManager = self->_correctionPresentationManager;
  if (!correctionPresentationManager)
  {
    v4 = objc_alloc_init(CACCorrectionPresentationManager);
    v5 = self->_correctionPresentationManager;
    self->_correctionPresentationManager = v4;

    -[CACSimpleContentViewManager setContentViewManagerDelegate:](self->_correctionPresentationManager, "setContentViewManagerDelegate:", self);
    -[CACSceneManager registerPresentationManager:](self, "registerPresentationManager:", self->_correctionPresentationManager);
    correctionPresentationManager = self->_correctionPresentationManager;
  }
  return correctionPresentationManager;
}

- (CACCustomCommandEditorPresentationManager)customCommandEditorPresentationManager
{
  CACCustomCommandEditorPresentationManager *customCommandEditorPresentationManager;
  CACCustomCommandEditorPresentationManager *v4;
  CACCustomCommandEditorPresentationManager *v5;

  customCommandEditorPresentationManager = self->_customCommandEditorPresentationManager;
  if (!customCommandEditorPresentationManager)
  {
    v4 = (CACCustomCommandEditorPresentationManager *)objc_opt_new();
    v5 = self->_customCommandEditorPresentationManager;
    self->_customCommandEditorPresentationManager = v4;

    -[CACSceneManager registerPresentationManager:](self, "registerPresentationManager:", self->_customCommandEditorPresentationManager);
    customCommandEditorPresentationManager = self->_customCommandEditorPresentationManager;
  }
  return customCommandEditorPresentationManager;
}

- (CACDictationRecognizerModeOverlayManager)dictationRecognizerModeOverlayManager
{
  CACDictationRecognizerModeOverlayManager *dictationRecognizerModeOverlayManager;
  CACDictationRecognizerModeOverlayManager *v4;
  CACDictationRecognizerModeOverlayManager *v5;

  dictationRecognizerModeOverlayManager = self->_dictationRecognizerModeOverlayManager;
  if (!dictationRecognizerModeOverlayManager)
  {
    v4 = (CACDictationRecognizerModeOverlayManager *)objc_opt_new();
    v5 = self->_dictationRecognizerModeOverlayManager;
    self->_dictationRecognizerModeOverlayManager = v4;

    -[CACDictationRecognizerModeOverlayManager setDelegate:](self->_dictationRecognizerModeOverlayManager, "setDelegate:", self);
    -[CACSceneManager registerPresentationManager:](self, "registerPresentationManager:", self->_dictationRecognizerModeOverlayManager);
    dictationRecognizerModeOverlayManager = self->_dictationRecognizerModeOverlayManager;
  }
  return dictationRecognizerModeOverlayManager;
}

- (CACDisambiguationPresentationManager)contactDisambiguationPresentationManager
{
  CACDisambiguationPresentationManager *contactDisambiguationPresentationManager;
  CACDisambiguationPresentationManager *v4;
  CACDisambiguationPresentationManager *v5;

  contactDisambiguationPresentationManager = self->_contactDisambiguationPresentationManager;
  if (!contactDisambiguationPresentationManager)
  {
    v4 = (CACDisambiguationPresentationManager *)objc_opt_new();
    v5 = self->_contactDisambiguationPresentationManager;
    self->_contactDisambiguationPresentationManager = v4;

    -[CACSimpleContentViewManager setContentViewManagerDelegate:](self->_contactDisambiguationPresentationManager, "setContentViewManagerDelegate:", self);
    -[CACSceneManager registerPresentationManager:](self, "registerPresentationManager:", self->_contactDisambiguationPresentationManager);
    contactDisambiguationPresentationManager = self->_contactDisambiguationPresentationManager;
  }
  return contactDisambiguationPresentationManager;
}

- (CACContextCluesPresentationManager)contextCluesPresentationManager
{
  CACContextCluesPresentationManager *contextCluesPresentationManager;
  CACContextCluesPresentationManager *v4;
  CACContextCluesPresentationManager *v5;

  contextCluesPresentationManager = self->_contextCluesPresentationManager;
  if (!contextCluesPresentationManager)
  {
    v4 = (CACContextCluesPresentationManager *)objc_opt_new();
    v5 = self->_contextCluesPresentationManager;
    self->_contextCluesPresentationManager = v4;

    -[CACSimpleContentViewManager setContentViewManagerDelegate:](self->_contextCluesPresentationManager, "setContentViewManagerDelegate:", self);
    -[CACSceneManager registerPresentationManager:](self, "registerPresentationManager:", self->_contextCluesPresentationManager);
    contextCluesPresentationManager = self->_contextCluesPresentationManager;
  }
  return contextCluesPresentationManager;
}

- (BOOL)updateGridLayoutFromPreferences
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v13;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACSceneManager labeledGridOverlayManager](self, "labeledGridOverlayManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "currentNumberOfColumns");

  -[CACSceneManager labeledGridOverlayManager](self, "labeledGridOverlayManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "currentNumberOfRows");

  if (objc_msgSend(v3, "gridOverlayCustomColumnsEnabled"))
    v8 = objc_msgSend(v3, "gridOverlayCustomColumnsCount");
  else
    v8 = 0;
  if (objc_msgSend(v3, "gridOverlayCustomRowsEnabled"))
    v9 = objc_msgSend(v3, "gridOverlayCustomRowsCount");
  else
    v9 = 0;
  -[CACSceneManager labeledGridOverlayManager](self, "labeledGridOverlayManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCurrentNumberOfColumns:", v8);

  -[CACSceneManager labeledGridOverlayManager](self, "labeledGridOverlayManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCurrentNumberOfRows:", v9);

  v13 = v5 != v8 || v7 != v9;
  return v13;
}

- (unint64_t)_numberOfLabelsForGridManager:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v4 = a3;
  v5 = objc_msgSend(v4, "currentNumberOfColumns");
  v6 = objc_msgSend(v4, "currentNumberOfRows");
  if (!(v5 | v6))
    v5 = -[CACSceneManager defaultNumberOfColumnsForLabeledGridOverlayManager:](self, "defaultNumberOfColumnsForLabeledGridOverlayManager:", v4);
  -[CACSceneManager topLevelPortraitUpRectForLabeledGridOverlayManager:](self, "topLevelPortraitUpRectForLabeledGridOverlayManager:", v4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[CACSceneManager screen](self, "screen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[CACLabeledGridOverlayManager gridResolutionForTopLevelWithPortraitUpRect:desiredColumns:desiredRows:screen:](CACLabeledGridOverlayManager, "gridResolutionForTopLevelWithPortraitUpRect:desiredColumns:desiredRows:screen:", v5, v6, v15, v8, v10, v12, v14);
  v17 = v16;
  v19 = v18;

  return vcvtad_u64_f64(v19 * v17);
}

- (unint64_t)numberOfLabelsForGridManager
{
  void *v3;
  unint64_t v4;

  -[CACSceneManager labeledGridOverlayManager](self, "labeledGridOverlayManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CACSceneManager _numberOfLabelsForGridManager:](self, "_numberOfLabelsForGridManager:", v3);

  return v4;
}

- (unint64_t)updateGridLayoutWithNumberOfRows:(unint64_t)a3 numberOfColumns:(unint64_t)a4 shouldPreferRows:(BOOL)a5 startingNumber:(unint64_t)a6
{
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[7];
  BOOL v30;

  -[CACSceneManager labeledGridOverlayManager](self, "labeledGridOverlayManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACSceneManager topLevelPortraitUpRectForLabeledGridOverlayManager:](self, "topLevelPortraitUpRectForLabeledGridOverlayManager:", v11);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[CACSceneManager screen](self, "screen");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[CACLabeledGridOverlayManager gridResolutionForTopLevelWithPortraitUpRect:desiredColumns:desiredRows:screen:](CACLabeledGridOverlayManager, "gridResolutionForTopLevelWithPortraitUpRect:desiredColumns:desiredRows:screen:", a4, a3, v20, v13, v15, v17, v19);
  v22 = v21;
  v24 = v23;

  -[CACSceneManager labeledGridOverlayManager](self, "labeledGridOverlayManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setCurrentNumberOfColumns:", a4);

  -[CACSceneManager labeledGridOverlayManager](self, "labeledGridOverlayManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setCurrentNumberOfRows:", a3);

  -[CACSceneManager labeledGridOverlayManager](self, "labeledGridOverlayManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setStartingNumber:", a6);

  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __100__CACSceneManager_updateGridLayoutWithNumberOfRows_numberOfColumns_shouldPreferRows_startingNumber___block_invoke;
  v29[3] = &unk_24F2ACAC0;
  v30 = a5;
  v29[4] = self;
  *(double *)&v29[5] = v22;
  *(double *)&v29[6] = v24;
  dispatch_async(MEMORY[0x24BDAC9B8], v29);
  return vcvtad_u64_f64(v22 * v24);
}

void __100__CACSceneManager_updateGridLayoutWithNumberOfRows_numberOfColumns_shouldPreferRows_startingNumber___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  v2 = *(unsigned __int8 *)(a1 + 56);
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "labeledGridOverlayManager");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (*(double *)(a1 + 48) < (double)objc_msgSend(v7, "currentNumberOfRows"))
    {

LABEL_9:
      +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("ErrorMessage.GridResolutionMaximumReached"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "displayMessageString:type:announcementCompletion:", v6, 1, &__block_literal_global_32);

      goto LABEL_10;
    }
    if (*(_BYTE *)(a1 + 56))
    {
LABEL_10:

      return;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "labeledGridOverlayManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double)objc_msgSend(v3, "currentNumberOfColumns");
  v5 = *(double *)(a1 + 40);

  if (v2)
  if (v5 < v4)
    goto LABEL_9;
}

void __100__CACSceneManager_updateGridLayoutWithNumberOfRows_numberOfColumns_shouldPreferRows_startingNumber___block_invoke_2()
{
  id v0;

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "speakVoiceOverDescriptionForActiveOverlayIfNeeded");

}

- (void)contentViewManager:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a5;
  v9 = a6;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __80__CACSceneManager_contentViewManager_presentViewController_animated_completion___block_invoke;
  v11[3] = &unk_24F2ACAE8;
  v12 = v9;
  v10 = v9;
  -[CACSceneManager _installViewController:animated:completion:](self, "_installViewController:animated:completion:", a4, v6, v11);

}

uint64_t __80__CACSceneManager_contentViewManager_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronizeRecognizersWithReason:", kSRUISyncReasonOverlayStateChanged);

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)contentViewManager:(id)a3 dismissViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a5;
  v9 = a4;
  v10 = a6;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __80__CACSceneManager_contentViewManager_dismissViewController_animated_completion___block_invoke;
  v13[3] = &unk_24F2AA990;
  v14 = v9;
  v15 = v10;
  v11 = v10;
  v12 = v9;
  -[CACSceneManager _uninstallViewController:animated:completion:](self, "_uninstallViewController:animated:completion:", v12, v7, v13);

}

uint64_t __80__CACSceneManager_contentViewManager_dismissViewController_animated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronizeRecognizersWithReason:", kSRUISyncReasonOverlayStateChanged);

  if ((objc_msgSend(*(id *)(a1 + 32), "isOverlay") & 1) == 0)
  {
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "forceElementFetchWithReason:", CFSTR("Dismissed our own view controller"));

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)didAssignNumbersInLabeledElementsOverlayManager:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "labeledScreenElementsCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAreElementsNumbered:", 1);

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronizeRecognizersWithReason:", kSRUISyncReasonOverlayStateChanged);

}

- (BOOL)isHandlingDisambiguationForLabeledElementsOverlayManager:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disambiguationHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)shouldAssignNumbersRandomlyInLabeledElementsOverlayManager:(id)a3
{
  void *v3;
  char v4;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "doesFocusedElementRequireSecureInput");

  return v4;
}

- (id)localeForLabeledElementsOverlayManager:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCEA0];
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bestLocaleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeWithLocaleIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isOverlayFadingEnabledForLabeledElementsOverlayManager:(id)a3
{
  void *v3;
  char v4;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "overlayFadingEnabled");

  return v4;
}

- (double)overlayFadeDelayForLabeledElementsOverlayManager:(id)a3
{
  void *v3;
  double v4;
  double v5;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overlayFadeDelay");
  v5 = v4;

  return v5;
}

- (float)overlayFadeOpacityForLabeledElementsOverlayManager:(id)a3
{
  void *v3;
  float v4;
  float v5;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overlayFadeOpacity");
  v5 = v4;

  return v5;
}

- (BOOL)isAlwaysShowingLabeledElementsOverlayManager:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alwaysShowOverlayType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("NumberedElements"));

  return v5;
}

- (BOOL)isOverlayFadingEnabledForElementNamesOverlayManager:(id)a3
{
  void *v3;
  char v4;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "overlayFadingEnabled");

  return v4;
}

- (double)overlayFadeDelayForElementNamesOverlayManager:(id)a3
{
  void *v3;
  double v4;
  double v5;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overlayFadeDelay");
  v5 = v4;

  return v5;
}

- (float)overlayFadeOpacityForElementNamesOverlayManager:(id)a3
{
  void *v3;
  float v4;
  float v5;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overlayFadeOpacity");
  v5 = v4;

  return v5;
}

- (BOOL)isAlwaysShowingElementNamesOverlayManager:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alwaysShowOverlayType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("NamedElements"));

  return v5;
}

- (BOOL)isOverlayFadingEnabledForEditingModeOverlayManager:(id)a3
{
  void *v3;
  char v4;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "overlayFadingEnabled");

  return v4;
}

- (double)overlayFadeDelayForEditingModeOverlayManager:(id)a3
{
  void *v3;
  double v4;
  double v5;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overlayFadeDelay");
  v5 = v4;

  return v5;
}

- (float)overlayFadeOpacityForEditingModeOverlayManager:(id)a3
{
  void *v3;
  float v4;
  float v5;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overlayFadeOpacity");
  v5 = v4;

  return v5;
}

- (id)labeledGridOverlayManager:(id)a3 elementWithTitle:(id)a4 rectangle:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  CACLabeledElement *v11;
  void *v12;
  CACLabeledElement *v13;
  _QWORD v15[2];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v15[1] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = [CACLabeledElement alloc];
  v15[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CACLabeledElement initWithElement:recognitionStrings:rectangle:](v11, "initWithElement:recognitionStrings:rectangle:", 0, v12, x, y, width, height);

  -[CACLabeledElement setNumberedLabel:](v13, "setNumberedLabel:", v10);
  -[CACLabeledElement setDisplayID:](v13, "setDisplayID:", -[CACSceneManager displayID](self, "displayID"));
  return v13;
}

- (CGRect)topLevelPortraitUpRectForLabeledGridOverlayManager:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[CACSceneManager screen](self, "screen", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v8 = CACPortraitUpRectFromViewRect(0, v4, v5, v6, v7);
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (int64_t)maximumLevelForLabeledGridOverlayManager:(id)a3
{
  void *v3;
  int64_t v4;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "gridOverlayMaxLevel");

  return v4;
}

- (BOOL)isOverlayFadingEnabledForLabeledGridOverlayManager:(id)a3
{
  void *v3;
  char v4;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "overlayFadingEnabled");

  return v4;
}

- (double)overlayFadeDelayForLabeledGridOverlayManager:(id)a3
{
  void *v3;
  double v4;
  double v5;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overlayFadeDelay");
  v5 = v4;

  return v5;
}

- (float)overlayFadeOpacityForLabeledGridOverlayManager:(id)a3
{
  void *v3;
  float v4;
  float v5;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overlayFadeOpacity");
  v5 = v4;

  return v5;
}

- (BOOL)isAlwaysShowingLabeledGridOverlayManager:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alwaysShowOverlayType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("NumberedGrid"));

  return v5;
}

- (void)didUpdateElementsForLabeledGridOverlayManager:(id)a3
{
  id v3;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronizeRecognizersWithReason:", kSRUISyncReasonOverlayStateChanged);

}

- (int64_t)defaultNumberOfColumnsForLabeledGridOverlayManager:(id)a3
{
  return 4;
}

- (BOOL)showsNumbersInTopLeftForLabeledGridOverlayManager:(id)a3
{
  void *v3;
  char v4;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "gridOverlayShowsNumbersInTopLeft");

  return v4;
}

- (BOOL)isPressOnFirstLevelEnabledForLabeledGridOverlayManager:(id)a3
{
  void *v3;
  char v4;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "gridOverlayPressOnFirstLevelEnabled");

  return v4;
}

- (BOOL)isZoomEnabledForGridOverlayManager:(id)a3
{
  return 1;
}

- (int)modeForDictationRecognizerModeOverlayManager:(id)a3
{
  void *v3;
  int v4;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "dictationRecognizerMode");

  return v4;
}

- (CGRect)imageRectForDictationRecognizerModeOverlayManager:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  v3 = a3;
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bestDictationRecognizerModeImageRectForView:", v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (UIWindowScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
  objc_storeStrong((id *)&self->_scene, a3);
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (UIWindow)overlayWindow
{
  return self->_overlayWindow;
}

- (void)setOverlayWindow:(id)a3
{
  objc_storeStrong((id *)&self->_overlayWindow, a3);
}

- (CGRect)systemAperatureRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_systemAperatureRect.origin.x;
  y = self->_systemAperatureRect.origin.y;
  width = self->_systemAperatureRect.size.width;
  height = self->_systemAperatureRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSystemAperatureRect:(CGRect)a3
{
  self->_systemAperatureRect = a3;
}

- (CGRect)minimumSystemAperatureRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_minimumSystemAperatureRect.origin.x;
  y = self->_minimumSystemAperatureRect.origin.y;
  width = self->_minimumSystemAperatureRect.size.width;
  height = self->_minimumSystemAperatureRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setMinimumSystemAperatureRect:(CGRect)a3
{
  self->_minimumSystemAperatureRect = a3;
}

- (CACContainerViewController)windowContainerViewController
{
  return self->_windowContainerViewController;
}

- (void)setWindowContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_windowContainerViewController, a3);
}

- (CACContainerViewController)overlayContainerViewController
{
  return self->_overlayContainerViewController;
}

- (void)setOverlayContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_overlayContainerViewController, a3);
}

- (CACBannerViewPresenter)bannerViewPresenter
{
  return self->_bannerViewPresenter;
}

- (void)setBannerViewPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_bannerViewPresenter, a3);
}

- (void)setLabeledElementsOverlayManager:(id)a3
{
  objc_storeStrong((id *)&self->_labeledElementsOverlayManager, a3);
}

- (void)setLabeledGridOverlayManager:(id)a3
{
  objc_storeStrong((id *)&self->_labeledGridOverlayManager, a3);
}

- (void)setElementNamesOverlayManager:(id)a3
{
  objc_storeStrong((id *)&self->_elementNamesOverlayManager, a3);
}

- (void)setEditingModeOverlayManager:(id)a3
{
  objc_storeStrong((id *)&self->_editingModeOverlayManager, a3);
}

- (void)setLinesEditingModeOverlayManager:(id)a3
{
  objc_storeStrong((id *)&self->_linesEditingModeOverlayManager, a3);
}

- (CACGestureLivePreviewOverlayManager)gestureLivePreviewOverlayManager
{
  return self->_gestureLivePreviewOverlayManager;
}

- (void)setGestureLivePreviewOverlayManager:(id)a3
{
  objc_storeStrong((id *)&self->_gestureLivePreviewOverlayManager, a3);
}

- (void)setElementActionsPresentationManager:(id)a3
{
  objc_storeStrong((id *)&self->_elementActionsPresentationManager, a3);
}

- (void)setCorrectionPresentationManager:(id)a3
{
  objc_storeStrong((id *)&self->_correctionPresentationManager, a3);
}

- (void)setCustomCommandEditorPresentationManager:(id)a3
{
  objc_storeStrong((id *)&self->_customCommandEditorPresentationManager, a3);
}

- (void)setDictationRecognizerModeOverlayManager:(id)a3
{
  objc_storeStrong((id *)&self->_dictationRecognizerModeOverlayManager, a3);
}

- (void)setGestureLivePreviewPresentationOverlayManager:(id)a3
{
  objc_storeStrong((id *)&self->_gestureLivePreviewPresentationOverlayManager, a3);
}

- (void)setContactDisambiguationPresentationManager:(id)a3
{
  objc_storeStrong((id *)&self->_contactDisambiguationPresentationManager, a3);
}

- (void)setContextCluesPresentationManager:(id)a3
{
  objc_storeStrong((id *)&self->_contextCluesPresentationManager, a3);
}

- (NSMutableArray)registeredPresentationManagers
{
  return self->_registeredPresentationManagers;
}

- (void)setRegisteredPresentationManagers:(id)a3
{
  objc_storeStrong((id *)&self->_registeredPresentationManagers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredPresentationManagers, 0);
  objc_storeStrong((id *)&self->_contextCluesPresentationManager, 0);
  objc_storeStrong((id *)&self->_contactDisambiguationPresentationManager, 0);
  objc_storeStrong((id *)&self->_gestureLivePreviewPresentationOverlayManager, 0);
  objc_storeStrong((id *)&self->_dictationRecognizerModeOverlayManager, 0);
  objc_storeStrong((id *)&self->_customCommandEditorPresentationManager, 0);
  objc_storeStrong((id *)&self->_correctionPresentationManager, 0);
  objc_storeStrong((id *)&self->_elementActionsPresentationManager, 0);
  objc_storeStrong((id *)&self->_gestureLivePreviewOverlayManager, 0);
  objc_storeStrong((id *)&self->_linesEditingModeOverlayManager, 0);
  objc_storeStrong((id *)&self->_editingModeOverlayManager, 0);
  objc_storeStrong((id *)&self->_elementNamesOverlayManager, 0);
  objc_storeStrong((id *)&self->_labeledGridOverlayManager, 0);
  objc_storeStrong((id *)&self->_labeledElementsOverlayManager, 0);
  objc_storeStrong((id *)&self->_bannerViewPresenter, 0);
  objc_storeStrong((id *)&self->_overlayContainerViewController, 0);
  objc_storeStrong((id *)&self->_windowContainerViewController, 0);
  objc_storeStrong((id *)&self->_overlayWindow, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

@end
