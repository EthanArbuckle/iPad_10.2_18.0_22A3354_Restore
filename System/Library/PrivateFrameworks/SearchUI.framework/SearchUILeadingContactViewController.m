@implementation SearchUILeadingContactViewController

+ (BOOL)supportsRowModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(v3, "leadingImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "leadingImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "threeDTouchEnabled");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)hide
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SearchUILeadingContactViewController;
  -[SearchUILeadingViewController hide](&v4, sel_hide);
  -[SearchUILeadingContactViewController avatarView](self, "avatarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setThreeDTouchEnabled:", 0);

}

- (id)setupView
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setDelegate:", self);
  -[SearchUILeadingContactViewController setAvatarView:](self, "setAvatarView:", v3);
  v4 = objc_alloc(MEMORY[0x1E0CFAA98]);
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArrangedSubviews:", v5);

  return v6;
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SearchUILeadingContactViewController;
  -[SearchUILeadingViewController updateWithRowModel:](&v21, sel_updateWithRowModel_, v4);
  -[SearchUILeadingContactViewController avatarView](self, "avatarView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithRowModel:", v4);

  objc_msgSend(v4, "leadingImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appIconBadgeBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "badgingImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(v4, "useCompactVersionOfUI");
      v7 = 0;
      v11 = 1;
      goto LABEL_10;
    }
    objc_msgSend(v6, "badgingImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11 = 1;
  if ((objc_msgSend(v4, "useCompactVersionOfUI") & 1) == 0 && v7)
  {
    -[SearchUILeadingContactViewController appIconBadgeView](self, "appIconBadgeView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v13 = (void *)objc_opt_new();
      objc_msgSend(v13, "setUserInteractionEnabled:", 0);
      -[SearchUILeadingViewController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addArrangedSubview:", v13);

      -[SearchUILeadingViewController view](self, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAlignment:forView:inAxis:", 4, v13, 1);

      -[SearchUILeadingViewController view](self, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAlignment:forView:inAxis:", 4, v13, 0);

      -[SearchUILeadingViewController view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setPositionAdjustmentOffset:forView:", v13, *MEMORY[0x1E0DBDA68], *MEMORY[0x1E0DBDA68]);

      -[SearchUILeadingContactViewController setAppIconBadgeView:](self, "setAppIconBadgeView:", v13);
    }
    +[SearchUIAppIconImage appIconForBundleIdentifier:variant:](SearchUIAppIconImage, "appIconForBundleIdentifier:variant:", v7, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUILeadingContactViewController appIconBadgeView](self, "appIconBadgeView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updateWithImage:", v18);

    v11 = 0;
  }
LABEL_10:
  -[SearchUILeadingContactViewController appIconBadgeView](self, "appIconBadgeView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setHidden:", v11);

}

- (void)setUsesCompactWidth:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (-[SearchUILeadingViewController usesCompactWidth](self, "usesCompactWidth") != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)SearchUILeadingContactViewController;
    -[SearchUILeadingViewController setUsesCompactWidth:](&v6, sel_setUsesCompactWidth_, v3);
    -[SearchUILeadingContactViewController avatarView](self, "avatarView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUsesCompactWidth:", v3);

  }
}

- (id)presentingViewControllerForAvatarView:(id)a3
{
  return 0;
}

- (void)willBeginPreviewInteractionForAvatarView:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  -[SearchUILeadingViewController feedbackDelegate](self, "feedbackDelegate", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUILeadingViewController rowModel](self, "rowModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifyingResult");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_4;
  v6 = (void *)v5;
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_alloc(MEMORY[0x1E0D8C628]);
    -[SearchUILeadingViewController rowModel](self, "rowModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifyingResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v8, "initWithResult:triggerEvent:destination:actionTarget:", v10, 5, 1, 0);

    objc_msgSend(v11, "didEngageResult:", v4);
LABEL_4:

  }
}

- (BOOL)shouldVerticallyCenter
{
  void *v2;
  char v3;

  -[SearchUILeadingViewController rowModel](self, "rowModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "useCompactVersionOfUI");

  return v3;
}

- (unint64_t)type
{
  return 3;
}

- (SearchUIContactsThumbnailView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (SearchUIImageView)appIconBadgeView
{
  return self->_appIconBadgeView;
}

- (void)setAppIconBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_appIconBadgeView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIconBadgeView, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end
