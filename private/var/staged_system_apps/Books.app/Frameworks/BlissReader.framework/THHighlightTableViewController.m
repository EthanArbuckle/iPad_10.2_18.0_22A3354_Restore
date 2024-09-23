@implementation THHighlightTableViewController

- (THHighlightTableViewController)initWithOptions:(id)a3
{
  THHighlightTableViewController *v5;
  double v6;
  unsigned int v7;
  double v8;
  objc_super v10;

  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THHighlightTableViewController initWithOptions:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THStudyOptionsPopoverController.mm"), 354, CFSTR("invalid nil value for '%s'"), "options");
  v10.receiver = self;
  v10.super_class = (Class)THHighlightTableViewController;
  v5 = -[THHighlightTableViewController initWithStyle:](&v10, "initWithStyle:", 0);
  if (v5)
  {
    v5->_options = (THStudyOptions *)a3;
    -[THHighlightTableViewController setTitle:](v5, "setTitle:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Highlights and Notes"), &stru_43D7D8, 0));
    if (+[UIFont bc_accessibilityFontSizesEnabled](UIFont, "bc_accessibilityFontSizesEnabled"))v6 = 360.0;
    else
      v6 = 320.0;
    v7 = +[UIFont bc_accessibilityFontSizesEnabled](UIFont, "bc_accessibilityFontSizesEnabled");
    v8 = 400.0;
    if (!v7)
      v8 = 146.0;
    -[THHighlightTableViewController setPreferredContentSize:](v5, "setPreferredContentSize:", v6, v8);
    -[THHighlightTableViewController registerForTraitChanges:withAction:](v5, "registerForTraitChanges:withAction:", +[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"), "_traitCollectionDidChange:previousTraitCollection:");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->_options = 0;
  self->_theme = 0;
  v3.receiver = self;
  v3.super_class = (Class)THHighlightTableViewController;
  -[THHighlightTableViewController dealloc](&v3, "dealloc");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THHighlightTableViewController;
  -[THHighlightTableViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[THStudyOptions addObserver:](self->_options, "addObserver:", self);
  -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, "contentSizeCategoryDidChange", UIContentSizeCategoryDidChangeNotification, 0);
  -[THHighlightTableViewController p_updateColors](self, "p_updateColors");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THHighlightTableViewController;
  -[THHighlightTableViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[THStudyOptions removeObserver:](self->_options, "removeObserver:", self);
  -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, UIContentSizeCategoryDidChangeNotification, 0);
}

- (void)viewDidLoad
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THHighlightTableViewController;
  -[THHighlightTableViewController viewDidLoad](&v4, "viewDidLoad");
  objc_msgSend(-[THHighlightTableViewController tableView](self, "tableView"), "setSeparatorStyle:", 1);
  objc_msgSend(-[THHighlightTableViewController tableView](self, "tableView"), "setSeparatorColor:", +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.79, 1.0));
  v3 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v3, "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(-[THHighlightTableViewController tableView](self, "tableView"), "setTableFooterView:", v3);

  objc_msgSend(-[THHighlightTableViewController tableView](self, "tableView"), "setAlwaysBounceHorizontal:", 0);
  objc_msgSend(-[THHighlightTableViewController tableView](self, "tableView"), "setAlwaysBounceVertical:", 0);
  -[THHighlightTableViewController contentSizeCategoryDidChange](self, "contentSizeCategoryDidChange");
}

