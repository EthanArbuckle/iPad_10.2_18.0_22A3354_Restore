@implementation THiOSStudyViewController

- (THiOSStudyViewController)initWithDocumentRoot:(id)a3
{
  THiOSStudyViewController *v4;
  THNoteCardsController *v5;

  v4 = -[THiOSStudyViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, THBundle());
  if (v4)
  {
    v5 = -[THNoteCardsController initWithDocumentRoot:]([THNoteCardsController alloc], "initWithDocumentRoot:", a3);
    v4->_noteCardsController = v5;
    -[THNoteCardsController setDelegate:](v5, "setDelegate:", v4);
    -[THiOSStudyViewController p_setupGestureRecognizers](v4, "p_setupGestureRecognizers");
    -[THiOSStudyViewController addKeyCommand:](v4, "addKeyCommand:", +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", UIKeyInputLeftArrow, 0, "_keyLeft:"));
    -[THiOSStudyViewController addKeyCommand:](v4, "addKeyCommand:", +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", UIKeyInputRightArrow, 0, "_keyRight:"));
    -[THiOSStudyViewController addKeyCommand:](v4, "addKeyCommand:", +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR(" "), 0, "_keySpace:"));
    -[THiOSStudyViewController addKeyCommand:](v4, "addKeyCommand:", +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, "_keyEnter:"));
    -[THiOSStudyViewController registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", +[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"), "_traitCollectionDidChange:previousTraitCollection:");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[THNoteCardsController detachFromView:](self->_noteCardsController, "detachFromView:", -[THiOSStudyViewController view](self, "view"));
  -[NSNotificationCenter removeObserver:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:", self);

  self->_theme = 0;
  self->_panGR = 0;

  self->_flickGR = 0;
  self->_tapGR = 0;

  self->_indirectPanGR = 0;
  self->_optionsPopoverController = 0;

  self->_titleLabel = 0;
  self->_doneButton = 0;

  self->_optionsButton = 0;
  self->_backdrop = 0;

  self->_noteCardsController = 0;
  v3.receiver = self;
  v3.super_class = (Class)THiOSStudyViewController;
  -[THiOSStudyViewController dealloc](&v3, "dealloc");
}

- (UIEdgeInsets)p_scaledInsetsFromInsets:(UIEdgeInsets)a3 referenceSize:(CGSize)a4
{
  double height;
  double width;
  double right;
  double bottom;
  double left;
  CGFloat top;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  height = a4.height;
  width = a4.width;
  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  objc_msgSend(-[THiOSStudyViewController view](self, "view"), "bounds");
  v11 = round(left / width * v10);
  v12 = round(right / width * v10);
  v14 = round(bottom / height * v13);
  v15 = top;
  v16 = v12;
  result.right = v16;
  result.bottom = v14;
  result.left = v11;
  result.top = v15;
  return result;
}

- (UIEdgeInsets)p_cardEdgeInsets
{
  unsigned int v3;
  unsigned int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  v3 = -[THiOSStudyViewController im_isCompactWidth](self, "im_isCompactWidth");
  v4 = -[THiOSStudyViewController im_isCompactHeight](self, "im_isCompactHeight");
  if (-[THNoteCardsController noteCardCount](self->_noteCardsController, "noteCardCount") <= 1)
    goto LABEL_2;
  v11 = v4 ^ 1;
  if (((v3 ^ 1) & 1) == 0 && (v11 & 1) == 0)
  {
    v5 = 38.0;
    v7 = 667.0;
    v8 = 375.0;
    v6 = 20.0;
    v9 = 22.0;
    v10 = 20.0;
    goto LABEL_11;
  }
  if (((v3 ^ 1 | v4) & 1) == 0)
  {
    v5 = 58.0;
    v10 = 32.0;
    v7 = 375.0;
    v8 = 667.0;
    v6 = 8.0;
    v9 = 20.0;
    goto LABEL_11;
  }
  if (((v3 | v11) & 1) != 0)
  {
LABEL_2:
    v5 = 58.0;
    v6 = 64.0;
    v7 = 1024.0;
    v8 = 768.0;
    v9 = 30.0;
  }
  else
  {
    v5 = 38.0;
    v6 = 64.0;
    v7 = 736.0;
    v8 = 414.0;
    v9 = 20.0;
  }
  v10 = 64.0;
LABEL_11:
  -[THiOSStudyViewController p_scaledInsetsFromInsets:referenceSize:](self, "p_scaledInsetsFromInsets:referenceSize:", v5, v6, v9, v10, v7, v8);
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)viewDidLoad
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THiOSStudyViewController;
  -[THiOSStudyViewController viewDidLoad](&v4, "viewDidLoad");
  objc_msgSend(-[NSLayoutXAxisAnchor constraintEqualToAnchor:](-[UIView leftAnchor](-[THiOSStudyViewController contentView](self, "contentView"), "leftAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(-[THiOSStudyViewController view](self, "view"), "safeAreaLayoutGuide"), "leftAnchor")), "setActive:", 1);
  objc_msgSend(-[NSLayoutXAxisAnchor constraintEqualToAnchor:](-[UIView rightAnchor](-[THiOSStudyViewController contentView](self, "contentView"), "rightAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(-[THiOSStudyViewController view](self, "view"), "safeAreaLayoutGuide"), "rightAnchor")), "setActive:", 1);
  objc_msgSend(-[NSLayoutYAxisAnchor constraintEqualToAnchor:](-[UIView topAnchor](-[THiOSStudyViewController contentView](self, "contentView"), "topAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(-[THiOSStudyViewController view](self, "view"), "safeAreaLayoutGuide"), "topAnchor")), "setActive:", 1);
  objc_msgSend(-[NSLayoutYAxisAnchor constraintEqualToAnchor:](-[UIView bottomAnchor](-[THiOSStudyViewController contentView](self, "contentView"), "bottomAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(-[THiOSStudyViewController view](self, "view"), "safeAreaLayoutGuide"), "bottomAnchor")), "setActive:", 1);
  v3 = objc_alloc((Class)UIView);
  objc_msgSend(-[THiOSStudyViewController view](self, "view"), "bounds");
  -[THiOSStudyViewController setBackdrop:](self, "setBackdrop:", objc_msgSend(v3, "initWithFrame:"));
  -[UIView setBackgroundColor:](-[THiOSStudyViewController backdrop](self, "backdrop"), "setBackgroundColor:", +[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  objc_msgSend(-[THiOSStudyViewController view](self, "view"), "insertSubview:atIndex:", -[THiOSStudyViewController backdrop](self, "backdrop"), 0);
  -[UIButton setTitle:forState:](-[THiOSStudyViewController doneButton](self, "doneButton"), "setTitle:forState:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Done"), &stru_43D7D8, 0), 0);
  -[UIButton sizeToFit](-[THiOSStudyViewController doneButton](self, "doneButton"), "sizeToFit");
  -[UIButton setTitleColor:forState:](-[THiOSStudyViewController doneButton](self, "doneButton"), "setTitleColor:forState:", +[UIColor bc_booksLabelColor](UIColor, "bc_booksLabelColor"), 0);
  -[UIButton setPointerInteractionEnabled:](-[THiOSStudyViewController doneButton](self, "doneButton"), "setPointerInteractionEnabled:", 1);
  -[UIButton setTitle:forState:](-[THiOSStudyViewController optionsButton](self, "optionsButton"), "setTitle:forState:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Options"), &stru_43D7D8, 0), 0);
  -[UIButton setTitleColor:forState:](-[THiOSStudyViewController optionsButton](self, "optionsButton"), "setTitleColor:forState:", +[UIColor bc_booksLabelColor](UIColor, "bc_booksLabelColor"), 0);
  -[UIButton sizeToFit](-[THiOSStudyViewController optionsButton](self, "optionsButton"), "sizeToFit");
  -[UIButton setPointerInteractionEnabled:](-[THiOSStudyViewController optionsButton](self, "optionsButton"), "setPointerInteractionEnabled:", 1);
  objc_msgSend(-[THiOSStudyViewController view](self, "view"), "setTintColor:", +[UIColor whiteColor](UIColor, "whiteColor"));
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THiOSStudyViewController;
  -[THiOSStudyViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[THiOSStudyViewController p_updateDarkMode](self, "p_updateDarkMode");
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THiOSStudyViewController;
  -[THiOSStudyViewController viewWillLayoutSubviews](&v3, "viewWillLayoutSubviews");
  -[THiOSStudyViewController p_layoutViewsWithDuration:](self, "p_layoutViewsWithDuration:", 0.0);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  THNoteCardsController *noteCardsController;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THiOSStudyViewController;
  -[THiOSStudyViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v8, "viewDidMoveToWindow:shouldAppearOrDisappear:", a3, a4);
  noteCardsController = self->_noteCardsController;
  v7 = -[THiOSStudyViewController view](self, "view");
  if (a3)
  {
    -[THNoteCardsController attachToView:](noteCardsController, "attachToView:", v7);
    objc_msgSend(-[THiOSStudyViewController view](self, "view"), "insertSubview:atIndex:", -[THiOSStudyViewController backdrop](self, "backdrop"), 0);
  }
  else
  {
    -[THNoteCardsController detachFromView:](noteCardsController, "detachFromView:", v7);
  }
}

- (int64_t)overrideUserInterfaceStyle
{
  int64_t result;
  uint64_t v4;
  uint64_t v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THiOSStudyViewController;
  result = -[THiOSStudyViewController overrideUserInterfaceStyle](&v7, "overrideUserInterfaceStyle");
  if (!result)
  {
    v5 = objc_opt_class(IMThemePage, v4);
    *(_QWORD *)&v6 = TSUDynamicCast(v5, -[THiOSStudyViewController theme](self, "theme")).n128_u64[0];
    if (result)
      return (int64_t)objc_msgSend((id)result, "userInterfaceStyle", v6);
  }
  return result;
}

- (void)p_updateFlipGlyphWithTouches:(id)a3
{
  THNoteCardsController *noteCardsController;

  if (objc_msgSend(a3, "count") == (char *)&dword_0 + 1)
  {
    noteCardsController = self->_noteCardsController;
    objc_msgSend(objc_msgSend(a3, "anyObject"), "locationInView:", -[THiOSStudyViewController view](self, "view"));
    -[THNoteCardsController handleTopCardFlipAffordancePressed:](self->_noteCardsController, "handleTopCardFlipAffordancePressed:", -[THNoteCardsController isPointInsideTopCardFlipGlyph:](noteCardsController, "isPointInsideTopCardFlipGlyph:"));
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v7;

  -[THiOSStudyViewController p_updateFlipGlyphWithTouches:](self, "p_updateFlipGlyphWithTouches:");
  v7.receiver = self;
  v7.super_class = (Class)THiOSStudyViewController;
  -[THiOSStudyViewController touchesBegan:withEvent:](&v7, "touchesBegan:withEvent:", a3, a4);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  objc_super v7;

  -[THiOSStudyViewController p_updateFlipGlyphWithTouches:](self, "p_updateFlipGlyphWithTouches:");
  v7.receiver = self;
  v7.super_class = (Class)THiOSStudyViewController;
  -[THiOSStudyViewController touchesMoved:withEvent:](&v7, "touchesMoved:withEvent:", a3, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v7;

  -[THNoteCardsController handleTopCardFlipAffordancePressed:](self->_noteCardsController, "handleTopCardFlipAffordancePressed:", 0);
  v7.receiver = self;
  v7.super_class = (Class)THiOSStudyViewController;
  -[THiOSStudyViewController touchesEnded:withEvent:](&v7, "touchesEnded:withEvent:", a3, a4);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v7;

  -[THNoteCardsController handleTopCardFlipAffordancePressed:](self->_noteCardsController, "handleTopCardFlipAffordancePressed:", 0);
  v7.receiver = self;
  v7.super_class = (Class)THiOSStudyViewController;
  -[THiOSStudyViewController touchesCancelled:withEvent:](&v7, "touchesCancelled:withEvent:", a3, a4);
}

- (int64_t)interfaceOrientation
{
  return (int64_t)objc_msgSend(objc_msgSend(-[THiOSStudyViewController bc_windowForViewController](self, "bc_windowForViewController"), "windowScene"), "interfaceOrientation");
}

- (BOOL)shouldAutorotate
{
  return !self->_isTransitioningInOut;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  unsigned __int8 v6;
  _QWORD v7[6];
  BOOL v8;
  _QWORD v9[6];
  BOOL v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  CGAffineTransform v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)THiOSStudyViewController;
  -[THiOSStudyViewController viewWillTransitionToSize:withTransitionCoordinator:](&v16, "viewWillTransitionToSize:withTransitionCoordinator:", a3.width, a3.height);
  if (a4)
  {
    objc_msgSend(a4, "targetTransform");
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_CE68C;
    v9[3] = &unk_4292A0;
    v10 = !CGAffineTransformIsIdentity(&v15);
    v9[4] = self;
    v9[5] = &v11;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_CE6F8;
    v7[3] = &unk_4292A0;
    v8 = v10;
    v7[4] = self;
    v7[5] = &v11;
    v6 = objc_msgSend(a4, "animateAlongsideTransition:completion:", v9, v7);
    *((_BYTE *)v12 + 24) = v6;
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    objc_msgSend(0, "transitionDuration");
    -[THiOSStudyViewController p_layoutViewsWithDuration:](self, "p_layoutViewsWithDuration:");
  }
}

- (void)p_updateDarkMode
{
  -[THNoteCardsController setDarkMode:](self->_noteCardsController, "setDarkMode:", (char *)-[THiOSStudyViewController overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle") == (char *)&dword_0 + 2);
}

- (void)setTheme:(id)a3
{
  IMTheme *theme;

  theme = self->_theme;
  if (theme)
  {

    self->_theme = 0;
  }
  self->_theme = (IMTheme *)a3;
  -[THiOSStudyViewController p_updateDarkMode](self, "p_updateDarkMode");
}

- (void)done:(id)a3
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_CE890;
  v4[3] = &unk_426DD0;
  v4[4] = self;
  if (-[THiOSStudyViewController optionsPopoverController](self, "optionsPopoverController", a3))
  {
    -[THiOSStudyViewController dismissStudyOptionsMenu:completion:](self, "dismissStudyOptionsMenu:completion:", 0, v4);
  }
  else if (!self->_isTransitioningInOut)
  {
    -[THiOSStudyViewControllerDelegate studyViewControllerIsDone:](self->_delegate, "studyViewControllerIsDone:", self);
  }
}

- (void)doneButtonPressed:(id)a3
{
  -[THiOSStudyViewController dismissStudyOptionsMenu:completion:](self, "dismissStudyOptionsMenu:completion:", 1, 0);
}

- (void)showOptions:(id)a3
{
  THStudyOptionsPopoverController *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  id v15;
  id v16;

  if (-[THiOSStudyViewController optionsPopoverController](self, "optionsPopoverController"))
  {
    -[THiOSStudyViewController dismissStudyOptionsMenu:completion:](self, "dismissStudyOptionsMenu:completion:", 1, 0);
  }
  else
  {
    v5 = -[THStudyOptionsPopoverController initWithOptions:]([THStudyOptionsPopoverController alloc], "initWithOptions:", -[THNoteCardsController studyOptions](self->_noteCardsController, "studyOptions"));
    -[THStudyOptionsPopoverController setOverrideUserInterfaceStyle:](v5, "setOverrideUserInterfaceStyle:", -[THiOSStudyViewController overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle"));
    -[THiOSStudyViewController setOptionsPopoverController:](self, "setOptionsPopoverController:", v5);
    v7 = objc_opt_class(IMThemePage, v6);
    *(_QWORD *)&v8 = TSUDynamicCast(v7, +[IMTheme themeWithIdentifier:](IMTheme, "themeWithIdentifier:", kIMThemeIdentifierDynamicTheme)).n128_u64[0];
    -[THStudyOptionsPopoverController setTheme:](-[THiOSStudyViewController optionsPopoverController](self, "optionsPopoverController", v8), "setTheme:", v9);
    -[THStudyOptionsPopoverController setDelegate:](-[THiOSStudyViewController optionsPopoverController](self, "optionsPopoverController"), "setDelegate:", self);
    v16 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", -[THiOSStudyViewController optionsPopoverController](self, "optionsPopoverController"));
    objc_msgSend(v16, "setOverrideUserInterfaceStyle:", -[THiOSStudyViewController overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle"));
    objc_msgSend(v16, "setNavigationBarHidden:", 0);
    objc_msgSend(v16, "setToolbarHidden:", 1);
    objc_msgSend(v16, "setDelegate:", -[THiOSStudyViewController optionsPopoverController](self, "optionsPopoverController"));
    objc_msgSend(v16, "setModalPresentationStyle:", 7);
    v10 = objc_msgSend(v16, "popoverPresentationController");
    v12 = objc_opt_class(UIBarButtonItem, v11);
    *(_QWORD *)&v14 = TSUDynamicCast(v12, a3).n128_u64[0];
    if (v13)
    {
      objc_msgSend(v10, "setBarButtonItem:", v13, v14);
    }
    else
    {
      objc_msgSend(v10, "setSourceView:", objc_msgSend(a3, "superview", v14));
      objc_msgSend(a3, "frame");
      objc_msgSend(v10, "setSourceRect:");
    }
    objc_msgSend(v10, "setPermittedArrowDirections:", 15);
    objc_msgSend(v10, "setDelegate:", self);
    v15 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "doneButtonPressed:");
    objc_msgSend(-[THStudyOptionsPopoverController navigationItem](-[THiOSStudyViewController optionsPopoverController](self, "optionsPopoverController"), "navigationItem"), "setRightBarButtonItem:animated:", v15, 0);
    objc_msgSend(v10, "setPassthroughViews:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", -[THiOSStudyViewController optionsButton](self, "optionsButton"), -[THiOSStudyViewController doneButton](self, "doneButton"), 0));
    objc_msgSend(v10, "bc_applyTraitOverridesWithOverrideUserInterfaceStyleFromViewController:", v5);
    -[THiOSStudyViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);

  }
}

- (void)prepareForPopoverPresentation:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "presentedViewController");
  if (v4 == -[THStudyOptionsPopoverController navigationController](-[THiOSStudyViewController optionsPopoverController](self, "optionsPopoverController"), "navigationController"))objc_msgSend(-[THStudyOptionsPopoverController navigationItem](-[THiOSStudyViewController optionsPopoverController](self, "optionsPopoverController"), "navigationItem"), "setRightBarButtonItem:animated:", 0, 0);
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  id v5;
  id v6;

  v5 = objc_msgSend(a3, "presentedViewController");
  if (v5 == -[THStudyOptionsPopoverController navigationController](-[THiOSStudyViewController optionsPopoverController](self, "optionsPopoverController"), "navigationController"))
  {
    v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "doneButtonPressed:");
    objc_msgSend(-[THStudyOptionsPopoverController navigationItem](-[THiOSStudyViewController optionsPopoverController](self, "optionsPopoverController"), "navigationItem"), "setRightBarButtonItem:animated:", v6, 0);

  }
  return 0;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "presentedViewController");
  if (v4 == -[THStudyOptionsPopoverController navigationController](-[THiOSStudyViewController optionsPopoverController](self, "optionsPopoverController"), "navigationController"))-[THiOSStudyViewController dismissStudyOptionsMenu:completion:](self, "dismissStudyOptionsMenu:completion:", 1, 0);
}

- (int64_t)p_styleForPresentation:(id)a3
{
  unsigned int v4;
  unsigned int v5;
  int64_t v7;

  if (a3)
  {
    v4 = objc_msgSend(a3, "horizontalSizeClass") == (char *)&dword_0 + 1;
    v5 = objc_msgSend(a3, "verticalSizeClass") == (char *)&dword_0 + 1;
  }
  else
  {
    v4 = -[THiOSStudyViewController im_isCompactWidth](self, "im_isCompactWidth");
    v5 = -[THiOSStudyViewController im_isCompactHeight](self, "im_isCompactHeight");
  }
  v7 = 7;
  if (v5)
    v7 = 1;
  if (v4)
    return 0;
  else
    return v7;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "presentedViewController");
  if (v4 == -[THStudyOptionsPopoverController navigationController](-[THiOSStudyViewController optionsPopoverController](self, "optionsPopoverController"), "navigationController"))return -[THiOSStudyViewController p_styleForPresentation:](self, "p_styleForPresentation:", 0);
  else
    return 7;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v6;

  v6 = objc_msgSend(a3, "presentedViewController");
  if (v6 == -[THStudyOptionsPopoverController navigationController](-[THiOSStudyViewController optionsPopoverController](self, "optionsPopoverController"), "navigationController"))return -[THiOSStudyViewController p_styleForPresentation:](self, "p_styleForPresentation:", a4);
  else
    return 7;
}

- (void)dismissStudyOptionsMenu:(BOOL)a3 completion:(id)a4
{
  -[THStudyOptionsPopoverController dismissViewControllerAnimated:completion:](-[THiOSStudyViewController optionsPopoverController](self, "optionsPopoverController"), "dismissViewControllerAnimated:completion:", a3, a4);
  -[THiOSStudyViewController setOptionsPopoverController:](self, "setOptionsPopoverController:", 0);
}

- (void)updateWithNavigationUnit:(id)a3 title:(id)a4
{
  -[THNoteCardsController updateWithNavigationUnit:contentNode:](self->_noteCardsController, "updateWithNavigationUnit:contentNode:", a3, 0);
  -[UILabel setText:](self->_titleLabel, "setText:", a4);
}

- (void)p_stageTransitionAnimationIn:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  NSArray *v6;
  id v7;
  id v8;
  double v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  if (a3)
    v5 = 0.0;
  else
    v5 = 1.0;
  -[UIView setAlpha:](-[THiOSStudyViewController backdrop](self, "backdrop"), "setAlpha:", v5);
  -[UIButton setAlpha:](-[THiOSStudyViewController optionsButton](self, "optionsButton"), "setAlpha:", v5);
  -[UIButton setAlpha:](-[THiOSStudyViewController doneButton](self, "doneButton"), "setAlpha:", v5);
  -[UILabel setAlpha:](-[THiOSStudyViewController titleLabel](self, "titleLabel"), "setAlpha:", v5);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = -[THNoteCardsController noteCards](self->_noteCardsController, "noteCards", 0);
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    if (v3)
      v9 = 1.0;
    else
      v9 = -2.0;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "setFlownOut:direction:", v3, v9, 0.0);
        objc_msgSend(v12, "updateTransformAnimated:duration:", 0, 0.0);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  self->_isTransitioningInOut = 1;
}

- (void)transitionInWithCompletion:(id)a3
{
  -[THiOSStudyViewController p_stageTransitionAnimationIn:](self, "p_stageTransitionAnimationIn:", 1);
  -[THiOSStudyViewController p_animateTransitionInWithCompletion:](self, "p_animateTransitionInWithCompletion:", a3);
}

- (void)p_animateTransitionInWithCompletion:(id)a3
{
  dispatch_time_t v5;
  _QWORD block[5];
  _QWORD v7[6];
  _QWORD v8[5];
  _QWORD v9[5];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_CF118;
  v9[3] = &unk_426DD0;
  v9[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x10000, v9, 0, 0.67, 0.0);
  v7[5] = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_CF134;
  v8[3] = &unk_426DD0;
  v8[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_CF184;
  v7[3] = &unk_4292C8;
  v7[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v8, v7, 0.33, 0.67);
  v5 = dispatch_time(0, 400000005);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_CF1C0;
  block[3] = &unk_426DD0;
  block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)transitionOutWithCompletion:(id)a3
{
  -[THiOSStudyViewController p_stageTransitionAnimationIn:](self, "p_stageTransitionAnimationIn:", 0);
  -[THiOSStudyViewController p_animateTransitionOutWithCompletion:](self, "p_animateTransitionOutWithCompletion:", a3);
}

- (void)p_animateTransitionOutWithCompletion:(id)a3
{
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];
  _QWORD v11[5];
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = -[THNoteCardsController noteCards](self->_noteCardsController, "noteCards");
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), "setFlownOut:direction:animated:duration:", 1, 1, -2.0, 0.0, 0.670000017);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_CF4E4;
  v12[3] = &unk_426DD0;
  v12[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x10000, v12, 0, 0.33, 0.0);
  v10[5] = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_CF534;
  v11[3] = &unk_426DD0;
  v11[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_CF550;
  v10[3] = &unk_4292C8;
  v10[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v11, v10, 0.67, 0.33);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THiOSStudyViewController;
  -[THiOSStudyViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[THiOSStudyViewController becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)motionEnded:(int64_t)a3 withEvent:(id)a4
{
  if (a3 == 1)
  {
    if (-[THStudyOptions shuffle](-[THNoteCardsController studyOptions](self->_noteCardsController, "studyOptions", 1, a4), "shuffle"))
    {
      -[THNoteCardsController shuffleCards](self->_noteCardsController, "shuffleCards");
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  BOOL result;

  objc_msgSend(a4, "locationInView:", -[THiOSStudyViewController view](self, "view"));
  v7 = v6;
  v9 = v8;
  v10 = -[THNoteCardsController isTopCardAtPoint:](self->_noteCardsController, "isTopCardAtPoint:");
  v11 = -[THNoteCardsController isBottomCardAtPoint:](self->_noteCardsController, "isBottomCardAtPoint:", v7, v9);
  v12 = v11;
  if (self->_tapGR != a3)
  {
    if (self->_panGR == a3 || self->_flickGR == a3)
      return v10 | v11;
    return 0;
  }
  if (!v10)
  {
    if (!v11)
      return 0;
    return -[THNoteCardsController showingMultipleCards](self->_noteCardsController, "showingMultipleCards");
  }
  result = -[THNoteCardsController canFlipTopCard](self->_noteCardsController, "canFlipTopCard");
  if (!result && ((v12 ^ 1) & 1) == 0)
    return -[THNoteCardsController showingMultipleCards](self->_noteCardsController, "showingMultipleCards");
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char isKindOfClass;

  if (self->_panGR == a3
    && (v5 = objc_msgSend(a4, "view"),
        v7 = objc_opt_class(UIScrollView, v6),
        (objc_opt_isKindOfClass(v5, v7) & 1) != 0))
  {
    v9 = objc_opt_class(UIPanGestureRecognizer, v8);
    isKindOfClass = objc_opt_isKindOfClass(a4, v9);
  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (void)p_layoutViewsWithDuration:(double)a3
{
  THNoteCardsController *noteCardsController;
  uint64_t MaxPoint;
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
  uint64_t v18;

  -[THiOSStudyViewController p_cardEdgeInsets](self, "p_cardEdgeInsets");
  noteCardsController = self->_noteCardsController;
  objc_msgSend(-[THiOSStudyViewController view](self, "view"), "bounds");
  -[THNoteCardsController updateFrame:insets:animated:duration:](noteCardsController, "updateFrame:insets:animated:duration:", a3 != 0.0, *(_QWORD *)&a3);
  MaxPoint = TSDRectGetMaxPoint(objc_msgSend(-[THiOSStudyViewController view](self, "view"), "bounds"));
  TSDPointLength(MaxPoint, v7, v8);
  objc_msgSend(-[THiOSStudyViewController view](self, "view"), "bounds");
  v13 = TSDCenterOfRect(v9, v10, v11, v12);
  v14 = TSDRectWithCenterAndSize(v13);
  -[UIView setFrame:](-[THiOSStudyViewController backdrop](self, "backdrop"), "setFrame:", v14, v15, v16, v17);
  if (-[THiOSStudyViewController im_isCompactWidth](self, "im_isCompactWidth"))
  {
    if (-[THiOSStudyViewController im_isCompactHeight](self, "im_isCompactHeight"))
      v18 = 1;
    else
      v18 = 2;
  }
  else
  {
    v18 = 1;
  }
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", v18);
}

- (BOOL)p_showingMultipleCards
{
  return -[THNoteCardsController showingMultipleCards](self->_noteCardsController, "showingMultipleCards");
}

- (void)p_setupGestureRecognizers
{
  UIPanGestureRecognizer *v3;
  THFlickGestureRecognizer *v4;
  UITapGestureRecognizer *v5;
  UIPanGestureRecognizer *v6;

  v3 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc((Class)UIPanGestureRecognizer), "initWithTarget:action:", self, "p_handlePanGesture:");
  self->_panGR = v3;
  -[UIPanGestureRecognizer setDelegate:](v3, "setDelegate:", self);
  -[UIPanGestureRecognizer setMinimumNumberOfTouches:](self->_panGR, "setMinimumNumberOfTouches:", 1);
  -[UIPanGestureRecognizer setMaximumNumberOfTouches:](self->_panGR, "setMaximumNumberOfTouches:", 1);
  objc_msgSend(-[THiOSStudyViewController view](self, "view"), "addGestureRecognizer:", self->_panGR);
  v4 = -[THFlickGestureRecognizer initWithTarget:action:]([THFlickGestureRecognizer alloc], "initWithTarget:action:", self, "p_handleFlickGesture:");
  self->_flickGR = v4;
  -[THFlickGestureRecognizer setDelegate:](v4, "setDelegate:", self);
  -[THFlickGestureRecognizer setDelaysTouchesBegan:](self->_flickGR, "setDelaysTouchesBegan:", 1);
  objc_msgSend(-[THiOSStudyViewController view](self, "view"), "addGestureRecognizer:", self->_flickGR);
  v5 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "p_handleTapGesture:");
  self->_tapGR = v5;
  -[UITapGestureRecognizer setDelegate:](v5, "setDelegate:", self);
  -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_tapGR, "setNumberOfTapsRequired:", 1);
  -[UITapGestureRecognizer setNumberOfTouchesRequired:](self->_tapGR, "setNumberOfTouchesRequired:", 1);
  -[UITapGestureRecognizer setCancelsTouchesInView:](self->_tapGR, "setCancelsTouchesInView:", 0);
  -[UITapGestureRecognizer setDelaysTouchesEnded:](self->_tapGR, "setDelaysTouchesEnded:", 0);
  objc_msgSend(-[THiOSStudyViewController view](self, "view"), "addGestureRecognizer:", self->_tapGR);
  -[UIPanGestureRecognizer requireGestureRecognizerToFail:](self->_panGR, "requireGestureRecognizerToFail:", self->_flickGR);
  v6 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc((Class)UIPanGestureRecognizer), "initWithTarget:action:", self, "p_handlePanGesture:");
  self->_indirectPanGR = v6;
  -[UIPanGestureRecognizer setAllowedTouchTypes:](v6, "setAllowedTouchTypes:", &off_469928);
  -[UIPanGestureRecognizer setAllowedScrollTypesMask:](self->_indirectPanGR, "setAllowedScrollTypesMask:", 3);
  -[UIPanGestureRecognizer setDelegate:](self->_indirectPanGR, "setDelegate:", self);
  -[UIPanGestureRecognizer setCancelsTouchesInView:](self->_indirectPanGR, "setCancelsTouchesInView:", 0);
  objc_msgSend(-[THiOSStudyViewController view](self, "view"), "addGestureRecognizer:", self->_indirectPanGR);
}

- (void)p_handleTapGesture:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  unsigned int v9;
  double v10;
  double v11;
  THNoteCardsController *noteCardsController;

  if (objc_msgSend(a3, "state") == (char *)&dword_0 + 3)
  {
    objc_msgSend(a3, "locationInView:", -[THiOSStudyViewController view](self, "view"));
    v6 = v5;
    v8 = v7;
    v9 = -[THNoteCardsController isTopCardAtPoint:](self->_noteCardsController, "isTopCardAtPoint:");
    noteCardsController = self->_noteCardsController;
    if (v9)
    {
      -[THNoteCardsController flipTopCard](noteCardsController, "flipTopCard", v10, v11);
    }
    else if (-[THNoteCardsController isBottomCardAtPoint:](noteCardsController, "isBottomCardAtPoint:", v6, v8))
    {
      -[THNoteCardsController animateBottomCardToTopInDirection:](self->_noteCardsController, "animateBottomCardToTopInDirection:", 1.0, 0.0);
    }
  }
}

- (void)p_handlePanGesture:(id)a3
{
  char *v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  id v12;
  __n128 v13;
  __n128 v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  THNoteCardsController *noteCardsController;

  v5 = (char *)objc_msgSend(a3, "state");
  if (v5 == (_BYTE *)&dword_0 + 1)
  {
    objc_msgSend(a3, "locationInView:", -[THiOSStudyViewController view](self, "view"));
    self->_dragStartLocation.x = v6;
    self->_dragStartLocation.y = v7;
  }
  else if ((unint64_t)(v5 - 1) > 1)
  {
    if ((unint64_t)(v5 - 3) <= 1)
    {
      if (self->_dragging)
      {
        noteCardsController = self->_noteCardsController;
        objc_msgSend(a3, "direction");
        -[THNoteCardsController endDragInDirection:](noteCardsController, "endDragInDirection:");
      }
      self->_dragging = 0;
    }
    return;
  }
  objc_msgSend(a3, "translationInView:", -[THiOSStudyViewController view](self, "view"));
  v9 = v8;
  v11 = v10;
  v12 = (id)-[THNoteCardsController isTopCardAtPoint:](self->_noteCardsController, "isTopCardAtPoint:", self->_dragStartLocation.x, self->_dragStartLocation.y);
  if ((_DWORD)v12)
  {
    v15 = -[THNoteCardsController topScrollView](self->_noteCardsController, "topScrollView");
    v12 = objc_msgSend(v15, "canScroll");
    if ((_DWORD)v12)
    {
      if (fabs(v9) <= 50.0)
        return;
      objc_msgSend(v15, "contentOffset");
      v17 = v16;
      v19 = v18;
      objc_msgSend(v15, "setScrollEnabled:", 0);
      v12 = objc_msgSend(v15, "setContentOffset:", v17, v19);
    }
  }
  if (!self->_dragging)
  {
    self->_dragStartOffset.x = v9;
    self->_dragStartOffset.y = v11;
    -[THNoteCardsController beginDragAtPoint:](self->_noteCardsController, "beginDragAtPoint:", TSDAddPoints(v12));
    self->_dragging = 1;
  }
  v13.n128_f64[0] = v9;
  v14.n128_f64[0] = v11;
  -[THNoteCardsController setDragOffset:](self->_noteCardsController, "setDragOffset:", TSDSubtractPoints(v13, v14, self->_dragStartOffset.x, self->_dragStartOffset.y));
}

- (void)p_handleFlickGesture:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unsigned int v13;
  THNoteCardsController *noteCardsController;

  if (objc_msgSend(a3, "state") == (char *)&dword_0 + 3)
  {
    objc_msgSend(a3, "translationInView:", -[THiOSStudyViewController view](self, "view"));
    v6 = v5;
    v8 = v7;
    objc_msgSend(a3, "initialLocationInView:", -[THiOSStudyViewController view](self, "view"));
    v10 = v9;
    v12 = v11;
    v13 = -[THNoteCardsController isTopCardAtPoint:](self->_noteCardsController, "isTopCardAtPoint:");
    noteCardsController = self->_noteCardsController;
    if (v13)
    {
      -[THNoteCardsController animateTopCardToBottomInDirection:](noteCardsController, "animateTopCardToBottomInDirection:", v6, v8);
    }
    else if (-[THNoteCardsController isBottomCardAtPoint:](noteCardsController, "isBottomCardAtPoint:", v10, v12))
    {
      -[THNoteCardsController animateBottomCardToTopInDirection:](self->_noteCardsController, "animateBottomCardToTopInDirection:", v6, v8);
    }
  }
}

- (void)_keyLeft:(id)a3
{
  -[THNoteCardsController animateBottomCardToTopInDirection:](self->_noteCardsController, "animateBottomCardToTopInDirection:", a3, -1.0, 0.0);
}

- (void)_keyRight:(id)a3
{
  -[THNoteCardsController animateTopCardToBottomInDirection:](self->_noteCardsController, "animateTopCardToBottomInDirection:", a3, -1.0, 0.0);
}

- (void)_keySpace:(id)a3
{
  -[THNoteCardsController animateTopCardToBottomInDirection:](self->_noteCardsController, "animateTopCardToBottomInDirection:", a3, -1.0, 0.0);
}

- (void)_keyEnter:(id)a3
{
  -[THNoteCardsController flipTopCard](self->_noteCardsController, "flipTopCard", a3);
}

- (THiOSStudyViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THiOSStudyViewControllerDelegate *)a3;
}

- (UIView)backdrop
{
  return (UIView *)self->_backdrop;
}

- (void)setBackdrop:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (UIButton)optionsButton
{
  return self->_optionsButton;
}

- (void)setOptionsButton:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (THStudyOptionsPopoverController)optionsPopoverController
{
  return self->_optionsPopoverController;
}

- (void)setOptionsPopoverController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (IMTheme)theme
{
  return self->_theme;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

@end
