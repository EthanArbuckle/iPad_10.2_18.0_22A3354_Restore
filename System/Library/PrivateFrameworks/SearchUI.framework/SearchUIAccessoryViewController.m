@implementation SearchUIAccessoryViewController

+ (Class)accessoryViewClassForRowModel:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  _QWORD v18[7];

  v18[6] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)accessoryViewClassForRowModel__classes;
  if (!accessoryViewClassForRowModel__classes)
  {
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v18[2] = objc_opt_class();
    v18[3] = objc_opt_class();
    v18[4] = objc_opt_class();
    v18[5] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 6);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)accessoryViewClassForRowModel__classes;
    accessoryViewClassForRowModel__classes = v5;

    v4 = (void *)accessoryViewClassForRowModel__classes;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v4;
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v11, "supportsRowModel:", v3, (_QWORD)v13) & 1) != 0)
        {
          v8 = v11;
          goto LABEL_13;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_13:

  return (Class)v8;
}

+ (BOOL)supportsRowModel:(id)a3
{
  return 0;
}

- (BOOL)shouldVerticallyCenter
{
  return 1;
}

- (SearchUIAccessoryViewController)init
{
  SearchUIAccessoryViewController *v2;
  SearchUIAccessoryViewController *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  UIControl *control;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SearchUIAccessoryViewController;
  v2 = -[SearchUIAccessoryViewController init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SearchUIAccessoryViewController setupView](v2, "setupView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIAccessoryViewController setView:](v3, "setView:", v4);

    -[SearchUIAccessoryViewController view](v3, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIAccessoryViewController controlInView:](v3, "controlInView:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    control = v3->_control;
    v3->_control = (UIControl *)v6;

    -[UIControl addTarget:action:forControlEvents:](v3->_control, "addTarget:action:forControlEvents:", v3, sel_buttonPressed, 64);
  }
  return v3;
}

- (id)controlInView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v4, "subviews", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v6);
          -[SearchUIAccessoryViewController controlInView:](self, "controlInView:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            if (v9)
            {

              v5 = 0;
              goto LABEL_17;
            }
            v9 = v12;
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
    else
    {
      v9 = 0;
    }

    v9 = v9;
    v5 = v9;
LABEL_17:

  }
  return v5;
}

- (id)setupView
{
  return 0;
}

- (void)didEngageAction:(unint64_t)a3 destination:(unint64_t)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  -[SearchUIAccessoryViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "feedbackDelegate");
  v30 = (id)objc_claimAutoreleasedReturnValue();

  -[SearchUIAccessoryViewController rowModel](self, "rowModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifyingResult");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0)
      goto LABEL_5;
    v12 = objc_alloc(MEMORY[0x1E0D8C628]);
    -[SearchUIAccessoryViewController rowModel](self, "rowModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifyingResult");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v12, "initWithResult:triggerEvent:destination:actionTarget:", v14, 2, a4, a3);

    objc_msgSend(v30, "didEngageResult:", v8);
  }

LABEL_5:
  -[SearchUIAccessoryViewController rowModel](self, "rowModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cardSection");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) == 0)
      goto LABEL_9;
    v19 = objc_alloc(MEMORY[0x1E0D8C220]);
    -[SearchUIAccessoryViewController rowModel](self, "rowModel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "cardSection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v19, "initWithCardSection:destination:triggerEvent:actionCardType:", v21, 0, 2, 0);

    objc_msgSend(v15, "setActionTarget:", a3);
    objc_msgSend(v15, "setQueryId:", -[SearchUIRowModel queryId](self->rowModel, "queryId"));
    objc_msgSend(v30, "didEngageCardSection:", v15);
  }

LABEL_9:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v22 = (void *)objc_opt_new();
    v23 = objc_alloc(MEMORY[0x1E0D8C2A8]);
    -[SearchUIAccessoryViewController rowModel](self, "rowModel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "cardSection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v23, "initWithCommand:cardSection:", v22, v25);

    -[SearchUIAccessoryViewController rowModel](self, "rowModel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setQueryId:", objc_msgSend(v27, "queryId"));

    -[SearchUIAccessoryViewController rowModel](self, "rowModel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "identifyingResult");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setResult:", v29);

    objc_msgSend(v26, "setTriggerEvent:", 2);
    objc_msgSend(v30, "didPerformCommand:", v26);

  }
}

- (void)hide
{
  id v2;

  -[SearchUIAccessoryViewController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 1);

}

- (BOOL)shouldTopAlignForAccessibilityContentSizes
{
  return 0;
}

- (unint64_t)type
{
  return 0;
}

- (BOOL)containsSymbolImage
{
  return 0;
}

- (SearchUIDetailedRowModel)rowModel
{
  return self->rowModel;
}

- (void)setRowModel:(id)a3
{
  objc_storeStrong((id *)&self->rowModel, a3);
}

- (UIView)view
{
  return self->view;
}

- (void)setView:(id)a3
{
  objc_storeStrong((id *)&self->view, a3);
}

- (SearchUIFeedbackDelegate)feedbackDelegate
{
  return (SearchUIFeedbackDelegate *)objc_loadWeakRetained((id *)&self->feedbackDelegate);
}

- (void)setFeedbackDelegate:(id)a3
{
  objc_storeWeak((id *)&self->feedbackDelegate, a3);
}

- (UIControl)control
{
  return self->_control;
}

- (void)setControl:(id)a3
{
  objc_storeStrong((id *)&self->_control, a3);
}

- (SearchUIAccessoryViewDelegate)delegate
{
  return (SearchUIAccessoryViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_control, 0);
  objc_destroyWeak((id *)&self->feedbackDelegate);
  objc_storeStrong((id *)&self->view, 0);
  objc_storeStrong((id *)&self->rowModel, 0);
}

@end
