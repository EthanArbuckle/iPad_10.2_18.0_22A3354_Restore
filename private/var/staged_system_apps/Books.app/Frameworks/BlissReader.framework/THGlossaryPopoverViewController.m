@implementation THGlossaryPopoverViewController

+ (double)toolbarButtonHInset
{
  return 8.0;
}

- (THGlossaryPopoverViewController)initWithTerm:(id)a3 glossaryController:(id)a4
{
  THGlossaryPopoverViewController *v6;
  THGlossaryPopoverViewController *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)THGlossaryPopoverViewController;
  v6 = -[THGlossaryPopoverViewController init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    -[THGlossaryPopoverViewController setTerm:](v6, "setTerm:", a3);
    -[THGlossaryPopoverViewController setGlossaryController:](v7, "setGlossaryController:", a4);
    v9 = (void *)objc_opt_class(THGlossaryInteractiveCanvasController, v8);
    v11 = (void *)objc_opt_class(THGlossaryiOSCanvasViewController, v10);
    THCanvasCreateWithClass(v7, (id *)&v7->_icc, &v7->_cvc, v9, v11);
    -[THGlossaryInteractiveCanvasController disableAllGestures](-[THGlossaryPopoverViewController icc](v7, "icc"), "disableAllGestures");
    -[THGlossaryPopoverViewController setTheme:](v7, "setTheme:", +[IMTheme themeWithIdentifier:](IMTheme, "themeWithIdentifier:", kIMThemeIdentifierBlissClassicTheme));
    -[THGlossaryPopoverViewController p_updateGlossaryDefinitionSynchronous:](v7, "p_updateGlossaryDefinitionSynchronous:", 1);
    -[THGlossaryPopoverViewController registerForTraitChanges:withAction:](v7, "registerForTraitChanges:withAction:", +[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"), "_traitCollectionDidChange:previousTraitCollection:");
  }
  return v7;
}

- (id)p_glossaryEntryForTerm:(id)a3
{
  THModelGlossary *v4;
  uint64_t v5;
  id v6;

  v4 = -[THDocumentRoot glossary](-[THGlossaryController documentRoot](-[THGlossaryPopoverViewController glossaryController](self, "glossaryController"), "documentRoot"), "glossary");
  if (-[THModelGlossary entryCount](v4, "entryCount") < 1)
    return 0;
  v5 = 0;
  while (1)
  {
    v6 = -[THModelGlossary entryAtIndex:](v4, "entryAtIndex:", v5);
    if (!objc_msgSend(a3, "compare:options:", objc_msgSend(v6, "term"), 1))
      break;
    if (++v5 >= -[THModelGlossary entryCount](v4, "entryCount"))
      return 0;
  }
  return v6;
}

- (void)showGlossaryIndex
{
  _QWORD v2[4];
  THGlossaryPopoverViewController *v3;
  THBookViewController *v4;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_B0BD0;
  v2[3] = &unk_426E28;
  v3 = self;
  v4 = -[THGlossaryPopoverViewController bookViewController](self, "bookViewController");
  -[THGlossaryPopoverViewController dismissViewControllerAnimated:completion:](v3, "dismissViewControllerAnimated:completion:", 0, v2);
}

- (TSKDocumentRoot)documentRoot
{
  return (TSKDocumentRoot *)-[THGlossaryController documentRoot](-[THGlossaryPopoverViewController glossaryController](self, "glossaryController"), "documentRoot");
}

- (BOOL)isCanvasInteractive
{
  return 1;
}

- (Class)wpEditorClassOverride
{
  return (Class)objc_opt_class(THWPEditingController, a2);
}

- (void)loadView
{
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v3 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 320.0, 366.0);
  -[THGlossaryPopoverViewController setGlossaryRootView:](self, "setGlossaryRootView:", v3);
  objc_msgSend(v3, "setAutoresizingMask:", 18);
  v4 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 15.0, 94.0, 290.0, 30.0);
  -[THGlossaryPopoverViewController setNotFoundLabel:](self, "setNotFoundLabel:", v4);
  objc_msgSend(v4, "setFont:", +[UIFont fontWithName:size:](UIFont, "fontWithName:size:", CFSTR("Baskerville-Italic"), 24.0));
  objc_msgSend(v4, "setText:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Not found."), &stru_43D7D8, 0));
  objc_msgSend(v4, "setHidden:", 1);
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "addSubview:", v4);
  objc_msgSend(v3, "bounds");
  v6 = v5;
  v8 = v7 + -22.0;
  v10 = objc_msgSend(objc_alloc((Class)TSKScrollView), "initWithFrame:", v9, 22.0, v5, v7 + -22.0);
  -[THGlossaryPopoverViewController setDefinition:](self, "setDefinition:", v10);
  objc_msgSend(v10, "setOpaque:", 0);
  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v10, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "addSubview:", v10);
  v11 = objc_alloc((Class)UIView);
  objc_msgSend(v10, "bounds");
  v12 = objc_msgSend(v11, "initWithFrame:");
  -[THGlossaryPopoverViewController setContainer:](self, "setContainer:", v12);
  objc_msgSend(v10, "addSubview:", v12);
  v13 = -[THGlossaryInteractiveCanvasController canvasView](-[THGlossaryPopoverViewController icc](self, "icc"), "canvasView");
  objc_msgSend(v12, "addSubview:", v13);
  objc_msgSend(v13, "setFrame:", 0.0, 22.0, v6, v8);
  objc_msgSend(v13, "setAutoresizingMask:", 0);
  -[THGlossaryPopoverViewController setView:](self, "setView:", v3);

  -[THGlossaryPopoverViewController setPreferredContentSize:](self, "setPreferredContentSize:", 320.0, 366.0);
  -[THGlossaryPopoverViewController p_updateColors](self, "p_updateColors");
}

