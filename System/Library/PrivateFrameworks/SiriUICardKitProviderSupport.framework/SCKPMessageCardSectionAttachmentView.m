@implementation SCKPMessageCardSectionAttachmentView

- (SCKPMessageCardSectionAttachmentView)initWithAttachment:(id)a3
{
  id v4;
  SCKPMessageCardSectionAttachmentView *v5;
  SCKPMessageCardSectionAttachmentView *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCKPMessageCardSectionAttachmentView;
  v5 = -[SCKPMessageCardSectionAttachmentView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v6 = v5;
  if (v5)
  {
    -[SCKPMessageCardSectionAttachmentView _loadAttachment:](v5, "_loadAttachment:", v4);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v6, sel__handleTap_);
    -[SCKPMessageCardSectionAttachmentView addGestureRecognizer:](v6, "addGestureRecognizer:", v7);

  }
  return v6;
}

- (void)_loadAttachment:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "url");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isFileURL"))
  {
    v5 = objc_msgSend(v4, "type");

    -[SCKPMessageCardSectionAttachmentView _loadAttachmentFromFileURL:type:](self, "_loadAttachmentFromFileURL:type:", v7, v5);
  }
  else
  {
    objc_msgSend(v4, "linkMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[SCKPMessageCardSectionAttachmentView _loadLinkWith:metadata:](self, "_loadLinkWith:metadata:", v7, v6);
  }

}

- (void)_loadAttachmentFromFileURL:(id)a3 type:(int)a4
{
  UIView *v6;
  UIView *imageContainer;
  UIImageView *v8;
  UIImageView *imageView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIImageView *v17;
  UIImageView *livePhotoBadge;
  SCKPGradientView *v19;
  SCKPGradientView *v20;
  SCKPGradientView *gradientView;
  UILabel *v22;
  UILabel *videoDurationLabel;
  UILabel *v24;
  void *v25;
  UILabel *v26;
  void *v27;
  UILabel *v28;
  void *v29;
  id v30;

  v30 = a3;
  v6 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
  imageContainer = self->_imageContainer;
  self->_imageContainer = v6;

  v8 = (UIImageView *)objc_alloc_init(MEMORY[0x24BDF6AE8]);
  imageView = self->_imageView;
  self->_imageView = v8;

  -[UIView addSubview:](self->_imageContainer, "addSubview:", self->_imageView);
  -[SCKPMessageCardSectionAttachmentView addSubview:](self, "addSubview:", self->_imageContainer);
  v10 = (void *)MEMORY[0x24BDF8238];
  objc_msgSend(v30, "pathExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "typeWithFilenameExtension:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "conformsToType:", *MEMORY[0x24BDF8410]))
  {
    v13 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(v30, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageWithContentsOfFile:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIImageView setImage:](self->_imageView, "setImage:", v15);
    -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 1);
    if (a4 == 2)
    {
      objc_msgSend(MEMORY[0x24BDE3B80], "livePhotoBadgeImageWithOptions:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v16);
      livePhotoBadge = self->_livePhotoBadge;
      self->_livePhotoBadge = v17;

      -[UIImageView setUserInteractionEnabled:](self->_livePhotoBadge, "setUserInteractionEnabled:", 0);
      -[UIView addSubview:](self->_imageContainer, "addSubview:", self->_livePhotoBadge);

    }
  }
  else if (objc_msgSend(v12, "conformsToType:", *MEMORY[0x24BDF84B8]))
  {
    -[SCKPMessageCardSectionAttachmentView _thumbnailImageForVideoURL:](self, "_thumbnailImageForVideoURL:", v30);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = [SCKPGradientView alloc];
    v20 = -[SCKPGradientView initWithGradientType:](v19, "initWithGradientType:", *MEMORY[0x24BDE5C48]);
    gradientView = self->_gradientView;
    self->_gradientView = v20;

    -[UIView addSubview:](self->_imageContainer, "addSubview:", self->_gradientView);
    -[SCKPGradientView setGradientEndOpacity:](self->_gradientView, "setGradientEndOpacity:", 0.0);
    -[SCKPGradientView setGradientStartOpacity:](self->_gradientView, "setGradientStartOpacity:", 0.75);
    v22 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    videoDurationLabel = self->_videoDurationLabel;
    self->_videoDurationLabel = v22;

    v24 = self->_videoDurationLabel;
    -[SCKPMessageCardSectionAttachmentView _videoDurationStringForVideoURL:](self, "_videoDurationStringForVideoURL:", v30);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v24, "setText:", v25);

    v26 = self->_videoDurationLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v26, "setBackgroundColor:", v27);

    v28 = self->_videoDurationLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v28, "setTextColor:", v29);

    -[UILabel setTextAlignment:](self->_videoDurationLabel, "setTextAlignment:", 2);
    -[UIView addSubview:](self->_imageContainer, "addSubview:", self->_videoDurationLabel);
  }
  else
  {
    v15 = 0;
  }
  -[UIView _setContinuousCornerRadius:](self->_imageContainer, "_setContinuousCornerRadius:", 16.0);
  -[UIView setClipsSubviews:](self->_imageContainer, "setClipsSubviews:", 1);
  -[UIImageView setImage:](self->_imageView, "setImage:", v15);
  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 1);
  -[UIImageView setUserInteractionEnabled:](self->_imageView, "setUserInteractionEnabled:", 0);
  -[UIView setUserInteractionEnabled:](self->_imageContainer, "setUserInteractionEnabled:", 0);

}

