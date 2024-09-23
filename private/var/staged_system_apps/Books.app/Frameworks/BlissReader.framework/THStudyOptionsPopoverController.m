@implementation THStudyOptionsPopoverController

- (THStudyOptionsPopoverController)initWithOptions:(id)a3
{
  uint64_t v5;
  THStudyOptionsPopoverController *v6;
  double v7;
  unsigned int v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THStudyOptionsPopoverController initWithOptions:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THStudyOptionsPopoverController.mm"), 95, CFSTR("invalid nil value for '%s'"), "options");
  v5 = THBundle();
  v13.receiver = self;
  v13.super_class = (Class)THStudyOptionsPopoverController;
  v6 = -[THStudyOptionsPopoverController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", CFSTR("THiOSStudyOptions"), v5);
  if (v6)
  {
    v6->_options = (THStudyOptions *)a3;
    -[THStudyOptionsPopoverController setTitle:](v6, "setTitle:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Study Options"), &stru_43D7D8, 0));
    if (+[UIFont bc_accessibilityFontSizesEnabled](UIFont, "bc_accessibilityFontSizesEnabled"))v7 = 360.0;
    else
      v7 = 320.0;
    v8 = +[UIFont bc_accessibilityFontSizesEnabled](UIFont, "bc_accessibilityFontSizesEnabled");
    v9 = 400.0;
    if (!v8)
      v9 = 146.0;
    -[THStudyOptionsPopoverController setPreferredContentSize:](v6, "setPreferredContentSize:", v7, v9);
    objc_msgSend(-[THStudyOptionsPopoverController navigationItem](v6, "navigationItem"), "setBackBarButtonItem:", objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", &stru_43D7D8, 0, 0, 0));
    -[THStudyOptionsPopoverController preferredContentSize](v6, "preferredContentSize");
    objc_msgSend(objc_msgSend(-[THStudyOptionsPopoverController presentingViewController](v6, "presentingViewController"), "presentedViewController"), "setPreferredContentSize:", v10, v11);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_tableView = 0;
  self->_options = 0;

  self->_theme = 0;
  self->_checkImage = 0;
  v3.receiver = self;
  v3.super_class = (Class)THStudyOptionsPopoverController;
  -[THStudyOptionsPopoverController dealloc](&v3, "dealloc");
}

- (UIImage)checkImage
{
  UIImage *result;

  result = self->_checkImage;
  if (!result)
  {
    result = -[UIImage imageWithRenderingMode:](+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark")), "imageWithRenderingMode:", 2);
    self->_checkImage = result;
  }
  return result;
}

- (UIColor)hiddenColor
{
  return +[UIColor clearColor](UIColor, "clearColor");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THStudyOptionsPopoverController;
  -[THStudyOptionsPopoverController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, "contentSizeCategoryDidChange", UIContentSizeCategoryDidChangeNotification, 0);
  -[THStudyOptionsPopoverController p_updateColors](self, "p_updateColors");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THStudyOptionsPopoverController;
  -[THStudyOptionsPopoverController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, UIContentSizeCategoryDidChangeNotification, 0);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THStudyOptionsPopoverController;
  -[THStudyOptionsPopoverController viewDidLoad](&v3, "viewDidLoad");
  -[UITableView registerClass:forCellReuseIdentifier:](-[THStudyOptionsPopoverController tableView](self, "tableView"), "registerClass:forCellReuseIdentifier:", objc_opt_class(UITableViewCell), CFSTR("StudyOptionsTableCell"));
  -[UITableView setSectionFooterHeight:](-[THStudyOptionsPopoverController tableView](self, "tableView"), "setSectionFooterHeight:", 0.0);
  -[UITableView setTableFooterView:](-[THStudyOptionsPopoverController tableView](self, "tableView"), "setTableFooterView:", 0);
  -[UITableView setSeparatorStyle:](-[THStudyOptionsPopoverController tableView](self, "tableView"), "setSeparatorStyle:", 1);
  -[THStudyOptionsPopoverController contentSizeCategoryDidChange](self, "contentSizeCategoryDidChange");
}

- (void)contentSizeCategoryDidChange
{
  -[UITableView setRowHeight:](-[THStudyOptionsPopoverController tableView](self, "tableView"), "setRowHeight:", 42.0);
  -[UITableView setEstimatedRowHeight:](-[THStudyOptionsPopoverController tableView](self, "tableView"), "setEstimatedRowHeight:", 42.0);
  if (+[UIFont bc_accessibilityFontSizesEnabled](UIFont, "bc_accessibilityFontSizesEnabled"))-[UITableView setRowHeight:](-[THStudyOptionsPopoverController tableView](self, "tableView"), "setRowHeight:", UITableViewAutomaticDimension);
}

- (void)p_updateColors
{
  objc_msgSend(-[THStudyOptionsPopoverController viewIfLoaded](self, "viewIfLoaded"), "setTintColor:", -[IMThemePage keyColor](self->_theme, "keyColor"));
  objc_msgSend(objc_msgSend(-[THStudyOptionsPopoverController navigationController](self, "navigationController"), "navigationBar"), "setTintColor:", -[IMThemePage keyColor](self->_theme, "keyColor"));
  -[UITableView reloadData](self->_tableView, "reloadData");
}

- (void)setTheme:(id)a3
{
  if ((-[IMThemePage isEqual:](self->_theme, "isEqual:") & 1) == 0)
  {

    self->_theme = (IMThemePage *)a3;
    -[THStudyOptionsPopoverController p_updateColors](self, "p_updateColors");
  }
}

- (void)shuffleSwitchChanged:(id)a3
{
  -[THStudyOptions setShuffle:](self->_options, "setShuffle:", objc_msgSend(a3, "isOn"));
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
    return 1;
  else
    return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  double v8;
  UIListContentConfiguration *v9;
  UIListContentConfiguration *v10;
  UIListContentImageProperties *v11;
  id v12;
  id v13;
  void *v14;

  v6 = objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("StudyOptionsTableCell"));
  objc_msgSend(v6, "setAccessoryView:", 0);
  v7 = objc_opt_class(UIListContentConfiguration);
  *(_QWORD *)&v8 = TSUDynamicCast(v7, objc_msgSend(v6, "contentConfiguration")).n128_u64[0];
  v10 = v9;
  if (!v9)
    v10 = +[UIListContentConfiguration cellConfiguration](UIListContentConfiguration, "cellConfiguration", v8);
  v11 = -[UIListContentConfiguration imageProperties](v10, "imageProperties", v8);
  -[UIListContentConfiguration setImage:](v10, "setImage:", -[THStudyOptionsPopoverController checkImage](self, "checkImage"));
  -[UIListContentImageProperties setTintColor:](v11, "setTintColor:", -[THStudyOptionsPopoverController hiddenColor](self, "hiddenColor"));
  if (!objc_msgSend(a4, "section"))
  {
    objc_msgSend(v6, "setSelectionStyle:", 3);
    v13 = objc_msgSend(a4, "row");
    v14 = (void *)THBundle();
    if (v13)
    {
      -[UIListContentConfiguration setText:](v10, "setText:", objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Glossary Terms"), &stru_43D7D8, 0));
      objc_msgSend(v6, "setAccessoryType:", 0);
      if (!-[THStudyOptions showVocabulary](self->_options, "showVocabulary"))
        goto LABEL_9;
    }
    else
    {
      -[UIListContentConfiguration setText:](v10, "setText:", objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Highlights and Notes"), &stru_43D7D8, 0));
      objc_msgSend(v6, "setAccessoryType:", 4);
      if (!-[THStudyOptions showAnnotations](self->_options, "showAnnotations"))
        goto LABEL_9;
    }
    -[UIListContentImageProperties setTintColor:](v11, "setTintColor:", -[IMThemePage primaryTextColor](-[THStudyOptionsPopoverController theme](self, "theme"), "primaryTextColor"));
    goto LABEL_9;
  }
  if (objc_msgSend(a4, "section") == (char *)&dword_0 + 1)
  {
    -[UIListContentConfiguration setText:](v10, "setText:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Shuffle"), &stru_43D7D8, 0));
    objc_msgSend(v6, "setSelectionStyle:", 0);
    v12 = objc_msgSend(objc_alloc((Class)UISwitch), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    objc_msgSend(v12, "setOn:", -[THStudyOptions shuffle](self->_options, "shuffle"));
    objc_msgSend(v12, "addTarget:action:forControlEvents:", self, "shuffleSwitchChanged:", 4096);
    objc_msgSend(v6, "setAccessoryView:", v12);

  }
LABEL_9:
  objc_msgSend(v6, "setContentConfiguration:", v10);
  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  result = 0.001;
  if (a4 == 1)
    return 20.0;
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  double v5;
  double v6;
  id v7;
  id v8;
  id v9;
  CGRect v11;

  -[THStudyOptionsPopoverController tableView:heightForHeaderInSection:](self, "tableView:heightForHeaderInSection:", a3, a4);
  if (v5 <= 0.0)
    return 0;
  v6 = v5;
  v7 = objc_alloc((Class)UIView);
  objc_msgSend(-[THStudyOptionsPopoverController view](self, "view"), "frame");
  v8 = objc_msgSend(v7, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v11), v6);
  v9 = -[IMThemePage groupedBackgroundColor](self->_theme, "groupedBackgroundColor");
  objc_msgSend(v8, "setBackgroundColor:", v9);
  -[UITableView setBackgroundColor:](-[THStudyOptionsPopoverController tableView](self, "tableView"), "setBackgroundColor:", v9);
  return v8;
}

- (void)doneButtonPressed:(id)a3
{
  -[THStudyOptionsDelegate dismissStudyOptionsMenu:completion:](-[THStudyOptionsPopoverController delegate](self, "delegate", a3), "dismissStudyOptionsMenu:completion:", 1, 0);
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  double v5;
  double v6;
  id v7;
  THHighlightTableViewController *v8;

  v8 = -[THHighlightTableViewController initWithOptions:]([THHighlightTableViewController alloc], "initWithOptions:", self->_options);
  -[THHighlightTableViewController setOverrideUserInterfaceStyle:](v8, "setOverrideUserInterfaceStyle:", -[THStudyOptionsPopoverController overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle"));
  -[THHighlightTableViewController setTheme:](v8, "setTheme:", -[THStudyOptionsPopoverController theme](self, "theme"));
  if (+[UIFont bc_accessibilityFontSizesEnabled](UIFont, "bc_accessibilityFontSizesEnabled"))v5 = 360.0;
  else
    v5 = 320.0;
  if (+[UIFont bc_accessibilityFontSizesEnabled](UIFont, "bc_accessibilityFontSizesEnabled"))v6 = 400.0;
  else
    v6 = 146.0;
  objc_msgSend(objc_msgSend(-[THStudyOptionsPopoverController presentingViewController](self, "presentingViewController"), "presentedViewController"), "setPreferredContentSize:", v5, v6);
  objc_msgSend(-[THStudyOptionsPopoverController navigationController](self, "navigationController"), "pushViewController:animated:", v8, 1);
  if (objc_msgSend(-[THStudyOptionsPopoverController presentingViewController](self, "presentingViewController"), "presentedViewController")&& (objc_msgSend(objc_msgSend(-[THStudyOptionsPopoverController presentingViewController](self, "presentingViewController"), "presentedViewController"), "_isInPopoverPresentation") & 1) == 0)
  {
    v7 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "doneButtonPressed:");
    objc_msgSend(-[THHighlightTableViewController navigationItem](v8, "navigationItem"), "setRightBarButtonItem:animated:", v7, 0);

  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6;
  THStudyOptions *options;

  if (!objc_msgSend(a4, "section", a3))
  {
    v6 = objc_msgSend(a4, "row");
    options = self->_options;
    if (v6)
      -[THStudyOptions setShowVocabulary:](self->_options, "setShowVocabulary:", -[THStudyOptions showVocabulary](options, "showVocabulary") ^ 1);
    else
      -[THStudyOptions setShowAnnotations:](self->_options, "setShowAnnotations:", -[THStudyOptions showAnnotations](options, "showAnnotations") ^ 1);
  }
  return a4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", a4, 1);
  if (!objc_msgSend(a4, "section"))
    objc_msgSend(a3, "reloadData");
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  double v6;
  double v7;

  if (a4 == self)
  {
    if (+[UIFont bc_accessibilityFontSizesEnabled](UIFont, "bc_accessibilityFontSizesEnabled", a3))v6 = 360.0;
    else
      v6 = 320.0;
    if (+[UIFont bc_accessibilityFontSizesEnabled](UIFont, "bc_accessibilityFontSizesEnabled"))v7 = 400.0;
    else
      v7 = 146.0;
    objc_msgSend(objc_msgSend(objc_msgSend(a4, "presentingViewController"), "presentedViewController"), "setPreferredContentSize:", v6, v7);
  }
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (THStudyOptionsDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THStudyOptionsDelegate *)a3;
}

- (IMThemePage)theme
{
  return self->_theme;
}

- (void)setCheckImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
