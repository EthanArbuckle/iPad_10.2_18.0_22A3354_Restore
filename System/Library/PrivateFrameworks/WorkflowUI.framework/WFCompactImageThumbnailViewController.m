@implementation WFCompactImageThumbnailViewController

- (WFCompactImageThumbnailViewController)initWithAspectRatio:(double)a3 imageGenerator:(id)a4
{
  id v7;
  WFCompactImageThumbnailViewController *v8;
  WFCompactImageThumbnailViewController *v9;
  uint64_t v10;
  id imageGenerator;
  WFCompactImageThumbnailViewController *v12;
  void *v14;
  objc_super v15;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCompactImageThumbnailViewController.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imageGenerator"));

  }
  v15.receiver = self;
  v15.super_class = (Class)WFCompactImageThumbnailViewController;
  v8 = -[WFCompactImageThumbnailViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    v8->_aspectRatio = a3;
    v10 = objc_msgSend(v7, "copy");
    imageGenerator = v9->_imageGenerator;
    v9->_imageGenerator = (id)v10;

    v12 = v9;
  }

  return v9;
}

- (void)loadView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double x;
  double y;
  double width;
  double height;
  id v12;
  void *v13;
  objc_super v14;
  CGRect v15;
  CGRect v16;

  v14.receiver = self;
  v14.super_class = (Class)WFCompactImageThumbnailViewController;
  -[WFCompactImageThumbnailViewController loadView](&v14, sel_loadView);
  -[WFCompactImageThumbnailViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  v6 = v5;

  -[WFCompactImageThumbnailViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v16 = CGRectInset(v15, -1.0 / v6, -1.0 / v6);
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;

  v12 = objc_alloc_init(MEMORY[0x24BEBD668]);
  objc_msgSend(v12, "setContentMode:", 1);
  objc_msgSend(v12, "setFrame:", x, y, width, height);
  objc_msgSend(v12, "setAutoresizingMask:", 18);
  -[WFCompactImageThumbnailViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v12);

  -[WFCompactImageThumbnailViewController setImageView:](self, "setImageView:", v12);
}

- (double)contentHeightForWidth:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[WFCompactImageThumbnailViewController aspectRatio](self, "aspectRatio");
  v5 = 0.0;
  if (v6 > 0.0)
  {
    -[WFCompactImageThumbnailViewController aspectRatio](self, "aspectRatio");
    v5 = 1.0 / v7;
  }
  return v5 * a3;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFCompactImageThumbnailViewController;
  -[WFCompactImageThumbnailViewController viewDidLayoutSubviews](&v7, sel_viewDidLayoutSubviews);
  -[WFCompactImageThumbnailViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[WFCompactImageThumbnailViewController lastViewWidth](self, "lastViewWidth");
  if (vabdd_f64(v5, v6) >= 2.22044605e-16)
  {
    -[WFCompactImageThumbnailViewController setLastViewWidth:](self, "setLastViewWidth:", v5);
    -[WFCompactImageThumbnailViewController redrawImage](self, "redrawImage");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFCompactImageThumbnailViewController;
  v4 = a3;
  -[WFCompactImageThumbnailViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "displayScale", v10.receiver, v10.super_class);
  v6 = v5;

  -[WFCompactImageThumbnailViewController traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  v9 = v8;

  if (v6 != v9)
    -[WFCompactImageThumbnailViewController redrawImage](self, "redrawImage");
}

- (void)redrawImage
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void (**v12)(_QWORD, _QWORD, double, double);
  _QWORD v13[6];

  -[WFCompactImageThumbnailViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = v4;

  -[WFCompactImageThumbnailViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;

  -[WFCompactImageThumbnailViewController aspectRatio](self, "aspectRatio");
  v10 = v5 * v8;
  v11 = v5 * (v8 / v9);
  -[WFCompactImageThumbnailViewController imageGenerator](self, "imageGenerator");
  v12 = (void (**)(_QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __52__WFCompactImageThumbnailViewController_redrawImage__block_invoke;
  v13[3] = &unk_24E604920;
  v13[4] = self;
  *(double *)&v13[5] = v8;
  ((void (**)(_QWORD, _QWORD *, double, double))v12)[2](v12, v13, v10, v11);

}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (id)imageGenerator
{
  return self->_imageGenerator;
}

- (UIImageView)imageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_imageView);
}

- (void)setImageView:(id)a3
{
  objc_storeWeak((id *)&self->_imageView, a3);
}

- (double)lastViewWidth
{
  return self->_lastViewWidth;
}

- (void)setLastViewWidth:(double)a3
{
  self->_lastViewWidth = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_imageView);
  objc_storeStrong(&self->_imageGenerator, 0);
}

void __52__WFCompactImageThumbnailViewController_redrawImage__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[5];
  id v7;
  uint64_t v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__WFCompactImageThumbnailViewController_redrawImage__block_invoke_2;
  block[3] = &unk_24E6048F8;
  v4 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  block[4] = v4;
  v7 = v3;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __52__WFCompactImageThumbnailViewController_redrawImage__block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v5 = *(double *)(a1 + 48);

  if (v4 == v5)
  {
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v6);

    objc_msgSend(*(id *)(a1 + 32), "imageView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startAnimating");

  }
}

@end