- (void)_loadLinkWith:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  id v18;
  id location;
  id v20;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    if (!v6)
    {
      v10 = 0;
      goto LABEL_11;
    }
    v8 = objc_alloc_init(MEMORY[0x24BDDA8C0]);
    objc_msgSend(v8, "setTimeout:", 5.0);
    v10 = objc_alloc_init(MEMORY[0x24BDDA8B8]);
    v12 = objc_alloc_init(MEMORY[0x24BDDA8B0]);
    objc_msgSend(v12, "setURL:", v6);
    objc_msgSend(v10, "_setMetadata:isFinal:", v12, 0);
    objc_initWeak(&location, self);
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __63__SCKPMessageCardSectionAttachmentView__loadLinkWith_metadata___block_invoke;
    v16 = &unk_24E048F00;
    objc_copyWeak(&v18, &location);
    v17 = v6;
    objc_msgSend(v8, "startFetchingMetadataForURL:completionHandler:", v17, &v13);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

LABEL_9:
LABEL_11:
    objc_msgSend(v10, "setDelegate:", self, v13, v14, v15, v16);
    objc_msgSend(v10, "_setDisableAutoPlay:", 1);
    objc_msgSend(v10, "_setDisablePlayback:", 1);
    objc_msgSend(v10, "_setDisablePlaybackControls:", 1);
    objc_msgSend(v10, "_setDisablePreviewGesture:", 1);
    objc_msgSend(v10, "setUserInteractionEnabled:", 0);
    -[SCKPMessageCardSectionAttachmentView setLinkView:](self, "setLinkView:", v10);
    -[SCKPMessageCardSectionAttachmentView addSubview:](self, "addSubview:", v10);
    goto LABEL_12;
  }
  v20 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v20);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v20;
  if (!v9)
  {
    -[SCKPMessageCardSectionAttachmentView setFullMetadata:](self, "setFullMetadata:", v8);
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDDA8B8]), "initWithMetadata:", v8);
    objc_msgSend(v10, "_setDisableAnimations:", 1);
    goto LABEL_9;
  }
  v10 = v9;
  v11 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    -[SCKPMessageCardSectionAttachmentView _loadLinkWith:metadata:].cold.1(v11, v10);

LABEL_12:
}

void __63__SCKPMessageCardSectionAttachmentView__loadLinkWith_metadata___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__SCKPMessageCardSectionAttachmentView__loadLinkWith_metadata___block_invoke_2;
  v9[3] = &unk_24E048ED8;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 32);
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

  objc_destroyWeak(&v13);
}

void __63__SCKPMessageCardSectionAttachmentView__loadLinkWith_metadata___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;
  BOOL v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = *(id *)(a1 + 32);
    v4 = v3;
    if (*(_QWORD *)(a1 + 40))
      v5 = v3 == 0;
    else
      v5 = 0;
    if (v5)
    {
      v6 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
        __63__SCKPMessageCardSectionAttachmentView__loadLinkWith_metadata___block_invoke_2_cold_1((uint64_t *)(a1 + 40), v6, v7);
      v4 = objc_alloc_init(MEMORY[0x24BDDA8B0]);
      objc_msgSend(v4, "setURL:", *(_QWORD *)(a1 + 48));
    }
    v8 = (void *)*((_QWORD *)WeakRetained + 55);
    *((_QWORD *)WeakRetained + 55) = v4;
    v9 = v4;

    objc_msgSend(*((id *)WeakRetained + 56), "_setMetadata:isFinal:", v9, 1);
  }

}