- (void)contentSizeCategoryDidChange
{
  objc_msgSend(-[THHighlightTableViewController tableView](self, "tableView"), "setRowHeight:", 42.0);
  objc_msgSend(-[THHighlightTableViewController tableView](self, "tableView"), "setEstimatedRowHeight:", 42.0);
  if (+[UIFont bc_accessibilityFontSizesEnabled](UIFont, "bc_accessibilityFontSizesEnabled"))objc_msgSend(-[THHighlightTableViewController tableView](self, "tableView"), "setRowHeight:", UITableViewAutomaticDimension);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unsigned int v20;
  id v21;
  uint64_t v22;
  CGSize v24;
  CGSize v25;
  CGRect v26;
  CGRect v27;

  v6 = objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("StudyOptionsHighlightTableCell"));
  if (!v6)
    v6 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, CFSTR("StudyOptionsHighlightTableCell"));
  objc_msgSend(v6, "setBackgroundColor:", -[IMThemePage secondaryGroupedBackgroundColor](self->_theme, "secondaryGroupedBackgroundColor"));
  if (objc_msgSend(a4, "row"))
  {
    if (qword_543200 != -1)
      dispatch_once(&qword_543200, &stru_429678);
    v7 = qword_5431F8;
    v8 = v7 + 16 * (_QWORD)objc_msgSend(a4, "row");
    v9 = *(unsigned int *)(v8 - 16);
    v10 = *(_QWORD *)(v8 - 8);
    if ((_DWORD)v9 == 6)
    {
      v11 = +[BCResources iconTextPopupHighlightUnderline](BCResources, "iconTextPopupHighlightUnderline");
      objc_msgSend(v11, "size");
      v12 = TSDCenterRectOverRect(CGRectZero.origin.x);
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v24.width = 22.0;
      v24.height = 22.0;
      UIGraphicsBeginImageContextWithOptions(v24, 0, 0.0);
      objc_msgSend(v11, "drawInRect:", v12, v14, v16, v18);
      -[UIColor setStroke](+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.850980392, 1.0), "setStroke");
      v26.origin.x = 0.0;
      v26.origin.y = 0.0;
      v26.size.width = 22.0;
      v26.size.height = 22.0;
      v27 = CGRectInset(v26, 1.0, 1.0);
      -[UIBezierPath stroke](+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height, v27.size.width * 0.5), "stroke");
    }
    else
    {
      v21 = objc_msgSend(+[AEAnnotationTheme themeForAnnotationStyle:pageTheme:](AEAnnotationTheme, "themeForAnnotationStyle:pageTheme:", v9, 4), "highlightColor");
      v25.width = 22.0;
      v25.height = 22.0;
      UIGraphicsBeginImageContextWithOptions(v25, 0, 0.0);
      objc_msgSend(v21, "setFill");
      -[UIBezierPath fill](+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, 22.0, 22.0, 11.0), "fill");
    }
    objc_msgSend(objc_msgSend(v6, "imageView"), "setImage:", UIGraphicsGetImageFromCurrentImageContext());
    UIGraphicsEndImageContext();
    objc_msgSend(objc_msgSend(v6, "textLabel"), "setText:", v10);
    v20 = -[THStudyOptions shouldShowAnnotationStyle:](self->_options, "shouldShowAnnotationStyle:", v9);
  }
  else
  {
    objc_msgSend(objc_msgSend(v6, "textLabel"), "setText:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("All Highlights and Notes"), &stru_43D7D8, 0));
    objc_msgSend(v6, "setIndentationLevel:", 0);
    objc_msgSend(v6, "setIndentationWidth:", 53.0);
    objc_msgSend(v6, "indentationWidth");
    objc_msgSend(v6, "setSeparatorInset:", 0.0, v19, 0.0, 0.0);
    v20 = -[THStudyOptions shouldShowAllAnnotationStyles](self->_options, "shouldShowAllAnnotationStyles");
  }
  if (v20)
    v22 = 3;
  else
    v22 = 0;
  objc_msgSend(v6, "setAccessoryType:", v22);
  return v6;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  THStudyOptions *options;
  id v11;
  THStudyOptions *v12;

  v6 = objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
  if (objc_msgSend(a4, "row"))
  {
    if (qword_543200 != -1)
      dispatch_once(&qword_543200, &stru_429678);
    v7 = qword_5431F8;
    v8 = *(unsigned int *)(v7 + 16 * (_QWORD)objc_msgSend(a4, "row") - 16);
    v9 = -[THStudyOptions shouldShowAnnotationStyle:](self->_options, "shouldShowAnnotationStyle:", v8);
    options = self->_options;
    if (v9)
      -[THStudyOptions hideAnnotationStyle:](options, "hideAnnotationStyle:", v8);
    else
      -[THStudyOptions showAnnotationStyle:](options, "showAnnotationStyle:", v8);
  }
  else
  {
    v11 = objc_msgSend(v6, "accessoryType");
    v12 = self->_options;
    if (v11)
      -[THStudyOptions hideAllAnnotationStyles](v12, "hideAllAnnotationStyles");
    else
      -[THStudyOptions showAllAnnotationStyles](v12, "showAllAnnotationStyles");
  }
  return a4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", a4, 1);
}

- (void)studyOptionsDidChangeFilterOptions:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;

  v4 = -[THHighlightTableViewController tableView](self, "tableView", a3);
  v5 = objc_msgSend(v4, "numberOfRowsInSection:", 0);
  if ((unint64_t)v5 >= 2)
  {
    v6 = v5;
    v7 = 0;
    for (i = 1; (id)i != v6; ++i)
    {
      v9 = objc_msgSend(v4, "cellForRowAtIndexPath:", +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", i, 0));
      if (qword_543200 != -1)
        dispatch_once(&qword_543200, &stru_429678);
      if (-[THStudyOptions shouldShowAnnotationStyle:](self->_options, "shouldShowAnnotationStyle:", *(unsigned int *)(qword_5431F8 + v7)))
      {
        v10 = 3;
      }
      else
      {
        v10 = 0;
      }
      objc_msgSend(v9, "setAccessoryType:", v10);
      v7 += 16;
    }
  }
  v11 = objc_msgSend(v4, "cellForRowAtIndexPath:", +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0));
  if (-[THStudyOptions shouldShowAllAnnotationStyles](self->_options, "shouldShowAllAnnotationStyles"))
    v12 = 3;
  else
    v12 = 0;
  objc_msgSend(v11, "setAccessoryType:", v12);
}

- (void)p_updateColors
{
  objc_msgSend(-[THHighlightTableViewController viewIfLoaded](self, "viewIfLoaded"), "setTintColor:", -[IMThemePage keyColor](self->_theme, "keyColor"));
  objc_msgSend(objc_msgSend(-[THHighlightTableViewController navigationController](self, "navigationController"), "navigationBar"), "setTintColor:", -[IMThemePage keyColor](self->_theme, "keyColor"));
  objc_msgSend(-[THHighlightTableViewController tableView](self, "tableView"), "reloadData");
}

- (void)setTheme:(id)a3
{
  if ((-[IMThemePage isEqual:](self->_theme, "isEqual:") & 1) == 0)
  {

    self->_theme = (IMThemePage *)a3;
    -[THHighlightTableViewController p_updateColors](self, "p_updateColors");
  }
}

- (IMThemePage)theme
{
  return self->_theme;
}

@end
