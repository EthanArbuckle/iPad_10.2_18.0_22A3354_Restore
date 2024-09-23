@implementation SearchUILeadingViewController

+ (Class)leadingViewClassForRowModel:(id)a3
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
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)leadingViewClassForRowModel__classes;
  if (!leadingViewClassForRowModel__classes)
  {
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v18[2] = objc_opt_class();
    v18[3] = objc_opt_class();
    v18[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 5);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)leadingViewClassForRowModel__classes;
    leadingViewClassForRowModel__classes = v5;

    v4 = (void *)leadingViewClassForRowModel__classes;
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

- (SearchUILeadingViewController)init
{
  SearchUILeadingViewController *v2;
  SearchUILeadingViewController *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUILeadingViewController;
  v2 = -[SearchUILeadingViewController init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SearchUILeadingViewController setupView](v2, "setupView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUILeadingViewController setView:](v3, "setView:", v4);

  }
  return v3;
}

+ (BOOL)supportsRowModel:(id)a3
{
  NSLog(CFSTR("ERROR subclass must implement this"), a2, a3);
  return 0;
}

- (void)hide
{
  id v2;

  -[SearchUILeadingViewController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 1);

}

- (BOOL)shouldVerticallyCenter
{
  return 0;
}

- (BOOL)shouldCenterAlignToTitle
{
  return 0;
}

- (id)setupView
{
  return 0;
}

- (unint64_t)type
{
  return 0;
}

- (id)imageView
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

- (SearchUIFeedbackDelegate)feedbackDelegate
{
  return (SearchUIFeedbackDelegate *)objc_loadWeakRetained((id *)&self->feedbackDelegate);
}

- (void)setFeedbackDelegate:(id)a3
{
  objc_storeWeak((id *)&self->feedbackDelegate, a3);
}

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
  objc_storeStrong((id *)&self->_view, a3);
}

- (BOOL)usesCompactWidth
{
  return self->_usesCompactWidth;
}

- (void)setUsesCompactWidth:(BOOL)a3
{
  self->_usesCompactWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_destroyWeak((id *)&self->feedbackDelegate);
  objc_storeStrong((id *)&self->rowModel, 0);
}

@end
