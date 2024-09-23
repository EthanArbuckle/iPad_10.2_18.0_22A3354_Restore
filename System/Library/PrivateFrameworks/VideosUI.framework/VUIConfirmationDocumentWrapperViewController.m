@implementation VUIConfirmationDocumentWrapperViewController

- (void)vui_loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VUIConfirmationDocumentWrapperViewController;
  -[VUIConfirmationDocumentWrapperViewController vui_loadView](&v7, sel_vui_loadView);
  -[VUIConfirmationDocumentWrapperViewController vuiView](self, "vuiView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVuiBackgroundColor:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_tapped);
  -[VUIConfirmationDocumentWrapperViewController vuiView](self, "vuiView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addGestureRecognizer:", v5);

  objc_msgSend(v5, "setDelegate:", self);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a4, "view", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIConfirmationDocumentWrapperViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v5 == v6;

  return (char)self;
}

- (void)tapped
{
  -[VUIConfirmationDocumentWrapperViewController vui_dismissViewControllerAnimated:completion:](self, "vui_dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)vui_viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  VUIConfirmationDocumentWrapperViewController *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  void *v31;
  double v32;
  double v33;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)VUIConfirmationDocumentWrapperViewController;
  -[VUIConfirmationDocumentWrapperViewController vui_viewDidLayoutSubviews](&v35, sel_vui_viewDidLayoutSubviews);
  -[VUIConfirmationDocumentWrapperViewController vuiChildViewControllers](self, "vuiChildViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "vuiView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIConfirmationDocumentWrapperViewController vuiView](self, "vuiView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = self;
  -[VUIConfirmationDocumentWrapperViewController preferredContentSize](v15, "preferredContentSize");
  v18 = v17;
  v19 = v16;
  v20 = *MEMORY[0x1E0C9D820];
  v21 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (*MEMORY[0x1E0C9D820] != v17 || v21 != v16)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[VUIConfirmationDocumentWrapperViewController topViewController](v15, "topViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v24;
  }
  else
  {
    -[VUIConfirmationDocumentWrapperViewController vuiChildViewControllers](v15, "vuiChildViewControllers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (!v26)
    {
LABEL_5:
      v23 = 0;
      goto LABEL_11;
    }
    -[VUIConfirmationDocumentWrapperViewController vuiChildViewControllers](v15, "vuiChildViewControllers");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "lastObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v23;
  }
  objc_msgSend(v24, "vuiPreferredContentSize");
  v18 = v28;
  v19 = v29;
LABEL_11:
  if (v20 == v18 && v21 == v19)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v23, "templateViewController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "preferredContentSize");
      v18 = v32;
      v19 = v33;

    }
  }
  if (v20 == v18 && v21 == v19)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v14;
      v18 = v12;
    }
  }
  -[VUIConfirmationDocumentWrapperViewController setVuiPreferredContentSize:](v15, "setVuiPreferredContentSize:", v18, v19);
  objc_msgSend(v5, "setFrame:", round(v8 + (v12 - v18) * 0.5), round(v10 + (v14 - v19) * 0.5), v18, v19);

}

@end
