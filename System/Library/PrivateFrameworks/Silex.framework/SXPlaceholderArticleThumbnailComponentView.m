@implementation SXPlaceholderArticleThumbnailComponentView

- (SXPlaceholderArticleThumbnailComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6
{
  SXPlaceholderArticleThumbnailComponentView *v6;
  UILabel *v7;
  UILabel *label;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SXPlaceholderArticleThumbnailComponentView;
  v6 = -[SXComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:](&v11, sel_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_, a3, a4, a5, a6);
  if (v6)
  {
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    label = v6->_label;
    v6->_label = v7;

    -[UILabel setNumberOfLines:](v6->_label, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v6->_label, "setTextAlignment:", 1);
    -[SXComponentView contentView](v6, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v6->_label);

  }
  return v6;
}

- (void)loadComponent:(id)a3
{
  id v4;
  UILabel *label;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SXPlaceholderArticleThumbnailComponentView;
  v4 = a3;
  -[SXComponentView loadComponent:](&v7, sel_loadComponent_, v4);
  label = self->_label;
  objc_msgSend(v4, "identifier", v7.receiver, v7.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel setText:](label, "setText:", v6);
}

- (void)layoutSubviews
{
  UILabel *label;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SXPlaceholderArticleThumbnailComponentView;
  -[SXPlaceholderArticleThumbnailComponentView layoutSubviews](&v4, sel_layoutSubviews);
  label = self->_label;
  -[SXPlaceholderArticleThumbnailComponentView bounds](self, "bounds");
  -[UILabel setFrame:](label, "setFrame:");
}

- (UILabel)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
