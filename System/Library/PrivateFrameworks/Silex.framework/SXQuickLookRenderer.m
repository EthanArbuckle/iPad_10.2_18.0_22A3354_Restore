@implementation SXQuickLookRenderer

- (SXQuickLookRenderer)initWithStyler:(id)a3
{
  id v5;
  SXQuickLookRenderer *v6;
  SXQuickLookRenderer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXQuickLookRenderer;
  v6 = -[SXQuickLookRenderer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_styler, a3);

  return v7;
}

- (void)render:(id)a3 attributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "thumbnailControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "thumbnailFrame");
  objc_msgSend(v8, "setFrame:");

  objc_msgSend(v7, "thumbnailImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "thumbnailFrame");
  objc_msgSend(v9, "setFrame:");

  objc_msgSend(v7, "errorLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorLabelFrame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  objc_msgSend(v10, "setFrame:", v12, v14, v16, v18);
  -[SXQuickLookRenderer styler](self, "styler");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "styleViewController:", v7);

}

- (void)renderThumbnailImage:(id)a3 view:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend(v5, "setImage:forState:", a3, 0);
  objc_msgSend(v5, "setContentMode:", 1);

}

- (void)renderErrorMessage:(id)a3 view:(id)a4
{
  objc_msgSend(a4, "setText:", a3);
}

- (SXQuickLookStyler)styler
{
  return self->_styler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styler, 0);
}

@end