+ (id)p_toolbarArrowBackgroundColor
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.964705882, 1.0);
}

+ (id)p_navigationBarArrowBackgroundColor
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.976470588, 1.0);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)THGlossaryPopoverViewController;
  -[THGlossaryPopoverViewController viewWillAppear:](&v5, "viewWillAppear:");
  -[THGlossaryiOSCanvasViewController viewWillAppear:](-[THGlossaryPopoverViewController cvc](self, "cvc"), "viewWillAppear:", v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)THGlossaryPopoverViewController;
  -[THGlossaryPopoverViewController viewDidAppear:](&v5, "viewDidAppear:");
  -[THGlossaryiOSCanvasViewController viewDidAppear:](-[THGlossaryPopoverViewController cvc](self, "cvc"), "viewDidAppear:", v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)THGlossaryPopoverViewController;
  -[THGlossaryPopoverViewController viewWillDisappear:](&v5, "viewWillDisappear:");
  -[THGlossaryiOSCanvasViewController viewWillDisappear:](-[THGlossaryPopoverViewController cvc](self, "cvc"), "viewWillDisappear:", v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)THGlossaryPopoverViewController;
  -[THGlossaryPopoverViewController viewDidDisappear:](&v5, "viewDidDisappear:");
  -[THGlossaryiOSCanvasViewController viewDidDisappear:](-[THGlossaryPopoverViewController cvc](self, "cvc"), "viewDidDisappear:", v3);
}

- (void)dealloc
{
  objc_super v3;

  -[THGlossaryPopoverViewController p_cleanup](self, "p_cleanup");
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryPopoverViewController;
  -[THGlossaryPopoverViewController dealloc](&v3, "dealloc");
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  -[THGlossaryPopoverViewController p_updateColors](self, "p_updateColors", a3, a4);
  -[THGlossaryPopoverViewController p_updateGlossaryDefinitionSynchronous:](self, "p_updateGlossaryDefinitionSynchronous:", 1);
}

- (void)setTheme:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THGlossaryPopoverViewController;
  -[THGlossaryPopoverViewController setTheme:](&v5, "setTheme:");
  -[THGlossaryiOSCanvasViewController setTheme:](-[THGlossaryPopoverViewController cvc](self, "cvc"), "setTheme:", a3);
  -[THGlossaryPopoverViewController p_updateColors](self, "p_updateColors");
}

- (void)p_insetScrollerContentEdges
{
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  unsigned int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v3 = -[THGlossaryPopoverViewController navigationController](self, "navigationController");
  v4 = objc_msgSend(objc_msgSend(objc_msgSend(-[THGlossaryPopoverViewController view](self, "view"), "window"), "windowScene"), "statusBarManager");
  v5 = 0.0;
  v6 = 0.0;
  if ((-[THGlossaryPopoverViewController _isInPopoverPresentation](self, "_isInPopoverPresentation") & 1) == 0)
  {
    objc_msgSend(v4, "statusBarHeight");
    v6 = v7;
  }
  objc_msgSend(objc_msgSend(v3, "navigationBar"), "frameHeight");
  v9 = v8;
  v10 = objc_msgSend(v3, "isNavigationBarHidden");
  if ((objc_msgSend(v3, "isToolbarHidden") & 1) == 0)
  {
    objc_msgSend(objc_msgSend(v3, "toolbar"), "frameHeight");
    v5 = v11 + 0.0;
  }
  v12 = -0.0;
  if (!v10)
    v12 = v9;
  v13 = v6 + v12;
  -[UIScrollView contentOffset](-[THGlossaryPopoverViewController definition](self, "definition"), "contentOffset");
  v15 = v14;
  v17 = v16;
  -[UIScrollView setContentInset:](-[THGlossaryPopoverViewController definition](self, "definition"), "setContentInset:", v13, 0.0, v5, 0.0);
  -[UIScrollView setScrollIndicatorInsets:](-[THGlossaryPopoverViewController definition](self, "definition"), "setScrollIndicatorInsets:", v9, 0.0, v5, 0.0);
  if (v17 - v13 >= -v13)
    v18 = v17 - v13;
  else
    v18 = -v13;
  -[UIScrollView setContentOffset:](-[THGlossaryPopoverViewController definition](self, "definition"), "setContentOffset:", v15, v18);
}

