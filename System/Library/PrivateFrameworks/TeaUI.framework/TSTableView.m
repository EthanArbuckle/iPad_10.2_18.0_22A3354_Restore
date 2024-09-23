@implementation TSTableView

- (TSTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  TSTableView *v4;
  dispatch_group_t v5;
  OS_dispatch_group *touchDeferGroup;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSTableView;
  v4 = -[TSTableView initWithFrame:style:](&v8, sel_initWithFrame_style_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    v5 = dispatch_group_create();
    touchDeferGroup = v4->_touchDeferGroup;
    v4->_touchDeferGroup = (OS_dispatch_group *)v5;

    v4->_touchDeferCounter = 0;
  }
  return v4;
}

- (id)contextualActionForDeletingRowAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TSTableView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[TSTableView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tableView:trailingSwipeActionsConfigurationForRowAtIndexPath:", self, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      objc_msgSend(v8, "actions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v19 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
            if (objc_msgSend(v14, "style") == 1)
            {
              v15 = v14;

              goto LABEL_14;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v11)
            continue;
          break;
        }
      }

    }
  }
  v17.receiver = self;
  v17.super_class = (Class)TSTableView;
  -[TSTableView contextualActionForDeletingRowAtIndexPath:](&v17, sel_contextualActionForDeletingRowAtIndexPath_, v4);
  v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v15;
}

+ (int64_t)ts_preferredStyleForStyle:(int64_t)a3
{
  return a3;
}

- (id)_accessibilityReorderMessageForNewIndexPath:(id)a3 swappedWithRow:(int64_t)a4 movingDown:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  objc_super v22;

  v5 = a5;
  v8 = a3;
  if (!-[TSTableView tsaxPrefersCustomReorderMessage](self, "tsaxPrefersCustomReorderMessage"))
    goto LABEL_11;
  -[TSTableView indexPathForRowAtGlobalRow:](self, "indexPathForRowAtGlobalRow:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "row");
  if (v10 >= -[TSTableView numberOfRowsInSection:](self, "numberOfRowsInSection:", objc_msgSend(v9, "section")))
  {
LABEL_10:

LABEL_11:
    v22.receiver = self;
    v22.super_class = (Class)TSTableView;
    -[TSTableView _accessibilityReorderMessageForNewIndexPath:swappedWithRow:movingDown:](&v22, sel__accessibilityReorderMessageForNewIndexPath_swappedWithRow_movingDown_, v8, a4, v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  -[TSTableView cellForRowAtIndexPath:](self, "cellForRowAtIndexPath:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "conformsToProtocol:", &unk_1EEFC1158) & 1) == 0)
  {

    goto LABEL_10;
  }
  objc_msgSend(v11, "tsaxAccessibilityLabelForReordering");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v5)
      v15 = CFSTR("below");
    else
      v15 = CFSTR("above");
    objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_1E6338910, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Move %1$@ %2$@."), &stru_1E6338910, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", v18, v21, v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  if (!v19)
    goto LABEL_11;
LABEL_12:

  return v19;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  NSObject *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSTableView;
  -[TSTableView touchesBegan:withEvent:](&v6, sel_touchesBegan_withEvent_, a3, a4);
  -[TSTableView touchDeferGroup](self, "touchDeferGroup");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v5);

  -[TSTableView setTouchDeferCounter:](self, "setTouchDeferCounter:", -[TSTableView touchDeferCounter](self, "touchDeferCounter") + 1);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  NSObject *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSTableView;
  -[TSTableView touchesEnded:withEvent:](&v6, sel_touchesEnded_withEvent_, a3, a4);
  if (-[TSTableView touchDeferCounter](self, "touchDeferCounter") >= 1)
  {
    -[TSTableView touchDeferGroup](self, "touchDeferGroup");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_group_leave(v5);

    -[TSTableView setTouchDeferCounter:](self, "setTouchDeferCounter:", -[TSTableView touchDeferCounter](self, "touchDeferCounter") - 1);
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  NSObject *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSTableView;
  -[TSTableView touchesCancelled:withEvent:](&v6, sel_touchesCancelled_withEvent_, a3, a4);
  if (-[TSTableView touchDeferCounter](self, "touchDeferCounter") >= 1)
  {
    -[TSTableView touchDeferGroup](self, "touchDeferGroup");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_group_leave(v5);

    -[TSTableView setTouchDeferCounter:](self, "setTouchDeferCounter:", -[TSTableView touchDeferCounter](self, "touchDeferCounter") - 1);
  }
}

- (void)_deferWhenTouchingWithBlock:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[TSTableView touchDeferGroup](self, "touchDeferGroup");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(v5, MEMORY[0x1E0C80D38], v4);

}

- (BOOL)tsaxPrefersCustomReorderMessage
{
  return self->_tsaxPrefersCustomReorderMessage;
}

- (void)setTsaxPrefersCustomReorderMessage:(BOOL)a3
{
  self->_tsaxPrefersCustomReorderMessage = a3;
}

- (OS_dispatch_group)touchDeferGroup
{
  return self->_touchDeferGroup;
}

- (int64_t)touchDeferCounter
{
  return self->_touchDeferCounter;
}

- (void)setTouchDeferCounter:(int64_t)a3
{
  self->_touchDeferCounter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchDeferGroup, 0);
}

@end
