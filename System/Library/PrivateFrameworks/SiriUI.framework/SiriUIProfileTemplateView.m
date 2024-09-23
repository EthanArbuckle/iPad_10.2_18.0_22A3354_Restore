@implementation SiriUIProfileTemplateView

- (SiriUIProfileTemplateView)initWithDataSource:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriUIProfileTemplateView;
  return -[SiriUILabelStackTemplateView initWithDataSource:](&v4, sel_initWithDataSource_, a3);
}

- (void)layoutImage
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  id v9;
  UIImageView *v10;
  UIImageView *imageView;
  id v12;
  id v13;
  void *v14;
  void *v15;
  UIImageView *v16;
  void *v17;
  uint64_t v18;
  UIImageView *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id location;

  -[SiriUIBaseTemplateView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageURI");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v3, "imageURI");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      if (objc_msgSend(v3, "imageStyleValue"))
        v8 = 60.0;
      else
        v8 = 40.0;
      v9 = objc_alloc(MEMORY[0x24BDF6AE8]);
      v10 = (UIImageView *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      imageView = self->_imageView;
      self->_imageView = v10;

      v12 = (id)-[UIImageView siriui_addHeightConstraint:](self->_imageView, "siriui_addHeightConstraint:", v8);
      v13 = (id)-[UIImageView siriui_addWidthConstraint:](self->_imageView, "siriui_addWidthConstraint:", v8);
      -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 2);
      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIImageView layer](self->_imageView, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCornerRadius:", v8 * 0.5);

      -[UIImageView setClipsToBounds:](self->_imageView, "setClipsToBounds:", 1);
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBAEB8]), "initWithStyle:diameter:", 0, v8);
      v16 = self->_imageView;
      objc_msgSend(v15, "silhouetteMonogram");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](v16, "setImage:", v17);

      v18 = objc_msgSend(v3, "alignmentValue");
      v19 = self->_imageView;
      if (v18 == 1)
      {
        -[SiriUILabelStackTemplateView insertTopView:](self, "insertTopView:", self->_imageView);
        v20 = (id)-[UIImageView siriui_centerHorizontallyWithItem:withMargin:](self->_imageView, "siriui_centerHorizontallyWithItem:withMargin:", self, 0.0);
      }
      else
      {
        -[SiriUIBaseTemplateView templatedSuperview](self, "templatedSuperview");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "templatedContentMargins");
        -[SiriUILabelStackTemplateView insertLeadingView:withMargins:](self, "insertLeadingView:withMargins:", v19);

      }
      -[SiriUIProfileTemplateView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
      objc_initWeak(&location, self);
      -[SiriUIProfileTemplateView traitCollection](self, "traitCollection");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __40__SiriUIProfileTemplateView_layoutImage__block_invoke;
      v23[3] = &unk_24D7D9688;
      objc_copyWeak(&v24, &location);
      objc_msgSend(v3, "fetchUIImageForTraitCollection:completion:", v22, v23);

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);

    }
  }

}

void __40__SiriUIProfileTemplateView_layoutImage__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (v4 && WeakRetained)
    objc_msgSend(WeakRetained[68], "setImage:", v4);

}

- (void)reloadData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SiriUIProfileTemplateView;
  -[SiriUILabelStackTemplateView reloadData](&v3, sel_reloadData);
  -[SiriUIProfileTemplateView layoutImage](self, "layoutImage");
  -[SiriUIProfileTemplateView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (int64_t)layoutStyle
{
  void *v2;
  uint64_t v3;

  -[SiriUIBaseTemplateView dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "alignmentValue");

  if (v3 == 1)
    return 2;
  else
    return 1;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
