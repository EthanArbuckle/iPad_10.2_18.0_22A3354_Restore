@implementation SUSegmentedControl

- (SUSegmentedControl)initWithFrame:(CGRect)a3
{
  SUSegmentedControl *v3;
  id v4;
  UISegmentedControl *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUSegmentedControl;
  v3 = -[SUSegmentedControl initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6D78]);
    -[SUSegmentedControl bounds](v3, "bounds");
    v5 = (UISegmentedControl *)objc_msgSend(v4, "initWithFrame:");
    v3->_segmentedControl = v5;
    -[UISegmentedControl addTarget:action:forControlEvents:](v5, "addTarget:action:forControlEvents:", v3, sel__valueChangedEvent_, 4096);
    -[UISegmentedControl setAutoresizingMask:](v3->_segmentedControl, "setAutoresizingMask:", 18);
    -[UISegmentedControl _setAutosizeText:](v3->_segmentedControl, "_setAutosizeText:", 1);
    -[SUSegmentedControl addSubview:](v3, "addSubview:", v3->_segmentedControl);
    v3->_cancelButtonTitle = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("SEGMENTED_CONTROL_MORE_CANCEL"), &stru_24DE83F60, 0);
    v3->_maximumNumberOfItems = 0x7FFFFFFFFFFFFFFFLL;
    v3->_moreListTitle = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("SEGMENTED_CONTROL_MORE_TITLE"), &stru_24DE83F60, 0);
    v3->_selectionIndex = -[UISegmentedControl selectedSegmentIndex](v3->_segmentedControl, "selectedSegmentIndex");
    v3->_showsMoreListAutomatically = 1;
    v3->_tintStyle = _UIApplicationUsesLegacyUI();
    v6 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel__windowDidRotateNotification_, *MEMORY[0x24BDF7FF8], 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel__windowWillRotateNotification_, *MEMORY[0x24BDF8030], 0);
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7FF8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF8030], 0);
  -[UISegmentedControl removeTarget:action:forControlEvents:](self->_segmentedControl, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[SUMenuViewController setDelegate:](self->_menuViewController, "setDelegate:", 0);
  -[UIPopoverController setDelegate:](self->_popoverController, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)SUSegmentedControl;
  -[SUSegmentedControl dealloc](&v4, sel_dealloc);
}

- (id)backgroundImageForState:(unint64_t)a3 barMetrics:(int64_t)a4
{
  return -[UISegmentedControl backgroundImageForState:barMetrics:](self->_segmentedControl, "backgroundImageForState:barMetrics:", a3, a4);
}

- (id)dividerImageForLeftSegmentState:(unint64_t)a3 rightSegmentState:(unint64_t)a4 barMetrics:(int64_t)a5
{
  return -[UISegmentedControl dividerImageForLeftSegmentState:rightSegmentState:barMetrics:](self->_segmentedControl, "dividerImageForLeftSegmentState:rightSegmentState:barMetrics:", a3, a4, a5);
}

- (NSArray)items
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_items, "copy");
}

- (int64_t)numberOfVisibleSegments
{
  unint64_t maximumNumberOfItems;
  int64_t result;

  maximumNumberOfItems = self->_maximumNumberOfItems;
  result = -[NSMutableArray count](self->_items, "count");
  if (maximumNumberOfItems < result)
    return maximumNumberOfItems;
  return result;
}

- (int64_t)segmentedControlStyle
{
  return -[UISegmentedControl segmentedControlStyle](self->_segmentedControl, "segmentedControlStyle");
}

- (int64_t)selectedItemIndex
{
  return self->_selectionIndex;
}

- (int64_t)selectedSegmentIndex
{
  return -[UISegmentedControl selectedSegmentIndex](self->_segmentedControl, "selectedSegmentIndex");
}

- (void)setBackgroundImage:(id)a3 forState:(unint64_t)a4 barMetrics:(int64_t)a5
{
  -[UISegmentedControl setBackgroundImage:forState:barMetrics:](self->_segmentedControl, "setBackgroundImage:forState:barMetrics:", a3, a4, a5);
}

