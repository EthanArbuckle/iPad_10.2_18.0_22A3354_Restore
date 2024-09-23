@implementation VideosExtrasStackCollectionCell

- (void)willMoveToSuperview:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasStackCollectionCell;
  -[VideosExtrasStackCollectionCell willMoveToSuperview:](&v4, sel_willMoveToSuperview_, a3);
  if (self->_needsViewWillAppear)
  {
    -[VideosExtrasGridElementViewController viewWillAppear:](self->_viewController, "viewWillAppear:", 0);
    self->_needsViewWillAppear = 0;
  }
}

- (void)setViewController:(id)a3
{
  VideosExtrasGridElementViewController *v5;
  id *p_viewController;
  VideosExtrasGridElementViewController *viewController;
  void *v8;
  VideosExtrasStackCollectionCell *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSArray *fitConstraints;
  void *v17;
  VideosExtrasGridElementViewController *v18;

  v5 = (VideosExtrasGridElementViewController *)a3;
  p_viewController = (id *)&self->_viewController;
  viewController = self->_viewController;
  v18 = v5;
  if (viewController != v5)
  {
    if (self->_fitConstraints)
    {
      objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
      viewController = (VideosExtrasGridElementViewController *)*p_viewController;
    }
    -[VideosExtrasGridElementViewController view](viewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "superview");
    v9 = (VideosExtrasStackCollectionCell *)objc_claimAutoreleasedReturnValue();

    if (v9 == self)
    {
      objc_msgSend(*p_viewController, "willMoveToParentViewController:", 0);
      objc_msgSend(*p_viewController, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeFromSuperview");

      objc_msgSend(*p_viewController, "removeFromParentViewController");
    }
    if (v18)
    {
      -[VideosExtrasStackCollectionCell superview](self, "superview");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        self->_needsViewWillAppear = 1;
      -[VideosExtrasStackCollectionCell parentViewController](self, "parentViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addChildViewController:", v18);

      -[VideosExtrasGridElementViewController view](v18, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VideosExtrasStackCollectionCell contentView](self, "contentView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addSubview:", v13);
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", v13, v14, 15, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
      v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
      fitConstraints = self->_fitConstraints;
      self->_fitConstraints = v15;

      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_fitConstraints);
      -[VideosExtrasStackCollectionCell parentViewController](self, "parentViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[VideosExtrasGridElementViewController didMoveToParentViewController:](v18, "didMoveToParentViewController:", v17);

    }
    else
    {
      v13 = self->_fitConstraints;
      self->_fitConstraints = 0;
    }

    objc_storeStrong(p_viewController, a3);
  }

}

- (VideosExtrasStackTemplateViewController)parentViewController
{
  return self->_parentViewController;
}

- (void)setParentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_parentViewController, a3);
}

- (VideosExtrasGridElementViewController)viewController
{
  return self->_viewController;
}

- (VideosExtrasGridSectionHeaderStyle)sectionStyle
{
  return self->_sectionStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionStyle, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_parentViewController, 0);
  objc_storeStrong((id *)&self->_fitConstraints, 0);
}

@end
