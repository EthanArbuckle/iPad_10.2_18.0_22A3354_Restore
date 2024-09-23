@implementation THGlossaryTermsViewController

+ (id)newViewController
{
  return -[THGlossaryTermsViewController initWithNibName:bundle:]([THGlossaryTermsViewController alloc], "initWithNibName:bundle:", 0, 0);
}

- (THGlossaryTermsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  THGlossaryTermsViewController *v7;
  objc_super v9;

  v6 = THBundle();
  v9.receiver = self;
  v9.super_class = (Class)THGlossaryTermsViewController;
  v7 = -[THGlossaryTermsViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", a3, v6);
  if (v7)
  {
    -[THGlossaryTermsViewController setTheme:](v7, "setTheme:", +[IMTheme themeWithIdentifier:](IMTheme, "themeWithIdentifier:", kIMThemeIdentifierDynamicTheme));
    -[THGlossaryTermsViewController registerForTraitChanges:withAction:](v7, "registerForTraitChanges:withAction:", +[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"), "_traitCollectionDidChange:previousTraitCollection:");
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[NSNotificationCenter removeObserver:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:", self);
  -[THGlossaryTermsViewController setDidLayoutBlock:](self, "setDidLayoutBlock:", 0);

  self->_searchString = 0;
  self->_glossaryIndex = 0;
  -[THFloatingHeaderController setDelegate:](self->_floatingHeaderController, "setDelegate:", 0);
  -[THFloatingHeaderController setTableView:](self->_floatingHeaderController, "setTableView:", 0);

  self->_floatingHeaderController = 0;
  -[UISearchBar setDelegate:](self->_searchBar, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryTermsViewController;
  -[THGlossaryTermsViewController dealloc](&v3, "dealloc");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THGlossaryTermsViewController;
  -[THGlossaryTermsViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[THGlossaryTermsViewController setHasDoneLayout:](self, "setHasDoneLayout:", 1);
  if (-[THGlossaryTermsViewController didLayoutBlock](self, "didLayoutBlock"))
  {
    (*((void (**)(void))-[THGlossaryTermsViewController didLayoutBlock](self, "didLayoutBlock") + 2))();
    -[THGlossaryTermsViewController setDidLayoutBlock:](self, "setDidLayoutBlock:", 0);
  }
}

- (void)setTheme:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THGlossaryTermsViewController;
  -[THGlossaryTermsViewController setTheme:](&v4, "setTheme:", a3);
  -[THGlossaryTermsViewController _styleForTheme](self, "_styleForTheme");
}

- (void)_styleForTheme
{
  id v3;

  v3 = objc_msgSend(-[THGlossaryTermsViewController themePage](self, "themePage"), "backgroundColorForTraitEnvironment:", self);
  -[UITableView setSeparatorColor:](-[THGlossaryTermsViewController tableView](self, "tableView"), "setSeparatorColor:", objc_msgSend(-[THGlossaryTermsViewController themePage](self, "themePage"), "separatorColor"));
  -[UITableView setBackgroundColor:](-[THGlossaryTermsViewController tableView](self, "tableView"), "setBackgroundColor:", v3);
  objc_msgSend(-[THGlossaryTermsViewController view](self, "view"), "setBackgroundColor:", v3);
  -[UITableView reloadData](-[THGlossaryTermsViewController tableView](self, "tableView"), "reloadData");
  -[THFloatingHeaderController reloadData](-[THGlossaryTermsViewController floatingHeaderController](self, "floatingHeaderController"), "reloadData");
}

- (THGlossaryIndex)glossaryIndex
{
  THGlossaryIndex *result;
  id v4;

  result = self->_glossaryIndex;
  if (!result)
  {
    if (-[THGlossaryTermsViewController isSearching](self, "isSearching"))
      v4 = +[THGlossaryIndex alphabeticalIndexForGlossary:withPrefix:](THGlossaryIndex, "alphabeticalIndexForGlossary:withPrefix:", -[THGlossaryController model](-[THGlossaryTermsViewController glossaryController](self, "glossaryController"), "model"), self->_searchString);
    else
      v4 = -[THGlossaryController alphabeticalTermIndex](-[THGlossaryTermsViewController glossaryController](self, "glossaryController"), "alphabeticalTermIndex");
    result = (THGlossaryIndex *)v4;
    self->_glossaryIndex = result;
  }
  return result;
}

- (BOOL)isSearching
{
  return -[NSString length](self->_searchString, "length") != 0;
}

- (BOOL)shouldHighlightWord:(id)a3
{
  NSUInteger v5;

  v5 = -[NSString length](self->_searchString, "length");
  if (v5)
    LOBYTE(v5) = objc_msgSend(objc_msgSend(a3, "normalizedStringForSearch"), "hasPrefix:", -[NSString normalizedStringForSearch](self->_searchString, "normalizedStringForSearch"));
  return v5;
}

- (void)viewDidLoad
{
  id v3;
  uint64_t v4;
  NSNotificationCenter *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THGlossaryTermsViewController;
  -[THGlossaryTermsViewController viewDidLoad](&v6, "viewDidLoad");
  objc_msgSend(-[THGlossaryTermsViewController view](self, "view"), "setBackgroundColor:", objc_msgSend(-[THGlossaryTermsViewController themePage](self, "themePage"), "backgroundColorForTraitEnvironment:", self));
  objc_msgSend(-[THGlossaryTermsViewController view](self, "view"), "setOpaque:", 1);
  objc_msgSend(-[THGlossaryTermsViewController view](self, "view"), "setClipsToBounds:", 1);
  -[UISearchBar setPlaceholder:](-[THGlossaryTermsViewController searchBar](self, "searchBar"), "setPlaceholder:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Search"), &stru_43D7D8, 0));
  -[UISearchBar setDelegate:](-[THGlossaryTermsViewController searchBar](self, "searchBar"), "setDelegate:", self);
  -[UIView setBackgroundColor:](-[THGlossaryTermsViewController dividerView](self, "dividerView"), "setBackgroundColor:", +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.784313725, 0.780392157, 0.8, 1.0));
  -[UITableView setSectionHeaderHeight:](-[THGlossaryTermsViewController tableView](self, "tableView"), "setSectionHeaderHeight:", 0.0);
  -[UITableView setRowHeight:](-[THGlossaryTermsViewController tableView](self, "tableView"), "setRowHeight:", 44.0);
  -[UITableView setSeparatorStyle:](-[THGlossaryTermsViewController tableView](self, "tableView"), "setSeparatorStyle:", 0);
  -[UITableView setSectionIndexBackgroundColor:](-[THGlossaryTermsViewController tableView](self, "tableView"), "setSectionIndexBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
  -[UITableView setClipsToBounds:](-[THGlossaryTermsViewController tableView](self, "tableView"), "setClipsToBounds:", 1);
  -[UITableView setContentInsetAdjustmentBehavior:](-[THGlossaryTermsViewController tableView](self, "tableView"), "setContentInsetAdjustmentBehavior:", 0);
  -[THGlossaryTermsViewController setFloatingHeaderController:](self, "setFloatingHeaderController:", objc_alloc_init(THFloatingHeaderController));
  -[THFloatingHeaderController setDelegate:](-[THGlossaryTermsViewController floatingHeaderController](self, "floatingHeaderController"), "setDelegate:", self);
  -[THFloatingHeaderController setTableView:](-[THGlossaryTermsViewController floatingHeaderController](self, "floatingHeaderController"), "setTableView:", -[THGlossaryTermsViewController tableView](self, "tableView"));
  v3 = -[THFloatingHeaderController reloadData](-[THGlossaryTermsViewController floatingHeaderController](self, "floatingHeaderController"), "reloadData");
  -[NSLayoutConstraint setConstant:](-[THGlossaryTermsViewController dividerHeightConstraint](self, "dividerHeightConstraint"), "setConstant:", 1.0 / TSUScreenScale(v3, v4));
  v5 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:](v5, "addObserver:selector:name:object:", self, "dismissSearchKeyboard:", kTHGlossaryDismissSearchNotification, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THGlossaryTermsViewController;
  -[THGlossaryTermsViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[UISearchBar resignFirstResponder](-[THGlossaryTermsViewController searchBar](self, "searchBar"), "resignFirstResponder");
}

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THGlossaryTermsViewController;
  -[THGlossaryTermsViewController viewSafeAreaInsetsDidChange](&v3, "viewSafeAreaInsetsDidChange");
  -[THFloatingHeaderController layoutHeaders](-[THGlossaryTermsViewController floatingHeaderController](self, "floatingHeaderController"), "layoutHeaders");
}

- (void)scrollViewDidScroll:(id)a3
{
  -[THFloatingHeaderController layoutHeaders](-[THGlossaryTermsViewController floatingHeaderController](self, "floatingHeaderController", a3), "layoutHeaders");
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (id)p_previousCellForTableView:(id)a3 indexPath:(id)a4
{
  id result;
  uint64_t v6;
  id v7;
  uint64_t v8;

  result = objc_msgSend(a3, "indexPathForRowPreceedingIndexPath:", a4);
  if (result)
  {
    v7 = result;
    v8 = objc_opt_class(THGlossaryTermTableViewCell, v6);
    return (id)TSUDynamicCast(v8, objc_msgSend(a3, "cellForRowAtIndexPath:", v7));
  }
  return result;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  -[THGlossaryTermsViewController dismissSearchKeyboard:](self, "dismissSearchKeyboard:", self);
  -[THGlossaryNavigationDelegate displayEntry:whenCollapsed:](-[THGlossaryTermsViewController navigationDelegate](self, "navigationDelegate"), "displayEntry:whenCollapsed:", -[THGlossaryIndex entryForRowAtIndexPath:](-[THGlossaryTermsViewController glossaryIndex](self, "glossaryIndex"), "entryForRowAtIndexPath:", a4), 1);
  return a4;
}

- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4
{
  objc_msgSend(-[THGlossaryTermsViewController p_previousCellForTableView:indexPath:](self, "p_previousCellForTableView:indexPath:", a3, a4), "setFollowingCellHighlighted:", 1);
}

- (void)tableView:(id)a3 didUnhighlightRowAtIndexPath:(id)a4
{
  objc_msgSend(-[THGlossaryTermsViewController p_previousCellForTableView:indexPath:](self, "p_previousCellForTableView:indexPath:", a3, a4), "setFollowingCellHighlighted:", 0);
}

- (CGRect)tableView:(id)a3 frameForSectionIndexGivenProposedFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  unsigned int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = objc_msgSend(a3, "_shouldReverseLayoutDirection");
  objc_msgSend(a3, "safeAreaInsets");
  v12 = -v11;
  if (v9)
    v12 = v10;
  v13 = x + v12;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)glossaryTermTableCell:(id)a3 selected:(BOOL)a4
{
  _BOOL8 v4;
  UITableView *v7;

  v4 = a4;
  v7 = -[THGlossaryTermsViewController tableView](self, "tableView");
  objc_msgSend(-[THGlossaryTermsViewController p_previousCellForTableView:indexPath:](self, "p_previousCellForTableView:indexPath:", v7, -[UITableView indexPathForCell:](v7, "indexPathForCell:", a3)), "setFollowingCellSelected:", v4);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[THGlossaryIndex numberOfSections](-[THGlossaryTermsViewController glossaryIndex](self, "glossaryIndex", a3), "numberOfSections");
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)p_constraintsOfSeparatorInCell:(id)a3 tableView:(id)a4 indexPath:(id)a5
{
  unsigned int v7;
  id v8;
  uint64_t v9;
  NSNumber *v10;
  _UNKNOWN **v11;
  id v12;
  NSDictionary *v13;
  NSDictionary *v14;

  v7 = -[THGlossaryIndex isLastInSection:](-[THGlossaryTermsViewController glossaryIndex](self, "glossaryIndex", a3, a4), "isLastInSection:", a5);
  v8 = +[NSMutableArray array](NSMutableArray, "array");
  v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.0 / TSUScreenScale(v8, v9));
  if (-[THGlossaryTermsViewController isSearching](self, "isSearching") | v7)
    v11 = &off_469170;
  else
    v11 = &off_468F58;
  v12 = objc_msgSend(a3, "separatorView");
  v13 = _NSDictionaryOfVariableBindings(CFSTR("leftIndent"), v11, 0);
  objc_msgSend(v8, "addObjectsFromArray:", +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-leftIndent-[separatorView]|"), 0, v13, _NSDictionaryOfVariableBindings(CFSTR("separatorView"), v12, 0)));
  v14 = _NSDictionaryOfVariableBindings(CFSTR("separatorHeight"), v10, 0);
  objc_msgSend(v8, "addObjectsFromArray:", +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[separatorView(==separatorHeight)]|"), 0, v14, _NSDictionaryOfVariableBindings(CFSTR("separatorView"), v12, 0)));
  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  THGlossaryTermTableViewCell *v7;
  id v8;
  id v9;
  NSDictionary *v10;
  NSDictionary *v11;

  v7 = (THGlossaryTermTableViewCell *)objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("THGlossaryTermTableViewCell"));
  if (!v7)
  {
    v7 = -[THGlossaryTermTableViewCell initWithStyle:reuseIdentifier:]([THGlossaryTermTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("THGlossaryTermTableViewCell"));
    -[THGlossaryTermTableViewCell setSelectionStyle:](v7, "setSelectionStyle:", 0);
    -[THLabelWithWordHighlights setTranslatesAutoresizingMaskIntoConstraints:](-[THGlossaryTermTableViewCell labelWithHighlights](v7, "labelWithHighlights"), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[THLabelWithWordHighlights setBackgroundColor:](-[THGlossaryTermTableViewCell labelWithHighlights](v7, "labelWithHighlights"), "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
    -[THLabelWithWordHighlights setTextFont:](-[THGlossaryTermTableViewCell labelWithHighlights](v7, "labelWithHighlights"), "setTextFont:", +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0));
    -[THLabelWithWordHighlights setHighlightedTextFont:](-[THGlossaryTermTableViewCell labelWithHighlights](v7, "labelWithHighlights"), "setHighlightedTextFont:", +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 17.0));
    -[THLabelWithWordHighlights setDelegate:](-[THGlossaryTermTableViewCell labelWithHighlights](v7, "labelWithHighlights"), "setDelegate:", self);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](-[THGlossaryTermTableViewCell separatorView](v7, "separatorView"), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[THGlossaryTermTableViewCell setDelegate:](v7, "setDelegate:", self);
  }
  v8 = -[THGlossaryTermsViewController themePage](self, "themePage");
  objc_msgSend(-[THGlossaryTermTableViewCell contentView](v7, "contentView"), "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
  -[THLabelWithWordHighlights setTextColor:](-[THGlossaryTermTableViewCell labelWithHighlights](v7, "labelWithHighlights"), "setTextColor:", objc_msgSend(v8, "primaryTextColor"));
  -[THLabelWithWordHighlights setHighlightedTextColor:](-[THGlossaryTermTableViewCell labelWithHighlights](v7, "labelWithHighlights"), "setHighlightedTextColor:", objc_msgSend(v8, "primaryTextColor"));
  -[UIView setBackgroundColor:](-[THGlossaryTermTableViewCell separatorView](v7, "separatorView"), "setBackgroundColor:", objc_msgSend(v8, "separatorColor"));
  objc_msgSend(-[THGlossaryTermTableViewCell selectedBackgroundView](v7, "selectedBackgroundView"), "setBackgroundColor:", objc_msgSend(v8, "tableViewCellSelectedColor"));
  -[THLabelWithWordHighlights setText:](-[THGlossaryTermTableViewCell labelWithHighlights](v7, "labelWithHighlights"), "setText:", objc_msgSend(-[THGlossaryIndex entryForRowAtIndexPath:](-[THGlossaryTermsViewController glossaryIndex](self, "glossaryIndex"), "entryForRowAtIndexPath:", a4), "term"));
  v9 = +[NSMutableArray array](NSMutableArray, "array");
  v10 = _NSDictionaryOfVariableBindings(CFSTR("labelWithHighlights"), -[THGlossaryTermTableViewCell labelWithHighlights](v7, "labelWithHighlights"), 0);
  v11 = _NSDictionaryOfVariableBindings(CFSTR("glossaryTermIndent"), &off_468F58, 0);
  objc_msgSend(v9, "addObjectsFromArray:", +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-glossaryTermIndent-[labelWithHighlights]|"), 0x10000, v11, v10));
  objc_msgSend(v9, "addObjectsFromArray:", +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[labelWithHighlights]|"), 0, v11, v10));
  objc_msgSend(v9, "addObjectsFromArray:", -[THGlossaryTermsViewController p_constraintsOfSeparatorInCell:tableView:indexPath:](self, "p_constraintsOfSeparatorInCell:tableView:indexPath:", v7, a3, a4));
  -[THGlossaryTermTableViewCell removeConstraints:](v7, "removeConstraints:", -[THGlossaryTermTableViewCell constraints](v7, "constraints"));
  -[THGlossaryTermTableViewCell addConstraints:](v7, "addConstraints:", v9);
  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 44.0;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8;
  void *v9;

  v8 = objc_opt_class(THGlossaryTermTableViewCell, a2);
  v9 = (void *)TSUDynamicCast(v8, a4);
  if (v9)
    objc_msgSend(objc_msgSend(v9, "labelWithHighlights"), "setText:", objc_msgSend(-[THGlossaryIndex entryForRowAtIndexPath:](-[THGlossaryTermsViewController glossaryIndex](self, "glossaryIndex"), "entryForRowAtIndexPath:", a5), "term"));
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[THGlossaryIndex numberOfRowsInSection:](-[THGlossaryTermsViewController glossaryIndex](self, "glossaryIndex", a3), "numberOfRowsInSection:", a4);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return -[THGlossaryIndex titleForHeaderInSection:](-[THGlossaryTermsViewController glossaryIndex](self, "glossaryIndex", a3), "titleForHeaderInSection:", a4);
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  if (-[THGlossaryTermsViewController isSearching](self, "isSearching", a3))
    return 0;
  else
    return +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", -[UILocalizedIndexedCollation sectionIndexTitles](+[UILocalizedIndexedCollation currentCollation](UILocalizedIndexedCollation, "currentCollation"), "sectionIndexTitles"));
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  if (a5)
  {
    if (-[THGlossaryIndex numberOfEntries](-[THGlossaryTermsViewController glossaryIndex](self, "glossaryIndex", a3), "numberOfEntries") < 1)return 0;
    else
      return -[THGlossaryIndex sectionForSectionIndexTitle:atIndex:](-[THGlossaryTermsViewController glossaryIndex](self, "glossaryIndex"), "sectionForSectionIndexTitle:atIndex:", a4, a5);
  }
  else
  {
    objc_msgSend(a3, "scrollToRowAtIndexPath:atScrollPosition:animated:", +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0), 3, 0);
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (id)p_activeTableView
{
  if (-[THGlossaryTermsViewController isSearching](self, "isSearching")
    && -[THGlossaryTermsViewController searchDisplayController](self, "searchDisplayController"))
  {
    return objc_msgSend(-[THGlossaryTermsViewController searchDisplayController](self, "searchDisplayController"), "searchResultsTableView");
  }
  else
  {
    return -[THGlossaryTermsViewController tableView](self, "tableView");
  }
}

- (void)selectEntry:(id)a3 scrollPosition:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  _QWORD v11[7];
  _QWORD v12[6];

  v5 = a5;
  if (-[THGlossaryTermsViewController hasDoneLayout](self, "hasDoneLayout"))
  {
    v9 = -[THGlossaryTermsViewController p_activeTableView](self, "p_activeTableView");
    if (-[THGlossaryIndex indexForEntry:](-[THGlossaryTermsViewController glossaryIndex](self, "glossaryIndex"), "indexForEntry:", a3) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v9, "deselectRowAtIndexPath:animated:", objc_msgSend(v9, "indexPathForSelectedRow"), 0);
    }
    else
    {
      v10 = -[THGlossaryIndex indexPathForEntry:](-[THGlossaryTermsViewController glossaryIndex](self, "glossaryIndex"), "indexPathForEntry:", a3);
      objc_msgSend(v9, "selectRowAtIndexPath:animated:scrollPosition:", v10, v5, a4);
      objc_msgSend(v9, "scrollToRowAtIndexPath:atScrollPosition:animated:", v10, a4, v5);
    }
  }
  else
  {
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3052000000;
    v12[3] = sub_AD574;
    v12[4] = sub_AD584;
    v12[5] = self;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_AD590;
    v11[3] = &unk_428E60;
    v11[4] = a3;
    v11[5] = v12;
    v11[6] = a4;
    -[THGlossaryTermsViewController setDidLayoutBlock:](self, "setDidLayoutBlock:", v11);
    _Block_object_dispose(v12, 8);
  }
}

- (void)scrollToEntry:(id)a3 scrollPosition:(int64_t)a4
{
  if (a3)
  {
    if (-[THGlossaryIndex indexForEntry:](-[THGlossaryTermsViewController glossaryIndex](self, "glossaryIndex"), "indexForEntry:", a3) != 0x7FFFFFFFFFFFFFFFLL)objc_msgSend(-[THGlossaryTermsViewController p_activeTableView](self, "p_activeTableView"), "scrollToRowAtIndexPath:atScrollPosition:animated:", -[THGlossaryIndex indexPathForEntry:](-[THGlossaryTermsViewController glossaryIndex](self, "glossaryIndex"), "indexPathForEntry:", a3), a4, 1);
  }
}

- (id)selectedEntry
{
  return -[THGlossaryIndex entryForRowAtIndexPath:](-[THGlossaryTermsViewController glossaryIndex](self, "glossaryIndex"), "entryForRowAtIndexPath:", objc_msgSend(-[THGlossaryTermsViewController p_activeTableView](self, "p_activeTableView"), "indexPathForSelectedRow"));
}

- (void)setSearchString:(id)a3
{
  id v5;

  if (+[NSString normalizedCompare:with:](NSString, "normalizedCompare:with:", a3, self->_searchString))
  {
    v5 = -[THGlossaryNavigationDelegate displayedEntry](-[THGlossaryTermsViewController navigationDelegate](self, "navigationDelegate"), "displayedEntry");

    self->_searchString = (NSString *)objc_msgSend(a3, "copy");
    self->_glossaryIndex = 0;
    -[UITableView reloadData](-[THGlossaryTermsViewController tableView](self, "tableView"), "reloadData");
    if (-[THGlossaryIndex numberOfEntries](-[THGlossaryTermsViewController glossaryIndex](self, "glossaryIndex"), "numberOfEntries") >= 1&& -[THGlossaryIndex indexForEntry:](-[THGlossaryTermsViewController glossaryIndex](self, "glossaryIndex"), "indexForEntry:", v5) != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[THGlossaryTermsViewController selectEntry:scrollPosition:animated:](self, "selectEntry:scrollPosition:animated:", v5, 1, 1);
    }
    -[THGlossaryNavigationDelegate displayEntry:whenCollapsed:](-[THGlossaryTermsViewController navigationDelegate](self, "navigationDelegate"), "displayEntry:whenCollapsed:", v5, 0);
  }
}

- (int64_t)overrideUserInterfaceStyle
{
  int64_t result;

  result = (int64_t)objc_msgSend(-[THGlossaryTermsViewController themePage](self, "themePage"), "userInterfaceStyle");
  if ((unint64_t)result <= 1)
    return 1;
  return result;
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  objc_msgSend(a3, "setShowsCancelButton:animated:", 1, 1);
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  objc_msgSend(a3, "setShowsCancelButton:animated:", 0, 1);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  -[THGlossaryTermsViewController setSearchString:](self, "setSearchString:", objc_msgSend(a3, "text"));
  -[THFloatingHeaderController setHeaderHidden:](-[THGlossaryTermsViewController floatingHeaderController](self, "floatingHeaderController"), "setHeaderHidden:", objc_msgSend(a4, "length") != 0);
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  -[UISearchBar resignFirstResponder](self->_searchBar, "resignFirstResponder", a3);
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  objc_msgSend(a3, "setText:", 0);
  -[THGlossaryTermsViewController clearSearch](self, "clearSearch");
}

- (void)dismissSearchKeyboard:(id)a3
{
  -[UISearchBar resignFirstResponder](self->_searchBar, "resignFirstResponder", a3);
}

- (void)clearSearch
{
  -[THGlossaryTermsViewController dismissSearchKeyboard:](self, "dismissSearchKeyboard:", 0);
  -[THGlossaryTermsViewController setSearchString:](self, "setSearchString:", +[NSString string](NSString, "string"));
}

- (unint64_t)numberOfFloatingHeaders:(id)a3
{
  return -[THGlossaryIndex numberOfSections](-[THGlossaryTermsViewController glossaryIndex](self, "glossaryIndex", a3), "numberOfSections");
}

- (id)layerForFloatingHeaderAtIndex:(unint64_t)a3 forController:(id)a4
{
  id v6;
  CALayer *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[6];
  CATransform3D v18;
  CATransform3D v19;
  CATransform3D v20;

  v15 = *(_OWORD *)&CATransform3DIdentity.m33;
  v16 = *(_OWORD *)&CATransform3DIdentity.m31;
  *(_OWORD *)&v20.m31 = v16;
  *(_OWORD *)&v20.m33 = v15;
  v13 = *(_OWORD *)&CATransform3DIdentity.m43;
  v14 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)&v20.m41 = v14;
  *(_OWORD *)&v20.m43 = v13;
  v11 = *(_OWORD *)&CATransform3DIdentity.m13;
  v12 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&v20.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&v20.m13 = v11;
  v9 = *(_OWORD *)&CATransform3DIdentity.m23;
  v10 = *(_OWORD *)&CATransform3DIdentity.m21;
  *(_OWORD *)&v20.m21 = v10;
  *(_OWORD *)&v20.m23 = v9;
  if (objc_msgSend(objc_msgSend(a4, "tableView"), "_shouldReverseLayoutDirection"))
  {
    *(_OWORD *)&v19.m31 = v16;
    *(_OWORD *)&v19.m33 = v15;
    *(_OWORD *)&v19.m41 = v14;
    *(_OWORD *)&v19.m43 = v13;
    *(_OWORD *)&v19.m11 = v12;
    *(_OWORD *)&v19.m13 = v11;
    *(_OWORD *)&v19.m21 = v10;
    *(_OWORD *)&v19.m23 = v9;
    CATransform3DScale(&v20, &v19, -1.0, 1.0, 1.0);
  }
  v6 = +[CATextLayer layer](CATextLayer, "layer");
  v18 = v20;
  objc_msgSend(v6, "setTransform:", &v18);
  objc_msgSend(v6, "setFrame:", 0.0, 2.0, 41.0, 20.0);
  objc_msgSend(v6, "setAnchorPoint:", 0.5, 0.0);
  objc_msgSend(v6, "setFont:", objc_msgSend(+[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", 17.0), "fontName"));
  objc_msgSend(v6, "setFontSize:", 17.0);
  objc_msgSend(v6, "setAlignmentMode:", kCAAlignmentCenter);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_ADAE0;
  v17[3] = &unk_426E28;
  v17[4] = v6;
  v17[5] = self;
  objc_msgSend(-[THGlossaryTermsViewController traitCollection](self, "traitCollection"), "performAsCurrentTraitCollection:", v17);
  objc_msgSend(v6, "setBackgroundColor:", -[UIColor CGColor](+[UIColor clearColor](UIColor, "clearColor"), "CGColor"));
  objc_msgSend(v6, "setString:", -[THGlossaryIndex titleForHeaderInSection:](-[THGlossaryTermsViewController glossaryIndex](self, "glossaryIndex"), "titleForHeaderInSection:", a3));
  -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
  objc_msgSend(v6, "setContentsScale:");
  v7 = +[CALayer layer](CALayer, "layer");
  -[CALayer setFrame:](v7, "setFrame:", 0.0, 0.0, 44.0, 44.0);
  -[CALayer setAnchorPoint:](v7, "setAnchorPoint:", 0.0, 0.0);
  -[CALayer setBackgroundColor:](v7, "setBackgroundColor:", -[UIColor CGColor](+[UIColor clearColor](UIColor, "clearColor"), "CGColor"));
  -[CALayer addSublayer:](v7, "addSublayer:", v6);
  return v7;
}

- (unint64_t)rowNumberForFloatingHeaderAtIndex:(unint64_t)a3 forController:(id)a4
{
  unint64_t v5;
  unint64_t v6;

  if (!a3)
    return 0;
  v5 = 0;
  v6 = a3 - 1;
  do
    v5 += -[THGlossaryIndex numberOfRowsInSection:](-[THGlossaryTermsViewController glossaryIndex](self, "glossaryIndex"), "numberOfRowsInSection:", v6--);
  while (v6 != -1);
  return v5;
}

- (unint64_t)numberOfRowsForFloatingHeaderAtIndex:(unint64_t)a3 forController:(id)a4
{
  return -[THGlossaryIndex numberOfRowsInSection:](-[THGlossaryTermsViewController glossaryIndex](self, "glossaryIndex", a3, a4), "numberOfRowsInSection:", a3);
}

- (THGlossaryController)glossaryController
{
  return self->_glossaryController;
}

- (void)setGlossaryController:(id)a3
{
  self->_glossaryController = (THGlossaryController *)a3;
}

- (THFloatingHeaderController)floatingHeaderController
{
  return self->_floatingHeaderController;
}

- (void)setFloatingHeaderController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  self->_tableView = (UITableView *)a3;
}

- (THGlossaryNavigationDelegate)navigationDelegate
{
  return self->_navigationDelegate;
}

- (void)setNavigationDelegate:(id)a3
{
  self->_navigationDelegate = (THGlossaryNavigationDelegate *)a3;
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (void)setSearchBar:(id)a3
{
  self->_searchBar = (UISearchBar *)a3;
}

- (UIView)dividerView
{
  return self->_dividerView;
}

- (void)setDividerView:(id)a3
{
  self->_dividerView = (UIView *)a3;
}

- (NSLayoutConstraint)searchBarTopConstraint
{
  return self->_searchBarTopConstraint;
}

- (void)setSearchBarTopConstraint:(id)a3
{
  self->_searchBarTopConstraint = (NSLayoutConstraint *)a3;
}

- (NSLayoutConstraint)searchBarBottomConstraint
{
  return self->_searchBarBottomConstraint;
}

- (void)setSearchBarBottomConstraint:(id)a3
{
  self->_searchBarBottomConstraint = (NSLayoutConstraint *)a3;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (id)didLayoutBlock
{
  return self->_didLayoutBlock;
}

- (void)setDidLayoutBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)hasDoneLayout
{
  return self->_hasDoneLayout;
}

- (void)setHasDoneLayout:(BOOL)a3
{
  self->_hasDoneLayout = a3;
}

- (NSLayoutConstraint)dividerHeightConstraint
{
  return self->_dividerHeightConstraint;
}

- (void)setDividerHeightConstraint:(id)a3
{
  self->_dividerHeightConstraint = (NSLayoutConstraint *)a3;
}

@end
