@implementation SearchUILeadingHomeScreenViewController

+ (BOOL)supportsRowModel:(id)a3
{
  id v3;
  int v4;
  void *v5;
  void *v6;

  v3 = a3;
  if ((objc_msgSend(v3, "isLocalApplicationResult") & 1) != 0)
  {
    v4 = objc_msgSend(v3, "useCompactVersionOfUI") ^ 1;
  }
  else
  {
    objc_msgSend(v3, "cardSection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "command");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = objc_msgSend(v3, "useCompactVersionOfUI") ^ 1;
    else
      LOBYTE(v4) = 0;

  }
  return v4;
}

- (id)setupView
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setAllowsLabelArea:", 0);
  -[SearchUILeadingViewController feedbackDelegate](self, "feedbackDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFeedbackDelegate:", v4);

  objc_msgSend(v3, "setEngagementDelegate:", self);
  objc_msgSend(v3, "setVariant:", 4);
  +[SearchUIAppIconImage sizeForVariant:](SearchUIAppIconImage, "sizeForVariant:", objc_msgSend(v3, "variant"));
  objc_msgSend(v3, "setMaximumLayoutSize:");
  +[SearchUIAutoLayout requireIntrinsicSizeForView:](SearchUIAutoLayout, "requireIntrinsicSizeForView:", v3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_deleteIcon_, *MEMORY[0x1E0DAAA20], 0);

  return v3;
}

- (void)setFeedbackDelegate:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUILeadingHomeScreenViewController;
  v4 = a3;
  -[SearchUILeadingViewController setFeedbackDelegate:](&v6, sel_setFeedbackDelegate_, v4);
  -[SearchUILeadingViewController view](self, "view", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFeedbackDelegate:", v4);

}

- (void)deleteIcon:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  id v9;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DAABC0]);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[SearchUILeadingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "icon");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 != v9)
    goto LABEL_4;
  -[SearchUILeadingViewController feedbackDelegate](self, "feedbackDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SearchUILeadingViewController feedbackDelegate](self, "feedbackDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUILeadingViewController rowModel](self, "rowModel");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeRowModel:completion:", v6, 0);
LABEL_4:

  }
}

- (BOOL)shouldVerticallyCenter
{
  return 0;
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUILeadingHomeScreenViewController;
  v4 = a3;
  -[SearchUILeadingViewController updateWithRowModel:](&v6, sel_updateWithRowModel_, v4);
  -[SearchUILeadingViewController view](self, "view", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithRowModel:", v4);

}

- (unint64_t)type
{
  return 2;
}

@end
