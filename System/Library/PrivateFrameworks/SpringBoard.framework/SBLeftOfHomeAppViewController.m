@implementation SBLeftOfHomeAppViewController

+ (BOOL)isEnabled
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeScreenDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "leftOfHomeAppBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_variant_has_internal_diagnostics())
    v5 = objc_msgSend(v4, "length") != 0;
  else
    v5 = 0;

  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SBAppViewController *v9;
  SBAppViewController *appViewController;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBLeftOfHomeAppViewController;
  -[SBLeftOfHomeAppViewController viewDidLoad](&v15, sel_viewDidLoad);
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeScreenDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "leftOfHomeAppBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applicationWithBundleIdentifier:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBDeviceApplicationSceneEntity defaultEntityWithApplicationForMainDisplay:](SBDeviceApplicationSceneEntity, "defaultEntityWithApplicationForMainDisplay:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[SBAppViewController initWithIdentifier:andApplicationSceneEntity:]([SBAppViewController alloc], "initWithIdentifier:andApplicationSceneEntity:", CFSTR("LeftOfHomeApp"), v8);
    appViewController = self->_appViewController;
    self->_appViewController = v9;

    -[SBAppViewController setAutomatesLifecycle:](self->_appViewController, "setAutomatesLifecycle:", 1);
    -[SBAppViewController view](self->_appViewController, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBLeftOfHomeAppViewController bs_addChildViewController:](self, "bs_addChildViewController:", self->_appViewController);
    -[SBAppViewController view](self->_appViewController, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLeftOfHomeAppViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)SBHPinViewWithinView();

  }
}

- (BOOL)canHostAnApp
{
  return -[SBAppViewController canHostAnApp](self->_appViewController, "canHostAnApp");
}

- (BOOL)isHostingAnApp
{
  return -[SBAppViewController isHostingAnApp](self->_appViewController, "isHostingAnApp");
}

- (id)hostedAppSceneHandle
{
  return -[SBAppViewController hostedAppSceneHandle](self->_appViewController, "hostedAppSceneHandle");
}

- (id)hostedAppSceneHandles
{
  return -[SBAppViewController hostedAppSceneHandles](self->_appViewController, "hostedAppSceneHandles");
}

- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3
{
  -[SBAppViewController hostedAppWillRotateToInterfaceOrientation:](self->_appViewController, "hostedAppWillRotateToInterfaceOrientation:", a3);
}

- (void)setHostedAppReferenceSize:(CGSize)a3 withInterfaceOrientation:(int64_t)a4
{
  -[SBAppViewController setContentReferenceSize:withContentOrientation:andContainerOrientation:](self->_appViewController, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", a4, a4, a3.width, a3.height);
}

- (unint64_t)contentVisibility
{
  return self->_contentVisibility;
}

- (void)setContentVisibility:(unint64_t)a3
{
  self->_contentVisibility = a3;
}

- (SBAppViewController)appViewController
{
  return self->_appViewController;
}

- (void)setAppViewController:(id)a3
{
  objc_storeStrong((id *)&self->_appViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appViewController, 0);
}

@end