- (void)p_updateGlossaryDefinitionSynchronous:(BOOL)a3
{
  _BOOL4 v3;
  NSString *v5;
  id v6;
  _QWORD v7[5];

  v3 = a3;
  v5 = -[THGlossaryPopoverViewController term](self, "term");
  if (-[NSString length](v5, "length")
    && (v6 = -[THGlossaryPopoverViewController p_glossaryEntryForTerm:](self, "p_glossaryEntryForTerm:", v5)) != 0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_B12EC;
    v7[3] = &unk_428F50;
    v7[4] = self;
    if (v3)
      objc_msgSend(v6, "synchronouslyLoadInfoOnComplete:", v7);
    else
      objc_msgSend(v6, "loadInfoOnComplete:", v7);
  }
  else
  {
    -[UILabel setHidden:](-[THGlossaryPopoverViewController notFoundLabel](self, "notFoundLabel"), "setHidden:", 0);
    -[UIScrollView setHidden:](-[THGlossaryPopoverViewController definition](self, "definition"), "setHidden:", 1);
  }
}

- (void)showDictionaryEntry
{
  THGlossaryPresenting *v2;
  THGlossaryPresenting *v3;
  THGlossaryPopoverViewController *v4;

  v2 = -[THGlossaryPopoverViewController glossaryPresenting](self, "glossaryPresenting");
  if (v2)
  {
    v3 = v2;
    if ((objc_opt_respondsToSelector(v2, "replaceGlossaryPopoverWithDictionaryForTerm:") & 1) != 0)
    {
      v4 = self;
      -[THGlossaryPresenting replaceGlossaryPopoverWithDictionaryForTerm:](v3, "replaceGlossaryPopoverWithDictionaryForTerm:", -[THGlossaryPopoverViewController term](self, "term"));

    }
  }
}

- (void)p_cleanup
{
  -[THGlossaryEntryLayout setLayoutStyleProvider:](-[THGlossaryPopoverViewController glossaryEntryLayout](self, "glossaryEntryLayout"), "setLayoutStyleProvider:", 0);
  -[UIButton removeFromSuperview](-[THGlossaryPopoverViewController textBubble](self, "textBubble"), "removeFromSuperview");
  -[UIScrollView setDelegate:](-[THGlossaryPopoverViewController definition](self, "definition"), "setDelegate:", 0);
  -[THGlossaryInteractiveCanvasController setDelegate:](-[THGlossaryPopoverViewController icc](self, "icc"), "setDelegate:", 0);
  -[THGlossaryInteractiveCanvasController teardown](-[THGlossaryPopoverViewController icc](self, "icc"), "teardown");
  -[THGlossaryiOSCanvasViewController teardown](-[THGlossaryPopoverViewController cvc](self, "cvc"), "teardown");
  -[THGlossaryPopoverViewController setGlossaryController:](self, "setGlossaryController:", 0);
  -[THGlossaryPopoverViewController setGlossaryEntryLayout:](self, "setGlossaryEntryLayout:", 0);
  -[THGlossaryPopoverViewController setTextBubble:](self, "setTextBubble:", 0);
  -[THGlossaryPopoverViewController setIcc:](self, "setIcc:", 0);
  -[THGlossaryPopoverViewController setCvc:](self, "setCvc:", 0);
  -[THGlossaryPopoverViewController setNotFoundLabel:](self, "setNotFoundLabel:", 0);
  -[THGlossaryPopoverViewController setTerm:](self, "setTerm:", 0);
  -[THGlossaryPopoverViewController setDefinition:](self, "setDefinition:", 0);
  -[THGlossaryPopoverViewController setContainer:](self, "setContainer:", 0);
  -[THGlossaryPopoverViewController setGlossaryRootView:](self, "setGlossaryRootView:", 0);
  -[THGlossaryPopoverViewController setBottomButtons:](self, "setBottomButtons:", 0);
}

