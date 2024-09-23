@implementation VUIInterfaceFactory

- (void)setOpenURLHandler:(id)a3
{
  objc_storeStrong((id *)&self->_openURLHandler, a3);
}

- (void)setMediaDownloadQueue:(id)a3
{
  objc_storeStrong((id *)&self->_mediaDownloadQueue, a3);
}

- (void)setLanguageStringHandler:(id)a3
{
  objc_storeStrong((id *)&self->_languageStringHandler, a3);
}

- (void)setGroupActivitiesManager:(id)a3
{
  objc_storeStrong((id *)&self->_groupActivitiesManager, a3);
}

- (void)setDocumentCreator:(id)a3
{
  VUIDocumentCreator *v5;

  v5 = (VUIDocumentCreator *)a3;
  if (self->_documentCreator != v5)
  {
    objc_storeStrong((id *)&self->_documentCreator, a3);
    self->_documentCreatorFlags.respondsToViewControllerCreation = objc_opt_respondsToSelector() & 1;
  }

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_9 != -1)
    dispatch_once(&sharedInstance_onceToken_9, &__block_literal_global_56);
  return (id)sharedInstance_sharedInstance_6;
}

- (VUILanguageAwareStringHandling)languageStringHandler
{
  return self->_languageStringHandler;
}

- (id)viewControllerWithDocumentDataSource:(id)a3 appContext:(id)a4 documentOptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  if (self->_documentCreatorFlags.respondsToViewControllerCreation)
  {
    v8 = a5;
    v9 = a4;
    v10 = a3;
    -[VUIInterfaceFactory documentCreator](self, "documentCreator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "viewControllerWithDocumentDataSource:appContext:documentOptions:", v10, v9, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (VUIDocumentCreator)documentCreator
{
  return self->_documentCreator;
}

- (VUIOpenURLHandling)openURLHandler
{
  return self->_openURLHandler;
}

void __37__VUIInterfaceFactory_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_6;
  sharedInstance_sharedInstance_6 = v0;

}

- (VUIGroupActivitiesManagerDelegate)groupActivitiesManager
{
  return self->_groupActivitiesManager;
}

- (id)viewControllerWithDocumentDataSource:(id)a3 appContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  if (self->_documentCreatorFlags.respondsToViewControllerCreation)
  {
    v6 = a4;
    v7 = a3;
    -[VUIInterfaceFactory documentCreator](self, "documentCreator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewControllerWithDocumentDataSource:appContext:documentOptions:", v7, v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (VUIControllerPresenter)controllerPresenter
{
  return (VUIControllerPresenter *)+[VUIApplicationRouter topMostVisibleViewController](VUIApplicationRouter, "topMostVisibleViewController");
}

- (id)rootSplitViewController
{
  void *v2;
  void *v3;

  if (self->_documentCreatorFlags.respondsToViewControllerCreation)
  {
    -[VUIInterfaceFactory documentCreator](self, "documentCreator");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "rootSplitViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)accountViewController
{
  return objc_alloc_init(VUIAccountViewController);
}

- (id)viewControllerWithSeasonsMetadata:(id)a3
{
  id v3;
  _TtC8VideosUI33SeasonsDownloadListViewController *v4;

  v3 = a3;
  v4 = -[SeasonsDownloadListViewController initWith:]([_TtC8VideosUI33SeasonsDownloadListViewController alloc], "initWith:", v3);

  -[SeasonsDownloadListViewController estimatedSize](v4, "estimatedSize");
  -[SeasonsDownloadListViewController setPreferredContentSize:](v4, "setPreferredContentSize:");
  -[SeasonsDownloadListViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 7);
  return v4;
}

- (VUITimedMetadataManager)timedMetadataManager
{
  return self->_timedMetadataManager;
}

- (void)setTimedMetadataManager:(id)a3
{
  objc_storeStrong((id *)&self->_timedMetadataManager, a3);
}

- (VUIMusicManager)musicManager
{
  return self->_musicManager;
}

- (void)setMusicManager:(id)a3
{
  objc_storeStrong((id *)&self->_musicManager, a3);
}

- (VUIMediaDownloadQueue)mediaDownloadQueue
{
  return self->_mediaDownloadQueue;
}

- (VUIControllerPresenter)welcomeScreenControllerPresenter
{
  return self->_welcomeScreenControllerPresenter;
}

- (void)setWelcomeScreenControllerPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_welcomeScreenControllerPresenter, a3);
}

- (VUITabBarProtocol)tabBarController
{
  return self->_tabBarController;
}

- (void)setTabBarController:(id)a3
{
  objc_storeStrong((id *)&self->_tabBarController, a3);
}

- (UIViewController)rootPresentingViewController
{
  return self->_rootPresentingViewController;
}

- (void)setRootPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_rootPresentingViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageStringHandler, 0);
  objc_storeStrong((id *)&self->_rootPresentingViewController, 0);
  objc_storeStrong((id *)&self->_tabBarController, 0);
  objc_storeStrong((id *)&self->_welcomeScreenControllerPresenter, 0);
  objc_storeStrong((id *)&self->_mediaDownloadQueue, 0);
  objc_storeStrong((id *)&self->_musicManager, 0);
  objc_storeStrong((id *)&self->_timedMetadataManager, 0);
  objc_storeStrong((id *)&self->_openURLHandler, 0);
  objc_storeStrong((id *)&self->_groupActivitiesManager, 0);
  objc_storeStrong((id *)&self->_documentCreator, 0);
}

@end
