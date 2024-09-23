@implementation VideosExtrasContext

- (VideosExtrasContext)init
{
  VideosExtrasContext *v2;
  uint64_t v3;
  VideosExtrasRootViewController *extrasRootViewController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VideosExtrasContext;
  v2 = -[VideosExtrasContext init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "extrasRootViewControllerClass")), "initWithContext:", v2);
    extrasRootViewController = v2->_extrasRootViewController;
    v2->_extrasRootViewController = (VideosExtrasRootViewController *)v3;

    -[VideosExtrasRootViewController setDelegate:](v2->_extrasRootViewController, "setDelegate:", v2);
  }
  return v2;
}

- (VideosExtrasContext)initWithMediaItem:(id)a3
{
  id v4;
  VideosExtrasContext *v5;
  VideosExtrasContext *v6;

  v4 = a3;
  v5 = -[VideosExtrasContext init](self, "init");
  v6 = v5;
  if (v5)
    -[VideosExtrasContext _configureForMediaItem:](v5, "_configureForMediaItem:", v4);

  return v6;
}

- (VideosExtrasContext)initWithTVPMediaItem:(id)a3
{
  id v5;
  VideosExtrasContext *v6;
  uint64_t v7;
  NSURL *javascriptURL;
  void *v9;
  uint64_t v10;
  NSString *buyParameters;
  void *v12;

  v5 = a3;
  v6 = -[VideosExtrasContext init](self, "init");
  if (v6)
  {
    objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AC8]);
    v7 = objc_claimAutoreleasedReturnValue();
    javascriptURL = v6->_javascriptURL;
    v6->_javascriptURL = (NSURL *)v7;

    objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A00]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    buyParameters = v6->_buyParameters;
    v6->_buyParameters = (NSString *)v10;

    objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CB8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_storeID = objc_msgSend(v12, "longLongValue");
    v6->_selectedMainMenuIndex = 0x7FFFFFFFFFFFFFFFLL;
    objc_storeStrong((id *)&v6->_tvpMediaItem, a3);

  }
  return v6;
}

- (VideosExtrasContext)initWithApplicationJavascriptURL:(id)a3 storeID:(int64_t)a4 buyParameters:(id)a5 mediaItem:(id)a6
{
  id v10;
  id v11;
  id v12;
  VideosExtrasContext *v13;
  uint64_t v14;
  NSURL *javascriptURL;
  uint64_t v16;
  NSString *buyParameters;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = -[VideosExtrasContext init](self, "init");
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    javascriptURL = v13->_javascriptURL;
    v13->_javascriptURL = (NSURL *)v14;

    v13->_storeID = a4;
    v16 = objc_msgSend(v11, "copy");
    buyParameters = v13->_buyParameters;
    v13->_buyParameters = (NSString *)v16;

    v13->_selectedMainMenuIndex = 0x7FFFFFFFFFFFFFFFLL;
    objc_storeStrong((id *)&v13->_tvpMediaItem, a6);
  }

  return v13;
}

