@implementation UIWebSelectTableViewController

- (BOOL)_isEmpty
{
  return -[NSArray count](self->_cachedItems, "count") == 0;
}

- (void)_setupGroupsAndOptions
{
  UIWebOptGroup *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t i;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  int v14;
  NSArray *obj;
  UIWebSelectTableViewController *v16;
  id v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = -[UIWebOptGroup initWithGroup:itemOffset:]([UIWebOptGroup alloc], "initWithGroup:itemOffset:", 0, 0);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = self->_cachedItems;
  v16 = self;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v18 = *(_QWORD *)v20;
    v8 = 1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v18)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v11 = (void *)objc_msgSend(v10, "node");
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) != 0)
        {
          v8 = 0;
          v13 = v10;
          goto LABEL_10;
        }
        objc_msgSend(v11, "parentNode");
        objc_opt_class();
        v14 = objc_opt_isKindOfClass();
        if (((v14 | v8) & 1) == 0)
        {
          v13 = 0;
          v8 = v14 ^ 1;
LABEL_10:
          -[UIWebOptGroup setOptions:](v3, "setOptions:", v4);
          objc_msgSend(v17, "addObject:", v3);

          v3 = -[UIWebOptGroup initWithGroup:itemOffset:]([UIWebOptGroup alloc], "initWithGroup:itemOffset:", v13, v7);
          v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          if ((isKindOfClass & 1) != 0)
            continue;
        }
        if (!v16->_allowsMultipleSelection && objc_msgSend(v10, "selected"))
        {
          v16->_singleSelectionIndex = objc_msgSend(v4, "count");
          v16->_singleSelectionSection = objc_msgSend(v17, "count");
        }
        objc_msgSend(v4, "addObject:", v10);
        ++v7;
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }
  -[UIWebOptGroup setOptions:](v3, "setOptions:", v4);
  objc_msgSend(v17, "addObject:", v3);

  -[UIWebSelectTableViewController set_groupsAndOptions:](v16, "set_groupsAndOptions:", v17);
}

- (UIWebSelectTableViewController)initWithDOMHTMLSelectNode:(id)a3 cachedItems:(id)a4 singleSelectionIndex:(unint64_t)a5 multipleSelection:(BOOL)a6
{
  UIWebSelectTableViewController *v10;
  UIWebSelectTableViewController *v11;
  void *v12;
  unsigned __int8 v14;
  uint64_t v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)UIWebSelectTableViewController;
  v10 = -[UITableViewController initWithStyle:](&v16, sel_initWithStyle_, 0);
  v11 = v10;
  if (v10)
  {
    -[UIWebSelectTableViewController set_selectionNode:](v10, "set_selectionNode:", a3);
    -[UIWebSelectTableViewController set_cachedItems:](v11, "set_cachedItems:", a4);
    v11->_singleSelectionIndex = a5;
    v11->_singleSelectionSection = 0;
    v11->_allowsMultipleSelection = a6;
    -[UIWebSelectTableViewController _setupGroupsAndOptions](v11, "_setupGroupsAndOptions");
    v15 = 0;
    v14 = 0;
    objc_msgSend(a3, "getTextWritingDirection:override:", &v15, &v14);
    v11->_textAlignment = 2 * (v15 != 0);
    v12 = (void *)objc_msgSend(a3, "title");
    -[UIViewController setTitle:](v11, "setTitle:", objc_msgSend(v12, "_uikit_stringWithWritingDirection:asOverride:", v15, v14));
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[UIWebSelectTableViewController set_groupsAndOptions:](self, "set_groupsAndOptions:", 0);
  -[UIWebSelectTableViewController set_selectionNode:](self, "set_selectionNode:", 0);
  -[UIWebSelectTableViewController set_cachedItems:](self, "set_cachedItems:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIWebSelectTableViewController;
  -[UITableViewController dealloc](&v3, sel_dealloc);
}

- (void)viewWillAppear:(BOOL)a3
{
  unint64_t singleSelectionIndex;
  void *v5;
  UITableView *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIWebSelectTableViewController;
  -[UITableViewController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  singleSelectionIndex = self->_singleSelectionIndex;
  if (singleSelectionIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", singleSelectionIndex, self->_singleSelectionSection);
    v6 = -[UITableViewController tableView](self, "tableView");
    v7 = objc_msgSend(v5, "section");
    if (v7 < -[UITableView numberOfSections](v6, "numberOfSections"))
    {
      v8 = objc_msgSend(v5, "row");
      if (v8 < -[UITableView numberOfRowsInSection:](v6, "numberOfRowsInSection:", objc_msgSend(v5, "section")))
        -[UITableView scrollToRowAtIndexPath:atScrollPosition:animated:](v6, "scrollToRowAtIndexPath:atScrollPosition:animated:", v5, 2, 0);
    }
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (-[UIWebSelectTableViewController _isEmpty](self, "_isEmpty", a3))
    return 1;
  else
    return -[NSArray count](self->_groupsAndOptions, "count");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (-[UIWebSelectTableViewController _isEmpty](self, "_isEmpty", a3))
    return 1;
  else
    return objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndex:](self->_groupsAndOptions, "objectAtIndex:", a4), "options"), "count");
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v6;

  if (a4
    && (WebThreadLock(),
        (v6 = (void *)objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndex:](self->_groupsAndOptions, "objectAtIndex:", a4), "group"), "node")) != 0))
  {
    return (id)objc_msgSend(v6, "itemTitle");
  }
  else
  {
    return 0;
  }
}

