@implementation PKDiscoveryInlineImageMediaShelfView

- (PKDiscoveryInlineImageMediaShelfView)initWithShelf:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  PKDiscoveryInlineImageMediaShelfView *v7;
  objc_super v9;

  v4 = (objc_class *)MEMORY[0x1E0DC3890];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithImage:", 0);
  v9.receiver = self;
  v9.super_class = (Class)PKDiscoveryInlineImageMediaShelfView;
  v7 = -[PKDiscoveryInlineCaptionedMediaShelfView initWithShelf:mediaView:](&v9, sel_initWithShelf_mediaView_, v5, v6);

  if (v7)
  {
    if (-[PKDiscoveryMedia type](v7->super._media, "type") == 3)
    {
      -[PKDiscoveryInlineImageMediaShelfView _loadImageFromBundle](v7, "_loadImageFromBundle");
    }
    else if (-[PKDiscoveryMedia type](v7->super._media, "type") == 4)
    {
      -[PKDiscoveryInlineImageMediaShelfView _loadImageFromFileURL](v7, "_loadImageFromFileURL");
    }
  }

  return v7;
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    v7 = (void *)MEMORY[0x1E0DC3F10];
    -[PKDiscoveryInlineImageMediaShelfView imageMediaView](self, "imageMediaView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__PKDiscoveryInlineImageMediaShelfView_setImage_animated___block_invoke;
    v10[3] = &unk_1E3E61388;
    v10[4] = self;
    v11 = v6;
    objc_msgSend(v7, "transitionWithView:duration:options:animations:completion:", v8, 5242880, v10, 0, 0.300000012);

  }
  else
  {
    -[PKDiscoveryInlineImageMediaShelfView imageMediaView](self, "imageMediaView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v6);

  }
}

void __58__PKDiscoveryInlineImageMediaShelfView_setImage_animated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "imageMediaView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", *(_QWORD *)(a1 + 40));

}

- (void)_loadImageFromBundle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PKDiscoveryMedia passKitUIImageName](self->super._media, "passKitUIImageName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    PKUIImageNamed(v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[PKDiscoveryInlineImageMediaShelfView imageMediaView](self, "imageMediaView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v6);

}

- (void)_loadImageFromFileURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PKDiscoveryMedia localAssetURL](self->super._media, "localAssetURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v3, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageWithContentsOfFile:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  -[PKDiscoveryInlineImageMediaShelfView imageMediaView](self, "imageMediaView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v8);

}

- (id)imageMediaView
{
  return self->super._mediaView;
}

@end
