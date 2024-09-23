@implementation WFCompactPreviewThumbnailViewController

- (WFCompactPreviewThumbnailViewController)initWithContentItem:(id)a3
{
  id v5;
  WFCompactPreviewThumbnailViewController *v6;
  WFCompactPreviewThumbnailViewController *v7;
  WFCompactPreviewThumbnailViewController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFCompactPreviewThumbnailViewController;
  v6 = -[WFCompactPreviewThumbnailViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentItem, a3);
    v8 = v7;
  }

  return v7;
}

- (unint64_t)preferredContentMode
{
  return 1;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WFCompactPreviewThumbnailViewController;
  -[WFCompactPreviewThumbnailViewController loadView](&v12, sel_loadView);
  -[WFCompactPreviewThumbnailViewController contentItem](self, "contentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generatePagePreviewUIView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFCompactPreviewThumbnailViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  -[WFCompactPreviewThumbnailViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v4, "setFrame:", 0.0, 0.0, v7, v9 + -100.0);

  objc_msgSend(v4, "setAutoresizingMask:", 18);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v10);

  -[WFCompactPreviewThumbnailViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v4);

  -[WFCompactPreviewThumbnailViewController setHostedView:](self, "setHostedView:", v4);
}

- (double)contentHeightForWidth:(double)a3
{
  void *v5;
  double v6;
  double v7;

  -[WFCompactPreviewThumbnailViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[WFCompactPreviewThumbnailViewController hostedView](self, "hostedView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", a3, 1.79769313e308);
  v7 = v6;

  return v7;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFCompactPreviewThumbnailViewController;
  v4 = a3;
  -[WFCompactPreviewThumbnailViewController traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[WFCompactPreviewThumbnailViewController traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
    -[WFCompactThumbnailViewController invalidateContentSize](self, "invalidateContentSize");
}

- (WFContentItem)contentItem
{
  return self->_contentItem;
}

- (UIView)hostedView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_hostedView);
}

- (void)setHostedView:(id)a3
{
  objc_storeWeak((id *)&self->_hostedView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostedView);
  objc_storeStrong((id *)&self->_contentItem, 0);
}

@end
