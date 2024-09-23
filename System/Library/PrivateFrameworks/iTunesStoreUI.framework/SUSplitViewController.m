@implementation SUSplitViewController

- (SUSplitViewController)init
{
  SUSplitViewController *v2;
  SUShadow *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUSplitViewController;
  v2 = -[SUViewController init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SUShadow);
    v2->_splitShadow = v3;
    -[SUShadow setOffset:](v3, "setOffset:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
    -[SUShadow setOpacity:](v2->_splitShadow, "setOpacity:", 0.670000017);
    -[SUShadow setRadius:](v2->_splitShadow, "setRadius:", 5.0);
    v2->_usesSharedPlaceholder = 1;
    v2->_viewIsReady = 1;
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUViewControllerLoadingDidChangeNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUViewControllerNavigationItemDidChangeNotification"), 0);
  if (self->_firstViewController)
  {
    -[SUSplitViewController removeChildViewController:](self, "removeChildViewController:");

    self->_firstViewController = 0;
  }
  if (self->_placeholderViewController)
  {
    -[SUSplitViewController removeChildViewController:](self, "removeChildViewController:");

    self->_placeholderViewController = 0;
  }
  if (self->_secondViewController)
  {
    -[SUSplitViewController removeChildViewController:](self, "removeChildViewController:");

    self->_secondViewController = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)SUSplitViewController;
  -[SUViewController dealloc](&v4, sel_dealloc);
}

- (void)addChildViewController:(id)a3
{
  void *v5;
  objc_super v6;

  v5 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__loadingDidChangeNotification_, CFSTR("SUViewControllerLoadingDidChangeNotification"), a3);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__navigationItemDidChangeNotification_, CFSTR("SUViewControllerNavigationItemDidChangeNotification"), objc_msgSend(a3, "navigationItem"));
  v6.receiver = self;
  v6.super_class = (Class)SUSplitViewController;
  -[SUSplitViewController addChildViewController:](&v6, sel_addChildViewController_, a3);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  unsigned int v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SUSplitViewController;
  v7 = -[SUViewController canPerformAction:withSender:](&v13, sel_canPerformAction_withSender_);
  if (v7)
  {
    if (sel_isEqual(a3, sel_storePage_finishedWithSuccess_)
      && (v8 = -[SUSplitViewController nextResponder](self, "nextResponder")) != 0)
    {
      v9 = (void *)v8;
      do
      {
        v10 = objc_msgSend(v9, "canPerformAction:withSender:", a3, a4);
        v11 = objc_msgSend(v9, "nextResponder");
        if (!v11)
          break;
        v9 = (void *)v11;
      }
      while (!v10);
      LOBYTE(v7) = v10 ^ 1;
    }
    else
    {
      LOBYTE(v7) = 1;
    }
  }
  return v7;
}

- (id)copyArchivableContext
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SUSplitViewController;
  v3 = -[SUViewController copyArchivableContext](&v13, sel_copyArchivableContext);
  objc_msgSend(v3, "setType:", 5);
  if (!-[SUSplitViewController shouldExcludeFromNavigationHistory](self, "shouldExcludeFromNavigationHistory"))
  {
    v4 = -[UIViewController copyArchivableContext](self->_firstViewController, "copyArchivableContext");
    v5 = v4;
    if (v4 && objc_msgSend(v4, "type"))
      objc_msgSend(v3, "setValue:forMetadataKey:", v5, CFSTR("first"));

    v6 = -[UIViewController copyArchivableContext](self->_secondViewController, "copyArchivableContext");
    v7 = v6;
    if (v6 && objc_msgSend(v6, "type"))
      objc_msgSend(v3, "setValue:forMetadataKey:", v7, CFSTR("second"));

    objc_msgSend(v3, "setValue:forMetadataKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SUSplitViewController layoutType](self, "layoutType")), CFSTR("layoutType"));
    objc_msgSend(v3, "setValue:forMetadataKey:", -[SUSplitViewController mainTitle](self, "mainTitle"), CFSTR("mainTitle"));
    v8 = (void *)MEMORY[0x24BDD16E0];
    -[SUSplitViewController minimumPaneSize](self, "minimumPaneSize");
    *(float *)&v9 = v9;
    objc_msgSend(v3, "setValue:forMetadataKey:", objc_msgSend(v8, "numberWithFloat:", v9), CFSTR("minPaneSize"));
    v10 = (void *)MEMORY[0x24BDD16E0];
    -[SUSplitViewController splitPosition](self, "splitPosition");
    *(float *)&v11 = v11;
    objc_msgSend(v3, "setValue:forMetadataKey:", objc_msgSend(v10, "numberWithFloat:", v11), CFSTR("splitPosition"));
    objc_msgSend(v3, "setValue:forMetadataKey:", -[SUSplitViewController splitShadow](self, "splitShadow"), CFSTR("shadow"));
    objc_msgSend(v3, "setValue:forMetadataKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SUSplitViewController usesSharedPlaceholder](self, "usesSharedPlaceholder")), CFSTR("sharedLoading"));
    objc_msgSend(v3, "setValue:forMetadataKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SUSplitViewController isVertical](self, "isVertical")), CFSTR("vertical"));
  }
  return v3;
}

- (id)copyChildViewControllersForReason:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 == 1)
    return 0;
  v7 = v3;
  v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)SUSplitViewController;
  return -[SUViewController copyChildViewControllersForReason:](&v6, sel_copyChildViewControllersForReason_);
}

