@implementation BSUIBooksUIComponentView

+ (id)renderModelWithIdentifier:(id)a3 rawComponentModel:(id)a4
{
  id v5;
  id v6;
  _BSUIRenderModelBooksUIComponent *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  v7 = -[_BSUIRenderModelBooksUIComponent initWithRawComponentModel:identifier:]([_BSUIRenderModelBooksUIComponent alloc], "initWithRawComponentModel:identifier:", v5, v6);

  v8 = objc_msgSend(objc_alloc((Class)TUIRenderModelView), "initWithReuseIdentifier:identifier:submodel:", CFSTR("BSUIReuseIdentifierBooksUIComponentView"), v6, v7);
  return v8;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BSUIBooksUIComponentView;
  v4 = a3;
  -[BSUIBooksUIComponentView applyLayoutAttributes:](&v7, "applyLayoutAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderModel", v7.receiver, v7.super_class));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "submodel"));
  -[BSUIBooksUIComponentView _configureWithModel:](self, "_configureWithModel:", v6);

}

- (void)_configureWithModel:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToRenderModel:", self->_renderModel) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_renderModel, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rawComponentModel"));
    objc_msgSend(v6, "size");
    -[BSUIBooksUIComponentView _configureHostingControllerWithRawComponentModel:size:](self, "_configureHostingControllerWithRawComponentModel:size:", v5);

  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BSUIBooksUIComponentView;
  -[BSUIBooksUIComponentView layoutSubviews](&v13, "layoutSubviews");
  -[BSUIBooksUIComponentView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIBooksUIComponentView hostingViewController](self, "hostingViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

}

- (void)_configureHostingControllerWithRawComponentModel:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (!self->_hostingViewController)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BSUIBooksUIComponentHostingControllerFactory create](BSUIBooksUIComponentHostingControllerFactory, "create"));
    -[BSUIBooksUIComponentView setHostingViewController:](self, "setHostingViewController:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIBooksUIComponentView feedControllerHost](self, "feedControllerHost"));
    objc_msgSend(v9, "addChildViewController:", self->_hostingViewController);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIBooksUIComponentView hostingViewController](self, "hostingViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
    -[BSUIBooksUIComponentView addSubview:](self, "addSubview:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIBooksUIComponentView feedControllerHost](self, "feedControllerHost"));
    objc_msgSend(v12, "didAddChildViewController:", self->_hostingViewController);

  }
  v14 = (id)objc_claimAutoreleasedReturnValue(-[BSUIBooksUIComponentView hostingViewController](self, "hostingViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIBooksUIComponentView feedControllerHost](self, "feedControllerHost"));
  objc_msgSend(v14, "updateWithRawComponentModel:size:feedControllerHost:", v7, v13, width, height);

}

- (BSUIBooksUIComponentHostingController)hostingViewController
{
  return self->_hostingViewController;
}

- (void)setHostingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_hostingViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostingViewController, 0);
  objc_storeStrong((id *)&self->_renderModel, 0);
}

@end
