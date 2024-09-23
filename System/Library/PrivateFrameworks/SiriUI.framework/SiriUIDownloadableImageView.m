@implementation SiriUIDownloadableImageView

- (SiriUIDownloadableImageView)initWithImageURL:(id)a3 placeHolderImageName:(id)a4 placeHolderImageBundle:(id)a5
{
  id v8;
  id v9;
  id v10;
  SiriUIDownloadableImageView *v11;
  SiriUIDownloadableImageView *v12;
  UIImageView *v13;
  UIImageView *imageView;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SiriUIDownloadableImageView;
  v11 = -[SiriUIDownloadableImageView initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_placeHolderImageName, a4);
    objc_storeStrong((id *)&v12->_placeHolderImageBundle, a5);
    v12->_placeHolderVerticalOffset = 0.0;
    v13 = (UIImageView *)objc_alloc_init(MEMORY[0x24BDF6AE8]);
    imageView = v12->_imageView;
    v12->_imageView = v13;

    -[SiriUIDownloadableImageView addSubview:](v12, "addSubview:", v12->_imageView);
    -[SiriUIDownloadableImageView showPlaceHolderImage](v12, "showPlaceHolderImage");
    -[SiriUIDownloadableImageView setImageURL:](v12, "setImageURL:", v8);
  }

  return v12;
}

- (void)setPlaceHolderImageName:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_placeHolderImageName, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_placeHolderImageName, a3);
    if (self->_showingPlaceHolderImage)
      -[SiriUIDownloadableImageView showPlaceHolderImage](self, "showPlaceHolderImage");
  }

}

- (void)setPlaceHolderVerticalOffset:(double)a3
{
  if (self->_placeHolderVerticalOffset != a3)
  {
    self->_placeHolderVerticalOffset = a3;
    -[SiriUIDownloadableImageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)showPlaceHolderImage
{
  NSString *placeHolderImageName;
  void *v4;
  void *v5;
  id v6;

  placeHolderImageName = self->_placeHolderImageName;
  if (placeHolderImageName)
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", placeHolderImageName, self->_placeHolderImageBundle);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "siriui_maskingColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_flatImageWithColor:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUIDownloadableImageView _setImage:isPlaceHolder:](self, "_setImage:isPlaceHolder:", v5, 1);

  }
}

- (void)setImageURL:(id)a3
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v5 = a3;
  if ((-[NSURL isEqual:](self->_imageURL, "isEqual:", v5) & 1) == 0)
  {
    +[SiriUIURLSession sharedURLSession](SiriUIURLSession, "sharedURLSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __43__SiriUIDownloadableImageView_setImageURL___block_invoke;
    v8[3] = &unk_24D7D96D8;
    v8[4] = self;
    v7 = (id)objc_msgSend(v6, "imageTaskWithHTTPGetRequest:client:completionHandler:", v5, self, v8);

    objc_storeStrong((id *)&self->_imageURL, a3);
  }

}

uint64_t __43__SiriUIDownloadableImageView_setImageURL___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_setImage:isPlaceHolder:", a2, 0);
  return result;
}

- (void)_setImage:(id)a3 isPlaceHolder:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  SiriUIDownloadableImageView *v13;
  id v14;

  v4 = a4;
  v6 = a3;
  self->_showingPlaceHolderImage = v4;
  if (v6)
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriUIDownloadableImageView setBackgroundColor:](self, "setBackgroundColor:", v7);

      -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 4);
      -[UIImageView setImage:](self->_imageView, "setImage:", v6);
    }
    else
    {
      -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 2);
      -[UIImageView setClipsToBounds:](self->_imageView, "setClipsToBounds:", 1);
      v8 = (void *)MEMORY[0x24BDF6F90];
      v9 = MEMORY[0x24BDAC760];
      v10 = 3221225472;
      v11 = __55__SiriUIDownloadableImageView__setImage_isPlaceHolder___block_invoke;
      v12 = &unk_24D7D9518;
      v13 = self;
      v14 = v6;
      objc_msgSend(v8, "transitionWithView:duration:options:animations:completion:", self, 5242882, &v9, 0, 0.2);

    }
    -[SiriUIDownloadableImageView bringSubviewToFront:](self, "bringSubviewToFront:", self->_imageView, v9, v10, v11, v12, v13);
    -[SiriUIDownloadableImageView setNeedsLayout](self, "setNeedsLayout");
  }

}

uint64_t __55__SiriUIDownloadableImageView__setImage_isPlaceHolder___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setImage:", *(_QWORD *)(a1 + 40));
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
  UIImageView *imageView;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SiriUIDownloadableImageView;
  -[SiriUIDownloadableImageView layoutSubviews](&v16, sel_layoutSubviews);
  -[SiriUIDownloadableImageView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  imageView = self->_imageView;
  if (self->_showingPlaceHolderImage)
  {
    -[UIImageView sizeToFit](imageView, "sizeToFit");
    -[UIImageView frame](self->_imageView, "frame");
    UIRectCenteredIntegralRect();
    v4 = v12;
    v8 = v13;
    v10 = v14;
    v6 = v15 - self->_placeHolderVerticalOffset;
    imageView = self->_imageView;
  }
  -[UIImageView setFrame:](imageView, "setFrame:", v4, v6, v8, v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeHolderImageBundle, 0);
  objc_storeStrong((id *)&self->_placeHolderImageName, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