- (id)_thumbnailImageForVideoURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  CGImage *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v11;
  CMTime v12;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB26C8]), "initWithURL:options:", v3, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB23B0]), "initWithAsset:", v4);
  objc_msgSend(v5, "setAppliesPreferredTrackTransform:", 1);
  CMTimeMake(&v12, 0, 1);
  v11 = 0;
  v6 = (CGImage *)objc_msgSend(v5, "copyCGImageAtTime:actualTime:error:", &v12, 0, &v11);
  v7 = v11;
  if (v7)
  {
    v8 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
      -[SCKPMessageCardSectionAttachmentView _thumbnailImageForVideoURL:].cold.1((uint64_t)v7, (uint64_t)v3, v8);
    v9 = 0;
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithCGImage:", v6);
  }
  CGImageRelease(v6);

  return v9;
}

- (id)_videoDurationStringForVideoURL:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v9;
  uint64_t v10;

  v3 = (objc_class *)MEMORY[0x24BDB26C8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithURL:options:", v4, 0);

  objc_msgSend(v5, "duration");
  v6 = v10;
  objc_msgSend(v5, "duration");
  objc_msgSend(MEMORY[0x24BDF6BC8], "timeStringForSeconds:forceFullWidthComponents:isElapsed:", v6 / v9, 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_handleTap:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SCKPMessageCardSectionAttachmentView _handleTap:]";
    _os_log_impl(&dword_21C485000, v4, OS_LOG_TYPE_DEFAULT, "%s #messages: Tap on attachment - punching out", (uint8_t *)&v6, 0xCu);
  }
  -[SCKPMessageCardSectionAttachmentView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userDidTapAttachmentView:", self);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v4;
  double v5;
  double v6;
  NSObject *v7;
  double v8;
  double v9;
  CGSize result;

  if (self->_linkView)
  {
    if (self->_fullMetadata)
    {
      width = 275.0;
      -[LPLinkView sizeThatFits:](self->_linkView, "sizeThatFits:", 275.0, 200.0);
      v5 = fmin(v4, 200.0);
    }
    else
    {
      v5 = 200.0;
      width = 275.0;
    }
  }
  else if (self->_imageView)
  {
    width = a3.width;
    v5 = 200.0;
    -[SCKPMessageCardSectionAttachmentView _translateImageSizeForMaxSize:](self, "_translateImageSizeForMaxSize:", a3.width, 200.0);
    if (v6 <= width)
      width = v6;
  }
  else
  {
    v7 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[SCKPMessageCardSectionAttachmentView sizeThatFits:].cold.1(v7);
    width = *MEMORY[0x24BDBF148];
    v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  v8 = width;
  v9 = v5;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  LPLinkView *linkView;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIImageView *imageView;
  UILabel *videoDurationLabel;
  double v17;
  double v18;
  double v19;
  SCKPGradientView *gradientView;
  double v21;
  double v22;
  double v23;

  -[SCKPMessageCardSectionAttachmentView bounds](self, "bounds");
  v4 = v3;
  -[SCKPMessageCardSectionAttachmentView bounds](self, "bounds");
  v6 = v5;
  linkView = self->_linkView;
  if (linkView)
  {
    -[LPLinkView sizeThatFits:](linkView, "sizeThatFits:", v4, v5);
    v10 = v9;
    v11 = v4 - v9;
    if (!self->_alignmentStyle)
      v11 = 0.0;
    -[LPLinkView setFrame:](self->_linkView, "setFrame:", v11, v6 - v8, v10);
  }
  if (self->_imageView)
  {
    -[UIView setFrame:](self->_imageContainer, "setFrame:", 0.0, 0.0, v4, v6);
    -[SCKPMessageCardSectionAttachmentView _translateImageSizeForMaxSize:](self, "_translateImageSizeForMaxSize:", v4, v6);
    if (v12 <= v4)
    {
      imageView = self->_imageView;
      v14 = 0.0;
      v13 = v4;
    }
    else
    {
      v13 = v12;
      v14 = -(v12 * 0.5 - v4 * 0.5);
      imageView = self->_imageView;
    }
    -[UIImageView setFrame:](imageView, "setFrame:", v14, 0.0, v13, v6);
    -[UIImageView setFrame:](self->_livePhotoBadge, "setFrame:", 0.0, 0.0, 30.0, 30.0);
  }
  videoDurationLabel = self->_videoDurationLabel;
  if (videoDurationLabel)
  {
    -[UILabel sizeThatFits:](videoDurationLabel, "sizeThatFits:", v4, v6);
    v18 = v17;
    -[UILabel setFrame:](self->_videoDurationLabel, "setFrame:", v4 - v19 + -10.0, v6 - v17 + -10.0, v19, v17);
    gradientView = self->_gradientView;
    -[UIView size](self->_imageContainer, "size");
    v22 = v21;
    -[UIView size](self->_imageContainer, "size");
    -[SCKPGradientView setFrame:](gradientView, "setFrame:", 0.0, 0.0, v22, v23);
    -[SCKPGradientView setGradientHeight:](self->_gradientView, "setGradientHeight:", v18 + 10.0 + 10.0);
    -[SCKPGradientView setVisible:animated:](self->_gradientView, "setVisible:animated:", 1, 0);
  }
}

- (CGSize)_translateImageSizeForMaxSize:(CGSize)a3
{
  double height;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  -[UIImageView image](self->_imageView, "image", a3.width);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v6;

  -[UIImageView image](self->_imageView, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v10 = v9;

  v11 = 0.0;
  if (v10 > 0.0 && v7 > 0.0)
    v11 = v7 / v10;
  v13 = height * v11;
  v14 = height;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_linkViewMetadataDidBecomeComplete:(id)a3
{
  objc_msgSend(a3, "_setPreferredSizeClass:", 3);
  -[SCKPMessageCardSectionAttachmentView setNeedsLayout](self, "setNeedsLayout");
  -[SCKPMessageCardSectionAttachmentView layoutIfNeeded](self, "layoutIfNeeded");
}

- (unint64_t)alignmentStyle
{
  return self->_alignmentStyle;
}

- (void)setAlignmentStyle:(unint64_t)a3
{
  self->_alignmentStyle = a3;
}

- (SCKPMessageCardSectionAttachmentViewDelegate)delegate
{
  return (SCKPMessageCardSectionAttachmentViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SCKPGradientView)gradientView
{
  return (SCKPGradientView *)objc_getProperty(self, a2, 432, 1);
}

- (void)setGradientView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (LPLinkMetadata)fullMetadata
{
  return (LPLinkMetadata *)objc_getProperty(self, a2, 440, 1);
}

- (void)setFullMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (LPLinkView)linkView
{
  return (LPLinkView *)objc_getProperty(self, a2, 448, 1);
}

- (void)setLinkView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (UIImageView)imageView
{
  return (UIImageView *)objc_getProperty(self, a2, 456, 1);
}

- (void)setImageView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 456);
}

- (UIImageView)livePhotoBadge
{
  return (UIImageView *)objc_getProperty(self, a2, 464, 1);
}

- (void)setLivePhotoBadge:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 464);
}