- (id)copyScriptViewController
{
  SUScriptSplitViewController *v3;

  v3 = objc_alloc_init(SUScriptSplitViewController);
  -[SUScriptViewController setNativeViewController:](v3, "setNativeViewController:", self);
  return v3;
}

- (BOOL)isSkLoaded
{
  UIViewController *firstViewController;
  _BOOL4 v4;
  UIViewController *secondViewController;

  firstViewController = self->_firstViewController;
  if (!firstViewController || (v4 = -[UIViewController isSkLoaded](firstViewController, "isSkLoaded")))
  {
    secondViewController = self->_secondViewController;
    if (secondViewController)
      LOBYTE(v4) = -[UIViewController isSkLoaded](secondViewController, "isSkLoaded");
    else
      LOBYTE(v4) = 1;
  }
  return v4;
}

- (void)loadView
{
  void *v3;
  id v4;
  SUPlaceholderViewController *placeholderViewController;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUSplitViewController;
  -[SUViewController loadView](&v7, sel_loadView);
  v3 = (void *)-[SUSplitViewController view](self, "view");
  v4 = -[SUSplitViewController _splitView](self, "_splitView");
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "setFrame:");
  -[SUSplitViewController _reloadView](self, "_reloadView");
  objc_msgSend(v3, "addSubview:", v4);
  placeholderViewController = self->_placeholderViewController;
  if (placeholderViewController)
  {
    v6 = (void *)-[SUPlaceholderViewController view](placeholderViewController, "view");
    objc_msgSend(v3, "bounds");
    objc_msgSend(v6, "setFrame:");
    objc_msgSend(v3, "addSubview:", v6);
  }
}

- (void)removeChildViewController:(id)a3
{
  void *v5;
  objc_super v6;

  v5 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("SUViewControllerLoadingDidChangeNotification"), a3);
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("SUViewControllerNavigationItemDidChangeNotification"), objc_msgSend(a3, "navigationItem"));
  v6.receiver = self;
  v6.super_class = (Class)SUSplitViewController;
  -[SUSplitViewController removeChildViewController:](&v6, sel_removeChildViewController_, a3);
}