- (void)_configureForMediaItem:(id)a3
{
  MPMediaItem *v4;
  void *v5;
  NSString *v6;
  NSString *buyParameters;
  NSURL *v8;
  NSURL *javascriptURL;
  void *v10;
  NSURL *v11;
  NSURL *v12;
  MPMediaItem *mediaItem;

  v4 = (MPMediaItem *)a3;
  -[MPMediaItem valueForProperty:](v4, "valueForProperty:", *MEMORY[0x1E0CC1FA0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_storeID = objc_msgSend(v5, "longLongValue");

  -[MPMediaItem valueForProperty:](v4, "valueForProperty:", *MEMORY[0x1E0CC1FB0]);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  buyParameters = self->_buyParameters;
  self->_buyParameters = v6;

  self->_selectedMainMenuIndex = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend((id)objc_opt_class(), "overriddenJavascriptURL");
  v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
  javascriptURL = self->_javascriptURL;
  self->_javascriptURL = v8;

  if (!self->_javascriptURL)
  {
    -[MPMediaItem valueForProperty:](v4, "valueForProperty:", *MEMORY[0x1E0CC1F90]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
    v11 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v12 = self->_javascriptURL;
    self->_javascriptURL = v11;

  }
  mediaItem = self->_mediaItem;
  self->_mediaItem = v4;

}

- (void)extrasRequestsMediaPlayback:(id)a3 isBackground:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[VideosExtrasContext delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "extrasRequestsMediaPlayback:isBackground:", v6, v4);

}

- (void)extrasRequestsPlaybackStop
{
  id v2;

  -[VideosExtrasContext delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extrasRequestsPlaybackStop");

}

- (void)extrasBackButtonPressed
{
  void *v3;
  char v4;
  id v5;

  -[VideosExtrasContext delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[VideosExtrasContext delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extrasBackButtonPressed");

  }
}

- (void)extrasMenuItemSelected:(id)a3 atIndex:(unint64_t)a4
{
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[VideosExtrasContext delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[VideosExtrasContext delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extrasMenuItemSelected:atIndex:", v9, a4);

  }
}

- (void)extrasDoneButtonPressed
{
  void *v3;
  char v4;
  id v5;

  -[VideosExtrasContext delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[VideosExtrasContext delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extrasDoneButtonPressed");

  }
}

- (void)extrasRequestReloadWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (!v4)
  {
    -[VideosExtrasContext featurePlaybackContext](self, "featurePlaybackContext");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v4;
  -[VideosExtrasContext delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extrasRequestReloadWithContext:", v6);

}

- (void)failWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VideosExtrasContext delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extrasContext:hadFatalError:", self, v4);

}

- (void)startIfNecessary
{
  if (!-[VideosExtrasContext isStarted](self, "isStarted"))
  {
    -[VideosExtrasContext setIsStarted:](self, "setIsStarted:", 1);
    -[VideosExtrasRootViewController start](self->_extrasRootViewController, "start");
  }
}

- (void)setShowsBuiltInNavigationControls:(BOOL)a3
{
  -[VideosExtrasRootViewController setShowsBuiltInNavigationControls:](self->_extrasRootViewController, "setShowsBuiltInNavigationControls:", a3);
}

- (BOOL)showsBuiltInNavigationControls
{
  return -[VideosExtrasRootViewController showsBuiltInNavigationControls](self->_extrasRootViewController, "showsBuiltInNavigationControls");
}

- (void)setShowsMenuBar:(BOOL)a3
{
  -[VideosExtrasRootViewController setShowsMenuBar:](self->_extrasRootViewController, "setShowsMenuBar:", a3);
}

- (BOOL)showsMenuBar
{
  return -[VideosExtrasRootViewController showsMenuBar](self->_extrasRootViewController, "showsMenuBar");
}

- (void)setClearsStackOnNextPush
{
  -[VideosExtrasRootViewController setClearsStackOnNextPush](self->_extrasRootViewController, "setClearsStackOnNextPush");
}

- (void)setSelectedMainMenuIndex:(unint64_t)a3
{
  unint64_t selectedMainMenuIndex;
  id v5;

  selectedMainMenuIndex = self->_selectedMainMenuIndex;
  if (selectedMainMenuIndex != a3)
  {
    self->_selectedMainMenuIndex = a3;
    -[VideosExtrasContext extrasRootViewController](self, "extrasRootViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateMenuButtonForSelectionAtIndex:deselectedIndex:", self->_selectedMainMenuIndex, selectedMainMenuIndex);

  }
}

- (void)clearNavStack
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[VideosExtrasRootViewController navigationController](self->_extrasRootViewController, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
  v5[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setViewControllers:animated:", v4, 0);

}

- (NSArray)mainMenuItemElements
{
  return -[VideosExtrasRootViewController mainMenuItemElements](self->_extrasRootViewController, "mainMenuItemElements");
}

- (BOOL)isMenuItemElementMainFeature:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("video"));

  return v5;
}

- (BOOL)shouldExtrasBeVisibleForSize:(CGSize)a3
{
  return -[VideosExtrasRootViewController shouldExtrasBeVisibleForViewSize:](self->_extrasRootViewController, "shouldExtrasBeVisibleForViewSize:", a3.width, a3.height);
}

- (void)extrasRootViewControllerDidLoadMainMenuItems:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[VideosExtrasContext delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[VideosExtrasContext delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "extrasContextDidLoadMainMenuItems:", self);

  }
}

- (void)extrasRootViewController:(id)a3 extrasVisibilityNeedsUpdate:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  id v8;

  v4 = a4;
  -[VideosExtrasContext delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[VideosExtrasContext delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extrasContext:extrasVisibilityNeedsUpdate:", self, v4);

  }
}

+ (void)overrideJavascriptURL:(id)a3
{
  objc_storeStrong((id *)&VideosExtrasOverrideURL, a3);
}

+ (id)overriddenJavascriptURL
{
  return (id)VideosExtrasOverrideURL;
}

+ (Class)extrasRootViewControllerClass
{
  return (Class)objc_opt_class();
}

- (VideosExtrasContextDelegate)delegate
{
  return (VideosExtrasContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIViewController)featurePlaybackViewController
{
  return self->_featurePlaybackViewController;
}

- (void)setFeaturePlaybackViewController:(id)a3
{
  objc_storeStrong((id *)&self->_featurePlaybackViewController, a3);
}

- (MPPlaybackContext)featurePlaybackContext
{
  return self->_featurePlaybackContext;
}

- (void)setFeaturePlaybackContext:(id)a3
{
  objc_storeStrong((id *)&self->_featurePlaybackContext, a3);
}

- (VideosExtrasRootViewController)extrasRootViewController
{
  return self->_extrasRootViewController;
}

- (MPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (TVPMediaItem)tvpMediaItem
{
  return self->_tvpMediaItem;
}

- (NSURL)javascriptURL
{
  return self->_javascriptURL;
}

- (NSString)buyParameters
{
  return self->_buyParameters;
}

- (int64_t)storeID
{
  return self->_storeID;
}

- (unint64_t)selectedMainMenuIndex
{
  return self->_selectedMainMenuIndex;
}

- (BOOL)isStarted
{
  return self->_isStarted;
}

- (void)setIsStarted:(BOOL)a3
{
  self->_isStarted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buyParameters, 0);
  objc_storeStrong((id *)&self->_javascriptURL, 0);
  objc_storeStrong((id *)&self->_tvpMediaItem, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_extrasRootViewController, 0);
  objc_storeStrong((id *)&self->_featurePlaybackContext, 0);
  objc_storeStrong((id *)&self->_featurePlaybackViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
