@implementation SUComposeReviewViewController

- (SUComposeReviewViewController)init
{
  return -[SUComposeReviewViewController initWithCompositionURL:](self, "initWithCompositionURL:", 0);
}

- (SUComposeReviewViewController)initWithCompositionURL:(id)a3
{
  SUComposeReviewViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUComposeReviewViewController;
  v4 = -[SUViewController init](&v6, sel_init);
  if (v4)
  {
    v4->_compositionURL = (NSURL *)objc_msgSend(a3, "copy");
    -[SUComposeReviewViewController setContainmentSupport:](v4, "setContainmentSupport:", 1);
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") == 1)
      -[SUComposeReviewViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 2);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[SKComposeReviewViewController setDelegate:](self->_remoteViewController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUComposeReviewViewController;
  -[SUViewController dealloc](&v3, sel_dealloc);
}

- (id)copyScriptViewController
{
  SUScriptComposeReviewViewController *v3;

  v3 = objc_alloc_init(SUScriptComposeReviewViewController);
  -[SUScriptViewController setNativeViewController:](v3, "setNativeViewController:", self);
  return v3;
}

- (void)prepareWithCompletionBlock:(id)a3
{
  SKComposeReviewViewController *v5;
  SKComposeReviewViewController *v6;

  if (!self->_remoteViewController)
  {
    v5 = (SKComposeReviewViewController *)objc_alloc((Class)ISWeakLinkedClassForString());
    self->_remoteViewController = v5;
    v6 = -[SKComposeReviewViewController initWithCompositionURL:](v5, "initWithCompositionURL:", self->_compositionURL);
    self->_remoteViewController = v6;
    -[SKComposeReviewViewController setDelegate:](v6, "setDelegate:", self);
    -[SUComposeReviewViewController addChildViewController:](self, "addChildViewController:", self->_remoteViewController);
    -[SKComposeReviewViewController prepareWithCompletionBlock:](self->_remoteViewController, "prepareWithCompletionBlock:", a3);
    if (-[SUComposeReviewViewController isViewLoaded](self, "isViewLoaded"))
      -[SUComposeReviewViewController _showRemoteView](self, "_showRemoteView");
  }
}

- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers
{
  return 1;
}

- (void)loadView
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  -[SUComposeReviewViewController setView:](self, "setView:");
  if (self->_remoteViewController)
    -[SUComposeReviewViewController _showRemoteView](self, "_showRemoteView");

}

- (void)reviewComposeViewControllerDidFinish:(id)a3
{
  -[UIViewController dismissAnimated:](self, "dismissAnimated:", 1);
}

- (void)_showRemoteView
{
  void *v3;
  void *v4;

  v3 = (void *)-[SUComposeReviewViewController view](self, "view");
  v4 = (void *)-[SKComposeReviewViewController view](self->_remoteViewController, "view");
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "frame");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v3, "addSubview:", v4);
}

- (NSURL)compositionURL
{
  return self->_compositionURL;
}

@end