- (void)setCancelButtonTitle:(id)a3
{
  NSString *cancelButtonTitle;

  cancelButtonTitle = self->_cancelButtonTitle;
  if (cancelButtonTitle != a3)
  {

    self->_cancelButtonTitle = (NSString *)objc_msgSend(a3, "copy");
    if (!objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
      -[SUSimpleMenuViewController setCancelButtonTitle:](self->_menuViewController, "setCancelButtonTitle:", a3);
  }
}

- (void)setClientInterface:(id)a3
{
  SUClientInterface *clientInterface;

  clientInterface = self->_clientInterface;
  if (clientInterface != a3)
  {

    self->_clientInterface = (SUClientInterface *)a3;
    -[SUSegmentedControl _applyStyling](self, "_applyStyling");
  }
}

- (void)setDividerImage:(id)a3 forLeftSegmentState:(unint64_t)a4 rightSegmentState:(unint64_t)a5 barMetrics:(int64_t)a6
{
  -[UISegmentedControl setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:](self->_segmentedControl, "setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:", a3, a4, a5, a6);
}

- (void)setItems:(id)a3
{
  NSMutableArray *items;
  NSMutableArray *v6;
  unint64_t selectionIndex;

  items = self->_items;
  if (items != a3)
  {

    v6 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
    self->_items = v6;
    selectionIndex = self->_selectionIndex;
    if (selectionIndex >= -[NSMutableArray count](v6, "count"))
      self->_selectionIndex = -1;
    -[SUSegmentedControl _reloadData](self, "_reloadData");
  }
}

- (void)setMaximumNumberOfItems:(int64_t)a3
{
  if (self->_maximumNumberOfItems != a3)
  {
    self->_maximumNumberOfItems = a3;
    -[SUSegmentedControl _reloadData](self, "_reloadData");
  }
}

- (void)setMoreListTitle:(id)a3
{
  NSString *moreListTitle;

  moreListTitle = self->_moreListTitle;
  if (moreListTitle != a3)
  {

    self->_moreListTitle = (NSString *)objc_msgSend(a3, "copy");
    -[SUSegmentedControl _reloadData](self, "_reloadData");
  }
}

- (void)setMaximumWidth:(double)a3
{
  double v5;

  if (self->_maximumWidth != a3)
  {
    -[SUSegmentedControl frame](self, "frame");
    self->_maximumWidth = a3;
    if (a3 > 0.00000011920929 && v5 > a3)
      -[SUSegmentedControl setFrame:](self, "setFrame:");
  }
}

- (void)setSegmentedControlStyle:(int64_t)a3
{
  -[UISegmentedControl setSegmentedControlStyle:](self->_segmentedControl, "setSegmentedControlStyle:", a3);
  -[SUSegmentedControl _applyStyling](self, "_applyStyling");
}

- (void)setSelectedItemIndex:(int64_t)a3
{
  unint64_t v4;
  unint64_t maximumNumberOfItems;
  int64_t selectionIndex;

  self->_selectionIndex = a3;
  v4 = -[NSMutableArray count](self->_items, "count");
  maximumNumberOfItems = self->_maximumNumberOfItems;
  if (self->_selectionIndex >= (int64_t)(maximumNumberOfItems - 1) && v4 > maximumNumberOfItems)
    selectionIndex = -1;
  else
    selectionIndex = self->_selectionIndex;
  -[UISegmentedControl setSelectedSegmentIndex:](self->_segmentedControl, "setSelectedSegmentIndex:", selectionIndex);
}

- (void)setTintColor:(id)a3
{
  -[UISegmentedControl setTintColor:](self->_segmentedControl, "setTintColor:", a3);
  -[SUSegmentedControl _applyStyling](self, "_applyStyling");
}

- (void)setTintStyle:(int64_t)a3
{
  if (self->_tintStyle != a3)
  {
    self->_tintStyle = a3;
    -[SUSegmentedControl _applyStyling](self, "_applyStyling");
  }
}

- (void)setTitleTextAttributes:(id)a3 forState:(unint64_t)a4
{
  char v7;
  UISegmentedControl *segmentedControl;

  v7 = objc_opt_respondsToSelector();
  segmentedControl = self->_segmentedControl;
  if ((v7 & 1) != 0)
    -[UISegmentedControl _setTitleTextAttributes:forState:](segmentedControl, "_setTitleTextAttributes:forState:", a3, a4);
  else
    -[UISegmentedControl setTitleTextAttributes:forState:](segmentedControl, "setTitleTextAttributes:forState:", a3, a4);
}

- (void)showMoreList:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  SUSimpleMenuViewController *menuViewController;

  v4 = a4;
  v5 = a3;
  if ((unint64_t)-[NSMutableArray count](self->_items, "count") > self->_maximumNumberOfItems)
  {
    menuViewController = self->_menuViewController;
    if (v5)
    {
      if (!menuViewController)
        -[SUSegmentedControl _showMoreList:](self, "_showMoreList:", v4);
    }
    else if (menuViewController)
    {
      -[SUSegmentedControl setSelectedItemIndex:](self, "setSelectedItemIndex:", self->_selectionIndex);
      -[UIViewController dismissAnimated:](self->_menuViewController, "dismissAnimated:", v4);
      -[SUSegmentedControl _destroyMenuViewController](self, "_destroyMenuViewController");
      -[SUSegmentedControl _destroyPopoverController](self, "_destroyPopoverController");
    }
  }
}

