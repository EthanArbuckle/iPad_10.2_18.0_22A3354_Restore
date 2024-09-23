@implementation PKPaymentRemoteInstrumentThumbnailView

- (PKPaymentRemoteInstrumentThumbnailView)initWithRemotePaymentInstrument:(id)a3
{
  return -[PKPaymentRemoteInstrumentThumbnailView initWithRemotePaymentInstrument:thumbnailSize:](self, "initWithRemotePaymentInstrument:thumbnailSize:", a3, 51.0, 33.0);
}

- (PKPaymentRemoteInstrumentThumbnailView)initWithRemotePaymentInstrument:(id)a3 thumbnailSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  PKPaymentRemoteInstrumentThumbnailView *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  UIImageView *placeholderImageView;
  uint64_t v16;
  UIImageView *cardImageView;
  char v18;
  void *v19;
  const __CFString *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, CFTypeRef);
  void *v38;
  id v39[3];
  id location;
  objc_super v41;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v41.receiver = self;
  v41.super_class = (Class)PKPaymentRemoteInstrumentThumbnailView;
  v8 = -[PKPaymentRemoteInstrumentThumbnailView init](&v41, sel_init);
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x24BDF6AE8]);
    v10 = *MEMORY[0x24BDBF090];
    v11 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v12 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v13 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v14 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x24BDBF090], v11, v12, v13);
    placeholderImageView = v8->_placeholderImageView;
    v8->_placeholderImageView = (UIImageView *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", v10, v11, v12, v13);
    cardImageView = v8->_cardImageView;
    v8->_cardImageView = (UIImageView *)v16;

    v18 = 1;
    -[UIImageView setContentMode:](v8->_cardImageView, "setContentMode:", 1);
    objc_msgSend(v7, "primaryPaymentApplication");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    switch(objc_msgSend(v19, "paymentNetworkIdentifier"))
    {
      case 1:
        v18 = 0;
        v20 = CFSTR("AmericanExpressRemoteCard");
        break;
      case 2:
        v18 = 0;
        v20 = CFSTR("DiscoverRemoteCard");
        break;
      case 3:
        v18 = 0;
        v20 = CFSTR("MastercardRemoteCard");
        break;
      case 4:
      case 16:
      case 17:
        v18 = 0;
        v20 = CFSTR("VisaRemoteCard");
        break;
      case 11:
        v18 = 0;
        v20 = CFSTR("ChinaUnionPayRemoteCard");
        break;
      case 12:
        v18 = 0;
        v20 = CFSTR("EftposRemoteCard");
        break;
      case 13:
        v18 = 0;
        v20 = CFSTR("InteracRemoteCard");
        break;
      case 15:
        v18 = 0;
        v20 = CFSTR("MaestroRemoteCard");
        break;
      default:
        break;
    }
    PKScreenScale();
    v22 = (double)(uint64_t)llround(width * v21);
    v23 = (double)(uint64_t)llround(height * v21);
    v24 = (void *)MEMORY[0x24BE6EE78];
    objc_msgSend(v7, "manifestHash");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "hexEncoding");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "thumbnailCachePathForManifestHash:size:", v26, v22, v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithContentsOfFile:", v27);
    if (v28)
    {
      -[PKPaymentRemoteInstrumentThumbnailView cardImageView](v8, "cardImageView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setImage:", v28);
    }
    else
    {
      if ((v18 & 1) != 0)
      {
        v29 = 0;
      }
      else
      {
        v30 = (void *)MEMORY[0x24BDF6AC8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "imageNamed:inBundle:compatibleWithTraitCollection:", v20, v31, 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[PKPaymentRemoteInstrumentThumbnailView cardImageView](v8, "cardImageView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setImage:", v29);

    }
    objc_initWeak(&location, v8);
    objc_msgSend(MEMORY[0x24BE6EAA8], "sharedService");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = MEMORY[0x24BDAC760];
    v36 = 3221225472;
    v37 = __88__PKPaymentRemoteInstrumentThumbnailView_initWithRemotePaymentInstrument_thumbnailSize___block_invoke;
    v38 = &unk_24D0A14F0;
    objc_copyWeak(v39, &location);
    v39[1] = *(id *)&width;
    v39[2] = *(id *)&height;
    objc_msgSend(v33, "requestInstrumentThumbnail:forRemoteDevice:size:completion:", v7, 0, &v35, v22, v23);

    -[PKPaymentRemoteInstrumentThumbnailView addSubview:](v8, "addSubview:", v8->_cardImageView, v35, v36, v37, v38);
    -[PKPaymentRemoteInstrumentThumbnailView _prepareConstraints](v8, "_prepareConstraints");
    objc_destroyWeak(v39);
    objc_destroyWeak(&location);

  }
  return v8;
}

void __88__PKPaymentRemoteInstrumentThumbnailView_initWithRemotePaymentInstrument_thumbnailSize___block_invoke(uint64_t a1, CFTypeRef cf)
{
  _QWORD v4[4];
  id v5[2];
  __int128 v6;

  if (cf)
    CFRetain(cf);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __88__PKPaymentRemoteInstrumentThumbnailView_initWithRemotePaymentInstrument_thumbnailSize___block_invoke_2;
  v4[3] = &unk_24D0A14C8;
  objc_copyWeak(v5, (id *)(a1 + 32));
  v5[1] = (id)cf;
  v6 = *(_OWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], v4);
  objc_destroyWeak(v5);
}

void __88__PKPaymentRemoteInstrumentThumbnailView_initWithRemotePaymentInstrument_thumbnailSize___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  const void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateCardImage:size:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));

  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);
}

- (void)_prepareConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[PKPaymentRemoteInstrumentThumbnailView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PKPaymentRemoteInstrumentThumbnailView cardImageView](self, "cardImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = (void *)MEMORY[0x24BDD1628];
  -[PKPaymentRemoteInstrumentThumbnailView cardImageView](self, "cardImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 7, 0, self, 7, 1.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 1);

  v7 = (void *)MEMORY[0x24BDD1628];
  -[PKPaymentRemoteInstrumentThumbnailView cardImageView](self, "cardImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 8, 0, self, 8, 1.0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  v10 = (void *)MEMORY[0x24BDD1628];
  -[PKPaymentRemoteInstrumentThumbnailView cardImageView](self, "cardImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 9, 0, self, 9, 1.0, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  v13 = (void *)MEMORY[0x24BDD1628];
  -[PKPaymentRemoteInstrumentThumbnailView cardImageView](self, "cardImageView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 10, 0, self, 10, 1.0, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

}

- (void)_updateCardImage:(CGImage *)a3 size:(CGSize)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithCGImage:", a3);
  -[PKPaymentRemoteInstrumentThumbnailView cardImageView](self, "cardImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v6);

  -[PKPaymentRemoteInstrumentThumbnailView setNeedsLayout](self, "setNeedsLayout");
}

- (UIImageView)placeholderImageView
{
  return self->_placeholderImageView;
}

- (void)setPlaceholderImageView:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderImageView, a3);
}

- (UIImageView)cardImageView
{
  return self->_cardImageView;
}

- (void)setCardImageView:(id)a3
{
  objc_storeStrong((id *)&self->_cardImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardImageView, 0);
  objc_storeStrong((id *)&self->_placeholderImageView, 0);
}

@end