- (void)restoreArchivableContext:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  float v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_super v16;

  v5 = (void *)objc_msgSend(a3, "valueForMetadataKey:", CFSTR("first"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)objc_msgSend(v5, "copyViewController");
    -[SUSplitViewController setFirstViewController:](self, "setFirstViewController:", v6);

  }
  v7 = (void *)objc_msgSend(a3, "valueForMetadataKey:", CFSTR("second"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copyViewController");
    -[SUSplitViewController setSecondViewController:](self, "setSecondViewController:", v8);

  }
  v9 = (void *)objc_msgSend(a3, "valueForMetadataKey:", CFSTR("layoutType"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SUSplitViewController setLayoutType:](self, "setLayoutType:", (int)objc_msgSend(v9, "intValue"));
  v10 = objc_msgSend(a3, "valueForMetadataKey:", CFSTR("mainTitle"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SUSplitViewController setMainTitle:](self, "setMainTitle:", v10);
  v11 = (void *)objc_msgSend(a3, "valueForMetadataKey:", CFSTR("splitPosition"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "floatValue");
    -[SUSplitViewController setSplitPosition:](self, "setSplitPosition:", v12);
  }
  v13 = objc_msgSend(a3, "valueForMetadataKey:", CFSTR("shadow"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SUSplitViewController setSplitShadow:](self, "setSplitShadow:", v13);
  v14 = (void *)objc_msgSend(a3, "valueForMetadataKey:", CFSTR("sharedLoading"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SUSplitViewController setUsesSharedPlaceholder:](self, "setUsesSharedPlaceholder:", objc_msgSend(v14, "BOOLValue"));
  v15 = (void *)objc_msgSend(a3, "valueForMetadataKey:", CFSTR("vertical"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SUSplitViewController setVertical:](self, "setVertical:", objc_msgSend(v15, "BOOLValue"));
  v16.receiver = self;
  v16.super_class = (Class)SUSplitViewController;
  -[SUViewController restoreArchivableContext:](&v16, sel_restoreArchivableContext_, a3);
}

- (void)setSkLoading:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[SUSplitViewController isSkLoaded](self, "isSkLoaded") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SUSplitViewController;
    -[SUViewController setSkLoading:](&v5, sel_setSkLoading_, v3);
    -[SUSplitViewController _setPlaceholderVisible:](self, "_setPlaceholderVisible:", v3);
    -[SUPlaceholderViewController setSkLoading:](self->_placeholderViewController, "setSkLoading:", v3);
  }
}

- (BOOL)shouldExcludeFromNavigationHistory
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUSplitViewController;
  if (-[SUViewController shouldExcludeFromNavigationHistory](&v4, sel_shouldExcludeFromNavigationHistory)
    || (objc_opt_respondsToSelector() & 1) != 0
    && (-[UIViewController shouldExcludeFromNavigationHistory](self->_firstViewController, "shouldExcludeFromNavigationHistory") & 1) != 0)
  {
    return 1;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[UIViewController shouldExcludeFromNavigationHistory](self->_secondViewController, "shouldExcludeFromNavigationHistory");
  return 0;
}

- (id)newRotationController
{
  return -[SURotationController initWithViewController:]([SUSplitViewRotationController alloc], "initWithViewController:", self);
}

- (void)reloadWithStorePage:(id)a3 forURL:(id)a4
{
  SUStructuredPage *v7;
  SUStructuredPage *v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_alloc_init(SUStructuredPage);
    if (-[SUStructuredPage loadFromDictionary:](v8, "loadFromDictionary:", a3))
    {
      -[SUSplitViewController setDisplayedURL:](self, "setDisplayedURL:", a4);
      -[SUSplitViewController setMainTitle:](self, "setMainTitle:", -[SUStructuredPage title](v8, "title"));
      -[SUSplitViewController _setStructuredPage:](self, "_setStructuredPage:", v8);
      -[SUSplitViewController _reloadWithStorePageDictionary:](self, "_reloadWithStorePageDictionary:", a3);
    }
    v7 = v8;
  }
  else
  {
    v7 = 0;
  }

}

- (id)storePageProtocol
{
  return -[SUStructuredPage protocol](self->_structuredPage, "protocol");
}

+ (BOOL)isValidSplitPositionValue:(id)a3
{
  int v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v4) = 0;
    return v4;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("first")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("second")) & 1) != 0
    || (objc_msgSend(a3, "hasSuffix:", CFSTR("px")) & 1) != 0
    || (v4 = objc_msgSend(a3, "hasSuffix:", CFSTR("%"))) != 0)
  {
LABEL_2:
    LOBYTE(v4) = 1;
  }
  return v4;
}

+ (BOOL)isValidSplitTypeString:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("horizontal")) & 1) != 0)
    return 1;
  return objc_msgSend(a3, "isEqualToString:", CFSTR("vertical"));
}