- (void)showPopover:(id)a3 fromSegmentIndex:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float v14;
  double v15;

  v5 = a5;
  -[SUSegmentedControl bounds](self, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13 / (double)-[SUSegmentedControl numberOfVisibleSegments](self, "numberOfVisibleSegments");
  v15 = floorf(v14);
  objc_msgSend(a3, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", self, 1, v5, (double)a4 * v15, v10, v15, v12);
}

- (void)sizeToFitUserInterfaceIdiom
{
  uint64_t v3;
  double v4;
  double v5;

  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom");
  -[SUSegmentedControl maximumWidth](self, "maximumWidth");
  v5 = 300.0;
  if (v4 >= 0.00000011920929)
    v5 = v4;
  if (v3 == 1)
    v5 = v4;
  -[SUSegmentedControl sizeToFitWithMinimumSegmentWidth:maximumTotalWidth:](self, "sizeToFitWithMinimumSegmentWidth:maximumTotalWidth:", 100.0, v5);
}

- (void)sizeToFitWithMinimumSegmentWidth:(double)a3 maximumTotalWidth:(double)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;

  -[SUSegmentedControl sizeToFit](self, "sizeToFit");
  -[SUSegmentedControl frame](self, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (a3 > 0.00000011920929)
  {
    v15 = -[SUSegmentedControl numberOfVisibleSegments](self, "numberOfVisibleSegments");
    if (v12 < (double)v15 * a3)
      v12 = (double)v15 * a3;
  }
  if (v12 >= a4)
    v16 = a4;
  else
    v16 = v12;
  if (a4 <= 0.00000011920929)
    v17 = v12;
  else
    v17 = v16;
  -[SUSegmentedControl setFrame:](self, "setFrame:", v8, v10, v17, v14);
}

- (UIColor)tintColor
{
  return (UIColor *)-[UISegmentedControl tintColor](self->_segmentedControl, "tintColor");
}

- (id)titleTextAttributesForState:(unint64_t)a3
{
  return -[UISegmentedControl titleTextAttributesForState:](self->_segmentedControl, "titleTextAttributesForState:", a3);
}

- (void)layoutSubviews
{
  UISegmentedControl *segmentedControl;
  objc_super v4;

  segmentedControl = self->_segmentedControl;
  -[SUSegmentedControl bounds](self, "bounds");
  -[UISegmentedControl setFrame:](segmentedControl, "setFrame:");
  v4.receiver = self;
  v4.super_class = (Class)SUSegmentedControl;
  -[SUSegmentedControl layoutSubviews](&v4, sel_layoutSubviews);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v11;
  CGSize result;

  -[UISegmentedControl sizeThatFits:](self->_segmentedControl, "sizeThatFits:", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  if (-[UISegmentedControl segmentControlStyle](self->_segmentedControl, "segmentControlStyle") == 7)
  {
    objc_msgSend(MEMORY[0x24BDF6D78], "defaultHeightForStyle:", 7);
    v7 = v8;
  }
  -[SUSegmentedControl maximumWidth](self, "maximumWidth");
  if (v9 >= v5 || v9 <= 0.00000011920929)
    v9 = v5;
  v11 = v7;
  result.height = v11;
  result.width = v9;
  return result;
}

- (void)_valueChangedEvent:(id)a3
{
  int64_t v4;
  unint64_t v5;
  unint64_t maximumNumberOfItems;

  v4 = -[UISegmentedControl selectedSegmentIndex](self->_segmentedControl, "selectedSegmentIndex", a3);
  -[UIPopoverController dismissPopoverAnimated:](self->_popoverController, "dismissPopoverAnimated:", 1);
  -[SUSegmentedControl _destroyPopoverController](self, "_destroyPopoverController");
  v5 = -[NSMutableArray count](self->_items, "count");
  maximumNumberOfItems = self->_maximumNumberOfItems;
  if (v5 > maximumNumberOfItems && v4 == maximumNumberOfItems - 1)
  {
    if (-[SUSegmentedControl showsMoreListAutomatically](self, "showsMoreListAutomatically"))
      -[SUSegmentedControl _showMoreList:](self, "_showMoreList:", 1);
  }
  else
  {
    self->_selectionIndex = v4;
    -[UIViewController dismissAnimated:](self->_menuViewController, "dismissAnimated:", 1);
    -[SUSegmentedControl _destroyMenuViewController](self, "_destroyMenuViewController");
    -[SUSegmentedControl _destroyPopoverController](self, "_destroyPopoverController");
  }
  -[SUSegmentedControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (void)_windowDidRotateNotification:(id)a3
{
  if (self->_hidingPopoverForRotation)
  {
    self->_hidingPopoverForRotation = 0;
    if (-[UISegmentedControl window](self->_segmentedControl, "window", a3))
    {
      -[SUSegmentedControl _presentPopoverAnimated:](self, "_presentPopoverAnimated:", 1);
    }
    else
    {
      -[SUSegmentedControl setSelectedItemIndex:](self, "setSelectedItemIndex:", self->_selectionIndex);
      -[SUSegmentedControl _destroyMenuViewController](self, "_destroyMenuViewController");
      -[SUSegmentedControl _destroyPopoverController](self, "_destroyPopoverController");
    }
  }
}

- (void)_windowWillRotateNotification:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "object");
  if (self->_popoverController)
  {
    if (-[SUSegmentedControl isDescendantOfView:](self, "isDescendantOfView:", v4))
    {
      self->_hidingPopoverForRotation = 1;
      -[UIPopoverController dismissPopoverAnimated:](self->_popoverController, "dismissPopoverAnimated:", 0);
    }
  }
}

- (void)menuViewControllerDidCancel:(id)a3
{
  -[SUSegmentedControl setSelectedItemIndex:](self, "setSelectedItemIndex:", self->_selectionIndex);
  objc_msgSend(a3, "dismissAnimated:", 1);
  -[SUSegmentedControl _destroyMenuViewController](self, "_destroyMenuViewController");
  -[SUSegmentedControl _destroyPopoverController](self, "_destroyPopoverController");
}

- (void)menuViewController:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  if (a4 + self->_maximumNumberOfItems - 1 != self->_selectionIndex)
  {
    -[SUSegmentedControl setSelectedItemIndex:](self, "setSelectedItemIndex:");
    -[SUSegmentedControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
  objc_msgSend(a3, "dismissAnimated:", 1);
  -[SUSegmentedControl _destroyMenuViewController](self, "_destroyMenuViewController");
  -[SUSegmentedControl _destroyPopoverController](self, "_destroyPopoverController");
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  -[SUSegmentedControl setSelectedItemIndex:](self, "setSelectedItemIndex:", self->_selectionIndex);
  -[SUSegmentedControl _destroyMenuViewController](self, "_destroyMenuViewController");
  -[SUSegmentedControl _destroyPopoverController](self, "_destroyPopoverController");
}

- (void)_applyStyling
{
  SUUIAppearance *v3;

  if (-[UISegmentedControl tintColor](self->_segmentedControl, "tintColor"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UISegmentedControl _setOptionsBackgroundImage:](self->_segmentedControl, "_setOptionsBackgroundImage:", 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UISegmentedControl _setBackgroundImage:forState:barMetrics:](self->_segmentedControl, "_setBackgroundImage:forState:barMetrics:", 0, 0, 0);
      -[UISegmentedControl _setBackgroundImage:forState:barMetrics:](self->_segmentedControl, "_setBackgroundImage:forState:barMetrics:", 0, 4, 0);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UISegmentedControl _setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:](self->_segmentedControl, "_setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:", 0, 0, 0, 0);
      -[UISegmentedControl _setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:](self->_segmentedControl, "_setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:", 0, 0, 4, 0);
    }
  }
  else
  {
    v3 = -[SUClientInterface appearance](-[SUSegmentedControl clientInterface](self, "clientInterface"), "appearance");
    if (!v3)
      v3 = +[SUUIAppearance defaultAppearance](SUUIAppearance, "defaultAppearance");
    -[SUUIAppearance styleSegmentedControl:tintStyle:](v3, "styleSegmentedControl:tintStyle:", self->_segmentedControl, self->_tintStyle);
  }
}

- (void)_destroyMenuViewController
{
  -[SUMenuViewController setDelegate:](self->_menuViewController, "setDelegate:", 0);

  self->_menuViewController = 0;
}

- (void)_destroyPopoverController
{
  -[UIPopoverController setDelegate:](self->_popoverController, "setDelegate:", 0);

  self->_popoverController = 0;
}

- (void)_presentPopoverAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (self->_popoverController)
  {
    v3 = a3;
    if (-[UISegmentedControl window](self->_segmentedControl, "window"))
    {
      v5 = (void *)-[UISegmentedControl infoViewForSegment:](self->_segmentedControl, "infoViewForSegment:", self->_maximumNumberOfItems - 1);
      objc_msgSend(v5, "frame");
      -[UISegmentedControl convertRect:fromView:](self->_segmentedControl, "convertRect:fromView:", objc_msgSend(v5, "superview"), v6, v7, v8, v9);
      v11 = v10;
      -[UISegmentedControl bounds](self->_segmentedControl, "bounds");
      -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](self->_popoverController, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", self->_segmentedControl, 1, v3, v11);
    }
  }
}

