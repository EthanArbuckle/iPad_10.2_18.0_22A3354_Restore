@implementation VKCImageDataDetectorViewHighlightButton

- (VKCImageDataDetectorViewHighlightButton)initWithFrame:(CGRect)a3
{
  VKCImageDataDetectorViewHighlightButton *v3;
  UIImageView *v4;
  UIImageView *imageView;
  void *v6;
  UIImageView *v7;
  UIImageView *blurImageView;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VKCImageDataDetectorViewHighlightButton;
  v3 = -[VKCImageDataDetectorViewHighlightButton initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    objc_msgSend(MEMORY[0x1E0CEA638], "vk_symbolImageWithName:", CFSTR("chevron.down.square.fill"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
    blurImageView = v3->_blurImageView;
    v3->_blurImageView = v7;

    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:scale:", 5, 2, 13.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithConfiguration:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA478], "lightGrayColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setVk_contentTintColor:](v3->_imageView, "setVk_contentTintColor:", v11);

    -[UIImageView setImage:](v3->_imageView, "setImage:", v10);
    -[VKCImageDataDetectorViewHighlightButton addSubview:](v3, "addSubview:", v3->_blurImageView);
    -[VKCImageDataDetectorViewHighlightButton addSubview:](v3, "addSubview:", v3->_imageView);

  }
  return v3;
}

- (void)setRotation:(double)a3
{
  void *v4;
  double v5;
  double v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGAffineTransform v16;
  CGAffineTransform v17;

  self->_rotation = a3;
  -[VKCImageDataDetectorViewHighlightButton layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anchorPoint");
  if (v6 != 0.5 || v5 != 0.5)
  {
    objc_msgSend(v4, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(v4, "setAnchorPoint:", 0.5, 0.5);
    objc_msgSend(v4, "setFrame:", v9, v11, v13, v15);
  }
  CGAffineTransformMakeRotation(&v17, a3);
  v16 = v17;
  objc_msgSend(v4, "setAffineTransform:", &v16);

}

- (void)setFrame:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)VKCImageDataDetectorViewHighlightButton;
  -[VKCImageDataDetectorViewHighlightButton setFrame:](&v30, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[VKCImageDataDetectorViewHighlightButton bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[VKCImageDataDetectorViewHighlightButton imageView](self, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13 = VKMCenterOfRect(v5, v7, v9, v11);
  v15 = v14;
  v16 = VKMMultiplyPointScalar(v9, v11, 0.5);
  v17 = VKMRectWithCenterAndSize(v13, v15, v16);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[VKCImageDataDetectorViewHighlightButton blurImageView](self, "blurImageView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

  -[VKCImageDataDetectorViewHighlightButton blurImageView](self, "blurImageView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "frame");
  -[UIView vk_renderImageFromViewBackingStoreWithSubrect:](self, "vk_renderImageFromViewBackingStoreWithSubrect:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "vk_scaledImageMaxDimension:scale:", 44.0, 1.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageDataDetectorViewHighlightButton blurImage:withRadius:](self, "blurImage:withRadius:", v27, 5.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageDataDetectorViewHighlightButton blurImageView](self, "blurImageView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setImage:", v28);

}

- (id)blurImage:(id)a3 withRadius:(double)a4
{
  objc_class *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
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
  void *v28;
  CGImage *v29;
  void *v30;

  v5 = (objc_class *)MEMORY[0x1E0C9DDC8];
  v6 = a3;
  v7 = [v5 alloc];
  v8 = objc_msgSend(v6, "vk_cgImage");

  v9 = (void *)objc_msgSend(v7, "initWithCGImage:options:", v8, 0);
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIGaussianBlur"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v11, CFSTR("inputRadius"));

  objc_msgSend(v10, "setValue:forKey:", v9, CFSTR("inputImage"));
  objc_msgSend(v10, "valueForKey:", CFSTR("outputImage"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "extent");
  v17 = VKMCenterOfRect(v13, v14, v15, v16);
  v19 = v18;
  objc_msgSend(v9, "extent");
  v21 = VKMRectWithCenterAndSize(v17, v19, v20);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  objc_msgSend(MEMORY[0x1E0C9DD90], "contextWithOptions:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (CGImage *)objc_msgSend(v28, "createCGImage:fromRect:", v12, v21, v23, v25, v27);
  objc_msgSend(MEMORY[0x1E0CEA638], "vk_imageWithCGImage:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v29);

  return v30;
}

- (double)rotation
{
  return self->_rotation;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIImageView)blurImageView
{
  return self->_blurImageView;
}

- (void)setBlurImageView:(id)a3
{
  objc_storeStrong((id *)&self->_blurImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurImageView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
