@implementation PRComplicationContainerViewController

- (PRComplicationContainerViewController)initWithInlineComplicationDescriptor:(id)a3 graphicComplicationDescriptors:(id)a4 graphicComplicationIconLayout:(id)a5 sidebarComplicationDescriptors:(id)a6 sidebarIconLayout:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  PRComplicationContainerViewController *v17;
  PRInlineComplicationContainerViewController *v18;
  PRInlineComplicationContainerViewController *inlineComplicationContainerViewController;
  PRWidgetGridModel *v20;
  PRWidgetGridViewController *v21;
  PRWidgetGridViewController *widgetGridViewController;
  void *v23;
  uint64_t v24;
  PRWidgetGridModel *v25;
  PRWidgetGridViewController *v26;
  PRWidgetGridViewController *sidebarWidgetGridViewController;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)PRComplicationContainerViewController;
  v17 = -[PRComplicationContainerViewController init](&v29, sel_init);
  if (v17)
  {
    v18 = -[PRInlineComplicationContainerViewController initWithComplicationDescriptor:]([PRInlineComplicationContainerViewController alloc], "initWithComplicationDescriptor:", v12);
    inlineComplicationContainerViewController = v17->_inlineComplicationContainerViewController;
    v17->_inlineComplicationContainerViewController = v18;

    -[PRInlineComplicationContainerViewController setDelegate:](v17->_inlineComplicationContainerViewController, "setDelegate:", v17);
    v20 = -[PRWidgetGridModel initWithComplicationDescriptors:iconLayout:type:]([PRWidgetGridModel alloc], "initWithComplicationDescriptors:iconLayout:type:", v13, v14, 0);
    -[PRWidgetGridModel setDelegate:](v20, "setDelegate:", v17);
    v21 = -[PRWidgetGridViewController initWithModel:iconViewProvider:]([PRWidgetGridViewController alloc], "initWithModel:iconViewProvider:", v20, 0);
    widgetGridViewController = v17->_widgetGridViewController;
    v17->_widgetGridViewController = v21;

    -[PRWidgetGridViewController setRequiresFocusForLaunchRequests:](v17->_widgetGridViewController, "setRequiresFocusForLaunchRequests:", 1);
    -[PRWidgetGridViewController setDelegate:](v17->_widgetGridViewController, "setDelegate:", v17);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "userInterfaceIdiom");

    if ((v24 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v25 = -[PRWidgetGridModel initWithComplicationDescriptors:iconLayout:type:]([PRWidgetGridModel alloc], "initWithComplicationDescriptors:iconLayout:type:", v15, v16, 1);
      -[PRWidgetGridModel setDelegate:](v25, "setDelegate:", v17);
      v26 = -[PRWidgetGridViewController initWithModel:iconViewProvider:]([PRWidgetGridViewController alloc], "initWithModel:iconViewProvider:", v25, 0);
      sidebarWidgetGridViewController = v17->_sidebarWidgetGridViewController;
      v17->_sidebarWidgetGridViewController = v26;

      -[PRWidgetGridViewController setRequiresFocusForLaunchRequests:](v17->_sidebarWidgetGridViewController, "setRequiresFocusForLaunchRequests:", 1);
      -[PRWidgetGridViewController setDelegate:](v17->_sidebarWidgetGridViewController, "setDelegate:", v17);

    }
  }

  return v17;
}

- (void)invalidate
{
  -[PRInlineComplicationContainerViewController invalidate](self->_inlineComplicationContainerViewController, "invalidate");
  -[PRWidgetGridViewController invalidate](self->_widgetGridViewController, "invalidate");
  -[PRWidgetGridViewController invalidate](self->_sidebarWidgetGridViewController, "invalidate");
}