- (void)_reloadData
{
  uint64_t v3;
  int64_t maximumNumberOfItems;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  SUSimpleMenuViewController *menuViewController;

  -[UISegmentedControl removeAllSegments](self->_segmentedControl, "removeAllSegments");
  v3 = -[NSMutableArray count](self->_items, "count");
  maximumNumberOfItems = self->_maximumNumberOfItems;
  if (v3 <= maximumNumberOfItems)
    v5 = v3;
  else
    v5 = maximumNumberOfItems - 1;
  if (v5 >= 1)
  {
    for (i = 0; i != v5; ++i)
    {
      v7 = -[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[UISegmentedControl insertSegmentWithTitle:atIndex:animated:](self->_segmentedControl, "insertSegmentWithTitle:atIndex:animated:", v7, i, 0);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[UISegmentedControl insertSegmentWithImage:atIndex:animated:](self->_segmentedControl, "insertSegmentWithImage:atIndex:animated:", v7, i, 0);
      }
    }
  }
  if (v5 < (unint64_t)-[NSMutableArray count](self->_items, "count"))
    -[UISegmentedControl insertSegmentWithTitle:atIndex:animated:](self->_segmentedControl, "insertSegmentWithTitle:atIndex:animated:", self->_moreListTitle, self->_maximumNumberOfItems, 0);
  menuViewController = self->_menuViewController;
  if (menuViewController)
  {
    -[SUSimpleMenuViewController setTitles:](menuViewController, "setTitles:", -[SUSegmentedControl _titlesForMoreList](self, "_titlesForMoreList"));
    -[UISegmentedControl setSelectedSegment:](self->_segmentedControl, "setSelectedSegment:", self->_maximumNumberOfItems - 1);
  }
  else
  {
    -[SUSegmentedControl setSelectedItemIndex:](self, "setSelectedItemIndex:", self->_selectionIndex);
  }
  -[SUSegmentedControl setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setValue:(id)a3 forSegmentAtIndex:(unint64_t)a4
{
  if (a3)
  {
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_items, "replaceObjectAtIndex:withObject:", a4, a3);
    if (-[UISegmentedControl numberOfSegments](self->_segmentedControl, "numberOfSegments") > a4)
      -[UISegmentedControl setImage:forSegmentAtIndex:](self->_segmentedControl, "setImage:forSegmentAtIndex:", a3, a4);
  }
}

- (void)_showMoreList:(BOOL)a3
{
  _BOOL8 v3;
  SUSimpleMenuViewController *v5;
  int64_t v6;
  int64_t selectionIndex;
  int64_t v8;
  UIPopoverController *v9;
  SUNavigationController *v10;

  v3 = a3;
  v5 = -[SUSimpleMenuViewController initWithTitles:]([SUSimpleMenuViewController alloc], "initWithTitles:", -[SUSegmentedControl _titlesForMoreList](self, "_titlesForMoreList"));
  self->_menuViewController = v5;
  -[SUViewController setClientInterface:](v5, "setClientInterface:", -[SUSegmentedControl clientInterface](self, "clientInterface"));
  -[SUMenuViewController setDelegate:](self->_menuViewController, "setDelegate:", self);
  -[SUViewController setTitle:](self->_menuViewController, "setTitle:", self->_moreListTitle);
  v6 = self->_maximumNumberOfItems - 1;
  selectionIndex = self->_selectionIndex;
  v8 = selectionIndex - v6;
  if (selectionIndex >= v6)
    -[SUMenuViewController setSelectedIndex:](self->_menuViewController, "setSelectedIndex:", v8);
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice", v8), "userInterfaceIdiom"))
  {
    v9 = (UIPopoverController *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6CA0]), "initWithContentViewController:", self->_menuViewController);
    self->_popoverController = v9;
    -[UIPopoverController _setPopoverBackgroundStyle:](v9, "_setPopoverBackgroundStyle:", 3);
    -[UIPopoverController setDelegate:](self->_popoverController, "setDelegate:", self);
    -[UIPopoverController setPassthroughViews:](self->_popoverController, "setPassthroughViews:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", self->_segmentedControl));
    -[SUSegmentedControl _presentPopoverAnimated:](self, "_presentPopoverAnimated:", v3);
  }
  else
  {
    v10 = -[SUNavigationController initWithRootViewController:]([SUNavigationController alloc], "initWithRootViewController:", self->_menuViewController);
    -[SUNavigationController setClientInterface:](v10, "setClientInterface:", -[SUSegmentedControl clientInterface](self, "clientInterface"));
    -[SUSimpleMenuViewController setCancelButtonTitle:](self->_menuViewController, "setCancelButtonTitle:", self->_cancelButtonTitle);
    objc_msgSend((id)objc_msgSend((id)-[SUSegmentedControl window](self, "window"), "rootViewController"), "presentViewController:animated:completion:", v10, v3, 0);

  }
}

- (id)_titlesForMoreList
{
  return (id)-[NSMutableArray subarrayWithRange:](self->_items, "subarrayWithRange:", self->_maximumNumberOfItems - 1, -[NSMutableArray count](self->_items, "count") - (self->_maximumNumberOfItems - 1));
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (SUClientInterface)clientInterface
{
  return self->_clientInterface;
}

- (int64_t)maximumNumberOfItems
{
  return self->_maximumNumberOfItems;
}

- (double)maximumWidth
{
  return self->_maximumWidth;
}

- (NSString)moreListTitle
{
  return self->_moreListTitle;
}

- (BOOL)showsMoreListAutomatically
{
  return self->_showsMoreListAutomatically;
}

- (void)setShowsMoreListAutomatically:(BOOL)a3
{
  self->_showsMoreListAutomatically = a3;
}

- (int64_t)tintStyle
{
  return self->_tintStyle;
}

@end