- (UILabel)videoDurationLabel
{
  return (UILabel *)objc_getProperty(self, a2, 472, 1);
}

- (void)setVideoDurationLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 472);
}

- (UIView)imageContainer
{
  return (UIView *)objc_getProperty(self, a2, 480, 1);
}

- (void)setImageContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 480);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageContainer, 0);
  objc_storeStrong((id *)&self->_videoDurationLabel, 0);
  objc_storeStrong((id *)&self->_livePhotoBadge, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_linkView, 0);
  objc_storeStrong((id *)&self->_fullMetadata, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_loadLinkWith:(void *)a1 metadata:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 136315394;
  v7 = "-[SCKPMessageCardSectionAttachmentView _loadLinkWith:metadata:]";
  v8 = 2112;
  v9 = v4;
  OUTLINED_FUNCTION_0(&dword_21C485000, v3, v5, "%s #messages: error converting metadata to LPLinkMetadata:%@", (uint8_t *)&v6);

}

void __63__SCKPMessageCardSectionAttachmentView__loadLinkWith_metadata___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 136315394;
  v5 = "-[SCKPMessageCardSectionAttachmentView _loadLinkWith:metadata:]_block_invoke_2";
  v6 = 2112;
  v7 = v3;
  OUTLINED_FUNCTION_0(&dword_21C485000, a2, a3, "%s #messages Metadata fetch failed with error: %@ creating new metadata", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

- (void)_thumbnailImageForVideoURL:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_0(&dword_21C485000, a3, (uint64_t)a3, "error: %@ creating thumbnail from movie url: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)sizeThatFits:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[SCKPMessageCardSectionAttachmentView sizeThatFits:]";
  _os_log_error_impl(&dword_21C485000, log, OS_LOG_TYPE_ERROR, "%s Calling size that fits before setting a valid URL", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
