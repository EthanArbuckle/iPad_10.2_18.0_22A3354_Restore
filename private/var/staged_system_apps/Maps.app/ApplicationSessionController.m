@implementation ApplicationSessionController

- (ApplicationSessionController)init
{
  ApplicationSessionController *v2;
  uint64_t v3;
  NSMapTable *activeiOSPlatformControllersToCoverSheetSceneAssociation;
  PlatformController *v5;
  PlatformController *primaryPlatformController;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ApplicationSessionController;
  v2 = -[ApplicationSessionController init](&v8, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    activeiOSPlatformControllersToCoverSheetSceneAssociation = v2->_activeiOSPlatformControllersToCoverSheetSceneAssociation;
    v2->_activeiOSPlatformControllersToCoverSheetSceneAssociation = (NSMapTable *)v3;

    v5 = objc_alloc_init(PlatformController);
    primaryPlatformController = v2->_primaryPlatformController;
    v2->_primaryPlatformController = v5;

    -[PlatformController setIsPrimary:](v2->_primaryPlatformController, "setIsPrimary:", 1);
    -[PlatformController addObserver:](v2->_primaryPlatformController, "addObserver:", v2);
  }
  return v2;
}

- (CoverSheetSceneAssociation)currentlyNavigatingCoverSheetSceneAssociation
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationSessionController activeiOSPlatformControllersToCoverSheetSceneAssociation](self, "activeiOSPlatformControllersToCoverSheetSceneAssociation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationSessionController currentlyNavigatingPlatformController](self, "currentlyNavigatingPlatformController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v4));

  return (CoverSheetSceneAssociation *)v5;
}

- (void)setCurrentlyNavigatingPlatformController:(id)a3
{
  PlatformController *v5;
  PlatformController **p_currentlyNavigatingPlatformController;
  PlatformController *currentlyNavigatingPlatformController;
  void *v8;
  PlatformController *v9;

  v5 = (PlatformController *)a3;
  currentlyNavigatingPlatformController = self->_currentlyNavigatingPlatformController;
  p_currentlyNavigatingPlatformController = &self->_currentlyNavigatingPlatformController;
  if (currentlyNavigatingPlatformController != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)p_currentlyNavigatingPlatformController, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v8, "acquireSecureAppAssertionIfNeeded");

    v5 = v9;
  }

}

- (id)addActiveiOSPlatformControllerForScene:(id)a3
{
  id v4;
  void *v5;
  id v6;
  PlatformController *v7;
  CoverSheetSceneAssociation *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationSessionController activeiOSPlatformControllersToCoverSheetSceneAssociation](self, "activeiOSPlatformControllersToCoverSheetSceneAssociation"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = objc_alloc_init(PlatformController);
    -[PlatformController addObserver:](v7, "addObserver:", self);
  }
  else
  {
    v7 = (PlatformController *)objc_claimAutoreleasedReturnValue(-[ApplicationSessionController primaryPlatformController](self, "primaryPlatformController"));
  }
  v8 = -[CoverSheetSceneAssociation initWithMapsScene:]([CoverSheetSceneAssociation alloc], "initWithMapsScene:", v4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationSessionController activeiOSPlatformControllersToCoverSheetSceneAssociation](self, "activeiOSPlatformControllersToCoverSheetSceneAssociation"));
  objc_msgSend(v9, "setObject:forKey:", v8, v7);

  return v7;
}

- (void)removeiOSPlatformController:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationSessionController activeiOSPlatformControllersToCoverSheetSceneAssociation](self, "activeiOSPlatformControllersToCoverSheetSceneAssociation"));
  objc_msgSend(v4, "removeObjectForKey:", v7);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ApplicationSessionController primaryPlatformController](self, "primaryPlatformController"));
  v6 = v7;
  if (v5 != v7)
  {
    objc_msgSend(v7, "removeObserver:", self);
    v6 = v7;
  }

}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  char isKindOfClass;
  id v12;
  id v13;
  uint64_t v14;
  char v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_opt_class(NavigationSession);
  isKindOfClass = objc_opt_isKindOfClass(v9, v10);
  if (v9)
  {
    v12 = v16;
    if ((isKindOfClass & 1) != 0)
      goto LABEL_6;
  }
  v13 = v8;
  v14 = objc_opt_class(NavigationSession);
  v15 = objc_opt_isKindOfClass(v13, v14);

  if (v13 && (v15 & 1) != 0)
  {
    v12 = 0;
LABEL_6:
    -[ApplicationSessionController setCurrentlyNavigatingPlatformController:](self, "setCurrentlyNavigatingPlatformController:", v12);
  }

}

- (PlatformController)primaryPlatformController
{
  return self->_primaryPlatformController;
}

- (PlatformController)currentlyNavigatingPlatformController
{
  return self->_currentlyNavigatingPlatformController;
}

- (NSMapTable)activeiOSPlatformControllersToCoverSheetSceneAssociation
{
  return self->_activeiOSPlatformControllersToCoverSheetSceneAssociation;
}

- (void)setActiveiOSPlatformControllersToCoverSheetSceneAssociation:(id)a3
{
  objc_storeStrong((id *)&self->_activeiOSPlatformControllersToCoverSheetSceneAssociation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeiOSPlatformControllersToCoverSheetSceneAssociation, 0);
  objc_storeStrong((id *)&self->_currentlyNavigatingPlatformController, 0);
  objc_storeStrong((id *)&self->_primaryPlatformController, 0);
}

@end