- (void)loadView
{
  PRSubviewHitTestingView *v3;

  v3 = objc_alloc_init(PRSubviewHitTestingView);
  -[PRComplicationContainerViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRComplicationContainerViewController;
  -[PRComplicationContainerViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PRComplicationContainerViewController bs_addChildViewController:](self, "bs_addChildViewController:", self->_inlineComplicationContainerViewController);
  -[PRComplicationContainerViewController bs_addChildViewController:](self, "bs_addChildViewController:", self->_widgetGridViewController);
  -[PRComplicationContainerViewController bs_addChildViewController:](self, "bs_addChildViewController:", self->_sidebarWidgetGridViewController);
}

- (void)viewDidLayoutSubviews
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
  PREditorElementLayoutController *v12;
  PREditorElementLayoutController *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  objc_super v58;

  v58.receiver = self;
  v58.super_class = (Class)PRComplicationContainerViewController;
  -[PRComplicationContainerViewController viewDidLayoutSubviews](&v58, sel_viewDidLayoutSubviews);
  -[PRComplicationContainerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = -[PREditorElementLayoutController initWithTraitEnvironment:]([PREditorElementLayoutController alloc], "initWithTraitEnvironment:", self);
  v13 = v12;
  if (self->_usesEditingLayout)
  {
    -[PREditorElementLayoutController frameForElements:variant:withBoundingRect:](v12, "frameForElements:variant:withBoundingRect:", 4, 2, v5, v7, v9, v11);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    -[PREditorElementLayoutController frameForElements:variant:withBoundingRect:](v13, "frameForElements:variant:withBoundingRect:", 8, 2, v5, v7, v9, v11);
    v56 = v23;
    v57 = v22;
    v54 = v25;
    v55 = v24;
    -[PREditorElementLayoutController frameForElements:variant:withBoundingRect:](v13, "frameForElements:variant:withBoundingRect:", 16, 2, v5, v7, v9, v11);
  }
  else
  {
    -[PREditorElementLayoutController frameForElements:withBoundingRect:](v12, "frameForElements:withBoundingRect:", 4, v5, v7, v9, v11);
    v15 = v30;
    v17 = v31;
    v19 = v32;
    v21 = v33;
    -[PREditorElementLayoutController frameForElements:withBoundingRect:](v13, "frameForElements:withBoundingRect:", 8, v5, v7, v9, v11);
    v56 = v35;
    v57 = v34;
    v54 = v37;
    v55 = v36;
    -[PREditorElementLayoutController frameForElements:withBoundingRect:](v13, "frameForElements:withBoundingRect:", 16, v5, v7, v9, v11);
  }
  v38 = v26;
  v39 = v27;
  v40 = v28;
  v41 = v29;
  -[PRInlineComplicationContainerViewController view](self->_inlineComplicationContainerViewController, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setFrame:", v15, v17, v19, v21);

  v43 = (void *)MEMORY[0x1E0CB3940];
  -[PRComplicationContainerViewController inlineComplicationDescriptor](self, "inlineComplicationDescriptor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "widget");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "extensionBundleIdentifier");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRComplicationContainerViewController inlineComplicationDescriptor](self, "inlineComplicationDescriptor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "widget");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "kind");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "stringWithFormat:", CFSTR("%@:%@"), v46, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRInlineComplicationContainerViewController view](self->_inlineComplicationContainerViewController, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setAccessibilityIdentifier:", v50);

  -[PRWidgetGridViewController view](self->_widgetGridViewController, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setFrame:", v57, v56, v55, v54);

  -[PRWidgetGridViewController view](self->_sidebarWidgetGridViewController, "view");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setFrame:", v38, v39, v40, v41);

}

- (PRComplicationDescriptor)inlineComplicationDescriptor
{
  return -[PRInlineComplicationContainerViewController complicationDescriptor](self->_inlineComplicationContainerViewController, "complicationDescriptor");
}

- (void)setInlineComplicationDescriptor:(id)a3
{
  -[PRInlineComplicationContainerViewController setComplicationDescriptor:](self->_inlineComplicationContainerViewController, "setComplicationDescriptor:", a3);
}

- (void)setUsesEditingLayout:(BOOL)a3
{
  -[PRComplicationContainerViewController setUsesEditingLayout:animationSettings:](self, "setUsesEditingLayout:animationSettings:", a3, 0);
}

- (void)setUsesEditingLayout:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  id v7;

  v4 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.25);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = (id)v6;
  -[PRComplicationContainerViewController setUsesEditingLayout:animationSettings:](self, "setUsesEditingLayout:animationSettings:", v4, v6);

}

- (void)setUsesEditingLayout:(BOOL)a3 animationSettings:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v6 = a4;
  if (self->_usesEditingLayout != v4)
  {
    v10 = v6;
    self->_usesEditingLayout = v4;
    -[PRComplicationContainerViewController viewIfLoaded](self, "viewIfLoaded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = (void *)MEMORY[0x1E0D01908];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __80__PRComplicationContainerViewController_setUsesEditingLayout_animationSettings___block_invoke;
      v11[3] = &unk_1E2184010;
      v12 = v7;
      objc_msgSend(v9, "animateWithSettings:actions:", v10, v11);

    }
    v6 = v10;
  }

}

uint64_t __80__PRComplicationContainerViewController_setUsesEditingLayout_animationSettings___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setFocusedElement:(int64_t)a3
{
  -[PRComplicationContainerViewController setFocusedElement:animationSettings:](self, "setFocusedElement:animationSettings:", a3, 0);
}

- (void)setFocusedElement:(int64_t)a3 animated:(BOOL)a4
{
  uint64_t v6;
  id v7;

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.3);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = (id)v6;
  -[PRComplicationContainerViewController setFocusedElement:animationSettings:](self, "setFocusedElement:animationSettings:", a3, v6);

}

