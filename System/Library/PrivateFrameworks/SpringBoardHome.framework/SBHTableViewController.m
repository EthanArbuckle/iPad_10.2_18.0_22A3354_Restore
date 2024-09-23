@implementation SBHTableViewController

+ (Class)tableViewClass
{
  return 0;
}

- (void)viewDidLoad
{
  uint64_t v3;
  objc_class *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBHTableViewController;
  -[SBHTableViewController viewDidLoad](&v9, sel_viewDidLoad);
  v3 = objc_msgSend((id)objc_opt_class(), "tableViewClass");
  if (v3)
  {
    v4 = (objc_class *)v3;
    -[SBHTableViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = [v4 alloc];
    -[SBHTableViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v8 = (void *)objc_msgSend(v6, "initWithFrame:");

    objc_msgSend(v8, "setAutoresizingMask:", objc_msgSend(v5, "autoresizingMask"));
    -[SBHTableViewController setTableView:](self, "setTableView:", v8);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHTableViewController;
  -[SBHTableViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__keyboardWillDismiss_, *MEMORY[0x1E0DC4FE0], 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHTableViewController;
  -[SBHTableViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE8], 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE0], 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FD8], 0);

}

- (CGRect)keyboardFrame
{
  void *v3;
  double v4;
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
  CGRect result;

  -[SBHTableViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertRect:fromView:", 0, self->_rawKeyboardFrame.origin.x, self->_rawKeyboardFrame.origin.y, self->_rawKeyboardFrame.size.width, self->_rawKeyboardFrame.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)setShowNoResultsView:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  if (self->_showNoResultsView != a3)
  {
    v3 = a3;
    self->_showNoResultsView = a3;
    -[SBHTableViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      self->_styleBeforeShowingNoResults = objc_msgSend(v5, "separatorStyle");
      objc_msgSend(v6, "setSeparatorStyle:", 0);
    }
    else
    {
      objc_msgSend(v5, "setSeparatorStyle:", self->_styleBeforeShowingNoResults);
      self->_styleBeforeShowingNoResults = 0;
    }

  }
}

- (double)headerTopOccludingInset
{
  void *v2;
  double v3;
  double v4;

  -[SBHTableViewController tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "adjustedContentInset");
  v4 = v3;

  return v4;
}

- (void)_keyboardWillShow:(id)a3
{
  void *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "userInfo");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E90]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CGRectValue");
  self->_rawKeyboardFrame.origin.x = v5;
  self->_rawKeyboardFrame.origin.y = v6;
  self->_rawKeyboardFrame.size.width = v7;
  self->_rawKeyboardFrame.size.height = v8;

  -[SBHTableViewController _reloadNoResultsViewForKeyboardNotification:](self, "_reloadNoResultsViewForKeyboardNotification:", v10);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__keyboardWillResize_, *MEMORY[0x1E0DC4FD8], 0);

}

- (void)_keyboardWillDismiss:(id)a3
{
  CGSize v4;
  void *v5;
  id v6;

  v4 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_rawKeyboardFrame.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_rawKeyboardFrame.size = v4;
  objc_msgSend(a3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHTableViewController _reloadNoResultsViewForKeyboardNotification:](self, "_reloadNoResultsViewForKeyboardNotification:", v5);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FD8], 0);

}

- (void)_keyboardWillResize:(id)a3
{
  void *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  id v9;

  objc_msgSend(a3, "userInfo");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E90]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CGRectValue");
  self->_rawKeyboardFrame.origin.x = v5;
  self->_rawKeyboardFrame.origin.y = v6;
  self->_rawKeyboardFrame.size.width = v7;
  self->_rawKeyboardFrame.size.height = v8;

  -[SBHTableViewController _reloadNoResultsViewForKeyboardNotification:](self, "_reloadNoResultsViewForKeyboardNotification:", v9);
}

- (void)_reloadNoResultsViewForKeyboardNotification:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;

  if (self->_showNoResultsView)
  {
    v4 = *MEMORY[0x1E0DC4E48];
    v5 = a3;
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E40]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "integerValue");
    -[SBHTableViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0DC3F10];
    v13 = (v10 << 16) | 4;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __70__SBHTableViewController__reloadNoResultsViewForKeyboardNotification___block_invoke;
    v15[3] = &unk_1E8D84C50;
    v16 = v11;
    v14 = v11;
    objc_msgSend(v12, "animateWithDuration:delay:options:animations:completion:", v13, v15, 0, v8, 0.0);

  }
}

uint64_t __70__SBHTableViewController__reloadNoResultsViewForKeyboardNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (BOOL)showNoResultsView
{
  return self->_showNoResultsView;
}

@end