- (void)setSplitPositionAndLayoutTypeFromValue:(id)a3
{
  id v5;
  float v6;
  uint64_t v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = a3;
LABEL_3:
    objc_msgSend(v5, "floatValue");
    v7 = 0;
LABEL_4:
    -[SUSplitViewController setSplitPosition:](self, "setSplitPosition:", v6);
LABEL_9:
    -[SUSplitViewController setLayoutType:](self, "setLayoutType:", v7);
    return;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("first")) & 1) != 0)
  {
    v7 = 2;
    goto LABEL_9;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("second")) & 1) != 0)
  {
    v7 = 3;
    goto LABEL_9;
  }
  if (objc_msgSend(a3, "hasSuffix:", CFSTR("px")))
  {
    v5 = (id)objc_msgSend(a3, "substringToIndex:", objc_msgSend(a3, "length") - 2);
    goto LABEL_3;
  }
  if (objc_msgSend(a3, "hasSuffix:", CFSTR("%")))
  {
    v6 = (float)(int)objc_msgSend((id)objc_msgSend(a3, "substringToIndex:", objc_msgSend(a3, "length") - 1), "intValue")
       / 100.0;
    v7 = 1;
    goto LABEL_4;
  }
}

- (void)setSplitTypeString:(id)a3
{
  int v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(a3, "isEqualToString:", CFSTR("horizontal"));
    if ((v5 & 1) != 0 || objc_msgSend(a3, "isEqualToString:", CFSTR("vertical")))
      -[SUSplitViewController setVertical:](self, "setVertical:", v5 ^ 1u);
  }
}