- (void)p_updateColors
{
  id v3;
  void *v4;
  UIColor *v5;
  id v6;
  void *v7;
  UILabel *v8;

  v3 = -[THGlossaryPopoverViewController themePage](self, "themePage");
  if (v3)
  {
    v4 = v3;
    v5 = (UIColor *)objc_msgSend(v3, "contentTextColor");
    v6 = objc_msgSend(v4, "backgroundColorForTraitEnvironment:", self);
  }
  else
  {
    v5 = +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.129411765, 0.22745098, 0.411764706, 1.0);
    v6 = objc_msgSend(-[THGlossaryPopoverViewController glossaryEntryLayoutBackgroundColor](self, "glossaryEntryLayoutBackgroundColor"), "UIColor");
  }
  v7 = v6;
  -[UIView setBackgroundColor:](-[THGlossaryPopoverViewController glossaryRootView](self, "glossaryRootView"), "setBackgroundColor:", v6);
  v8 = -[THGlossaryPopoverViewController notFoundLabel](self, "notFoundLabel");
  -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v7);
  -[UILabel setTextColor:](v8, "setTextColor:", v5);
  -[UIView setBackgroundColor:](-[THGlossaryPopoverViewController container](self, "container"), "setBackgroundColor:", v7);
  objc_msgSend(objc_msgSend(-[THGlossaryInteractiveCanvasController canvasView](-[THGlossaryPopoverViewController icc](self, "icc"), "canvasView"), "layer"), "setBackgroundColor:", objc_msgSend(v7, "CGColor"));
}

- (void)scrollViewDidScroll:(id)a3
{
  -[THInteractiveCanvasController scrollViewDidScroll:](-[THGlossaryPopoverViewController icc](self, "icc"), "scrollViewDidScroll:", a3);
}

- (int)glossaryEntryLayoutFloatingStyle
{
  return 0;
}

- (CGRect)glossaryEntryLayoutViewFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend(-[THGlossaryPopoverViewController view](self, "view"), "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGSize)glossaryEntryLayoutContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[THGlossaryPopoverViewController glossaryEntryLayoutViewFrame](self, "glossaryEntryLayoutViewFrame");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (double)glossaryEntryLayoutValueForDistance:(int)a3
{
  double result;

  result = 0.0;
  if (a3 <= 2)
    return dbl_314460[a3];
  return result;
}

- (double)glossaryEntryLayoutDefaultHeightForPortion:(int)a3
{
  return dbl_314410[a3];
}

- (double)glossaryEntryLayoutTopMarginForPortion:(int)a3
{
  return dbl_314438[a3];
}

- (id)glossaryEntryLayoutBackgroundColor
{
  UIColor *v2;

  v2 = (UIColor *)objc_msgSend(-[THGlossaryPopoverViewController theme](self, "theme"), "backgroundColorForTraitEnvironment:", self);
  if (!v2)
    v2 = +[UIColor whiteColor](UIColor, "whiteColor");
  return +[TSUColor colorWithUIColor:](TSUColor, "colorWithUIColor:", v2);
}

- (id)glossaryEntryLayoutForegroundColor
{
  UIColor *v2;

  v2 = (UIColor *)objc_msgSend(-[THGlossaryPopoverViewController theme](self, "theme"), "contentTextColor");
  if (!v2)
    v2 = +[UIColor blackColor](UIColor, "blackColor");
  return +[TSUColor colorWithUIColor:](TSUColor, "colorWithUIColor:", v2);
}

- (BOOL)glossaryEntryLayoutHasFooter
{
  return 0;
}

- (BOOL)glossaryEntryLayoutIncludePortion:(int)a3
{
  return (a3 - 1) < 2;
}

- (NSString)term
{
  return self->_term;
}

- (void)setTerm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (THGlossaryPresenting)glossaryPresenting
{
  return self->_glossaryPresenting;
}

- (void)setGlossaryPresenting:(id)a3
{
  self->_glossaryPresenting = (THGlossaryPresenting *)a3;
}

- (THBookViewController)bookViewController
{
  return self->_bookViewController;
}

- (void)setBookViewController:(id)a3
{
  self->_bookViewController = (THBookViewController *)a3;
}

- (UIView)glossaryRootView
{
  return self->_glossaryRootView;
}

- (void)setGlossaryRootView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (UILabel)notFoundLabel
{
  return self->_notFoundLabel;
}

- (void)setNotFoundLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (THGlossaryController)glossaryController
{
  return self->_glossaryController;
}

- (void)setGlossaryController:(id)a3
{
  self->_glossaryController = (THGlossaryController *)a3;
}

- (THGlossaryEntryLayout)glossaryEntryLayout
{
  return self->_glossaryEntryLayout;
}

- (void)setGlossaryEntryLayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (THGlossaryInteractiveCanvasController)icc
{
  return self->_icc;
}

- (void)setIcc:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (THGlossaryiOSCanvasViewController)cvc
{
  return self->_cvc;
}

- (void)setCvc:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (UIScrollView)definition
{
  return self->_definition;
}

- (void)setDefinition:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (UIView)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (UIToolbar)bottomButtons
{
  return self->_bottomButtons;
}

- (void)setBottomButtons:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (UIButton)textBubble
{
  return self->_textBubble;
}

- (void)setTextBubble:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

@end