- (void)setFocusedElement:(int64_t)a3 animationSettings:(id)a4
{
  if (self->_focusedElement != a3)
  {
    self->_focusedElement = a3;
    -[PRComplicationContainerViewController _updateFocusedWithAnimationSettings:](self, "_updateFocusedWithAnimationSettings:", a4);
  }
}

- (void)setVibrancyConfiguration:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_vibrancyConfiguration, a3);
  v5 = a3;
  -[PRWidgetGridViewController setVibrancyConfiguration:](self->_widgetGridViewController, "setVibrancyConfiguration:", v5);
  -[PRWidgetGridViewController setVibrancyConfiguration:](self->_sidebarWidgetGridViewController, "setVibrancyConfiguration:", v5);
  -[PRInlineComplicationContainerViewController setVibrancyConfiguration:](self->_inlineComplicationContainerViewController, "setVibrancyConfiguration:", v5);

}

- (void)_updateFocusedWithAnimationSettings:(id)a3
{
  PRInlineComplicationContainerViewController *inlineComplicationContainerViewController;
  _BOOL8 v5;
  id v6;

  inlineComplicationContainerViewController = self->_inlineComplicationContainerViewController;
  v5 = self->_focusedElement == 1;
  v6 = a3;
  -[PRInlineComplicationContainerViewController setFocused:animationSettings:](inlineComplicationContainerViewController, "setFocused:animationSettings:", v5, v6);
  -[PRWidgetGridViewController setFocused:animationSettings:](self->_sidebarWidgetGridViewController, "setFocused:animationSettings:", self->_focusedElement == 3, v6);
  -[PRWidgetGridViewController setFocused:animationSettings:](self->_widgetGridViewController, "setFocused:animationSettings:", self->_focusedElement == 2, v6);

}

- (void)inlineComplicationContainerViewControllerDidTapAdd:(id)a3
{
  id v4;

  -[PRComplicationContainerViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "complicationContainerViewControllerDidTapInlineGallery:", self);

}

- (void)inlineComplicationContainerViewController:(id)a3 didEditComplication:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PRComplicationContainerViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "complicationContainerViewController:didEditComplication:", self, v5);

}

- (void)widgetGridModelDidUpdateContent:(id)a3
{
  PRWidgetGridViewController *sidebarWidgetGridViewController;
  id v5;
  id v6;
  id v7;

  sidebarWidgetGridViewController = self->_sidebarWidgetGridViewController;
  v5 = a3;
  -[PRWidgetGridViewController model](sidebarWidgetGridViewController, "model");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[PRComplicationContainerViewController delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "complicationContainerViewController:didUpdateModelContentForLocation:", self, v6 == v5);

}

- (void)widgetGridViewController:(id)a3 didRequestConfigurationForComplicationDescriptor:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PRComplicationContainerViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "complicationContainerViewController:didEditComplication:", self, v5);

}

- (void)widgetGridViewControllerDidTapBackground:(id)a3
{
  id v4;
  int64_t v5;
  id v6;

  v4 = a3;
  -[PRComplicationContainerViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[PRComplicationContainerViewController _locationForViewController:](self, "_locationForViewController:", v4);

  objc_msgSend(v6, "complicationContainerViewControllerDidTapAdd:forLocation:", self, v5);
}

- (void)widgetGridViewController:(id)a3 isAttemptingDragToAddComplication:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PRComplicationContainerViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "complicationContainerViewController:isAttemptingDragToAddComplication:", self, v5);

}

- (int64_t)_locationForViewController:(id)a3
{
  return self->_sidebarWidgetGridViewController == a3;
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  return self->_vibrancyConfiguration;
}

- (PRInlineComplicationContainerViewController)inlineComplicationContainerViewController
{
  return self->_inlineComplicationContainerViewController;
}

- (void)setInlineComplicationContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_inlineComplicationContainerViewController, a3);
}

- (PRWidgetGridViewController)widgetGridViewController
{
  return self->_widgetGridViewController;
}

- (void)setWidgetGridViewController:(id)a3
{
  objc_storeStrong((id *)&self->_widgetGridViewController, a3);
}

- (PRWidgetGridViewController)sidebarWidgetGridViewController
{
  return self->_sidebarWidgetGridViewController;
}

- (void)setSidebarWidgetGridViewController:(id)a3
{
  objc_storeStrong((id *)&self->_sidebarWidgetGridViewController, a3);
}

- (PRComplicationContainerViewControllerDelegate)delegate
{
  return (PRComplicationContainerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)usesEditingLayout
{
  return self->_usesEditingLayout;
}

- (int64_t)focusedElement
{
  return self->_focusedElement;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sidebarWidgetGridViewController, 0);
  objc_storeStrong((id *)&self->_widgetGridViewController, 0);
  objc_storeStrong((id *)&self->_inlineComplicationContainerViewController, 0);
  objc_storeStrong((id *)&self->_vibrancyConfiguration, 0);
}

@end