- (id)splitPositionString
{
  void *v3;
  uint64_t v4;
  id result;
  void *v6;
  double v7;

  switch(-[SUSplitViewController layoutType](self, "layoutType"))
  {
    case 0:
      v3 = (void *)MEMORY[0x24BDD17C8];
      -[SUSplitViewController splitPosition](self, "splitPosition");
      result = (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%.0fpx"), v4);
      break;
    case 1:
      v6 = (void *)MEMORY[0x24BDD17C8];
      -[SUSplitViewController splitPosition](self, "splitPosition");
      result = (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("%.0f%%"), floor(v7 * 100.0));
      break;
    case 2:
      result = CFSTR("first");
      break;
    case 3:
      result = CFSTR("second");
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)splitTypeString
{
  if (-[SUSplitViewController isVertical](self, "isVertical"))
    return CFSTR("vertical");
  else
    return CFSTR("horizontal");
}

- (BOOL)isVertical
{
  return objc_msgSend(-[SUSplitViewController _splitView](self, "_splitView"), "isVertical");
}

- (int64_t)layoutType
{
  return objc_msgSend(-[SUSplitViewController _splitView](self, "_splitView"), "layoutType");
}

- (double)minimumPaneSize
{
  double result;

  objc_msgSend(-[SUSplitViewController _splitView](self, "_splitView"), "minimumPaneSize");
  return result;
}

- (void)setFirstViewController:(id)a3
{
  -[SUSplitViewController _setViewController:toValue:](self, "_setViewController:toValue:", &self->_firstViewController, a3);
}

- (void)setLayoutType:(int64_t)a3
{
  objc_msgSend(-[SUSplitViewController _splitView](self, "_splitView"), "setLayoutType:", a3);
}

- (void)setMainTitle:(id)a3
{
  NSString *mainTitle;

  mainTitle = self->_mainTitle;
  if (mainTitle != a3)
  {

    self->_mainTitle = (NSString *)a3;
    -[SUSplitViewController _reloadTitle](self, "_reloadTitle");
  }
}

- (void)setMinimumPaneSize:(double)a3
{
  objc_msgSend(-[SUSplitViewController _splitView](self, "_splitView"), "setMinimumPaneSize:", a3);
}

- (void)setSecondViewController:(id)a3
{
  -[SUSplitViewController _setViewController:toValue:](self, "_setViewController:toValue:", &self->_secondViewController, a3);
}

- (void)setSplitPosition:(double)a3
{
  objc_msgSend(-[SUSplitViewController _splitView](self, "_splitView"), "setSplitPosition:", a3);
}

- (void)setSplitShadow:(id)a3
{
  SUShadow *splitShadow;

  splitShadow = self->_splitShadow;
  if (splitShadow != a3)
  {

    self->_splitShadow = (SUShadow *)objc_msgSend(a3, "copy");
    -[SUSplitViewController _reloadView](self, "_reloadView");
  }
}

- (void)setUsesSharedPlaceholder:(BOOL)a3
{
  if (self->_usesSharedPlaceholder != a3)
  {
    self->_usesSharedPlaceholder = a3;
    -[SUSplitViewController _reloadLoadingState](self, "_reloadLoadingState");
  }
}

- (void)setVertical:(BOOL)a3
{
  objc_msgSend(-[SUSplitViewController _splitView](self, "_splitView"), "setVertical:", a3);
}

- (double)splitPosition
{
  double result;

  objc_msgSend(-[SUSplitViewController _splitView](self, "_splitView"), "splitPosition");
  return result;
}

- (void)storePage:(id)a3 finishedWithSuccess:(BOOL)a4
{
  if (!a4)
    -[UIViewController dismissAnimated:](self, "dismissAnimated:", 1);
}

- (void)_loadingDidChangeNotification:(id)a3
{
  UIViewController *v4;

  v4 = (UIViewController *)objc_msgSend(a3, "object");
  if (v4 == self->_firstViewController || v4 == self->_secondViewController)
  {
    if ((-[SUSplitViewController layoutType](self, "layoutType") & 0xFFFFFFFFFFFFFFFELL) == 2)
      -[SUSplitViewController _reloadView](self, "_reloadView");
    -[SUSplitViewController _reloadLoadingState](self, "_reloadLoadingState");
  }
}

- (void)_navigationItemDidChangeNotification:(id)a3
{
  UINavigationItem *v4;

  v4 = (UINavigationItem *)objc_msgSend(a3, "object");
  if (v4 == -[UIViewController navigationItem](self->_firstViewController, "navigationItem")
    || v4 == -[UIViewController navigationItem](self->_secondViewController, "navigationItem"))
  {
    -[SUSplitViewController _reloadTitle](self, "_reloadTitle");
  }
}

- (id)_newGradientWithValue:(id)a3
{
  uint64_t v5;
  void *v6;
  SUGradient *v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[SUGradient initWithPropertyList:]([SUGradient alloc], "initWithPropertyList:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6950]), "initWithStyleString:", a3);
  if (!v5)
    return 0;
  v6 = (void *)v5;
  v7 = +[SUGradient gradientWithColor:](SUGradient, "gradientWithColor:", v5);

  return v7;
}

- (id)_newViewControllerFromDictionary:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = (void *)objc_msgSend(-[SUViewController viewControllerFactory](self, "viewControllerFactory"), "newStorePageViewControllerWithSection:", 0);
  objc_msgSend(v5, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
  v6 = (void *)objc_msgSend(v5, "copyScriptProperties");
  v7 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("loads-progressively"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = objc_msgSend(v7, "BOOLValue");
  else
    v8 = 0;
  objc_msgSend(v6, "setShouldLoadProgressively:", v8);
  v9 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("scrolling-enabled"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "setScrollingDisabled:", objc_msgSend(v9, "BOOLValue") ^ 1);
  v10 = -[SUSplitViewController _newGradientWithValue:](self, "_newGradientWithValue:", objc_msgSend(a3, "objectForKey:", CFSTR("background-color")));
  objc_msgSend(v6, "setPlaceholderBackgroundGradient:", v10);

  objc_msgSend(v5, "setScriptProperties:", v6);
  return v5;
}

- (void)_reloadLoadingState
{
  uint64_t v3;
  BOOL v4;

  if (-[SUSplitViewController usesSharedPlaceholder](self, "usesSharedPlaceholder"))
  {
    if (-[UIViewController isSkLoaded](self->_firstViewController, "isSkLoaded"))
      v3 = -[UIViewController isSkLoaded](self->_secondViewController, "isSkLoaded") ^ 1;
    else
      v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  -[SUSplitViewController setSkLoading:](self, "setSkLoading:", v3);
  v4 = -[SUSplitViewController viewIsReady](self, "viewIsReady");
  if ((v3 & 1) == 0 && !v4)
  {
    -[SUSplitViewController _reloadView](self, "_reloadView");
    -[SUSplitViewController setViewIsReady:](self, "setViewIsReady:", 1);
  }
}

- (void)_reloadTitle
{
  NSString *v3;
  UIViewController *firstViewController;

  v3 = -[SUSplitViewController mainTitle](self, "mainTitle");
  if (!v3)
  {
    firstViewController = self->_firstViewController;
    if (!firstViewController)
      firstViewController = self->_secondViewController;
    v3 = -[UINavigationItem title](-[UIViewController navigationItem](firstViewController, "navigationItem", 0), "title");
  }
  -[SUViewController setTitle:](self, "setTitle:", v3);
}

- (void)_reloadView
{
  id v3;
  int64_t v4;
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
  _BOOL4 v18;
  UIView *v19;
  UIView *v20;
  CALayer *v21;
  double v22;
  CALayer *v23;
  double v24;
  SUShadow *splitShadow;
  double v26;
  double v27;

  v3 = -[SUSplitViewController _splitView](self, "_splitView");
  v4 = -[SUSplitViewController layoutType](self, "layoutType");
  if (v4 == 3)
  {
    objc_msgSend(v3, "bounds");
    v11 = v10;
    v13 = v12;
    -[UIViewController minimumViewSize](self->_secondViewController, "minimumViewSize");
    v15 = v14;
    v17 = v16;
    v18 = -[SUSplitViewController isVertical](self, "isVertical");
    v9 = v11 - v15;
    if (v18)
      v9 = v13 - v17;
    goto LABEL_8;
  }
  if (v4 == 2)
  {
    -[UIViewController minimumViewSize](self->_firstViewController, "minimumViewSize");
    v6 = v5;
    v8 = v7;
    if (-[SUSplitViewController isVertical](self, "isVertical"))
      v9 = v8;
    else
      v9 = v6;
LABEL_8:
    objc_msgSend(v3, "setSplitPosition:", v9);
  }
  v19 = -[UIViewController view](self->_firstViewController, "view");
  v20 = -[UIViewController view](self->_secondViewController, "view");
  objc_msgSend(v3, "setFirstView:", v19);
  objc_msgSend(v3, "setSecondView:", v20);
  v21 = -[UIView layer](v19, "layer");
  LODWORD(v22) = 0;
  -[CALayer setShadowOpacity:](v21, "setShadowOpacity:", v22);
  v23 = -[UIView layer](v20, "layer");
  LODWORD(v24) = 0;
  -[CALayer setShadowOpacity:](v23, "setShadowOpacity:", v24);
  splitShadow = self->_splitShadow;
  if (splitShadow)
  {
    -[SUShadow radius](splitShadow, "radius");
    if (v26 > 0.00000011920929
      || (-[SUShadow radius](self->_splitShadow, "radius"), v19 = v20, v27 < -0.00000011920929))
    {
      objc_msgSend(v3, "bringSubviewToFront:", v19);
      -[SUShadow applyToLayer:](self->_splitShadow, "applyToLayer:", -[UIView layer](v19, "layer"));
    }
  }
  objc_msgSend(v3, "layoutIfNeeded");
}

- (void)_reloadViewController:(id)a3 fromDictionary:(id)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  SUStructuredPage *v23;
  uint64_t v24;
  void *v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend(a4, "objectForKey:", CFSTR("contents"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("type"));
    if (!v9 || (v10 = v9, objc_msgSend(v9, "isEqualToString:", CFSTR("html-section"))))
    {
      objc_msgSend(a3, "reloadWithStorePage:ofType:forURL:", v8, 1, -[SUSplitViewController displayedURL](self, "displayedURL"));
      return;
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("plist-section")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (uint64_t)v8;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (v11 = objc_msgSend(v8, "dataUsingEncoding:", 4)) == 0)
        {
LABEL_27:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v23 = objc_alloc_init(SUStructuredPage);
            -[SUStructuredPage loadFromDictionary:](v23, "loadFromDictionary:", v8);
            objc_msgSend(a3, "reloadWithStorePage:ofType:forURL:", v23, 0, -[SUSplitViewController displayedURL](self, "displayedURL"));

          }
          return;
        }
      }
      v25 = 0;
      v8 = (void *)objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v11, 0, 0, &v25);
      if (v25)
      {
        v17 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v18 = objc_msgSend(v17, "shouldLog");
        if (objc_msgSend(v17, "shouldLogToDisk"))
          v19 = v18 | 2;
        else
          v19 = v18;
        if (!os_log_type_enabled((os_log_t)objc_msgSend(v17, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
          v19 &= 2u;
        if (v19)
        {
          v20 = objc_opt_class();
          v26 = 138412546;
          v27 = v20;
          v28 = 2112;
          v29 = v25;
          LODWORD(v24) = 22;
          v21 = _os_log_send_and_compose_impl();
          if (v21)
          {
            v22 = (void *)v21;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v21, 4, &v26, v24);
            free(v22);
            SSFileLog();
          }
        }
      }
      goto LABEL_27;
    }
    v12 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v13 = objc_msgSend(v12, "shouldLog");
    if (objc_msgSend(v12, "shouldLogToDisk"))
      v14 = v13 | 2;
    else
      v14 = v13;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v12, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v14 &= 2u;
    if (v14)
    {
      v26 = 138412546;
      v27 = objc_opt_class();
      v28 = 2112;
      v29 = v10;
      LODWORD(v24) = 22;
      v15 = _os_log_send_and_compose_impl();
      if (v15)
      {
        v16 = (void *)v15;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v26, v24);
        free(v16);
        SSFileLog();
      }
    }
  }
}

- (void)_reloadWithStorePageDictionary:(id)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;

  -[SUSplitViewController setSplitPositionAndLayoutTypeFromValue:](self, "setSplitPositionAndLayoutTypeFromValue:", objc_msgSend(a3, "objectForKey:", CFSTR("split-position")));
  -[SUSplitViewController setSplitTypeString:](self, "setSplitTypeString:", objc_msgSend(a3, "objectForKey:", CFSTR("split-type")));

  self->_placeholderGradient = (SUGradient *)-[SUSplitViewController _newGradientWithValue:](self, "_newGradientWithValue:", objc_msgSend(a3, "objectForKey:", CFSTR("background-color")));
  if (-[SUStorePageProtocol shouldDisplayInOverlay](-[SUStructuredPage protocol](self->_structuredPage, "protocol"), "shouldDisplayInOverlay"))
  {
    v5 = (void *)-[SUSplitViewController view](self, "view");
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;
    +[SUOverlayViewController defaultOverlaySize](SUOverlayViewController, "defaultOverlaySize");
    objc_msgSend(v5, "setFrame:", v7, v9, v10, v11);
  }
  -[SUSplitViewController setViewIsReady:](self, "setViewIsReady:", 0);
  v12 = objc_msgSend(a3, "objectForKey:", CFSTR("first-section"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = -[SUSplitViewController _newViewControllerFromDictionary:](self, "_newViewControllerFromDictionary:", v12);
    -[SUSplitViewController setFirstViewController:](self, "setFirstViewController:", v13);
    -[SUSplitViewController _reloadViewController:fromDictionary:](self, "_reloadViewController:fromDictionary:", v13, v12);

  }
  v14 = objc_msgSend(a3, "objectForKey:", CFSTR("second-section"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = -[SUSplitViewController _newViewControllerFromDictionary:](self, "_newViewControllerFromDictionary:", v14);
    -[SUSplitViewController setSecondViewController:](self, "setSecondViewController:", v15);
    -[SUSplitViewController _reloadViewController:fromDictionary:](self, "_reloadViewController:fromDictionary:", v15, v14);

  }
  -[SUSplitViewController _reloadLoadingState](self, "_reloadLoadingState");
}

- (void)_setPlaceholderVisible:(BOOL)a3
{
  SUPlaceholderViewController *placeholderViewController;
  SUPlaceholderViewController *v5;
  void *v6;
  void *v7;

  placeholderViewController = self->_placeholderViewController;
  if (a3)
  {
    if (!placeholderViewController)
    {
      v5 = (SUPlaceholderViewController *)objc_msgSend(-[SUViewController viewControllerFactory](self, "viewControllerFactory"), "newPlaceholderViewController");
      self->_placeholderViewController = v5;
      -[SUPlaceholderViewController setBackgroundGradient:](v5, "setBackgroundGradient:", self->_placeholderGradient);
      -[SUViewController setClientInterface:](self->_placeholderViewController, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
      -[SUSplitViewController addChildViewController:](self, "addChildViewController:", self->_placeholderViewController);
      if (-[SUSplitViewController isViewLoaded](self, "isViewLoaded"))
      {
        v6 = (void *)-[SUSplitViewController view](self, "view");
        -[SUViewController viewWillAppear:](self->_placeholderViewController, "viewWillAppear:", 0);
        v7 = (void *)-[SUPlaceholderViewController view](self->_placeholderViewController, "view");
        objc_msgSend(v6, "bounds");
        objc_msgSend(v7, "setFrame:");
        objc_msgSend(v6, "addSubview:", v7);
        -[SUViewController viewDidAppear:](self->_placeholderViewController, "viewDidAppear:", 0);
      }
    }
  }
  else
  {
    if (-[SUPlaceholderViewController isViewLoaded](placeholderViewController, "isViewLoaded"))
    {
      -[SUViewController viewWillDisappear:](self->_placeholderViewController, "viewWillDisappear:", 0);
      objc_msgSend((id)-[SUPlaceholderViewController view](self->_placeholderViewController, "view"), "removeFromSuperview");
      -[SUViewController viewDidDisappear:](self->_placeholderViewController, "viewDidDisappear:", 0);
    }
    if (self->_placeholderViewController)
    {
      -[SUSplitViewController removeChildViewController:](self, "removeChildViewController:");

      self->_placeholderViewController = 0;
    }
  }
}

- (void)_setStructuredPage:(id)a3
{
  SUStructuredPage *structuredPage;

  structuredPage = self->_structuredPage;
  if (structuredPage != a3)
  {

    self->_structuredPage = (SUStructuredPage *)a3;
    -[SUViewController storePageProtocolDidChange](self, "storePageProtocolDidChange");
  }
}

- (void)_setViewController:(id *)a3 toValue:(id)a4
{
  id v7;

  if (*a3 != a4)
  {
    v7 = *a3;

    *a3 = a4;
    if (v7)
      -[SUSplitViewController removeChildViewController:](self, "removeChildViewController:", v7);
    if (-[SUSplitViewController isViewLoaded](self, "isViewLoaded"))
    {
      objc_msgSend(v7, "viewWillDisappear:", 0);
      objc_msgSend(*a3, "viewWillAppear:", 0);
      -[SUSplitViewController _reloadView](self, "_reloadView");
      objc_msgSend(*a3, "viewDidAppear:", 0);
      objc_msgSend(v7, "viewDidDisappear:", 0);
    }
    if (*a3)
      -[SUSplitViewController addChildViewController:](self, "addChildViewController:");

  }
}

- (id)_splitView
{
  id result;
  SUSplitView *v4;

  result = self->_splitView;
  if (!result)
  {
    v4 = objc_alloc_init(SUSplitView);
    self->_splitView = v4;
    -[SUSplitView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
    return self->_splitView;
  }
  return result;
}

- (NSURL)displayedURL
{
  return self->_displayedURL;
}

- (void)setDisplayedURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1112);
}

- (BOOL)viewIsReady
{
  return self->_viewIsReady;
}

- (void)setViewIsReady:(BOOL)a3
{
  self->_viewIsReady = a3;
}

- (UIViewController)firstViewController
{
  return self->_firstViewController;
}

- (NSString)mainTitle
{
  return self->_mainTitle;
}

- (UIViewController)secondViewController
{
  return self->_secondViewController;
}

- (SUShadow)splitShadow
{
  return self->_splitShadow;
}

- (BOOL)usesSharedPlaceholder
{
  return self->_usesSharedPlaceholder;
}

@end