- (id)_optionsForSection:(int64_t)a3
{
  return (id)objc_msgSend(-[NSArray objectAtIndex:](self->_groupsAndOptions, "objectAtIndex:", a3), "options");
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  UITableViewCell *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v6 = (UITableViewCell *)objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("UIWebPopoverTableViewCellReuseIdentifier"));
  if (!v6)
    v6 = -[UITableViewCell initWithStyle:reuseIdentifier:]([UITableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("UIWebPopoverTableViewCellReuseIdentifier"));
  -[UILabel setTextAlignment:](-[UITableViewCell textLabel](v6, "textLabel"), "setTextAlignment:", self->_textAlignment);
  if (-[UIWebSelectTableViewController _isEmpty](self, "_isEmpty"))
  {
    -[UILabel setEnabled:](-[UITableViewCell textLabel](v6, "textLabel"), "setEnabled:", 0);
    -[UILabel setText:](-[UITableViewCell textLabel](v6, "textLabel"), "setText:", _UINSLocalizedStringWithDefaultValue(CFSTR("No Options"), CFSTR("No Options")));
    -[UITableViewCell setAccessoryType:](v6, "setAccessoryType:", 0);
    -[UITableViewCell setSelectionStyle:](v6, "setSelectionStyle:", 0);
  }
  else
  {
    v7 = -[UIWebSelectTableViewController _optionsForSection:](self, "_optionsForSection:", objc_msgSend(a4, "section"));
    -[UIView bounds](v6, "bounds");
    -[UITableViewCell contentRectForBounds:](v6, "contentRectForBounds:");
    -[UITableViewCell textRectForContentRect:](v6, "textRectForContentRect:");
    v9 = v8;
    -[UIFont pointSize](-[UILabel font](-[UITableViewCell textLabel](v6, "textLabel"), "font"), "pointSize");
    v11 = v10;
    v12 = -[UILabel font](-[UITableViewCell textLabel](v6, "textLabel"), "font");
    v13 = (void *)v12;
    if (v9 != self->_maximumTextWidth || self->_fontSize == 0.0)
    {
      self->_maximumTextWidth = v9;
      self->_fontSize = adjustedFontSize(v12, self->_cachedItems, v9, v11);
    }
    v14 = (void *)objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", objc_msgSend(a4, "row")), "node");
    WebThreadLock();
    objc_msgSend(v14, "populateCell:", v6);
    -[UILabel setFont:](-[UITableViewCell textLabel](v6, "textLabel"), "setFont:", objc_msgSend(v13, "fontWithSize:", self->_fontSize));
    -[UILabel setLineBreakMode:](-[UITableViewCell textLabel](v6, "textLabel"), "setLineBreakMode:", 0);
    -[UILabel setNumberOfLines:](-[UITableViewCell textLabel](v6, "textLabel"), "setNumberOfLines:", 2);
  }
  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  void *v13;
  unint64_t singleSelectionIndex;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  if (-[UIWebSelectTableViewController _isEmpty](self, "_isEmpty"))
    return;
  v7 = -[NSArray objectAtIndex:](self->_groupsAndOptions, "objectAtIndex:", objc_msgSend(a4, "section"));
  v8 = (void *)objc_msgSend(v7, "options");
  if (!self->_allowsMultipleSelection)
  {
    objc_msgSend(a3, "deselectRowAtIndexPath:animated:", a4, 0);
    singleSelectionIndex = self->_singleSelectionIndex;
    if (singleSelectionIndex == 0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = 0;
    }
    else
    {
      v15 = (void *)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", singleSelectionIndex, self->_singleSelectionSection);
      if (objc_msgSend(a4, "isEqual:", v15))
      {
LABEL_21:
        -[UIWebSelectPopover _userActionDismissedPopover:](self->_popover, "_userActionDismissedPopover:", 0);
        return;
      }
    }
    v16 = (void *)objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
    if (!objc_msgSend((id)objc_msgSend(v16, "textLabel"), "isEnabled"))
      return;
    if (v15)
    {
      v17 = (void *)objc_msgSend(a3, "cellForRowAtIndexPath:", v15);
      if (v17)
      {
        v18 = v17;
        if (objc_msgSend(v17, "accessoryType") == 3)
          objc_msgSend(v18, "setAccessoryType:", 0);
      }
    }
    if (v16 && !objc_msgSend(v16, "accessoryType"))
    {
      objc_msgSend(v16, "setAccessoryType:", 3);
      self->_singleSelectionIndex = objc_msgSend(a4, "row");
      self->_singleSelectionSection = objc_msgSend(a4, "section");
      v19 = (void *)objc_msgSend(v8, "objectAtIndex:", self->_singleSelectionIndex);
      WebThreadLock();
      -[DOMHTMLSelectElement _activateItemAtIndex:](-[UIWebSelectTableViewController _selectionNode](self, "_selectionNode"), "_activateItemAtIndex:", objc_msgSend(a4, "row") + objc_msgSend(v7, "offset"));
      objc_msgSend(v19, "setSelected:", 1);
    }
    if (v15)
    {
      v20 = (void *)objc_msgSend(-[UIWebSelectTableViewController _optionsForSection:](self, "_optionsForSection:", objc_msgSend(v15, "section")), "objectAtIndex:", objc_msgSend(v15, "row"));
      WebThreadLock();
      objc_msgSend(v20, "setSelected:", 0);
    }
    goto LABEL_21;
  }
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", objc_msgSend(a3, "indexPathForSelectedRow"), 0);
  v9 = (void *)objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
  if (objc_msgSend((id)objc_msgSend(v9, "textLabel"), "isEnabled"))
  {
    v10 = objc_msgSend(v9, "accessoryType");
    v11 = v10 == 0;
    if (v10)
      v12 = 0;
    else
      v12 = 3;
    objc_msgSend(v9, "setAccessoryType:", v12);
    v13 = (void *)objc_msgSend(v8, "objectAtIndex:", objc_msgSend(a4, "row"));
    WebThreadLock();
    -[DOMHTMLSelectElement _activateItemAtIndex:allowMultipleSelection:](-[UIWebSelectTableViewController _selectionNode](self, "_selectionNode"), "_activateItemAtIndex:allowMultipleSelection:", objc_msgSend(a4, "row") + objc_msgSend(v7, "offset"), 1);
    objc_msgSend(v13, "setSelected:", v11);
  }
}

- (BOOL)hasText
{
  return 0;
}

- (DOMHTMLSelectElement)_selectionNode
{
  return self->_selectionNode;
}

- (void)set_selectionNode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1016);
}

- (NSArray)_groupsAndOptions
{
  return self->_groupsAndOptions;
}

- (void)set_groupsAndOptions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1032);
}

- (NSArray)_cachedItems
{
  return self->_cachedItems;
}

- (void)set_cachedItems:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1024);
}

- (UIWebSelectPopover)_popover
{
  return self->_popover;
}

- (void)set_popover:(id)a3
{
  self->_popover = (UIWebSelectPopover *)a3;
}

@end
